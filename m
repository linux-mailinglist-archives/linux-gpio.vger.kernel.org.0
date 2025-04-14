Return-Path: <linux-gpio+bounces-18763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F12C5A87A7C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 10:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDDBD16F019
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 08:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E83325A2DE;
	Mon, 14 Apr 2025 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWRCYD4O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EBC2367A0;
	Mon, 14 Apr 2025 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619726; cv=none; b=EjWj3J7KguI4jLMbHzc2n4ZVK7Dy1rj4V/iNBSD3L9gjK+I60PYisn7c4OQjO4KkUcrlyuzs0gunIDln1QVqD9WjkuGnYtmKSMwgL5G4q8PpEjs+eZyw1pcPzVk5xVtKLDbHosuZjGiJTvgZgxxCrhwvnaInROBdthVuNquvioY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619726; c=relaxed/simple;
	bh=jNMQtR9jmoHsBvBUeA+7pLFndTA9N0330V8tjJxI7og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvUrxYk4kibY3suqkGxNmyF8n0nybLWAcx6+UOAO1Rl7S7JYiRecXNt/jI6jh5TL577kCuh2nDb/JUwyLCLE5sd9iczfPvDjRgjZRPxCNs40DMvqJkf5cJzx6ZbQnZ71eovDtvjUHctM8EbnN5WmGBk5RfBnFDX9zYVGzAyPJic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWRCYD4O; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523f670ca99so1709323e0c.1;
        Mon, 14 Apr 2025 01:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744619724; x=1745224524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK+fEyrb2ftsLjekq6LH08+qiCqnVgfTErFfTfbVUZo=;
        b=cWRCYD4OwKmEEwheY/lZcgnTeRS3das9wuRRxrDAjIbnCudU8SSnyRxSyWBKynXTat
         I2w5Mba7WJg18ExPNdxZTsb7HbrNFSq1xaULeYNKwcWmhp1abpjPNyHjpYSX5+n32jZ6
         Lx4JrORn+Cyb3hBvmgj7brCnQ5T8tJ7qVsJXc7ywDtC9TsYNT/0O4+8K+P/99mmmkGUn
         I9nLbSBPGWpuoLjnqT+4OF8ElF8UnEIeuwkCCxuHvpBrzfVkxoENBtPt2qh6J6MnugNl
         ROyfIaCq1LyvGAs2Zd6cjT6/1uv4IioumT5IMDh3qucCIMArfHvGInhIlsqE/dT6UxbK
         WXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744619724; x=1745224524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK+fEyrb2ftsLjekq6LH08+qiCqnVgfTErFfTfbVUZo=;
        b=IJpju/kRtuJNQHzJBUZYognM+7PUq5K1+966/eLZEb+pz7bNw+vR6JEFE3wNta2Jze
         rc+207aza8tmRf827cQvAa33b2caV945WW8b13N/WbSTSPdFOjPdWEGX1j/xSKMIBPAt
         0fZkHLEVRiaW0W+3gU+Rty3woqpj6Z++I/ie5C10oNwhNShdiYmEZRzHlUunuuk2m0tB
         XO4shR6GLV5lVjzcSVVfBw+hIwCXlVrqfsZvxwCigzZtIRvEvbyFIk98HfJt4qvfyb0l
         F7fy77GGYhaYPfX/ZQAFiGYrvyl9spgVazRIfg7VP7w1JHgfm0MUgUd2zTLE7d9n7LMq
         Jvpg==
X-Forwarded-Encrypted: i=1; AJvYcCUndc51ACaaNyOY3a45y0R5/6yUHwpg2VjzXVynp/JeL0ybaDF9hnTC5GF95PeJiKd37v02sZRdx47R@vger.kernel.org, AJvYcCUwcjL04CIQQLcPYY5tVBqsKA405y6NKVivrGBYbHJ4jM/bMTv619f4we6LoX2EM+JOxHr27bQG/b08@vger.kernel.org, AJvYcCVAlM6xsKGtzp5CD4TLfLLEzS3GQpq8RnBRHZnhJwBpYm3mJ7OJEugJDHpctVwhD7I9Zl/SHWLBDVskWg==@vger.kernel.org, AJvYcCVMRLAvI69/Gd3G3AIciPRcTdq2GxJSloaadhaM4O5VH/lZB2CRiKkL5puwmWEWW8QFSzyevKPnyIB+8dTY@vger.kernel.org, AJvYcCXLa5sfLK5m7bG3Xuke2lUIFmQBTkLvJUCcAOTY3aamSEvH+neg988w6WDtOAUV1EvohMK0vaLG6v5STlhITYLFPiU=@vger.kernel.org, AJvYcCXUUYCG6jzIUsMynyG4Jvay7RHzZ3E9Xff8UF7Y7rIhGl0VYN4NJoIFQR9RAT+Kv3Snf1kNzlkBH1BL3ckg@vger.kernel.org
X-Gm-Message-State: AOJu0YzfNITrT3FmyxP8zdZ1ayt71THU8YekquGZOMouYhvDFQH7HMCw
	U/GGtkZHtuJeZrhgvTiGhUlPXh0yNvo6wHOQgETk/nbjOIvMtqb2RiOO8M/QaybYEsm2K0NUAlu
	+F73NkGgROiXv1U7RKqZX9Rywmgo=
