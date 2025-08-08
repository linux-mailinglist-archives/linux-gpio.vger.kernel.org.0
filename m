Return-Path: <linux-gpio+bounces-24073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F640B1E78B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 13:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C245A013DE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 11:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0CC23C51D;
	Fri,  8 Aug 2025 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4A2IXJZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3044272817;
	Fri,  8 Aug 2025 11:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754653289; cv=none; b=H5ks+HmQ4zT0a8nzDv9ZUyeVbzVDUuvb+TzPc+sGQIeaEmOr4eifBh66VyFJvCtSVtZshCPc6D1LPMdx20FK22wqmalMO796imfamP/t7u1guDk/rm3xeB1ZNH2O1OrLJyLa85/np7PaeDlAgRhH3BZdHv/tl1aidc2CKLRzpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754653289; c=relaxed/simple;
	bh=9JXKark1qfHOWV8uRihaxMHxuNciwCKRYnt2KeAl4B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3NUmJVdBmDyoXfjU6SVCLdyReAhbiyJ3VhnP8NfOz9815TpU5u7NK0pzOEqgmXU4SmY7cPmME5uJwyY/hRZWBQKrIVlk65a08rVkIEXpxSgw6DwA/qk6BN0w9gWDauGK1I7F2CUexsDitj+mQ6eFc7dqJg3oqQNBtT/yLOKCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4A2IXJZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-459d40d16bdso13270195e9.0;
        Fri, 08 Aug 2025 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754653286; x=1755258086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISLecfuihPnjAkwZRCGD7h7EjcshxxA1x9trk/LEAq8=;
        b=U4A2IXJZEqD5Kuq+l5nSJt85TBowEmJSVfmNnLWa6sLuJS2E+N9ovfpUzAonXdHx8n
         qj1KCLEkJS1dsAp7NVrFY4EAkmHxwYZrsFGBPbbNcJfOrPs/FK1/4Gwi0thiR6GYPPxS
         awLO1UyQgPvOerFVijWyCP1xEBzuXae939GDmdb9M1jYLktXesj24Uym4zmMiw3aTIm5
         RwsO2ErKd+sK+LoyDJQB3ay8RDC9DFhNzy3HgsncZFkMuU02aqrkIXZ/22E4o+PuSwGp
         Fs5zg3tZZvVS55NN3nzzApSQaPNPl8o1kCA/T69oXJ0nRD6I9hArRYQ8rsFBZMPdGjhb
         jv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754653286; x=1755258086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISLecfuihPnjAkwZRCGD7h7EjcshxxA1x9trk/LEAq8=;
        b=KlXDYAro2w71gdJC1DEwftQZ9rmyg/TgaQAaMSGubXY6/NocPASj6pXq7STEtVqvuf
         QeczIu9MU07ibPgbuWwNuWXUMuDd8G6d2zXAsKkWf6tp3oEMpBTUUqxOyfNn5YQ7nHeG
         PfzEYiF2pdO3ua71+fbM4pDNneDQIkTfaDHMaV8jMCZGvICx6htXmGJNY4HEapEc4FQt
         KBnYX240KoD2jWECrVdoRY7HdVpn7OlDXj//eWumijiHGlbT3bwHKHRQ72lMy/qlL0U4
         shCLZfG3FhJZ/9IKHJtiMN9i4xFuuEmEcWUyHSTFkE2i9o/ELB5+RlvSLR9AW0uBWmQd
         YxpA==
X-Forwarded-Encrypted: i=1; AJvYcCV82I505Uum7F1ros6YNO3GIsxvwlqIlp6ceyLy1ql36G0KCZJnx9IA2S3LP2xhtIR+9ZdEkN0/Pndn@vger.kernel.org, AJvYcCWb6gF6hgYLw4eqC/92sVDVJJY3RVbTJG8Og/zJcdTXdfdpnAmg+AkAXUZD6fEo6Zo0BdvRh6nugCosONTxGb/PjEg=@vger.kernel.org, AJvYcCX6rAERYVW5tHTIvZzZqjFDeFH2PTk5dPRfefI/CbDMbi1tCms1TLEb51L/gN3vheRrY/Tomrpd2sJMBT0G@vger.kernel.org, AJvYcCXQC4fcQnJZJLWaV/XcOUHq4mzbSLWjPlFIPt8Rgbn9DR9nbUjCbFEXDI0p+WqptlIJr/l425tasEDcHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTac+eox+zQDqWi+mmcPr0TOmUjl6KUwzbWqxyNd6jdk834xoR
	GZas1cRnLf2JjT8Wbdg4ONZ2OATvsSo7giRMti2p2LdZNFfJzxkxlUEjXgZZlIgFTofFoOpikZa
	0vnFUzSX0fonMOmfgEhFG73fs7fauXLwn3GPf
