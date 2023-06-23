Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3BB373BED4
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 21:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjFWTbV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 15:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjFWTbU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 15:31:20 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F202701
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 12:31:17 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-440ad8ea514so386769137.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 12:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687548677; x=1690140677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptu6wm6EItrvOHtLLEDXWJaQ8SwZ1nXDPAWk33Da5kc=;
        b=I7WI4RR0bLRoNjPXr70nrhnGN5CeCC7prw9+UyOz/XIS1MsqktHGqLAPfcWW1OqoxD
         vQioeXVLk4RL5kGY706S0D2A2LVYQj1J4U/C/6r8sQgxMkz2eUOZZa5CJ7bA15xhcEM0
         UzgwhxQOnlMeKsNJBs3a3slTCxVHVXIMbmRChQ9RgZFuuRfpurMKQiokOivT4fGX+Izo
         2q//oVnrlRjSflIC1OADJ6Ln4bF4A21uhvI1stOHqNkPxU40B8WHNfsV1iFOAlrRaoZh
         Rtggf9QNmZAdocw7p+MvCZ1OFRxWHsSbWE3sopdeUgHObNT/m4AI+arsszpzOGwDWcgy
         azbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687548677; x=1690140677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptu6wm6EItrvOHtLLEDXWJaQ8SwZ1nXDPAWk33Da5kc=;
        b=Ixtqkjg/N0yq4z9YqwvzFNb7bsQDDpakCle+ygOhnLfrO+fyVhiFLxITMYf7IwZEoT
         HrjNg2tnp6YX1CAYqmZr9fT8PK/RIN583psYCxc40XujYuGt3yzifhNtaa8f02Re7Ahh
         VYiyz4OlWIgvo2HOuPXq+/tEq3wy79u6tJwTNiwfn8S/jMnuvbWQqJgJs+E/EECs4dHU
         S3fe/XVsOIw90oUyYrKeIvOHPf72k/a6DS3TaJAYt3T03C/GHvQ/M4TU+dwH/H8EZy8D
         fmXPUZVlY+kcUul3gygYlg0LeaQroISLBNV9gin5Qs7RN4UjAdtDPzlp9nI1k0wwBkAg
         MMSw==
X-Gm-Message-State: AC+VfDwbq0d4Uq/b0Slh94agNjJMZjBU5skjXmMNW0zJTSirvR3/ffQ+
        Oqt/al6EDDsblFuj8aFg03J7WojZb5skVPNqDsm/wp5p1t9pPvwK
X-Google-Smtp-Source: ACHHUZ4mPJiO/SuJGhcBlTQfIcCXrD6V09zOUtNiTmji9uTL1AqUO9qNYNsxjljrNSoHI1zWftN244F+BrGIZDMwABk=
X-Received: by 2002:a67:ce91:0:b0:43b:2682:a4a3 with SMTP id
 c17-20020a67ce91000000b0043b2682a4a3mr11620960vse.23.1687548676770; Fri, 23
 Jun 2023 12:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230623043901.16764-1-warthog618@gmail.com> <20230623043901.16764-7-warthog618@gmail.com>
