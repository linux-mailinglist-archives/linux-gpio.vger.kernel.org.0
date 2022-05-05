Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955AA51C6C0
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 20:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241847AbiEESMb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 14:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiEESMb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 14:12:31 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D4656404
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651774130; x=1683310130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L6vm4f9YX6al8JaaSmAgPS8weDlrSEoTZBShsix+KvU=;
  b=bFrGN07wp+O6TfsSBOihvEsIRRlW3/muWw218s33bxjzWQd+0/EMvEF/
   NWAtgF+liLE9CQVtpIFfXfGFYhbdWrJc4luYxWhYmUMaa4girCg8Qc2+g
   dkokid85r0ZIhXVOO3GcqJDVRIgimK5FClEv3HhjA/aJGzARwJeAsHil6
   YwVfTY5H/hxCPLhjOILW3bq+jQ2JZ2O5++iw6gToNOCPpBGT51BLHKVmZ
   muTcjkgbB/Gp8SVnP0BHaghgoipURwsShwWGAV6vMLvp1ZcFkgiFbDYiA
   ergXHZ1lZMQqjnnkbdUqjOz/c7RFyGhP6L6pp5aE8JDOUqjNUxdqpWjQj
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="255681468"
X-IronPort-AV: E=Sophos;i="5.91,202,1647327600"; 
   d="scan'208";a="255681468"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 11:08:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,202,1647327600"; 
   d="scan'208";a="811791637"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 11:08:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nmfu8-00CN8B-RT;
        Thu, 05 May 2022 21:08:44 +0300
Date:   Thu, 5 May 2022 21:08:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: Re: [PATCH] pinctrl: stm32: Fix up errorpath after merge
Message-ID: <YnQSrDfdjFRnMz+k@smile.fi.intel.com>
References: <20220505142837.165499-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505142837.165499-1-linus.walleij@linaro.org>
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

On Thu, May 05, 2022 at 04:28:37PM +0200, Linus Walleij wrote:
> When merging the for_each_gpiochip_node() changes, I made
> some mistakes by not disabling the clocks on the errorpath,
> fix it up.

At least this is what I found,

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

but I might have missed something, it would be nice if ST guys can look into
this as well.

> Fixes: a0912083086d ("Merge tag 'intel-gpio-v5.19-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into devel")
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/stm32/pinctrl-stm32.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 0f7d608151ff..88da8ac0b252 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1614,6 +1614,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
>  		ret = stm32_gpiolib_register_bank(pctl, child);
>  		if (ret) {
>  			fwnode_handle_put(child);
> +
> +			for (i = 0; i < pctl->nbanks; i++)
> +				clk_disable_unprepare(pctl->banks[i].clk);
> +
>  			return ret;
>  		}
>  
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


