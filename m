Return-Path: <linux-gpio+bounces-12391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C489B8248
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 19:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D02C91F234E6
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 18:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC03F1C1AC9;
	Thu, 31 Oct 2024 18:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SI9umZaB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA519B59C
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 18:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730398144; cv=none; b=qVrYiaa6M/YsAhTuVejPfRyE02DAIADCwgYtRwCfFYPX+3/F3szc3ywO4gPENFqY/Onz+ohSZPE8i6pXvdAtTIsZ8wGGKKta7D/2EXwhslgqMY/IWBegytI0mbG0iZhaGppEf8Ohrg87tWR/J5mI8GPNY7WGSVFMcGgtqI7+msM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730398144; c=relaxed/simple;
	bh=6WL9U/tBdUVYMgXRPydT0ne2ZCMff3C3b0xsaExMkHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZvTIbVA6T8bnexs5B0Rwb07qLry4DxsR4nIy5qEwDOv3DeQn5SK1v3yHZWn1GFQH6/DMjOQp2aPyYiO2jknNv9DEqNLIt9SLK+QKV6mAm9qQqToTb/jbwxeF5Jp/h+oZz1qM5ZPUDsnu39P/cO/AhO9XIxwj9r0eKdXNn9witY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SI9umZaB; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2cc47f1d7so914243a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730398142; x=1731002942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pVgOa/QZhTZiBeHtmf8e1CXBuckyslnnwRoxjZXX1w=;
        b=SI9umZaBptNkIvlZPZlfM5a7FMdP7lhzzaDPWYIjk23de2IFzG8IOhjoA9y419c3F5
         o1JJtQ87CTv45r9g0aUH63/LYoUj0fRIsogmf2UrgXpInldQmyBRLiIg1q5FDzh+wwBd
         79EKho0d3nRe2l7yaX6ByD5+FBEMcZ8VN57YHJGmDZuSeIcTlPp9ufdL8l9Kv904pmXj
         SnrkFputUY5ETtIoZbt4y7HNAzWBTQHcVrGb9hbNUm0XMtMIpE25HsnzwvIXEFhG4wse
         xzil2oyQv+yIM9SkCX01kcHFutnjToKd/fANehEBDm9WNCnUPYiK2THA5ZVCaFp71vHQ
         aNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730398142; x=1731002942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pVgOa/QZhTZiBeHtmf8e1CXBuckyslnnwRoxjZXX1w=;
        b=OXC6dkUaF3fQeHcstr6gOFEL92jwfmYSwoIml1551tINaAY+c4akHspXU+6EPjggWu
         iLK3PrIOa6iqObqhYcSVOiZB3cpqmt56HAzVyAab5THOXsCp0AajknwKzK7HRg7t02+6
         v0S6sSFiUxv60wZapKMSppgRZQg24V640cHFgJg6lMSgol9NEC3xnBKOjA0+FSvKpAXg
         b18WjO+uEbXrF9weLZiAiObVBqI7CuvsOMw/caZOQw4KodGi6t+HxAc4erwnGKHplA9M
         beqXpQ/fqGoC7mHI59xLbHWazPQ7XOnN/Q9s3r2V9qJ7TMx2SnBHk/GxjgTbsTB7OweA
         4Ltw==
X-Forwarded-Encrypted: i=1; AJvYcCXZYfMKOEzBxhcK74GebHkPfKDg3kgRKCDHjGDCqnlRKlA2DgAL3TlqHequFcHbyiTfIpegqOszLP3e@vger.kernel.org
X-Gm-Message-State: AOJu0YwaVIU492MCCueHJOeY79pEIS/iQqAzz57Rbz7rOsSo6BoK29L/
	VgPcuQxIbjHLmRL/EOBipC7sn0zbBUpDBNLjq3nWa6/ZPLuglIs3jpYywYJLWSg84XM+9yuxF1H
	kPKviSUrHl9yh3RLp8kYv5/ke24wT59FWGwJytg==
