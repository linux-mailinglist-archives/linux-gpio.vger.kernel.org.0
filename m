Return-Path: <linux-gpio+bounces-6309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EF78C298A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 19:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4A30B25021
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 17:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4F31C6A5;
	Fri, 10 May 2024 17:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZFqhXuh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E3B2D627;
	Fri, 10 May 2024 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715363260; cv=none; b=idX50NuQ88rVq2X7omKATG3vRC24Lk3/3Jhvp4TxRiMUkdDepgUHTQiBoD4l3f91B2M58qk6dQQTQ3/StZ9jp19dH+7OQkthFBdqfz0wYqR01xY+4ypEyIF9okeHkm5KLuAFHBfBMRPbyDC89qRpYYVMLuEKvKh6E2NrmF7zDv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715363260; c=relaxed/simple;
	bh=ZvztaxVhFppW+dunKXuw5owT3lFMAfjH/4VZOrtHlFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nASwAaTNSgju11U+wN5LzUZnYJvtylwGhKxWo2siDQaj711w+laphPLtMuI92OrQbFPX+dPvoeoR0Z8sqfQU9cFoRchReTWwVYANNofbI7v8F6nRcU0aSXOB+wirPGY1+bx/7fI61ruUIU3kdFxsn7rUL7w8RKb/eLLv1R5tmtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZFqhXuh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a5a1054cf61so594509666b.1;
        Fri, 10 May 2024 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715363257; x=1715968057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvztaxVhFppW+dunKXuw5owT3lFMAfjH/4VZOrtHlFo=;
        b=RZFqhXuh437CAqz3SRxvaNOafNasf8w9W46z4V1RbQyMLT/Nblu9L4IDu0s4fGf7tE
         t5WByT1yaKK6pkuMx4fKxapfdU1J2n1OKvo2P5psrc7WvtF1312O9zEFbeTrssW0gCsJ
         XiMaS9W6GDQHMYfvtN0RfjV7eUhonTIctTtVc+852/Sc+gEBdYvg33xi+/KjZRudYqAZ
         zmul8PZvTijhViQYO7+YEx0Hnz2kXAbaHI1TyaFWLz16TJzFjFu4fTZt1NUJe1BjyCvW
         V7zfYPagpAsuka+LPwVWKXcIvXJypKyN+JoyR2kIeVP+YoIHj7+46TelIUOV6bXoocA8
         4wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715363257; x=1715968057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvztaxVhFppW+dunKXuw5owT3lFMAfjH/4VZOrtHlFo=;
        b=T9BGxiMSEF+8fVLpAXz38CXBBzqqonXM1iZdOvTrhqLj1EBMGFD4sHn8Y9KwZSp//3
         SyanEn2Yl1wxPPxdXZbsl/l6SwSgdXmgAhOvJEgqeijrPh8lMQHolFrl/Znv12TmAhgO
         12FlRvSyu+zC7EHVXaBUdxXNru0vAQw7jFKVHp35yj/Nm42TrQcagVypjDGHgbzusPhz
         6OkiZbXWatYZeKK0TcsE841KJmHworg4nzOjOmeMvHGR8jqxttq+r5azd8naWigUJ1kI
         ZoxFHzuzypqamM28D36/wg8ohRIoyErbD+GuinU4gj6jnYJP4af5q/Bb4r3eG8/nQpBE
         2zcg==
X-Forwarded-Encrypted: i=1; AJvYcCWecf4XOj2AmPQsagsVepMAvrKsRTubfS6rQmiXRUEmrPezPhFZh7eVvrA70ZRSlRsFIuD65/beBmwuhdcZlR8YZcD39W4cTqxCiet9Zi3msgAnMyEoPdfBAHRzevKif4Ljou7BoxSuXg==
X-Gm-Message-State: AOJu0Yy79mxO3OZ2jrDE7sTkMbqXZu8FtoJqy2WiafRvLxAxoK/jyiWn
	4Ydj5yERxtu0x/1PEbAM7wB+t2ucwjFLQh95HZ02ZXw4DVx7li8JB8dZR2urtZ33KQHY7qHKuxf
	glPeIv3X0J1amphVpz4rNfB1HmKzEkmId
X-Google-Smtp-Source: AGHT+IFfIjdEBYXeEGAPCOmCf/e6psY+NI/VvqYiZJKMo1u8WflwScJdqblBG2EQsiGiUdDwHUx407iPQd76Yd/9lWI=
X-Received: by 2002:a17:906:a010:b0:a59:a9c0:57e6 with SMTP id
 a640c23a62f3a-a5a2d675dafmr294429166b.75.1715363257287; Fri, 10 May 2024
 10:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240508144741.1270912-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Me3XOy6HfqjxDQBwnSW9pOCtK_Ry7keJ2LiXGFB88t4nA@mail.gmail.com>
 <ZjzWlNdDVVBRD-Ma@surfacebook.localdomain> <CAMRc=MeuAQgos+=GmYr0X+5Pi+foJaRNwuNM0D3b4-FwxoD2mg@mail.gmail.com>
 <Zj5AZMycTCPUoT-l@smile.fi.intel.com> <Zj5B5ONDI7DB86on@smile.fi.intel.com>
 <Zj5F8tidsVPkDGEi@smile.fi.intel.com> <CAMRc=Mfq50x5RUM76yYXG9hGh4vGTO2hTgFeO8Ty1Z0p3oo_2Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mfq50x5RUM76yYXG9hGh4vGTO2hTgFeO8Ty1Z0p3oo_2Q@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 May 2024 20:47:00 +0300
Message-ID: <CAHp75Ve1sNmq00OLz51gSTr5XEwOYNpMy7+RO8Pc=Wts9ZSh9Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Return label, if set, for IRQ only line
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 8:30=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Fri, May 10, 2024 at 6:06=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, May 10, 2024 at 06:48:52PM +0300, Andy Shevchenko wrote:
> > > On Fri, May 10, 2024 at 06:42:28PM +0300, Andy Shevchenko wrote:
> > > > On Thu, May 09, 2024 at 04:23:07PM +0200, Bartosz Golaszewski wrote=
:
> > > > > On Thu, May 9, 2024 at 3:58=E2=80=AFPM Andy Shevchenko
> > > > > <andy.shevchenko@gmail.com> wrote:

...

> > > > > Fair enough but I would like to know what your bigger plan is bef=
ore
> > > > > picking this up.
> > > >
> > > > I stand corrected, this patch has an immediate effect on the generi=
c
> > > > gpiolib_dbg_show() which does *not* use the above mentioned call..
> > >
> > > Ah, but it doesn't use gpiod_get_label() in the else branch either...
> > >
> > > I want to amend the else branch there to print similar or reuse the m=
ain one.
> > > For the latter I have locally a patch to modify gpiolib_dbg_show() to=
 show
> > > the interrupt lines as well even if they are not requested.
> >
> > I just shared that patch, if you are okay with both, it would be nice
> > to have them applied.
>
> Not for this merge window, we'll see in two weeks.

No hurry, I'm fine with your schedule.

--=20
With Best Regards,
Andy Shevchenko

