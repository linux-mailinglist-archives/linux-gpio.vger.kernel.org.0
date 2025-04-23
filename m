Return-Path: <linux-gpio+bounces-19221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F951A98CCE
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 16:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C1A3A1D2B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 14:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF2E27CB3F;
	Wed, 23 Apr 2025 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="BCp7xZzU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F077D2797A1;
	Wed, 23 Apr 2025 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745418141; cv=pass; b=ZMjnnU/rdzFfxYi1/oHP3biIj9z/Uo+PkXLu8SziOf3l2hVgT/g2zeZfgDSOliLsPMSem/L5EWwxERjSresjBOBMRP/HmMcq4Y7obOY8M0kYE70Is2yBImiNadR8njhJsGvr/qqedN5CF/IoSeni8/Be9hUYqZ1l1npz2fgBMyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745418141; c=relaxed/simple;
	bh=9yB/Qq+BRZ2Phu3AIq9BfdJXrDlB28zaBQ+JFyqEXRQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XZlyV5W7w5YWuANla/mC3kYaQHqMsZVG9DAv6ggzxzbUyeiZXi/KO+6EXg5+M67qJpN56XVWmoOU6zxhw/WmTTKo/nTEQGDJy/pcPGlMbloNyI+6qeBEw5f2BDOZCwWqKf7A5Tm8M1sHtGz3DlbyXVg6Opy1BcbTXy9xfkZvtso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=BCp7xZzU; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745418119; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZDV+mpsgzh1T0Z7SwITf51hq64jkmPmYNt4ZPn0hf+9iQUFiOtzyQMPeXB87ELeh+mtm0UOI4jL2g1e/LMrwTzDC0BRsX75fwD0adNraebUpUKmFHW9gr7CgloAcfeoufKzEPsJjkocYEdjaYrgmGLmoOfPEbLhalr0b5sCzNPU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745418119; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9yB/Qq+BRZ2Phu3AIq9BfdJXrDlB28zaBQ+JFyqEXRQ=; 
	b=F5/MLn65UFcUWqfKpz3lDq0IhkS7oAIQyNKd2KZ5EU9HZHN+B9YFkSdfZyQmIXdM3Wz7VOf6+ZJCfWet4D+HuzGYUTSINMcFZ2hlkO9UxfYg1oiKMWGFCLuYV5pL+BIJEImgjBEJyHXXSNXmt48yYpxZd76A9sTv88MnprWaJ1s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745418119;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=9yB/Qq+BRZ2Phu3AIq9BfdJXrDlB28zaBQ+JFyqEXRQ=;
	b=BCp7xZzUEkm77k0kl7WIn+l0ZF78PFghvUmTccTyk2NkPGAR5Mow55ts+gKKKQzO
	lRN2aPfzHc1aWe5MSAQDSLtrzwrnCdch6bRj126kI6Z+R9I2D3wtlAcVHvNROyzAyFi
	ITU2NmEE4IervwC6IboL3/0/bp5d59sP/fTsMJRApy/BaqBcsGExlTQOGzBaUavdYU5
	8zNNFQvUE5hPg+Qutt+DiVV3CiAV6x7MvaSromHkNvCcRZZp3Ih12fOAJf6m3gxkUeg
	2nsU/Hr/gyo4GmKdRLdXdra415DjJutSVRAf20Pg0dDLBYR2Sm7KGECIO/nFRn+17Qd
	RI3tRN6TsQ==
Received: by mx.zohomail.com with SMTPS id 1745418117666283.0504327658683;
	Wed, 23 Apr 2025 07:21:57 -0700 (PDT)
Message-ID: <c5efd677fd2199cbf8f9d6006905acdf19da02bc.camel@icenowy.me>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force
 inputs
From: Icenowy Zheng <uwu@icenowy.me>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang
 <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Wed, 23 Apr 2025 22:21:51 +0800
