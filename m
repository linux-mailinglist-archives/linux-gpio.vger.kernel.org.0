Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D26C2EF384
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbhAHN4Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:56:25 -0500
Received: from mga04.intel.com ([192.55.52.120]:60934 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbhAHN4Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 08:56:25 -0500
IronPort-SDR: m9o5BIEI6jqaUe8iopAiO2Ti9hSaRjWIKVBBoHqdViJVZpwhmXDtfRg92OE6V717BaImQkicPt
 6Zyheail05Eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="175018357"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="175018357"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:55:44 -0800
IronPort-SDR: WVLjkAa0469ZD84Vmr7HfBitILcZcwP+RB0lmkPmlq4wlP/uzoCcLeuj9ZoebEo8x1KWD2+m95
 MADmlj35EkiA==
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="362337390"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:55:42 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kxsFw-006CqW-KN; Fri, 08 Jan 2021 15:56:44 +0200
Date:   Fri, 8 Jan 2021 15:56:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     sathyanarayanan.kuppuswamy@linux.intel.com, andy@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 -next] gpio: wcove: convert comma to semicolon
Message-ID: <20210108135644.GO4077@smile.fi.intel.com>
References: <20210108092413.19354-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108092413.19354-1-zhengyongjun3@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 08, 2021 at 05:24:13PM +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.

Pushed to my review and testing queue, thanks!

> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/gpio/gpio-wcove.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
> index b5fbba5a783a..97c5f1d01b62 100644
> --- a/drivers/gpio/gpio-wcove.c
> +++ b/drivers/gpio/gpio-wcove.c
> @@ -434,7 +434,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
>  	wg->chip.get_direction = wcove_gpio_get_direction;
>  	wg->chip.get = wcove_gpio_get;
>  	wg->chip.set = wcove_gpio_set;
> -	wg->chip.set_config = wcove_gpio_set_config,
> +	wg->chip.set_config = wcove_gpio_set_config;
>  	wg->chip.base = -1;
>  	wg->chip.ngpio = WCOVE_VGPIO_NUM;
>  	wg->chip.can_sleep = true;
> -- 
> 2.22.0
> 

-- 
With Best Regards,
Andy Shevchenko


