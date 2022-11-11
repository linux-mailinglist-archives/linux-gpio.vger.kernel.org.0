Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7497A625A6B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 13:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbiKKMX6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 07:23:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbiKKMX6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 07:23:58 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC6D27FD1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 04:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668169436; x=1699705436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dvb9web1p1c2XUTiChWGgB1Aj6cXXMN21cl8PHuN3m0=;
  b=b7/BWLXr8ooyfQ/4LkNAGO7UZfGOcfIZzrTELvmY7wvZG3swyHrQF+j7
   sqVZrtIab/TtuTabstiQ/9SjI23ywcW7gscBpPQ3P9gI3eIu8CEhGUcpT
   VDsk8Llc+IwytCLk+MLUJ7G8cOKDUYC8+nLxJUfSyk4O74qi7XLWyGqwE
   tiSxWJn0ydsqOOKSwd/82TuDM4Mm93w0nIYDRN3apS0ncCNhhvNOsKQ7N
   5tjmJAqL0JoRUTdq1AMZsmpJspQ2LajfjnYavmqbqTlZhHlwgqkqTrGA1
   JiBLh1RplfSvlnau77CIAreGwjXKQ5CqJz3R1KGlymw1p6mHu2kV79gwv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="338356984"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="338356984"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 04:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="639999780"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="639999780"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2022 04:23:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id CB027155; Fri, 11 Nov 2022 14:24:18 +0200 (EET)
Date:   Fri, 11 Nov 2022 14:24:18 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC 3/3] pinctrl: add support for acpi pin function and
 config resources
Message-ID: <Y24+8mtqqqJWwNSR@black.fi.intel.com>
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
 <20221110191258.1134378-4-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110191258.1134378-4-niyas.sait@linaro.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 10, 2022 at 07:12:58PM +0000, Niyas Sait wrote:
> Add support for following acpi pin resources
> 
> - PinFunction
> - PinConfig
> - PinGroupFunction
> - PinGroupConfig
> 
> Pinctrl-acpi parses the acpi table and generates list of pin

ACPI

> descriptors that can be used by pin controller to set and config pin.
> 
> Descriptors are grouped by pin number or group name and contains list
> of functions or configs to apply.
> 
> Pin config types from acpi are converted to generic pin config types

ACPI (ditto everywhere).

> and passed through the descriptor.
> 
> Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
> ---
>  drivers/pinctrl/core.c          |  19 +-
>  drivers/pinctrl/core.h          |   3 +
>  drivers/pinctrl/pinctrl-acpi.c  | 391 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-acpi.h  |  28 +++
>  include/linux/pinctrl/pinctrl.h |  15 ++
>  5 files changed, 452 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index ffe39336fcac..03770ac66d48 100644
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
> @@ -1168,7 +1175,11 @@ static void pinctrl_free(struct pinctrl *p, bool inlist)
>  		kfree(state);
>  	}
>  
> -	pinctrl_dt_free_maps(p);
> +	if (!ACPI_COMPANION(p->dev)) {
> +		pinctrl_dt_free_maps(p);
> +	} else {
> +		pinctrl_acpi_free_maps(p);
> +	}

You don't need the {}

>  
>  	if (inlist)
>  		list_del(&p->node);
> diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
> index 840103c40c14..28f2f9d518d4 100644
> --- a/drivers/pinctrl/core.h
> +++ b/drivers/pinctrl/core.h
> @@ -72,6 +72,8 @@ struct pinctrl_dev {
>   * @state: the current state
>   * @dt_maps: the mapping table chunks dynamically parsed from device tree for
>   *	this device, if any
> + * @acpi_maps: the mapping table chunks dynamically parsed from acpi for this
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
> index 75e59fe22387..9777577aefd6 100644
> --- a/drivers/pinctrl/pinctrl-acpi.c
> +++ b/drivers/pinctrl/pinctrl-acpi.c
> @@ -10,6 +10,397 @@
>  #include <linux/list.h>
>  
>  #include "pinctrl-acpi.h"
> +#include "core.h"
> +
> +/**
> + * struct pinctrl_acpi_map - mapping table chunk parsed from device tree

Parsed from ACPI namespace?

> + * @node: list node for struct pinctrl's @acpi_maps field
> + * @pctldev: the pin controller that allocated this struct, and will free it
> + * @map: the mapping table entries
> + * @num_maps: number of mapping table entries
> + */
> +struct pinctrl_acpi_map {
> +	struct list_head node;
> +	struct pinctrl_dev *pctldev;
> +	struct pinctrl_map *map;
> +	unsigned int num_maps;

size_t?

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
> +	} else {
> +		/* There is no pctldev for PIN_MAP_TYPE_DUMMY_STATE */
> +		kfree(map);
> +	}
> +}
> +

