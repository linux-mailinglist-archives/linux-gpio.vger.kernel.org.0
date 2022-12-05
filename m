Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1753E6426AE
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 11:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbiLEK2y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 05:28:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbiLEK2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 05:28:34 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6813A6261
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 02:27:57 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id m4so10609829vsc.6
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 02:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tLCjlwR3VfkDLVURPX+flcQkPdUBJ/HXoet0oMFE46Y=;
        b=kN+Se2QaxHMQKaynWU8rvtfNgj864IwetE4A9wlfOtew6s51SnxsSh+IZaNchP+BFF
         MnKu2oJ/STdRNuJhnOWCMyZsH9r0zUBMALeh7mkkVe/drbUKHgcoivu90jhYKo75pPaP
         tJvo5Cb8kY3BnE+hGB/hq+Kmzh7sSdFQemEsGJZ5JufdPpDZwvuBC5rszEKeqqmU2WEn
         fsesh49bxO63D/h37H/MIic/Om27mmRYH3KVk0GPLKmxFLHlQkIfklBrhvxtm/Jcs1Nk
         gh8DJQKSwC3tenJBpxhKkq4/px79Y9+bj6IPfXmqxGYDsgjA55F3hou2M6vOqIOVqopk
         NWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLCjlwR3VfkDLVURPX+flcQkPdUBJ/HXoet0oMFE46Y=;
        b=nAmDaooKAwlLC/KBpIymMj9wd1Q0X8aY3riSQg43/rbzZksmGBKVbOmmsr/i5wi1LO
         KDEJ7tNmQmVLTEz6Ge48LYhPrhaVeDSyC1wKoKaGqSVjb5hiDoWmRIl1rXkvmIm0L48v
         fiu+AoKhdM5WhqK7MYFR1NXEZs5rxKwzgr1hwQ375p+AES0OY7JK03/ZtwhIP2IvwMiD
         EmtWWtj0JvsLT16QtvDitalGL/XNEjqpFgJKOkLZOlPyT6jBiHFKrA76ADQt/OKMwKfp
         cP+ZZjAqsM7sQ5Q155wKggiFCLaMMfVRGI8zzFaUIH93N1y3WFU8X4de6v7FMYIncwz0
         4yJw==
X-Gm-Message-State: ANoB5pm6nopo0jVQHp5CMagQAhY9HxIwk/e6sBbyU1J1Ybyg4rDZNL9Y
        CG8obqAjWiSjz0Ju2sId7Ue5KlCBkCGcv0tXmUshHA==
X-Google-Smtp-Source: AA0mqf65ZWsoBzC/wTNewDzmHVUcfyjtFWiHW/bGFYs1j8eBk2jE0GzKWYbO4oQwsf3wU+L/+M1+UfA08mHkYKZPGGY=
X-Received: by 2002:a67:ca86:0:b0:3b1:33bd:7fc7 with SMTP id
 a6-20020a67ca86000000b003b133bd7fc7mr3111899vsl.13.1670236076423; Mon, 05 Dec
 2022 02:27:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669996866.git.william.gray@linaro.org>
