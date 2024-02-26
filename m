Return-Path: <linux-gpio+bounces-3765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137E86774E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 14:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 425441C29936
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 13:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE278128839;
	Mon, 26 Feb 2024 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tx2ecgEh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567A7E570
	for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708955765; cv=none; b=aIXzQgNexAntBgYzxLOTEROfJgMrHMMQZ4dFdsYBSGxqYtd7Vb2xMmLJPlE4/cLLwt2svbw6LsdTQuvCRWdRAAtarfH1kJYCpVim3MDc4alFz1SHuhvtRkgvEc7pK0VGjm7YQ1TgBmLCaRquT+BZOkjGXnoFtEevx+nN9hZBeDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708955765; c=relaxed/simple;
	bh=kijFRXEAIJIOHnczCA4GyA6DZgP9USLWRFlWcZX8esE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbuJBVM8YBq9TewAV0H002+w0L+hY1oY7J8l/3S7PnyceLUie3gbSiZtBSlBexP4lEqQtTvoSnyyOMklHqoCB2HeVZYN8FqAcDUeRPN/d37iBxPOSQvA3XludXJZQrqwxUy9LKAze6rWIbrGGbu+JTfTNyiXdo2UEa4nAEfGKIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tx2ecgEh; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so2488282276.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 05:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708955761; x=1709560561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kijFRXEAIJIOHnczCA4GyA6DZgP9USLWRFlWcZX8esE=;
        b=tx2ecgEhWex9XKDLFHuCV3+VPekXwhUr5bfyex90g7L0vYfcrx0GurDSPsTCkmHgRG
         HzZEtKl1LZMABLCP5I/EpAJPYjtBsZCsN9KlsgDnEvzkfAEHyaHZB58IX7P0Y17Jj8S3
         fWE8ga7k9ntpw8IPlQ+ZOG5qoxqMgDqMIy6K0Qa0fmNNIVvku8ZqEZWwj1Ywbru5S3jQ
         mEC36nKehycO0tGqQ7qpIXuYMDtonbfhomqjQin9u5JlHNIy7RKiPgHAyXsu3s/Wd0JL
         N/W/q92IAhzGP9VeUC4fZhBXr0Yq/EUcw3WUIZBSHE3lpG+b+UyJUxleW1rxvoe9K5J+
         P7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708955761; x=1709560561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kijFRXEAIJIOHnczCA4GyA6DZgP9USLWRFlWcZX8esE=;
        b=t442iZTTrUV9cEzeSM4iXZdO+/oEC5DASIfRh4JCUFC9OTpOJEMCZ45MpMzBYDnvjD
         8J6z9jfoRdoB05OpMr96cKqJI0RtoitPt1NZCkxhqLUo5Ex9U0QeUrucZr7xVI/a961s
         RxqPdUyU2Llc7flxkCXdPU9MjLB77l5E8ToYWDgZxfCmB0zlV1ntbnYGGIonMRWMI+Zs
         UNfkSxZEdl4DHrJLsCaftKj7hre51ssX83EdhlVBZBbQ82IAko+ZI/EZsqEWWm2NrkO4
         Ubd+oKVYFrmS2xpxxZcky7MGMRBNTiebrtwrh6YmidkbUWoNkjaBlbG9tt7wtm+iio1M
         Od3A==
X-Forwarded-Encrypted: i=1; AJvYcCXQMWiAvs2J4glQ9RjTXRspH4c8n545CTShOwIOSFPujhGlsJhtt2D0zIvgQnW1GxTILGfBCeCugz9da6sm+gqnMnFXPtduEK5EeQ==
X-Gm-Message-State: AOJu0Yzc89wAvTbDNiHkT1698CPG2zCJRwH2QSJfmzhqjumUJCBabmBE
	j7MRYx4jwUO0dh0hd4oB7q/ZZjGj7p27781UhEupRuWjTUzsMpKxMgba3cm4C1uD3QKVB0d+z4b
	yk6jTs1D9dFTzToBtSg2ZDQhIjWKrQ96aqQmYeg==
X-Google-Smtp-Source: AGHT+IE0H7nN9il0DDLEq97xEWt7P5bKjUTnamF0j64gQzOWuB/3LyNokYd9GN4dUQscjFFY6+cKu2SDmRHXZHc1xJs=
X-Received: by 2002:a25:ed06:0:b0:dcc:fe98:368 with SMTP id
 k6-20020a25ed06000000b00dccfe980368mr3993446ybh.19.1708955761273; Mon, 26 Feb
 2024 05:56:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com> <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
 <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
 <CAHp75Vcm7wFKrUnt4qnRkUzcMqyqGVOsam-y6rHbYDjpPnSzyA@mail.gmail.com>
 <522ab6e6-97b4-472d-8a1e-a495a263dda3@app.fastmail.com> <CAHp75VeSJ62oYBTpt4a80eH3tuyjJ_mRZe=P2w3yKKattmh1vg@mail.gmail.com>
In-Reply-To: <CAHp75VeSJ62oYBTpt4a80eH3tuyjJ_mRZe=P2w3yKKattmh1vg@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 26 Feb 2024 14:55:50 +0100
Message-ID: <CACMJSesNN5A0ungLKWdV69nb8j4s=7334xZSRNt_sB64aQq4vA@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 at 03:18, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
>
> On Sun, Feb 25, 2024 at 11:09=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> > On Sun, Feb 25, 2024, at 00:23, Andy Shevchenko wrote:
> > > On Sat, Feb 24, 2024 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
>
> ...
>
> > > So, the problem is that those architectures do define GENERIC_IOMAP
> > > which does NOT have implementations of ioread64*()/iowrite64*().
> > >
> > > Arnd, maybe you can shed a light on why it is so?
> >
> > The problem here is that x86 cannot do 64-bit accesses
> > to IORESOURCE_IO() mappings, so neither inq()/outq() nor
> > ioread64()/iowrite64() can be implemented for it without
> > splitting the access into two 32-bit ones.
> >
> > If you have the specification for the device that tries
> > to use this, you should be able to work out whether
> > the top or the bottom half of the 64-bit register comes
> > first and replace it with a pair of 32-bit accesses that
> > work on both I/O and memory space, see
> > include/linux/io-64-nonatomic-{hi-lo,lo-hi}.h
> >
> > > And we have dead code like drivers/vfio/pci/vfio_pci_rdwr.c (the
> > > part related to 64-bit IO accessors), which nobody tried.
> >
> > I could not figure out what that code is even trying to do,
> > with its extra byteswap.
> >
> > > P.S. The workaround is to open code using readq()/writeq() [with
> > > swab64() for BE].
> >
> > readq()/writeq() are not generally a replace for
> > ioread64()/iowrite64() because they can't deal with ioport_map()
> > type mappings, though the reverse is true and you can always
> > replace readl()/writel() with ioread32()/iowrite32() if you
> > can live with the performance overhead on x86.
>
> The driver in question by name assumes that it won't perform IO port
> access. Perhaps use of ioread*()/iowrite*() is not what we should even
> consider there, Linus, Bart, do you know if gpio-mmio was ever used
> for devices that want IO port rather than MMIO accesses?
>

I don't know the answer. I'd also like to stabilize the for-next
branch as we're pretty late in the cycle so I'm really considering
backing this patch out unless you think you'll be able to fix it soon?
I'm quite busy ATM and will be travelling this week so can't really
spend time on it.

Bart

> --
> With Best Regards,
> Andy Shevchenko

