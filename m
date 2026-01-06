Return-Path: <linux-gpio+bounces-30179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFEDCF75DE
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 09:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECC103012A97
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 08:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB4430AACF;
	Tue,  6 Jan 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kWwO3Cl5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4BE2D8390
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 08:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767689711; cv=none; b=J6+CJ0L3s0yNYfasfZoz/KyPMU1hX1VXdKw0rw0n4hLshJOq1Yy+HtpB4JhslpvhbMFWCQjVPm0Uw7JJMxPOmuR2Rnb+kCSajRUNVAYlMiJjXSha1cbvW5FSFHQK/V1Bw2JmiMhOatdNjIuP2hx2xDuBIlzV6sMccNdvWjciXpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767689711; c=relaxed/simple;
	bh=YW9T6WWJYAWUlDEJ/mTSXNLWoQdgtdXN8pXegOIhcRk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=j0TOB5wcQ3BL8Oh7qzaEI+hHsa6jZ6DsoyDpHdBMyqQRCaGPcdLwB8SpH9Y1XYigWgAdBLaqfsL8FrxsM69b/fVnDbAMqza/kBSjXSmPuKWwZbhcRK/sRxLVQxK4f6fukB9kru8nXDBdcAk0AgR9A8WMgbbzbb15LcbtKyexiac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kWwO3Cl5; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so7652515e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 00:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767689707; x=1768294507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmM3DMB5KBZ/rOor1NH+mo1W6M5Mtv1nt3BZBMfv1+M=;
        b=kWwO3Cl5i4+B5KcpJ5iQTsTLNTuDRpQRxOR2CRjAMMQl/5Wr6LkQe/cSzsYRzPLipk
         W/ZDMOm5v3VFOuzsEwDtAU/lc/oJondC5uIllxFjGTUEMtn9jpISRjdYnOcE93nYSL+O
         daBYpfJTx/6c11iGlWDIkNqs3eZ9kAnS+yAbVDyRY8FNtcqmWKROKU3DSHCZU8DyFpH+
         m4BNSWvplr4V5Vmx4VWuJjQ7Q17qRPrxBswzeN0WmGI11CLfOT0mMkCPfUMQwZ/EJsjh
         VB5Cxb2xOF7K56N6tgyyhYtX8aydWngAOBJMfsQs5kFw/S8Z4UaI8AH+XVW5j4ljp0+S
         TVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689707; x=1768294507;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmM3DMB5KBZ/rOor1NH+mo1W6M5Mtv1nt3BZBMfv1+M=;
        b=vRVRciVOUetCh6TtQygVWXTm8CqFcG8NZV5+IOMLcKnD2WHJXKMD4eeJbB9RTiBqM/
         BGfn3pcoFnYfET8QWDUiAyHOpWgZtboxEON0fHTcjnbsEdHBasKG8eMj0cIktDuMrxBt
         V6Y1OyNHP13nOGW4a6I349V95YSgKJK1ADZ8CYMUHCyoqi0NZSHj0Fj3cnWVfXPXhxnY
         vqk2Ci+tjsIN6w3GnddfvoxGL1L7xzHOdZKHuNF0GFeQepxQVO7YS1uyYkKxIxslr3m7
         PWMoLHfwB21t+UEFmKcnJAvJipuYsT8XaKHnS/AZTZIn6DKRnh0FcTubei3Zu2qGQ6YM
         N0gg==
X-Gm-Message-State: AOJu0Ywfs5ISceGgNClgRkW0gKwpUgLz9IbyDCNf5qRHo/vDe1TleIIZ
	RR3q7+pEBzFm3cHnpcNHEXYEmWafo6m8zn10vcasYbyaYrBbDSHtNfvj9FT4h1PduJ0=
X-Gm-Gg: AY/fxX45P+Dy2OscG6JPGLAF0UppjT/u9bwlSC2iFRVKQO7V9GwOobsgXUZnueRyrXA
	o8ZEQKqyi3hhnZeEf12siHgd7UkKXy4rO4lbwVUUv5cEoe6OVRuBaNGMlmLJWw67ln+IYYjsLRA
	v+rzrdR28aOYP63HGnfM4zDkPSdgyaUACg32Cz0ZHVZj4BJ4Jv+c+l6CCJPSHCMnJQJRhWpZKpT
	Y30ju1UKfHjtFdCSdnKhrB1w5wZFnuDs9NjTIIt8OPqmS++66cBitVJMN4ZISQPEf7EuAI1DARe
	dj3oPh/8n6tL7a8WJbmM7gJoc1C5EI/nO0HCs+BLN/L8CxYB8BPWM0Tibeuff0VhczN85oFyTJ6
	Qu7A+lk1HgkMB6Zf/yZpjYpFv8CiKhMLxkrOsNRVrP6Wfbz8fAkD3fC3+6SL6Mvh7ACv6OWyYDW
	Je2TmII9iCSYVD+fiy8ND/+DeLeKejM/qDwJoku9UVFyRaXwFISivy8HpoyKgXCmo=
X-Google-Smtp-Source: AGHT+IFb9OptR/7Ov8dlKzvJEz8z8DSsQN/pBgI8GsGjv1cpt2h75dKypaad+D29pbLvT/bSO71hBg==
X-Received: by 2002:a05:600c:1d1d:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-47d7f073054mr24552195e9.10.1767689707266;
        Tue, 06 Jan 2026 00:55:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f7053f5sm30163085e9.14.2026.01.06.00.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 00:55:07 -0800 (PST)
Message-ID: <10d5df9b-842c-45d3-8821-d4ca0c364e97@linaro.org>
Date: Tue, 6 Jan 2026 09:55:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as
 sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
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
In-Reply-To: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 09:52, Bartosz Golaszewski wrote:
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization. This will cause
> lockdep splats when used together with shared GPIOs going through the
> GPIO shared proxy driver.
> 
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Closes: https://lore.kernel.org/all/CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index d9e3a8d5932a..ded7b218e2ec 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -893,7 +893,7 @@ static const struct gpio_chip aml_gpio_template = {
>   	.direction_input	= aml_gpio_direction_input,
>   	.direction_output	= aml_gpio_direction_output,
>   	.get_direction		= aml_gpio_get_direction,
> -	.can_sleep		= false,
> +	.can_sleep		= true,
>   };
>   
>   static void init_bank_register_bit(struct aml_pinctrl *info,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