In-Reply-To: <cover.1669996866.git.william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 5 Dec 2022 11:27:45 +0100
Message-ID: <CAMRc=McHd2MX2cvDC95d8nHsp2eJf5eMnXS=++xqSWL3962i2w@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Migrate i8255 GPIO drivers to regmap API
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     linus.walleij@linaro.org, andriy.shevchenko@linux.intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        michael@walle.cc, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 2, 2022 at 5:27 PM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> Changes in v4:
>  - Align trailing '\' characters in macros to same column in 104-dio-48e
>    and 104-idi-48
>  - Remove superfluous trailing commas in macros in 104-dio-48e and
>    104-idi-48
>  - Simplify dio48e_handle_mask_sync() regmap_* calls error checks to
>    return error codes directly
>  - Refactor dio48e_irq_init_hw() for regmap and comment about spurious
>    interrupts; in theory this should be enough to prevent spurious
>    interrupts before the system is ready, but we can pass this function
>    as a callback where needed in the future
>  - Cleanup '{0}' as '{}' in probe() callbacks for 104-dio-48e,
>    104-idi-48, and gpio-mm
>  - Utilize dev_err_probe() in probe() callbacks for 104-dio-48e and
>    104-idi-48
>  - Provide convenience comments for idi48_regmap_irqs initialization
>    list
>  - Replace header includes with forward declarations in gpio-i8255.h
>
> The regmap API supports IO port accessors so we can take advantage of
> regmap abstractions rather than handling access to the device registers
> directly in the driver. The 104-dio-48e and gpio-mm modules depend on
> the i8255 library and are thus updated accordingly.
>
> The 104-IDI-48 is hardwired as an input-only device. Because the i8255
> control registers are not exposed on the 104-IDI-48, the i8255 library
> doesn't provide much benefit here. In this case it's simpler to utilize
> the gpio_regmap API directly, so this patch series does such and removes
> the i8255 library dependency from the 104-idi-48 module.
>
> The first patch in this series adjusts gpio_regmap to always set
> gpio_chip get_direction. This patch is mostly independent of the rest of
> the patches in the series and can be picked up separately if desired.
> I'm including it here because it allows the input-only 104-idi-48 driver
> to continue reporting offset directions after migrating to gpio_regmap.
>
> A handle_mask_sync() callback is introduced for the regmap_irq API. This
> is used by the 104-dio-48e driver to handle its enable/disable interrupt
> functionality. The 104-DIO-48E has a single register to handle
> enabling/disabling interrupts: a write of any value to this register
> enables interrupts, while any read disables interrupts.
>
> By leveraging the gpio_regmap API, the i8255 library is reduced to
> simply a devm_i8255_regmap_register() function, a configuration
> structure struct i8255_regmap_config, and a helper macro
> i8255_volatile_regmap_range() provided to simplify volatile PPI register
> hinting for the regmap.
>
> The regmap_irq API is leveraged by the 104-idi-48 and 104-dio-48e
> modules to support their IRQ functionality. Do their respective regmap
> configurations need use_hwlock set to true in this case, or is adequate
> locking already handled by the regmap_irq API?
>
> William Breathitt Gray (9):
>   gpio: regmap: Always set gpio_chip get_direction
>   regmap-irq: Add handle_mask_sync() callback
>   gpio: 104-dio-48e: Migrate to the regmap-irq API
>   gpio: 104-idi-48: Migrate to the regmap-irq API
>   gpio: 104-idi-48: Migrate to gpio-regmap API
>   gpio: i8255: Migrate to gpio-regmap API
>   gpio: 104-dio-48e: Migrate to regmap API
>   gpio: gpio-mm: Migrate to regmap API
>   gpio: i8255: Remove unused legacy interface
>
>  drivers/base/regmap/regmap-irq.c |  44 +++-
>  drivers/gpio/Kconfig             |   5 +-
>  drivers/gpio/gpio-104-dio-48e.c  | 391 ++++++++++---------------------
>  drivers/gpio/gpio-104-idi-48.c   | 336 +++++++++-----------------
>  drivers/gpio/gpio-gpio-mm.c      | 154 +++---------
>  drivers/gpio/gpio-i8255.c        | 320 +++++++------------------
>  drivers/gpio/gpio-i8255.h        |  54 ++---
>  drivers/gpio/gpio-regmap.c       |   7 +-
>  include/linux/regmap.h           |   5 +
>  9 files changed, 416 insertions(+), 900 deletions(-)
>
>
> base-commit: 3b7c7478eda00945987d45f902bc3942c89243d3
> --
> 2.38.1
>

It's pretty late in the release cycle and this touches several
existing drivers so I will not take it for v6.2. Please rebase and
resend once v6.3-rc1 is out.

Bart
