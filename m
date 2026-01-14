Return-Path: <linux-gpio+bounces-30582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66576D213C2
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 21:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D51D303751D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 20:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD28C357A33;
	Wed, 14 Jan 2026 20:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLfXn98i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3003357735
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 20:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424023; cv=none; b=GZeKegYwn5/z1+15xtA3/Mrvu5Vzb9tYbEjkKRLa/wjIBcfXUaCUe/osn6d0B13WOteHuzq63PlSxVE+KjvYNArlz4+Us0YbA4HU3yenqR9WjrnT5RfcPKC0ZObGpIjp/zjdSjEkTHVouMqtQ9eXscTqDf1WBOwa76mWkpmP1Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424023; c=relaxed/simple;
	bh=eKw9hDJRFF4Qa8wkU+c+/6MTd3FcvApj72fDSoLnQ8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKm61stca+9XzhGQE5oLlPr/mFzLmn1ZPwWcQb2V6DcGYsAJmt1K474FZ3lCz5SaSjcZcxDlFIkcXpwh14bxzn1WKohSWZ7cts2/dEgoAdZDPSquNQvHvV2AdVKB2f0I5wbw1w1bdn0q9o7cJYFkAp4/sXKeyt2PFrMOMKQT6Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLfXn98i; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbc3056afso171487f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 12:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768424020; x=1769028820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvrUZewEpeDC2Kxm8njWod4+e4/7eBCNdsquru7gClI=;
        b=XLfXn98iCTBT+rutZa1O0FyYbgMbDE7COCXK/4MCzc4f0jbhGDG+uCbDtzHK54qgA4
         fWkUxwXUXWRMrNcGgxy+KA68QLxx8fJtesVSZFRdRuI8OK+NiubY7me9gzTkOXEKm2Gf
         BU9NX0vRhHlhd9KgANJ2BMRmnxS20l42I4E3auAVgcg7z3i+botrwNaPyypy7/7cFXTl
         l3+EiS+lCujvrc0BF/kuDe0f/OzOLxF8ZCjaUfl6pCemoHcM1v+1JiNa35ARw8xRlEZM
         sK6B/38F4aIU/qxaXjeNhnwWxncQ5a1eT0/0H4UaSaz21NngZwpiOGtBnq+5rrPKmVhz
         G4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768424020; x=1769028820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GvrUZewEpeDC2Kxm8njWod4+e4/7eBCNdsquru7gClI=;
        b=milkpI4cwbeB8gGS5EWNmpOw2E4A0jRw4TvxGZsrmwdUbzPjqVVU3XiUfJrSis3I7D
         nBX79HDA9lOfDEMbdgN5iwBapwwG6SDsQFIhjWZ9AiVgqtNkDEtTR15s9FXG/h58W3K4
         10Qi6qisx35x24Y9xhsmwjEEUh2agUE95Evg26rE75y9iALyPTTZrJPAxBjVad1klPE8
         PHu7aST2nfxa+rYa+owI1ScD83SIiyeFMunypm6WHw1aoWrKtPLn1QWRS5rXgilLv+fV
         i5QGgJFyzizXGpepPFmH1G0am4fF2kDE7CKZuwmeX8uDfAutO3TpNMQYn1M8gRHZUvzz
         AN0g==
X-Forwarded-Encrypted: i=1; AJvYcCW2pV+nRbbO7q0JqHZi6c5Puhyg0B97yjeTIMH/mR+xpZ9kmvYY5FtZ3HDVwcjYzyE1bGbazOCoZP9w@vger.kernel.org
X-Gm-Message-State: AOJu0YyXU52X+fMiuiVPvI0gmsnRVZOSirz5BfyVVukBeg70pP7xrqKS
	5Ks4m42FZacKfgZPwQmFoJChqIRs8JllsYXhvNqYRubVHL6/6tO3nNxhWiNg+deKIa0SvoLNTXU
	C7fVIaSdCCXtdJ+d9jZKtwEGkXGoUTe0=
X-Gm-Gg: AY/fxX7bX24ps7ggASPAm4eeEXdKDkqpLkVr08fNz0VJepWUxa/Hugjay10ygj3jA2E
	dfir2ie8TPC6r/hZqC94K4xcQX8BLQUbGYBh+vjGpKzeOovjOBwoqjXbcGdYpjYokjuar6MNhhs
	IyGwa5g/JGcW59DSEO/wR9NhcCyw1F3YhSX+KMnpBHFq5jHnVHv3i6tthlfjxU+/VDxpWzQW66x
	WE+iVvLfq7is/SgnWJH4PBR8UsjvEcDNZicUneZPKZ1sHaWjC9oIUhfNVNc4lKdOu71Kp7pGdsO
	fvrRgjOpWmrIg0g3ebtu6PiH3IJ1FvGcZmaGG6vZpu4/Eo7TObnUPqoB3A==
X-Received: by 2002:a05:6000:40db:b0:430:f985:a7b2 with SMTP id
 ffacd0b85a97d-4342c55f3b0mr4238015f8f.51.1768424019774; Wed, 14 Jan 2026
 12:53:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud> <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
 <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com> <20251208-headgear-header-e17e162f0f52@spud>
