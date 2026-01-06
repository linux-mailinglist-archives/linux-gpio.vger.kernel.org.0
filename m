Return-Path: <linux-gpio+bounces-30181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E44CF7602
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 09:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60501300FFA5
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 08:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6FD30AD1C;
	Tue,  6 Jan 2026 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QzP1B6J1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E4E1BBBE5
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767689812; cv=none; b=R0aHX0O6YU8SSvWGoGKew+BIzioBJtD4xl7fGvwhUbCVnWP4rxbXt+BnSrI/ptEXcz3w8oYY5VEsJgfoAUegu9ZcpYYelKb3zYyI1boMCLKA7WevWfqVtlvHYlYvtAxc5hJod3RFJQyhcElAcuRgv+Quxetzc761PL1+AbNkVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767689812; c=relaxed/simple;
	bh=FBMWckxymhA+ToG+ir0P1Kll6A2GbDb1qBYQoZRs3QU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PVGQuEflhCsBYqgCqAysEFJlVZURMljpwgXWTntGjNXJYZ3j+PgPzd6GBXbQBtODQqRDvWj/xfe4wPbZ2bU9IXfSye01aj0H3q96VxSwSZ3AIcDGhHPAYtH6ktII0CI6oneZvwjIiclQhSVs/J3dHwO0ZSYZQR8J40t55xha3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QzP1B6J1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-430fbb6012bso500584f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 00:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767689809; x=1768294609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5XIBpzljoHQjxZKC8ws+REqtExLjvp1kVGJG4on0yQ=;
        b=QzP1B6J1XhcGcroqpAwEYC+pdzSSYt4PKclgY1mcr2lWhYyS8k7da5DedhSUk7D1CO
         A6CG8/lgZfibA2VzBVCpxhF9XRem+G9JauYrZvphgkD9/Gd8dqiM3UB+lRy3dGiconfG
         Svf51zYpD2swRDrhsa1R16At2JwIT4FoF9jjVPlgc+Mj31A8cs+kt8S8Tfl1BX52OFij
         w2Op985G7QCL4Zq5vHiYKLNNFzjt90riT8tHWGU5er0Risi4m/9Xq0HXrJVCaINFvD6N
         h90T63OzVPpVBxYnccX60joQZ6+HJiRjw/8QQXAGtPKTLiQkRDH332aRydWrj4ZasM2G
         PQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689809; x=1768294609;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5XIBpzljoHQjxZKC8ws+REqtExLjvp1kVGJG4on0yQ=;
        b=k1pMhtBx8MicY9+nlX7ipSi6oHEV8qXH38tc/+3MkzzDoYcyyMDPc65HDzrjWhOuq3
         tADikYpXTMOIbbfaPkEx1JpTtSVVSfgLy76L9ZceJwt7kzDO3de+UKQpzfB3m9NUXUfb
         S+ciYsqaKJdBNRxijNXyY/BSnqemx0FDCUT0WWy7qm+3uAyIZu5KeXr7DqCjicyRunhD
         Ob5iwEGgiJTL4g2YMe8GImBzBansGbRsxgfjjMHAhpCGaWC/PqDupvQ43uSHBZXaaZC2
         cPWT2FIZ93YUvMeuwvgeX5bJiyiuI7yF4MkXCb6ZPHx0377eMn9sZVylVrBndLfWNQEc
         97dA==
X-Gm-Message-State: AOJu0YxL4HMdBxJmk9VcGguB+xNkEiMFdRi8t7EN+cOZcrdUce64qo2d
	iMIImu46RZNZibvtgJGQqD+OuXKpezOjJNfNDOmhiE0krInii0v1LCyavWS17LGfXmA=
X-Gm-Gg: AY/fxX7+6d7TE/dk4uDIFHjkkjsMpikL5eX+GpMjD9Krihg7yyeif2Y/57uz5NqoRoT
	bxVZ23VjYzmSjDhOXyrQAnD12zIP3Ruoyx4lM9kA1XhyFwa6/LWx9vIrF389Lhprjk+jTAOgigB
	a+fC2RdIVHMBodE94R/Fd1esecGVgr+S6w3zA3Act/VAwNmhDxCihNdpB3NK7htTWzLstNdlwEU
	PM+TMbDBFVOnaK2y3ZOopCSGk20pD48WpPKXJQ9yJ1MWJ8n5C2A7iJQodB/U4ul784X2WnBpxcd
	Vc7AQMD5ZlzGCZghKgDaTgqEif7E0eIiHmLlpVPG0+dkQ6XpF8kTWMZ+XFFQIk7IdnhKqedzfgB
	wnG53clR07puwBjGMC2TuSg/Ly4E6tuqXomoCKmrSELafUkM1Bl3y/sQn0EWm0QrCblFWFk7Y3c
	tafqh5DzUns/8P/WbXHH6ZLowxQU0H8MMtWVQbrDe1e4dnldeAVD7wVrD8QOnlsXo=
X-Google-Smtp-Source: AGHT+IHVhcrD4cFn15kBjA+uODwKV5wK2G+r23W9N60bAGfWDxnPZimvr/c08dbGWpVozMUlUFTokA==
X-Received: by 2002:a05:6000:2302:b0:430:f742:fbb9 with SMTP id ffacd0b85a97d-432bc9d0f80mr3076920f8f.23.1767689809193;
        Tue, 06 Jan 2026 00:56:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee24esm3109698f8f.33.2026.01.06.00.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 00:56:48 -0800 (PST)
Message-ID: <728220d3-f093-4252-a0be-c45bf0dab597@linaro.org>
Date: Tue, 6 Jan 2026 09:56:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
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
In-Reply-To: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 09:55, Bartosz Golaszewski wrote:
> We currently only build these drivers on ARM but there's nothing that
> should stop us from building it with allmodconfig on other
> architectures. Extend the build coverage for all meson drivers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/pinctrl/meson/Kconfig | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
> index 0315e224bce6..ce6aeec2fc79 100644
> --- a/drivers/pinctrl/meson/Kconfig
> +++ b/drivers/pinctrl/meson/Kconfig
> @@ -15,25 +15,25 @@ if PINCTRL_MESON
>   
>   config PINCTRL_MESON8
>   	bool "Meson 8 SoC pinctrl driver"
> -	depends on ARM
> +	depends on ARM || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON8B
>   	bool "Meson 8b SoC pinctrl driver"
> -	depends on ARM
> +	depends on ARM || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_GXBB
>   	tristate "Meson gxbb SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_GXL
>   	tristate "Meson gxl SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
> @@ -42,7 +42,7 @@ config PINCTRL_MESON8_PMX
>   
>   config PINCTRL_MESON_AXG
>   	tristate "Meson axg Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
> @@ -51,25 +51,25 @@ config PINCTRL_MESON_AXG_PMX
>   
>   config PINCTRL_MESON_G12A
>   	tristate "Meson g12a Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_A1
>   	tristate "Meson a1 Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_S4
>   	tristate "Meson s4 Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_AMLOGIC_A4
>   	bool "AMLOGIC pincontrol"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	default ARCH_MESON
>   	help
>   	  This is the driver for the pin controller found on Amlogic SoCs.
> @@ -80,13 +80,13 @@ config PINCTRL_AMLOGIC_A4
>   
>   config PINCTRL_AMLOGIC_C3
>   	tristate "Amlogic C3 SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_AMLOGIC_T7
>   	tristate "Amlogic T7 SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

