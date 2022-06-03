Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E202A53CA24
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jun 2022 14:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235346AbiFCMqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 08:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiFCMqK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 08:46:10 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE993A5EB
        for <linux-gpio@vger.kernel.org>; Fri,  3 Jun 2022 05:46:07 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id n18so6773083plg.5
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jun 2022 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jqJ8cC09b+sii7sfklEUTjB/Jn895aIDN/G7OCn4xg8=;
        b=SFQgW6oQAn2XupoUsqY70l0Ynu3VH/asKfaO4ifG1ZQZDbaupH5lQxKsFcjI6YFAXf
         JfnJSMwZyWSODjVQZbXTcIlc1tcO3LbpxP4OZEv4Wkc4KRGhdX62dLI+z28GCOX4Q4bP
         MDiJS20ECrRarWuvEz3TPQaF4RnPUu6LZKQwoFGgE12A/BdL+S0L6dNXJ8YfTTVdjCwx
         MOgxlPH4NOBLYzuibtRudyUPBLy83vEqHz8js3N2iqpQoqlDfNFa6FNsy+NRIq5/hJQ3
         EOaqyMBpBXLq/MnWb+9cvmKomZgTmhk6+ueNptOL8cv19fvRvxgPte57ytnrhhcilyLa
         Dt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jqJ8cC09b+sii7sfklEUTjB/Jn895aIDN/G7OCn4xg8=;
        b=0mBx4W54LUHhgLgo/hxtGbi017RT2W13fSeVgju1UIMKqaBDzGu4Zya8jbSsk2ZiO6
         eJj0/wPkFmCXpwjXpw+gPHlGCgh4+VYxyACNLhTc2IsgDdDrkDC8CGz9SoS3aZ99jyK2
         9CRZwtNsF67P369ez4b+t2mpy3x8Hat9ws3Ll0Drb4XzHSGJ+4++J9unHT/xQwGdFyyi
         m8HX2aoaEyyfg0pYjT4G8fwzljpAZ1v1kGkDmDQjEF4frXcpx3yaFZLMQKDsijvPIicG
         tI7LQb6WDqtxXfc31kC28KEcz38cRpNMxw7VqGMI9uDLbdZJzR5NkGeWnTT+et63Gl6p
         Q8Kg==
X-Gm-Message-State: AOAM530SqBu6a/QbWKb7yj9rN029k6yYE1f2uJATKlBmnqygCQZccWIA
        IYt+iYRuMDWsdJ+hmjqb25o=
X-Google-Smtp-Source: ABdhPJy1s+pKWuWm/Moaqwh/q4GbgEI4iyvb+ipA0DJVxgP1V9Rci0TU0plu/xsJctKe7J3vL2KTng==
X-Received: by 2002:a17:902:d4d1:b0:163:82c7:24 with SMTP id o17-20020a170902d4d100b0016382c70024mr9988270plg.5.1654260366587;
        Fri, 03 Jun 2022 05:46:06 -0700 (PDT)
Received: from sol ([203.221.89.174])
        by smtp.gmail.com with ESMTPSA id a8-20020aa795a8000000b0051810d460adsm5476287pfk.114.2022.06.03.05.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:46:05 -0700 (PDT)
Date:   Fri, 3 Jun 2022 20:46:00 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2
 API
Message-ID: <20220603124600.GA35695@sol>
References: <20220525140704.94983-1-brgl@bgdev.pl>
 <20220525140704.94983-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525140704.94983-4-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 25, 2022 at 04:07:02PM +0200, Bartosz Golaszewski wrote:
