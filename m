Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9779662B6C3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 10:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238529AbiKPJl1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 04:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238684AbiKPJlW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 04:41:22 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3611D2A261
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668591681; x=1700127681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HAPjLLvf2ozoFtbjBZS+kcx8bo/y09gmpTmBiG6otP8=;
  b=AlOAu972phWl7ln7hI+ezDtjk1ht3QzBOd2IMnY2Hrplz9Wh39WDIpLk
   Q543tUEh8kUBo2nYqr1tlYL8jv6r1v4Mb2HR/sbzTUpMII9jjs1x9xbMb
   68rTVhZJf9JZzb4ot2l0jVyK1ppj4twGXEhxI7PRSJ94eF3+SoyjENSlw
   bC3Dsgm8YXFFyP4ONRGPfuxz5J1fW36EyqaqPP0wU5WDv+OG5WhBfV4QD
   jenygq7W1tKmibxjKT1Mu0sFk3GI+rVRv19v+SNAjKCnioYfGtaXz1oCm
   dYDR9zdrKESBUCQzgkzmYvMrzcTPHxnbKROrydtlHgNZLYMT1uBSaL4Wp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="295864364"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="295864364"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 01:41:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="968354678"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="968354678"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 16 Nov 2022 01:41:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5A0E92F3; Wed, 16 Nov 2022 11:41:43 +0200 (EET)
Date:   Wed, 16 Nov 2022 11:41:43 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC v2 1/3] pinctrl: add support for ACPI PinGroup
 resource
