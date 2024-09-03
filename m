Return-Path: <linux-gpio+bounces-9656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461696A089
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49D2B1C23D53
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1A5189B8E;
	Tue,  3 Sep 2024 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9kNe6Bj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A21898EA;
	Tue,  3 Sep 2024 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373609; cv=none; b=dYVhwvMfiPYCM4MNoS70oYF3v981izzBz681DUPt4P2DD0J4q7hfVbszdReoLGoZfJHVmEOqE96ASs+aH7SPxh2u6d7czAumbNo7tBK7nXFV4/n1Ff/v5H2ABQ8UNFJ9TpwQE5M4fwTSJIPdX1Bq7f5Ve+CAma4bFZ7DZGw60Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373609; c=relaxed/simple;
	bh=1EzdlpZs3q7uuOeXlGHHUIIkv3ehXf+bom0i5XRFrho=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=EAZue5KCfBa/LdfHuj/qdcevMhT3caoRbwa742e2oOQkcLWv/N/cEYEw3OamyX0Z1i7GWmkSP9EW4K4wEUYEyJqkBC84baz3jsJz4LPAnq+4R+QqakjgVeMKj+cVoEWQJag7gxK9NsmOPXmBkrkvHuW61T+jJWVwH7a84QvDnWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9kNe6Bj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D9AC4CEC4;
	Tue,  3 Sep 2024 14:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725373609;
	bh=1EzdlpZs3q7uuOeXlGHHUIIkv3ehXf+bom0i5XRFrho=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=F9kNe6BjuehbUTMfgcTXZIuqk8Qh8Xp1IcFCkosaNvDqNOGmscr9+MYuz48BeNEQg
	 6BZr8yBGtq9t3hHo1qeXpgxPfh7ocAerglY2A+VghxDgvCmfUgf73EzQQsa9d/5ZhN
	 uKBQbBHBXyXhjgnj+QeF5+9iZxa9WSl/0sOIWtxeNX8ClgkMoRuDb9jbBwASrIULto
	 mRvwfbYww/HFKWJFynNsDFsh93CABXF8hXl49zqXkEk3OKRcOQUzjiF7DISn1Z6XUv
	 AdMtJL0YL7s/Oq/ToZEz1Chr/v0tosGOhG3SuYEARO8dBy2uBHexUX+T4jCilyDpKN
	 J7Xrq6OKIxWlQ==
Date: Tue, 03 Sep 2024 09:26:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <172537335246.875854.15313329352879668341.robh@kernel.org>
Subject: Re: [PATCH v3 00/10] Add minimal Exynos8895 SoC and SM-G950F
 support


On Tue, 03 Sep 2024 15:44:19 +0300, Ivaylo Ivanov wrote:
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
>  .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1092 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  249 ++++
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  137 +++
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |   10 +
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
>  drivers/soc/samsung/exynos-chipid.c           |    1 +
>  15 files changed, 1630 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi
> 
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y exynos/exynos8895-dreamlte.dtb' for 20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com:

arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@11430000: 'sd2-clk_fast_slew_rate_1x-pins', 'sd2-clk_fast_slew_rate_2x-pins', 'sd2-clk_fast_slew_rate_3x-pins', 'sd2-clk_fast_slew_rate_4x-pins' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@164b0000: gpa1-gpio-bank:#interrupt-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@164b0000: 'key-power', 'key-voldown', 'key-volup', 'key-wink', 'pcie_wake-pins', 'wlan_host_wake-pins' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#






