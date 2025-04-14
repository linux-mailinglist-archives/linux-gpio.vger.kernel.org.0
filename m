Return-Path: <linux-gpio+bounces-18776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A2A87D74
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 12:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DA7C188B10E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 10:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D9C265CC5;
	Mon, 14 Apr 2025 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJIcbyEC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF333997;
	Mon, 14 Apr 2025 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626128; cv=none; b=Icg92PfUkPGFPOjDckyvTg9E49ZCurhFPkeO1TFRMNpclVJ20StHcymwUeEdRnrvyioOdFtYPqLrAp6LXw//k0nECZbcYM2aQUQMCs0mGIJemBOZAfn2ffXDcMKgdX4FI4aGzFA2JTZ5+P3BviOVI4q0vDlZKafy1mQIOGpWd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626128; c=relaxed/simple;
	bh=KtqC2iditidJC2eSLn3KMSnoD5wXk8uVxjE6xg2dVhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMBhey+hKxDDJAGm5htJSdoYUrG+QKSMHrsKSvXF4oGLKr6HSVFNyq9qRgQBWuh9spcWVGcjlAfaqYuAOKAuBHZW7JLBt8w9RjDo6hvDdV6n+OCKPkqLhWRlETiYnWuEQ/y1j+7uYSM2R3aTu/UeyvJl0Cf13qRFrLlqHVLFOxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJIcbyEC; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-524125f6cadso3449459e0c.2;
        Mon, 14 Apr 2025 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744626125; x=1745230925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7k7jOxUiHWycKnZAs1fHyoctI9n8TH4eQ7bIdVfdT2Q=;
        b=RJIcbyECyj2SxzILyTGR/ubLtHeBLY5kTyQC8cL3DkrouuBHhQdrDQ+FMObQPgpAhN
         iiaTsF13HbF2PRL9fdICbaUtHDQpThYo54RUbEooGkDyL8dSccp/mE5d2TS+UKwsXc2q
         iiy0VMtWrNY+zSg2lOtD7aQa8qplyJsLLutM7UJMcRNKjTaa8EivmqCpyFJfTPbAHoQJ
         OgFnz52Yt1ZBBdD8YwV8LLH4TyyYxa4abvueXPCEnAN6yNwDIYv9ReK/25eOaFZTZlT7
         NSZP9hrDMOn02RfaeI1xXUtLIWhdK93MTNt0D0QM1Nk0eyus7JqMqqpxLgVW6ScPUpne
         K/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626125; x=1745230925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7k7jOxUiHWycKnZAs1fHyoctI9n8TH4eQ7bIdVfdT2Q=;
        b=P7CxnGT/XN/si1cRz622IaajCWSoC4i238wO4gTVdBiKCXae01yv+AlKgr6OOpigiq
         ByRs7yuByS5/EvRjEr5JpC1C/MtyYssMP5Y3qdG/dfB52G834H0HyWdW4EqmdhTepDhG
         eCB6gcQWeVvC0OySD3hO3lUSUaeD1PUUIkqDlrefmN/6Rco+mDa4Fsd5eZlcZ1Xd7388
         Du6hmZaUk+Xtqy2iDhImxyodBf69+9uayw+rkkqxhlcyCPahutVMccdmsTDpnl7HXs91
         iG5BIul//sDS2LKuSUmznmV6DBbwIn0aKrJaTd5NxhKTtbr1lQkz7jTpLxxmRGg64CG8
         eMgg==
