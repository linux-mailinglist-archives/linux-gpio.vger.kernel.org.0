Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D770B437834
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 15:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhJVNn5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 09:43:57 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:37656 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhJVNn5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 09:43:57 -0400
Received: by mail-pg1-f169.google.com with SMTP id s136so3362085pgs.4;
        Fri, 22 Oct 2021 06:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+jUS6xI/DPxP6ZrnElaJwUrZ90DL/yMXbpKtqC1M5U=;
        b=ePWHyTMkORA7tnc6JaFty0BLUcKjaPliYWF6AJ5IURM5Q+xuHcL6j9LYabDYaR8Crw
         QJi6kmT0ydtT4LTOQe5H438PjR4ODwlGWgnCp2PVZWnkSrJiYeiBfpHRZxFwebP0FLCZ
         ney9hnHW2aMUsgiIHeD2hPgGA14wRMYSwyh1mSSZXotLTxZ8uJNU/4oL+cVStKgYi/tf
         izgqw9Ie+//H6gC8p8hbyBHJes3xo1ahKz0IdjOj4uKJXxdkGH/xB4xG1cenZj0sYs4i
         gYjgC5x4UC0Lbqm7ABer2lSOfyPGzMc1x8iGERL2tQo+0gWIqJ4RCyPWYJ397C9K/xnH
         kUZQ==
X-Gm-Message-State: AOAM533aaIEYop69cewIdsrFPFUg/56emo5umgu7GjQIjGxoCPohJnFV
        yUtYWBySOBdYPTXvKWpU+jlwJ//Awanah7ZVpeo=
X-Google-Smtp-Source: ABdhPJx2bEGH38tYpjnj/Z7q11aMhmbP/LA+2K64aHqc6A0Bq7iVVU1ut4Jrlho/aCrHoSS8iE9jknaEW8LIrs98Szs=
X-Received: by 2002:a63:7047:: with SMTP id a7mr9320545pgn.458.1634910099521;
 Fri, 22 Oct 2021 06:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <8735otjjjx.fsf@igel.home>
In-Reply-To: <8735otjjjx.fsf@igel.home>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 22 Oct 2021 15:41:28 +0200
Message-ID: <CANBLGcw+2MYSDmnKSjJHjPVGWo22kXngRpfQq2xrr8BYYLbhOw@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Andreas Schwab <schwab@linux-m68k.org>
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 22 Oct 2021 at 15:06, Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Okt 21 2021, Emil Renner Berthing wrote:
>
> > +config RESET_STARFIVE_JH7100
> > +     bool "StarFive JH7100 Reset Driver"
> > +     depends on SOC_STARFIVE || COMPILE_TEST
>
> Why does it need to depend on SOC_STARFIVE?

It strictly doesn't but most other drivers in the same Kconfig file
also depends on ARCH_something or SOC_something. In particular
RESET_K210 depends on SOC_CANAAN. I think this is to prevent
overwhelming the user with useless choices if they didn't enable the
relevant SoC, and for others there are the COMPILE_TEST option.

/Emil
