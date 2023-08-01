Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF5476BC99
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 20:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjHASjS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 14:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjHASjM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 14:39:12 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9EC7B0
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690915148; x=1722451148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bfWCq7ExKXMXv2PbZilfYfl4ygxOD/3qJAo6fo/CDXg=;
  b=hb+qNMbaxuiPnI309sDG5ZD0ovKxMG5oy7TP+isc5zTYVSv4iHoOW3Mm
   fu0dLLuZunqEAyY1mp04S6ZB0l1te3PusvsJpN2H4C25M+/unZZ4DFEUK
   xKn8jjbeBeZiPjy4gxVnpuspKYb4J/ykHrboERx496XlcnE1Ur18YqhOR
   fqZ19vc4+VhqJIMPWnyQHgr96y2OVXeapM5H9Qt4BQhKVCRev6nPopJNJ
   +tGPuuS8QVqHS/4Z+ICgLtUG9yCf7LGij5g4NtwEtkc5d28DmyKkQITg8
   V78jeXjFp1PbFYSvkKib2eumUdgS6Xs8zw2XoJrcsWoDicPuuB5/CwPl6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="354308908"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="354308908"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="678757493"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="678757493"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 01 Aug 2023 11:39:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQuGt-00Ew5q-18;
        Tue, 01 Aug 2023 21:39:03 +0300
Date:   Tue, 1 Aug 2023 21:39:03 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        u.kleine-koenig@pengutronix.de, arnd@arndb.de
Subject: Re: [PATCH -next] gpio: max3191x: remove redundant of_match_ptr
Message-ID: <ZMlRR0+kZgIGqnj9@smile.fi.intel.com>
References: <20230801033610.221172-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801033610.221172-1-wangzhu9@huawei.com>
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

On Tue, Aug 01, 2023 at 11:36:10AM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use CONFIG_OF
> and of_match_ptr here, we remove them all.

of_match_ptr()

> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/gpio/gpio-max3191x.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
> index 161c4751c5f7..bbacc714632b 100644
> --- a/drivers/gpio/gpio-max3191x.c
> +++ b/drivers/gpio/gpio-max3191x.c
> @@ -457,7 +457,6 @@ static int __init max3191x_register_driver(struct spi_driver *sdrv)
>  	return spi_register_driver(sdrv);
>  }
>  
> -#ifdef CONFIG_OF
>  static const struct of_device_id max3191x_of_id[] = {
>  	{ .compatible = "maxim,max31910" },
>  	{ .compatible = "maxim,max31911" },
> @@ -468,7 +467,6 @@ static const struct of_device_id max3191x_of_id[] = {
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, max3191x_of_id);
> -#endif
>  
>  static const struct spi_device_id max3191x_spi_id[] = {
>  	{ "max31910" },
> @@ -484,7 +482,7 @@ MODULE_DEVICE_TABLE(spi, max3191x_spi_id);
>  static struct spi_driver max3191x_driver = {
>  	.driver = {
>  		.name		= "max3191x",
> -		.of_match_table	= of_match_ptr(max3191x_of_id),
> +		.of_match_table	= max3191x_of_id,
>  	},
>  	.probe	  = max3191x_probe,
>  	.remove	  = max3191x_remove,
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