Message-ID: <Y3SwV2ygYb3C0w4o@black.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <20221115175415.650690-2-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221115175415.650690-2-niyas.sait@linaro.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 05:54:13PM +0000, Niyas Sait wrote:
> pinctrl-acpi parses and decode PinGroup resources for
> the device and generate list of group descriptor.
> Descriptors can be used by the pin controller to identify
> the groups and pins provided in the group.
> 
> Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
> ---
>  drivers/pinctrl/Makefile       |  1 +
>  drivers/pinctrl/pinctrl-acpi.c | 99 ++++++++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-acpi.h | 34 ++++++++++++
>  3 files changed, 134 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-acpi.c
>  create mode 100644 drivers/pinctrl/pinctrl-acpi.h
> 
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 89bfa01b5231..b5423465131f 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_PINMUX)		+= pinmux.o
>  obj-$(CONFIG_PINCONF)		+= pinconf.o
>  obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
>  obj-$(CONFIG_OF)		+= devicetree.o
> +obj-$(CONFIG_ACPI)		+= pinctrl-acpi.o
>  
>  obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
>  obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
> diff --git a/drivers/pinctrl/pinctrl-acpi.c b/drivers/pinctrl/pinctrl-acpi.c
> new file mode 100644
> index 000000000000..cd0d4b2d8868
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-acpi.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ACPI helpers for PinCtrl API
> + *
> + * Copyright (C) 2022 Linaro Ltd.
> + * Author: Niyas Sait <niyas.sait@linaro.org>
> + */
> +#include <linux/acpi.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/list.h>
> +
> +#include "pinctrl-acpi.h"
> +
> +static int pinctrl_acpi_populate_group_desc(struct acpi_resource *ares, void *data)
> +{
> +	struct acpi_resource_pin_group *ares_pin_group;
> +	struct pinctrl_acpi_group_desc *desc;
> +	struct list_head *group_desc_list = data;
> +	int i;
> +
> +	if (ares->type != ACPI_RESOURCE_TYPE_PIN_GROUP)
> +		return 1;
> +
> +	ares_pin_group = &ares->data.pin_group;
> +	desc = kzalloc(sizeof(struct pinctrl_acpi_group_desc), GFP_KERNEL);
> +	if (!desc)
> +		return -ENOMEM;
> +
> +	desc->name = kstrdup_const(ares_pin_group->resource_label.string_ptr, GFP_KERNEL);
> +	desc->num_pins = ares_pin_group->pin_table_length;
> +	desc->pins = kmalloc_array(desc->num_pins, sizeof(*desc->pins), GFP_KERNEL);
> +	if (!desc->pins)
> +		return -ENOMEM;

Here you leak desc.

> +
> +	for (i = 0; i < desc->num_pins; i++)
> +		desc->pins[i] = ares_pin_group->pin_table[i];
> +
> +	desc->vendor_length = ares_pin_group->vendor_length;
> +	desc->vendor_data = kmalloc_array(desc->vendor_length,
> +				sizeof(*desc->vendor_data),
> +				GFP_KERNEL);
> +	if (!desc->vendor_data)
> +		return -ENOMEM;

And this one leaks also ->pins.

> +
> +	for (i = 0; i < desc->vendor_length; i++)
> +		desc->vendor_data[i] = ares_pin_group->vendor_data[i];
> +
> +	INIT_LIST_HEAD(&desc->list);
> +	list_add(&desc->list, group_desc_list);
> +
> +	return 1;
> +}
> +
> +/**
> + * pinctrl_acpi_get_pin_groups() - Get ACPI PinGroup Descriptors for the device
> + * @adev: ACPI device node for retrieving PinGroup descriptors
> + * @group_desc_list: list head to add PinGroup descriptors
> + *
> + * This will parse ACPI PinGroup resources for the given ACPI device
> + * and will add descriptors to the provided @group_desc_list list

I would add here what happens to group_desc_list if the function returns
non-zero.

Also perhaps the API should use an array instead and when NULL is passed
it returns the size as we do with properties for example. The naged
list_head pointer looks kind of weird.

> + */
> +int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list)
> +{
> +	struct list_head res_list;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&res_list);
> +	INIT_LIST_HEAD(group_desc_list);
> +	ret = acpi_dev_get_resources(adev, &res_list,
> +		pinctrl_acpi_populate_group_desc, group_desc_list);
> +	if (ret < 0)
> +		return ret;
> +
> +	acpi_dev_free_resource_list(&res_list);
> +
> +	return 0;
> +}
> +
> +/**
> + * pinctrl_acpi_free_group_desc() - free allocated group descriptor

Get the capitalization consistent. Here you have 'free ..' above you
have 'Get ..'.

> + * @group_desc_list: list head for group descriptor to free
> + *
> + * Call this function to free the allocated group descriptors
> + */
> +void pinctrl_acpi_free_group_desc(struct list_head *group_desc_list)
> +{
> +	struct pinctrl_acpi_group_desc *grp, *tmp;
> +
> +	list_for_each_entry_safe(grp, tmp, group_desc_list, list) {
> +		list_del(&grp->list);
> +		kfree_const(grp->name);
> +		kfree(grp->pins);
> +		kfree(grp->vendor_data);
> +		kfree(grp);
> +	}
> +}
> diff --git a/drivers/pinctrl/pinctrl-acpi.h b/drivers/pinctrl/pinctrl-acpi.h
> new file mode 100644
> index 000000000000..e3a6b61bea90
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-acpi.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ACPI helpers for PinCtrl API
> + *
> + * Copyright (C) 2022 Linaro Ltd.
> + */
> +
> +/**
> + * struct pinctrl_acpi_group_desc - Descriptor to hold PinGroup resource from ACPI
> + * @name: name of the pin group
> + * @pins: array of pins that belong to the group
> + * @num_pins: number of pins in the group
> + * @vendor_data: vendor data from parsed ACPI resources
> + * @vendor_length: length of vendor data
> + * @list: list head for the descriptor
> + */
> +struct pinctrl_acpi_group_desc {
> +	const char *name;
> +	u16 *pins;
> +	unsigned int num_pins;

size_t?

npins intead of num_pins?

> +	u8 *vendor_data;

void *?

> +	unsigned int vendor_length;

size_t?

vendor_data_size perhaps?

> +	struct list_head list;
> +};
> +
> +#ifdef CONFIG_ACPI
> +int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list);
> +#else
> +static inline int pinctrl_acpi_get_pin_groups(struct acpi_device *adev,
> +			struct list_head *group_desc_list)
> +{
> +	return -ENXIO;
> +}
> +#endif
> -- 
> 2.25.1
