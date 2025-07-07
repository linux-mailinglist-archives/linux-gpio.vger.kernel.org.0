Return-Path: <linux-gpio+bounces-22905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29134AFBEAB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 01:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01BA77B19C4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 23:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FDE2882BC;
	Mon,  7 Jul 2025 23:36:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990D223505E;
	Mon,  7 Jul 2025 23:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751931373; cv=none; b=tzpmNPGrMpVd708igObwYzOfF2W54tujNHkT09gwKmOH5+DS403FXz7o196YGL+6zfgN4jWXCH3PG84TtJdJ2c3hYHPU6XgQPjGSyQUroCWmV12h5Ymc4XdxSY8Ma2eNgiAtr7eFfSpzAPuGoj2sgnpZ6B8bpDvGjDUuOW59ho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751931373; c=relaxed/simple;
	bh=B9LSzg/qWO4vzUiW0hSosPBw8b6MJKHwPJV2YfAKpY4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmebC8a5PchjbbnEUssz1PYdHNtux0uZu4UDoPL1y0BbeFS64XMgstLBwPo2NsJSCiwqIe4MxiESGR1JW7GzEC9uE/wgDDSbiV2G9J4p3XVXeVZ3hq820K7mzU+w0JShmf9q69eNCY27oAAeZCMHyZkLhefR+XBN7nV5NQJd4uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7E861595;
	Mon,  7 Jul 2025 16:35:58 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68AFE3F66E;
	Mon,  7 Jul 2025 16:36:09 -0700 (PDT)
Date: Tue, 8 Jul 2025 00:34:25 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l:
 Add Ethernet support
Message-ID: <20250708003348.58fe509f@minigeek.lan>
In-Reply-To: <20250707165155.581579-5-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
	<20250707165155.581579-5-paulk@sys-base.io>
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

On Mon,  7 Jul 2025 18:51:55 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi Paul,

> The Liontron H-A133L board features an Ethernet controller with a
> JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> 
> Note that the reset pin must be handled as a bus-wide reset GPIO in
> order to let the MDIO core properly reset it before trying to read
> its identification registers. There's no other device on the MDIO bus.

putting the PHY reset GPIO into the MDIO node is a clever solution, I
was struggling with putting it either in the MAC or PHY node, though
conceptually it would still belong in the latter, I think. But this
might be a more generic problem: for most other devices we activate
reset and clock gates *before* trying to access them, though this might
be historically different for Ethernet PHYs.
 
> The datasheet of the PHY mentions that the reset signal must be held
> for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> be on the safe side without wasting too much time during boot.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Despite the above, this looks fine, and works for me:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> index fe77178d3e33..90a50910f07b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> @@ -65,6 +65,25 @@ &ehci1 {
>  	status = "okay";
>  };
>  
> +&emac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rmii0_pins>;
> +	phy-handle = <&rmii_phy>;
> +	phy-mode = "rmii";
> +	status = "okay";
> +};
> +
> +&mdio0 {
> +	reset-gpios = <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> +	reset-delay-us = <2000>;
> +	reset-post-delay-us = <2000>;
> +
> +	rmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply = <&reg_dcdc1>;
>  	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */


