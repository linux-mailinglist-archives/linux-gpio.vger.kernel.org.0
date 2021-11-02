Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 659A244392B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 23:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbhKBXBI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbhKBXA3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 19:00:29 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E86DC079785;
        Tue,  2 Nov 2021 15:57:27 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id bu11so645067qvb.0;
        Tue, 02 Nov 2021 15:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=faYsQkoH+za1MQCwAYJ7NuwAaVZGTQV023m/UbZTbUo=;
        b=M5dKuVvuuSOnbIGPW2WU4MB2VK288BRNL2x2c0n9AmDbt8z5muPFfhuXIVy6zbrkZ5
         wkK2cwfU/Dv0d3Pvtrwe3JhFxJb2vLpnGVvJa3DU2aKRDDVvfl6vg72egHl92wgXPqM+
         /Ts/Nfat3Z6ENW3F3WEeDMuegD71w/92vlAZYUuxetPbYRYDgxOiSxWQs2bKqhuDnp7f
         WNZb4NSKFzFe8Rbf/RKmIhq4jkvOGaGg+OEtFBGuAaTevIucI+BXELir7fETNbB5LaoZ
         SiMPLnA4cnncd4mbGhCHqTEu88AVehICt+4MYAB7dkJnh1mrgev0LuDXatgrE0Fo7i/m
         oXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=faYsQkoH+za1MQCwAYJ7NuwAaVZGTQV023m/UbZTbUo=;
        b=rT/Jsvc2gFwWA9r+upaEd5gxAPy4bPe36PoDGaIW76K3LxxZyJ9qhmXFTbuRk0cYv0
         wZF8Mqklc2D+Mgz6WrPEDKNjyefE6emSIVGbqYR3ec7suRGzUUSWxBFremmOqVnKb2d9
         o7MJepgh/b5K5wQQTPDyl3pz5cx74c09Xgkgd3SqnVHiC1nl5Qguh1p8MYbGz1pvdblq
         S1J5uxsV1XkhjNADoY+/KKX1oIvL0uWxId8AYkzGcC482eES7SGfOl7mDKAIpHlMmv2N
         /pgDso8FQ9y+WPoFB1qxuCo8KirrIDe6jnAUMTLlcU3Wi6ltF5R9oWgcd084yzurPlq7
         gWyw==
X-Gm-Message-State: AOAM5319F6D8Xb6ZnN2LCPgvaQm9MdRShdZK6vouYL6HZVLFR++PlpnK
        SJjBuufG0iDzYtxlTS9E0Jw=
X-Google-Smtp-Source: ABdhPJwpGlv2PFrNgmHP40Uv4ohZC5QvSgu5a75wm5y6HdaTYKB2U49QyDGCNyfI6WDN2yUEzdJ0sw==
X-Received: by 2002:a05:6214:2428:: with SMTP id gy8mr7666266qvb.18.1635893846378;
        Tue, 02 Nov 2021 15:57:26 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:25 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH v2 13/13] ARM: imxrt_defconfig: add i.MXRT family defconfig
Date:   Tue,  2 Nov 2021 18:57:01 -0400
Message-Id: <20211102225701.98944-14-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

Add generic i.MXRT family defconfig.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Nothing done
---
 arch/arm/configs/imxrt_defconfig | 157 +++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 arch/arm/configs/imxrt_defconfig

diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
new file mode 100644
index 000000000000..d673745a5462
--- /dev/null
+++ b/arch/arm/configs/imxrt_defconfig
@@ -0,0 +1,157 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_USELIB=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+CONFIG_PSI=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=18
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_RDMA=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_RELAY=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+CONFIG_SGETMASK_SYSCALL=y
+# CONFIG_FUTEX is not set
+CONFIG_KALLSYMS_ALL=y
+CONFIG_PC104=y
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB_FREELIST_RANDOM=y
+CONFIG_SLAB_FREELIST_HARDENED=y
+CONFIG_PROFILING=y
+# CONFIG_MMU is not set
+CONFIG_ARCH_MXC=y
+CONFIG_SOC_IMXRT=y
+# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0x80000000
+CONFIG_DRAM_SIZE=0x02000000
+CONFIG_HZ_250=y
+CONFIG_FORCE_MAX_ZONEORDER=14
+CONFIG_PARAVIRT=y
+# CONFIG_ATAGS is not set
+CONFIG_CMDLINE="console=ttyS0 root=/dev/mmcblk0p2 rw earlycon rootwait"
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_BLK_DEV_INTEGRITY=y
+CONFIG_BLK_DEV_ZONED=y
+CONFIG_BLK_DEV_THROTTLING=y
+CONFIG_BLK_WBT=y
+CONFIG_BLK_SED_OPAL=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_BSD_DISKLABEL=y
+CONFIG_MINIX_SUBPARTITION=y
+CONFIG_SOLARIS_X86_PARTITION=y
+CONFIG_UNIXWARE_DISKLABEL=y
+CONFIG_LDM_PARTITION=y
+CONFIG_CMDLINE_PARTITION=y
+# CONFIG_MQ_IOSCHED_KYBER is not set
+CONFIG_BINFMT_FLAT=y
+CONFIG_CLEANCACHE=y
+CONFIG_ZPOOL=y
+CONFIG_ZBUD=y
+CONFIG_Z3FOLD=y
+CONFIG_UEVENT_HELPER=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+CONFIG_FW_LOADER_USER_HELPER=y
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
+CONFIG_IMX_WEIM=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=65536
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_LEGACY_PTY_COUNT=2
+CONFIG_SERIAL_FSL_LPUART=y
+CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
+CONFIG_SERIAL_NONSTANDARD=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_TTY_PRINTK=y
+CONFIG_TTY_PRINTK_LEVEL=7
+CONFIG_PINCTRL_IMXRT1050=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_MXC=y
+# CONFIG_HWMON is not set
+# CONFIG_HID is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_ESDHC_IMX=y
+CONFIG_DMADEVICES=y
+CONFIG_FSL_EDMA=y
+# CONFIG_MX3_IPU is not set
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_MEMORY=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT2_FS_SECURITY=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_EXT3_FS_SECURITY=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_QUOTA=y
+# CONFIG_PRINT_QUOTA_WARNING is not set
+CONFIG_AUTOFS4_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_UTF8=y
+CONFIG_EXFAT_FS=y
+CONFIG_CONFIGFS_FS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NLS_DEFAULT="cp437"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_LSM="yama,loadpin,integrity,apparmor"
+# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
+# CONFIG_CRYPTO_HW is not set
+CONFIG_PRINTK_TIME=y
+CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
+CONFIG_CONSOLE_LOGLEVEL_QUIET=15
+CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
+CONFIG_DYNAMIC_DEBUG=y
+# CONFIG_DEBUG_BUGVERBOSE is not set
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF4=y
+CONFIG_GDB_SCRIPTS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x01b6
+CONFIG_DEBUG_FS=y
+CONFIG_PAGE_POISONING=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
+CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=1
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_SCHEDSTATS=y
+CONFIG_STACKTRACE=y
+CONFIG_DEBUG_USER=y
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_UNCOMPRESS=y
+CONFIG_EARLY_PRINTK=y
+# CONFIG_RUNTIME_TESTING_MENU is not set
+CONFIG_MEMTEST=y
-- 
2.33.1

