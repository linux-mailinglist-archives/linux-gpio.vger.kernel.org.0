Return-Path: <linux-gpio+bounces-27251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAB2BEA2D5
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 17:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D3CDC5850E7
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 15:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6E9332EDB;
	Fri, 17 Oct 2025 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4h0h4Uk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529B8332901
	for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760715267; cv=none; b=LaXyEVG0+4E7axAa/QG67vuwGuyNAYL6ig4731o1OgKnOwZZ4S3oxt6REu218FDdHTpkAjh8UisNxbqivvBpSNtuTLL3tvdSRpOyjUZEyyRxgbi7IXGORfaBaUYPkXj0Ejr1Pg9M+8s6b77cw9D+mg1sKB/0nZ2f8WALN7sCEQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760715267; c=relaxed/simple;
	bh=UTHjW/toYsIDFb60IqVuORUHKF64xvgXUjf946jP9sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZuy10+X9iTP9CzvujvxI5IdDfJDK87Vl074KLfTYUqevH5XuBiQt3xaldL2exdgrLU38lpM+ePIbg08/NqdxdY1mH+OTwqUPLV/YpCgBcbBQ/pR0cqDCypGir4f+ObhnYCY55XTtJLs5M9ZzdNORN12jjRGd9UF1653meM/aog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4h0h4Uk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-427060bc0f5so458714f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760715264; x=1761320064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=favt1IDI3QNdxE7vKo/4IJP+8NRTOtxfK/UHHLad8Y4=;
        b=d4h0h4UkQUBi9RG84ziDxhlIlsh3UxB7sn9MR7Yj6W3bbda/QIgbac9Nxjc/PKohD6
         OUfpeEO2D9/VbtZquhIw0u3j/oyBvlYMN5TvwKJBBw064OEmk6YJiddpsAk2KZV/Dcty
         Sr04ODUnmqod/jqWfeYdeefjGE6NhMxOyfKuZnzhXhnm6wHt9VBMuPuh6YUGcSffY7vn
         o4MmEpGYsKQJAoAowELN6harvqe3BvL5v37+1nQ7QgJZESDGGd8Z+4n0M4CpB6njudCz
         iUeig9cBju+kKMttbtS1dpexh15pnseMLKqEeA4ZERcEplzCLQNQwMmJfzjOc5pYTz5M
         juYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760715264; x=1761320064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=favt1IDI3QNdxE7vKo/4IJP+8NRTOtxfK/UHHLad8Y4=;
        b=nIhJfa4qr5mhsDYp/ltnQdJ/pkreERqBrFSuqd30Ip/Hj5XCqvuQz4CdTKMts6Ck7x
         HNkw4qGAlDj23Dg8BFWipuyVFSGQJ/9ihGf08p3WSfxf56EsLgzJVZPiNXbp+ViSE3WQ
         G4qUL/uGU9d+SKv85SiCj6Eppe/1/IdqmNS9wHgBuEp3ENcQfczN1II9nGqSoo+e9o9n
         o66iCqcQcZHunCGcWepwXZ+nKHfQEDPxEgVnemWRcDEzBKTZeRjfM0WsJnr0fsHfu4Yu
         cm3mJt2ZkTZun6GIrhAltcNts7nro1zyiXHOHiFDKDXquntu+5fcwMXxoidgrcfkE2Mp
         ueRw==
X-Forwarded-Encrypted: i=1; AJvYcCUux2GL6F2fmRPIC+QWtU58VRDU6u/90Gi2OzBjpGSpXIx7NEDMm/utbw9AbGT8CUOzC0fT+T8D6cIx@vger.kernel.org
X-Gm-Message-State: AOJu0YwfHNga0gHMD+cLvGjBEjK2d9quD9n7NIXs9OIy3cIIzBLPvEy1
	MFVbjgKXF9Kd9ju6Zf1foXaZ7lkiMx6JX6Pz7Rhsb6VXDuwJQkf5UInRw+54SDjlwyllH8G41Kw
	fxUKCjBfAhWpAnFVD2TITYXsS3s8Rj4g=
