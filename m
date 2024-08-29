Return-Path: <linux-gpio+bounces-9326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9778B9639EA
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 07:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F339285CD0
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 05:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C7A13C81B;
	Thu, 29 Aug 2024 05:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTQc4JN9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1686A92D;
	Thu, 29 Aug 2024 05:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909688; cv=none; b=VEX01bkuPInfkdbZb2s7TBFHJab1t5kfvdrwMa4xMa0PKIgwO2uDUhGxBbVBEcyizDSAih//vypVpl5vijpK/MrPZFATxLRWDJ9AGCbh73bXybngt+CDuCUyeDBUUnHRfMblLhX/4xo3f6Y2IC0/QTw0sTmFe04jla3v+eRlO6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909688; c=relaxed/simple;
	bh=qOzLTC5TwIPs6fH5v8BJWFxwitFWVkLCRunEOqdsgiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ro0jtzSaGwaYKbxu0zPD8uOuhnQgH2crM3rO3pdWHBwHJg9rf+8m8GqwdZKuLMEd9YMD1a4knePcwBWahG29o7u60LVOj48uxZbY5P9oNarKcsiOUI462sbigyPTq9r/uQNLvubVgXd6hPBU2j3d2PJPSF1TW/dPtTrD5K23Liw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTQc4JN9; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so2709281fa.1;
        Wed, 28 Aug 2024 22:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724909685; x=1725514485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6duK+y0NIbCZnrZY/SKwmfpA9Y/EZSnO7EgAhUfZetE=;
        b=GTQc4JN9v9AOwMi/eLCkvPoPG3k4ndAbZggJM6PEo1xR3TDtwp7o7vR7aZOm63i2jL
         vlqjffxMldKf9jf9k8/uKIdp7QXmLqG1yVBKTGQ2nwXVP+zdybRZbAgiEVt+1sL+W46p
         ZjUVMJExC4PsjBmOLuTSpXN3O0NpNXXquXu6rXPcNMmMdxntHeqVtiu2PbwCbCHBnty+
         QHF0XjUPljhCU9pMWSO27YsYR75s3FZEX4q0ZID55Y6+7DLt+Bj4Ljbhl0rk9XTnTT/W
         buNKd0+1Uiexen/9qhzIxMNJXHkicbCR3mNi9CFeWHMwVWgJ4r+rXyIkxrvA9MiZ6PGj
         c90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724909685; x=1725514485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6duK+y0NIbCZnrZY/SKwmfpA9Y/EZSnO7EgAhUfZetE=;
        b=uGnQQTmDNZcmry1AwWcc2NnMH08hIWeXwnf76ds38YX7sKkQwxh9HhJKCYsiAqRts+
         eB8dDKxFS6gK2T0dMKgAfeNsg1JQAPacOfEjeFevh4FdJppqqe1TUVzWWUjl3stLz02H
         MPjZVuMaShWIIbBnrw7bIcckeFT07lcd1DT5bDGvMkHqv/n/j7SELIDNX3nNJSxdr9pF
         YFFvyoY5+rvQYHFF/JPX7QLIIjtX7OaplncFr+JwmC32KKYj0tGpE/gqXIhECTEi2GQn
         kZO5i9iCI2wSxrRL7mveHmHDpzn1CAaPF2deB2EmuLf0KFmM/XmKvncEijs+JyJAsSoQ
         lXkA==
X-Forwarded-Encrypted: i=1; AJvYcCXAfZ4nhJ8/3C0wvzI6byy4Gyv0HJeeKSniyAlBTmiEOqXuxFLgEWjB2TeNW5jMOu5m3kMuUIoW6oKi@vger.kernel.org, AJvYcCXXMgHXxsywKrxKGwgg7D774JR50Mo3B7H/7NmZOqGotGzHGWkyRaRWBjOXQUCiAkN9VB9NIIwN1coLlgQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YyemjFjgVrqA0jdzhJVSspNnjiQxO6ZCAwd8dFn/TMaWyK4HdDH
	IiJ+8iTh+x/AjJBw7wn0F8oWQ9o/ha0tmiU6pmFYJ5NA0LVicVEkkjXq06Jtp1F6jW3715lpJA+
	wfb8Ag/GSQlvQiMX3VGhFvAKptNDT075G
