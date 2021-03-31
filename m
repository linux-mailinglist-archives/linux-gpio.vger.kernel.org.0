Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0BB34FABD
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 09:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbhCaHug (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 03:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbhCaHuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 03:50:05 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4B2C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 00:50:05 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id v107so15211655ybi.9
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hywtd1KIB/q90EXy+mvZhwXEbQdTlEqSmz3ryL7o6/w=;
        b=vLQk20z5dr0eE0dUMRUz4Ku9kps5ZE3mVkEdzWhOmSfoLowIfxFDi8qbPbmtUeQV/N
         y/97yULuDc6u/Vy6dZtwzkhDhQt5rboSukZltgFeXSIMvLfb/SouIFU7vj1+mQZp1Hcg
         rosVO1RTLbphO8Ar9bwjD7JKzNND4GiNasrCtQKX/dN+HC8fZ4Dri8QLBvazp0yVIOil
         JeEO/lRvQFrw7uLzcXRXzyAHl5Xisl4uScy+WykpQZFvCpyAYn6Y/3rRN7YGGkEA96jD
         AUJ9vmzrAf4dC+JiGrYqDp91ikoI21VeErWYtu2+8l4eP5RS5J8MVPEnW7V4VyDjopLE
         7DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hywtd1KIB/q90EXy+mvZhwXEbQdTlEqSmz3ryL7o6/w=;
        b=BHHq4HL3gSFGEuGGMPgtr82F1GwffK4FsrSnxKJQ1iroIKBUESJKswVoj2VSgcupRb
         QmZTS3LJoxWJheLKm5HQwgZWB/oMQ4dcAHhAfIk3a4fjVkqLNV3UW6Olduqv9vpnBMjZ
         faLB1OYymxZYt9QxUqf8a+SVK0Iqe9R+dUmPMygUfuYieYDwkGfrWyjCXBddRCNXHClT
         9o78D8f3uW9N4PoF6sGtFaZT2aa7FFHmiCTco2FCa0KUvOPm+K6ADy/cjyHWTq1K8fSC
         iFCz4WDI6z5aQaW5eYhUGcbZotXJ/NHwcFbPWzcQ3kXeuMP7ZyuSy4p4RnqM5V8++nc2
         a+zQ==
X-Gm-Message-State: AOAM5324nbtMdBKrR0RxfMrmL0ifbcm3tjenmhsVuWqAsuidupVqSlo1
        So7nJKrW+dw276NnyK46cZ2NGI+TYYrO5jrdYq2Y/Q==
X-Google-Smtp-Source: ABdhPJzhJOj2g9a8AD8NuPdcxlXMqoVSl3CnHu20LndCvla/SjiEhUVueYLcJnaZwR5u4jWyluvxqTnu4Z7QJEaHJBI=
X-Received: by 2002:a25:d2d3:: with SMTP id j202mr2883936ybg.157.1617177004878;
 Wed, 31 Mar 2021 00:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210315082339.9787-1-sander@svanheule.net> <cover.1617126277.git.sander@svanheule.net>
In-Reply-To: <cover.1617126277.git.sander@svanheule.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 09:49:54 +0200
Message-ID: <CAMpxmJWGuS_ae_cGsvWmhu3NBtsnK-ZutJeCphJSR=Xn7qKFMg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add Realtek Otto GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-devicetree <devicetree@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bert Vermeulen <bert@biot.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 7:48 PM Sander Vanheule <sander@svanheule.net> wrote:
>
> Add support for the GPIO controller employed by Realtek in multiple series of
> MIPS SoCs. These include the supported RTL838x and RTL839x. The register layout
> also matches the one found in the GPIO controller of other (Lexra-based) SoCs
> such as RTL8196E, RTL8197D, and RTL8197F.
>
> For the platform name 'otto', I am not aware of any official resources as to
> what hardware this specifically applies to. However, in all of the GPL archives
> we've received, from vendors using compatible SoCs in their design, the
> platform under the MIPS architecture is referred to by this name.
>
> The GPIO ports have been tested on a Zyxel GS1900-8 (RTL8380), and Zyxel
> GS1900-48 (RTL8393). Furthermore, the GPIO ports and interrupt controller have
> been tested on a Netgear GS110TPPv1 (RTL8381).
>
> Changes in v6:
> - Use devm_gpiochip_add_data()
> - Code style for reading ngpios, header order
> - Add Andy's Reviewed-by tag
>
> Changes in v5:
> - Edited code comments
> - Fold functions that were used only once or twice (ISR/IMR accessors)
> - Drop trivial functions for line to port/pin calculations
> - Use gpio_irq_chip->init_hw() to initialise IRQ registers
> - Invert GPIO_INTERRUPTS flag to GPIO_INTERRUPTS_DISABLED
> - Support building as module
> - Add Rob's Reviewed-by tag
>
> Changes in v4:
> - Fix pointer notation style
> - Drop unused read_u16_reg() function
> - Drop 'inline' specifier from functions
>
> Changes in v3:
> - Remove OF dependencies in driver probe
> - Don't accept IRQ_TYPE_NONE as a valid interrupt type
> - Remove (now unused) dev property from control structure
> - Use u8/u16 port registers, instead of raw u32 registers
> - Use 'line' name for gpiochip, 'port' and 'pin' names for hardware
> - Renamed DT bindings file
> - Dropped fallback-only DT compatible
> - Various code style clean-ups
>
> Changes in v2:
> - Clarify structure and usage of IMR registers
> - Added Linus' Reviewed-by tags
>
> Sander Vanheule (2):
>   dt-bindings: gpio: Binding for Realtek Otto GPIO
>   gpio: Add Realtek Otto GPIO support
>
>  .../bindings/gpio/realtek,otto-gpio.yaml      |  78 +++++
>  drivers/gpio/Kconfig                          |  13 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-realtek-otto.c              | 325 ++++++++++++++++++
>  4 files changed, 417 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
>  create mode 100644 drivers/gpio/gpio-realtek-otto.c
>
> --
> 2.30.2
>

Series applied, thanks!

Bartosz
