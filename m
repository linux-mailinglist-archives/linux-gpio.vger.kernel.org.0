Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD00076BC68
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 20:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjHAS1J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 14:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjHAS1I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 14:27:08 -0400
Received: from mgamail.intel.com (unknown [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D513C00
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690914393; x=1722450393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mCrwHUUGwBbAfrl/g8bZJrYgNQGVr2K6yuAl6uAksu8=;
  b=C+i7lPktjceyuIwXIA6/84boEJF7J9fbA5xLHywK6MUwYkcIzRln02NU
   LLML3LcpUJmka0rZBmD+DlHNLMcaoEuTtoKwfKj6CYn67T3q9UI1Nxe/Y
   A7muGSF0EOdJIZWXeedpf+Ve5860YWeZkPqLKcCYR4Y5yIePQH4FRykqr
   DlfycZh6uBQ21tg3U+0DL8ZEKUHvZBbxWN7n1q1jJ00+3nVxMsV42kxle
   4Nsf1Y3GYwnxa3hs49FAy/hWpvr/5EGkLygIkwdxzADvdN7SJ8D6fkAaz
   g2sx7OIVNNrJjGvwaqzqQePq8Ae6DM+23ycj2fB8qpWR6KeRfGkMj5uVW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="435706177"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="435706177"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:25:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872167238"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2023 11:25:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQu3w-00EU5J-35;
        Tue, 01 Aug 2023 21:25:40 +0300
Date:   Tue, 1 Aug 2023 21:25:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     bartosz.golaszewski@linaro.org, linusw@kernel.org,
        kaloz@openwrt.org, khalasa@piap.pl, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, arnd@arndb.de
Subject: Re: [PATCH -next] gpio: ixp4xx: remove redundant of_match_ptr
Message-ID: <ZMlOJFcq5tR/Y+es@smile.fi.intel.com>
References: <20230801033457.220735-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801033457.220735-1-wangzhu9@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 01, 2023 at 11:34:57AM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here.

of_match_ptr()

(seems all commit messages need this fix)

> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr.

of_match_ptr()

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/gpio/gpio-ixp4xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
> index 1e29de1671d4..dde6cf3a5779 100644
> --- a/drivers/gpio/gpio-ixp4xx.c
> +++ b/drivers/gpio/gpio-ixp4xx.c
> @@ -302,7 +302,7 @@ static const struct of_device_id ixp4xx_gpio_of_match[] = {
>  static struct platform_driver ixp4xx_gpio_driver = {
>  	.driver = {
>  		.name		= "ixp4xx-gpio",
> -		.of_match_table = of_match_ptr(ixp4xx_gpio_of_match),
> +		.of_match_table = ixp4xx_gpio_of_match,
>  	},
>  	.probe = ixp4xx_gpio_probe,
>  };
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


