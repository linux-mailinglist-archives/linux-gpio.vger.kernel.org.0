Return-Path: <linux-gpio+bounces-17376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C9A59608
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 14:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E06E83A83EE
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDDA22A1F1;
	Mon, 10 Mar 2025 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="filiGp9+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6BC227E8F;
	Mon, 10 Mar 2025 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612816; cv=none; b=uLmLsAjPKFr+4JTrPI71wAV2OhJ7sn6pDXPzJGWsHwy/29PiP9So2za61F25/mBGDidyI6WhfL9Lz60B1XuQBhOZ2yaXNSYqt7aES0dnHFDzEifRJVtniJf/11aLtr/c2YQKBwscUc6mlDsPzCKdgbEudREO6oXx5O3BvhPZtZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612816; c=relaxed/simple;
	bh=2AHxYwcyOZBFHgTfNokaRNt0i2/xdNHTQ7pLuqe2Xh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgS5wrycCgK2lK/mSNmkEVhNADYxhr1lRwL6HIfuDvs8kRylRmxBuCRqo/gECftY7zFSpD7WMQyCNflsRpfM/sF5mqfNlGxs9urlNk9ahPlomGBbDs7Fh4G+sqQOeWHLNpFPCsGxl3EOI215znxGfqAvuiVcL/SRx8td24+kkxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=filiGp9+; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso25455351fa.3;
        Mon, 10 Mar 2025 06:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741612812; x=1742217612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uIN9qnJPxF5d49Ai441xtWm1lqpAVaRoxtSwVCRC5ZE=;
        b=filiGp9+xzlHum3ErH0AIIDBE27e6UdZgG/MA20QntA3LgVDrj1SX1N1evJ3WGq7C4
         kRPE5FY20XFHtEwRALOuAy70J8gHUZmF17ETWlagNVzh/OlNvFdnRF0k+F2M1kPRq2BR
         ytzgsgcrSzeY3YcCBfDNXpH7UUieCPOpBWoFNnchv1hf9/w6ELi+DUc0sAu3hmJAHDOx
         jLxJLXbwcuUH0PvimKn34WEOnOXT9YgkKwqiSyJEFuYnakkYbLtGR1MeI/9q3Z24i0Nh
         MMDr/JHUuHV47Uee9bczLLbBL+6D1eMsfMxjLUuf4/B/q1xLqLAJtdZMsDEucZnl9DvE
         xFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612812; x=1742217612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIN9qnJPxF5d49Ai441xtWm1lqpAVaRoxtSwVCRC5ZE=;
        b=JIa5mJ1LmzpWT2a2vjN8MKp6Mr9ra4dbom1KSmfWNCkj7GJ1IM3RCKTWlloEQ5y6mL
         xK0BlaA4Nt2wnzsyMaxewByA7bGJ0jNClCwBt5E7XlhIuLj6cSN+9hVOml2WfTOkMGsP
         uFu7ud+IYxCHbriMoJwiL4qWmbUIxIDp41vK21IS2lSffUS+g6xx25ARGlJjb3Q71xv/
         wP2+DyGT/0L6UM7I3OgbgWMxN4TSsK+K2gSCz4YWYbeMnkSV3BIfLt3sNuPGh+V5xVmv
         Rcru7C7kEKiPSp7IKSwuYQRAOuunyeycUG4U140WNJkJj6fefDMjeXUPBoYpWr5BQ7Y+
         zgww==
X-Forwarded-Encrypted: i=1; AJvYcCVDUz7oePTIkYS2F8lk2Qmza8d/ElnxVUQjTrq/JnEifSPH5iZLBdHjolBANoyK9qfgKFOE9X+6fTJED6M=@vger.kernel.org, AJvYcCVGspokqkWDhbIPCiXTsPp2RgByF2ORnBKPyeQ/+vLlFyECMeqyR+H7OFbCYikFVNKdeKQ+VrnZRCCEDtNR1+roFkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrz+DSIIxM3K+ljhgzo3ZE/MELgv8fJ3+WnwnZGpu8I50PZ7AT
	oWgLUVb+sxfnIJkWqwouLWPMktyshoBQccAcNupvYTIqmamY+Yv4
