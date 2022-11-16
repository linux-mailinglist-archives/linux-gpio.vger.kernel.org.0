Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234E662B708
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 10:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiKPJ5k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 04:57:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbiKPJ5j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 04:57:39 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1EC1581B
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668592657; x=1700128657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/2lbP/bSqnsxPeiV5LlcWQ9765AEkdGu6qPGM4wE/ME=;
  b=W/9w96VkOcS4OgdeS2S7ASVySCYU0rMiFXohluHLsP8qIReyzlN3AXyJ
   Ig/tByx32x2kHyCNI0m2qZ0eEJjYnlBRfhnKodrz3r+Pj+qRhXGtKoaYl
   Rr3s5chXFyl1etmiqyudXzdAfGNkHz0/0S85DSvJL/jSYRKQFO3/oeXu+
   C4QWFq8bx2N2IQOkt484CfmjKshjan+FUOby2GVTiUAZd/CoTcHKAqFIo
   O7a/DUiHQFABN8ZN2OCBRwUySlcfh3xzSWRrmfJhWHubRFnSI0mZcuo3k
   EqkN89QGwGb54OSioKyud+OvbCubGGQ6z43+H037KFGd3FbbtlupsFOSD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="398789584"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="398789584"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 01:57:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="590131522"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="590131522"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 16 Nov 2022 01:57:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 31BB72F3; Wed, 16 Nov 2022 11:57:59 +0200 (EET)
Date:   Wed, 16 Nov 2022 11:57:59 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC v2 3/3] pinctrl: add support for ACPI pin function
 and config resources
