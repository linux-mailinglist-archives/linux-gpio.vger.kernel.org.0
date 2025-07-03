Return-Path: <linux-gpio+bounces-22776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3386AF848F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 01:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E145A7A06D4
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 23:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9C12DA77B;
	Thu,  3 Jul 2025 23:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4isRx/e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81EB2D94A8;
	Thu,  3 Jul 2025 23:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586826; cv=none; b=SK2aXLsxYp2PF1pOw1a1/XL05WxT6wzYhB/h14DPxQ2817LyE9LGju3IpKeqjU9wi+GBZLoggqNlBrA+Mj1pPUM769CdcOKcr17fNxR9M257ObaiQRJzBvyBEqDfjNMSbMOi160YLR8YbaLW26uaYOLV4OPoYm8ApwBr2Nb7dUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586826; c=relaxed/simple;
	bh=tSQ/e8nkwt+k7LpXScjT3qRwzZgCbeLj2sdnv3+mro0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prD1Ul95V1g3qwj+gUDjCiHhHz8ni7AIL+926r2aoCBVvXQqTI49LdleBnpOlj55H8N5sKxNkFW5hB7fC7v7tUcuU0FmQgJM7YoBBwGuzXPXw5joXBTVLohyv1zaNL30rF64VdBNyshvOK0FKljqSQJINwufGq+uFuuIYbEqZvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4isRx/e; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45348bff79fso4234285e9.2;
        Thu, 03 Jul 2025 16:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751586823; x=1752191623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gksXHEoyY4iq6+t/jR3b72GxesO6QQwHZ+Prq3fRIbA=;
        b=N4isRx/el/pqBDgH+NS2QQatz5RtrPFCWUqqDiHFB0mRe1qYPuFzqpKWhUfT3yI6D+
         RhYq/xJu+KUK85LuetAM62KeEEqUtVCg6bwr31RGDwQHfMUKRUyvwuMsRj2mUBR0aX2l
         0Wzdk8LoDLpu9o1MFkuO6sdegD+At8SgvWHNG6SEQLPHthojZN0PLGAHMOkaRbSTS2nl
         nDPNkodagTZBtfVFxlmuHnTOl4/Bv2bP2/7+Z6w73AAl60uDjgkRoagYSX9Rtzsx2FVQ
         nAOndSnkrTABPr9lxDQsWsyw3W5zNSatD6hF3hpRBB/gAQf7zpYVsgxP5xorfx/c+qwL
         +oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751586823; x=1752191623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gksXHEoyY4iq6+t/jR3b72GxesO6QQwHZ+Prq3fRIbA=;
        b=CA7V2ep6B9O1FTNRYr+OxOVNmeWcCWcrOqF6Djgyl9m6YG1q67tstOpRqX9WHTQ0WC
         6Co7gGYcpLnj81BQktFLeaKcbwTU5iFpMLBM61pMs+Iu+2zzPXPHCQ6KPbgysaKfSIUJ
         bgHRulai1kiqSzJQqp8em1Saf9Wx27GeYW675YI4w0lliexjwcH9e4rsWAAHL7vVaysa
         I20/J4+IipvGLqnh88U02EBiEHDngUhbjifYqACzXLmd9/L0KT8S85WxLR+SN2Z/1OFc
         114Auov5hUiVXu9roMbE8m2LQLw+ysQSvKJqgtWuq8fd3jsibeWkRuC8dctVM9xyP1Mz
         DGFw==
