Return-Path: <linux-gpio+bounces-6565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B58CC122
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 14:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 532B6B23777
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 12:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E772213D639;
	Wed, 22 May 2024 12:23:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E7113D53C;
	Wed, 22 May 2024 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716380612; cv=none; b=XltLHjdJntRdUjFxapCcGxQY9lkz3O1sDg5BildvDtC80tHjyZ8P1Ze1gOetOpvP5OVspmPsK2w4uZSyx2rtmKQa/EcH5VYnEAL+rfsKJktM1nMBFU8Ka/Wh8bm99YkKEXfyHk2IvYmUbEQrkX9s2ZglJQw65GAwAjtnkvRLwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716380612; c=relaxed/simple;
	bh=f7UV5LG/YkpTVm/G2i2AIoasyTYxmJXZyGOBNA4LSfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBqOY/Zcs3Vb2zuIYx5F4m0G97XA8muNsxR77JYdrIzyJzzukuHDdlxKhqND0oezVGriNdTFNez/1U6YUfEiPDhzxuHlaB1KQCP5rWWSMtHT9ZsTsy5y0umRdFfh8CUgQ7G03mxjCqB88iCGOTRDn6AlVfdIeRYDoWzEJiXjkR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-627eb38eb1bso3668857b3.1;
        Wed, 22 May 2024 05:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716380609; x=1716985409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCfEoQ0TfMCCeRei+I4ry2wFGGRpaFJL/1F+/uzvOoA=;
        b=wS5ssvDyXRiBAZbIOeQV+478khi13qlHj7qWjJpk94A59/ZtIkL1rvCM7WGBnDcC1l
         JERlEURuuo2vCwhthPh/UVmWWwNo+9+eO73gySgyOtXuV8NeVFZqMKiVSNmsvr0sEKTw
         SnncbqqIrKSEU/WVhgv3qesCoiI56MAEprwery/VjEZQSgRb/XfHu9vXDgoNmgGh8jAw
         MRGlv/kCRq/2CkyrYRrmbrbugWA0yisC2iTVyNTNaqPIJ2czlW81X26ynSXeLWViRyyp
         2W+2ixNgTgrPCpBxrUIMKc/ppwMdBWJH5UHYyVy3oEQu7VX+ZLBAbizSeN7ORv1xxE98
         S42g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ907P/er9TVeiDTB146ROH2VE/Q4ImdHV85pt7LLPMyxq1efinQjYvd5fBG+zwT8STSkiygzNUkBKxzLT42GzKR/flEWMHmB3FkGWS+dw1ht8SDO5sDRvwgQK3SRA+ZyHWTJNqE7A1PV11aEwiB5/fMkXooBx6jwN5fWKr4FvTb++A/T/L5mSxgZ09Ags7ctzRKMmmiR/8xOKGQknmJDiFshZswn3NQ==
X-Gm-Message-State: AOJu0YxSb3uVMQDc777JMqgiLuBJjQzrMS4X+n4DuirfUv56yGjmUu5Q
	xTe8c2wBVTTX2dK7PoRsayYrz8h+DlgB4Fiw5/yvC6HF9LXhVBxjPcdwA1SD
X-Google-Smtp-Source: AGHT+IH9u2nIV9mhADnIJzE+WCDgjLwC0xtz4Z6LzzRyb1iE4MYmPJqCASUFEFcIJZPRE2P0ks+zbA==
X-Received: by 2002:a81:520a:0:b0:627:8791:5b3 with SMTP id 00721157ae682-627e487d4e8mr16693857b3.44.1716380609189;
        Wed, 22 May 2024 05:23:29 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e349e0csm57584897b3.79.2024.05.22.05.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 05:23:28 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-622f5a0badcso53352027b3.2;
        Wed, 22 May 2024 05:23:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0+faY9Jv9zLzZjN7oQ3/0W6P9d6ht2FfZWpsObD48dpgqj6oPecan7q046t5AgfVWYEYu7GGu2Y82braQlUXxjFC3Qml+Y/NEDEKW2o20k/6xB68ea6lMpBTO5TCEMLSiu73YMNX476fHosAdxg5o0NI0KgdXoBECbdt/d0lKbuPCrX5bAl3wg/WV7EHe6oc2/llq4mnBszf03ODt6BdNuo4WWGDhqQ==
