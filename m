Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51EAF328118
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 15:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236395AbhCAOih (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 09:38:37 -0500
Received: from mga06.intel.com ([134.134.136.31]:22794 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233264AbhCAOig (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 09:38:36 -0500
IronPort-SDR: Wd0ijbrmPt4JxAWOQ1raTU08WQNppXZyN3RrTnQ/w55BmnVGwdF9bXeBJ+mlPPUvTnfzItaDaw
 bzX8DyxWXPGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="247889529"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="247889529"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 06:37:55 -0800
IronPort-SDR: duW0D+KerDngZSEWaMz1H6+yPmTqevBEpwMX5zXxrbnHdOB9wCJZ4ECUCRMzQ+Jluq29ekvKFh
 Hv9oRYrNQxoQ==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="397752865"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 06:37:53 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lGjgE-009A1z-R8; Mon, 01 Mar 2021 16:37:50 +0200
Date:   Mon, 1 Mar 2021 16:37:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: sc8180x: add ACPI probe support
Message-ID: <YDz8PtFy8PpdUlSF@smile.fi.intel.com>
References: <20210301014329.30104-1-shawn.guo@linaro.org>
 <20210301014329.30104-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301014329.30104-3-shawn.guo@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 01, 2021 at 09:43:29AM +0800, Shawn Guo wrote:
> It adds ACPI probe support with tile offsets passed over to msm core
> driver via sc8180x_tile_offsets, as TLMM is described a single memory
> region in ACPI DSDT.

...

>  config PINCTRL_SC8180X
>  	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
> -	depends on GPIOLIB && OF
> +	depends on GPIOLIB && (OF || ACPI)

Can you consider dropping OF dependency completely?

> +#include <linux/acpi.h>

No use of this header, see below.

(Perhaps you meant mod_devicetable.h)

...

> +static const u32 sc8180x_tile_offsets[] = {
> +	0x00d00000,
> +	0x00500000,
> +	0x00100000

Leave comma here.

> +};

...

> +static const int sc8180x_acpi_reserved_gpios[] = {
> +	0, 1, 2, 3,
> +	47, 48, 49, 50,
> +	126, 127, 128, 129,

> +	-1

-1?
Is it kinda terminator?

> +};

...

> +	if (pdev->dev.of_node) {
> +		ret = msm_pinctrl_probe(pdev, &sc8180x_pinctrl);
> +	} else if (has_acpi_companion(&pdev->dev)) {
> +		ret = msm_pinctrl_probe(pdev, &sc8180x_acpi_pinctrl);
> +	} else {
> +		dev_err(&pdev->dev, "DT and ACPI disabled\n");
> +		ret = -EINVAL;
> +	}

Use driver_data field for this and device_get_match_data() instead of above.

...

> +#ifdef CONFIG_ACPI

Drop this ugly ifdeffery.

> +static const struct acpi_device_id sc8180x_pinctrl_acpi_match[] = {
> +	{ "QCOM040D"},

> +	{ },

No comma for terminator line.

> +};
> +MODULE_DEVICE_TABLE(acpi, sc8180x_pinctrl_acpi_match);
> +#endif

...

> +		.acpi_match_table = ACPI_PTR(sc8180x_pinctrl_acpi_match),

No ACPI_PTR(), please.

-- 
With Best Regards,
Andy Shevchenko


