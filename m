Return-Path: <linux-gpio+bounces-21778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB1BADF03C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 16:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5D82188D132
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1751A2EE5ED;
	Wed, 18 Jun 2025 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V5RWvryj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7A3B1AB
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258422; cv=none; b=EHc6Bmg7YkDaziWZ5RJTXzyl7qVBcrkfdUTV2e+COTcbjfi6Pr6TKxYUuLfDI0exJoO5jZPNdQc8QJEIu25qEYL/WX6AcQrBUfv9/Qt2zEcFR6TYyangQPPznTwMwj2/yYeGl8tvSAiorytiqJBf0w9h3lJcR6bIC6dywj5PnaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258422; c=relaxed/simple;
	bh=d1bTMcMzxYwoA+D7FedJtqCDcbroa+Mc/37/DE2ipe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pq1y62ACQ/ypDDAn86KOCkF5G5lkrAa85aOeQViIUHRZ5I8NK7jTxZPZyWfpiefgc+xexCRsRmaA1bLslzJQZ47eMwaGhxCVkt2cHRFp/278id+6FVoI4SmUsXLjeL6VqktR9xLU66ChVvdiLsnariFW5tTbxZRbPa421rs3Mr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V5RWvryj; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54e98f73850so6620389e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750258417; x=1750863217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QILoQ0cg9dCm9DSe1PZh99lLZifnpwxayvJF2llOsWw=;
        b=V5RWvryjKoVyvKHsAXD/uO7JeR1qYTCtKWPezfMlGA+LLwyN2NBVjsygv7V76Lg9vE
         ZLDkj0K0Okgk/qq2pLtVBrncrXmhds1l9mMaZTZLk0PynuZvvZrphCzp4kQQB3chZ2o1
         +W+/RomCET7vFeGZkJoP6toOI5Y///Lc/oRsr//dwlD/MKaYV0wODRRRtgui3g2v5HbG
         zaoCTJtaEgva+aiximCDFF+C9jzinv7N+8EJRFGAoUU/vW++uvbtNEcD7nlxujtnjdxb
         5+iC3lXf11U5KlJ5rPZ9Zl4UNhCHKPqChhRxqE8HVL2WY7tr8L0gcOnmospuW1eaM3LW
         iWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258417; x=1750863217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QILoQ0cg9dCm9DSe1PZh99lLZifnpwxayvJF2llOsWw=;
        b=GmzSMgT3tejzJcCt1C0CHn2rYf8xCTfkl33pJYFJliMqfYHYJBQH1JBvz9vw8TTqRA
         mWXGG7peJZvfmNqEAwZbqy0V9mGgvPR2ebekChO0HZyZ7OcaQQW/xu8YN5QDmR17myiW
         1lDMILDITjSrlrkyW0i7xGLcDna7HKmuk+N5aITtlBtoXkJN1DmtTtnzKL1SX8j9k9IH
         2VkBsWNiIpRsdTdN48DN9u4QgwykAVG5eW/ZsowLveLjY89VaRukgiJ6j53yVICTTVKl
         Ir/oC5H+22/zhOGihrxJO9AlB/9osjmSvYSM5MKntE3GNONZl56FpfVqyvGTah6xTYPJ
         a2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeZwcZL6TLmoJKekwQWD4zDK/KNl6S9DsRlnsun71+gYq8cItJblJqvGuZPnbk0hIOKKICDNsH5R7f@vger.kernel.org
X-Gm-Message-State: AOJu0YwT5tUmb25BqaVSqzCh3Ex7aALqeY8h+ppI/EpDwX9+y7RcGayT
	S7xFIT0KMYhbhlpyxmAQUDbzJU88r1NtuhbUFl56i4V+H6g//JGvwLXCLFaPFIz2iaSbqlsTXLD
	cFcukaGI3G3Y/FNDHYZE2ApJ98HJA2+qA3mQ9YE/v8Q==
X-Gm-Gg: ASbGncs1SIsHhV0XFQf4AbkSapX791OBiZO8N18+gWvf574L35N9MBW5htKod/3GL/x
	KFHxywWp6lAJ118aG6E3V8IDdiEg7OLDf4ANdxQoh1PsXmDaLNC+OqaozurXoq1cJFpHRe3kJ0C
	KpQPU7Zssl8qXCr6rxcg+CQzRYi9IL4ChSdW1EaAX7RVloWbNoj2NcoW2F5QrJORBtsSssmcLq1
	Q==
X-Google-Smtp-Source: AGHT+IGiCcrgYRMbum6nuXJpOo6iTxGGvz1fmMPK+AhjjIqJxDaE2WGG9FQliOn9F9chuEGZlOPblHk5QtCZaRkBmoU=
X-Received: by 2002:a05:6512:b97:b0:553:241d:4e7d with SMTP id
 2adb3069b0e04-553b6f25d30mr4824208e87.42.1750258417343; Wed, 18 Jun 2025
 07:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <8570dedab1a7478c39b31125ad279038fe31ac13.camel@pengutronix.de>
