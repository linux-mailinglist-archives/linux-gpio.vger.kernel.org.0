Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50FD65EC4F0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 15:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiI0Nu7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 09:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbiI0Nu5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 09:50:57 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20370B4EA9
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664286652; x=1695822652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LRlGJSiJA8FwMCc5AEy3r+5DA/BnbT2ZSfV4ThjRBgQ=;
  b=dr+081gAO4Y7q05ujldTX5BqdA7HScfpJOg571WDvGaJaL/cYe4v+Bg4
   jJWCHldtdbnbs26cQ4GKvzC5DtLC5TjWkqKb+DarNbfCq9Qp8lNp+i+z6
   3g5axSaLPYCwGI6dE/V6yYu8kq5YuJSSjoE0g8iwRJdSNSh4PsMj2FNKO
   d4TMXtMJhnbTvXKk+sqr89qRzJvCa9xID11gW/xMtD0xMQnamD2HGBfaQ
   d9qo5ZTgei7ONamHtRlzEgvxaTf9XbOrphRNbY0+uEem8L5CUZiPvnmlC
   jhPm1tvWaZwa0FQpHNpiW9Ius/sRp8I7I1FZkNG1h535CQWO4YYPQY4lx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281038569"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="281038569"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 06:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="689996618"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="689996618"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2022 06:50:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1odAz2-008TIi-2q;
        Tue, 27 Sep 2022 16:50:48 +0300
Date:   Tue, 27 Sep 2022 16:50:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yuan Can <yuancan@huawei.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: bcm: Remove unused struct bcm6328_pingroup
Message-ID: <YzL/uFg8/SS/7f/C@smile.fi.intel.com>
References: <20220927133926.103943-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927133926.103943-1-yuancan@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 27, 2022 at 01:39:26PM +0000, Yuan Can wrote:
> After commit 0e3db16300fb("pinctrl: bcm: Convert drivers to use struct pingroup
> and PINCTRL_PINGROUP()"), no one use struct bcm6328_pingroup, so remove it.

Right, dunno how I missed it.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm6328.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6328.c b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
> index 1eef5ab9a5e5..1e8cc2c80c81 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm6328.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
> @@ -26,12 +26,6 @@
>  #define BCM6328_MUX_OTHER_REG	0x24
>  #define  BCM6328_MUX_MASK	GENMASK(1, 0)
>  
> -struct bcm6328_pingroup {
> -	const char *name;
> -	const unsigned * const pins;
> -	const unsigned num_pins;
> -};
> -
>  struct bcm6328_function {
>  	const char *name;
>  	const char * const *groups;
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


