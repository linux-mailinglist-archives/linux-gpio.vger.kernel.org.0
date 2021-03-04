Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541B332D379
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 13:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhCDMpi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 07:45:38 -0500
Received: from mga11.intel.com ([192.55.52.93]:47931 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231137AbhCDMpI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 07:45:08 -0500
IronPort-SDR: R6GDCNphcnaCXJBGYx9fQ9Yv/rn/gnykpS49hosqaBfry6zs3z4FHFC5fOW+Oj5dBXZjmojIjP
 eXITA5nQGgWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="184033151"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="184033151"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:44:27 -0800
IronPort-SDR: p8FUAs55UNOmZL36JMANYGjyBuIIbwaK2V3JuQTGsgOX6OkkStHw4kfbyVFvzlLQy37qqfS5S1
 GpYDBv+ka6gQ==
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="400593532"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:44:26 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lHnL5-009sSg-NZ; Thu, 04 Mar 2021 14:44:23 +0200
Date:   Thu, 4 Mar 2021 14:44:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: sc8180x: add ACPI probe support
Message-ID: <YEDWJ5XhvB2VdoJT@smile.fi.intel.com>
References: <20210304060520.24975-1-shawn.guo@linaro.org>
 <20210304060520.24975-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304060520.24975-3-shawn.guo@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 02:05:20PM +0800, Shawn Guo wrote:
> It adds ACPI probe support for pinctrl-sc8180x driver.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/pinctrl/qcom/Kconfig           |  2 +-
>  drivers/pinctrl/qcom/pinctrl-sc8180x.c | 39 ++++++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 6853a896c476..9f0218c4f9b3 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -222,7 +222,7 @@ config PINCTRL_SC7280
>  
>  config PINCTRL_SC8180X
>  	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
> -	depends on GPIOLIB && OF
> +	depends on GPIOLIB && (OF || ACPI)
>  	select PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
> index 66f76ed22200..45ecb4a022ca 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
> @@ -1546,6 +1546,13 @@ static const struct msm_pingroup sc8180x_groups[] = {
>  	[193] = SDC_QDSD_PINGROUP(sdc2_data, 0x4b2000, 9, 0),
>  };
>  
> +static const int sc8180x_acpi_reserved_gpios[] = {
> +	0, 1, 2, 3,
> +	47, 48, 49, 50,
> +	126, 127, 128, 129,
> +	-1 /* terminator */
> +};

Wondering if this is converted to valid_mask at some point?

>  static const struct msm_gpio_wakeirq_map sc8180x_pdc_map[] = {
>  	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 }, { 12, 104 },
>  	{ 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 }, { 30, 39 }, { 36, 43 },
> @@ -1575,13 +1582,40 @@ static struct msm_pinctrl_soc_data sc8180x_pinctrl = {
>  	.nwakeirq_map = ARRAY_SIZE(sc8180x_pdc_map),
>  };
>  
> +static const struct msm_pinctrl_soc_data sc8180x_acpi_pinctrl = {
> +	.pins = sc8180x_pins,
> +	.npins = ARRAY_SIZE(sc8180x_pins),
> +	.groups = sc8180x_groups,
> +	.ngroups = ARRAY_SIZE(sc8180x_groups),
> +	.reserved_gpios = sc8180x_acpi_reserved_gpios,
> +	.ngpios = 191,
> +};
> +
>  static int sc8180x_pinctrl_probe(struct platform_device *pdev)
>  {
> -	return msm_pinctrl_probe(pdev, &sc8180x_pinctrl);
> +	const struct msm_pinctrl_soc_data *soc_data;
> +
> +	soc_data = device_get_match_data(&pdev->dev);

#include <linux/property.h>

> +	if (!soc_data)
> +		return -EINVAL;
> +
> +	return msm_pinctrl_probe(pdev, soc_data);
>  }
>  
> +static const struct acpi_device_id sc8180x_pinctrl_acpi_match[] = {

#include <linux/mod_devicetable.h>

> +	{
> +		.id = "QCOM040D",
> +		.driver_data = (kernel_ulong_t) &sc8180x_acpi_pinctrl,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, sc8180x_pinctrl_acpi_match);
> +
>  static const struct of_device_id sc8180x_pinctrl_of_match[] = {
> -	{ .compatible = "qcom,sc8180x-tlmm", },
> +	{
> +		.compatible = "qcom,sc8180x-tlmm",
> +		.data = &sc8180x_pinctrl,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, sc8180x_pinctrl_of_match);
> @@ -1590,6 +1624,7 @@ static struct platform_driver sc8180x_pinctrl_driver = {
>  	.driver = {
>  		.name = "sc8180x-pinctrl",
>  		.of_match_table = sc8180x_pinctrl_of_match,
> +		.acpi_match_table = sc8180x_pinctrl_acpi_match,
>  	},
>  	.probe = sc8180x_pinctrl_probe,
>  	.remove = msm_pinctrl_remove,
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


