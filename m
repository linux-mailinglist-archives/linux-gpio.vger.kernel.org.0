Return-Path: <linux-gpio+bounces-12874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9299C592C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 14:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE5DC283784
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4602715696E;
	Tue, 12 Nov 2024 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPz9x0Zt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E542149C6A
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731418396; cv=none; b=WZIIRBe+y+5Eaj6U6Pp5aOU0l4cYQAmYQizf8LPtYJnzaKkyVNYfbLg1IfgOOejyTukX7w6EbmwhIeikZV0Zoat2xXZ98WYMeYSAKOScgDqakWylmFEqcCyjaEZMJq9Kv3gH/9sXh7IRYcGkz+HBNCHyO+GS0cXA+fPx7HEHgVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731418396; c=relaxed/simple;
	bh=166m2vywSJoaXr+1NLOnoEpi4AaWPqxXD9TD/s2B/Gw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nxpRUo9Ylzzq/GSQ2MrAv7vVns9/PpGLrtKdplbSjG3rXw+hktu1KeEb+cZsQOlYGRImFJkHsrPsYvg3RCtPBOZpxssoIsqhCzSGpnjxwSaWFJlNLJpjg7DZ4vylxo56BzVkHL4/c2xfjD4Rjl7Rcoa2f3nOwaq7Lz6+LTCeKh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPz9x0Zt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431481433bdso49887735e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 05:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731418392; x=1732023192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPw/l+reEkoV+Lu4oU6btG+0aP6lGwA5rjJnh68HFbw=;
        b=yPz9x0ZtZbiBDQL5owiOXzcYPbs+XI0Ig2oLHSMGNUbIKZkGj2EhL8oeafCHPApxFU
         KL4Zj0TbLxZXwEdTpM9hxHa6VMWKcvSlwn2rCXPjAzK0T4CFVNMoLmrfHdBEriymRHDY
         /a8CF/GBJCqhL8m/wdhRooCB6SBb65qtbpzgAbWwMVO2B/al52GhSbaEuAq/IjOAckPT
         XlllUX0QQQ5HmEyv7wy54T6fED3kUh8+l6VR82/p9NbwGk+l1Gob8WHBt2iaO1poB1nI
         JkQ/XrS0NrKo4X7LvI4G7QW8irQHnlGtE9qU75jd6c29Q8Fcd8t0Amc/1CeKwvm+HFWF
         KTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418392; x=1732023192;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GPw/l+reEkoV+Lu4oU6btG+0aP6lGwA5rjJnh68HFbw=;
        b=RVPJvdHUVUe0f2ERU3owPgblVEX6HuKIHFHS2Y5M1Tzo3/d0kHSaMPIlYJnffLswm3
         iaC1VhY8QLwkGY6ZVLu7QLK0IkCam6cjCNyJyyFcP+rMZyiupZ+yPkU7hUjCfgasYlwv
         W1VcIblStPnU33RxXqO4RMPXpS+2Ap0WhSpF98pOFqTZCuZyw4SmXz+IKK6bDf1T9WD/
         Wny5L1WhPiEPgUAD20TPhm4tFCg9aZUSuTVDlcm+n6U9b1F2K7azcIP1UKE9IBkQUUTq
         1NGILIAe4gQgMoX7NLXYTVQy+g4XMp1EoJ+HKmOBanlDU2N1w0gtotA3S7YyPVBaAVnM
         AJsQ==
X-Gm-Message-State: AOJu0YwPTS3wHtJzI4pPxOnFnUvbPtqLCzwhko+GVS6AYu8K+TBWPsXB
	s8tJtTcPWqlHje1vVOvUG45wiUwnuWjrtlU3tGW9qtucmsUPw2mYKpyD8iWl7v8=
X-Google-Smtp-Source: AGHT+IHtI83EOKwQElqzf0zLEiSXsg9bq2SemcxgdG+nJ+/NT2acG2uq4owq26USdOdF0uX+SDabNA==
X-Received: by 2002:a05:600c:4f04:b0:431:5f1c:8359 with SMTP id 5b1f17b1804b1-432b75091cdmr119544305e9.15.1731418392516;
        Tue, 12 Nov 2024 05:33:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5fb1sm254853375e9.8.2024.11.12.05.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 05:33:12 -0800 (PST)
Message-ID: <5913d10c-cf85-407b-948a-db082b0789ac@linaro.org>
Date: Tue, 12 Nov 2024 14:33:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 4/5] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
To: xianwei.zhao@amlogic.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
 <20241112-a4_pinctrl-v5-4-3460ce10c480@amlogic.com>
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
In-Reply-To: <20241112-a4_pinctrl-v5-4-3460ce10c480@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2024 11:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add a new pinctrl driver for Amlogic A4 SoCs which share
> the same register layout as the previous Amlogic S4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/pinctrl/meson/Kconfig              |    6 +
>   drivers/pinctrl/meson/Makefile             |    1 +
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1335 ++++++++++++++++++++++++++++
>   3 files changed, 1342 insertions(+)
> 

<snip>

