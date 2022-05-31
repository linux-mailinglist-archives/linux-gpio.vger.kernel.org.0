Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3476A538EBB
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 12:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbiEaKWU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 06:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245586AbiEaKWT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 06:22:19 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3DE6CF7F
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 03:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653992538; x=1685528538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gMEiE+xuR2gR6YqQA4OkfVOv58humlQiZECp+laJ0Xw=;
  b=EUPNx+4GEZ3QIsElR/S87z4HLdI0tdrVwQA8yMh9AIDKuGTKEyMncB5f
   wBd/nYRiElyBQJo4NeeQn67Pa91ioW54BWTLVAyfpTtF/bwWTErHCXvU3
   i7SwVmIfmceO+cAMnRNUWg4Pb1AOtPU0dWb9lfn9chs5MRhHjmD7evFZX
   GD6p4ntB8kKBgaxTBJTradrdd02gHwHih0l0fLEmhhl46GYBcyujM2zW3
   rh4hQ64lu4sDQiSyviEUWV38Prelusk7dmeMloqRdFquvYVTNzk06bdlE
   0D7sFfquojVDB3UiFxWNZUnPbsHmHJaXNXB/ia5iPisG3WHrho6Edf9+l
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="274936820"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="274936820"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 03:22:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="562260336"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 03:22:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nvz0v-000PhE-FV;
        Tue, 31 May 2022 13:22:13 +0300
Date:   Tue, 31 May 2022 13:22:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v3 3/6] pinctrl: amd: Use PINCTRL_GRP to manage pingroups
Message-ID: <YpXsVSBt89N5BwfB@smile.fi.intel.com>
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
 <20220531084322.1310250-4-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531084322.1310250-4-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 31, 2022 at 02:13:19PM +0530, Basavaraj Natikar wrote:
> AMD pingroup can be extended to support multi-function pins.
> Hence use PINCTRL_GRP to manage and represent larger number
> of pingroups inline.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(with comments addressed in patch 1 and this one changed accordingly)

> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/pinctrl/pinctrl-amd.h | 36 ++++++-----------------------------
>  1 file changed, 6 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
> index 551dfa664ed8..d47217e7b39f 100644
> --- a/drivers/pinctrl/pinctrl-amd.h
> +++ b/drivers/pinctrl/pinctrl-amd.h
> @@ -291,36 +291,12 @@ static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
>  static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
>  
>  static const struct pingroup kerncz_groups[] = {
> -	{
> -		.name = "i2c0",
> -		.pins = i2c0_pins,
> -		.npins = 2,
> -	},
> -	{
> -		.name = "i2c1",
> -		.pins = i2c1_pins,
> -		.npins = 2,
> -	},
> -	{
> -		.name = "i2c2",
> -		.pins = i2c2_pins,
> -		.npins = 2,
> -	},
> -	{
> -		.name = "i2c3",
> -		.pins = i2c3_pins,
> -		.npins = 2,
> -	},
> -	{
> -		.name = "uart0",
> -		.pins = uart0_pins,
> -		.npins = 5,
> -	},
> -	{
> -		.name = "uart1",
> -		.pins = uart1_pins,
> -		.npins = 5,
> -	},
> +	PINCTRL_GRP("i2c0", i2c0_pins, 2),
> +	PINCTRL_GRP("i2c1", i2c1_pins, 2),
> +	PINCTRL_GRP("i2c2", i2c2_pins, 2),
> +	PINCTRL_GRP("i2c3", i2c3_pins, 2),
> +	PINCTRL_GRP("uart0", uart0_pins, 5),
> +	PINCTRL_GRP("uart1", uart1_pins, 5),
>  };
>  
>  #endif
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