kernel-doc?

> +void pinctrl_acpi_free_maps(struct pinctrl *p)
> +{
> +	struct pinctrl_acpi_map *acpi_map, *n1;

Why not 'tmp' instead of 'n1'?

> +
> +	list_for_each_entry_safe(acpi_map, n1, &p->acpi_maps, node) {
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
> +				   struct pinctrl_map *map, unsigned num_maps)
> +{
> +	int i;
> +	struct pinctrl_acpi_map *acpi_map;
> +
> +	/* Initialize common mapping table entry fields */
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
> +	/* Remember the converted mapping table entries */
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
> +	return -ENOMEM;
> +}
> +
> +/* Convert raw acpi device references to device name */

raw ACPI device or raw acpi_device.

> +static const char *acpi_node_to_device_name(char *acpi_node)

Can this be const?

> +{
> +	acpi_status status;
> +	acpi_handle handle;
> +	struct acpi_device *controller_device;
> +
> +	status = acpi_get_handle(NULL, acpi_node, &handle);
> +

Drop the empty line.

> +	if (ACPI_FAILURE(status))
> +		return NULL;
> +
> +	controller_device = acpi_bus_get_acpi_device(handle);

Ditto.

> +
> +	if (!controller_device)
> +		return NULL;
> +
> +	return acpi_dev_name(controller_device);
> +}
> +
> +/* Map acpi pin configuration types to pinctrl general configuration type */
> +static unsigned map_acpi_conf_to_general_conf(unsigned param, unsigned value)
> +{
> +	switch (param) {
> +	case ACPI_PIN_CONFIG_DEFAULT:
> +		return pinconf_to_config_packed(ACPI_PIN_CONFIG_DEFAULT, 0);
> +	case ACPI_PIN_CONFIG_BIAS_PULL_UP:
> +		return pinconf_to_config_packed(PIN_CONFIG_BIAS_PULL_UP_OHMS, value);
> +	case ACPI_PIN_CONFIG_BIAS_PULL_DOWN:
> +		return pinconf_to_config_packed(PIN_CONFIG_BIAS_PULL_DOWN_OHMS, value);
> +	case ACPI_PIN_CONFIG_BIAS_DEFAULT:
> +		return pinconf_to_config_packed(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT, 0);
> +	case ACPI_PIN_CONFIG_BIAS_DISABLE:
> +		return pinconf_to_config_packed(PIN_CONFIG_BIAS_DISABLE, 0);
> +	case ACPI_PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> +		return pinconf_to_config_packed(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, 0);
> +	case ACPI_PIN_CONFIG_BIAS_BUS_HOLD:
> +		return pinconf_to_config_packed(PIN_CONFIG_BIAS_BUS_HOLD, 0);
> +	case ACPI_PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +		return pinconf_to_config_packed(PIN_CONFIG_DRIVE_OPEN_DRAIN, 0);
> +	case ACPI_PIN_CONFIG_DRIVE_OPEN_SOURCE:
> +		return pinconf_to_config_packed(PIN_CONFIG_DRIVE_OPEN_SOURCE, 0);
> +	case ACPI_PIN_CONFIG_DRIVE_PUSH_PULL:
> +		return pinconf_to_config_packed(PIN_CONFIG_DRIVE_PUSH_PULL, 0);
> +	case ACPI_PIN_CONFIG_DRIVE_STRENGTH:
> +		return pinconf_to_config_packed(PIN_CONFIG_DRIVE_STRENGTH, value);
> +	case ACPI_PIN_CONFIG_SLEW_RATE:
> +		return pinconf_to_config_packed(PIN_CONFIG_SLEW_RATE, value);
> +	case ACPI_PIN_CONFIG_INPUT_DEBOUNCE:
> +		return pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, value);
> +	case ACPI_PIN_CONFIG_INPUT_SCHMITT_TRIGGER:
> +		return pinconf_to_config_packed(PIN_CONFIG_INPUT_SCHMITT_ENABLE, value);
> +	default:
> +		pr_warn("PINCTRL: ACPI pin configuration type (%d) not handled\n", param);

Don't you have any dev * pointer that you can use here instead of
pr_warn()?

> +		return pinconf_to_config_packed(ACPI_PIN_CONFIG_DEFAULT, 0);
> +	}
> +}
> +
> +struct pinctrl_acpi_controller_map {
> +	char *pinctrl_dev;

const char *?

> +	struct list_head list;
> +	struct list_head pin_group_maps;
> +};
> +
> +/* Add pin/group function and configuration descriptor to internal map */
> +static int add_pin_group_node(struct list_head *acpi_map_head,
> +							char *pinctrl_dev,
> +							char *group,
> +							unsigned pin,
> +							bool is_config,
> +							unsigned config_func,
> +							void *vendor_data)
> +{
> +	struct pinctrl_acpi_controller_map *acpi_controller_map = NULL;
> +	struct pinctrl_acpi_controller_map *acpi_controller_map_iter = NULL;
> +	struct pinctrl_acpi_pin_group_map *pin_group_map = NULL;
> +	struct pinctrl_acpi_pin_group_map *pin_group_map_iter = NULL;
> +	struct pinctrl_acpi_pin_group_info *info = NULL;


Do you need to initialize them all?

> +	bool group_pin_match;
> +
> +	/* Find the pin controller specific list to use to add the descriptor */
> +	list_for_each_entry(acpi_controller_map_iter, acpi_map_head, list) {
> +		if (!strcmp(acpi_controller_map_iter->pinctrl_dev, pinctrl_dev)) {
> +			acpi_controller_map = acpi_controller_map_iter;
> +			break;
> +		}
> +	}
> +
> +	/* If this is the first entry for the pin controller, allocate an entry */
> +	if (!acpi_controller_map) {
> +		acpi_controller_map = kzalloc(sizeof(struct pinctrl_acpi_controller_map), GFP_KERNEL);
> +

Drop the empty line.

> +		if (!acpi_controller_map)
> +			return -ENOMEM;
> +
> +		acpi_controller_map->pinctrl_dev = pinctrl_dev;
> +		INIT_LIST_HEAD(&acpi_controller_map->list);
> +		INIT_LIST_HEAD(&acpi_controller_map->pin_group_maps);
> +		list_add(&acpi_controller_map->list, acpi_map_head);
> +	}
> +
> +	/* Find the group/pin specific node from the descriptor list */
> +	list_for_each_entry(pin_group_map_iter, &acpi_controller_map->pin_group_maps, list) {
> +		if (group)
> +			group_pin_match = !strcmp(pin_group_map_iter->group, group);
> +		else
> +			group_pin_match = (pin == pin_group_map_iter->pin);

Empty line

> +		if (pin_group_map_iter->is_config == is_config && group_pin_match) {
> +			pin_group_map = pin_group_map_iter;
> +			break;
> +		}
> +	}
> +
> +	if (!pin_group_map) {
> +		pin_group_map = kzalloc(sizeof(struct pinctrl_acpi_pin_group_map), GFP_KERNEL);
> +

Drop the empty line ;-)

> +		if (!pin_group_map)
> +			return -ENOMEM;
> +
> +		pin_group_map->group = group;
> +		pin_group_map->pin = pin;
> +		pin_group_map->is_config = is_config;
> +		INIT_LIST_HEAD(&pin_group_map->list);
> +		INIT_LIST_HEAD(&pin_group_map->info);
> +		list_add(&pin_group_map->list, &acpi_controller_map->pin_group_maps);
> +	}
> +
> +	/* Allocate descriptor and add the pin configuration/function info */
> +	info = kzalloc(sizeof(struct pinctrl_acpi_pin_group_info), GFP_KERNEL);

