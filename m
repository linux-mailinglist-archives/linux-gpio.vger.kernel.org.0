Return-Path: <linux-gpio+bounces-1231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EDA80D00F
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 16:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47421281D48
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 15:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9804BAB6;
	Mon, 11 Dec 2023 15:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QlOhBv4L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AE8BD
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 07:49:55 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-464811e5b3cso2606702137.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 07:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702309795; x=1702914595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5y64Zp+ERI1oh1pcqRY1FFTDH8+W8uKRCc/u2Y0o0U=;
        b=QlOhBv4LCdEiqiiaM5E6HeAe4radrwZ29pGb2D1QeUPBy897txZ72iX2YYuPyOF1DU
         PH3ddCFpiUS+QnyfADzv9/hqNUrv0H6othIcLxCE5iVrzTiu+2oLvVgAEBOYaaYGLBNc
         KaIeAcx4hYzZvk5+zufc1ywZ8RDLLrs6xaNavoEXtovuJXE4d9PiLfyzCXJE7T5ei3rU
         +ZCpjgfI+naOws0M18WyrC8fKxzYOo4Rz3I5hkrZtVarAR1BpkOFir+rjU56SJiPAXtk
         +hi3Kkh2ypu6Xp9Tybbp6mcZbzFjiRSIYAT1o6vTDiipX53Sl6n6BRpTTKS8EALfSquU
         871Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309795; x=1702914595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5y64Zp+ERI1oh1pcqRY1FFTDH8+W8uKRCc/u2Y0o0U=;
        b=pKaj/ukX0LCuogDll244BAyp7tr8dIT3/2kCKhXeyPTUlJjHzPw1yXjb9l6agaF70T
         H9mTKxIIkuGhc3e1XDw+hWAdgvPzxq8TdyyKgK71W/a2hBenRpJsMj7oj+w5+4ikSqdG
         NGYXw145aAXWvfr9LUe41EquUq6ecTs69EN6NLWb/AS61X1A3uls2PK0dY02mJJgWZQz
         NYbO0wJVVIOMBXXqFtWwxwIjLkSWVELWxUuq+Ne6HHH8fNztbigY1NaSSFfIMKvhPfeT
         Ea5rmqz0mbh1dQ5aVoPKZNfATeOdMz+zZzljWrNvNg1ArGodcAihSpZrmet8AxgS6oMb
         72dw==
X-Gm-Message-State: AOJu0YzEj4CQ8B+xFjDFOXTo0Dxatli1reXIVnT1bu6VXGMYjYVyB/wv
	HnPW7L5y827PVlOINDm4okjhae4GtTxNH3+kEBmlsg==
X-Google-Smtp-Source: AGHT+IEob7Q3qCUgfiPBntDxHg4o/ZCy6HTBkYFLGOASkG+QFgTcyq9/nnLCcHr1TRcS7bJSPmGLiqrBnvlSQARxp0Y=
X-Received: by 2002:a05:6102:c0c:b0:464:7ee8:2fd7 with SMTP id
 x12-20020a0561020c0c00b004647ee82fd7mr4587159vss.32.1702309795035; Mon, 11
 Dec 2023 07:49:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZWFN8RVUy7Vx72CE@rigel> <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel> <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
 <ZXMgmhTioEQ78Xeq@orome.fritz.box> <CAMRc=MeB9noBavBRiuKZf_6iWZJY0+ZG=n+ddGOs+TVavvuEfQ@mail.gmail.com>
 <ZXNHG0yp9QVflLBG@orome.fritz.box> <CAMRc=Mfg0tYwmiNfTkX+aBJyZSk0TG-EXmnd=3R22wmT7q53Tw@mail.gmail.com>
 <ZXbqjY14ick-3YpW@orome.fritz.box>
In-Reply-To: <ZXbqjY14ick-3YpW@orome.fritz.box>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Dec 2023 16:49:43 +0100
Message-ID: <CAMRc=Mex=1jWD8OrU8PzkVjk2iCorv=2Kofjo0iD7CJEiBA_bw@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Thierry Reding <thierry.reding@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 11:55=E2=80=AFAM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Fri, Dec 08, 2023 at 07:30:36PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Dec 8, 2023 at 5:41=E2=80=AFPM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > >

[snip]

> > >
> > > Yeah, I2C CBUS already uses gpiod_set_value() in the same context as
> > > gpiod_direction_output()/gpiod_direction_input(), so it would've alre=
ady
> > > warned about a mismatch anyway. Doing a test-run with the regular
> > > direction accessors marked as might_sleep() should flush out any othe=
r
> > > abusers.
> > >
> > > Thierry
> >
> > We cannot possibly test all drivers out there but we can start out by
> > adding: `WARN_ON(in_atomic())` to the direction setters and getters
> > for the next release and then possibly switch to a full might_sleep()
> > if nobody complains?
>
> What's the harm in using might_sleep() right away? If there's a lot of
> problems we need to back out the change anyway, so whether we back out
> the WARN_ON() or the might_sleep() doesn't really make a difference.
>

No harm but it turns out that gpiod_direction_input() may also end up
calling into .set_config() (via gpio_set_bias()) so we have the same
problem without the _raw variant to bail us out. I don't want to
introduce it for a single legacy driver that is causing trouble.

Adding Aaro to Cc.

Aaro: do you still have the HW to test this driver? I understand the
need to disable interrupts during writing or reading data - when we
are driving the clock line. But do we also absolutely need to hold the
spinlock when setting the direction of the data line to input? Because
if we don't then we could modify the last remaining offender to not
set GPIO direction with a spinlock held and finally make
gpiod_direction_*() functions sleepable.

Bart

