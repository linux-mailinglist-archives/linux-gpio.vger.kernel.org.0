Return-Path: <linux-gpio+bounces-30298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC057D05B85
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 20:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1405430213E4
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 19:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC6E328256;
	Thu,  8 Jan 2026 19:03:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD1230EF92
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 19:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767899039; cv=none; b=BHs4G552sqyTceOXzZ8b8GEUzMUha9pPZ3KJBkGmDf7+fufcWpCSut+gFI3ya1Rve9um1z+bytq6OS7p3i2I8TVkLyeUuiUy14fHxgGIaX0b261hGynOTuVlnzCkUDZMS4mG3UCzNGdYdTNQbIxMgCWszzhSQzfgt29jXJntFeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767899039; c=relaxed/simple;
	bh=xkdhuC4s+3mOYP0yOIF0uzVtjPP7M61rCMLgQ0C6+CE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ps4GnTMYLuq9Hd3OwgzwxLbj1w1UXceBN9lPaXP1s7gbEMyqBJMtkZb0CsfdTSseMt4hShPsZ2ZBIeAzEwNH4RcpleZ4H9jAAd/KBO+nogJpZVPAu+HF0Mcxf7rUXM0kKIVuzPX6NwojDAI5pfKPczCY6fVrEeoPZRsS/tbaZww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-944199736ebso882224241.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 11:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767899037; x=1768503837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4POSF/G2AiiMzhu15VytRAuNKvteZUdBLrFSKMZB68=;
        b=AHc4pk4DG6sJz652EUZUYulZxu2/l33dxB6RfxQHPPQSiSZEz5U15LWs4AeQUGEWna
         AOh4ldM6QejIR+Qkp74qpV644lVPhxuCfPjl4anne2b0jiwhyP/lhbgnpk0kipl6HymB
         uwCS7uIVoQV2VqhzNfA+tsYtMqFaT0vz5q02VvHMp6mPHaiWpe7wnY1FGIlzVg3yjzFO
         OiVxm8+knl2f/gssWjWWFhxfPV6v38DmXrEn7ALQLvKd+NxegPKsUZuknqXV+8HmRz/g
         TPTFpljsprhjanfjuNdnBMj9cYLW5+GsCuP718RYjz31V8mLxWN7swIwsI0sxDC5qBmJ
         HpKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrmJmJOMwTZiBoDSW22vmTf8+mPr3Y8LEkJPc/nRPaG7Xzxo5BxSBuFIjcXeDeLemBgydYnuXmS1Qf@vger.kernel.org
X-Gm-Message-State: AOJu0YwZKyql1EdyOGrkvmWj+mj/BKDjrV+OS6dSo0zkdpIPLYRJOZOs
	zmGM5L4/sxlKWbhKmrmrUwOR0ElVv5ZtIsBzyqH56Y0Kr88Be14svT/AMliD6SV5
X-Gm-Gg: AY/fxX5IrDNLPQT4uM9POZeqmdPB9oaiKMZv0wTvLej0QhCZ7qcz/4aJWSS9TDwI5Gd
	y2SR2ZDaBx3m0GRx2h34ZfnqFZYzcwuxhmPeoGdAeEIrYjCQJ5J1tlfPG4eMUy/efS3gXAYmEL3
	0a1S5gIC34FwZrJgC+NuULU1EVOSICmqpdEg3xqujUIGgfkaGBvUyhI6GLy7icfM1VTPus2Yaco
	G0h0NOzdGk7vdF/zJj9YrV323rM+cybOeOYBPadxSKctZhCas16h5BdvvuycqACHdfIWvgCCk4R
	sQuq7FHPAA49jo4gyWQN06+KpjgZTy+Oj4yUyxM5yAdnDMB4qbE2sVvWKi7bolJmpRR0iIo+8M9
	jo/LdiZqyYndU9F6pxbtxy3giD1zlWK7JZ78tnMaZ4E/dMGFsKXJWshPgmQ4zhpCguuEAebmkAt
	Syj1UZphuPzvGsLdaM7viJ5PoFz6FCHx6Cg88rZ1ZocKwFd1sDQiyVVQ2edy0=
X-Google-Smtp-Source: AGHT+IFQHerBw9xtPozoh9BzhRmcUjkLlfhmckmRXGx/fyI8Eb7H33O8BgyW+BEgHj7ixhbZl/brjw==
X-Received: by 2002:a05:6102:1607:b0:5db:ca9e:b57e with SMTP id ada2fe7eead31-5ecbae46d35mr2495166137.43.1767899036789;
        Thu, 08 Jan 2026 11:03:56 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec7702eb72sm7140485137.4.2026.01.08.11.03.56
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 11:03:56 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-944199736ebso882209241.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 11:03:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2lIBsw0qFKVUBAEAhis5L/70NBprpe8c5PYVyLLt5bPAYU/ZcZsqC7kFBOzBgqI7gJWXhmgee8gGx@vger.kernel.org
X-Received: by 2002:a67:e115:0:b0:5ee:9df0:a5f4 with SMTP id
 ada2fe7eead31-5ee9df0a818mr1083422137.31.1767899035850; Thu, 08 Jan 2026
 11:03:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251205150234.2958140-8-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdWSB=9d7jwFcLjJY3zJjs7neFJ+tr+GtTDAU85=o8xK1A@mail.gmail.com> <TYRPR01MB156196B6A2C6808841B5BAF818585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB156196B6A2C6808841B5BAF818585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 20:03:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJ-zC0kWViGTbdyRifNKB5R1DRpLcgyk0_zr=XTjx9tA@mail.gmail.com>
X-Gm-Features: AZwV_QiG1FTx5__3lAFmUWj9TP06IZp1Z3Zx_MjG3bA3hF9KZ0sDQDS0nL8rtcc
Message-ID: <CAMuHMdXJ-zC0kWViGTbdyRifNKB5R1DRpLcgyk0_zr=XTjx9tA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: add
 GPIO keys
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Thu, 8 Jan 2026 at 19:28, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, 5 Dec 2025 at 16:04, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > The Renesas RZ/T2H Evaluation Kit has three user buttons connected to
> > > GPIOs that can be used as input keys.
> > >
> > > Add support for them.
> > >
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > > --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> > > @@ -7,6 +7,8 @@
> > >
> > >  /dts-v1/;
> > >
> > > +#include <dt-bindings/input/input.h>
> > > +
> > >  #include "r9a09g077m44.dtsi"
> > >
> > >  /*
> > > @@ -60,6 +62,37 @@ / {
> > >         model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
> > >         compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
> > >
> > > +       keys {
> > > +               compatible = "gpio-keys";
> > > +
> > > +#if (!SD1_MICRO_SD)
> > > +               /* SW2-3: ON */
> >
> > Shouldn't that be OFF?
>
> Good catch! Yes, it should be OFF, as it's ON for SD Card.

Thanks for the confirmation, I will fix it why applyig.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

> I will fix it for the next version.

Hence no need to resend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

