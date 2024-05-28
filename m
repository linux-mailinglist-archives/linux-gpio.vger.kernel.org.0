Return-Path: <linux-gpio+bounces-6750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 370478D2476
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 21:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B70931F2699F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13722171E65;
	Tue, 28 May 2024 19:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHi/n2Mx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CECB17554C;
	Tue, 28 May 2024 19:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716923827; cv=none; b=G6/IeQj7zo1IL1g2IkPrd5RmOZILjwjVNgQSB8q0gA8EgK3QkhgoQeJ6ckYBrTYhBRnIY674WtKdRoW+M0Ht9E5PbljsRf4q0PI7BD/YSJTD7ODCAPU8kRXUZMUdxHu9Q6xghAGMzZfH5ZrDE/b+L2D6qq0RBqmqmViPxtKwC10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716923827; c=relaxed/simple;
	bh=M8CKwH032NebDTLhUTdgro4R1FJ4NQSIeAWpV/pl18I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ll/mlQknS0b7u/1PwG0CRFCl7lgvuN5zFZ506dtm9nIFMzkwACY3MCbjdeTWh7kAbwx0tcpTlxjvnTxLrx8y1UsvWHb6G35ImlJwxSWt+4WX2J55jUmD2sq2UfrF14IoKkdMz0qhEPQDpnXSHrWQmVzLFz1IJ76kxCpQuE+c89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHi/n2Mx; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4e77620cf38so395182e0c.1;
        Tue, 28 May 2024 12:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716923825; x=1717528625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZIOVysR1nqFTHmWlJtaGHbjCfkWSOvzdf8Ez2dJJ/k=;
        b=RHi/n2Mx3Bw7DV0DvMBvPleD9KL9viuA74vq2r2QaCvCHVJFXsVIkfG8g6zPGPyKeh
         yle+uQLg+gILqBy63Plw1IbNhduBI1Hd3soetyjcDi43z0XMUc+v5T2TTJeojPxkgSSz
         6L6IxhTXFaF4waa5lXKt2kdMivzXLFXVeq+O/Jv/wtD+ow4oVa3wyq2ZHZTpy02/8zkP
         abVmNxjpwbTrcXzuRVLPyeoaNhVwdEhqA3GNtyPiOQqOr419EUsY+9O05aTfhFcr9ga4
         yW21siUrLOI7Qmwsc00bvloRyffMTXogwsEF/NDQAQGcssdy8AFZrmHGrxX1jqvrHqx2
         S0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923825; x=1717528625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZIOVysR1nqFTHmWlJtaGHbjCfkWSOvzdf8Ez2dJJ/k=;
        b=Qdo1jgJVfpMv/SjtQuhimZyAWtsGLamwFHO2J1J4OtvwQMJI0Dr3w9noz0/Ld4Awlt
         m/APGU8t0geA4VIfSxcz3wMyDB9R52wBZGFCemKgc+LFFCd4mqtaQlKoMWWAy0902xP+
         ZBp7pUMm/PFUmpiFV+rhecDrfLUqMcwj8zybMp2imveXDKHCexzH7uIq2e5xWUvdR/c1
         shi569SvgbGUKkqa0ZYvgc6y7ejpQcNXtsYNHkogFXVjVyWeIgVFIl0Kzo/63QbqRts2
         QgwQfMyYE1b8W/8fChbYLPmpDq3HoQTtMv4T5TdOjgMtHu+gNdt/aJzoUC/wdtSBoTQh
         HKvA==
X-Forwarded-Encrypted: i=1; AJvYcCUU8zMybXs2HUp7UFSXkc5GzNCpQXlWyOyHH5H7FKlTV3Zhy88MdEwQDo1NR3JAqpBM3H5k7neb853d/SJrhOd49dulK1mLQ4/vDo9Kg8ri76QQrN/A9dKA3XZOEntnGxGeZ7THynaRUc/JnALHfWq+BAJE86+BQozvg/QKhrHUpy/M4o+RlpB2jgnuJvBb5BmVYSVIfrOcKUVqgtFO3mpfCTWiLyNlbQ==
X-Gm-Message-State: AOJu0Yyi/VSo4N0g7q/Pa/IXoZPElRr6N40n5ee+3wlKoImYbeBrIQn0
	hUICRJtWjTlAr4yAlnV6tQgMkk3jNAYx8bW4fBUEZ9LFVW1ve+i/uWqPBZ1+tCCcK7QyO4lGrZC
	4FVbxoO4ObOiliihndkr2UQHCnjc=
X-Google-Smtp-Source: AGHT+IGHFmTTksUadChKyhIDTfENInK2dhsn5L1iUbeGhk3BxlEFLMezzKz0sqTmLWbkgnLGcRxYsTACqXWxaBGvvLE=
X-Received: by 2002:a05:6122:3196:b0:4df:19c0:86cd with SMTP id
 71dfb90a1353d-4e4f0125efamr12030985e0c.0.1716923825019; Tue, 28 May 2024
 12:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113461F28EA97F494D831267C86112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUJXdEG-BQRYNbmhbGCtE+O1uWO0j-PkBaF7S_Qyp8M-Q@mail.gmail.com> <TY3PR01MB11346281D111DB4C411E3333786EB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346281D111DB4C411E3333786EB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 May 2024 20:15:54 +0100
