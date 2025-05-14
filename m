Return-Path: <linux-gpio+bounces-20153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83039AB6C4A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 15:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 440BD1B67E1C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 13:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF7927AC3A;
	Wed, 14 May 2025 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPfVpSme"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C73727AC26;
	Wed, 14 May 2025 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228275; cv=none; b=Fe5c+lHwcn8BFpVmcSLqvvF2I8B1qrGYu5DMJKAQffhTSUTJLP+qjymmI3+e3tXPBwhMmQ+CdxieOLGPUvBhZLPysHVdRKK83+R1fv+eLE+c6ypYRs5n6K9kHNJxuOgTs5vBYITEyh1VHnSGh/XMmHdYRdfwhXuF1F8HEX8jO1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228275; c=relaxed/simple;
	bh=RMIUJ4PPQ4ztksuWTTjccEyOC4ctSkUxCvsZak+d20Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PxBWaiEVS/aVqT4Uo64W8guDxCK2wl9IiqS/ZYduOZqu8WhYtxzcKs7EkgNQ+3PIndRGCr6afbSPvNJeWCyRAW9/kiD6ZXNIEchhSMTJmC0n1EZ9yH9iuTIeIPWVxMnTqUzxlaGTtlVi8LtckPdTMtqQ6JW3VUGHSnvtauflcr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPfVpSme; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A83C4CEED;
	Wed, 14 May 2025 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747228274;
	bh=RMIUJ4PPQ4ztksuWTTjccEyOC4ctSkUxCvsZak+d20Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sPfVpSmehjedO3NMxNnnHSljQ3eOjEPchdLZMDEzAjQQs3sC2cqnoBx3HGziV63ww
	 gZC1R15YhL0bzL2gz4nZIspWlD757TdI9FJUZEpWNInpv0/u76BW5Wpygrt/gnrRJ/
	 6Xql+1APuuhfOYWmLN1TlQuzlWhKMDlSqIcWR17Ig+ZJX2NBPvYyLB40VFRqMffF3R
	 DnIMS0skU589z+LId7B3NAmnAFWRP7cVj8ExWbPJVT2viGjHTiAnlIOhh4SWQHh6eb
	 VvCEKFSrkW19j8CNINvCQr2XdxMZDFCzt5VBHVTVIO4F2rPRj9qYAszo5jhGyXb/Zi
	 B80zVGQtXtzVw==
Date: Wed, 14 May 2025 08:11:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
Message-Id: <174722778770.1826547.7211789941819434766.robh@kernel.org>
Subject: Re: [PATCH 0/8] Add support for Amlogic S7/S7D/S6 pinctrl


On Wed, 14 May 2025 15:01:27 +0800, Xianwei Zhao wrote:
> In some Amlogic SoCs, to save register space or due to some
> abnormal arrangements, two sets of pins share one mux register.
> A group starting from pin0 is the main pin group, which acquires
> the register address through DTS and has management permissions,
> but the register bit offset is undetermined.
> Another GPIO group as a subordinate group. Some pins mux use share
> register and bit offset from bit0 . But this group do not have
> register management permissions.
> 
> In SoC S7 and S7D, GPIOX(16~19) mux share with GPIOCC mux register.
> 
> In SoC S6, GPIOX(16~19) mux share with GPIOCC mux register, and GPIOD(6)
> mux share with GPIOF mux register.
> 
> Add S7/S7D/S6 pinctrl compatible string and device node.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Xianwei Zhao (8):
>       dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7
>       dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7D
>       dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S6
>       pinctrl: meson: a4: remove special data processing
>       pinctrl: meson: support amlogic S6/S7/S7D SoC
>       dts: arm64: amlogic: add S7 pinctrl node
>       dts: arm64: amlogic: add S7D pinctrl node
>       dts: arm64: amlogic: add S6 pinctrl node
> 
>  .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |   9 +-
>  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  97 ++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |  81 +++++++++++++++
>  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |  90 +++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 111 ++++++++++++++++-----
>  5 files changed, 363 insertions(+), 25 deletions(-)
> ---
> base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
> change-id: 20250514-s6-s7-pinctrl-af1ebda88a4e
> 
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
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
 Base: using specified base-commit aa94665adc28f3fdc3de2979ac1e98bae961d6ca

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com:

arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: bus@fe000000 (simple-bus): pinctrl:ranges: [[0, 0, 0, 16384, 0, 832]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: bus@fe000000 (simple-bus): pinctrl:ranges: [[0, 0, 0, 16384, 0, 832]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: bus@fe000000 (simple-bus): pinctrl:ranges: [[0, 0, 0, 16384, 0, 832]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#






