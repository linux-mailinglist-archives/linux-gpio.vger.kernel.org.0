Return-Path: <linux-gpio+bounces-8611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57694A391
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 497C0282904
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7981C9DFD;
	Wed,  7 Aug 2024 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J75ezucW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1613A3F0;
	Wed,  7 Aug 2024 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021613; cv=none; b=H3iCVuSKzdWq32vLckdG+bhp5G+azaKc0MZK8j6Lfsy9rmvxJwj+8YXas8OYzzXQsZVnpj7C2i2QtwghlyRXRvkD345ycDGIiyAflW1iH144SYkLmkxiKfsz5MD6S0Qlg9JVFBiGK7hzCm7F8X1G2h9UhOmVoIaC8lJHpsylM7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021613; c=relaxed/simple;
	bh=LoM9qznV0IlQTaUDNlfNn2R0PKStHWfD+gtr7Cl9FwE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RjITB7jqrYtgAyj4xcHbSnJZFnfngtI79xB20gJtMu+zo7+q98zwDP7BsMOPovHdPFgiFGGp3ZVruK9ZfWPhn4t5TCNzk3vHVJ6ogb0daHn3id2Gd+4mEGZpITNj1ojbp8ZJ46pFFN1J/Mh+LDd9bg5sgkWUCJYHBK5bSDwjsdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J75ezucW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so10541705e9.3;
        Wed, 07 Aug 2024 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021610; x=1723626410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSRzgmeCCQAVMTySTj2A9ia0afQrp/O2UyDWk6Pf3Yc=;
        b=J75ezucWR/oAFMejVlIKTkxp2jLjVvvkrfES980lXO7UO2HkRX8pM4sid7Q0GkBuRq
         4ikABTAEdppsrPBT77hHfawqCJpaD8xk3j+VKaIw3omAW7DXAKNC5yyti4gsh2VCSgJ5
         g5ViSTOd+rfL/Tehb+NvS9ufgQFC5qkiTfPTQPaTWLluZZ8+RvDyiQ13tZZKXAgSs7WW
         zVEEb/XAiE959LtfOJCTpXPTR1+cn0tqBB9OhcOuXTVpIFibOSUU17SbG6D+9SMXslS1
         JfSOVAJSkZU7QEoh2EG4Yb48yIedpb6wgrWjrZcuXf2l/M8Yn8CmTRnkN9K/e2w6iV4a
         DI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021610; x=1723626410;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSRzgmeCCQAVMTySTj2A9ia0afQrp/O2UyDWk6Pf3Yc=;
        b=JbsWkkfbTMVMIYDGNIFmhGcuO10euLNWt+7boGxMi04JWbduF4vhRTfVR6K1t7OxYq
         8TZAobFX24bgTR6GKoFglumayrTA2M05I9CWjPg2oIQKzXKXPXbJW9grbJKBfMdBqjPt
         c/tdAvoX+jFe5o1Q5V4VB/wk98b4Fysxqpm6AxfJfhbUdXQYpigUIFBVdBofHMWfWAE9
         G+I64DA9CzFc026dTDnzviHV/4jFfqEB9T62xXlZ0IVXqroNTxPAY7li65TxexAlppQU
         VfXCpcfiBH3/kccxVUZjldl6ShMDhxoM1ndonScCfKx1J20WrGuu98D0pG6IUf2tkwJu
         z8yg==
X-Forwarded-Encrypted: i=1; AJvYcCUhPiD+6vOmuwND4bqYQn5fvfkB32l2i6BOeQ11UJDXpHgKAm0m7LnSt4TrNYfXKTLBE4C3PzGxCT4rEqsRJKoBfA9LTKGt3IRvTOHithxq/dQJbWPu6F4BJs/JLywGTP4BUimIb33pCOoJeUDLeHQRVPIJPKrJHFuim9MRtxZdmv51svs=
X-Gm-Message-State: AOJu0Yy3oyBtK7SGQEYJc1P5L1iOZMjgHlNceM9rv0JkKJgAwEGL4MfR
	5x4QuuXUw/+JLE1ws4Q1papBjAFV3Ipy9VdVmWQUKUrtUK1OqyGc
X-Google-Smtp-Source: AGHT+IFMpoUHlHWlbkB3eohP4eK2zXUuP2QcpgMIHU2OX7c3gSoOvpg1ry/bFrW4WKHnDulUPU3WsQ==
X-Received: by 2002:a05:600c:578e:b0:425:5ec3:570b with SMTP id 5b1f17b1804b1-428f7668cfdmr55636105e9.35.1723021609617;
        Wed, 07 Aug 2024 02:06:49 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd06dfb4sm15336788f8f.103.2024.08.07.02.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 02:06:49 -0700 (PDT)
Message-ID: <f217cd23-88a3-e8d5-641b-482734c8f2e0@gmail.com>
Date: Wed, 7 Aug 2024 12:06:48 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 00/10] Add minimal Exynos8895 SoC and SM-G950F support
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Unfortunately, it turned out that I have an issue with my git

configuration. I'm sorry for the inconvenience, I'll resend a V2

without the sendemail.from.


On 8/7/24 11:28, ivo.ivanov.ivanov1@gmail.com wrote:
> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>
> Hi folks,
>
> This series adds initial SoC support for the Exynos 8895 SoC and also
> initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
> dreamlte.
>
> The Exynos 8895 SoC is also used in S8 Plus (dream2lte), Note 8 (greatlte)
> and Meizu 15 Plus (m1891). Currently DT is added for the Exynos 8895 SoC
> and dreamlte, but it should be really easy to adapt for the other devices
> with the same SoC.
>
> The support added in this series consists of:
> * cpus
> * pinctrl
> * gpio
> * simple-framebuffer
> * pstore
>
> This is enough to reach a minimal initramfs shell using an upstream kernel.
> More platform support will be added in the future.
>
> The preferred way to boot this device is by using a small shim bl called
> uniLoader [1], which packages the mainline kernel and DT and jumps to
> the kernel. This is done in order to work around some issues caused by
> the stock, and non-replacable Samsung S-Boot bootloader. For example,
> S-Boot leaves the decon trigger control unset, which causes the framebuffer
> to not refresh. 
>
> [1] https://github.com/ivoszbg/uniLoader
>
> Kind regards,
>
> Ivaylo.
>
> Ivaylo Ivanov (10):
>   dt-bindings: arm: cpus: Add Samsung Mongoose M2
>   dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
>   soc: samsung: exynos-chipid: add exynos8895 SoC support
>   dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
>   pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
>   dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
>   dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
>   arm64: dts: exynos: Add initial support for exynos8895 SoC
>   dt-bindings: arm: samsung: Document dreamlte board binding
>   arm64: dts: exynos: Add initial support for Samsung Galaxy S8
>
>  .../devicetree/bindings/arm/cpus.yaml         |    1 +
>  .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
>  .../hwinfo/samsung,exynos-chipid.yaml         |    1 +
>  .../samsung,pinctrl-wakeup-interrupt.yaml     |    1 +
>  .../bindings/pinctrl/samsung,pinctrl.yaml     |    1 +
>  .../bindings/soc/samsung/exynos-pmu.yaml      |    1 +
>  arch/arm64/boot/dts/exynos/Makefile           |    1 +
>  .../boot/dts/exynos/exynos8895-dreamlte.dts   |  126 ++
>  .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1378 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  253 +++
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  137 ++
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |   10 +
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
>  drivers/soc/samsung/exynos-chipid.c           |    1 +
>  15 files changed, 1920 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi
>

