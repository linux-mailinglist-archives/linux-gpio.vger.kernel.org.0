Return-Path: <linux-gpio+bounces-5850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A794D8B21B8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 14:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B3281F212A2
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 12:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6971494AD;
	Thu, 25 Apr 2024 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ArzTV2VH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F83133408
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714048601; cv=none; b=fBuKj8/MX+sG5dchf7Yw21r1FNIb+BxyP4qAleXl+z+SZXD7hHMcgVYFBnoCO5fwHaKrp3ywDlhHmiFldc2Zzlu0SA2Uc7bFwDDraDChrr6Asbi0Og57fpAkDH15CVCAyLQoTATXelb0c6kgZanEDnwPjhgW3glNx1cppXmAFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714048601; c=relaxed/simple;
	bh=g5xhI5eVeQ5wd6iELE62xMRCbkYbszKKGPCi4oQuH5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChhnBl7wuf4zxk1BfnMN/0lJ9qOC+htd9kTV+emlDOEmsJDJEWYSNIYXtu3lxsb1s9EkJ9WXBII2gTWEdfzpdfBpbBh46KZm3a7t8BywGRb58XD+IKbrSkFSwMnX4iO47/vZmuwV5jgpSdqK8NSv0wbcx2xRh4vwjt13VJcACRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ArzTV2VH; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51967f75763so1064429e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1714048598; x=1714653398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLzECrdoIQ0+pkWQc8Vu/HSI/WXksfKfBsh+jpALPUg=;
        b=ArzTV2VHc9u5wz7VTeIdL2Gb7eLb75U5yxBXe4zxSdZ9wyrh04URaPRb2D0gaH8z07
         qQbDWVc3Wd1b//wUW2dQ+ygpFDEbCaZvU/QZKJFkQTJYOtts4nI2cVd5yij5vRaOXAKg
         C8xoZT3bWgZ3rHf4X3ybsXsTuqdbW3sJVWVZxAuLNbgxfZCDri9KyeSnPwFyc8TFqvyy
         UqhADJDJf+0NQH6ZbTL4YbMzO/PRmnbExXhO0WhqRKJnQeVy6OTiy6RLyBP0/UTXWQxl
         kwB5KjGJHgR4Kj6q56VRc5RF18EWerbGuqbQA5ps9/Y16aveg0Sb1uFuO9JvmJaC1yOl
         JzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714048598; x=1714653398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLzECrdoIQ0+pkWQc8Vu/HSI/WXksfKfBsh+jpALPUg=;
        b=M7lDIy5fEBJ06oL6y7+2cbUQYfDeLKD5hYAVNUk3FOdTjtM2VmC4wols1WRniDeFGP
         q49Vp29ND8DEBu/ZQo+1ilpvXfLCbp+hVMfMkhGGvg7BZOQZE5K4EtjxCDN5RqGfWTGY
         kCY+1cIbB00jSVA0743eIePJo8sTn50gwpO757YsgvqMTghfYRxFzcyRFhbbBbLot1Qb
         GThm+GF/nj5OYejZwKnH9p68bmPO/yJTFelLxoxn0t9BGoKUuy5ZKEURgZ/PCLXm/rEk
         wrQzACclgnE4TST7XVwUO0QxugU5kOOLnLG4VncHRfLdjPB6jEi63b8OESozPAJGw1lz
         Zw+A==
X-Gm-Message-State: AOJu0YxbE5kj5k8DVu90LiYEwj1cOnmZQhrE1ktvSMz9qSPLYVHOg+Ka
	kzqkqdkcsZDXoyrt+KpaOBLViVQsJKQtLTPOsPzjzLbiRSQDDHz99LaOk1Yv9k8whejhFo/YG2I
	EtVjWKQ6nUh7SeWcfNvhtGAvifUPWM5yc03w931azzI38Likp
X-Google-Smtp-Source: AGHT+IGbNsSwBzy+L9gT84B+y5aJtiZzbHF9eJiA8YKCHWgAMK2ibDz2Wgsni0p//GeBxag2ZL00gob5W2tBZYhD05o=
X-Received: by 2002:a05:6512:702:b0:51b:f373:67ea with SMTP id
 b2-20020a056512070200b0051bf37367eamr3369111lfs.60.1714048597986; Thu, 25 Apr
 2024 05:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZipEyyjM955f7ABy@black.fi.intel.com>
In-Reply-To: <ZipEyyjM955f7ABy@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Apr 2024 14:36:26 +0200
Message-ID: <CAMRc=MeVAsTChowpahsQNr9_aexF5-xhiOH1uTgieDQC_qFYxQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.9-2
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 1:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> One small fix for long-standing non-critical issue in Intel Tangier drive=
r
> for v6.9-rcX. The change was tested on Intel Edison platform along with t=
he
> Linux Next for a few weeks w/o issues reported. Please, pull.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit ace0ebe5c98d66889f19e0f30e2518d0c58d0e=
04:
>
>   gpio: crystalcove: Use -ENOTSUPP consistently (2024-04-05 20:12:39 +030=
0)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.9-2
>
> for you to fetch changes up to 7d045025a24b6336d444d359bd4312f351d017f9:
>
>   gpio: tangier: Use correct type for the IRQ chip data (2024-04-12 23:41=
:05 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v6.9-2
>
> * Make data pointer dereference robust in Intel Tangier driver
>
> The following is an automated git shortlog grouped by driver:
>
> tangier:
>  -  Use correct type for the IRQ chip data
>
> ----------------------------------------------------------------
> Andy Shevchenko (1):
>       gpio: tangier: Use correct type for the IRQ chip data
>
>  drivers/gpio/gpio-tangier.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart

