Return-Path: <linux-gpio+bounces-11900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB49ADC37
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 08:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98195282B68
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 06:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4634817BEC1;
	Thu, 24 Oct 2024 06:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8lNv9h2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C815623A;
	Thu, 24 Oct 2024 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729751485; cv=none; b=B19h5ranLSvSjHYyJ16Ol8iDzClXjXhF6stQkbdnXj0Ngb0h8j331YbK/qQgFUEmnfwDwiLajdJFq80AG2TcPur6JIscVYTEEws7W3hb9QaCP1JYIOzy6VMuWpCpcFS2uHbnkSUcTOPpKLLwbO7BoLXm1baaive6qvp14e+yXNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729751485; c=relaxed/simple;
	bh=Ij+enuGGwhnSQf0L8zcd624aPDGa9zWodQg5KZc5MnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCQkFs13wQ6cq6eaTEqI86laM/xbxx0Ay5iu3tdJyqe7P57tRYaVJqzuU77vzI2mnpS6gHjoStgyHh0fT2BnIjlFGEoQC7lRgZI8W0fdzzb02QWRiOpCXuZ/4VgE9e+o9FhnjwNfDhEiu+LSdNEAewPzhdWHP/A2cK+rpcseB/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8lNv9h2; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so835173e87.2;
        Wed, 23 Oct 2024 23:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729751481; x=1730356281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eg0Qoo+9T4bkNwhbFJqsnN7oQTW8RaVNg80QPE49Fyo=;
        b=D8lNv9h2Uve0kff/zqEb+vhJuAyYufO456FapnGyET0EECtP8pOq2bYggz+5UBqQ/C
         ZxRKPgWwYMRWpQqhsXXCACom/Mq85fECZ0WVhFFVGcTKVxDjsh8nFyFsLKdyyNeE7F/r
         B+Q8laD/ZckuMzfC0+0DmyxUbVQFkKApbLYRS38DpR+1P8jlxZRfPFasvChjWzeWr5al
         jK4F1gRNyOsVkprwaHZ2MSY+N9x5HfjcrWNAT1n4qwWUy3+Uhz0/lg2Yymh7VB+qb7xR
         hZfh37Kmh1rTPvDSm5/ZglVPa+WLGH9pAI0ZwK+n11vcIJjOJhRNSWn02tqt/6e0rK0H
         so9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729751481; x=1730356281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eg0Qoo+9T4bkNwhbFJqsnN7oQTW8RaVNg80QPE49Fyo=;
        b=lR8LNIxRQh0v3wE2kTHGuue3P710gozgRmDyBZZAhH5uhEBX3hu5bGAekB7GQ9jaAG
         BqHkFujmq/RaVPWIaX8/VRNNLFp7KOqVZOU1lx1w+irlJWnkaRn4KmI791djncHErO2A
         VY1Oq4lXzV2It3yIyynooPtMeAHdaqeKFQ52Zedr9AMg60yelq3h9mbhV8QrRUEenPX0
         6xdvuDyU78fSkCIG4P+nyKysdFJpESbFA4UcZvOmqyKeywkRjzlP8zsTaORsN6bvVGoY
         9YvIvnzWn6CBJWUCqH+sGj9pSbt+U2/ugao9WTNQW86YOTcC/pw1ZP12oHQdK2RKgUe5
         exGw==
X-Forwarded-Encrypted: i=1; AJvYcCUK4+AVWlP0ed/4Kaar3bGRf1v+QAEKf/w2lHWM5KjCuaOASA5eJbNz20iN8kKf9qI8l+V7IculbPAU@vger.kernel.org, AJvYcCV30YVRggWOqd5Rkc7QgdT/Wvq9Tw1VFAalu1/ON1kaKapneuBwgflh7OKiIxUKEVVPb4/6vA8u8HZ4sHhlR1fig3A=@vger.kernel.org, AJvYcCWy0ZLrl5D8DZwRCo0DvttD/JtQRotL60CZfLR7lIJKxvsMp0OQeWpapWrhtmHVA+DrIRjQDChAKTtUZ8KQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzXSKlVL7HGt9OdI7bDzllK3QOJZTxE4EsenzOc4c7rg6cgh7Yy
	GaSXiaPWzBg1RrhmWP8z1h5PeZB5jwOdn2Vz/njmu/dydl005o+y
X-Google-Smtp-Source: AGHT+IGTgCMu/aYTxbn5o/iwDHWcRkcznRmu5yktlW+DSiLgJIFiLKd8i11LIYEetT8aCjJiqsVtGg==
X-Received: by 2002:a05:6512:3b90:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-53b1a3b014fmr4477340e87.57.1729751480750;
        Wed, 23 Oct 2024 23:31:20 -0700 (PDT)
Received: from [192.168.35.18] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912f62cbsm568507166b.76.2024.10.23.23.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 23:31:19 -0700 (PDT)
Message-ID: <beeb2475-dc82-485d-a984-5d6554a4c379@gmail.com>
Date: Thu, 24 Oct 2024 09:31:17 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] arm64: dts: exynos: Add Exynos9810 SoC support
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
 <20241024-exynos9810-v1-11-ed14d0d60d08@gmail.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-11-ed14d0d60d08@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/24/24 01:36, Markuss Broks wrote:
> Exynos 9810 is an ARMv8 mobile SoC found in various Samsung devices,
> such as Samsung Galaxy S9 (starlte), S9 Plus (star2lte),
> Note 9 (crownlte) and perhaps others.
>
> Add minimal support for this SoC, including basic stuff like:
> - PSCI for bringing up secondary cores
> - ARMv8 generic timer
> - GPIO and pinctrl.
>
> The firmware coming with the devices based on this SoC is buggy
> and doesn't configure CNTFRQ_EL0, as required by spec, so it's
> needed to hardcode the frequency in the timer node.
>
> Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 525 +++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 256 ++++++++++
>  2 files changed, 781 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..4b2ee59dc7241b0ec31c99fd909d1c5e25aa77e0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
> @@ -0,0 +1,525 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung's Exynos 9810 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (c) 2024 Markuss Broks <markuss.broks@gmail.com>
> + * Copyright (c) 2024 Maksym Holovach <nergzd@nergzd723.xyz>
> + */
> +
> +#include "exynos-pinctrl.h"
> +
> +&pinctrl_alive {
> +	wakeup-interrupt-controller {
> +		compatible = "samsung,exynos9810-wakeup-eint",
> +			     "samsung,exynos850-wakeup-eint",
> +			     "samsung,exynos7-wakeup-eint";
> +	};
> +
> +	etc1: etc1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};

[snip]

> +
> +	gpp3: gpp3-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg0: gpg0-gpio-bank {

gpgX comes before gppX, sort all the nodes :D

> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +

[snip]

> +	};
> +};
> +
> +#include "exynos9810-pinctrl.dtsi"
> +#include "arm/samsung/exynos-syscon-restart.dtsi"
>

