Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35E942B868
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 09:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238236AbhJMHHh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 03:07:37 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:36507 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238254AbhJMHHf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 03:07:35 -0400
Received: by mail-ua1-f42.google.com with SMTP id g13so2580086uaj.3;
        Wed, 13 Oct 2021 00:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ODFUHeafSyfJJr/dZjG81Kg2CJUeDy3Vtm7EDZAJVcs=;
        b=og7nzTLHxkgANB4EI3vWMndMUoWnJePNBajfRt4/EcP2+qxvJZb7xsvMRvvgOwTbRn
         ndcNHMdBmrsbdtIMwUc6cs9z8iqHhdHvhcuz8rV4rh6YUJvmNnrFHVeVo+CTXYeTe020
         XSvEgFc02ZVJY8w2I4aFJg5ejL9WyYvZIhFj865qOq2Smh7Ywhpybnuir2TAEuAA/9rm
         x005ufa1S8p8pwt3JeBu6tFiwzPOzNczqmMQGbegIzIncwpfkJbtTyrIxFIHb5lM2PyE
         k9MlGZLZYYLUcUP+CylP5SYJeCRhv3zG1aUrVDcxbWdG9uVsG4YCHjjIw+uM7erlbzxh
         gf+A==
X-Gm-Message-State: AOAM531bSr84X3Cqs4njlSnzGyNZjZoXYcyqNA4kmVNRpidr5vMcU22r
        h1+kqz+8KQvD0urdGgXVdlU284+3h+YKlH12CMA=
X-Google-Smtp-Source: ABdhPJygs5LYNeOJqEM1k5UdNR0eKKutf4oKyYkCZ3Sv+78TmKiKttmATy8/qE8zE082U1qV2JXAhNEbNBitCJBQkF8=
X-Received: by 2002:a05:6102:290c:: with SMTP id cz12mr15636134vsb.35.1634108731922;
 Wed, 13 Oct 2021 00:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-3-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-3-kernel@esmil.dk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 09:05:20 +0200
Message-ID: <CAMuHMdW1YD2hJ+eSwHe8WLK1YJZ9pHYrESX3-M70au_3HCKfdA@mail.gmail.com>
Subject: Re: [PATCH v1 02/16] dt-bindings: timer: Add StarFive JH7100 clint
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 12, 2021 at 3:41 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> Add compatible string for the StarFive JH7100 clint.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
