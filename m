Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCED53A2B5
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350994AbiFAKgN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiFAKgN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:36:13 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A41E7CB75
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654079772; x=1685615772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=212dU3GhJM0TKiyg30q4dgKNOZGv3dfFtv3Zm986f3E=;
  b=Uv5LnMeN1bUe6eMUISPssFVEy/4/5sMsEN1wmHr3Znh+bZ5G0YdrbOyn
   8W+5I//ZzPF//609gobIzT3mACy9Th8b2znmOLJY4Q0svw+aIHHzjYCeV
   eAv05T+nOy+Agj6k4pNr1Yu0uVA3nusZTjoPb671fJYZGl+mczGjzF6fC
   7eyczFTw8lVtGZ2W79VS+K+/aMzxtkFDprbGEKWoKgAWM89/GI8Q/mNgB
   iKZW9a9JPHF2MMC+e1Oq78x6GFdBY+0ZKxaveLF1mICw9PS6LH7oi9DA3
   aCtZtZ1mw4pxjgnk5RQEG47M71Z0XwWtpStP3FFevdR7G39HvJCN/J7eJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="273109617"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="273109617"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:36:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="680035401"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:36:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nwLhw-000QYj-3d;
        Wed, 01 Jun 2022 13:36:08 +0300
Date:   Wed, 1 Jun 2022 13:36:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v4 4/6] pinctrl: amd: Define and use AMD_PINS macro
Message-ID: <YpdBF7gDHWOAkI1r@smile.fi.intel.com>
References: <20220601100214.828595-1-Basavaraj.Natikar@amd.com>
 <20220601100214.828595-5-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601100214.828595-5-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 01, 2022 at 03:32:12PM +0530, Basavaraj Natikar wrote:
> AMD pingroup can be extended to support multi-function pins.
> Hence define and use a macro "AMD_PINS" to represent larger
> number of pins.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/pinctrl/pinctrl-amd.h | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
> index ac3ebfaadb7e..be74fb106fa7 100644
> --- a/drivers/pinctrl/pinctrl-amd.h
> +++ b/drivers/pinctrl/pinctrl-amd.h
> @@ -282,21 +282,14 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
>  	PINCTRL_PIN(183, "GPIO_183"),
>  };
>  
> -static const unsigned i2c0_pins[] = {145, 146};
> -static const unsigned i2c1_pins[] = {147, 148};
> -static const unsigned i2c2_pins[] = {113, 114};
> -static const unsigned i2c3_pins[] = {19, 20};
> -
> -static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
> -static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
> -
> +#define AMD_PINS(...) ((const unsigned int []){__VA_ARGS__})
>  static const struct pingroup kerncz_groups[] = {
> -	PINCTRL_PINGROUP("i2c0", i2c0_pins, 2),
> -	PINCTRL_PINGROUP("i2c1", i2c1_pins, 2),
> -	PINCTRL_PINGROUP("i2c2", i2c2_pins, 2),
> -	PINCTRL_PINGROUP("i2c3", i2c3_pins, 2),
> -	PINCTRL_PINGROUP("uart0", uart0_pins, 5),
> -	PINCTRL_PINGROUP("uart1", uart1_pins, 5),
> +	PINCTRL_PINGROUP("i2c0", AMD_PINS(145, 146), 2),
> +	PINCTRL_PINGROUP("i2c1", AMD_PINS(147, 148), 2),
> +	PINCTRL_PINGROUP("i2c2", AMD_PINS(113, 114), 2),
> +	PINCTRL_PINGROUP("i2c3", AMD_PINS(19, 20), 2),
> +	PINCTRL_PINGROUP("uart0", AMD_PINS(135, 136, 137, 138, 139), 5),
> +	PINCTRL_PINGROUP("uart1", AMD_PINS(140, 141, 142, 143, 144), 5),
>  };
>  
>  #endif
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


