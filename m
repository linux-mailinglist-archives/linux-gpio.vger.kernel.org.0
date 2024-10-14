Return-Path: <linux-gpio+bounces-11296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA7699C59A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 11:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ED66288B35
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6441F15539A;
	Mon, 14 Oct 2024 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EJKDG6UP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530214D428
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 09:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898041; cv=none; b=ngBiqmrnsitLLJ6KUwLHH+PTosglPxMlySvHqdSxv3eMWYdyQrrE+92Hm2nk7cAtLChwpCtN9kMGv8rvl/Hg7D1TukGufEzyZKjX3bKB++WVqtpFZY6oTa96lxUr0Ls1TaGPu8UuDxEqNXHSk7K+yoZEDmtEU7DfTlfvwH0PGio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898041; c=relaxed/simple;
	bh=RLtYvFRuk9lYiQ1rd0UFz8zzOi0ojdtc7BzzAYN0QkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7eAYbZm4bG533Wp0U4+gKT/NvHl9uYlA+r7tbGwFsBgRKF4eRAOA1GiegrGPPzw2MJyq219njoOkzEUuBYjEQyGqIOdx/7WZSHijVDJf86eAUEXSEVW7RK2/Q84GD+/F6/Uz84ImEjcyI7sO9T8oHAv+9lZnH1F0ceBNVM58RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EJKDG6UP; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so4582055e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 02:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728898037; x=1729502837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+TuNkmbXB+MqThBZZwfvpAIuzuM5X5n98y4VdOfpp0=;
        b=EJKDG6UPIUyB/29esQvQ9160qaUR5k+1KwpJ12rDiXcN5tRTQ++97/pZdFw4BIE56l
         Xm1lPkjUvrDyMx+gSjAQkBj4zXXlmR2cLdKfJfo09g/g7m0iZCoZ3cN4xknFnXD3EQMI
         NoynC65yonXyFRU6PyEUoSd/yq8c9u330waU7s96r8Yxl3cDlN1RLx/in9bDqvxa55IE
         b/zeY4nNto9PTGDO/j24c/R5axRxVdpfdyHEf0bdcT2ESU9g9weFbDZr6JqLqslTsvnK
         u9fPuEjqSnk+fGGMPjKi4uRh0kPgFPjX5QVuDxLBfZArAblScGPajQ6qTnuy/5rVeEQ+
         ePMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728898037; x=1729502837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+TuNkmbXB+MqThBZZwfvpAIuzuM5X5n98y4VdOfpp0=;
        b=G+1bcRpuzE0PCrNBwfQrCvfsldSrnRQyY05WC0PRnHS9YPqVRd+qehxLHbA6R2xnbO
         +tqUvY7rUNKm83/7nwBqU6WbU+fHBBHrtTorbLh+2DFIKIKguYV4xeDCpf3XSIsk8Aoz
         SO/laYxTRil/ML1ct11rDdSkT0qLEm69QYT7x2eOKoUSWF4UEJn5mcu6/sJv6Ma8+j2y
         5cH5tR3bAKVh82rqDpkr8JY9vc9yfTisp38ZDC6NhK1FPs3buYse4B94eo/xB8JZiQud
         KjZSeNc5usQVWgqiAWbkkfpTnFChqoPCt3BiMknjEukqQcgHa6LR3TrlwZN73Cli63R7
         XTlA==
X-Forwarded-Encrypted: i=1; AJvYcCX5+5rVWZK9khB4A24XHlRD5lFRHNAHAzu7LGSBtNI8G3SdJlrG7eUz1dR9aJzM11rk/zYuujL3pbyp@vger.kernel.org
X-Gm-Message-State: AOJu0YyEt2icZPzsTWR11AvmE6ia5QbIIATzSdROJrHnMqkpzJeeagp0
	fM4JWpB4IfYlmXsEw2VWKHmODIVX1uQBp3rp0g/dyS9OD83FWkd+hoXIZW0gH4Q+HUGwmzE152E
	FFx0fIjVJuafEq24eXkKLGHOjW9QZW0cZwigaqg==
X-Google-Smtp-Source: AGHT+IEQzPc/luiBKL2Q67RNmdhX7q7RpG7nNKQwF4RGkGFmyjOw6JwzgYAdv3hs1dqdu5nf3DAWvQN2dJo41lmq/CU=
X-Received: by 2002:a05:6512:3a8d:b0:52c:8979:9627 with SMTP id
 2adb3069b0e04-539da3b68eamr5416787e87.3.1728898037578; Mon, 14 Oct 2024
 02:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-5-b560411f7c59@linaro.org>
 <20241014021140.GC20620@rigel> <CAMRc=MeoSnr-z=fmfRoTU-vdL_BAkTAE+0HiBaVUWmFG-bOTPw@mail.gmail.com>
 <20241014092450.GA101913@rigel>
In-Reply-To: <20241014092450.GA101913@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 11:27:05 +0200
Message-ID: <CAMRc=Mdf8CLQDPL8RMyWPyx8362xS3jEBe4zM=JL_dzRgF5wow@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpiolib: switch the line state notifier to atomic
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:24=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Mon, Oct 14, 2024 at 09:48:16AM +0200, Bartosz Golaszewski wrote:
> > On Mon, Oct 14, 2024 at 4:11=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > > >
> > > > +     /*
> > > > +      * This is called from atomic context (with a spinlock taken =
by the
> > > > +      * atomic notifier chain). Any sleeping calls must be done ou=
tside of
> > > > +      * this function in process context of the dedicated workqueu=
e.
> > > > +      *
> > > > +      * Let's gather as much info as possible from the descriptor =
and
> > > > +      * postpone just the call to pinctrl_gpio_can_use_line() unti=
l the work
> > > > +      * is executed.
> > > > +      */
> > > > +
> > >
> > > Should be in patch 4?  You aren't otherwise changing that function he=
re.
> > >
> >
> > Until this patch, the comment isn't really true, so I figured it makes
> > more sense here.
> >
>
> So the validity of the comment depends on how the function is being calle=
d?
> Then perhaps you should reword it as well.
>

The validity of the comment depends on the type of the notifier used.
As long as it's a blocking notifier, it's called with a mutex taken -
it's process context. When we switch to the atomic notifier, this
function is now called with a spinlock taken, so it's considered
atomic.

Bart

