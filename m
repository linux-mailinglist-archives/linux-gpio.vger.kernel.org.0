Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD69D45E257
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357507AbhKYVVl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 16:21:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhKYVTl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 16:19:41 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53C4C06175C;
        Thu, 25 Nov 2021 13:15:11 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id jo22so5568368qvb.13;
        Thu, 25 Nov 2021 13:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4AThbRggRLPCMV/N3nL2kC8vnyLVdQodJCWqkQnV+Eo=;
        b=Ub/vxMgIEXLhLZHnJdj9JsRdUIPuagf8JYVXMKz1LOifK/6NyGSAr2ZxDwlZ0bKS9W
         JBnYWF8bJSw63RfpZUJqj5lll4ByVEjraZn/XO1pDeLbghvMkFe6S7Upd1bavoNSweJN
         y6fulW7JdzLwvoagHw7jMylYHTF3vPHF4z6fUcWLFG8HgPUag0RX0rQnjcdx+STPBcso
         7gJwMQB2LKGTrPwhZbdp9LtZg1OStE9ZDfSdvwAe8kMjpEOWV3JJVijI8HWH7Pga43Ja
         +IkFlphIQA/UDC6mZVKL79MEwJYxVeI9Z/xT0vL9ac9EJWs0eFP6Xgyuo2cCEi10RFxR
         Vsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4AThbRggRLPCMV/N3nL2kC8vnyLVdQodJCWqkQnV+Eo=;
        b=z0sJ7Fjz39On574aSV+7HJQIi80H9MMhTAZpxZXmO5R2nWo7aRX7NcOteXWi9Y4fo+
         WoDw9QPwDpfO4RODOeJcWSRb5j69y6QJoE/GeETW0uL45hQqnmVE1c1k6FiBWOdvU9z+
         kzEVyJZ6qDuzgE1pUiSVo9bX/oe0O/9w/E8Cm1Z4uWba9iSGYn5B51368ztQyg9Bw990
         vhTrgF3WrBmJ4vvf1S5mwIWvzYWpY3nOjjeuUUN7N0cyHmW3QJeTa7PBWHZyQWzsxxcT
         7XAmZfUXs8PykF/d8TjkderrwSLVjLpXbYc9kymClIQYfSxeNAWUlGf4x6pZ/0HUqZ1r
         DM0g==
X-Gm-Message-State: AOAM5328v5DjEfLsLXVEXCzHnPQNpPZPpB7xtTqtvv488zyC5qtbvMvP
        t1LcXty0b4tkguHkTnvoJWA=
X-Google-Smtp-Source: ABdhPJzD95rpVLiPB9eW9vNdZIvkEDDkYezGCoL70Zp28wCOaWTU2zJdh1O4HXYuJJeHDx5Rp43MOQ==
X-Received: by 2002:a05:6214:c6f:: with SMTP id t15mr21402121qvj.6.1637874910829;
        Thu, 25 Nov 2021 13:15:10 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:15:09 -0800 (PST)
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
Subject: [PATCH v3 13/13] ARM: imxrt_defconfig: add i.MXRT family defconfig
Date:   Thu, 25 Nov 2021 16:14:43 -0500
Message-Id: <20211125211443.1150135-14-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
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
V2->V3:
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
2.34.0

