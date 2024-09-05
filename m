Return-Path: <linux-gpio+bounces-9836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A51F896D9BD
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 15:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B1001F248CC
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 13:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB56F19B5AA;
	Thu,  5 Sep 2024 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sF0H9EPP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECA31993BB
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 13:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541488; cv=none; b=ABBQ+y/Wdw5BAIYw/N7qC/tl5SS0FY8SBh/cHRRbckHl/gCAK8BZ7q97OzIq5loGLKN0M97V1P7iKaMW7eJKF1le09WbCVVUR2PZT9aixQaVk9SZ1ADC3kMLmZGofVYVsQGWuvvCzVjpgUJQoNp8bBtMIz3mhGbY1hiN9x9xDhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541488; c=relaxed/simple;
	bh=N/VtCV6UKmGzISX9jSpbNqrj81M5RVqAaF4hKF/4BXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMmduEMg1WN/DaIfyu7MmMcgRdsY9ZitXJKuSF5J0qKuaCCjTgTjvECQWXIkIXAQFd6bygbR36uxiMqGxqSBThMkOEa/T2XvT6LEQRj9sUpBRSeGlQ1Wac7IfGlKOVJknHfQFEDbFifkZ0eJz4yhSxAcYPEBxcFnOnPevNqoHSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sF0H9EPP; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f74e613a10so6111001fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725541485; x=1726146285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sYI/kMEQjv4c5kmtLazolOaBbntnQqMArZgDWaqpro=;
        b=sF0H9EPPe5pL9RZU2SwKeQHN43ohrgHdtE1tqJVUenwqMayN5KhGfodfNAwjITr/XJ
         VAqRCMgfW5OzSpVkLkccsFAHZZS2/OhkXZ/pq64s4AukubOajq4eMHmypsjHxK1yPOZM
         5wo91yOPesMKICLEYzjVbPbTGNZPS0lrby1QEcTfafgVdD46KnEYlEPttGSg2o1ms1Sx
         YyFidA0cDMDET3Syjw2mMz80LdgfDJgWtDOHSktFfssdytGd5I6dU8I4it2JRBBiLtD0
         9oFI0sppcfy+3iA45JfDqTTACGGtcHlgezyaO6YOkAgVyoujSgccYHj13Va32HqME43a
         XCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541485; x=1726146285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sYI/kMEQjv4c5kmtLazolOaBbntnQqMArZgDWaqpro=;
        b=NBEyRzy3Z+jXyykGFU7XfDBcthN21EJAHKiXI/6SHvYGf1+MmtAvAyPHef1A9tlBXY
         0U/FNc0U/uGFNqI3yDb5bC1oW/9Wic9vkSKTnVGXnmdGhzRUp00ozkySwy9fuF5yMw6y
         c7sgBK0vy+uVOpDM8PaRQTQmNFKQ3lCOj5dlVMDQASX796Lw94UXUqOjykhJjt4vAqpN
         hXFK3JFu9Qd/KmhKedd8Dr7xM6XNqBsFOUXdFeEtt5yIrTAGbcBU4HgRc24rZzVpv1cb
         56o1C7OApLo/6HJ+szKHHtYRbVMCEbUICsILAvRhYdNFA8FQ6/jLd7uYwWcOjQzGaogd
         GdTQ==
X-Gm-Message-State: AOJu0YyKV4r5ltCCAjO6SvENLL8cE8YR0V+UR/vhFowFqeX2uC6hJSaz
	i5MejeXYGiYf1QGq5C5j1Aq7MPdryT3K/e3kr1HOlwKtkXIGSwx47NbXyzbjT9UmT2R5bTVtRov
	dUPIEOnAQ/1cNoBtwY5UUk1ktSLVZR+YYSRhUsGllDD6DQQ4D
X-Google-Smtp-Source: AGHT+IHOHIaz9dVBbolPHU7EfIO5jfwLbPNj5lBOgI9PHj1N4SUTyLwK/EoaFWFkJ6ATMaitWneLJtSroPos2uHgCNU=
X-Received: by 2002:a05:651c:551:b0:2f0:27da:6864 with SMTP id
 38308e7fff4ca-2f6105d7954mr228845611fa.17.1725541484830; Thu, 05 Sep 2024
 06:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090743.1204593-1-andy.shevchenko@gmail.com>
 <172552177868.28435.4071190094207246356.b4-ty@linaro.org> <20240905130121.GA166185@rigel>
In-Reply-To: <20240905130121.GA166185@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Sep 2024 15:04:34 +0200
Message-ID: <CAMRc=Mc=aK98ZYvz8AuwxYpqEPDAqG1kLcM+T24JipP6HW0L9A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: use !mem_is_zero() instead of
 memchr_inv(s, 0, n)
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 3:01=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Thu, Sep 05, 2024 at 09:36:20AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> >
> > On Wed, 04 Sep 2024 12:07:43 +0300, Andy Shevchenko wrote:
> > > Use the mem_is_zero() helper where possible.
> > >
> > >
> >
> > Applied, thanks!
> >
> > [1/1] gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)
> >       commit: b1da870ba36b3f525aee9be35b2f08a1feec61a7
> >
>
> As per my other mail, mem_is_zero() is not defined in gpio/for-next yet.
> So how does this work?
>
> If I build for-next I get:
>
> drivers/gpio/gpiolib-cdev.c: In function =E2=80=98gpio_v2_line_config_val=
idate=E2=80=99:
> drivers/gpio/gpiolib-cdev.c:1334:14: error: implicit declaration of funct=
ion =E2=80=98mem_is_zero=E2=80=99; did you mean =E2=80=98xa_is_zero=E2=80=
=99? [-Werror=3Dimplicit-function-declaration]
>  1334 |         if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
>       |              ^~~~~~~~~~~
>       |              xa_is_zero
>
>
> Cheers,
> Kent.

Ah, it'll have to wait until the next release cycle then. Sorry for
vacuuming patches too eagerly today. Dropping it.

Bart

