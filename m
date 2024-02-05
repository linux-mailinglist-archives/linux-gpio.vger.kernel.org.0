Return-Path: <linux-gpio+bounces-2976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 969EE849C12
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 14:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA57C1C23A2F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 13:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773101D6AE;
	Mon,  5 Feb 2024 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m0x5ueIm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA60624A03
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707140394; cv=none; b=gg2DxHzZUGH27c251pmtshqZGJJL5Kvy0e7qIHAuyluPDEo4CWjvjd4KX34/aD2L5dDpUUTjhtQ9fotlOhNpu/wMO9ArDE6xsZYp6a98qUhz0XieTIRz+MGp0lGaRtTBU5q/oJ9cuDq1pcDvFHBEVJeszfWPKHdsuK//yOAHiIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707140394; c=relaxed/simple;
	bh=E1fJfdB8CjB0DIy+QKlUXOl+wySLvvDWfrhX8O7oy/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kN9ycxWtvxa9ajYaDoH34BELom4I5OIHIUE6klcGNhgZjs+OkxOUBBfyuEKJk5iuIkrRJvAT/YsOfziv31qdOcTxB47Vnhb8GzmDLLQnGsESPm08nZb4wO6h0kdo6oFhDYdklLT6NN2gugVTP2iKb1byxe3OzaopvewojfTflzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m0x5ueIm; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-46d239a4655so177293137.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 05:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707140391; x=1707745191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9s94OzYLKOZpekLAFb3zLDMjbd7XdgLc/vdftPx6uo=;
        b=m0x5ueImDmLeipQilrBLAh6tr17/3EOCTlPJ5UfP87E22eFc0Z8Lr2/+YSwPY0tbP0
         8aPKLMx0nzyiHO4pCmTLB0T8Q8LjIPFeu2zzmEKyCFYSKg5A5/YLvd/QXcamiwAqR1DL
         oYDtchVrAHSJzAfW5yTHLS+czyrluPXmOkBfNFuYWudsT3djskwCJrMAdJjO6oyz0h7Y
         c8ZNyI7Q2nao1ZbzyYhcQ2g2u8Wu3v9ihCi/FPB2UdYKEtJhLmzS5wUYw9cGI12zxGz8
         qIt2knjMypYzwvUY/LMlL01ku8Z2SJU4dOd6RqLPOyksxeELOGYgUexN9LpaoC1U9Oi4
         JnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707140391; x=1707745191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9s94OzYLKOZpekLAFb3zLDMjbd7XdgLc/vdftPx6uo=;
        b=jgqPtGZ1Iv0YVdjHwUmufGIEWmTzUwECbhfl0QM09V6MqxV3SMkPpy0f1MijxyGdV2
         YjgDMHV6TRZ5Mzi46yZGmj3/vsXF3a3fJXg2hpvXoMgm5HCWMgh9GcQtvh9kUHBqUFEA
         N8t9v9N4uqcjCjyDg9QKkp9lFwcCdPEy/LY9BXi4jSOsI7wjyYyepXy+gK8lbJoJ8scb
         a8Q3BJqQoHtCCGOkV5jSF7wSI95Wu2UyhcCoFh7ly4BedWYdZnwKnYhw3iSfYeJULUad
         fq1YrlZIW+xOM1GzCzJk3GZnaEwpCuKHDHvhFRoMPY6G+WXIbw+8n2ptX+DvcJUTEglC
         fEIA==
X-Gm-Message-State: AOJu0YxUbgmyzVUPjEUh3Xjv4j2qpaCsIKOEGikFY6BpvJLP4q5ZjTLQ
	HPLcQON9QVzTIRK/Akvz2xsJyxleyR8xHComlRNgEtE1A4wf0AvdoF+5uxcuqZh+gqpWLqXe27u
	MIPwGqRdP7iJkVL7gYdTMyP5OPVlmopkK2O4O4w==
X-Google-Smtp-Source: AGHT+IGgnn7xYNjdQ7tyPTGkeNKsQo94aRc1DIhIuoMa59byy25qCsHF9VeDV1ZtGjCVy5BtAZ76w5NyhoFqIc7HreM=
X-Received: by 2002:a67:b345:0:b0:46d:fb6:648e with SMTP id
 b5-20020a67b345000000b0046d0fb6648emr6048400vsm.8.1707140391612; Mon, 05 Feb
 2024 05:39:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205093418.39755-1-brgl@bgdev.pl> <20240205093418.39755-9-brgl@bgdev.pl>
 <ZcDSKYqFHSUZb2Qx@smile.fi.intel.com> <CAMRc=Mfh5CcftXUStGOXvUF-s3aNxnaNM0sDt72LKrBfttqitQ@mail.gmail.com>
 <ZcDkvOrlSRkmYIk_@smile.fi.intel.com>
In-Reply-To: <ZcDkvOrlSRkmYIk_@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 Feb 2024 14:39:40 +0100
Message-ID: <CAMRc=MeiXLZ4q8MH5h_wX1rBz9-YVK6UKUdCu2nTb6+uNHGXPQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/23] gpio: sysfs: use gpio_device_find() to iterate
 over existing devices
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 2:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 05, 2024 at 02:19:10PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Feb 5, 2024 at 1:36=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Feb 05, 2024 at 10:34:03AM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > With the list of GPIO devices now protected with SRCU we can use
> > > > gpio_device_find() to traverse it from sysfs.
>
> ...
>
> > > > +static int gpiofind_sysfs_register(struct gpio_chip *gc, void *dat=
a)
> > > > +{
> > > > +     struct gpio_device *gdev =3D gc->gpiodev;
> > > > +     int ret;
> > > > +
> > > > +     if (gdev->mockdev)
> > > > +             return 0;
> > > > +
> > > > +     ret =3D gpiochip_sysfs_register(gdev);
> > > > +     if (ret)
> > > > +             chip_err(gc, "failed to register the sysfs entry: %d\=
n", ret);
> > >
> > > > +     return 0;
> > >
> > > ???
>
> What the point of function to be int if you effectively ignore this by al=
ways
> returning 0?
>

Because the signature of the callback expects an int to be returned?

Bart

> > Not sure what the ... and ??? mean? The commit message should have
> > read "... traverse it from gpiofind_sysfs_register()" I agree but the
> > latter?
>
> I didn't realize this may not be obvious :-(.
>
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