X-Received: by 2002:a05:690c:60c7:b0:627:a382:a0fa with SMTP id
 00721157ae682-627e4880150mr20956997b3.52.1716380608278; Wed, 22 May 2024
 05:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB113461F28EA97F494D831267C86112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113461F28EA97F494D831267C86112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 14:23:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJXdEG-BQRYNbmhbGCtE+O1uWO0j-PkBaF7S_Qyp8M-Q@mail.gmail.com>
Message-ID: <CAMuHMdUJXdEG-BQRYNbmhbGCtE+O1uWO0j-PkBaF7S_Qyp8M-Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointers for locking/unlocking the PFC register
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Apr 23, 2024 at 8:12=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Tuesday, April 23, 2024 6:59 PM
> > Subject: [PATCH v2 06/13] pinctrl: renesas: pinctrl-rzg2l: Add function=
 pointers for
> > locking/unlocking the PFC register
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the RZ/G2L SoC, the PFCWE bit controls writing to PFC registers.
> > However, on the RZ/V2H(P) SoC, the PFCWE (REGWE_A on RZ/V2H) bit contro=
ls writing to both PFC and
> > PMC registers. Additionally, BIT(7) B0WI is undocumented for the PWPR r=
egister on RZ/V2H(P) SoC. To
> > accommodate these differences across SoC variants, introduce the set_pf=
c_mode() and
> > pm_set_pfc() function pointers.
> >
> > Note, in rzg2l_pinctrl_set_pfc_mode() the pwpr_pfc_unlock() call is now=
 called before PMC
> > read/write and pwpr_pfc_lock() call is now called after PMC read/write =
this is to keep changes
> > minimal for RZ/V2H(P).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v2
> > - Introduced function pointer for (un)lock

> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -2688,6 +2699,8 @@ static struct rzg2l_pinctrl_data r9a07g043_data =
=3D {
> >       .variable_pin_cfg =3D r9a07g043f_variable_pin_cfg,
> >       .n_variable_pin_cfg =3D ARRAY_SIZE(r9a07g043f_variable_pin_cfg),
> >  #endif
> > +     .pwpr_pfc_unlock =3D &rzg2l_pwpr_pfc_unlock,
> > +     .pwpr_pfc_lock =3D &rzg2l_pwpr_pfc_lock,
> >  };
> >
> >  static struct rzg2l_pinctrl_data r9a07g044_data =3D { @@ -2699,6 +2712=
,8 @@ static struct
> > rzg2l_pinctrl_data r9a07g044_data =3D {
> >       .n_dedicated_pins =3D ARRAY_SIZE(rzg2l_dedicated_pins.common) +
> >               ARRAY_SIZE(rzg2l_dedicated_pins.rzg2l_pins),
> >       .hwcfg =3D &rzg2l_hwcfg,
> > +     .pwpr_pfc_unlock =3D &rzg2l_pwpr_pfc_unlock,
> > +     .pwpr_pfc_lock =3D &rzg2l_pwpr_pfc_lock,
> >  };
> >
> >  static struct rzg2l_pinctrl_data r9a08g045_data =3D { @@ -2709,6 +2724=
,8 @@ static struct
> > rzg2l_pinctrl_data r9a08g045_data =3D {
> >       .n_port_pins =3D ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_PINS_=
PER_PORT,
> >       .n_dedicated_pins =3D ARRAY_SIZE(rzg3s_dedicated_pins),
> >       .hwcfg =3D &rzg3s_hwcfg,
> > +     .pwpr_pfc_unlock =3D &rzg2l_pwpr_pfc_unlock,
> > +     .pwpr_pfc_lock =3D &rzg2l_pwpr_pfc_lock,
>
> Some memory can be saved by avoiding duplication of data by using
> a single pointer for structure containing function pointers??
>
> struct rzg2l_pinctrl_fns {
>         void (*pwpr_pfc_unlock)(struct rzg2l_pinctrl *pctrl);
>         void (*pwpr_pfc_lock)(struct rzg2l_pinctrl *pctrl);
> }

So that would replace 3 (4 after adding RZ/V2H support) x 2 pointers in
rzg2l_pinctrl_data structures by 3 (4) pointers in rzg2l_pinctrl_data
structures + 1 (2) x 2 pointers in rzg2l_pinctrl_fns structures, and
code size would increase due to extra pointer dereferences before
each call.
Am I missing something?

Merging rzg2l_pwpr_pfc_{,un}lock() into a single function (taking a
"bool lock" flag) might be a better solution to reduce rzg2l_pinctrl_data s=
ize.

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

