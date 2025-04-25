Return-Path: <linux-gpio+bounces-19296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDCBA9C1FE
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 10:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68E6E3A6A5C
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 08:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CA5238176;
	Fri, 25 Apr 2025 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="MbSr3hYh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25118238152;
	Fri, 25 Apr 2025 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570674; cv=pass; b=u8vqTLCoB7xiXkAxMua7Z/shka9tkZRmfGVtsEYaZmlVm+VlkijBCkV4uzocUa7bofR0Ttd/JEI14ZDJk8sNIFUmsM8ARsQ48TK6BaMxL6W3E92DCh3uNZP9J6poGErjHCAkNhUuKv462wmLyLMahgC2q1BK2c8dQJarlA+ZvGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570674; c=relaxed/simple;
	bh=yjq2AGuA29xCOgUcG0CIGuz4LaDtS7a60cZx5XO2DGA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jxv4wddt0EOIyVDeHTA5sBcXc1nrdgCRofdyt3OBrxKDyzbphbKiXJJm6793FcPxlrdhxCwthx0GgVxowTe/V2C49Ex5JRJZzIpwxlnmzQILJGVHWRWb6TPYealNy7ZLZqdbxybLxMW4oFrzlfBGmQyQfeBKeWhCirLvtw5SV18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=MbSr3hYh; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745570646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iPxa1tME43btWBJM9+6+JF3341N/snsfZv7ikXOFqzt+ANi4A4Ysm8FOemEfDbUFzoeMjGLIlhMXvhq431XE1VV6YNa+7pB5M6NU7sqFUvSgmhgi2UF+CMZ3hjTIfeNhqWWMpdSilO2/ZTL8IGQzs7C3n3RKPc84NXnfsBCZNp4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745570646; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yjq2AGuA29xCOgUcG0CIGuz4LaDtS7a60cZx5XO2DGA=; 
	b=i2MLWQYurtV3APXeIRg1xh2Qw3urvftrm+CLRlgsB1ZqUseQD9sH5sfdPcr8+mPqYhWHjNq2IpinEvPel3RSl3sI5rt6/Nywibcnetu/saZXwsG62TBTWzkIOrksmWOyMUk1cSk71xDBYLAXccLsNWFyni33zmo3Iq+znekys6Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745570646;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=yjq2AGuA29xCOgUcG0CIGuz4LaDtS7a60cZx5XO2DGA=;
	b=MbSr3hYhmraOXLP86p9Z8aaBI4qPNMRnIdZidUznApzOKEGDMzJjtIdnZ0yxBvc3
	eQ844/s9iIpWOxG51BOVQHsnkKfWt6yNO6skTbO1V6EQWYPL8Umy+0EX48cFe5wrRnM
	PLPsIZcEg7iXk5hAN0y3KJIF4LK6SMSgzKE4A1XGeCTJKqhlAsGrCqJv/CvPhz+EbCY
	BZWanu9+eYglFfwWt1u53YhOoYPvt6Ol4M/rdHh0AZ7s9PvYeGmW7PdmZI9vQrR5NV9
	hLcrKbqk3bwjuYWpO4TXC9j15hWYnCkSCzWc54wpAyJhi55ohZSXvbmeMNMpOXje2TZ
	R18j/Qftog==
Received: by mx.zohomail.com with SMTPS id 1745570643106791.8159653626777;
	Fri, 25 Apr 2025 01:44:03 -0700 (PDT)
Message-ID: <460048c49b82684af0759520ec8dcac057ad2857.camel@icenowy.me>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
From: Icenowy Zheng <uwu@icenowy.me>
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Linus Walleij <linus.walleij@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Fri, 25 Apr 2025 16:43:56 +0800
In-Reply-To: <60891c52-eeca-4358-8f38-789533016495@freeshell.de>
References: <20250424062017.652969-1-uwu@icenowy.me>
	 <20250424062017.652969-2-uwu@icenowy.me>
	 <60891c52-eeca-4358-8f38-789533016495@freeshell.de>
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

=E5=9C=A8 2025-04-24=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 01:15 -0700=EF=BC=
=8CE Shattow=E5=86=99=E9=81=93=EF=BC=9A
> On 4/23/25 23:20, Icenowy Zheng wrote:
> > The JH7110 SoC could support internal GPI signals to be routed to
> > not
> > external GPIO but internal low/high levels.
> >=20
> > Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two
> > virtual
> > "pads" to represent internal GPI sources with fixed low/high
> > levels.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> > =C2=A0include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> > b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> > index 3865f01396395..3cca874b2bef7 100644
> > --- a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> > +++ b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> > @@ -126,6 +126,10 @@
> > =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PAD_GMAC0_=
TXEN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A018
> > =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PAD_GMAC0_=
TXC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A019
> > =C2=A0
> > +/* virtual pins for forcing GPI */
> > +#define PAD_INTERNAL_LOW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0254
> > +#define PAD_INTERNAL_HIGH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0255
> > +
> > =C2=A0#define GPOUT_LOW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00
> > =C2=A0#define GPOUT_HIGH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01
> > =C2=A0
>=20
> Asking about the choice of 255 and 254 values for virtual high/low
> pins,
> here. There's not much result when grep Linux source for 'virtual
> pin'
> to compare with. Are these the best values for this approach?

These two values are picked because the following reasons:

- The pin field has 8 bits (see the comments of jh7110_pinmux_din() in
pinctrl-starfive-jh7110.c)
- We are already using values 0 and 1 for GPIO0/GPIO1

If we're designing from scratch, it's possible to have another practice
by using 0 and 1 for internal low/high and 2 for gpio0 so on.

>=20
> What happens when devicetree has in it to route PAD_INTERNAL_LOW to
> PAD_INTERNAL_HIGH and other unlikely combinations?=C2=A0 Or a devicetree
> blob
> with this computed value is paired to Linux kernel that does not have
> the code to handle these virtual pins, for compatibility concern?

I think it's not supported for newer DTs to be compatible with old
kernels, but I analyzed the code, a read-out-of-bound could happen in
jh7110_set_function() in pinctrl-starfive-jh7110-sys.c . Well this is
unfortunate, but we can do few things to fix old kernels -- we can fix
the problem in newer kernels.

And even picking other values cannot make things better...

>=20
> Do we know yet if JH8100 will share some of this design?

We don't know yet whether JH8100 can exist.

>=20
> -E


