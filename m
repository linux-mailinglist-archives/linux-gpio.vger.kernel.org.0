Return-Path: <linux-gpio+bounces-3011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CA184A705
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 22:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22CF21C22E55
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 21:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2065FDB1;
	Mon,  5 Feb 2024 19:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y0rsuLrJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836E65FDA0
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 19:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707161813; cv=none; b=d7aNm4WAGb331WjWgOaQSUIV2mLXG6VkSmt+1iRRLkNEWqUP+MLQpre5TnL+tOsVcyO5V6t/aEBtNymHFgkloSOSjBTc4/SMFvPftANmosK5WSDd6tmeXm4fQHO4KVfsotzEAG7tetlZ5xeUlgPVF9d6AnpVuLvNwzPh1/9OezM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707161813; c=relaxed/simple;
	bh=lEYzIFkIDNr0lwbywYaxUK0ssxdRDtBBP4dTcXZR/BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjPUEOuQ6TZ5qU27EKlBV6Yt/PkugHyKLhkjIUxst2q6hFaa/OX7b12/N+Rm2kxBdleFUwO6krP681AkImLlN38nh+aT3YXiSOL4C7XEh8Tln/1kno98KATu3fDzypCTt/Av+KCkUVeJRA3KtQSp0ZbId/IugbWEaGclsLpTQKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y0rsuLrJ; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7ce603b9051so2311306241.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 11:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707161810; x=1707766610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+7OHrqpOuqpOOjbY3YZJI7fSE7iDbYYXlnto6M+hlo=;
        b=Y0rsuLrJO++N7dfDx5WlwV7cmdOxWNd2ZGGOFbS49fTjjxYmIKyZpuLljdyULM9idN
         MI8TE1Alfr8vhtbIfYYk/qANX06nmsJQYNGaY5na8LOc0ZFarOjmKv2E9L2ySkpHM8Me
         CYqpNt/oA5LdrCnzWfUvw9ilnx2GQPxW14qjtng7rPkz/SDax/3/PfNo+KaSyUEaeWup
         KL4ebzQmXfvWVFIFPizXa2aYcqEFmlVY30o0Zu/1j2mL8rzdaDBHqsUcmhdPAdT/8pCj
         eFAirBzHJL3S/6Vgp9zzwvMZZ2A+J5guXLQ5fUsNmnV9kA2gEqdjYe/Vc1tc2d8jHOV7
         HmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707161810; x=1707766610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+7OHrqpOuqpOOjbY3YZJI7fSE7iDbYYXlnto6M+hlo=;
        b=rvK6y/CPfLy5HU8Z95nsEQufPjp5AaFEjuCl3LsbY6x07RSAbVq0GSTjHVRUjP19HN
         UuMmqAe/yrkP2ZPQV+h93Axk7UuEY7hs1LmhfqhwR9B8zE5wbGtuCchIi/Z3jezQ28tL
         ji+2JZ/lLVM3jE94VQtBkRH67fUBnWpC0K+GUZhXFtEJ3Y3IJ/L7rbP1y9eMByAhE/MY
         rLstUke/wo3r0lpsSfxUeDuQOh1SbdWUcGH2Gvc0bGoo6RSxD9YCxJUlDHsSuxJNZcGz
         aHiNKTrAYJOSmZBXl0X59i8d3andvxj8be9oXjxHKJ/jR8BjVrDfyY+78XVTMoRtf7ZM
         lHlQ==
X-Gm-Message-State: AOJu0YxUQ/5LwBCxlsq47lKxxZFtFP5ifm+xNL5jUFoDWwakaJLfOYp2
	qOcymk/l7tSYXLPYcHgMNrg7NEgE6eNk5BHUFgGVIMnMm4jsv1aEtbZjMeIqUbovSUJ819g8KyA
	qj5EJU1Yj1C+kqlV+se07rtY0XGKc882xN+Nb7g==
X-Google-Smtp-Source: AGHT+IGUXREYpSgvCcKR/2mLnLuyI5E5iYeu+pMj2i/scxMB6h54ahwKYqv1iYu6B2EFV4b89k8TsRtogRuJuHKzZFw=
X-Received: by 2002:a05:6102:117c:b0:46d:1b1a:a375 with SMTP id
 k28-20020a056102117c00b0046d1b1aa375mr811567vsg.32.1707161810384; Mon, 05 Feb
 2024 11:36:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205093418.39755-1-brgl@bgdev.pl> <20240205093418.39755-22-brgl@bgdev.pl>
 <ZcDVNA6Id7Bmckt0@smile.fi.intel.com>
In-Reply-To: <ZcDVNA6Id7Bmckt0@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 Feb 2024 20:36:39 +0100
Message-ID: <CAMRc=MdoGQZKM37kk=j6NpdkUUjDvs3-8YeiZVQO2EpPHRZ7Uw@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 1:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>

[snip]

>
> >  int gpiod_get_direction(struct gpio_desc *desc)
> >  {
> > -     struct gpio_chip *gc;
> >       unsigned long flags;
> >       unsigned int offset;
> >       int ret;
> >
> > -     gc =3D gpiod_to_chip(desc);
> > +     if (!desc)
> > +             /* Sane default is INPUT. */
> > +             return 1;
>
> Hmm... I can't imagine how this value may anyhow be used / useful.
>

What else would you return for an optional (NULL) GPIO?

Bart

[snip]

