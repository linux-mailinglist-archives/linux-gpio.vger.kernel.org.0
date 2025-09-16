Return-Path: <linux-gpio+bounces-26200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 206B8B59272
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 11:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D526C322D1C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 09:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C09286890;
	Tue, 16 Sep 2025 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gpj/jgnS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04F51E47B7
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015591; cv=none; b=s1JbMdshgy5/RffQ/7YDujvH4nLhtCuRqq7YAH7gwgsCFuQZjLdZth9Oi+9ko8zdnLg5bMaOudsixWadOQSr+AdsQyq2CCVN0i5BxQ0hqhvk/TzWfxAc/HKTI72l98vANGhmWwQ7Bqw1VIlCJ9iLZt5UL3pCcMpBbK/yCWanvck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015591; c=relaxed/simple;
	bh=3C05t/SFIsxlDuFaUH9wDfDGlgU5QSobZjBiTswkSbQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9b+2ldyivIx/0xDjI+pr549+2wNZ/dSApaOktP+myKO8SwwD1wWqOjRMy6uiM5a2wFCj9iRQad96/MZWezwX8aiTmrY3IU0JmGr4Bc6gFRK3IRi7logBWVPNqIZtTwyPoCXmXFRryjIK1YzfJjUrhmBXjgLDf6VvuA3Ic+ADdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gpj/jgnS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-337e714b3b4so42974821fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758015588; x=1758620388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUc3MRTvzMAZPHa+PyfrwwUe1ANe2aV886m4qSkwc4E=;
        b=Gpj/jgnSiYb9EM+xCRuyem/vOPRmbvo3o5aIpenKuP51QoAe1+qCmo4Wj3nHJQftv8
         vs1KEHXCIFOlChhwrd6Kd8v/VdgLpVxsdL4uBGfNNqmEGAPRaMHUawFkC66WwWutLxXw
         qZB2jB7qsD0aAoVxzREHAqBc2K5qy6mfhAdi8PqnO7dfcdhigi9MCZdtFShVVn0zIwQ2
         T9MNT8ddan1VhWdOLLbtjdsDM+n+Vvi7Ac/dAuGhuK3GXLbRGG0OmqO+QrFwP0Wjs/k4
         ttxc5fF+9PX1dcLZaXAdudUi+WOoAnU6Gik1hT4kY9pO9VXb4bD4mADCycnai/qs3QqY
         1fLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015588; x=1758620388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BUc3MRTvzMAZPHa+PyfrwwUe1ANe2aV886m4qSkwc4E=;
        b=o1LrGkGh8Z4NUtauHWKAijd3pnJOsGFpFLawbhb3qtSt8UecUClWDdOINJ80TgPNkF
         8c0FWkxB4tWHDp8lC/zzghZ+Fev+JZgSZPsZATBEkg413hxCUN5i7btfdisnBbArgJNC
         wfAVy5izpsvip5O4HK/l7bu5gO8sqM6hlaWZYPu2w+Qh9HgBkI0WXUDADuVakKf641rm
         yviYB+FTzZV6YgQJKuq0K3uFEFtZlhq3lc3SUyyRCmzWkyTsMIKKHvurNzet3xxPKFRo
         OqMawwMD6mHuP7rqegzMYWbZRxNNtDAAcmeNNN3ZA99MSq5aDfusO4OSpBZyDUP8qp3E
         DjkA==
X-Forwarded-Encrypted: i=1; AJvYcCWAumbYw0lmOgBdzKLnx+x+J2CjMGVfFVkc0Q0Y7bgg6tFBy/8YInSGamHG6+yeL4ltZ141BGX4Fczw@vger.kernel.org
X-Gm-Message-State: AOJu0YwxxNybqejQ9qTag8uYSesEvqKrMlPa0oLMfQb0ZRM6BjVVmwdE
	XtN8wAlZNBx/iG8DktCDPd0F045+77ZPjf67UBsccFdpf1+pYKrtEAMZyptOsoKWaJZKg/cxi+1
	2vnudPW6gJcMIgNlUmivc8cZUR/NooUXpuPLdBlSpyQ==
X-Gm-Gg: ASbGncs4Iv6BI4ZW/XLZap8LfkrBAP1qSDAdtylD5NM6Smb8uzTN9WoxWlaLt7dciIW
	JLnIvPt0+yqEanhbXinn6FZ27yPHkIYggEvgimGMz7pIMawiQdxhhjR/znqfEa3UmtedGpeef6d
	qcCL/sbyKcLIk15XCk5XLQJkw9EfD59wGpkI7DQn+Ax3GSg1YaCKnoKedi/ldvMhVEnp2Mj9ns4
	ysWSVE69EgahAzUbg==
X-Google-Smtp-Source: AGHT+IGzzGA4bNFUQUdU3bkIl6nHxwJOGUzHAN4FzuVzmgtSGgjhvT8ZRj2oW1GfM48zmIHTSNAQH+vhth1Wfg2FRkk=
X-Received: by 2002:a05:651c:25dc:20b0:336:9c43:3362 with SMTP id
 38308e7fff4ca-35139e56c02mr32760581fa.4.1758015587867; Tue, 16 Sep 2025
 02:39:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Sep 2025 02:39:45 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Sep 2025 02:39:45 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aMgy0K-jpmegAp-d@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMgy0K-jpmegAp-d@black.igk.intel.com>
Date: Tue, 16 Sep 2025 02:39:45 -0700
X-Gm-Features: AS18NWDD1QEYSZ9adn2YE3j8KPSspT4RzOXGJ4yWJY400CLE92wOditcDowtF6M
Message-ID: <CAMRc=Mc5eYN3=mWAkjwkS+-qfBpsVM3v1vP9v+eFk+-Fs1oKpw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.17-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linux GPIO <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Sep 2025 17:37:52 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> Hi Linux GPIO  maintainers,
>
> This PR contains three fixes for v6.17-rcX, one of which is very importan=
t.
> Please, pull.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.17-1
>
> for you to fetch changes up to 19c839a98c731169f06d32e7c9e00c78a0086ebe:
>
>   gpiolib: acpi: initialize acpi_gpio_info struct (2025-09-15 08:55:40 +0=
200)
>
> ----------------------------------------------------------------
> intel-gpio for v6.17-1
>
> * Fix a regression to make GpioInt() by index work again
> * Ingnore spurious wakeups from touchpad on GPD G1619-05
> * Accept debounce from GpioIo() resources
>
> The following is an automated git shortlog grouped by driver:
>
> gpiolib:
>  -  acpi: initialize acpi_gpio_info struct
>  -  acpi: Ignore touchpad wakeup on GPD G1619-05
>  -  acpi: Program debounce when finding GPIO
>
> ----------------------------------------------------------------
> Antheas Kapenekakis (1):
>       gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-05
>
> Mario Limonciello (AMD) (1):
>       gpiolib: acpi: Program debounce when finding GPIO
>
> S=C3=A9bastien Szymanski (1):
>       gpiolib: acpi: initialize acpi_gpio_info struct
>
>  drivers/gpio/gpiolib-acpi-core.c   | 11 +++++++++--
>  drivers/gpio/gpiolib-acpi-quirks.c | 12 ++++++++++++
>  2 files changed, 21 insertions(+), 2 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>


Pulled, thanks!

Just a nit for the future: please don't do "automated gitlogs" etc. Linus T
is known to frown upon such things and you're also duplicating the info you
already put into the tag. Just manually summarize the changes this PR bring=
s
in.

Bartosz

