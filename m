Return-Path: <linux-gpio+bounces-29720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9BCC97B8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 21:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A6F13043932
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 20:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851D83090EB;
	Wed, 17 Dec 2025 20:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKLweab5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B0B2D77F5
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 20:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003181; cv=none; b=tbtGm6e0y7DaX+SOFhHQgz/OrseZlfDlFnxgOWLe8P5vwpJ+cszNDSpvToZzvd0KPF3Mff1ScQTyxIIeEOefxqrMCfeSUx8k6/CVHIovW5XKUjqH6/5FMqAyeGLZjE6/hEN3I1xWyQSr+LK4s0ABT4ELc1gnzcrwGv2Ss8A84VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003181; c=relaxed/simple;
	bh=OkkJLGpG/GvNIKcugE4nPWgqEcrr6Sxufi3nTP4yL2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UwATT0sihAqXn4DrvmsMd9hEM1V4rVCNFtE7ZenZjEMgdpJ8FMmVSmA1l5URGnLVBFo5b9SOWkkJyGGFGSgq0lhp4LoMLdxNSm72UxaQVDHWsr/xj9xHYx2daXcWR2pY6Q/zn6j4BjtHaXt88WDN0yl6lLTESPCF0yK73c1/Rb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKLweab5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso2194132a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 12:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766003178; x=1766607978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0J/MNs1SKkoTJ/BWnsjyTPfOzpgwt+kcSZFfeEvx1M=;
        b=NKLweab5B68rtv2AJhQu+fR7KgLqV1yZVJyusDEI/sRl1le2epFLHN1+SII0JTQHaf
         OiSi+3C0Hw4cgUrBS7di0fmkhqcR17eKP4mxQD57uJOd/2lYeABZwDi6ni65Ax8N5wM0
         4LUky7CzKdFBkFTBZxRxJ2XogTt0+1iyl2eSVXGjvhxhKb+C1ykDs0MBK0GPw1y3w5KF
         EklnDZi75r7l9GjGOHnXwWU1LKsSrFe3gHgxEte8ZTQVKQqN/uGEfh1ZA0tywFGRD1Vm
         ekpgGItHa0ohtfzUfA144jQ1CwYG9kH79qExWVX17NBWnkbs9ThVs9T6+b4zQGOb0Hti
         2Miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003178; x=1766607978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r0J/MNs1SKkoTJ/BWnsjyTPfOzpgwt+kcSZFfeEvx1M=;
        b=JtCQYcxggxSM92Iv5yLR55ktEUOF/vbcVhZTWPBTzAnF88Iiu5opaanHmYbsoWavQB
         pLOb8vwtnKu2t6shLW4AFNLFHJiDKt7jp/lfU+SrkYGGvlVkFOK1VJYozdMducsVjhAI
         fylwPgalRhSl+qNrLSzcCNMbyoqPivt6ngKQ+I/chft4owgVkR1wZgtsU5g84rNK/nL7
         8jyVraBx3rxtszTY+ZImWd2T2mzFNjktKg+g7EqMa267VHw+81KKY5gkYKMIN6SwDuVD
         5qRIx0HXGpObk98QaeGI4UDmCAF64KOwIAGRVPS5fAxbMTKVsQ6xf82IgMYSPf/UV/fd
         DuUw==
X-Gm-Message-State: AOJu0YyE1i1xpo/0cJJC01QD/v31qstpAqqvEDN7cUf67IUwGLUV7Ny8
	0NdKqec7rH2u98ttwZR2U7/pl+a8r3y6hd+mwkuMLiVoA5UCb1oBzVRUc/+mZfDqQ4R0FoAmXQ9
	slc780eU0Gp+nJlaNgwFCb4nhjv7ICvg=
X-Gm-Gg: AY/fxX5N/CRV4329bJ4GmU/dDoLHqGtrEkwu1u4iUXf6INTYypoFygwDBcSY++NoeOB
	4BbB1B2FvsK6QbWMgihn1GljhDic9CYlztdrr0dn7kw6LIFLfvRzDVqyafKrzTRULV2Vbl/i9wR
	AhXjJQwLrjT3W3GuEEizIZ9oldlKntWz9bFGOElTronIbV8qRYludy5x13fLjHFun/shrGiCqgn
	1wP48gSK9d4/RFWLnys92BuL6GIaT+bwoyZ0Pm+i9V+xuVGvFGSv4UMJdXFbvJtGG2tlk3eJ7D3
	M4Hk77pq
X-Google-Smtp-Source: AGHT+IGAWKNWYGIt7EF46NiXStFSI+TttWmFk9nT/g7GEIiMpzzI2aqHbjvnrbfKyy1SJvvN7inohgAkQ6t4rODofvc=
X-Received: by 2002:a05:6402:1bd0:b0:640:92eb:aa24 with SMTP id
 4fb4d7f45d1cf-64b584ec823mr449569a12.15.1766003177678; Wed, 17 Dec 2025
 12:26:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217063229.38175-1-rosenp@gmail.com> <20251217063229.38175-4-rosenp@gmail.com>
 <CAMRc=MfnN0sD=yb7NO6ixHC-mhv2Cg5qw_wb8cZGtg23chwmOg@mail.gmail.com>
In-Reply-To: <CAMRc=MfnN0sD=yb7NO6ixHC-mhv2Cg5qw_wb8cZGtg23chwmOg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 17 Dec 2025 12:26:06 -0800
X-Gm-Features: AQt7F2oBwKwWvX4W3jVoOnKhnF5mWKdtZTs3rOROvSrSRmLeiprYM_CCyfFu5d0
Message-ID: <CAKxU2N_SM7EauHNpu+Ko5bHfFUkONMVGYNRfp6jAL_wjcJn9wA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: realtek-otto: use of instead of device handlers
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 1:30=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, Dec 17, 2025 at 7:32=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wr=
ote:
> >
> > This is an OF only driver. No point in using generic device handlers.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpio/gpio-realtek-otto.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realt=
ek-otto.c
> > index efcddbe01308..8bad43afc586 100644
> > --- a/drivers/gpio/gpio-realtek-otto.c
> > +++ b/drivers/gpio/gpio-realtek-otto.c
> > @@ -372,10 +372,10 @@ static int realtek_gpio_probe(struct platform_dev=
ice *pdev)
> >         if (!ctrl)
> >                 return -ENOMEM;
> >
> > -       dev_flags =3D (unsigned int)(kernel_ulong_t)device_get_match_da=
ta(dev);
> > +       dev_flags =3D (unsigned int)(kernel_ulong_t)of_device_get_match=
_data(dev);
> >
> >         ngpios =3D REALTEK_GPIO_MAX;
> > -       device_property_read_u32(dev, "ngpios", &ngpios);
> > +       of_property_read_u32(dev->of_node, "ngpios", &ngpios);
> >
> >         if (ngpios > REALTEK_GPIO_MAX) {
> >                 dev_err(&pdev->dev, "invalid ngpios (max. %d)\n",
> > --
> > 2.52.0
> >
>
> Yeah, no, there's almost *never* a point in using OF-specific accessors. =
NAK.
Argument made to me on netdev before is it's pointless overhead for an
OF only driver.
>
> Bart

