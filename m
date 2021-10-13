Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6A342B884
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 09:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238262AbhJMHL5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 03:11:57 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:41602 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238307AbhJMHL4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 03:11:56 -0400
Received: by mail-ua1-f47.google.com with SMTP id r17so2561627uaf.8;
        Wed, 13 Oct 2021 00:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n2Vfle/L4DE8NNVonQeF5lDlU0mWpcADJWBKbo+5jlg=;
        b=mz9AbB+VZ5S4MSVRd37pnKGF9QX3inhO7uiZJHzCpVFRPc1xlwSoya1PXLimE8bmTs
         ydf+H2FFU0sKFJtJ2U+5K3J50EsEwbPRqbVj6SnSFcRXLtXLVvgOGXbrXmDFvpjdULra
         4q1zJ5RggOXXcBNTN9EtivGfNGt//OcCeqrKvIGLkwsM2cG5jOZh0JkO9GIPWbSDgVRo
         K86JAUQRpSg2mOalhpLFSCxpDllpLSxG39Fgz4wKlqTVEhTBUGqwuOgYfGmlt1G0oS9P
         kYB1xUMrXr3q9723zsUcC1+sSNdwmcl/PsojdZ5pgokzAEqDIOI+WLY2CQQPUJNckEsh
         +MuQ==
X-Gm-Message-State: AOAM531OalkE6/NdrHATcOrQ71cZGAAtQ3NHR5sbkbf7I6TGq/lp/gIH
        70r/1xasB/JYc/ZmAWbhSEDwSYO4D10vHvsy4WE=
X-Google-Smtp-Source: ABdhPJw9m3bolfmVg7DS3DCFf2Y3Gnn0kQSL4lmvuOhPzzjoHLSBo8TqPmo7TCeoJyzlugmfCsY/y5nnNy0Wk1eojM8=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr28277722ual.122.1634108992835;
 Wed, 13 Oct 2021 00:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-14-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-14-kernel@esmil.dk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 09:09:41 +0200
Message-ID: <CAMuHMdVq4pKovPsk0cAWSZ3T0-z8uVG1Bf306ya37BZnx0knpw@mail.gmail.com>
Subject: Re: [PATCH v1 13/16] dt-bindings: serial: snps-dw-apb-uart: Add
 JH7100 uarts
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

On Tue, Oct 12, 2021 at 3:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> Add compatibles for the StarFive JH7100 uarts.
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
