Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4421640EAF0
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 21:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbhIPTmZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 15:42:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:56382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230452AbhIPTmY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Sep 2021 15:42:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93D3761164;
        Thu, 16 Sep 2021 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631821263;
        bh=soyfUqVQbP0TrX3MUGTCtp9M3EsGu8pssJ5XKcFWprU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o8SNT7ENEBzSRvnpewmA/7iWvL7Q61LSeFRnC1pugyW7mzrVUOhghrYs8oNIZT0Qx
         p5A1O3kkdDMILw8O/WnmxW1oZp/gbDrPdW8EDJh4cJL12MPdy2ToeHzZCpyfk2+qb4
         eI0OkIjdk2oFUWVh1alOgqEr4UrS/UsG9JBbn3CrFA4qV9W+D5unbt+Yolxs2scAhQ
         fBEfj3xUNXMiTabH8tLPkUQiPqWng8n2SYAnDmdIG7LGCul63BADhBSM74M46mBVdQ
         VEPmAPpF0I+z7imdkfNmbyZMU7XD0VS2X4URA5Km6FqpqsB7gJUkugByScQxic1wvO
         rv/jVZyice3zQ==
Received: by mail-pf1-f180.google.com with SMTP id y4so5391367pfe.5;
        Thu, 16 Sep 2021 12:41:03 -0700 (PDT)
X-Gm-Message-State: AOAM533xiXUUGEUXNdPnEntZGyoORPmyKYZWARXw+NUfMa36ePmwEQU9
        5dvfNLFTdJBVbEfQmUILd9wXqTu4yunPLlXJMEw=
X-Google-Smtp-Source: ABdhPJxSK0Md4SdwZxQEm62tQpRGeq+lHK11/cMSAJz7jYpspL00UImVffNfMonjsjbKr0XkSgC4uIilxre0QhXL/ao=
X-Received: by 2002:a63:841:: with SMTP id 62mr6376041pgi.354.1631821263269;
 Thu, 16 Sep 2021 12:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20201002162353.GA5870@kozik-lap>
In-Reply-To: <20201002162353.GA5870@kozik-lap>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 16 Sep 2021 21:40:51 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdOvmuGJCF9Edw8zFfOY7r+QFc23OAgjoXtHxN65Ovh7A@mail.gmail.com>
Message-ID: <CAJKOXPdOvmuGJCF9Edw8zFfOY7r+QFc23OAgjoXtHxN65Ovh7A@mail.gmail.com>
Subject: Re: [PATCH v3 01/27] Input: Simplify with dev_err_probe()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2 Oct 2020 at 18:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, Aug 27, 2020 at 08:58:02PM +0200, Krzysztof Kozlowski wrote:
> > Hi,
> >
> > Changes since v2:
> > 1. Add review tags,
> > 2. Fixes after review (see individual patches).
> > 3. Two new patches - 26 and 27.
> >
> >
>
> Hi Dmitry,
>
> Any comments here? Some of these nicely simplify the code or remove some
> lines.

Hi Dmitry,

You never shared your thoughts about this simplification. Some of
these could be redundant with Rob's work:
https://lore.kernel.org/lkml/CAL_Jsq+ajm5aiAJfQdS2+2DO1ynBDHWha_7TsA4u-2qwd87y6g@mail.gmail.com/
but I am not sure if it was merged.

On the other hand there are here also few other changes like:
>   gpio: Add devm_fwnode_gpiod_get_optional() helpers
>   Input: gpio_keys - Simplify with dev_err_probe()
which does:
8 insertions(+), 17 deletions(-)

and these:
>   Input: bu21013_ts - Use local 'client->dev' variable in probe()
>   Input: bu21029_ts - Use local 'client->dev' variable in probe()

Any comments?

Best regards,
Krzysztof