X-Forwarded-Encrypted: i=1; AJvYcCUnAko+01/ipj10ovQYFkalt1zt08fk94DT1OOKTwpKvie501RlNHmEwWaDeo/n2YJo/uxsynemrfGaa+9k@vger.kernel.org, AJvYcCVnIRkP+K1yTwz+d0N0BoECiJY8wTU6xcWx3mzaw6nh2/B/qrtFICNpPubz/lXodWQcVHVMnPUE5A9Q@vger.kernel.org, AJvYcCWHt+xQKYFgFqVtmzQtJ3HU/rtvhDs5mdLPnG4/JxB2QUg4yriHHrU15Ecrdmqkkvj0RLK0+9mNdyRUkg==@vger.kernel.org, AJvYcCWRnIR+aqbPZPMmlZNoAUnQTb/HimYkEujKUVQI4i1pBVJ3nyIh0LWPUWpA+UGCNGH7IA36xxi99R8g2F5w@vger.kernel.org, AJvYcCWrW/IUI5dYNavJqcHM62cOsBStfSBunBJ9upsWH87mte+mnreSdZ1lEhMMspzqZ8oZCgoi0vxm80y52jF9FdX04oA=@vger.kernel.org, AJvYcCXUoDnoJ1HKkCLAdwkhk5/nms1emyhms4fuJ5ZBOcu0IJ9RxClewRPqtqGa8VFpRiBmEAGknDVXs2DB@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSJvsu9Ii+nT65lA/uZ1D2ufeILx0OEua4fauOkZI6UVv4CHB
	/z9rJ5gomgaThxpnN5afjIkjIknMAOwR/DNjOmVILcRHpWd0ippdep2n9BAx0WKKowbmXr2W2ns
	19gW1NXBZWQjHoFa7DqKqzqpcjLI=
X-Gm-Gg: ASbGncsWRtyjuVRRK1LyIQzw03lH7NeJJZya9nNPFiYzhm0f1lPjI02nVF6BuhHBEjX
	7rB8EZnnvOKU2U/kGJMaFio6rcx2n5msSz/h/PahKpAOEVBqmfjIfdbOQ/xwwAptGTsDhxntNtd
	Z+D/2/8K7A5dYypR2LeQ5BgCoDdZwRN1fyoBAZQc0ScjeGmTBeiZSbyA==
X-Google-Smtp-Source: AGHT+IFSeOGA2alvM6QeKWz4GkE6DGO1ZrCPg1gcKCQ11FxwYR0XiZJAS4I8ijlIiqbfKsOobnAycg3lAGA3S6FUZm0=
X-Received: by 2002:a05:6122:889:b0:520:4996:7cf2 with SMTP id
 71dfb90a1353d-527c35f89c5mr7652543e0c.10.1744626125325; Mon, 14 Apr 2025
 03:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407191628.323613-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVjrHN8e-yWTFWE1BLfnQKDeYsvuGepkoqcgxrR+CK5+w@mail.gmail.com>
In-Reply-To: <CAMuHMdVjrHN8e-yWTFWE1BLfnQKDeYsvuGepkoqcgxrR+CK5+w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 11:21:39 +0100
X-Gm-Features: ATxdqUFuOQmoL7ZTIiCRaOJodzbfgENtFmE4ZyvW6KnP_pB8NrLn_eb62g4E32I
Message-ID: <CA+V-a8s0RbgEB2kHDtv35jOtSNw2ThMB_GEgX1SLdOdiRtiPfQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] soc: renesas: sysc: Add SoC identification for
 RZ/V2N SoC
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

