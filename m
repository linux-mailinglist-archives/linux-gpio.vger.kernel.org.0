Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D727DFEF6
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 06:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjKCF5s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 01:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjKCF5s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 01:57:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C69018E;
        Thu,  2 Nov 2023 22:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698991062; x=1730527062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nIH8a3I05QjeWYShgTeqgrqQswhk+kQYWZvX+TJYrGs=;
  b=ljzsOIwoSUz6bTk1w9zBwf3O3O5v+eCh9UcZnr02vFmfTw5qU3hHHaBf
   OW1c6mvF2nxPglGbhIQCHWZqSBMF88BStRZuCmp2pmBlQppkRqHCQtzoj
   +fweKLBDXBEOaHYIOkWTXc7FpNQA5DV89PE7wBl8FpoUn/OATAQZUaGVm
   8mWIob2yiLNXCbL3UtKoelOocvXzb7wT3WfFvkZ5KqpLr88Ya7BdAh2k+
   qYgExEGR9heYZAB4K5kcJh2+1jwREmU2I/VFChA4/LSKV+QurzWzheDiF
   XK7L1djIsdB6SDJC6fHb6esc9XOdh+0YQCcs9iV2lpUqADd6KI2rsXLpA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1758557"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1758557"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 22:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="831934900"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="831934900"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2023 22:57:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2C29F2A6; Fri,  3 Nov 2023 07:57:38 +0200 (EET)
Date:   Fri, 3 Nov 2023 07:57:38 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/3] pinctrl: intel: Add a generic Intel pin control
 platform driver
Message-ID: <20231103055738.GO17433@black.fi.intel.com>
References: <20231030141034.3241674-1-andriy.shevchenko@linux.intel.com>
 <20231030141034.3241674-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231030141034.3241674-3-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 30, 2023 at 04:10:33PM +0200, Andy Shevchenko wrote:
> New generations of Intel platforms will provide better description
> of the pin control devices in the ACPI tables. Hence, we may provide
> a generic pin control platform driver to cover all of them.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/Kconfig                 |   8 +
>  drivers/pinctrl/intel/Makefile                |   1 +
>  .../pinctrl/intel/pinctrl-intel-platform.c    | 223 ++++++++++++++++++
>  3 files changed, 232 insertions(+)
>  create mode 100644 drivers/pinctrl/intel/pinctrl-intel-platform.c
> 
> diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
> index d66f4f6932d8..42a6bc8b7a45 100644
> --- a/drivers/pinctrl/intel/Kconfig
> +++ b/drivers/pinctrl/intel/Kconfig
> @@ -37,6 +37,14 @@ config PINCTRL_INTEL
>  	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
>  
> +config PINCTRL_INTEL_PLATFORM
> +	tristate "Intel pinctrl and GPIO platform driver"
> +	depends on ACPI
> +	select PINCTRL_INTEL
> +	help
> +	  This pinctrl driver provides an interface that allows configuring
> +	  of Intel PCH pins and using them as GPIOs.

Add here some description that explains why this needs to be enabled,
for example for Lunar Lake. Now it is all too generic for distro folks
to understand if this is needed or not.

