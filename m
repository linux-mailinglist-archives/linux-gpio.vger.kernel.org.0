Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF56C3B8C56
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 04:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238843AbhGAC2J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 22:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238721AbhGAC1z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jun 2021 22:27:55 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD96C061230;
        Wed, 30 Jun 2021 19:25:25 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id m9so8381358ybo.5;
        Wed, 30 Jun 2021 19:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EZ5joYeT1vWGOdC639vm4xzdrB9GYQUWOsxh2Cw62fs=;
        b=BkB0e4A4lqcB9HHNA2CIuOXjjNW9v8VDOmenRqaJ781r8n/0x+dsT0IBYHzX3rQweN
         BISCfVoYeGNeT0Y/7Amc1ZmdM13+MLVVny00hy8YUXVvf7njRGBYJeIlS3kJebNG9/DS
         dQLrtToWKbw0tikxx+0n9EZ3a5ePESjLiPPUsKLTpObgT+t/+C3uqepOCYfSdJ8ZI8a6
         Zg3jWh+72spwkqxwgS6IfiYRiuvY1A2Lf0u/xNrvu60BnWfuxylNrUvAuvmyDhfl7wYT
         A611/g308s2p7vtfQG+FOLghXJzgMTSg4u/pl5ZSvR/F4aoKqIsFQP7yAopDZOrHbZm9
         E9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EZ5joYeT1vWGOdC639vm4xzdrB9GYQUWOsxh2Cw62fs=;
        b=ZN3uIDrm8AQkxV1xAzfYMiDwiYK9lFiJKYFY9gQF35CmCK1Fnj5O++lFrEU6q8TnE+
         cuw63nzHNEOYEvOx6WhVBxsaK5nQKyKTuN8aBMCTqR7A4N4zdfg0GtYxR31au17AcsEa
         jVvMFb9uHmFu5CdAHvXmpz+fa0XED7YjZYvcx5x14hZ80uoI0JK7wxyYvLCo+r4ntTqc
         jVGtfiqnA8LpWh3W0zmJ81j3XBZ/AG85pGslS11cIhAf4E8YFIQfFS5ntcnas/PrYHTR
         0TIi1pKsFcYPuikKb8sqM2+lbCGBvQT7ADLAtiySJZzn8za+OdmBu1GB8btdW6tWfmLf
         9qpg==
X-Gm-Message-State: AOAM5335YnvXbcU8ESEuQuUmnmMJC8KVXa32xF0rMxB2DxMvzrqjWfkS
        HT2HgS6E+nw4aeIL5lu6HfCHY7pv+5hdo7Mx9co=
X-Google-Smtp-Source: ABdhPJxpBls7pzAWN/Mwft/OqHg/7WX7iWrNpIvnEjCOGwEJubVbMovb1/Y4YrI++b13jH9vqJQvtaCGu7A4SMdBtkQ=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr50224689ybc.122.1625106324052;
 Wed, 30 Jun 2021 19:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org> <20210701002037.912625-3-drew@beagleboard.org>
In-Reply-To: <20210701002037.912625-3-drew@beagleboard.org>
From:   Bin Meng <bmeng.cn@gmail.com>
Date:   Thu, 1 Jul 2021 10:25:12 +0800
Message-ID: <CAEUhbmXuxSePo22y_keGsqPWyCSAoUdTQPqCRJmYXS7rT4DhZA@mail.gmail.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO driver
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 1, 2021 at 8:23 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> BeagleV Starlight JH7100 board [2].
>
> [1] https://github.com/starfive-tech/beaglev_doc/
> [2] https://github.com/beagleboard/beaglev-starlight
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  MAINTAINERS                         |   8 +
>  drivers/gpio/Kconfig                |   8 +
>  drivers/gpio/Makefile               |   1 +
>  drivers/gpio/gpio-starfive-jh7100.c | 425 ++++++++++++++++++++++++++++
>  4 files changed, 442 insertions(+)
>  create mode 100644 drivers/gpio/gpio-starfive-jh7100.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc0ceef87b73..04fccc2ceffa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17423,6 +17423,14 @@ S:     Supported
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>  F:     drivers/staging/
>
> +SIFVE JH7100 SOC GPIO DRIVER

typo of SIFIVE, but it should be STARFIVE

> +M:     Drew Fustini <drew@beagleboard.org>
> +M:     Huan Feng <huan.feng@starfivetech.com>
> +L:     linux-riscv@lists.infradead.org
> +L:     linux-gpio@vger.kernel.org
> +F:     Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> +F:     drivers/gpio/gpio-starfive-jh7100.c
> +

[snip]

Regards,
Bin
