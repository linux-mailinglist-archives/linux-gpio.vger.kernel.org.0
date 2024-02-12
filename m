Return-Path: <linux-gpio+bounces-3183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E307C85100F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 10:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F4A3B212EC
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 09:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EF217BBA;
	Mon, 12 Feb 2024 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nqQMA9iQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08015680
	for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707731601; cv=none; b=OY7ydpPlVILJ2tjmEAOkFx7JMLXIGhrdWhFcQS3xVBuRdSpPcfIlU2R4r2AilMcwicNsxep4oFltzhYsLnA0qFwV8byezON6f+mOVskCwAqztoFw0e4vbcW4PaRjJTLe95Yqa2x0qvHlLX0gVGkSGjflTO3epGqIKW+COwU/XNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707731601; c=relaxed/simple;
	bh=nus13uP2h13TaLzuZyHgqMURDq86XtXlluSv6CHhhHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuEniu0Om1+SYBvbRl7FQRdDQnVzLw956prc38LZTMZmy1KjjS+7/s1WRrO6Z9TayqiAKIYGAhQ+/eQ3uAAT5OGznFJTsuqZsYRssrBNBO88P7sSkZ32Ikx2O7EzjtRn3yz/XBNrrsomIARlfVNbg8raoGzHoQtr0nob/orWV4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nqQMA9iQ; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-46d2ef81f32so248470137.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 01:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707731598; x=1708336398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfkulGaUinwmqh3cPnf9KWHBA6cCTkzaIyl9HsKgL4Y=;
        b=nqQMA9iQbgpCuoPr2KTOY2v7mRsXYOrznYXAaYmvpb0p7VsHciDGqvUVNeBTfmChof
         1pfYtCwfhvsGNz89MRfR1Z8GE0YGjgtV8oa5m09Bp+cR04kCR/kXxxThPnhLDB7sSEqZ
         QoymQrIl9baTgF+sXt9axMdm3ypEpixbFI5deWo1/7QXoUFCKfBcCnYTDap5mAIrIXcI
         jn5PZ49EAMBAfMH11VpiFPH+RCShZ1XWUbFbZ2LCnZHoHDI6d+6B1kUy4LR0ItbSOtNO
         agAShNzipSP/54jDevDGvTxdpTKPCWHl2JDEsA1FRjQ41gVmZj5G5oqpTmOF4R/KMF8+
         NlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731598; x=1708336398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfkulGaUinwmqh3cPnf9KWHBA6cCTkzaIyl9HsKgL4Y=;
        b=Twn+VcO2lF+S83I1ysE24EMxJvwoo+zKPfQZF5eQQi5l7KGWFjyZf6sXChbnXzvSr+
         mOxj3V4HPezQBmmMhkBmgQAauL74/tM382ARXfZTneYbHBCVwdWTcKQDEIUJalXG8AM/
         SEw9j4WThDw4VnJNiUwjIFqJ+e0nDwrnEiXTD1J6IfNnMyK1eWanIKLYzfomZYQ44G3D
         n8DEoMR9Ds6p3jH1oZb0EUyrq22hZqxQtA3mJwA49svoPeUuzpVnl1GWiOpF8zFuq7Xa
         3z9K5sYb/ysLtgoDd52BFexIATbt22iKVUWGdmEbyVRqk5DEfb7vL5m6h2HoaDGbxgdo
         w5Pw==
X-Gm-Message-State: AOJu0YwypXGvEMg3vg7bBzEorWkghqJ+xUKh4MVnK1vvrL9usMkIDzny
	MoLicHXLZoee4EKjU/mLPKtf5tssR6KKOrRbmb5JArEIzW0BXqpP7TF2csvpUY+364h8j+WjBWt
	tj9zuEWv9E7Gc0CBgVRKnTyLRPxkyR8xst/5pBx+hmda4CAJ5
X-Google-Smtp-Source: AGHT+IG1PxIbzBo55spJqG87YjfeoT4Cwbz4KWAVswGzf6HdwI6mHeO65JSPby/65G2WRjVlweDFXZanwE6gae9WTvs=
X-Received: by 2002:a05:6102:3709:b0:46d:2500:b3f5 with SMTP id
 s9-20020a056102370900b0046d2500b3f5mr3314313vst.35.1707731598486; Mon, 12 Feb
 2024 01:53:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208095920.8035-1-brgl@bgdev.pl> <20240208095920.8035-24-brgl@bgdev.pl>
 <20240210053730.GA187163@rigel>
In-Reply-To: <20240210053730.GA187163@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Feb 2024 10:53:07 +0100
Message-ID: <CAMRc=Mcq2Obf58=iLHpm5B2_KkHCqRevFWupbBuKmNs_BV6i2g@mail.gmail.com>
Subject: Re: [PATCH v3 23/24] gpio: remove the RW semaphore from the GPIO device
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 6:37=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Feb 08, 2024 at 10:59:19AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > With all accesses to gdev->chip being protected with SRCU, we can now
> > remove the RW-semaphore specific to the character device which
> > fullfilled the same role up to this point.
> >
>
> fulfilled
>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/gpio/gpiolib-cdev.c | 1 -
> >  drivers/gpio/gpiolib.c      | 4 ----
> >  drivers/gpio/gpiolib.h      | 5 -----
> >  3 files changed, 10 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index ccdeed013f6b..9323b357df43 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -24,7 +24,6 @@
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/poll.h>
> >  #include <linux/rbtree.h>
> > -#include <linux/rwsem.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/timekeeping.h>
>
> Shouldn't this be part of the rwsem -> srcu switch in the previous
> patch?
>

That other patch was already huge. I figured this should be separate.

Bart

> Other than those nits, FWIW the series looks good to me.
>
> Cheers,
> Kent.

