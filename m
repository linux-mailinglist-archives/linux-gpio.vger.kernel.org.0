Return-Path: <linux-gpio+bounces-4603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C25A788A620
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 16:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6E56B3C9BD
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 13:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25BC142E80;
	Mon, 25 Mar 2024 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4pLzvu1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B92170ECD
	for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711357811; cv=none; b=OtdiMyCgAGQxMmhoGKnuZvnnvS2TV2kSbrjatG34uXKZMTjMcKj0/75vt9TPFCBZfrzIp6jIEjD3GgBzMhg6vGN1IXQGmVQkCsiZ1R4oAClAVHFiouBLZKY1z2cOfWnTq0MRTqLkxYvqO467NpvHdGaJX772U6YG+2rhNm9JYLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711357811; c=relaxed/simple;
	bh=MVC+1NryoOrJX8WjctfL6cojbCY4sx3EDnRc4UY49fA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pVT2ZWGbvOjPuAx1wUf6oZgz+mBTJYVXsokDbphWwBPTh8fHVlQXXI5UBpHcSkUMQu+0Wk2863JKgXhS4EO3HZDUk7KvXXWPOsDDogrWl+NBEF2Gke00j9QpXwtGsg+9sIqTHd4qzH4wvYoAAOSbK238sFKOurtTmj+E1aCTxyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4pLzvu1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513cfc93f4eso4389167e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 02:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711357807; x=1711962607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aD1cN8szRSMxO3IVBp2PA+D27BKP1mIpHeo/IVwH7JI=;
        b=W4pLzvu1QeQGq0fhapvHzKSKX0DfkNAIaMDM+DguRd7U8Glv12vDmCuSuFZVHVhvsu
         vKxsP9HNE3FfFUvi/qxi2bZJXWax4cqQt1uUCYWhm2t5iX4cbmaz8rH5vWyNvESlvnmO
         0TGDXDh6y7gevfiHbKU9lWcDl2FlWxpsLDiJcMAP91z5Pgt/SOyq49QFU3/Ek7JLHSDQ
         tP217vE2B6sxtb1r8GjEat23D8TsS9sS6qg7S2JOh/HSHAC2+0GpWblrz+wwzho8To4g
         K8dxAMpZnrMyNnX6lGTRqVhu8LPuuSgp57qGAypg2HMOSjTIrfPqbE+1ollotiiZcYjX
         M5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711357807; x=1711962607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aD1cN8szRSMxO3IVBp2PA+D27BKP1mIpHeo/IVwH7JI=;
        b=R+K9xxNE/SBZxGHEOCaenktaI8ZFVRn9C/LVPtxfbiE5DTQX260xcwLYlZtQfHYqKi
         flGigya5u8m9l30o1W48ciUHllp/JQr8261N0fhRe8j3LCZehf8yVBo/gGR+ZqOFc9Sn
         1XyfMeqYOkfsomkfrB9YPSZzygrRQjXDXxt69z1Iol6psaUVITAWPUvlVEcpUP60ZcMJ
         0u0FH/re/i46QqeWN5GCqnEza7e6kU0VZ/hU9U/9qem14KVHEqRcrRvDcu5XSzOdp9vI
         yDwYLyaLZmP/UijIytthz7PmKB2WXryz1Fc3QkdHsqhKZCVjk8j9dppTDm9wvPmjfRPo
         TPhg==
X-Forwarded-Encrypted: i=1; AJvYcCXSKdGzxmcQZIRrhOqfgbcqtAqlMn6JmiFUEUbkwDI2MCNbA2qCG/5quxOIUSXvcP9bZlDT9vYpmaJWSlyG1FM4HzgbTGZRFzhfnQ==
X-Gm-Message-State: AOJu0YyZIUmlA9DWheZCPpPgiUmK1vzolY+ZDW36xi7H6HCaaKvUnCmX
	S9JuMjq3T+BLgQQD3KggEBKtxTmLsLnSOV4YNOS7dG16zfUSM9sk
