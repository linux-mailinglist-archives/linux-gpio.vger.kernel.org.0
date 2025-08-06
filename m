Return-Path: <linux-gpio+bounces-24040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED9B1C87C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 17:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E78C3B90FF
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 15:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D83290DA1;
	Wed,  6 Aug 2025 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yn+tgNUn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A4F290BB0;
	Wed,  6 Aug 2025 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493310; cv=none; b=uqHLE5tyP25+WXs9YIkHT8vtNOvIcpduMdeuzAe3jC5kk9t94sVND5SRSLYTDdnxPbhrK/9hBoVu40o3Wpw+94OhwcFcFY97nPsK+2/CY/8tqySjiGC6GA+tlRFl18hFL+ELuIoZMLYMOT0+7cw8sCA6tizZAjGchC8hZrwFyOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493310; c=relaxed/simple;
	bh=Rl1SfxwCLKvrq00bLHbOoBlB/ADIvSlEXCLtUNhWq3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TnlnxKEfVEgg+kXl0qwMsZVQmPlVXQ2aA+CK8j5ydSyUn3dd3uImx6ZGq0RSB4gGYWoJJ1uIcuAnxN3c+vN9rG7aedcvvxV/zEg3Xm71Y6tmYbIohEjbFpgITiLqNz8Xp5BIRm4co5EFPxE92yA4w96QMnnB/bVzUaIRkuU6Oh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yn+tgNUn; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b79bdc9a7dso4327288f8f.1;
        Wed, 06 Aug 2025 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754493307; x=1755098107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O89XX5vY+fQift6Eku/HiD8rOrFjs3z5KMiAI4i7vnk=;
        b=Yn+tgNUn5tJ+Xk7Lk0qWIYDYkNxge3MtABDvXRq79Zn8HmCWQxowufQJcHK6Bg8md6
         cdez5UN5nMy6LDGhjWAKXEgtZVr1Nj+omEDdTP6tNJM5h0Arp2GQnl1XitGx46h6V2bL
         Epxu5mEZUzlZ31Xy8dzoh5XjvJVEceQo8dWNJXb6IeOEnI+mXWkMx3ol8ZXqoyHgakg1
         f9OPGhzNGRGRt2lYUAJYSIbizp/t8THdLxBFhijST7gup4TJLo/kqShaFzDVQMriGwqN
         wb/wk+RCrk16egHhoPBrxufGki6U81yKI92JGS6wB+J4YIUuMmQ9qizJbDqM5lao9FCi
         4DgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493307; x=1755098107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O89XX5vY+fQift6Eku/HiD8rOrFjs3z5KMiAI4i7vnk=;
        b=eRw7sTa6y83EPK2CWHfjhzC0Ciwb4g79kpFxj0wsMcEKaDmBonwO41Bwit6U1baPkM
         NArnzDCwhsHeBKPhC6ylRmBCVDbZZt1u8yEtkZWs3wjCztM1HTg8dmZFEEkAlSslAkas
         diQT5D8PjqBciaeRyoZ60y3/aJU6d8J3B0yQdOirO7EWGnzinkapCk26yFlz31E29Thr
         +JKz9MjjRfeXjJQd0RnICbEIp3qrzCuD7Q/1PGvzqSNEEm6NwXrnZMTZH+DpJu86ySgJ
         ilml0SP1BTEVlQQI+rOLjYs7KTuzDn4bPq0pFPu4hQbsqS3HKWegDczHJyWh5TNHBAh0
         6OWw==
X-Forwarded-Encrypted: i=1; AJvYcCWYld6v+j007iudgF90n0aZVKvBSlB32TjeZG6BEjqne9Z2oaPkkeWEduLVKeZFMvKrxT4Ucd5r2sdy@vger.kernel.org, AJvYcCX6oZt8foRgmeVnvupoaWkHRoDT6TR3EpatWC0xrkkxK46Rh/+pZc5yuX63gYW8aIkoO6nMbDsqFmUaL6on1fb4GPI=@vger.kernel.org, AJvYcCXRacb5EWAN9SBMpMdgUUo7liLo84P7rQPFiDK2UNo20NFwGjr0tfpsCJXpbuPjegxWLheKqqoz+nOccmEG@vger.kernel.org
X-Gm-Message-State: AOJu0Yywoias6qrvruN8EBQnbOOrbdMsEo4dQDQPPTjYDN2SIwTKkKAU
	Yd3dVqoP7EReIM3OccNYd+Ik9dUmAGG8eVSztZnjLHhO0n/2SWZyUiBbQN5UtH2ZUazufzMvi6g
	zA9YVyLcOo52OVvS9o+zlGk/kMZrCsbs=
