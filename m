Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECCAD2CA963
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 18:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbgLARSG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 12:18:06 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39700 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgLARSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 12:18:05 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1HGS3L057029;
        Tue, 1 Dec 2020 11:16:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606842988;
        bh=+/8lyXJJSu5/Re7ayYkj7yhn8aeSYzNq7g4xT2/NVsA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XMEB5Oj/IwmUbjJy9aZhp0MCc1eaaEKQxm932voUeK3Rw8UeeOwx+s8G8EpSkghMO
         ayNED+3GwBBQ/A5LJ1jQFhZ253SdsUXRUjKXsg/wClZ34aiQYqq8PK9FBz47K08F+/
         2xKvxifkGZanE8S0NHy5pkmrtSiZQfSUyhhz7Wm8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1HGSk7067916
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Dec 2020 11:16:28 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 11:16:27 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 11:16:28 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1HGLcl125971;
        Tue, 1 Dec 2020 11:16:24 -0600
Subject: Re: [PATCH] gpiolib: do not print err message for EPROBE_DEFER
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20201118142917.25752-1-grygorii.strashko@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <69388132-1a81-e222-76fc-5d3b860a2d53@ti.com>
Date:   Tue, 1 Dec 2020 19:16:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118142917.25752-1-grygorii.strashko@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

hi Bartosz, All,

On 18/11/2020 16:29, Grygorii Strashko wrote:
> The gpiochip may have dependencies from pinmux and so got deferred. Now it
> will print error message every time -EPROBE_DEFER is returned which is
> unnecessary:
> 
> "gpiochip_add_data_with_key: GPIOs 0..31 (gpio-0-31) failed to register, -517"
> 
> Hence, do suppress error message for -EPROBE_DEFER case.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>   drivers/gpio/gpiolib.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 089ddcaa9bc6..fd2c503a6aab 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -771,9 +771,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   	ida_free(&gpio_ida, gdev->id);
>   err_free_gdev:
>   	/* failures here can mean systems won't boot... */
> -	pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
> -	       gdev->base, gdev->base + gdev->ngpio - 1,
> -	       gc->label ? : "generic", ret);
> +	if (ret != -EPROBE_DEFER) {
> +		pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
> +		       gdev->base, gdev->base + gdev->ngpio - 1,
> +		       gc->label ? : "generic", ret);
> +	}
>   	kfree(gdev);
>   	return ret;
>   }
> 

Any comments for this patch?

Note. Modern dev_err_probe() seems can't be used as gpio_chip->parent is not guaranteed to be set and
it's not clear if chip_err() still can be used at this stage.

-- 
Best regards,
grygorii
