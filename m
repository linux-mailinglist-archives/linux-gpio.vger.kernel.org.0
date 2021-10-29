Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C1D43FD16
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 15:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbhJ2NIX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 09:08:23 -0400
Received: from mail-pj1-f50.google.com ([209.85.216.50]:53042 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbhJ2NHn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 09:07:43 -0400
Received: by mail-pj1-f50.google.com with SMTP id oa4so7178176pjb.2;
        Fri, 29 Oct 2021 06:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KufboUyCprK+9fF7rZgzoYUlaXceRx+Ob+I3zrllYAQ=;
        b=pj4hv9MrdwdXDA5OOyNDk6/AjrGd6CwqOMyWCKuNwCk8K3RDmRDXRKVbHZOX1pFsym
         MIVjr7JmzTcClyx3/reE8UdJHwox6UaoKALAmXxLZVyDmJLtQ/7OpdYTbvo4ojzdJ+//
         vSrZjRIZaljuVCzWOqLfqBcFxXeJOahsP2hGaOhuBxlyh1mDW3TuM4Qp7HR4T1LdMa1W
         rhak9J/n1wR6t1lH12gqPrMhPdPeJZvVISntZXotewLRdLHKEShD0dNgUYtSg9KtfqjT
         BfrmZerBnawSo+wDzDlT1Jsq294UVH3rPD/J01UhmJ8krGUlYH2V0yifMr4NLrlmxq5n
         Gh9Q==
X-Gm-Message-State: AOAM5310uKekKcqNzmBqHFniwWGQV5mHclExYotm0RBL3eaYUAfMZod/
        gO8K6DdwGu3GceTrMOQ+kguW2RMHN8/faHWLES4=
X-Google-Smtp-Source: ABdhPJw9MG05yAh3HecVfqDjx7H9rcaDkE4VNJAwOxc2B4ZcG9HCIowvT8QcnxoBpBLNidPLtYA44mxQGJEw/QZ0CsY=
X-Received: by 2002:a17:90a:5b0c:: with SMTP id o12mr11538833pji.194.1635512714212;
 Fri, 29 Oct 2021 06:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-6-kernel@esmil.dk>
 <YXtRhwULuIzvmOnt@robh.at.kernel.org>
In-Reply-To: <YXtRhwULuIzvmOnt@robh.at.kernel.org>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 29 Oct 2021 15:05:02 +0200
Message-ID: <CANBLGcwVh593U78tbA+rT2wDnLytQ359ErbxFBroM5tmDXSMCQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Drew Fustini <drew@beagleboard.org>,
        Atish Patra <atish.patra@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Anup Patel <anup.patel@wdc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 29 Oct 2021 at 03:42, Rob Herring <robh@kernel.org> wrote:
> On Thu, 21 Oct 2021 19:42:12 +0200, Emil Renner Berthing wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Add device tree bindings for the StarFive JH7100 clock generator.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> >  .../clock/starfive,jh7100-clkgen.yaml         | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you! For the reset bindings you said to remove unused labels in
the example. If you don't mind I'll do that here too, but keep the
tag.

/Emil
