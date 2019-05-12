/*
 * Copyright 2019 Ivo Woltring <WebMaster@ivonet.nl>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package nl.ivonet.provider;

import org.apache.guacamole.GuacamoleException;
import org.apache.guacamole.environment.Environment;
import org.apache.guacamole.environment.LocalEnvironment;
import org.apache.guacamole.net.auth.Credentials;
import org.apache.guacamole.net.auth.simple.SimpleAuthenticationProvider;
import org.apache.guacamole.properties.StringGuacamoleProperty;
import org.apache.guacamole.protocol.GuacamoleConfiguration;

import java.util.HashMap;
import java.util.Map;

/**
 * Don't want to log in on my docker image so created an auto login feature.
 *
 * https://guacamole.apache.org/doc/gug/custom-auth.html#custom-auth-installing
 * @author Ivo Woltring
 */
public class DockerAuthenticationProvider extends SimpleAuthenticationProvider {
    @Override
    public Map<String, GuacamoleConfiguration> getAuthorizedConfigurations(final Credentials credentials) throws GuacamoleException {

        final Environment environment = new LocalEnvironment();
        final StringGuacamoleProperty username = new StringGuacamoleProperty() {
            @Override
            public String getName() {
                return "user-name";
            }
        };
        credentials.setUsername(environment.getRequiredProperty(username));


        final Map<String, GuacamoleConfiguration> configs = new HashMap<>();
        final GuacamoleConfiguration config = new GuacamoleConfiguration();
        config.setConnectionID("vnc");
        config.setProtocol("vnc");
        config.setParameter("hostname", "localhost");
        config.setParameter("port", "5901");
        configs.put("vnc", config);
        return configs;
    }

    @Override
    public String getIdentifier() {
        return "IvoNet";
    }
}
