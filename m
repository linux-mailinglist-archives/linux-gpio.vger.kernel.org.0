Return-Path: <linux-gpio+bounces-10670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A98398CE18
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 09:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05D5CB21C41
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 07:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6712219415E;
	Wed,  2 Oct 2024 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFbWRqUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1771919412D;
	Wed,  2 Oct 2024 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727855433; cv=none; b=qyS96TWD0lSSEh6UXBnFI234awmVDc5nHilXbH4m/EF6QANdJu6cQww3aRoNiYzZ5BdVgH/fw1qxFBqDt0MvzazriIRKsbXX/KvmO3bmgHqoWlGIFOv54ULLDRCNqrjexLjYhMlmm/L/Dzr+1+9LBFIUMCSHfL+FM5hqMo8Zh6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727855433; c=relaxed/simple;
	bh=mQf39ivwGjVb+B5oYyEWPZflc6xtQNKUNAj9eNdA4jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDEd24Og3dqw5bHr+BMDm+h4aU4MXYPM9b7H9UwApQCQhvglhgyLP9yoxJwbe9+d6E/5mMBEKgmkQbaa3F1lSvAXQpLYWo8zq7F4+wA5VYIBEEYlS/ovuZ0bAW+MI9uJ32yk9uYBcEHfrn4vNfqAHy1VpIfNCJUcQElcZUUbok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFbWRqUo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD91C4CEC5;
	Wed,  2 Oct 2024 07:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727855431;
	bh=mQf39ivwGjVb+B5oYyEWPZflc6xtQNKUNAj9eNdA4jA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WFbWRqUo0z4dzOFAoCMaAPK9/G1mrJ8tTPodK9wWlG0hTVtm7wRecjDE9djzZTagf
	 o/i2FkiVFEOx1P46b68deaBoUeriZ74VlcRzfUOhyJU010GbAWGFjY8chQjJ6SKYeq
	 PYaTsFXS08ff/Svamqc4WBoeDwvN2Joi0x/AgT4J9fi1Way8wkvxMJRfv/Uv2+a3GJ
	 NSh3OhLwt7fmSKiWDL02fnFzaW17KqgqjQ4LIymCNzvq5uoFwOh7YzFCQa7YTOVRvw
	 szhYIYK8dIEFEegZO8+D5o6Hi8rBEQB0RGflfOnktNUCK/aGn1CmukWJhw1seQ8YgO
	 pbx7N2Caoux5A==
Message-ID: <0262c5ac-88c7-4934-a887-0d5b76289f4a@kernel.org>
Date: Wed, 2 Oct 2024 09:50:24 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] Add minimal Exynos8895 SoC and SM-G950F support
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/09/2024 17:44, Ivaylo Ivanov wrote:
> Hi folks,
> 
> This series adds initial SoC support for the Exynos 8895 SoC and also
> initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
> dreamlte.
> 
> The Exynos 8895 SoC is also used in S8 Plus (dream2lte), Note 8 (greatlte)
> and Meizu 15 Plus (m1891). Currently DT is added for the Exynos 8895 SoC
> and dreamlte, but it should be really easy to adapt for the other devices
> with the same SoC. It has been tested with dtbs_check W=1 and results
> in no warnings.
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
> Changes in v2:
> - No patch changes were made, only fixed the issues with my git send-email
> 
> Changes in v3:
> - Added a-b tags by Rob Herring and Linus Walleij
> - Ordered the Samsung Mongoose M2 compatible in cpus.yaml
> - Ordered the EXYNOS8895 information in exynos-chipid.c
> - Made the commit message for pinctrl support more detailed
> - Made the commit message for exynos-pmu.yaml more detailed
> - Fixed suffixes for the exynos8895 pinctrl device tree
> - Removed redundant nodes from the exynos8895 pinctrl device tree
> - Made the arm-a53-pmu node cover only the Cortex A53 cores
> - Added a comment mentioning the lack of a PMU model for Mongoose cores
> - Added a comment mentioning the issue with CNTFRQ_EL0
> - Removed the redundant fixed rate clocks wrapper
> - Ordered the nodes by the DTS coding style in all 8895 DT files
> - Removed the redundant status property from the simple-framebuffer node
> - Switch to dual licensing (GPL-2.0 OR BSD-3-Clause) for the DT files
> 
> Changes in v4:
> - Added r-b tag by Sam Protsenko
> - Resolved the remaining pinctrl node name regex issues
> - Corrected interrupt-cells for gpa1-gpio-bank
> - Fixed suffixes for the dreamlte gpio keys pin nodes
> - Reordered the dreamlte gpio-keys nodes alphabetically
> - Fixed interrupt-controller simple-bus unit address
> - Change framebuffer-related node labels to match other device trees
> 
> Changes in v5:
> - Removed a false a-b
> - Added an r-b tag by Krzysztof Kozlowski <krzk@kernel.org>
> - Ordered nodes alphabetically while keeping -gpio-bank's in front in
> the exynos8895 pinctrl DT
> - Sorted a few nodes and properties in the exynos8895 SoC DT
> 
> Kind regards,
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

One more thing, the way you mixed series makes it very difficult to
apply. Instead of applying few independent series, I need to:
1. Apply, drop patches (or apply 1-by-1).
2. Re-order patches.
3. Apply remaining 1-by-1 on pinctrl.

Please organize your series per subsystem. SoC is a subsystem. pinctrl
is different.

Bindings always go first, I asked for it already. And here everything is
mixed.

Best regards,
Krzysztof


