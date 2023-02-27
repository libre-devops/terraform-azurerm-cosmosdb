## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.cosmos_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_metadata_writes_enabled"></a> [access\_key\_metadata\_writes\_enabled](#input\_access\_key\_metadata\_writes\_enabled) | Whether key metadata writes is enabled | `bool` | `false` | no |
| <a name="input_allowed_cidrs"></a> [allowed\_cidrs](#input\_allowed\_cidrs) | CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. | `list(string)` | `[]` | no |
| <a name="input_analytical_storage_enabled"></a> [analytical\_storage\_enabled](#input\_analytical\_storage\_enabled) | Enable Analytical Storage option for this Cosmos DB account. Defaults to `false`. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_analytical_storage_type"></a> [analytical\_storage\_type](#input\_analytical\_storage\_type) | The schema type of the Analytical Storage for this Cosmos DB account. Possible values are `FullFidelity` and `WellDefined`. | `string` | `null` | no |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | Configures the capabilities to enable for this Cosmos DB account:<br>Possible values are<br>  AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses,<br>  EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, EnableServerless,<br>  MongoDBv3.4 and mongoEnableDocLevelTTL. | `list(string)` | `[]` | no |
| <a name="input_consistency_policy_level"></a> [consistency\_policy\_level](#input\_consistency\_policy\_level) | Consistency policy level. Allowed values are `BoundedStaleness`, `Eventual`, `Session`, `Strong` or `ConsistentPrefix` | `string` | `"BoundedStaleness"` | no |
| <a name="input_consistency_policy_max_interval_in_seconds"></a> [consistency\_policy\_max\_interval\_in\_seconds](#input\_consistency\_policy\_max\_interval\_in\_seconds) | When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency\_level is set to BoundedStaleness. | `number` | `10` | no |
| <a name="input_consistency_policy_max_staleness_prefix"></a> [consistency\_policy\_max\_staleness\_prefix](#input\_consistency\_policy\_max\_staleness\_prefix) | When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency\_level is set to BoundedStaleness. | `number` | `200` | no |
| <a name="input_cosmos_keyvault_identity_type"></a> [cosmos\_keyvault\_identity\_type](#input\_cosmos\_keyvault\_identity\_type) | The type of managed identity that the CosmosDB will use to access a key vault, defaults to SystemAssignedIdentity | `string` | `"SystemAssignedIdentity"` | no |
| <a name="input_cosmosdb_account_properties"></a> [cosmosdb\_account\_properties](#input\_cosmosdb\_account\_properties) | The block for nested configuration of the configuration blocks of the module | `map(any)` | `{}` | no |
| <a name="input_cosmosdb_name"></a> [cosmosdb\_name](#input\_cosmosdb\_name) | The name for the cosmosdb account | `string` | n/a | yes |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | The createmode of the cosmosdb account | `string` | `"Default"` | no |
| <a name="input_enable_automatic_failover"></a> [enable\_automatic\_failover](#input\_enable\_automatic\_failover) | Whether automatic failover should be enabled | `bool` | `false` | no |
| <a name="input_enable_cmk_support"></a> [enable\_cmk\_support](#input\_enable\_cmk\_support) | Whether customer managed key encryption is enabled | `bool` | `false` | no |
| <a name="input_enable_free_tier"></a> [enable\_free\_tier](#input\_enable\_free\_tier) | Whether the free tier is enabled | `bool` | `false` | no |
| <a name="input_enable_multiple_write_locations"></a> [enable\_multiple\_write\_locations](#input\_enable\_multiple\_write\_locations) | Determines whether multiple write locations are enabled, defaults to false | `bool` | `false` | no |
| <a name="input_failover_locations"></a> [failover\_locations](#input\_failover\_locations) | The name of the Azure region to host replicated data and their priority. | `map(map(string))` | `null` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of user managed identity ids to be assigned to the VM. | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The Managed Service Identity Type of this Virtual Machine. | `string` | `""` | no |
| <a name="input_is_virtual_network_filter_enabled"></a> [is\_virtual\_network\_filter\_enabled](#input\_is\_virtual\_network\_filter\_enabled) | Enables virtual network filtering for this Cosmos DB account | `bool` | `false` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | If a key vault is enabled for CMK, its id | `string` | `null` | no |
| <a name="input_key_vault_url"></a> [key\_vault\_url](#input\_key\_vault\_url) | If customer CMK is enabled, the URL for the key vault | `string` | `null` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Specifies the Kind of CosmosDB to create - possible values are `GlobalDocumentDB` and `MongoDB`. | `string` | `"GlobalDocumentDB"` | no |
| <a name="input_local_auth_disabled"></a> [local\_auth\_disabled](#input\_local\_auth\_disabled) | Whether local auth is enabled, defaults to false | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location for this resource to be put in | `string` | n/a | yes |
| <a name="input_mongo_server_version"></a> [mongo\_server\_version](#input\_mongo\_server\_version) | The Server Version of a MongoDB account. See possible values https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account#mongo_server_version | `string` | `"4.2"` | no |
| <a name="input_network_acl_bypass_for_azure_services"></a> [network\_acl\_bypass\_for\_azure\_services](#input\_network\_acl\_bypass\_for\_azure\_services) | If azure services can bypass ACLs. | `bool` | `false` | no |
| <a name="input_network_acl_bypass_ids"></a> [network\_acl\_bypass\_ids](#input\_network\_acl\_bypass\_ids) | The list of resource Ids for Network Acl Bypass for this Cosmos DB account. | `list(string)` | `null` | no |
| <a name="input_offer_type"></a> [offer\_type](#input\_offer\_type) | Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard. | `string` | `"Standard"` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this CosmosDB account. | `bool` | `true` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |
| <a name="input_virtual_network_rule"></a> [virtual\_network\_rule](#input\_virtual\_network\_rule) | Specifies a virtual\_network\_rules resource used to define which subnets are allowed to access this CosmosDB account | <pre>list(object({<br>    id                                   = string,<br>    ignore_missing_vnet_service_endpoint = bool<br>  }))</pre> | `null` | no |
| <a name="input_zone_redundancy_enabled"></a> [zone\_redundancy\_enabled](#input\_zone\_redundancy\_enabled) | True to enabled zone redundancy on default primary location | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmosdb_account_connection_string"></a> [cosmosdb\_account\_connection\_string](#output\_cosmosdb\_account\_connection\_string) | The connection string of the cosmosdb account |
| <a name="output_cosmosdb_account_endpoint"></a> [cosmosdb\_account\_endpoint](#output\_cosmosdb\_account\_endpoint) | The endpoint of the cosmosdb |
| <a name="output_cosmosdb_account_id"></a> [cosmosdb\_account\_id](#output\_cosmosdb\_account\_id) | The name of the cosmosdb account |
| <a name="output_cosmosdb_account_identity"></a> [cosmosdb\_account\_identity](#output\_cosmosdb\_account\_identity) | The identity block of the cosmosdb |
| <a name="output_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#output\_cosmosdb\_account\_name) | The name of the cosmosdb account |
| <a name="output_cosmosdb_account_primary_key"></a> [cosmosdb\_account\_primary\_key](#output\_cosmosdb\_account\_primary\_key) | The primary key for cosmosdb account |
| <a name="output_cosmosdb_account_primary_readonly_key"></a> [cosmosdb\_account\_primary\_readonly\_key](#output\_cosmosdb\_account\_primary\_readonly\_key) | The primary readonly key for cosmosdb account |
| <a name="output_cosmosdb_account_read_endpoints"></a> [cosmosdb\_account\_read\_endpoints](#output\_cosmosdb\_account\_read\_endpoints) | The read endpoint of the cosmosdb |
| <a name="output_cosmosdb_account_secondary_key"></a> [cosmosdb\_account\_secondary\_key](#output\_cosmosdb\_account\_secondary\_key) | The secondary key for cosmosdb account |
| <a name="output_cosmosdb_account_secondary_readonly_key"></a> [cosmosdb\_account\_secondary\_readonly\_key](#output\_cosmosdb\_account\_secondary\_readonly\_key) | The secondary readonly key for cosmosdb account |
| <a name="output_cosmosdb_account_write_endpoints"></a> [cosmosdb\_account\_write\_endpoints](#output\_cosmosdb\_account\_write\_endpoints) | The write endpoint of the cosmosdb |
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.cosmos_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_metadata_writes_enabled"></a> [access\_key\_metadata\_writes\_enabled](#input\_access\_key\_metadata\_writes\_enabled) | Whether key metadata writes is enabled | `bool` | `false` | no |
| <a name="input_allowed_cidrs"></a> [allowed\_cidrs](#input\_allowed\_cidrs) | CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. | `list(string)` | `[]` | no |
| <a name="input_analytical_storage_enabled"></a> [analytical\_storage\_enabled](#input\_analytical\_storage\_enabled) | Enable Analytical Storage option for this Cosmos DB account. Defaults to `false`. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_analytical_storage_type"></a> [analytical\_storage\_type](#input\_analytical\_storage\_type) | The schema type of the Analytical Storage for this Cosmos DB account. Possible values are `FullFidelity` and `WellDefined`. | `string` | `null` | no |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | Configures the capabilities to enable for this Cosmos DB account:<br>Possible values are<br>  AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses,<br>  EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, EnableServerless,<br>  MongoDBv3.4 and mongoEnableDocLevelTTL. | `list(string)` | `[]` | no |
| <a name="input_consistency_policy_level"></a> [consistency\_policy\_level](#input\_consistency\_policy\_level) | Consistency policy level. Allowed values are `BoundedStaleness`, `Eventual`, `Session`, `Strong` or `ConsistentPrefix` | `string` | `"BoundedStaleness"` | no |
| <a name="input_consistency_policy_max_interval_in_seconds"></a> [consistency\_policy\_max\_interval\_in\_seconds](#input\_consistency\_policy\_max\_interval\_in\_seconds) | When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency\_level is set to BoundedStaleness. | `number` | `10` | no |
| <a name="input_consistency_policy_max_staleness_prefix"></a> [consistency\_policy\_max\_staleness\_prefix](#input\_consistency\_policy\_max\_staleness\_prefix) | When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency\_level is set to BoundedStaleness. | `number` | `200` | no |
| <a name="input_cosmos_keyvault_identity_type"></a> [cosmos\_keyvault\_identity\_type](#input\_cosmos\_keyvault\_identity\_type) | The type of managed identity that the CosmosDB will use to access a key vault, defaults to SystemAssignedIdentity | `string` | `"SystemAssignedIdentity"` | no |
| <a name="input_cosmosdb_account_properties"></a> [cosmosdb\_account\_properties](#input\_cosmosdb\_account\_properties) | The block for nested configuration of the configuration blocks of the module | `map(any)` | `{}` | no |
| <a name="input_cosmosdb_name"></a> [cosmosdb\_name](#input\_cosmosdb\_name) | The name for the cosmosdb account | `string` | n/a | yes |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | The createmode of the cosmosdb account | `string` | `"Default"` | no |
| <a name="input_enable_automatic_failover"></a> [enable\_automatic\_failover](#input\_enable\_automatic\_failover) | Whether automatic failover should be enabled | `bool` | `false` | no |
| <a name="input_enable_cmk_support"></a> [enable\_cmk\_support](#input\_enable\_cmk\_support) | Whether customer managed key encryption is enabled | `bool` | `false` | no |
| <a name="input_enable_free_tier"></a> [enable\_free\_tier](#input\_enable\_free\_tier) | Whether the free tier is enabled | `bool` | `false` | no |
| <a name="input_enable_multiple_write_locations"></a> [enable\_multiple\_write\_locations](#input\_enable\_multiple\_write\_locations) | Determines whether multiple write locations are enabled, defaults to false | `bool` | `false` | no |
| <a name="input_failover_locations"></a> [failover\_locations](#input\_failover\_locations) | The name of the Azure region to host replicated data and their priority. | `map(map(string))` | `null` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of user managed identity ids to be assigned to the VM. | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The Managed Service Identity Type of this Virtual Machine. | `string` | `""` | no |
| <a name="input_is_virtual_network_filter_enabled"></a> [is\_virtual\_network\_filter\_enabled](#input\_is\_virtual\_network\_filter\_enabled) | Enables virtual network filtering for this Cosmos DB account | `bool` | `false` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | If a key vault is enabled for CMK, its id | `string` | `null` | no |
| <a name="input_key_vault_url"></a> [key\_vault\_url](#input\_key\_vault\_url) | If customer CMK is enabled, the URL for the key vault | `string` | `null` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Specifies the Kind of CosmosDB to create - possible values are `GlobalDocumentDB` and `MongoDB`. | `string` | `"GlobalDocumentDB"` | no |
| <a name="input_local_auth_disabled"></a> [local\_auth\_disabled](#input\_local\_auth\_disabled) | Whether local auth is enabled, defaults to false | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location for this resource to be put in | `string` | n/a | yes |
| <a name="input_mongo_server_version"></a> [mongo\_server\_version](#input\_mongo\_server\_version) | The Server Version of a MongoDB account. See possible values https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account#mongo_server_version | `string` | `"4.2"` | no |
| <a name="input_network_acl_bypass_for_azure_services"></a> [network\_acl\_bypass\_for\_azure\_services](#input\_network\_acl\_bypass\_for\_azure\_services) | If azure services can bypass ACLs. | `bool` | `false` | no |
| <a name="input_network_acl_bypass_ids"></a> [network\_acl\_bypass\_ids](#input\_network\_acl\_bypass\_ids) | The list of resource Ids for Network Acl Bypass for this Cosmos DB account. | `list(string)` | `null` | no |
| <a name="input_offer_type"></a> [offer\_type](#input\_offer\_type) | Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard. | `string` | `"Standard"` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this CosmosDB account. | `bool` | `true` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |
| <a name="input_virtual_network_rule"></a> [virtual\_network\_rule](#input\_virtual\_network\_rule) | Specifies a virtual\_network\_rules resource used to define which subnets are allowed to access this CosmosDB account | <pre>list(object({<br>    id                                   = string,<br>    ignore_missing_vnet_service_endpoint = bool<br>  }))</pre> | `null` | no |
| <a name="input_zone_redundancy_enabled"></a> [zone\_redundancy\_enabled](#input\_zone\_redundancy\_enabled) | True to enabled zone redundancy on default primary location | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmosdb_account_connection_string"></a> [cosmosdb\_account\_connection\_string](#output\_cosmosdb\_account\_connection\_string) | The connection string of the cosmosdb account |
| <a name="output_cosmosdb_account_endpoint"></a> [cosmosdb\_account\_endpoint](#output\_cosmosdb\_account\_endpoint) | The endpoint of the cosmosdb |
| <a name="output_cosmosdb_account_id"></a> [cosmosdb\_account\_id](#output\_cosmosdb\_account\_id) | The name of the cosmosdb account |
| <a name="output_cosmosdb_account_identity"></a> [cosmosdb\_account\_identity](#output\_cosmosdb\_account\_identity) | The identity block of the cosmosdb |
| <a name="output_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#output\_cosmosdb\_account\_name) | The name of the cosmosdb account |
| <a name="output_cosmosdb_account_primary_key"></a> [cosmosdb\_account\_primary\_key](#output\_cosmosdb\_account\_primary\_key) | The primary key for cosmosdb account |
| <a name="output_cosmosdb_account_primary_readonly_key"></a> [cosmosdb\_account\_primary\_readonly\_key](#output\_cosmosdb\_account\_primary\_readonly\_key) | The primary readonly key for cosmosdb account |
| <a name="output_cosmosdb_account_read_endpoints"></a> [cosmosdb\_account\_read\_endpoints](#output\_cosmosdb\_account\_read\_endpoints) | The read endpoint of the cosmosdb |
| <a name="output_cosmosdb_account_secondary_key"></a> [cosmosdb\_account\_secondary\_key](#output\_cosmosdb\_account\_secondary\_key) | The secondary key for cosmosdb account |
| <a name="output_cosmosdb_account_secondary_readonly_key"></a> [cosmosdb\_account\_secondary\_readonly\_key](#output\_cosmosdb\_account\_secondary\_readonly\_key) | The secondary readonly key for cosmosdb account |
| <a name="output_cosmosdb_account_write_endpoints"></a> [cosmosdb\_account\_write\_endpoints](#output\_cosmosdb\_account\_write\_endpoints) | The write endpoint of the cosmosdb |
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.cosmos_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_metadata_writes_enabled"></a> [access\_key\_metadata\_writes\_enabled](#input\_access\_key\_metadata\_writes\_enabled) | Whether key metadata writes is enabled | `bool` | `false` | no |
| <a name="input_allowed_cidrs"></a> [allowed\_cidrs](#input\_allowed\_cidrs) | CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. | `list(string)` | `[]` | no |
| <a name="input_analytical_storage_enabled"></a> [analytical\_storage\_enabled](#input\_analytical\_storage\_enabled) | Enable Analytical Storage option for this Cosmos DB account. Defaults to `false`. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_analytical_storage_type"></a> [analytical\_storage\_type](#input\_analytical\_storage\_type) | The schema type of the Analytical Storage for this Cosmos DB account. Possible values are `FullFidelity` and `WellDefined`. | `string` | `null` | no |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | Configures the capabilities to enable for this Cosmos DB account:<br>Possible values are<br>  AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses,<br>  EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, EnableServerless,<br>  MongoDBv3.4 and mongoEnableDocLevelTTL. | `list(string)` | `[]` | no |
| <a name="input_consistency_policy_level"></a> [consistency\_policy\_level](#input\_consistency\_policy\_level) | Consistency policy level. Allowed values are `BoundedStaleness`, `Eventual`, `Session`, `Strong` or `ConsistentPrefix` | `string` | `"BoundedStaleness"` | no |
| <a name="input_consistency_policy_max_interval_in_seconds"></a> [consistency\_policy\_max\_interval\_in\_seconds](#input\_consistency\_policy\_max\_interval\_in\_seconds) | When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency\_level is set to BoundedStaleness. | `number` | `10` | no |
| <a name="input_consistency_policy_max_staleness_prefix"></a> [consistency\_policy\_max\_staleness\_prefix](#input\_consistency\_policy\_max\_staleness\_prefix) | When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency\_level is set to BoundedStaleness. | `number` | `200` | no |
| <a name="input_cosmos_keyvault_identity_type"></a> [cosmos\_keyvault\_identity\_type](#input\_cosmos\_keyvault\_identity\_type) | The type of managed identity that the CosmosDB will use to access a key vault, defaults to SystemAssignedIdentity | `string` | `"SystemAssignedIdentity"` | no |
| <a name="input_cosmosdb_account_properties"></a> [cosmosdb\_account\_properties](#input\_cosmosdb\_account\_properties) | The block for nested configuration of the configuration blocks of the module | `map(any)` | `{}` | no |
| <a name="input_cosmosdb_name"></a> [cosmosdb\_name](#input\_cosmosdb\_name) | The name for the cosmosdb account | `string` | n/a | yes |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | The createmode of the cosmosdb account | `string` | `"Default"` | no |
| <a name="input_enable_automatic_failover"></a> [enable\_automatic\_failover](#input\_enable\_automatic\_failover) | Whether automatic failover should be enabled | `bool` | `false` | no |
| <a name="input_enable_cmk_support"></a> [enable\_cmk\_support](#input\_enable\_cmk\_support) | Whether customer managed key encryption is enabled | `bool` | `false` | no |
| <a name="input_enable_free_tier"></a> [enable\_free\_tier](#input\_enable\_free\_tier) | Whether the free tier is enabled | `bool` | `false` | no |
| <a name="input_enable_multiple_write_locations"></a> [enable\_multiple\_write\_locations](#input\_enable\_multiple\_write\_locations) | Determines whether multiple write locations are enabled, defaults to false | `bool` | `false` | no |
| <a name="input_failover_locations"></a> [failover\_locations](#input\_failover\_locations) | The name of the Azure region to host replicated data and their priority. | `map(map(string))` | `null` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of user managed identity ids to be assigned to the VM. | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The Managed Service Identity Type of this Virtual Machine. | `string` | `""` | no |
| <a name="input_is_virtual_network_filter_enabled"></a> [is\_virtual\_network\_filter\_enabled](#input\_is\_virtual\_network\_filter\_enabled) | Enables virtual network filtering for this Cosmos DB account | `bool` | `false` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | If a key vault is enabled for CMK, its id | `string` | `null` | no |
| <a name="input_key_vault_url"></a> [key\_vault\_url](#input\_key\_vault\_url) | If customer CMK is enabled, the URL for the key vault | `string` | `null` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Specifies the Kind of CosmosDB to create - possible values are `GlobalDocumentDB` and `MongoDB`. | `string` | `"GlobalDocumentDB"` | no |
| <a name="input_local_auth_disabled"></a> [local\_auth\_disabled](#input\_local\_auth\_disabled) | Whether local auth is enabled, defaults to false | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location for this resource to be put in | `string` | n/a | yes |
| <a name="input_mongo_server_version"></a> [mongo\_server\_version](#input\_mongo\_server\_version) | The Server Version of a MongoDB account. See possible values https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account#mongo_server_version | `string` | `"4.2"` | no |
| <a name="input_network_acl_bypass_for_azure_services"></a> [network\_acl\_bypass\_for\_azure\_services](#input\_network\_acl\_bypass\_for\_azure\_services) | If azure services can bypass ACLs. | `bool` | `false` | no |
| <a name="input_network_acl_bypass_ids"></a> [network\_acl\_bypass\_ids](#input\_network\_acl\_bypass\_ids) | The list of resource Ids for Network Acl Bypass for this Cosmos DB account. | `list(string)` | `null` | no |
| <a name="input_offer_type"></a> [offer\_type](#input\_offer\_type) | Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard. | `string` | `"Standard"` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this CosmosDB account. | `bool` | `true` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |
| <a name="input_virtual_network_rule"></a> [virtual\_network\_rule](#input\_virtual\_network\_rule) | Specifies a virtual\_network\_rules resource used to define which subnets are allowed to access this CosmosDB account | <pre>list(object({<br>    id                                   = string,<br>    ignore_missing_vnet_service_endpoint = bool<br>  }))</pre> | `null` | no |
| <a name="input_zone_redundancy_enabled"></a> [zone\_redundancy\_enabled](#input\_zone\_redundancy\_enabled) | True to enabled zone redundancy on default primary location | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmosdb_account_connection_string"></a> [cosmosdb\_account\_connection\_string](#output\_cosmosdb\_account\_connection\_string) | The connection string of the cosmosdb account |
| <a name="output_cosmosdb_account_endpoint"></a> [cosmosdb\_account\_endpoint](#output\_cosmosdb\_account\_endpoint) | The endpoint of the cosmosdb |
| <a name="output_cosmosdb_account_id"></a> [cosmosdb\_account\_id](#output\_cosmosdb\_account\_id) | The name of the cosmosdb account |
| <a name="output_cosmosdb_account_identity"></a> [cosmosdb\_account\_identity](#output\_cosmosdb\_account\_identity) | The identity block of the cosmosdb |
| <a name="output_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#output\_cosmosdb\_account\_name) | The name of the cosmosdb account |
| <a name="output_cosmosdb_account_primary_key"></a> [cosmosdb\_account\_primary\_key](#output\_cosmosdb\_account\_primary\_key) | The primary key for cosmosdb account |
| <a name="output_cosmosdb_account_primary_readonly_key"></a> [cosmosdb\_account\_primary\_readonly\_key](#output\_cosmosdb\_account\_primary\_readonly\_key) | The primary readonly key for cosmosdb account |
| <a name="output_cosmosdb_account_read_endpoints"></a> [cosmosdb\_account\_read\_endpoints](#output\_cosmosdb\_account\_read\_endpoints) | The read endpoint of the cosmosdb |
| <a name="output_cosmosdb_account_secondary_key"></a> [cosmosdb\_account\_secondary\_key](#output\_cosmosdb\_account\_secondary\_key) | The secondary key for cosmosdb account |
| <a name="output_cosmosdb_account_secondary_readonly_key"></a> [cosmosdb\_account\_secondary\_readonly\_key](#output\_cosmosdb\_account\_secondary\_readonly\_key) | The secondary readonly key for cosmosdb account |
| <a name="output_cosmosdb_account_write_endpoints"></a> [cosmosdb\_account\_write\_endpoints](#output\_cosmosdb\_account\_write\_endpoints) | The write endpoint of the cosmosdb |
