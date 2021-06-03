Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 997F2399F89
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 13:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhFCLKi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 07:10:38 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:43597 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhFCLKh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 07:10:37 -0400
Received: by mail-pl1-f176.google.com with SMTP id v12so2679463plo.10;
        Thu, 03 Jun 2021 04:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wDo2z8iTAiJqBqvWvLB96Okm4phCuyBKqAvyvxyTJXs=;
        b=P78APJKcMH6oqL0fsJYDyeLXqod4sHzF3NXsn6tkC3NkBYbPumu8oRRPGT/fPb1HtZ
         UmaBhblYD4nltFb4LfHSbYjyeyRq1q+Xng3DOD5LCgR6V+7j7JfVMVnTO18hvNonTGAh
         nCB/Zk0yrCgyJlh9b6R39j8OT0/a53Lhanzzmvg5zyfHTnDax/5ap2oyt7s8WZ2Fdtsx
         vy6+WrmcmYqO+6/fcHjFDZsykRNKYqfV+dcheF40g7wGoRKkln9VKOvRpJV+xDXDJPOC
         QtohdoP4CivTDGn77Ix3q/Mdf1NSq+U0Q98iUBwG7EYtzwONK52ax/CLcWtkR7gWBfSg
         dTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wDo2z8iTAiJqBqvWvLB96Okm4phCuyBKqAvyvxyTJXs=;
        b=eV9FzO7C/LiXgmjqjoSW9qro4T36Y0qYfAwUOFZc+SePCOxsyvRXStGPuXQDAbE8J3
         Na84+fwju9daLvw2SViPUnTMD48XawuiyxUaENiKK5lrcdRRfjNz7uKifh4iUMiP0eLS
         2HlA5hWCyyTcsymWVK6m0mfUeJl9/J8Jr/sZgF65t4FQ7s0fp2M3lAkZ7285hHb4IZOQ
         qa0KqedqvBnS3Xw6qprrg69NGzXI2DhN7ylv4nGWcJn3AYdF9hgrk1ShEytjMrl49Krk
         Ft74vvbwYe41L/n15zGzAeaCVxJZ4/UTopK4KCUCMiX80YCw0xzp3hGUDqyrlKU3EcFG
         HvMw==
X-Gm-Message-State: AOAM533n9kZclDO7z4bAM3j8/JDqSL5kqmnP1UOJpDIhcYzYGf10T19/
        1fb2RURXcUYj6JJ+Ki+S/bb5GtIesWX38be73qk=
X-Google-Smtp-Source: ABdhPJyCs+wp9GQAeR/SyNmg8FNfUVK6o5CEsq9kbEkhUdzsvyuzZtCKxNpGLiUoC4lv9/PO9J5wxEFTLOwFP4TIkL0=
X-Received: by 2002:a17:90a:af8b:: with SMTP id w11mr36016810pjq.228.1622718464302;
 Thu, 03 Jun 2021 04:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210603101822.9645-1-steven_lee@aspeedtech.com> <20210603101822.9645-5-steven_lee@aspeedtech.com>
In-Reply-To: <20210603101822.9645-5-steven_lee@aspeedtech.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Jun 2021 14:07:28 +0300
Message-ID: <CAHp75VcPdUeK49w9qg9RuJY7ASMyFMEEi=cX1gnp=wM_QHDZ+w@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpio: gpio-aspeed-sgpio: Add set_config function
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>, Hongweiz@ami.com,
        ryan_chen@aspeedtech.com, Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 3, 2021 at 1:20 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> AST SoC supports *retain pin state* function when wdt reset.
> The patch adds set_config function for handling sgpio reset tolerance
> register.

...

> +static int aspeed_sgpio_set_config(struct gpio_chip *chip, unsigned int offset,
> +                                  unsigned long config)
> +{
> +       unsigned long param = pinconf_to_config_param(config);
> +       u32 arg = pinconf_to_config_argument(config);
> +
> +       if (param == PIN_CONFIG_PERSIST_STATE)
> +               return aspeed_sgpio_reset_tolerance(chip, offset, arg);

> +       else

Redundant.

> +               return -EOPNOTSUPP;

IIRC we are using ENOTSUPP internally in the kernel. YEs, checkpatch
warning may be ignored.

> +}

-- 
With Best Regards,
Andy Shevchenko
