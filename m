Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F6732C7BF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355678AbhCDAcm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:42 -0500
Received: from mga01.intel.com ([192.55.52.88]:14620 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381256AbhCCOUN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Mar 2021 09:20:13 -0500
IronPort-SDR: 9/kd3Ev2llRq0e7STPkZMO1+gFE9rSvw2aSysCdWLuKcNmTtM/kgCORFzA8xFl8AS9qZZ3UyCm
 AkI2rVwwCIPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="206886538"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="206886538"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 06:08:37 -0800
IronPort-SDR: rMmN4KZ3fdmDZeDj8gNHlBwzYJ9ZVGaN8fzu6nNl3HjsxWFc+L8Ve36pbOYHuW3wIyTMbAQlyQ
 wXutivSG/f5A==
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="445283548"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 06:08:35 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lHSAy-009eRy-Td; Wed, 03 Mar 2021 16:08:32 +0200
Date:   Wed, 3 Mar 2021 16:08:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <YD+YYDcoYLxMrcYw@smile.fi.intel.com>
References: <20210303131858.3976-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303131858.3976-1-shawn.guo@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 03, 2021 at 09:18:58PM +0800, Shawn Guo wrote:
> In case of ACPI boot, GPIO core does the right thing to parse GPIO pin
> configs from ACPI table, and call into gpio_chip's .set_config hook for
> setting them up.  It enables such support on qcom platform by using
> generic config function, which in turn calls into .pin_config_set of
> pinconf for setting up hardware.  For qcom platform, it's possible to
> reuse pin group config functions for pin config hooks, because every pin
> is maintained as a single group.
> 
> This change fixes the problem that Touchpad of Lenovo Flex 5G laptop
> doesn't work with ACPI boot, because PullUp config of Touchpad GpioInt
> pin is not set up by the kernel.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v2:
> - Add pin config functions that simply call into group config ones.
> 
>  drivers/pinctrl/qcom/pinctrl-msm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index af6ed7f43058..a59bb4cbd97e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -489,10 +489,24 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  
> +static int msm_config_pin_get(struct pinctrl_dev *pctldev, unsigned int pin,
> +			      unsigned long *config)
> +{
> +	return msm_config_group_get(pctldev, pin, config);
> +}
> +
> +static int msm_config_pin_set(struct pinctrl_dev *pctldev, unsigned pin,
> +			      unsigned long *configs, unsigned num_configs)
> +{
> +	return msm_config_group_set(pctldev, pin, configs, num_configs);
> +}
> +
>  static const struct pinconf_ops msm_pinconf_ops = {
>  	.is_generic		= true,
>  	.pin_config_group_get	= msm_config_group_get,
>  	.pin_config_group_set	= msm_config_group_set,
> +	.pin_config_get		= msm_config_pin_get,
> +	.pin_config_set		= msm_config_pin_set,
>  };
>  
>  static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> @@ -717,6 +731,7 @@ static const struct gpio_chip msm_gpio_template = {
>  	.get_direction    = msm_gpio_get_direction,
>  	.get              = msm_gpio_get,
>  	.set              = msm_gpio_set,
> +	.set_config       = gpiochip_generic_config,
>  	.request          = gpiochip_generic_request,
>  	.free             = gpiochip_generic_free,
>  	.dbg_show         = msm_gpio_dbg_show,
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


