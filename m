Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28742460C46
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 02:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376913AbhK2BdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 20:33:19 -0500
Received: from smtpcmd14162.aruba.it ([62.149.156.162]:50416 "EHLO
        smtpcmd14162.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376794AbhK2BbR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 20:31:17 -0500
Received: from [192.168.50.18] ([146.241.138.59])
        by Aruba Outgoing Smtp  with ESMTPSA
        id rVMImypYirIRlrVMImljzA; Mon, 29 Nov 2021 02:21:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1638148892; bh=p9N0KEaC98MNX0tTtE6i72fSLBavSW2334B/WojIonE=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=Ll3xlv7PgZMBpGNsBydxMaTJfqhwDpqTw1r16ZmCbRMMMnTz84xAEzcxCTtADHWTo
         s/EVOc6eDxVJi0W+iI2BWqf7DxieyUQu+Q/6eb+pvOuLPeTe7ARC07j7+Dac55dAwy
         bMtjs52iBKTWFqiuzDi94lRQD8Wt7Wtw6FklrNpUhx88oBKqTKezfdKJrqGjr/5asK
         mDpkT9/isAkvrAI0lCkaiKNYYd9bU36kF0vK0ytpuLUwZ1XYYhaQZ52R1LL73SPaXx
         vgEro8OTy43eKROCw0QqsueFjDO1s5QSYq1YM4db4j11cdqW3Iww+q4yasm7znvD9a
         auoH0Th/o7ecg==
Subject: Re: [PATCH v3 13/13] ARM: imxrt_defconfig: add i.MXRT family
 defconfig
To:     Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-14-Mr.Bossman075@gmail.com>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <95252a9e-76fc-0770-8e7b-90d8755298eb@benettiengineering.com>
Date:   Mon, 29 Nov 2021 02:21:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125211443.1150135-14-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAi2BdKBzFvER8CXLKHgC2XM6/6VRHoxAR/tBiswqmYW0mQhqCtmjQKNqWRuD4mui8piEn5I/2jjKZ/D9Vnci3tvhWQYSyX7GH24EdJVibRckuNGnVN2
 /yKmPltwnGp2dZhkleurTFmqo5YxuwBxxNzFnOKWv1crVfmgoPK1a9tumdbaW9HHAkKQkd83Rx/s51RQ6D5P2uIUvg4ZsZApygMCOFbcnFJNQ28jwDWveSUS
 kQBThNeBUEAd+UmKFo3/JUrx8KPd7ZagebNy/1OHZVLbTDfON8SzxlnBPdgsF/WSF1zcwGm3laRSN+cq6yhbKJ8FDCQYyfWNcHxAqECGjNt+kEXuL1mRfI/B
 tz7JNO34M5oAs1qAoYPsPY4TvPPn3wYgofZHc8niQyshrn8DdMdOW0zjOtMYtLv2cm9w3kG+ZOn8DglreauFFyvgTB5pWzWHF8E/sSFlUrMJu1vfjLB2pv0J
 Erbm3Ew49tTjIlUmgzdQ57+floRrqwaseXO9Tqz4dRwSfRZ40Pnt+vOHLyQjzO4PD4anR5RgL5dQ4TH0fVI4caeLXwmw3fOVdofQg5ZqvQuGifDvPVMbo8Uv
 RTThjMtjZw8bLrS9S1tDIK8NA26awxnIzSmRBPBgcF6QsqrfqIyi2ASRf31VEdCec1EOfto7sdg0pL8FJWN0ZhyTTtAGkXx6HtFlZdlKmz1UYAtjoUZsnOkE
 CCTWOjAwOJgDzLOCBSo19vYJkf2sr+ItQ0YVbISftoanrLmHvt7DMbQTztuhzSll03RbXrGNOYHx3AfX6gjF5gqUT366DHhL+nszoUIwsd+QSaNn1ylve8fO
 Wj+UzUuQGpJZ//qVMT0UVn/fBGRP1FH+E6wys/cpUwg7f3jMnT0vciBbVURX7WP4jLTBg1MUNoQZ8Pruenhjrby+/Rd3mLtt8mCSREbsZkmT2nj6X54l4ob7
 3T7c1kIuMwcAurVZwpzjLXEreSSAFXKNLoPlv9F6qfwRiOnSAi9s4W0Ga5uMz5SE+DgKWmSasskzfPhpUrFn0qaMJtN7LVPwlMoz0gsVHl6vrcBBMMnhVojy
 jWPBXsPPUk4+5OZb5VuVlsAL3BcKwKmXGvJwqMf4KckAitPNHz2ozGIxjX+42UgMTPD/0Q+npbsaoLqqfuR4cmmHi6leJEUFLos=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jesse,

On 25/11/21 22:14, Jesse Taube wrote:
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Add generic i.MXRT family defconfig.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Nothing done
> ---
>   arch/arm/configs/imxrt_defconfig | 157 +++++++++++++++++++++++++++++++
>   1 file changed, 157 insertions(+)
>   create mode 100644 arch/arm/configs/imxrt_defconfig
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
> +CONFIG_NO_HZ=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_BPF_SYSCALL=y
> +CONFIG_PREEMPT_VOLUNTARY=y
> +CONFIG_BSD_PROCESS_ACCT=y
> +CONFIG_BSD_PROCESS_ACCT_V3=y
> +CONFIG_PSI=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_LOG_BUF_SHIFT=18
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
> +CONFIG_SCHED_AUTOGROUP=y
> +CONFIG_RELAY=y
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_EXPERT=y
> +CONFIG_SGETMASK_SYSCALL=y
> +# CONFIG_FUTEX is not set
> +CONFIG_KALLSYMS_ALL=y
> +CONFIG_PC104=y
> +# CONFIG_SLUB_DEBUG is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLAB_FREELIST_RANDOM=y
> +CONFIG_SLAB_FREELIST_HARDENED=y
> +CONFIG_PROFILING=y
> +# CONFIG_MMU is not set
> +CONFIG_ARCH_MXC=y
> +CONFIG_SOC_IMXRT=y
> +# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
> +CONFIG_SET_MEM_PARAM=y
> +CONFIG_DRAM_BASE=0x80000000
> +CONFIG_DRAM_SIZE=0x02000000

While debugging I've found that both CONFIG_DRAM_* get their default 
value because CONFIG_SET_MEM_PARAM is not enabled. This can work but 
leads problems while debugging and in any case those 2 options are 
ignored. So please add on top of them:
CONFIG_SET_MEM_PARAM=y

Thank you
-- 
Giulio Benetti
Benetti Engineering sas

> +CONFIG_HZ_250=y
> +CONFIG_FORCE_MAX_ZONEORDER=14
> +CONFIG_PARAVIRT=y
> +# CONFIG_ATAGS is not set
> +CONFIG_CMDLINE="console=ttyS0 root=/dev/mmcblk0p2 rw earlycon rootwait"
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
> +CONFIG_CMDLINE_PARTITION=y
> +# CONFIG_MQ_IOSCHED_KYBER is not set
> +CONFIG_BINFMT_FLAT=y
> +CONFIG_CLEANCACHE=y
> +CONFIG_ZPOOL=y
> +CONFIG_ZBUD=y
> +CONFIG_Z3FOLD=y
> +CONFIG_UEVENT_HELPER=y
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +# CONFIG_STANDALONE is not set
> +CONFIG_FW_LOADER_USER_HELPER=y
> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> +CONFIG_IMX_WEIM=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_BLK_DEV_RAM_COUNT=1
> +CONFIG_BLK_DEV_RAM_SIZE=65536
> +# CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_SERIO is not set
> +CONFIG_LEGACY_PTY_COUNT=2
> +CONFIG_SERIAL_FSL_LPUART=y
> +CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
> +CONFIG_SERIAL_NONSTANDARD=y
> +CONFIG_SERIAL_DEV_BUS=y
> +CONFIG_TTY_PRINTK=y
> +CONFIG_TTY_PRINTK_LEVEL=7
> +CONFIG_PINCTRL_IMXRT1050=y
> +CONFIG_GPIO_SYSFS=y
> +CONFIG_GPIO_MXC=y
> +# CONFIG_HWMON is not set
> +# CONFIG_HID is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SDHCI_ESDHC_IMX=y
> +CONFIG_DMADEVICES=y
> +CONFIG_FSL_EDMA=y
> +# CONFIG_MX3_IPU is not set
> +# CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
> +CONFIG_MEMORY=y
> +CONFIG_EXT2_FS=y
> +CONFIG_EXT2_FS_XATTR=y
> +CONFIG_EXT2_FS_POSIX_ACL=y
> +CONFIG_EXT2_FS_SECURITY=y
> +CONFIG_EXT3_FS=y
> +CONFIG_EXT3_FS_POSIX_ACL=y
> +CONFIG_EXT3_FS_SECURITY=y
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +CONFIG_QUOTA=y
> +# CONFIG_PRINT_QUOTA_WARNING is not set
> +CONFIG_AUTOFS4_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_FAT_DEFAULT_UTF8=y
> +CONFIG_EXFAT_FS=y
> +CONFIG_CONFIGFS_FS=y
> +# CONFIG_MISC_FILESYSTEMS is not set
> +CONFIG_NLS_DEFAULT="cp437"
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ASCII=y
> +CONFIG_NLS_ISO8859_1=y
> +CONFIG_NLS_UTF8=y
> +CONFIG_LSM="yama,loadpin,integrity,apparmor"
> +# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> +# CONFIG_CRYPTO_HW is not set
> +CONFIG_PRINTK_TIME=y
> +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
> +CONFIG_CONSOLE_LOGLEVEL_QUIET=15
> +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
> +CONFIG_DYNAMIC_DEBUG=y
> +# CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_INFO_DWARF4=y
> +CONFIG_GDB_SCRIPTS=y
> +CONFIG_MAGIC_SYSRQ=y
> +CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x01b6
> +CONFIG_DEBUG_FS=y
> +CONFIG_PAGE_POISONING=y
> +CONFIG_SCHED_STACK_END_CHECK=y
> +CONFIG_SOFTLOCKUP_DETECTOR=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=1
> +# CONFIG_SCHED_DEBUG is not set
> +CONFIG_SCHEDSTATS=y
> +CONFIG_STACKTRACE=y
> +CONFIG_DEBUG_USER=y
> +CONFIG_DEBUG_LL=y
> +CONFIG_DEBUG_UNCOMPRESS=y
> +CONFIG_EARLY_PRINTK=y
> +# CONFIG_RUNTIME_TESTING_MENU is not set
> +CONFIG_MEMTEST=y
> 