> This adds the usual set of reimplementations of gpio-tools using the new
> python module.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  bindings/python/examples/Makefile.am   | 10 ++++++++
>  bindings/python/examples/gpiodetect.py | 17 +++++++++++++
>  bindings/python/examples/gpiofind.py   | 20 +++++++++++++++
>  bindings/python/examples/gpioget.py    | 31 +++++++++++++++++++++++
>  bindings/python/examples/gpioinfo.py   | 35 ++++++++++++++++++++++++++
>  bindings/python/examples/gpiomon.py    | 31 +++++++++++++++++++++++
>  bindings/python/examples/gpioset.py    | 35 ++++++++++++++++++++++++++
>  7 files changed, 179 insertions(+)
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
> index 0000000..4169469
> --- /dev/null
> +++ b/bindings/python/examples/Makefile.am
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +EXTRA_DIST =				\
> +		gpiodetect.py		\
> +		gpiofind.py		\
> +		gpioget.py		\
> +		gpioinfo.py		\
> +		gpiomon.py		\
> +		gpioset.py
> diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/examples/gpiodetect.py
> new file mode 100755
> index 0000000..08e586b
> --- /dev/null
> +++ b/bindings/python/examples/gpiodetect.py
> @@ -0,0 +1,17 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +"""Reimplementation of the gpiodetect tool in Python."""
> +
> +import gpiod
> +import os
> +
> +if __name__ == "__main__":
> +    for entry in os.scandir("/dev/"):
> +        if gpiod.is_gpiochip_device(entry.path):
> +            with gpiod.Chip(entry.path) as chip:
> +                info = chip.get_info()
> +                print(
> +                    "{} [{}] ({} lines)".format(info.name, info.label, info.num_lines)
> +                )
> diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
> new file mode 100755
> index 0000000..e488a49
> --- /dev/null
> +++ b/bindings/python/examples/gpiofind.py
> @@ -0,0 +1,20 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
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
> +                offset = chip.get_line_offset_from_name(sys.argv[1])
> +                if offset is not None:
> +                    print("{} {}".format(chip.get_info().name, offset))
> +                    sys.exit(0)
> +
> +    sys.exit(1)
> diff --git a/bindings/python/examples/gpioget.py b/bindings/python/examples/gpioget.py
> new file mode 100755
> index 0000000..c509f38
> --- /dev/null
> +++ b/bindings/python/examples/gpioget.py
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +"""Simplified reimplementation of the gpioget tool in Python."""
> +
> +import gpiod
> +import sys
> +
> +Direction = gpiod.Line.Direction
> +Value = gpiod.Line.Value
> +
> +if __name__ == "__main__":
> +    if len(sys.argv) < 3:
> +        raise TypeError("usage: gpioget.py <gpiochip> <offset1> <offset2> ...")
> +
> +    path = sys.argv[1]
> +    offsets = []
> +    for off in sys.argv[2:]:
> +        offsets.append(int(off))
> +
> +    with gpiod.request_lines(
> +        path,
> +        gpiod.RequestConfig(offsets=offsets, consumer="gpioget.py"),
> +        gpiod.LineConfig(direction=Direction.INPUT),
> +    ) as request:

With request_lines() being the primary entry point to the gpiod module,
consider extending it to allow the RequestConfig and LineConfig kwargs to
be passed directly to request_lines(), and for those transient objects to
be constructed within request_lines().
That way the average user does not need to concern themselves with those
objects and the code is easier to read.
i.e.
    with gpiod.request_lines(
        path,
        offsets=offsets,
        consumer="gpioget.py",
        direction=Direction.INPUT,
    ) as request:

You can still support passing in complete RequestConfig and LineConfig
as kwargs for cases where the user requires complex configuration.
i.e.
    with gpiod.request_lines(
        path,
        req_cfg=gpiod.RequestConfig(offsets=offsets, consumer="gpioget.py"),
        line_cfg=gpiod.LineConfig(direction=Direction.INPUT),
    ) as request:

