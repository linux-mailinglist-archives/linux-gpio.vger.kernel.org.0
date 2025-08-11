Return-Path: <linux-gpio+bounces-24147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BE0B205A6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 12:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 586AB18A2A5B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 10:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6217D2356CB;
	Mon, 11 Aug 2025 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQtUuk4A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A332253E9;
	Mon, 11 Aug 2025 10:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908490; cv=none; b=Yo89QJ5hPKsImS7R4wstvNXpySbXBg1PHHOmaTjepE91uHSpndYjK9B1vwtGp4Sj3WLdVcJxRaGRl5UjIw6tgSSs9ZU/SCWvlUSUnNA6d0ygUwqdGXtQoeEGdTZp6ttqXyuvNs2BFSGyjKqG6I5BTUKtbxWOtEHRsnNoEdG9W2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908490; c=relaxed/simple;
	bh=1vlHv6Px1eYLtdGgu2Ty/fXv2MFPBY2XO+bhllMxoks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nw+HCkgdzK/AtWrDUYIcqr/w3nfBGHfY7AWm6B0bV25819YCvBzAs6pWIU380MbRDeW2jKJnKHnz8JCVEJqhCkpcIZPRjAZbCjKroYID2MmNLz/2d7o1FPT379LaoZGCV7wtcd+YqlXpyCLwLMrE7U5xovexxKK/nD53ztTKbxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQtUuk4A; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-556fd896c99so3606839e87.3;
        Mon, 11 Aug 2025 03:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754908486; x=1755513286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVkeBhGZWokh7cmfvwm/viK0uMUshY/NRCF71JVFH+o=;
        b=LQtUuk4ASV7qxG96nkJ4MyHWPBVWArTNQ4L/JS2w6tD70xLmG/feZZdmAFhNKNusnr
         Jiq+OfaR5izUcifmRxf7eO6szwADzxaEsGxWtc4CbLvDyvLQSC+I1qk5UhSYcV+cP0z/
         BKwSHveMmPyeSXT66tGkMIO9IdVIQjxAIhWx3t9V3+x5P7HfjUX2RcqPk7pwI+s9w0be
         Ij2ECeF1c9j1+97NFZUgK9Ykbal0vmy6gm70YEiVFxf4tjf766CtNTnETFKkTuVM638m
         hZ3n2QR9wXz1aVHSq7q8A2vfbk7MVqxDNrWRNi7QQCO+BdwU8bk40xK88f98WMBWRwOE
         Xwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908486; x=1755513286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVkeBhGZWokh7cmfvwm/viK0uMUshY/NRCF71JVFH+o=;
        b=MjTJUBkbg37Gr9jYXOOLBktiI7oYWb8j/8WLQD6fNoMeOjKJw0ivN4L/TUsPO9aOA8
         frTGK1Fd0GvRAAEEbbdPHas8Bhdu1P5drdLpZmjQudacoNXRaqguy/2aNRgGBx2iHqg+
         zzh8HHukQbeablBphp9SG9E5DfRYtaWhA1TdH/UFIJ2pznFHIDgbB0+3DoFxZ0Jtbgks
         zC7BboKzrWO7WST4smUM8pOskH+jbkd/oZ1h4AxlHGuWqBfOtwW9HF79RCtA8Dkv34mM
         Qn6yV/m70SlE6m5lK55bYJhyo+urY6apEwCjhQUNoX3W3Va/1h8OTVBCwF129ZyPbUR9
         ZCxg==
X-Forwarded-Encrypted: i=1; AJvYcCVWbowag0p/R4YXuoLZufezcRfIaSQ+gT1FbRLcaIf94kvMDGAU+RoBGgIPXpxsQ/X4tTjuTG5rz3Sn@vger.kernel.org, AJvYcCWJb+J58C9jspBagVdDq3m+ojzAmGS3dpumgcx11G6DzFpdmcOkpQNKJvixS4WDPKLVhs883nTk6ITUk0tB@vger.kernel.org, AJvYcCWzAjJkyaEuTWZYrgNmcR657ElQTA0lUumQyhcg1NJJIKgI5BY/kBbqUOgGQLjTj8ZWvT8UA18PTPL7ZWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj4mIXMlE039h6o1xo5uhFb0vwt+DwOcN9p3WpjS7di9TR7p+7
	KQ3oPoiCt3Wejx2iWLKU9FR9V0j5TyzEYjf3WWkrdhORMpTYMZuBa5e3
X-Gm-Gg: ASbGnctusntBsd12bgnctRuF/cuDUNv8sWN1RRZ+dwbUGu3jP8Q5OGwC/GuWy6je7I5
	kBGjQx8elLgEJjAm0uWsUVez/lIMCkqibpYmbUi6ICiF9zzHRZXQMtMJYE5qUDW9yD/9f6rrQoO
	WkrUDZi68xHzem01YjlJDml2VFKu2JWfWvoQjhNOoxjrSl+u3LpRHenEQQjvoqdWsmtHabRaXWo
	mw17aaqfL9d7SYEof4erctMbPwVjnROuVBmZfrCvPDn1X/sJi32J1HTfTIc4T3bbH0o2qkCfOeL
	bdtEBuDxlHcmb8PRwPhIavds8ReQ4u64jLiHsDm78r42BIK6xqgUZETt5iWjfKzEpwCXmpfJAoG
	GnZpzXuHW0E6odypvKT0LjKIG1LBIsZ6I9SWmK8T6crCTSb/2HVzwJZv2Cwj4uvGJLwKMHe5fM8
	90WRs=
