Return-Path: <linux-gpio+bounces-597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ECC7FBF4F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 17:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 248AE1C20CBA
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 16:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0634F8B8;
	Tue, 28 Nov 2023 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W6iio8H0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E8ED51
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 08:40:25 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-58ce8513da1so3333244eaf.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 08:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701189625; x=1701794425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmTesqK+F/QJOwGcug6iguQ/D1cpFRALPok0GTAiegc=;
        b=W6iio8H0DjYnScIKoSjJxxKpR6lzuR0bWtjfKpNAnwaySc27ItVi06kcA/sYM2/O4e
         qvnL/aK19jjR2v4dMfCzAwkbtV7zB90NLFHxo9ZqHgYAE8by+ylv/Yw9Muz9nKW8X8lA
         RWK1mF5L0MvPl8qLl9z0a1W0IZBUHwa81v7Z/rfSVjLEL7FZ0nhWMNQS4OcUbXb69Vyv
         tYAWhNaEGx/tJNTGOVKNN4sgGCfme8ikmF5vSteBLnjbdhcB6sjVoeS7ZKVIsFhDXD92
         02YOWomZ76COswgRhL9dRSkmRbi3VWUOzJFvue0Y8Yt8Zvv6Ax0mhJAuklWG1nXioXGw
         Voig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701189625; x=1701794425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmTesqK+F/QJOwGcug6iguQ/D1cpFRALPok0GTAiegc=;
        b=uWsLueo+EIq2IxBgI6Gd8R5IGRz8Xm45lxkryDFuheWz9C9/1iItyFeQ38POjdeulP
         Y58eGZhrKILAxy8P5rvpU23+KY4O+Ri8jSrbuTyON3tv72LTZV2uEDhH2BJB0SR431Ht
         3I1k99Coc0b6ZRYP3Suj8b7cmdX6IsRze83oVXIs8ylGVGng8XXIq6+DpFikeFaQtNPY
         Ada4XohAys1mnCK06eQg2eXh8mYGLwyt/DqBVpJegB9zNV6v591bKX4oWnJ7eOuSA0K7
         ZUGP2mJteOnJXv0FEdt7sTPpLHGm/zUw50fl5vgsx0mOCDOlKhqzf1xr3bbNTos1HGXS
         qCww==
X-Gm-Message-State: AOJu0Yxif7EaIFpGYFOpgxOZmmbAUecKdY8Nq36HHmV0e4ozVtnu4iTL
	p4vegCC2Ii2WhSxI820ODsuhXSeGuT9xHcz2zoctrQ==
X-Google-Smtp-Source: AGHT+IHXFi0CMJEmOBG0drT6Yl0cizFCRxptP85Y28ocOtyAbffCNU1ckrWUrQn8BzD9g8lJdqrDPCghi1L6+RVklQY=
X-Received: by 2002:a05:6358:9394:b0:16d:fe28:f8cc with SMTP id
 h20-20020a056358939400b0016dfe28f8ccmr17146875rwb.4.1701189624933; Tue, 28
 Nov 2023 08:40:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127193716.63143-1-brgl@bgdev.pl> <20231127193716.63143-2-brgl@bgdev.pl>
 <ZWYQmpe7UxnJW0_g@smile.fi.intel.com>
In-Reply-To: <ZWYQmpe7UxnJW0_g@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 Nov 2023 17:40:13 +0100
Message-ID: <CAMRc=MdJQLe-f_B5OqmV0t5R8Jy72iAesAnPV0E8K-tYcBE2Ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: use a mutex to protect the list of GPIO devices
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 5:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 27, 2023 at 08:37:16PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The global list of GPIO devices is never modified or accessed from
> > atomic context so it's fine to protect it using a mutex. Add a new
> > global lock dedicated to the gpio_devices list and use it whenever
> > accessing or modifying it.
> >
> > While at it: fold the sysfs registering of existing devices into
> > gpiolib.c and make gpio_devices static within its compilation unit.
>
> ...
>
> > +     scoped_guard(mutex, &gpio_devices_lock) {
>
> This is a lot of churn with this because of switching to RAII.
> Can the body be firstly moved to a helper?
>

But that would mean more churn. I don't get why you insist on
splitting these everytime. We're going from spinlock to a mutex so we
may as well use guards right away.

> > +             /*
> > +              * TODO: this allocates a Linux GPIO number base in the g=
lobal
> > +              * GPIO numberspace for this chip. In the long run we wan=
t to
> > +              * get *rid* of this numberspace and use only descriptors=
, but
> > +              * it may be a pipe dream. It will not happen before we g=
et rid
> > +              * of the sysfs interface anyways.
> > +              */
>
> ...
>
> >       list_for_each_entry(gdev, &gpio_devices, list)
> > +             if (index-- =3D=3D 0)
> >                       return gdev;
>
> I believe this is better with outer {}.
>

Right.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

