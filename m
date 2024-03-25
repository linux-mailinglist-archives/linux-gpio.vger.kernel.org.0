Return-Path: <linux-gpio+bounces-4615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E0088B10B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 21:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58D38C43DAE
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 16:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD12913C3F8;
	Mon, 25 Mar 2024 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NmW5D+s8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F5B13D2AA
	for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711375157; cv=none; b=fubJ6bSgLiBM0stUqY8tQ2rR1i+lhmXDT6Vl0zj2DytWRkE0uOqO5lEokIg+6lPX6ZtVpS43XE9MpZJVKJdNroAqsAJNeZZ8XUVtDLuU8UZT7dI43oZOXMoiv2APEVEYKx2JobyRRmWlkfY4yRW+xUUTTSUyVxsn6nhCyHnKwZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711375157; c=relaxed/simple;
	bh=WR5SxWgx/LTb3HTn+PdO6vyr0dqAg3Nsb7L4BanAvaE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=ro/uu2zQllqVKizjL8pLofRn8ymC7PMaldT4RypRBzJPKfFiK1ql03BcJbOOCnWnHayA6zILkfndCtYFo2dDQ+Xx5wwsPw+QbNoPN9tyUlhc2C07a/Yl9duVL1zaJcRNMkVKjNuT+yqrGNjU2Oi0VRvd2xV7eZsNj761+JK9giA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NmW5D+s8; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2222b96e4d2so2565992fac.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 06:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711375154; x=1711979954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2nH4XziCYvGEfh77M5FceKvirEwgjnZOT2AT2yGomg=;
        b=NmW5D+s8GUsbrksm/mCmYGkGC/PQVATPio6IeF9s5reqdGNgxvX2HPpoOyS9u5W29j
         XAhtSekEqP2i8hXtxOPUDdtLbK1iruv64IdOBEPRvGjoB1oJct9jhHHXbi0iOXIfrAkN
         zPart1s3pTGr7V7Ol3+g3oZoa0jS9d+i3QvkMeVmJxRjj/HUJnnszHeea3TtThbb3UEH
         sA9K02wT5u2M/lcT7Ag/3BnKlxragoTMdutgmtYU8tPK4KRzr42rXdz5wWVZvbgXpX9M
         iuUn3aYmTwTfHURfylGxstgd7ErfN5DQq12gRjzs8vvyRlB1bzS+4jGb7mg2/ztBD7VL
         MqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711375154; x=1711979954;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o2nH4XziCYvGEfh77M5FceKvirEwgjnZOT2AT2yGomg=;
        b=eNUJu1KncKLedaYssZ/lFV7rrMZuw6aC0v7DLhNcYPcbqsbK6WVzAdYLv1UTPnBRms
         hxIFcndJUIJP9YoqRpxBZ2+yKEAFE4IXX1bIx+fGmIJ+QDq8YrOC1SVHZXV96uyZHlWC
         vA39mT8nioMySs1bHbi5f9grlcM8cNfYZV0qVgHWW0Zrt8NKbVpY4GRNQsxUGFy4dNgQ
         OOvGNFKRHmnPcJ5WK285cmXVn3jNSz1EjN+HZCH/I51fVEv9c31uU0JPFuxBwXcu1qYn
         MSn85jDNZonVl5/gyTToN/8qBGrxy9eZ0o8HuWsscAZ6z9bo3fSx9Tu6MDMlDPkVRvEP
         B6cg==
X-Forwarded-Encrypted: i=1; AJvYcCUyaUQV7TPiPa6ojGid6hXchxszSx1yGD/mbd3/SXti1s+ihS+zzQjbpjvtzlMv9azg7YvB2t95yzoB1nNfz8e08JQcEmiiALNIVQ==
X-Gm-Message-State: AOJu0YwgdWlWO+pRKk8RaYdx/Jq8MNY7xd/5SsNAu9lJP/qMgPohQlev
	MGYgss/jX3z/MOFAoizyeMOPQC7kay9GX9f/HVcVeAtxArY+IIUY4B0eunX1tvQ=
X-Google-Smtp-Source: AGHT+IE2VDeedGd/lWEvKcxCaB+MJdMhfHfLWl5rj7Bz4qfMhTELtOe0PG8xP2LlKdqWw+EAGM3gLg==
X-Received: by 2002:a05:6870:4205:b0:229:8236:ae9 with SMTP id u5-20020a056870420500b0022982360ae9mr7453175oac.59.1711375154177;
        Mon, 25 Mar 2024 06:59:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5176:2c0a:cfc0:1ada? ([2a01:e0a:982:cbb0:5176:2c0a:cfc0:1ada])
        by smtp.gmail.com with ESMTPSA id c20-20020a63d514000000b005dc4da2121fsm5969750pgg.6.2024.03.25.06.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 06:59:13 -0700 (PDT)
Message-ID: <82e09104-8006-4074-9700-2dec08194ac4@linaro.org>
Date: Mon, 25 Mar 2024 14:59:10 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] pinctrl/meson: fix typo in PDM's pin name
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240325113058.248022-1-jan.dakinevich@salutedevices.com>
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
In-Reply-To: <20240325113058.248022-1-jan.dakinevich@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/03/2024 12:30, Jan Dakinevich wrote:
> Other pins have _a or _x suffix, but this one doesn't have any. Most
> likely this is a typo.
> 
> Fixes: dabad1ff8561 ("pinctrl: meson: add pinctrl driver support for Meson-A1 SoC")
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
> Links:
> 
>   [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
> 
> Changes:
>    v1 -> v2: Detached from v1's series (patch 15)
> 
>   drivers/pinctrl/meson/pinctrl-meson-a1.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-a1.c b/drivers/pinctrl/meson/pinctrl-meson-a1.c
> index 79f5d753d7e1..50a87d9618a8 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-a1.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-a1.c
> @@ -250,7 +250,7 @@ static const unsigned int pdm_dclk_x_pins[]		= { GPIOX_10 };
>   static const unsigned int pdm_din2_a_pins[]		= { GPIOA_6 };
>   static const unsigned int pdm_din1_a_pins[]		= { GPIOA_7 };
>   static const unsigned int pdm_din0_a_pins[]		= { GPIOA_8 };
> -static const unsigned int pdm_dclk_pins[]		= { GPIOA_9 };
> +static const unsigned int pdm_dclk_a_pins[]		= { GPIOA_9 };
>   
>   /* gen_clk */
>   static const unsigned int gen_clk_x_pins[]		= { GPIOX_7 };
> @@ -591,7 +591,7 @@ static struct meson_pmx_group meson_a1_periphs_groups[] = {
>   	GROUP(pdm_din2_a,		3),
>   	GROUP(pdm_din1_a,		3),
>   	GROUP(pdm_din0_a,		3),
> -	GROUP(pdm_dclk,			3),
> +	GROUP(pdm_dclk_a,		3),
>   	GROUP(pwm_c_a,			3),
>   	GROUP(pwm_b_a,			3),
>   
> @@ -755,7 +755,7 @@ static const char * const spi_a_groups[] = {
>   
>   static const char * const pdm_groups[] = {
>   	"pdm_din0_x", "pdm_din1_x", "pdm_din2_x", "pdm_dclk_x", "pdm_din2_a",
> -	"pdm_din1_a", "pdm_din0_a", "pdm_dclk",
> +	"pdm_din1_a", "pdm_din0_a", "pdm_dclk_a",
>   };
>   
>   static const char * const gen_clk_groups[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

