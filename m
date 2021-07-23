Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D213D41EB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 23:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbhGWUYV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 16:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbhGWUYV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 16:24:21 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20975C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 14:04:54 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a7so3210228ljq.11
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 14:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+du+0LHLfACLmN4y/oi02W5K+tfyhYdkNu9bdamCZoA=;
        b=PU8ExjLpqbQ7v0/Tet2GfCUlvlxrEFfeIpx99CC6Xk5+aELtn+8O2bULpwHlEZGAvn
         NnHZbXmI78vEHdBxHtZdyoo4dhMLlT2nPyNgRDVcWyxKJotHDsvBsAI/8Q/F8l4YOnBQ
         AyrT7aqeEglidsG7hJLMiRgyvgQ3JRMk5SYfTEVV7ThBCZJm5KFsOk5f+lvBLw0btP4d
         42l2xOo19oJRKfeJBplz2KKkTKwgw9DGVyLxFvfQXjpTCqIQwObnvEaazH8ZHwd4Oykv
         zukRN0buICPccVlmtRqHaOmhc4TWJsks2Iy/oXmqVOytYVEv4MmzD+t8N/9ISPqhEy9e
         2cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+du+0LHLfACLmN4y/oi02W5K+tfyhYdkNu9bdamCZoA=;
        b=pQnZfhAOp7Fe62Sn92Z5ydCrNS3j672bx9bCoqasF33JE+BrV3ZpucFe46QOGPQZJT
         3jsfHoVUO5+8EdILXK0KeUi0m1/sSxDHemkdKOxIiGsI3X7FW4sBB1FQ+EYMeRifJIOx
         MdNogM03uBu6mSCwQkkaRfYtVtc3SNSp4gGOv7UFNNEkagEp5pz6FmaQDuZ+BPjWPaQt
         5H7q6XnoATY7ukvh6uZZLGZkMqhOWNqshl6AtC3GtWPkPZjhmqykeQVxLhuLDyzvqnPi
         Wp4GhyMZQ9Wbzj3GlAV0EDwKih2del9WOS9nbABKQ4VM9Avt5AuvpWexqZBJbLtFXfTP
         JWiw==
X-Gm-Message-State: AOAM530ZbBMkRq3xSyI+t5gBeot9oRPpqyE4NxjTxQ8d2dv3Lv506yKL
        DMI+aMCHpLqoS/+oyzfNf9cDeuq2IWJYbJ06D/ZwSw==
X-Google-Smtp-Source: ABdhPJxQWYsOWFLVby006xkxrHiuFL3EnCGftMH8g5GForQjSavZnil4OEtYwmjZFYh8qrp4mdkJspxPgo3NmEIWfGc=
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr4501765lji.200.1627074292231;
 Fri, 23 Jul 2021 14:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org> <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
In-Reply-To: <8c59105d32a9936f8806501ecd20e044@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 23:04:41 +0200
Message-ID: <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO driver
To:     Michael Walle <michael@walle.cc>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 1, 2021 at 8:39 AM Michael Walle <michael@walle.cc> wrote:
> Am 2021-07-01 02:20, schrieb Drew Fustini:
> > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > BeagleV Starlight JH7100 board [2].
> >
> > [1] https://github.com/starfive-tech/beaglev_doc/
> > [2] https://github.com/beagleboard/beaglev-starlight
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
>
> Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
> drivers/gpio/gpio-sl28cpld.c for an example.

To me it looks just memory-mapped?

Good old gpio-mmio.c (select GPIO_GENERIC) should
suffice I think.

Drew please look at drivers/gpio/gpio-ftgpio010.c for an example
of GPIO_GENERIC calling bgpio_init() in probe().

Yours,
Linus Walleij
