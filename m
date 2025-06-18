Return-Path: <linux-gpio+bounces-21798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF58ADF1F6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 17:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C40A17F9FF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 15:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775312ED16B;
	Wed, 18 Jun 2025 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kcT0vjJc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696007080D
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750262212; cv=none; b=ivQpA7qDODXaVxs9Jg1XLXrqLFb+eQAci27xeK2UvayBKP3cxCFBfZ/29G8btRGtbbvIjp/yWLDydpc6ekfdHjXaSjtjgZ4kA6gyDjuek8nNKutuchA9EcL8XbhbyVRKg+lAYOd9OUvOLq1o5w57csFU7JAsqYqpJdUTD4j+Q9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750262212; c=relaxed/simple;
	bh=nU+mMq91N/UWADw8HGmAy5+zUzWzJ4rcaI84hTgFQWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNvm3fC7cds+ximGD484qmcQnQL1g3FuzeFf1m8fvJB5DA/9QC7cboXhqcwO/4SIbYvH53qYIwJor/r727nKa7nwkSgzeH7aTmiMgpzWdxbshevwClTt23vX0J4oZjMbY1y+zcK2ELgk2XlSSop/LjrWMbenRccMWMX4qTbS6Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kcT0vjJc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55350d0eedeso6986273e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750262208; x=1750867008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SoW2zv6xd2177smA7YZNZGTO3s0ei/AUqHT8Anc7A8=;
        b=kcT0vjJclNeg67X2qS36U7jpjI4aFEGT74T0pOo+6aKCZnJlXSTJ/s8QxiJoWhAFr9
         ifijBKjC8jJTBjz4uyqZLwpkRenPFFTxLO1O2FBqGsMxlykhYDjgDDszcU/1VQhgQs6R
         BjejMWI4urWb89ulTmLD78eYQCOCK0MYRXF8g1nyA1t1cRax71jk5bCtTWoahR5FVk8R
         6KE8PlHTs8EQeXvR/Y8JTbUWQiY25kqzT992p4YFbyHwt9RMdQziC4AzGPHfOSWKSnvR
         VG1Tc1Zha0X21Msu1CmgHD3+zfpbrtsqIcOppNT2eILq747/MBU3ZoT7HV8I93fuglc4
         hWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750262208; x=1750867008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SoW2zv6xd2177smA7YZNZGTO3s0ei/AUqHT8Anc7A8=;
        b=QzWBw0s6xuqOczUiwYzDSMyfjf8A+VN4ROfu90J9eohK2ph6YqLa+RdkTmbMJq5EYv
         d2cgvKJWVhqMI56wL0IBCib6T0vdBmnke9oyfbIBJSygqBc4LaMVn9fnZWNO/Xxf2648
         z31EvVXRYvf63qfagYUw+IK6HHlkhih6lnwV13bId3yL4kt0bnMZ3P6q58Wz3sPVDC3b
         3qCuLl1a5Ngg8auka1XnDcCGDGRYmPTSFNHJJLWp8aMyU4hupBwqphdZxNxMHRsbvvkJ
         OnkiLFfUWfp/l9kPVX//er+1nrk8thDcIXPT2HlQXCuYmR9HidAIYO2LaNhr51zr5kEJ
         uFLg==
X-Forwarded-Encrypted: i=1; AJvYcCVXcJU7ywMHZ4QTVu3dWLCcXlEu0BMS/mXn+c95ZsgzAaAcslkCU0wADdX8anvQjPvNt6La514K+OE/@vger.kernel.org
X-Gm-Message-State: AOJu0YwNkv5+vKc+QXAycpGN4kgdDoA45pHF0FQ/fY32eQSTYX1EOTZS
	KKwyykfNAGGV6Kr5zMb6unKsNP4TOI/kDE95d2gGkAMZqV1/k/GeIjEDp1iHoFAUKmVdyoGU0Ol
	WORug6NLXXX8VGwE+aRCthJZigN7VWH5PAg1OnM/iGA==
X-Gm-Gg: ASbGnctJnhTNv+wGeVw51rd8yne3TeXXbrmzjAKq2pdl9j4nAvmaeL6nzlcbl7AiTIr
	3UoWR4oMmXQcgT/eO1xvBOSge1EiZlYUsIjMbrksauY7erao/ukv5sSUbgYn9BeqSQjJWeOcrFE
	z40+TyJdzB5Mvf1fHSREENcpWdFOt68ap5MkFInAr3ywIiP5JomPkgsa5xnvbk4F77y8N8A8QBe
	w==
X-Google-Smtp-Source: AGHT+IE1m1Ogu9I7M6Q0dgSpBL59IMMub8B4m4J8EjGGDgs0++uoBKg4e91Utwy4QfsbfaNFm7zOrDhEL0/MXkN2BEQ=
X-Received: by 2002:a05:6512:6cd:b0:553:252f:adf8 with SMTP id
 2adb3069b0e04-553b6e7d49bmr4870120e87.9.1750262208271; Wed, 18 Jun 2025
 08:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <8570dedab1a7478c39b31125ad279038fe31ac13.camel@pengutronix.de>
In-Reply-To: <8570dedab1a7478c39b31125ad279038fe31ac13.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 17:56:37 +0200
X-Gm-Features: AX0GCFuJ0P-a8mZ5E3bN-xWqYgqT6OiPTQDj1Ac3H8LtAqV2mZmqoaE2xuMa5eo
Message-ID: <CAMRc=Mc6ZSp+bu3i0-X-i_8=f69X0Rez98tGsS-g_uJ1nBH6fQ@mail.gmail.com>
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

[snip]


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

After a second look: IMO this is unrelated to the sysfs changes. We
definitely should change the debugfs output and rid it off the global
numbers but it shouldn't be part of this series. Also: are you using
this output in some way? Technically debugfs output is not stable ABI
so we can modify it without considering existing users but wanted to
run it by you to know if I'm going to break something for you.

Bart

