Return-Path: <linux-gpio+bounces-17984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5336A70C62
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 22:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 556D37A2BE8
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 21:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE3A266B77;
	Tue, 25 Mar 2025 21:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JIZDf1IB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4731A8F60
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 21:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742939359; cv=none; b=Ml1LNjlpiRaPD3/f0rODFdfKQ5tN/UzgsrgQbJziR0DCxcvDaYfw5yL4fug3y7KzZ0iuhNaU5wauoz3ISEwhtTzzOjdEBb75gkioMEakFhAQ9NGb0MExVZNJMAk2gtr7HXIFjxkFAf7E2iYhciHgGu+VgbugvLz6tc5898Q7eKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742939359; c=relaxed/simple;
	bh=nwPA9SIOejPkzpLh4ULI5UAZazEYdl1cPdB+6K4iWgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6yPR5QKGyQ0BKxudx38VrVBl3O5GjwVlZFtCfASB9/yiVqkMOFZGEvcidj/OWifUEINqdteLi1pAyjCBbApONL1DbGhj96oEbXfAH2oAa77z1piSyw5G0NVv8N9S1cO/TzkRWnh6fdNDDYhC1YwbrHdj96em0IgdNzIuKhmP4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=JIZDf1IB; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85db3475637so9805539f.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1742939356; x=1743544156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3q3oNbCpD8Yr3ggdluYQ7Oxw70IpYfziH8ybf4Z46oM=;
        b=JIZDf1IBK6HRknqS/sEe4rhtGMl/yx8f7Pzs+nD/xM0r/y+7YzzjqmRa58iaGCQiOR
         yz7yDUaUw8qGsbNnJTtyrrmM+cRcKpq2GjdfDJTTTQFaGslA19DpP5iPjGLAkXtaVPxJ
         ujJDo8nSE62ff4soKYBtrB6bnvQmjMhjAvmbzl6TUJYRo4awdJ7XPxVnqEPV6099zjIn
         bCbZMx/hQpJObCxsFgdb4Js5mvGNG47DSi6v9553csCBN5NthIqktyDZsstHua04jnL6
         4uJL61p3HfdGWlUTWVhs+onO9SOcMO8iSBgVj5gyEpuvflXUYvnuT8omussBVMaL28k7
         12Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742939356; x=1743544156;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3q3oNbCpD8Yr3ggdluYQ7Oxw70IpYfziH8ybf4Z46oM=;
        b=XDVn5C1cSI70z/CnGq3H3ZXVkVy8eVbI6FvZZAV7xOm1q3am9KDG8hgyH2O8h1JIXP
         5D4IPjWmPvn/nATSH7WTW2T7QptRCqX8BYrzAYoa8iKuBZswnXBb81MHRjYqhoWuS6EE
         91xhGwDbw+dtOfHTXtNf2dQaytATkN7zLpfdprO9EfpY70gmoIgOZoR5Jke0xKiZUkoV
         LIofSIsvbd6SMRqOSeaG2YIcQfK5AczVkUQ9wU2wKpFHuI7OmQTHMA45jKjeGzs2Dy3W
         BFkC5kJvpAARKKwf9cA8zWM/0u1PDUuQA89nb2HOzRH7ooG+Ip9oYh05/4gbQMNYhdF8
         9W/w==
X-Forwarded-Encrypted: i=1; AJvYcCUlc8nTyuEx6lI48q7PV7SMKqKAv4vjXYB6s63eud8rw1nqa5VG2y42YIMmYpYTfA7Ry6Fh2naHANn2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3XRTnR14I4xSQH8dWaTYzqYzGO/k4C7CE179WNHWF0EmEql4E
	uq3EkCg3g3hlFuhW7plyprOQ8qh1TFk9V+/y/6LYZiOk/Ajty8zQ5bHo/gwWsTg=
