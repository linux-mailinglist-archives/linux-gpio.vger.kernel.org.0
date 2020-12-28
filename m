Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 489392E3708
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Dec 2020 13:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgL1MNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 07:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgL1MNU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 07:13:20 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3635CC061795
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:12:40 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o17so23461261lfg.4
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U5dnI6hl/uAinnpfwjzW42khHlLLdEo6KFHybJaznUs=;
        b=Jjb/nwUvkEGmkSEzVwmXn+lIezhxSCwnCtBvaNxeeiDgCb7PMiokmM1cqfH3/4rb+e
         XyFo74xz0qxF8mjDYOFcbGd6H2sGCyh3XWCoBM9vLWRa09nq/idp+AWqYRHqIM3MPcK6
         7BwJZfHx4w+NSbgUlsmePG/yOTJRMlZ2+Gs/036xKf7gUovORvmdCSlLa2ACLiBEkwxG
         b/evgHVMvJD6nRbHECWe8o/Gqg33nOFw22LpGuRIkceZvlQC/QjVaFyBDnBYq3IiO2yn
         iHLT7/SY6TWLnAo3zwkFYcVZc4v6oV9CFwZv+pEukiOrqUSoQL9E5XdXZcwl4JuaW8GB
         RyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U5dnI6hl/uAinnpfwjzW42khHlLLdEo6KFHybJaznUs=;
        b=XESQyslWtJtl2LVLcsJph8uUIfWEjVatkNMemVimw9KuS1imWEyseO1iV2cden/WzI
         gmLxdy0mgdLw2vu9tTt6qFSfbzP050aIbOkOB8WwUMJSDtw8N2Sz7rCfM/jbLEeO4DFx
         wpqsAzLgvb8cpUXIlC14kcj8u5GQ+KYAo/6NJ+K2o1chvpPTOL2Dht770W+TBU/Szua7
         4wtr2FNJF2IuvhpFYA9Yr/y3Spt3IadoMCGeLfhQYQcwVsLKKttS2Umr9I+IFNJIdjXq
         NgeC4zZB862CU/5fCTNTtEWcyBiMxiCJBzAVLk25cpyXuLd/rtKUpGgebq+l2qBA/GN3
         fjfg==
X-Gm-Message-State: AOAM531zEeLQnLEJAQ671BMGscAIoE5vMhNfzD/ejVqyOsnC79rHLlz/
        FkSqwL5BfQv9H9wJPKnPuWKMLkuYdmtAvM/TeS7spg==
X-Google-Smtp-Source: ABdhPJxwpJprr6pD65kQrg3HfTYT/inYom0+1ZwhUQegnwfPAS2avm2w25j3YRiAFyIflTh1hkDoKyEuPzX3x50S5o0=
X-Received: by 2002:a05:6512:34c5:: with SMTP id w5mr18333870lfr.214.1609157558710;
 Mon, 28 Dec 2020 04:12:38 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-24-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-24-damien.lemoal@wdc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 28 Dec 2020 17:42:27 +0530
Message-ID: <CAAhSdy0XSzrnucDJPWzVVr37Zn0iRxVQZf5X2KkxCkv2kDf4_Q@mail.gmail.com>
Subject: Re: [PATCH v10 23/23] riscv: Add Canaan Kendryte K210 SD card defconfig
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

