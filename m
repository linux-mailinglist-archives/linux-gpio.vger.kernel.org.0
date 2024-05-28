Return-Path: <linux-gpio+bounces-6744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3E68D2381
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 20:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD54D1C22F92
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 18:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA55171E43;
	Tue, 28 May 2024 18:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/Cq38XZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF432E639;
	Tue, 28 May 2024 18:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716922098; cv=none; b=KEhY1wnURjTJrIoAalGSJ11dUCeKg46iyX6paajBNr5WE6GufCd0m1r4aUKYrxgaglp7zZV1PpvyrI/GXaWukixqqbAUL8zFapVe3vGQ7RigSkAvJouXkx5qc3O8qb/6ffVjeRmJCNGZxFXU14DyOhVGcrHH6EGldPrNpRF6Md8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716922098; c=relaxed/simple;
	bh=MRChlc3fno+fgWLT1UD9zMfX7V7oZsD0KEIC9Fr5KPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHWPWOKAhfbmVKjTyFYkkeNF75l46+4X0+T1idcBdpn7I25iOXftjz0APARDPOodYx7ZmQ+9CqD1WjJgiqlY6if6vNEQ7/k2dce6OfTJ2d5TLER6LmLI4c2YvORuIM1jc6anuCWoXzKondML+cv5MDtyj4HpvbG9/NuBa3MfHC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/Cq38XZ; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4e4eff99f16so372054e0c.1;
        Tue, 28 May 2024 11:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716922096; x=1717526896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bxlvn5Oq9LbYwfLCGxNQLz0UZ5j1MQaP4pgY98KDpRk=;
        b=B/Cq38XZ/hShv/h3v17RcYM5+cZzKn8uI4ZinvzHxsND4zNIU2Q4ooucJccj9I+QtA
         EMwbGbPr6NRKulqPi3he6L2/ePrfDWRysVBx8wuaRBmly3dTI8adRiI8c09l9P18JOFP
         jS6166nNcoin8QYvDwoEiHP++x/ddV+wqhi/KaCqFo3iwzVwMzi3eAe4OSYwN0Ia7Yv4
         JVrofvEWa3B4skFlo3fjGaXTVcjExHlP0UxX1k8wgKP40Ao6i5DYZ80zIj1/fHYzuZmd
         e/CVrLeCetK/obB02bYxY8y4E9no9gMjlkDUgjlPGfH0fLNz71mWePrfg/QV76c/k0aa
         fFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716922096; x=1717526896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bxlvn5Oq9LbYwfLCGxNQLz0UZ5j1MQaP4pgY98KDpRk=;
        b=FzizrR3qxbMH061iZezYxPZ+hjbJ3OgJ4Ef6ZkafuKyvkUzeAV8aIKUxkHcwFDHNW2
         TFwmIDYMJDEV/7EuNuCn/ykgtaNN4oDMUCuiWtM08HK/b0Uz9MZMq1vwdX7WoCmC+/KM
         82nwvoUo2UPnfTd0rXwMAbdfwftnzPY30S/sR5Rd2QsI+0+4Uc/niW8/yV0vl8csqdCJ
         ak4w+lgwj4jEdxPq18wcHZvXk/jZhiI90xlv6J9pz8H7LkhnGuXDGazfhVDVT1XSCR0f
         gOnYIdrY6tPTOgnbk2U44xXfuURDa5Wujm5osVkkebozcH+NX6cx+UwEJ/iFBFEqJ2HG
         /B9A==
