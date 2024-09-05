Return-Path: <linux-gpio+bounces-9855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B6C96DF47
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 18:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAFDD1F2495B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 16:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABAF19F489;
	Thu,  5 Sep 2024 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSveHvUg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAA219D897;
	Thu,  5 Sep 2024 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552723; cv=none; b=QKB/UNtH1IxvpeXKU/COqVTZTCXM1j8haOJPFKHKdx4jJnWi6SKVVcOF6tsYwolucKXDpKb9WC6RNd5h0dC32OqzBdOiKjsZVuh8jNHxdbjorjw0cJnCcj355U//tJFKF6G3hBWuA1x0RAEWRlmSG61qPSY0EmjtDMCm389/vCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552723; c=relaxed/simple;
	bh=1YZZNSXH1IBo6NKJ+TcdSOFdQvG4St+K6lHSoVlFijE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4NrvwMYNEg9bHjuX7/p2VdtkI7IXmil7vQVj79cSq2J6XHfXrDV5idIihREYDhGj+3dDawWdUANWtxBRL1UgUBVCvp7RZ8i7mTjy+HPnrUeyw4Lg7CIUZ62VpsS/RTGj46ppYNtEmIxffSm38o8mlkwAWxchoUvx6mCbRVI3FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSveHvUg; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so110514166b.0;
        Thu, 05 Sep 2024 09:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725552720; x=1726157520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZStCo9Z0L6xpXPpBGOupqFg4/qBOEPvT5gAaWi2kHk=;
        b=gSveHvUgmMzTfP0HD4L7pU3iKMtzpPt0O5wJx0jOb+Mh5a4bGFkLqMG5V2awW+OSWM
         Htk2CFOt9XQvg6Q0GXqKnHwLQwlqKUn2XMCOtMTk+x35t2Fum+sac4D+R25MRqMSIk1d
         llNQhn9L5UyWB/tQOQVTu2jpxLW1cyfk8oH6tU06zQovVLCkTrm/VYpzU392MzXy9HXE
         izFnGFxnBqqdPPfA+ZopeJVbpBFcc1WApjbN4MhIdEWJegzeh4ROA4glltmE+7h9FYj5
         5LVbK6MXjWe330T42OWDjhbhJtKX4MFc1Qtzdq6IoJ8A5cLovzIShiqq7JbdkT2w7pnw
         xAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725552720; x=1726157520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZStCo9Z0L6xpXPpBGOupqFg4/qBOEPvT5gAaWi2kHk=;
        b=nt7T0pVVshsbJjLVx9OlDtrkgSD2mJDTisa+CCAUwbKORLWcEz0ORQE9KEOx7Y1E2Y
         7NEstWqmWeUbwHPnHMl5+BuI/1d0Mik+15keNB7i5Djh0t0Wr1saVG26ZFTnZgMYFwZ4
         LrUhz3E9LC7+728BhU4CjoU5uRNzEPBFhvcOCnZ+aqyLW9gNo6bRmskxqo8XmBJWDp46
         GjrEzY3fujr5jf5/JqjVpc90buJRRiyyK7lnSJMC0MlZLsTyWsHKXBvVHMX46cnr9wy/
         PUa9yTdxiFOtaKduIks49Q66IeABrQmfugivxBl4fJPQo1BIGiXyIEpf3gccNt1wRKlH
         LqMA==
X-Forwarded-Encrypted: i=1; AJvYcCXTylVCvvlEFSQm5JicI1cMh2Z0efo8unl5MOViAnd10wxpT9+rUh7/xpSJy9+iLiyETiq0PQC1shJe@vger.kernel.org, AJvYcCXw+Guju76mf0Nj/JY1gXYzX2qeoNbFGg83VTSy8skgbvlkmXEZLF9z764TZlN86oGfIvb94E74uBflxtLW@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQ+yZF65+k6nPZ2YVX2y0ozm6Cls8KVVEdzKkjsnR+4kEwyX7
	tP55UsgoTH5rtzEv0KcF3zmFtgFGI6ebn0BMeKkC96HslxwQDD5YAllxOPkajtCo/xGsjwShfT0
	XZH7Rgk6sNaZ7oGiTojb0Koxh9BU=
X-Google-Smtp-Source: AGHT+IH4Mpwa46Zy9BYys/N16BR8ZmNMROw0jtCwh9yVgUb06XB5ZlTONs3/A4+GXiydMNy7VWFZFYQqS56oykxCigc=
X-Received: by 2002:a17:907:d92:b0:a86:a6ee:7d92 with SMTP id
 a640c23a62f3a-a8a430914a2mr673631866b.18.1725552719343; Thu, 05 Sep 2024
 09:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090743.1204593-1-andy.shevchenko@gmail.com>
 <172552177868.28435.4071190094207246356.b4-ty@linaro.org> <20240905130121.GA166185@rigel>
 <CAMRc=Mc=aK98ZYvz8AuwxYpqEPDAqG1kLcM+T24JipP6HW0L9A@mail.gmail.com>
In-Reply-To: <CAMRc=Mc=aK98ZYvz8AuwxYpqEPDAqG1kLcM+T24JipP6HW0L9A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Sep 2024 19:11:22 +0300
Message-ID: <CAHp75Vf7+_TZuLYJjv7+DLkAFLd2G0CwQ38XEqt1BN8UxVAf2w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: use !mem_is_zero() instead of
 memchr_inv(s, 0, n)
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 4:04=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Thu, Sep 5, 2024 at 3:01=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
> > On Thu, Sep 05, 2024 at 09:36:20AM +0200, Bartosz Golaszewski wrote:
> > > On Wed, 04 Sep 2024 12:07:43 +0300, Andy Shevchenko wrote:
> > > > Use the mem_is_zero() helper where possible.
> > >
> > > Applied, thanks!
> > >
> > > [1/1] gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n=
)
> > >       commit: b1da870ba36b3f525aee9be35b2f08a1feec61a7
> >
> > As per my other mail, mem_is_zero() is not defined in gpio/for-next yet=
.
> > So how does this work?
> >
> > If I build for-next I get:
> >
> > drivers/gpio/gpiolib-cdev.c: In function =E2=80=98gpio_v2_line_config_v=
alidate=E2=80=99:
> > drivers/gpio/gpiolib-cdev.c:1334:14: error: implicit declaration of fun=
ction =E2=80=98mem_is_zero=E2=80=99; did you mean =E2=80=98xa_is_zero=E2=80=
=99? [-Werror=3Dimplicit-function-declaration]
> >  1334 |         if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
> >       |              ^~~~~~~~~~~
> >       |              xa_is_zero
>
> Ah, it'll have to wait until the next release cycle then. Sorry for
> vacuuming patches too eagerly today. Dropping it.

Hmm... Somehow I missed that it appeared only on Aug 19 in Linux Next.

--=20
With Best Regards,
Andy Shevchenko

