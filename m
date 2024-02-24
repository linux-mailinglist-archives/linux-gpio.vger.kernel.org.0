Return-Path: <linux-gpio+bounces-3737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CC862875
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Feb 2024 00:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F768B212F5
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Feb 2024 23:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AA54E1CA;
	Sat, 24 Feb 2024 23:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbBhvHwd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689054CB20
	for <linux-gpio@vger.kernel.org>; Sat, 24 Feb 2024 23:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708817047; cv=none; b=Zn5kk2m/jWkLxikBKvP5EneOiJ7Rw68xYjKNwfMnBv1qC8GiGZLilfPzy57bU8IIG9wftB2hEOSxGrKyPJ2mJx2Y8xU6wmO9u6hQqdnGGJEeaLzDs1PHZmvtv8iN2le7qXIyHJFjHQVrzFvUPswL6rks/Iq9pR/EdgzOG02/gxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708817047; c=relaxed/simple;
	bh=NExMGPmaO68I7bD5whjX8BMTPNQ+bJb53lVRtGgPTVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnO5YTiwdM4OezcrhD8KYH4EvXdYNKb+S5W+VBsn42vmT60/Rlm804zhmMo6T98PR58tLgmlIhfJXVtNdDK1uAljuNAgfUHR0ySF26Ol0TpTU7krJyhtoy2p2fxKB5ze6OTQ/dpZOuQ0189Qo6LIPLcKpnlFcQiqR8vnFub8BY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbBhvHwd; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so2559603a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 24 Feb 2024 15:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708817044; x=1709421844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PywAt5/VDYbc0mnmOeunXfKxpQuRmyI7A4ywjCHlyu0=;
        b=ZbBhvHwduRraJqtvqNiPOLjosJnWFJG5d+n9qZsfo8+R6+qHT0py5Y5O/UKvGrgNls
         vEj3KVeYpvJM2sc/6ty4L4oW5msu6Y/zPasaWkzOI8XCVD5dT+zkVW9wLKoXdFxERe1F
         F5Yvi1P6zUFSwMvrUuhIHPDj5+jvPKlYdNpmnL6QLhLLUOACI2+2BbbzRUMeCgEQvSaB
         0zAHLtOkw7hAjGa1LXFycMarWuGo7hF0LdXdINIGwVt/fyMXpFP+OhXxg6M43lo6HucB
         zXdgmiiMSvkG4rGLqReteVpp1a6bJP6RDseBDWfDy52FlIw8IPELpAB+0vDyI9jg35Gf
         6ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708817044; x=1709421844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PywAt5/VDYbc0mnmOeunXfKxpQuRmyI7A4ywjCHlyu0=;
        b=jUIzKU3DfM42eIVI9wZTeWvmlmQj9jZuJn4T5Mzxk/DKRpKK8akNOyZrdcZDE13rq/
         Ko830qLCMKocwai0igVnfBDdliV0ziUvQ8cIW+GH9vkkWw0UhqJTmI0OvZN15wjdcT6s
         voYMJztl41bCXGnXAgWaqkGlKtuUNrTfpZPDG1WK4KthnAQ6mDQbiPKxlaOicMq5Lwhw
         n5H52Zgb3GPMTVgZiBK6LWYsajcTxRQi1QRIYh8AJFKaiDKHhpzaq/eFfhdQYimJyd3o
         HT+0G9NETwlp68snX9uIwhNUPBTn9buK+ub87v6gq69Xvd21NXgqM8AsZJiqnOGMj2OK
         Cg6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1UySQx+v4EZu8okUTZDwIqCKeb+PPWNlNSMxwBqMBkAcxHne9Z0ue5gaiYsIh336c4DmARgGROhVasrHoAeh71uiUIGSeKse1MA==
X-Gm-Message-State: AOJu0YzRyOdqANLgDkKTNiDQ5COuxvCxB/zIGqWjvBz0c0w/EyI9AUsA
	DrWCdc2jyUKGe3oZaPF2KvZxZl18Ak40NZaisWMh1bTvMVAkPd3gW6ktWErhSQW/WUuqQOrwYQw
	R3hKBVQDlTd6lFdmDMKXxBUs+RPs=
X-Google-Smtp-Source: AGHT+IEmEA39sb90QkCiimxyAbRLSspP4zopuLyW3W/GC8kp1/e2TvZ9fYnRKCcVIBunemt2LzOF1RGguqy1UhDbZvY=
X-Received: by 2002:a17:907:101b:b0:a3f:2c1:9887 with SMTP id
 ox27-20020a170907101b00b00a3f02c19887mr2276998ejb.21.1708817043466; Sat, 24
 Feb 2024 15:24:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com> <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
 <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
In-Reply-To: <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 25 Feb 2024 01:23:26 +0200
Message-ID: <CAHp75Vcm7wFKrUnt4qnRkUzcMqyqGVOsam-y6rHbYDjpPnSzyA@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Sat, Feb 24, 2024 at 4:58=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Fri, Feb 23, 2024 at 1:44=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.gi=
t gpio/for-next
> > > head:   7bb5f3a7ca8856c5c1fa26a6e3f58a1254019dc0
> > > commit: 36e44186e0badfda499b65d4462c49783bf92314 [42/47] gpio: mmio: =
Support 64-bit BE access
> > > config: um-allyesconfig (https://download.01.org/0day-ci/archive/2024=
0223/202402232058.4eDf4GRs-lkp@intel.com/config)
> >
> > UM Linux now again.
> >
> > gpio-mmio depends on HAS_IOMEM
> > and UM Linux has set HAS_IOMEM, but
> > also claims to support 64bit without providing the necessary 64bit
> > io-accessors.
> >
> > Maybe UM Linux need to be fixed?
>
> Nah, there were other reports for the same issues, at least for x86
> and alpha. I hope Andy will have some time to look into it early this
> week, otherwise we'll have to revert the offending patch.

So, the problem is that those architectures do define GENERIC_IOMAP
which does NOT have implementations of ioread64*()/iowrite64*(). And
we have dead code like drivers/vfio/pci/vfio_pci_rdwr.c (the part
related to 64-bit IO accessors), which nobody tried.

Arnd, maybe you can shed a light on why it is so?

P.S. The workaround is to open code using readq()/writeq() [with
swab64() for BE].

--=20
With Best Regards,
Andy Shevchenko

