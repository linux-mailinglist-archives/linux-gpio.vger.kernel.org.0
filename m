Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201D85FD375
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 05:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiJMDJr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 23:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiJMDJo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 23:09:44 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AC0CEA
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 20:09:39 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id h12so833565pjk.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 20:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dcG17SsNteUd2J0aetK5+iSuU1T9wuy+xxapnxR1/bE=;
        b=WdiFWffzjrsXhtTkjapqk+8lJVwV7J0w1k7zDpEuF24KPze+RkoWaD8V2Tq7guHjeg
         1rzvCEtEnX4oReWk6N48tMkjjqj+Ou1bStFH51ec7NJOJmGKiGdZYn0D7bsf2lniKxmO
         au8YAdX4fq27A+9D1vuQ1Y/tCasxPIKbp1qA5jYhnvVaPWhuko8ZmEKvdjFyDb4Zpb7Q
         K2OvFWH04jjfYdxpOKXDZ7pR7tQEx6fHsn8XnLxQXFj34KtQ7cfOdXexx7DDKTPliDb1
         8oToODhaqyQeJE3zVscmS4780AY0da53rLNcKn/JuNU3zEtUKuxYQh2lZs3dd233e2L0
         eo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcG17SsNteUd2J0aetK5+iSuU1T9wuy+xxapnxR1/bE=;
        b=IIKxDyaXx7NV/3DfhwifdXK6Mnyr6sbmb27zWCFfIYkdogXtkdUssfBAKyODQmpV6V
         po6rLDSyY6e6Z5Hu/g8LSgbO/MnBWtywiSsF2n1zI/4t7BhTo57q+6gQB8J4HHSit4H8
         ltu3X4WgN2qZCtobY6CBKdRYin/0IKgTrzqgG7JYb/w7FT0HGkuMkIYwfP5PZeiX307L
         PzWs/j4OIbs7r4KF8A3/4ga0kV9xKC0lNKbTUmpvG3dxsXuqdJw5F6wUjQ5eJGGjz3MH
         EsoPrhEZPnrYb7Ls115f2zMgoxDmOj7OfZeuk8mgZfoFJhP2AtEYjhebQ60VomVzO3fy
         l5Kw==
X-Gm-Message-State: ACrzQf0nelgOjQKbCEoZhYban1fpHdfYzDAjbIVo6bDL/hPFKW/n6+KO
        GG6Io/oEdjpCTzkNa/q6YtE=
X-Google-Smtp-Source: AMsMyM4DD5Pm36cOzbdVLW7Kc3sAsfcyWYukeD63ykjqVKVWiLrI4OB9Parvn72evTS5QpSpzQixOQ==
X-Received: by 2002:a17:902:8a97:b0:178:1939:c721 with SMTP id p23-20020a1709028a9700b001781939c721mr33221155plo.108.1665630579353;
        Wed, 12 Oct 2022 20:09:39 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id z10-20020a63c04a000000b004561e7569f8sm10379684pgi.8.2022.10.12.20.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 20:09:38 -0700 (PDT)
