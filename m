Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF2D51466E4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 12:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgAWLhb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 06:37:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:49504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgAWLhb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jan 2020 06:37:31 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A38F224125;
        Thu, 23 Jan 2020 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579779450;
        bh=WNpyOeiH6NxaelMzhoQuhfS3wxx0n6onafkM/Lk/XTg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sOdYSkEH5W0QkNzEk7RHS8cFmUMlw1F6i1GKMtOSzF3+fUYPxoNi/8Z9BT0eF89ik
         P8P0iDCViFCL8eJZSnMLbP3xqZdKGisNU1BQ957FD47r3Y/dUkA8je+pD++ovY9fcc
         jV2kn8jPgk9uObUgDLEgYUI9+2sfR9JRvGVpnTGo=
Date:   Thu, 23 Jan 2020 12:37:26 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 0/7] gpiolib: add an ioctl() for monitoring line
 status changes
Message-ID: <20200123113726.GA980445@kroah.com>
References: <20200109115010.27814-1-brgl@bgdev.pl>
 <CAMRc=Mf34JTo-mCCb-ubdY9=YsGQp-YrkhQMp811_wXyVtW-=Q@mail.gmail.com>
 <CAMRc=Mc80hudqxHMp87_Ro+k1YQNeo=FxYD0oZy_g7P=Z2w-Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc80hudqxHMp87_Ro+k1YQNeo=FxYD0oZy_g7P=Z2w-Zw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 23, 2020 at 11:15:05AM +0100, Bartosz Golaszewski wrote:
> wt., 14 sty 2020 o 08:44 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
> >
> > czw., 9 sty 2020 o 12:50 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > When discussing the recent user-space changes with Kent and while working
> > > on dbus API for libgpiod I noticed that we really don't have any way of
> > > keeping the line info synchronized between the kernel and user-space
> > > processes. We can of course periodically re-read the line information or
> > > even do it every time we want to read a property but this isn't optimal.
> > >
> > > This series adds a new ioctl() that allows user-space to set up a watch on
> > > the GPIO chardev file-descriptor which can then be polled for events
> > > emitted by the kernel when the line is requested, released or its status
> > > changed. This of course doesn't require the line to be requested. Multiple
> > > user-space processes can watch the same lines.
> > >
> > > This series also includes a variety of minor tweaks & fixes for problems
> > > discovered during development. For instance it addresses a race-condition
> > > in current line event fifo.
> > >
> > > First two patches add new helpers to kfifo, that are used in the later
> > > parts of the series.
> > >
> > > v1: https://lkml.org/lkml/2019/11/27/327
> > >
> > > v1 -> v2:
> > > - rework the main patch of the series: re-use the existing file-descriptor
> > >   associated with an open character device
> > > - add a patch adding a debug message when the line event kfifo is full and
> > >   we're discarding another event
> > > - rework the locking mechanism for lineevent kfifo: reuse the spinlock
> > >   from the waitqueue structure
> > > - other minor changes
> > >
> > > v2 -> v3:
> > > - added patches providing new implementation for some kfifo macros
> > > - fixed a regression in the patch reworking the line event fifo: reading
> > >   multiple events is now still possible
> > > - reworked the structure for new ioctl: it's now padded such that there
> > >   be no alignment issues if running a 64-bit kernel on 32-bit userspace
> > > - fixed a bug where one process could disable the status watch of another
> > > - use kstrtoul() instead of atoi() in gpio-watch for string validation
> > >
> > > v3 -> v4:
> > > - removed a binary file checked in by mistake
> > > - drop __func__ from debug messages
> > > - restructure the code in the notifier call
> > > - add comments about the alignment of the new uAPI structure
> > > - remove a stray new line that doesn't belong in this series
> > > - tested the series on 32-bit user-space with 64-bit kernel
> > >
> > > v4 -> v5:
> > > - dropped patches already merged upstream
> > > - collected review tags
> > >
> > > Bartosz Golaszewski (7):
> > >   kfifo: provide noirqsave variants of spinlocked in and out helpers
> > >   kfifo: provide kfifo_is_empty_spinlocked()
> > >   gpiolib: rework the locking mechanism for lineevent kfifo
> > >   gpiolib: emit a debug message when adding events to a full kfifo
> > >   gpiolib: provide a dedicated function for setting lineinfo
> > >   gpiolib: add new ioctl() for monitoring changes in line info
> > >   tools: gpio: implement gpio-watch
> >
> > Hi Andrew,
> >
> > could you Ack the first two patches in this series if you're fine with
> > them? The code they modify lives in lib/ and doesn't have an assigned
> > maintainer, so I've been told to Cc you on this series. It would be
> > great if we could get it in for v5.6 merge window.
> >
> > Best regards,
> > Bartosz Golaszewski
> 
> Gentle ping.
> 
> Greg: could you maybe ack the kfifo patches so that we can get this in for v5.6?

I am not the kfifo maintainer :(