X-Google-Smtp-Source: AGHT+IHjCBUOy94j2CvEre/QAbDy1ckEeszdxhgFO9te9Xg1xdWSwRZx6LcsWrpuC1tNkTBe+KhyDg==
X-Received: by 2002:a19:2d0a:0:b0:513:cc88:e1b with SMTP id k10-20020a192d0a000000b00513cc880e1bmr4342156lfj.61.1711357806364;
        Mon, 25 Mar 2024 02:10:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:7426:df00::6? (drtxq0yyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:7426:df00::6])
        by smtp.gmail.com with ESMTPSA id o7-20020ac24947000000b005132f12ee7asm991001lfi.174.2024.03.25.02.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 02:10:06 -0700 (PDT)
Message-ID: <0352287d-cbd0-4ed7-8551-a23191487279@gmail.com>
Date: Mon, 25 Mar 2024 11:10:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, soc@kernel.org, arm@kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 linux-gpio@vger.kernel.org
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-4-kabel@kernel.org>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240323164359.21642-4-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Marek,

I can't say I did a proper review but browsing through the code without 
proper understanding of the platform raised one small question :)

On 3/23/24 18:43, Marek Behún wrote:
> Add support for GPIOs connected to the MCU on the Turris Omnia board.
> 
> This includes:
> - front button pin
> - enable pins for USB regulators
> - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> - on board revisions 32+ also various peripheral resets and another
>    voltage regulator enable pin
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>

...

> +/**
> + * omnia_mask_interleave - Interleaves the bytes from @rising and @falling
> + *	@dst: the destination u8 array of interleaved bytes
> + *	@rising: rising mask
> + *	@falling: falling mask
> + *
> + * Interleaves the little-endian bytes from @rising and @falling words.
This means the 'rising' and 'falling' should always be little-endian? 
Should the parameter types reflect this? Or should we see some 
cpu_to_le() calls? (Or, is this code just guaranteed to be always 
running on a le-machine?).

> + * If @rising = (r0, r1, r2, r3) and @falling = (f0, f1, f2, f3), the result is
> + * @dst = (r0, f0, r1, f1, r2, f2, r3, f3).
> + *
> + * The MCU receives interrupt mask and reports pending interrupt bitmap int this
> + * interleaved format. The rationale behind it is that the low-indexed bits are
> + * more important - in many cases, the user will be interested only in
> + * interrupts with indexes 0 to 7, and so the system can stop reading after
> + * first 2 bytes (r0, f0), to save time on the slow I2C bus.
> + *
> + * Feel free to remove this function and its inverse, omnia_mask_deinterleave,
> + * and use an appropriate bitmap_* function once such a function exists.
> + */
> +static void omnia_mask_interleave(u8 *dst, u32 rising, u32 falling)
> +{
> +	for (int i = 0; i < sizeof(u32); ++i) {
> +		dst[2 * i] = rising >> (8 * i);
> +		dst[2 * i + 1] = falling >> (8 * i);
> +	}
> +}
> +
> +/**
> + * omnia_mask_deinterleave - Deinterleaves the bytes into @rising and @falling
> + *	@src: the source u8 array containing the interleaved bytes
> + *	@rising: pointer where to store the rising mask gathered from @src
> + *	@falling: pointer where to store the falling mask gathered from @src
> + *
> + * This is the inverse function to omnia_mask_interleave.
> + */
> +static void omnia_mask_deinterleave(const u8 *src, u32 *rising, u32 *falling)
> +{
> +	*rising = *falling = 0;
> +
> +	for (int i = 0; i < sizeof(u32); ++i) {
> +		*rising |= src[2 * i] << (8 * i);
> +		*falling |= src[2 * i + 1] << (8 * i);
> +	}

Also here I could expect seeing le_to_cpu() unless I am (again :]) 
missing something.

> +}

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


