Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA862A5EEC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 08:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbgKDHrd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 02:47:33 -0500
Received: from mail.intenta.de ([178.249.25.132]:34918 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKDHrd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Nov 2020 02:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=Mh6DxMVtXm8SvcqSREY9TWk4w+Kfs0jG3JvQNb3/utY=;
        b=kK6LM/281AF9dyMQI2SLZr1hUlPm57ZeoWmlxw+rn0OoM/4wCD1vfKrLr5veBqcM/d26s7vkgu7asdpnNIWAZt2OE0uIa8cawPIPtt4K+YQWzgFIh34ZxByXYtUtE7bEudsNmfgdId5yJ00sqMvKmChW0DWj6bhS6KlYYp2E/pYY/tWg05AeHkL1P/FhMnDVS1tMd240aNWssFW/qkPUUg4WAFhRh9cZSQMF4cE2Wjb/QEpsT4/IMgN+HBCycq9N5Zp8mbYMe9qgt0vZS3HDCAOduyleAzE476aEfK8Lx7EkKGWIavvTTKWy3P20KZpBm4GzwHGom0n+41SDSDxIwg==;
Date:   Wed, 4 Nov 2020 08:47:19 +0100
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] libgpiod v2.0 API discussion
Message-ID: <20201104074719.GA9518@laureti-dev>
References: <CAMpxmJWkcg0SgcQVzE2TVjenogyfUEiZAOR_0ssR7y8a-AnZXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMpxmJWkcg0SgcQVzE2TVjenogyfUEiZAOR_0ssR7y8a-AnZXA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 03, 2020 at 09:42:23PM +0100, Bartosz Golaszewski wrote:
> * Line lookup by name
> 
> One thing that was omitted in the first version was the fact that GPIO
> line names are not unique in the kernel. Functions that do name lookup
> from a single chip should return bulk objects. Functions that can
> lookup several lines with different names should probably be removed
> because it's difficult to design an elegant API that would take this
> non-uniqueness into account. Returning arrays of bulks sounds like a
> bad idea.

While there is no guarantuee that line names are unique in general, that
tends to be the case in a number of practical cases. Notably, embedded
system developers (which seem like a big part of the intended audience)
are in control of line names and can ensure their uniqueness. It
certainly makes sense to offer an API that deals with non-unique line
names.  However, I think that keeping a less flexible convenience helper
for looking up a line by supposedly unique name would be good. In case
the uniqueness is violated, I'd expect an error.

There is ENOTUNIQ. It is rarely used and while the description says that
it is network-related, it is used for inifiband, nvme, virtualbox guest
functionality and cifs beyond decnet and 802.11.

> * Reading line events
> 
> Since we now can have a single file descriptor for multiple monitored
> lines - reading of the events needs to be modified. Event structure
> needs to reference the line object with which it's associated. Adding
> additional fields for the seq numbers is a no-brainer of course.
> 
> I'm wondering if we should still be using struct timespec for
> timestamps. On one hand it's used everywhere in libc but it's also
> subject to ABI change due to year 2036 problem. Maybe we should switch
> to nanoseconds in 64-bit integer just like what we get from the kernel
> but then user-space won't have standard tools to deal with such
> timestamps.

Aside: It's 2038, not 2036. The key is that you thought of this. Thanks.

The story for timespec is a little difficult for some time to come:
 * On 64bit architectures and some 32bit architectures (e.g. x32), using
   timespec doesn't pose a 2038 problem.
 * On the kernel side, using timespec has become hard. However there now
   is a timespec64 which is not encumbered with 2038 problems on any
   architecture on the kernel ABI side.
 * On the userspace side, opting into timespec64 is still quite hard. I
   think that the idea was to follow the process of widening off_t to
   64 bits. So userspace won't get a timespec64, but instead will be
   able to choose between 2038-buggy timespec and timespec64 using a
   macro. glibc will do the translation (truncation) for many syscalls
   to retain backwards compatibility. Unless I am mistaken, the macro is
   supposed to be _TIME_BITS=64, but that doesn't seem to have
   progressed very far.

A real implication here is that unless all of your users enable this
extra macro, they'll be affected by the problem on most 32bit
architectures when you use timespec even if you use timespec64 on the
kernel side.

On the C++ side, ktime_t values can be stored in a suitable std::chrono
clock without the need for a conversion. The released libgpiod however
transforms it to timespec and then reconstructs the original value for
std::chrono usage. In doing so it introduces a 2038 problem entirely on
the userspace side besides incurring integer arithmetic that can be slow
on certain arm processors. Please consider offering a libgpiod C-API
that allows using the kernel time represntation without conversion.

> * Opaque data types
> 
> For events the reason is simple: with opaque types we'd face an
> overhead with malloc() and I think it's important that we can read
> them as fast as possible.

+1 to this part

Helmut
