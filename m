Return-Path: <linux-gpio+bounces-29416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1243ECB1FAC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 06:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B16273015ECA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 05:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2F62FFF95;
	Wed, 10 Dec 2025 05:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsAICZog"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC82FC874
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 05:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765344523; cv=none; b=VJPt6ToM9taIh29oe2/e8GOwF9xWW2HxUBgyuP/y7H8tWSNIfHNCNl3g6p1i1eaIQSvXPDrQVqV/+0AwNjqzk0KOVVBqewY/Gs5LzbadZxNwI6tSgXlR/2dnDYXYukHVjDbOMI2SM+Fbt+QHt4RB0uFV7ToLDMVj5a79OKUFhfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765344523; c=relaxed/simple;
	bh=G3z+a5GrUQ8xgAH/oJ+eKqK9CwroDEkPM+gjEIgFG3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGmlqihajFW01Dklwu4eVEPg3Sk3DIhzx2fIwX1x7RUs/6gxiFj0bbj61mgoW6j5VFQRbJyvDCP3Vhdk5CdcwQSS2KXn/QsxHrrNZZqRFix+++yHKfGnCNJlR5yi0lf4LfmrGh8uPBLPe9E+BLxbJerEdk29fZMakWl4WWCFCJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsAICZog; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77547C19424
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 05:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765344523;
	bh=G3z+a5GrUQ8xgAH/oJ+eKqK9CwroDEkPM+gjEIgFG3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fsAICZogPAoSsIAfrT5jtczd4ieEZQQnzxrhJ8YXnPKqSgde1HJunZRB217uQMldc
	 8sRNsLrmOt+gHSsLflVfzbQZE0UoBrpd56sJKXOgI+MeytB6wB0uLZ8gZTZhnY9ez8
	 NPGbowh7seRrbh12F3A0e3s1ld2idNPl4i6cbCrYq1hr2UgMcXctBfBPTzdDcbYZD2
	 vhUU6Hd3lvrFOR0kgvwgHoJLXWDDjjhma/dn4Z6/IiZzZau+Lv/WBKenfhAYdaAi4J
	 Guynow9lDRq+JmmrDgSOo+CDOAM+ZyL9u3L90dAyw0scZg6d4K6F3FTxvjUqPy140I
	 zYOmRxceABtNQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5957db5bdedso7814153e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Dec 2025 21:28:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwx77RhKGWcM0eDAqlP1J30SqMinrqd3mfhLYWEZLSPwZuhQUHuyJNCQnKMt2kCm1BCMQlJlPdnpUG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2FQ87nNZUHp7pYb2IQxcK8hyEfRhZKGLl7nZWZKlPTLZyXsOX
	EE99zl4hrW0NwQwBFglZXYvo7U2iJAs8Rbn/kGhWyAJ0GeQ7FE/vnb38JRA1iqQS+4JQ2ZEqHOG
	dQMLSkiCZYysu1XE2bDJVkkj5i+mgS4rjpZQJFSQDfA==
X-Google-Smtp-Source: AGHT+IG9Y+wV3PLttX6sFGIm/tmfU5Bo1tvdoOezWmUq6lQ5/OL/90/vBQK/OeM5NzyVckfCh2arozldTmpENH6MtpY=
X-Received: by 2002:a05:6512:15a8:b0:598:e4ca:8176 with SMTP id
 2adb3069b0e04-598ee49cdecmr448950e87.13.1765344522120; Tue, 09 Dec 2025
 21:28:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209061237.7949-1-bartosz.golaszewski@oss.qualcomm.com> <89a59ff8-b016-4bff-96da-92868aeee401@gibson.sh>
In-Reply-To: <89a59ff8-b016-4bff-96da-92868aeee401@gibson.sh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 10 Dec 2025 06:28:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeJc6+vdvHh7DxXCi5kC_dx555qyqNegOxXJ401S73_uw@mail.gmail.com>
X-Gm-Features: AQt7F2rsLFrn2-ACRMxY0QnIrRhZ36JaQ-XfXA7MwzVh2rdMbf_yg4P_uqWLS9k
Message-ID: <CAMRc=MeJc6+vdvHh7DxXCi5kC_dx555qyqNegOxXJ401S73_uw@mail.gmail.com>
Subject: Re: [PATCH] gpio: it87: balance superio enter/exit calls in error path
To: Daniel Gibson <daniel@gibson.sh>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 3:42=E2=80=AFPM Daniel Gibson <daniel@gibson.sh> wro=
te:
>
> On 12/9/25 07:12, Bartosz Golaszewski wrote:
> > We always call superio_enter() in it87_gpio_direction_out() but only
> > call superio_exit() if the call to it87_gpio_set() succeeds. Move the
> > label to balance the calls in error path as well.
> >
> > Fixes: ef877a159072 ("gpio: it87: use new line value setter callbacks")
> > Reported-by: Daniel Gibson <daniel@gibson.sh>
> > Closes: https://lore.kernel.org/all/bd0a00e3-9b8c-43e8-8772-e67b91f4c71=
e@gibson.sh/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/gpio/gpio-it87.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
> > index 5d677bcfccf2..528ac1890613 100644
> > --- a/drivers/gpio/gpio-it87.c
> > +++ b/drivers/gpio/gpio-it87.c
> > @@ -254,9 +254,8 @@ static int it87_gpio_direction_out(struct gpio_chip=
 *chip,
> >       if (rc)
> >               goto exit;
> >
> > -     superio_exit();
> > -
> >  exit:
> > +     superio_exit();
> >       spin_unlock(&it87_gpio->lock);
> >       return rc;
> >  }
>
> Moving this after exit: means that superio_exit() is also called if
> superio_enter() failed, a few lines above this patch:
>
>         rc =3D superio_enter();
>         if (rc)
>                 goto exit;
>
> I don't know if this is really wrong, but it looks fishy and this code
> behaved differently for years - in contrast to the change to skip
> superio_exit() if it87_gpio_set() failed, which is very recent,
> introduced when the return type of it87_gpio_set() was changed from void
> to int.
>
> Probably (again, I don't know if this is actually wrong, I'm not that
> familiar with how this chip works) superio_exit() should remain above
> `exit:` and `if(rc) goto exit;` after `rc =3D it87_gpio_set(chip,
> gpio_num, val);` should be removed, so:
> - if superio_enter() fails, its error code is returned,
>   but superio_exit() is *not* called
> - the it87_gpio_set(chip, gpio_num, val); return code is returned by
>   it87_gpio_direction_out() no matter if it succeeds or fails,
>   but in either case superio_exit() is called
>

You're probably right, I don't really know this chip either. I will
send a better version.

Bart

