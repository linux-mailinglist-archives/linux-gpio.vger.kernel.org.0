Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B12345E2AF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238655AbhKYVs3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 16:48:29 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:33677 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351387AbhKYVq3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 16:46:29 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MEV7U-1moloX0GnS-00G06i; Thu, 25 Nov 2021 22:43:15 +0100
Received: by mail-wr1-f50.google.com with SMTP id o13so14309241wrs.12;
        Thu, 25 Nov 2021 13:43:14 -0800 (PST)
X-Gm-Message-State: AOAM531mNV9pKP5rRN+V+1xqPGFQhWhbyWtsyoeUqwrDEJR/ImtuoE75
        GxVYb8uRXTI/GT1+x2hoOV1vGwgK/I/N+0CrwTw=
X-Google-Smtp-Source: ABdhPJwjKapht7W/sukRuCfcX+lckyEPy1NdAnaERzdim0N17M/wef+Nllp0lT2Vmf332KaJEcKdDsO7PSXmL6JXu0w=
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr10262560wri.137.1637876594530;
 Thu, 25 Nov 2021 13:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-14-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-14-Mr.Bossman075@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 25 Nov 2021 22:42:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3dwwBt21o7LDY-CLDdVmOknxDF7sgO_dfiTj8_u4Tx=A@mail.gmail.com>
Message-ID: <CAK8P3a3dwwBt21o7LDY-CLDdVmOknxDF7sgO_dfiTj8_u4Tx=A@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] ARM: imxrt_defconfig: add i.MXRT family defconfig
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        giulio.benetti@benettiengineering.com,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9F1HmoWqAz0eILnTfnh1h6cvsqim0DA76W87jivWA2xvAi4HeaW
 h7scqcNGj1atWyUUkF6OogKEfwq1D1iv9+vmiaTItFZ3qT5Rl27Zt1DUh/qQN757atQdiu1
 VcDKlBcWYrLU8IEKemf2kiD5RzQKKyJZhnRU+MSYZOp/trlQpuIOr6iYbtNaoGuGa6zjACZ
 aIbhiPddPPARMcYW7NYBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Yz/1iYbOgPI=:F81e9KRFfoBNchdd179cgq
 aef64Jl/PNTfK4bq4LVyKvxDeeVx0HYXFJ/+lpYVd5j6m/H+1s969WnsdhuTQz25w+6PELdrm
 a5WF4/TP334wHbOeV8rg+DVHCi9kOp/oFySryVu+ef3Bg3Bm04VpGd068F4zPrrpWw9FM0DgM
 Ot1P5IuBzpL8C30bsx5uPPTcmspNdovPXvR8sFCrTK9koiD+GLY/YO16auhg3xiZsiOEuJTL7
 +Hwu0EousHqmCUWAlwNECrLg2KjhGnlDQU8wYznfpkaHHefvmzRmlNcFYJdnfz4Rfw7TPBAUf
 IUiCaYWZERea5X00X2T49khvNfAB+91c3FpZThcb9Pp8cPUmpHNeKEPlRG7PsTvl1bJczKvbG
 XwE4AG62LElp8GGWwyYivSt2/MeZqbwO2Zk62uetyfS9uTrM3OktfRzwZskx/vQzbL5Z5sTs/
 cfGaui/rM4hltp9MMLJpxviwODrPVkOHZvOBnofjObl+AWaLSYry51aZGOKwTvuWmmfsyAbhC
 Byecw3GzzgexHh6Kdt5BBv7G9EBxt/vvmYqJfzjQM+sVg6Cr0z+MwMFB/SID0njUP+7VyU5bk
 ZtO/1CQbPdepyAwdSssLxSB1mnEtUlLi0SraO/Udo3xMmaXjullZHulRfmulLmi0VrTcp/AzB
 ZvB7x+c5kev0OdqeJqjpoKU6Ozg0w6G3gpQZoDFhBxaH72YMgVexmazg2hcPYD9xY/GXZC0p1
 JTCeawzr6I32D99vKvKu1n5M7zzcUE21khY/YZYgEF6U57UjnpfXDjRusggrrIlH7FPeCogo/
 dLLEPDEizWPh8zF5Noh4sp0tUmYHBNbeW+MtXmU7DtiVV3CR4k=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 10:14 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Add generic i.MXRT family defconfig.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

I see a lot of things in here that probably should not be part of the kernel,
either because they are rather obscure, or they take valuable memory:

> ---
>  arch/arm/configs/imxrt_defconfig | 157 +++++++++++++++++++++++++++++++
>  1 file changed, 157 insertions(+)
>  create mode 100644 arch/arm/configs/imxrt_defconfig
>
> diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
> new file mode 100644
> index 000000000000..d673745a5462
> --- /dev/null
> +++ b/arch/arm/configs/imxrt_defconfig
> @@ -0,0 +1,157 @@
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_SYSVIPC=y
> +CONFIG_USELIB=y