> +
> +static int a4_of_gpio_xlate(struct gpio_chip *gc,
> +			    const struct of_phandle_args *gpiospec,
> +			    u32 *flags)
> +{
> +	int gpio_num;
> +
> +	u32 bank  = gpiospec->args[0];
> +	u32 offset = gpiospec->args[1];
> +
> +	if (gc->of_gpio_n_cells < 3) {
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}

This check is unnecessary, drop it, it's already done by of_xlate_and_get_gpiod_flags(),
and if you _really_ want to keep it, move it before accessing gpiospec->args array.

> +
> +	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
> +		return -EINVAL;

This one aswell, drop it.

> +
> +	switch (bank) {

Just use: switch (gpiospec->args[0]) {

You can even simplify further by dropping offset and using:

int gpio_num = gpiospec->args[1];

and then:

> +	case AMLOGIC_GPIO_B:
> +		if (offset >= GPIOB_NUM)

if (gpio_num >= GPIOB_NUM)

> +			return -EINVAL;
> +		gpio_num = GPIOB_0 + offset;

gpio_num += GPIOB_0;

> +		break;
> +
> +	case AMLOGIC_GPIO_D:
> +		if (offset >= GPIOD_NUM)
> +			return -EINVAL;
> +		gpio_num = GPIOD_0 + offset;
> +		break;
> +
> +	case AMLOGIC_GPIO_E:
> +		if (offset >= GPIOE_NUM)
> +			return -EINVAL;
> +		gpio_num = GPIOE_0 + offset;
> +		break;
> +
> +	case AMLOGIC_GPIO_X:
> +		if (offset >= GPIOX_NUM)
> +			return -EINVAL;
> +		gpio_num = GPIOX_0 + offset;
> +		break;
> +
> +	case AMLOGIC_GPIO_T:
> +		if (offset >= GPIOT_NUM)
> +			return -EINVAL;
> +		gpio_num = GPIOT_0 + offset;
> +		break;
> +
> +	case AMLOGIC_GPIO_TEST_N:
> +		if (offset != 0)
> +			return -EINVAL;
> +		gpio_num = GPIO_TEST_N;
> +		break;
> +
> +	case AMLOGIC_GPIO_AO:
> +		if (offset >= GPIOAO_NUM)
> +			return -EINVAL;
> +		gpio_num = GPIOAO_0 + offset;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (flags)
> +		*flags = gpiospec->args[2];
> +
> +	return gpio_num;
> +}
> +
> +static const struct meson_pinctrl_data a4_periphs_pinctrl_data = {
> +	.name		= "periphs-banks",
> +	.pins		= a4_periphs_pins,
> +	.groups		= a4_periphs_groups,
> +	.funcs		= a4_periphs_functions,
> +	.banks		= a4_periphs_banks,
> +	.num_pins	= ARRAY_SIZE(a4_periphs_pins),
> +	.num_groups	= ARRAY_SIZE(a4_periphs_groups),
> +	.num_funcs	= ARRAY_SIZE(a4_periphs_functions),
> +	.num_banks	= ARRAY_SIZE(a4_periphs_banks),
> +	.pmx_ops	= &meson_axg_pmx_ops,
> +	.pmx_data	= &a4_periphs_pmx_banks_data,
> +	.parse_dt	= &meson_a1_parse_dt_extra,
> +	.of_gpio_n_cells = 3,
> +	.of_xlate	= &a4_of_gpio_xlate,
> +};
> +
> +static const struct meson_pinctrl_data a4_aobus_pinctrl_data = {
> +	.name		= "aobus-banks",
> +	.pins		= a4_aobus_pins,
> +	.groups		= a4_aobus_groups,
> +	.funcs		= a4_aobus_functions,
> +	.banks		= a4_aobus_banks,
> +	.num_pins	= ARRAY_SIZE(a4_aobus_pins),
> +	.num_groups	= ARRAY_SIZE(a4_aobus_groups),
> +	.num_funcs	= ARRAY_SIZE(a4_aobus_functions),
> +	.num_banks	= ARRAY_SIZE(a4_aobus_banks),
> +	.pmx_ops	= &meson_axg_pmx_ops,
> +	.pmx_data	= &a4_aobus_pmx_banks_data,
> +	.parse_dt	= &meson_a1_parse_dt_extra,
> +	.of_gpio_n_cells = 3,
> +	.of_xlate	= &a4_of_gpio_xlate,
> +};
> +
> +static const struct of_device_id a4_pinctrl_dt_match[] = {
> +	{
> +		.compatible = "amlogic,a4-periphs-pinctrl",
> +		.data = &a4_periphs_pinctrl_data,
> +	},
> +	{
> +		.compatible = "amlogic,a4-aobus-pinctrl",
> +		.data = &a4_aobus_pinctrl_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, a4_pinctrl_dt_match);
> +
> +static struct platform_driver a4_pinctrl_driver = {
> +	.probe  = meson_pinctrl_probe,
> +	.driver = {
> +		.name	= "amlogic-a4-pinctrl",
> +		.of_match_table = a4_pinctrl_dt_match,
> +	},
> +};
> +
> +module_platform_driver(a4_pinctrl_driver);
> +
> +MODULE_AUTHOR("Xianwei Zhao <xianwei.zhao@amlogic.com>");
> +MODULE_DESCRIPTION("Pin controller and GPIO driver for Amlogic A4 SoC");
> +MODULE_LICENSE("Dual BSD/GPL");
> 

Thanks,
Neil

