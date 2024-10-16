Return-Path: <linux-gpio+bounces-11437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2709A06C5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 12:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 892D0B25245
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 10:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18AE206971;
	Wed, 16 Oct 2024 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KWGW3GNm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C440020606E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729073545; cv=none; b=d0c+vZLBnIoO03pRIrBSMJ6GWoxaaOCfXq2udoQWeZcxtp4lF53BZXo9wL1M0dX2Wl5W1syFrXxIXP6L0/bHP5IGv2ReLHyKkOEVG8wZ3ANcTkRz3/zLKLWeML1IesCuFpetp1MD4pP6HC4pkawx1ZqfxxsOGqQmkqhd+JGq6oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729073545; c=relaxed/simple;
	bh=zNrP9j9uVAG9nM7uuZ6C2wSdq5A+kxhs93370x0OZl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDKwc2PBgzbLOeH5GOk+Bde/4SNuJTdpuMxsYh2Kh5UxzCWAtk9O4+iYqd1iYwMaPCPa5D6TguNG1e0K/Tp+Ji0x1tEm12/ULalavc1d6R47UyBfAQ4NKRCEzyPt15Kd0Nub+AgfmI3oRC0HVTeBwTDgkn4cetBvpk4h7wvtAZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KWGW3GNm; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so6923171fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729073542; x=1729678342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2tDtQwvxm5ZzaqsJM6mS1tonN7kpGKQPVQymXD95Ns=;
        b=KWGW3GNmbIU3NNZDT6SJ3+WZfFP5u7aHprW8OhlMHuckqF2RIUXUY+sR+RDJdcwUFC
         Xccha0NrtvUJswcxxlw7E1J/hv1WxT/fL08ZwdwU0coXY84oNzNh7yh2hxgCGx1w1VA9
         4jIUHRulBykuK+3VM54XITtDvx5lvrM0GRdKyC02GV22yci/unAkejJJldH6SkIDNzpX
         yHsPHYR3EBoUE28eJRKdOWM9gEKhEjS5W9UGxkwGBrhXfiz+EKebjv2qcmter3uz8/ZG
         iFbid2bzI/5MfvozgxgPNF+DJKVKrR//9zR4GyQ33rXiM5pwc683yS+8qdXV8CM3umdb
         kFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729073542; x=1729678342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2tDtQwvxm5ZzaqsJM6mS1tonN7kpGKQPVQymXD95Ns=;
        b=O+TWtcHUAdlHwHQZzpB5fC973ehg0BODczuhMvdreBeN+8yJX68tKEsTnNKWMjriKA
         Yy8Hwx/X0UgJ3XQtop2OC7MMKD18PNw8CuMj5y5mW+KbQeKb4Dim4ZdWCtxUj7HKYNtU
         lMPaYbpJj51D3DY+YIPqU2ZF5TBLmuH5v7OYCes+/ZGMAHt7ZF0HgnmxtfI0QcFZCzvX
         +q9xFSWkBjjEsnWpF5iden8qGEtcZewRE/lT0oBxkmavs1EzAH6kvWZ2hnQlEV9hTqP/
         CNbroC1a2ufNW6x8NcStZ9FLMd9AfTzVpd4BPkXoT7dNqbx6ve6x40i+2jR+TpbDHMcL
         vASg==
X-Forwarded-Encrypted: i=1; AJvYcCVCZ6cUXQ8eKoZkWrdDHyH+VKTC0zLa7fsjtOjH928+JXxzpWRX7R0tjLGoKisUMsIkag7nUU2Pb/oq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzht1NiedD6vJkjTthGhj31LLoLvxg9+//RW/ShLdmlkgqCB26A
	f+K1p1ZRq9StCW8GbmDBfxZhffDqNANWqHg+lYQ0rV4LarDTliS0THcUDkJAX7UcMkI26m4EIkf
	EV+fnNjoWkUpVRfBuBcDthYz/mJ82MgdvURQ8Ww==
X-Google-Smtp-Source: AGHT+IF2f19nAIL1qtT1AzVtZQA8ogjWQ8uNBArnGNoX0+KP2m9opxEa1sZAL5I9xjviWoaZz7LAGr0/vu9wxIV9diQ=
X-Received: by 2002:a05:651c:98d:b0:2fa:d464:32d3 with SMTP id
 38308e7fff4ca-2fb61bb193amr11892801fa.20.1729073541734; Wed, 16 Oct 2024
 03:12:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel> <20241016072730.GA120095@rigel>
 <20241016083747.GB120095@rigel> <CAMRc=McR_eMizF6r30NqbgK4mE5ErzR=wbkD4O-Czn=+Oj4AXQ@mail.gmail.com>
 <20241016091714.GA207325@rigel> <CAMRc=MdoeyXwKuLmrmJ8zRCtVDNzEd34zgZ5Autye0TNv_OLhg@mail.gmail.com>
 <20241016094311.GA210746@rigel>
In-Reply-To: <20241016094311.GA210746@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Oct 2024 12:12:10 +0200
Message-ID: <CAMRc=Mefz=EBd6us-eK8kqk8zL0=LsEWUkP3JB7a0M7xcT8z8Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 11:43=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Wed, Oct 16, 2024 at 11:22:07AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 16, 2024 at 11:17=E2=80=AFAM Kent Gibson <warthog618@gmail.=
com> wrote:
> > >
> > > > >
> > > >
> > > > You mean, you get a CHANGED_CONFIG event but the debounce value is =
not
> > > > in the associated line info?
> > > >
> > >
> > > Correct.
> > >
> >
> > Ok, let me see.
> >
>
> When setting from userspace the issue is that linereq_set_config() settin=
g the
> direction will emit, quite possibly before the debounce has been set.  Th=
e
> edge_detector_setup() that does set it can also emit, though only if the
> hardware supports debounce.  And then there could be a race between the
> notifier being called and the period being set in the supinfo.
> (the set will probably win that one)
>
> Debounce set from the kernel side is going to be an issue as cdev
> catches and stores the value from userspace to report in the supinfo - th=
at
> isn't the case for kernel calls to gpiod_set_config().
>
> Seems moving the debounce value out of the desc and into cdev, which seem=
ed a
> good idea at the time, might come back and bite now if it is no longer
> restricted to being cdev specific.  Now there is an actual reason to
> store it in the desc :(.
>

I'm seeing commit:

commit 9344e34e7992fec95ce6210d95ac01437dd327ab
Author: Kent Gibson <warthog618@gmail.com>
Date:   Tue Dec 19 08:41:54 2023 +0800

    gpiolib: cdev: relocate debounce_period_us from struct gpio_desc

    Store the debounce period for a requested line locally, rather than in
    the debounce_period_us field in the gpiolib struct gpio_desc.

    Add a global tree of lines containing supplemental line information
    to make the debounce period available to be reported by the
    GPIO_V2_GET_LINEINFO_IOCTL and the line change notifier.

    Signed-off-by: Kent Gibson <warthog618@gmail.com>
    Reviewed-by: Andy Shevchenko <andy@kernel.org>
    Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

But it doesn't explain *why* we did this and I don't remember the
story behind this change.

How bad would it be to go back to storing the debounce setting in the
descriptor?

Bart

