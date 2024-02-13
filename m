Return-Path: <linux-gpio+bounces-3224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87344852A94
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 09:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A60E81C21892
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 08:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186CF179A6;
	Tue, 13 Feb 2024 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZwWm49vI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439E31865B
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 08:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707811865; cv=none; b=roSl4cgPxYAOtWXEGn1P6nOwDMN0Hycgt3PBcBalnygZydmP7/lcciaKYIq7cSvaq6i717IngISj5EJDkWuXNfgMLn560Nz1TDeTc/CysKdSlR+3PHIBZB4Awr+wQqoCXu0JnuzjarYljFrfbCLeBnJ6HMLOJMT8FI4mjL7uOMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707811865; c=relaxed/simple;
	bh=wSCAQBdMfTC+3MndVZbkwv4BtZJdwtzZ+Uis1k9VN7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHntsamIG870ysHED7daDuW2GMm1XKKRwfGfizSH3akevdppeyuP8ma2MNl3OfQiKfCgBHDa0B6igwZFjxnoF4IH1S1IV7fKdAwY1YWd19gkUXTxbSaY0X5I9xqDu5HbpuqnVPCM8iqo2ayu7vhzvnyfR1AjkMg5kQX33C/P8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZwWm49vI; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d5c2502ea2so1678924241.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 00:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707811863; x=1708416663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyx00npWeFsll5nwI/taY+6s7E/z5NPem7hxp9luVYI=;
        b=ZwWm49vIZS8z4ksySmHSXfVicTDTwBRgL2MO12IdFYCBn1If+SJBNLQvrLDoR/MjcQ
         5rMYm0Z8ZVUqgkvKhzMMOJafD4WJ2+6VFEpkqaPpOR8b23zZR2mJVC+Xk2RKT/8O4WQA
         tISIWG6jVAt2WBeDmVBboCs3Yg96GX0kJEfyyNbaQzkKlzVYGGuKI97TMddh6nEvboDv
         VbiUMqTLcrtUA3RTRWP60i2zLtCgdwEKODfEnNLRzaqIiGbblvxHQFOY6/MxJRX0GP4V
         pwCMkBk4vN3PrsuMVKQoFqn2alU1opzoW+dAcasd6umzt9f6XLybT5na+RZuVErknwji
         5YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707811863; x=1708416663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyx00npWeFsll5nwI/taY+6s7E/z5NPem7hxp9luVYI=;
        b=ROZDxtcG2q5Rthh4cVkgZNv6zSswLaoT9eJ8DLJMzw1+dKkKw1S8V6kcxmkbQ6gzOL
         rs1AhVur2ycPBE9TnnS50LWgD/8PVt75PIyyO4t6Jw1UWkwc8GHBUSYkqeHWpK/tEt9N
         eoTGHKTRoNS5cnIjP6IxCjV1d7MHPzxP6SWjMJOdDc9KaQoWFdNikg25Sr8dFqlEoGk/
         cgZvJdZvR5Y8rgqTLEj0P1ZjvlwFi/TGJK5JFPSyqrpBOmCAYtx0hVOxOHxdKQBQvCYG
         tieG9fN1Z6J5Ns9x91yAs/UkLLC5nV2sCCIYwEshkan4hmSyOE2gOLLI+EEa8rkjPPfW
         rPLw==
X-Gm-Message-State: AOJu0Yz0wVwaXHmSZhgtBiGaFD9uCaEbSP3qxtOvie3z17WvUm5pOKIo
	XxhKyWmB6estoWN/YhfxgWnfxA9VG1gb6OBUxAVvDAmM/G65MBg7cQ/S5uBwqBNwymqFN6TJv5m
	ZaRjJVCjmKewtAPwr6yKdp6pqyRJSyB+bO4P1Eg==
X-Google-Smtp-Source: AGHT+IGr0rY+BYn3KFPOnwH21/cIEVqFi5fSMMU1bOGVy5YdyOfJaSi6Db4qCj8odk6BvfgVKZLys2G4N+i1W6bMMBY=
X-Received: by 2002:a1f:dd84:0:b0:4c0:3cb3:446f with SMTP id
 u126-20020a1fdd84000000b004c03cb3446fmr5048576vkg.4.1707811863050; Tue, 13
 Feb 2024 00:11:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208095920.8035-23-brgl@bgdev.pl> <202402122234.d85cca9b-lkp@intel.com>
 <CAMRc=McrFqa-nS3L0qGZ+eCff79jWrEZLmg-OJiNw6+FQ44i+Q@mail.gmail.com>
In-Reply-To: <CAMRc=McrFqa-nS3L0qGZ+eCff79jWrEZLmg-OJiNw6+FQ44i+Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Feb 2024 09:10:52 +0100
Message-ID: <CAMRc=McLsY47oAk3GWp0Cecb=+fEtRKjJ_L3kyKkxYkEnwME7A@mail.gmail.com>
Subject: Re: [PATCH v3 22/24] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 10:20=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>

[snip]

> >
> >
> > [   76.432519][    T1] gpiochip_find_base_unlocked: found new base at 5=
12
> > [   76.434591][    T1]
> > [   76.435240][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [   76.436545][    T1] WARNING: suspicious RCU usage
> > [   76.437813][    T1] 6.8.0-rc1-00050-gc21131f83abc #1 Tainted: G     =
            N
> > [   76.439873][    T1] -----------------------------
> > [   76.441158][    T1] drivers/gpio/gpiolib.c:219 suspicious rcu_derefe=
rence_check() usage!
> > [   76.443364][    T1]

[snip]

>
> Paul,
>
> Could you help me out here? It seems that lockdep complains (with
> "suspicious RCU usage") whenever an RCU-protected pointer is passed to
> rcu_dereference() but is not actually dereferenced later - in which
> case switching to rcu_access_pointer() helps. But in the case of the
> of_unittests() it also emits the same warning for
> gpiod_direction_input() where gdev->chip is fetched with
> rcu_dereference() using CLASS(gpio_chip_guard) and later actually
> dereferenced by calling guard.gc->...
>
> Any hints as to what I'm doing wrong?
>
> Thanks,
> Bartosz

Seems like these can be silenced with rcu_dereference_protected() so
I'll use it for now.

Bart

