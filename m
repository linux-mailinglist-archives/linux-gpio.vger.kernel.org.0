Return-Path: <linux-gpio+bounces-1273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4828380E072
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 01:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 033B92824B9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 00:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AE939B;
	Tue, 12 Dec 2023 00:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGTrum1K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615C899
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 16:47:14 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5d2d0661a8dso51230167b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 16:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702342033; x=1702946833; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKtNvmR1OGqhE8lo3DXe6G/FraRwOvDvfXypTok+jow=;
        b=JGTrum1KMYuzgmS8GMX3qNqxIWAl75GoPTXZWuW95aNCfIKqYcG0cZ146tlKgzuv6v
         c/oZx5ZW5e00BlFZEjdAxDs7bEnCKFIcWptOxFvcZzmkst7f47Wn3LD1bJFHm2JHWOKT
         lgXyN2wuAEU1toP03cLYTSTqM6J2dnVnKBw5hIoR/rfKByhid/o7VIt2ZMkDW8z3gixM
         v8y2JGogdgmHD3tRyhy1E0w7MXBdAwkI1hu3vIX6wtaSSrKWuClvLyAwllF3eFCYChc+
         ESrwtvYN6UswgnNRaNL1aF+LFU6B3YQFGA0IOjLq4aGGHfjOO0tLldCpo4XiVSNft+ej
         YA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702342033; x=1702946833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKtNvmR1OGqhE8lo3DXe6G/FraRwOvDvfXypTok+jow=;
        b=S9LM9UHc3bwT6bymBu0V90yxEyZNXd+N4Y94gKdjSOts/61DdJ7arrEqS0f4xKuZTW
         F5AlkEAOfqmDF3JyihqEYTe1fCebtynCnx5pxY58TRf9+pqHT05jsYgTCEsPd8OEdK9O
         5v2fDQYZmfvrkzNl21wPrSuMX4/ArRFNCepO9GBTwEU76ICLu7FHuXSJOYSpTAmVUQ7u
         QthrgKktKmwYFeNCzI8q4wCb6kYSlqYzp1CiTSf/IjWdBMezVQZ6Zbr6Yss1F0QDvLow
         hfor7JPAo7KqpyQcJa3sIKyJA1g0SssvPnCbRaUtom475Fw7OEopvKunsNH+6CWHGrd2
         tFlw==
X-Gm-Message-State: AOJu0YwSpEDWrW+WsxcvruOIYLDpF8oRm3NMkYcU9FE0zIkM5Apn+e6j
	ogsUYJpZ4nRXJgWi61HaycphOPjDaDc=
X-Google-Smtp-Source: AGHT+IGHfrRC7SVbafUIfQDibuGrGhhPKTg28bkyyuSdfflK6vfTd8hluP85cM0x93EBPVvzs4GGdQ==
X-Received: by 2002:a81:df06:0:b0:5d4:b7a:ebfc with SMTP id c6-20020a81df06000000b005d40b7aebfcmr4414185ywn.22.1702342033573;
        Mon, 11 Dec 2023 16:47:13 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id jk8-20020a170903330800b001c61073b076sm7315424plb.144.2023.12.11.16.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 16:47:13 -0800 (PST)
Date: Tue, 12 Dec 2023 08:47:07 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXetiwHbDGBWBDDF@rigel>
References: <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
 <ZXLWHTjv9W-IH_OP@rigel>
 <CAMRc=MfXQb=A=4f0kFEW4ENuNk0ZmL_qAkWihEvFcYaizCf8LA@mail.gmail.com>
 <ZXLvfBWTAGZt0f0L@rigel>
 <CAMRc=MdhcYToMixdFh6Kf+GZ_MhDeHxd5_2U00neLGoH2M_P9Q@mail.gmail.com>
 <ZXPJXTm3pzBKFX08@rigel>
 <CAMRc=MdDg8pcu=iTCUDjdpgYMuBubjeL5po8Fmhz6z3ri0fOZw@mail.gmail.com>
 <ZXUjx5UTgC9tvkp9@rigel>
 <ZXW86Ad4MOq4IFsn@rigel>
 <CAMRc=MfG5jSrmiAxqnDTBd6L=RbD+ZZ2w5KqvH5zK70He6hG5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfG5jSrmiAxqnDTBd6L=RbD+ZZ2w5KqvH5zK70He6hG5g@mail.gmail.com>

On Mon, Dec 11, 2023 at 04:10:27PM +0100, Bartosz Golaszewski wrote:
> On Sun, Dec 10, 2023 at 2:28 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Sun, Dec 10, 2023 at 10:34:47AM +0800, Kent Gibson wrote:
> > > > >
> > > >
> >
> > Bah, just ignore me wrt the supplemental info per chip.
> > That solution only works for the chip fd used to request the lines.
> > If you close the chip and re-open it there will be no connection between
> > the new gpio_chardev_data and the existing line requests or the
> > supplemental info.
> >
> > So it would have to be a global indexed by desc as you suggested.
> > Well that sucks.
> >
>
> Yeah, I don't see any other way if we want to contain this within
> gpiolib-cdev.c. I tried fiddling with notifiers but it went nowhere.
> :(
>

I've got a working patch that uses a global rbtree to contain any
struct line that contains supplemental information required by
the chip to fill out the info, i.e. a non-zero debounce period.
The rbtree keeps the memory overhead minimal, as compared to a radix_tree
or xarray, and only the lines containing supplemental info go in the tree,
so the tree size, and the lookup overhead, is kept to a minimum.
There is no performance impact on general use, though there is a minor
overhead in adding the line to the tree when necessary or doing the lookup
to construct lineinfo.

As well as reducing the visibility of that cdev specific field, it reduces
the size of the gpio_desc at the expense of larger struct line, which is
a net win (as there are fewer struct lines than descs), albeit a small one.

I'll tidy it up and submit it so you can see if that works for you.

Cheers,
Kent.