In-Reply-To: <20230623043901.16764-7-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 23 Jun 2023 21:31:05 +0200
Message-ID: <CAMRc=MfYa0GYka0098H2UWtse1k7Lcm-QZZux+VHtcnELg1vhw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 6/8] bindings: python: examples: replace tools
 examples with use case examples
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 23, 2023 at 6:40=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> Replace tool examples with use case examples drawn from the tools.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/python/examples/Makefile.am          | 18 +++----
>  bindings/python/examples/find_line_by_name.py | 37 +++++++++++++++
>  bindings/python/examples/get_chip_info.py     | 20 ++++++++
>  bindings/python/examples/get_line_info.py     | 29 ++++++++++++
>  .../examples/get_multiple_line_values.py      | 29 ++++++++++++
>  bindings/python/examples/gpiodetect.py        | 15 ------
>  bindings/python/examples/gpiofind.py          | 20 --------
>  bindings/python/examples/gpioget.py           | 29 ------------
>  bindings/python/examples/gpioinfo.py          | 28 -----------
>  bindings/python/examples/gpiomon.py           | 26 ----------
>  bindings/python/examples/gpionotify.py        | 21 ---------
>  bindings/python/examples/gpioset.py           | 36 --------------
>  bindings/python/examples/helpers.py           | 15 ------
>  .../examples/reconfigure_input_to_output.py   | 39 +++++++++++++++
>  .../examples/toggle_multiple_line_values.py   | 47 +++++++++++++++++++
>  bindings/python/examples/watch_line_info.py   | 23 +++++++++
>  bindings/python/examples/watch_line_rising.py | 31 ++++++++++++
>  .../examples/watch_multiple_line_values.py    | 43 +++++++++++++++++
>  18 files changed, 308 insertions(+), 198 deletions(-)
>  create mode 100755 bindings/python/examples/find_line_by_name.py
>  create mode 100755 bindings/python/examples/get_chip_info.py
>  create mode 100755 bindings/python/examples/get_line_info.py
>  create mode 100755 bindings/python/examples/get_multiple_line_values.py
>  delete mode 100755 bindings/python/examples/gpiodetect.py
>  delete mode 100755 bindings/python/examples/gpiofind.py
>  delete mode 100755 bindings/python/examples/gpioget.py
>  delete mode 100755 bindings/python/examples/gpioinfo.py
>  delete mode 100755 bindings/python/examples/gpiomon.py
>  delete mode 100755 bindings/python/examples/gpionotify.py
>  delete mode 100755 bindings/python/examples/gpioset.py
>  delete mode 100644 bindings/python/examples/helpers.py
>  create mode 100755 bindings/python/examples/reconfigure_input_to_output.=
py
>  create mode 100755 bindings/python/examples/toggle_multiple_line_values.=
py
>  create mode 100755 bindings/python/examples/watch_line_info.py
>  create mode 100755 bindings/python/examples/watch_line_rising.py
>  create mode 100755 bindings/python/examples/watch_multiple_line_values.p=
y
>
> diff --git a/bindings/python/examples/Makefile.am b/bindings/python/examp=
les/Makefile.am
> index c8c1c98..52abafc 100644
> --- a/bindings/python/examples/Makefile.am
> +++ b/bindings/python/examples/Makefile.am
> @@ -3,13 +3,15 @@
>
>  EXTRA_DIST =3D \
>         async_watch_line_value.py \
> +       find_line_by_name.py \
> +       get_chip_info.py \
> +       get_line_info.py \
>         get_line_value.py \
> -       gpiodetect.py \
> -       gpiofind.py \
> -       gpioget.py \
> -       gpioinfo.py \
> -       gpiomon.py \
> -       gpionotify.py \
> -       gpioset.py \
> +       get_multiple_line_values.py \
> +       reconfigure_input_to_output.py \
>         toggle_line_value.py \
> -       watch_line_value.py
> +       toggle_multiple_line_values.py \
> +       watch_line_requests.py \
> +       watch_line_value.py \
> +       watch_line_rising.py \
> +       watch_multiple_line_values.py
> diff --git a/bindings/python/examples/find_line_by_name.py b/bindings/pyt=
hon/examples/find_line_by_name.py
> new file mode 100755
> index 0000000..58f1cd0
> --- /dev/null
> +++ b/bindings/python/examples/find_line_by_name.py
> @@ -0,0 +1,37 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +
> +"""Minimal example of finding a line with the given name."""
> +
> +import gpiod
> +import os
> +
> +
> +def gpio_chips():

Please call it get_gpio_chip() to indicate it's an action performed by
the function.