Message-ID: <CA+V-a8uG+xBmDAvXRSDH2Qr8k9Xs-g6_bs+54Erc7_qqP=xLrg@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointers for locking/unlocking the PFC register
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju, Geert,

Thank you for the review.

On Wed, May 22, 2024 at 1:40=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Geert,
>
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Wednesday, May 22, 2024 1:23 PM
> > Subject: Re: [PATCH v2 06/13] pinctrl: renesas: pinctrl-rzg2l: Add func=
tion pointers for
> > locking/unlocking the PFC register
> >
> > Hi Biju,
> >
> > On Tue, Apr 23, 2024 at 8:12=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: Tuesday, April 23, 2024 6:59 PM
> > > > Subject: [PATCH v2 06/13] pinctrl: renesas: pinctrl-rzg2l: Add
> > > > function pointers for locking/unlocking the PFC register
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > On the RZ/G2L SoC, the PFCWE bit controls writing to PFC registers.
> > > > However, on the RZ/V2H(P) SoC, the PFCWE (REGWE_A on RZ/V2H) bit
> > > > controls writing to both PFC and PMC registers. Additionally, BIT(7=
)
> > > > B0WI is undocumented for the PWPR register on RZ/V2H(P) SoC. To
> > > > accommodate these differences across SoC variants, introduce the
> > > > set_pfc_mode() and
> > > > pm_set_pfc() function pointers.
> > > >
> > > > Note, in rzg2l_pinctrl_set_pfc_mode() the pwpr_pfc_unlock() call is
> > > > now called before PMC read/write and pwpr_pfc_lock() call is now
> > > > called after PMC read/write this is to keep changes minimal for RZ/=
V2H(P).
> > > >
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > RFC->v2
> > > > - Introduced function pointer for (un)lock
> >
> > > > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > @@ -2688,6 +2699,8 @@ static struct rzg2l_pinctrl_data r9a07g043_da=
ta =3D {
> > > >       .variable_pin_cfg =3D r9a07g043f_variable_pin_cfg,
> > > >       .n_variable_pin_cfg =3D ARRAY_SIZE(r9a07g043f_variable_pin_cf=
g),
> > > >  #endif
> > > > +     .pwpr_pfc_unlock =3D &rzg2l_pwpr_pfc_unlock,
> > > > +     .pwpr_pfc_lock =3D &rzg2l_pwpr_pfc_lock,
> > > >  };
> > > >
> > > >  static struct rzg2l_pinctrl_data r9a07g044_data =3D { @@ -2699,6
> > > > +2712,8 @@ static struct rzg2l_pinctrl_data r9a07g044_data =3D {
> > > >       .n_dedicated_pins =3D ARRAY_SIZE(rzg2l_dedicated_pins.common)=
 +
> > > >               ARRAY_SIZE(rzg2l_dedicated_pins.rzg2l_pins),
> > > >       .hwcfg =3D &rzg2l_hwcfg,
> > > > +     .pwpr_pfc_unlock =3D &rzg2l_pwpr_pfc_unlock,
> > > > +     .pwpr_pfc_lock =3D &rzg2l_pwpr_pfc_lock,
> > > >  };
> > > >
> > > >  static struct rzg2l_pinctrl_data r9a08g045_data =3D { @@ -2709,6
> > > > +2724,8 @@ static struct rzg2l_pinctrl_data r9a08g045_data =3D {
> > > >       .n_port_pins =3D ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_P=
INS_PER_PORT,
> > > >       .n_dedicated_pins =3D ARRAY_SIZE(rzg3s_dedicated_pins),
> > > >       .hwcfg =3D &rzg3s_hwcfg,
> > > > +     .pwpr_pfc_unlock =3D &rzg2l_pwpr_pfc_unlock,
> > > > +     .pwpr_pfc_lock =3D &rzg2l_pwpr_pfc_lock,
> > >
> > > Some memory can be saved by avoiding duplication of data by using a
> > > single pointer for structure containing function pointers??
> > >
> > > struct rzg2l_pinctrl_fns {
> > >         void (*pwpr_pfc_unlock)(struct rzg2l_pinctrl *pctrl);
> > >         void (*pwpr_pfc_lock)(struct rzg2l_pinctrl *pctrl); }
> >
> > So that would replace 3 (4 after adding RZ/V2H support) x 2 pointers in=
 rzg2l_pinctrl_data
> > structures by 3 (4) pointers in rzg2l_pinctrl_data structures + 1 (2) x=
 2 pointers in
> > rzg2l_pinctrl_fns structures, and code size would increase due to extra=
 pointer dereferences before
> > each call.
> > Am I missing something?
>
> Current case
> 3 * 2 pointers =3D 6 pointers
>
> Suggestion
> 3 * 1 pointer + 1 * 2 pointer =3D 5 pointers
>
> As you said,  code size would increase due to extra pointer dereferences =
before
> each call.
>
>
> >
> > Merging rzg2l_pwpr_pfc_{,un}lock() into a single function (taking a "bo=
ol lock" flag) might be a
> > better solution to reduce rzg2l_pinctrl_data size.
>
> I agree.
>
OK, I will introduce a single function pointer (pwpr_pfc_lock_unlock)
in this patch.

Cheers,
Prabhakar

