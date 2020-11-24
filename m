Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB05A2C3036
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 19:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404340AbgKXSvb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 13:51:31 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33692 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729281AbgKXSvb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 13:51:31 -0500
Received: by mail-oi1-f196.google.com with SMTP id k26so24957356oiw.0;
        Tue, 24 Nov 2020 10:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jLgRkvNZDgzifodaE8EMus5xcvCzfMMH9uwC3wIOBb4=;
        b=QrVl7PhG/o2jec5xuyAg+Nz1d7Fsg27SYpXsvNj+t/1KU6aJ7Foghb87HkTg3k+S+8
         IOSZTxnNC2TqxiPsGeB7TOaymnWLmjeZ5y7mbx4JTxrU4UIMcWDdtHeGjJ6xMJuVkLF9
         tMC/mtSn2ApbSQHxHly7N7S8noy4g7j+KVWJJahl/aN72fwK1Vagoq9d7lQxM1SrewST
         sMNEhrAkgeXp8SUGUvGyeU/h+uSb166Z6aZufr3o4vYWKmq4vXBtp8ONoZW6dek0e+ci
         j6CnrfTeenNOfqQQ33g2e8v7jk+GX4FKgm7/JTLqo91T0LAH0MEfUK3wHVx2TTSsDRmS
         L09Q==
X-Gm-Message-State: AOAM532nf8IRlCH/TUq62XFJpzf98v2XVOEafzog/QZuu7AyqdpMd6s6
        NBdWKQ/oCY85unaL721HOSpb88RVkZj+0CL8au4=
X-Google-Smtp-Source: ABdhPJzJTHN0EZ9x5LkNWapVCxjkQtojq63K19GvbXFCpjz3NM8fGWLVYQO01JPHQgAmeFVa5xCtYTNE7u/4H+kUkl4=
X-Received: by 2002:aca:c3c4:: with SMTP id t187mr3522373oif.148.1606243890137;
 Tue, 24 Nov 2020 10:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20201124043728.199852-1-damien.lemoal@wdc.com> <20201124043728.199852-22-damien.lemoal@wdc.com>
In-Reply-To: <20201124043728.199852-22-damien.lemoal@wdc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Nov 2020 19:51:18 +0100
Message-ID: <CAMuHMdWZX4_Y+4OdEQPJwqHd68OA4p0uw7KQfjVwgHgk0Q=brA@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] riscv: Add Canaan Kendryte K210 SD card defconfig
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

On Tue, Nov 24, 2020 at 5:39 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> The nommu_k210_defconfig default configuration allows booting a K210
> SoC based board using an embedded intramfs cpio file. Modifying this
> configuration to enable support for the board SD card is not
> trivial for all users. To help beginners getting started with this
> board, add the nommu_k210_sdcard_defconfig default configuration file
> to set all configuration options necessary to use the board mmc-spi
> sd card for the root file system. This configuration adds support for
> the block layer, the mmc-spi driver and modifies the boot options to
> specify the rootfs device as mmcblk0p1 (first partition of the sd card
> block device). The ext2 file system is selected by default to encourage
> its use as that results in only about 4KB added to the kernel image
> size. The default device tree compiled in is unchanged and must be
> replaced by the user with the device tree suitable for the board being
> used (k210_maix_bit, k210_maix_dock, k210_maix_go, k210_maixduino or
> k210_kd233).
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

While ext2 is definitely cheaper than ext4 (the latter takes almost +200
KiB, ugh), ext2 does not have journaling.
Hence your root file system will be unclean all the time, unless you always
manage to unmount it before reboot.  And your default buildroot
does not have e2fsck.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