Or for those use cases the user could use the Chip.request_lines() (which
wouldn't have the kwarg sugar) instead.

Would be good to have some examples with complex configuration as well,
not just the tool reimplementations.

> +        vals = request.get_values()
> +
> +        for val in vals:
> +            print("0" if val == Value.INACTIVE else "1", end=" ")
> +        print()
> diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
> new file mode 100755
> index 0000000..3097d10
> --- /dev/null
> +++ b/bindings/python/examples/gpioinfo.py
> @@ -0,0 +1,35 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
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
> +                    active_low = linfo.active_low
> +
> +                    print(
> +                        "\tline {:>3}: {:>18} {:>12} {:>8} {:>10}".format(
> +                            offset,
> +                            "unnamed" if name is None else name,
> +                            "unused" if consumer is None else consumer,
> +                            "input"
> +                            if direction == gpiod.Line.Direction.INPUT
> +                            else "output",
> +                            "active-low" if active_low else "active-high",
> +                        )
> +                    )
> diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
> new file mode 100755
> index 0000000..b0f4b88
> --- /dev/null
> +++ b/bindings/python/examples/gpiomon.py
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +"""Simplified reimplementation of the gpiomon tool in Python."""
> +
> +import gpiod
> +import sys
> +
> +Edge = gpiod.Line.Edge
> +
> +if __name__ == "__main__":
> +    if len(sys.argv) < 3:
> +        raise TypeError("usage: gpiomon.py <gpiochip> <offset1> <offset2> ...")
> +
> +    path = sys.argv[1]
> +    offsets = []
> +    for off in sys.argv[2:]:
> +        offsets.append(int(off))
> +
> +    buf = gpiod.EdgeEventBuffer()
> +
> +    with gpiod.request_lines(
> +        path,
> +        gpiod.RequestConfig(offsets=offsets, consumer="gpiomon.py"),
> +        gpiod.LineConfig(edge_detection=Edge.BOTH),
> +    ) as request:
> +        while True:
> +            request.read_edge_event(buf)
> +            for event in buf:
> +                print(event)

Can you hide the buffer here to simplify the common case?
How about having the request manage the buffer, and add a generator
method that returns the next event, say edge_events()?

For the uncommon case, add kwargs to allow the user to provide the buffer,
or to specify the buffer size.  If neither provided then the request
constructs a default sized buffer.

Then the code becomes:

    with gpiod.request_lines(
        path,
        offsets=offsets,
        consumer="gpiomon.py",
        edge_detection=Edge.BOTH,
    ) as request:
        for event in request.edge_events():
            print(event)

> diff --git a/bindings/python/examples/gpioset.py b/bindings/python/examples/gpioset.py
> new file mode 100755
> index 0000000..3a8f8cc
> --- /dev/null
> +++ b/bindings/python/examples/gpioset.py
> @@ -0,0 +1,35 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +"""Simplified reimplementation of the gpioset tool in Python."""
> +
> +import gpiod
> +import sys
> +
> +Value = gpiod.Line.Value
> +
> +if __name__ == "__main__":
> +    if len(sys.argv) < 3:
> +        raise TypeError("usage: gpioset.py <gpiochip> <offset1>=<value1> ...")
> +
> +    path = sys.argv[1]
> +    values = dict()
> +    for arg in sys.argv[2:]:
> +        arg = arg.split("=")
> +        key = int(arg[0])
> +        val = int(arg[1])
> +
> +        if val == 1:
> +            values[key] = Value.ACTIVE
> +        elif val == 0:
> +            values[key] = Value.INACTIVE
> +        else:
> +            raise ValueError("{} is an invalid value for GPIO lines".format(val))
> +
> +    with gpiod.request_lines(
> +        path,
> +        gpiod.RequestConfig(offsets=values.keys(), consumer="gpioset.py"),
> +        gpiod.LineConfig(direction=gpiod.Line.Direction.OUTPUT, output_values=values),
> +    ) as request:
> +        input()
> -- 
> 2.34.1
> 

The focus of my comments above is to simplify the API for the most common
case, and to make it a little more Pythonic rather than mirroring the C
API, in both cases by hiding implementation details that the casual user
doesn't need to know about.

I'm pretty sure other minor things that I'm not 100% comfortable with are
the same as with the C++ bindings, and the Python is in keeping with that,
so I wont recover the same ground.

I'm ok with the series overall.  As per my C++ comments, it would be
great to get some feedback from Python developers.

Cheers,
Kent.