X-Google-Smtp-Source: AGHT+IETaLJYFx+bsfg4cBqsGAjrcijmy8/Ov+YfnKtp2jsr35IKM/ta5BmKJDpDCoMgIaYs24JBIQ==
X-Received: by 2002:a05:6512:3f02:b0:55c:bfe7:f045 with SMTP id 2adb3069b0e04-55cc0112fbemr2937187e87.40.1754908485923;
        Mon, 11 Aug 2025 03:34:45 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cd1000bf3sm665504e87.6.2025.08.11.03.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:34:45 -0700 (PDT)
Message-ID: <b7e97aa3-8f2d-4a59-8a38-577717404865@gmail.com>
Date: Mon, 11 Aug 2025 13:34:43 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] input: gpio-keys: make legacy gpiolib optional
To: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-10-arnd@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250808151822.536879-10-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi dee Ho peeps,

On 08/08/2025 18:17, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most users of gpio-keys and gpio-keys-polled use modern gpiolib
> interfaces, but there are still number of ancient sh, arm32 and x86
> machines that have never been converted.
> 
> Add an #ifdef block for the parts of the driver that are only
> used on those legacy machines.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/input/keyboard/gpio_keys.c        | 5 +++--
>   drivers/input/keyboard/gpio_keys_polled.c | 2 ++
>   drivers/mfd/rohm-bd71828.c                | 2 ++
>   drivers/mfd/rohm-bd718x7.c                | 2 ++
>   include/linux/gpio_keys.h                 | 2 ++
>   5 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> index f9db86da0818..984b20f773ed 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -528,6 +528,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>   			 */
>   			bdata->gpiod = NULL;
>   		}
> +#ifdef CONFIG_GPIOLIB_LEGACY
>   	} else if (gpio_is_valid(button->gpio)) {
>   		/*
>   		 * Legacy GPIO number, so request the GPIO here and
> @@ -546,6 +547,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>   
>   		if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
>   			gpiod_toggle_active_low(bdata->gpiod);
> +#endif
>   	}
>   
>   	if (bdata->gpiod) {
> @@ -583,8 +585,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>   			if (irq < 0) {
>   				error = irq;
>   				dev_err_probe(dev, error,
> -					      "Unable to get irq number for GPIO %d\n",
> -					      button->gpio);
> +					      "Unable to get irq number for GPIO\n");
>   				return error;
>   			}
>   			bdata->irq = irq;
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index e6707d72210e..0ae0e53910ea 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -301,6 +301,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>   				return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
>   						     "failed to get gpio\n");
>   			}
> +#ifdef CONFIG_GPIOLIB_LEGACY
>   		} else if (gpio_is_valid(button->gpio)) {
>   			/*
>   			 * Legacy GPIO number so request the GPIO here and
> @@ -323,6 +324,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>   
>   			if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
>   				gpiod_toggle_active_low(bdata->gpiod);
> +#endif
>   		}
>   
>   		bdata->last_state = -1;
> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> index a14b7aa69c3c..fb68694fadca 100644
> --- a/drivers/mfd/rohm-bd71828.c
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -21,7 +21,9 @@
>   
>   static struct gpio_keys_button button = {
>   	.code = KEY_POWER,
> +#ifdef CONFIG_GPIOLIB_LEGACY
>   	.gpio = -1,
> +#endif
>   	.type = EV_KEY,
>   };
>   
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index 25e494a93d48..6c99ab62e31b 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -20,7 +20,9 @@
>   
>   static struct gpio_keys_button button = {
>   	.code = KEY_POWER,
> +#ifdef CONFIG_GPIOLIB_LEGACY
>   	.gpio = -1,
> +#endif
>   	.type = EV_KEY,
>   };
>   
> diff --git a/include/linux/gpio_keys.h b/include/linux/gpio_keys.h
> index 80fa930b04c6..e8d6dc290efb 100644
> --- a/include/linux/gpio_keys.h
> +++ b/include/linux/gpio_keys.h
> @@ -25,7 +25,9 @@ struct device;
>    */
>   struct gpio_keys_button {
>   	unsigned int code;
> +#ifdef CONFIG_GPIOLIB_LEGACY
>   	int gpio;
> +#endif
>   	int active_low;
>   	const char *desc;
>   	unsigned int type;

AFAIR, these ROHM PMICs (bd718[15, 27, 28, 37, 47, 50, 78, 85]) all 
provide a 'button IRQ', from a power button. (Or, couple of IRQs but 
let's skip the details) The gpio-keys is used to send the KEY_POWER 
event when IRQ is detected.

The IRQ comes from the PMIC, and the regmap_irq chip provided by the MFD 
provides it. This IRQ information is delivered to the gpio-keys from the 
MFD driver via platform data. That's basically what these "button" 
structs are here for. No GPIO line information (only the IRQ number) is 
needed to be delivered to the gpio-keys. This problematic assignment:

 > +#ifdef CONFIG_GPIOLIB_LEGACY
 >   	.gpio = -1,
 > +#endif

is only needed to invalidate the gpio information so that the gpio-keys 
wont use it, only the IRQ.

As such, this patch seems Ok to me, you can treat this as an ack :) 
This, however made me ponder following - is this the tight way to handle 
the power-button IRQ? I don't see any other MFD devices doing this in 
same way, although I am pretty sure there are other PMICs with similar 
power-button IRQ...

I see for example the "drivers/mfd/rt5120.c" to invoke 
"drivers/input/misc/rt5120-pwrkey.c" instead of using the gpio-keys. 
This, however, feels like code duplication to me. I'd rather kept using 
the gpio-keys, but seeing:

git grep KEY_POWER drivers/mfd/
drivers/mfd/rohm-bd71828.c:     .code = KEY_POWER,
drivers/mfd/rohm-bd718x7.c:     .code = KEY_POWER,

makes me wonder if there is more widely used (better) way?

Yours,
	-- Matti