Drop the empty line.

> +
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->config_func = config_func;
> +	info->vendor_data = vendor_data;
> +	INIT_LIST_HEAD(&info->list);
> +	list_add(&info->list, &pin_group_map->info);
> +
> +	return 0;
> +}
> +
> +static int pinctrl_acpi_populate_pin_group_map(struct acpi_resource *ares, void *data)
> +{
> +	struct acpi_resource_pin_function *ares_pin_function;
> +	struct acpi_resource_pin_config *ares_pin_config;
> +	struct acpi_resource_pin_group_function *ares_pin_group_function;
> +	struct acpi_resource_pin_group_config *ares_pin_group_config;
> +	struct list_head *acpi_map_head = data;
> +	int i;
> +	int ret;
> +	unsigned int config;
> +	char *pinctrl_dev;
> +	char *group;
> +	unsigned int pin;
> +	void *vendor_data;
> +	unsigned int func;

That's huge amount of variables. I wonder if this can be reduced with
helper functions etc?

> +
> +	switch (ares->type) {
> +	case ACPI_RESOURCE_TYPE_PIN_FUNCTION:
> +		ares_pin_function = &ares->data.pin_function;
> +		vendor_data = ares_pin_function->vendor_data;
> +		pinctrl_dev = ares_pin_function->resource_source.string_ptr;
> +		group = NULL;
> +		func = ares_pin_function->function_number;
> +		config = map_acpi_conf_to_general_conf(ares_pin_function->pin_config, 0);
> +
> +		for (i = 0; i < ares_pin_function->pin_table_length; i++) {
> +

Drop the empty line

> +			ret = add_pin_group_node(acpi_map_head, pinctrl_dev, group,
> +					ares_pin_function->pin_table[i], false, func, vendor_data);
> +
> +			if (ret < 0)
> +				return ret;
> +
> +			ret = add_pin_group_node(acpi_map_head, pinctrl_dev, group,
> +					ares_pin_function->pin_table[i], true, config, vendor_data);
> +
> +			if (ret < 0)
> +				return ret;
> +		}
> +		break;

Add empty line

(Ditto everywhere below)

> +	case ACPI_RESOURCE_TYPE_PIN_CONFIG:
> +		ares_pin_config = &ares->data.pin_config;
> +		pinctrl_dev = ares_pin_config->resource_source.string_ptr;
> +		group = NULL;
> +		func = 0;
> +
> +		config = map_acpi_conf_to_general_conf(
> +			ares_pin_config->pin_config_type,
> +			ares_pin_config->pin_config_value);
> +
> +		vendor_data = ares_pin_config->vendor_data;
> +
> +		for (i = 0; i < ares_pin_function->pin_table_length; i++) {
> +			pin = ares_pin_config->pin_table[i];
> +
> +			ret = add_pin_group_node(acpi_map_head, pinctrl_dev,
> +						group, pin, true, config, vendor_data);
> +			if (ret < 0)
> +				return ret;
> +		}
> +		break;
> +	case ACPI_RESOURCE_TYPE_PIN_GROUP_FUNCTION:
> +		ares_pin_group_function = &ares->data.pin_group_function;
> +		vendor_data = ares_pin_group_function->vendor_data;
> +		pinctrl_dev = ares_pin_group_function->resource_source.string_ptr;
> +		group = ares_pin_group_function->resource_source_label.string_ptr;
> +		pin = 0;
> +		func = ares_pin_group_function->function_number;
> +		ret = add_pin_group_node(acpi_map_head, pinctrl_dev,
> +					group, pin, false, func, vendor_data);
> +		if (ret < 0)
> +			return ret;
> +
> +		break;
> +	case ACPI_RESOURCE_TYPE_PIN_GROUP_CONFIG:
> +		ares_pin_group_config = &ares->data.pin_group_config;
> +		vendor_data = ares_pin_group_config->vendor_data;
> +		pinctrl_dev = ares_pin_group_config->resource_source.string_ptr;
> +		group = ares_pin_group_config->resource_source_label.string_ptr;
> +		pin = 0;
> +
> +		config = map_acpi_conf_to_general_conf(
> +					ares_pin_group_config->pin_config_type,
> +					ares_pin_group_config->pin_config_value);
> +
> +		ret = add_pin_group_node(acpi_map_head, pinctrl_dev, group,
> +					pin, true, config, vendor_data);
> +		if (ret < 0)
> +			return ret;
> +
> +		break;
> +	}
> +	return 1;
> +}
> +
> +static int pinctrl_acpi_get_pin_group_map(struct acpi_device *adev, struct list_head *pin_group_root)
> +{
> +	struct list_head res_list;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&res_list);
> +
> +	ret = acpi_dev_get_resources(adev, &res_list,
> +								 pinctrl_acpi_populate_pin_group_map,
> +								 pin_group_root);
> +