In-Reply-To: <8570dedab1a7478c39b31125ad279038fe31ac13.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 16:53:26 +0200
X-Gm-Features: AX0GCFv-EtuLfkkAl-rHEpXj6Jbb19BXN6r2Zc9P3RRMCwt_-SJ6mmJG2IaqrXo
Message-ID: <CAMRc=MdgYqk3RuM7vVUJPdtPH8zSCmr8fuDvV++7UE9F10WVzg@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 00/15] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:38=E2=80=AFPM Jan L=C3=BCbbe <jlu@pengutronix.de>=
 wrote:
>
> Hi Bartosz,
>
> On Tue, 2025-06-10 at 16:38 +0200, Bartosz Golaszewski wrote:
> > Following our discussion[1], here's a proposal for extending the sysfs
> > interface with attributes not referring to GPIO lines by their global
> > numbers in a backward compatible way.
> >
> > Long story short: there is now a new class device for each GPIO chip.
> > It's called chipX where X is the ID of the device as per the driver
> > model and it lives next to the old gpiochipABC where ABC is the GPIO
> > base. Each new chip class device has a pair of export/unexport
> > attributes which work similarly to the global ones under /sys/class/gpi=
o
> > but take hardware offsets within the chip as input, instead of the
> > global numbers. Finally, each exported line appears at the same time as
> > the global /sys/class/gpio/gpioABC as well as per-chip
> > /sys/class/gpio/chipX/gpioY sysfs group.
> >
> > First, there are some documentation updates, followed by a set of
> > updates to the sysfs code that's useful even without the new
> > functionality. Then the actual implementation of a parallel GPIO chip
> > entry not containing the base GPIO number in the name and the
> > corresponding sysfs attribute group for each exported line that lives
> > under the new chip class device. Finally: also allow to compile out the
> > legacy parts leaving only the new elements of the sysfs ABI.
> >
> > This series passes the compatibility tests I wrote while working on the
> > user-space compatibility layer for sysfs[2].
> >
> > [1] https://lore.kernel.org/all/CAMRc=3DMcUCeZcU6co1aN54rTudo+JfPjjForu=
4iKQ5npwXk6GXA@mail.gmail.com/
> > [2] https://github.com/brgl/gpio-sysfs-compat-tests
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> thanks for implementing this! I tried it on one of our boards and noticed=
 a few
> things.
>
> After unexporting a GPIO from the chipX dir, the subdirectory is not remo=
ved:
>  root@lxatac-00006:/sys/class/gpio/chip9# echo 1 > export
>  root@lxatac-00006:/sys/class/gpio/chip9# echo 1 > unexport
>  root@lxatac-00006:/sys/class/gpio/chip9# ls -l gpio1/
>  total 0
>  -rw-r--r-- 1 root root 4096 Jun 18 12:52 active_low
>  -rw-r--r-- 1 root root 4096 Jun 18 12:52 direction
>  -rw-r--r-- 1 root root 4096 Jun 18 12:52 edge
>  -rw-r--r-- 1 root root 4096 Jun 18 12:52 value
> Subsequent attempts to export it again fail.
>

Ah, seems like one of the last-minute rebases made me drop the
relevant sysfs_remove_groups(). Thanks for catching it.

> The contents of /sys/kernel/debug/gpio don't really fit any more:
>  gpiochip10: GPIOs 660-663, parent: i2c/0-0024, pca9570, can sleep:
>   gpio-660 (DUT_PWR_EN          |tacd                ) out hi
>   gpio-661 (DUT_PWR_DISCH       |tacd                ) out lo
>   gpio-662 (DUT_PWR_ADCRST      |reset               ) out lo
> The header is inconsistent: it uses the 'gpiochip' prefix, but not the ba=
se as
> the old class devices in /sys/class/gpio/. Perhaps something like this?
>  chip10: GPIOs 0-2 (global IDs 660-663), parent: i2c/0-0024, pca9570, can=
 sleep:
>   gpio-0 (660) (DUT_PWR_EN          |tacd                ) out hi
>   gpio-1 (661) (DUT_PWR_DISCH       |tacd                ) out lo
>   gpio-2 (662) (DUT_PWR_ADCRST      |reset               ) out lo
> If GPIO_SYSFS_LEGACY is disabled, the global IDs could be hidden.
>

I have not paid attention to the debugfs output TBH. Let me check it in v2.

> Unix permissions/ownership just works.
>
>
> As far as I can see, this is basically everything I need to replace the o=
ld
> global ID based GPIO access in labgrid. Thanks again! :)
>

Bart

