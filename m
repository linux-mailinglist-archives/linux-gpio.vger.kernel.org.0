Return-Path: <linux-gpio+bounces-22906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8733AFBEC9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 01:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 074CB3B8F3C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 23:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D2E26059D;
	Mon,  7 Jul 2025 23:49:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBE917DFE7;
	Mon,  7 Jul 2025 23:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751932197; cv=none; b=AReIJkthDrHFQeUFhmKP1z5meEEjI2mKWe+xorJKVJR1xeYwCgANNiBIZXXQq6oRoiA5HdQzV0OrgQunxZLFkSw7QhjGgCHekj0GR8601BhR+AAWAUqT+8YrM2zm3QgE+0vFHF9xVQxTfuf2fRN+KXZ1ROuAoY2SJ+Nk4UW9DTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751932197; c=relaxed/simple;
	bh=nvlO7Fdtn64jOtSo2h4M4ZpFo2+iKqrUOJuCkBaPvaA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uDbwCxlFeA5nA6pA9IyBkfVkbWpsjOYX1rFOekaySzrVaeejCO12gqVAJCac9ENgtowE5sQX+MhPuUKT8/PS/VSGRvUOjCydjO+p5L6VOaMFxd+wc2ArhK7tFxq8fGlkw/fYhEx4ZCxZKp8mjDTdYJ3OvGshNttIMi0jsbwK0O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E22E1515;
	Mon,  7 Jul 2025 16:49:43 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EFC13F66E;
	Mon,  7 Jul 2025 16:49:53 -0700 (PDT)
Date: Tue, 8 Jul 2025 00:48:09 +0100
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
Message-ID: <20250708004731.37fa5129@minigeek.lan>
In-Reply-To: <20250708003348.58fe509f@minigeek.lan>
References: <20250707165155.581579-1-paulk@sys-base.io>
	<20250707165155.581579-5-paulk@sys-base.io>
	<20250708003348.58fe509f@minigeek.lan>
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

On Tue, 8 Jul 2025 00:34:25 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

Hi Paul,

forgot to mention: can you please add an ethernet0 alias, to make
U-Boot generate a MAC address, from the SID?

Cheers,
Andre

> On Mon,  7 Jul 2025 18:51:55 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
> 
> Hi Paul,
> 
> > The Liontron H-A133L board features an Ethernet controller with a
> > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> > 
> > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > order to let the MDIO core properly reset it before trying to read
> > its identification registers. There's no other device on the MDIO bus.  
> 
> putting the PHY reset GPIO into the MDIO node is a clever solution, I
> was struggling with putting it either in the MAC or PHY node, though
> conceptually it would still belong in the latter, I think. But this
> might be a more generic problem: for most other devices we activate
> reset and clock gates *before* trying to access them, though this might
> be historically different for Ethernet PHYs.
>  
> > The datasheet of the PHY mentions that the reset signal must be held
> > for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> > be on the safe side without wasting too much time during boot.
> > 
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>  
> 
> Despite the above, this looks fine, and works for me:
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> 
> Cheers,
> Andre
> 
> > ---
> >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > index fe77178d3e33..90a50910f07b 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > @@ -65,6 +65,25 @@ &ehci1 {
> >  	status = "okay";
> >  };
> >  
> > +&emac0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&rmii0_pins>;
> > +	phy-handle = <&rmii_phy>;
> > +	phy-mode = "rmii";
> > +	status = "okay";
> > +};
> > +
> > +&mdio0 {
> > +	reset-gpios = <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > +	reset-delay-us = <2000>;
> > +	reset-post-delay-us = <2000>;
> > +
> > +	rmii_phy: ethernet-phy@1 {
> > +		compatible = "ethernet-phy-ieee802.3-c22";
> > +		reg = <1>;
> > +	};
> > +};
> > +
> >  &mmc0 {
> >  	vmmc-supply = <&reg_dcdc1>;
> >  	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */  
> 


