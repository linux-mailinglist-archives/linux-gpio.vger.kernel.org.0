Return-Path: <linux-gpio+bounces-21992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDF4AE3723
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 216F31893180
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068101F5823;
	Mon, 23 Jun 2025 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1KITVyB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1011D6DA9
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664467; cv=none; b=mthyTyZTuShmx17P/oUzpzBTJwy2lj9xlplpA9Y239qy6XbSE6G/duHT5TABb4mlcxrGIMC1w8G/KxN1WB7gg5oZSrcFddIFhFX23vf0YqvQEKHfcZu4yTYuh16jBhJuAAv4i9lXVjL62CUA9jKnkkjrHqiUSuVs6dzVqDEVMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664467; c=relaxed/simple;
	bh=s1nX8RXAq8rCQ3l6eiogAzztXZcWBGN63n8sFqj4tRU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SB+Nf/rRLOATDYM9iRR4Csov6Xn6W9Mc/yIALKrte0ChL3uuJzjq+fz5mz2MQjWopK525OaF+gO42xOw/Q7cj8yAQ3AjbTckVpZ5ZN2AhsigDSHhY71oyrZZy860O0W3WPLqQ8u7/u5H8FyF91C1Vn5H3mN2Nh20YxyRgJStswE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1KITVyB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453426170b6so28468685e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750664464; x=1751269264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeW6Uuzf1Bl2HUqpMLFHqgIH+Q2PYHxgIXjI/kFeO3s=;
        b=G1KITVyBrCQlfFjDq2VL+UhbjFbUE5u9BWeR2ErT5UNsfVXnO1wo4B743rrTp7TfYP
         7+T9/hoH3rQxLlI82pJ3ZdOoy/taoe75Gr8YRH27dL3Er3nMWXD7rV3KwlBL/Ijhx7ER
         yJC+hrKACIdmGuo5P2z1As+lYyUvd4FbC/TbQA7sKHHqiKn2OywPwC+RxejuqPd16g3Y
         5nPhA6TIU375lm85oIjpVB9XfHRR0m6ZVV6Iz62jrB4Q4iRJPhLCXD/sPnPb2Dxd6epW
         PG7JBvz8mHXXGpCAECnfNdt+TdpatTneua057rNTbj5GOKP3YqfXfyKM+cdwn8WlevzF
         +M3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664464; x=1751269264;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AeW6Uuzf1Bl2HUqpMLFHqgIH+Q2PYHxgIXjI/kFeO3s=;
        b=PM9HdAb1dRWDam3GYa4+W9ehkV0TELsz7JlA4eqx4+InQu1JznbnYwsxZ0fi4c0gak
         eI0SXa2xILEzUOvZOV6d+WYGc1CAXbh71J6R0k0f7WD40PN3po2DvO473RpYBqEFxWyD
         75OLIulPgSZydrJlQs3p+/km0l2L+ydWx85xL4Pmn6Lbv9AJTT2Vdf+bJTBAxpfdtNPV
         ShpbrfAewxxyOQiN/qmUtVKvPDsrURnIIVEsolrCDbeM8//vSldO7IaajMjU0D++vTiF
         paX3D5z9Xh9keKcasw+e7L5p2zETe+tBY4xzFYLShbEfI3hwqclsKrOj/PiWDwwmtg1p
         hPiA==
X-Gm-Message-State: AOJu0YwJBIpQty9ILQpdZMZyLURUSYzqqSjdBaj/uT4o+IEBcQzoNyQy
	XqlN7VGf2RF6NFStWKPqL53wRnbapVA9XyIMdiWMpYLka3tYR3r+rFgg41j6KS8/Nqw=
X-Gm-Gg: ASbGncsf0WheNMB8SmBKK18YeeXa6hMQURYOpF18mbT4dRHdnJ2uiwVi1kuQUzjAmD8
	6gV+BFNL0qh+N5V4ucyuSwYsq/8i5Y2vLVTwK46LGpvP/+dC5WdKPnGa+LJi5tXTC6PURDIWSG5
	at+DrTznql57lMbCeW1GmjwaSJAMxZV0tk4uA3oKgoYofXE/udlGJTc/BFRNd2iYFJwybm+gWEd
	8gDu5G2RZQzhovZ7QkIWhaK5cLLuLBFVcrEWm8J55NeuqXYUcZt8pPSTKfqpJzfryDdHzITUMa5
	XYfWJ0qNw90/AigqG6F8KcBZQpI1p9nBVggsozjTeYO9gpdVzFXhkOD0ZNuvIwvaF/MsmtAO+Du
	9RUryHKlKEmi9maA+pTj8c+NdTGCEiUFJazzj8b8=
