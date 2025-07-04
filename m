Return-Path: <linux-gpio+bounces-22813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD34AF9CBB
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 01:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E518A1C46BDA
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 23:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C912628DB59;
	Fri,  4 Jul 2025 23:34:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893901922ED;
	Fri,  4 Jul 2025 23:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751672056; cv=none; b=YUDW8e9sKuLF35vTXH6/Ty/SbenI1fkzdAFA7HOb3u8ozy2pHlCSZSsRa5ifzMUbqinyqDVbbpEh8rKHWdXqPbJQ7glhJ3R9UvBEoIeakdnTvA+fWvhGD/a2rLgS2FLColCTQLfcEZwSIuxiDIEOzi/0/n9Nx0cMSMd3l2ts1CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751672056; c=relaxed/simple;
	bh=s09KkVchCgcH+eCf4yxXjX/b6QE7V2UYP66sh6OorVA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LQC7YkfrWZYXpGsEArzkEO2aNqtBcPthzdWMXDBxl6IKR3qJOoyYPfVDYLnnOu5rNCtIip6Z9Ir1zUf9yGllHN0S60IY2P8sJ19PZXAJDFcr3U/mnpgLMyLg7WBu5r4ZRn2q5ts9H76BhFNltZglhDyDTbssqljptDtu/RXnVzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F02D153B;
	Fri,  4 Jul 2025 16:33:59 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C96E3F66E;
	Fri,  4 Jul 2025 16:34:10 -0700 (PDT)
Date: Sat, 5 Jul 2025 00:32:43 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a100: Add EMAC support
Message-ID: <20250705003243.07b3612d@minigeek.lan>
In-Reply-To: <20250626080923.632789-5-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
	<20250626080923.632789-5-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Jun 2025 10:09:22 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi,

> The Allwinner A100/A133 Ethernet MAC (EMAC) is compatible with the A64
> one and needs access to the syscon register for control of the
> top-level integration of the unit.

as mentioned before, this would benefit from using "emac0", to signify
that there is a second MAC, but otherwise this matches what I found in
the manual and could test, so with the 0 suffix added:

> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index 1c4e71b32911..205faa90d37b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -420,6 +420,26 @@ i2c3: i2c@5002c00 {
>  			#size-cells = <0>;
>  		};
>  
> +		emac: ethernet@5020000 {
> +			compatible = "allwinner,sun50i-a100-emac",
> +				     "allwinner,sun50i-a64-emac";
> +			reg = <0x5020000 0x10000>;
> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&ccu CLK_BUS_EMAC>;
> +			clock-names = "stmmaceth";
> +			resets = <&ccu RST_BUS_EMAC>;
> +			reset-names = "stmmaceth";
> +			syscon = <&syscon>;
> +			status = "disabled";
> +
> +			mdio: mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		ths: thermal-sensor@5070400 {
>  			compatible = "allwinner,sun50i-a100-ths";
>  			reg = <0x05070400 0x100>;


