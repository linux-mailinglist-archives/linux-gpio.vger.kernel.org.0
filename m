Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162AB42B86D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 09:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238276AbhJMHIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 03:08:05 -0400
Received: from mail-vk1-f178.google.com ([209.85.221.178]:46739 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238262AbhJMHIC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 03:08:02 -0400
Received: by mail-vk1-f178.google.com with SMTP id 34so1353179vkl.13;
        Wed, 13 Oct 2021 00:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Le9QZPuNWHanoI4mM43dOJuIkLPwVhdbuEPDJXqaV0=;
        b=5VOaAt/NSN1eUax8xeQLpyMsKGYwoyl+rpRRfELyh9Hm/5QCYrOx2n7vCUCZoYSLqF
         eu5rsY2C7vZHkt3PuPcisDgagXNpjzsHHMgw0TO704zanYVWCFt0R+eGE+3bbwsjmGqm
         V1pBflPLe9aCih/NbSuerQmDOJGi3cCBsdcWQBYvtp1JcyIJJHLm+RYWFL0MkLnB0ZKH
         UEXV/KfR0WUHBU35DqT6W0NcUuuaTZgJbgYmsVguJQLBKUVEjA3hWBtsAlwP1PZrW6YT
         Ezd15snf1AHnk9+pXC+SU4/JsdxC6jQenv2pQlVpI7JftEc3q1RiC/sP+xhPZzrJ1FTP
         KiaA==
X-Gm-Message-State: AOAM533JeL0yTY4zchY45C6xyoLRwElFnwUiDn0QydQPnHM+dhVg/Q1P
        LIgs4x/QfUe1v++9/GF7dvfTUdydcPnbqk59IIw=
X-Google-Smtp-Source: ABdhPJwEa5NDkP57MCTKn5kzUR3aq+JEVBowsC/GEnWHnA8M9YW2ZrsM+SdOBCcoc14Elp0mTni+XsamiZ/lrTJkGX0=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr31719119vka.19.1634108759159;
 Wed, 13 Oct 2021 00:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-4-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-4-kernel@esmil.dk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 09:05:48 +0200
Message-ID: <CAMuHMdVA5h_Z27uo=czbQLatCe6-zOoBQGEeuooW2ExMHzGbmw@mail.gmail.com>
Subject: Re: [PATCH v1 03/16] dt-bindings: interrupt-controller: Add StarFive
 JH7100 plic
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
> Add compatible string for StarFive JH7100 plic.
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
