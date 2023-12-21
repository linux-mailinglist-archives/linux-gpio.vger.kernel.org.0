Return-Path: <linux-gpio+bounces-1791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EED1681BE7B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 19:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F8851F25785
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 18:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47BF64AA1;
	Thu, 21 Dec 2023 18:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ouzU/g0P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E922651B7
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 18:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4668d730033so129148137.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 10:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703184627; x=1703789427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOmKqIn6W7z+rgmBQ78sMx0aZEwQC8hdhsv42OVTCrs=;
        b=ouzU/g0PxDkJObI+xeDj58zkEPfto/ASbdxyXGldGSCuKwhSwJSbwHRZxalWbDgsDs
         LaV3SGtZSIPducWBbu0ujdGbkO9sX12Egxx+Q3ivEorOuGvj5QWD2tuMn8ZyimgHCnRJ
         MXqaTCGoDnu0l3XyuBwIbsymCr99GXHXrx3PBfy45WzSBE7K0OM80tn7UbqWcdcwg0jY
         /FskD8FoOTRaSGPoRJqTguorTSMx4vC9IR/zUYbtOwSSawRouyly6VaeWJGH9iSRzdzG
         +ICPRzL1cc9127QqGp16tGmbNKd7Nu+FkvmRmh6Mvk4KI9OgNSBZaFzovZ4NnuDxnpnu
         A7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703184627; x=1703789427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOmKqIn6W7z+rgmBQ78sMx0aZEwQC8hdhsv42OVTCrs=;
        b=etUHOxHwS9EbDW2z5ke3NFx9me7wiX+p/Fsaie/7Zy215QQNwPXyLzjMpbjKo114Sk
         6tm9CAHceZdlHNaQDw+KLEWZvfbqU8tgF9NljzCSMKhq4roBcUFC7ZWJnu1CSa/5WKhW
         Zj7HNxbyKhGeEq3JjnMHZ3doP93rR7Yy3XnWenUd5fQ+12Rox1+hj+7scok/KugVK/VT
         v8C5CidIXKXD2LLYuV3QT6yp2lTau5wQ6hVOSBwQH8KyYYHvboYSW0O0vd76QeHQvpf6
         lR019UPEiZRIdcew7myZLhJx69I2PP2Vizw/twF7Zeaja+r2pj1cy+Qvh/G07is2bm0P
         H8Gw==
X-Gm-Message-State: AOJu0YxX/ti8+/zmDD8i4Guet3aM33elKn+lLkKyqcI6WDlyLVL1sdCN
	SvfLAMMXLmiuG5rTnyAO8ooBNZu5jFUdIvnQM3A2jIG2rcFXAu4EjKAAX+EO
X-Google-Smtp-Source: AGHT+IGB9eH7AqDU9cHm9AMj/Tnxr1XNb7gPtn0K/98iDGAeQAx28mz/pD0u9r/6+qM8Ad3mQZA1iaPVZnKh8XVHcWM=
X-Received: by 2002:a1f:72cd:0:b0:4b6:c299:4a8f with SMTP id
 n196-20020a1f72cd000000b004b6c2994a8fmr75309vkc.5.1703184627299; Thu, 21 Dec
 2023 10:50:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219201102.41639-1-brgl@bgdev.pl> <ZYL0MWAQ-frYLnZq@smile.fi.intel.com>
 <CACRpkdZB-5DN5NYJNGheDJnNWRt8x4LwgOQpL4NDyX2JSn+_9g@mail.gmail.com>
 <CAMRc=MfLXxfzhKDc9e3jRF9mdVo=9UnC9O+i9s-uGm2pEa7vMg@mail.gmail.com>
 <ZYQ09RIq1R8xmn_k@smile.fi.intel.com> <CAMRc=MfYG09UUfqfuE89Or4HsP8QWUBJXCvuPPhe+vx0JiZF4w@mail.gmail.com>
 <ZYRkLfYnU3WZEWPa@smile.fi.intel.com>
In-Reply-To: <ZYRkLfYnU3WZEWPa@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Dec 2023 19:50:16 +0100
Message-ID: <CAMRc=MfFRZJUT_Cq=x73gj71x2PFFrV1x9GL+PiEOX_KxQZkiQ@mail.gmail.com>
Subject: Re: [RFC PATCH] gpiolib: remove extra_checks
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 5:13=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 21, 2023 at 02:00:39PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Dec 21, 2023 at 1:52=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Dec 21, 2023 at 10:26:03AM +0100, Bartosz Golaszewski wrote:
> > > > On Wed, Dec 20, 2023 at 4:28=E2=80=AFPM Linus Walleij <linus.wallei=
j@linaro.org> wrote:
>
> ...
>
> > > > Defining DEBUG makes sense to
> > > > enable dev_dbg() messages.
> > >
> > > Exactly!
> > >
> > > > CONFIG_DEBUG_GPIO is used by one driver
> > >
> > > By all drivers which are using pr_debug() / dev_dbg().
> > > I am using it a lot in my development process (actually I have it ena=
bled
> > > in all my kernel configurations).
> >
> > I'm not saying we should remove it. It'll stay defined in the Makefile
> > and remain seamless for debug messages. I just want to get rid of that
> > ugly extra_checks variable which has very little impact.
>
> I agree that extra_checks is unusual (or as Linus put it "non-standard")
> thingy. And I agree that removal is for good.
>
> My question here solely about that WARN_ON(). Do we need it always be ena=
bled
> or not?
>

I think it makes sense. If you're freeing a non-requested descriptor
then you clearly are doing something wrong and the system should yell.

Bart

> > > > to enable code that can lead to undefined behavior (should it maybe=
 be
> > > > #if 0?).
> > >
> > > I don't know what you are talking about here.
> >
> > I'm talking about drivers/gpio/gpio-tps65219.c and its usage of
> > CONFIG_DEBUG_GPIO.
>
> Oh, that one should probably be
>
> #if 0
>         ...
> #endif
>
> or
>
>         if (0) {
>                 ...
>         }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

