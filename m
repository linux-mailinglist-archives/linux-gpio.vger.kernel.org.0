Return-Path: <linux-gpio+bounces-8810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83C0956EC7
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 17:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EFFBB22A2A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 15:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D45487BE;
	Mon, 19 Aug 2024 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EvzxNyLM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D9D7D3F1;
	Mon, 19 Aug 2024 15:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724081566; cv=none; b=UVmOie1KnA61C1hovt0vaFEYbqWxKRo5lwD+G22WrKcZsrZZ8s2PCoGjibhHu6Nbbdqy3PJIcfPl0dmEtR9IKlVTlt+lZ04WS98W7X9yntYCE5xyXtPhx5jWAJgnB14WIGtcqHqi/ikvgQM77GR6DXoVmceQR9HE8YoYKbHVbZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724081566; c=relaxed/simple;
	bh=KrRKtrlags5GjxlRb2gmU0WRcHApIJSbkvWqCKTXO9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYLsZE5a5K6WZKhaCal+jerGf1Q4RZdZjY48gu4iXE3RI8+TVXK5aG0rBCnoYAxFdpfVjOeFfnEimuF4bH+GEMFUBmxflAvJzx4xAp7igz6ZdduukJch2+cxfGxWVV5lbvUjkbzIDwMMUgHhPIQbf+/yivxQTkH3FZKSmU5mP3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EvzxNyLM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SLlYEWCuNlmtfOcJ9Ii4P0bORwGt2kKn5OsiFEYKC8U=; b=EvzxNyLMtlH+d7Xa6LNZf7A+Lm
	ndhIsplu7wPf4gzPcK6Pr8aYLs+D6kutBW5O6m0a014YMckw3ncm4kbPg5cTxZIKWEOearQ2/AHdP
	Tpo+oitGZ025mTMtGNGH4tpJs+G1c5T32yVHoHIs0ayiFaisUpwkCQdLVfCs5l1A3Lpl9HODNTxUH
	GBD8AXEbEWid620BRuSF0VADvqYk0o5g2n3bVD//UYi/UD8FH/XFPW4BUe847w3SBwibj77lXTXqR
	awguoMXxiTsuIW9Rxq6KUFD0K+pafrmYG8z91JS/23PdPXX7UdnfyzObT1giEaXT8mVOoTScEHCW2
	QTns7rqg==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sg4N1-0001Ty-FW; Mon, 19 Aug 2024 17:32:35 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Steven Liu <steven.liu@rock-chips.com>
Subject: Re: [PATCH v3 2/2] pinctrl: rockchip: Add rk3576 pinctrl support
Date: Mon, 19 Aug 2024 17:32:52 +0200
Message-ID: <8982170.VV5PYv0bhD@diego>
In-Reply-To: <3025828.e9J7NaK4W3@trenzalore>
References:
 <20240814223217.3498-1-detlev.casanova@collabora.com>
 <5865327.fQeU5cv6pJ@diego> <3025828.e9J7NaK4W3@trenzalore>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Montag, 19. August 2024, 17:01:50 CEST schrieb Detlev Casanova:
> Hi Heiko,
>=20
> On Thursday, 15 August 2024 10:05:08 EDT Heiko St=FCbner wrote:
> > Am Donnerstag, 15. August 2024, 00:30:39 CEST schrieb Detlev Casanova:
> > > From: Steven Liu <steven.liu@rock-chips.com>
> > >=20
> > > Add support for the 5 rk3576 GPIO banks.
> > >=20
> > > This also adds support for optionnal support of the sys-grf syscon,
> >=20
> > only one "n" in optional
> >=20
> > > used for i3c software controlled weak pull-up.
> > >=20
> > > Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
> > > [rebase, reword commit message]
> > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > ---
> > >=20
> > >  drivers/pinctrl/pinctrl-rockchip.c | 228 +++++++++++++++++++++++++++=
++
> > >  drivers/pinctrl/pinctrl-rockchip.h |   2 +
> > >  2 files changed, 230 insertions(+)
> > >=20
> > > diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> > > b/drivers/pinctrl/pinctrl-rockchip.c index 0eacaf10c640f..110ed81d650=
be
> > > 100644
> > > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > > +++ b/drivers/pinctrl/pinctrl-rockchip.c
> [...]
> > > @@ -1234,6 +1263,20 @@ static int rockchip_set_mux(struct
> > > rockchip_pin_bank *bank, int pin, int mux)>=20
> > >  	if (bank->recalced_mask & BIT(pin))
> > >  =09
> > >  		rockchip_get_recalced_mux(bank, pin, &reg, &bit,=20
> &mask);
> > >=20
> > > +	if (ctrl->type =3D=3D RK3576) {
> > > +		if ((bank->bank_num =3D=3D 0) && (pin >=3D RK_PB4) && (pin <=3D=20
> RK_PB7))
> > > +			reg +=3D 0x1FF4; /*=20
> GPIO0_IOC_GPIO0B_IOMUX_SEL_H */
> >=20
> > 0x1ff4 please
> >=20
> > > +		/* i3c0 weakpull controlled by software */
> > > +		if (((bank->bank_num =3D=3D 0) && (pin =3D=3D RK_PC5) && (mux=20
> =3D=3D 0xb)) ||
> > > +		    ((bank->bank_num =3D=3D 1) && (pin =3D=3D RK_PD1) && (mux=20
> =3D=3D 0xa)))
> > > +			regmap_update_bits(regmap_sys, 0x4,=20
> 0xc000c0, 0xc000c0);
> > > +		/* i3c1 weakpull controlled by software */
> > > +		if (((bank->bank_num =3D=3D 2) && (pin =3D=3D RK_PA5) && (mux=20
> =3D=3D 0xe)) ||
> > > +		    ((bank->bank_num =3D=3D 2) && (pin =3D=3D RK_PD6) && (mux=20
> =3D=3D 0xc)) ||
> > > +		    ((bank->bank_num =3D=3D 3) && (pin =3D=3D RK_PD1) && (mux=20
> =3D=3D 0xb)))
> > > +			regmap_update_bits(regmap_sys, 0x4,=20
> 0x3000300, 0x3000300);
> >=20
> > this setting belongs into drivers/soc/rockchip/grf.c .
> >=20
> > You want to decide that the i3c controller has no say over the pull
> > settings, but instead pinctrl should always be in control.
>=20
> So If i understand correctly, the GRF driver should contain a rk3576 spec=
ific=20
> entry for default values where i3c0 and i3c1 are activated by default and=
 not=20
> to be changed later then ?
>=20
> I didnt realize that in this driver, the bits are only set to one, never=
=20
> cleared. So it would make sens to have them set by the GRF driver.
>=20
> Something like this should do it:
>=20
> #define RK3576_SYSGRF_SOC_CON1		0x6004
>=20
> static const struct rockchip_grf_value rk3576_defaults[] __initconst =3D {
> 	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, HIWORD_UPDATE(3, 3, 6)=20
> },
> 	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, HIWORD_UPDATE(3, 3, 8)=20

you're actually not configuring the "weak pull" itself, but only the mark
them as software-configured - via pinctrl. In the default setting, the i3c
controller seems to do some voodoo itself, but in the kernel we generally
want to keep control ourself, to not get surprised by the hardware doing
stuff.

So yes, that is exactly what we want.


When you do the grf-"driver" addition, you can also add the sdmmc/jtag thing
which seems to be in TOP_IOC_MISC_CON[1] ... sdmmc_force_jtag,
because we that most of the time causes issues with sd-cards down the
road.


Heiko



