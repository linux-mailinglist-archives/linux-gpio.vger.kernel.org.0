Return-Path: <linux-gpio+bounces-18504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE38A80E2B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DB6C3A3ED8
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C061E98ED;
	Tue,  8 Apr 2025 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Af06es2T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E581D5172
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122464; cv=none; b=dAY24XauOQ3ON2qnep0C5+63Oo6x8CaFHjWTJufLNCoWMyO3rc0MAhKmk7WDuAw2dlysz6Wm6pqw5L584PyLANTScAZym2yITw7O2IAIi2tzmPwDfWvG3OExZS/FaSQYHP0uDawhRjy/kNTWyP7KaEWEMuj2GfxHMvmJ429zF7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122464; c=relaxed/simple;
	bh=10wMnNq1UMaI2kkF37VxVvO8kQpxHh8UtPnpBkuHgjU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GsqquURnVjxoq3M8yN9drsCETdw1F2JpoafzYhKP2CG8r1cD/K41HQ1YC107usUuO8wjUgjNM3do2NK09bG4gtFyyzn8Tr1iap0emm4+KdqZ3INTdpjXcxVH3vzr4p9avyE6CXjVd2tx5LRobqtf4UqKL+q8aeoBEq8FttFLsFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Af06es2T; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso61496325e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 07:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744122461; x=1744727261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6HfW0vkjtlkAm7uksKgsKqVu9qIf8mOl8bnZ7ef7cg=;
        b=Af06es2T3vyAILax0re//nOXQw/7FY9jwjVT+8f+PChpbBQa1XU+8bGNjO5nB3YxJ/
         9/8t2NTn7zD6Wj82Tpvqlt/h9gepHICg7xJct69TuM6niJdOjiS3Te6TtK6BH4SpNkxY
         +Oy9k+2Zejk2zko4Lvb8g8ZptHSGDTz+LvOEthSd/Y6TF8m0a3FMp8PjNMp4Te+6pTEf
         a4kJQ6heY62KEgNQ86w2nzsXonaBnrGFhT08RkQnsSexi4IU9p3XNmZx4Ph4znHbj+0y
         pv0ek93Yt5hOKxBa9CUOd5Q9CLdsngBtDLI09CuLoZ9ksxV/Nj97i+qsdWSZptx9rhsC
         I3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122461; x=1744727261;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F6HfW0vkjtlkAm7uksKgsKqVu9qIf8mOl8bnZ7ef7cg=;
        b=Fk6O+DOSYnJTIAXpwqsw8kJYl83DX1wbqB4F8+p6d3cUiFqcbdgaG/mB1YRcn+HF3I
         /uc8E76xcJd2qWkKcNDLdxbEL1xWQYqsrQVo48tICSXIgU8KGatExt+UXdNOM3wBrG/k
         gLMh3eALytq8RoIVEr0CS8FxZNUel447tp+irg+1LkCXnJ1DxjT8kk3a2oDrYcpQUdtF
         jYTVVSTGwbgHcMn1c2NZkxl8uy0URgBvZW6I3xmPjENC1/7SRIXpeYvCMOdrI/Cx+7YR
         mKzC7abE/QoexUV5uw4fDONs/3ojwmaGOV1tquGy6YNR2QZiFMasx94xKgZQTGmfzP0e
         zOOw==
X-Forwarded-Encrypted: i=1; AJvYcCWCpkA+TBv5BiSPnJ21lqCdZOfI03y72N0FKuSyNQtIrPosa0/66/+p0BJaLfIh5y7NMDMRZSzWUyjg@vger.kernel.org
X-Gm-Message-State: AOJu0YwxNL3ysXkKVbyVfcCJMXQmVHelchgPb7q9l3Sp8wP9mUcyh7I7
	kwTfFWpUm09EKUwDZF4MMhopTFexvWE8UBYL7hJ7BSAlDM6tvjC3v0OfWhW2204=
