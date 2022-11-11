Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADC80625A4E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 13:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbiKKMLk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 07:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbiKKMLj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 07:11:39 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77BAF48
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 04:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668168698; x=1699704698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sWKcei3kecknEtYyF/7dtxYbGgfy+C70Rj2bQStS91A=;
  b=H3nPWE6mC6dmVKJRUATfZRmKgyiIwBKgeQNXtxxLx6I+ULUSTng0IHJ2
   J/ZBsM2UftyXYXJ2iMjpxjEpSES3VnXQVYyTcXaiGSpwWea6VmLlZgbEi
   6URY5Ydsbs3MrNO72J3O2WugIrYIW6MO2BiQfaUMK8dsgUI1ssOJWemic
   Mzpv5X9IDhnbgujnbrdb0VqOP0QBWQcArzSPTgsmPjYWRj5D8FdJ6YeXr
   6P57FSh1TMPyL1czkW9HNtRSrmP8tTK2bI6bmuj9eMoDym9vlipFA3PS2
   0up1zgXAqNZo7EgJIYN03kk3vTTq2/kJk/hocpiivs+85U9czIZyqfGzj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="375847613"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="375847613"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 04:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="966804671"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="966804671"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 11 Nov 2022 04:11:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E5E69155; Fri, 11 Nov 2022 14:12:00 +0200 (EET)
Date:   Fri, 11 Nov 2022 14:12:00 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC 1/3] pinctrl: add support for acpi PinGroup resource
Message-ID: <Y248EAY7hshSWM7w@black.fi.intel.com>
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
 <20221110191258.1134378-2-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110191258.1134378-2-niyas.sait@linaro.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 10, 2022 at 07:12:56PM +0000, Niyas Sait wrote:
> pinctrl-acpi parses and decode PinGroup resources for
> the device and generate list of group descriptor.
> Descriptors can be used by the pin controller to identify
> the groups and pins provided in the group.
> 
> Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
> ---
>  drivers/pinctrl/Makefile       |  1 +
>  drivers/pinctrl/pinctrl-acpi.c | 59 ++++++++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-acpi.h | 22 +++++++++++++
>  3 files changed, 82 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-acpi.c
>  create mode 100644 drivers/pinctrl/pinctrl-acpi.h
> 
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index e76f5cdc64b0..0b0ec4080942 100644
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
> index 000000000000..75e59fe22387
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-acpi.c
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 Linaro Ltd.
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
> +
> +	if (ares->type != ACPI_RESOURCE_TYPE_PIN_GROUP)
> +		return 1;
> +
> +	ares_pin_group = &ares->data.pin_group;
> +
> +	desc = kzalloc(sizeof(struct pinctrl_acpi_group_desc), GFP_KERNEL);
> +	if (!desc)
> +		return -ENOMEM;
> +
> +	desc->name = kstrdup_const(ares_pin_group->resource_label.string_ptr, GFP_KERNEL);
> +	desc->pins = ares_pin_group->pin_table;
> +	desc->num_pins = ares_pin_group->pin_table_length;
> +	desc->vendor_data = ares_pin_group->vendor_data;
> +	desc->vendor_length = ares_pin_group->vendor_length;
> +
> +	INIT_LIST_HEAD(&desc->list);
> +	list_add(&desc->list, group_desc_list);
> +
> +	return 1;
> +}
> +
> +/* Get list of acpi pin groups definitions for the controller */

Use proper kernel-doc here.

Also who is responsible of releasing the thing and how it is done?

> +int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list)
> +{
> +	struct list_head res_list;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&res_list);
> +	INIT_LIST_HEAD(group_desc_list);
> +
> +	ret = acpi_dev_get_resources(adev, &res_list,
> +								 pinctrl_acpi_populate_group_desc,
> +								 group_desc_list);

The formatting is wrong here.

> +	if (ret < 0)
> +		return ret;
> +
> +	acpi_dev_free_resource_list(&res_list);
> +

Drop the empty line.

> +	return 0;
> +}
> diff --git a/drivers/pinctrl/pinctrl-acpi.h b/drivers/pinctrl/pinctrl-acpi.h
> new file mode 100644
> index 000000000000..1a0c751a7594
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-acpi.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 Linaro Ltd.
> + */
> +

kernel-doc here too.

> +struct pinctrl_acpi_group_desc {
> +	const char *name;
> +	short unsigned int *pins;
> +	unsigned num_pins;
> +	void *vendor_data;
> +	unsigned vendor_length;
> +	struct list_head list;
> +};
> +
> +#ifdef CONFIG_ACPI
> +int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list);
> +#else
> +int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list)

This needs to be static inline.

> +{
> +	return -ENODEV;

-ENXIO?

> +}
> +#endif
> -- 
> 2.25.1