X-Forwarded-Encrypted: i=1; AJvYcCWHkLBookvMD6hiX98ap5sEOgSWQ6xt7iGdaqmlp6Y7x2YbeOjPSLAFoT+VUe48wRm2vTIGknUH76c8@vger.kernel.org, AJvYcCX/xfcfDc6AbnEQEnoKCjI9azombK233tIuoALtoFoj2Euvgu3CsucSDnM5FrU0Ce7xAR2hEmjF/dkbQM8D@vger.kernel.org, AJvYcCXHKTldf52pKztzAJoXhShxjgftgOPLyLMODyo2tBQHMUxhVE5MbTiZ3krYb/FTIKwW8B1SXpWlRph8Dg==@vger.kernel.org, AJvYcCXc8QEOcGUIMoU7nf60cRvk+MF0fyzWJYqWWzDUfTHEzkV+ZDpDG2l0A0JxSElniBARbbIx3SaopGQGAPLhWUaTvPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0UzUOHKCZ8bmYCApqogT8ztcaJABAIrgGrV9f1Mu+oA2nPxlE
	7ivzRw/oor21MC45WYkUdPsPq0JWaNQOVjTkIFi5IJuBBA7j9h1mnr7KLT7mkER3OaEIrOixOZD
	i/y0ZryVA3AtVEdjG8BUfFa6T70HehIQ=
X-Gm-Gg: ASbGncvt7oMUdIjggD07avifoixChqmjZFNVM1OS6DosoewTnmezFmZlWCcxAzXXknl
	dP1Tu3nN2aSACg/SmKU4i+VkuDdm+6AWYVM68OX6cs2kDlmmVX52uxhznrF8wOVkFsSCdIkOSvC
	hS4RguebAC/srVGj5ikTRtepc0bbpnVM3Ibu5R8Bm5T90a3HNwUqEIWktlfdMZbQZc4I51FnA3X
	/p0
X-Google-Smtp-Source: AGHT+IEhk1OSVfTZytkxvnzwpaXVWoz+QPKqAz79sT+7cYrDvrOSDXiObjULgwUFwKebKkNfd/CE24HdOIbP3rm/5oM=
X-Received: by 2002:a05:600c:190a:b0:442:ccfa:fa with SMTP id
 5b1f17b1804b1-454b30d6a72mr3554585e9.27.1751586823078; Thu, 03 Jul 2025
 16:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625130712.140778-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625130712.140778-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW1+4EhYNWOHu1skaAg7jwLc373ZkBmPOhU=R5jhLJf_w@mail.gmail.com>
In-Reply-To: <CAMuHMdW1+4EhYNWOHu1skaAg7jwLc373ZkBmPOhU=R5jhLJf_w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Jul 2025 00:53:17 +0100
X-Gm-Features: Ac12FXz1qx-OV1L_Ojv2wDEF5a2v1LpLXDQDiab_GPaQht3L756HKGQ7ng0Jtn8
Message-ID: <CA+V-a8uZX9uzCqqk-wuTOB67UxXOOWP9+aE2HacDnX+ZATgo=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: renesas: Add support for RZ/T2H
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

On Thu, Jul 3, 2025 at 11:02=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 25 Jun 2025 at 15:07, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > Add the pinctrl and gpio driver for RZ/T2H
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Co-developed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - All the regions are now accessed by reg names
> > - Added support to validate the pins
>
> Thanks for the update!
>
> > --- a/drivers/pinctrl/renesas/Kconfig
> > +++ b/drivers/pinctrl/renesas/Kconfig
> > @@ -44,6 +44,7 @@ config PINCTRL_RENESAS
> >         select PINCTRL_RZG2L if ARCH_R9A09G047
> >         select PINCTRL_RZG2L if ARCH_R9A09G056
> >         select PINCTRL_RZG2L if ARCH_R9A09G057
> > +       select PINCTRL_RZT2H if ARCH_R9A09G077
> >         select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
> >         select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
> >         select PINCTRL_PFC_SH7269 if CPU_SUBTYPE_SH7269
> > @@ -249,6 +250,18 @@ config PINCTRL_RZN1
> >         help
> >           This selects pinctrl driver for Renesas RZ/N1 devices.
> >
> > +config PINCTRL_RZT2H
> > +       bool "pin control support for RZ/T2H"
> > +       depends on OF
> > +       depends on ARCH_R9A09G077 || COMPILE_TEST
>
> This line is not needed, as PINCTRL_RZT2H is selected above (On RZ/A1,
> RZ/A2, and RZ/N1, the pin control driver is optional).  Please move the
> "|| COMPILE_TEST" to the prompt, like is done for most other drivers.
>
Ok, I will do as suggested above.

Cheers,
Prabhakar