X-Gm-Gg: ASbGncu3CszNfUGrSQvLnChbpVQzj8Tx6E5dybsQkD7YKA58l/BxE7QR9+lkne2pJxP
	3hPJECqtuDzxqJmhqfP7gBsmN2UrJcjEFEib47DSDfYcEoAwezJMPaifaG3QsZAv4oeQlZNndV7
	8MTfAEG6u+xZaBKFdj+oagkvOS0N3mj8CoOdcX33oqJPy6bEjDo8uVJ1DDwY9fzF2peD1tRoQNQ
	nwQ6A==
X-Google-Smtp-Source: AGHT+IHSi/KGvFQ+Yjn8+sXIwqV9FkvKTXbqaHNH4nbnxuiwX6eoL/Ur3K0fJCuBkERE4KgoYLicIxVIOr5DwSkNr+g=
X-Received: by 2002:a05:6000:4312:b0:3b4:9721:2b2b with SMTP id
 ffacd0b85a97d-3b900b499damr2285775f8f.12.1754653285906; Fri, 08 Aug 2025
 04:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250801154550.3898494-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVv=AT3G8njFfGU8=gwwGX6G55TdTpspdwX=HBWdsGGNg@mail.gmail.com>
In-Reply-To: <CAMuHMdVv=AT3G8njFfGU8=gwwGX6G55TdTpspdwX=HBWdsGGNg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 8 Aug 2025 12:40:59 +0100
X-Gm-Features: Ac12FXzGYGqHSgM6HU8hiPGOTVidtAEZSBn9UIPSLmPGhJ6X3z-nL9op7ohqCAY
Message-ID: <CA+V-a8sa5-6QGSm7o2t=+SJhXGg=XYNh3sVZPxJMUYaBbN1PSA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] pinctrl: renesas: rzt2h: Add support for RZ/N2H SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Aug 6, 2025 at 3:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 1 Aug 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/N2H (R9A09G087) SoC from Renesas shares a similar pin controller
> > architecture with the RZ/T2H (R9A09G077) SoC, differing primarily in th=
e
> > number of supported pins-576 on RZ/N2H versus 729 on RZ/T2H.
> >
> > Add the necessary pin configuration data and compatible string to enabl=
e
> > support for the RZ/N2H SoC in the RZ/T2H pinctrl driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/Kconfig
> > +++ b/drivers/pinctrl/renesas/Kconfig
> > @@ -304,7 +305,7 @@ config PINCTRL_RZN1
> >           This selects pinctrl driver for Renesas RZ/N1 devices.
> >
> >  config PINCTRL_RZT2H
> > -       bool "pin control support for RZ/T2H" if COMPILE_TEST
> > +       bool "pin control support for RZ/N2H and RZ/T2H" if COMPILE_TES=
T
>
> Do you plan to update this for each new SoC?
>
Maybe I'll have this change done in patch 2/3.

> >         depends on 64BIT && OF
> >         select GPIOLIB
> >         select GENERIC_PINCTRL_GROUPS
> > diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/=
renesas/pinctrl-rzt2h.c
> > index 877f6d00830f..55c64d74cb54 100644
> > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > @@ -764,6 +764,12 @@ static const u8 r9a09g077_gpio_configs[] =3D {
> >         0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf=
f, 0x7f,
> >  };
> >
> > +static const u8 r9a09g087_gpio_configs[] =3D {
> > +       0x1f, 0xff, 0xff, 0x1f, 0, 0xfe, 0xff, 0, 0x7e, 0xf0, 0xff, 0x1=
,
> > +       0xff, 0xff, 0xff, 0, 0xe0, 0xff, 0xff, 0, 0xff, 0xff, 0xff, 0x1=
,
> > +       0xe0, 0xff, 0xff, 0x7f, 0, 0xfe, 0xff, 0x7f, 0, 0xfc, 0x7f,
>
> Please always use 0xXX for consistent formatting.
>
Sure, I'll use the above format.

Cheers,
Prabhakar

