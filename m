Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8CB324216
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Feb 2021 17:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbhBXQaR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Feb 2021 11:30:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:33542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233482AbhBXQ3Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Feb 2021 11:29:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD72464DA3;
        Wed, 24 Feb 2021 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614184103;
        bh=kKdB/WD5paalw9c2TAIpowxNthjQ5ojhimY95FmQYl8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DnnYjOAQtG2XmL/p8DLOl0SJJbMuRxw1x+g3PIkVfd+LT83jAi7/Gy9nHnub5r9cj
         8twtkgQcD2Ea9NAtHMgOLD4XtfiKOrs5fHi1Kom0+pJV5Mqf6y6wf8rtCkIpqPdb+n
         bvdUPoD4gOi+PWt5fsJaTK3K1+Z3g03ZiaknmEd4=
Date:   Wed, 24 Feb 2021 17:28:20 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, rafael@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, frowand.list@gmail.com,
        pantelis.antoniou@konsulko.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 09/12] drivers: base: reintroduce find_bus()
Message-ID: <YDZ+pEY3vJZ+GsvO@kroah.com>
References: <20210208222203.22335-1-info@metux.net>
 <20210208222203.22335-10-info@metux.net>
 <YCen7uHqFJQ/U/5p@kroah.com>
 <da82c033-3a82-3420-4d06-f5c39c524ae9@metux.net>
 <YDYHhYRDBDKGSZ1r@kroah.com>
 <9db34ee4-30dc-9e69-6e82-00cbf4615ed5@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9db34ee4-30dc-9e69-6e82-00cbf4615ed5@metux.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 24, 2021 at 04:30:42PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 24.02.21 09:00, Greg KH wrote:
> 
> > Have the firmware code do it itself, do nto try to "reach across" like
> > this.
> 
> By "firmware code" you mean Linux acpi core or the board's bios ?

either.

> a) Fixing BIOS would be the cleanest solution, but we cant expect all
>    users to do field upgrades. Many of the devices (eg. the customer,
>    I've originally wrote the apu board driver for, deployed them in
>    really remote locations, sometimes even just reachable by ship,
>    heli or horse, litterally)
> 
> b) Explicit blacklisting somewhere in apci enumeration code could work,
>    but I really hate the idea of such board and bios version specific
>    quirks in a place, completely unrelated to the actual board driver.

We have quirks all over the place, that's normal and how we handle
broken hardware/bios al the time.

> Actually, I'm also hoping to find a proper way for having those things
> in one file per board, in the future. (probably not applicable for
> early stuff, or _OSI(Linux), etc)

I don't know what "things" you are referring to here at all.

> > And what problem are you really trying to solve here by doing this?
> 
> The problem is that *some* bios versions (that came much later, after
> pcengines-apuv2 driver went into production) added a few things that
> the driver is already doing - different versions doing it differently
> (eg. even enumerating gpio connected leds with completely different
> names, etc), and still some gpio connected devices missing. Some
> versions (just forgot, which one it's been exactly) even enumerate
> *some* gpios (and LEDs behind them) as a different device, whose Linux
> driver just happens to work. Meanwhile I can't find any reference of
> that in the coreboot source, anymore.

I have no idea what you are talking about here, you did not describe a
problem :(

> As you can see: bios is anything but reliable on that platform.

I do not understand.

> What I'm trying to achieve: the kernel should behave exactly the
> same, no matter what board revision, bios version, kernel version,
> etc. (there should be especially no need to have special per-board
> quirks in userland, depending on board rev, bios version, kernel
> version).
> 
> If you've got a better solution, I'll be glad to hear it.

I really do not understand the problem, sorry.

greg k-h
