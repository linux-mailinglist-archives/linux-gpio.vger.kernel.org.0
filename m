Return-Path: <linux-gpio+bounces-29460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A01C1CB6DD5
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Dec 2025 19:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 881C330285D2
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Dec 2025 18:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D419B31AAA0;
	Thu, 11 Dec 2025 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBqdaish"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8712C31AA90
	for <linux-gpio@vger.kernel.org>; Thu, 11 Dec 2025 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765475821; cv=none; b=UkvglsvDhPPal5awgt3OBHj1kfmztzqJgoQROr/s/j0aBuTxzZ41aJxpM1hr8NMDlUDp+o0E1pe/UOXwYafi/cvys7FfJR3h7UbNniyzOeyFRSjO+wBsBmmvJ1lrtxvKPTyAagffh/F6oNBl1IWngP/1SopRheU6JWRNQurt+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765475821; c=relaxed/simple;
	bh=r5Gh8BtQw4Fw6SZHXapts29EloHtVbCqPTTFyEp867Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRlbuWJwQLrENvRdsuJqFl4TXowIiIDlEySHUsCnD9L8kT6J7ol2nsTYb2VaEcY/qKMiD+sIzykvfdrCp9yWGSUyhRJi0ccsN3FMMXgQ05ds1uDnlQHq3LOj7eleaw9BlKgiKFFxHyeUxL3aWFzcdFLY/nWDLmhYcrJxmikJh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBqdaish; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29d7b019e0eso4862575ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Dec 2025 09:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765475819; x=1766080619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uIdEFMeZvO+edU0KvHNYdR5fL5Tb1DJ+OTZWn9o/+ps=;
        b=ZBqdaishJkKsWefUqBXJYS5dL9mK3ayfHoIJj7ZO3VlJ5nT3QwQ3L5U5RoQ6zveAdo
         ot1/VLM1eXqL2FSpuWWlT1zalbvD02rsULPmJBss1ytTFjlGuqiJ1/ZG6b8d8yMrOc0S
         m7GrSYhA13fjgJ7Vy2K6pJoyUEdqVZYNxU/QwufGJ3sbbGgup0JoGs/g+JPLyxwqqW/U
         ityDJtybZRb4X68h+cVj52HLn8icP7XhEMJ8eAcFdiVVG6q/VJmts7eenAilJ+UI3CtF
         tKatkyGHaFlY6nG4Ojjyz4ATdoqViR9LDawQIJ4e7dVHsnjXUKQv/tKU5YGo/WcaZvn0
         9nCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765475819; x=1766080619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIdEFMeZvO+edU0KvHNYdR5fL5Tb1DJ+OTZWn9o/+ps=;
        b=UsQJMJkfCx1hufdErC5c8mW6UwJj+CrqqufprvtZVWcP3ly8fb2ONWJcXytYWrEung
         JlB/ft8782Qd5rOQugFiLw/386ygdCaGo0/gcg/FVwXYbs9x5yOK4KYMcmNMcaBwTfad
         Ugph1XW2vyPWUaFC4EOuMrknqQVLMbSF1UI6KvDx5F9JX03Cz8r0ENR8awJdjtRYlwyX
         mL3WBUUZ1T8ScH06P8YEBweuI59yMzQOcLJmZKuMkOsoEitx+arD6VPIPEETu+1GfA8v
         9hK+IAICaA+04u8ZfNQKM9sjLPybM1uvKQymaZrd6f2oBAKLW1K3pPkMV0wc2e1biLkP
         b+Og==
X-Forwarded-Encrypted: i=1; AJvYcCW6siS59yhKUwIq/M3jGKo4DivXAvfiSfSn3ZKLJ/g0VhW+B/Ow9VJPzsOj8D/UXE33juEmJ4hT3IZt@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZJFdjUiKIjghIe7ur0L4J5jp4NdzY/fsk5GcCLsLYfYXKy3Z
	wmOUeoamI9s9MsDsuXXSABcDsaPOUYmJhAcuwa2AZzgCZgG1WsLMHjgSbLIXMQ==
X-Gm-Gg: AY/fxX6p7mLx/FHZYT6a75JDr/5pBk8zphGTSMSGB7k7VFy3KdbGYPEAa5yV/XUMICN
	1evbJLHfnVzKOIbqgzWA/TvHae+/gfjrIbHvs/JWU9IrEIh5BkWY90GswwapNTrVimZFWORbsTN
	z1L2gvke82QY+WO7sMXp1PD71QATGR9xsizXkD2XSoqEXoMXZbNkDr51ewzNFHKf8Rvun2c59vm
	PxySbZ/B2isJJerk9qptVt7KZehX/wwPOnVX9EQK7VGnob7H83R/Icp/d4uQD6PqSpv/CsKLR3m
	aMaOeeHOC5WnIi8xXG0/tb+gCTLJn2qESfVjG0KsEN7lM3az6IIsX3YWYYSpNhsOMFZ8pG3U3gP
	SYrG/dSNfUtyVocgL2V9//Jhr9WvGnnp9hMTfVLcGHdYxGVdp2mrCFMQeILCn/3BxSh7QJLoted
	17OjVgTSc/sqIciKIxKf4hH5JgLoS79ZE8h/tIDwIwdoczopdXNywtTpqiFjk=
X-Google-Smtp-Source: AGHT+IFQNogpPMRzOu6d54PgBmI9xY54RYNtpQ6LYKflW4Gkrdm1ZiKCI55gcE3/d1GJBHRREX5iNQ==
X-Received: by 2002:a17:902:ea05:b0:298:68e:405e with SMTP id d9443c01a7336-29ec27f9101mr80990845ad.59.1765475818731;
        Thu, 11 Dec 2025 09:56:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38ad1sm30521295ad.29.2025.12.11.09.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 09:56:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c9cb3a2b-da6b-42a6-87b0-7a2b780f5ad8@roeck-us.net>
Date: Thu, 11 Dec 2025 09:56:55 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/4/25 08:15, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Support the LTC4283 How Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
...
> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> new file mode 100644
> index 000000000000..d79432678b84
> --- /dev/null
> +++ b/drivers/hwmon/ltc4283.c
...
> +
> +static int ltc4283_read_voltage_word(const struct ltc4283_hwmon *st,
> +				     u32 reg, u32 fs, long *val)
> +{
> +	__be16 in;
> +	int ret;
> +
> +	ret = regmap_bulk_read(st->map, reg, &in, sizeof(in));

I had a look into the regmap code. In its current implementation,
that will work as long as
1) regmap is configured to not cache anything
2) the I2C controller supports I2C_FUNC_SMBUS_I2C_BLOCK

I'd personally not want to rely on that and implement driver-internal
bus code instead to handle the varying register width and to be able
to utilize regmap caching.

In the absence of that, please add a comment to the regmap configuration
stating that regmap caching must not be enabled. That comment should
explain the reason and the dependency on the current regmap implementation.
Also please add a check to ensure that the I2C controller supports
I2C_FUNC_SMBUS_I2C_BLOCK into the probe function.

Thanks,
Guenter


