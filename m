Return-Path: <linux-gpio+bounces-14632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB552A08FC3
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 12:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E79A816A062
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 11:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED2320B21D;
	Fri, 10 Jan 2025 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjOzUl/H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A7C1AAA1F;
	Fri, 10 Jan 2025 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736509961; cv=none; b=oEJ6UeGdaNeNBnr2I/XsIIpflk6gllyC9ackpLvhuTYd/lmzPRl9GRzMy2ZjhZ+ULYoZEUm/suP3Bk0r1PZsNxFdRf4Aa3x3cgcmmUn1VwMWerCK7de1Gz1FysPzWozfIWFdD2H25v7RCsdO3AqOgCAsu0mXvE6qCzQpxBs3jwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736509961; c=relaxed/simple;
	bh=irs1FvnIO6qCqT7BmKzCmQ3HOa49SITWpMtwxkvpPz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLr+dt/Mv6HeqcIek1P1tvIh0ysqjgfUHzjw4KW5qnKiRPo6Mi7AUZLbVzpeKe+jXvnZ52e74YJJFtYjYFl7jO253kJer1mJs9Ple9j6Vc+ziDsjD6cotAl8HizR95w+aB5ZHKmyWcsP/5EQkiSsttI00O+t9N6uQWGeenmSFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjOzUl/H; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5187f0b893dso702294e0c.3;
        Fri, 10 Jan 2025 03:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736509958; x=1737114758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFLnMS0a3ayQ7FFuu69iCX1f+HyFrRYfXz6JEVkSm0Y=;
        b=fjOzUl/HzJHbP6sIJ04Ay2/eDHceySmdypZqXShZHvVrsOgAKS/8QILcGNahVFffgk
         Y1HCHbZgfa/lrOIOhgCzz0mMMEUupkyEtFzt1Cn0MNpNSB9O8AB30KuOBxYTW8Ly5SyZ
         m+MplllFWlkXFBGPEWyMalXhVw0aOADJNhJysqZTgjhysJteFl+gxgLkfnWUVN5AFtO3
         ky5I+sBLrtYG3miQTcDthQuM78whhaocsFsQkAOigDJ0uP/xOSm0ZB8zzWmLbUFG7aK+
         GDsDE8LoJW3NPrt2I6vbVigCC/NQfta1nzcbRt7TgBVbej+sIhWACglBJdQtfM6wzOGH
         ZbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736509958; x=1737114758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFLnMS0a3ayQ7FFuu69iCX1f+HyFrRYfXz6JEVkSm0Y=;
        b=Cvjn8L5JnUXorG+WiMaqq8XoQZ2XdKg1YEWsHomjgDjDn6N6E9qX5RegZG26pWMKsi
         tT0/oooaVvFkvLSgwV+JUIN3ZApRJJQWdS1ecTHj37Acq67vPYRkHJo1iinMUn2/xgOV
         daxxK+wvq9irDHRyJuETnMNifmN75patMhxH8q72sQrmJ6nwbxxPE8X8YORTKxSwTpJS
         5KB5k9pc90kU+0KzcRiuxWGR0b4A4UMdQQjtL9HmSeCT1xmm7q2eLOFu2EJfqSmyd+y3
         E/6bmv0k57RuLJQu/9TsCLyG1QI5jQqU1a5vsXoNZ4+bKpvWOMWVQV+kAn5256a2SwOE
         R52A==
X-Forwarded-Encrypted: i=1; AJvYcCUIHlVmTSizpCuR2psLTo3WIdqfo7B98+djbyIg6qxx5VeoTqv/CEjNdCT4oOneKVbxTIml7ClxFKu57dRn@vger.kernel.org, AJvYcCXJ4XAK9MfvsPk7+Bn7/+hRuJpA4w3i2gqBQpThDkyS4S2mUmwxvMc0bvEPuJaQdweb9qVO8eGAS0qV@vger.kernel.org, AJvYcCXrVaHGNwNx01jMsygMZSUNqwXuvDTDf9S6TK5cIwWiew+YJmRvO1trZIgND2aXvTbyX7Cw7rYGLvhJ3Ivd4Yd4XJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3xawlrgfiXO39gkzBdrMvjgq3FI+R+pxv6jkbdDDxTHcJoSRl
	YRizqmaJhB4mOUyLkLgIlWT7P9RT/Xe0BC1D5iJ565YcFm+PJqhKOZlLM3xKVvew8fLw7/ZTwhK
	d03l4nO6TUO1/LIYIHJjcPg4Lwec=