X-Gm-Gg: ASbGncs7TlVzWP9MPtTI0HVeT4VZToWXdw/pyua6k2o33qCbnZz9+g0WstmWiB05YoV
	Lz4XWiFXKH+24mj2xZEeowV8tKPrycIazo07iUr17oLEntq2VY9pHwnnSYY34Y/O0jdUd7tHPc8
	sY1qSV3tUZghv4x92J28nEn0JE2TgIzXt1iPNVtXVKyGgU2mqk9vKDcyop0NO/cLZ8NqoLMNmti
	QkxO2p0LfG3BiDtxzkrobJystBzHtHK6X5Yl+Uha2qCbmrOkRq+b8bHt1PnJXGrx92KSgLoMMQZ
	WSwUnFZwFQ3j5bqIRjvSGVxCKrtgGNChTQRq5VdxcYpTqoxyI1tcoGaURFlAkOUOZxPgKikQZZ0
	fBe1KuUhO5UlgcXDCiRChbA==
X-Google-Smtp-Source: AGHT+IEFzSlrXkuwJ4BeZNVJDc79m98CBMUnaDEEBTa0PE1ADYZ4JU0DGBnfFovWynU4GuvtS6T8sQ==
X-Received: by 2002:a05:600c:5346:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43eda5d8460mr90477265e9.1.1744122460377;
        Tue, 08 Apr 2025 07:27:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3429f67sm169744825e9.7.2025.04.08.07.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:27:40 -0700 (PDT)
Message-ID: <ba7e31ff-5744-4409-921f-e2014f23151b@linaro.org>
Date: Tue, 8 Apr 2025 16:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 08/10] pinctrl: sx150x: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-8-c9d521d7c8c7@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-8-c9d521d7c8c7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 09:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-sx150x.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
> index 98262b8ce43a..d3a12c1c0de2 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -432,24 +432,25 @@ static int sx150x_gpio_oscio_set(struct sx150x_pinctrl *pctl,
>   			    (value ? 0x1f : 0x10));
>   }
>   
> -static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			    int value)
> +static int sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)
>   {
>   	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>   
>   	if (sx150x_pin_is_oscio(pctl, offset))
> -		sx150x_gpio_oscio_set(pctl, value);
> -	else
> -		__sx150x_gpio_set(pctl, offset, value);
> +		return sx150x_gpio_oscio_set(pctl, value);
> +
> +	return __sx150x_gpio_set(pctl, offset, value);
>   }
>   
> -static void sx150x_gpio_set_multiple(struct gpio_chip *chip,
> -				     unsigned long *mask,
> -				     unsigned long *bits)
> +static int sx150x_gpio_set_multiple(struct gpio_chip *chip,
> +				    unsigned long *mask,
> +				    unsigned long *bits)
>   {
>   	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>   
> -	regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask, *bits);
> +	return regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask,
> +				 *bits);
>   }
>   
>   static int sx150x_gpio_direction_input(struct gpio_chip *chip,
> @@ -1175,7 +1176,7 @@ static int sx150x_probe(struct i2c_client *client)
>   	pctl->gpio.direction_input = sx150x_gpio_direction_input;
>   	pctl->gpio.direction_output = sx150x_gpio_direction_output;
>   	pctl->gpio.get = sx150x_gpio_get;
> -	pctl->gpio.set = sx150x_gpio_set;
> +	pctl->gpio.set_rv = sx150x_gpio_set;
>   	pctl->gpio.set_config = gpiochip_generic_config;
>   	pctl->gpio.parent = dev;
>   	pctl->gpio.can_sleep = true;
> @@ -1190,7 +1191,7 @@ static int sx150x_probe(struct i2c_client *client)
>   	 * would require locking that is not in place at this time.
>   	 */
>   	if (pctl->data->model != SX150X_789)
> -		pctl->gpio.set_multiple = sx150x_gpio_set_multiple;
> +		pctl->gpio.set_multiple_rv = sx150x_gpio_set_multiple;
>   
>   	/* Add Interrupt support if an irq is specified */
>   	if (client->irq > 0) {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

