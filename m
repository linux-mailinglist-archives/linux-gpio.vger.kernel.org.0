Return-Path: <linux-gpio+bounces-29366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BED02CACE4E
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 11:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB731303C9F8
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 10:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B2322D7A9;
	Mon,  8 Dec 2025 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmw5wWPL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2272D46B3
	for <linux-gpio@vger.kernel.org>; Mon,  8 Dec 2025 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765190195; cv=none; b=A21GIRcSsV1AIDgJU8n/deshl67vAxsRsQkLKlYr46BYE86cu5NL278EksPf18cN+KeAWa0GLt+Q9fcMon21WyH1LJiY71/VDwA4RM5t+BWR3MzwsqU8Xqtn4Ddp8SAhj24/pfuwP+v6F0nfV+2MwZyofErjqfhicTh75auYP/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765190195; c=relaxed/simple;
	bh=ktExAwk09xXlS+b1Q6PaBZbizZnuNuKiVITrVB744Hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6TPH8gY7yVm+e70nlTUlCVweqNXj+67R5ts4huF8+U228SGbURtDQESM96ncA6Yc2OUi1bjNunqcNkBWkaogYx4OlbRq621UodHNzjReNiaJummOAcx1CXh5HY+FPTLc21EV4lDxHR0puyGLmEwxiOq0XMX3+Q6oOhIRqHnK+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmw5wWPL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779d47be12so38989075e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Dec 2025 02:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765190192; x=1765794992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMlT3GrUWX2NNEK+o6vRkkPf74QOSHsBsy8eHZ6qmn4=;
        b=Nmw5wWPLPR11vKDE9dSx2qKmlmRMWHx9BtoG4KO+odcD5BqTMNyLIUyRvNSQa1u7a1
         uupxS1pzAnN1V/I07L3s7gWWZWnMzAHwCPo2rbS28WODuu5avVe73TbH2R60fxkhfOfq
         sUlfxYemn5Iz4+LrR3kKdBKfm501d0jMVaasMFpEou4NtpzBCMePfCxwP3Ltvk3nyL3j
         Jv+Mp5Va1KZNIFbTkIM8TK53NomiT/3MJo9s8kGUDrjyz23f7dlxTlWtzMzuKo67iOzN
         CzPTJfVfpq9QiTlje2rRWHsNr06TrBGm4rBbH1dcW4nNvT8S4FkhiXlCPr8H+RqP8Zik
         UKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765190192; x=1765794992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kMlT3GrUWX2NNEK+o6vRkkPf74QOSHsBsy8eHZ6qmn4=;
        b=GUCKcXF7OPDkMrfVWYxoZY7xID34p1rgViJWZovMg6NHKzBp4TvRf+0oESHoAUXQAV
         XLEsa94rTjGmIa659XM7qKVEOCbhSsOVfpD2PTp5SN+sLgMipInfwLeaUikCmhagWR22
         +9TG7NLf+GkYc9ACAwvyxrfMAuz657VcdxX+Rd8HBg5FMsdtIYYLOtnQu9GOK1KskRNG
         ZqOKNqk4HJUs80FZlFRUEZpDDrAUVTLlnKiEu+Fvpaku30iud0xlayLHUw4MO10U48Nc
         jIHTQISdRnc8ukb0oAA8OzCn5FHNshMVd1U3j4DYhwvRxUGJ9+xk7+mRGXelxMmPRCOF
         ESqg==
X-Forwarded-Encrypted: i=1; AJvYcCWHAnLnsHDL2pMuWv/FExLRnem7kLZnfMZ9vyvGyUwvbGq4aSSPmCSgcG2eYxTtNfWQ3BXSyYRWZ3WZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyjmXp7qFC5DmWn4zvxTeYLX7pNF2MkG3iGPIrW7MO/FAd6hQQL
	PtKYzI+BJTsTudPwc5e5qMSkLMZ+gxiwTHeXN0tQKAU2Kj+R4tdc979Rt8zPx5ds9mnyyvCIBkF
	60+2rcYwuJEb7EdH06h+MuIqrvWs5DqE=
X-Gm-Gg: ASbGnctHSbSsG4druHVIvG0ImgwVvUvrwxnJ8vJ2Jylt3b+9lrmdF67hrpuvlu6iUVs
	nZrSug89VY1teO+ufJj9gEu86zQvu751FS6NhFFZBz4+DuX1qz7CVWKPXkFzcgNbZwTUEddj+hZ
	smzThZ9coXaWk+gU3paY2ZMLSHojqljz/n5SKJXGiYS1uPBzJzx6DisgeggB8b1FgEPaJic5pi5
	3SElcdXv3GZiWAQrQBVpMuf+AFiuIwUkwUq8iNGFa3UGykgQKUO/rIcouPobbC3p/jpkh0roQ==
