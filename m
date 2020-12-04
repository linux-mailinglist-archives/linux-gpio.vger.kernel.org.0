Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC142CF076
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 16:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgLDPMK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 10:12:10 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38109 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgLDPMJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 10:12:09 -0500
Received: by mail-ot1-f66.google.com with SMTP id b62so5456300otc.5;
        Fri, 04 Dec 2020 07:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mx7p3eLmIuWMmtE6mHb2ILEA4Fig5dyz0WFMcFJkzUI=;
        b=dJPLMx5O8MhYAMbNBYYCk9tuT37Rso5GhU7P6GEQ3FD6Gd9R02rFDWYcDQf5naxf+p
         BtQ6GKG0gqSpVdj2AOSjEm9CA6K6dixCf+8OH1o8g1tjq5SHBUQKL9nxCaKzBzh+3jX0
         yyoipoam9AB5JjDHmeJqcgVjMsha8+r79ze5Md5txwt5DNzIxEoINwa5CTjgiVHl7GnW
         rz5sAkjTuPCZQXC4gdzGr/Utorj0p0JCHd3VhXK3EICErY/eW5RTKL31EpXWOlHtmvbm
         9AwCB1LS91luyQcgjCrvwyuYKzOVDBXcCx99pvIje7njJlBcl+5cV7lsDRbnBxnlhSDX
         gcKQ==
X-Gm-Message-State: AOAM533X0UhL7YtkPmTSmSsAItPY9Epy/gHLCAkK1gP7gkf6CjOLCmBS
        R9b75tdAyjFm2eeiC3sU/83ehZmHZELD55LF5r0=
X-Google-Smtp-Source: ABdhPJxwYLy9vqmxnrB8JtTc3YLu6dtlxp2mecVJQlpJfWk1truKlk75tY3Yz7qtoFs+L8+WzUHpvf/9+jzvBbV6wYE=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr4000589ota.107.1607094682844;
 Fri, 04 Dec 2020 07:11:22 -0800 (PST)
MIME-Version: 1.0
References: <20201202032500.206346-1-damien.lemoal@wdc.com> <20201202032500.206346-5-damien.lemoal@wdc.com>
In-Reply-To: <20201202032500.206346-5-damien.lemoal@wdc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Dec 2020 16:11:11 +0100
Message-ID: <CAMuHMdUyA3gobmcUjPr6JM8KLpcM0WKhd6Gfk5=tCfneBYJWMA@mail.gmail.com>
Subject: Re: [PATCH v4 04/21] riscv: Fix builtin DTB handling
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

On Wed, Dec 2, 2020 at 4:26 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> All SiPeed K210 MAIX boards have the exact same vendor, arch and
> implementation IDs, preventing differentiation to select the correct
> device tree to use through the SOC_BUILTIN_DTB_DECLARE() macro. This
> result in this macro to be useless and mandates changing the code of
> the sysctl driver to change the builtin device tree suitable for the
> target board.
>
> Fix this problem by removing the SOC_BUILTIN_DTB_DECLARE() macro since
> it is used only for the K210 support. The code searching the builtin
> DTBs using the vendor, arch an implementation IDs is also removed.
> Support for builtin DTB falls back to the simpler and more traditional
> handling of builtin DTB using the CONFIG_BUILTIN_DTB option, similarly
> to other architectures.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

> --- a/arch/riscv/boot/dts/kendryte/Makefile
> +++ b/arch/riscv/boot/dts/kendryte/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_SOC_KENDRYTE_K210_DTB) += k210.dtb
> -
> +ifneq ($(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE),"")
> +dtb-y += $(strip $(shell echo $(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE))).dtb
>  obj-$(CONFIG_SOC_KENDRYTE_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
> +endif

This break compiling a kernel for non-K210 systems (e.g. defconfig),
as reported before in
https://lore.kernel.org/linux-clk/202011151230.QP1ISPQo-lkp@intel.com/

I think this can be fixed using:

--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
-subdir-y += canaan
+subdir-$(CONFIG_SOC_CANAAN) += canaan

 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))

(yes, I've already renamed kendryte to canaan ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
