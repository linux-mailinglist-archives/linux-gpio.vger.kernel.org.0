Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04221447CCE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 10:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238423AbhKHJeM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 04:34:12 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:34444 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238415AbhKHJeL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 04:34:11 -0500
Received: by mail-ot1-f54.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso3978261otj.1;
        Mon, 08 Nov 2021 01:31:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZmZfs7D5IbUVgEtSSm6IrADV7ReOJphsMresBSdiIH0=;
        b=x5uIwgFSQKJsIiQr3yTHYUolashHG/KhkIpDY5LTcPxLptU981GYifauUnG3DmCNos
         d2S1mEFS5t/eEH3gtdFLoV9bT+GNC/kIovvnwc4itYfKZV+gkIsLJTC4ZMIGaDinFArr
         FenxzPuzDt3ez8lFJgOi4OVal29LLPha+ssfahuFnnDtZXnTsLqK6kKlTn9vi7CJB+FV
         wHnJ9xWFWGb5uraEnNmsUYFWz1IaSpqDuo6l6De2IJuj28AGo3B7bYZkuzi1RNYYtFir
         H0BCkbUr0PtPBD5AKX9HY+8atUZdyTBqNNcKznTa/ZM94ioZx3Fp2qpKgea6bK9738Ia
         a8Fg==
X-Gm-Message-State: AOAM533WVuPt44e0WihKalOKEkEwDIv/c3SNBvLmihOU9XY/hrdXuTbX
        HXxt79f9w5vERfHpuI0ynThAwHuLE8RHlQ==
X-Google-Smtp-Source: ABdhPJz0wTeqNHYTCbt4+uCAZpHvIRF3U2CYz3bgpjcBANAELNQIooX9NHFzfCLAGjDsjLN5x+Ohjg==
X-Received: by 2002:a9d:5d4:: with SMTP id 78mr12818467otd.368.1636363887127;
        Mon, 08 Nov 2021 01:31:27 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id c8sm3162977ooq.43.2021.11.08.01.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 01:31:26 -0800 (PST)
Received: by mail-ot1-f52.google.com with SMTP id q33-20020a056830442100b0055abeab1e9aso24543722otv.7;
        Mon, 08 Nov 2021 01:31:26 -0800 (PST)
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr90132886uaj.89.1636363570925;
 Mon, 08 Nov 2021 01:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-9-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-9-kernel@esmil.dk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 10:25:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWieSa-VKMov3qhT6UVe15huNW-z2hQgPLSKVDzvU-wYQ@mail.gmail.com>
Message-ID: <CAMuHMdWieSa-VKMov3qhT6UVe15huNW-z2hQgPLSKVDzvU-wYQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] dt-bindings: reset: Add Starfive JH7100 reset bindings
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
> Add bindings for the reset controller on the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
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