X-Google-Smtp-Source: AGHT+IGCPhJ/SFS/JU2cqZS2CM1G6xYyKv1ZKO+4vcZP8Ek3HWdppieKGOORRMOx70Zwiyr8q/MmFBVUATITCzUzmdg=
X-Received: by 2002:a05:6000:2c0d:b0:400:7e60:7ee0 with SMTP id
 ffacd0b85a97d-42f89ed7b85mr6530004f8f.0.1765190192029; Mon, 08 Dec 2025
 02:36:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud> <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
In-Reply-To: <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 8 Dec 2025 10:36:04 +0000
X-Gm-Features: AQt7F2odR5Nl_KDNgNLH6au-HtXpAd4NKsoyKAYIPpcPwSz66o0q23_b9VYuPr8
Message-ID: <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

Sorry for the delayed response. Ive got feedback from the HW team.

On Fri, Oct 17, 2025 at 4:33=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Conor,
>
> Thank you for the review.
>
> On Thu, Oct 16, 2025 at 5:41=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Oct 14, 2025 at 08:11:20PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document the pin configuration properties supported by the RZ/T2H pin=
ctrl
> > > driver. The RZ/T2H SoC supports configuring various electrical proper=
ties
> > > through the DRCTLm (I/O Buffer Function Switching) registers.
> > >
> > > Add documentation for the following standard properties:
> > > - bias-disable, bias-pull-up, bias-pull-down: Control internal
> > >   pull-up/pull-down resistors (3 options: no pull, pull-up, pull-down=
)
> > > - input-schmitt-enable, input-schmitt-disable: Control Schmitt trigge=
r
> > >   input
> > > - slew-rate: Control output slew rate (2 options: slow/fast)
> > >
> > > Add documentation for the custom property:
> > > - renesas,drive-strength: Control output drive strength using discret=
e
> > >   levels (0-3) representing low, medium, high, and ultra high strengt=
h.
> > >   This custom property is needed because the hardware uses fixed disc=
rete
> > >   levels rather than configurable milliamp values.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > >  .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++++++=
++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g=
077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g=
077-pinctrl.yaml
> > > index 36d665971484..9085d5cfb1c8 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pin=
ctrl.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pin=
ctrl.yaml
> > > @@ -72,6 +72,19 @@ definitions:
> > >        input: true
> > >        input-enable: true
> > >        output-enable: true
> > > +      bias-disable: true
> > > +      bias-pull-down: true
> > > +      bias-pull-up: true
> > > +      input-schmitt-enable: true
> > > +      input-schmitt-disable: true
> > > +      slew-rate:
> > > +        enum: [0, 1]
> >
> > What are the meanings of "0" and "1" for slew rate? Why isn't this give=
n
> I'll add a description for it (0 =3D slow, 1 =3D fast) and the same value=
s
> are programmed in the register to configure the slew rate.
>
> > as the actual rates? The docs surely give more detail than just "slow"
> > and "fast".
> You mean to represent slew-rate in some sort of a unit?
>
Based on the comments from the HW team, there is no numerical
definition to represent slow/fast It only defines a relative
relationship.
> >
> > > +      renesas,drive-strength:
> > > +        description:
> > > +          Drive strength configuration value. Valid values are 0 to =
3, representing
> > > +          increasing drive strength from low, medium, high and ultra=
 high.
> >
> > I see what you wrote in the commit message, but I don't really get why
> > you need a custom property. I would imagine most devices only have some
> > some small set of "fixed discrete levels", yet manage with milli- or
> > micro-amps fine. Converting from mA to register values in a driver is
> > not difficult, and I figure the documentation for the device probably
> > doesn't just give vague strengths like "medium" or "ultra high", but
> > probably provides currents?
> >
> > I dunno, I am just confused by the need to shove register values into
> > these properties, rather than using the actual units.
> >
> I'm checking this with the HW team. I'll get back on this once I have
> some feedback.
>
The current value is determined by the load on the external circuit
and is not affected by the choice of drive strength. For example, if a
3.3V signal line (H =3D 3.3V, L =3D 0V) has a 3.3k=CE=A9 load, the resultin=
g
current will be 1mA, regardless of whether you select Low, Mid, High,
or Ultra High drive strength. What changes with Low/Mid/High/Ultra
High is the =E2=80=9Cslew rate=E2=80=9D of the transitions (H --> L and L -=
-> H), not
the current itself.

Please share your thoughts on how to implement these properties.

Cheers,
Prabhakar