X-Gm-Gg: ASbGnctcBhpwCjYClHrUM0OPCRiOaZhRPTcY/WudaXp9SOTZya5SDVQmhWYwV+wUCWe
	ApZ2wav8hWNMcYr7zEpDoYQfVtjio1qF2WXlJ3Scl/Waa+L2GuyVshRx/82XSzygsqb2mY2wGD9
	2Ii9cwEMZIlE0+WbqW+0SlQSNBm+SJ+QMFTJIbKcdGT3gVtc6RECY/fDUGgKqeftCxtvity29Tq
	d5z9qxz/XBRi+nl
X-Google-Smtp-Source: AGHT+IEQQiaQZAOP4z3B1b1MOjADmdCLF2ACdROtZ/e3MjVKUStyyZmo0+KG5cOCaRMAmZ3YSngUcTJqA3Q84lNzoBk=
X-Received: by 2002:a5d:5887:0:b0:3b7:8c98:2f4c with SMTP id
 ffacd0b85a97d-3b8f4916c5fmr2744208f8f.33.1754493307396; Wed, 06 Aug 2025
 08:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250709160819.306875-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUKvC1HWGZc=52gCRJSKHcyM2NgAo6_YioGy31hBmTSbA@mail.gmail.com>
In-Reply-To: <CAMuHMdUKvC1HWGZc=52gCRJSKHcyM2NgAo6_YioGy31hBmTSbA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 Aug 2025 16:14:39 +0100
X-Gm-Features: Ac12FXzQ1WRzNa-8dq7G6bVfsojQQ76xGJ_StYkOHVKbKvWXQSgNnwOl7dZHu0A
Message-ID: <CA+V-a8sDcYkNKMrbWpO8ze9qpHmU=iqQyr-2J9Zh0tWO6VkbHg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] pinctrl: renesas: rzg2l: Unify OEN access by
 making pin-to-bit mapping configurable
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Aug 6, 2025 at 1:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 9 Jul 2025 at 18:08, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor the RZG2L pinctrl driver to support reuse of the common
> > rzg2l_read_oen() and rzg2l_write_oen() helpers across SoCs with
> > different output-enable (OEN) bit mappings.
> >
> > Introduce a new `pin_to_oen_bit` callback in `struct rzg2l_pinctrl_data=
`
> > to allow SoCs to provide custom logic for mapping a pin to its OEN bit.
> > Update the generic OEN read/write paths to use this callback when prese=
nt.
> >
> > With this change, SoCs like RZ/G3S can reuse the common OEN handling
> > code by simply supplying their own `pin_to_oen_bit` implementation.
> > The previously duplicated `rzg3s_oen_read()` and `rzg3s_oen_write()`
> > functions are now removed.
> >
> > This improves maintainability and prepares the driver for supporting
> > future SoCs with minimal duplication.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -296,6 +296,7 @@ struct rzg2l_pinctrl_data {
> >  #endif
> >         void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool =
lock);
> >         void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 off=
set);
> > +       int (*pin_to_oen_bit)(struct rzg2l_pinctrl *pctrl, unsigned int=
 _pin);
> >         u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, unsigned int _pin)=
;
> >         int (*oen_write)(struct rzg2l_pinctrl *pctrl, unsigned int _pin=
, u8 oen);
> >         int (*hw_to_bias_param)(unsigned int val);
> > @@ -1070,7 +1071,9 @@ static u32 rzg2l_read_oen(struct rzg2l_pinctrl *p=
ctrl, unsigned int _pin)
> >  {
> >         int bit;
> >
> > -       bit =3D rzg2l_pin_to_oen_bit(pctrl, _pin);
> > +       if (!pctrl->data->pin_to_oen_bit)
> > +               return 0;
>
> Please add a blank line.
>
Ok, I will add a blank line here.

> > +       bit =3D pctrl->data->pin_to_oen_bit(pctrl, _pin);
> >         if (bit < 0)
> >                 return 0;
> >
> > @@ -1084,9 +1087,11 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl =
*pctrl, unsigned int _pin, u8 oe
> >         int bit;
> >         u8 val;
> >
> > -       bit =3D rzg2l_pin_to_oen_bit(pctrl, _pin);
> > +       if (!pctrl->data->pin_to_oen_bit)
> > +               return -EINVAL;
>
> Likewise.
>
ditto.

Cheers,
Prabhakar

