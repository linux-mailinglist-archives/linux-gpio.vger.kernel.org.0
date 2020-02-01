Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B0B14FA6F
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Feb 2020 20:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgBATwh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Feb 2020 14:52:37 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36247 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgBATwg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Feb 2020 14:52:36 -0500
Received: by mail-pl1-f195.google.com with SMTP id a6so4191003plm.3;
        Sat, 01 Feb 2020 11:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nEFNNblRqNpKNPo8t2U8tuWeN09OcfldVwvSHwZN258=;
        b=Py6xERYcgrEQ0+UOFqTKxqkRbxm4BWMvKqC1AUuwiW7UzcVX9pzLHsqDdovZdkoZid
         wD6kUbAs/PQEj96s3eUjbquhlNY4diSqMWoBAyxVtYBkOxRAcoQ7a2CRkSpkk+UgqRG9
         Kw1VMmf+73rRUnGHgPu8/W362IRS1lWZgqlcOfoGcSmtmHAvuOtRg+F9tEZKiNLFcyky
         Y3CAQ2bhFEYQceMLcFH9ervOTNSFH78Zmcvsi/ZwE1Zt0GMYTji6viri+0nI3G2qGK4r
         30S96itKsi+lAysQhpoGKjSdWjr980V6mQyf1qqQSDrbU44yKoqE6xlysidta3E2E5oJ
         rAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=nEFNNblRqNpKNPo8t2U8tuWeN09OcfldVwvSHwZN258=;
        b=TlJSUs/p7k6eK0S74/tTtFYcXI2Ebk3NilXcM3Va+TF+eccc60UkPKLxXF1RAKTFb/
         A4vpQvMA0ZNQtgn86YnjRLJxmBGU2s3/HxjmdfQ9KNXfXDD5Qae/knQoPvwLGlIbkzdU
         +d1vf7Z5jf+XFxcK4vUI9jGusk22W0CaA9vaKexMXI8i6V+Z9lJBpO7XHJ3weDKZNpHI
         00PO4J39n4yMTo60y4lzv9P3K3EM+7RsUMjo+va9Ko0h2P5TOG7C7RMkCdqwA1tDcWML
         jkHEIi1cwOYSDET16pty2VOmxg49XYM9NAL2iSkMUZkuQHAfiOZZTQthjvfzG5koeLv9
         IKyA==
X-Gm-Message-State: APjAAAWrLreYw8WAVq4Xf4RvmWzGoQu9j9R85sqB99zSXZatciEZ0UqS
        YlY4tfhad8XUe3bbYZ2soWA=
X-Google-Smtp-Source: APXvYqzCM3uWw5SVuutahEAugjcnROlQqItwLliiieP4i6E/BALocpEjNvhe7tx1KRCV8JtpGPIwhw==
X-Received: by 2002:a17:902:a617:: with SMTP id u23mr16064477plq.20.1580586754578;
        Sat, 01 Feb 2020 11:52:34 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q8sm14623513pgg.92.2020.02.01.11.52.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2020 11:52:33 -0800 (PST)
Date:   Sat, 1 Feb 2020 11:52:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 02/13] gpiolib: have a single place of calling
 set_config()
Message-ID: <20200201195232.GA17364@roeck-us.net>
References: <20191224120709.18247-1-brgl@bgdev.pl>
 <20191224120709.18247-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224120709.18247-3-brgl@bgdev.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 01:06:58PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Instead of calling the gpiochip's set_config() callback directly and
> checking its existence every time - just add a new routine that performs
> this check internally. Call it in gpio_set_config() and
> gpiod_set_transitory(). Also call it in gpiod_set_debounce() and drop
> the check for chip->set() as it's irrelevant to this config option.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This patch made it into mainline, even though a regression was reported
against it by Geert. Please note that it is not just a theoretic problem
but _does_ indeed cause regressions.

Guenter

> ---
>  drivers/gpio/gpiolib.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e5d101ee9ada..616e431039fc 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3042,6 +3042,15 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
>   * rely on gpio_request() having been called beforehand.
>   */
>  
> +static int gpio_do_set_config(struct gpio_chip *gc, unsigned int offset,
> +			      enum pin_config_param mode)
> +{
> +	if (!gc->set_config)
> +		return -ENOTSUPP;
> +
> +	return gc->set_config(gc, offset, mode);
> +}
> +
>  static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
>  			   enum pin_config_param mode)
>  {
> @@ -3060,7 +3069,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
>  	}
>  
>  	config = PIN_CONF_PACKED(mode, arg);
> -	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
> +	return gpio_do_set_config(gc, offset, mode);
>  }
>  
>  static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
> @@ -3294,15 +3303,9 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>  
>  	VALIDATE_DESC(desc);
>  	chip = desc->gdev->chip;
> -	if (!chip->set || !chip->set_config) {
> -		gpiod_dbg(desc,
> -			  "%s: missing set() or set_config() operations\n",
> -			  __func__);
> -		return -ENOTSUPP;
> -	}
>  
>  	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, debounce);
> -	return chip->set_config(chip, gpio_chip_hwgpio(desc), config);
> +	return gpio_do_set_config(chip, gpio_chip_hwgpio(desc), config);
>  }
>  EXPORT_SYMBOL_GPL(gpiod_set_debounce);
>  
> @@ -3339,7 +3342,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
>  	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
>  					  !transitory);
>  	gpio = gpio_chip_hwgpio(desc);
> -	rc = chip->set_config(chip, gpio, packed);
> +	rc = gpio_do_set_config(chip, gpio, packed);
>  	if (rc == -ENOTSUPP) {
>  		dev_dbg(&desc->gdev->dev, "Persistence not supported for GPIO %d\n",
>  				gpio);
