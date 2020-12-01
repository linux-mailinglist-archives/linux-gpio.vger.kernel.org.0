Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79EA2C9E2E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 10:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbgLAJlW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 04:41:22 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46858 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbgLAJlW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 04:41:22 -0500
Received: by mail-ot1-f68.google.com with SMTP id z23so1029137oti.13;
        Tue, 01 Dec 2020 01:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmburLdzMZVoTI9RJt73JfvngZccAhArSX6w0ehlMGU=;
        b=DJiwFHVgF2eyuWDIfbajPUj7hyEXWJUSNMZ8JoPzR/MOmKJu16fMkfXUu2+sAOtn2j
         05PUXyreDN9JaOM7c2oWIoesHarXEVB7xAINsDuP56n6wGSalmfZVNnxzxPiLw0dEW8M
         1Pp9YFM0F4NxdE0/6XzY43twWKWPB0mocClxlMA37Yzn87vTq+MBQACU09nUpUTZLjZO
         M9Bzxrv6OySYQ3i32U6s5lI6lJeXeS4skUelHqMOsY3wFC1qwE54sgpx1LVR9E9Zfpxx
         7o99/20M6jSR/TZqXj2jxSTKcO3zkAsCNMU7zomQxxJfBC4wv+/NENoWtW4XTIWQ7/Is
         GcAg==
X-Gm-Message-State: AOAM532Kx9LZB0sRsr2bQviNEjXJsV9LtZRX04a65+Fgc4529DXFaW5F
        aO6NHOf/vtrdPpsaSvojeBPS38+4MOd5iwJm5T4=
X-Google-Smtp-Source: ABdhPJyBSiaXmquOHT4sYGOidnZ1HN/Bou0gocyPltQemKL9W1PU2qA9upmXueyNHBCDM3S7Ff4bIfAjW92KbKtla90=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr1274660oth.250.1606815641429;
 Tue, 01 Dec 2020 01:40:41 -0800 (PST)
MIME-Version: 1.0
References: <20201130234829.118298-1-damien.lemoal@wdc.com> <20201130234829.118298-13-damien.lemoal@wdc.com>
In-Reply-To: <20201130234829.118298-13-damien.lemoal@wdc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Dec 2020 10:40:30 +0100
Message-ID: <CAMuHMdX_HOQFm-9PXgsuOEK7BYu0B76CESkLmK4CH+qF_0T0yw@mail.gmail.com>
Subject: Re: [PATCH v3 12/21] riscv: Add Canaan Kendryte K210 FPIOA driver
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

On Tue, Dec 1, 2020 at 12:50 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> Add the pinctrl-k210.c pinctrl driver for the Canaan Kendryte K210
> field programmable IO array (FPIOA) to allow configuring the SoC pin
> functions. The K210 has 48 programmable pins which can take any of 256
> possible functions.
>
> This patch is inspired from the k210 pinctrl driver for the u-boot
> project and contains many direct contributions from Sean Anderson.
>
> The MAINTAINERS file is updated to list myself as maintainer of this new
> driver.
>
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Thanks for your patch!

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3826,10 +3826,13 @@ CANAAN/KENDRYTE K210 RISC-V SOC SUPPORT
>  M:     Damien Le Moal <damien.lemoal@wdc.com>
>  L:     linux-riscv@lists.infradead.org
>  L:     linux-clk@vger.kernel.org (clock driver)
> +L:     linux-gpio@vger.kernel.org (pinctrl driver)
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
>  F:     Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> +F:     Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
>  F:     drivers/clk/clk-k210.c
> +F:     drivers/pinctrl/pinctrl-k210.c
>  F:     drivers/soc/canaan/
>  F:     include/soc/canaan/

Please create separate sections for the clock and pinctrl drivers,
to avoid all 3 mailing lists being suggested by get_maintainers for
all changes to any of the file patterns.  People will blindly use the
get_maintainers scripts' output.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
