Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91A7E600E71
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 14:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiJQMA4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 08:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiJQMAn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 08:00:43 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928F356006
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 05:00:27 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id x66so2509835vsb.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 05:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=km+V5E5aIzDS+IP1JvWDTAhGFYlrvl+I0V8b88NktU0=;
        b=guwOOyKsOlA8KiNFTYhIEfCh2tmNd8tGgCf1Tmc5A5GA7re9GuJfbvsBW0iwTGqzyE
         sgo4mVVkoyxWlFJj7MSJFFO+y7xgFyr49rqojchP5sBOiu+7zY4t0OiBsctl6RRvj5z9
         mdIWvQuAbxrnDigOYZDQnTCFU6ixQnTpaCEprk9PZJrKwL8BI6xB1R71R34mJYAZ46Pu
         nfM0Jyuar1+zD4sUgzG8DjuzHTls/Bf+YGY2fhm6d6JoRlqQIIGiFv/WPCVmhPL3ZROS
         rpHiWSzaBBdBygmXzeUivqRyXLIbsRaWb1YSZmC16Wpokb6uUVOmqggYYrZC5sXIJa7m
         4HGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=km+V5E5aIzDS+IP1JvWDTAhGFYlrvl+I0V8b88NktU0=;
        b=QaGAoWvPq4GGgxUIyN9uk5/sBrZWhX6tlMsFg3+r4jmv2HudSdBPqqUQSf9McvA3Wq
         h9O9yOCLZG0udp8/Z8TYUjLtS6aOE6UmkHIi+706tzSjaFm+yJMKIzDv98WWTz0mQCj8
         JeuYYeCEoV8ITzDTAFeJk6BPByonmomP7w9Utu7N0A96E3kYBdE9/moXmXMvIIufl+ns
         rs6UzHrozI0ekfR8EeBcswKnDMZBLJMspdAzXaESErPnnROkgnKd5RQAPPH+gEPCWUCK
         LOG5PCw9uIm8c1bVgKn3vleBxpNIg55BaYdNoEhO8Q9nCq4YtAkaYos0vTqE4rkbhset
         JcOA==
X-Gm-Message-State: ACrzQf0L2tvFZbLD3Uade7wTwSXl3zJ5dVBvJJQuUMC6cEd7clpyxiWD
        PF3l3GTRR6XyE7lDvQqcvYGbK/saQBhf4R8kxXz6sA==
X-Google-Smtp-Source: AMsMyM4yvZNVB0M8le9FPMgsekoVSi8wpRbuYIGHdapHZ5b/p7wycmfv4hS9klAtIliLNBYgti3K31X9Onji6ieiGuo=
X-Received: by 2002:a67:ab46:0:b0:3a7:d2b6:121b with SMTP id
 k6-20020a67ab46000000b003a7d2b6121bmr3990461vsh.16.1666008026461; Mon, 17 Oct
 2022 05:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221007145521.329614-1-brgl@bgdev.pl> <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol>
