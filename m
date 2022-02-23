Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2694C15DB
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 15:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241765AbiBWOzx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 09:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbiBWOzw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 09:55:52 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4217B65E9;
        Wed, 23 Feb 2022 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645628124; x=1677164124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jkRovkJ6QP8AO69ssnnU9UZf7FSInyYDDl+0NztrCx0=;
  b=b+qpJtuRYkbeLhjQxVi9Bx7s06jps6ZZlCHsMPDdBBnwTuP6DopWSK8t
   YCWhVomA/efr90yEmjCIHXTevMGu06GSdx1qdWpAn19J9mIp86QJSzFEV
   SgzvkcnD609PabidqyE4ElyhT6FBBVbY3HP5XSB6bB8ysvwgj8NEUpoFz
   p059Z1x1D+cxn8SvPxbK2Ia12jAOufxbRRQaU+Kp1It+A2BVEx14dm4uZ
   r4TX0dngZJyVmPJTvsxGwwhsl0Lo6TmY898RcFX72SBbd00xxoOiHvxLN
   I2aoyYB7yVHFiSUamQV7AjvniYtKOP0fLBHgQa4wW45819+baAYdxYgjt
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="251898888"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="251898888"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:55:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="628106829"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:55:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nMt2F-007Ssi-CK;
        Wed, 23 Feb 2022 16:54:31 +0200
Date:   Wed, 23 Feb 2022 16:54:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/5] pinctrl: baytrail: Add pinconf group + function for
 the pmu_clk
Message-ID: <YhZKpw+DpC1OImBB@smile.fi.intel.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223133153.730337-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 23, 2022 at 02:31:49PM +0100, Hans de Goede wrote:
> On the Lenovo Yoga Tablet 2 830 / 1050 / 1051 models the 32KHz PMU clk,
> which can be muxed externally to SUS pin 5 and/or 6 is used as a clock
> for the audio codec.
> 
> On the 830 and 1050 models, with ship with Android as factory OS the
> pin-muxing for this is not setup by the BIOS.
> 
> Add a pinconf group + function for the pmu_clk on SUS pin 5 and 6 to
> allow setting the pinmux up from within the x86-android-tablets
> platform code.

With nit-pick addressed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 7ae71152b480..fec888c1cd05 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -444,6 +444,9 @@ static const unsigned int byt_sus_pcu_spi_pins[] = { 21 };
>  static const unsigned int byt_sus_pcu_spi_mode_values[] = { 0 };
>  static const unsigned int byt_sus_pcu_spi_gpio_mode_values[] = { 1 };
>  
> +static const unsigned int byt_sus_pmu_clk1_pins[] = { 5 };
> +static const unsigned int byt_sus_pmu_clk2_pins[] = { 6 };
> +
>  static const struct intel_pingroup byt_sus_groups[] = {
>  	PIN_GROUP("usb_oc_grp", byt_sus_usb_over_current_pins, byt_sus_usb_over_current_mode_values),
>  	PIN_GROUP("usb_ulpi_grp", byt_sus_usb_ulpi_pins, byt_sus_usb_ulpi_mode_values),
> @@ -451,20 +454,26 @@ static const struct intel_pingroup byt_sus_groups[] = {
>  	PIN_GROUP("usb_oc_grp_gpio", byt_sus_usb_over_current_pins, byt_sus_usb_over_current_gpio_mode_values),
>  	PIN_GROUP("usb_ulpi_grp_gpio", byt_sus_usb_ulpi_pins, byt_sus_usb_ulpi_gpio_mode_values),
>  	PIN_GROUP("pcu_spi_grp_gpio", byt_sus_pcu_spi_pins, byt_sus_pcu_spi_gpio_mode_values),
> +	PIN_GROUP("pmu_clk1_grp", byt_sus_pmu_clk1_pins, 1),
> +	PIN_GROUP("pmu_clk2_grp", byt_sus_pmu_clk2_pins, 1),
>  };
>  
>  static const char * const byt_sus_usb_groups[] = {
>  	"usb_oc_grp", "usb_ulpi_grp",
>  };
>  static const char * const byt_sus_spi_groups[] = { "pcu_spi_grp" };
> +static const char * const byt_sus_pmu_clk_groups[] = {
> +	"pmu_clk1_grp", "pmu_clk2_grp" };

}; on new line.

>  static const char * const byt_sus_gpio_groups[] = {
>  	"usb_oc_grp_gpio", "usb_ulpi_grp_gpio", "pcu_spi_grp_gpio",
> +	"pmu_clk1_grp", "pmu_clk2_grp",
>  };
>  
>  static const struct intel_function byt_sus_functions[] = {
>  	FUNCTION("usb", byt_sus_usb_groups),
>  	FUNCTION("spi", byt_sus_spi_groups),
>  	FUNCTION("gpio", byt_sus_gpio_groups),
> +	FUNCTION("pmu_clk", byt_sus_pmu_clk_groups),
>  };
>  
>  static const struct intel_community byt_sus_communities[] = {
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


