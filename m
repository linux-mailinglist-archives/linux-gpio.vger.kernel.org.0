Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 922E612776B
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2019 09:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfLTIqF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Dec 2019 03:46:05 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:45829 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbfLTIqF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2019 03:46:05 -0500
Received: by mail-il1-f196.google.com with SMTP id p8so7274607iln.12
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2019 00:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KC26HLxDRJovHhJMQJ5lAOVG1MGnXvkpVbRgP05Myy8=;
        b=wGysDDgA6GikQjvpFg8fc9uWKd6ow/H5uWmlEJTvI6JSdWwXLy7FE3Jk45OM7TPvx8
         uDGbc6HjJYSEVAtx4uLF2iO4gIm6UMOpD2b+z2IlGicu85cZ7Pax5SHniFT1UWJv91tt
         dWsk/0xi4OGemcCc/UtNS94tkNge5KaCf0kwUQKC8SZWKmZYI756Ic7b5y+7FwczBX6y
         KMd8F4vcQdw20wrpAco9thUkr0jKhm2yz5exzZVOsmGj8wQbFg3e9PJXApdYVgi7oTyN
         huFMvLT5kaaXNxt58BBbOi1NPj4O4HMlL3fdS6mZxpf63vTvUavDdJAOXWWJEwDjpQ8f
         xpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KC26HLxDRJovHhJMQJ5lAOVG1MGnXvkpVbRgP05Myy8=;
        b=I6SgjCJYcDg5h2zUs515tEuxxI8/qAtxc1WwGJwLZDdA4UBjSfk6pWqZ/vBi8q/1K7
         BEUFB2/twaaMrZPI+pFKf9NrtsXayYUT++ecnlV6niXkg8IeVRTjNogHjGw1R4OG4PBU
         kfoN6SfhgOSv7TOJglYCtHBKPQg+V9crlafY/6Z7X7bcep4ok9vJTg9x8HkByX4Gcs5M
         rQyZEueGVx3tR0DMqK9BxNybbfRrc0yoppDZaWnnrtmtW4DKXv4XEGgYMCxG1SjNsYdC
         94xsoNoCHARePr30qMmk2amv2oGOiUhlo/9yeUpGR45Utu+rlFH/V/ykZV3m0OCuuCv9
         QPRA==
X-Gm-Message-State: APjAAAXPIZEX2vbSU0vPrHUER2DaRdIoKZfb7UpYad86/9zxw8WVkxGX
        6CsDaEiRGPxbna0owyxxJFhyIHmUHZ6f4aFbQ+CKIw==
X-Google-Smtp-Source: APXvYqzfZI/yDgZRH6zmbRR6u1hg2SOZ1sEwewAt9u+5DJxdAzgsObY6+rRXk4URsBrcWW71e7mazhPpGhACe16NMpw=
X-Received: by 2002:a92:8712:: with SMTP id m18mr6251028ild.40.1576831564827;
 Fri, 20 Dec 2019 00:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20191219171528.6348-1-brgl@bgdev.pl> <20191219171528.6348-13-brgl@bgdev.pl>
 <20191219172414.GA2094615@kroah.com>
In-Reply-To: <20191219172414.GA2094615@kroah.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 20 Dec 2019 09:45:53 +0100
Message-ID: <CAMRc=McM6VeOHj5hhk5bLoc=Vy3LTnuoCt-18s8BFOZDbChqqw@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 19 gru 2019 o 18:24 Greg Kroah-Hartman
<gregkh@linuxfoundation.org> napisa=C5=82(a):
>
> On Thu, Dec 19, 2019 at 06:15:27PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Currently there is no way for user-space to be informed about changes
> > in status of GPIO lines e.g. when someone else requests the line or its
> > config changes. We can only periodically re-read the line-info. This
> > is fine for simple one-off user-space tools, but any daemon that provid=
es
> > a centralized access to GPIO chips would benefit hugely from an event
> > driven line info synchronization.
> >
> > This patch adds a new ioctl() that allows user-space processes to reuse
> > the file descriptor associated with the character device for watching
> > any changes in line properties. Every such event contains the updated
> > line information.
> >
> > Currently the events are generated on three types of status changes: wh=
en
> > a line is requested, when it's released and when its config is changed.
> > The first two are self-explanatory. For the third one: this will only
> > happen when another user-space process calls the new SET_CONFIG ioctl()
> > as any changes that can happen from within the kernel (i.e.
> > set_transitory() or set_debounce()) are of no interest to user-space.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  drivers/gpio/gpiolib.c    | 191 ++++++++++++++++++++++++++++++++++++--
> >  drivers/gpio/gpiolib.h    |   1 +
> >  include/uapi/linux/gpio.h |  24 +++++
> >  tools/gpio/gpio-watch     | Bin 0 -> 26528 bytes
>
> Did you mean for this binary file to be checked in?
>

No, of course not, it's a mistake. I'll remove it in v4.

Bart