X-Gm-Gg: ASbGncuhetsRZGYwURmbIeGjewvY93pAFego3+HC8W+zyUlzwsBlLeVzo4MUzMdR+A4
	6y9TSt3aMiGq44Mh7t6nvAup7woZ8DWGv5C1/EvAw9MWEUW2DP9DeAa866FNw8zi115kDlG4ZHL
	kuCsZUPSKd2/tB8N1UU+nti0houArnoX4ir/vM/5jg1p+KApCyH4Vmod43Hi5qN0xo0Qld/VdY4
	7bM0OSW9w273pPejIWtfbUwTcTdXE9t3NS9dqvpr3NbDvKVhM5A9SLrunoBepQKZDgAZpsGldIR
	13AJsraVOeBB3wMH7ugBqdYpiaTKVibpMjJN73RwgttyesoIZzE87ecpIFJzPQ==
X-Google-Smtp-Source: AGHT+IFj7uKpDfJR5Iim77+HbZSnDjrxpbs+tP0WU77QjYNPslcMwQz6BHnLAD6zLR0ygkvZ39o04g==
X-Received: by 2002:a05:6e02:4401:20b0:3d1:4a69:e58f with SMTP id e9e14a558f8ab-3d5c20b2c25mr15007025ab.2.1742939356043;
        Tue, 25 Mar 2025 14:49:16 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdcfeffsm2556607173.30.2025.03.25.14.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 14:49:15 -0700 (PDT)
Message-ID: <a20d5849-770e-420d-b707-83a50c37810b@sifive.com>
Date: Tue, 25 Mar 2025 16:49:14 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] riscv: dts: Add EIC7700 pin controller node
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>,
 Min Lin <linmin@eswincomputing.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, =?UTF-8?B?6bKB546J5p6X?=
 <luyulin@eswincomputing.com>, =?UTF-8?B?5a6B5a6H?=
 <ningyu@eswincomputing.com>, Lin Feng <fenglin@eswincomputing.com>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
 <20250325141311.758787-4-emil.renner.berthing@canonical.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250325141311.758787-4-emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-03-25 9:13 AM, Emil Renner Berthing wrote:
> Add node for the pin controller on the ESWIN EIC7700 SoC and gpio-ranges
> properties mapping GPIOs to pins.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  arch/riscv/boot/dts/eswin/eic7700.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> index 9cef940f07e4..7226647919b7 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -312,6 +312,13 @@ porta: gpio-port@0 {
>  					<324>, <325>, <326>, <327>, <328>, <329>, <330>,
>  					<331>, <332>, <333>, <334>;
>  				gpio-controller;
> +				gpio-ranges = <&pinctrl  0 12  1>,
> +					      <&pinctrl  1 14 12>,
> +					      <&pinctrl 13  1  4>,
> +					      <&pinctrl 17 32  1>,
> +					      <&pinctrl 18 40  5>,
> +					      <&pinctrl 23 51  7>,
> +					      <&pinctrl 30 68  2>;
>  				ngpios = <32>;
>  				#gpio-cells = <2>;
>  			};
> @@ -320,6 +327,9 @@ portb: gpio-port@1 {
>  				compatible = "snps,dw-apb-gpio-port";
>  				reg = <1>;
>  				gpio-controller;
> +				gpio-ranges = <&pinctrl  0 70  3>,
> +					      <&pinctrl  3 79  7>,
> +					      <&pinctrl 10 89 22>;
>  				ngpios = <32>;
>  				#gpio-cells = <2>;
>  			};
> @@ -328,6 +338,7 @@ portc: gpio-port@2 {
>  				compatible = "snps,dw-apb-gpio-port";
>  				reg = <2>;
>  				gpio-controller;
> +				gpio-ranges = <&pinctrl 0 111 32>;
>  				ngpios = <32>;
>  				#gpio-cells = <2>;
>  			};
> @@ -336,9 +347,15 @@ portd: gpio-port@3 {
>  				compatible = "snps,dw-apb-gpio-port";
>  				reg = <3>;
>  				gpio-controller;
> +				gpio-ranges = <&pinctrl 0 143 16>;
>  				ngpios = <16>;
>  				#gpio-cells = <2>;
>  			};
>  		};
> +
> +		pinctrl: pinctrl@51600080 {
> +			compatible = "eswin,eic7700-pinctrl";
> +			reg = <0x0 0x51600080 0x0 0xff80>;

Per the TRM, the MMIO range is 2M-128B large, so the size should be 0x1fff80.
Other than that, the rest looks good (especially, the GPIO ranges match what I
have), so:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> +		};
>  	};
>  };


