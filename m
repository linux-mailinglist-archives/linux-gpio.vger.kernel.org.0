Return-Path: <linux-gpio+bounces-19448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CC9AA0676
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 11:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A14984133C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 09:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18622BCF66;
	Tue, 29 Apr 2025 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="SFVzEJFk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEFA2BCF54;
	Tue, 29 Apr 2025 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917234; cv=pass; b=gzdCpCZ2Txe5SRgHvz91pdOQGl+KLoa5TzN1Fky9N39Y2FIyCyOcS4HYILEU58gxg+1UT8oqvTk80k7R75r1+b5Haljo7unK4qS9Dp2PWdPzWep034bOJrcMN9K/Bj5ovR0roz85F+keaovjf+4uATsUiSMsIHREW54MY/TpNeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917234; c=relaxed/simple;
	bh=fZQkV+LeKWISYkYSjblN43k3j75EsN/nAxXEFWfOGOc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D08xViWBoIwwzedNu9x8P1EAS0cISaNK5tkPZqBz2pCwuKd8kQRW7gBGLOYLJUVUDBo612mSN5vSyBX1uHBP8Www/roWl//UeQiXZwXHRN4kCnMPV14ozEgh/1M/2IEH8XyAWAEB63a182XXm3/SLQI0iU8tKrcsz7ttAveBFmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=SFVzEJFk; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745917214; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CU1m58RfCOjQD6HAj0LxtIh1J2MxKzzYfGWGVh9AQinEm6q5PYuCNXLPPR7d3s+R140ho1SRXckR9Dp0zOsAHXa2pyEG1G7lvfiGT9R3m1XOzuOhkGh2YCLPLck0/O/lTbGz7VezbKlWwlRKVuirc1524wdFkDUnBEqxZGyrpSk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745917214; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fZQkV+LeKWISYkYSjblN43k3j75EsN/nAxXEFWfOGOc=; 
	b=COcBrzNN2fTjUXuVJH7yjzsCwQo28uPfAXfBYxuVA6Xw0TfozcROdUYiUK0TYlaYYJBliaIKSN/MmqmmBh1FdKTUoJXFLqrdqaRyAjISG4fSo+8tTb7fOYwbiYeRkTlkATA5lj1isTQRoTQBa1rbDmN36qut8TjeZvMqZI5ZVgc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745917214;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=fZQkV+LeKWISYkYSjblN43k3j75EsN/nAxXEFWfOGOc=;
	b=SFVzEJFk1bX/oFi/F4bDcqwJC2MdR0FYySoJ2VXeBaKZL8q9yhRuOAO8J44D39m0
	TApkYhQppOsqeRV4PvrqJI2CIgiLXcsN+DNfXrh5WAYTapqes726Vy/iAAGyBa42MgM
	1TOjb++bg8VgbzgWXYr10XeMhkVg7Go6qC5q/cunTvbWNBKTojjgoYJti6tZxMcFw0Q
	pE5Lh2oysxb5p3Y6ED0dTI2V/uQyoS7Ug1M3dMKw3OXVsESWMkR9FHSlBzSBVD1F/FP
	zcE951ASj85fpW4Ac3V46T8ARINxGCqkNsOtWrPEk9yBHZ+eBtCQSBNwZQJvunQV0X/
	MmJU5JgCGA==
Received: by mx.zohomail.com with SMTPS id 1745917211373281.29103320839295;
	Tue, 29 Apr 2025 02:00:11 -0700 (PDT)
Message-ID: <4d0bf5b8e1dd00f4025b7643a746cd99010c08fc.camel@icenowy.me>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang
 <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Tue, 29 Apr 2025 17:00:04 +0800
In-Reply-To: <8e131fce-12b6-4a5f-8601-c15a0e4290fe@kernel.org>
References: <20250424062017.652969-1-uwu@icenowy.me>
	 <20250424062017.652969-2-uwu@icenowy.me>
	 <20250428-smiling-azure-sunfish-7c1c25@kuoka>
	 <34c92033f4bbf289c6048a85f0f6ba04435e7bf8.camel@icenowy.me>
	 <8e131fce-12b6-4a5f-8601-c15a0e4290fe@kernel.org>
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

=E5=9C=A8 2025-04-29=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 09:31 +0200=EF=BC=
=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 28/04/2025 10:40, Icenowy Zheng wrote:
> > =E5=9C=A8 2025-04-28=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 09:20 +0200=EF=
=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> > > On Thu, Apr 24, 2025 at 02:20:15PM GMT, Icenowy Zheng wrote:
> > > > The JH7110 SoC could support internal GPI signals to be routed
> > > > to
> > > > not
> > > > external GPIO but internal low/high levels.
> > > >=20
> > > > Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two
> > > > virtual
> > > > "pads" to represent internal GPI sources with fixed low/high
> > > > levels.
> > > >=20
> > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > ---
> > > > =C2=A0include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h | 4 +++=
+
> > > > =C2=A01 file changed, 4 insertions(+)
> > > >=20
> > > > diff --git a/include/dt-bindings/pinctrl/starfive,jh7110-
> > > > pinctrl.h
> > > > b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> > > > index 3865f01396395..3cca874b2bef7 100644
> > > > --- a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> > > > +++ b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> > > > @@ -126,6 +126,10 @@
> > > > =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PAD_GM=
AC0_TXEN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A018
> > > > =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PAD_GM=
AC0_TXC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A019
> > > > =C2=A0
> > > > +/* virtual pins for forcing GPI */
> > > > +#define PAD_INTERNAL_LOW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
254
> > > > +#define PAD_INTERNAL_HIGH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0255
> > >=20
> > > Why this cannot be 20 and 21? These are not values for registers,
> > > but
> > > abstract numbers.
> >=20
> > The number must not collide with SYS GPIO pads too.
>=20
> There are no SYS GPIO pads here. Do you understand that this is not
> value for registers?

Yes I understand.

The situation is that JH7110 has two similar pin mux controllers, one
SYSGPIO and one AONGPIO. Despite I listed the values after the AONGPIO
pad list, these values should apply to SYSGPIO too (unless you want to
let them have different values for these two pinmux controllers), which
is the part with comment "sys_iomux pins".

>=20
> Best regards,
> Krzysztof