Date:   Thu, 13 Oct 2022 11:09:33 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y0eBbUkzryyJZKwq@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007145521.329614-3-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 07, 2022 at 04:55:19PM +0200, Bartosz Golaszewski wrote:
> This adds the regular set of example programs implemented using libgpiod
> python bindings.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  bindings/python/examples/Makefile.am   | 10 +++++++
>  bindings/python/examples/gpiodetect.py | 17 ++++++++++++
>  bindings/python/examples/gpiofind.py   | 20 ++++++++++++++
>  bindings/python/examples/gpioget.py    | 31 +++++++++++++++++++++
>  bindings/python/examples/gpioinfo.py   | 35 ++++++++++++++++++++++++
>  bindings/python/examples/gpiomon.py    | 28 +++++++++++++++++++
>  bindings/python/examples/gpioset.py    | 37 ++++++++++++++++++++++++++
>  7 files changed, 178 insertions(+)
>  create mode 100644 bindings/python/examples/Makefile.am
>  create mode 100755 bindings/python/examples/gpiodetect.py
>  create mode 100755 bindings/python/examples/gpiofind.py
>  create mode 100755 bindings/python/examples/gpioget.py
>  create mode 100755 bindings/python/examples/gpioinfo.py
>  create mode 100755 bindings/python/examples/gpiomon.py
>  create mode 100755 bindings/python/examples/gpioset.py
> 
> diff --git a/bindings/python/examples/Makefile.am b/bindings/python/examples/Makefile.am
> new file mode 100644
> index 0000000..f42b80e
> --- /dev/null
> +++ b/bindings/python/examples/Makefile.am
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +EXTRA_DIST = \
> +	gpiodetect.py \
> +	gpiofind.py \
> +	gpioget.py \
> +	gpioinfo.py \
> +	gpiomon.py \
> +	gpioset.py
> diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/examples/gpiodetect.py
> new file mode 100755
> index 0000000..c32014f
> --- /dev/null
> +++ b/bindings/python/examples/gpiodetect.py
> @@ -0,0 +1,17 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +"""Reimplementation of the gpiodetect tool in Python."""
> +
> +import gpiod
> +import os
> +
> +if __name__ == "__main__":
> +    for entry in os.scandir("/dev/"):
> +        if gpiod.is_gpiochip_device(entry.path):

Add a helper generator function that returns the available chip paths?
And in order might be nice too.

