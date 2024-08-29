Return-Path: <linux-gpio+bounces-9407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D76964EA3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 21:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3CE3B21DBF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 19:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6961B654B;
	Thu, 29 Aug 2024 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuMvUGDb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C0C1AE846;
	Thu, 29 Aug 2024 19:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724959107; cv=none; b=eOQH5/wMvWyHDx0XdalL3GC4onL7AWU3ViyL1zq3Ny37Nnsql2Bw3V1VNBGcfOsOTX6bV0zy4AMq1Iik10boDgztVChgRlio2PrD0PLJuk2s/sCLZCxk669Ec40yNlat/iyrJfeiK2wLnmDM+FrRAwcpxy9rzwTlVs5QebThO0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724959107; c=relaxed/simple;
	bh=Bfl3X5+OnlYa8Tsu/RDj1/uV8IyVSiTBFiRpVKRHdUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPRqwmrDE8saI0lI9QbIMCj53jwKevzi5+BCoNcDKlgikjk1zrMmLrVkhQlCGgoKdacb5+QerODdnYZmCTTDyYUOs/kndZIwxT5KX7T3wkaHuypkoDfXRX7aI38JpIk27KDCaPdy5h6JjzpkroYGsS+G5h9PGyz/RuswJrZDm1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuMvUGDb; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4fce700765aso316939e0c.2;
        Thu, 29 Aug 2024 12:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724959104; x=1725563904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JkqGVwZ2J/+2kgurqnclJ7nnN7Z9znEYkfxsvyobCA=;
        b=QuMvUGDbzw6B/gNk6nMwkg/gulgWFBptypY1x7wwgPhe/7zAhP8jkp3sFSUnrR4BYe
         Rt3Dm1Zne2JXzM1fAWfBaqp6rADgEkhLaIwyQpo/1hKPf3cl6mtgzy1tED4H62L4cP0T
         pnNtnCZGceXD9BDyNvNQpx3k/HfI3jcJ4TV6BA9rO7cAQdJmcKuZI6nrtNpmw/Kcu+nz
         XBKIQBHPsfKypF/aF36JybPuNCuwF+kgb5/NtabioYRkqwpLJWa9fIPMDunrwpmi/rOr
         7rh4Cvha7hh6GHxygQJsVj5coajeFIv/bxNrzAQCCFi9e/8gOaoGIuoRuI8pGSx2iDnS
         VV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724959104; x=1725563904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JkqGVwZ2J/+2kgurqnclJ7nnN7Z9znEYkfxsvyobCA=;
        b=SllRBlpz9Y69HJm5iXaAPPL92KqHpkhjba8dHzfWKOs7m7sawa3caFtdnq0FqJ7ytX
         YZxAfp1yjSO9AvyTWKXwF9lTeRVRtrP9BL+owZIqAiLMS0/sbpeBjn2VVa/xgEx/pVTI
         x/vecFYqVKFEElAXlYgPnDNbd12dfSXmMD7PGZt8MmzgAXEdWOJIlohgXLW04ENd5cnJ
         gf3r7anxd9WflMXOjiakffee+5pDQlw2Sn/jOvdvusfZGzLyEx1/Kz5QkwuA54ooAr+i
         7b3flz0JRAZsq2BQwUqFxomnZcQjoS6o/YSM2nc2b38fVMe4zUATddOYcdFyta1qi+xp
         qV3g==
