Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64453447CB7
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 10:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236043AbhKHJ1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 04:27:38 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:37676 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238362AbhKHJ1i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 04:27:38 -0500
Received: by mail-ua1-f42.google.com with SMTP id l43so30142435uad.4;
        Mon, 08 Nov 2021 01:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8AsDmIULodpRjro1Z9iu2vYvGZdr5FGncs23xMPcSjY=;
        b=ArADw+7fGhEP204q36+EgV8fuwi8v5p7VBdPK34ALcuvam0nRWdZEG2rjFXoHGqxVK
         aqrce/vfNai3pQ3kcIkGtdveqmFxq7gQZb7E1Hr9lvmtf8oS3Q9glCjtj2KZsZPF3etP
         girYfiuL6DWfaoVCR577/7ryj14LkY0suBU6nWMVy7vgTucw1kf6jVvwCDxArK+P0YQP
         qDLVCQtT5TZGdoa0g4ASttW370kU+6UCV3U4Td3leGQc8qfb2RnxmmhY4hc5NCH5Y2wj
         9ZR5SO0mex0I4x1lFfKZw0q57iEVcH2CQFZkg9SCzCDmQ8NuAwyOKRsREPQflOuUwZos
         oTBA==
X-Gm-Message-State: AOAM531LRsZJ0G9AHwyYtQ+5K9JuHWoQeVauCoEBs7lskFCE8HevKopi
        UIRkSkjuCpBY6q3zC7mf8a0DtB7zqIHc+A==
X-Google-Smtp-Source: ABdhPJwk7L3orWJ5ZRcu8fOvPWLJdxLZCEp38MQV78p+mZIPY+vMumEZfMmb/sLSgU03lL31aZ8mAQ==
X-Received: by 2002:a67:3310:: with SMTP id z16mr34890135vsz.5.1636363493367;
        Mon, 08 Nov 2021 01:24:53 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id s16sm2208852vss.6.2021.11.08.01.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 01:24:53 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id p37so29030878uae.8;
        Mon, 08 Nov 2021 01:24:52 -0800 (PST)
X-Received: by 2002:a9f:2584:: with SMTP id 4mr90719408uaf.114.1636363492461;
 Mon, 08 Nov 2021 01:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-2-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-2-kernel@esmil.dk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 10:24:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUG2qGcAvr2sQPBtgQhZhYPhtveoW+mhkTeaowdKisFYQ@mail.gmail.com>
Message-ID: <CAMuHMdUG2qGcAvr2sQPBtgQhZhYPhtveoW+mhkTeaowdKisFYQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/16] RISC-V: Add StarFive SoC Kconfig option
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

On Tue, Nov 2, 2021 at 5:11 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> Add StarFive Kconfig option to select SoC specific and common drivers
> required for these SoCs. Select subsystems required to boot so the
> required drivers gets enabled by default.
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