Message-ID: <Y3S0JzH/gtY90ly+@black.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <20221115175415.650690-4-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221115175415.650690-4-niyas.sait@linaro.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 05:54:15PM +0000, Niyas Sait wrote:
> Add support for following ACPI pin resources
> 
> - PinFunction
> - PinConfig
> - PinGroupFunction
> - PinGroupConfig
> 
> Pinctrl-acpi parses the ACPI table and generates list of pin
> descriptors that can be used by pin controller to set and config pin.
> 
> Descriptors are grouped by pin number or group name and contains list
> of functions or configs to apply.
> 
> Pin config types from ACPI are converted to generic pin config types
> and passed through the descriptor.
> 
> Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
> ---
>  drivers/pinctrl/core.c          |  18 +-
>  drivers/pinctrl/core.h          |   3 +
>  drivers/pinctrl/pinctrl-acpi.c  | 443 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-acpi.h  |  44 ++++
>  include/linux/pinctrl/pinctrl.h |  15 ++
>  5 files changed, 519 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 9e57f4c62e60..00e5066c1087 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -25,6 +25,7 @@
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/machine.h>
> +#include <linux/acpi.h>
>  
>  #ifdef CONFIG_GPIOLIB
>  #include "../gpio/gpiolib.h"
> @@ -35,7 +36,7 @@
>  #include "devicetree.h"
>  #include "pinmux.h"
>  #include "pinconf.h"
> -
> +#include "pinctrl-acpi.h"
>  
>  static bool pinctrl_dummy_state;
>  
> @@ -1042,9 +1043,15 @@ static struct pinctrl *create_pinctrl(struct device *dev,
>  		return ERR_PTR(-ENOMEM);
>  	p->dev = dev;
>  	INIT_LIST_HEAD(&p->states);
> -	INIT_LIST_HEAD(&p->dt_maps);
>  
> -	ret = pinctrl_dt_to_map(p, pctldev);
> +	if (!ACPI_COMPANION(dev)) {

It looks better of you reverse the branches (and use
has_acpi_companion()):

if (has_acpi_companion(dev)) {
	INIT_LIST_HEAD(&p->acpi_maps);
	ret = pinctrl_acpi_to_map(p);
} else {
	INIT_LIST_HEAD(&p->dt_maps);
	ret = pinctrl_dt_to_map(p, pctldev);
}

> +		INIT_LIST_HEAD(&p->dt_maps);
> +		ret = pinctrl_dt_to_map(p, pctldev);
> +	} else {
> +		INIT_LIST_HEAD(&p->acpi_maps);
> +		ret = pinctrl_acpi_to_map(p);
> +	}
> +
>  	if (ret < 0) {
>  		kfree(p);
>  		return ERR_PTR(ret);
> @@ -1168,7 +1175,10 @@ static void pinctrl_free(struct pinctrl *p, bool inlist)
>  		kfree(state);
>  	}
>  
> -	pinctrl_dt_free_maps(p);
> +	if (!ACPI_COMPANION(p->dev))
> +		pinctrl_dt_free_maps(p);
> +	else
> +		pinctrl_acpi_free_maps(p);

DItto here.

>  
>  	if (inlist)
>  		list_del(&p->node);
> diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
> index 840103c40c14..603e36e175c7 100644
> --- a/drivers/pinctrl/core.h
> +++ b/drivers/pinctrl/core.h
> @@ -72,6 +72,8 @@ struct pinctrl_dev {
>   * @state: the current state
>   * @dt_maps: the mapping table chunks dynamically parsed from device tree for
>   *	this device, if any
> + * @acpi_maps: the mapping table chunks dynamically parsed from ACPI for this
> + *  device, if any
>   * @users: reference count
>   */
>  struct pinctrl {
> @@ -80,6 +82,7 @@ struct pinctrl {
>  	struct list_head states;
>  	struct pinctrl_state *state;
>  	struct list_head dt_maps;
> +	struct list_head acpi_maps;
>  	struct kref users;
>  };
>  
> diff --git a/drivers/pinctrl/pinctrl-acpi.c b/drivers/pinctrl/pinctrl-acpi.c
> index cd0d4b2d8868..e337f83e6879 100644
> --- a/drivers/pinctrl/pinctrl-acpi.c
> +++ b/drivers/pinctrl/pinctrl-acpi.c
> @@ -13,6 +13,449 @@
>  #include <linux/list.h>
>  
>  #include "pinctrl-acpi.h"
> +#include "core.h"
> +
> +/**
> + * struct pinctrl_acpi_map - mapping table chunk parsed from ACPI
> + * @node: list node for struct pinctrl's @acpi_maps field
> + * @pctldev: the pin controller that allocated this struct, and will free it
> + * @map: the mapping table entries
> + * @num_maps: number of mapping table entries
> + */
> +struct pinctrl_acpi_map {
> +	struct list_head node;
> +	struct pinctrl_dev *pctldev;
> +	struct pinctrl_map *map;
> +	size_t num_maps;

Perhaps nmaps consistent with npins in the previous patch?

> +};
> +
> +static void acpi_free_map(struct pinctrl_dev *pctldev,
> +			 struct pinctrl_map *map, unsigned int num_maps)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_maps; ++i) {
> +		kfree_const(map[i].dev_name);
> +		map[i].dev_name = NULL;
> +	}
> +
> +	if (pctldev) {
> +		const struct pinctrl_ops *ops = pctldev->desc->pctlops;
> +
> +		if (ops->acpi_free_map)
> +			ops->acpi_free_map(pctldev, map, num_maps);
> +

Drop this empty line

> +	} else {
> +		kfree(map);
> +	}
> +}
> +

Kernel-doc?

> +void pinctrl_acpi_free_maps(struct pinctrl *p)
> +{
> +	struct pinctrl_acpi_map *acpi_map, *tmp;
> +
> +	list_for_each_entry_safe(acpi_map, tmp, &p->acpi_maps, node) {
> +		pinctrl_unregister_mappings(acpi_map->map);
> +		list_del(&acpi_map->node);
> +		acpi_free_map(acpi_map->pctldev, acpi_map->map,
> +				acpi_map->num_maps);
> +		kfree(acpi_map);
> +	}
> +}
> +
> +static int acpi_remember_or_free_map(struct pinctrl *p, const char *statename,
> +				   struct pinctrl_dev *pctldev,
> +				   struct pinctrl_map *map, unsigned int num_maps)
> +{
> +	int i;
> +	struct pinctrl_acpi_map *acpi_map;

"reverse christmas tree" looks better but up to you:

	struct pinctrl_acpi_map *acpi_map;
	int i;

Ditto everywhere

> +
> +	for (i = 0; i < num_maps; i++) {
> +		const char *devname;
> +
> +		devname = kstrdup_const(dev_name(p->dev), GFP_KERNEL);
> +		if (!devname)
> +			goto err_free_map;
> +
> +		map[i].dev_name = devname;
> +		map[i].name = statename;
> +		if (pctldev)
> +			map[i].ctrl_dev_name = dev_name(pctldev->dev);
> +	}
> +
> +	acpi_map = kzalloc(sizeof(*acpi_map), GFP_KERNEL);
> +	if (!acpi_map)
> +		goto err_free_map;
> +
> +	acpi_map->pctldev = pctldev;
> +	acpi_map->map = map;
> +	acpi_map->num_maps = num_maps;
> +	list_add_tail(&acpi_map->node, &p->acpi_maps);
> +
> +	return pinctrl_register_mappings(map, num_maps);
> +
> +err_free_map:
> +	acpi_free_map(pctldev, map, num_maps);

Empty line

> +	return -ENOMEM;
> +}
> +
> +static const char *acpi_node_to_device_name(char *acpi_node)
> +{
> +	acpi_status status;
> +	acpi_handle handle;
> +	struct acpi_device *controller_device;
> +
> +	status = acpi_get_handle(NULL, acpi_node, &handle);
> +	if (ACPI_FAILURE(status))
> +		return NULL;
> +
> +	controller_device = acpi_get_acpi_dev(handle);
> +	if (!controller_device)
> +		return NULL;
> +
> +	return acpi_dev_name(controller_device);
> +}
> +
> +static int map_acpi_conf_to_general_conf(unsigned int acpi_param,
> +			unsigned int acpi_value, unsigned int *pin_config)
> +{
> +	enum pin_config_param genconf_param;
> +
> +	switch (acpi_param) {
> +	case ACPI_PIN_CONFIG_BIAS_PULL_UP:
> +		genconf_param = PIN_CONFIG_BIAS_PULL_UP;
> +		break;
> +	case ACPI_PIN_CONFIG_BIAS_PULL_DOWN:
> +		genconf_param = PIN_CONFIG_BIAS_PULL_DOWN;
> +		break;
> +	case ACPI_PIN_CONFIG_BIAS_DEFAULT:
> +		genconf_param = PIN_CONFIG_BIAS_PULL_PIN_DEFAULT;
> +		break;
> +	case ACPI_PIN_CONFIG_BIAS_DISABLE:
> +		genconf_param = PIN_CONFIG_BIAS_DISABLE;
> +		break;
> +	case ACPI_PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> +		genconf_param = PIN_CONFIG_BIAS_HIGH_IMPEDANCE;
> +		break;
> +	case ACPI_PIN_CONFIG_BIAS_BUS_HOLD:
> +		genconf_param = PIN_CONFIG_BIAS_BUS_HOLD;
> +		break;
> +	case ACPI_PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +		genconf_param = PIN_CONFIG_DRIVE_OPEN_DRAIN;
> +		break;
> +	case ACPI_PIN_CONFIG_DRIVE_OPEN_SOURCE:
> +		genconf_param = PIN_CONFIG_DRIVE_OPEN_SOURCE;
> +		break;
> +	case ACPI_PIN_CONFIG_DRIVE_PUSH_PULL:
> +		genconf_param = PIN_CONFIG_DRIVE_PUSH_PULL;
> +		break;
> +	case ACPI_PIN_CONFIG_DRIVE_STRENGTH:
> +		genconf_param = PIN_CONFIG_DRIVE_STRENGTH;
> +		break;
> +	case ACPI_PIN_CONFIG_SLEW_RATE:
> +		genconf_param = PIN_CONFIG_SLEW_RATE;
> +		break;
> +	case ACPI_PIN_CONFIG_INPUT_DEBOUNCE:
> +		genconf_param = PIN_CONFIG_INPUT_DEBOUNCE;
> +		break;
> +	case ACPI_PIN_CONFIG_INPUT_SCHMITT_TRIGGER:
> +		genconf_param = PIN_CONFIG_INPUT_SCHMITT_ENABLE;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	*pin_config = pinconf_to_config_packed(genconf_param, acpi_value);
> +
> +	return 0;
> +}
> +
> +/**
> + * struct pinctrl_acpi_controller_map - internal structure to group pin resources
> + * @pinctrl_dev: pin controller ACPI name
> + * @list: list head for the map
> + * @pin_group_maps: list head for the pin/group maps
> + */
> +struct pinctrl_acpi_controller_map {
> +	char *pinctrl_dev;
> +	struct list_head list;
> +	struct list_head pin_group_maps;
> +};
> +
> +static int add_pin_group_node(struct list_head *acpi_map_head,
> +							char *pinctrl_dev,
> +							char *group,
> +							unsigned int pin,
> +							bool is_config,
> +							unsigned int config_func,
> +							void *vendor_data,
> +							unsigned int vendor_length)

This takes quite many parameters, perhaps you can use a structure or
helper functions to make it look nicer? Also consider formatting:

static int add_pin_group_node(struct list_head *acpi_map_head, char *pinctrl_dev,
			      char *group, unsigned int pin, bool is_config,
			      unsigned int config_func, void *vendor_data,
			      unsigned int vendor_length)

> +{
> +	struct pinctrl_acpi_controller_map *acpi_controller_map = NULL;
> +	struct pinctrl_acpi_controller_map *acpi_controller_map_iter;
> +	struct pinctrl_acpi_pin_group_map *pin_group_map = NULL;
> +	struct pinctrl_acpi_pin_group_map *pin_group_map_iter;
> +	struct pinctrl_acpi_pin_group_info *info;
> +	bool group_pin_match;
> +
> +	list_for_each_entry(acpi_controller_map_iter, acpi_map_head, list) {
> +		if (!strcmp(acpi_controller_map_iter->pinctrl_dev, pinctrl_dev)) {
> +			acpi_controller_map = acpi_controller_map_iter;
> +			break;
> +		}
> +	}
> +
> +	if (!acpi_controller_map) {
> +		acpi_controller_map = kzalloc(sizeof(*acpi_controller_map), GFP_KERNEL);
> +		if (!acpi_controller_map)
> +			return -ENOMEM;
> +
> +		acpi_controller_map->pinctrl_dev = pinctrl_dev;
> +		INIT_LIST_HEAD(&acpi_controller_map->list);
> +		INIT_LIST_HEAD(&acpi_controller_map->pin_group_maps);
> +		list_add(&acpi_controller_map->list, acpi_map_head);
> +	}
> +
> +	list_for_each_entry(pin_group_map_iter, &acpi_controller_map->pin_group_maps, list) {
> +		if (group)
> +			group_pin_match = pin_group_map_iter->group &&
> +					!strcmp(pin_group_map_iter->group, group);
> +		else
> +			group_pin_match = (pin == pin_group_map_iter->pin);
> +
> +		if (pin_group_map_iter->is_config == is_config && group_pin_match) {
> +			pin_group_map = pin_group_map_iter;
> +			break;
> +		}
> +	}
> +
> +	if (!pin_group_map) {
> +		pin_group_map = kzalloc(sizeof(struct pinctrl_acpi_pin_group_map), GFP_KERNEL);
> +		if (!pin_group_map)

Did you just leak acpi_controller_map?

> +			return -ENOMEM;
> +
> +		pin_group_map->group = group;
> +		pin_group_map->pin = pin;
> +		pin_group_map->is_config = is_config;
> +		INIT_LIST_HEAD(&pin_group_map->list);
> +		INIT_LIST_HEAD(&pin_group_map->info_list);
> +		list_add(&pin_group_map->list, &acpi_controller_map->pin_group_maps);
> +	}
> +
> +	info = kzalloc(sizeof(struct pinctrl_acpi_pin_group_info), GFP_KERNEL);
> +	if (!info)

Does this leak acpi_controller_map and pin_group_map?

> +		return -ENOMEM;
> +
> +	info->config_func = config_func;
> +	info->vendor_data = vendor_data;
> +	info->vendor_length = vendor_length;
> +	INIT_LIST_HEAD(&info->list);
> +	list_add(&info->list, &pin_group_map->info_list);
> +
> +	return 0;
> +}
> +
> +static int populate_pin_function(struct list_head *acpi_map_head,
> +		struct acpi_resource_pin_function *ares_pin_function)
> +{
> +	int i;
> +	int ret;
> +	unsigned int config;
> +
> +	ret = map_acpi_conf_to_general_conf(ares_pin_function->pin_config, 1, &config);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < ares_pin_function->pin_table_length; i++) {
> +		ret = add_pin_group_node(acpi_map_head,
> +				ares_pin_function->resource_source.string_ptr,
> +				NULL,
> +				ares_pin_function->pin_table[i],
> +				false,
> +				ares_pin_function->function_number,
> +				ares_pin_function->vendor_data,
> +				ares_pin_function->vendor_length);

If you pass here:

		ret = add_pin_group_node(acpi_map_head, ares_pin_function, NULL, false);

looks much nicer. I mean can't you pass "ares_pin_function" as is?


> +		if (ret < 0)
> +			return ret;
> +
> +		ret = add_pin_group_node(acpi_map_head,
> +				ares_pin_function->resource_source.string_ptr,
> +				NULL,
> +				ares_pin_function->pin_table[i],
> +				true,
> +				config,
> +				ares_pin_function->vendor_data,
> +				ares_pin_function->vendor_length);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 1;
> +}
> +
> +static int populate_pin_config(struct list_head *acpi_map_head,
> +						struct acpi_resource_pin_config *ares_pin_config)
> +{
> +	int i;
> +	int ret;
> +	unsigned int config;
> +
> +	ret = map_acpi_conf_to_general_conf(ares_pin_config->pin_config_type,
> +					ares_pin_config->pin_config_value, &config);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < ares_pin_config->pin_table_length; i++) {
> +		ret = add_pin_group_node(acpi_map_head,
> +				ares_pin_config->resource_source.string_ptr,
> +				NULL,
> +				ares_pin_config->pin_table[i],
> +				true,
> +				config,
> +				ares_pin_config->vendor_data,
> +				ares_pin_config->vendor_length);

Same here

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 1;
> +}
> +
> +static int populate_pin_group_function(struct list_head *acpi_map_head,
> +		struct acpi_resource_pin_group_function *ares_pin_group_function)
> +{
> +	int ret;
> +
> +	ret = add_pin_group_node(acpi_map_head,
> +			ares_pin_group_function->resource_source.string_ptr,
> +			ares_pin_group_function->resource_source_label.string_ptr,
> +			0,
> +			false,
> +			ares_pin_group_function->function_number,
> +			ares_pin_group_function->vendor_data,
> +			ares_pin_group_function->vendor_length);

And here. Okay the type is different but since they all have the same
common "header" it should be OK, I think.

> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int populate_pin_group_config(struct list_head *acpi_map_head,
> +		struct acpi_resource_pin_group_config *ares_pin_group_config)
> +{
> +	unsigned int config;
> +	int ret;
> +
> +	ret = map_acpi_conf_to_general_conf(
> +			ares_pin_group_config->pin_config_type,
> +			ares_pin_group_config->pin_config_value,
> +			&config);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = add_pin_group_node(acpi_map_head,
> +			ares_pin_group_config->resource_source.string_ptr,
> +			ares_pin_group_config->resource_source_label.string_ptr,
> +			0,
> +			true,
> +			config,
> +			ares_pin_group_config->vendor_data,
> +			ares_pin_group_config->vendor_length);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int pinctrl_acpi_populate_pin_group_map(struct acpi_resource *ares, void *data)
> +{
> +	struct list_head *acpi_map_head = data;
> +
> +	switch (ares->type) {
> +	case ACPI_RESOURCE_TYPE_PIN_FUNCTION:
> +		return populate_pin_function(acpi_map_head, &ares->data.pin_function);
> +	case ACPI_RESOURCE_TYPE_PIN_CONFIG:
> +		return populate_pin_config(acpi_map_head, &ares->data.pin_config);
> +	case ACPI_RESOURCE_TYPE_PIN_GROUP_FUNCTION:
> +		return populate_pin_group_function(acpi_map_head, &ares->data.pin_group_function);
> +	case ACPI_RESOURCE_TYPE_PIN_GROUP_CONFIG:
> +		return populate_pin_group_config(acpi_map_head, &ares->data.pin_group_config);
> +	default:
> +		return 1;
> +	}
> +}
> +
> +static int pinctrl_acpi_get_pin_group_map(struct acpi_device *adev,
> +		struct list_head *pin_group_root)
> +{
> +	struct list_head res_list;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&res_list);
> +	ret = acpi_dev_get_resources(adev, &res_list,
> +								pinctrl_acpi_populate_pin_group_map,
> +								pin_group_root);

Still weird formatting. Didn't checkpatch.pl complain about this?

> +	acpi_dev_free_resource_list(&res_list);
> +
> +	return ret;
> +}
> +
> +/**
> + * pinctrl_acpi_to_map() - pinctrl map from ACPI pin resources for device
> + * @p: pinctrl descriptor for the device
> + *
> + * This will parse the ACPI pin resources for the device and creates
> + * pinctrl map. This functions handles PinFunction, PinFunctionConfig,
> + * PinGroupFunction and PinGroupConfig resources.
> + */
> +int pinctrl_acpi_to_map(struct pinctrl *p)
> +{
> +	int num_maps;
> +	int ret;
> +	struct acpi_device *adev;
> +	struct list_head pin_group_list;
> +	struct pinctrl_map *new_map;
> +	struct pinctrl_dev *pctldev;
> +	const struct pinctrl_ops *ops;
> +	struct pinctrl_acpi_controller_map *controller_map;
> +
> +	adev = ACPI_COMPANION(p->dev);
> +	if (!adev)
> +		return -ENODEV;
> +
> +	INIT_LIST_HEAD(&pin_group_list);
> +	ret = pinctrl_acpi_get_pin_group_map(adev, &pin_group_list);
> +	if (ret < 0)
> +		return ret;
> +
> +	list_for_each_entry(controller_map, &pin_group_list, list) {
> +		const char *pctldev_name = acpi_node_to_device_name(controller_map->pinctrl_dev);
> +
> +		pctldev = get_pinctrl_dev_from_devname(pctldev_name);
> +		ops = pctldev->desc->pctlops;
> +		if (!ops->acpi_node_to_map) {
> +			dev_err(p->dev, "pctldev %s doesn't support ACPI\n",
> +				dev_name(pctldev->dev));
> +			return -ENODEV;
> +		}
> +		ret = ops->acpi_node_to_map(pctldev,
> +			&controller_map->pin_group_maps, &new_map, &num_maps);
> +		if (ret < 0) {
> +			return ret;
> +		} else if (num_maps == 0) {

!num_maps

> +			dev_info(p->dev, "there is not valid maps for pin controller %s\n",
> +				pctldev_name);
> +			return 0;
> +		}
> +
> +		ret = acpi_remember_or_free_map(p, "default", pctldev, new_map, num_maps);
> +		if (ret < 0) {
> +			dev_info(p->dev, "Failed to register maps\n");
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
>  
>  static int pinctrl_acpi_populate_group_desc(struct acpi_resource *ares, void *data)
>  {
> diff --git a/drivers/pinctrl/pinctrl-acpi.h b/drivers/pinctrl/pinctrl-acpi.h
> index e3a6b61bea90..1b097edb43a8 100644
> --- a/drivers/pinctrl/pinctrl-acpi.h
> +++ b/drivers/pinctrl/pinctrl-acpi.h
> @@ -23,12 +23,56 @@ struct pinctrl_acpi_group_desc {
>  	struct list_head list;
>  };
>  
> +/**
> + * struct pinctrl_acpi_pin_group_map - pin/group to config/functions map
> + * @group: name of the pin group. @group is NULL for pin types
> + * @pin: pin number. @pin is valid only if @group is NULL
> + * @is_config: set if @info contains config values
> + * @info_list: list of config or function for the pin/group
> + * @list: list head for the map
> + */
> +struct pinctrl_acpi_pin_group_map {
> +	const char *group;
> +	unsigned int pin;
> +	bool is_config;
> +	struct list_head info_list;
> +	struct list_head list;
> +};
> +
> +/**
> + * struct pinctrl_acpi_pin_group_info - config or function to apply
> + * @config_func: packed config value or function number
> + * @vendor_data: vendor data from ACPI resource
> + * @vendor_length: length of vendor data
> + * @list: list head for the descriptor
> + */
> +struct pinctrl_acpi_pin_group_info {
> +	unsigned int config_func;
> +	u8 *vendor_data;
> +	unsigned int vendor_length;
> +	struct list_head list;
> +};
> +
>  #ifdef CONFIG_ACPI
>  int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list);
> +

Drop the empty line

> +int pinctrl_acpi_to_map(struct pinctrl *p);
> +

Ditto

> +void pinctrl_acpi_free_maps(struct pinctrl *p);
>  #else
>  static inline int pinctrl_acpi_get_pin_groups(struct acpi_device *adev,
>  			struct list_head *group_desc_list)
>  {
>  	return -ENXIO;
>  }
> +
> +static inline int pinctrl_acpi_to_map(struct pinctrl *p)
> +{
> +	return -ENXIO;
> +}
> +
> +static inline void pinctrl_acpi_free_maps(struct pinctrl *p)
> +{
> +
> +}
>  #endif
> diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
> index 487117ccb1bc..13d43a186df9 100644
> --- a/include/linux/pinctrl/pinctrl.h
> +++ b/include/linux/pinctrl/pinctrl.h
> @@ -104,6 +104,15 @@ struct pinctrl_gpio_range {
>   *	allocated members of the mapping table entries themselves. This
>   *	function is optional, and may be omitted for pinctrl drivers that do
>   *	not support device tree.
> + * @acpi_node_to_map: process ACPI pin related properties, and create
> + *	mapping table entries for it. These are returned through the @map and
> + *	@num_maps output parameters. This function is optional, and may be
> + *	omitted for pinctrl drivers that do not support ACPI.
> + * @acpi_free_map: free mapping table entries created via @acpi_node_to_map. The
> + *	top-level @map pointer must be freed, along with any dynamically
> + *	allocated members of the mapping table entries themselves. This
> + *	function is optional, and may be omitted for pinctrl drivers that do
> + *	not support ACPI.
>   */
>  struct pinctrl_ops {
>  	int (*get_groups_count) (struct pinctrl_dev *pctldev);
> @@ -120,6 +129,12 @@ struct pinctrl_ops {
>  			       struct pinctrl_map **map, unsigned *num_maps);
>  	void (*dt_free_map) (struct pinctrl_dev *pctldev,
>  			     struct pinctrl_map *map, unsigned num_maps);
> +	int (*acpi_node_to_map) (struct pinctrl_dev *pctldev,
> +			       struct list_head *info_list,
> +			       struct pinctrl_map **map, unsigned *num_maps);
> +	void (*acpi_free_map) (struct pinctrl_dev *pctldev,
> +				   struct pinctrl_map *map, unsigned num_maps);
> +
>  };
>  
>  /**
> -- 
> 2.25.1