X-Google-Smtp-Source: AGHT+IHF0fGwSEx/W18Jo8oLBr+O/BniQBYcRyrEnRYItjHhfVVikd1Y59KcKL8mYSIwO64USidkVsxeZVVb2mmWfl4=
X-Received: by 2002:a17:90b:540c:b0:2e2:b94c:d6a2 with SMTP id
 98e67ed59e1d1-2e93ddf4d4fmr5247891a91.0.1730398141765; Thu, 31 Oct 2024
 11:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028125000.24051-1-johan+linaro@kernel.org>
 <20241028125000.24051-3-johan+linaro@kernel.org> <CAMRc=Mf6yaZMsF5x=vPet=y9fa5ZTuWSAA=oi+Qw07TF8GEFbA@mail.gmail.com>
 <ZyO5a85wq1fKD-ln@hovoldconsulting.com>
In-Reply-To: <ZyO5a85wq1fKD-ln@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 31 Oct 2024 19:08:48 +0100
Message-ID: <CAMRc=MeC85QLFYXdq3v_4rC=jst3PoSTOJz61GFEpw_yKa+iMw@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: fix debugfs dangling chip separator
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 6:07=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Thu, Oct 31, 2024 at 06:02:43PM +0100, Bartosz Golaszewski wrote:
>
> > But with this change we go from an incorrect:
> >
> > # cat /sys/kernel/debug/gpio
> > gpiochip0: (dangling chip)
> > gpiochip1: (dangling chip)
> > gpiochip2: (dangling chip)root@qemux86-64:~#
> >
> > to still incorrect:
> >
> > # cat /sys/kernel/debug/gpio
> > gpiochip0: (dangling chip)
> >
> > gpiochip1: (dangling chip)
> >
> > gpiochip2: (dangling chip)
>
> Why do you think this is incorrect? Every chip section is separated by
> an empty line, just as it should be:
>
> gpiochip0: GPIOs 512-517, parent: platform/c42d000.spmi:pmic@0:gpio@8800,=
 c42d000.spmi:pmic@0:gpio@8800:
>  gpio1 : in   low  normal  vin-0 no pull                     push-pull  l=
ow     atest-1 dtest-0
>  gpio2 : in   low  normal  vin-0 no pull                     push-pull  l=
ow     atest-1 dtest-0
>  gpio3 : out  low  func1   vin-0 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio4 : in   low  normal  vin-0 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio5 : ---
>  gpio6 : in   high normal  vin-0 pull-up 30uA                push-pull  l=
ow     atest-1 dtest-0
>
> gpiochip1: GPIOs 518-529, parent: platform/c42d000.spmi:pmic@1:gpio@8800,=
 c42d000.spmi:pmic@1:gpio@8800:
>  gpio1 : in   low  normal  vin-0 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio2 : in   low  normal  vin-0 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio3 : ---
>  gpio4 : ---
>  gpio5 : in   high normal  vin-0 pull-up 30uA                push-pull  l=
ow     atest-1 dtest-0
>  gpio6 : in   high normal  vin-1 pull-up 30uA                push-pull  l=
ow     atest-1 dtest-0
>  gpio7 : out  high func1   vin-1 no pull                     push-pull  l=
ow     atest-1 dtest-0
>  gpio8 : in   low  normal  vin-0 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio9 : in   low  normal  vin-0 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio10: out  high normal  vin-1 no pull                     push-pull  l=
ow     atest-1 dtest-0
>  gpio11: out  high normal  vin-1 no pull                     push-pull  l=
ow     atest-1 dtest-0
>  gpio12: in   low  normal  vin-1 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>
> gpiochip2: GPIOs 530-537, parent: platform/c42d000.spmi:pmic@2:gpio@8800,=
 c42d000.spmi:pmic@2:gpio@8800:
>  gpio1 : in   low  normal  vin-0 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio2 : in   low  normal  vin-0 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio3 : in   low  normal  vin-0 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio4 : out  high normal  vin-1 pull-down 10uA              push-pull  m=
edium  atest-1 dtest-0
>  gpio5 : in   low  normal  vin-1 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio6 : out  high normal  vin-1 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio7 : in   low  normal  vin-0 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>  gpio8 : out  low  normal  vin-1 pull-down 10uA              push-pull  l=
ow     atest-1 dtest-0
>
> Johan

Ah, makes more sense in the context of mixed good and dangling output.

Nevermind my comment.

Bart

