Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A70DA190086
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 22:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgCWVjc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 17:39:32 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43473 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgCWVjb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 17:39:31 -0400
Received: by mail-pl1-f196.google.com with SMTP id v23so2439212ply.10;
        Mon, 23 Mar 2020 14:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=04AmBWPf9NtQxOjfM+5Ojeo1U97cyh/LV2bI/QaVGJA=;
        b=aaZSZZpEJr+iIdXt6bJX5IDtQ38srLcbGLjthpjyPYDxmh23Dbc2gxk8CQQRpa7T4N
         QW8f33e4TDN0W0KUt1qHl7Ia04nxO/5dYw5onnEjyM5kSVaG4CtILUl2fp+qhs1VURBx
         AAyn6rn8dPabWH9lV69kF3dcxxcjmdbXhf0cP3zYeATV4Znug/+eJUDo7zBbBEFnqTdC
         7ECXolzDnEIhBXirUJ+kW9sTlCMfOmyoI0XD3hEGb/qGwHzT9XeGNJMwonNiIwWxkXoD
         oyl5hmromt8w4CwhHxg2yhMidEP3qffH+jmVh9h1tRunm0tzSZhpl7oExj0kJ5Ixmfv8
         uw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=04AmBWPf9NtQxOjfM+5Ojeo1U97cyh/LV2bI/QaVGJA=;
        b=r4QkGTS/VieWC+KZt3w0/3AVzLHAhqU6oe4ZrynG2tZtsoM+XEVw0etv+UFLYfhMbG
         rD5YgKVa9nLj6VEdGXj38/t2PG2D/p72D1zlNEE8Q1Pm9P/1eo8k1S9Z2kF4Cl6m6Ojr
         H/7m7TnCS2Clbuk2jox4cIR2l+qfgGdDMJXh8N01JC3tk68KtRLYmns2HZucL0y80a+3
         HU9s2//qyfEqQQsKPdoID8Vm675yCuQjvQ51k2YGPghzPLM8kGRAYKx7wkcs4RwWR4hW
         UBfZOtTJ2j8Qp7TzEUjQVbYdFvKFCOKecTJ2PZ/eeIbyiZcR9Ef8h/8ymV4tbTkjoOAY
         X76w==
X-Gm-Message-State: ANhLgQ3J7txk9UXBa82tJ6SH6qSCbQZvz+Cvuu1ZKwcJP9aRt1hbRtl9
        PkERAVFTA65LCaVKVJcpvD7+UZNCNNUOQvw/CTo=
X-Google-Smtp-Source: ADFU+vtJy+9WqkH4HzXIDlclgIfiK87PAWKt5CqsyDCM8B67mVkCQIwUaLHq9/9TwGptJlL5gqqSC4m0ckXd7nEXtH8=
X-Received: by 2002:a17:90a:3602:: with SMTP id s2mr1468035pjb.143.1584999569682;
 Mon, 23 Mar 2020 14:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru> <20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 23 Mar 2020 23:39:18 +0200
Message-ID: <CAHp75VdNJ3omj3fqwfbgE4DLeLqpkVA=1AXv-mDXv2z3TKDHeQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] gpio: dwapb: Fix reference clocks usage
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 23, 2020 at 9:55 PM <Sergey.Semin@baikalelectronics.ru> wrote:
>
> From: Serge Semin <fancer.lancer@gmail.com>
>
> There is no need in any fixes to have the Baikal-T1 SoC DW GPIO controllers
> supported by the kernel DW APB GPIO driver. It works for them just fine with
> no modifications. But still there is a room for optimizations there.
>
> First of all as it tends to be traditional for all Baikal-T1 SoC related
> patchset we replaced the legacy plain text-based dt-binding file with
> yaml-based one. Baikal-T1 DW GPIO port A supports a debounce functionality,
> but in order to use it the corresponding reference clock must be enabled.
> We added support of that clock in the driver and made sure the dt-bindings
> had its declaration. In addition seeing both APB and debounce reference
> clocks are optional, we replaced the standard devm_clk_get() usage with
> the function of optional clocks acquisition.
>
> This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
> commit 98d54f81e36b ("Linux 5.6-rc4").

Thank you!
FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Changelog v2:
> - Use a shorter summary describing the DT bindings conversion patch.
> - Add myself to the MAINTAINERS file as a maintainer of the DW APB GPIO driver.
> - Add myself to the maintainers list of the DW APB GPIO driver DT schema.
> - Print error instead of info-message if APB/debounce clocks either
>   failed to be acquired or couldn't be enabled.
> - Rearrange the SoB tags.
> - Make sure DT schema defines the lowercase hex numbers in the main dt-node
>   name and in the sub-node names.
> - Use "allOf:" statement to apply uint32 and "minimum/maximum" limitations
>   on the "snps,nr-gpios" property of the DW APB GPIO DT schema.
> - Discard "interrupts-extended" property from the DT schema.
> - Make sure the sub-nodes have names with either 'gpio-port' or
>   'gpio-controller' prefixes.
> - Our corporate email server doesn't change Message-Id anymore, so the patchset
>   is resubmitted being in the cover-letter-threaded format.
>
> Changelog v3:
> - Replace S: with M: section entry in the MAINTAINERS file.
> - Cc Andy to all patches he isn't added by the auto "cc-cmd" command.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Hoan Tran <hoan@os.amperecomputing.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
> Cc: linux-gpio@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> Serge Semin (6):
>   dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema
>   dt-bindings: gpio: Add DW GPIO debounce clock property
>   dt-bindings: gpio: Add Sergey Semin to DW APB GPIO driver maintainers
>   gpio: dwapb: Use optional-clocks interface for APB ref-clock
>   gpio: dwapb: Add debounce reference clock support
>   MAINTAINERS: Add Segey Semin to maintainers of DW APB GPIO driver
>
>  .../bindings/gpio/snps,dw-apb-gpio.yaml       | 134 ++++++++++++++++++
>  .../bindings/gpio/snps-dwapb-gpio.txt         |  65 ---------
>  MAINTAINERS                                   |   1 +
>  drivers/gpio/gpio-dwapb.c                     |  41 ++++--
>  4 files changed, 161 insertions(+), 80 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
