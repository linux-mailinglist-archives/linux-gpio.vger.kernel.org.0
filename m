Return-Path: <linux-gpio+bounces-18458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6F0A7F703
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 897234221BF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAFC264F89;
	Tue,  8 Apr 2025 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ag5MdjoU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDD4264A87
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098119; cv=none; b=pfi0ISBLCByGS9ecDZCGLHzpP3gdUfszrwLiXad6ijYkx9xmvPmDmxVdEE1McsWQrHnth215R5AFV3rhblJhirJUGsoweN0HrucAC5yt27GPmdn6T8jstSdRfOmXSyWGOcrwvOFPAI+aDqCluze7i35a20dq0iMXM3+2F+gex90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098119; c=relaxed/simple;
	bh=Jav4/X15NTJC8fKKfWLydfKFfKawXUY0jOZUYLa0vuM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nHe5jh2SSouhAf7Ia+WRz4FI1faZAKsMQQMUU16PNgInpm0C0S61WKMGraifL4BSnQoZe0qPPcktKDPDkqP+Zejcrt/htytn7J/qmwqKOhWcjnhtHtLBNBDcxjBWDoOt2YiTFLSSlnx3Tu4ZpZ+uXcymmjUki5Biy74IMSLCB/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ag5MdjoU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3036998f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744098115; x=1744702915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQBx3vMQCN7LC3XtCmwPt8309d/psSSD/2A8vw8TijU=;
        b=ag5MdjoUibWanfHJJv/oV3AGBM5bmorCawJxk/gUxvVUyFJY/u/dWyKSSHtRJv5abi
         D4jKav1gSRnGW42ZS/v6QCJjvg6p/8bG1KKOuf97ZHeR32Xim51ZXDRdfeDevlmMqoSm
         30jD/L8T0gm+LiMlvHTF5qSktznr3XWqb9vbYa5QppmqdHXec41zVnGMIo+Ky5y5hERD
         q1jsoZXGOXmGpb6yObWEq18FgYgXKRz5jxkZZB1fh5jAUiuP0HNEZnJn0OWDSzq6+dU7
         N+kWY9zKS81tuMvbJjjAeTvHortJ7NGWAtApcxqM5ZE9358KP7VSohdNzNGaJ3kRkl+4
         /veA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098115; x=1744702915;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tQBx3vMQCN7LC3XtCmwPt8309d/psSSD/2A8vw8TijU=;
        b=pAuleN9zzoOixT7tYE6Dal/iW7UAoflbbATrOgZbDpnQ9X0M5e4VQvYgZ/b1+BAbAe
         iS9OgvthU/6rSDqlld500VKUfJAeEPr2evztks90/k7Ji0iiUXnaAcGUpGmxw8AxocZ1
         bL8zEu/MsFfZdqQ2/K942lHiW7eaoiW/9sc+KTz87eZr691Aw+C0NcHUQSPU07NBmdVR
         jT0xnoO3DTHFzzWZyn2JimD3IsjoFHq3kPbQa+4J3m9khHGd/2DQXnIV5J1LZwy/WYIf
         3Hx5tS1ryPmIYBHKZhaJ6jo0CC5csxrmlyBqH8SsJUKg2pTYrsC8BM0p5v2TbQSBYjiD
         RaWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpT4DdRWI/WYx6lr0yBnNJRfWG4hpYT5ctTioAaInChy1B2JuUtu0sciTBtWkwoBhGHkfEdcKQ0SzZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4GmD7bKUXUDz9WtLLicrMz6qBjW+ng5l/H3hsfNGxZY5TVUOX
	2jyjo760vsIGUm2nZ0st+34YXTi9p8SF+a9bv7rWSYYP511Rv2aqvsAyfYO+68Y=
X-Gm-Gg: ASbGncuZK5Efd9tnHAqckoOtxkYlbniRRlhKLIlWy95cAeGjh+y8FCOQKul1trgMIaO
	v9tZVg/azT/S7KZusfFOdu1toWDCGDr3Ts1tnfWfBJ4qzXg5oCXNpt1aGYx2auOfTwpIx9sOC2d
	Cyp+mv0li9MxWn8SaoqMwD62YWxjrOBIDQ/NuOX8EgxDjCW6TWzc0FFy/TdluKCD5TSk/NyeSEW
	0nGs+ILzawb95lO08f5u/jI/uh3LYMsm8hyXb+UQDROhK7fay6UMVZlwNM+c9KbbeNFOIRKEq0k
	wdz/c3ppYtQhOiu5cRKWhIzHVsHPAX0p3aFh7ApwwDL3XDlpqM3b+GIIGcIcqfs3YllOQyqq6L/
	kbSKb4kZijlNDV3yq2iPMNA==
X-Google-Smtp-Source: AGHT+IFByldQ5+nIkIPUYqBDt+YbeQyC/TXD+J4hkwGfx+xeCVHaOyZ6wcecOFkR7gObrVdmBOHTrg==
X-Received: by 2002:a5d:648b:0:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39cb35aa6ffmr13189979f8f.34.1744098114336;
        Tue, 08 Apr 2025 00:41:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096b9csm14163670f8f.13.2025.04.08.00.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 00:41:54 -0700 (PDT)
Message-ID: <1b0f322d-94b7-4ba5-8423-eecd835db07a@linaro.org>
Date: Tue, 8 Apr 2025 09:41:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 06/10] pinctrl: amlogic-a4: use new GPIO line value setter
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
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
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
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
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
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index ee7bbc72f9b3..a76f266b4b94 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -806,15 +806,15 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
>   				  value ? BIT(bit) : 0);
>   }
>   
> -static void aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
> +static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>   {
>   	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
>   	unsigned int bit, reg;
>   
>   	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
>   
> -	regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> -			   value ? BIT(bit) : 0);
> +	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> +				  value ? BIT(bit) : 0);
>   }
>   
>   static int aml_gpio_get(struct gpio_chip *chip, unsigned int gpio)
> @@ -832,7 +832,7 @@ static const struct gpio_chip aml_gpio_template = {
>   	.request		= gpiochip_generic_request,
>   	.free			= gpiochip_generic_free,
>   	.set_config		= gpiochip_generic_config,
> -	.set			= aml_gpio_set,
> +	.set_rv			= aml_gpio_set,
>   	.get			= aml_gpio_get,
>   	.direction_input	= aml_gpio_direction_input,
>   	.direction_output	= aml_gpio_direction_output,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

