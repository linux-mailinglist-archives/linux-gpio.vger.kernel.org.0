Return-Path: <linux-gpio+bounces-30716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88037D39B95
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 01:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 169AF3007881
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 00:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E88D8F48;
	Mon, 19 Jan 2026 00:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnRQzSo1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59268F5B
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768781406; cv=none; b=Ds9nWtELpWw+IbWdGY2o7mkP5SJHIZqnIikanLNuB4qv3Kv0qK6JjGYMaxzp1Q/LIz0mQkgFqeT/mRNBUBZp66yKZ5aHx/zVuiH9bIet4AuU9WYQ0Jyn3XbhQU4filSYi4yK/PBD/UBQxJx1dJMxQPDUKBNORIv04cfGB3b2ye8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768781406; c=relaxed/simple;
	bh=qTKLxffbvsRQtEokM8325JVSKPK/nqolGbWrdv4nhRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VU5i5eKTn80d4461QdxfD3dI3qEB9yHx7MuOxdLg2H3GN622Nv/kwlHFFhwPwACXf1Tn+tVTRjHjubomZ1MzvgsJRhSy/QRzHDMvc2zOEQTzkS3JME8VbyZ4HLksUAyyD/12Kwfltn5JjHPa38GJ19StIpi8fQc80OyiXu8S/5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnRQzSo1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66669C19424
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768781406;
	bh=qTKLxffbvsRQtEokM8325JVSKPK/nqolGbWrdv4nhRk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZnRQzSo1C7ZQwqMFx3EEBM/RYdqpvdNxHOexf9vNYVRC7WIZNUjnI/Rwrc4R3Gohu
	 cNaJmf3ym2DNDnmo6n31kCoGNEVDpur6xB+53C0Ny/XzgYCw47oji9xAe9Y/7FuRPb
	 tM+U+fQEcUtnQJkba319YswAKhprWak5CP2rydUiNZPeAmvBWBSXe1wQ3QcPQYs6qh
	 TBDcyVabKxp8f4wck9FejWOUm6flPd3EihxSO7ukpjS92+5b1qrMv6iaw6M18J7kLA
	 XnzfW/0UsTDyrANSLOEEI/NS8sGMZRdfREjUYm32gV/UbTP3sIZD0e+u9CVBRQ6t1P
	 bLNs+04/VpWKQ==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6446fcddf2fso3313311d50.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 16:10:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+HYgxMyBAK+Jne3WMO3jQeCrcrMfD3+HHAqcezhLtJErKc/9aEJ0rnKdUyvJ9VlAxfMzJdeRQxvYl@vger.kernel.org
X-Gm-Message-State: AOJu0YzCQm/smOppNpkFx5YCE9aLJU2Se0rUlvB+GTFVleElHsb/hmO0
	9NL30MRQ7nSMgJXTDP3dPhRG4d5HD4WbMsqB8Mz0W11bTTywNoyLywlD67w0WuqMBB1yNrSD8Gq
	HRS9LYtl+H+DWjqHE48R3sU1UMjH47Rc=
X-Received: by 2002:a53:ac93:0:b0:646:c0b7:a893 with SMTP id
 956f58d0204a3-6491648c02bmr6820774d50.8.1768781405707; Sun, 18 Jan 2026
 16:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud> <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
 <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com>
 <20251208-headgear-header-e17e162f0f52@spud> <CA+V-a8s0gPbe2ffmN1G_7ibVL4+=FKUEQZu3_CwQL=U0T3--DQ@mail.gmail.com>
In-Reply-To: <CA+V-a8s0gPbe2ffmN1G_7ibVL4+=FKUEQZu3_CwQL=U0T3--DQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 01:09:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=J2UpxQSNrZhCMw2fJ0umM8NRtNys2zMBouAFBoK0m2A@mail.gmail.com>
X-Gm-Features: AZwV_QiqsC1aFqkodB0QjH_7sM4XqD_P7m1ZaeWi3fJkgnm2Ynk4oH-rYO0N0Mw
Message-ID: <CAD++jL=J2UpxQSNrZhCMw2fJ0umM8NRtNys2zMBouAFBoK0m2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lad,

I think this back-and-forth must be a bit stressful. Sorry about that.

On Wed, Jan 14, 2026 at 9:53=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> > > > > > +      renesas,drive-strength:
> > > > > > +        description:
> > > > > > +          Drive strength configuration value. Valid values are=
 0 to 3, representing
> > > > > > +          increasing drive strength from low, medium, high and=
 ultra high.
> > > > >

> I got the feedback from the HW team "The RZ/T2H drive strength
> (driving ability) is expressed using abstract levels such as Low,
> Middle, and High. These values do not correspond directly to specific
> mA units.

But they do correspond to *something* electrical inside the
silicon do they not? Then what is that?

I think it is just 1, 2, 3 or 4 driver stages.

> To determine how much current the pin can actually drive,
> the engineer must refer to the electrical characteristics table.
> Therefore, the drive strength in RZ/T2H is a parameter that switches
> the internal output transistor mode rather than directly representing
> a physical drive current.
>
> Consequently, expressing RZ/T2H drive strength in milli- or
> micro-amps, as suggested by the reviewer, is inappropriate. To
> accurately reflect the SoC's hardware specification, introducing a
> custom property is essential."

This is past my point. What is the maximum current dissapation?

I am asking for the current flowing through the pin if it connected
to ground and 1 second after the driver is turned on, or however
long time it takes for any dynamic transients to die out.

> To elaborate more on this [0] has the tables which are extracted from
> the HW manual [1] (which needs login). For example, considering SDHI
> referring to table 58.39 in [0] the drive strength can be calculated
> for SD using  I =3D C =C3=97 (delta V / deltaT).

This is so clearly about dynamic currents, I am asking for
*static* *maximum* for each setting. In SI unit, milliamperes.

The document says:

  drive-strength-microamp:
    description: sink or source at most X uA

So *at most*.
And low, middle, high isn't any SI unit.

If you *really* want to make this complicated and related to
an equation using capacitance, voltage and time, then you are
perhaps looking for the slew-rate property:

  slew-rate:
    $ref: /schemas/types.yaml#/definitions/uint32
    description: set the slew rate

This we haven't defined, because it has exactly the dynamic
properties you are talking about. It can be low/medium/high
and depend on the load. It reflects something like
V/s (voltage change per time unit) in the end.

Yours,
Linus Walleij