On Thu, Apr 10, 2025 at 10:28=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add SoC identification for the RZ/V2N SoC using the System Controller
> > (SYS) block.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/drivers/soc/renesas/r9a09g056-sys.c
> > @@ -0,0 +1,107 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RZ/V2N System controller (SYS) driver
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/device.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/string.h>
> > +
> > +#include "rz-sysc.h"
> > +
> > +/* Register Offsets */
> > +#define SYS_LSI_MODE           0x300
> > +#define SYS_LSI_MODE_SEC_EN    BIT(16)
> > +/*
> > + * BOOTPLLCA[1:0]
> > + *         [0,0] =3D> 1.1GHZ
> > + *         [0,1] =3D> 1.5GHZ
> > + *         [1,0] =3D> 1.6GHZ
> > + *         [1,1] =3D> 1.7GHZ
> > + */
> > +#define SYS_LSI_MODE_STAT_BOOTPLLCA55  GENMASK(12, 11)
> > +#define SYS_LSI_MODE_CA55_1_7GHZ       0x3
> > +
> > +#define SYS_LSI_PRR                    0x308
> > +#define SYS_LSI_PRR_GPU_DIS            BIT(0)
> > +#define SYS_LSI_PRR_ISP_DIS            BIT(4)
> > +
> > +#define SYS_RZV2N_FEATURE_G31          BIT(0)
> > +#define SYS_RZV2N_FEATURE_C55          BIT(1)
> > +#define SYS_RZV2N_FEATURE_SEC          BIT(2)
> > +
> > +static void rzv2n_sys_print_id(struct device *dev,
> > +                              void __iomem *sysc_base,
> > +                              struct soc_device_attribute *soc_dev_att=
r)
> > +{
> > +       unsigned int part_number;
> > +       char features[75] =3D "";
> > +       u32 prr_val, mode_val;
> > +       u8 feature_flags;
> > +
> > +       prr_val =3D readl(sysc_base + SYS_LSI_PRR);
> > +       mode_val =3D readl(sysc_base + SYS_LSI_MODE);
> > +
> > +       /* Check GPU, ISP and Cryptographic configuration */
> > +       feature_flags =3D !(prr_val & SYS_LSI_PRR_GPU_DIS) ? SYS_RZV2N_=
FEATURE_G31 : 0;
> > +       feature_flags |=3D !(prr_val & SYS_LSI_PRR_ISP_DIS) ? SYS_RZV2N=
_FEATURE_C55 : 0;
> > +       feature_flags |=3D (mode_val & SYS_LSI_MODE_SEC_EN) ? SYS_RZV2N=
_FEATURE_SEC : 0;
> > +
> > +       part_number =3D 41;
> > +       if (feature_flags & SYS_RZV2N_FEATURE_G31)
> > +               part_number++;
> > +       if (feature_flags & SYS_RZV2N_FEATURE_C55)
> > +               part_number +=3D 2;
> > +       if (feature_flags & SYS_RZV2N_FEATURE_SEC)
> > +               part_number +=3D 4;
>
> The above construct can be simplified to
>
>     part_number =3D 41 + feature_flags;
>
Agreed.

> > +       if (feature_flags) {
> > +               unsigned int features_len =3D sizeof(features);
> > +
> > +               strscpy(features, "with ");
> > +               if (feature_flags & SYS_RZV2N_FEATURE_G31)
> > +                       strlcat(features, "GE3D (Mali-G31)", features_l=
en);
> > +
> > +               if (feature_flags =3D=3D (SYS_RZV2N_FEATURE_G31 |
> > +                                     SYS_RZV2N_FEATURE_C55 |
> > +                                     SYS_RZV2N_FEATURE_SEC))
> > +                       strlcat(features, ", ", features_len);
> > +               else if ((feature_flags & SYS_RZV2N_FEATURE_G31) &&
> > +                        (feature_flags & (SYS_RZV2N_FEATURE_C55 | SYS_=
RZV2N_FEATURE_SEC)))
> > +                       strlcat(features, " and ", features_len);
> > +
> > +               if (feature_flags & SYS_RZV2N_FEATURE_SEC)
> > +                       strlcat(features, "Cryptographic engine", featu=
res_len);
> > +
> > +               if ((feature_flags & SYS_RZV2N_FEATURE_SEC) &&
> > +                   (feature_flags & SYS_RZV2N_FEATURE_C55))
> > +                       strlcat(features, " and ", features_len);
> > +
> > +               if (feature_flags & SYS_RZV2N_FEATURE_C55)
> > +                       strlcat(features, "ISP (Mali-C55)", features_le=
n);
> > +       }
>
> The above looks overly complicated to me.  What about handling it
> like on RZ/V2H?  I agree having 3x "with" doesn't look nice, but you
> could just drop all "with"s.
>
Ok, I will switch like below:

part_number =3D 41 + feature_flags;

dev_info(dev, "Detected Renesas %s %sn%d Rev %s%s%s%s%s\n",
soc_dev_attr->family,
               soc_dev_attr->soc_id, part_number,
soc_dev_attr->revision, feature_flags ?
               " with" : "", feature_flags & SYS_RZV2N_FEATURE_G31 ? "
GE3D (Mali-G31)" : "",
               feature_flags & SYS_RZV2N_FEATURE_SEC ? " Cryptographic
engine" : "",
               feature_flags & SYS_RZV2N_FEATURE_C55 ? " ISP (Mali-C55)" : =
"");


> > +       dev_info(dev, "Detected Renesas %s %sn%d Rev %s %s\n", soc_dev_=
attr->family,
> > +                soc_dev_attr->soc_id, part_number, soc_dev_attr->revis=
ion, features);
>
> This prints a trailing space if features is empty.
>
Agreed.

Cheers,
Prabhakar