You almost certainly won't want USELIB, and SYSVIPC support
would only be useful for certain applications that you probably
won't run.

> +CONFIG_BSD_PROCESS_ACCT=y
> +CONFIG_BSD_PROCESS_ACCT_V3=y
> +CONFIG_PSI=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y

Probably nonen of these are helpful here.

> +CONFIG_MEMCG=y
> +CONFIG_BLK_CGROUP=y
> +CONFIG_CFS_BANDWIDTH=y
> +CONFIG_CGROUP_PIDS=y
> +CONFIG_CGROUP_RDMA=y
> +CONFIG_CGROUP_FREEZER=y
> +CONFIG_CGROUP_DEVICE=y
> +CONFIG_CGROUP_CPUACCT=y
> +CONFIG_CGROUP_PERF=y
> +CONFIG_CGROUP_BPF=y
> +CONFIG_NAMESPACES=y
> +CONFIG_USER_NS=y
> +CONFIG_CHECKPOINT_RESTORE=y

Same for control groups overall as well as checkpoint_restore

> +CONFIG_RELAY=y

There are a few drivers using CONFIG_RELAY, but I don't see you enable
any of them,
so this is not actually used.

> +CONFIG_EXPERT=y

Are you losing anything without EXPERT? If not, remove that

> +CONFIG_SGETMASK_SYSCALL=y
> +# CONFIG_FUTEX is not set

Futex is probably one of the things you /do/ want.

> +CONFIG_KALLSYMS_ALL=y
> +CONFIG_PC104=y

Turning off KALLSYMS_ALL may save a noticeable amount of RAM.

PC104 isn't actually that big, but it seems unlikely that you have
that hardware.

> +CONFIG_PARAVIRT=y

You don't seem to enable XEN, so I don't think PARAVIRT is useful by itself.

> +# CONFIG_ATAGS is not set
> +CONFIG_CMDLINE="console=ttyS0 root=/dev/mmcblk0p2 rw earlycon rootwait"

The command line should come from the boot loader, users probably have
a different root device.

> +CONFIG_BLK_DEV_BSGLIB=y
> +CONFIG_BLK_DEV_INTEGRITY=y
> +CONFIG_BLK_DEV_ZONED=y
> +CONFIG_BLK_DEV_THROTTLING=y
> +CONFIG_BLK_WBT=y
> +CONFIG_BLK_SED_OPAL=y
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_BSD_DISKLABEL=y
> +CONFIG_MINIX_SUBPARTITION=y
> +CONFIG_SOLARIS_X86_PARTITION=y
> +CONFIG_UNIXWARE_DISKLABEL=y
> +CONFIG_LDM_PARTITION=y

I don't see you using OPAL or any of the 1990's partition formats.
ot set

> +CONFIG_BINFMT_FLAT=y

For the defconfig, you should probably have ELF_FDPIC enabled,
not just FLAT.

> +CONFIG_CLEANCACHE=y
> +CONFIG_ZPOOL=y
> +CONFIG_ZBUD=y
> +CONFIG_Z3FOLD=y

Do these work as expected on NOMMU?

> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_BLK_DEV_RAM_COUNT=1
> +CONFIG_BLK_DEV_RAM_SIZE=65536

I don't think you can have a ramdisk larger than RAM ;-)

> +CONFIG_MEMORY=y

No need to enable the subsystem when you don't enable any
of its drivers.

> +CONFIG_EXT2_FS=y
> +CONFIG_EXT2_FS_XATTR=y
> +CONFIG_EXT2_FS_POSIX_ACL=y
> +CONFIG_EXT2_FS_SECURITY=y
> +CONFIG_EXT3_FS=y
> +CONFIG_EXT3_FS_POSIX_ACL=y
> +CONFIG_EXT3_FS_SECURITY=y

Never use EXT3 on eMMC, just use EXT4 instead to make
the device actually live longer. You probably don't need to enable
EXT2 support separately.

> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +CONFIG_QUOTA=y

dnotify and locking seem more useful than quota here

> +# CONFIG_PRINT_QUOTA_WARNING is not set
> +CONFIG_AUTOFS4_FS=y

> +CONFIG_CONFIGFS_FS=y

I don't see anything using configfs

> +CONFIG_LSM="yama,loadpin,integrity,apparmor"

None of these are actually enabled as far as I can tell.

> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_INFO_DWARF4=y

If you use DWARF4, you probably want DEBUG_INFO_SPLIT as well,
to reduce the vmlinux size.

       Arnd
