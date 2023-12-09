Return-Path: <linux-gpio+bounces-1150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2606A80B60B
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 20:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85913B209C4
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 19:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3C21A287;
	Sat,  9 Dec 2023 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VVEFwF7K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0594B7
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 11:25:10 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7c5a2b5e77bso706443241.1
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 11:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702149910; x=1702754710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZrRO7wtKaAPihmIBNohxgD/rDZUwh4SB9WrAySvJaE=;
        b=VVEFwF7KHHlY/EzZM6RJT+37ljaXggkuVIctLLi5VL7PBtAd2hONeAy9Vjod6iZWCM
         7XFjxDUeZHlg9fcz5Ut04ly2Wiq+HJxo1a2Rm7Ngqwq5iSYh2K25YmWn4x5B8AQdZXMR
         ejJjhpGqMdOaCMOTQVvim2wIv4sQd1dc3YHdDuVxSYcqCopsymMhTb/yDp6pyQP0oOEX
         bv+hcmBN6+BmQMGl73EEvp/sCD17nsQA37OazhVKDNp6xsMWfN2jy1aI4+cbZwe1WCmk
         d1i1vXALfnQbZGwBmVsTBjcE3lg69VJekGUTJDwuQ4y/V0FT1IsOft6jsv1jxBQ/5xZD
         y9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702149910; x=1702754710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZrRO7wtKaAPihmIBNohxgD/rDZUwh4SB9WrAySvJaE=;
        b=rkTGcrAhXoKGPn5+Kksy1he3Xb8nlNDPKGkO5dLjKL3pitWHTbhsQMTBOYL7eefTSO
         +bVlxXZoMRD7ziR5rKWxZBeH5e9KUhcjwN5w+0yipc6kvq1LF9Xf8RwSCboTO+Ls4rS3
         EZTF4PyFCLOmJJTnZNovN+efg4QTHzbRQekiovT1NIUHDdIWsN9dbHDkiND+p6emS+vK
         OUwXaGtRNKvmQ2CPdjRXUyqc7dEp1sGub9OX6AnwpTu3maVkRb+NDeDJolWUel9wfpom
         w56Jm7aSBixDJyJtVF/bhPFaQpPqqGiv09/vGh8l3kgTRyHVkrroIaKwL9KrY29TgFnd
         D0LQ==
X-Gm-Message-State: AOJu0Yzi9PRTBc/zK+2zqVH64Na2IhzYYg7ofEQgzvap/p+UjPgpm3/K
	uXlVMVjkSMz0CmQlgJ2ro3+1Ummv6MmCuHQuqcuFbg==
X-Google-Smtp-Source: AGHT+IF+aNaCz4s+PqgbbJ+9KmvZ9wpkjKoEF9ZQxqCsUIp7MQ4eWBv7qA5QrEa90loSntrAtZ9n5k2Xz5ctpa5pzPY=
X-Received: by 2002:a05:6122:200f:b0:4ab:eb8a:937f with SMTP id
 l15-20020a056122200f00b004abeb8a937fmr2241943vkd.15.1702149910086; Sat, 09
 Dec 2023 11:25:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel> <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <ZXJq2zGjBT0yQAXv@rigel> <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
 <ZXLWHTjv9W-IH_OP@rigel> <CAMRc=MfXQb=A=4f0kFEW4ENuNk0ZmL_qAkWihEvFcYaizCf8LA@mail.gmail.com>
 <ZXLvfBWTAGZt0f0L@rigel> <CAMRc=MdhcYToMixdFh6Kf+GZ_MhDeHxd5_2U00neLGoH2M_P9Q@mail.gmail.com>
 <ZXPJXTm3pzBKFX08@rigel>
In-Reply-To: <ZXPJXTm3pzBKFX08@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 9 Dec 2023 20:24:59 +0100
Message-ID: <CAMRc=MdDg8pcu=iTCUDjdpgYMuBubjeL5po8Fmhz6z3ri0fOZw@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 9, 2023 at 2:56=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Fri, Dec 08, 2023 at 07:54:40PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Dec 8, 2023 at 11:27=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Fri, Dec 08, 2023 at 10:52:09AM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Dec 8, 2023 at 9:38=E2=80=AFAM Kent Gibson <warthog618@gmai=
l.com> wrote:
> > > > >
> > > > > On Fri, Dec 08, 2023 at 09:13:17AM +0100, Bartosz Golaszewski wro=
te:
> > > > > > On Fri, Dec 8, 2023 at 2:01=E2=80=AFAM Kent Gibson <warthog618@=
gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, Dec 07, 2023 at 07:37:54PM +0100, Bartosz Golaszewski=
 wrote:
