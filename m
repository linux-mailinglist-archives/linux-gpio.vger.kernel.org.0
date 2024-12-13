Return-Path: <linux-gpio+bounces-13849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 842199F0782
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 10:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3B5E1887454
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 09:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BF31ADFF6;
	Fri, 13 Dec 2024 09:17:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BED42A1BB;
	Fri, 13 Dec 2024 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734081458; cv=none; b=rZER5F7ffhfC93ZDGTR0VLyDIdbG2YFBOmfa1uK5Zr8gbTw//4wJyhmmRdX9cQ+QP9WURs5zLDEzCPUmnOqiNzHuV7ujITcBAfdHEVvJl7e9FWdxUc2t8IjWvMNgvYLBiwerQHfMCZaowKlrbZiC0FO5fLjpxuxduKfhlx137AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734081458; c=relaxed/simple;
	bh=icBNK/ThLNguKu6d78Uo0HILxsPLyWRW8xDzZFzeaW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maUhB5LzQqe7/KlNDkXc4sbWebFtYfJZd/7IgSNtHOrdTTbepX4YAeOpjN6CHCxa7j0EyPmsAdPEn8lQ5eVbqznDdLI+TcW39kDtrmX5dfvaEzP1St0wCzH4rjeBEtL4KhNdf5/BkXc7SMWsDwNdsWKHYuPe4JmLMmcHx/hRKio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afecb2731dso386603137.3;
        Fri, 13 Dec 2024 01:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734081454; x=1734686254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4m20EdgUVIo1Zqh2J7lugrSKpV6bTcwX6b5CnnHFv0=;
        b=OjzjwenFrMijJJkWf9xPhS+kF19AjJ2MZfELWqWzih/s7+cqbH5S9MzeNHJM82D5p6
         u7TuupQIh84Iriv2WJ8NbgUvpkMk3R37MDQUyYfHKsWXON3TM0TVSma4E1xy+P439xN0
         9O3O90+YDJz1YsHWXOPe+u5c9UZbepf0d0LqB1s8jES3mEEmiLPoZmYiAe6AcXMRAAvY
         Qph2exPqmRu45oCEHxTJLSSsEA7Nw5YlHym2AlqbMAhesVs74ql9uZGjDXfaS7z2s4sU
         xjZeeKO+TZfasewIbCtoxi2yFHE+/hBzWNP44bANgymL4tGgea1DRSdyHt5BH6CAanle
         iiUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6LPKVmO6x/1520MD49MWCK7MixVMtXhKwH8Bfhc00vUigGMjoJmV4/uQbW0r5kgpyFqXzHAiBptDR@vger.kernel.org, AJvYcCWHm9B+T/bBEqoMfzsu/VEN2FVKC9R1tI+FIF3z/qnOX+lJcUoMBKVyoUBIJ24KjeVUqI6dl7KwpDzQDw==@vger.kernel.org, AJvYcCWtD3tcnBQkT/LC7+jocE8xpX91sDnyJ6uM2yl5+3xh01+8BqeaIbERF5SUtG7iJwJmCDU1vuBeKftEzQifQu4csVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTy6daanfS5XEKGI/2BQf5IF1LFRPrIabeZooO6gJy5CuSaEYX
	wu3vcVn0vAHnHSa2jcMppIcgug2v3OLPbGenb507GcNshpQ2xRRwcvhLFZl4
X-Gm-Gg: ASbGnctnKa04Ze1atqprpnqBqR8VrcWSKGs4bBvrsazKtTyrd/4l++HjPN3gmowWJD2
	CGXdzXQeWDk2VGRnmZlOe0yTZaZqnYjlXZ4gajofX1Z7eChg4ZU32SihrlYULSFWmVBuzNwWpPh
	v0+VsQrFutT4X3S1byTS1JZvP00R0GC8E2W3Ifumk/lrjA2jsXtgKCm6BnBECUXn6I9ULpBRkdL
	ihgXhbY0UArwUv5A7Uto4n2zHTIjpCOzMfLIL2RRsybiX45IGR6tEL1oRqBTlLakFWbZ8YWs4yh
	cCSKsmPFxWvG+Zbdft4=
X-Google-Smtp-Source: AGHT+IH32LEGyu7MK4U82wQ4Vk38a2yeXfJ3jw8T43X6maDr0ic0Ll6BqxfaqzjomBD2od9IF8w/uA==
X-Received: by 2002:a05:6102:304a:b0:4b2:4836:cd63 with SMTP id ada2fe7eead31-4b25de4f6cemr1779694137.26.1734081454578;
        Fri, 13 Dec 2024 01:17:34 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c4f9eae68sm1952422241.28.2024.12.13.01.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 01:17:33 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85c5adbca8eso340622241.0;
        Fri, 13 Dec 2024 01:17:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqs/SRMGpwpipLYEG8dE3u2Dw8bMAIQsLAUCoztjnCILMeCGOTRJCxc62FKqpYWjr2WUeHk1FwyGcbwX0SrzsbBI8=@vger.kernel.org, AJvYcCXC45GZQwjLgqU3+Ho1q7f+ImgnntTQXb3sydB96EDyNrk5DYFHgumbGXEbuDHeQ+QZnsrSWhk4nRHq2Q==@vger.kernel.org, AJvYcCXXGNJjMnvDtgQsMtmFLNGD9UDn7ZDwpKLhEX06qUJNVNIzlxB8WpgbI1VGMy48AE1G4AJJMooxtnOg@vger.kernel.org
