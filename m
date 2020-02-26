Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4EF1701AA
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2020 15:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgBZO5r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Feb 2020 09:57:47 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35976 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgBZO5r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Feb 2020 09:57:47 -0500
Received: by mail-pl1-f196.google.com with SMTP id a6so1393703plm.3;
        Wed, 26 Feb 2020 06:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MlX8TjCXEFXDS5ZumzpqtqrWFoT0F53pXcGUmNQPWF0=;
        b=GBrGCD48TWyk8MvyLueABpAr/AzBScOb+iIPr7OwoYTGqq1jBHOxtOVkDf3TVqw5wY
         Zt9Yct4+5ESB064Pj5WB7i+6UDu0ulrAljfGr/y0lHRaoHlPq7J6OWrO/NpDAs8VR2sg
         NCkmhBnfdGQPRUuRzMdKLFpW5t+QqYzs8mdFjUjNeO0ECHLms2uMiLEY+Ex1D5uIQCL5
         imaAELcWjjbPYcizudOh77PgoFHB2ngDcaMvDYff8VZaLkM3LAdRTHVVKXmOhJhwqZ1T
         +LYivyo4PIMPsc/63PodbguIfheGwl7zE02BV2LQkMwtPfqIFp1SDILf80EcFyMhGG1s
         dNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MlX8TjCXEFXDS5ZumzpqtqrWFoT0F53pXcGUmNQPWF0=;
        b=Og92SsQwXqQ79Nc9Clc1C6ycg9QUMYvdNIpOzwtVN98TP2oebnnbpFzz/xSmqqfIuW
         bZvkuG2k5vLc3ezhrC6EwUybu8DJ46piWdrVnurGEuylUPo6YeYxfdcC0eKeXBiH2Sp6
         TSnEbD2do8CSyqkZtx8y8Iy8CMaVbZ7ACMg2PlZ5P5uQ5azt0IsLrqfbTEleCMR6bJMz
         jNwuYkTCwgbkVcHy9xXZ4iUGoopbvMB00BiJNjC85X5kQd2gKmRcvNyPnGHDllj02OeB
         Mx1SYQ9g3iewBulLZyF871MxEcQAblICcJebIqfAg9SUjxBfHfPu6/fUt12W1BDXdGae
         D4pg==
X-Gm-Message-State: APjAAAUulKHNqx2T7IcbaVOwv+yVPh4YRrKuqR9y9Q7hkFT0iPLy0lgS
        vmMWXrMbEdLrHFlYetOYK3M=
X-Google-Smtp-Source: APXvYqz1TcmF8iDqIlsNM4nzWjZ+cypwfkDvQKTXBMqyYJSNIsdEH0nkJ5Zox3aLWFZ5mEP0csEHJQ==
X-Received: by 2002:a17:902:8a85:: with SMTP id p5mr4709387plo.154.1582729065962;
        Wed, 26 Feb 2020 06:57:45 -0800 (PST)
Received: from firefly (220-235-100-192.dyn.iinet.net.au. [220.235.100.192])
        by smtp.gmail.com with ESMTPSA id z10sm3019353pgj.73.2020.02.26.06.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 06:57:45 -0800 (PST)
Date:   Wed, 26 Feb 2020 14:57:33 +0000
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpiolib: fix bitmap operations related to line event
 watching
Message-ID: <20200226145733.GA2078@firefly>
References: <20200226135323.1840-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226135323.1840-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 26, 2020 at 02:53:23PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> When operating on the bits of watched_lines bitmap, we're using
> desc_to_gpio() which returns the GPIO number from the global numberspace.
> This leads to all sorts of memory corruptions and invalid behavior. We
> should switch to using gpio_chip_hwgpio() instead.
> 
> Fixes: 51c1064e82e7 ("gpiolib: add new ioctl() for monitoring changes in line info")
> Reported-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

That fixes all the failures I was seeing.

Tested-by: Kent Gibson <warthog618@gmail.com>

> ---
>  drivers/gpio/gpiolib.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a5cd1b4abe6f..5cc80f6f79e0 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1261,7 +1261,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  			return -EFAULT;
>  
>  		if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL)
> -			set_bit(desc_to_gpio(desc), priv->watched_lines);
> +			set_bit(gpio_chip_hwgpio(desc), priv->watched_lines);
>  
>  		return 0;
>  	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
> @@ -1276,7 +1276,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		if (IS_ERR(desc))
>  			return PTR_ERR(desc);
>  
> -		clear_bit(desc_to_gpio(desc), priv->watched_lines);
> +		clear_bit(gpio_chip_hwgpio(desc), priv->watched_lines);
>  		return 0;
>  	}
>  	return -EINVAL;
> @@ -1304,7 +1304,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
>  	struct gpio_desc *desc = data;
>  	int ret;
>  
> -	if (!test_bit(desc_to_gpio(desc), priv->watched_lines))
> +	if (!test_bit(gpio_chip_hwgpio(desc), priv->watched_lines))
>  		return NOTIFY_DONE;
>  
>  	memset(&chg, 0, sizeof(chg));
> -- 
> 2.25.0
> 
