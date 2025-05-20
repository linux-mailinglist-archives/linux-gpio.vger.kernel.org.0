Return-Path: <linux-gpio+bounces-20363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 890F1ABE5C5
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 23:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A182A4C7508
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 21:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C927025C834;
	Tue, 20 May 2025 21:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sU6jClWs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B43D259CB4;
	Tue, 20 May 2025 21:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775363; cv=none; b=gs1mtzZMqgifcX5vYS5mhcGDmi3z3+gXFh1BMQdGyUedFdgsllbaM+hFgEQtqN+iu0nHrBSIH/UBfkzN66FybES/0hKiQ0H6AJeE9q6W+QnT0i4oxEjRyw10NINMCdkeTCjn/V6O2AaVivwMrxQacRV6OSj4o8C2/+SM2ePrkbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775363; c=relaxed/simple;
	bh=8MZhlSQAe5gVmxQtnmmdZj0u/4gjdgG9U3iIB+4i5AY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OTVFTh7O18JbfmGWKgSnO8zHZA6Kd7JXW/9bfxaoz40yd9Im07oGgtjszlLz5tlG+Kh7rXEdmUc8jmtcmHkFeTi6hmmflCvN50boT6furjTln0Lzb4CcqVnCa++FNZQ5s7idz7HBYj1ybZjvzM4QeHuDcXp/o+UcjkMY+O3UPBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sU6jClWs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987ABC4CEE9;
	Tue, 20 May 2025 21:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747775362;
	bh=8MZhlSQAe5gVmxQtnmmdZj0u/4gjdgG9U3iIB+4i5AY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sU6jClWspgkpv2dehzi1TrbuWk3Z9mDZtkT1GNFzifWrFSUMf775w5kIeQdWv3O26
	 0j5mkuNjXj6Br5yBZljjQ/3P+cLTxJXwdhvyGfJBiJi4B7QH/oufhOp666kFFdvnsc
	 KDzBkhySlkCzuCR6c5bW0yIA4gdy8+GvT3NYhREQcEn+LUcyq5M1PbNon+XjbDmKuf
	 vH6zLcvz29455odjaMmXY4QsjRkd6UNUyzW+RaGTHhxlP4GfHEoZswQrXrWqzTunE9
	 p0dsr2b/xKeJtjzrGBTwcY+my4rMDuCPGQxsocarwR5WA2sGML3RwohLCB3B4NBJdb
	 TKA7SCG5dOFpw==
Date: Tue, 20 May 2025 16:09:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
Message-Id: <174777533581.1435243.228426835513916964.robh@kernel.org>
Subject: Re: [PATCH v2 0/8] Introduce HDP support for STM32MP platforms


On Tue, 20 May 2025 17:02:27 +0200, Clément Le Goffic wrote:
> This patch series introduces the Hardware Debug Port (HDP) support for
> STM32MP platforms.
> 
> It includes the addition of device tree bindings, the HDP driver,
> and updates to the device tree files for STM32MP13, STM32MP15,
> and STM32MP25 SoCs.
> The series also updates the MAINTAINERS file to include myself as the
> maintainer for the STM32 HDP driver and adds the necessary
> pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
> Changes in v2:
> - Remove bindings header files with function name as #define
> - Add match_data with function name for three compatible:
>   "st,stm32mp131-hdp", "st,stm32mp151-hdp" and "st,stm32mp251-hdp".
> - Rework a bit the driver to use match_data.
> - Remove the use of `dev_err_probe(` in the resume ops.
> - Remove `MODULE_ALIAS(`.
> - Remove the vertical bar in bindings description paragraph.
> - Fix an error in the `pinctrl-0` parameter of the binding example, it
>   was refering a node that wasn't existing.
> - Use uppercase pin names.
> - Link to v1: https://lore.kernel.org/r/20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com
> 
> ---
> Clément Le Goffic (8):
>       dt-bindings: pinctrl: stm32: Introduce HDP
>       pinctrl: stm32: Introduce HDP driver
>       MAINTAINERS: Add Clément Le Goffic as STM32 HDP maintainer
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board
> 
>  .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     | 188 ++++++
>  MAINTAINERS                                        |   6 +
>  arch/arm/boot/dts/st/stm32mp131.dtsi               |   6 +
>  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |  25 +
>  arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
>  arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   6 +
>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |   7 +
>  drivers/pinctrl/stm32/Kconfig                      |  14 +
>  drivers/pinctrl/stm32/Makefile                     |   1 +
>  drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 736 +++++++++++++++++++++
>  10 files changed, 996 insertions(+)
> ---
> base-commit: 09fac5c576bbff764dddf2baca0038b359376fd8
> change-id: 20250224-hdp-upstream-622e5da14a9f
> 
> Best regards,
> --
> Clément Le Goffic <clement.legoffic@foss.st.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 09fac5c576bbff764dddf2baca0038b359376fd8

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/st/' for 20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com:

arch/arm/boot/dts/st/ste-snowball.dtb: / (calaosystems,snowball-a9500): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: /soc/gpio@8000e100: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']






