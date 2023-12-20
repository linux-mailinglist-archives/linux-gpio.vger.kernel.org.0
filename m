Return-Path: <linux-gpio+bounces-1723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC3819F0D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 13:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 994AA1C229EA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 12:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EC922335;
	Wed, 20 Dec 2023 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BGMdeU1G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C54124B26
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 12:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7c5cb5eeab1so1676121241.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 04:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703075469; x=1703680269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Smv/oTS6xzj2r1xVgNmv4h0iEnVC3n6WF5A+ikrNt/U=;
        b=BGMdeU1GCRaLaHpCCpa1ZUJFyq5T6WSc2vaC05G9jpPPAe2M6QDZkgMbwj60+MeS0u
         2q1B17zj+UwrW5s9ZJXuXaCnugYb6unkZelzI4tl9HLEI9JVOyTd7gdCexbC56YdzEYA
         rcf363FOe0lJEY4CRegBniQaTBsls4hjoFn/kJv+dFT0EXE3/dTcdj3xHhwaP1wncbMb
         LFl3y6EjCBDObMPz6T9iHkqxYC73usIe781r21JwidJoAFlAXMGiLbNZYAA+lMZyGXnf
         QZuQzHooHrF5ORzpN9tgPw8X4i3kJnS/Q24t30LirixWqS5uTrmz1RFM5kND8RtSX/Ta
         HEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703075469; x=1703680269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Smv/oTS6xzj2r1xVgNmv4h0iEnVC3n6WF5A+ikrNt/U=;
        b=rX23qJkeFI/Phl6Q3EaC1fqZU1nROXbYGhKKwvBVbFxQ/3x7rOrk14iZFeQrcbii7Q
         2Z+ogNjzEXa2slEXFtMEFnYPCywA08DKcxklRcJJnRT9SC1n/p/JbmS/A/hTXWpUv0tq
         VAEzjJIAco/8iQyALmPDR3opnNl1opHFlRe9n6DKx7iMP5xgpdNpjMsq/NqxR2sFSfCl
         IhhN7AQyCa54LTbc6qZ/lok1g715NNmsWDQKjVnbKbX3grk8yd+u8a2IurjKk6xY2m/4
         L1IXDQo35Qunl7hJ+fqJZg7f+Hx14Km2kygducJmUtOgeEqRqAnjJiYnxjHIpakhjYx5
         3jDw==
X-Gm-Message-State: AOJu0YxkTdimYiHONa4PXkbDFCdEusiDWv9dveC//kz7/tqhGqK8/a06
	On62HSJUOuNYPrY0Dwu7G+BsF6yWr7nP7HkP/hJEsQ==
X-Google-Smtp-Source: AGHT+IH2DZCGTlQXI5cZ4QPy8WihDWRKCqB7n5/TtStgkQgUvn/KoP2I/HQCJExUS8Hn1x0yzv7IgjuEs7AoVmXQEVI=
X-Received: by 2002:a05:6102:559e:b0:466:a1a2:55a4 with SMTP id
 dc30-20020a056102559e00b00466a1a255a4mr3179934vsb.9.1703075468746; Wed, 20
 Dec 2023 04:31:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220015106.16732-1-warthog618@gmail.com> <20231220015106.16732-5-warthog618@gmail.com>
 <CACRpkdZ5HzOxtbexQNE-A-bKhiUW1nHjvJQA_CCnmVXf+R6dbg@mail.gmail.com>
 <CAMRc=MfvKzOxPrmz1wmgWMwYUbNhWAjqoKOmcaggQntcDprLmQ@mail.gmail.com>
 <ZYLaayENrvL1Nh6H@rigel> <CAMRc=MfyCBpZ07SYfxMtug6FVYiKA0MRgvjMTOAzKiVLGdPM+w@mail.gmail.com>
 <ZYLczeiVDjd2cWQF@rigel>
In-Reply-To: <ZYLczeiVDjd2cWQF@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Dec 2023 13:30:57 +0100
Message-ID: <CAMRc=MeXa5g6iQNYF4W+vGL+kgRTyVjFB-yXE_UBpuTnn2ZKng@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpiolib: cdev: replace locking wrappers for
 gpio_device with guards
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 1:23=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Dec 20, 2023 at 01:16:00PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Dec 20, 2023 at 1:13=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Wed, Dec 20, 2023 at 01:05:35PM +0100, Bartosz Golaszewski wrote:
> > > > On Wed, Dec 20, 2023 at 12:56=E2=80=AFPM Linus Walleij <linus.walle=
ij@linaro.org> wrote:
> > > > >
> > > > > (+PeterZ)
> > > > >
> > > > > On Wed, Dec 20, 2023 at 2:52=E2=80=AFAM Kent Gibson <warthog618@g=
mail.com> wrote:
> > > > >
> > > > > > Replace the wrapping functions that inhibit removal of the gpio=
_device
> > > > > > with equivalent guard macros.
> > > > > >
> > > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > (...)
> > > > > > +DEFINE_CLASS(_read_sem_guard,
> > > > > > +            struct rw_semaphore *,
> > > > > > +            up_read(_T),
> > > > > > +            ({
> > > > > > +               down_read(sem);
> > > > > > +               sem;
> > > > > > +            }),
> > > > > > +            struct rw_semaphore *sem);
> > > > >
> > > > > Isn't this so generic that it should be in <linux/cleanup.h>?
> > > > >
> > > > > Otherwise all the patches look good to me.
> > > > >
> > > >
> > > > We already have this:
> > > >
> > > > DEFINE_GUARD(rwsem_read, struct rw_semaphore *, down_read(_T), up_r=
ead(_T))
> > > > DEFINE_GUARD(rwsem_write, struct rw_semaphore *, down_write(_T), up=
_write(_T))
> > > >
> > > > DEFINE_FREE(up_read, struct rw_semaphore *, if (_T) up_read(_T))
> > > > DEFINE_FREE(up_write, struct rw_semaphore *, if (_T) up_write(_T))
> > > >
> > >
> > > Ah - in rwsem.h - I missed that.
> > >
> > > > This can surely be used here, right?
> > > >
> > >
> > > Don't see why not.
> > >
> > > I would still like to move the gpio_device specific macros to gpiolib=
.h,
> > > as they apply to the struct gpio_device defined there.
> >
> > Which ones? Because I'd rather use guard(rwsem_read)(&gdev->sem); than
> > some custom wrapper as this one's purpose is clearer.
> >
>
> It would be read and write guards for the gpio_device.
> cdev would only be using the read flavour.
> And possibly named something other than read/write as the purpose is to
> prevent (read) or allow (write) object removal.
>
> I though that would be clearer than having to reference gpiolib.h to see
> what gdev->sem covers, and allow you to change the locking
> mechanism later and not have to update cdev.
>

I still prefer open-coded guards here for clarity. I hope that with
SRCU in gpiolib.c, we'll get rid of locking in cdev entirely anyway.

Bart

> Cheers,
> Kent.
>

