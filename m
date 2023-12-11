Return-Path: <linux-gpio+bounces-1229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7107B80CF15
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 16:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B46B1F218A3
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 15:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC40A4A9AC;
	Mon, 11 Dec 2023 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pQp7tdFF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CF8D8
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 07:10:39 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-464a3734e49so970243137.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 07:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702307439; x=1702912239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt0xd6ymfldFt82CftQ2Jk00L8E2ATHh8dNouPPUuSo=;
        b=pQp7tdFFb1lQB++GZTJ4N9MrBezxyvWnpECQmcHVy+Ung2tZZXwdGKBYvq+A6a9TEF
         3eHA2svak5S4QqDHmtwOJrKC8PebAq7jIJ/YWW4CgPTD/+hQC7Acvcf5TfqWl1LaSRZd
         qSVkZEgD9fJxcIt9krl9YHVI4NUuc2Xxll9FswfmDKRhnYU7Aw2gRXpDkQvnLKRH4JI8
         hDUOrJkLRGkSVWo8F2xsdArMf3V0hUH/6FiAMx3C9WcmT/prnx71zsewBIPGVMavQReL
         1Do39h0JgbcPKPCeTarj9Ch5UJd9gb2DRBK4BpE/OtleEEudA5BJCtw67TsUSr2nCIcF
         /oUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702307439; x=1702912239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yt0xd6ymfldFt82CftQ2Jk00L8E2ATHh8dNouPPUuSo=;
        b=xTgwR+I1N1Fl8Le0VIQGEaHUfrwshvv7IpufGtnQ5q5nByrQ2G9b0p/t010tRKTLPC
         PnjoIgPvjBDNekdmjI3sdsJGJ2MJSmUPmR0ola2DdHOpwQ57RwDfuCB56QVvC25oShJL
         0c8SeCNfw2StvdYSh2WfrxtIxiH888dBzFewT7vPMmEZakYmo88ud2OTQ6JTeDtmIBB0
         XhihSp631/6GwgkMwjW6IN/Smb1lc319uQTQv8pqVw6odi6XPkBToY8tsJyDMQs2rxwL
         clUOUd4f7J+/GlwFC79rF8sUfHpSmjFvvR95PP4GqC0UBZSRRGe2jCoItnu7MBNg1T0e
         D8Eg==
X-Gm-Message-State: AOJu0YyWGI1zlmvFygLlJlutPBRN26VXSnkZqCN3gySR4RmmtFnhyqSB
	Ehu2FQ36ZMYZjJgdQtBXLyf2KLPrKq7r+btAspIcwA==
X-Google-Smtp-Source: AGHT+IElVh2Ge8kkTMPVji93Bb4HLofgmr+VhweCUDyct5Qa8FZRx3o407LXt6mZNI2dQEjb2Urb4YpyTa/vhwL1E2U=
X-Received: by 2002:a05:6122:3bc8:b0:4ab:f857:9489 with SMTP id
 ft8-20020a0561223bc800b004abf8579489mr4085824vkb.4.1702307438748; Mon, 11 Dec
 2023 07:10:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <ZXJq2zGjBT0yQAXv@rigel> <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
 <ZXLWHTjv9W-IH_OP@rigel> <CAMRc=MfXQb=A=4f0kFEW4ENuNk0ZmL_qAkWihEvFcYaizCf8LA@mail.gmail.com>
 <ZXLvfBWTAGZt0f0L@rigel> <CAMRc=MdhcYToMixdFh6Kf+GZ_MhDeHxd5_2U00neLGoH2M_P9Q@mail.gmail.com>
 <ZXPJXTm3pzBKFX08@rigel> <CAMRc=MdDg8pcu=iTCUDjdpgYMuBubjeL5po8Fmhz6z3ri0fOZw@mail.gmail.com>
 <ZXUjx5UTgC9tvkp9@rigel> <ZXW86Ad4MOq4IFsn@rigel>
In-Reply-To: <ZXW86Ad4MOq4IFsn@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Dec 2023 16:10:27 +0100
Message-ID: <CAMRc=MfG5jSrmiAxqnDTBd6L=RbD+ZZ2w5KqvH5zK70He6hG5g@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 10, 2023 at 2:28=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Sun, Dec 10, 2023 at 10:34:47AM +0800, Kent Gibson wrote:
> > > >
> > >
> > > We still need to connect linereq with its "parent" gpio_chardev_data
> > > somehow and make this link weak so that it can survive one or the
> > > other being destroyed. Maybe a notifier in linereq to which
> > > gpio_chardev_data would subscribe? It would send out notifications on
> > > changes to debounce_period which gpio_chardev_data could store. When
> > > linereq goes out of scope it sends a corresponding notification
> > > allowing gpio_chardev_data to unsubscribe before linereq is freed,
> > > while when gpio_chardev_data goes out of scope first, it unsubscribes
> > > when being released.
> > >
> >
> > No, there has to be a link between both and the supplemental info.
> > For gpio_chardev_data that is to create lineinfo, and for the linereq i=
t
> > is to keep the value reported in lineinfo mirroring the current value.
> > Below I suggested making the supplemental info a reference counted
> > object, with chip scope, referenced by both gpio_chardev_data and the
> > linereq. So last one out turns off the lights.
> >
> > Having the shadow copy allows most usage to avoid the tree lookup and a=
ny
> > associated locking (assuming the tree isn't inherently thread safe and
> > requires a spinlock to prevent modification during a lookup).
> > It is only populating the lineinfo or updating the value that would
> > require the lookup, and neither are a hot path (if there is such a thin=
g
> > in cdev).
> >
> > Hmmm, the radix_tree allocates a page of entries at a time, which might
> > be a bit of overkill per-chip, so maybe a global is the way to go?
> > Or something other than a radix_tree, say a rbtree?
> >
> > All this is getting rather complicated just to relocate one field, so I=
'm
> > starting to reconsider whether the desc was the right place for it afte=
r
> > all. =C2=AF\_(=E3=83=84)_/=C2=AF
> >
> > OTOH, I've partially coded my suggestion, to the point of skeletons for
> > the supplemental info, so if you like I'm happy to finish that off and
> > provide patches.  Though what remains is probably 90% of the work...
> >
>
> Bah, just ignore me wrt the supplemental info per chip.
> That solution only works for the chip fd used to request the lines.
> If you close the chip and re-open it there will be no connection between
> the new gpio_chardev_data and the existing line requests or the
> supplemental info.
>
> So it would have to be a global indexed by desc as you suggested.
> Well that sucks.
>

Yeah, I don't see any other way if we want to contain this within
gpiolib-cdev.c. I tried fiddling with notifiers but it went nowhere.
:(

Bart

> Cheers,
> Kent.
>

