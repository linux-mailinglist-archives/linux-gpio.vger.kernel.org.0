Return-Path: <linux-gpio+bounces-1720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EC7819ED6
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 13:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BFCEB2618A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 12:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EB522320;
	Wed, 20 Dec 2023 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I4vF9Gjh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BEC22307
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-46692558657so832217137.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 04:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703074571; x=1703679371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeO6iJYH/BlL7HMTey5lm079xrGQ9yeg7knsXJCVjCw=;
        b=I4vF9Gjh8zrxvBHmAQl8mrGSfb2PpwRmDWWjp4xrcYyKZYZYMDxCLiwCGeLjAB7Od6
         ugUx7OJkUDyjC6Q7ZaBpWu7pQWWT3Ee18V0bFUMgE1mNvPAjzqeszWSQNP/VJ+hxn5SC
         6YMKigtAjqQ/ja0L+peLQXuPMh3gA441JW3gl6lbDCdkFspInXuq5O2TgbfnGiM/speI
         43iWkhULteuMk80jG8HcS4W+mcq9a3tYTGj3rM/jVB92NM2TLzsjQ3qWPD+pA5mGqwLV
         wod8ltjFHWTFhl2U0c/RcrbhV4Dik1Lj1LGgfGqqcElp0If1Qbo2TiBnOugJVqYWNvQo
         YtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703074571; x=1703679371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeO6iJYH/BlL7HMTey5lm079xrGQ9yeg7knsXJCVjCw=;
        b=uZrWiViSHWqHZxKO6rjmA2+oK+JRciUtjz8Pr4Gk/3rZjizAMTDWMx40aUiDw3Cl4v
         Vh8PFpP2eRp11p2eUJ6Zl2c4qXHXYCYA6pvlaWS7CU9sJ7kEUbAv0B70AiP0DFRhTxVr
         HZS7Xunpq29OWHLWo6ZBB0PRSk586cW2xj1dwI8RVLBeix56x04WF7ZsNbybUlu7Y1HK
         E+eEWp7x2qn9ycxyP4yOEHKwpKlUUIrnwUxalGutUooUP2MqdfQbhMhkHkDMZ5xoHeZ8
         3i4/5G6pfJebPs/hYuVgoLcyZwJAJqEYB5EMfgECyHf4e4hV4u6Iogn5Bf2+NxnKO/VG
         HB/w==
X-Gm-Message-State: AOJu0YzrE2BfZfGTF+rvN1jq/Oiosi/jzxu9jybdFXGp7wIjULmJiF1/
	lmR/3QK76rfwXKEge/iKDzc+Xnp0U4RzauBAMthuWw==
X-Google-Smtp-Source: AGHT+IHX5RL2vAymeh1Wqp+tfTMsJ81EMk2fRMCpI1Ly/3KctxYbW28janOyeZOaaPdQfAUJ3vSGOo3fuptAC9/MLdA=
X-Received: by 2002:a05:6102:3f46:b0:464:89e8:a362 with SMTP id
 l6-20020a0561023f4600b0046489e8a362mr15657307vsv.26.1703074570870; Wed, 20
 Dec 2023 04:16:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220015106.16732-1-warthog618@gmail.com> <20231220015106.16732-5-warthog618@gmail.com>
 <CACRpkdZ5HzOxtbexQNE-A-bKhiUW1nHjvJQA_CCnmVXf+R6dbg@mail.gmail.com>
 <CAMRc=MfvKzOxPrmz1wmgWMwYUbNhWAjqoKOmcaggQntcDprLmQ@mail.gmail.com> <ZYLaayENrvL1Nh6H@rigel>
In-Reply-To: <ZYLaayENrvL1Nh6H@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Dec 2023 13:16:00 +0100
Message-ID: <CAMRc=MfyCBpZ07SYfxMtug6FVYiKA0MRgvjMTOAzKiVLGdPM+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpiolib: cdev: replace locking wrappers for
 gpio_device with guards
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 1:13=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Dec 20, 2023 at 01:05:35PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Dec 20, 2023 at 12:56=E2=80=AFPM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
> > >
> > > (+PeterZ)
> > >
> > > On Wed, Dec 20, 2023 at 2:52=E2=80=AFAM Kent Gibson <warthog618@gmail=
.com> wrote:
> > >
> > > > Replace the wrapping functions that inhibit removal of the gpio_dev=
ice
> > > > with equivalent guard macros.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > (...)
> > > > +DEFINE_CLASS(_read_sem_guard,
> > > > +            struct rw_semaphore *,
> > > > +            up_read(_T),
> > > > +            ({
> > > > +               down_read(sem);
> > > > +               sem;
> > > > +            }),
> > > > +            struct rw_semaphore *sem);
> > >
> > > Isn't this so generic that it should be in <linux/cleanup.h>?
> > >
> > > Otherwise all the patches look good to me.
> > >
> >
> > We already have this:
> >
> > DEFINE_GUARD(rwsem_read, struct rw_semaphore *, down_read(_T), up_read(=
_T))
> > DEFINE_GUARD(rwsem_write, struct rw_semaphore *, down_write(_T), up_wri=
te(_T))
> >
> > DEFINE_FREE(up_read, struct rw_semaphore *, if (_T) up_read(_T))
> > DEFINE_FREE(up_write, struct rw_semaphore *, if (_T) up_write(_T))
> >
>
> Ah - in rwsem.h - I missed that.
>
> > This can surely be used here, right?
> >
>
> Don't see why not.
>
> I would still like to move the gpio_device specific macros to gpiolib.h,
> as they apply to the struct gpio_device defined there.

Which ones? Because I'd rather use guard(rwsem_read)(&gdev->sem); than
some custom wrapper as this one's purpose is clearer.

Bart

> The naming probably needs some reworking, so open to suggestions on
> that.
>
> Cheers,
> Kent.

