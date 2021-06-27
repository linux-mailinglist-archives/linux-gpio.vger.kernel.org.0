Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC9D3B5355
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 15:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhF0NKy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 09:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhF0NKx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 09:10:53 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04602C061574;
        Sun, 27 Jun 2021 06:08:30 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 21so11737605pfp.3;
        Sun, 27 Jun 2021 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LG15p152Q19/jYJAfgGWGQMbR7hlErO+795zyErlEJE=;
        b=TxIecD6mGQRB7Yd60ycSuNbG0gyheNRHb6rm01H/e0AmoWhaidVwFrBbXEPQ9z71MS
         1U8ebjec1eJemOIh0HM0Rjap9X27+o59/X2zcg3Yf65GrE4Dp6sIOrO+/FkmfkEfvo05
         Of0CT6c2Ba+F6A0zBRf34t1VlBbG+kN4ZOmG2bXDcOCrrKoyxscnTEzzdZ41FhnWRWaC
         YAV1oaCQSpFE8yx2E3ij9dSpyd2LpuGQ0R2tmrIvb6tlSovZDsbtJL1kQNIbWyCCyZud
         1f7aHB4ya9A6iNA6tgGsJQjwtNvyGwHGGVQbIGXF/kPBOFWlYfsFAzxl9tcqUvhK8852
         Cdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LG15p152Q19/jYJAfgGWGQMbR7hlErO+795zyErlEJE=;
        b=BMDTZPWPzWrPIlegZruILelQFKWN0XYx5MWQGTtTl0/juaWtXQ7JOqXdDJPtJH0TMZ
         QWet6PYSH9dE0SN6IlllnnCS8WZFaFXq8L6Ntzj1Yt+4gdjd5naB1w6+1J1eF1+2R3TN
         K2+obwkIp5z2GEi/SGm4hcuIbi7S+iVmb3E/GTo8IZ9Tekj87steHaZJpjLha88KUVPw
         rksNG+x4s5sLuavuf8MSPMk3SVBhzeQ2JzYt0k3T7uwUuarG+4oBLzEkAkSCWf3ojeLr
         wRv43KYj/qtTNlV/CMdriVN21EyDckJl3Nv6pHuSZHA2o261v2gfVcMdIUuUI9UH1OUf
         6qsw==
X-Gm-Message-State: AOAM532H6E/+uzSe4OJ9LStjtDtEj6evAlEQ3xmmlcxY70PjxQMY3uvE
        EIMbGbhnb5W9TFkJ7yCoUjHEgWCTUru6vQuKpww=
X-Google-Smtp-Source: ABdhPJzeLc1jfR3GrTLHRCQL/6SjO7PG5HBb/f/MC9Iu7DTZSP8+GbNVqlVDpTW8VsxXXYGS7baGIrS3UBRc6QdNZ+c=
X-Received: by 2002:aa7:8055:0:b029:303:36a6:fec7 with SMTP id
 y21-20020aa780550000b029030336a6fec7mr20400150pfm.40.1624799308940; Sun, 27
 Jun 2021 06:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com>
In-Reply-To: <20210625235532.19575-1-dipenp@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 27 Jun 2021 16:07:52 +0300
Message-ID: <CAHp75Vf4TKjtC7cLNape4r+hE-AWnbxtbww2ofCcHQJf9zyh-g@mail.gmail.com>
Subject: Re: [RFC 00/11] Intro to Hardware timestamping engine
To:     Dipen Patel <dipenp@nvidia.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 26, 2021 at 2:48 AM Dipen Patel <dipenp@nvidia.com> wrote:
>
> This patch series introduces new subsystem called hardware timestamping
> engine (HTE). It offers functionality such as timestamping through hardware
> means in realtime. The HTE subsystem centralizes HTE provider and consumers
> where providers can register themselves with subsystem and the consumers can
> request interested entity which could be lines, GPIO, signals or buses. The
> HTE subsystem provides timestamp in nano seconds, having said that the provider
> need to convert the timestamp if its not in that unit. There was upstream
> discussion about the same at
> https://lore.kernel.org/lkml/4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com/
>
> To summarize upstream discussion:
> - It was heavily favoured by Linus and Kent to extend GPIOLIB and supporting
> GPIO drivers to add HTE functionality and I agreed to experiment with it.

I guess this series should include more people from different
companies, especially documentation parts. This may be used by
different hardware and quite different vendors. Developing a framework
like this for only one vendor is no go in general.