X-Received: by 2002:a05:6102:f88:b0:4af:e077:8a73 with SMTP id
 ada2fe7eead31-4b25dce4c3cmr1803239137.13.1734081453438; Fri, 13 Dec 2024
 01:17:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
 <20241206102327.8737-2-biju.das.jz@bp.renesas.com> <CAMuHMdVWaVscNyhsN3eKC2EqQc_Hp3kALiLso+4AOic6huMAXA@mail.gmail.com>
 <TY3PR01MB11346DBB1BEBA02B8AE3B4A43863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346DBB1BEBA02B8AE3B4A43863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Dec 2024 10:17:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV11F7QGXCzo=wa10AOSdvXBZ_40JCRObxja3xHZoDb_g@mail.gmail.com>
Message-ID: <CAMuHMdV11F7QGXCzo=wa10AOSdvXBZ_40JCRObxja3xHZoDb_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	Prabhakar Lad <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Dec 12, 2024 at 6:15=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 12 December 2024 16:27
> > Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: renesas: Document RZ/=
G3E SoC
> >
> > On Fri, Dec 6, 2024 at 11:23=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > Add documentation for the pin controller found on the Renesas RZ/G3E
> > > (R9A09G047) SoC. The RZ/G3E PFC is similar to the RZ/V2H SoC but has
> > > more pins(P00-PS3). The port number is alpha-numeric compared to the
> > > number on the other SoCs. So add macros for alpha-numeric to number c=
onversion.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> > > +++ b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> > > @@ -11,13 +11,38 @@
> > >
> > >  #define RZG2L_PINS_PER_PORT    8
> > >
> > > +#define RZG3E_P0               0
> > > +#define RZG3E_P1               1
> > > +#define RZG3E_P2               2
> > > +#define RZG3E_P3               3
> > > +#define RZG3E_P4               4
> > > +#define RZG3E_P5               5
> > > +#define RZG3E_P6               6
> > > +#define RZG3E_P7               7
> > > +#define RZG3E_P8               8
> > > +#define RZG3E_PA               9
> > > +#define RZG3E_PB               10
> > > +#define RZG3E_PC               11
> > > +#define RZG3E_PD               12
> > > +#define RZG3E_PE               13
> > > +#define RZG3E_PF               14
> > > +#define RZG3E_PG               15
> > > +#define RZG3E_PH               16
> > > +#define RZG3E_PJ               17
> > > +#define RZG3E_PK               18
> > > +#define RZG3E_PL               19
> > > +#define RZG3E_PM               20
> > > +#define RZG3E_PS               21
> >
> > This maps the discontiguous alpha-numerical port name range to a contig=
uous numerical range.
> > As there are corresponding holes in the register layout, I am not sure =
such a mapping is a good idea.
>
> If I make contiguous alpha-numerical port name range to a contiguous nume=
rical range.
> GPIO ranges increases from 172->232. that is the reason for making exactl=
y ports defined
> in hardware manual to contiguous numerical range.

True. We do have (smaller) gaps already, as not all ports have 8 GPIOs.

> > What if a future variant (or a future documentation update) exposes the=
 ports in between?
>
> If a future variant or to accommodate RZ/V2H, contiguous alpha-numerical =
port name range
> to a contiguous numerical range will be better, if we plan to support por=
ts as alpha
> numeric as mentioned in the hardware manual.
>
> Other option is just using numbers.
>
> Please let me know your preference
>
> 1) discontinuous alpha-numerical port name range to a contiguous numerica=
l range.
> 2) contiguous alpha-numerical port name range to a contiguous numerical r=
ange.
> 3) Just use numbers like the one used in RZ/V2H
> Or
> 4)Any other smart way of handling this.

At the lowest level, 2 and 3 are the same solution.
I think using the numbers from the hardware manual (which match
the hardware registers indices) is the safest solution.
And the RZG3E_{PORT_PINMUX,GPIO}() macros below improve the user
experience, by retaining the actual alpha-numerical names.

BTW, have you checked the non-documented registers in the gaps, i.e.
do their values look like they are backed by hardware blocks?
I wouldn't be surprised if they do exist, and are reserved for use by
the CM33, NPU, or some other non-disclosed processing core.
Or perhaps there is a non-public variant in a package with more pins?

BTW, the sentence about IRQ0 pinmuxing on page 312 refers to P90,
which does not exist. In fact none of the referred pins can be muxed
to IRQ0 on RZ/G3E.

> > > +
> > >  /*
> > >   * Create the pin index from its bank and position numbers and store=
 in
> > >   * the upper 16 bits the alternate function identifier
> > >   */
> > >  #define RZG2L_PORT_PINMUX(b, p, f)     ((b) * RZG2L_PINS_PER_PORT + =
(p) | ((f) << 16))
> > > +#define RZG3E_PORT_PINMUX(b, p, f)     RZG2L_PORT_PINMUX(RZG3E_P##b,=
 p, f)
> > >
> > >  /* Convert a port and pin label to its global pin index */  #define
> > > RZG2L_GPIO(port, pin)  ((port) * RZG2L_PINS_PER_PORT + (pin))
> > > +#define RZG3E_GPIO(port, pin)  RZG2L_GPIO(RZG3E_P##port, pin)
> > >
> > >  #endif /* __DT_BINDINGS_RZG2L_PINCTRL_H */
> >
> > Note that I do like the clever scheme to handle alpha-numerical port na=
mes. Perhaps this should be
> > implemented for RZ/V2H, too?
> > RZG2L_GPIO(10, 2) and RZG2L_GPIO(10, 3) in r9a09g057h44-rzv2h-evk.dts d=
o refer to PA2 and PA3.
>
> I agree, if we are taking alpha-numeric ports route, then we need to fix =
RZ/V2H as well.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

