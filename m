Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41C344426C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 14:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhKCNct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 09:32:49 -0400
Received: from mail-pl1-f170.google.com ([209.85.214.170]:39819 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhKCNct (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Nov 2021 09:32:49 -0400
Received: by mail-pl1-f170.google.com with SMTP id t21so2476608plr.6;
        Wed, 03 Nov 2021 06:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zTMij4riOHLD0cKrMBvNEsbDWm7ejt3VqpUfGJxdY7w=;
        b=w30Fme3CiHvQKDNNkdMfjSHphx+3+lFFr1hGo321h/V5Bds7z0YYBldKhx0jwNySYP
         +GDvLyZsJjFpGGaMXdpqOA5/9lpeib/OZmtoQRiLMKGW/D6uVgVp/6wE1k/d2DBGH5Eq
         Mjwof52X93V2oTu1sosUUFrM3pXcisZaKQewZG87h/9Z+YW9BruOTegvLmlpLi6gwCcq
         VEECimDokKnnvxmnY4VqSw48eBPIlSV/09PDUpgTCkk9HgrcnzyXFvfJsVIioyDJtdKk
         jflWWPBdEaruc1AM51uqgWdLe7qpyNlxFlMMpV4K/a275d34BdwCPMS1KyhRz99eEKH1
         EKvw==
X-Gm-Message-State: AOAM531fDikhil/13SuoviOWCDCPWrHTq5AoJzxuVQuUtgAeq7fMJbSL
        uq9klRlng0/wSpXs5/qJwuNQrA6SKsKCVUxBfQQ=
X-Google-Smtp-Source: ABdhPJwNq6Q76J7qXE/0eAQN5HimezZY3rwDPmoANzNGDoGAXLzuRGbdMKq3Oek9Nc0X4IigXZvlpuqyhJ7hmGVXXQg=
X-Received: by 2002:a17:902:a60f:b0:141:8996:3fe with SMTP id
 u15-20020a170902a60f00b00141899603femr37563503plq.71.1635946212677; Wed, 03
 Nov 2021 06:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-12-kernel@esmil.dk>
 <1635902437.610819.3880381.nullmailer@robh.at.kernel.org>
In-Reply-To: <1635902437.610819.3880381.nullmailer@robh.at.kernel.org>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Wed, 3 Nov 2021 14:30:01 +0100
Message-ID: <CANBLGcwTB27kSRC7HCAJvrk7T0zyj1eM1i4YHj8Prar6JLqTYA@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Anup Patel <anup.patel@wdc.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Atish Patra <atish.patra@wdc.com>,
        Marc Zyngier <maz@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Drew Fustini <drew@beagleboard.org>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Fu Wei <tekkamanninja@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 3 Nov 2021 at 02:20, Rob Herring <robh@kernel.org> wrote:
> On Tue, 02 Nov 2021 17:11:20 +0100, Emil Renner Berthing wrote:
> > Add bindings for the GPIO/pin controller on the JH7100 RISC-V SoC by
> > StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> >
> > @Linus: I'm really struggling to find a good way to describe how pin
> > muxing works on the JH7100. As you can see I've now resorted to
> > ascii-art to try to explain it, but please let me know if it's still
> > unclear.
> >
> >  .../pinctrl/starfive,jh7100-pinctrl.yaml      | 307 ++++++++++++++++++
> >  1 file changed, 307 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.example.dts:19:18: fatal error: dt-bindings/clock/starfive-jh7100.h: No such file or directory
>    19 |         #include <dt-bindings/clock/starfive-jh7100.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1441: dt_binding_check] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1549835

Hi Rob.

It seems like your bot didn't add the clock header because the patch
already has an Acked-by from you.

/Emil