X-Forwarded-Encrypted: i=1; AJvYcCWR5oXylYlqxbm1IYZX71K+M5RH53sFOj75JSY4Cbkz7zFgmJqednIiqJzuli+Zsmgj58Xt7E0jqO7T5MoCvEjc3gPQqk9KEy+BTzM5/XRDmaO162pl0Pml7yj8v/7cFg6g0Io/5HnXEGZhIoqJ8+O7B3HbCHNXe5E99Dyzcp+CDNhH3TGRz6PhgcFjoBPB3c0UqWlenynIGzbKA3v63VLUWg2OUFUa+Q==
X-Gm-Message-State: AOJu0Yy3pP36ir7aTeyDf+GwTDBg9mDmhDVEULTf8lF0d9b4RWEMBDPF
	m7noDmakF9tnNPBuMBiGF2AMN9aveBwU2m+39LsHWjEhe7p89aOxrf/1+8b3rL/2a/LaWETZbmw
	Co2Rd7c/c70+iq4NTsHxIenoJbBk=
X-Google-Smtp-Source: AGHT+IE9trmXEg3oEOdmSAsRssG2a/Bs2cLxXZv1lQZLY6SJ5JxtgyKLzQTyBQReU97+ZhJRjwN1iYkNyibCrLnWAuk=
X-Received: by 2002:a05:6122:4127:b0:4e4:eda9:ec32 with SMTP id
 71dfb90a1353d-4e4f02d0410mr13536269e0c.10.1716922095852; Tue, 28 May 2024
 11:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXUM-s5RQXgKQUtqu5=fVTFk5Ajg2WNZ2eAiy5Lr-tX5A@mail.gmail.com>
In-Reply-To: <CAMuHMdXUM-s5RQXgKQUtqu5=fVTFk5Ajg2WNZ2eAiy5Lr-tX5A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 May 2024 19:47:04 +0100
Message-ID: <CA+V-a8vbV0LZ0XkHEOYLww4mpgiaSzfGDCi+Hi45XNSSgSRnfA@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] pinctrl: renesas: pinctrl-rzg2l: Allow more bits
 for pin configuration
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, May 22, 2024 at 11:19=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The pin configuration bits have been growing for every new SoCs being
> > added for the pinctrl-rzg2l driver which would mean updating the macros
> > every time for each new configuration. To avoid this allocate additiona=
l
> > bits for pin configuration by relocating the known fixed bits to the ve=
ry
> > end of the configuration.
> >
> > Also update the size of 'cfg' to 'u64' to allow more configuration bits=
 in
> > the 'struct rzg2l_variable_pin_cfg'.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v2
> > - Merged the macros and rzg2l_variable_pin_cfg changes into single patc=
h
> > - Updated types for the config changes
>
> Thanks for the update!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -78,9 +78,9 @@
> >                                          PIN_CFG_FILNUM | \
> >                                          PIN_CFG_FILCLKSEL)
> >
> > -#define PIN_CFG_PIN_MAP_MASK           GENMASK_ULL(35, 28)
> > -#define PIN_CFG_PIN_REG_MASK           GENMASK(27, 20)
> > -#define PIN_CFG_MASK                   GENMASK(19, 0)
> > +#define PIN_CFG_PIN_MAP_MASK           GENMASK_ULL(62, 55)
> > +#define PIN_CFG_PIN_REG_MASK           GENMASK_ULL(54, 47)
> > +#define PIN_CFG_MASK                   GENMASK_ULL(46, 0)
> >
> >  /*
> >   * m indicates the bitmap of supported pins, a is the register index
>
> > @@ -241,9 +241,9 @@ struct rzg2l_dedicated_configs {
> >   * @pin: port pin
> >   */
> >  struct rzg2l_variable_pin_cfg {
> > -       u32 cfg:20;
> > -       u32 port:5;
> > -       u32 pin:3;
> > +       u64 cfg:46;
>
> 47, to match PIN_CFG_MASK()?
>
Oops, I missed that.

> > +       u64 port:5;
> > +       u64 pin:3;
> >  };
>
> To avoid such mistakes, and to increase uniformity, I think it would
> be good to get rid of this structure, and replace it by masks, to be
> used with FIELD_GET() and FIELD_PREP_CONST().
>
Agreed, I will make a patch on top of this patch (so that its easier
for review).

Cheers,
Prabhakar

