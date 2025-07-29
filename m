Return-Path: <linux-gpio+bounces-23878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DF5B14D7F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 14:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABB554E07D0
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 12:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1142728FAAD;
	Tue, 29 Jul 2025 12:12:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0F28CF61;
	Tue, 29 Jul 2025 12:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753791160; cv=none; b=C3HwCXZ9EZcfP5JeDjUOedcIfkzWHMaHXGQhvSZFIoMj8Uam2HzyyGB5+VqN+bUpe464dGN6sV1x67NySb8nNr9ScjVgH6LX29ccu+Ti+oopMU7P9HpmADH2zkIEnCd1l4LhR3XFVc2pcV2RJKHVRD5Rn4pbRf3C2EcA1SGa6+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753791160; c=relaxed/simple;
	bh=k/QzDvxzz7eUgrIoBQCTgy6Nq8zXFkfHD/A0I1l670Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZqkYGb1nKI17zQbgCOpZ8+jhOZXMrcDGZx4AF0rLRWbLpva/9TXr4XF61IK+jvpszIzGnOG9jm6oWVaMqDEIGsW8C+anFp7oZlD6VIUxlil1taOy6rvZjbzKrnctagXGGJ9XTZq7kXk6pT1ZQx3dsyERCdi3fzPcaBfnrdSTGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e7949d9753so1815324137.2;
        Tue, 29 Jul 2025 05:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753791155; x=1754395955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7XU1ug3rQX7pi1f2uA7IAzNZHjOYpNlCdoI3vP2IM8=;
        b=kR9UljK5BfKsmkTGDZhtvy2rpL5cLYI2gco3B9jbr6DdyyiAMCIDcLfsdUOfC9MF9U
         wpOMXVdhyTk3rTIFmLxeljVhpUWsjw0unbDk+swDgEnW4He2ZsRBcouTA8n4qdOjnbfw
         DS8KyRbbQA3TmGudruGlvTJVFcqIpPM/H7WUCqM0G5YmnUiswaVF79i0MTzC263kHhfj
         dQwGMbqDbSp1vJ2uMS1FZ+BZtPPKXT2tCUzjlfifYyDSh969W17EutqcFBFi0Iubarnl
         fZJcPtcBGD8e9kWfqNGggLR8JNwzvUqVQKjFZXCMjFVtFX4+R1uPcGuhr3Fy8CoSovAi
         Ly8w==
X-Forwarded-Encrypted: i=1; AJvYcCVwgLuRWRpyCimEWQnEzfbVGN4cUS0lo5fNPze6l88N159NBrOIM1/aoQ8SVJKSDbDvr83KpRsur9eF@vger.kernel.org, AJvYcCXNJunhmg+Y5xuL+XaZwj46IzqxWZZHq0TjWfeaRu1PuT0OZ6hkvTHa2P0SWOndsR2gsBIrLBWyImgLF/1b@vger.kernel.org
X-Gm-Message-State: AOJu0YyzOH31PuWHn4l1QmBSNBg/cibx6EZhyMuMNIgLF+Rrcdw19DA5
	hx1f+cdpwhYrx2D7l4A58+DHnvHusAMXznGV9VGlfGj3VWmJ5pSo3Jj+NRTmnBrI
X-Gm-Gg: ASbGncvnXOJC3cQgA+ik7CWc/mOaMdVRPkt/Tgv1gJ4VyHpZJV4IuLgoSfojGD05hfh
	6moGTbxUQMj8Ksd4+8UHo44+NwSzpN9DSss2XHWXRJ0HM/IrenqC1RwnF9ayLWcTEwLbjaeS/jN
	92RJZypA34mJn9eE5lCK5kVopG8GMaIGa+6Rtq4Fz5EE8fIs69u7+CSZlt5t2rLOyjM8gchVx4F
	LR66uYe5NgCfD/7wYOpvR3Vzcy4Na5N/DNBEb+BCGxwZqvtUNWyv1dRNTnijE6MXa1HJeLbUHBO
	kxEbGLgnJi6qIfm/nhVwRqDL9sExFidrDueWZDkPSFgZ7ArMl+M7YMKAGIaGRP+sPVVtymnLHwv
	eEt4zXGNYxr5XhIV+61tMWWT1usd8wPjZw09p/Eep++pcgnHfk2zP2COZGHWqtlnOMsusEw4=
