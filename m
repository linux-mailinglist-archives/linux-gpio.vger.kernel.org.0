Return-Path: <linux-gpio+bounces-18457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEFAA7F701
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67649421EDF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5A1264A7B;
	Tue,  8 Apr 2025 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t2gEz3Dn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DA2264630
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098098; cv=none; b=W7Dm+mMb8uKRQp/XnwxIQ8QwUCTTE0GsRP8LcyTyFD6MrthlWNx7gFzi+sZsKu2wmk0oe6r20lbiULJ0O2+milwFmWRqgfbX3sPmyfn49wfGGgY3XfZTsGbAtv4XmK3gI3fg4RygwEc2RkITd9t0OcdQXIcIPN7Jh0ccE0ZSNtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098098; c=relaxed/simple;
	bh=WFrbgnjtIdLegARnh8ZOz8cdARf39yPGWF1ZZYqL4Q0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FgXkxashC0JWfwZE7OpRukVW7pyfHqV5eokEkDh4OG0Eg3egsI3B00L4HgBHdOXq3nE/K5SiLYMGUfHJQZDv7yfVulLFueoYER3R0xj7W0jQ4GYUaJUBXrq+M7ZaOe5gMAmJ4xCww8nymqV6cJO83YTPod5UR0uFBG2bU/QpmtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t2gEz3Dn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2955560f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744098095; x=1744702895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXt1VUtxJKVhenaGxKn/M7BRvobuDoOHV9yLu3KSCFE=;
        b=t2gEz3DnF87uNf5WDJubyBD391t79Vb/WfiAlXuNaOqv7QOMliyoXxh11MFlwN15tj
         fw5IsF/peh5xj130aBUUPV4xvVRT8jGkkA5olNRB5R/MhL7uNEHSvKBNtq2UiKNr6vlj
         bLtVs6MSxcZG2dJ/E9KUJioGHkYaWAdx2Qr18bsayIHz+h87ENOUq1LIuvcRT+qFNeUV
         Czt9sY+wRiUzYtz9Sb53fpfjhZPPfT0uXv7eagbNQ1lK1FfVjjK2NaPjw45QycrHRjER
         sImxvdTRmON+ui0oZTn97SzWFwA9E0k8Kz+BCpgsqQ+9CbV6X3JoMM7FOnIUkEhXBSjf
         X4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098095; x=1744702895;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XXt1VUtxJKVhenaGxKn/M7BRvobuDoOHV9yLu3KSCFE=;
        b=X5mmOtYgcamMzJzbCQUfBTxY7vFe56TO90lKEPP6JeuhQ5vRdye61MHSw3PgDFFJ2G
         3pYnzr+dqN29dyPokq0Qh7irg/ToJADd87w6mrMx0QfvDW9VT7cP0NSvQ9Uio5BEoihx
         xzBI9/nko4kgZPbzUf/GpJJKDm/gK5L7SkzE2tox7j2kyiTrKXf2X6zWWiMsj9BAs/9u
         l75CmMN2F+SzIIubFmusqLRvGgyjZj8WrCqG467VUvd6XagGIJeOJs7tYi3BQZqjhoxA
         A1H461VSOVlX6sZOHiVXzg5ofPTwtR0feYS5PcxiITwnbd65AVm1kChKctDfwhtyir6M
         P9RA==
X-Forwarded-Encrypted: i=1; AJvYcCXDX96S8wf7TPL7NJtf6OTQY5kqZWa4c+zbFpa3lAj3Dcr0a9JlpzZ7qVsYzjMEShNQ0CzwjVMS0y8k@vger.kernel.org
X-Gm-Message-State: AOJu0YzFxxPVF5eW66kt3LrudIfIMUTd+DHWxFSAzJDbRiKHfH1OBtx8
	DegJm6tin78gEWUdvLsP1LSzQ/xf29uA2V2plvXRpbjDVzB63BHuwCM6YOscGkY=
X-Gm-Gg: ASbGnctWavy+bVafZeQs6Ie2HI6IReLqiusd80rNgW/vpLXXv/kZQzrjqf0aA2PpxOy
	HTmDPsKrAa/GSJQ9WD9FEGBJRtFIDYbn2z4NrmCoOZi/bgHx9LnCNYab7hIvsVICKEZMm2Maoob
	gtSZVP+sUcViFIAqNn3aNtuwFw2r9P29Y3J/6hRSaihf0IMnSM4eiGo3i8tPX6BJaBBtOQqCyo0
	rYlU4b9e+ms1yUPEUT7H2o4w+DFh0/AHkaCCpwRbkNYyg08WjebGSXtaPEdF71fUR2Pxnbm5/j2
	uXe8CsKNZRTngBzrz7PWhDfugeiApBfLXgD6/pYlJuK/vbhwRMPjBAh9OOA9DYl22cbW9jp13F1
	fI145macPYubpwJqetXI7tw==
X-Google-Smtp-Source: AGHT+IGwV0LdqrELIcKaYg5qGdauKUw5ISrN3fxgvRHpkZn+vvc+/FEZS7JUbltTES57GokFyHQFlA==
X-Received: by 2002:a05:6000:2cc:b0:391:952:c74a with SMTP id ffacd0b85a97d-39d820aca79mr1827989f8f.8.1744098094642;
        Tue, 08 Apr 2025 00:41:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300968c4sm14179491f8f.9.2025.04.08.00.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 00:41:34 -0700 (PDT)
Message-ID: <a5c44052-1873-4df3-ae2b-ffe21246c16b@linaro.org>
Date: Tue, 8 Apr 2025 09:41:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 05/10] pinctrl: meson: use new GPIO line value setter
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
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
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
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
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
>   drivers/pinctrl/meson/pinctrl-meson.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 253a0cc57e39..e7485c82089c 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -580,9 +580,9 @@ static int meson_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
>   					      gpio, value);
>   }
>   
> -static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
> +static int meson_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>   {
> -	meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
> +	return meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
>   }
>   
>   static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
> @@ -616,7 +616,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
>   	pc->chip.direction_input = meson_gpio_direction_input;
>   	pc->chip.direction_output = meson_gpio_direction_output;
>   	pc->chip.get = meson_gpio_get;
> -	pc->chip.set = meson_gpio_set;
> +	pc->chip.set_rv = meson_gpio_set;
>   	pc->chip.base = -1;
>   	pc->chip.ngpio = pc->data->num_pins;
>   	pc->chip.can_sleep = false;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