In-Reply-To: <Y0eBbUkzryyJZKwq@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Oct 2022 14:00:15 +0200
Message-ID: <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 13, 2022 at 5:09 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Oct 07, 2022 at 04:55:19PM +0200, Bartosz Golaszewski wrote:
> > This adds the regular set of example programs implemented using libgpiod
> > python bindings.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  bindings/python/examples/Makefile.am   | 10 +++++++
> >  bindings/python/examples/gpiodetect.py | 17 ++++++++++++
> >  bindings/python/examples/gpiofind.py   | 20 ++++++++++++++
> >  bindings/python/examples/gpioget.py    | 31 +++++++++++++++++++++
> >  bindings/python/examples/gpioinfo.py   | 35 ++++++++++++++++++++++++
> >  bindings/python/examples/gpiomon.py    | 28 +++++++++++++++++++
> >  bindings/python/examples/gpioset.py    | 37 ++++++++++++++++++++++++++
> >  7 files changed, 178 insertions(+)
> >  create mode 100644 bindings/python/examples/Makefile.am
> >  create mode 100755 bindings/python/examples/gpiodetect.py
> >  create mode 100755 bindings/python/examples/gpiofind.py
> >  create mode 100755 bindings/python/examples/gpioget.py
> >  create mode 100755 bindings/python/examples/gpioinfo.py
> >  create mode 100755 bindings/python/examples/gpiomon.py
> >  create mode 100755 bindings/python/examples/gpioset.py
> >
> > diff --git a/bindings/python/examples/Makefile.am b/bindings/python/examples/Makefile.am
> > new file mode 100644
> > index 0000000..f42b80e
> > --- /dev/null
> > +++ b/bindings/python/examples/Makefile.am
> > @@ -0,0 +1,10 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > +
> > +EXTRA_DIST = \
> > +     gpiodetect.py \
> > +     gpiofind.py \
> > +     gpioget.py \
> > +     gpioinfo.py \
> > +     gpiomon.py \
> > +     gpioset.py
> > diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/examples/gpiodetect.py
> > new file mode 100755
> > index 0000000..c32014f
> > --- /dev/null
> > +++ b/bindings/python/examples/gpiodetect.py
> > @@ -0,0 +1,17 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > +
> > +"""Reimplementation of the gpiodetect tool in Python."""
> > +
> > +import gpiod
> > +import os
> > +
> > +if __name__ == "__main__":
> > +    for entry in os.scandir("/dev/"):
> > +        if gpiod.is_gpiochip_device(entry.path):
>
> Add a helper generator function that returns the available chip paths?
> And in order might be nice too.
>
> > +            with gpiod.Chip(entry.path) as chip:
> > +                info = chip.get_info()
> > +                print(
> > +                    "{} [{}] ({} lines)".format(info.name, info.label, info.num_lines)
> > +                )
> > diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
> > new file mode 100755
> > index 0000000..2f30445
> > --- /dev/null
> > +++ b/bindings/python/examples/gpiofind.py
> > @@ -0,0 +1,20 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > +
> > +"""Reimplementation of the gpiofind tool in Python."""
> > +
> > +import gpiod
> > +import os
> > +import sys
> > +
> > +if __name__ == "__main__":
> > +    for entry in os.scandir("/dev/"):
> > +        if gpiod.is_gpiochip_device(entry.path):
> > +            with gpiod.Chip(entry.path) as chip:
> > +                offset = chip.map_line(sys.argv[1])
>
>                             chip.offset_from_id(...
>
> > +                if offset is not None:
> > +                    print("{} {}".format(chip.get_info().name, offset))
> > +                    sys.exit(0)
> > +
> > +    sys.exit(1)
> > diff --git a/bindings/python/examples/gpioget.py b/bindings/python/examples/gpioget.py
> > new file mode 100755
> > index 0000000..d441535
> > --- /dev/null
> > +++ b/bindings/python/examples/gpioget.py
> > @@ -0,0 +1,31 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > +
> > +"""Simplified reimplementation of the gpioget tool in Python."""
> > +
> > +import gpiod
> > +import sys
> > +
> > +from gpiod.line import Direction
> > +
> > +if __name__ == "__main__":
> > +    if len(sys.argv) < 3:
> > +        raise TypeError("usage: gpioget.py <gpiochip> <offset1> <offset2> ...")
> > +
> > +    path = sys.argv[1]
> > +    lines = []
> > +    for line in sys.argv[2:]:
> > +        lines.append(int(line) if line.isdigit() else line)
> > +
>
> Just leave the line ids as string?
>
> else use a list comprehension:
>
>     lines = [ int(id) if id.isdigit() else id for id in sys.argv[2:] ]
>
> Similarly elsewhere.
>
> > +    request = gpiod.request_lines(
> > +        path,
> > +        consumer="gpioget.py",
> > +        config={tuple(lines): gpiod.LineSettings(direction=Direction.INPUT)},
> > +    )
> > +
> > +    vals = request.get_values()
> > +
> > +    for val in vals:
> > +        print("{} ".format(val.value), end="")
> > +    print()
> > diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
> > new file mode 100755
> > index 0000000..e8c7d46
> > --- /dev/null
> > +++ b/bindings/python/examples/gpioinfo.py
> > @@ -0,0 +1,35 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > +
> > +"""Simplified reimplementation of the gpioinfo tool in Python."""
> > +
> > +import gpiod
> > +import os
> > +
> > +if __name__ == "__main__":
> > +    for entry in os.scandir("/dev/"):
> > +        if gpiod.is_gpiochip_device(entry.path):
> > +            with gpiod.Chip(entry.path) as chip:
> > +                cinfo = chip.get_info()
> > +                print("{} - {} lines:".format(cinfo.name, cinfo.num_lines))
> > +
> > +                for offset in range(0, cinfo.num_lines):
> > +                    linfo = chip.get_line_info(offset)
> > +                    offset = linfo.offset
> > +                    name = linfo.name
> > +                    consumer = linfo.consumer
> > +                    direction = linfo.direction
>
>                     is_input = linfo.direction == gpiod.line.Direction.INPUT
>
> That is for space saving below.
> Drop the others as they are only referenced once (if you follow the
> suggestion below).
>
> > +                    active_low = linfo.active_low
> > +
> > +                    print(
> > +                        "\tline {:>3}: {:>18} {:>12} {:>8} {:>10}".format(
> > +                            offset,
> > +                            "unnamed" if name is None else name,
> > +                            "unused" if consumer is None else consumer,
> > +                            "input"
> > +                            if direction == gpiod.line.Direction.INPUT
> > +                            else "output",
> > +                            "active-low" if active_low else "active-high",
>                         linfo.offset,
>                         linfo.name or "unnamed",
>                         linfo.consumer or "unused",
>                         is_input and "input" or "output",
>                         linfo.active_low and "active_low" or "active-high",
>
> > +                        )
> > +                    )
> > diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
> > new file mode 100755
> > index 0000000..e0db16f
> > --- /dev/null
> > +++ b/bindings/python/examples/gpiomon.py
> > @@ -0,0 +1,28 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > +
> > +"""Simplified reimplementation of the gpiomon tool in Python."""
> > +
> > +import gpiod
> > +import sys
> > +
> > +from gpiod.line import Edge
> > +
> > +if __name__ == "__main__":
> > +    if len(sys.argv) < 3:
> > +        raise TypeError("usage: gpiomon.py <gpiochip> <offset1> <offset2> ...")
> > +
> > +    path = sys.argv[1]
> > +    lines = []
> > +    for line in sys.argv[2:]:
> > +        lines.append(int(line) if line.isdigit() else line)
> > +
> > +    with gpiod.request_lines(
> > +        path,
> > +        consumer="gpiomon.py",
> > +        config={tuple(lines): gpiod.LineSettings(edge_detection=Edge.BOTH)},
> > +    ) as request:
> > +        while True:
> > +            for event in request.read_edge_event():
> > +                print(event)
> > diff --git a/bindings/python/examples/gpioset.py b/bindings/python/examples/gpioset.py
> > new file mode 100755
> > index 0000000..f0b0681
> > --- /dev/null
> > +++ b/bindings/python/examples/gpioset.py
> > @@ -0,0 +1,37 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > +
> > +"""Simplified reimplementation of the gpioset tool in Python."""
> > +
> > +import gpiod
> > +import sys
> > +
> > +from gpiod.line import Direction, Value
> > +
> > +if __name__ == "__main__":
> > +    if len(sys.argv) < 3:
> > +        raise TypeError(
> > +            "usage: gpioset.py <gpiochip> <offset1>=<value1> <offset2>=<value2> ..."
> > +        )
> > +
> > +    path = sys.argv[1]
> > +    values = dict()
> > +    lines = []
> > +    for arg in sys.argv[2:]:
> > +        arg = arg.split("=")
> > +        key = int(arg[0]) if arg[0].isdigit() else arg[0]
> > +        val = int(arg[1])
> > +
> > +        lines.append(key)
> > +        values[key] = Value(val)
> > +
>
>         lvs = [ arg.split('=') for arg in sys.argv[2:] ]
>         lines = [ x[0] for x in lvs ]
>         values = dict[lvs]

It must be dict(lvs) but even then values are still strings, not their
enum integer representations, so we still need to convert them to ints
before passing them to set_values(). I'd leave it as it is now.

>
> > +    request = gpiod.request_lines(
> > +        path,
> > +        consumer="gpioset.py",
> > +        config={tuple(lines): gpiod.LineSettings(direction=Direction.OUTPUT)},
> > +    )
> > +
> > +    vals = request.set_values(values)
> > +
> > +    input()
> > --
>
> No gpiowatch?
>

There's no gpiowatch yet in the main set of tools, I'll add them once they land.

> Add some examples for features the tools don't use, like requests with
> both inputs and outputs, and reconfigure?
>

These are already covered in tests. I may add them in the future but
don't want to add a lot of code that's not routinely run as part of
tests.

Bart

> Cheers,
> Kent.
