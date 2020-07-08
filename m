Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598482182D9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgGHIvX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728106AbgGHIvX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:51:23 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0BFC08C5DC;
        Wed,  8 Jul 2020 01:51:23 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id o1so11330928plk.1;
        Wed, 08 Jul 2020 01:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=57iod+/AMmFtYWql7W5zrmBT/5Ux9h0gFYh2Kf9qnlQ=;
        b=Q5L3nt6ENaCJd8CkEfatiVZHbNEOLIM5kV0Drj6xugwzZD7ZEGkJSak71IoBxGp9ZL
         tV+1TPF3MEjp23QOF9afk0QV32eUMzZi5psZPGj3TCUhCs9AR6jYZZdNdHfKIHOf2lZC
         tuOFTeQ9GqnoKOkG/l8Orqa/JETRcMRAJEyk1R5xCeIsc+6KbfmS2mbb4uk8Be7YhJKq
         g4+nG+NJVt4jpm89sykmhS+juIpDtcq3KXySFY8bJIHx2a6FvwbH1iVLzOAzUY+kp8nP
         2Kf3rFXB4qaVZ4/oGhJTm102J4NwD/g5TOjdTQj6GZgQwuuEy+hn2K6XbrAhQ7j1v7ls
         teUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57iod+/AMmFtYWql7W5zrmBT/5Ux9h0gFYh2Kf9qnlQ=;
        b=nDmO0bhrNyKc/jJ8Z4G/O50jKOQRujUrg1NvcvHMZciTjytW177aIbPn2fGTfWEciE
         MM3JgBzrhtuz+yC4Hj5zfbMzmHc97Zs4Y39ubMUAj1XooqfTYZPRVi4ztzkzffZQ4wwj
         H8ruIIpXB7+oTVx+8fnUsODOsCYOc0/dRypHFiTVEawMJu8lLsnN38DWRML13ivi8O77
         BzyM3U8g4zZ24+RFCJ6CH8xBX82bJO1QeCDbqE4Qd5TE5EKXnrLYFhW6XKPgX2Vv6oxZ
         Te6hkc7L3mEN6VQrpaI4fJKA4YK7pGyG647FX9g+vKwfr6tyJbrbgAgoCn0qTzJk4zX3
         LCXg==
X-Gm-Message-State: AOAM530PsPoYoNPdHKwjJArLCnS0GrvZSfakF4U45ZdeURild1cTrSon
        jOMMCXrGCpK83vYxGY6SdXIUbN8/72Kk62Zn8Hc=
X-Google-Smtp-Source: ABdhPJyOvpX8n0+Rm6pmPdMqeAC+bPPUIOfhW7TkYsg5uvNSGaiT7Bq8YxNMMJLDvRsGukaIV7gSTocjummqC9hrosc=
X-Received: by 2002:a17:902:8491:: with SMTP id c17mr40923683plo.262.1594198282725;
 Wed, 08 Jul 2020 01:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-2-digetx@gmail.com>
In-Reply-To: <20200708082634.30191-2-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jul 2020 11:51:06 +0300
Message-ID: <CAHp75VdFVGgKxR+n5TUMuFnWDy_uEmEeG=TvR9s7Xbe=jOdObg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] gpio: max77620: Initialize interrupts state
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> I noticed on Nexus 7 that after rebooting from downstream kernel to
> upstream, the GPIO interrupt is triggering non-stop despite of interrupts
> being disabled for all of GPIOs. This happens because Nexus 7 uses a
> soft-reboot, meaning that bootloader should take care of resetting
> hardware, but bootloader doesn't do it well. In a result, GPIO interrupt
> may be left ON at a boot time. Let's mask all GPIO interrupts at the
> driver's probe time in order to resolve the issue.

...

> +               err = regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(i),
> +                                        MAX77620_CNFG_GPIO_INT_MASK, 0);
> +               if (err < 0)

Does ' < 0' meaningful here?

> +                       dev_err(mgpio->dev, "failed to disable interrupt: %d\n",
> +                               err);

One line.

...

> +       max77620_gpio_initialize(mgpio);

I guess we have special callback for that, i.e.
https://elixir.bootlin.com/linux/v5.8-rc3/C/ident/init_hw.


-- 
With Best Regards,
Andy Shevchenko
