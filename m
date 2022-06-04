Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C67D153D4E3
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jun 2022 04:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbiFDClm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 22:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbiFDClk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 22:41:40 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB0D56FA6
        for <linux-gpio@vger.kernel.org>; Fri,  3 Jun 2022 19:41:38 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id n10so8594531pjh.5
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jun 2022 19:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5jcQBcfcvdojfJ1sMOOxODz4ZBEB/CUPuRAWN4TDEM8=;
        b=opAGS6iMeZafKdzWtY2wNp0Xqw0Hr9tB9NjxdRuIGVnLPqvgi0QDOstqRLmUv0ieyZ
         AEg9HRkR8lrXAiO3AutfobslzYPrhuNOlvAGM9NV3rWQt6x5bSRNOXUyT6y1/UKvKAHc
         leulGRuiphcxSxot5LrrQVRcHKO2sAwXJ8gjIom9cYcl7rquqHy4hB3ju68YANUsYS4O
         pwdz0omR1qoU1VYU6C73wBn5DdoY2u9dEmOfHvkQ8ydbHXBn6wCcUhz+EESgJr+zpP7E
         Mph+HW+KJjTFLRwzzrWwWFkrto+diKyMibDA6ej5wijVlGpUECZKtSODHORSMtTpug4j
         F4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5jcQBcfcvdojfJ1sMOOxODz4ZBEB/CUPuRAWN4TDEM8=;
        b=ADP9LxgPBsy7DyiqH1ZzIhodjPrFcDm2BvU/NZCBoc5qwuIUMqWDsUc8MTOlHfW1UN
         5TWQhlJaBZcgTSn6fkwV3ZiQl3EyKReNnk+c/Ise57qIHHcFZ8/yaGbOI7AhjDvNW60R
         YS7dWHCMlUyrU/WGdxVcx1oGEPPek1xhFfFqcqcM8d81wZy2g2BcvEp2+9BD8txCC4LI
         u2yUFO+QI9yRboGsp+IKMzlgHWudW5B7WbssEzk3zke+LVdfPrdEPxDQkiWFFPSLfSND
         ZC3BKRppZPBr0k/pUuP9txYD7d7P6lp5etDSVGBbcnVAFuBjeAQiuX39BF9aRk1272Uz
         s6Ow==
X-Gm-Message-State: AOAM532Q6n7bL9R4WHSwh64OANVR3cU0EG77TXbfp9+ixByJgxV4gAdW
        dW+GzNxr4ijjbONiylr/pMM=
X-Google-Smtp-Source: ABdhPJx68sGj+gcaN6B9oMr35luC3tl3D6Im0JBJxXkuB4Y+zboWuhlulAWi7iGuRkURTRuEgsCEcQ==
X-Received: by 2002:a17:903:215:b0:15e:cae9:7622 with SMTP id r21-20020a170903021500b0015ecae97622mr12978963plh.28.1654310498314;
        Fri, 03 Jun 2022 19:41:38 -0700 (PDT)
Received: from sol ([203.221.89.174])
        by smtp.gmail.com with ESMTPSA id u188-20020a6279c5000000b0050dc76281aasm6251035pfc.132.2022.06.03.19.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 19:41:37 -0700 (PDT)
Date:   Sat, 4 Jun 2022 10:41:31 +0800
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
Message-ID: <20220604024131.GB13574@sol>
References: <20220525140704.94983-1-brgl@bgdev.pl>
 <20220525140704.94983-4-brgl@bgdev.pl>
 <20220603124600.GA35695@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603124600.GA35695@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 03, 2022 at 08:46:00PM +0800, Kent Gibson wrote:
