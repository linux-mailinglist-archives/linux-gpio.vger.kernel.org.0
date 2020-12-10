Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA17B2D57DC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 11:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgLJKFp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 05:05:45 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38978 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbgLJKFp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 05:05:45 -0500
Received: by mail-ot1-f65.google.com with SMTP id d8so4329605otq.6;
        Thu, 10 Dec 2020 02:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DAZ8PgYzvtbc3rL4ZfV3e1oM3SXylqOqHN7opQzLty8=;
        b=AlI5QLktMa/66fdGZpy4r2X9ShhLR0vB0CcEeYdBroV7Q9kJ+nKezLbVWKGWRK0bB6
         RIx2Ku8mfEEuDFbVg4gfT07uYMYQ/Q075Nlj1zo9lY/lyc1OKy6FvxBzk//z4RDKDmJn
         R0pFRGMrc/o5wz8C03471FxdllGZqzIZAWFH4IPt99N5f5Bok61kmcgVEBS0179DEVGi
         hEqW/Eq5FKK+AlBBlGpLpalNBi/ej3eVTzgrHR8mDworKAWjpBNs0mL6021nGyyj5ztR
         Y1WZc6yzxgnd60PNcovZX1hGrsf2e7xi89NkfZD8eBwTAri7fEQOyzKgX21ifa/B076T
         lilA==
X-Gm-Message-State: AOAM531VCzgeF+6tXj3rpQZrUcKa+D2OImukTnD4+UCCTfTLb3bvx5Ao
        b8rOnHQZ8nOpZC5U8nert0MqCd87Dyw+maDBrBo=
X-Google-Smtp-Source: ABdhPJyZli++OabJZH6oIk+doFCPUSskqqsQBvXQPxaex8q/acKKJGdIBrCVdCFmU/ZT7NKzZrrVrWx4c80BaVxZYR8=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr5253404ota.107.1607594704647;
 Thu, 10 Dec 2020 02:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 11:04:53 +0100
Message-ID: <CAMuHMdVbU2kjKU3EVN5kszPc=VQcgzYLemV6AOyg+YyZBfc31Q@mail.gmail.com>
Subject: Re: [PATCH v7 00/22] RISC-V Kendryte K210 support improvements
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Damien,

On Thu, Dec 10, 2020 at 4:41 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> Changes from v6:
> * Annotate struct platform_driver variables with __refdata to avoid
>   section mismatch compilation errors

Blindly following the advice from kernel test robot <lkp@intel.com> is
not always a good idea:

    The variable k210_rst_driver references
    the function __init set_reset_devices()
    If the reference is valid then annotate the
    variable with or __refdata (see linux/init.h) or name the variable:

If your driver's probe function is annotated with __init, you cannot
have a pointer to it in the driver structure, as any binding done after
the freeing of initmem will cause a crash.  Adding the __refdata merely
suppresses the warning, and won't avoid the crash.

There are two solutions for this:
  1. Remove the .probe pointer, and use platform_driver_probe() instead
     of platform_driver_register().
     This guarantees the probe method will be called only once, before
     initmem is freed, but does mean that probe deferral cannot work.
  2. Drop the __init annotation.
     This means the probe method can be called anytime, and supports
     both probe deferral and driver unbind/rebind cycles.

Given the limited amount of RAM on k210, I think option 1 is preferred,
but may require careful tuning of the initialization order using
*_initcall*(), to make sure probe deferral won't ever be needed.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