X-Google-Smtp-Source: AGHT+IHSU2uf0KtXEg4BD/gwgWzGnCiuO/9wxbG0WhcTxO+FFd1I4ngtXr5apDzKD3UK55hlPzf8/w==
X-Received: by 2002:a05:6102:441a:b0:4fa:156c:b814 with SMTP id ada2fe7eead31-4fa3ff85f1cmr5793810137.23.1753791154774;
        Tue, 29 Jul 2025 05:12:34 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88b9a53df4bsm1500484241.13.2025.07.29.05.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 05:12:33 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-886c8de5d90so1056797241.0;
        Tue, 29 Jul 2025 05:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVV0Pxun46gDG1n06jA4hIGfKhKIxknJbJ5uapudWjpLjYHjXB61EVE0iZf2HQG4sB9bdZY4q2/OQqrhUGD@vger.kernel.org, AJvYcCXSoclzn0sRQ8xuNwEePowjtILK/fgrpxaWwfrd7R2hydC3zZ8mBZt8p9HZPYs8PjZ+c8dVEs4tlfkV@vger.kernel.org
X-Received: by 2002:a05:6102:3586:b0:4f6:25ca:e797 with SMTP id
 ada2fe7eead31-4fa3ffb4b3amr5387462137.25.1753791151998; Tue, 29 Jul 2025
 05:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726211053.2226857-1-arnd@kernel.org> <CAMuHMdU6Akz0GC2hooAxn=C2F0WjagPkzRKcH1SJiW0CBeUOaw@mail.gmail.com>
 <f0a2a000-381e-40d8-a9ac-4d75dba332e9@app.fastmail.com>
In-Reply-To: <f0a2a000-381e-40d8-a9ac-4d75dba332e9@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Jul 2025 14:12:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSsKeY-Uj1xA4SatDk+Mb0e4LJyOU=aS52YbA3DSMLrA@mail.gmail.com>
X-Gm-Features: Ac12FXwNtZApsYmdgRtNB5UxpJvCHRjvJTKkx3Z6TTt4ItX-oxBnFqiB4T-XmJI
Message-ID: <CAMuHMdUSsKeY-Uj1xA4SatDk+Mb0e4LJyOU=aS52YbA3DSMLrA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	kernel test robot <lkp@intel.com>, Peng Fan <peng.fan@nxp.com>, 
	Koichiro Den <koichiro.den@canonical.com>, Lee Jones <lee@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
	Thomas Richard <thomas.richard@bootlin.com>, Yixun Lan <dlan@gentoo.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Tue, 29 Jul 2025 at 13:58, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Jul 29, 2025, at 12:47, Geert Uytterhoeven wrote:
> >>
> >> -if GPIOLIB
> >> -
> >>  config GPIOLIB_LEGACY
> >>         def_bool y
> >>
> >> +if GPIOLIB
> >> +
> >>  config GPIOLIB_FASTPATH_LIMIT
> >>         int "Maximum number of GPIOs for fast path"
> >>         range 32 512
> >
> > This won't work for everything.
> > While I now get CONFIG_GPIOLIB_LEGACY=y in all m68k defconfigs, and
> > simple inline functions like gpio_is_valid() are now available, more
> > complex functions will still fail, as drivers/gpio/gpiolib-legacy.c
> > is not built.
> >
> > drivers/Makefile:
> >
> >     obj-$(CONFIG_GPIOLIB)           += gpio/

> Do you have an example config that shows this problem?
> I've tried a couple of configurations on m68k now but are unable
> to reproduce this, using 'defconfig' (without GPIOLIB) and
> 'm5475evb_defconfig' (with GPIOLIB).
>
> The intention of this patch (in combination with the previous one)
> was that the legacy interfaces would still behave exactly like
> before, falling back to the stubs when GPIOLIB is disabled.

I haven't seen any actual failures.  When discovering
CONFIG_GPIOLIB_LEGACY=y in all m68k defconfigs, my initial worry
was that it would increase kernel size by needlessly including
gpiolib-legacy.o. When that didn't turn out to be true, I started
wondering how your commit would fix anything without including
gpiolib-legacy.o.  Looks like any users just uses the simple static
inlines...
Sorry for confusing you.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