X-Gm-Gg: ASbGncv+/DKgLjaJqxVQ4nyk64U2WBL87+b4Nmyfl3tvfDkYxqvsxZrPeO7C3IW+AES
	e9w8ENCiHMf21mZSgHRskI3P+d7aiP/7NmeLrcdJwM0OMbpgf8df9hvWwvT8+RbxS89ov4mmIJ4
	J5cxASrFXsmMNaVBNBYX/nASRx3bX2r5yBpBxXSGP5Kll2DcXB0dF0w8Hj0CRexA2dJWNl7wnPG
	R0pWT/j+ydtiTXpqHA//CLd8NG6BXGe5QEHhia6Yygtg/Vtyw2Tq0h/j6qpmbVDcVwHSMIbmBJY
	CPoj72smfvWRHuNv6+Eh0LlNQB4GK77/Wxwf2InK+8iBgqcBDNN6zXNf6TV+ZCKxu1aKTgckU9/
	Hfr5GKTS6JsF5qFhv7j5f3UlNqg==
X-Google-Smtp-Source: AGHT+IEF1Q5OiufZ1ooC9SoR2jkBeuL8mpXvsPLmTBTbXNvs5wA77q8kyDlOtMByfhSrkrTpiQUACA==
X-Received: by 2002:a05:651c:19a1:b0:307:9555:dc5e with SMTP id 38308e7fff4ca-30bf44ed6d8mr42550331fa.3.1741612812228;
        Mon, 10 Mar 2025 06:20:12 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c13a0e20asm4133221fa.49.2025.03.10.06.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 06:20:11 -0700 (PDT)
Message-ID: <475375c9-9d72-4583-a21e-37b17c6b8c46@gmail.com>
Date: Mon, 10 Mar 2025 15:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] gpio: bd71828: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
 <20250310-gpiochip-set-conversion-v1-4-03798bb833eb@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-4-03798bb833eb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2025 14:40, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-bd71828.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bd71828.c b/drivers/gpio/gpio-bd71828.c
> index b2ccc320c7b5..4ba151e5cf25 100644
> --- a/drivers/gpio/gpio-bd71828.c
> +++ b/drivers/gpio/gpio-bd71828.c
> @@ -16,10 +16,9 @@ struct bd71828_gpio {
>   	struct gpio_chip gpio;
>   };
>   
> -static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			     int value)
> +static int bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			    int value)
>   {
> -	int ret;
>   	struct bd71828_gpio *bdgpio = gpiochip_get_data(chip);
>   	u8 val = (value) ? BD71828_GPIO_OUT_HI : BD71828_GPIO_OUT_LO;
>   
> @@ -28,12 +27,10 @@ static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
>   	 * we are dealing with - then we are done
>   	 */
>   	if (offset == HALL_GPIO_OFFSET)
> -		return;
> +		return 0;

Should this be -EINVAL (or, can this check be just dropped?) Value of an 
input pin is tried to be set.

>   
> -	ret = regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
> -				 BD71828_GPIO_OUT_MASK, val);
> -	if (ret)
> -		dev_err(bdgpio->dev, "Could not set gpio to %d\n", value);
> +	return regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
> +				  BD71828_GPIO_OUT_MASK, val);
>   }
>   
>   static int bd71828_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -112,7 +109,7 @@ static int bd71828_probe(struct platform_device *pdev)
>   	bdgpio->gpio.set_config = bd71828_gpio_set_config;
>   	bdgpio->gpio.can_sleep = true;
>   	bdgpio->gpio.get = bd71828_gpio_get;
> -	bdgpio->gpio.set = bd71828_gpio_set;
> +	bdgpio->gpio.set_rv = bd71828_gpio_set;
>   	bdgpio->gpio.base = -1;
>   
>   	/*
> 