> > > > > > > > On Tue, Nov 28, 2023 at 11:47=E2=80=AFAM Bartosz Golaszewsk=
i <brgl@bgdev.pl> wrote:
> > > > > > > > >
> > > > > > > >
> > > > > > > > [snip]
> > > > > >
> > > > >
> > > > > Yeah, no need to risk other GPIO users messing with it if it is o=
nly there
> > > > > for cdev.
> > > > > Want me to take a look at it or are you happy to take care of it?
> > > > >
> > > >
> > > > If you'll find the time to do it in the following days then sure, g=
o
> > > > ahead, otherwise, I'll have some pare cycles today and next week to
> > > > spend on it.
> > > >
> > >
> > > It would probably take me longer than that to context switch, so go f=
or
> > > it.
> > >
> >
> > Well I went for it and it turns out to be quite tricky. We have
> > linereq and gpio_chardev_data that have independent lifetimes and the
> > only resource they share is the gpio_device and - by extension - gpio
> > descriptors . If we want to store some additional data locally within
> > the context of gpiolib-cdev.c then I see the following options:
> >
>
> Well that probably explains why putting it in the desc made so much
> sense at the time.
>
> Lets take a look at the code...
>
> I had thought it could be moved to struct line (contained within
> struct linereq), so basically replacing line->desc->debounce_period_us
> with line->debounce_period_us.  That almost works, but the problem there
> is that gpio_desc_to_lineinfo() returns the debounce period in the line
> info - and there is no way to access the linereq/line from the desc...
>
> Ah, so the lineinfo_get/_v1() functions that call
> gpio_desc_to_lineinfo() also have the gpio_chardev_data to work with -
> now I see where you are coming from.
> (Debounce is not relevant for v1, so that reduces the problem to
> lineinfo_get().)
>
> > 1. Global radix_tree containing additional configuration
> > (debounce_period_us for now) looked up by the descriptor's address.
> > Lookup can be done locklessly using RCU and from atomic context
> > (interrupt handlers in cdev code).
> >
>
> The irq handlers are already protected from changes to debounce period.
> It is either set before the irqs are enabled (in the request), or the
> irq is disabled, debounce updated, and irq re-enabled (in set_config).
>
> > 2. Reference counted wrapper around descriptors. It would look somethin=
g like:
> >
> > struct gpio_cdev_desc {
> >     struct kref ref;
> >     struct gpio_desc *desc;
> >     unsigned int debounce_period_us;
> > };
> >
> > And then struct gpio_chardev_data would store an array of pointers to
> > this wrapper while struct line would store a pointer to it instead of
> > directly referencing struct gpio_desc.
> >
> > Any other ideas?
> >
>
> I still think the primary location for any additional line config is in
> struct line - that makes it clear and simple for the majority of cdev and
> matches the lifetimes of the accessors (other than lineinfo_get()).
>
> The only issue being how to access that info from lineinfo_get().
> I guess we can't stop reporting the debounce in the line info :-(.
>
> Rather than worry about an linkage between gpio_chardev_data and the
> linereq/line, I would consider a separate copy of this supplemental line
> info for the chardev, possibly using a radix_tree as you suggest.
> That would be updated by the linereq to match its value in struct line.
> So basically Option 1 but for a shadow copy of the additional info.
>

We still need to connect linereq with its "parent" gpio_chardev_data
somehow and make this link weak so that it can survive one or the
other being destroyed. Maybe a notifier in linereq to which
gpio_chardev_data would subscribe? It would send out notifications on
changes to debounce_period which gpio_chardev_data could store. When
linereq goes out of scope it sends a corresponding notification
allowing gpio_chardev_data to unsubscribe before linereq is freed,
while when gpio_chardev_data goes out of scope first, it unsubscribes
when being released.

Bart

> I'm not a fan of globals, so would go per chip and indexed by line
> offset rather than desc. But then, given the lifetime issues at play, tha=
t
> would have to be in a reference counted object that both gpio_chardev_dat=
a
> and linereq would reference.  So swings and roundabouts.
>
> Does that make sense? Anyway, that's my $/50.
>
> Cheers,
> Kent.
>

