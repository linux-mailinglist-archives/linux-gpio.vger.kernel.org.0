Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87D676D91D5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Apr 2023 10:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbjDFIkb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Apr 2023 04:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjDFIkb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Apr 2023 04:40:31 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0DBE79
        for <linux-gpio@vger.kernel.org>; Thu,  6 Apr 2023 01:40:29 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id z17so27156806vsf.4
        for <linux-gpio@vger.kernel.org>; Thu, 06 Apr 2023 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680770428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR3lSlRmFdYNE1a70r8vLaLLs3BrzD6yzomUa88ohkk=;
        b=o5Pbl1y/uUk1ZOPzA0i/Icesou7llplJZMO8L9FW8PnXFswcV0JArMpwztigXQcu7a
         rL2noQZvQyap9RPvibdBWplOaMHjTKbvnwUkFyZShbL2FoXcsPA3pcmFsFUTI7lRVrKs
         2i8EADUYwzLHBjMs/NTeSborLyY9dMAkd/Tj6IxxJApHQqyQQK9LcQMc8sE6cKfEaP3p
         mdJOv7dMhQQpzifFFlG85YHy+yh9Feq8s11JGHxUonsyD7OOszM0LHTqE1qCeP8+HeQ3
         3ruaDtaI8WSC1zqzCK6UWy2uv10q/cLrQR9mrX62h3EVz8jx6iTtVZlZCIW/0Wgjx4SO
         MAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680770428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jR3lSlRmFdYNE1a70r8vLaLLs3BrzD6yzomUa88ohkk=;
        b=hRe7/m6Fo+q8hKf5L5fbxMCae2/hGXYf7TePaDYM2OxBKjo7ilz7+XMNaXfFV7gunm
         Cq0WgPS5Ap+rTJnwyQPZ9ofiIQqq/D8pKLVxrW3b/JtIjztkdzc/6QEE6qFAPRZH9TO2
         wGGhYXQBDbsdGPdr1Y5ECa5EeNRPLSOJGmdH6YABy0IXR6SRjuSph2AaGD2DSoJbHIZ1
         3+BWIaow3MQJpOrJjwWrzH7qZHhTTUQa5PHnHXzkJHXN0dVXyeBuSz9C8W34gQ/o/gy9
         R6pPsxPtpZmwYHZEURMPoMii3jCIoPX4PmWZbsZZlyGwywZHPoyRFBsBKxhGeoheL0X6
         TLzQ==
X-Gm-Message-State: AAQBX9ef+vvihoTHBu9DLEY4EqLXzRMzoN9mcrGuO7ziJRo5IMvBeCr3
        ezXbBDfYg502n6LE6J0Dk/MyKuWO3ebpmeASw6kzoQ==
X-Google-Smtp-Source: AKy350bmVOdCYhwvmpu+PiK2jygpvRtLrmmk78Ewa9wvym1GnHg5SBR+F3ruO1114iQkbo8VLT1EdNlwg6Dw6DEiodo=
X-Received: by 2002:a05:6102:23f0:b0:426:7730:2002 with SMTP id
 p16-20020a05610223f000b0042677302002mr7043184vsc.0.1680770427798; Thu, 06 Apr
 2023 01:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <ZC1vWkY52ggGxem8@black.fi.intel.com>