> > Krzysztof Kozlowski (27):
> >   Input: gpio_keys_polled - Simplify with dev_err_probe()
> >   Input: gpio-vibra - Simplify with dev_err_probe()
> >   Input: pwm-beeper - Simplify with dev_err_probe()
> >   Input: pwm-vibra - Simplify with dev_err_probe()
> >   Input: rotary_encoder - Simplify with dev_err_probe()
> >   Input: elan_i2c - Simplify with dev_err_probe()
> >   Input: bu21013_ts - Simplify with dev_err_probe()
> >   Input: bu21029_ts - Simplify with dev_err_probe()
> >   Input: chipone_icn8318 - Simplify with dev_err_probe()
> >   Input: cy8ctma140 - Simplify with dev_err_probe()
> >   Input: edf-ft5x06 - Simplify with dev_err_probe()
> >   Input: ektf2127 - Simplify with dev_err_probe()
> >   Input: elants_i2c - Simplify with dev_err_probe()
> >   Input: goodix - Simplify with dev_err_probe()
> >   Input: melfas_mip4 - Simplify with dev_err_probe()
> >   Input: pixcir_i2c_ts - Simplify with dev_err_probe()
> >   Input: raydium_i2c_ts - Simplify with dev_err_probe()
> >   Input: resistive-adc-touch - Simplify with dev_err_probe()
> >   Input: silead - Simplify with dev_err_probe()
> >   Input: sis_i2c - Simplify with dev_err_probe()
> >   Input: surface3_spi - Simplify with dev_err_probe()
> >   Input: sx8643 - Simplify with dev_err_probe()
> >   Input: bcm-keypad - Simplify with dev_err_probe()
> >   gpio: Add devm_fwnode_gpiod_get_optional() helpers
> >   Input: gpio_keys - Simplify with dev_err_probe()
> >   Input: bu21013_ts - Use local 'client->dev' variable in probe()
> >   Input: bu21029_ts - Use local 'client->dev' variable in probe()
> >
> >  drivers/gpio/gpiolib-devres.c                 | 71 ++++++++++++++++++
> >  drivers/input/keyboard/bcm-keypad.c           | 14 ++--
> >  drivers/input/keyboard/gpio_keys.c            | 25 +++----
> >  drivers/input/keyboard/gpio_keys_polled.c     |  8 +--
> >  drivers/input/misc/gpio-vibra.c               | 20 ++----
> >  drivers/input/misc/pwm-beeper.c               | 19 ++---
> >  drivers/input/misc/pwm-vibra.c                | 20 ++----
> >  drivers/input/misc/rotary_encoder.c           |  8 +--
> >  drivers/input/mouse/elan_i2c_core.c           |  9 +--
> >  drivers/input/touchscreen/bu21013_ts.c        | 72 ++++++++-----------
> >  drivers/input/touchscreen/bu21029_ts.c        | 53 ++++++--------
> >  drivers/input/touchscreen/chipone_icn8318.c   |  8 +--
> >  drivers/input/touchscreen/cy8ctma140.c        |  8 +--
> >  drivers/input/touchscreen/edt-ft5x06.c        | 10 +--
> >  drivers/input/touchscreen/ektf2127.c          |  8 +--
> >  drivers/input/touchscreen/elants_i2c.c        | 22 ++----
> >  drivers/input/touchscreen/goodix.c            | 40 +++--------
> >  drivers/input/touchscreen/melfas_mip4.c       |  9 +--
> >  drivers/input/touchscreen/pixcir_i2c_ts.c     | 38 ++++------
> >  drivers/input/touchscreen/raydium_i2c_ts.c    | 30 +++-----
> >  .../input/touchscreen/resistive-adc-touch.c   |  8 +--
> >  drivers/input/touchscreen/silead.c            |  8 +--
> >  drivers/input/touchscreen/sis_i2c.c           | 20 ++----
> >  drivers/input/touchscreen/surface3_spi.c      | 13 +---
> >  drivers/input/touchscreen/sx8654.c            | 10 +--
> >  include/linux/gpio/consumer.h                 | 30 ++++++++
> >  26 files changed, 253 insertions(+), 328 deletions(-)
> >
> > --
> > 2.17.1
> >
