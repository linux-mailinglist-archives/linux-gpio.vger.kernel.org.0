Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1D02E36E1
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Dec 2020 13:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbgL1MEJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 07:04:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgL1MEI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 07:04:08 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEC9C061796
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:03:28 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id s26so23360712lfc.8
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n8o8T3KVh3sa6mcSr6R2U8aovfr4NzRDU/oLbZ8tRzs=;
        b=BxWuYZNEjzULKdz3w08WrP75HZ0C4feGV0J16+bqN5c1tyIP32zRFmKfi+IfJt56C5
         u4V6G5VaJC2Ko4pL6CXqq0w8ozEePcTp+x07lEylf4pUn6hGAboTA0oHWhrDUGoqX06X
         hO7lmE66HpJqxB55NpepHPRmjOWkYaqAVxndLHS5ufIHX5RAnt3odDD04GBLvviQgzhP
         NrrikVvZ/V9Mzf3HNrhe+ORwqE7l6oWqMSpIlC31uHAlRluhoMfE1mibm7yh8DsQ2GuA
         qde4sKC2IwQqG7vRZH6PuEduQlejqT+IOIQOkQ0imM/s3rY5Xd1i8BX3CS0BkDxaZln0
         ci0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n8o8T3KVh3sa6mcSr6R2U8aovfr4NzRDU/oLbZ8tRzs=;
        b=cqTPiJ8G33cAp5PUQ2WSeXf9GEQKSjMCE68C2Zob00MLqwD7Mjd7YpQ6iYo1/yFUR8
         JD1JIysV9yVk9/pXpiovz5GrDAcWO/0jkIOHVH5D5aLRISP+CERNJI8QWwx0HOTxTr8y
         DaWaug7q8LGQGPbvJbYeXRBt8ZoEOKs6icqPiTLzoVW/JIIEJuLHaJAz5wbPGP6gJyLU
         LzNVI3FnCGgCZTgID5LI6sBKKYjmJno9NllisV8+9TkO9uvjFCfbQ7QdoM5JhlZCq8DN
         CrnvL1bT1IT5p3htCzej5gmchVm/wCbvPGkZ/cV4b6Jd3rhrWIZn2VD+/XmwDKqEyvk0
         bMKQ==
X-Gm-Message-State: AOAM531HIDlbNE+gY/v8+A0R+pTeI9e2wMLSRwCz0IkgnKFcdV51ADVC
        TBCDrcD7yEoQxfFedSl87zjw8OzbyFDJdNrjVXg/3Q==
X-Google-Smtp-Source: ABdhPJy37oMJnWmRUoaMefyxJgkvsoqTDECwz6LV6L44JqwTjBjpF0QcWrJEn9WEibSn0th61vq+Y46YsUtgF3WywaU=
X-Received: by 2002:a19:2c4:: with SMTP id 187mr18233308lfc.391.1609157006318;
 Mon, 28 Dec 2020 04:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-6-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-6-damien.lemoal@wdc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 28 Dec 2020 17:33:15 +0530