X-Gm-Gg: ASbGncsXH1aQucxULp1A1Qy7yi5x67kGnIUST3yxSBeJbHeNDBZbP3htascd1QxcliT
	Od9fgj0nYrKgLMa/4nktn3WrBuEE6idwGNVR/noSVsuvIqPCVRkvxCJTaUxD0fR6BqjlxVKjBAD
	qSRR1ANvkuwoMh0BfB0bO1Dg==
X-Google-Smtp-Source: AGHT+IGOGLfbW0SukWnxCHAABG5TfaOM526iSCc+9ulIg98XxOeWn3MdJv3wnW4Cc7Fzp1V5Oe6Fufo5S7bAzWHW7mA=
X-Received: by 2002:a05:6122:21a0:b0:526:2210:5b64 with SMTP id
 71dfb90a1353d-527c35babbdmr6629870e0c.9.1744619723871; Mon, 14 Apr 2025
 01:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407191628.323613-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWRokrL3EPKQbhHhCL84h1fZ7L3LjM0gFw96iqv36EiVA@mail.gmail.com>
In-Reply-To: <CAMuHMdWRokrL3EPKQbhHhCL84h1fZ7L3LjM0gFw96iqv36EiVA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 09:34:57 +0100
X-Gm-Features: ATxdqUFdznh3Sv9gHBH-n-mlporoTOmehWlxOa_he4pKtDtsqhX1d-1Ft9ky9fQ
Message-ID: <CA+V-a8sv94q3Z0eHfgPPrg0GKAP+cJgFdD0uBzPfmfLxL3Su8Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Apr 10, 2025 at 11:20=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add pinctrl support for the Renesas RZ/V2N SoC by reusing the existing
> > RZ/V2H(P) pin configuration data. The PFC block is nearly identical, wi=
th
> > the only difference being the absence of `PCIE1_RSTOUTB` on RZ/V2N.
> >
> > To accommodate this, move the `PCIE1_RSTOUTB` entry to the end of the
> > `rzv2h_dedicated_pins` array and set `.n_dedicated_pins` to
> > `ARRAY_SIZE(rzv2h_dedicated_pins) - 1` in the RZ/V2N OF data.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Suggestion for improvement below.
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -2304,7 +2304,6 @@ static struct rzg2l_dedicated_configs rzv2h_dedic=
ated_pins[] =3D {
> >         { "SD1DAT3", RZG2L_SINGLE_PIN_PACK(0xc, 3, (PIN_CFG_IOLH_RZV2H =
| PIN_CFG_SR |
> >                                                     PIN_CFG_IEN | PIN_C=
FG_PUPD)) },
> >         { "PCIE0_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 0, (PIN_CFG_IOLH_=
RZV2H | PIN_CFG_SR)) },
> > -       { "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_=
RZV2H | PIN_CFG_SR)) },
> >         { "ET0_MDIO", RZG2L_SINGLE_PIN_PACK(0xf, 0, (PIN_CFG_IOLH_RZV2H=
 | PIN_CFG_SR |
> >                                                      PIN_CFG_IEN | PIN_=
CFG_PUPD)) },
> >         { "ET0_MDC", RZG2L_SINGLE_PIN_PACK(0xf, 1, (PIN_CFG_IOLH_RZV2H =
| PIN_CFG_SR |
> > @@ -2359,6 +2358,14 @@ static struct rzg2l_dedicated_configs rzv2h_dedi=
cated_pins[] =3D {
> >         { "ET1_RXD1", RZG2L_SINGLE_PIN_PACK(0x14, 5, (PIN_CFG_PUPD)) },
> >         { "ET1_RXD2", RZG2L_SINGLE_PIN_PACK(0x14, 6, (PIN_CFG_PUPD)) },
> >         { "ET1_RXD3", RZG2L_SINGLE_PIN_PACK(0x14, 7, (PIN_CFG_PUPD)) },
> > +
> > +       /*
> > +        * This pin is only available on the RZ/V2H(P) SoC and not on t=
he RZ/V2N.
> > +        * Since this array is shared with the RZ/V2N SoC, this entry s=
hould be placed
> > +        * at the end. This ensures that on the RZ/V2N, we can set
> > +        * `.n_dedicated_pins =3D ARRAY_SIZE(rzv2h_dedicated_pins) - 1,=
`.
> > +        */
> > +       { "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_=
RZV2H | PIN_CFG_SR)) },
> >  };
>
> Alternatively, you can replace the single array by a structure
> containing two arrays, one for common pins, and a second
> for V2H-only pins, like the common and automotive arrays in
> e.g. drivers/pinctrl/renesas/pfc-r8a7791.c.  That would get rid of
> the literal "- 1" (and the need for a comment ;-), and would protect
> against future mistakes.
>
My initial intention was to do the above, but it was generating a lot
of diff so choose this approach. I'll switch back to above in v3.

Cheers,
Prabhakar

