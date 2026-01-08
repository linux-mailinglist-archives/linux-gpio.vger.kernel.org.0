Return-Path: <linux-gpio+bounces-30281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 971CFD044A5
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 17:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6590330F314E
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 15:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAE1270ED2;
	Thu,  8 Jan 2026 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4s2YCTw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BB926C38C
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767884893; cv=none; b=d4zs06C/Ej8ddmOqnk7ETo+OwzKYvc0npUMLEg3PmEBRNInfxgD8JJDveE2c8KFeJpsqpKTRCPvpXLuNIZrhzv3/h+KUqM1ehmD+FmXc05bLpXTlh0zScTfSW1wvsOvgvZ/R6j79FE7fPEAP5ANmRgG1tMDan6mioyOJ7i10cNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767884893; c=relaxed/simple;
	bh=39Z9S4WdE/PvsD7g4HhaCFW2OPS03zLo06BGT58/Sdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCC3763smGIkgubGM8g8XabfKimoHwi/Ywdpse0AwzN+40XRRKC8Z4unOuH60OJZ9g77hHsPtWJjtJ6CWw/bCyKtWDdINtCNd5/EfQ6LgRC6KjVXLp+YkEKLYd9Sir0kXrrgspBr3VDa9vAEEyEHwF5cxSPAuMIMQSES7R2qu54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4s2YCTw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EEDC116C6
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767884893;
	bh=39Z9S4WdE/PvsD7g4HhaCFW2OPS03zLo06BGT58/Sdg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=G4s2YCTwalIIEOa5+zNpraynj/0tm4IP0B4nWh1B8yEFVsk2q/4Nwsv9udsyPMb/V
	 c2DO2apYh/CjwSMjCs/GFKynWKqfctOOJP6KTPot1qppd7LbMrXROq0hxcvzwvQYug
	 gbDa6i9pWATYUX1E67v6srC0L0rFGdb0qk2RXH+dPDqmYfqT2ULqYl2m7iJb8TvW22
	 0Iv4ktk6Y54LOfGHWKdahqYrTTBH9vq6aJnCj8p4vWkSJl+TSizIs5myGfq2YeVxMD
	 qU871L9PFs1zSFfmyBQZGNRSvkUNcOwVXUaUaOQ9oAi7VSMKLK5wPCr1O6DH+MZ5QT
	 kdU2zU/LkS7rw==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-65745a436f7so1904641eaf.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 07:08:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0tXXjIFGCHqKEmDJPA4S0PNlyLvov62acA8nMt4hlpBxpmhpNyTiCdKRwMfERZeTaI86s7pv4FUPk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+XdZUSduvATDiv04QnS83jtYODYkRyEsBPTPUzadpHb/kR2qF
	hBVJvXw93Uigb+bd6yP45UBt20UNPJvF6fXTfiDKVvcQ9C5Ixeaoo8enS7FLvGB6ZPi9w3yHLkF
	EexxhOkMpf1Q7NJGj0laLJfUkJAMYMgw=
X-Google-Smtp-Source: AGHT+IH/gnEZYqIaFUUN6qjbp6n1QUe5qlNXozvSo/LvWHOByHxaNwk2S8ODoFI4rDHWqv0owwBmLR26/u3UOEkO0ho=
X-Received: by 2002:a05:6820:6181:b0:65f:5d31:2965 with SMTP id
 006d021491bc7-65f5d313701mr1029748eaf.47.1767884892592; Thu, 08 Jan 2026
 07:08:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251225103616.3203473-1-wens@kernel.org> <20251225103616.3203473-5-wens@kernel.org>
 <13929653.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <13929653.uLZWGnKmhe@jernej-laptop>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 8 Jan 2026 23:07:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65LzhdXfX16HTgGbC7OYkuX=vqCzB65=BqD4i1SiCQeRw@mail.gmail.com>
X-Gm-Features: AQt7F2r3aAZUypwXBa9lAFiH8eexcqiOW8WUO-M-nGoH39uZtjTr8DirPSqIr98
Message-ID: <CAGb2v65LzhdXfX16HTgGbC7OYkuX=vqCzB65=BqD4i1SiCQeRw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linusw@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 2:49=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne =C4=8Detrtek, 25. december 2025 ob 11:36:15 Srednjeevropski standardn=
i =C4=8Das je Chen-Yu Tsai napisal(a):
> > The device tree bindings specify using "fail", not "failed".
> >
> > Fix up all the ones that are wrong.
>
> While patch indeed fixes the issue, I wonder if "fail" is proper value?
> According to specs, it means that device needs repair. What about just
> keep "disabled"?

"disabled" isn't right either, as that means its disconnected or not used.
These are definitely connected.

On the other hand we could fix these and describe the supplies for the
external as supplies for the pin banks? But I doubt anyone has these
devices around for testing.

ChenYu

> Best regards,
> Jernej
>
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts | 2 +-
> >  arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts | 2 +-
> >  arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts      | 2 +-
> >  arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts         | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts=
 b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> > index 63e77c05bfda..f2413ba6a858 100644
> > --- a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> > @@ -112,7 +112,7 @@ axp209: pmic@34 {
> >
> >  &i2c1 {
> >       /* pull-ups and devices require AXP209 LDO3 */
> > -     status =3D "failed";
> > +     status =3D "fail";
> >  };
> >
> >  &i2c2 {
> > diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts=
 b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> > index c32596947647..e0c7099015da 100644
> > --- a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> > @@ -96,7 +96,7 @@ axp209: pmic@34 {
> >
> >  &i2c1 {
> >       /* pull-ups and devices require AXP209 LDO3 */
> > -     status =3D "failed";
> > +     status =3D "fail";
> >  };
> >
> >  &i2c2 {
> > diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts b/ar=
ch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> > index 5bce7a32651e..5dfd36e3a49d 100644
> > --- a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> > @@ -170,7 +170,7 @@ hdmi_out_con: endpoint {
> >
> >  &i2c0 {
> >       /* pull-ups and devices require AXP221 DLDO3 */
> > -     status =3D "failed";
> > +     status =3D "fail";
> >  };
> >
> >  &i2c1 {
> > diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts b/arch/=
arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> > index b32b70ada7fd..fefd887fbc39 100644
> > --- a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> > @@ -90,7 +90,7 @@ hdmi_out_con: endpoint {
> >
> >  &i2c0 {
> >       /* pull-ups and device VDDIO use AXP221 DLDO3 */
> > -     status =3D "failed";
> > +     status =3D "fail";
> >  };
> >
> >  &i2c1 {
> >
>
>
>
>
>