In-Reply-To: <20251208-headgear-header-e17e162f0f52@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Jan 2026 20:53:12 +0000
X-Gm-Features: AZwV_QgkJ4nfZeMXY9G9zioU4AndT-7yDm9xyCWoiQKhNWRf1DfoJ-GzN1JFgns
Message-ID: <CA+V-a8s0gPbe2ffmN1G_7ibVL4+=FKUEQZu3_CwQL=U0T3--DQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: Conor Dooley <conor@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

Sorry for the late reply.

On Mon, Dec 8, 2025 at 6:01=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Mon, Dec 08, 2025 at 10:36:04AM +0000, Lad, Prabhakar wrote:
> > Hi Conor,
> >
> > Sorry for the delayed response. Ive got feedback from the HW team.
> >
> > On Fri, Oct 17, 2025 at 4:33=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > >
> > > Hi Conor,
> > >
> > > Thank you for the review.
> > >
> > > On Thu, Oct 16, 2025 at 5:41=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >
> > > > On Tue, Oct 14, 2025 at 08:11:20PM +0100, Prabhakar wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Document the pin configuration properties supported by the RZ/T2H=
 pinctrl
> > > > > driver. The RZ/T2H SoC supports configuring various electrical pr=
operties
> > > > > through the DRCTLm (I/O Buffer Function Switching) registers.
> > > > >
> > > > > Add documentation for the following standard properties:
> > > > > - bias-disable, bias-pull-up, bias-pull-down: Control internal
> > > > >   pull-up/pull-down resistors (3 options: no pull, pull-up, pull-=
down)
> > > > > - input-schmitt-enable, input-schmitt-disable: Control Schmitt tr=
igger
> > > > >   input
> > > > > - slew-rate: Control output slew rate (2 options: slow/fast)
> > > > >
> > > > > Add documentation for the custom property:
> > > > > - renesas,drive-strength: Control output drive strength using dis=
crete
> > > > >   levels (0-3) representing low, medium, high, and ultra high str=
ength.
> > > > >   This custom property is needed because the hardware uses fixed =
discrete
> > > > >   levels rather than configurable milliamp values.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas=
.com>
> > > > > ---
> > > > >  .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++=
++++++
> > > > >  1 file changed, 13 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9=
a09g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9=
a09g077-pinctrl.yaml
> > > > > index 36d665971484..9085d5cfb1c8 100644
> > > > > --- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077=
-pinctrl.yaml
> > > > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077=
-pinctrl.yaml
> > > > > @@ -72,6 +72,19 @@ definitions:
> > > > >        input: true
> > > > >        input-enable: true
> > > > >        output-enable: true
> > > > > +      bias-disable: true
> > > > > +      bias-pull-down: true
> > > > > +      bias-pull-up: true
> > > > > +      input-schmitt-enable: true
> > > > > +      input-schmitt-disable: true
> > > > > +      slew-rate:
> > > > > +        enum: [0, 1]
> > > >
> > > > What are the meanings of "0" and "1" for slew rate? Why isn't this =
given
> > > I'll add a description for it (0 =3D slow, 1 =3D fast) and the same v=
alues
> > > are programmed in the register to configure the slew rate.
> > >
> > > > as the actual rates? The docs surely give more detail than just "sl=
ow"
> > > > and "fast".
> > > You mean to represent slew-rate in some sort of a unit?
> > >
> > Based on the comments from the HW team, there is no numerical
> > definition to represent slow/fast It only defines a relative
> > relationship.
> > > >
> > > > > +      renesas,drive-strength:
> > > > > +        description:
> > > > > +          Drive strength configuration value. Valid values are 0=
 to 3, representing
> > > > > +          increasing drive strength from low, medium, high and u=
ltra high.
> > > >
I got the feedback from the HW team "The RZ/T2H drive strength
(driving ability) is expressed using abstract levels such as Low,
Middle, and High. These values do not correspond directly to specific
mA units. To determine how much current the pin can actually drive,
the engineer must refer to the electrical characteristics table.
Therefore, the drive strength in RZ/T2H is a parameter that switches
the internal output transistor mode rather than directly representing
a physical drive current.
Consequently, expressing RZ/T2H drive strength in milli- or
micro-amps, as suggested by the reviewer, is inappropriate. To
accurately reflect the SoC's hardware specification, introducing a
custom property is essential."

To elaborate more on this [0] has the tables which are extracted from
the HW manual [1] (which needs login). For example, considering SDHI
referring to table 58.39 in [0] the drive strength can be calculated
for SD using  I =3D C =C3=97 (delta V / deltaT).

For (SD) SDR104/ (eMMC)HS200 case C =3D 15pf, VDD1833 =3D 1.8 V and
rise/fall time 1ns that would result to 27.000 mA
For (SD) SDR50, SDR25, SDR12 (eMMC) High Speed SDR case C =3D 20pf,
VDD1833 =3D 1.8 V and rise/fall time 2ns that would result to 18.000 mA

As the drive strength is varying based on the speeds this cannot be
tied up to the fixed value. Hence to simplify the Table 58.11 in [0]
lists out the required drive strength and slew rate based on operating
voltage levels.

[0] https://gist.github.com/prabhakarlad/026a73c3a3922da2b88d0578db68276c
[1] https://www.renesas.com/en/document/mah/rzt2h-and-rzn2h-groups-users-ma=
nual-hardware?language=3Den&r=3D25567515

Please share your thoughts.

Cheers,
Prabhakar