> +
>  config PINCTRL_ALDERLAKE
>  	tristate "Intel Alder Lake pinctrl and GPIO driver"
>  	select PINCTRL_INTEL
> diff --git a/drivers/pinctrl/intel/Makefile b/drivers/pinctrl/intel/Makefile
> index f6d30f2d973a..96c93ed4bd58 100644
> --- a/drivers/pinctrl/intel/Makefile
> +++ b/drivers/pinctrl/intel/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_PINCTRL_TANGIER)		+= pinctrl-tangier.o
>  obj-$(CONFIG_PINCTRL_MERRIFIELD)	+= pinctrl-merrifield.o
>  obj-$(CONFIG_PINCTRL_MOOREFIELD)	+= pinctrl-moorefield.o
>  obj-$(CONFIG_PINCTRL_INTEL)		+= pinctrl-intel.o
> +obj-$(CONFIG_PINCTRL_INTEL_PLATFORM)	+= pinctrl-intel-platform.o
>  obj-$(CONFIG_PINCTRL_ALDERLAKE)		+= pinctrl-alderlake.o
>  obj-$(CONFIG_PINCTRL_BROXTON)		+= pinctrl-broxton.o
>  obj-$(CONFIG_PINCTRL_CANNONLAKE)	+= pinctrl-cannonlake.o
> diff --git a/drivers/pinctrl/intel/pinctrl-intel-platform.c b/drivers/pinctrl/intel/pinctrl-intel-platform.c
> new file mode 100644
> index 000000000000..2305d8befdd3
> --- /dev/null
> +++ b/drivers/pinctrl/intel/pinctrl-intel-platform.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Intel PCH pinctrl/GPIO driver
> + *
> + * Copyright (C) 2021-2023, Intel Corporation

That's 2023

> + * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/property.h>
> +#include <linux/string_helpers.h>
> +
> +#include <linux/pinctrl/pinctrl.h>
> +
> +#include "pinctrl-intel.h"
> +
> +struct intel_platform_pins {
> +	struct pinctrl_pin_desc *pins;
> +	size_t npins;
> +};
> +
> +static int intel_platform_pinctrl_prepare_pins(struct device *dev, size_t base,
> +					       const char *name, u32 size,
> +					       struct intel_platform_pins *pins)
> +{
> +	struct pinctrl_pin_desc *descs;
> +	char **pin_names;
> +	unsigned int i;
> +
> +	pin_names = devm_kasprintf_strarray(dev, name, size);
> +	if (IS_ERR(pin_names))
> +		return PTR_ERR(pin_names);
> +
> +	descs = devm_krealloc_array(dev, pins->pins, base + size, sizeof(*descs), GFP_KERNEL);
> +	if (!descs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < size; i++) {
> +		unsigned int pin_number = base + i;
> +		char *pin_name = pin_names[i];
> +		struct pinctrl_pin_desc *desc;
> +
> +		/* Unify delimiter for pin name */
> +		strreplace(pin_name, '-', '_');
> +
> +		desc = &descs[pin_number];
> +		desc->number = pin_number;
> +		desc->name = pin_name;
> +	}
> +
> +	pins->pins = descs;
> +	pins->npins = base + size;
> +
> +	return 0;
> +}
> +
> +static int intel_platform_pinctrl_prepare_group(struct device *dev,
> +						struct fwnode_handle *child,
> +						struct intel_padgroup *gpp,
> +						struct intel_platform_pins *pins)
> +{
> +	size_t base = pins->npins;
> +	const char *name;
> +	u32 size;
> +	int ret;
> +
> +	ret = fwnode_property_read_string(child, "intc-gpio-group-name", &name);
> +	if (ret)
> +		return ret;
> +
> +	ret = fwnode_property_read_u32(child, "intc-gpio-pad-count", &size);
> +	if (ret)
> +		return ret;
> +
> +	ret = intel_platform_pinctrl_prepare_pins(dev, base, name, size, pins);
> +	if (ret)
> +		return ret;
> +
> +	gpp->base = base;
> +	gpp->size = size;
> +	gpp->gpio_base = INTEL_GPIO_BASE_MATCH;
> +
> +	return 0;
> +}
> +
> +static int intel_platform_pinctrl_prepare_community(struct device *dev,
> +						    struct intel_community *community,
> +						    struct intel_platform_pins *pins)
> +{
> +	struct fwnode_handle *child;
> +	struct intel_padgroup *gpps;
> +	unsigned int group;
> +	size_t ngpps;
> +	u32 offset;
> +	int ret;
> +
> +	ret = device_property_read_u32(dev, "intc-gpio-pad-ownership-offset", &offset);
> +	if (ret)
> +		return ret;
> +	community->padown_offset = offset;
> +
> +	ret = device_property_read_u32(dev, "intc-gpio-pad-configuration-lock-offset", &offset);
> +	if (ret)
> +		return ret;
> +	community->padcfglock_offset = offset;
> +
> +	ret = device_property_read_u32(dev, "intc-gpio-host-software-pad-ownership-offset", &offset);
> +	if (ret)
> +		return ret;
> +	community->hostown_offset = offset;
> +
> +	ret = device_property_read_u32(dev, "intc-gpio-gpi-interrupt-status-offset", &offset);
> +	if (ret)
> +		return ret;
> +	community->is_offset = offset;
> +
> +	ret = device_property_read_u32(dev, "intc-gpio-gpi-interrupt-enable-offset", &offset);
> +	if (ret)
> +		return ret;
> +	community->ie_offset = offset;
> +
> +	ngpps = device_get_child_node_count(dev);
> +	if (ngpps == 0)

if (!nggps)

> +		return -ENODEV;
> +
> +	gpps = devm_kcalloc(dev, ngpps, sizeof(*gpps), GFP_KERNEL);
> +	if (!gpps)
> +		return -ENOMEM;
> +
> +	group = 0;
> +	device_for_each_child_node(dev, child) {
> +		struct intel_padgroup *gpp = &gpps[group];
> +
> +		gpp->reg_num = group;
> +
> +		ret = intel_platform_pinctrl_prepare_group(dev, child, gpp, pins);
> +		if (ret)
> +			return ret;
> +
> +		group++;
> +	}
> +
> +	community->ngpps = ngpps;
> +	community->gpps = gpps;
> +
> +	return 0;
> +}
> +
> +static int intel_platform_pinctrl_prepare_soc_data(struct device *dev,
> +						   struct intel_pinctrl_soc_data *data)
> +{
> +	struct intel_platform_pins pins = {};
> +	struct intel_community *communities;
> +	size_t ncommunities;
> +	unsigned int i;
> +	int ret;
> +
> +	ncommunities = 1,

Why this is 1? Can't we have more communities?

> +	communities = devm_kcalloc(dev, ncommunities, sizeof(*communities), GFP_KERNEL);
> +	if (!communities)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ncommunities; i++) {
> +		struct intel_community *community = &communities[i];
> +
> +		community->barno = i;
> +		community->pin_base = pins.npins;
> +
> +		ret = intel_platform_pinctrl_prepare_community(dev, community, &pins);
> +		if (ret)
> +			return ret;
> +
> +		community->npins = pins.npins - community->pin_base;
> +	}
> +
> +	data->ncommunities = ncommunities;
> +	data->communities = communities;
> +
> +	data->npins = pins.npins;
> +	data->pins = pins.pins;
> +
> +	return 0;
> +}
> +
> +static int intel_platform_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct intel_pinctrl_soc_data *data;


Change the ordering of the above:

	struct intel_pinctrl_soc_data *data;
	struct device *dev = &pdev->dev;

> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = intel_platform_pinctrl_prepare_soc_data(dev, data);
> +	if (ret)
> +		return ret;
> +
> +	return intel_pinctrl_probe(pdev, data);
> +}
> +
> +static const struct acpi_device_id intel_platform_pinctrl_acpi_match[] = {
> +	{ }

And add the _CID here in this patch as I commented in the last patch.

> +};
> +MODULE_DEVICE_TABLE(acpi, intel_platform_pinctrl_acpi_match);
> +
> +static struct platform_driver intel_platform_pinctrl_driver = {
> +	.probe = intel_platform_pinctrl_probe,
> +	.driver = {
> +		.name = "intel-pinctrl",
> +		.acpi_match_table = intel_platform_pinctrl_acpi_match,
> +		.pm = pm_sleep_ptr(&intel_pinctrl_pm_ops),
> +	},
> +};
> +module_platform_driver(intel_platform_pinctrl_driver);
> +
> +MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
> +MODULE_DESCRIPTION("Intel PCH pinctrl/GPIO driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS(PINCTRL_INTEL);
> -- 
> 2.40.0.1.gaa8946217a0b