On Sun, Dec 13, 2020 at 7:22 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> The nommu_k210_defconfig default configuration allows booting a Canaan
> Kendryte K210 SoC based boards using an embedded intramfs cpio file.
> Modifying this configuration to enable support for the board SD card is
> not trivial for all users. To help beginners getting started with these
> boards, add the nommu_k210_sdcard_defconfig default configuration file
> to set all configuration options necessary to use the board mmc-spi sd
> card for the root file system.
>
> This new configuration adds support for the block layer, the mmc-spi
> driver and modifies the boot options to specify the rootfs device as
> mmcblk0p1 (first partition of the sd card block device). The ext2 file
> system is selected by default to encourage its use as that results in
> only about 4KB added to the kernel image size. As ext2 does not have
> journaling, the boot options specify a read-only mount of the file
> system. Similarly to the smaller nommu_k210_defconfig, this new default
> configuration disables virtual terminal support to reduce the kernel
> image size.
>
> The default device tree selected is unchanged, specifying the simple
> "k210_generic" device tree file. The user must change this setting to
> specify the device tree suitable for the board being used
> (k210_maix_bit, k210_maix_dock, k210_maix_go, k210_maixduino or
> k210_kd233).
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../riscv/configs/nommu_k210_sdcard_defconfig | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
>
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> new file mode 100644
> index 000000000000..a75388defd44
> --- /dev/null
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -0,0 +1,93 @@
> +# CONFIG_CPU_ISOLATION is not set
> +CONFIG_LOG_BUF_SHIFT=13
> +CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +# CONFIG_SYSFS_SYSCALL is not set
> +# CONFIG_FHANDLE is not set
> +# CONFIG_BASE_FULL is not set
> +# CONFIG_FUTEX is not set
> +# CONFIG_EPOLL is not set
> +# CONFIG_SIGNALFD is not set
> +# CONFIG_TIMERFD is not set
> +# CONFIG_EVENTFD is not set
> +# CONFIG_AIO is not set
> +# CONFIG_IO_URING is not set
> +# CONFIG_ADVISE_SYSCALLS is not set
> +# CONFIG_MEMBARRIER is not set
> +# CONFIG_KALLSYMS is not set
> +CONFIG_EMBEDDED=y
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLOB=y
> +# CONFIG_MMU is not set
> +CONFIG_SOC_CANAAN=y
> +CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
> +CONFIG_MAXPHYSMEM_2GB=y
> +CONFIG_SMP=y
> +CONFIG_NR_CPUS=2
> +CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro"
> +CONFIG_CMDLINE_FORCE=y
> +# CONFIG_SECCOMP is not set
> +# CONFIG_STACKPROTECTOR is not set
> +# CONFIG_BLK_DEV_BSG is not set
> +# CONFIG_MQ_IOSCHED_DEADLINE is not set
> +# CONFIG_MQ_IOSCHED_KYBER is not set
> +CONFIG_BINFMT_FLAT=y
> +# CONFIG_COREDUMP is not set
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +# CONFIG_FW_LOADER is not set
> +# CONFIG_ALLOW_DEV_COREDUMP is not set
> +# CONFIG_BLK_DEV is not set
> +# CONFIG_INPUT_LEDS is not set
> +# CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_SERIO is not set
> +# CONFIG_VT is not set
> +# CONFIG_UNIX98_PTYS is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_LDISC_AUTOLOAD is not set
> +# CONFIG_HW_RANDOM is not set
> +# CONFIG_DEVMEM is not set
> +CONFIG_I2C=y
> +CONFIG_I2C_CHARDEV=y
> +# CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> +CONFIG_SPI=y
> +# CONFIG_SPI_MEM is not set
> +CONFIG_SPI_DESIGNWARE=y
> +CONFIG_SPI_DW_MMIO=y
> +# CONFIG_GPIO_SYSFS is not set
> +# CONFIG_GPIO_CDEV_V1 is not set
> +CONFIG_GPIO_DWAPB=y
> +CONFIG_GPIO_SIFIVE=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_SYSCON=y
> +# CONFIG_HWMON is not set
> +# CONFIG_HID is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=y
> +# CONFIG_PWRSEQ_EMMC is not set
> +# CONFIG_PWRSEQ_SIMPLE is not set
> +CONFIG_MMC_SPI=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_USER=y
> +# CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
> +CONFIG_EXT2_FS=y
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +# CONFIG_INOTIFY_USER is not set
> +# CONFIG_MISC_FILESYSTEMS is not set
> +CONFIG_LSM="[]"
> +CONFIG_PRINTK_TIME=y
> +# CONFIG_SYMBOLIC_ERRNAME is not set
> +# CONFIG_DEBUG_BUGVERBOSE is not set
> +# CONFIG_DEBUG_MISC is not set
> +CONFIG_PANIC_ON_OOPS=y
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_RCU_TRACE is not set
> +# CONFIG_FTRACE is not set
> +# CONFIG_RUNTIME_TESTING_MENU is not set
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