Message-ID: <CAAhSdy3Wfc5M=y1bQ=ZVdSuDtH8B1-=3gFaaanmm0CET=btCwQ@mail.gmail.com>
Subject: Re: [PATCH v10 05/23] riscv: Use vendor name for K210 SoC support
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 13, 2020 at 7:21 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Rename configuration options and directories related to the Kendryte
> K210 SoC to use the SoC vendor name (canaan) instead of the "kendryte"
> branding name.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/Kconfig.socs                       | 24 +++++++++----------
>  arch/riscv/Makefile                           |  2 +-
>  arch/riscv/boot/dts/Makefile                  |  2 +-
>  arch/riscv/boot/dts/canaan/Makefile           |  5 ++++
>  .../boot/dts/{kendryte => canaan}/k210.dts    |  0
>  .../boot/dts/{kendryte => canaan}/k210.dtsi   |  0
>  arch/riscv/boot/dts/kendryte/Makefile         |  5 ----
>  arch/riscv/configs/nommu_k210_defconfig       |  2 +-
>  drivers/soc/Kconfig                           |  2 +-
>  drivers/soc/Makefile                          |  2 +-
>  drivers/soc/{kendryte => canaan}/Kconfig      |  4 ++--
>  drivers/soc/{kendryte => canaan}/Makefile     |  0
>  .../soc/{kendryte => canaan}/k210-sysctl.c    |  0
>  13 files changed, 24 insertions(+), 24 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/canaan/Makefile
>  rename arch/riscv/boot/dts/{kendryte => canaan}/k210.dts (100%)
>  rename arch/riscv/boot/dts/{kendryte => canaan}/k210.dtsi (100%)
>  delete mode 100644 arch/riscv/boot/dts/kendryte/Makefile
>  rename drivers/soc/{kendryte => canaan}/Kconfig (79%)
>  rename drivers/soc/{kendryte => canaan}/Makefile (100%)
>  rename drivers/soc/{kendryte => canaan}/k210-sysctl.c (100%)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 0bc3e28581f2..88ac0d1a5da4 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -22,21 +22,21 @@ config SOC_VIRT
>         help
>           This enables support for QEMU Virt Machine.
>
> -config SOC_KENDRYTE
> -       bool "Kendryte K210 SoC"
> +config SOC_CANAAN
> +       bool "Canaan Kendryte K210 SoC"
>         depends on !MMU
>         select CLINT_TIMER if RISCV_M_MODE
>         select SERIAL_SIFIVE if TTY
>         select SERIAL_SIFIVE_CONSOLE if TTY
>         select SIFIVE_PLIC
>         help
> -         This enables support for Kendryte K210 SoC platform hardware.
> +         This enables support for Canaan Kendryte K210 SoC platform hardware.
>
> -if SOC_KENDRYTE
> +if SOC_CANAAN
>
> -config SOC_KENDRYTE_K210_DTB_BUILTIN
> -       bool "Builtin device tree for the Kendryte K210"
> -       depends on SOC_KENDRYTE
> +config SOC_CANAAN_K210_DTB_BUILTIN
> +       bool "Builtin device tree for the Canaan Kendryte K210"
> +       depends on SOC_CANAAN
>         default y
>         select OF
>         select BUILTIN_DTB
> @@ -45,13 +45,13 @@ config SOC_KENDRYTE_K210_DTB_BUILTIN
>           This option should be selected if no bootloader is being used.
>           If unsure, say Y.
>
> -config SOC_KENDRYTE_K210_DTB_SOURCE
> -       string "Source file for the Kendryte K210 builtin DTB"
> -       depends on SOC_KENDRYTE
> -       depends on SOC_KENDRYTE_K210_DTB_BUILTIN
> +config SOC_CANAAN_K210_DTB_SOURCE
> +       string "Source file for the Canaan Kendryte K210 builtin DTB"
> +       depends on SOC_CANAAN
> +       depends on SOC_CANAAN_K210_DTB_BUILTIN
>         default "k210"
>         help
> -         Base name (without suffix, relative to arch/riscv/boot/dts/kendryte)
> +         Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
>           for the DTS file that will be used to produce the DTB linked into the
>           kernel.
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0289a97325d1..cd08dc40e8d8 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -83,7 +83,7 @@ PHONY += vdso_install
>  vdso_install:
>         $(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>
> -ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_KENDRYTE),yy)
> +ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
>  KBUILD_IMAGE := $(boot)/loader.bin
>  else
>  KBUILD_IMAGE := $(boot)/Image.gz
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 21e3905f1c44..4da40691c55b 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  subdir-y += sifive
> -subdir-$(CONFIG_SOC_KENDRYTE) += kendryte
> +subdir-$(CONFIG_SOC_CANAAN) += canaan
>
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
> new file mode 100644
> index 000000000000..9ee7156c0c31
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +ifneq ($(CONFIG_SOC_CANAAN_K210_DTB_SOURCE),"")
> +dtb-y += $(strip $(shell echo $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))).dtb
> +obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
> +endif
> diff --git a/arch/riscv/boot/dts/kendryte/k210.dts b/arch/riscv/boot/dts/canaan/k210.dts
> similarity index 100%
> rename from arch/riscv/boot/dts/kendryte/k210.dts
> rename to arch/riscv/boot/dts/canaan/k210.dts
> diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> similarity index 100%
> rename from arch/riscv/boot/dts/kendryte/k210.dtsi
> rename to arch/riscv/boot/dts/canaan/k210.dtsi
> diff --git a/arch/riscv/boot/dts/kendryte/Makefile b/arch/riscv/boot/dts/kendryte/Makefile
> deleted file mode 100644
> index 83636693166d..000000000000
> --- a/arch/riscv/boot/dts/kendryte/Makefile
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -ifneq ($(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE),"")
> -dtb-y += $(strip $(shell echo $(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE))).dtb
> -obj-$(CONFIG_SOC_KENDRYTE_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
> -endif
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index cd1df62b13c7..368a28cf1467 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -27,7 +27,7 @@ CONFIG_EMBEDDED=y
>  CONFIG_SLOB=y
>  # CONFIG_SLAB_MERGE_DEFAULT is not set
>  # CONFIG_MMU is not set
> -CONFIG_SOC_KENDRYTE=y
> +CONFIG_SOC_CANAAN=y
>  CONFIG_MAXPHYSMEM_2GB=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=2
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 425ab6f7e375..f43886fec32b 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -6,6 +6,7 @@ source "drivers/soc/amlogic/Kconfig"
>  source "drivers/soc/aspeed/Kconfig"
>  source "drivers/soc/atmel/Kconfig"
>  source "drivers/soc/bcm/Kconfig"
> +source "drivers/soc/canaan/Kconfig"
>  source "drivers/soc/fsl/Kconfig"
>  source "drivers/soc/imx/Kconfig"
>  source "drivers/soc/ixp4xx/Kconfig"
> @@ -22,6 +23,5 @@ source "drivers/soc/ux500/Kconfig"
>  source "drivers/soc/versatile/Kconfig"
>  source "drivers/soc/xilinx/Kconfig"
>  source "drivers/soc/zte/Kconfig"
> -source "drivers/soc/kendryte/Kconfig"
>
>  endmenu
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 36452bed86ef..dec90fca120b 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -28,4 +28,4 @@ obj-$(CONFIG_ARCH_U8500)      += ux500/
>  obj-$(CONFIG_PLAT_VERSATILE)   += versatile/
>  obj-y                          += xilinx/
>  obj-$(CONFIG_ARCH_ZX)          += zte/
> -obj-$(CONFIG_SOC_KENDRYTE)     += kendryte/
> +obj-$(CONFIG_SOC_CANAAN)       += canaan/
> diff --git a/drivers/soc/kendryte/Kconfig b/drivers/soc/canaan/Kconfig
> similarity index 79%
> rename from drivers/soc/kendryte/Kconfig
> rename to drivers/soc/canaan/Kconfig
> index 49785b1b0217..5232d13f07e5 100644
> --- a/drivers/soc/kendryte/Kconfig
> +++ b/drivers/soc/canaan/Kconfig
> @@ -1,9 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -if SOC_KENDRYTE
> +if SOC_CANAAN
>
>  config K210_SYSCTL
> -       bool "Kendryte K210 system controller"
> +       bool "Canaan Kendryte K210 SoC system controller"
>         default y
>         depends on RISCV
>         help
> diff --git a/drivers/soc/kendryte/Makefile b/drivers/soc/canaan/Makefile
> similarity index 100%
> rename from drivers/soc/kendryte/Makefile
> rename to drivers/soc/canaan/Makefile
> diff --git a/drivers/soc/kendryte/k210-sysctl.c b/drivers/soc/canaan/k210-sysctl.c
> similarity index 100%
> rename from drivers/soc/kendryte/k210-sysctl.c
> rename to drivers/soc/canaan/k210-sysctl.c
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