Weird formatting.

> +	acpi_dev_free_resource_list(&res_list);
> +
> +	return ret;
> +}
> +
> +/* Decode and register acpi pinctrl related properties to pinctrl system */

Kernel-doc

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
> +	/* list to hold the pin/group descriptors generated, grouped by pin controller, pin/group name*/
> +	INIT_LIST_HEAD(&pin_group_list);
> +
> +	ret = pinctrl_acpi_get_pin_group_map(adev, &pin_group_list);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Iterate over descriptor for each pin controller and invoke the driver function */
> +	list_for_each_entry(controller_map, &pin_group_list, list) {
> +		const char *pinctrl_dev_name = acpi_node_to_device_name(controller_map->pinctrl_dev);
> +
> +		pctldev = get_pinctrl_dev_from_devname(pinctrl_dev_name);
> +		ops = pctldev->desc->pctlops;
> +		if (!ops->acpi_node_to_map) {
> +			dev_err(p->dev, "pctldev %s doesn't support ACPI\n",
> +				dev_name(pctldev->dev));
> +			return -ENODEV;
> +		}
> +		ret = ops->acpi_node_to_map(pctldev, &controller_map->pin_group_maps, &new_map, &num_maps);
> +		if (ret < 0) {
> +			return ret;
> +		} else if (num_maps == 0) {
> +			dev_info(p->dev, "there is not valid maps for pin controller %s\n", pinctrl_dev_name);
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
> index 1a0c751a7594..4ed45b22257c 100644
> --- a/drivers/pinctrl/pinctrl-acpi.h
> +++ b/drivers/pinctrl/pinctrl-acpi.h
> @@ -12,11 +12,39 @@ struct pinctrl_acpi_group_desc {
>  	struct list_head list;
>  };


kernel-doc

>  
> +struct pinctrl_acpi_pin_group_map {
> +	const char *group;
> +	unsigned int pin;
> +	bool is_config;
> +    struct list_head info;

indent

> +	struct list_head list;
> +};
> +

kernel-doc

> +struct pinctrl_acpi_pin_group_info {
> +	unsigned config_func;
> +	void *vendor_data;

indent

> +    struct list_head list;
> +};
> +
>  #ifdef CONFIG_ACPI
>  int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list);
> +
> +int pinctrl_acpi_to_map(struct pinctrl *p);
> +
> +void pinctrl_acpi_free_maps(struct pinctrl *p);
>  #else
>  int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list)
>  {
>  	return -ENODEV;
>  }
> +
> +int pinctrl_acpi_to_map(struct pinctrl *p)
> +{
> +	return -ENODEV;
> +}
> +
> +void pinctrl_acpi_free_maps(struct pinctrl *p)
> +{
> +
> +}

