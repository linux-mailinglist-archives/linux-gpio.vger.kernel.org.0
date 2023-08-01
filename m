Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FF776BD1A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 20:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjHAS6R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 14:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbjHAS5u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 14:57:50 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D2B2D5B
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690916250; x=1722452250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fGy8bm7D5klIo4PGKyHEvNLxwisQcK6ZiisCICiVjKE=;
  b=KRNjaMew6JT6YUbQmHxbj5D9OqP6FbuzV0Fg8BAxmN0kDr8/+x9mG7fJ
   QSNq9SitYXh6VJdACYbrt8EirhKH0uhR9lGWgF0nvoHepVkrfH8SwverN
   lhMJ54fBKIbt+XqeWqLc+anonVBPZ90c2bntytT7JT29kJmY+bZhiyGdH
   IeN321vmCG8Ce4sz8QNWHR8VRPQzEhz2Gj81JJjFsDi9ynG6dqh534IZQ
   jsbqNnLZBPyQDzZSb0LtdYvrV1vPmJzB7wLmq/L/FxRo9QM2dkT/FP7Nh
   mWWXfawSwyj+EG5YJmLvu4/L9V4uv+dREhD/ttnXxZSVGKyIKqAd37M5B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="354313281"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="354313281"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="722580040"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="722580040"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 01 Aug 2023 11:57:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQuYf-00FY6c-2v;
        Tue, 01 Aug 2023 21:57:25 +0300
Date:   Tue, 1 Aug 2023 21:57:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, arnd@arndb.de
Subject: Re: [PATCH -next] gpio: tps65218: remove redundant of_match_ptr
Message-ID: <ZMlVlRdAPfUmhxUU@smile.fi.intel.com>
References: <20230801033647.221417-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801033647.221417-1-wangzhu9@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 01, 2023 at 11:36:47AM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here.

of_match_ptr()

> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr.

of_match_ptr()

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/gpio/gpio-tps65218.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
> index e1d425a18854..da51aa5578eb 100644
> --- a/drivers/gpio/gpio-tps65218.c
> +++ b/drivers/gpio/gpio-tps65218.c
> @@ -216,7 +216,7 @@ MODULE_DEVICE_TABLE(platform, tps65218_gpio_id_table);
>  static struct platform_driver tps65218_gpio_driver = {
>  	.driver = {
>  		.name = "tps65218-gpio",
> -		.of_match_table = of_match_ptr(tps65218_dt_match)
> +		.of_match_table = tps65218_dt_match
>  	},
>  	.probe = tps65218_gpio_probe,
>  	.id_table = tps65218_gpio_id_table,
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