In-Reply-To: <CACRpkdYgkDpC1iJ-KaZj2GZ3A3_V=3-KQef_nCRhMDrUK=FHXg@mail.gmail.com>
References: <20250422162250.436169-1-uwu@icenowy.me>
	 <20250422162250.436169-2-uwu@icenowy.me>
	 <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
	 <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me>
	 <CACRpkdYgkDpC1iJ-KaZj2GZ3A3_V=3-KQef_nCRhMDrUK=FHXg@mail.gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2025-04-23=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 12:55 +0200=EF=BC=
=8CLinus Walleij=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Apr 23, 2025 at 11:41=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me>
> wrote:
> > =E4=BA=8E 2025=E5=B9=B44=E6=9C=8823=E6=97=A5 GMT+08:00 17:09:42=EF=BC=
=8CLinus Walleij
> > <linus.walleij@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> > > Hi Icenowy,
> > >=20
> > > thanks for your patch!
> > >=20
> > > On Tue, Apr 22, 2025 at 6:23=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me=
>
> > > wrote:
> > >=20
> > > > +=C2=A0 starfive,force-low-inputs:
> > > > +=C2=A0=C2=A0=C2=A0 description:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The list of input signals forced to=
 be low inside the
> > > > SoC itself.
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32-a=
rray
> > >=20
> > > I don't see why you need this hack.
> >=20
> > Unfortunately these properties are not for pins, but internal
> > signals that isn't
> > bound to external pins.
>=20
> We don't really care if pins are external or not, we are an operating
> system
> not a philosophy department ;)
>=20
> You calculate the offset and shift like this and write into a
> base+offset:
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset =3D 4 *=
 (pin / 4);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shift=C2=A0 =
=3D 8 * (pin % 4);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D readl_=
relaxed(sfp->base +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->gpi_reg_base +
> offset);
>=20
> Compare to jh7110_pin_dbg_show():
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int offset =3D 4 * (pin / 4);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned int shift=C2=A0 =3D 8 * (pin % 4);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 u32 dout =3D readl_relaxed(sfp->base +
> info->dout_reg_base + offset);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 u32 doen =3D readl_relaxed(sfp->base +
> info->doen_reg_base + offset);
>=20
> So clearly the entities that you affect are in the same numberspace,
> and that is all we care about. They are not enumerated in any way
> orthogonal to any other pins AFAICT.

They just share the field width, they're not in the same numberspace.

The design of the JH7110 pin mux control is quite simple and stupid:

- First per-GPIO map configuration to map the GPIO's DOEn pin to
internal tri-stating signals.
- Then per-GPIO map configuration to map the GPIO's DOUT pin to
internal output signals.
- Then per-input-signal configuration (note that it's no longer per-
GPIO) map configuration to map the signal to a GPIO's DIN (or fixed
low/high).

For examples, here's some field names of a few registers (according to
the TRM):
0x0 [5:0]: sys_iomux_gpo0_doen_cfg
0x40 [6:0]: sys_iomux_gpo0_dout_cfg
0x80 [6:0]: sys_iomux_gpi_u0_WAVE511_i_=C2=ADuart_rxsin_cfg

P.S. I just now found that the vendor's 6.12 BSP (which uses the
mainlined pinctrl driver) has pinmux configuration that maps the same
GPIO pin (GPIO38) to two input signals (both BCLK signals of two I2S
controllers, one RX and one TX) [1]. This makes me think use two
virtual pad numbers (one for internal low level, another for internal
high) for these internal connections viable again -- In this case I can
write `GPIOMUX(PAD_INTERNAL_HIGH, GPOUT_LOW, GPOEN_DISABLE,
GPI_SYS_USB_OVERCURRENT)` .

[1]
https://github.com/starfive-tech/linux/blob/JH7110_VisionFive2_6.12.y_devel=
/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi#L298

>=20
> Both pin control and GPIO handle chip-internal lines that are not
> routed outside sometimes, that's fine. Just deal with them as any
> other
> "pins".
>=20
> Yours,
> Linus Walleij