X-Gm-Gg: ASbGncu/KQo9kzEvNw5pyDH1I+j4QOvaxwvumh+pd9ct+42+/tXO5rqqRnLjjDNKB/Q
	DrNUb6UDc4pMjd7LCYUTNCy0vTdQE9ct6dHXCkqg=
X-Google-Smtp-Source: AGHT+IGi+V1spNKX6o1pzJCZNlvvGaLpbNn/Ro/E4fhybXRoFp42dyQOiVa9tEJAg+NlwNdAo0qBogZBoqdRl/ZCLxw=
X-Received: by 2002:a05:6122:4589:b0:517:4fca:86d4 with SMTP id
 71dfb90a1353d-51c6c4b24bfmr9248281e0c.11.1736509958311; Fri, 10 Jan 2025
 03:52:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107105947.321847-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWHYDV=R6pVCXc-Upwi=egW1UYO0XJePE7JC4WGbaW=1A@mail.gmail.com>
In-Reply-To: <CAMuHMdWHYDV=R6pVCXc-Upwi=egW1UYO0XJePE7JC4WGbaW=1A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 10 Jan 2025 11:52:12 +0000
X-Gm-Features: AbW1kvaOW_4wMDM13gPsWFDtKm7aJPfrkWpsKwv-jbbiBmPFlxMhdtwPu4V6Ygs
Message-ID: <CA+V-a8szu6-XeCQU0_6EM64YB_rsZOqpjimfRfmGT02enEToKg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Use configurable PFC mask
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jan 10, 2025 at 11:30=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, Jan 7, 2025 at 11:59=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Make the PFC mask for the PFC_mx register configurable to address
> > differences between SoCs in the RZ/G2L family and RZ/V2H.
>
> "and the RZ/V2h family", as RZ/G3E is also affected.
>
> > On RZ/G2L family SoCs, the PFC_mx mask is `0x7` (3 bits), while on RZ/V=
2H
> > it is `0xf` (4 bits). The previous implementation hardcoded the PFC mas=
k
> > as `0x7`, which caused incorrect behavior when configuring PFC register=
s
> > on RZ/V2H.
> >
> > To resolve this, introduce a `pfcmask` field in the `rzg2l_hwcfg` struc=
ture
> > to make the mask value configurable based on the SoC. Update PFC-relate=
d
> > logic to use `hwcfg->pfcmask` instead of a hardcoded value. Additionall=
y,
> > update hardware configuration definitions to include the appropriate ma=
sk
> > values (`0x7` for RZ/G2L family and `0xf` for RZ/V2H).
>
> i understand this means that SD1_CD has always been broken:
>
Yea, but since the TF-A configured it we didnt see an issue.

>     arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts:
>         pinmux =3D <RZV2H_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
>
> and this should be queued as a fix, and backported to v6.12?
>
Agreed.

> > Fixes: 9bd95ac86e70 ("pinctrl: renesas: rzg2l: Add support for RZ/V2H S=
oC")
> > Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -159,7 +159,6 @@
> >  #define PWPR_REGWE_B           BIT(5)  /* OEN Register Write Enable, k=
nown only in RZ/V2H(P) */
> >
> >  #define PM_MASK                        0x03
> > -#define PFC_MASK               0x07
>
> What about just changing this to 0x0f instead? The bitfields are
> 4-bit wide anyway, and reserved bits on RZ/G2L are documented to be
> read as zero, and ignored when written.  Sole impact would be that
> specifying invalid functions 8-15 in an RZ/G2L DTS would no longer be
> masked by software.
>
agreed let's make PFC_MASK to 0x0f and keep the changes simple.

> >  #define IEN_MASK               0x01
> >  #define IOLH_MASK              0x03
> >  #define SR_MASK                        0x01
>
> > @@ -505,7 +507,7 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l=
_pinctrl *pctrl,
> >
> >         /* Set pin to 'Non-use (Hi-Z input protection)'  */
> >         reg =3D readw(pctrl->base + PM(off));
> > -       reg &=3D ~(PM_MASK << (pin * 2));
> > +       reg &=3D ~(hwcfg->pfcmask << (pin * 2));
>
> Oops, this should not be replaced?
>
Arghh!

Cheers,
Prabhakar

