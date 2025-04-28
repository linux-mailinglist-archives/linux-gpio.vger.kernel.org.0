Return-Path: <linux-gpio+bounces-19391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC7A9EAF9
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 10:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 349A53B1EF8
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 08:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9DE25E808;
	Mon, 28 Apr 2025 08:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="UmImgtO9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C1BA55;
	Mon, 28 Apr 2025 08:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829684; cv=pass; b=EvzAh/PTVB8tAP/C5uP1L/8mQ/zDFrUbKOM7rQ5GbQLj5uh9mjUQRN8JaY6KM8RXhIOTWtrgBYDPjx8qyG844BEOHu7+EcffcsX9FAhG7bjflyG6EDiBTB0e/5COEU5lZx6qMHkcDoTko392GQuvML8cg5zHm9nlnxq8hfLLoaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829684; c=relaxed/simple;
	bh=HyXSYfMMKQseO6ErwcJ30OkhOu+WTDjzD4zXwnMsaXQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FmXRvlrfFogoSVT2QToo1oNeGzQyql77XdQIJ/lCG2Drcmw/R1kaqRvfW3Dq9jb8tueryz3F/FyELowN0HvA5fIdHu/xSKlSUKM5w0pxUwfokEP4DcWh4eTB0mJnLPqzw+i7EXnc2sMznFr0z2ANk/8rxRc4eNgtxXjo0EUUIaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=UmImgtO9; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745829663; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l9CCsdDAh6tsjxtN/TOfvG9j13fTA7TAWVCieAMPFSkEUmTpUcyZpbeppeIRZZbe7IltlqRQU7E6XtIw+iTIBxMjIMz/3bpla7I4LDAr8jsPeRbMdGZEClgqNAZU7av4KL8vuBLeiVaEHJcjbNOR4h9sIfzr6z/wp2Smv3vT3WQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745829663; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HyXSYfMMKQseO6ErwcJ30OkhOu+WTDjzD4zXwnMsaXQ=; 
	b=SAj2s8b+YdFgoQ3vVB6eidZwAp3t3Xv2KMMZl+zoZZChQE0mGHD1zCj2t3TxOBqMnswbJVW4V5La9xre0hfHp+7+UUs675ZTikWhoKCcVBIeI3WwhHMx0GX8ZNhFrEa4LglHyXuLJDQYCj2rqDIPapgWBIAlksycNdRqrKjnXEs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745829663;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=HyXSYfMMKQseO6ErwcJ30OkhOu+WTDjzD4zXwnMsaXQ=;
	b=UmImgtO9ZZV9yD7Ao2LiYfnGQirY4Hz8tHLBSxvm3yM1eOixPa/M0XMmHH33d7JI
	SLP6g1M0p5f17dTV/q4ElH59zMBcdFuetwG9Pdqezt80dpmaV28om5dPGds5XBJNFVE
	8ra4QnfNgSPSQpcLvBy4aH/e/RM1VzjngcZM4s7KRmmQWqqPKE8GJseMi5nTKT8Vxs7
	oYUoeqRmLkGuXM3OVYjXi/8Uzut3+k0FPVKQVzuXnf1vcwdKgdZbE419fzMF5424q1P
	wtGXXMPCgbXo3V10MFgAFKPa0FDDTKF5knNjqy33miArp74J55vDrt1ogyPFswH6dRk
	5N0/jedw5g==
Received: by mx.zohomail.com with SMTPS id 1745829661806841.7939793535281;
	Mon, 28 Apr 2025 01:41:01 -0700 (PDT)
Message-ID: <34c92033f4bbf289c6048a85f0f6ba04435e7bf8.camel@icenowy.me>
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
Date: Mon, 28 Apr 2025 16:40:56 +0800
In-Reply-To: <20250428-smiling-azure-sunfish-7c1c25@kuoka>
References: <20250424062017.652969-1-uwu@icenowy.me>
	 <20250424062017.652969-2-uwu@icenowy.me>
	 <20250428-smiling-azure-sunfish-7c1c25@kuoka>
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

=E5=9C=A8 2025-04-28=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 09:20 +0200=EF=BC=
=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Apr 24, 2025 at 02:20:15PM GMT, Icenowy Zheng wrote:
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
>=20
> Why this cannot be 20 and 21? These are not values for registers, but
> abstract numbers.

The number must not collide with SYS GPIO pads too.

Using 95 and 96 is okay, but dirty.

>=20
> Best regards,
> Krzysztof
>=20


