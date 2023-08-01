Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AAD076BCE7
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 20:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjHASsX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 14:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjHASsV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 14:48:21 -0400
Received: from mgamail.intel.com (unknown [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E67EE71
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 11:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690915700; x=1722451700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aPt77yLkqS6JjM1ZZWVk1MwLy8UheVYTLU8B9n6+fO4=;
  b=SoONTX5rz5K0eiWrgdSr2GP1mivkbY5hKCSfidcG1plmz1Hi8S28tnUN
   Yn/LBQlbcwrKgoWRQjpZruqLIcAzA8jcfwMfciGAXQR+8IC78XA6gOJmM
   z7oHaMlK+XikVKYCwUpRUpRbJrU8uIn+nWEWRPNZesD+iSzGo+BUj0h51
   GzW/XqvwZF5uBVblpvGTgr9VkqN9tHoFLm7QDF56s5atsv/hp0XqC4F8b
   2BM8Cszw8OAh9cb6JnVawoLFdGK+htmkvosoXQGWHdPgizYZFyrF03HnH
   LuXNPGQ6G+NdIACyjb5lwt3+qszvRshBpU/IqOGIRvMJ79v17xFdZQJDs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359429302"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="359429302"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="818900179"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="818900179"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Aug 2023 11:48:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQuPm-00FFBD-0G;
        Tue, 01 Aug 2023 21:48:14 +0300
Date:   Tue, 1 Aug 2023 21:48:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, florian.fainelli@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        u.kleine-koenig@pengutronix.de, arnd@arndb.de
Subject: Re: [PATCH -next] gpio: raspberrypi-exp: remove redundant
 of_match_ptr
Message-ID: <ZMlTbZD77rhB8GXB@smile.fi.intel.com>
References: <20230801033632.221318-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801033632.221318-1-wangzhu9@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 01, 2023 at 11:36:32AM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here, and __maybe_unused can also be removed.

of_match_ptr()

> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/gpio/gpio-raspberrypi-exp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
> index ecb0d3800dfe..9d1b95e429f1 100644
> --- a/drivers/gpio/gpio-raspberrypi-exp.c
> +++ b/drivers/gpio/gpio-raspberrypi-exp.c
> @@ -234,7 +234,7 @@ static int rpi_exp_gpio_probe(struct platform_device *pdev)
>  	return devm_gpiochip_add_data(dev, &rpi_gpio->gc, rpi_gpio);
>  }
>  
> -static const struct of_device_id rpi_exp_gpio_ids[] __maybe_unused = {
> +static const struct of_device_id rpi_exp_gpio_ids[] = {
>  	{ .compatible = "raspberrypi,firmware-gpio" },
>  	{ }
>  };
> @@ -243,7 +243,7 @@ MODULE_DEVICE_TABLE(of, rpi_exp_gpio_ids);
>  static struct platform_driver rpi_exp_gpio_driver = {
>  	.driver	= {
>  		.name		= MODULE_NAME,
> -		.of_match_table	= of_match_ptr(rpi_exp_gpio_ids),
> +		.of_match_table	= rpi_exp_gpio_ids,
>  	},
>  	.probe	= rpi_exp_gpio_probe,
>  };
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