X-Gm-Gg: ASbGnctfHbXIfE9Ndzcjtz6/p/D1mYVCdTtnGjWuMvDRDyvzPJ4p1uCI3Hf+SI6T1zr
	DibUvRnLW2ot20oXZGd9A3ymxfwjhtFfUruJS8rfFWC+32xCZR+b0g91T5MVLuj/S8HqycEsVad
	YZJ/7uoaruEOyHT6SjHsUdKW55si2vsTJ1bRLy4Ji1ZnAhEfrBys6Xi10S6asNdf8vkv3XsanvJ
	8UtpzNGiLjsPtso8vKwCW/paY82RWxHcj2F31WPDVm0tbfthkhyccemPm8BFg==
X-Google-Smtp-Source: AGHT+IHfpHgBVmETg3KYRZoAGy7Gg8QhvZwh2b+3jlFtVYjceIivbm2b7FrweI3TQHdE8Iw08/NlAQfWRcgPGmGMoFI=
X-Received: by 2002:a05:6000:4313:b0:3d7:2284:b20 with SMTP id
 ffacd0b85a97d-42704d9cf76mr3237097f8f.3.1760715263625; Fri, 17 Oct 2025
 08:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251016-dimmed-affidavit-90bae7e162aa@spud>
In-Reply-To: <20251016-dimmed-affidavit-90bae7e162aa@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 17 Oct 2025 16:33:56 +0100
X-Gm-Features: AS18NWBguR9F654YWkASexXoMxk8B54Vyccl4usuxCXhdtptJoKlKHlfL85bFOo
Message-ID: <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
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

Thank you for the review.

On Thu, Oct 16, 2025 at 5:41=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Oct 14, 2025 at 08:11:20PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the pin configuration properties supported by the RZ/T2H pinct=
rl
> > driver. The RZ/T2H SoC supports configuring various electrical properti=
es
> > through the DRCTLm (I/O Buffer Function Switching) registers.
> >
> > Add documentation for the following standard properties:
> > - bias-disable, bias-pull-up, bias-pull-down: Control internal
> >   pull-up/pull-down resistors (3 options: no pull, pull-up, pull-down)
> > - input-schmitt-enable, input-schmitt-disable: Control Schmitt trigger
> >   input
> > - slew-rate: Control output slew rate (2 options: slow/fast)
> >
> > Add documentation for the custom property:
> > - renesas,drive-strength: Control output drive strength using discrete
> >   levels (0-3) representing low, medium, high, and ultra high strength.
> >   This custom property is needed because the hardware uses fixed discre=
te
> >   levels rather than configurable milliamp values.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g07=
7-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g07=
7-pinctrl.yaml
> > index 36d665971484..9085d5cfb1c8 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinct=
rl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinct=
rl.yaml
> > @@ -72,6 +72,19 @@ definitions:
> >        input: true
> >        input-enable: true
> >        output-enable: true
> > +      bias-disable: true
> > +      bias-pull-down: true
> > +      bias-pull-up: true
> > +      input-schmitt-enable: true
> > +      input-schmitt-disable: true
> > +      slew-rate:
> > +        enum: [0, 1]
>
> What are the meanings of "0" and "1" for slew rate? Why isn't this given
I'll add a description for it (0 =3D slow, 1 =3D fast) and the same values
are programmed in the register to configure the slew rate.

> as the actual rates? The docs surely give more detail than just "slow"
> and "fast".
You mean to represent slew-rate in some sort of a unit?

>
> > +      renesas,drive-strength:
> > +        description:
> > +          Drive strength configuration value. Valid values are 0 to 3,=
 representing
> > +          increasing drive strength from low, medium, high and ultra h=
igh.
>
> I see what you wrote in the commit message, but I don't really get why
> you need a custom property. I would imagine most devices only have some
> some small set of "fixed discrete levels", yet manage with milli- or
> micro-amps fine. Converting from mA to register values in a driver is
> not difficult, and I figure the documentation for the device probably
> doesn't just give vague strengths like "medium" or "ultra high", but
> probably provides currents?
>
> I dunno, I am just confused by the need to shove register values into
> these properties, rather than using the actual units.
>
I'm checking this with the HW team. I'll get back on this once I have
some feedback.

Cheers,
Prabhakar