X-Google-Smtp-Source: AGHT+IHD+/fz1sWecInD3T1Za6Q8jYc1LEFBXvsskAFiJv2dUlnZNh4T9pnHkuNli8KWbY6bfCumQg==
X-Received: by 2002:a05:600c:5403:b0:453:aca:4d08 with SMTP id 5b1f17b1804b1-45365e2f118mr93390785e9.1.1750664464218;
        Mon, 23 Jun 2025 00:41:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d? ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c6a7sm8879897f8f.51.2025.06.23.00.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 00:41:03 -0700 (PDT)
Message-ID: <3f335e16-8528-422a-a73e-efa06e68851c@linaro.org>
Date: Mon, 23 Jun 2025 09:41:03 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson-g12a: add g12b pwm groups
To: Da Xue <da@libre.computer>, Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250619022337.43900-1-da@libre.computer>
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
In-Reply-To: <20250619022337.43900-1-da@libre.computer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 04:23, Da Xue wrote:
> g12b and sm1 have additional pwm pinmuxes for b, c, and d
> 
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>   drivers/pinctrl/meson/pinctrl-meson-g12a.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index e2788bfc5874..8b9130c6e170 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> @@ -270,15 +270,21 @@ static const unsigned int pwm_a_pins[]			= { GPIOX_6 };
>   /* pwm_b */
>   static const unsigned int pwm_b_x7_pins[]		= { GPIOX_7 };
>   static const unsigned int pwm_b_x19_pins[]		= { GPIOX_19 };
> +static const unsigned int pwm_b_z0_pins[]		= { GPIOZ_0 };
> +static const unsigned int pwm_b_z13_pins[]		= { GPIOZ_13 };
> +static const unsigned int pwm_b_h_pins[]		= { GPIOH_7 };
>   
>   /* pwm_c */
>   static const unsigned int pwm_c_c_pins[]		= { GPIOC_4 };
>   static const unsigned int pwm_c_x5_pins[]		= { GPIOX_5 };
>   static const unsigned int pwm_c_x8_pins[]		= { GPIOX_8 };
> +static const unsigned int pwm_c_z_pins[]		= { GPIOZ_1 };
>   
>   /* pwm_d */
>   static const unsigned int pwm_d_x3_pins[]		= { GPIOX_3 };
>   static const unsigned int pwm_d_x6_pins[]		= { GPIOX_6 };
> +static const unsigned int pwm_d_z_pins[]		= { GPIOZ_2 };
> +static const unsigned int pwm_d_a_pins[]		= { GPIOA_4 };
>   
>   /* pwm_e */
>   static const unsigned int pwm_e_pins[]			= { GPIOX_16 };
> @@ -649,12 +655,22 @@ static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
>   	GROUP(pwm_a,			1),
>   	GROUP(pwm_b_x7,			4),
>   	GROUP(pwm_b_x19,		1),
> +	GROUP(pwm_b_z0,			5),
> +	GROUP(pwm_b_z13,		5),
> +	GROUP(pwm_b_h,			5),
>   	GROUP(pwm_c_x5,			4),
>   	GROUP(pwm_c_x8,			5),
> +	GROUP(pwm_c_c,			5),
> +	GROUP(pwm_c_z,			5),
> +	GROUP(pwm_d_z,			4),
> +	GROUP(pwm_d_a,			3),
>   	GROUP(pwm_d_x3,			4),
>   	GROUP(pwm_d_x6,			4),
>   	GROUP(pwm_e,			1),
> +	GROUP(pwm_f_a,			3),
> +	GROUP(pwm_f_h,			4),
>   	GROUP(pwm_f_x,			1),
> +	GROUP(pwm_f_z,			5),
>   	GROUP(tsin_a_valid,		3),
>   	GROUP(tsin_a_sop,		3),
>   	GROUP(tsin_a_din0,		3),
> @@ -1058,15 +1074,15 @@ static const char * const pwm_a_groups[] = {
>   };
>   
>   static const char * const pwm_b_groups[] = {
> -	"pwm_b_x7", "pwm_b_x19",
> +	"pwm_b_h", "pwm_b_x7", "pwm_b_x19", "pwm_b_z0", "pwm_b_z13"
>   };
>   
>   static const char * const pwm_c_groups[] = {
> -	"pwm_c_c", "pwm_c_x5", "pwm_c_x8",
> +	"pwm_c_c", "pwm_c_x5", "pwm_c_x8", "pwm_c_z",
>   };
>   
>   static const char * const pwm_d_groups[] = {
> -	"pwm_d_x3", "pwm_d_x6",
> +	"pwm_d_a", "pwm_d_x3", "pwm_d_x6", "pwm_d_z",
>   };
>   
>   static const char * const pwm_e_groups[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