X-Forwarded-Encrypted: i=1; AJvYcCVtqTps88uYvyXkpm7jVzJYJL4KY+As/NH4p8c0QmbvU6canlYn4Bj8lG58ZOUknJXejguQqEAcGDNgwY08@vger.kernel.org, AJvYcCWE8raP8IgDX+rJQa6hktLp1i4i1MNFFBIyJVAg10+bju+ujFtbNgjcqgTgopxXpoAfRMBo2+P5T1FpMUhF2ZQ04nk=@vger.kernel.org, AJvYcCXUXd3g7TntjAIDt0OJzm22lxgvfHtZIFA6tv70NNQHSXKrdY3o8g/QsdCpLha1wEpQjY3NeO8OTBtO@vger.kernel.org
X-Gm-Message-State: AOJu0YxnLiAEjaL6bU/cxhEZ1Vq2dZ0XtP49SLcAFaGkH4hJRKW54RzQ
	jw8OkhQXt44J3Sg3bd9Y/QUvAkGrqwf1iI0XvthAfo6lkX08fTKX6E6vupPxEgAvqUz01P4lSYx
	LOv8WHSUgGHhPwZZea31BMv5OC78=
X-Google-Smtp-Source: AGHT+IHt7UDuSj5pm8LnzOWtjWbPFfnpw2JDNvyyuEtnENLmFrNE/DrgG2NXJBGp5zXDTggsD1Ni9vazMSjN8Xx9Qc8=
X-Received: by 2002:a05:6122:da8:b0:4f6:ad39:dab1 with SMTP id
 71dfb90a1353d-4ffe4a7e888mr4435149e0c.5.1724959104344; Thu, 29 Aug 2024
 12:18:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827131722.89359-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240827131722.89359-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVQ-hy7aW-rs5eTLSOULF_GHVV=NHvjCLhPW3XS3Y=+8Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVQ-hy7aW-rs5eTLSOULF_GHVV=NHvjCLhPW3XS3Y=+8Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 29 Aug 2024 20:17:54 +0100
Message-ID: <CA+V-a8tNy8OCg3iBrpRLDJ8Ee-wa7npTGggm_K6-a+aW8DBgUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzg2l: Move pinconf_to_config_argument()
 call outside of switch cases
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

On Thu, Aug 29, 2024 at 2:15=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, Aug 27, 2024 at 3:17=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor the `rzg2l_pinctrl_pinconf_set()` function by moving the call =
to
> > `arg =3D pinconf_to_config_argument(_configs[i])` to the beginning of t=
he
> > loop. Previously, this call was redundantly made in each case of the
> > switch statement.
>
> This is not 100% true: the PIN_CONFIG_BIAS_* cases do not
> call pinconf_to_config_argument(). But I agree that calling it
> unconditionally doesn't harm.
>
Ok, I'll update the commit description to below:

Refactor the `rzg2l_pinctrl_pinconf_set()` function by moving the call to
`arg =3D pinconf_to_config_argument(_configs[i])` to the beginning of the
loop. Previously, this call was redundantly made in most cases within the
switch statement.

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -1395,7 +1395,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinct=
rl_dev *pctldev,
> >                         break;
> >
> >                 case PIN_CONFIG_OUTPUT_ENABLE:
> > -                       arg =3D pinconf_to_config_argument(_configs[i])=
;
> >                         if (!(cfg & PIN_CFG_OEN))
> >                                 return -EINVAL;
> >                         if (!pctrl->data->oen_write)
>
> Missed opportunity for simplification:
>
>                 case PIN_CONFIG_POWER_SOURCE:
> -                       settings.power_source =3D
> pinconf_to_config_argument(_configs[i]);
> +                       settings.power_source =3D arg;
>                         break;
>
And while at it I'll replace as above and below in the v2.

Cheers,
Prabhakar

> > @@ -1432,8 +1429,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinct=
rl_dev *pctldev,
> >                         break;
> >
> >                 case PIN_CONFIG_DRIVE_STRENGTH:
> > -                       arg =3D pinconf_to_config_argument(_configs[i])=
;
> > -
> >                         if (!(cfg & PIN_CFG_IOLH_A) || hwcfg->drive_str=
ength_ua)
> >                                 return -EINVAL;
> >
>
>                 case PIN_CONFIG_DRIVE_STRENGTH_UA:
>                         ...
> -                       settings.drive_strength_ua =3D
> pinconf_to_config_argument(_configs[i]);
> +                       settings.drive_strength_ua =3D arg;
>                         break;
>
> The rest LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

