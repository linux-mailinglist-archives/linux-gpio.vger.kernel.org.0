Return-Path: <linux-gpio+bounces-1131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E603580AC83
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 19:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BE621F2126A
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 18:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38F941C70;
	Fri,  8 Dec 2023 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LllUZrFc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BF9E0
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 10:54:52 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-464889ff296so553939137.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 10:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702061691; x=1702666491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgermj6ROz4XCkmqRVYqza5P0xh3ZuE8ngng0y+XB5M=;
        b=LllUZrFcOioXr+gxfRa6Hwfrf89e3xUhE2BALsOibqBenYdoZxpPIyOfVxJhBpxDmK
         kCagVpElCnWtqjQVzSt+bOb2ERF1nS/kRyzxgDCBwUMx4yBpLHiGaA7jWmnmFNz+WKIV
         I6ojBAHv8HvOW1n3S7F3EA/bn/iSQtA09OUUiWlrHgGVexuRBTKSkbB6cVx9WebyE7wI
         eo1iSgC5qdd9WpsupSzl5CawIzwty9b3/9vOHzwOuqqPcNT5r5fSmzAk0yGNR/udYIx4
         OCJpZ2OrIy/5tSJR9cK/bSHihvfoGnFUtMzonaMwD+ct+GpHWAUktlZm/hNzYyCKEPDk
         D56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702061691; x=1702666491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgermj6ROz4XCkmqRVYqza5P0xh3ZuE8ngng0y+XB5M=;
        b=QALnr4J5S1SgWowNaGwJ397KDQD5J3UUBXAp2Se5T0k4OXJdSSbtzOg6OBtaQXlHQ3
         ejRd4FLWtpMM6JXFMI42RACYXhHMtVPBy78YnVH/Q6P22DM3nksjSQLFuQ/JYmT5Ih+h
         q/uSEZPgwMLVnf/PTbgP2+RyD7fLrrqa6c8VkrDkdq+od8B7++JgeHTUTKSO4EdKi5p/
         5ArSabsrKETYU9/da2jS49ok4vn70T7gkWndOOINNF4iHVLR9YcPWqqvHlGXG7N5WYGx
         QzB3Mwe3rLJOCSiDjbxfDo003JV2+91SXYLbfJLJmbMmi316x+1IHx9shltDQOs7YRKo
         6aXw==
X-Gm-Message-State: AOJu0Yxq50VQphg5Ms1ysXcXXernDSoC9yGnUPykM5uEfhIPUiP0l9+V
	NcD4Gv/v0ZcS7Go7vgxpxcqblBzORpvAKaY1TJ1IxQ==
X-Google-Smtp-Source: AGHT+IH0XQdmonnNPq2CcEHxyBQhIEDX9Hgx+/1eMB/jJCOAFaX2zSnPwuMtIuDYCLvu4i/vE18swH2ekkijrOJrnvI=
X-Received: by 2002:a05:6102:3f4a:b0:464:92fe:4233 with SMTP id
 l10-20020a0561023f4a00b0046492fe4233mr506742vsv.35.1702061691237; Fri, 08 Dec
 2023 10:54:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel> <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel> <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <ZXJq2zGjBT0yQAXv@rigel> <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
 <ZXLWHTjv9W-IH_OP@rigel> <CAMRc=MfXQb=A=4f0kFEW4ENuNk0ZmL_qAkWihEvFcYaizCf8LA@mail.gmail.com>
 <ZXLvfBWTAGZt0f0L@rigel>
In-Reply-To: <ZXLvfBWTAGZt0f0L@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 8 Dec 2023 19:54:40 +0100
Message-ID: <CAMRc=MdhcYToMixdFh6Kf+GZ_MhDeHxd5_2U00neLGoH2M_P9Q@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 11:27=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, Dec 08, 2023 at 10:52:09AM +0100, Bartosz Golaszewski wrote:
> > On Fri, Dec 8, 2023 at 9:38=E2=80=AFAM Kent Gibson <warthog618@gmail.co=
m> wrote:
> > >
> > > On Fri, Dec 08, 2023 at 09:13:17AM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Dec 8, 2023 at 2:01=E2=80=AFAM Kent Gibson <warthog618@gmai=
l.com> wrote:
> > > > >
> > > > > On Thu, Dec 07, 2023 at 07:37:54PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > On Tue, Nov 28, 2023 at 11:47=E2=80=AFAM Bartosz Golaszewski <b=
rgl@bgdev.pl> wrote:
> > > > > > >
> > > > > >
> > > > > > [snip]
> > > >
> > >
> > > Yeah, no need to risk other GPIO users messing with it if it is only =
there
> > > for cdev.
> > > Want me to take a look at it or are you happy to take care of it?
> > >
> >
> > If you'll find the time to do it in the following days then sure, go
> > ahead, otherwise, I'll have some pare cycles today and next week to
> > spend on it.
> >
>
> It would probably take me longer than that to context switch, so go for
> it.
>

Well I went for it and it turns out to be quite tricky. We have
linereq and gpio_chardev_data that have independent lifetimes and the
only resource they share is the gpio_device and - by extension - gpio
descriptors . If we want to store some additional data locally within
the context of gpiolib-cdev.c then I see the following options:

1. Global radix_tree containing additional configuration
(debounce_period_us for now) looked up by the descriptor's address.
Lookup can be done locklessly using RCU and from atomic context
(interrupt handlers in cdev code).

2. Reference counted wrapper around descriptors. It would look something li=
ke:

struct gpio_cdev_desc {
    struct kref ref;
    struct gpio_desc *desc;
    unsigned int debounce_period_us;
};

And then struct gpio_chardev_data would store an array of pointers to
this wrapper while struct line would store a pointer to it instead of
directly referencing struct gpio_desc.

Any other ideas?

Bart

> Cheers,
> Kent.
>