> +            with gpiod.Chip(entry.path) as chip:
> +                info = chip.get_info()
> +                print(
> +                    "{} [{}] ({} lines)".format(info.name, info.label, info.num_lines)
> +                )
> diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
> new file mode 100755
> index 0000000..2f30445
> --- /dev/null
> +++ b/bindings/python/examples/gpiofind.py
> @@ -0,0 +1,20 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +"""Reimplementation of the gpiofind tool in Python."""
> +
> +import gpiod
> +import os
> +import sys
> +
> +if __name__ == "__main__":
> +    for entry in os.scandir("/dev/"):
> +        if gpiod.is_gpiochip_device(entry.path):
> +            with gpiod.Chip(entry.path) as chip:
> +                offset = chip.map_line(sys.argv[1])

                            chip.offset_from_id(...

> +                if offset is not None:
> +                    print("{} {}".format(chip.get_info().name, offset))
> +                    sys.exit(0)
> +
> +    sys.exit(1)
> diff --git a/bindings/python/examples/gpioget.py b/bindings/python/examples/gpioget.py
> new file mode 100755
> index 0000000..d441535
> --- /dev/null
> +++ b/bindings/python/examples/gpioget.py
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +"""Simplified reimplementation of the gpioget tool in Python."""
> +
> +import gpiod
> +import sys
> +
> +from gpiod.line import Direction
> +
> +if __name__ == "__main__":
> +    if len(sys.argv) < 3:
> +        raise TypeError("usage: gpioget.py <gpiochip> <offset1> <offset2> ...")
> +
> +    path = sys.argv[1]
> +    lines = []
> +    for line in sys.argv[2:]:
> +        lines.append(int(line) if line.isdigit() else line)
> +

Just leave the line ids as string?

else use a list comprehension:

    lines = [ int(id) if id.isdigit() else id for id in sys.argv[2:] ]

Similarly elsewhere.

> +    request = gpiod.request_lines(
> +        path,
> +        consumer="gpioget.py",
> +        config={tuple(lines): gpiod.LineSettings(direction=Direction.INPUT)},
> +    )
> +
> +    vals = request.get_values()
> +
> +    for val in vals:
> +        print("{} ".format(val.value), end="")
> +    print()
> diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
> new file mode 100755
> index 0000000..e8c7d46
> --- /dev/null
> +++ b/bindings/python/examples/gpioinfo.py
> @@ -0,0 +1,35 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +"""Simplified reimplementation of the gpioinfo tool in Python."""
> +
> +import gpiod
> +import os
> +
> +if __name__ == "__main__":
> +    for entry in os.scandir("/dev/"):
> +        if gpiod.is_gpiochip_device(entry.path):
> +            with gpiod.Chip(entry.path) as chip:
> +                cinfo = chip.get_info()
> +                print("{} - {} lines:".format(cinfo.name, cinfo.num_lines))
> +
> +                for offset in range(0, cinfo.num_lines):
> +                    linfo = chip.get_line_info(offset)
> +                    offset = linfo.offset
> +                    name = linfo.name
> +                    consumer = linfo.consumer
> +                    direction = linfo.direction

                    is_input = linfo.direction == gpiod.line.Direction.INPUT

That is for space saving below.
Drop the others as they are only referenced once (if you follow the
suggestion below).

> +                    active_low = linfo.active_low
> +
> +                    print(
> +                        "\tline {:>3}: {:>18} {:>12} {:>8} {:>10}".format(
> +                            offset,
> +                            "unnamed" if name is None else name,
> +                            "unused" if consumer is None else consumer,
> +                            "input"
> +                            if direction == gpiod.line.Direction.INPUT
> +                            else "output",
> +                            "active-low" if active_low else "active-high",
                        linfo.offset,
                        linfo.name or "unnamed",
                        linfo.consumer or "unused",
                        is_input and "input" or "output",
                        linfo.active_low and "active_low" or "active-high",

> +                        )
> +                    )
> diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
> new file mode 100755
> index 0000000..e0db16f
> --- /dev/null
> +++ b/bindings/python/examples/gpiomon.py
> @@ -0,0 +1,28 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +"""Simplified reimplementation of the gpiomon tool in Python."""
> +
> +import gpiod
> +import sys
> +
> +from gpiod.line import Edge
> +
> +if __name__ == "__main__":
> +    if len(sys.argv) < 3:
> +        raise TypeError("usage: gpiomon.py <gpiochip> <offset1> <offset2> ...")
> +
> +    path = sys.argv[1]
> +    lines = []
> +    for line in sys.argv[2:]:
> +        lines.append(int(line) if line.isdigit() else line)
> +
> +    with gpiod.request_lines(
> +        path,
> +        consumer="gpiomon.py",
> +        config={tuple(lines): gpiod.LineSettings(edge_detection=Edge.BOTH)},
> +    ) as request:
> +        while True:
> +            for event in request.read_edge_event():
> +                print(event)
> diff --git a/bindings/python/examples/gpioset.py b/bindings/python/examples/gpioset.py
> new file mode 100755
> index 0000000..f0b0681
> --- /dev/null
> +++ b/bindings/python/examples/gpioset.py
> @@ -0,0 +1,37 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +"""Simplified reimplementation of the gpioset tool in Python."""
> +
> +import gpiod
> +import sys
> +
> +from gpiod.line import Direction, Value
> +
> +if __name__ == "__main__":
> +    if len(sys.argv) < 3:
> +        raise TypeError(
> +            "usage: gpioset.py <gpiochip> <offset1>=<value1> <offset2>=<value2> ..."
> +        )
> +
> +    path = sys.argv[1]
> +    values = dict()
> +    lines = []
> +    for arg in sys.argv[2:]:
> +        arg = arg.split("=")
> +        key = int(arg[0]) if arg[0].isdigit() else arg[0]
> +        val = int(arg[1])
> +
> +        lines.append(key)
> +        values[key] = Value(val)
> +

        lvs = [ arg.split('=') for arg in sys.argv[2:] ]
        lines = [ x[0] for x in lvs ]
        values = dict[lvs]

> +    request = gpiod.request_lines(
> +        path,
> +        consumer="gpioset.py",
> +        config={tuple(lines): gpiod.LineSettings(direction=Direction.OUTPUT)},
> +    )
> +
> +    vals = request.set_values(values)
> +
> +    input()
> -- 

No gpiowatch?

Add some examples for features the tools don't use, like requests with
both inputs and outputs, and reconfigure?

Cheers,
Kent.