static inline for these. Try also to compile with CONFIG_ACPI=n to see
what warnings you get.

>  #endif
> diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
> index 70b45d28e7a9..99a087888c0d 100644
> --- a/include/linux/pinctrl/pinctrl.h
> +++ b/include/linux/pinctrl/pinctrl.h
> @@ -84,6 +84,15 @@ struct pinctrl_gpio_range {
>   *	allocated members of the mapping table entries themselves. This
>   *	function is optional, and may be omitted for pinctrl drivers that do
>   *	not support device tree.
> + * @acpi_node_to_map: process acpi pin related properties, and create

ACPI

> + *	mapping table entries for it. These are returned through the @map and
> + *	@num_maps output parameters. This function is optional, and may be
> + *	omitted for pinctrl drivers that do not support acpi.

ACPI

> + * @acpi_free_map: free mapping table entries created via @dt_node_to_map. The

dt_node_to_map? Isn't that acpi_node_to_map?

> + *	top-level @map pointer must be freed, along with any dynamically
> + *	allocated members of the mapping table entries themselves. This
> + *	function is optional, and may be omitted for pinctrl drivers that do
> + *	not support acpi.

ACPI

>   */
>  struct pinctrl_ops {
>  	int (*get_groups_count) (struct pinctrl_dev *pctldev);
> @@ -100,6 +109,12 @@ struct pinctrl_ops {
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