> +    for entry in os.scandir("/dev/"):
> +        if gpiod.is_gpiochip_device(entry.path):
> +            yield entry.path
> +
> +
> +def find_line_by_name(line_name):
> +    # Names are not guaranteed unique, so this finds the first line with
> +    # the given name.
> +    for path in gpio_chips():
> +        with gpiod.Chip(path) as chip:
> +            try:
> +                offset =3D chip.line_offset_from_id(line_name)
> +                print("{}: {} {}".format(line_name, chip.get_info().name=
, offset))
> +                return
> +            except OSError:
> +                # An OSError is raised if the name is not found.
> +                continue
> +
> +    print("line '{}' not found".format(line_name))
> +
> +
> +if __name__ =3D=3D "__main__":
> +    try:
> +        find_line_by_name("GPIO19")
> +    except OSError as ex:
> +        print(ex, "\nCustomise the example configuration to suit your si=
tuation")
> diff --git a/bindings/python/examples/get_chip_info.py b/bindings/python/=
examples/get_chip_info.py
> new file mode 100755
> index 0000000..7dc76fb
> --- /dev/null
> +++ b/bindings/python/examples/get_chip_info.py
> @@ -0,0 +1,20 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +
> +"""Minimal example of reading the info for a chip."""
> +
> +import gpiod
> +
> +
> +def get_chip_info(chip_path):
> +    with gpiod.Chip(chip_path) as chip:
> +        info =3D chip.get_info()
> +        print("{} [{}] ({} lines)".format(info.name, info.label, info.nu=
m_lines))
> +
> +
> +if __name__ =3D=3D "__main__":
> +    try:
> +        get_chip_info("/dev/gpiochip0")
> +    except OSError as ex:
> +        print(ex, "\nCustomise the example configuration to suit your si=
tuation")
> diff --git a/bindings/python/examples/get_line_info.py b/bindings/python/=
examples/get_line_info.py
> new file mode 100755
> index 0000000..cd4ebcc
> --- /dev/null
> +++ b/bindings/python/examples/get_line_info.py
> @@ -0,0 +1,29 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +
> +"""Minimal example of reading the info for a line."""
> +
> +import gpiod
> +
> +
> +def get_line_info(chip_path, line_offset):
> +    with gpiod.Chip(chip_path) as chip:
> +        info =3D chip.get_line_info(line_offset)
> +        is_input =3D info.direction =3D=3D gpiod.line.Direction.INPUT
> +        print(
> +            "line {:>3}: {:>12} {:>12} {:>8} {:>10}".format(
> +                info.offset,
> +                info.name or "unnamed",
> +                info.consumer or "unused",
> +                "input" if is_input else "output",
> +                "active-low" if info.active_low else "active-high",
> +            )
> +        )
> +
> +
> +if __name__ =3D=3D "__main__":
> +    try:
> +        get_line_info("/dev/gpiochip0", 3)
> +    except OSError as ex:
> +        print(ex, "\nCustomise the example configuration to suit your si=
tuation")
> diff --git a/bindings/python/examples/get_multiple_line_values.py b/bindi=
ngs/python/examples/get_multiple_line_values.py
> new file mode 100755
> index 0000000..46cf0b2
> --- /dev/null
> +++ b/bindings/python/examples/get_multiple_line_values.py
> @@ -0,0 +1,29 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +
> +"""Minimal example of reading multiple lines."""
> +
> +import gpiod
> +
> +from gpiod.line import Direction
> +
> +
> +def get_multiple_line_values(chip_path, line_offsets):
> +    with gpiod.request_lines(
> +        chip_path,
> +        consumer=3D"get-multiple-line-values",
> +        config=3D{tuple(line_offsets): gpiod.LineSettings(direction=3DDi=
rection.INPUT)},
> +    ) as request:
> +        vals =3D request.get_values()
> +
> +        for offset, val in zip(line_offsets, vals):
> +            print("{}=3D{} ".format(offset, val), end=3D"")
> +        print()
> +
> +
> +if __name__ =3D=3D "__main__":
> +    try:
> +        get_multiple_line_values("/dev/gpiochip0", [5, 3, 7])
> +    except OSError as ex:
> +        print(ex, "\nCustomise the example configuration to suit your si=
tuation")
> diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/exa=
mples/gpiodetect.py
> deleted file mode 100755
> index dc98b03..0000000
> --- a/bindings/python/examples/gpiodetect.py
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -#!/usr/bin/env python3
> -# SPDX-License-Identifier: GPL-2.0-or-later
> -# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> -
> -"""Reimplementation of the gpiodetect tool in Python."""
> -
> -import gpiod
> -import os
> -
> -from helpers import gpio_chips
> -
> -if __name__ =3D=3D "__main__":
> -    for chip in gpio_chips():
> -        info =3D chip.get_info()
> -        print("{} [{}] ({} lines)".format(info.name, info.label, info.nu=
m_lines))
> diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examp=
les/gpiofind.py
> deleted file mode 100755
> index d41660d..0000000
> --- a/bindings/python/examples/gpiofind.py
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/usr/bin/env python3
> -# SPDX-License-Identifier: GPL-2.0-or-later
> -# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> -
> -"""Reimplementation of the gpiofind tool in Python."""
> -
> -import gpiod
> -import os
> -import sys
> -
> -if __name__ =3D=3D "__main__":
> -    for entry in os.scandir("/dev/"):
> -        if gpiod.is_gpiochip_device(entry.path):
> -            with gpiod.Chip(entry.path) as chip:
> -                offset =3D chip.line_offset_from_id(sys.argv[1])
> -                if offset is not None:
> -                    print("{} {}".format(chip.get_info().name, offset))
> -                    sys.exit(0)
> -
> -    sys.exit(1)
> diff --git a/bindings/python/examples/gpioget.py b/bindings/python/exampl=
es/gpioget.py
> deleted file mode 100755
> index bf7e0a6..0000000
> --- a/bindings/python/examples/gpioget.py
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -#!/usr/bin/env python3
> -# SPDX-License-Identifier: GPL-2.0-or-later
> -# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> -
> -"""Simplified reimplementation of the gpioget tool in Python."""
> -
> -import gpiod
> -import sys
> -
> -from gpiod.line import Direction
> -
> -if __name__ =3D=3D "__main__":
> -    if len(sys.argv) < 3:
> -        raise TypeError("usage: gpioget.py <gpiochip> <offset1> <offset2=
> ...")
> -
> -    path =3D sys.argv[1]
> -    lines =3D [int(line) if line.isdigit() else line for line in sys.arg=
v[2:]]
> -
> -    request =3D gpiod.request_lines(
> -        path,
> -        consumer=3D"gpioget.py",
> -        config=3D{tuple(lines): gpiod.LineSettings(direction=3DDirection=
.INPUT)},
> -    )
> -
> -    vals =3D request.get_values()
> -
> -    for val in vals:
> -        print("{} ".format(val.value), end=3D"")
> -    print()
> diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examp=
les/gpioinfo.py
> deleted file mode 100755
> index 3996dcf..0000000
> --- a/bindings/python/examples/gpioinfo.py
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -#!/usr/bin/env python3
> -# SPDX-License-Identifier: GPL-2.0-or-later
> -# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> -
> -"""Simplified reimplementation of the gpioinfo tool in Python."""
> -
> -import gpiod
> -import os
> -
> -from helpers import gpio_chips
> -
> -if __name__ =3D=3D "__main__":
> -    for chip in gpio_chips():
> -        cinfo =3D chip.get_info()
> -        print("{} - {} lines:".format(cinfo.name, cinfo.num_lines))
> -
> -        for offset in range(0, cinfo.num_lines):
> -            linfo =3D chip.get_line_info(offset)
> -            is_input =3D linfo.direction =3D=3D gpiod.line.Direction.INP=
UT
> -            print(
> -                "\tline {:>3}: {:>18} {:>12} {:>8} {:>10}".format(
> -                    linfo.offset,
> -                    linfo.name or "unnamed",
> -                    linfo.consumer or "unused",
> -                    "input" if is_input else "output",
> -                    "active-low" if linfo.active_low else "active-high",
> -                )
> -            )
> diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/exampl=
es/gpiomon.py
> deleted file mode 100755
> index 702d7c8..0000000
> --- a/bindings/python/examples/gpiomon.py
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -#!/usr/bin/env python3
> -# SPDX-License-Identifier: GPL-2.0-or-later
> -# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> -
> -"""Simplified reimplementation of the gpiomon tool in Python."""
> -
> -import gpiod
> -import sys
> -
> -from gpiod.line import Edge
> -
> -if __name__ =3D=3D "__main__":
> -    if len(sys.argv) < 3:
> -        raise TypeError("usage: gpiomon.py <gpiochip> <offset1> <offset2=
> ...")
> -
> -    path =3D sys.argv[1]
> -    lines =3D [int(line) if line.isdigit() else line for line in sys.arg=
v[2:]]
> -
> -    with gpiod.request_lines(
> -        path,
> -        consumer=3D"gpiomon.py",
> -        config=3D{tuple(lines): gpiod.LineSettings(edge_detection=3DEdge=
.BOTH)},
> -    ) as request:
> -        while True:
> -            for event in request.read_edge_events():
> -                print(event)
> diff --git a/bindings/python/examples/gpionotify.py b/bindings/python/exa=
mples/gpionotify.py
> deleted file mode 100755
> index 4e50515..0000000
> --- a/bindings/python/examples/gpionotify.py
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -#!/usr/bin/env python3
> -# SPDX-License-Identifier: GPL-2.0-or-later
> -# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@=
linaro.org>
> -
> -"""Simplified reimplementation of the gpionotify tool in Python."""
> -
> -import gpiod
> -import sys
> -
> -if __name__ =3D=3D "__main__":
> -    if len(sys.argv) < 3:
> -        raise TypeError("usage: gpionotify.py <gpiochip> <offset1> <offs=
et2> ...")
> -
> -    path =3D sys.argv[1]
> -
> -    with gpiod.Chip(path) as chip:
> -        for line in sys.argv[2:]:
> -            chip.watch_line_info(line)
> -
> -        while True:
> -            print(chip.read_info_event())
> diff --git a/bindings/python/examples/gpioset.py b/bindings/python/exampl=
es/gpioset.py
> deleted file mode 100755
> index e6a516c..0000000
> --- a/bindings/python/examples/gpioset.py
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -#!/usr/bin/env python3
> -# SPDX-License-Identifier: GPL-2.0-or-later
> -# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> -
> -"""Simplified reimplementation of the gpioset tool in Python."""
> -
> -import gpiod
> -import sys
> -
> -from gpiod.line import Direction, Value
> -
> -if __name__ =3D=3D "__main__":
> -    if len(sys.argv) < 3:
> -        raise TypeError(
> -            "usage: gpioset.py <gpiochip> <offset1>=3D<value1> <offset2>=
=3D<value2> ..."
> -        )
> -
> -    path =3D sys.argv[1]
> -
> -    def parse_value(arg):
> -        x, y =3D arg.split("=3D")
> -        return (x, Value(int(y)))
> -
> -    def make_settings(val):
> -        return gpiod.LineSettings(direction=3DDirection.OUTPUT, output_v=
alue=3Dval)
> -
> -    lvs =3D [parse_value(arg) for arg in sys.argv[2:]]
> -    config =3D dict((l, make_settings(v)) for (l, v) in lvs)
> -
> -    request =3D gpiod.request_lines(
> -        path,
> -        consumer=3D"gpioset.py",
> -        config=3Dconfig,
> -    )
> -
> -    input()
> diff --git a/bindings/python/examples/helpers.py b/bindings/python/exampl=
es/helpers.py
> deleted file mode 100644
> index 8b91173..0000000
> --- a/bindings/python/examples/helpers.py
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -# SPDX-License-Identifier: LGPL-2.1-or-later
> -# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> -
> -import gpiod
> -import os
> -
> -
> -def gpio_chips():
> -    for path in [
> -        entry.path
> -        for entry in os.scandir("/dev/")
> -        if gpiod.is_gpiochip_device(entry.path)
> -    ]:
> -        with gpiod.Chip(path) as chip:
> -            yield chip
> diff --git a/bindings/python/examples/reconfigure_input_to_output.py b/bi=
ndings/python/examples/reconfigure_input_to_output.py
> new file mode 100755
> index 0000000..60d3015
> --- /dev/null
> +++ b/bindings/python/examples/reconfigure_input_to_output.py
> @@ -0,0 +1,39 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +
> +"""Minimal example of requesting a line intended for bi-directional use =
as input and then switching to output."""

black doesn't break strings but could you limit it to 88 chars here?

> +
> +import gpiod
> +
> +from gpiod.line import Direction, Value
> +
> +
> +def reconfigure_input_to_output(chip_path, line_offset):
> +    # request the line initially as an input
> +    with gpiod.request_lines(
> +        chip_path,
> +        consumer=3D"reconfigure-input-to-output",
> +        config=3D{line_offset: gpiod.LineSettings(direction=3DDirection.=
INPUT)},
> +    ) as request:
> +        # read the current line value
> +        value =3D request.get_value(line_offset)
> +        print("{}=3D{} (input)".format(line_offset, value))
> +        # switch the line to an output and drive it low
> +        request.reconfigure_lines(
> +            config=3D{
> +                line_offset: gpiod.LineSettings(
> +                    direction=3DDirection.OUTPUT, output_value=3DValue.I=
NACTIVE
> +                )
> +            }
> +        )
> +        # report the current driven value
> +        value =3D request.get_value(line_offset)
> +        print("{}=3D{} (output)".format(line_offset, value))
> +
> +
> +if __name__ =3D=3D "__main__":
> +    try:
> +        reconfigure_input_to_output("/dev/gpiochip0", 5)
> +    except OSError as ex:
> +        print(ex, "\nCustomise the example configuration to suit your si=
tuation")
> diff --git a/bindings/python/examples/toggle_multiple_line_values.py b/bi=
ndings/python/examples/toggle_multiple_line_values.py
> new file mode 100755
> index 0000000..12b968d
> --- /dev/null
> +++ b/bindings/python/examples/toggle_multiple_line_values.py
> @@ -0,0 +1,47 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +
> +"""Minimal example of toggling multiple lines."""
> +
> +import gpiod
> +import time
> +
> +from gpiod.line import Direction, Value
> +
> +
> +def toggle_value(value):
> +    if value =3D=3D Value.INACTIVE:
> +        return Value.ACTIVE
> +    return Value.INACTIVE
> +
> +
> +def toggle_multiple_line_values(chip_path, line_values):
> +    value_str =3D {Value.ACTIVE: "Active", Value.INACTIVE: "Inactive"}
> +
> +    request =3D gpiod.request_lines(
> +        chip_path,
> +        consumer=3D"toggle-multiple-line-values",
> +        config=3D{
> +            tuple(line_values.keys()): gpiod.LineSettings(direction=3DDi=
rection.OUTPUT)
> +        },
> +        output_values=3Dline_values,
> +    )
> +
> +    while True:
> +        print(
> +            " ".join("{}=3D{}".format(l, value_str[v]) for (l, v) in lin=
e_values.items())
> +        )
> +        time.sleep(1)
> +        for l, v in line_values.items():
> +            line_values[l] =3D toggle_value(v)
> +        request.set_values(line_values)
> +
> +
> +if __name__ =3D=3D "__main__":
> +    try:
> +        toggle_multiple_line_values(
> +            "/dev/gpiochip0", {5: Value.ACTIVE, 3: Value.ACTIVE, 7: Valu=
e.INACTIVE}
> +        )
> +    except OSError as ex:
> +        print(ex, "\nCustomise the example configuration to suit your si=
tuation")
> diff --git a/bindings/python/examples/watch_line_info.py b/bindings/pytho=
n/examples/watch_line_info.py
> new file mode 100755
> index 0000000..e49a669
> --- /dev/null
> +++ b/bindings/python/examples/watch_line_info.py
> @@ -0,0 +1,23 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +
> +"""Minimal example of watching for info changes on particular lines."""
> +
> +import gpiod
> +
> +
> +def watch_line_info(chip_path, line_offsets):
> +    with gpiod.Chip(chip_path) as chip:
> +        for offset in line_offsets:
> +            chip.watch_line_info(offset)
> +
> +        while True:
> +            print(chip.read_info_event())
> +
> +
> +if __name__ =3D=3D "__main__":
> +    try:
> +        watch_line_info("/dev/gpiochip0", [5, 3, 7])
> +    except OSError as ex:
> +        print(ex, "\nCustomise the example configuration to suit your si=
tuation")
> diff --git a/bindings/python/examples/watch_line_rising.py b/bindings/pyt=
hon/examples/watch_line_rising.py
> new file mode 100755
> index 0000000..2350d76
> --- /dev/null
> +++ b/bindings/python/examples/watch_line_rising.py
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +
> +"""Minimal example of watching for rising edges on a single line."""
> +
> +import gpiod
> +
> +from gpiod.line import Edge
> +
> +
> +def watch_line_rising(chip_path, line_offset):
> +    with gpiod.request_lines(
> +        chip_path,
> +        consumer=3D"watch-line-rising",
> +        config=3D{line_offset: gpiod.LineSettings(edge_detection=3DEdge.=
RISING)},
> +    ) as request:
> +        while True:
> +            # Blocks until at least one event is available
> +            for event in request.read_edge_events():
> +                print(
> +                    "line: %d  type: Rising   event #%d"
> +                    % (event.line_offset, event.line_seqno)
> +                )
> +
> +
> +if __name__ =3D=3D "__main__":
> +    try:
> +        watch_line_rising("/dev/gpiochip0", 5)
> +    except OSError as ex:
> +        print(ex, "\nCustomise the example configuration to suit your si=
tuation")
> diff --git a/bindings/python/examples/watch_multiple_line_values.py b/bin=
dings/python/examples/watch_multiple_line_values.py
> new file mode 100755
> index 0000000..4fbf05c
> --- /dev/null
> +++ b/bindings/python/examples/watch_multiple_line_values.py
> @@ -0,0 +1,43 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +
> +"""Minimal example of watching for edges on multiple lines."""
> +
> +import gpiod
> +
> +from gpiod.line import Edge
> +
> +
> +def edge_type(event):
> +    if event.event_type is event.Type.RISING_EDGE:
> +        return "Rising"
> +    if event.event_type is event.Type.FALLING_EDGE:
> +        return "Falling"
> +    return "Unknown"
> +
> +
> +def watch_multiple_line_values(chip_path, line_offsets):
> +    with gpiod.request_lines(
> +        chip_path,
> +        consumer=3D"watch-multiple-line-values",
> +        config=3D{tuple(line_offsets): gpiod.LineSettings(edge_detection=
=3DEdge.BOTH)},
> +    ) as request:
> +        while True:
> +            for event in request.read_edge_events():
> +                print(
> +                    "offset: %d  type: %-7s  event #%d  line event #%d"

Could you please stick to the "{}".format() style of output formatting
for print() that we already use across the code base? Unless there's a
very good reason not to?

Bart

> +                    % (
> +                        event.line_offset,
> +                        edge_type(event),
> +                        event.global_seqno,
> +                        event.line_seqno,
> +                    )
> +                )
> +
> +
> +if __name__ =3D=3D "__main__":
> +    try:
> +        watch_multiple_line_values("/dev/gpiochip0", [5, 3, 7])
> +    except OSError as ex:
> +        print(ex, "\nCustomise the example configuration to suit your si=
tuation")
> --
> 2.41.0
>
