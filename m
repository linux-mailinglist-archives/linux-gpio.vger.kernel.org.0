Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8388630A806
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 13:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbhBAMvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 07:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhBAMvx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 07:51:53 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10D7C06174A
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 04:51:11 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id c2so18664409edr.11
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 04:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=99K/EF8ap1CiP71x9aIjvCk10jXDUyV7c2MsOixEVK4=;
        b=Y3Nnz8aBRx6Xlc+J5On8wHvesnKtUu0cbQXCzgimdqjPKtjCPm+VMJJ+uPo9Z+tuXc
         zUEfh0o1RlDTdpxuDg2tBLqnY1xQ8IOBtVDXPXSX3FUU6QowiErZDZlumLCYXHNjSWDX
         ltHaMtmmOoIzjmPRr86YXUFS+g+I53NGga4nkPel6I8ylQQQBJXmHs+fyICNBrOcfdD/
         0YmofOgHtgEjCVZCU3FwpzdoTf5hiIf+MjrujbnjrF16nIwLNFLPtYMqHocCix4Mnj2F
         4X/5mOuchXexuQFYn7+1d8H+mdK60Kh+fpua1B/5XEPAptQHGWG4V2nQ/r10rNmOd3Nk
         yxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=99K/EF8ap1CiP71x9aIjvCk10jXDUyV7c2MsOixEVK4=;
        b=tVNXFDp5eaGUk+bTX1iJTO+10cIakT62XsCCkWmJCTirp2Fj74MAzYuoWkEOW0WAOT
         aCISPcJMJGNtzroDWZ2dwTrRPJegjFCiSbRkBNPHiFbhnrhhCzfLxOnGF6Z373uGUEdt
         cY/4oHMO/Rb36rLYtemtSKCQLqSr/GTXBIPnoOUhSHi/eZgjvLLUnKytIatCqLZagp/k
         8fad0HFFrmcjIiXaWN9E/N6JrDczI/nvSBPA9s5/bX/iZ6y2U1FmBxjAjoF2xLkMR176
         n795bJ6hsxlXAgZivNdYr+P3RFaZgZFLVFCv3NySrEDAeo9jjTHGQn2WfpaI3R0qIVy5
         SF9Q==
X-Gm-Message-State: AOAM5311e8EAVf5LhHtULKcRJfZi5uDPs7iPZSG3SNtzOPSQ+REkJF3q
        RiemEgCn3Qjoo8pUSyG52uSGc5R1+PL1kagS40l4aw==
X-Google-Smtp-Source: ABdhPJxEJIiYWFh5liELORkIrjhm4NMzljbFC5qJG+8hvYvuAIRHvURuyUo7jeO+MTq0Cvi556IKvPL/Jxc6zm9Lmjk=
X-Received: by 2002:aa7:d60f:: with SMTP id c15mr18475109edr.232.1612183870704;
 Mon, 01 Feb 2021 04:51:10 -0800 (PST)
MIME-Version: 1.0
References: <20210129134624.9247-1-brgl@bgdev.pl> <20210130212009.2uugdj6vmisegau2@pengutronix.de>
 <CAMRc=MdwoJCw1-BdNRnfRFaXYfZD0+vn_8yq0J+rshHqZMdDXQ@mail.gmail.com> <20210201092436.srqgfemnchyuubsf@pengutronix.de>
In-Reply-To: <20210201092436.srqgfemnchyuubsf@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 1 Feb 2021 13:50:59 +0100
Message-ID: <CAMRc=McfTsAw4d+hEeRzm5XZ0uGiWEZYCjyFP0xTvN=L1gYh3A@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpio: implement the configfs testing module
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 1, 2021 at 10:24 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> On Mon, Feb 01, 2021 at 09:37:30AM +0100, Bartosz Golaszewski wrote:
> > On Sat, Jan 30, 2021 at 10:20 PM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > Hello,
> > >
> > > On Fri, Jan 29, 2021 at 02:46:16PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > This series adds a new GPIO testing module based on configfs commit=
table items
> > > > and sysfs. The goal is to provide a testing driver that will be con=
figurable
> > > > at runtime (won't need module reload) and easily extensible. The co=
ntrol over
> > > > the attributes is also much more fine-grained than in gpio-mockup.
> > > >
> > > > I am aware that Uwe submitted a virtual driver called gpio-simulato=
r some time
> > > > ago and I was against merging it as it wasn't much different from g=
pio-mockup.
> > > > I would ideally want to have a single testing driver to maintain so=
 I am
> > > > proposing this module as a replacement for gpio-mockup but since se=
lftests
> > > > and libgpiod depend on it and it also has users in the community, w=
e can't
> > > > outright remove it until everyone switched to the new interface. As=
 for Uwe's
> > > > idea for linking two simulated chips so that one controls the other=
 - while
> > > > I prefer to have an independent code path for controlling the lines=
 (hence
> > > > the sysfs attributes), I'm open to implementing it in this new driv=
er. It
> > > > should be much more feature friendly thanks to configfs than gpio-m=
ockup.
> > >
> > > Funny you still think about my simulator driver. I recently thought
> >
> > It's because I always feel bad when I refuse to merge someone's hard wo=
rk.
> >
> > > about reanimating it for my private use. The idea was to implement a
> > > rotary-encoder driver (that contrast to
> > > drivers/input/misc/rotary_encoder.c really implements an encoder and =
not
> > > a decoder). With the two linked chips I can plug
> > > drivers/input/misc/rotary_encoder.c on one side and my encoder on the
> > > other to test both drivers completely in software.
> > >
> > > I didn't look into your driver yet, but getting such a driver into
> > > mainline would be very welcome!
> > >
> >
> > My idea for linking chips (although that's not implemented yet) is an
> > attribute in each configfs group called 'link' or something like that,
> > that would take as argument the name of the chip to link to making the
> > 'linker' the input and the 'linkee' the output.
>
> I still wonder why you prefer to drive the lines using configfs (or
> sysfs before). Using the idea of two interlinked chips and being able to
> use gpio functions on one side to modify the other side is (in my eyes)
> so simple and beautiful that it's obviously the right choice. But note I
> still didn't look into details so there might be stuff you can modify
> that wouldn't be possible with my idea. But obviously your mileage
> varies here.
>

Not only drive but also check the input mode using a different code
path. My thinking is this: if, for example, we're checking the input
mode, let's not involve the core gpiolib's output code from a
different chip. Let's try to isolate the specific use-cases. Keep in
mind that my particular use-case is testing the uAPI with libgpiod's
test suite.

Also: previously it was debugfs, now we're switching to configs (for
configuring the devices) and sysfs (for controlling them).

Bart
