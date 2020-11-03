Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5C12A5923
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 23:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbgKCUmg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 15:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730512AbgKCUmf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 15:42:35 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34D5C0617A6
        for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2020 12:42:34 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id za3so26276971ejb.5
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2020 12:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=J+q4xBKUgz1qnRPY8VmgSS8p7104EZgaSeo9SD2FOy0=;
        b=gZysSTk6YYWhEwp4Q6Hzev/gfdmnKv6Mkh0gJ3nB0G3jKiiu0aS690MDeLLiMvXvpN
         VtmzyemzKR4tYDhW0Lkf4DtJrFzyqqffJDjx9jiAfLxwRtXG1ISr5DkFcA1f1XIxotfv
         ENKmNyVuBsjIF/7686j583XftukPyGawL9erI/SeI32cV10GiB1wAzmCLsDDPnpNr5N9
         Sj+kn12BYnA7jlgx1H/mYa+YKYPbVYdA4VRy9N+ql0u6RLqG4VfL7+n7siKknfYwd6Os
         od9QpzmaNnHUJSFtQ4/0iGu5BtE7DIbC/b6lWh4c/Mbtk7Y4IGBxYWFvrzBdSLlZAbYq
         96fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=J+q4xBKUgz1qnRPY8VmgSS8p7104EZgaSeo9SD2FOy0=;
        b=eek6pH9IkbvQT1BTMIniG7hXUMnViOy/THl6AsGJL3nTPOg+XygxvYWo807wXjotGK
         AS/AUdBNN3T/8ZSQlzAsu6xHNvu1XQg9NrRK20lbQs+zpU3OTLfImDHU7Lkz0vo1HG5o
         J8QHdYAbMhuN8ZpHDbtkP1/xgbnTpDZEIyX6WJNKjaUWuN0YQP2+rKhd08FZPhG6JxsG
         psmAoVRhbCBWZJ9pYd2OR9heoOKhiyhfqtqfX4OYa4kX+jKG7RciZq3mOQsToGAdEvoT
         q+MIyxOrUYWSPx4tM5NCXCNvS95lRGReWqm+ulbbQrrfuWP8J0Fqp8jjUTAAEDGoNdZP
         5RKg==
X-Gm-Message-State: AOAM5329W10B3rETxYRGru0a4IS9huxu/6XQfjVCQtRpdEpzCxcbG78M
        iVZwjVDiG/Tiq1Ac1oaNsnvcL9DbkXbYUHFFmEt9GA==
X-Google-Smtp-Source: ABdhPJzpqmBl0EnMFWmmlkKG4Vg5PI95RwC06ojMS0kfDsFxog6H8k0496HGJlDDjTwRO72BHxp0AujJ20D44VhNWt8=
X-Received: by 2002:a17:906:198b:: with SMTP id g11mr4067330ejd.445.1604436153534;
 Tue, 03 Nov 2020 12:42:33 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 3 Nov 2020 21:42:23 +0100
Message-ID: <CAMpxmJWkcg0SgcQVzE2TVjenogyfUEiZAOR_0ssR7y8a-AnZXA@mail.gmail.com>
Subject: [libgpiod] libgpiod v2.0 API discussion
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

I'd like to start a discussion on the new API in libgpiod v2.0. Below
are my ideas for different parts starting from the top of
include/gpiod.h. I'm open for any other ideas.

Arnd: I'm Cc'ing you mostly for your knowledge on the year 2036
problem: please take a look at the part about reading line events and
whether we should use struct timespec in userspace or if it's
discouraged.

* Context-less API

I think we can entirely remove it. As I mentioned in another thread: I
have never received a single question about it - as opposed to all the
other interfaces - so I suppose it's just needless cruft.

* Chip properties and handling

I think we're mostly good on that front. V2 has not altered that part.

* Line watch

Some preliminary work was done by me for V1 watch but it never got
into mainline libgpiod. Since the v2 of line watch uAPI mostly follows
what I did for v1 (except for a different lineinfo struct) I think we
can mostly adapt the code from my development branch[1].

New tool: gpiowatch will be provided in tools/.

* Line properties

We're mostly fine here, but I'd still remove
gpiod_line_is_open_source/drain() in favor of an enum defining drive
flags and a function called gpiod_line_drive(). Also:
gpiod_line_active_state() should probably become
gpiod_line_is_active_low() and we can drop the corresponding enum.

* Line bulks

Already submitted a patch that makes gpiod_line_bulk opaque across the
entire codebase.

* Line lookup by name

One thing that was omitted in the first version was the fact that GPIO
line names are not unique in the kernel. Functions that do name lookup
from a single chip should return bulk objects. Functions that can
lookup several lines with different names should probably be removed
because it's difficult to design an elegant API that would take this
non-uniqueness into account. Returning arrays of bulks sounds like a
bad idea.

For global line lookup: the core C library should probably offer some
function to which a callback would be passed. This would then be
called every time a matching line was found and would take the
matching line and the owning chip as arguments.

gpiofind tool would need to be updated and display multiple lines if
more lines are matching.

Testing of this part will only be possible once we have the new
configfs-based gpio-mockup module on which I'm working currently. It
will provide a way to flexibly name separate dummy lines.

* Iterators

Kent suggests we ditch iterators entirely. I agree for line bulks -
seems like the overhead of allocating an iterator is not worth it
(except for bindings where we use the built-in language features of
C++ and Python).

Kent also pointed out that the chip iterator will fail if opening any
of the chips fails (which can happen for instance if the user only has
permissions to access certain chips, not all of them) and this needs
addressing.

I'd still prefer to keep some way of detecting chips in the system -
be it an iterator or a loop function taking a callback as argument.
Now that we have the is_gpiochip_cdev() function in the library, I
think we don't have to limit ourselves to only checking devices whose
names start with 'gpiochip' - we can check all files in /dev and
verify in /sys if they're GPIO chips or not. Then the iterator would
only iterate over chips we managed to access. Let me know what you
think.

I think that is_gpiochip_cdev() could be renamed to
gpiod_is_gpiochip_cdev() and exported so that users can verify on
their own if given device file is a GPIO chip.

I think Kent suggested returning an array of paths to GPIO chips too.

I'm considering dropping the line iterator as we can simply call
gpiod_chip_get_all_lines() and loop over the returned bulk.

* Reading line events

Since we now can have a single file descriptor for multiple monitored
lines - reading of the events needs to be modified. Event structure
needs to reference the line object with which it's associated. Adding
additional fields for the seq numbers is a no-brainer of course.

I'm wondering if we should still be using struct timespec for
timestamps. On one hand it's used everywhere in libc but it's also
subject to ABI change due to year 2036 problem. Maybe we should switch
to nanoseconds in 64-bit integer just like what we get from the kernel
but then user-space won't have standard tools to deal with such
timestamps.

Some other general design issues I'd like to discuss too:

* Opaque data types

Kent suggested we make all user-facing data types opaque. While I
agree for almost all structs - I think that line & watch events as
well as request config should remain visible to users (although with
padding this time - I missed this in v1.x).

For events the reason is simple: with opaque types we'd face an
overhead with malloc() and I think it's important that we can read
them as fast as possible.

For config: I believe an opaque request config structure will require
a lot of getter/setter boiler plate code for not much profit.

Let's discuss!

Best Regards,
Bartosz Golaszewski

[1] https://github.com/brgl/libgpiod/commits/topic/line-watch
