Return-Path: <linux-gpio+bounces-15564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CE2A2CAAD
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 19:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CFB53A8CFF
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 18:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD41019CCFC;
	Fri,  7 Feb 2025 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="O4Y/n+QO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7962E40B
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951230; cv=none; b=JFNZQDXEJ1f3bX//GWNWjGxW3xx7fkh/WT/QbKliCnIy6J8+PDJN/5aqrQlqDautjxR6fw1gklHGaeYYHN0lRz37TtjrN+vtZhC9ZM/GSSI2ujhj8W2r0eHu7fXrnK7HkVFXNwbeIqBG5NEfUXAHwRZBnCWwao6gsyUcpZtUvwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951230; c=relaxed/simple;
	bh=ebmbm1SA2evPzgRYp3musNvOVbJxxqYQ6sgiHGaC1e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+I7fVPaaR99aNkAKn54ZbtB6bq0nOaxO1gvg6622hhDPaw02PAU6JefPYUbwWgDmw1TDx1FdmXKBkwCa1M/sPRym8Dwbuo67HWt3/bFegjE1R4djKM9bzQuptRQEN+t/fQh03eZfVJRrfekbsWciej2x27AohTlR9uXAHgIEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=O4Y/n+QO; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3ce868498d3so6825045ab.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 10:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1738951227; x=1739556027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMNhNJkx3fFqX0U1Zs6VO58/T6R6XQxl18p8Q1ICoic=;
        b=O4Y/n+QOBNRrBk7QTzoyn3uMRTV8tRHVcn9JcG3GqXb1MCqHwxixasu8tUQzDuGM6+
         8PSTVkJqx1AXtPSvnla5KJH/G0s+T2ZtGcl2CRPrVcGJ7bxc9fH0Elbuigips209+a0W
         tMq8HfS29LAvWg5OlMC+0Hr5O3YF0ENRAQowl+LcYWyyMXjXcB578vCE9VQMCX/1mSe4
         B3R2ux4TGQD9ZNHNsN3nSvB4kJBFn0l/Fy0VO4Z2xmj06qzckgpvU68dJWtyjCNWwsUW
         +pCDF3+BnIq6bZ1U3GHsYUxSS414ZWxNSFrxWUUcW80pQ2IwHdpTwdvHp0HVPOqDZGmk
         0N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951227; x=1739556027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMNhNJkx3fFqX0U1Zs6VO58/T6R6XQxl18p8Q1ICoic=;
        b=dy1reU5iKm4/SDUBqF5/Tb35XOLrnzcKprUTEUA7/22Xoj8bBt58CGKzuiKnd+NF/b
         HXK5FPpLbzGClos4vaD7Ev1t9xVLZIUHDvykT2dHiDAIg/7cFu94440fWea2qdwQMZ1h
         GKBgf6QYrpN2FfsLfwMI9NVDAhZIHVKbZ3mdhq/MqCOTI50PPRHwIvrNhCt5WWbxWQ94
         2ZEpDqy8p737Fdq/TQ/zt13CtDMdGva+YX/TthIwg+oGWLE0DQ8DiKxP82v+GxJke4TE
         YdGpsxJgCu/kbQ3Ve3DWmSaWFmy0fFNKQUeXgYB3MdxWM9Yijzcnw6tCd0caiR0wevT3
         nTnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPGRZ0OnFQnknK106ciPI5+sd7lI5RSAq0NcBmJv64F8fjDjaGPRgjXjppf536Qyo+U2qatxGhL3U9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr/sq9xZcdlFhWOm/KTc3FFwvgpLUepPErP9L3qvhoNA2iAqOM
	5sx/4IhAZwo2kBnCnsH2J/lBKM9c5s14jpsbM0mbv+iBTgn6HiSbu6qkvz3gMT0=
X-Gm-Gg: ASbGncv8cEvxzl4Up3NunROalp+ja5iGgWslBRPyOST8lEy2gv9Qv0YKp6CastWL2Rc
	b4Z0yf/LaBZ1Yb7KlNjD1j4x6O9LYzjJT7HFyGvCg5cSaxIv/LDXWEjTU5b4y6wq2KsZK0xA4OU
	fdRHwM4vJ7tq0zwcSQe1B3jlWHjRVe0nStn/F0VZIJC4G+upYvMSYaiGl3aoEzwthv6uSkZQgn9
	8O7sehN62eOIWZDtPgzxuMmstBhrzoIs9U949h0vsoykheHPt9/cXKDDHBKINLFMCh48csG8YQz
	gCkLm2ueOQ1aSYehnwurQCaGp/Q/GrBWJC8LgkdL9P6Rk06qW5r059U=
X-Google-Smtp-Source: AGHT+IGt1SBRGKsD6WpAiEsXocNvoOHnb4Bn+U0x/Qz/EiAOgMhIEF8/efAO7K9USdddQwvdoBY1EA==
X-Received: by 2002:a05:6e02:20c9:b0:3ce:4b12:fa17 with SMTP id e9e14a558f8ab-3d13df1d891mr32114905ab.19.1738951226514;
        Fri, 07 Feb 2025 10:00:26 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d05e9a0e52sm8627095ab.61.2025.02.07.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 10:00:26 -0800 (PST)
Message-ID: <8c43a1ac-ae57-4e90-a791-3f1eb61b6c70@riscstar.com>
Date: Fri, 7 Feb 2025 12:00:24 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/25 6:11 AM, Yixun Lan wrote:
> Pinctrl is an essential driver for SpacemiT's SoC,
> so let's enable it by default for this SoC.
> 
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.
> 
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.

Thanks Yixun.

Tested-by: Alex Elder <elder@riscstar.com>

> ---
>   arch/riscv/Kconfig.socs          | 1 +
>   drivers/pinctrl/spacemit/Kconfig | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -26,6 +26,7 @@ config ARCH_SOPHGO
>   
>   config ARCH_SPACEMIT
>   	bool "SpacemiT SoCs"
> +	select PINCTRL
>   	help
>   	  This enables support for SpacemiT SoC platform hardware.
>   
> diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86bc555b2b90643adbdea 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
>   	tristate "SpacemiT K1 SoC Pinctrl driver"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on OF
> +	default ARCH_SPACEMIT
>   	select GENERIC_PINCTRL_GROUPS
>   	select GENERIC_PINMUX_FUNCTIONS
>   	select GENERIC_PINCONF
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
> 
> Best regards,


