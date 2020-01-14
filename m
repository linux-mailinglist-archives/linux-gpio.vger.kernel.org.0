Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3BA13A239
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 08:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgANHpE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 02:45:04 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:42047 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729127AbgANHpE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 02:45:04 -0500
Received: by mail-io1-f67.google.com with SMTP id n11so12765782iom.9
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2020 23:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hoU6RssdMpUOFqr8G6xUtx2/zFnAaDEKzQqZ2pDk/9g=;
        b=mA7N7Op7kUYgfpqMfsIfTlX26LjxQVJpfur8Qz8Am9Fdl58faZZCbRNKYDT8QW+gu+
         uFfp00SRawjC1/hrMV4gbk9M0o/fhjbTP60+MehfuI/f0xSBQeHCSaRsrldNW7IDQbHl
         8ELO4afCsPg5Y6+uWRzqCWDGYWIFcU5guMdwaUZdCQq/45OnfNap2ex8+zlC+q3ejZIc
         CqeoPo2QkT7v21V4x11CnD8ID1WNywo+1J6GM0uyi22KyTrMCAJvo5HPnNhP8KmhKHmg
         e31nceuhNOrDr34Q7W98Dz+yllEak1r8Ge5/RC9/EcLNFz++oPcj7ZLOM/5PJPQa/mrp
         F3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hoU6RssdMpUOFqr8G6xUtx2/zFnAaDEKzQqZ2pDk/9g=;
        b=CeZytgrD3MIK2OsS9+YeB2wHM6WeclZT+gxemF3QBCUTAmC+4B5vwRz5EenCQh5vM2
         FnAUinJmXI420YcnpB4ePcaszQghGbgXpyq6EaW1HLXxNT7Wg+Qx3+gNbI2JWoYlq3PF
         uJPSXmImN++zRgaKRSS/vq6nL4ypfXJIAPCIWvSRbzQz3YiQG05dxIMsK46fGwgEe/Lp
         2jzKPNS1XIr3Bk7tN7g9FZGnYHcbjZjPGU2kKWUZAopQvrGM5vAI2oRrOIsdEtuZ5koJ
         CWBN6oFNrG4tjsVBE94A6T1AfbzqYbxKV+6gALRYz4jGXigySJG2A6DX4V6FeIb6dNRR
         CmwA==
X-Gm-Message-State: APjAAAUQ1hT1fn0sG5kVT3xikgxg7At8ygnHczG5/kdyfxkeaBGqH04l
        Vw8HHKQjbtHZPfDhQ0VB5UIjLDCnAwCdW3+Pu9s48Xcm
X-Google-Smtp-Source: APXvYqzAh2T2cAKb3Cs79hOXveFHjbvjhUfIyQdCCAoBmuB7aXLxMczzgL7HSLXmWyrIPcGsg4iXgsEzHnFBDxb1JV4=
X-Received: by 2002:a05:6602:220b:: with SMTP id n11mr16743494ion.6.1578987903228;
 Mon, 13 Jan 2020 23:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20200109115010.27814-1-brgl@bgdev.pl>
In-Reply-To: <20200109115010.27814-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 14 Jan 2020 08:44:52 +0100
Message-ID: <CAMRc=Mf34JTo-mCCb-ubdY9=YsGQp-YrkhQMp811_wXyVtW-=Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpiolib: add an ioctl() for monitoring line status changes
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 9 sty 2020 o 12:50 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> When discussing the recent user-space changes with Kent and while working
> on dbus API for libgpiod I noticed that we really don't have any way of
> keeping the line info synchronized between the kernel and user-space
> processes. We can of course periodically re-read the line information or
> even do it every time we want to read a property but this isn't optimal.
>
> This series adds a new ioctl() that allows user-space to set up a watch o=
n
> the GPIO chardev file-descriptor which can then be polled for events
> emitted by the kernel when the line is requested, released or its status
> changed. This of course doesn't require the line to be requested. Multipl=
e
> user-space processes can watch the same lines.
>
> This series also includes a variety of minor tweaks & fixes for problems
> discovered during development. For instance it addresses a race-condition
> in current line event fifo.
>
> First two patches add new helpers to kfifo, that are used in the later
> parts of the series.
>
> v1: https://lkml.org/lkml/2019/11/27/327
>
> v1 -> v2:
> - rework the main patch of the series: re-use the existing file-descripto=
r
>   associated with an open character device
> - add a patch adding a debug message when the line event kfifo is full an=
d
>   we're discarding another event
> - rework the locking mechanism for lineevent kfifo: reuse the spinlock
>   from the waitqueue structure
> - other minor changes
>
> v2 -> v3:
> - added patches providing new implementation for some kfifo macros
> - fixed a regression in the patch reworking the line event fifo: reading
>   multiple events is now still possible
> - reworked the structure for new ioctl: it's now padded such that there
>   be no alignment issues if running a 64-bit kernel on 32-bit userspace
> - fixed a bug where one process could disable the status watch of another
> - use kstrtoul() instead of atoi() in gpio-watch for string validation
>
> v3 -> v4:
> - removed a binary file checked in by mistake
> - drop __func__ from debug messages
> - restructure the code in the notifier call
> - add comments about the alignment of the new uAPI structure
> - remove a stray new line that doesn't belong in this series
> - tested the series on 32-bit user-space with 64-bit kernel
>
> v4 -> v5:
> - dropped patches already merged upstream
> - collected review tags
>
> Bartosz Golaszewski (7):
>   kfifo: provide noirqsave variants of spinlocked in and out helpers
>   kfifo: provide kfifo_is_empty_spinlocked()
>   gpiolib: rework the locking mechanism for lineevent kfifo
>   gpiolib: emit a debug message when adding events to a full kfifo
>   gpiolib: provide a dedicated function for setting lineinfo
>   gpiolib: add new ioctl() for monitoring changes in line info
>   tools: gpio: implement gpio-watch

Hi Andrew,

could you Ack the first two patches in this series if you're fine with
them? The code they modify lives in lib/ and doesn't have an assigned
maintainer, so I've been told to Cc you on this series. It would be
great if we could get it in for v5.6 merge window.

Best regards,
Bartosz Golaszewski
