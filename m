Return-Path: <linux-gpio+bounces-29744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8FCCCCE3E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 17:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 287E1304F688
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 16:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB90346E67;
	Thu, 18 Dec 2025 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtmPvcRW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C491346E5E
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070656; cv=none; b=JJ8D1AhXBGiVxZRD2+v1JGS+e7o1Sik1W/y+C+qpCzynNDexY0sf91gW4itrkmt6t5g9PHNL13LhKxe/fTw/cvy6Xb8Ppe4bhBsjgKfwIq7g4JWdfbb2/UH5cRpuZxvMMRbF8ZbdeY6/p7tAyB9DA04QbVY1WhN8m196LoNV/kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070656; c=relaxed/simple;
	bh=59cnE7Bsao12xTbFcw6WkB40BbOEY4Qcs1S3aAkVcr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/jsFNxRJK/OSzS+mztZxKD1dQIyTYRlbvcc0Pv9uiyGv2/lFGVZfE7TuW44A5zx1UqTj+AFPYhcrXIZKdeyz00a6+HFkXM8Cpb5yd+Kd1Z4eNi9Zu1VN7Kfqa1jfB6yyUcR+dugSlnLXivrB5Jok9W2OpvfK3N28EKrm9JYFcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtmPvcRW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086FDC19421
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070656;
	bh=59cnE7Bsao12xTbFcw6WkB40BbOEY4Qcs1S3aAkVcr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZtmPvcRW/F235XL/4HIWHiNNxlhNL/8TyP3MiVFQUC3yNfsoMua/nzfKwnLftTrZT
	 F7tBvEjn1qGcJu4NyoUa9eC3uH5pA5rB7AALyDeXYXKCwe34rW0DDJYqNH8fycotAB
	 YL252PsTVBQAsE/YFSE7L7eGDOVtwK9K0f8GFuAlX6O9lS+iC440utY8AwRIUnbuSQ
	 hIIrcLJlnTYBvWWCudHI2nQ/jyq9h4nPoIiHUIz8Lr/YsrMxhbac+oliEMPK7nZnVo
	 MeBR/MU0Y+pbIEW6iXNZgt7g4zX/YN5a9gTDqFKom4LdYpbckZpm75ysU5JUMdSxyi
	 9AnVRdTqssteQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37a34702a20so4694241fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 07:10:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6gPLwVHKz2fMYVD94YnUMr2xoWCj38uLq28HCNaI3BORKlEyx7RiNF4TqCwtSvdiNjhrLym1ZH1LX@vger.kernel.org
X-Gm-Message-State: AOJu0YzyqsKPD7+kX0VTuEgHN6la5rJnJN7YetQlAQ35mJB2j24GggH3
	vFkpWACi0aY96It4j+Eyqv6jiCHRHWp9WiTi/moLTglaIa5TPH6+T9wiQ6yCPDeeeUvdncKELt0
	CIi44NyE3k/7XEs6GP0kkE2341oTrXjvb8+6vBgshRg==
X-Google-Smtp-Source: AGHT+IHjvJ3c/dMsgd0oh+DnfMYwyhGFn6qT20ipkUxz1qt/el0x/PH7MohJ614rS6sD3vLCTR5ik4yG7XvY4dKlVRo=
X-Received: by 2002:a2e:bc12:0:b0:37b:8bee:87f6 with SMTP id
 38308e7fff4ca-37fd08c6eecmr65129671fa.38.1766070654665; Thu, 18 Dec 2025
 07:10:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217202331.9449-1-rosenp@gmail.com> <20251217225247.5873449e@pumpkin>
 <CAKxU2N8yvfRDGLkwCvFS5qRKB1wnz24=SUwOp82SsHoFmhqyhw@mail.gmail.com>
In-Reply-To: <CAKxU2N8yvfRDGLkwCvFS5qRKB1wnz24=SUwOp82SsHoFmhqyhw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 18 Dec 2025 16:10:41 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdZLrL89np-MYwE_OyKP65sB3m1Dpe4fPvcw4-mqKH=eQ@mail.gmail.com>
X-Gm-Features: AQt7F2rco87dhAYQXUIOmsEA8-mQJbEC2isM_CKB_Pm912SgSAErEbSZz4d_27U
Message-ID: <CAMRc=MdZLrL89np-MYwE_OyKP65sB3m1Dpe4fPvcw4-mqKH=eQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: realtek-otto: use unsigned long
To: Rosen Penev <rosenp@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 11:55=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> On Wed, Dec 17, 2025 at 2:52=E2=80=AFPM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Wed, 17 Dec 2025 12:23:31 -0800
> > Rosen Penev <rosenp@gmail.com> wrote:
> >
> > > Fixes compilation on 64-bit platforms as pointers need a larger type.
> >
> > Not a good description...
> >
> > >
> > > Change device_get_match_data to of variant. The data is obtained thro=
ugh
> > > OF anyway.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/gpio/gpio-realtek-otto.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-rea=
ltek-otto.c
> > > index e6694d5d1696..e9c89b191989 100644
> > > --- a/drivers/gpio/gpio-realtek-otto.c
> > > +++ b/drivers/gpio/gpio-realtek-otto.c
> > > @@ -360,7 +360,7 @@ static int realtek_gpio_probe(struct platform_dev=
ice *pdev)
> > >       struct gpio_generic_chip_config config;
> > >       struct device *dev =3D &pdev->dev;
> > >       unsigned long gen_gc_flags;
> > > -     unsigned int dev_flags;
> > > +     unsigned long dev_flags;
> >
> > You don't need to change the type of the variable, just the cast.
> Previous review was:
>
> Just make dev_flags an unsigned long and cast
> device_get_match_data(dev) to uintptr_t.
>

And you still cast it to unsigned long instead. Nevermind, my tree is
broken now due to the warning from picking up the COMPILE_TEST=3Dy patch
so I need to fix it. I'm queuing this as well with some changes to the
commit message and the cast.

Bart