X-Google-Smtp-Source: AGHT+IGf+cGnsxc6Gp6hnAijFaiDpUZ4HnMX13sJkmsDz2H4U99wyfT8oNOb7C15TJldrMxAMyWKHPV57Es9pFVsl0o=
X-Received: by 2002:a05:6512:4003:b0:533:4620:ebec with SMTP id
 2adb3069b0e04-5353e543459mr1238678e87.3.1724909683984; Wed, 28 Aug 2024
 22:34:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <20240828184018.3097386-6-andriy.shevchenko@linux.intel.com> <20240829045334.GT1532424@black.fi.intel.com>
In-Reply-To: <20240829045334.GT1532424@black.fi.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 29 Aug 2024 08:34:07 +0300
Message-ID: <CAHp75VfCpoTVxxNJewTDmYjFtX378QMoNuRv-KGiFSgop-_d-w@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] pinctrl: intel: Introduce for_each_intel_gpio_group()
 helper
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 7:53=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Aug 28, 2024 at 09:38:38PM +0300, Andy Shevchenko wrote:
> > Introduce a helper macro for_each_intel_gpio_group().
> > With that in place, update users.
> >
> > It reduces the C code base as well as shrinks the binary:
> >
> >   add/remove: 0/0 grow/shrink: 1/8 up/down: 37/-106 (-69)
> >   Total: Before=3D15611, After=3D15542, chg -0.44%

...

> > +#define for_each_intel_gpio_group(pctrl, community, grp)              =
               \
> > +     for (unsigned int __i =3D 0;                                     =
                 \
> > +          __i < pctrl->ncommunities && (community =3D &pctrl->communit=
ies[__i]);       \
> > +          __i++)                                                      =
               \
> > +             for (unsigned int __j =3D 0;                             =
                 \
> > +                  __j < community->ngpps && (grp =3D &community->gpps[=
__j]);           \
> > +                  __j++)                                              =
               \
> > +                     if (grp->gpio_base =3D=3D INTEL_GPIO_BASE_NOMAP) =
{} else
> > +
>
> This looks absolutely grotesque. I hope that you can debug this still
> after couple of months has passed because I cannot ;-)

Yes, I can.

> I wonder if there is a way to make it more readable by adding some sort
> of helpers? Or perhaps we don't need to make the whole thing as macro
> and just provide helpers we can use in the otherwise open-coded callers.

Yes, I can split it into two for-loops. But note, each of them a quite
standard how we define for_each macro with and without conditional,
see the jernel full of them (PCI, GPIOLIB, i915, ...).

...

> > -     for (i =3D 0; i < pctrl->ncommunities; i++) {
> > -             const struct intel_community *comm =3D &pctrl->communitie=
s[i];
> > -             int j;
> > +     for_each_intel_gpio_group(pctrl, c, gpp) {
> > +             if (offset >=3D gpp->gpio_base && offset < gpp->gpio_base=
 + gpp->size) {
> > +                     if (community)
> > +                             *community =3D c;
> > +                     if (padgrp)
> > +                             *padgrp =3D gpp;
> >
> > -             for (j =3D 0; j < comm->ngpps; j++) {
> > -                     const struct intel_padgroup *pgrp =3D &comm->gpps=
[j];
> > -
> > -                     if (pgrp->gpio_base =3D=3D INTEL_GPIO_BASE_NOMAP)
> > -                             continue;
> > -
> > -                     if (offset >=3D pgrp->gpio_base &&
> > -                         offset < pgrp->gpio_base + pgrp->size) {
> > -                             int pin;
> > -
> > -                             pin =3D pgrp->base + offset - pgrp->gpio_=
base;
> > -                             if (community)
> > -                                     *community =3D comm;
> > -                             if (padgrp)
> > -                                     *padgrp =3D pgrp;
> > -
> > -                             return pin;
> > -                     }
>
> Because I think this open-coded one is still at least readable. Of
> course if there is duplication we should try to get rid of it but not in
> expense of readability IMHO.

The result I think is more readable as it's pretty clear from the
macro name what is iterating over. It also hides unneeded detail, i.e.
iterator variable.

>
> > +                     return gpp->base + offset - gpp->gpio_base;
> >               }
> >       }


--=20
With Best Regards,
Andy Shevchenko