> On Wed, May 25, 2022 at 04:07:02PM +0200, Bartosz Golaszewski wrote:
> > This adds the usual set of reimplementations of gpio-tools using the new
> > python module.
> > 
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  bindings/python/examples/Makefile.am   | 10 ++++++++
> >  bindings/python/examples/gpiodetect.py | 17 +++++++++++++
> >  bindings/python/examples/gpiofind.py   | 20 +++++++++++++++
> >  bindings/python/examples/gpioget.py    | 31 +++++++++++++++++++++++
> >  bindings/python/examples/gpioinfo.py   | 35 ++++++++++++++++++++++++++
> >  bindings/python/examples/gpiomon.py    | 31 +++++++++++++++++++++++
> >  bindings/python/examples/gpioset.py    | 35 ++++++++++++++++++++++++++
> >  7 files changed, 179 insertions(+)
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
> > index 0000000..4169469
> > --- /dev/null
> > +++ b/bindings/python/examples/Makefile.am
> > @@ -0,0 +1,10 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> > +
> > +EXTRA_DIST =				\
> > +		gpiodetect.py		\
> > +		gpiofind.py		\
> > +		gpioget.py		\
> > +		gpioinfo.py		\
> > +		gpiomon.py		\
> > +		gpioset.py
> > diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/examples/gpiodetect.py
> > new file mode 100755
> > index 0000000..08e586b
> > --- /dev/null
> > +++ b/bindings/python/examples/gpiodetect.py
> > @@ -0,0 +1,17 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> > +
> > +"""Reimplementation of the gpiodetect tool in Python."""
> > +
> > +import gpiod
> > +import os
> > +
> > +if __name__ == "__main__":
> > +    for entry in os.scandir("/dev/"):
> > +        if gpiod.is_gpiochip_device(entry.path):
> > +            with gpiod.Chip(entry.path) as chip:
> > +                info = chip.get_info()
> > +                print(
> > +                    "{} [{}] ({} lines)".format(info.name, info.label, info.num_lines)
> > +                )
> > diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
> > new file mode 100755
> > index 0000000..e488a49
> > --- /dev/null
> > +++ b/bindings/python/examples/gpiofind.py
> > @@ -0,0 +1,20 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
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
> > +                offset = chip.get_line_offset_from_name(sys.argv[1])
> > +                if offset is not None:
> > +                    print("{} {}".format(chip.get_info().name, offset))
> > +                    sys.exit(0)
> > +
> > +    sys.exit(1)
> > diff --git a/bindings/python/examples/gpioget.py b/bindings/python/examples/gpioget.py
> > new file mode 100755
> > index 0000000..c509f38
> > --- /dev/null
> > +++ b/bindings/python/examples/gpioget.py
> > @@ -0,0 +1,31 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> > +
> > +"""Simplified reimplementation of the gpioget tool in Python."""
> > +
> > +import gpiod
> > +import sys
> > +
> > +Direction = gpiod.Line.Direction
> > +Value = gpiod.Line.Value
> > +
> > +if __name__ == "__main__":
> > +    if len(sys.argv) < 3:
> > +        raise TypeError("usage: gpioget.py <gpiochip> <offset1> <offset2> ...")
> > +
> > +    path = sys.argv[1]
> > +    offsets = []
> > +    for off in sys.argv[2:]:
> > +        offsets.append(int(off))
> > +
> > +    with gpiod.request_lines(
> > +        path,
> > +        gpiod.RequestConfig(offsets=offsets, consumer="gpioget.py"),
> > +        gpiod.LineConfig(direction=Direction.INPUT),
> > +    ) as request:
> 
> With request_lines() being the primary entry point to the gpiod module,
> consider extending it to allow the RequestConfig and LineConfig kwargs to
> be passed directly to request_lines(), and for those transient objects to
> be constructed within request_lines().
> That way the average user does not need to concern themselves with those
> objects and the code is easier to read.
> i.e.
>     with gpiod.request_lines(
>         path,
>         offsets=offsets,
>         consumer="gpioget.py",
>         direction=Direction.INPUT,
>     ) as request:
> 
> You can still support passing in complete RequestConfig and LineConfig
> as kwargs for cases where the user requires complex configuration.
> i.e.
>     with gpiod.request_lines(
>         path,
>         req_cfg=gpiod.RequestConfig(offsets=offsets, consumer="gpioget.py"),
>         line_cfg=gpiod.LineConfig(direction=Direction.INPUT),
>     ) as request:
> 
> Or for those use cases the user could use the Chip.request_lines() (which
> wouldn't have the kwarg sugar) instead.
> 
> Would be good to have some examples with complex configuration as well,
> not just the tool reimplementations.
> 
> > +        vals = request.get_values()
> > +
> > +        for val in vals:
> > +            print("0" if val == Value.INACTIVE else "1", end=" ")
> > +        print()
> > diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
> > new file mode 100755
> > index 0000000..3097d10
> > --- /dev/null
> > +++ b/bindings/python/examples/gpioinfo.py
> > @@ -0,0 +1,35 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
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
> > +                    active_low = linfo.active_low
> > +
> > +                    print(
> > +                        "\tline {:>3}: {:>18} {:>12} {:>8} {:>10}".format(
> > +                            offset,
> > +                            "unnamed" if name is None else name,
> > +                            "unused" if consumer is None else consumer,
> > +                            "input"
> > +                            if direction == gpiod.Line.Direction.INPUT
> > +                            else "output",
> > +                            "active-low" if active_low else "active-high",
> > +                        )
> > +                    )
> > diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
> > new file mode 100755
> > index 0000000..b0f4b88
> > --- /dev/null
> > +++ b/bindings/python/examples/gpiomon.py
> > @@ -0,0 +1,31 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> > +
> > +"""Simplified reimplementation of the gpiomon tool in Python."""
> > +
> > +import gpiod
> > +import sys
> > +
> > +Edge = gpiod.Line.Edge
> > +
> > +if __name__ == "__main__":
> > +    if len(sys.argv) < 3:
> > +        raise TypeError("usage: gpiomon.py <gpiochip> <offset1> <offset2> ...")
> > +
> > +    path = sys.argv[1]
> > +    offsets = []
> > +    for off in sys.argv[2:]:
> > +        offsets.append(int(off))
> > +
> > +    buf = gpiod.EdgeEventBuffer()
> > +
> > +    with gpiod.request_lines(
> > +        path,
> > +        gpiod.RequestConfig(offsets=offsets, consumer="gpiomon.py"),
> > +        gpiod.LineConfig(edge_detection=Edge.BOTH),
> > +    ) as request:
> > +        while True:
> > +            request.read_edge_event(buf)
> > +            for event in buf:
> > +                print(event)
> 
> Can you hide the buffer here to simplify the common case?
> How about having the request manage the buffer, and add a generator
> method that returns the next event, say edge_events()?
> 
> For the uncommon case, add kwargs to allow the user to provide the buffer,
> or to specify the buffer size.  If neither provided then the request
> constructs a default sized buffer.
> 
> Then the code becomes:
> 
>     with gpiod.request_lines(
>         path,
>         offsets=offsets,
>         consumer="gpiomon.py",
>         edge_detection=Edge.BOTH,
>     ) as request:
>         for event in request.edge_events():
>             print(event)
> 
> > diff --git a/bindings/python/examples/gpioset.py b/bindings/python/examples/gpioset.py
> > new file mode 100755
> > index 0000000..3a8f8cc
> > --- /dev/null
> > +++ b/bindings/python/examples/gpioset.py
> > @@ -0,0 +1,35 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> > +
> > +"""Simplified reimplementation of the gpioset tool in Python."""
> > +
> > +import gpiod
> > +import sys
> > +
> > +Value = gpiod.Line.Value
> > +
> > +if __name__ == "__main__":
> > +    if len(sys.argv) < 3:
> > +        raise TypeError("usage: gpioset.py <gpiochip> <offset1>=<value1> ...")
> > +
> > +    path = sys.argv[1]
> > +    values = dict()
> > +    for arg in sys.argv[2:]:
> > +        arg = arg.split("=")
> > +        key = int(arg[0])
> > +        val = int(arg[1])
> > +
> > +        if val == 1:
> > +            values[key] = Value.ACTIVE
> > +        elif val == 0:
> > +            values[key] = Value.INACTIVE
> > +        else:
> > +            raise ValueError("{} is an invalid value for GPIO lines".format(val))
> > +
> > +    with gpiod.request_lines(
> > +        path,
> > +        gpiod.RequestConfig(offsets=values.keys(), consumer="gpioset.py"),
> > +        gpiod.LineConfig(direction=gpiod.Line.Direction.OUTPUT, output_values=values),
> > +    ) as request:
> > +        input()
> > -- 
> > 2.34.1
> > 
> 
> The focus of my comments above is to simplify the API for the most common
> case, and to make it a little more Pythonic rather than mirroring the C
> API, in both cases by hiding implementation details that the casual user
> doesn't need to know about.
> 

Further to this, and recalling our discussions on tool changes, it would
be great if the Python API supported identification of line by name, not
just (chip,offset).

e.g.
    with gpiod.request_lines(
        lines=("GPIO17", "GPIO18"),
        edge_detection=Edge.BOTH,
    ) as request:
        for event in request.edge_events():
            print(event)

with the returned event extended to contain the line name if the line
was identified by name in request_lines().

The lines kwarg replaces offsets, and could contain names (strings) or
offsets (integers), or a combination.  If any offsets are present then
the chip path kwarg must also be provided.  If the chip isn't provided,
request_lines() would find the corresponding chip based on the line name.

Cheers,
Kent.
