Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65AC5538EBA
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 12:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245602AbiEaKVp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 06:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245586AbiEaKVp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 06:21:45 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE70213CCD
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653992503; x=1685528503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wbLSvwysW669OB5xF9mulnL8hCSbsXyDyDki45z/JVg=;
  b=dy2Dm3dxSsXTzAlcgwBLOmlBcLrrP5PZOjKThARzCJudYbhHS6vwOLL9
   +aPKuYO16L4LYvo0kzDt09SJJoDIBZmlx2/lp4EOLVUODQ3KQLKSd3amo
   egQRVxylwbiQHChMC71lKqOk6yqJ8bXQBtRBVeDIhWMibXijDVwjD++x8
   KGe4rIqL6JppxH/LMa8c7QLb4QMNNvm1fL42WRPTVGB1v2CbGheWRP3za
   ouETDl49HEI95XLRTfKjnb16V7SFYby28mUN7kGxhRL6Em4ZpzBFZJR2Y
   XOCDpvSgNtpYDShrVyPlmgbnJwTEa/z1n5ioC50JoaITy1AM0XjrZ0DmD
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="335870992"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="335870992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 03:21:43 -0700
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="754905905"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 03:21:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nvz0M-000Ph6-T6;
        Tue, 31 May 2022 13:21:38 +0300
Date:   Tue, 31 May 2022 13:21:38 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v3 2/6] pinctrl: amd: Remove amd_pingroup and use pingroup
Message-ID: <YpXsMjNuvoBqXENC@smile.fi.intel.com>
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
 <20220531084322.1310250-3-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531084322.1310250-3-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 31, 2022 at 02:13:18PM +0530, Basavaraj Natikar wrote:
> Remove 'struct amd_pingroup' and instead use 'struct pingroup'.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/pinctrl/pinctrl-amd.h | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
> index 1d4317073654..551dfa664ed8 100644
> --- a/drivers/pinctrl/pinctrl-amd.h
> +++ b/drivers/pinctrl/pinctrl-amd.h
> @@ -74,12 +74,6 @@
>  
>  #define CLR_INTR_STAT	0x1UL
>  
> -struct amd_pingroup {
> -	const char *name;
> -	const unsigned *pins;
> -	unsigned npins;
> -};
> -
>  struct amd_function {
>  	const char *name;
>  	const char * const *groups;
> @@ -90,7 +84,7 @@ struct amd_gpio {
>  	raw_spinlock_t          lock;
>  	void __iomem            *base;
>  
> -	const struct amd_pingroup *groups;
> +	const struct pingroup *groups;
>  	u32 ngroups;
>  	struct pinctrl_dev *pctrl;
>  	struct gpio_chip        gc;
> @@ -296,7 +290,7 @@ static const unsigned i2c3_pins[] = {19, 20};
>  static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
>  static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
>  
> -static const struct amd_pingroup kerncz_groups[] = {
> +static const struct pingroup kerncz_groups[] = {
>  	{
>  		.name = "i2c0",
>  		.pins = i2c0_pins,
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