In-Reply-To: <ZC1vWkY52ggGxem8@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 6 Apr 2023 10:40:16 +0200
Message-ID: <CAMRc=MeqExfmEtAEfc01Zqw_vmC_qAtQKcaPK6aERt6ovpR1ng@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.4-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 5, 2023 at 2:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers et al.,
>
> Here is the second PR for GPIO subsystem that contains some treewide fixe=
s
> against previous PR along with Intel GPIO related stuff. It has been in t=
he
> Linux Next for a few weeks without no additional problems being reported.
> Please, pull this for v6.4 cycle.
>
> This can be treated as immutable tag, in case anyone wants to go with it
> separately.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 380c7ba3923c6e471aff0f951a6cf42e8dec2c=
79:
>
>   gpiolib: Clean up headers (2023-03-06 12:33:02 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.4-2
>
> for you to fetch changes up to 782eea0c89f7d071d6b56ecfa1b8b0c81164b9be:
>
>   gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xNU (2023-03-23 1=
6:22:18 +0200)
>
> ----------------------------------------------------------------
> intel-gpio for v6.4-2
>
> * Fixed suspend issue on Clevo NL5xNU
> * Split a new Intel Tangier (library) driver for current and new platform=
s
> * Introduced a new driver for Intel Elkhart Lake PSE GPIO (see also above=
)
> * Contained a few fixes for the previous of_gpio.h cleanup
> * Miscellaneous cleanups here and there
>
> The following is an automated git shortlog grouped by driver:
>
> elkhartlake:
>  -  Introduce Intel Elkhart Lake PSE GPIO
>
> gpiolib:
>  -  acpi: Add a ignore wakeup quirk for Clevo NL5xNU
>  -  acpi: Move ACPI device NULL check to acpi_get_driver_gpio_data()
>  -  acpi: use the fwnode in acpi_gpiochip_find()
>
> ich:
>  -  Use devm_gpiochip_add_data() to simplify remove path
>
> merrifield:
>  -  Utilise temporary variable for struct device
>  -  Use dev_err_probe()
>  -  Adapt to Intel Tangier GPIO driver
>
> mips:
>  -  ar7: include linux/gpio/driver.h
>
> mm-lantiq:
>  -  Fix typo in the newly added header filename
>
> powerpc/40x:
>  -  Add missing select OF_GPIO_MM_GPIOCHIP
>
> sh:
>  -  mach-x3proto: Add missing #include <linux/gpio/driver.h>
>
> tangier:
>  -  Introduce Intel Tangier GPIO driver
>
> ----------------------------------------------------------------
> Andrew Davis (1):
>       gpio: ich: Use devm_gpiochip_add_data() to simplify remove path
>
> Andy Shevchenko (5):
>       gpio: merrifield: Use dev_err_probe()
>       gpio: merrifield: Utilise temporary variable for struct device
>       powerpc/40x: Add missing select OF_GPIO_MM_GPIOCHIP
>       gpio: mm-lantiq: Fix typo in the newly added header filename
>       gpiolib: acpi: Move ACPI device NULL check to acpi_get_driver_gpio_=
data()
>
> Arnd Bergmann (1):
>       mips: ar7: include linux/gpio/driver.h
>
> Benjamin Tissoires (1):
>       gpiolib: acpi: use the fwnode in acpi_gpiochip_find()
>
> Geert Uytterhoeven (1):
>       sh: mach-x3proto: Add missing #include <linux/gpio/driver.h>
>
> Pandith N (3):
>       gpio: tangier: Introduce Intel Tangier GPIO driver
>       gpio: merrifield: Adapt to Intel Tangier GPIO driver
>       gpio: elkhartlake: Introduce Intel Elkhart Lake PSE GPIO
>
> Werner Sembach (1):
>       gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xNU
>
>  MAINTAINERS                         |   2 +
>  arch/mips/ar7/gpio.c                |   2 +-
>  arch/powerpc/platforms/40x/Kconfig  |   1 +
>  arch/sh/boards/mach-x3proto/setup.c |   2 +-
>  drivers/gpio/Kconfig                |  24 +-
>  drivers/gpio/Makefile               |   2 +
>  drivers/gpio/gpio-elkhartlake.c     |  90 ++++++
>  drivers/gpio/gpio-ich.c             |  10 +-
>  drivers/gpio/gpio-merrifield.c      | 453 +++---------------------------
>  drivers/gpio/gpio-mm-lantiq.c       |   2 +-
>  drivers/gpio/gpio-tangier.c         | 536 ++++++++++++++++++++++++++++++=
++++++
>  drivers/gpio/gpio-tangier.h         | 117 ++++++++
>  drivers/gpio/gpiolib-acpi.c         |  26 +-
>  13 files changed, 825 insertions(+), 442 deletions(-)
>  create mode 100644 drivers/gpio/gpio-elkhartlake.c
>  create mode 100644 drivers/gpio/gpio-tangier.c
>  create mode 100644 drivers/gpio/gpio-tangier.h
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart
