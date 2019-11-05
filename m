Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C26F00BA
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 16:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731111AbfKEPFa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 10:05:30 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35718 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731032AbfKEPFa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 10:05:30 -0500
Received: by mail-ot1-f67.google.com with SMTP id z6so17899691otb.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 07:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Mb1J2Ln+IdyPAYvmWY5Jr5eJKz/8C58yK69JCY37y0=;
        b=ELlsZTLueGcdyr9Py2CLHCJoi+D2+O3Q61Aw8mBQkScbA050jc5kF2+s1zMXaL9Flq
         /u+RtvxFYl16S80QFBEVHUaT2p2p+PNKt9r08K6nwLcr4UvTsK5STVRSJTOxZbaXkNFA
         UqnTfqI4d1O2X0ESy1QVR13miaV9pf5nFIro0Z/JxHbdLhGoOb29KweMz+/irQtNYCxC
         7HRh1awZSdPcBqwkaotQF2ikfFMiEPqQPLa1HD9SZ7ry8RO1S+P/YwwWWAhZWUazT3d3
         VqESPgDJLOUq8Q04mB85uD5V3yVqTkcelorNgHIigDOkmviEpX9CjqMsNmsT/BqhnBcD
         WC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Mb1J2Ln+IdyPAYvmWY5Jr5eJKz/8C58yK69JCY37y0=;
        b=e24PUU2HblpJjHRBI0yNFDH+l4xYJMYILM0+/1gIsQb8uhIkpyMTPlI0ws1kicjRnB
         Hub5GFstjDdPNx0FhSuixwNOU1jVx3+XLVYn2jwCOE0CBkuDpvZeChNfpni3KjdIDj+f
         dDOpiho4pzcMqD8pdejHCIsjJHtk/K/jch9GRwHTFxmYnMzBAKuWpa+nmIbguFMMyPfr
         q7KKJSOpm1lK3LzhiiaTVyW/MuOydYzMbuJBjXrU1/+Ho/PRO7/aqU/qYK7xBpi8bIOD
         yKaGLySgyglSlSflMmn7y33gk4I/KO8vjk2WP7IlLwPOmdJ/73xzRdwutuklNy3Qk8NL
         76Lg==
X-Gm-Message-State: APjAAAXSqTewhuNDzZ84fLouglGSa/0HcZ5Lt+uOU9Q30h70cntU1dS+
        RwgXTK0VFnZVOQ0FaV4q1I+9fbD4e9A1oKNfU0el3w==
X-Google-Smtp-Source: APXvYqwLrFJ7cX5bj0cMCOCNWWH/orp705P4CxNLIWUeadsu1ibuPBE4TdKSE38q6LnlAg4GhxCP+F1eLCnyHEA8xlA=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr24097112otb.85.1572966327618;
 Tue, 05 Nov 2019 07:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20191105020429.18942-1-warthog618@gmail.com>
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 5 Nov 2019 16:05:16 +0100
Message-ID: <CAMpxmJW0ZDUAn3WMTYaRrZZj71f6NV+-nxsZ=JS3rF_8bkXTuQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 5 lis 2019 o 03:04 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a):
>
> The changes from v5:
>   - rebased onto Bart's gpio/for-kent branch.
>
> The changes from v4:
> Review changes:
>  - relocate restriction on applying bias to as-is from patch 2 to patch 1=
.
>  - propagate errors, other than ENOTSUPP, from gpio_set_bias. (squashed
>    into patches 3 and 4).
>  - include SET_CONFIG patch series v2 (patch 6 and 7 here).
>
> I've also fixed a few other nits I noticed along the way:
>  - rework gpio_set_bias as flags are mutually exclusive.
>  - remove input flag required to set bias restriction from
>    lineevent_create as events are implicitly assumed inputs anyway.
>  - reorder patches to group gpiolib bias patches together before the
>    gpio-mockup changes.
>
>
> This series adds gross control of pull-up/pull-down to the GPIO uAPI.
> Gross control means enabling and disabling of bias functionality,
> not finer grained control such as setting biasing impedances.
>
> The support allows both input and output lines to have any one of the
> following biases applied as part of the line handle or event request:
>  0. As Is - bias is left alone.  This is the default for ABI compatibilit=
y.
>  1. Bias Disable - bias is explicitly disabled.
>  2. Pull Down - pull-down bias is enabled.
>  3. Pull Up - pull-up bias is enabled.
>
> The biases are set via three flags, BIAS_DISABLE, BIAS_PULL_DOWN
> and BIAS_PULL_UP.  These map directly to the similarly named
> pinctrl pin_config_param flags.
> As Is corresponds to none of the flags being set.
>
> The setting of biases on output lines may seem odd, but is to allow for
> utilisation of internal pull-up/pull-down on open drain and open source
> outputs, where supported in hardware.
>
> The series also adds the GPIOHANDLE_SET_CONFIG_IOCTL to the gpio chardev.
> The ioctl allows some of the configuration of a requested handle to be
> changed without having to release the line.
> The primary use case is the changing of direction for bi-directional
> lines.
>
> Patches are against Bart's gpio/for-kent branch[1].
>
> The patch has been successfully tested against gpio-mockup, and
> on a Raspberry Pi, in both cases using the feature/pud_set_config
> branch of my Go gpiod library[2], as well as with my feature/pud
> development branch of libgpiod[3].  Patch 7 has only been tested using
> my gpiod library as libgpiod has not yet been updated to support the
> SET_CONFIG ioctl.
>
> Patch 1 adds pull-up/pull-down support to line handle requests.
> Patch 2 adds pull-up/pull-down support to line event requests.
> Patch 3 adds support for disabling bias.
> Patch 4 adds support for setting bias on output lines.
> Patch 5 adds pull-up/down support to the gpio-mockup for uAPI testing.
> Patch 6 refactors the flag validation from linehandle_create.
> Patch 7 adds the SET_CONFIG ioctl.
>
> Drew Fustini (1):
>   gpio: expose pull-up/pull-down line flags to userspace
>
> Kent Gibson (6):
>   gpiolib: add support for pull up/down to lineevent_create
>   gpiolib: add support for disabling line bias
>   gpiolib: add support for biasing output lines
>   gpio: mockup: add set_config to support pull up/down
>   gpiolib: move validation of line handle flags into helper function
>   gpio: add new SET_CONFIG ioctl() to gpio chardev
>
>  drivers/gpio/gpio-mockup.c |  94 ++++++++++------
>  drivers/gpio/gpiolib.c     | 213 +++++++++++++++++++++++++++++++------
>  drivers/gpio/gpiolib.h     |   1 +
>  include/uapi/linux/gpio.h  |  24 +++++
>  4 files changed, 264 insertions(+), 68 deletions(-)
>
> --
> 2.23.0
>

Ok, all looks good now and since Linus already said he's fine with
this series, I'll take it through my tree for v5.5.

Thanks!
Bartosz
