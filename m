Return-Path: <linux-gpio+bounces-3323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B04EA8552EB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 20:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3B4F1C21991
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 19:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C6513B796;
	Wed, 14 Feb 2024 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rxGPTV1C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E548613A860
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707937729; cv=none; b=GNXFP2W6tjQH91kEpdLr48Loo6wqbKQavTK0loe0HOCUHDPmHqzfXIrRU39CooJNJwNt1DIaXVW+m4Q4B3QL2lonXts25qed00mjvx4SBgA9uMcdjvpCm5ZqchBONpQFARH82l0hBcdKkX/YsuRbGuWvgMeJQQnmA1ZY3GpglE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707937729; c=relaxed/simple;
	bh=xpNEvbzGkpF0R/0F7+c38TH/3aQeLHhKoDQGGcjh+UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7YJkZwHWbPWdd/in0EgHkz6N1gnssc3rBhV5zv0ZRLWmr2DQOjdXX3NK1mehZjSpzf2P7tgmqVvG57tLgh3VxxW4F/9F0XRzJGl9K9Aoziq3/At+1CKwFA/4xIPNCmvJEQKdQs+jwNrgg7f5nnsav9tY7J7x34WAYYF80vZJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rxGPTV1C; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7d2e16b552dso3013558241.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 11:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707937724; x=1708542524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwUBPVEdz2Mb4xRgarDfSSvXTzOIX30z+lxdA48Cm8c=;
        b=rxGPTV1C1oLiHX25tURJbTvIyPw/YFIPlDqQdM/gWGvzahNor4iIH9U8mFDtqrChIg
         WPvUYKtF8GDGfNHgLSO7NBqRVYk43GhJojxGseM+VqbjY3MDVjTfd/N9oL22EhbbXwZZ
         HeFxnrBIFMv88ShtDKLogjLEFdJTNvBNY06KKxQtN0t4l5tb1yL4+N+8+OhsSleH4wpD
         pINonXo4X3Ss8aFMnUOQ7HAlcWW7dumjw5EN6ZMxI1Ww/W52gRGDQd3fy/GaIMiLelZr
         SdohFxo7OOYo+fgrUZR4ipxmURfUjAMmvtxYxq/QmgPbSY8Drtjksbjj/RLnu2+k+27T
         QBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707937724; x=1708542524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwUBPVEdz2Mb4xRgarDfSSvXTzOIX30z+lxdA48Cm8c=;
        b=TurXQQcTn0cBWeFFyirsCctaZmIzUOJzNDRuFHtmBVmvDBlHMNMKgzt3YwWnT1RVxi
         ieQnikZHoERWjQgPsWGn/eVLnqgBN+OXVpdwL5fqSNXGp/lcDca6g5T7AzPC4A6wwGBm
         rVLLbPFCwFOUoejkDqZYCb28rzZrQejYV+vFSZczaWiKjysGvznMo2te2UF+F4U8OpoQ
         DIgEvO3o3EZHSw7jQ/r49yogjSoLdTZgxD3mMf4EOaT6RCZdWMAu5uEjg8/kY7uz/YZN
         RfGTTyKF+aNlwnmjhWjQ8u+T67Rgr+uAn8hbiUAXBFQjYppBYHsS1DkKI9CmCbMnP1Qq
         xCZA==
X-Forwarded-Encrypted: i=1; AJvYcCXRRCvNDC0L8a/og5TR0y+w1qkKXnclQbzvVKfgjnesoUxHcY6piABaoTYSLbyTFDcfwPKQ8c+G583dnPKFJgb29v6FGS4sO/FxjA==
X-Gm-Message-State: AOJu0YxJVdnNrKWV/NpOXtEdAMIJFFq910Y48P3kSl+nVCwhXa5l96Tb
	UkwZAsoKiWbHHjRIn/FmGM9rt4KCOWJo0nEU7p44RSF2zyS6pJRhItHqHwm2UMJRQiqU0nTvRW2
	xFStJ+5CB+VGkExaDXAAvE0T2kVNfhe2FI2XtVQ==
X-Google-Smtp-Source: AGHT+IHt2zKg1Viq09Cw/ydSj98IJRF5zOxddaIryD7u0RWkJpb5yab6GTBs/iPGXEd3i8Uqs6NLJFMBKv6YMNGuY98=
X-Received: by 2002:a05:6102:f14:b0:46e:e716:aa0b with SMTP id
 v20-20020a0561020f1400b0046ee716aa0bmr2347721vss.11.1707937724757; Wed, 14
 Feb 2024 11:08:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214084419.6194-1-brgl@bgdev.pl> <4a08c610-c249-4b56-b09c-09e1fd07f723@paulmck-laptop>
In-Reply-To: <4a08c610-c249-4b56-b09c-09e1fd07f723@paulmck-laptop>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 20:08:33 +0100
Message-ID: <CAMRc=McXr_3OD6Uf+PKD-wLQfJKJSWes3fh_ZD9fnrPyF9GoSQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: fix SRCU bugs
To: paulmck@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 7:44=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Wed, Feb 14, 2024 at 09:44:15AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Here are four fixes to some bugs in recent SRCU changes. The first one =
fixes
> > an actual race condition. The other three just make lockdep happy.
>
> For 1/4-3/4:
>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
>
> For 4/4, you are playing with fire, but I will assume that you know what
> you are doing.  ;-)
>

Up until this rework, this gdev->chip pointer could go from under any
user at any point. Now we have this gpio_device wrapper that provides
an entry point to using the chip safely while protected by the SRCU
read lock. Anyone who is still accessing gpio_chip directly (and not
being the GPIO provider themselves) is asking for trouble. There's
however no point in spamming lockdep splats in this case. I may end up
adding a warning to these routines.

Unfortunately, it's hard to fix 15 years of technical debt. :(

Thanks for the Acks.
Bartosz

[snip]