> This patch series implements and extends GPIOLIB and GPIO tegra driver.
> - Discussed possibility to add HTE provider as irqchip instead which
> was argued against as HTE devices are not necessarily event emitting
> devices.
> - Discussed other possibility if HTE device can be added as posix clock
> type like PTP clocks. That was also argues against since HTE devices
> are not necessarily tightly coupled with hardware clock.
>
> Typical HTE provider does following:
> - Register itself with HTE subsystem
> - Provide *request, *release, *enable, *disable timestamp callbacks and
> optional get_clk_src_info callback to HTE subsystem.
> - Provide optional xlate callback to the subsystem which can translate
> consumer provided logical ids into actual ids of the entity, where entity here
> is the provider dependent and could be GPIO, in chip lines or signals, buses
> etc...This converted id will be used between HTE subsystem and the provider for
> below bullet point.
> - Push timestamps to the subsystem. This happens when HTE provider has
> timestamp data available and willing to push it to HTE subsystem. The HTE
> subsystem stores it into software buffer for the consumers.
> - Unregister itself
>
> Typical HTE consumer does following:
> - Request interested entity it wishes to timestamp in realtime to the
> subsystem. During this call HTE subsystem allocates software buffer to
> store timestamps data.
> - The subsystem does necessary communications with the provider to
> complete the request, which includes translating logical id of the entity to
> provider dependent physical/actual id and enabling hardware timestamping on
> requested id.
> - It can optionally specify callback during registration, this cb will
> be called when provider pushes timestamps. Once notified through cb, the
> consumer can call retrieve API to read the data from the software buffer.
> If cb is not provided, the consumers can elect to call blocking version of
> retrieve API.
> - Manage pre allocated software buffer if needed. It includes changing buffer
> length and watermark/threshold. The subsystem automatically sets watermark or
> threshold at 1, consumers can later change it to any other value it wishes. The
> main purpose for having threshold functionality is to notify consumer either
> through callback if provided or unblock waiting consumer when threshold is
> reached.
> - Retrieve timestamp using various means provided by subsystem.
> - Release entity and its resources.
>
> HTE and GPIOLIB:
> - For the HTE provider which can timestamp GPIO lines.
> - For the GPIO consumers, either in kernel or userspace, The GPIOLIB and its
> CDEV framework are extended as frontend to the HTE by introducing new APIs.
> - Tegra194 AON GPIO controller has HTE support also known as GTE
> (Generic Timestamping Engine). The tegra gpio driver is modified to accommodate
> HTE functionality.
>
> Dipen Patel (11):
>   Documentation: Add HTE subsystem guide
>   drivers: Add HTE subsystem
>   hte: Add tegra194 HTE kernel provider
>   dt-bindings: Add HTE bindings
>   hte: Add Tegra194 IRQ HTE test driver
>   gpiolib: Add HTE support
>   gpio: tegra186: Add HTE in gpio-tegra186 driver
>   gpiolib: cdev: Add hardware timestamp clock type
>   tools: gpio: Add new hardware clock type
>   hte: Add tegra GPIO HTE test driver
>   MAINTAINERS: Added HTE Subsystem
>
>  .../bindings/gpio/nvidia,tegra186-gpio.txt    |    7 +
>  .../devicetree/bindings/hte/hte-consumer.yaml |   47 +
>  .../devicetree/bindings/hte/hte.yaml          |   34 +
>  .../bindings/hte/nvidia,tegra194-hte.yaml     |   83 +
>  Documentation/hte/hte.rst                     |  198 +++
>  Documentation/hte/index.rst                   |   21 +
>  Documentation/hte/tegra194-hte.rst            |   65 +
>  Documentation/index.rst                       |    1 +
>  MAINTAINERS                                   |    8 +
>  drivers/Kconfig                               |    2 +
>  drivers/Makefile                              |    1 +
>  drivers/gpio/gpio-tegra186.c                  |   78 +
>  drivers/gpio/gpiolib-cdev.c                   |   65 +-
>  drivers/gpio/gpiolib.c                        |   92 ++
>  drivers/gpio/gpiolib.h                        |   11 +
>  drivers/hte/Kconfig                           |   49 +
>  drivers/hte/Makefile                          |    4 +
>  drivers/hte/hte-tegra194-gpio-test.c          |  255 +++
>  drivers/hte/hte-tegra194-irq-test.c           |  400 +++++
>  drivers/hte/hte-tegra194.c                    |  554 +++++++
>  drivers/hte/hte.c                             | 1368 +++++++++++++++++
>  include/linux/gpio/consumer.h                 |   21 +-
>  include/linux/gpio/driver.h                   |   13 +
>  include/linux/hte.h                           |  278 ++++
>  include/uapi/linux/gpio.h                     |    1 +
>  tools/gpio/gpio-event-mon.c                   |    6 +-
>  26 files changed, 3657 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
>  create mode 100644 Documentation/devicetree/bindings/hte/hte.yaml
>  create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
>  create mode 100644 Documentation/hte/hte.rst
>  create mode 100644 Documentation/hte/index.rst
>  create mode 100644 Documentation/hte/tegra194-hte.rst
>  create mode 100644 drivers/hte/Kconfig
>  create mode 100644 drivers/hte/Makefile
>  create mode 100644 drivers/hte/hte-tegra194-gpio-test.c
>  create mode 100644 drivers/hte/hte-tegra194-irq-test.c
>  create mode 100644 drivers/hte/hte-tegra194.c
>  create mode 100644 drivers/hte/hte.c
>  create mode 100644 include/linux/hte.h
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
