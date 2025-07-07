Return-Path: <linux-gpio+bounces-22870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C7AFB36B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 14:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49D8816BE4E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 12:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F9429ACF3;
	Mon,  7 Jul 2025 12:38:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABC21E22FC;
	Mon,  7 Jul 2025 12:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891900; cv=none; b=X5tEv5bv6RBGdQgbTjv16O4IBQ67d37wbuzcQ6cRlaPul2nKvhd0+Gly03sG7AKxNwRQuNKfms4bsL64KtvWFCaypy9rNFi62ZYQFfeXMs5bvAYHJP8yeIQ3rGcXlipJK4HapQMBKta3mPOsEm/zNAI4cZggTaEJ72BpcotEXQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891900; c=relaxed/simple;
	bh=f5u1fyICQ0fWMPkE1mMdZ0bxS/wFvmo/a6HWvxqJ1I0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nchq/4w49QcJwbp+3fRT7Gg2ssr2hifN7EO3+fgQ5rudGp62RMY67HOchduRt7vfs/OQzvr7nbaqnfzw4eA+9TeJW3H82EVsXk0DZfa2HxCaa9UQkFLnTP+Ykld1+rnIsJc2CVVXrs0yaOL/v2kXNHwAYgGa8dPsNJ8ayQtb5NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3741E168F;
	Mon,  7 Jul 2025 05:38:04 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBC4D3F694;
	Mon,  7 Jul 2025 05:38:13 -0700 (PDT)
Date: Mon, 7 Jul 2025 13:38:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Chen-Yu Tsai <wens@csie.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
Message-ID: <20250707133806.5bdaa536@donnerap.manchester.arm.com>
In-Reply-To: <aGukLuQ359MOyTqT@collins>
References: <20250626080923.632789-1-paulk@sys-base.io>
	<20250626080923.632789-2-paulk@sys-base.io>
	<20250704233535.4b026641@minigeek.lan>
	<20250705153825.2be2b333@minigeek.lan>
	<aGm8n_wJPiGk85E4@collins>
	<CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
	<aGuV3gcKSRIyey53@collins>
	<CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
	<aGud0aVLHGoql3Vj@collins>
	<CAGb2v64vCdsY7V2OsJVC+Qy+tbStYSWbh19mBrjuJMwZqUQ=Yw@mail.gmail.com>
	<aGukLuQ359MOyTqT@collins>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Jul 2025 12:40:46 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

> Chen-Yu,
> 
> > > > The block is the same, but the integration is slightly different, as
> > > > the register for the RGMII clock delays and other stuff is at a different
> > > > offset in the system controller. The BSP handles this by directly
> > > > including the register in the "reg" property.  
> > >
> > > Ah I see, I forgot about the syscon register. However it doesn't seem like a
> > > very good approach to have a different compatible to express the idea that an
> > > external resource is different. Just like we do for clocks, resets and other
> > > things, we should probably find a way to express the offset via some dedicated
> > > property instead of spinning a different compatible each time it changes.
> > >  
> > > > So yes, you do need a separate compatible string, if only to deal with
> > > > the slight difference in the integration layer.  
> > >
> > > So maybe an additional allwinner,syscon-offset property or a new  
> > 
> > If you can get that accepted, I think that works?
> >   
> > > allwinner,syscon that takes the syscon phandle first and the offset second?  
> > 
> > I would prefer to avoid any changes to the syscon reference that would
> > require more custom code. I only just recently found that we could use
> > the standard syscon code with the provider registering the syscon. We
> > could drop the of_parse_phandle() + find device + dev_get_regmap() bits.
> > This is partially covered in my GMAC200 series.  
> 
> There is already syscon_regmap_lookup_by_phandle_args which supports generic
> extra arguments to a syscon node. It just requires a custom syscon property.
> 
> I personally find this cleaner than adding a property just for the offset.

Well, I proposed that already for the H616, where the second EMAC has the
same problem with the syscon at 0x34 instead of 0x30:

https://lore.kernel.org/linux-sunxi/20210615110636.23403-10-andre.przywara@arm.com/

I don't remember the details, but it got eventually dropped, partly
because the 2nd EMAC isn't supported yet due to missing AC200/AC300
support.
My plan was to let <&syscon> be the same as <&syscon 0>, which would
preserve compatibility. Though I am not sure the fallback compatible is
then correct, because it typically means that older driver can cope with
those devices, which isn't really the case here.

But we could postpone this issue as well for the A133, to the day when
there will be a device using this 2nd MAC.

Cheers,
Andre


> 
> Paul
> 
> > ChenYu
> >   
> > > It seems that various other platforms are doing similar things (e.g.
> > > ti,syscon-pcie-mode).
> > >
> > > Thanks
> > >
> > > Paul
> > >  
> > > >
> > > > ChenYu
> > > >  
> > > > > [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/linux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> > > > > [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/linux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
> > > > >
> > > > > All the best,
> > > > >
> > > > > Paul
> > > > >  
> > > > > >
> > > > > > ChenYu
> > > > > >
> > > > > >  
> > > > > > > Cheers,
> > > > > > >
> > > > > > > Paul
> > > > > > >  
> > > > > > > > Cheers,
> > > > > > > > Andre.
> > > > > > > >  
> > > > > > > > > [1]
> > > > > > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi
> > > > > > > > >
> > > > > > > > >  
> > > > > > > > > >
> > > > > > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A100 pin controller")
> > > > > > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > > > > > ---
> > > > > > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----------
> > > > > > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[] = {
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > > > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > > > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
> > > > > > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),  
> > > > > > > > >
> > > > > > > > >  
> > > > > > > >  
> > > > > > >
> > > > > > > --
> > > > > > > Paul Kocialkowski,
> > > > > > >
> > > > > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > > > > Free software developer - https://www.paulk.fr/
> > > > > > >
> > > > > > > Expert in multimedia, graphics and embedded hardware support with Linux.  
> > > > >
> > > > > --
> > > > > Paul Kocialkowski,
> > > > >
> > > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > > Free software developer - https://www.paulk.fr/
> > > > >
> > > > > Expert in multimedia, graphics and embedded hardware support with Linux.  
> > >
> > > --
> > > Paul Kocialkowski,
> > >
> > > Independent contractor - sys-base - https://www.sys-base.io/
> > > Free software developer - https://www.paulk.fr/
> > >
> > > Expert in multimedia, graphics and embedded hardware support with Linux.  
> 


