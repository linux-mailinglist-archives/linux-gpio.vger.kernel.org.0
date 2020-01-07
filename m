Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C011323CE
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgAGKit (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:38:49 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:44839 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727806AbgAGKit (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:38:49 -0500
Received: by mail-qk1-f194.google.com with SMTP id w127so42171314qkb.11
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fpJndPxyZ4R+jrK+jYf8rr5h0Mx9Gx0vV4jnzYZ9o90=;
        b=ZRYo76yK4Ep4lXuT3n8Ha2XS6sXPq73ctrxZg83MQEjRpIl4t+6y4n+h/bjxe1vLbg
         hCW9PizMi6zlo5oAScKGk0BsUz+mXQdA10p1IYRBvAev5hjg/UQuzrEHMKN6heFOHXdw
         GFPs1uH6Sxxwt8QHadQAndwGb2+q61QVCrBBx1S0xduB3Tiiyd8GYWmbKJXaLRYKHoSq
         kb5qM4jUpZwnWb0rjin3K4uokTrbMcNkYHWR9HLPyLNlgSBIZ4k7PLYKC3aKP7gXH6v1
         681NWvHC0KZLpD2uxAX4KHfcC4zRN94sNCDo9g7AFUaokK6X6NK2VR384HY5TKXuQ1Zw
         pcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fpJndPxyZ4R+jrK+jYf8rr5h0Mx9Gx0vV4jnzYZ9o90=;
        b=Av1SRaoJeP3UWB3CpEQaNcvtoyfPRa5gJld5aE6rBCEGwsyaJgzW6fKtDuafE1EeC+
         5VfbU9yuQV2g0F/wJCRxFeIpPa8NkECE8IAOhEmezvOmDvctLRjOTCaP16dexu8mPcTm
         JAIt5osTgU0wa4Z1z9TjKwpCNR1mBUYL0EMhnrDkbPgYfDfdjTGYs3j56e1ok2xvLkCe
         +8JOPpI74wy81jodzmV3nLtjNk3ooUrLkBHmPBOZsLR0GoKmzt5lVmoPo1rx/Nt+1jEb
         f67vWlTvddVNbvnazqKZEjw03xnngItQZm76/sSTpmagn5dAiflT8vsZ9MwnFCRCNpyr
         22pw==
X-Gm-Message-State: APjAAAUzCWa1cYxv+54klfaBLNo98veXsvuRyS/aknE+Nxl9wJzcNdnI
        ZjhlVXEyEu2s54xaCFWBqS8oNqd1l25DN0pG+ruSRQ==
X-Google-Smtp-Source: APXvYqx9JP/WGb4Aqga4lH+lNLo76HxwGBCa20iTllDpa40cjyNaPJ1zfTmbRokAgshaXrw25DIDAjbxam/gRTuuCVY=
X-Received: by 2002:a37:6255:: with SMTP id w82mr88081222qkb.330.1578393528231;
 Tue, 07 Jan 2020 02:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <CACRpkdZ_TroKCAnDWiY-jPbe0NL+ingm1pMLQLPxT1Uh78kx8g@mail.gmail.com>
In-Reply-To: <CACRpkdZ_TroKCAnDWiY-jPbe0NL+ingm1pMLQLPxT1Uh78kx8g@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 7 Jan 2020 11:38:37 +0100
Message-ID: <CAMpxmJXikLw0d1e1Eq7vVzoORz3utEBxfG6nRmkngLqezVqtuA@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] gpiolib: add an ioctl() for monitoring line
 status changes
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 7 sty 2020 o 11:07 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Tue, Dec 24, 2019 at 1:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > When discussing the recent user-space changes with Kent and while worki=
ng
> > on dbus API for libgpiod I noticed that we really don't have any way of
> > keeping the line info synchronized between the kernel and user-space
> > processes. We can of course periodically re-read the line information o=
r
> > even do it every time we want to read a property but this isn't optimal=
.
> >
> > This series adds a new ioctl() that allows user-space to set up a watch=
 on
> > the GPIO chardev file-descriptor which can then be polled for events
> > emitted by the kernel when the line is requested, released or its statu=
s
> > changed. This of course doesn't require the line to be requested. Multi=
ple
> > user-space processes can watch the same lines.
> >
> > This series also includes a variety of minor tweaks & fixes for problem=
s
> > discovered during development. For instance it addresses a race-conditi=
on
> > in current line event fifo.
>
> The patch set overall looks good to me, I don't understand the kfifo
> parts but I trust you on this, though we need review from a FIFO
> maintainer.

Ha! This may be a problem - there doesn't seem to be one. This is why
I Cc'd Greg.

>
> Could you send me a pull request of the first patches before the
> FIFO changes start, they are good cleanups on their own, also
> it brings down the size of your patch stack.

Sure, will do.

>
> Yours,
> Linus Walleij

Bart
