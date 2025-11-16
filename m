Return-Path: <linux-gpio+bounces-28542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF474C615B7
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 14:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E5704E75BB
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 13:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F42043090DE;
	Sun, 16 Nov 2025 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="wjduVJCQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241524EAB1;
	Sun, 16 Nov 2025 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763299937; cv=none; b=XBbQBb7xFP/iLb1XYl0dX1c8Gccin+W+YIpylU4/2VY/QfdooBx2OjKEedTwf3dZAYOgeVsLjpLNjDC7ObN7FhMbejhtNMOZl/KhdrF1sTiEf9Px5oDPuac6Wtn/YKn82SbPyzt+fNhHtUPcuIKiD0ITgkVj3zSNf8qd4iAa4Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763299937; c=relaxed/simple;
	bh=sTEWVnfpNu3UCbi30XFlqlmRnDudiqFka9q9LDRvQQ8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=Byovz//45Za7YriQ3CZA6n1oyJ5Px+opEvMW8wKzQHnEUG5DXvVSMHZuduL2GYetKKSggQrTeaoZe/j8CnRH9jozMdWu+aMtSnlfN6151vwsy7AjlVSIpqRfKmoY6WasTE1do4VR9AawgiHqgbBBdfBomxvd9X6PXlaBy8ize9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=wjduVJCQ; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1763299918; bh=hQhb2cS2iJSBCXHJyGVOlr51ZR4u4Fr/GSz/7kl0PaI=;
	h=From:To:Cc:Subject:Date;
	b=wjduVJCQwejYnfgwgIDZuaYzvBk3gW6RR5fYW98rNbfUAvxkb+G5YwfljFNrSWMdZ
	 HRykxL8u2DL7vRZ6BMGgwGDDWZz02nfXNZnvUJ4cjEXnI5gVWrC/doKW3fsrxI9r0q
	 J9NdTAmrgKiBA408p5RnhlKE44h4o37BdbiIggXY=
Received: from ubuntu.localdomain ([223.166.202.212])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7AD03EBE; Sun, 16 Nov 2025 21:30:45 +0800
X-QQ-mid: xmsmtpt1763299845tbbnjy8g0
Message-ID: <tencent_12024322A63B8D20AD7AC5764F0EDE8E6609@qq.com>
X-QQ-XMAILINFO: OFNTuNi1bRgMiyP8eWbtKTs1fG+OB7EhdRJimGZv3ok2x0b8/nySFHTZEXV7Er
	 cwbMlbmlUup04KvMsWQcWcuJ4cpaJdUDeQdlgdG7AUN6/CwW8Q2Ug7xKVQ2G2Cq0HDVpQlIy/1l2
	 yhglqMtRiAK2elODwujRCGaG/2d2XzGTO+hhDy6JNmVaICAeG6wWTp1fe2ajN+K0MegE6IpWvRTp
	 upo/JoRuwuGSTOr52ItE/7YSnh/vVssf4alxbjUKf8ckus3m6WwYFlC/jKlSM1H43Ab1TXyXylNv
	 UPEuQ6SaAc5mKh3Osq/IShz56chG3uYAFvn2ppuKia+wdLNCFAJL1vLPey7oUyCYNHqbdLkJDC1A
	 DP/IxqL36rE4wq5RMVBy5ziBKF9vjAG+1glJc5R6yA2jYR3fg+Kyi13HFVwB9pEJJBTLR0ERi9iP
	 QnMfPQpV1aoVwuum5Fm7EP1imOABJwmAXbwexEkGKoZGaaojErUxphX1fQn9bCLeQY7wD9VSJVPW
	 hUrpf67OeSNylcfDhvZ/v4lKFmmUJuNSShGHa6n1LBvcee96KdCxaopAgwSUvVKWem4ILA1kBEHP
	 Hu9SlkYHgHKmWDQqI1S4Ri0QkUtn5hijJv78LFJoWX8kFfGAMGb4nltmxqpMUs24qDmfOLq+ZcGg
	 H/qjtrKu63lpx1c7wg9p7BQ1X5K0CcHDyJ0olWjfAMcUrymJ0ZnLtwq36wv1gm7YogI3vRDnaMIT
	 uitU9wGJxOuStXRjUvuX982/PQ9Na0NEycHQej43KOrZ2WXZhuQ1fqVByWlk1mWT0Pn8wufQcWgj
	 15q4iJ+imbJTkEH0m1Zk3NjxH9Jl8F2XeeEe9bFv4LKq6cFKqhmgZobcXAblB4DIK+m6M/xE3WfH
	 5bjL8V1bZqs1cKRbkw7P7OUUz2RR8+JWyOep5m4lfrD63RDanPAHs1nl8VcGxb0vrYM4Nkf/ykhY
	 +TFtws1m7B8kwonoAjwfP+3Cf3wCoFE9qHbdeZhmIG1r2LHb3dvJVw7vBEQDBYzi+r4YghuD6Hfn
	 MtVIcMDMkJRxGjHNvcqpyJBRvJXq64uvVBY0G+dk6BHzbu4Y9oVVVrMv/4vIzqFj6TFcchWAAyJy
	 6XBq7S
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: 2724853925@qq.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	2724853925@qq.com,
	weisicheng <7855009+weisicheng@user.noreply.gitee.com>
Subject: [PATCH] input: touchscreen: Add ilitek touchscreen driver support
Date: Sun, 16 Nov 2025 21:30:42 +0800
X-OQ-MSGID: <20251116133042.401606-1-2724853925@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: weisicheng <7855009+weisicheng@user.noreply.gitee.com>

Add basic support for Ilitek I2C touchscreen controllers (e.g., ILitek2511, ILitek2701).
This patch includes:
1. Kconfig entry for Ilitek driver configuration
2. Makefile entry to compile the ilitek driver module
3. Core driver files under drivers/input/touchscreen/ilitek/ (I2C communication,
   touch event handling, power management)

The driver is compatible with standard input subsystem and supports:
- Multi-touch detection
- Pressure sensing
- Dynamic power saving mode

Signed-off-by: weisicheng <2724853925@qq.com>
---
 drivers/input/touchscreen/Kconfig             |   13 +
 drivers/input/touchscreen/Makefile            |    1 +
 drivers/input/touchscreen/ilitek/Makefile     |   34 +
 .../input/touchscreen/ilitek/ilitek_common.h  |  264 ++
 .../input/touchscreen/ilitek/ilitek_crypto.c  |  465 +++
 .../input/touchscreen/ilitek/ilitek_crypto.h  |   61 +
 drivers/input/touchscreen/ilitek/ilitek_def.c |  235 ++
 drivers/input/touchscreen/ilitek/ilitek_def.h |  554 +++
 .../input/touchscreen/ilitek/ilitek_main.c    | 2198 ++++++++++
 .../touchscreen/ilitek/ilitek_platform_init.c |  404 ++
 .../touchscreen/ilitek/ilitek_protocol.c      | 3644 +++++++++++++++++
 .../touchscreen/ilitek/ilitek_protocol.h      |  916 +++++
 .../input/touchscreen/ilitek/ilitek_report.c  |  455 ++
 .../input/touchscreen/ilitek/ilitek_report.h  |   78 +
 .../input/touchscreen/ilitek/ilitek_tool.c    | 1156 ++++++
 drivers/input/touchscreen/ilitek/ilitek_ts.h  |  268 ++
 .../input/touchscreen/ilitek/ilitek_update.c  | 1657 ++++++++
 .../input/touchscreen/ilitek/ilitek_update.h  |  199 +
 ...344\272\244\346\265\201\347\250\213 .docx" |  Bin 0 -> 162 bytes
 19 files changed, 12602 insertions(+)
 create mode 100644 drivers/input/touchscreen/ilitek/Makefile
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_common.h
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_crypto.c
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_crypto.h
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_def.c
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_def.h
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_main.c
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_platform_init.c
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_protocol.c
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_protocol.h
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_report.c
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_report.h
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_tool.c
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_ts.h
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_update.c
 create mode 100644 drivers/input/touchscreen/ilitek/ilitek_update.h
 create mode 100644 "drivers/input/touchscreen/ilitek/~$inline \344\273\243\347\240\201\346\217\220\344\272\244\346\265\201\347\250\213 .docx"

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 7d5b72ee07fa..3552629c4d4d 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -515,6 +515,19 @@ config TOUCHSCREEN_ILITEK
 	  To compile this driver as a module, choose M here: the
 	  module will be called ilitek_ts_i2c.
 
+config TOUCHSCREEN_ILI2511
+	tristate "Ilitek I2C or SPI Touch ICs"
+	depends on I2C
+	depends on SPI
+	help
+	  Say Y here if you have touchscreen with ILITEK touch IC,
+	  it supports 213X/23XX/25XX and other Lego series.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ilitek.
+
 config TOUCHSCREEN_IPROC
 	tristate "IPROC touch panel driver support"
 	depends on ARCH_BCM_IPROC || COMPILE_TEST
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index ab9abd151078..3124c4dd8ee1 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
 obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CST816X)	+= hynitron-cst816x.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
 obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
+obj-$(CONFIG_TOUCHSCREEN_ILI2511)	+= ilitek/
 obj-$(CONFIG_TOUCHSCREEN_IMAGIS)	+= imagis.o
 obj-$(CONFIG_TOUCHSCREEN_IMX6UL_TSC)	+= imx6ul_tsc.o
 obj-$(CONFIG_TOUCHSCREEN_INEXIO)	+= inexio.o
diff --git a/drivers/input/touchscreen/ilitek/Makefile b/drivers/input/touchscreen/ilitek/Makefile
new file mode 100644
index 000000000000..c912438a3b3e
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/Makefile
@@ -0,0 +1,34 @@
+ccflags-y += -Wall
+
+ifndef __KERNEL__
+ccflags-y += -D__KERNEL__
+endif
+
+#Un-mark below item to enable FW upgrade on boot
+#ccflags-y += -DILITEK_BOOT_UPDATE
+
+ILITEK_INTERFACE = i2c
+#ILITEK_INTERFACE = spi
+
+
+ifeq ($(ILITEK_INTERFACE), spi)
+$(info start to build ilitek SPI driver)
+ccflags-y += -DILITEK_SPI_INTERFACE
+ilitek := ilitek_spi
+else
+$(info start to build ilitek I2C driver)
+ilitek := ilitek_i2c
+endif
+
+$(ilitek)-objs += \
+	ilitek_def.o \
+	ilitek_main.o \
+	ilitek_platform_init.o \
+	ilitek_update.o \
+	ilitek_tool.o \
+	ilitek_protocol.o \
+	ilitek_crypto.o \
+	ilitek_report.o
+
+obj-$(CONFIG_TOUCHSCREEN_ILI2511) += $(ilitek).o
+
diff --git a/drivers/input/touchscreen/ilitek/ilitek_common.h b/drivers/input/touchscreen/ilitek/ilitek_common.h
new file mode 100644
index 000000000000..7f058c3e4914
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_common.h
@@ -0,0 +1,264 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ILITEK Touch IC driver
+ *
+ * Copyright (C) 2011 ILI Technology Corporation.
+ *
+ * Author: Luca Hsu <luca_hsu@ilitek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#ifndef _ILITEK_COMMON_H_
+#define _ILITEK_COMMON_H_
+/* Includes of headers ------------------------------------------------------*/
+#include <linux/sched.h>
+#include <linux/firmware.h>
+
+#include "ilitek_ts.h"
+#include "ilitek_protocol.h"
+#include "ilitek_update.h"
+
+#include "ilitek_crypto.h"
+#include "ilitek_report.h"
+
+/* Extern define ------------------------------------------------------------*/
+//driver information
+#define DRIVER_VERSION_0				5
+#define DRIVER_VERSION_1				9
+#define DRIVER_VERSION_2				3
+#define DRIVER_VERSION_3				0
+#define CUSTOMER_H_ID					0
+#define CUSTOMER_L_ID					0
+#define TEST_VERSION					0
+
+#define ILITEK_IOCTL_MAX_TRANSFER			5000UL
+
+#define set_arr(arr, idx, val)			\
+	do {					\
+		if ((idx) < ARRAY_SIZE(arr))	\
+			(arr)[(idx)] = (val);	\
+	} while (0)
+
+/* i2c clock rate for rk3288 */
+#if ILITEK_PLAT == ILITEK_PLAT_ROCKCHIP && \
+	KERNEL_VERSION(4, 0, 0) > LINUX_VERSION_CODE
+#define SCL_RATE(rate)	.scl_rate = (rate),
+#else
+#define SCL_RATE(rate)
+#endif
+
+/* netlink */
+#if KERNEL_VERSION(3, 6, 0) <= LINUX_VERSION_CODE
+#define NETLINK_KERNEL_CFG_DECLARE(cfg, func)	\
+	struct netlink_kernel_cfg cfg = {	\
+		.groups = 0,			\
+		.input = func,			\
+	}
+#if KERNEL_VERSION(3, 7, 0) <= LINUX_VERSION_CODE
+#define NETLINK_KERNEL_CREATE(unit, cfg_ptr, func)	\
+	netlink_kernel_create(&init_net, (unit), (cfg_ptr))
+#else
+#define NETLINK_KERNEL_CREATE(unit, cfg_ptr, func)	\
+	netlink_kernel_create(&init_net, (unit), THIS_MODULE, (cfg_ptr))
+#endif
+#else
+#define NETLINK_KERNEL_CFG_DECLARE(cfg, func)
+#define NETLINK_KERNEL_CREATE(unit, cfg_ptr, func)	\
+	netlink_kernel_create(&init_net, (unit), 0, (func), NULL, THIS_MODULE)
+#endif
+
+/* input_dev */
+#if KERNEL_VERSION(3, 7, 0) <= LINUX_VERSION_CODE
+#define INPUT_MT_INIT_SLOTS(dev, num)	\
+		input_mt_init_slots((dev), (num), INPUT_MT_DIRECT)
+#else
+#define INPUT_MT_INIT_SLOTS(dev, num)	input_mt_init_slots((dev), (num))
+#endif
+
+/* file_operations ioctl */
+#if KERNEL_VERSION(2, 6, 36) <= LINUX_VERSION_CODE
+#define FOPS_IOCTL	unlocked_ioctl
+#define FOPS_IOCTL_FUNC(func, cmd, arg) \
+		long func(struct file *fp, cmd, arg)
+#else
+#define FOPS_IOCTL	ioctl
+#define FOPS_IOCTL_FUNC(func, cmd, arg) \
+		s32 func(struct inode *np, struct file *fp,	cmd, arg)
+
+#endif
+
+#if KERNEL_VERSION(6, 3, 0) > LINUX_VERSION_CODE
+#define I2C_PROBE_FUNC(func, client_arg)	\
+	int func(client_arg, const struct i2c_device_id *id)
+#else
+#define I2C_PROBE_FUNC(func, client_arg)	int func(client_arg)
+#endif
+
+#if KERNEL_VERSION(6, 1, 0) > LINUX_VERSION_CODE
+#define REMOVE_FUNC(func, client_arg)	int func(client_arg)
+#define REMOVE_RETURN(val)		({ __typeof__(val) _val = (val); return _val; })
+#else
+#define REMOVE_FUNC(func, client_arg)	void func(client_arg)
+#define REMOVE_RETURN(val)		(val)
+#endif
+
+#if KERNEL_VERSION(6, 4, 0) > LINUX_VERSION_CODE
+#define CLASS_CREATE(name)	class_create(THIS_MODULE, (name))
+#else
+#define CLASS_CREATE(name)	class_create((name))
+#endif
+
+/* procfs */
+#if KERNEL_VERSION(5, 6, 0) > LINUX_VERSION_CODE
+#define PROC_FOPS_T	file_operations
+#define PROC_READ	read
+#define PROC_WRITE	write
+#define PROC_IOCTL		FOPS_IOCTL
+#define PROC_COMPAT_IOCTL	compat_ioctl
+#define PROC_OPEN	open
+#define PROC_RELEASE	release
+#else
+#define PROC_FOPS_T	proc_ops
+#define PROC_READ	proc_read
+#define PROC_WRITE	proc_write
+#define PROC_IOCTL		proc_ioctl
+#define PROC_COMPAT_IOCTL	proc_compat_ioctl
+#define PROC_OPEN	proc_open
+#define PROC_RELEASE	proc_release
+#endif
+
+#ifdef MTK_UNDTS
+#define ISR_FUNC(func)	void func(void)
+#define ISR_RETURN(val)
+#else
+#define ISR_FUNC(func)	irqreturn_t func(int irq, void *dev_id)
+#define ISR_RETURN(val)	({ __typeof__(val) _val = (val); return _val; })
+#endif
+
+enum ilitek_irq_handle_type {
+	irq_type_normal = 0,
+	irq_type_debug,
+	irq_type_c_model,
+};
+
+struct ilitek_ts_data {
+	void *client;
+	struct device *device;
+	struct ilitek_ts_device *dev;
+
+	/* should > 2K for C-Model */
+	u8 buf[4096];
+
+	struct input_dev *input_dev;
+	struct input_dev *pen_input_dev;
+	struct regulator *vdd;
+	struct regulator *vdd_i2c;
+	struct regulator *vcc_io;
+
+	int irq;
+	int irq_gpio;
+	int reset_gpio;
+	int test_gpio;
+
+	bool system_suspend;
+	bool power_key_triggered;
+
+	u8 irq_trigger_type;
+
+	bool is_touched;
+	bool touch_key_hold_press;
+	int touch_flag[40];
+
+#if 0
+	struct notifier_block fb_notif;
+#elif defined(CONFIG_HAS_EARLYSUSPEND)
+	struct early_suspend early_suspend;
+#endif
+
+	struct task_struct *update_thread;
+
+	atomic_t firmware_updating;
+	bool operation_protection;
+	bool unhandle_irq;
+	unsigned int irq_handle_type;
+	unsigned int irq_read_len;
+
+	u8 gesture_status;
+	u8 low_power_status;
+
+	bool esd_check;
+	bool esd_skip;
+	struct workqueue_struct *esd_workq;
+	struct delayed_work esd_work;
+	unsigned long esd_delay;
+
+	/* Mutex for protecting concurrent access */
+	struct mutex ilitek_mutex;
+
+	atomic_t irq_enabled;
+	atomic_t get_INT;
+
+	bool wake_irq_enabled;
+
+	bool irq_registered;
+};
+
+/* Extern macro -------------------------------------------------------------*/
+
+#define CEIL(n, d) (((n) % (d)) ? ((n) / (d)) + 1 : ((n) / (d)))
+
+/* Extern variables ---------------------------------------------------------*/
+
+extern u8 driver_ver[];
+
+extern struct ilitek_ts_data *ts;
+
+#ifdef ILITEK_TUNING_MESSAGE
+extern bool ilitek_debug_flag;
+#endif
+/* Extern function prototypes -----------------------------------------------*/
+/* Extern functions ---------------------------------------------------------*/
+void ilitek_resume(void);
+void ilitek_suspend(void);
+int ilitek_main_probe(void *client, struct device *dev);
+int ilitek_main_remove(void *client);
+void ilitek_reset(int delay);
+
+int ilitek_write(u8 *cmd, int len);
+int ilitek_read(u8 *buf, int len);
+int ilitek_write_and_read(u8 *cmd, int w_len, int delay_ms,
+			  u8 *buf, int r_len);
+
+void ilitek_irq_enable(void);
+void ilitek_irq_disable(void);
+
+int ilitek_upgrade_firmware(char *filename);
+
+int ilitek_create_tool_node(void);
+int ilitek_remove_tool_node(void);
+
+int ilitek_create_sysfsnode(void);
+void ilitek_remove_sys_node(void);
+
+int ilitek_netlink_init(u8 unit);
+void ilitek_netlink_exit(void);
+
+void ilitek_gpio_dbg(void);
+
+void ilitek_register_gesture(struct ilitek_ts_data *ts, bool init);
+void __maybe_unused ilitek_gesture_handle(bool touch, int idx, int x, int y);
+
+int ilitek_create_esd_check_workqueue(void);
+void ilitek_remove_esd_check_workqueue(void);
+
+int ilitek_read_data_and_report(void);
+
+#endif
diff --git a/drivers/input/touchscreen/ilitek/ilitek_crypto.c b/drivers/input/touchscreen/ilitek/ilitek_crypto.c
new file mode 100644
index 000000000000..2ba6105266d2
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_crypto.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is part of ILITEK CommonFlow
+ *
+ * Copyright (c) 2022 ILI Technology Corp.
+ * Copyright (c) 2022 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (c) 2022 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#include "ilitek_crypto.h"
+
+/*
+ * The lookup-tables are marked const so they can be placed in read-only storage instead of RAM
+ * The numbers below can be computed dynamically trading ROM for RAM -
+ * This can be useful in (embedded) bootloader applications, where ROM is often limited.
+ */
+static const u8 sbox[256] = {
+	0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5,
+	0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
+	0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0,
+	0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
+	0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc,
+	0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
+	0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a,
+	0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
+	0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0,
+	0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
+	0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b,
+	0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
+	0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85,
+	0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
+	0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5,
+	0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
+	0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17,
+	0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
+	0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88,
+	0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
+	0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c,
+	0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
+	0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9,
+	0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
+	0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6,
+	0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
+	0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e,
+	0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
+	0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94,
+	0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
+	0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68,
+	0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16 };
+
+static const u8 rsbox[256] = {
+	0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38,
+	0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb,
+	0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87,
+	0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb,
+	0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d,
+	0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e,
+	0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2,
+	0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25,
+	0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16,
+	0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92,
+	0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda,
+	0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84,
+	0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a,
+	0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06,
+	0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02,
+	0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b,
+	0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea,
+	0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73,
+	0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85,
+	0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e,
+	0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89,
+	0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b,
+	0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20,
+	0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4,
+	0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31,
+	0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f,
+	0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d,
+	0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef,
+	0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0,
+	0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61,
+	0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26,
+	0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d };
+
+/*
+ * The round constant word array, contains the values given by
+ * x to the power (i-1) being powers of x (x is denoted as {02}) in the field GF(2^8)
+ */
+static const u8 rcon[11] = {
+	0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36 };
+
+/* array holding the intermediate results during decryption. */
+typedef u8 state_t[4][4];
+
+struct crypto_aes_ctx {
+	u8 key_dec[240];
+};
+
+static u8 xtime(u8 x)
+{
+	return ((x << 1) ^ (((x >> 7) & 1) * 0x1b));
+}
+
+static void inv_shift_rows(state_t *state)
+{
+	u8 tmp;
+
+	/* Rotate first row 1 columns to right */
+	tmp = (*state)[3][1];
+	(*state)[3][1] = (*state)[2][1];
+	(*state)[2][1] = (*state)[1][1];
+	(*state)[1][1] = (*state)[0][1];
+	(*state)[0][1] = tmp;
+
+	/* Rotate second row 2 columns to right */
+	tmp = (*state)[0][2];
+	(*state)[0][2] = (*state)[2][2];
+	(*state)[2][2] = tmp;
+	tmp = (*state)[1][2];
+	(*state)[1][2] = (*state)[3][2];
+	(*state)[3][2] = tmp;
+
+	/* Rotate third row 3 columns to right */
+	tmp = (*state)[0][3];
+	(*state)[0][3] = (*state)[1][3];
+	(*state)[1][3] = (*state)[2][3];
+	(*state)[2][3] = (*state)[3][3];
+	(*state)[3][3] = tmp;
+}
+
+static void inv_sub_bytes(state_t *state)
+{
+	u8 i, j;
+
+	for (i = 0; i < 4; ++i)
+		for (j = 0; j < 4; ++j)
+			(*state)[j][i] = rsbox[(*state)[j][i]];
+}
+
+/*
+ * multiply is used to multiply numbers in the field GF(2^8)
+ * Note: The last call to xtime() is unneeded, but often ends up generating a smaller binary
+ *       The compiler seems to be able to vectorize the operation better this way.
+ *       See https://github.com/kokke/tiny-AES-c/pull/34
+ */
+static u8 multiply(u8 x, u8 y)
+{
+	return (((y & 1) * x) ^
+		(((y >> 1) & 1) * xtime(x)) ^
+		(((y >> 2) & 1) * xtime(xtime(x))) ^
+		(((y >> 3) & 1) * xtime(xtime(xtime(x)))) ^
+		(((y >> 4) & 1) * xtime(xtime(xtime(xtime(x))))));
+}
+
+/*
+ * inv_mix_cols function mixes the columns of the state matrix.
+ */
+static void inv_mix_cols(state_t *state)
+{
+	int i;
+	u8 a, b, c, d;
+
+	for (i = 0; i < 4; ++i) {
+		a = (*state)[i][0];
+		b = (*state)[i][1];
+		c = (*state)[i][2];
+		d = (*state)[i][3];
+
+		(*state)[i][0] = multiply(a, 0x0e) ^ multiply(b, 0x0b) ^
+			multiply(c, 0x0d) ^ multiply(d, 0x09);
+		(*state)[i][1] = multiply(a, 0x09) ^ multiply(b, 0x0e) ^
+			multiply(c, 0x0b) ^ multiply(d, 0x0d);
+		(*state)[i][2] = multiply(a, 0x0d) ^ multiply(b, 0x09) ^
+			multiply(c, 0x0e) ^ multiply(d, 0x0b);
+		(*state)[i][3] = multiply(a, 0x0b) ^ multiply(b, 0x0d) ^
+			multiply(c, 0x09) ^ multiply(d, 0x0e);
+	}
+}
+
+/*
+ * This function adds the round key to state.
+ * The round key is added to the state by an XOR function.
+ */
+static void add_round_key(u8 round, state_t *state, const u8 *key)
+{
+	u8 i, j;
+
+	for (i = 0; i < 4; ++i)
+		for (j = 0; j < 4; ++j)
+			(*state)[i][j] ^= key[(round * Nb * 4) + (i * Nb) + j];
+}
+
+static void aes_decrypt(state_t *state, const u8 *key)
+{
+	u8 round;
+
+	/* Add the first round key to the state before starting the rounds. */
+	add_round_key(Nr, state, key);
+
+	/*
+	 * There will be Nr rounds.
+	 * The first Nr-1 rounds are identical.
+	 * These Nr rounds are executed in the loop below.
+	 * Last one without InvMixColumn()
+	 */
+	for (round = Nr - 1; ; --round) {
+		inv_shift_rows(state);
+		inv_sub_bytes(state);
+		add_round_key(round, state, key);
+
+		if (!round)
+			break;
+
+		inv_mix_cols(state);
+	}
+}
+
+/*
+ * Produces Nb(Nr+1) round keys, used in each round to decrypt the states.
+ */
+static void aes_expandkey(u8 *round_key, const u8 *key)
+{
+	unsigned int i, j, k;
+	u8 tmp_a[4];
+	u8 tmp_b;
+
+	/* The first round key is the key itself. */
+	for (i = 0; i < Nk; ++i) {
+		round_key[(i * 4) + 0] = key[(i * 4) + 0];
+		round_key[(i * 4) + 1] = key[(i * 4) + 1];
+		round_key[(i * 4) + 2] = key[(i * 4) + 2];
+		round_key[(i * 4) + 3] = key[(i * 4) + 3];
+	}
+
+	/* All other round keys are found from the previous round keys. */
+	for (i = Nk; i < Nb * (Nr + 1); ++i) {
+		k = (i - 1) * 4;
+		tmp_a[0] = round_key[k + 0];
+		tmp_a[1] = round_key[k + 1];
+		tmp_a[2] = round_key[k + 2];
+		tmp_a[3] = round_key[k + 3];
+
+		if (!(i % Nk)) {
+			/*
+			 * Shifts the 4 bytes in a word to the left once.
+			 * [a0,a1,a2,a3] becomes [a1,a2,a3,a0]
+			 */
+			tmp_b = tmp_a[0];
+			tmp_a[0] = tmp_a[1];
+			tmp_a[1] = tmp_a[2];
+			tmp_a[2] = tmp_a[3];
+			tmp_a[3] = tmp_b;
+
+			tmp_a[0] = sbox[tmp_a[0]];
+			tmp_a[1] = sbox[tmp_a[1]];
+			tmp_a[2] = sbox[tmp_a[2]];
+			tmp_a[3] = sbox[tmp_a[3]];
+
+			tmp_a[0] = tmp_a[0] ^ rcon[i / Nk];
+		}
+
+		j = i * 4;
+		k = (i - Nk) * 4;
+		round_key[j + 0] = round_key[k + 0] ^ tmp_a[0];
+		round_key[j + 1] = round_key[k + 1] ^ tmp_a[1];
+		round_key[j + 2] = round_key[k + 2] ^ tmp_a[2];
+		round_key[j + 3] = round_key[k + 3] ^ tmp_a[3];
+	}
+}
+
+u8 crypto_key[AES_KEY_LEN] = { 0x0, 0x1, 0x2, 0x3,
+			       0x4, 0x5, 0x6, 0x7,
+			       0x8, 0x9, 0xa, 0xb,
+			       0xc, 0xd, 0xe, 0xf };
+
+u8 crypto_iv[AES_KEY_LEN] = { 0x0, 0x1, 0x2, 0x3,
+			      0x4, 0x5, 0x6, 0x7,
+			      0x8, 0x9, 0xa, 0xb,
+			      0xc, 0xd, 0xe, 0xf };
+
+void ilitek_decrypt(u8 *buf, u32 len)
+{
+	u8 key[AES_KEY_LEN];
+	u8 iv[AES_KEY_LEN];
+	u8 *tmp = buf;
+	u8 iv_tmp[AES_KEY_LEN];
+	struct crypto_aes_ctx ctx;
+
+	u32 i, j;
+
+	memcpy(key, crypto_key, AES_KEY_LEN);
+	memcpy(iv, crypto_iv, AES_KEY_LEN);
+
+	aes_expandkey(ctx.key_dec, key);
+
+	for (i = 0; i < len; i += AES_KEY_LEN, tmp += AES_KEY_LEN) {
+		memcpy(iv_tmp, tmp, AES_KEY_LEN);
+
+		aes_decrypt((state_t *)tmp, ctx.key_dec);
+		for (j = 0; j < AES_KEY_LEN; j++)
+			tmp[j] ^= iv[j];
+
+		memcpy(iv, iv_tmp, AES_KEY_LEN);
+	}
+}
+
+static void sha256_init(struct sha256_ctx *ctx)
+{
+	ctx->datalen = 0;
+	ctx->bitlen[0] = 0;
+	ctx->bitlen[1] = 0;
+
+	/*
+	 * 8 hash value for sha256
+	 * square root of prime number 2,3,5,7,11,13,17,19
+	 * then take 32 bit numbers after the decimal point
+	 */
+	ctx->state[0] = 0x6a09e667;
+	ctx->state[1] = 0xbb67ae85;
+	ctx->state[2] = 0x3c6ef372;
+	ctx->state[3] = 0xa54ff53a;
+	ctx->state[4] = 0x510e527f;
+	ctx->state[5] = 0x9b05688c;
+	ctx->state[6] = 0x1f83d9ab;
+	ctx->state[7] = 0x5be0cd19;
+}
+
+static void sha256_transform(struct sha256_ctx *ctx, u8 *data)
+{
+	static u32 key[64] = {
+		0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
+		0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
+		0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
+		0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
+		0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
+		0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
+		0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
+		0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
+		0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
+		0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
+		0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
+		0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
+		0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
+		0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
+		0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
+		0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
+	};
+
+	u32 a, b, c, d, e, f, g, h, i, j, t1, t2, m[64];
+
+	for (i = 0, j = 0; i < 16; ++i, j += 4)
+		m[i] = (data[j] << 24) | (data[j + 1] << 16) | (data[j + 2] << 8) | (data[j + 3]);
+
+	for (; i < 64; ++i)
+		m[i] = SIG1(m[i - 2]) + m[i - 7] + SIG0(m[i - 15]) + m[i - 16];
+
+	a = ctx->state[0];
+	b = ctx->state[1];
+	c = ctx->state[2];
+	d = ctx->state[3];
+	e = ctx->state[4];
+	f = ctx->state[5];
+	g = ctx->state[6];
+	h = ctx->state[7];
+
+	for (i = 0; i < 64; ++i) {
+		t1 = h + EP1(e) + CH(e, f, g) + key[i] + m[i];
+		t2 = EP0(a) + MAJ(a, b, c);
+		h = g;
+		g = f;
+		f = e;
+		e = d + t1;
+		d = c;
+		c = b;
+		b = a;
+		a = t1 + t2;
+	}
+
+	ctx->state[0] += a;
+	ctx->state[1] += b;
+	ctx->state[2] += c;
+	ctx->state[3] += d;
+	ctx->state[4] += e;
+	ctx->state[5] += f;
+	ctx->state[6] += g;
+	ctx->state[7] += h;
+}
+
+static void sha256_update(struct sha256_ctx *ctx, u8 byte)
+{
+	ctx->data[ctx->datalen] = byte;
+	ctx->datalen++;
+	if (ctx->datalen == 64) {
+		sha256_transform(ctx, ctx->data);
+		DBL_INT_ADD(ctx->bitlen[0], ctx->bitlen[1], 512);
+		ctx->datalen = 0;
+	}
+}
+
+static void sha256_final(struct sha256_ctx *ctx, u8 *hash)
+{
+	u32 i;
+
+	i = ctx->datalen;
+
+	/* Pad whatever data is left in the buffer. */
+	if (ctx->datalen < 56) {
+		ctx->data[i++] = 0x80;
+		while (i < 56)
+			ctx->data[i++] = 0x00;
+	} else {
+		ctx->data[i++] = 0x80;
+		while (i < 64)
+			ctx->data[i++] = 0x00;
+		sha256_transform(ctx, ctx->data);
+		memset(ctx->data, 0, 56);
+	}
+
+	/* Append to the padding the total message's length in bits and transform. */
+	DBL_INT_ADD(ctx->bitlen[0], ctx->bitlen[1], ctx->datalen * 8);
+	ctx->data[63] = ctx->bitlen[0];
+	ctx->data[62] = ctx->bitlen[0] >> 8;
+	ctx->data[61] = ctx->bitlen[0] >> 16;
+	ctx->data[60] = ctx->bitlen[0] >> 24;
+	ctx->data[59] = ctx->bitlen[1];
+	ctx->data[58] = ctx->bitlen[1] >> 8;
+	ctx->data[57] = ctx->bitlen[1] >> 16;
+	ctx->data[56] = ctx->bitlen[1] >> 24;
+	sha256_transform(ctx, ctx->data);
+
+	/*
+	 * Since this implementation uses little endian byte ordering and SHA uses big endian,
+	 * reverse all the bytes when copying the final state to the output hash.
+	 */
+	for (i = 0; i < 4; ++i) {
+		hash[i] = (ctx->state[0] >> (24 - i * 8)) & 0x000000ff;
+		hash[i + 4] = (ctx->state[1] >> (24 - i * 8)) & 0x000000ff;
+		hash[i + 8] = (ctx->state[2] >> (24 - i * 8)) & 0x000000ff;
+		hash[i + 12] = (ctx->state[3] >> (24 - i * 8)) & 0x000000ff;
+		hash[i + 16] = (ctx->state[4] >> (24 - i * 8)) & 0x000000ff;
+		hash[i + 20] = (ctx->state[5] >> (24 - i * 8)) & 0x000000ff;
+		hash[i + 24] = (ctx->state[6] >> (24 - i * 8)) & 0x000000ff;
+		hash[i + 28] = (ctx->state[7] >> (24 - i * 8)) & 0x000000ff;
+	}
+}
+
+void get_sha256(u32 start, u32 end, u8 *buf, u32 buf_size, u8 sha256[32])
+{
+	struct sha256_ctx ctx;
+	u32 i;
+
+	sha256_init(&ctx);
+
+	if (end >= buf_size || start > buf_size || end < start) {
+		TP_ERR(NULL, "start/end addr: %#x/%#x buf size: %#x OOB\n", start, end, buf_size);
+		return;
+	}
+
+	for (i = start; i <= end && i < buf_size; i++)
+		sha256_update(&ctx, buf[i]);
+
+	sha256_final(&ctx, sha256);
+
+	TP_MSG_ARR(NULL, "sha256:", TYPE_U8, 32, sha256);
+}
diff --git a/drivers/input/touchscreen/ilitek/ilitek_crypto.h b/drivers/input/touchscreen/ilitek/ilitek_crypto.h
new file mode 100644
index 000000000000..ef01ca434776
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_crypto.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file is part of ILITEK CommonFlow
+ *
+ * Copyright (c) 2022 ILI Technology Corp.
+ * Copyright (c) 2022 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (c) 2022 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#ifndef __ILITEK_CRYPTO_H__
+#define __ILITEK_CRYPTO_H__
+
+#include "ilitek_def.h"
+
+#define Nb	(4)
+#define Nk	(4)       /* The number of 32 bit words in a key. */
+#define Nr	(10)      /* The number of rounds in AES Cipher. */
+
+#define AES_KEY_LEN      (16) /* Key length in bytes */
+
+extern u8 crypto_key[AES_KEY_LEN];
+extern u8 crypto_iv[AES_KEY_LEN];
+
+#define DBL_INT_ADD(a, b, c)			\
+	do {					\
+		if ((a) > 0xffffffff - (c))	\
+			++(b);			\
+		(a) += (c);			\
+	} while (0)
+
+#define ROTLEFT(a, b)	(((a) << (b)) | ((a) >> (32 - (b))))
+#define ROTRIGHT(a, b)	(((a) >> (b)) | ((a) << (32 - (b))))
+
+#define CH(x, y, z) (((x) & (y)) ^ (~(x) & (z)))
+#define MAJ(x, y, z) (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))
+#define EP0(x) (ROTRIGHT(x, 2) ^ ROTRIGHT(x, 13) ^ ROTRIGHT(x, 22))
+#define EP1(x) (ROTRIGHT(x, 6) ^ ROTRIGHT(x, 11) ^ ROTRIGHT(x, 25))
+#define SIG0(x) (ROTRIGHT(x, 7) ^ ROTRIGHT(x, 18) ^ ((x) >> 3))
+#define SIG1(x) (ROTRIGHT(x, 17) ^ ROTRIGHT(x, 19) ^ ((x) >> 10))
+
+struct sha256_ctx {
+	u8 data[64];
+	u32 datalen;
+	u32 bitlen[2];
+	u32 state[8];
+};
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+void __DLL ilitek_decrypt(u8 *buf, u32 len);
+
+void __DLL get_sha256(u32 start, u32 end,
+		      u8 *buf, u32 buf_size, u8 sha256[32]);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/drivers/input/touchscreen/ilitek/ilitek_def.c b/drivers/input/touchscreen/ilitek/ilitek_def.c
new file mode 100644
index 000000000000..e9934cac240d
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_def.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is part of ILITEK CommonFlow
+ *
+ * Copyright (c) 2022 ILI Technology Corp.
+ * Copyright (c) 2022 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (c) 2022 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#include "ilitek_def.h"
+
+int tp_log_level = log_level_msg;
+bool tp_print_en = true;
+FILE *tp_fp;
+
+char g_str[4096];
+msg_t g_msg;
+
+#if defined(__KERNEL__) || defined(__UEFI_DXE__)
+
+int get_time_ms(u32 *t_ms)
+{
+	*t_ms = 0;
+
+	return -EINVAL;
+}
+
+#else
+#ifdef _WIN32
+
+static int gettimeofday(struct timeval *tp, void *tzp)
+{
+	time_t clock;
+	struct tm tm;
+	SYSTEMTIME wtm;
+
+	GetLocalTime(&wtm);
+	tm.tm_year = wtm.wYear - 1900;
+	tm.tm_mon = wtm.wMonth - 1;
+	tm.tm_mday = wtm.wDay;
+	tm.tm_hour = wtm.wHour;
+	tm.tm_min = wtm.wMinute;
+	tm.tm_sec = wtm.wSecond;
+	tm.tm_isdst = -1;
+	clock = mktime(&tm);
+	tp->tv_sec = (long)clock;
+	tp->tv_usec = wtm.wMilliseconds * 1000;
+	return 0;
+}
+
+#endif
+
+int get_time_ms(u32 *t_ms)
+{
+	static u32 time_ms_init;
+	struct timeval t;
+	u32 time_ms;
+
+	gettimeofday(&t, NULL);
+	time_ms = t.tv_sec * 1000 + t.tv_usec / 1000;
+	time_ms_init = (!time_ms_init) ? time_ms : time_ms_init;
+
+	*t_ms = time_ms - time_ms_init;
+
+	return 0;
+}
+
+#endif
+
+void tp_log_arr(char *id, int level, const char *header, const char *tag,
+		int type, int len, void *buf)
+{
+	const int num = 64;
+	int i, idx = 0;
+	u32 time_ms;
+	int error;
+
+	if (level > tp_log_level || !buf)
+		return;
+
+	error = get_time_ms(&time_ms);
+
+	do {
+		_memset(g_str, 0, sizeof(g_str));
+
+		if (!error)
+			_sprintf(g_str, 0, "[%7u.%03u]",
+				time_ms / 1000, time_ms % 1000);
+
+		if (id)
+			_sprintf(g_str, _strlen(g_str),
+				 PFMT_C8 "[" PFMT_C8 "] " PFMT_C8 " ",
+				 header, id, tag);
+		else
+			_sprintf(g_str, _strlen(g_str),
+				 PFMT_C8 " " PFMT_C8 " ",
+				 header, tag);
+
+		for (i = 0; i < num && idx < len; i++, idx++) {
+			switch (type) {
+			default:
+			case TYPE_U8:
+				_sprintf(g_str, _strlen(g_str), "%02x-",
+					((u8 *)buf)[idx]);
+				break;
+			case TYPE_INT:
+				_sprintf(g_str, _strlen(g_str), "%d-",
+					((int *)buf)[idx]);
+				break;
+			}
+		}
+		_sprintf(g_str, _strlen(g_str) - 1, ", len: [%d/%d]\n",
+			idx, len);
+
+		if (tp_print_en)
+			TP_PRINTF(PFMT_C8, g_str);
+		if (g_msg)
+			g_msg(level, g_str);
+		TP_LOG(tp_fp, g_str);
+	} while (idx < len);
+}
+
+int queue_init(struct queue *q, u32 item_size, u32 max_items)
+{
+	int error = 0;
+
+	MUTEX_INIT(q->mutex);
+
+	MUTEX_LOCK(q->mutex);
+
+	do {
+		q->item_size = item_size;
+		q->curr_size = 0;
+		q->max_size = max_items;
+
+		q->buf = (u8 *)CALLOC(max_items, item_size);
+		if (!q->buf) {
+			error = -ENOMEM;
+			break;
+		}
+
+		q->push_ptr = q->buf;
+		q->pop_ptr = q->buf;
+		q->end_ptr = q->buf + (max_items - 1) * item_size;
+	} while (false);
+
+	MUTEX_UNLOCK(q->mutex);
+
+	return error;
+}
+
+void queue_exit(struct queue *q)
+{
+	if (q->buf)
+		CFREE(q->buf);
+	MUTEX_EXIT(q->mutex);
+}
+
+void queue_push(struct queue *q)
+{
+	MUTEX_LOCK(q->mutex);
+
+	/* Stop push data when queue is full */
+	if (q->curr_size >= q->max_size)
+		goto release_push_lock;
+
+	q->curr_size++;
+	if (q->push_ptr == q->end_ptr)
+		q->push_ptr = q->buf;
+	else
+		q->push_ptr += q->item_size;
+
+	if (q->push_ptr == q->pop_ptr)
+		TP_ERR(NULL, "[Warn]Queue overload, queue size: %u\n", q->curr_size);
+
+release_push_lock:
+	MUTEX_UNLOCK(q->mutex);
+}
+
+void queue_pop(struct queue *q)
+{
+	MUTEX_LOCK(q->mutex);
+
+	if (!q->curr_size)
+		goto release_pop_lock;
+
+	q->curr_size--;
+	if (q->pop_ptr == q->end_ptr)
+		q->pop_ptr = q->buf;
+	else
+		q->pop_ptr += q->item_size;
+
+release_pop_lock:
+	MUTEX_UNLOCK(q->mutex);
+}
+
+void set_print_en(bool enable)
+{
+	tp_print_en = enable;
+}
+
+void set_log_level(int level)
+{
+	tp_log_level = level;
+}
+
+int set_log_fopen(WCHAR *filename)
+{
+	int error;
+
+	if (tp_fp)
+		return -EINVAL;
+
+	error = WFOPEN(&tp_fp, filename, "w+");
+	if (error < 0) {
+		tp_fp = NULL;
+		return error;
+	}
+
+	return 0;
+}
+
+void set_log_fclose(void)
+{
+	if (!tp_fp)
+		return;
+
+	_fclose(tp_fp);
+	tp_fp = NULL;
+}
+
+void set_log_fwrite(char *str)
+{
+	TP_LOG(tp_fp, str);
+}
diff --git a/drivers/input/touchscreen/ilitek/ilitek_def.h b/drivers/input/touchscreen/ilitek/ilitek_def.h
new file mode 100644
index 000000000000..d6f2077d7760
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_def.h
@@ -0,0 +1,554 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file is part of ILITEK CommonFlow
+ *
+ * Copyright (c) 2022 ILI Technology Corp.
+ * Copyright (c) 2022 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (c) 2022 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#ifndef __ILITEK_DEF_H__
+#define __ILITEK_DEF_H__
+
+#define COMMONFLOW_CODE_VERSION		0x00000301
+
+/*
+ * Windows
+ */
+#ifdef _WIN32
+#include <windows.h>
+#include <time.h>
+#include <fcntl.h>
+#include <io.h>
+
+#define __MAYBE_UNUSED
+
+#ifdef _WINDLL
+#define __DLL __declspec(dllexport)
+#else
+#define __DLL __declspec(dllimport)
+#endif
+
+#define __PACKED__
+
+#define _sprintf(buf, idx, fmt, ...)	\
+	sprintf_s((buf) + (idx), sizeof((buf)) - (idx), (fmt), ##__VA_ARGS__)
+#define _strncpy(dst, src, n, dst_size)	strncpy_s((dst), (dst_size), (src), (n))
+#define _strcasecmp(l, r)		_stricmp((l), (r))
+#define _strcat(dst, src, dst_size)	strcat_s((dst), (dst_size), (src))
+#define _sscanf(str, fmt, ...)		sscanf_s(str, fmt, ##__VA_ARGS__)
+#define _strlen(str)			strlen((str))
+#define _strcpy(dst, src, dst_size)	strcpy_s((dst), (dst_size), (src))
+#define _strtok(str, del, next_token)	strtok_s((str), (del), (next_token))
+
+#define _memset(ptr, ch, size)		memset((ptr), (ch), (size))
+#define _memcpy(dst, src, size)		memcpy((dst), (src), (size))
+
+#define _WTEXT(str)			L ## str
+#define WTEXT(str)			_WTEXT(str)
+#define WCHAR				wchar_t
+#define WSTRING				wstring
+#define WCSCPY(dst, src, dst_size)	wcscpy_s((dst), (dst_size), (src))
+#define WCSCASECMP(str, tag)		_wcsicmp((str), (L##tag))
+#define WCSRCHR(str, ch)		wcsrchr((str), (ch))
+#define SWPRINTF(buf, size, fmt, ...)	\
+	swprintf_s((buf), (size), (fmt), ##__VA_ARGS__)
+#define WFOPEN(pfp, filename, mode)					\
+	((!((*(pfp)) = _wfsopen((filename), (const wchar_t *)(L##mode), \
+				_SH_DENYWR))) ? -EFAULT : 0)
+#define WACCESS(filename, mode)		_waccess((filename), (mode))
+#define WFPRINTF(fp, fmt, ...)					\
+	do {							\
+		fflush((fp));					\
+		_setmode(_fileno((fp)), _O_U8TEXT);		\
+		fwprintf((fp), (fmt), ##__VA_ARGS__);		\
+		fflush((fp));					\
+		_setmode(_fileno((fp)), _O_TEXT);		\
+	} while (false)
+
+#define PFMT_C16			"%ls"
+#define PFMT_C8				"%hs"
+
+#include <codecvt>
+#define TO_WCHAR(x)	\
+	std::wstring_convert < std::codecvt_utf8 < wchar_t >, wchar_t > ().from_bytes(x).c_str()
+
+#define _localtime(ptm, ptime)		localtime_s((ptm), (ptime))
+
+#define _fopen(pfp, filename, mode)	\
+	(fopen_s((pfp), (filename), (const char *)(mode)))
+#define _fclose(pfp)			fclose((pfp))
+
+#define MUTEX_T				HANDLE
+#define MUTEX_INIT(x)			((x) = CreateMutex(NULL, false, NULL))
+#define MUTEX_LOCK(x)			(WaitForSingleObject((x), INFINITE))
+#define MUTEX_UNLOCK(x)			(ReleaseMutex((x)))
+#define MUTEX_EXIT(x)			(CloseHandle((x)))
+
+#include <stddef.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdarg.h>
+
+#define MALLOC(size)		malloc(size)
+#define CALLOC(num, size)	calloc(num, size)
+#define FREE(ptr)		\
+	do {			\
+		free((ptr));	\
+		(ptr) = NULL;	\
+	} while (0)
+#define CFREE(ptr)		FREE(ptr)
+
+/*
+ * UEFI Driver
+ */
+#elif defined(__UEFI_DXE__)
+#include <Library/BaseLib.h>
+#include <Library/BaseMemoryLib.h>
+#include <Library/DebugLib.h>
+#include <Library/PrintLib.h>
+
+#define UEFI_MAX_STR_SIZE	0x1000
+
+#define __MAYBE_UNUSED	__maybe_unused
+#define __DLL
+#define __PACKED__	__packed
+
+#define _sprintf(buf, idx, fmt, ...)	\
+	AsciiSPrint((buf) + (idx), sizeof((buf)) - (idx), (fmt), ##__VA_ARGS__)
+#define _strncpy(dst, src, n, dst_size) \
+	AsciiStrnCpyS(dst, dst_size, src, (UINTN)n)
+#define _strcasecmp(l, r)		AsciiStriCmp((l), (r))
+#define _strcat(dst, src, dst_size)	\
+	AsciiStrCatS((dst), (dst_size), (src))
+#define _sscanf(str, fmt, ...)
+#define _strlen(str)			AsciiStrnLenS((str), UEFI_MAX_STR_SIZE)
+#define _strcpy(dst, src, dst_size)	\
+	_strncpy((dst), (src), _strlen(src), (dst_size))
+#define _strtok(str, del, next_token)
+
+static __MAYBE_UNUSED char *_strrchr(const char *s, char c)
+{
+	char *found = NULL;
+
+	do {
+		if (*s == c)
+			found = (char *)s;
+	} while (*s++ != '\0');
+
+	return found;
+}
+
+#define _memset(ptr, ch, size)		\
+	SetMem((ptr), (UINTN)(size), (UINT8)(ch))
+#define _memcpy(dst, src, size)		\
+	CopyMem((dst), (src), (UINTN)(size))
+
+#define _WTEXT(str)			L ## str
+#define WTEXT(str)			_WTEXT(str)
+#define WCHAR				char
+#define WSTRING				string
+#define WCSCPY(dst, src, dst_size)	_strcpy((dst), (src), (dst_size))
+#define WCSCASECMP(str, tag)		_strcasecmp((str), (tag))
+#define WCSRCHR(str, ch)		_strrchr((str), (ch))
+#define SWPRINTF(buf, size, fmt, ...)	\
+	sprintf((buf), (fmt), ##__VA_ARGS__)
+#define WFOPEN(pfp, filename, mode)	(-EINVAL)
+#define WACCESS(filename, mode)		(-EINVAL)
+#define WFPRINTF(fp, fmt, ...)
+#define TO_WCHAR(x)			(x)
+
+#define PFMT_C16			"%a"
+#define PFMT_C8				"%a"
+#define PFMT_U8				"%u"
+#define PFMT_U16			"%u"
+#define PFMT_X8				"%02x"
+#define PFMT_X16			"%04x"
+#define PFMT_X64			"%016llx"
+
+#define _localtime(ptm, ptime)
+#define _fclose(pfp)
+
+#define MUTEX_T				void *
+#define MUTEX_INIT(x)
+#define MUTEX_LOCK(x)
+#define MUTEX_UNLOCK(x)
+#define MUTEX_EXIT(x)
+
+#include <stddef.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdarg.h>
+
+#include <Uefi.h>
+#include <Library/DebugLib.h>
+#include <Library/MemoryAllocationLib.h>
+
+#define MALLOC(size)		AllocatePool(size)
+#define CALLOC(num, size)	AllocateZeroPool(num * size)
+#define FREE(ptr)			\
+	do {				\
+		FreePool((ptr));	\
+		(ptr) = NULL;		\
+	} while (0)
+
+#define CFREE(ptr)		FREE(ptr)
+#define TP_PRINTF(fmt, ...)	DebugPrint(DEBUG_INFO, fmt, ##__VA_ARGS__)
+#define TP_LOG(fp, str)
+
+/*
+ * Linux-Based System
+ */
+#else
+
+#define __MAYBE_UNUSED	__maybe_unused
+#define __DLL
+#define __PACKED__	__packed
+#define _sprintf(buf, idx, fmt, ...)	sprintf((buf) + (idx), (fmt), ##__VA_ARGS__)
+#define _strncpy(dst, src, n, dst_size) strncpy((dst), (src), (n))
+#define _strcasecmp(l, r)		strcasecmp((l), (r))
+#define _strcat(dst, src, dst_size)	strcat((dst), (src))
+#define _sscanf(str, fmt, ...)		sscanf(str, fmt, ##__VA_ARGS__)
+#define _strlen(str)			strlen((str))
+#define _strcpy(dst, src, dst_size)	strcpy((dst), (src))
+
+#define _memset(ptr, ch, size)		memset((ptr), (ch), (size))
+#define _memcpy(dst, src, size)		memcpy((dst), (src), (size))
+
+#define WTEXT(str)			str
+#define WCHAR				char
+#define WSTRING				string
+#define WCSCPY(dst, src, dst_size)	_strcpy((dst), (src), (dst_size))
+#define WCSCASECMP(str, tag)		_strcasecmp((str), (tag))
+#define WCSRCHR(str, ch)		strrchr((str), (ch))
+#define SWPRINTF(buf, size, fmt, ...)	\
+	sprintf((buf), (fmt), ##__VA_ARGS__)
+#define WFOPEN(pfp, filename, mode)	_fopen(pfp, filename, mode)
+#define WACCESS(filename, mode)		_access((filename), (mode))
+#define WFPRINTF(fp, fmt, ...)		fprintf((fp), (fmt), ##__VA_ARGS__)
+#define TO_WCHAR(x)			(x)
+
+#define PFMT_C16			"%s"
+#define PFMT_C8				"%s"
+
+#define _localtime(ptm, ptime)						\
+		do {							\
+			struct tm *__tm__;				\
+									\
+			__tm__ = localtime((ptime));			\
+			_memcpy((ptm), __tm__, sizeof(struct tm));	\
+		} while (false)
+
+#ifdef __KERNEL__
+#define FILE				void
+#define _fopen(pfp, filename, mode)	(-EINVAL)
+#define _fclose(pfp)
+#define _access(filename, mode)		(-EINVAL)
+
+#define _strtok(str, del, next_token)
+
+#include <linux/spinlock.h>
+#define MUTEX_T				spinlock_t
+#define MUTEX_INIT(x)			spin_lock_init(&(x))
+#define MUTEX_LOCK(x)			spin_lock(&(x))
+#define MUTEX_UNLOCK(x)			spin_unlock(&(x))
+#define MUTEX_EXIT(x)
+
+#include <linux/kernel.h>
+#include <linux/vmalloc.h>
+#include <linux/slab.h>
+
+#define MALLOC(size)		kmalloc(size, GFP_KERNEL)
+#define CALLOC(num, size)	vmalloc(num * size)
+#define FREE(ptr)		\
+	do {			\
+		kfree((ptr));	\
+		(ptr) = NULL;	\
+	} while (0)
+#define CFREE(ptr)		\
+	do {			\
+		vfree((ptr));	\
+		(ptr) = NULL;	\
+	} while (0)
+
+#define TP_PRINTF(fmt, ...)	printk(fmt, ##__VA_ARGS__)
+#define TP_LOG(fp, str)
+
+#else
+#include <sys/time.h>
+#include <unistd.h>
+
+#define _fopen(pfp, filename, mode)	\
+	((!((*(pfp)) = fopen((filename), (mode)))) ? -EFAULT : 0)
+#define _fclose(pfp)			fclose((pfp))
+#define _access(filename, mode)		access((filename), (mode))
+
+#define _strtok(str, del, next_token)	strtok((str), (del))
+
+#ifdef __UEFI_APP__
+#define MUTEX_T				void *
+#define MUTEX_INIT(x)
+#define MUTEX_LOCK(x)
+#define MUTEX_UNLOCK(x)
+#define MUTEX_EXIT(x)
+#else
+#include <pthread.h>
+#define MUTEX_T				pthread_mutex_t
+#define MUTEX_INIT(x)			(pthread_mutex_init(&(x), NULL))
+#define MUTEX_LOCK(x)			(pthread_mutex_lock(&(x)))
+#define MUTEX_UNLOCK(x)			(pthread_mutex_unlock(&(x)))
+#define MUTEX_EXIT(x)			(pthread_mutex_destroy(&(x)))
+#endif
+
+#include <stddef.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdarg.h>
+
+#define MALLOC(size)		malloc(size)
+#define CALLOC(num, size)	calloc(num, size)
+#define FREE(ptr)		\
+	do {			\
+		free((ptr));	\
+		(ptr) = NULL;	\
+	} while (0)
+#define CFREE(ptr)		FREE(ptr)
+
+#ifdef __ANDROID__
+#include <android/log.h>
+#define TP_PRINTF(fmt, ...)							\
+	__android_log_print(ANDROID_LOG_INFO, "ILITEK COMMON", "[%s][%d]" fmt,	\
+			    __func__, __LINE__, ##__VA_ARGS__)
+#endif
+
+#endif /* __KERNEL__ */
+
+#endif /* _WIN32 */
+
+#define U82U64(byte, order)	\
+	((u64)((u64)(byte) << ((order) * 8)))
+
+#ifndef PFMT_C16
+#define PFMT_C16			"%ls"
+#endif
+#ifndef PFMT_C8
+#define PFMT_C8				"%hs"
+#endif
+#ifndef PFMT_U8
+#define PFMT_U8				"%hhu"
+#endif
+#ifndef PFMT_U16
+#define PFMT_U16			"%hu"
+#endif
+#ifndef PFMT_X8
+#define PFMT_X8				"%hhx"
+#endif
+#ifndef PFMT_X16
+#define PFMT_X16			"%hx"
+#endif
+
+#ifndef PFMT_X64
+#define PFMT_X64			"%llx"
+#endif
+
+#ifndef TP_PRINTF
+#define TP_PRINTF(fmt, ...)				\
+	do {						\
+		printf(fmt, ##__VA_ARGS__);		\
+		fflush(stdout);				\
+	} while (0)
+#endif
+
+#ifndef TP_LOG
+#define TP_LOG(fp, str)				\
+	do {					\
+		if (!fp)			\
+			break;			\
+		fprintf((fp), PFMT_C8, (str));	\
+		fflush((fp));			\
+	} while (0)
+#endif
+
+#ifndef TP_PRINT
+#define TP_PRINT(_id, level, need_tag, tag, fmt, ...)			\
+	do {								\
+		char *__id__ = (_id);					\
+		u32 __time_ms__;					\
+									\
+		if (level > tp_log_level)				\
+			break;						\
+									\
+		g_str[0] = '\0';					\
+									\
+		if (need_tag) {						\
+			if (!get_time_ms(&__time_ms__))			\
+				_sprintf(g_str, _strlen(g_str),		\
+					"[%7u.%03u]",			\
+					__time_ms__ / 1000,		\
+					__time_ms__ % 1000);		\
+			_sprintf(g_str, _strlen(g_str), PFMT_C8, tag);	\
+		}							\
+									\
+		if (__id__) {						\
+			_sprintf(g_str, _strlen(g_str),			\
+				 "[" PFMT_C8 "] " fmt,			\
+				 __id__, ##__VA_ARGS__);		\
+		} else {						\
+			_sprintf(g_str, _strlen(g_str), " " fmt,	\
+				 ##__VA_ARGS__);			\
+		}							\
+									\
+		if (tp_print_en)					\
+			TP_PRINTF(PFMT_C8, g_str);			\
+		if (g_msg)						\
+			g_msg(level, g_str);				\
+		TP_LOG(tp_fp, g_str);					\
+	} while (0)
+#endif
+
+#ifndef DIV_ROUND_UP
+#define DIV_ROUND_UP(n, d)	(((n) + (d) - 1) / (d))
+#endif
+
+#ifndef UNUSED
+#define UNUSED(x)		((void)(x))
+#endif
+
+#ifndef ARRAY_SIZE
+#define ARRAY_SIZE(a)		((sizeof(a) / sizeof(*(a))))
+#endif
+
+#ifndef MIN
+#define MIN(l, r)		(((l) > (r)) ? (r) : (l))
+#endif
+
+#ifndef MAX
+#define MAX(l, r)		(((l) > (r)) ? (l) : (r))
+#endif
+
+#define EILICOMM		200
+#define EILIBUSY		201
+#define EILITIME		202
+#define EILIPROTO		203
+
+enum ilitek_log_level {
+	log_level_none = -1,	/* no log displayed */
+	log_level_err = 0,	/* critical errors */
+	log_level_warn,		/* warnings */
+	log_level_tag,		/* special-required tags */
+	log_level_info,		/* important/UI messages */
+	log_level_msg,		/* non-important messages */
+	log_level_dbg,		/* debugging messages */
+	log_level_pkt,		/* tx/rx packets */
+
+	log_level_max,		/* sentinel */
+};
+
+#define _TP_ERR(fmt, ...)	\
+	TP_PRINT(NULL, log_level_err, false, "", fmt, ##__VA_ARGS__)
+#define _TP_WARN(fmt, ...)	\
+	TP_PRINT(NULL, log_level_warn, false, "", fmt, ##__VA_ARGS__)
+#define _TP_TAG(fmt, ...)	\
+	TP_PRINT(NULL, log_level_tag, false, "", fmt, ##__VA_ARGS__)
+#define _TP_INFO(fmt, ...)	\
+	TP_PRINT(NULL, log_level_info, false, "", fmt, ##__VA_ARGS__)
+#define _TP_MSG(fmt, ...)	\
+	TP_PRINT(NULL, log_level_msg, false, "", fmt, ##__VA_ARGS__)
+#define _TP_DBG(fmt, ...)	\
+	TP_PRINT(NULL, log_level_dbg, false, "", fmt, ##__VA_ARGS__)
+#define _TP_PKT(fmt, ...)	\
+	TP_PRINT(NULL, log_level_pkt, false, "", fmt, ##__VA_ARGS__)
+
+
+#define TP_ERR(id, fmt, ...)	\
+	TP_PRINT(id, log_level_err, true, "[ILITEK][ERR]", fmt, ##__VA_ARGS__)
+#define TP_WARN(id, fmt, ...)	\
+	TP_PRINT(id, log_level_warn, true, "[ILITEK][WARN]", fmt, ##__VA_ARGS__)
+#define TP_TAG(id, fmt, ...)	\
+	TP_PRINT(id, log_level_tag, true, "[ILITEK][TAG]", fmt, ##__VA_ARGS__)
+#define TP_INFO(id, fmt, ...)	\
+	TP_PRINT(id, log_level_info, true, "[ILITEK][INFO]", fmt, ##__VA_ARGS__)
+#define TP_MSG(id, fmt, ...)	\
+	TP_PRINT(id, log_level_msg, true, "[ILITEK][MSG]", fmt, ##__VA_ARGS__)
+#define TP_DBG(id, fmt, ...)	\
+	TP_PRINT(id, log_level_dbg, true, "[ILITEK][DBG]", fmt, ##__VA_ARGS__)
+#define TP_PKT(id, fmt, ...)	\
+	TP_PRINT(id, log_level_pkt, true, "[ILITEK][PKT]", fmt, ##__VA_ARGS__)
+
+enum ilitek_array_type {
+	TYPE_U8 = 0,
+	TYPE_INT,
+	TYPE_U32,
+};
+
+#define TP_ERR_ARR(id, tag, type, len, buf) \
+	tp_log_arr(id, log_level_err, "[ILITEK][ERR]", tag, type, len, buf)
+#define TP_WARN_ARR(id, tag, type, len, buf) \
+	tp_log_arr(id, log_level_warn, "[ILITEK][WARN]", tag, type, len, buf)
+#define TP_TAG_ARR(id, tag, type, len, buf) \
+	tp_log_arr(id, log_level_tag, "[ILITEK][TAG]", tag, type, len, buf)
+#define TP_INFO_ARR(id, tag, type, len, buf) \
+	tp_log_arr(id, log_level_info, "[ILITEK][INFO]", tag, type, len, buf)
+#define TP_MSG_ARR(id, tag, type, len, buf) \
+	tp_log_arr(id, log_level_msg, "[ILITEK][MSG]", tag, type, len, buf)
+#define TP_DBG_ARR(id, tag, type, len, buf) \
+	tp_log_arr(id, log_level_dbg, "[ILITEK][DBG]", tag, type, len, buf)
+#define TP_PKT_ARR(id, tag, type, len, buf) \
+	tp_log_arr(id, log_level_pkt, "[ILITEK][PKT]", tag, type, len, buf)
+
+extern int tp_log_level;
+extern bool tp_print_en;
+extern char g_str[4096];
+extern FILE *tp_fp;
+
+typedef void (*msg_t)(int, char *);
+extern msg_t g_msg;
+
+struct queue {
+	u32 curr_size;
+	u32 max_size;
+	u8 *buf;
+	u8 *push_ptr;
+	u8 *pop_ptr;
+	u8 *end_ptr;
+	u32 item_size;
+
+	MUTEX_T mutex;
+};
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+void __DLL tp_log_arr(char *id, int level, const char *header,
+		      const char *tag, int type, int len, void *buf);
+
+int __DLL get_time_ms(u32 *t_ms);
+void __DLL set_print_en(bool enable);
+void __DLL set_log_level(int level);
+int __DLL set_log_fopen(WCHAR *filename);
+void __DLL set_log_fclose(void);
+void __DLL set_log_fwrite(char *str);
+
+int queue_init(struct queue *q, u32 item_size, u32 max_items);
+void queue_exit(struct queue *q);
+void queue_push(struct queue *q);
+void queue_pop(struct queue *q);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/drivers/input/touchscreen/ilitek/ilitek_main.c b/drivers/input/touchscreen/ilitek/ilitek_main.c
new file mode 100644
index 000000000000..9bb1fe6aa4b7
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_main.c
@@ -0,0 +1,2198 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ILITEK Touch IC driver
+ *
+ * Copyright (C) 2011 ILI Technology Corporation.
+ *
+ * Author: Luca Hsu <luca_hsu@ilitek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include "ilitek_ts.h"
+#include "ilitek_common.h"
+
+struct ilitek_ts_data *ts;
+
+u8 driver_ver[] = {
+	DRIVER_VERSION_0, DRIVER_VERSION_1, DRIVER_VERSION_2, DRIVER_VERSION_3,
+	CUSTOMER_H_ID, CUSTOMER_L_ID, TEST_VERSION,
+};
+
+static bool checksum_failed_release = ILITEK_CHECKSUM_FAILED_RELEASE;
+module_param(checksum_failed_release, bool, 0664);
+MODULE_PARM_DESC(checksum_failed_release,
+		 "When packet's checksum is wrong, (default)release all touch point or ignore the packet");
+
+
+#if ILITEK_PLAT == ILITEK_PLAT_MTK
+extern struct tpd_device *tpd;
+#ifdef ILITEK_ENABLE_DMA
+static u8 *I2CDMABuf_va;
+static dma_addr_t I2CDMABuf_pa;
+#endif
+#endif
+
+#if defined(ILITEK_WAKELOCK_SUPPORT)
+struct wake_lock ilitek_wake_lock;
+#endif
+
+#ifdef ILITEK_TUNING_MESSAGE
+static struct sock *ilitek_netlink_sock;
+bool ilitek_debug_flag;
+static u_int ilitek_pid = 100, ilitek_seq = 23;
+#endif
+
+static void __maybe_unused ilitek_udp_reply(void *payload, int size)
+{
+#ifdef ILITEK_TUNING_MESSAGE
+	struct sk_buff *skb;
+	struct nlmsghdr *nlh;
+	int len = NLMSG_SPACE(size);
+	int ret;
+	int pid = ilitek_pid, seq = ilitek_seq;
+
+	TP_DBG(NULL, "[%s] ilitek_debug_flag: %d\n", __func__, ilitek_debug_flag);
+	if (!ilitek_debug_flag)
+		return;
+
+	skb = alloc_skb(len, GFP_ATOMIC);
+	if (!skb) {
+		TP_ERR(NULL, "alloc skb error\n");
+		return;
+	}
+
+	nlh = nlmsg_put(skb, pid, seq, 0, size, 0);
+	if (!nlh)
+		goto nlmsg_failure;
+
+	nlh->nlmsg_flags = 0;
+	memcpy(NLMSG_DATA(nlh), payload, size);
+
+	NETLINK_CB(skb).portid = 0;	/* from kernel */
+	NETLINK_CB(skb).dst_group = 0;	/* unicast */
+
+	ret = netlink_unicast(ilitek_netlink_sock, skb, pid, MSG_DONTWAIT);
+	if (ret < 0)
+		TP_ERR(NULL, "ilitek send failed, ret: %d\n", ret);
+	return;
+
+nlmsg_failure:
+	kfree_skb(skb);
+
+#endif /* ILITEK_TUNING_MESSAGE */
+}
+
+static void __maybe_unused udp_receive(struct sk_buff *skb)
+{
+#ifdef ILITEK_TUNING_MESSAGE
+	int count = 0, ret = 0, i = 0;
+	u8 *data;
+	struct nlmsghdr *nlh;
+
+	nlh = (struct nlmsghdr *)skb->data;
+	ilitek_pid = NETLINK_CREDS(skb)->pid;
+	ilitek_seq = nlh->nlmsg_seq;
+
+	TP_DBG(NULL, "netlink received, pid: %d, seq: %d\n",
+		     ilitek_pid, ilitek_seq);
+
+	data = (u8 *) NLMSG_DATA(nlh);
+	count = nlmsg_len(nlh);
+	if (!strcmp(data, "Open!")) {
+		TP_MSG(NULL, "data is :%s\n", (char *)data);
+		ts->operation_protection = true;
+		ilitek_udp_reply(data, sizeof("Open!"));
+	} else if (!strcmp(data, "Close!")) {
+		TP_MSG(NULL, "data is :%s\n", (char *)data);
+		ts->operation_protection = false;
+	} else if (!strcmp(data, "Wifi_Paint_Start") ||
+		   !strcmp(data, "Daemon_Debug_Start")) {
+		ilitek_debug_flag = true;
+	} else if (!strcmp(data, "Wifi_Paint_End") ||
+		   !strcmp(data, "Daemon_Debug_End")) {
+		ilitek_debug_flag = false;
+	}
+
+
+	TP_DBG(NULL, "count = %d  data[count -3] = %d data[count -2] = %c\n",
+	       count, data[count - 3], data[count - 2]);
+	for (i = 0; i < count; i++)
+		//TP_MSG(NULL, "data[%d] = 0x%x\n", i, data[i]);
+	if (data[count - 2] == 'I' && (count == 20 || count == 52) &&
+	    data[0] == 0x77 && data[1] == 0x77) {
+		TP_DBG(NULL, "IOCTL_WRITE CMD = %d\n", data[2]);
+		switch (data[2]) {
+		case 13:
+			//ilitek_irq_enable();
+			TP_MSG(NULL, "ilitek_irq_enable. do nothing\n");
+			break;
+		case 12:
+			//ilitek_irq_disable();
+			TP_MSG(NULL, "ilitek_irq_disable. do nothing\n");
+			break;
+		case 19:
+			ilitek_reset(ts->dev->reset_time);
+			break;
+		case 21:
+			TP_MSG(NULL, "ilitek The ilitek_debug_flag = %d.\n", data[3]);
+			if (data[3] == 0)
+				ilitek_debug_flag = false;
+			else if (data[3] == 1)
+				ilitek_debug_flag = true;
+			break;
+		case 15:
+			if (data[3] == 0) {
+				ilitek_irq_disable();
+				TP_DBG(NULL, "ilitek_irq_disable.\n");
+			} else {
+				ilitek_irq_enable();
+				TP_DBG(NULL, "ilitek_irq_enable.\n");
+			}
+			break;
+		case 16:
+			ts->operation_protection = data[3];
+			TP_MSG(NULL, "ts->operation_protection = %d\n", ts->operation_protection);
+			break;
+		case 8:
+			TP_MSG(NULL, "get driver version\n");
+			ilitek_udp_reply(driver_ver, 7);
+			break;
+		case 18:
+			TP_DBG(NULL, "firmware update write 33 bytes data\n");
+			ret = ilitek_write(&data[3], 33);
+			if (ret < 0)
+				TP_ERR(NULL, "i2c write error, ret %d\n", ret);
+			if (ret < 0)
+				data[0] = 1;
+			else
+				data[0] = 0;
+			ilitek_udp_reply(data, 1);
+			return;
+		default:
+			return;
+		}
+	} else if (data[count - 2] == 'W') {
+		ret = ilitek_write(data, count - 2);
+		if (ret < 0)
+			TP_ERR(NULL, "i2c write error, ret %d\n", ret);
+		if (ret < 0)
+			data[0] = 1;
+		else
+			data[0] = 0;
+		ilitek_udp_reply(data, 1);
+	} else if (data[count - 2] == 'R') {
+		ret = ilitek_read(data, count - 2);
+		if (ret < 0)
+			TP_ERR(NULL, "i2c read error, ret %d\n", ret);
+		if (ret < 0)
+			data[count - 2] = 1;
+		else
+			data[count - 2] = 0;
+		ilitek_udp_reply(data, count - 1);
+	}
+#endif /* ILITEK_TUNING_MESSAGE */
+}
+
+static void ilitek_esd_check(struct work_struct *work)
+{
+	int retry = 3;
+	static bool is_first_run = true;
+	static u32 protocol_ver;
+
+	/*
+	 * update protocol version at the first run
+	 */
+	if (is_first_run) {
+		is_first_run = false;
+		protocol_ver = ts->dev->protocol.ver;
+		TP_MSG(NULL, "[ESD] firstly loading protocol ver: %x as ref.\n",
+			protocol_ver);
+	}
+
+	if (ts->operation_protection || ts->esd_skip) {
+		TP_MSG(NULL, "[ESD] operation_protection: %hhu, esd_skip: %hhu\n",
+			ts->operation_protection, ts->esd_skip);
+		goto skip_return;
+	}
+
+	mutex_lock(&ts->ilitek_mutex);
+
+	for (; retry-- > 0;) {
+		if (api_protocol_set_cmd(ts->dev, GET_PTL_VER, NULL) < 0) {
+			TP_ERR(NULL, "[ESD] i2c comm. failed\n");
+			continue;
+		}
+
+		if (protocol_ver != ts->dev->protocol.ver) {
+			TP_ERR(NULL, "unexpected ptl ver (referance)%x vs. %x\n",
+				protocol_ver, ts->dev->protocol.ver);
+			continue;
+		}
+
+		goto pass_return;
+	}
+
+	ilitek_reset(ts->dev->reset_time);
+
+pass_return:
+	mutex_unlock(&ts->ilitek_mutex);
+
+skip_return:
+	queue_delayed_work(ts->esd_workq, &ts->esd_work, ts->esd_delay);
+}
+
+void ilitek_irq_enable(void)
+{
+	if (!ts->irq_registered)
+		return;
+
+	if (atomic_read(&ts->irq_enabled))
+		return;
+
+#ifdef MTK_UNDTS
+	mt_eint_unmask(CUST_EINT_TOUCH_PANEL_NUM);
+#else
+	enable_irq(ts->irq);
+#endif
+
+	atomic_set(&ts->irq_enabled, 1);
+}
+
+void ilitek_irq_disable(void)
+{
+	if (!ts->irq_registered)
+		return;
+
+	if (!atomic_read(&ts->irq_enabled))
+		return;
+
+#ifdef MTK_UNDTS
+	mt_eint_mask(CUST_EINT_TOUCH_PANEL_NUM);
+#else
+	disable_irq_nosync(ts->irq);
+#endif
+
+	atomic_set(&ts->irq_enabled, 0);
+}
+
+#ifdef ILITEK_ENABLE_DMA
+static int ilitek_dma_i2c_read(u8 *buf, int len)
+{
+	struct i2c_client *client = (struct i2c_client *)ts->client;
+	int err;
+
+
+	if (len < 8) {
+		client->ext_flag = client->ext_flag & (~I2C_DMA_FLAG);
+		return i2c_master_recv(client, buf, len);
+	}
+
+	client->ext_flag = client->ext_flag | I2C_DMA_FLAG;
+	err = i2c_master_recv(client, (u8 *)I2CDMABuf_pa, len);
+	if (err < 0)
+		return err;
+
+	memcpy(buf, I2CDMABuf_va, len);
+
+	return 0;
+}
+
+static int ilitek_dma_i2c_write(u8 *cmd, int len)
+{
+	struct i2c_client *client = (struct i2c_client *)ts->client;
+
+	if (len <= 8) {
+		client->ext_flag = client->ext_flag & (~I2C_DMA_FLAG);
+		return i2c_master_send(client, cmd, len);
+	}
+
+	memcpy(I2CDMABuf_va, cmd, len);
+
+	client->ext_flag = client->ext_flag | I2C_DMA_FLAG;
+
+	return i2c_master_send(client, (u8 *)I2CDMABuf_pa, len);
+}
+#endif
+
+static int ilitek_i2c_transfer(struct i2c_msg *msgs, int cnt)
+{
+	int err = 0;
+	struct i2c_client *client = (struct i2c_client *)ts->client;
+	int count = ILITEK_I2C_RETRY_COUNT;
+
+#ifdef ILITEK_ENABLE_DMA
+	int i;
+
+	for (i = 0; i < cnt; i++) {
+		count = ILITEK_I2C_RETRY_COUNT;
+		while (count-- >= 0) {
+			msgs[i].ext_flag = 0;
+			if (msgs[i].flags == I2C_M_RD)
+				err = ilitek_dma_i2c_read(msgs[i].buf, msgs[i].len);
+			else if (!msgs[i].flags)
+				err = ilitek_dma_i2c_write(msgs[i].buf, msgs[i].len);
+
+			if (err < 0) {
+				TP_ERR(NULL, "i2c[0x%hx] dma tx/rx failed, err: %d\n",
+					msgs[i].addr, err);
+				mdelay(20);
+				continue;
+			}
+
+			break;
+		}
+	}
+#else
+	while (count-- >= 0) {
+		err = i2c_transfer(client->adapter, msgs, cnt);
+		if (err < 0) {
+			TP_ERR(NULL, "i2c[0x%hx] tx/rx failed, err: %d\n",
+				msgs[0].addr, err);
+			mdelay(20);
+			continue;
+		}
+		break;
+	}
+#endif
+
+	return err;
+}
+
+static int __maybe_unused ilitek_i2c_write_and_read(u8 *cmd, int w_len,
+						    int delay_ms, u8 *buf,
+						    int r_len)
+{
+	int error;
+
+	/*
+	 * Default ILITEK_BL_ADDR. is firstly used.
+	 * if communication failed, change between BL addr. and
+	 * other addr. defined by DTS, then retry.
+	 */
+	static unsigned short addr = ILITEK_BL_ADDR;
+	struct i2c_client *client = (struct i2c_client *)ts->client;
+	struct i2c_msg msgs[2] = {
+		{.addr = addr, .flags = 0, .len = w_len,
+		 .buf = cmd, SCL_RATE(400000)},
+		{.addr = addr, .flags = I2C_M_RD, .len = r_len,
+		 .buf = buf, SCL_RATE(400000)}
+	};
+
+	/*
+	 * IMPORTANT: If I2C repeat start is required, please check with ILITEK.
+	 */
+	if (w_len > 0 && r_len > 0 && !delay_ms) {
+		if (ilitek_i2c_transfer(msgs, 2) < 0) {
+			/* try another i2c addr. (default: 0x41) */
+			addr = (addr == ILITEK_BL_ADDR) ?
+				client->addr : ILITEK_BL_ADDR;
+			msgs[0].addr = msgs[1].addr = addr;
+
+			return ilitek_i2c_transfer(msgs, 2);
+		}
+
+		return 0;
+	}
+
+	if (w_len > 0 && ilitek_i2c_transfer(msgs, 1) < 0) {
+		/* try another i2c addr. (default: 0x41) */
+		addr = (addr == ILITEK_BL_ADDR) ? client->addr : ILITEK_BL_ADDR;
+		msgs[0].addr = msgs[1].addr = addr;
+
+		error = ilitek_i2c_transfer(msgs, 1);
+		if (error < 0)
+			return error;
+	}
+
+	if (delay_ms > 0)
+		mdelay(delay_ms);
+
+	if (r_len > 0 && ilitek_i2c_transfer(msgs + 1, 1) < 0) {
+		/* try another i2c addr. (default: 0x41) */
+		addr = (addr == ILITEK_BL_ADDR) ? client->addr : ILITEK_BL_ADDR;
+		msgs[0].addr = msgs[1].addr = addr;
+
+		return ilitek_i2c_transfer(msgs + 1, 1);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused ilitek_i2c_write(u8 *cmd, int len)
+{
+	return ilitek_i2c_write_and_read(cmd, len, 0, NULL, 0);
+}
+
+static int __maybe_unused ilitek_i2c_read(u8 *buf, int len)
+{
+	return ilitek_i2c_write_and_read(NULL, 0, 0, buf, len);
+}
+
+static int __maybe_unused ilitek_spi_write_and_read(u8 *cmd, int w_len,
+						    int delay_ms, u8 *buf,
+						    int r_len)
+{
+	int error = 0;
+	u8 *wbuf, *rbuf;
+	struct spi_device *spi = (struct spi_device *)ts->client;
+	struct spi_transfer xfer = {
+		.len = r_len + 4,
+		.speed_hz = ((struct spi_device *)ts->client)->max_speed_hz,
+	};
+	struct spi_message msg;
+
+	if (w_len > 0 && r_len > 0) {
+		error = ilitek_spi_write_and_read(cmd, w_len, delay_ms,
+						  NULL, 0);
+		if (error < 0)
+			return error;
+
+		return ilitek_spi_write_and_read(NULL, 0, 0, buf, r_len);
+	}
+
+	wbuf = CALLOC(4096, sizeof(u8));
+	rbuf = CALLOC(4096, sizeof(u8));
+
+	if (!wbuf || !rbuf) {
+		error = -ENOMEM;
+		goto exit;
+	}
+
+	xfer.tx_buf = wbuf;
+	xfer.rx_buf = rbuf;
+
+	wbuf[1] = 0xAA;
+
+	/* wbuf[0] set as 0x83 for spi data read */
+	if (r_len > 0) {
+		wbuf[0] = 0x83;
+		memset(wbuf + 2, 0, xfer.len - 2);
+
+		spi_message_init(&msg);
+		spi_message_add_tail(&xfer, &msg);
+		error = spi_sync(spi, &msg);
+		if (error < 0)
+			goto exit;
+
+		TP_DBG(NULL, "[rbuf]: %*phD, len: %d\n", xfer.len, rbuf, xfer.len);
+
+		memcpy(buf, rbuf + 4, r_len);
+	} else if (w_len > 0) {
+		wbuf[0] = 0x82;
+		wbuf[2] = cmd[0];
+		wbuf[3] = 0;
+		memcpy(wbuf + 4, cmd + 1, w_len - 1);
+
+		TP_DBG(NULL, "[wbuf]: %*phD, len: %d\n", 3 + w_len, wbuf, 3 + w_len);
+
+		error = spi_write(spi, wbuf, 3 + w_len);
+		if (error < 0)
+			goto exit;
+
+		if (delay_ms > 0)
+			mdelay(delay_ms);
+	}
+
+exit:
+	CFREE(wbuf);
+	CFREE(rbuf);
+
+	return (error < 0) ? error : 0;
+}
+
+static int __maybe_unused ilitek_spi_write(u8 *cmd, int len)
+{
+	return ilitek_spi_write_and_read(cmd, len, 0, NULL, 0);
+}
+
+static int __maybe_unused ilitek_spi_read(u8 *buf, int len)
+{
+	return ilitek_spi_write_and_read(NULL, 0, 0, buf, len);
+}
+
+int ilitek_write(u8 *cmd, int len)
+{
+	int error;
+
+#ifdef ILITEK_SPI_INTERFACE
+	error = ilitek_spi_write(cmd, len);
+#else
+	error = ilitek_i2c_write(cmd, len);
+#endif
+
+	return (error < 0) ? error : 0;
+}
+
+int ilitek_read(u8 *buf, int len)
+{
+	int error;
+
+#ifdef ILITEK_SPI_INTERFACE
+	error = ilitek_spi_read(buf, len);
+#else
+	error = ilitek_i2c_read(buf, len);
+#endif
+
+	return (error < 0) ? error : 0;
+}
+
+int ilitek_write_and_read(u8 *cmd, int w_len, int delay_ms,
+			  u8 *buf, int r_len)
+{
+	int error;
+
+#ifdef ILITEK_SPI_INTERFACE
+	error = ilitek_spi_write_and_read(cmd, w_len, delay_ms, buf, r_len);
+#else
+	error = ilitek_i2c_write_and_read(cmd, w_len, delay_ms, buf, r_len);
+#endif
+
+	return (error < 0) ? error : 0;
+}
+
+void __maybe_unused ilitek_gpio_dbg(void)
+{
+#if defined(ILITEK_GPIO_DEBUG)
+	gpio_direction_output(ts->test_gpio, 0);
+	mdelay(1);
+	gpio_direction_output(ts->test_gpio, 1);
+#endif
+}
+
+void ilitek_reset(int delay)
+{
+	TP_MSG(NULL, "reset_gpio: %d, delay: %d\n", ts->reset_gpio, delay);
+
+	ilitek_irq_disable();
+
+#if ILITEK_PLAT == ILITEK_PLAT_MTK && defined(MTK_UNDTS)
+	mt_set_gpio_mode(ts->reset_gpio, GPIO_CTP_RST_PIN_M_GPIO);
+	mt_set_gpio_dir(ts->reset_gpio, GPIO_DIR_OUT);
+	mt_set_gpio_out(ts->reset_gpio, GPIO_OUT_ONE);
+	mdelay(10);
+
+	mt_set_gpio_mode(ts->reset_gpio, GPIO_CTP_RST_PIN_M_GPIO);
+	mt_set_gpio_dir(ts->reset_gpio, GPIO_DIR_OUT);
+	mt_set_gpio_out(ts->reset_gpio, GPIO_OUT_ZERO);
+	mdelay(10);
+
+	mt_set_gpio_mode(ts->reset_gpio, GPIO_CTP_RST_PIN_M_GPIO);
+	mt_set_gpio_dir(ts->reset_gpio, GPIO_DIR_OUT);
+	mt_set_gpio_out(ts->reset_gpio, GPIO_OUT_ONE);
+	mdelay(delay);
+#elif ILITEK_PLAT == ILITEK_PLAT_MTK
+	tpd_gpio_output(ts->reset_gpio, 1);
+	mdelay(10);
+	tpd_gpio_output(ts->reset_gpio, 0);
+	mdelay(10);
+	tpd_gpio_output(ts->reset_gpio, 1);
+	mdelay(delay);
+#else
+	gpio_direction_output(ts->reset_gpio, 1);
+	mdelay(10);
+	gpio_direction_output(ts->reset_gpio, 0);
+	mdelay(10);
+	gpio_direction_output(ts->reset_gpio, 1);
+	mdelay(delay);
+#endif
+
+	ilitek_irq_enable();
+}
+
+static int ilitek_free_gpio(void)
+{
+
+#ifndef MTK_UNDTS
+	if (gpio_is_valid(ts->reset_gpio)) {
+		TP_MSG(NULL, "reset_gpio is valid so free\n");
+		gpio_free(ts->reset_gpio);
+	}
+	if (gpio_is_valid(ts->irq_gpio)) {
+		TP_MSG(NULL, "irq_gpio is valid so free\n");
+		gpio_free(ts->irq_gpio);
+	}
+#endif
+
+#if defined(ILITEK_GPIO_DEBUG)
+	if (gpio_is_valid(ts->test_gpio)) {
+		TP_MSG(NULL, "test_gpio is valid so free\n");
+		gpio_free(ts->test_gpio);
+	}
+#endif
+
+	return 0;
+}
+
+static int ilitek_request_pen_input_dev(void)
+{
+	int error;
+	struct input_dev *input;
+
+	int x_min = ts->dev->screen_info.pen_x_min;
+	int y_min = ts->dev->screen_info.pen_y_min;
+	int x_max = ts->dev->screen_info.pen_x_max;
+	int y_max = ts->dev->screen_info.pen_y_max;
+
+	input = input_allocate_device();
+	if (!input)
+		return -ENOMEM;
+
+	TP_DBG(NULL, "registering pen input device\n");
+
+	__set_bit(INPUT_PROP_DIRECT, input->propbit);
+	input->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
+
+	__set_bit(BTN_TOOL_PEN, input->keybit);		/* In Range */
+	__set_bit(BTN_TOOL_RUBBER, input->keybit);	/* Invert */
+	__set_bit(BTN_STYLUS, input->keybit);		/* Barrel Switch */
+	__set_bit(BTN_TOUCH, input->keybit);		/* Tip Switch */
+
+	input->name = "ILITEK STYLUS";
+	input->id.bustype = BUS_I2C;
+	input->dev.parent = ts->device;
+
+#if ILITEK_ROTATE_FLAG
+	swap(x_min, y_min);
+	swap(x_max, y_max);
+#endif
+
+	input_set_abs_params(input, ABS_X, x_min, x_max, 0, 0);
+	input_set_abs_params(input, ABS_Y, y_min, y_max, 0, 0);
+
+	input_set_abs_params(input, ABS_PRESSURE,
+			     ts->dev->screen_info.pressure_min,
+			     ts->dev->screen_info.pressure_max, 0, 0);
+	input_set_abs_params(input, ABS_TILT_X,
+			     ts->dev->screen_info.x_tilt_min,
+			     ts->dev->screen_info.x_tilt_max, 0, 0);
+	input_set_abs_params(input, ABS_TILT_Y,
+			     ts->dev->screen_info.y_tilt_min,
+			     ts->dev->screen_info.y_tilt_max, 0, 0);
+
+	error = input_register_device(input);
+	if (error) {
+		TP_ERR(NULL, "register pen device failed, err: %d\n", error);
+		input_free_device(input);
+		return error;
+	}
+
+	ts->pen_input_dev = input;
+
+	return 0;
+}
+
+static int ilitek_request_input_dev(void)
+{
+	int error;
+	int i;
+	struct input_dev *input;
+
+#ifdef ILITEK_USE_MTK_INPUT_DEV
+	input = tpd->dev;
+	if (!input)
+		return -ENOMEM;
+#ifdef MTK_UNDTS
+	if (tpd_dts_data.use_tpd_button) {
+		for (i = 0; i < tpd_dts_data.tpd_key_num; i++)
+			input_set_capability(input, EV_KEY,
+					     tpd_dts_data.tpd_key_local[i]);
+	}
+#endif
+#else
+	int x_min = ts->dev->screen_info.x_min;
+	int y_min = ts->dev->screen_info.y_min;
+	int x_max = ts->dev->screen_info.x_max;
+	int y_max = ts->dev->screen_info.y_max;
+
+	input = input_allocate_device();
+	if (!input)
+		return -ENOMEM;
+#endif
+
+	TP_DBG(NULL, "registering touch input device\n");
+
+#ifdef ILITEK_TOUCH_PROTOCOL_B
+	INPUT_MT_INIT_SLOTS(input, MAX(2, ts->dev->tp_info.max_fingers));
+#else
+	input_set_abs_params(input, ABS_MT_TRACKING_ID, 0,
+			     ts->dev->tp_info.max_fingers, 0, 0);
+#endif
+
+#ifdef ILITEK_REPORT_PRESSURE
+	input_set_abs_params(input, ABS_MT_PRESSURE, 0, 255, 0, 0);
+#endif
+
+	for (i = 0; i < ts->dev->tp_info.key_num; i++)
+		set_bit(ts->dev->key.info.keys[i].id & KEY_MAX, input->keybit);
+
+	input_set_capability(input, EV_KEY, KEY_POWER);
+
+#ifndef ILITEK_USE_MTK_INPUT_DEV
+	input->name = ILITEK_TS_NAME;
+	input->id.bustype = BUS_I2C;
+	input->dev.parent = ts->device;
+
+	__set_bit(INPUT_PROP_DIRECT, input->propbit);
+	input->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
+	input->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
+
+#ifdef ILITEK_USE_LCM_RESOLUTION
+	x_min = 0; y_min = 0;
+	x_max = TOUCH_SCREEN_X_MAX; y_max = TOUCH_SCREEN_Y_MAX;
+#endif
+
+#if ILITEK_ROTATE_FLAG
+	swap(x_min, y_min);
+	swap(x_max, y_max);
+#endif
+
+	input_set_abs_params(input, ABS_MT_POSITION_X, x_min, x_max, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, y_min, y_max, 0, 0);
+	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0, 32767, 0, 0);
+	input_set_abs_params(input, ABS_MT_WIDTH_MAJOR, 0, 32767, 0, 0);
+
+	error = input_register_device(input);
+	if (error) {
+		TP_ERR(NULL, "input_register_device failed, err: %d\n", error);
+		input_free_device(input);
+		return error;
+	}
+#endif
+
+	ts->input_dev = input;
+
+	if (ts->dev->tp_info.pen_modes)
+		ilitek_request_pen_input_dev();
+
+	return 0;
+}
+
+static int ilitek_touch_down(int id, int x, int y, int p, int h, int w)
+{
+	struct input_dev *input = ts->input_dev;
+
+#ifdef ILITEK_USE_LCM_RESOLUTION
+	x = (x - ts->dev->screen_info.x_min) * TOUCH_SCREEN_X_MAX /
+		(ts->dev->screen_info.x_max - ts->dev->screen_info.x_min);
+	y = (y - ts->dev->screen_info.y_min) * TOUCH_SCREEN_Y_MAX /
+		(ts->dev->screen_info.y_max - ts->dev->screen_info.y_min);
+#endif
+
+	input_report_key(input, BTN_TOUCH, 1);
+#ifdef ILITEK_TOUCH_PROTOCOL_B
+	input_mt_slot(input, id);
+	input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
+#endif
+	input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
+	input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
+	input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, h);
+	input_event(input, EV_ABS, ABS_MT_WIDTH_MAJOR, w);
+#ifdef ILITEK_REPORT_PRESSURE
+	input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
+#endif
+#ifndef ILITEK_TOUCH_PROTOCOL_B
+	input_event(input, EV_ABS, ABS_MT_TRACKING_ID, id);
+	input_mt_sync(input);
+#endif
+
+#if ILITEK_PLAT == ILITEK_PLAT_MTK
+#ifdef CONFIG_MTK_BOOT
+#ifndef MTK_UNDTS
+	if (tpd_dts_data.use_tpd_button) {
+		if (FACTORY_BOOT == get_boot_mode() || RECOVERY_BOOT == get_boot_mode()) {
+			tpd_button(x, y, 1);
+			TP_DBG(NULL, "tpd_button(x, y, 1) = tpd_button(%d, %d, 1)\n", x, y);
+		}
+	}
+#endif
+#endif
+#endif
+	return 0;
+}
+
+static int ilitek_touch_release(int id)
+{
+	struct input_dev *input = ts->input_dev;
+
+#ifdef ILITEK_TOUCH_PROTOCOL_B
+	if (ts->touch_flag[id] == 1) {
+		TP_DBG(NULL, "release point id = %d\n", id);
+		input_mt_slot(input, id);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
+	}
+#else
+	input_report_key(input, BTN_TOUCH, 0);
+	input_mt_sync(input);
+#endif
+	set_arr(ts->touch_flag, id, 0);
+
+#if ILITEK_PLAT == ILITEK_PLAT_MTK
+#ifdef CONFIG_MTK_BOOT
+#ifndef MTK_UNDTS
+	if (tpd_dts_data.use_tpd_button) {
+		if (FACTORY_BOOT == get_boot_mode() ||
+		    RECOVERY_BOOT == get_boot_mode()) {
+			tpd_button(0, 0, 0);
+			TP_DBG(NULL, "tpd_button(x, y, 0) = tpd_button(0, 0, 0)\n");
+		}
+	}
+#endif
+#endif
+#endif
+
+	return 0;
+}
+
+static int ilitek_touch_release_all_point(void)
+{
+	struct input_dev *input = ts->input_dev;
+	int i = 0;
+
+#ifdef ILITEK_TOUCH_PROTOCOL_B
+	input_report_key(input, BTN_TOUCH, 0);
+	for (i = 0; i < ts->dev->tp_info.max_fingers; i++)
+		ilitek_touch_release(i);
+#else
+	for (i = 0; i < ts->dev->tp_info.max_fingers; i++)
+		set_arr(ts->touch_flag, i, 0);
+	ilitek_touch_release(0);
+#endif
+	ts->is_touched = false;
+	input_sync(input);
+	return 0;
+}
+
+static int ilitek_check_key_down(int x, int y)
+{
+	int j;
+
+	for (j = 0; j < ts->dev->tp_info.key_num; j++) {
+		if ((x >= ts->dev->key.info.keys[j].x &&
+		     x <= ts->dev->key.info.keys[j].x +
+			ts->dev->key.info.x_len) &&
+		    (y >= ts->dev->key.info.keys[j].y &&
+		     y <= ts->dev->key.info.keys[j].y +
+			ts->dev->key.info.y_len)) {
+#if ILITEK_PLAT != ILITEK_PLAT_MTK
+			input_report_key(ts->input_dev, ts->dev->key.info.keys[j].id, 1);
+#else
+#ifndef MTK_UNDTS
+			if (tpd_dts_data.use_tpd_button) {
+				x = tpd_dts_data.tpd_key_dim_local[j].key_x;
+				y = tpd_dts_data.tpd_key_dim_local[j].key_y;
+				TP_DBG(NULL, "key index=%x, tpd_dts_data.tpd_key_local[%d]=%d key down\n",
+					j, j, tpd_dts_data.tpd_key_local[j]);
+				ilitek_touch_down(0, x, y, 10, 128, 1);
+			}
+#else
+			x = touch_key_point_maping_array[j].point_x;
+			y = touch_key_point_maping_array[j].point_y;
+			ilitek_touch_down(0, x, y, 10, 128, 1);
+#endif
+#endif
+			ts->dev->key.clicked[j] = true;
+			ts->touch_key_hold_press = true;
+			ts->is_touched = true;
+			TP_DBG(NULL, "Key, Keydown ID=%d, X=%d, Y=%d, key_status=%d\n",
+				ts->dev->key.info.keys[j].id, x, y,
+				ts->dev->key.clicked[j]);
+			break;
+		}
+	}
+	return 0;
+}
+
+static int ilitek_check_key_release(int x, int y, int check_point)
+{
+	int j = 0;
+
+	for (j = 0; j < ts->dev->tp_info.key_num; j++) {
+		if (!ts->dev->key.clicked[j])
+			continue;
+
+		if (check_point) {
+			if (x < ts->dev->key.info.keys[j].x ||
+			    x > ts->dev->key.info.keys[j].x + ts->dev->key.info.x_len ||
+			    y < ts->dev->key.info.keys[j].y ||
+			    y > ts->dev->key.info.keys[j].y + ts->dev->key.info.y_len) {
+#if ILITEK_PLAT != ILITEK_PLAT_MTK
+				input_report_key(ts->input_dev,
+						 ts->dev->key.info.keys[j].id, 0);
+#else
+#ifndef MTK_UNDTS
+				if (tpd_dts_data.use_tpd_button) {
+					TP_DBG(NULL, "key index=%x, tpd_dts_data.tpd_key_local[%d]=%d key up\n", j, j, tpd_dts_data.tpd_key_local[j]);
+					ilitek_touch_release(0);
+				}
+#else
+				ilitek_touch_release(0);
+#endif
+#endif
+				ts->dev->key.clicked[j] = false;
+				ts->touch_key_hold_press = false;
+				TP_DBG(NULL, "Key, Keyout ID=%d, X=%d, Y=%d, key_status=%d\n",
+					ts->dev->key.info.keys[j].id, x, y,
+					ts->dev->key.clicked[j]);
+				break;
+			}
+		} else {
+#if ILITEK_PLAT != ILITEK_PLAT_MTK
+			input_report_key(ts->input_dev, ts->dev->key.info.keys[j].id, 0);
+#else
+#ifndef MTK_UNDTS
+			if (tpd_dts_data.use_tpd_button) {
+				TP_DBG(NULL, "key index=%x, tpd_dts_data.tpd_key_local[%d]=%d key up\n", j, j, tpd_dts_data.tpd_key_local[j]);
+				ilitek_touch_release(0);
+			}
+#else
+			ilitek_touch_release(0);
+#endif
+#endif
+			ts->dev->key.clicked[j] = false;
+			ts->touch_key_hold_press = false;
+			TP_DBG(NULL, "Key, Keyout ID=%d, X=%d, Y=%d, key_status=%d\n",
+				ts->dev->key.info.keys[j].id, x, y,
+				ts->dev->key.clicked[j]);
+			break;
+		}
+	}
+	return 0;
+}
+
+int event_spacing;
+static u8 finger_state;
+static int start_x;
+static int start_y;
+static int current_x;
+static int current_y;
+
+#if ILITEK_GET_TIME_FUNC == ILITEK_GET_TIME_FUNC_WITH_TIME
+static struct timeval start_event_time;
+#else
+unsigned long start_event_time_jiffies;
+#endif
+
+static int ilitek_get_time_diff(void)
+{
+	int diff_milliseconds = 0;
+#if ILITEK_GET_TIME_FUNC == ILITEK_GET_TIME_FUNC_WITH_TIME
+	struct timeval time_now;
+
+	do_gettimeofday(&time_now);
+	diff_milliseconds += (time_now.tv_sec - start_event_time.tv_sec) * 1000;
+
+	if (time_now.tv_usec < start_event_time.tv_usec) {
+		diff_milliseconds -= 1000;
+		diff_milliseconds += (1000 * 1000 + time_now.tv_usec - start_event_time.tv_usec) / 1000;
+	} else
+		diff_milliseconds += (time_now.tv_usec - start_event_time.tv_usec) / 1000;
+
+	if (diff_milliseconds < (-10000))
+		diff_milliseconds = 10000;
+	TP_MSG(NULL, "time_now.tv_sec = %d start_event_time.tv_sec = %d time_now.tv_usec = %d start_event_time.tv_usec = %d diff_milliseconds = %d\n",
+			(int)time_now.tv_sec, (int)start_event_time.tv_sec, (int)time_now.tv_usec, (int)start_event_time.tv_usec, diff_milliseconds);
+#else
+	diff_milliseconds = jiffies_to_msecs(jiffies) - jiffies_to_msecs(start_event_time_jiffies);
+	TP_MSG(NULL, "jiffies_to_msecs(jiffies) = %u jiffies_to_msecs(start_event_time_jiffies) = %u diff_milliseconds = %d\n", jiffies_to_msecs(jiffies),
+			jiffies_to_msecs(start_event_time_jiffies), diff_milliseconds);
+#endif
+	return diff_milliseconds;
+}
+
+static u8 ilitek_double_click_touch(int finger_id, int x, int y,
+					 u8 finger_state)
+{
+	TP_MSG(NULL, "start finger_state = %d\n", finger_state);
+	if (finger_id > 0) {
+		finger_state = 0;
+		goto out;
+	}
+	if (finger_state == 0 || finger_state == 5) {
+
+		finger_state = 1;
+		start_x = x;
+		start_y = y;
+		current_x = 0;
+		current_y = 0;
+		event_spacing = 0;
+#if ILITEK_GET_TIME_FUNC == ILITEK_GET_TIME_FUNC_WITH_TIME
+		do_gettimeofday(&start_event_time);
+#else
+		start_event_time_jiffies = jiffies;
+#endif
+	} else if (finger_state == 1) {
+		event_spacing = ilitek_get_time_diff();
+		if (event_spacing > DOUBLE_CLICK_ONE_CLICK_USED_TIME)
+			finger_state = 4;
+	} else if (finger_state == 2) {
+		finger_state = 3;
+		current_x = x;
+		current_y = y;
+		event_spacing = ilitek_get_time_diff();
+		if (event_spacing > (DOUBLE_CLICK_ONE_CLICK_USED_TIME + DOUBLE_CLICK_NO_TOUCH_TIME))
+			finger_state = 0;
+	} else if (finger_state == 3) {
+		current_x = x;
+		current_y = y;
+		event_spacing = ilitek_get_time_diff();
+		if (event_spacing > DOUBLE_CLICK_TOTAL_USED_TIME) {
+			start_x = current_x;
+			start_y = current_y;
+			finger_state = 4;
+		}
+	}
+out:
+	TP_MSG(NULL, "finger_state = %d event_spacing = %d\n", finger_state, event_spacing);
+	return finger_state;
+}
+
+static u8 ilitek_double_click_release(u8 finger_state)
+{
+	TP_MSG(NULL, "start finger_state = %d\n", finger_state);
+	if (finger_state == 1) {
+		finger_state = 2;
+		event_spacing = ilitek_get_time_diff();
+		if (event_spacing > DOUBLE_CLICK_ONE_CLICK_USED_TIME)
+			finger_state = 0;
+	}
+	if (finger_state == 3) {
+		event_spacing = ilitek_get_time_diff();
+		if ((event_spacing < DOUBLE_CLICK_TOTAL_USED_TIME && event_spacing > 50) && (ABSSUB(current_x, start_x) < DOUBLE_CLICK_DISTANCE)
+				&& ((ABSSUB(current_y, start_y) < DOUBLE_CLICK_DISTANCE))) {
+			finger_state = 5;
+			goto out;
+		} else
+			finger_state = 0;
+	} else if (finger_state == 4)
+		finger_state = 0;
+out:
+	TP_MSG(NULL, "finger_state = %d event_spacing = %d\n", finger_state, event_spacing);
+	return finger_state;
+}
+
+void __maybe_unused ilitek_gesture_handle(bool touch, int idx, int x, int y)
+{
+	struct input_dev *input = ts->input_dev;
+
+	if (ts->gesture_status == Gesture_Double_Click) {
+		if (touch) {
+			finger_state = ilitek_double_click_touch(idx, x, y, finger_state);
+			return;
+		}
+		finger_state = ilitek_double_click_release(finger_state);
+
+		if (finger_state != 5)
+			return;
+	}
+
+#ifdef ILITEK_WAKELOCK_SUPPORT
+	wake_lock_timeout(&ilitek_wake_lock, 5 * HZ);
+#endif
+
+	/* prevent power key being triggered multiple times */
+	if (ts->power_key_triggered)
+		return;
+
+	input_report_key(input, KEY_POWER, 1);
+	input_sync(input);
+	input_report_key(input, KEY_POWER, 0);
+	input_sync(input);
+
+	ts->power_key_triggered = true;
+}
+
+static void ilitek_report_touch_event(struct touch_data *touch, void *_private)
+{
+	struct input_dev *input = ts->input_dev;
+	u8 i, released_cnt = 0;
+
+	u16 x_max = ts->dev->screen_info.x_max;
+	u16 x_min = ts->dev->screen_info.x_min;
+	u16 y_max = ts->dev->screen_info.y_max;
+	u16 y_min = ts->dev->screen_info.y_min;
+
+	/*
+	 * ISR may be activated after registering irq and
+	 * before creating input_dev
+	 */
+	if (!input) {
+		TP_ERR(NULL, "input_dev is not registerred\n");
+		return;
+	}
+
+	for (i = 0; i < touch->cnt; i++) {
+		if (!touch->finger[i].status) {
+			released_cnt++;
+#ifdef ILITEK_TOUCH_PROTOCOL_B
+			ilitek_touch_release(touch->finger[i].id);
+#endif
+			continue;
+		}
+
+		set_arr(ts->touch_flag, touch->finger[i].id, 1);
+
+		touch->finger[i].x = (ILITEK_REVERT_X) ?
+			x_max - touch->finger[i].x + x_min : touch->finger[i].x;
+		touch->finger[i].y = (ILITEK_REVERT_Y) ?
+			y_max - touch->finger[i].y + y_min : touch->finger[i].y;
+
+#if ILITEK_ROTATE_FLAG
+		swap(touch->finger[i].x, touch->finger[i].y);
+#endif
+
+		if (ts->system_suspend) {
+			TP_MSG(NULL, "system is suspend not report point\n");
+			ilitek_gesture_handle(true, i, touch->finger[i].x,
+					      touch->finger[i].y);
+			continue;
+		}
+
+		if (!ts->is_touched)
+			ilitek_check_key_down(touch->finger[i].x,
+					      touch->finger[i].y);
+
+		if (!ts->touch_key_hold_press) {
+			ts->is_touched = true;
+			ilitek_touch_down(touch->finger[i].id,
+					  touch->finger[i].x,
+					  touch->finger[i].y,
+					  touch->finger[i].pressure,
+					  touch->finger[i].height,
+					  touch->finger[i].width);
+		} else {
+			ilitek_check_key_release(touch->finger[i].x,
+						 touch->finger[i].y, 1);
+		}
+	}
+
+	if (touch->cnt == released_cnt) {
+		if (ts->is_touched)
+			ilitek_touch_release_all_point();
+
+		ilitek_check_key_release(0, 0, 0);
+		ts->is_touched = false;
+
+		if (ts->system_suspend)
+			ilitek_gesture_handle(false, 0, 0, 0);
+	}
+
+	input_sync(input);
+}
+
+static void ilitek_report_pen_event(struct pen_data *pen, void *_private)
+{
+	static int curr_tool = BTN_TOOL_PEN;
+	struct input_dev *pen_input = ts->pen_input_dev;
+	int tool;
+
+	u16 x_max = ts->dev->screen_info.pen_x_max;
+	u16 x_min = ts->dev->screen_info.pen_x_min;
+	u16 y_max = ts->dev->screen_info.pen_y_max;
+	u16 y_min = ts->dev->screen_info.pen_y_min;
+
+	if (!pen_input)
+		return;
+
+	tool = (pen->pen.in_range && pen->pen.invert) ?
+		BTN_TOOL_RUBBER : BTN_TOOL_PEN;
+
+	if (curr_tool != tool) {
+		input_report_key(pen_input, curr_tool, 0);
+		input_sync(pen_input);
+		curr_tool = tool;
+	}
+
+	pen->pen.x = (ILITEK_REVERT_X) ?
+		x_max - pen->pen.x + x_min : pen->pen.x;
+	pen->pen.y = (ILITEK_REVERT_Y) ?
+		y_max - pen->pen.y + y_min : pen->pen.y;
+
+#if ILITEK_ROTATE_FLAG
+	swap(pen->pen.x, pen->pen.y);
+#endif
+
+	input_report_key(pen_input, BTN_TOUCH,
+			 pen->pen.tip_sw || pen->pen.eraser);
+	input_report_key(pen_input, curr_tool, pen->pen.in_range);
+	input_report_key(pen_input, BTN_STYLUS, pen->pen.barrel_sw);
+	input_event(pen_input, EV_ABS, ABS_X, pen->pen.x);
+	input_event(pen_input, EV_ABS, ABS_Y, pen->pen.y);
+	input_event(pen_input, EV_ABS, ABS_PRESSURE, pen->pen.pressure);
+	input_event(pen_input, EV_ABS, ABS_TILT_X, pen->pen.x_tilt);
+	input_event(pen_input, EV_ABS, ABS_TILT_Y, pen->pen.y_tilt);
+
+	input_sync(pen_input);
+}
+
+
+static void ilitek_report_buf(u8 *buf, int size,
+			      bool is_last, void *_private)
+{
+	UNUSED(is_last);
+
+	ilitek_udp_reply(buf, size);
+}
+
+int ilitek_read_data_and_report(void)
+{
+	int error;
+	u8 i, count;
+	struct ilitek_report report;
+
+	memset(&report, 0, sizeof(report));
+	report.cb.report_touch_event = ilitek_report_touch_event;
+	report.cb.report_pen_event = ilitek_report_pen_event;
+	report.cb.report_buf = ilitek_report_buf;
+
+	switch (ts->irq_handle_type) {
+	case irq_type_c_model:
+		memset(ts->buf, 0, sizeof(ts->buf));
+
+		for (i = 0, count = 1; i < count; i++) {
+			ilitek_read(ts->buf, ts->irq_read_len);
+			ilitek_udp_reply(ts->buf, ts->irq_read_len);
+			count = ts->buf[ts->irq_read_len - 1];
+		}
+
+		break;
+
+	case irq_type_debug:
+	case irq_type_normal:
+	default:
+		error = ilitek_report_update(ts->dev, &report);
+		if (error < 0) {
+			if (error == -EILIPROTO && !checksum_failed_release)
+				break;
+
+			if (ts->is_touched) {
+				ilitek_touch_release_all_point();
+				ilitek_check_key_release(0, 0, 0);
+			}
+
+			return error;
+		}
+
+		break;
+	}
+
+	return 0;
+}
+
+static ISR_FUNC(ilitek_i2c_isr)
+{
+	int error;
+
+	TP_DBG(NULL, "%s\n", __func__);
+
+	atomic_set(&ts->get_INT, 1);
+	ilitek_gpio_dbg();
+
+	ts->esd_skip = true;
+
+	if (atomic_read(&ts->firmware_updating)) {
+		TP_DBG(NULL, "firmware_updating return\n");
+		goto exit;
+	}
+
+#ifdef ILITEK_ISR_PROTECT
+	ilitek_irq_disable();
+#endif
+
+	if (!ts->unhandle_irq) {
+		mutex_lock(&ts->ilitek_mutex);
+		error = ilitek_read_data_and_report();
+		if (error < 0)
+			TP_ERR(NULL, "process error\n");
+		mutex_unlock(&ts->ilitek_mutex);
+	}
+
+#ifdef ILITEK_ISR_PROTECT
+	ilitek_irq_enable();
+#endif
+
+exit:
+	ts->esd_skip = false;
+
+	ISR_RETURN(IRQ_HANDLED);
+}
+
+static int ilitek_request_irq(void)
+{
+	int error;
+
+#ifdef MTK_UNDTS
+	mt_set_gpio_mode(ILITEK_IRQ_GPIO, GPIO_CTP_EINT_PIN_M_EINT);
+	mt_set_gpio_dir(ILITEK_IRQ_GPIO, GPIO_DIR_IN);
+	mt_set_gpio_pull_enable(ILITEK_IRQ_GPIO, GPIO_PULL_ENABLE);
+	mt_set_gpio_pull_select(ILITEK_IRQ_GPIO, GPIO_PULL_UP);
+
+	mt_eint_set_hw_debounce(CUST_EINT_TOUCH_PANEL_NUM, CUST_EINT_TOUCH_PANEL_DEBOUNCE_CN);
+	mt_eint_registration(CUST_EINT_TOUCH_PANEL_NUM, CUST_EINT_TOUCH_PANEL_TYPE, ilitek_i2c_isr, 1);
+	mt_eint_unmask(CUST_EINT_TOUCH_PANEL_NUM);
+#else
+
+#if ILITEK_PLAT == ILITEK_PLAT_MTK
+	struct device_node *node;
+
+	node = of_find_matching_node(NULL, touch_of_match);
+	if (node)
+		ts->irq = irq_of_parse_and_map(node, 0);
+#else
+	ts->irq = gpio_to_irq(ts->irq_gpio);
+#endif
+
+	TP_MSG(NULL, "ts->irq: %d\n", ts->irq);
+	if (ts->irq <= 0)
+		return -EINVAL;
+
+	error = request_threaded_irq(ts->irq, NULL, ilitek_i2c_isr,
+				     ts->irq_trigger_type | IRQF_ONESHOT,
+				     "ilitek_touch_irq", ts);
+	if (error) {
+		TP_ERR(NULL, "request threaded irq failed, err: %d\n", error);
+		return error;
+	}
+#endif
+
+	ts->irq_registered = true;
+	atomic_set(&ts->irq_enabled, 1);
+
+	return 0;
+}
+
+static int ilitek_read_fw(char *filename, unsigned char *buf, int size, void *data)
+{
+	int error, fw_size;
+	const struct firmware *fw;
+	struct device *device = (struct device *)data;
+
+	error = request_firmware(&fw, filename, device);
+	if (error) {
+		TP_ERR(NULL, "request fw: %s failed, err:%d\n", filename, error);
+		return error;
+	}
+
+	if (size < fw->size) {
+		fw_size = -EFBIG;
+		goto release_fw;
+	}
+
+	fw_size = fw->size;
+	memcpy(buf, fw->data, fw->size);
+
+release_fw:
+	release_firmware(fw);
+
+	return fw_size;
+}
+
+struct ilitek_update_callback update_cb = {
+	.read_fw = ilitek_read_fw,
+	.update_progress = NULL,
+	.update_fw_file_info = NULL,
+
+	.slave_update_notify = NULL,
+	.update_fw_ic_info = NULL,
+};
+
+int ilitek_upgrade_firmware(char *filename)
+{
+	int error;
+	struct ilitek_fw_handle *handle;
+	struct ilitek_fw_settings setting;
+
+	ilitek_irq_disable();
+	mutex_lock(&ts->ilitek_mutex);
+	atomic_set(&ts->firmware_updating, 1);
+	ts->operation_protection = true;
+
+	handle = ilitek_update_init(ts->dev, false, &update_cb, ts->device);
+
+	setting.force_update = false;
+	setting.fw_check_only = false;
+	setting.fw_ver_check = false;
+	setting.retry = 3;
+	ilitek_update_setting(handle, &setting);
+
+	error = ilitek_update_load_fw(handle, filename);
+	if (error < 0)
+		goto err_return;
+	error = ilitek_update_start(handle);
+	if (error < 0)
+		goto err_return;
+
+err_return:
+	ilitek_update_exit(handle);
+
+	ts->operation_protection = false;
+	atomic_set(&ts->firmware_updating, 0);
+	mutex_unlock(&ts->ilitek_mutex);
+	ilitek_irq_enable();
+
+	return error;
+}
+
+
+static int __maybe_unused ilitek_update_thread(void *arg)
+{
+#ifdef ILITEK_BOOT_UPDATE
+	int error;
+
+	TP_MSG(NULL, "%s\n", __func__);
+
+	if (kthread_should_stop()) {
+		TP_MSG(NULL, "ilitek_update_thread, stop\n");
+		return -1;
+	}
+
+	mdelay(100);
+
+	error = ilitek_upgrade_firmware("ilitek.ili");
+	if (error < 0) {
+		error = ilitek_upgrade_firmware("ilitek.hex");
+		if (error < 0) {
+			error = ilitek_upgrade_firmware("ilitek.bin");
+			if (error < 0)
+				return error;
+		}
+	}
+
+	error = ilitek_request_input_dev();
+	if (error)
+		return (error < 0) ? error : -EFAULT;
+#endif
+
+	return 0;
+}
+
+void ilitek_suspend(void)
+{
+	TP_MSG(NULL, "%s\n", __func__);
+
+	ts->esd_skip = true;
+	if (ts->esd_check && ts->esd_workq)
+		cancel_delayed_work_sync(&ts->esd_work);
+
+	if (ts->operation_protection || atomic_read(&ts->firmware_updating)) {
+		TP_MSG(NULL, "operation_protection or firmware_updating return\n");
+		return;
+	}
+
+	if (ts->gesture_status) {
+		ts->wake_irq_enabled = (enable_irq_wake(ts->irq) == 0);
+
+		if (ts->low_power_status == Low_Power_Idle) {
+			mutex_lock(&ts->ilitek_mutex);
+			if (api_set_idle(ts->dev, true) < 0)
+				TP_ERR(NULL, "enable Idle mode failed\n");
+			mutex_unlock(&ts->ilitek_mutex);
+		}
+	} else {
+		/*
+		 * Must disable irq before sleep cmd,
+		 * Avoid getting into ISR handling (and do i2c read),
+		 * after sending sleep cmd.
+		 */
+		ilitek_irq_disable();
+
+		if (ts->low_power_status == Low_Power_Sleep) {
+			mutex_lock(&ts->ilitek_mutex);
+			if (api_protocol_set_cmd(ts->dev, SET_IC_SLEEP,
+						 NULL) < 0)
+				TP_ERR(NULL, "set tp sleep failed\n");
+			mutex_unlock(&ts->ilitek_mutex);
+		}
+	}
+
+	ts->power_key_triggered = false;
+	ts->system_suspend = true;
+}
+
+void ilitek_resume(void)
+{
+	TP_MSG(NULL, "%s\n", __func__);
+
+	if (ts->operation_protection || atomic_read(&ts->firmware_updating)) {
+		TP_MSG(NULL, "operation_protection or firmware_updating return\n");
+		return;
+	}
+
+	if (ts->gesture_status) {
+		ilitek_irq_disable();
+
+		if (ts->low_power_status == Low_Power_Idle) {
+			mutex_lock(&ts->ilitek_mutex);
+			api_set_idle(ts->dev, false);
+			mutex_unlock(&ts->ilitek_mutex);
+		}
+
+		if (ts->gesture_status == Gesture_Double_Click)
+			finger_state = 0;
+
+		if (ts->wake_irq_enabled) {
+			disable_irq_wake(ts->irq);
+			ts->wake_irq_enabled = false;
+		}
+	} else {
+		if (ts->dev->protocol.flag == PTL_V3) {
+			/*
+			 * If ILITEK_SLEEP is defined and FW support wakeup cmd,
+			 * the hw reset can be mark.
+			 */
+			ilitek_reset(ts->dev->reset_time);
+		}
+
+		if (ts->low_power_status == Low_Power_Sleep) {
+			mutex_lock(&ts->ilitek_mutex);
+			api_protocol_set_cmd(ts->dev, SET_IC_WAKE, NULL);
+			mutex_unlock(&ts->ilitek_mutex);
+		}
+	}
+
+	ts->esd_skip = false;
+	if (ts->esd_check && ts->esd_workq)
+		queue_delayed_work(ts->esd_workq, &ts->esd_work, ts->esd_delay);
+
+	ilitek_touch_release_all_point();
+	ilitek_check_key_release(0, 0, 0);
+
+	ts->system_suspend = false;
+
+	ilitek_irq_enable();
+}
+
+#if ILITEK_PLAT == ILITEK_PLAT_ALLWIN
+int ilitek_suspend_allwin(struct i2c_client *client, pm_message_t mesg)
+{
+	ilitek_suspend();
+	return 0;
+}
+
+int ilitek_resume_allwin(struct i2c_client *client)
+{
+	ilitek_resume();
+	return 0;
+}
+#endif
+
+#if ILITEK_PLAT != ILITEK_PLAT_MTK
+//#if defined(CONFIG_FB) || defined(CONFIG_QCOM_DRM)
+#if defined(CONFIG_QCOM_DRM)
+static int __maybe_unused ilitek_notifier_callback(struct notifier_block *self,
+		unsigned long event, void *data)
+{
+#ifdef CONFIG_QCOM_DRM
+	struct msm_drm_notifier *ev_data = data;
+#else
+	struct fb_event *ev_data = data;
+#endif
+	int *blank;
+
+	TP_MSG(NULL, "FB EVENT event: %lu\n", event);
+
+#ifdef CONFIG_QCOM_DRM
+	if (!ev_data || (ev_data->id != 0))
+		return 0;
+#endif
+	if (ev_data && ev_data->data && event == ILITEK_EVENT_BLANK) {
+		blank = ev_data->data;
+		TP_MSG(NULL, "blank: %d\n", *blank);
+		if (*blank == ILITEK_BLANK_POWERDOWN) {
+			ilitek_suspend();
+		} else if (*blank == ILITEK_BLANK_UNBLANK ||
+			   *blank == ILITEK_BLANK_NORMAL) {
+			ilitek_resume();
+		}
+	}
+
+	return 0;
+}
+#elif defined(CONFIG_HAS_EARLYSUSPEND)
+static void __maybe_unused ilitek_early_suspend(struct early_suspend *h)
+{
+	ilitek_suspend();
+}
+
+static void __maybe_unused ilitek_late_resume(struct early_suspend *h)
+{
+	ilitek_resume();
+}
+#endif
+#endif
+
+static void ilitek_get_gpio_num(void)
+{
+#ifdef ILITEK_GET_GPIO_NUM
+#if ILITEK_PLAT == ILITEK_PLAT_ALLWIN
+	TP_MSG(NULL, "(config_info.wakeup_gpio.gpio) = %d (config_info.int_number) = %d\n", (config_info.wakeup_gpio.gpio), (config_info.int_number));
+	ts->reset_gpio = (config_info.wakeup_gpio.gpio);
+	ts->irq_gpio = (config_info.int_number);
+#else
+#ifdef CONFIG_OF
+	ts->reset_gpio = of_get_named_gpio(ts->device->of_node, "ilitek,reset-gpio", 0);
+	if (ts->reset_gpio < 0)
+		TP_ERR(NULL, "reset_gpio = %d\n", ts->reset_gpio);
+	ts->irq_gpio = of_get_named_gpio(ts->device->of_node, "ilitek,irq-gpio", 0);
+	if (ts->irq_gpio < 0)
+		TP_ERR(NULL, "irq_gpio = %d\n", ts->irq_gpio);
+#endif
+#endif
+#else
+	ts->reset_gpio = ILITEK_RESET_GPIO;
+	ts->irq_gpio = ILITEK_IRQ_GPIO;
+#endif
+
+	TP_MSG(NULL, "reset_gpio = %d irq_gpio = %d\n", ts->reset_gpio, ts->irq_gpio);
+
+
+#if defined(ILITEK_GPIO_DEBUG)
+	do {
+		ts->test_gpio = of_get_named_gpio(ts->device->of_node, "ilitek,test-gpio", 0);
+		if (ts->test_gpio < 0) {
+			TP_ERR(NULL, "test_gpio: %d\n", ts->test_gpio);
+			break;
+		}
+
+		TP_MSG(NULL, "test_gpio: %d\n", ts->test_gpio);
+
+		if (gpio_request(ts->test_gpio, "ilitek-test-gpio")) {
+			TP_ERR(NULL, "request test_gpio failed\n");
+			break;
+		}
+
+		gpio_direction_output(ts->test_gpio, 1);
+
+	} while (0);
+#endif
+}
+
+static int ilitek_request_gpio(void)
+{
+	int ret = 0;
+
+	ts->irq_gpio = -ENODEV;
+	ts->reset_gpio = -ENODEV;
+
+	ilitek_get_gpio_num();
+
+#if ILITEK_PLAT != ILITEK_PLAT_MTK
+	if (ts->reset_gpio > 0) {
+		ret = gpio_request(ts->reset_gpio, "ilitek-reset-gpio");
+		if (ret) {
+			TP_ERR(NULL, "Failed to request reset_gpio so free retry\n");
+			gpio_free(ts->reset_gpio);
+			ret = gpio_request(ts->reset_gpio, "ilitek-reset-gpio");
+			if (ret)
+				TP_ERR(NULL, "Failed to request reset_gpio\n");
+		}
+		if (ret) {
+			TP_ERR(NULL, "Failed to request reset_gpio\n");
+		} else {
+			ret = gpio_direction_output(ts->reset_gpio, 1);
+			if (ret)
+				TP_ERR(NULL, "Failed to direction output rest gpio err\n");
+		}
+	}
+	if (ts->irq_gpio > 0) {
+		ret = gpio_request(ts->irq_gpio, "ilitek-irq-gpio");
+		if (ret) {
+			TP_ERR(NULL, "Failed to request irq_gpio so free retry\n");
+			gpio_free(ts->irq_gpio);
+			ret = gpio_request(ts->irq_gpio, "ilitek-irq-gpio");
+			if (ret)
+				TP_ERR(NULL, "Failed to request irq_gpio\n");
+		}
+		if (ret) {
+			TP_ERR(NULL, "Failed to request irq_gpio\n");
+		} else {
+			ret = gpio_direction_input(ts->irq_gpio);
+			if (ret)
+				TP_ERR(NULL, "Failed to direction input irq gpio err\n");
+		}
+	}
+#endif
+	return ret;
+}
+
+int ilitek_create_esd_check_workqueue(void)
+{
+	TP_MSG(NULL, "start to create esd workqueue\n");
+
+	INIT_DELAYED_WORK(&ts->esd_work, ilitek_esd_check);
+	ts->esd_workq = create_singlethread_workqueue("ilitek_esd_wq");
+	if (!ts->esd_workq)
+		return -ENOMEM;
+
+	ts->esd_skip = false;
+	ts->esd_delay = 2 * HZ;
+	queue_delayed_work(ts->esd_workq, &ts->esd_work, ts->esd_delay);
+
+	return 0;
+}
+
+void ilitek_remove_esd_check_workqueue(void)
+{
+	TP_MSG(NULL, "start to remove esd workqueue\n");
+
+	if (ts->esd_workq) {
+		cancel_delayed_work_sync(&ts->esd_work);
+		destroy_workqueue(ts->esd_workq);
+		ts->esd_workq = NULL;
+	}
+}
+
+static int ilitek_register_resume_suspend(void)
+{
+#ifdef ILITEK_REGISTER_SUSPEND_RESUME
+#if ILITEK_PLAT != ILITEK_PLAT_MTK
+//#if defined(CONFIG_FB) || defined(CONFIG_QCOM_DRM)
+#if defined(CONFIG_QCOM_DRM)
+	int error;
+
+	ts->fb_notif.notifier_call = ilitek_notifier_callback;
+
+#ifdef CONFIG_QCOM_DRM
+	error = msm_drm_register_client(&ts->fb_notif);
+#else
+	error = fb_register_client(&ts->fb_notif);
+#endif
+	if (error)
+		TP_ERR(NULL, "register fb_notifier failed, err: %d\n", error);
+
+#elif defined(CONFIG_HAS_EARLYSUSPEND)
+	ts->early_suspend.level = EARLY_SUSPEND_LEVEL_BLANK_SCREEN + 1;
+	ts->early_suspend.suspend = ilitek_early_suspend;
+	ts->early_suspend.resume = ilitek_late_resume;
+	register_early_suspend(&ts->early_suspend);
+#endif
+#endif /* ILITEK_PLAT != ILITEK_PLAT_MTK */
+
+#if ILITEK_PLAT == ILITEK_PLAT_ALLWIN
+	device_enable_async_suspend(ts->device);
+	pm_runtime_set_active(ts->device);
+	pm_runtime_get(ts->device);
+	pm_runtime_enable(ts->device);
+#endif
+
+#endif /* ILITEK_REGISTER_SUSPEND_RESUME */
+
+	return 0;
+}
+
+static void __maybe_unused ilitek_release_resume_suspend(void)
+{
+#ifdef ILITEK_REGISTER_SUSPEND_RESUME
+
+//#if defined(CONFIG_FB) || defined(CONFIG_QCOM_DRM)
+#if defined(CONFIG_QCOM_DRM)
+#ifdef CONFIG_QCOM_DRM
+	msm_drm_unregister_client(&ts->fb_notif);
+#else
+	fb_unregister_client(&ts->fb_notif);
+#endif
+#elif defined(CONFIG_HAS_EARLYSUSPEND)
+	unregister_early_suspend(&ts->early_suspend);
+#endif
+
+#endif /* ILITEK_REGISTER_SUSPEND_RESUME */
+}
+
+int ilitek_netlink_init(u8 unit)
+{
+#ifdef ILITEK_TUNING_MESSAGE
+	NETLINK_KERNEL_CFG_DECLARE(cfg, udp_receive);
+
+	if (ilitek_netlink_sock)
+		ilitek_netlink_exit();
+
+	ilitek_netlink_sock = NETLINK_KERNEL_CREATE(unit, &cfg, udp_receive);
+
+	if (!ilitek_netlink_sock) {
+		TP_ERR(NULL, "netlink_kernel_create failed\n");
+		return -ENOPROTOOPT;
+	}
+
+	return 0;
+#endif
+	return -EPERM;
+}
+
+void ilitek_netlink_exit(void)
+{
+#ifdef ILITEK_TUNING_MESSAGE
+	if (ilitek_netlink_sock)
+		netlink_kernel_release(ilitek_netlink_sock);
+
+	ilitek_netlink_sock = NULL;
+#endif
+}
+
+static int __maybe_unused ilitek_alloc_dma(void)
+{
+#ifdef ILITEK_ENABLE_DMA
+	tpd->dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
+	I2CDMABuf_va = (u8 *) dma_alloc_coherent(&tpd->dev->dev, ILITEK_DMA_SIZE, &I2CDMABuf_pa, GFP_KERNEL);
+	if (!I2CDMABuf_va) {
+		TP_ERR(NULL, "ilitek [TPD] tpd->dev->dev dma_alloc_coherent error\n");
+		I2CDMABuf_va = (u8 *) dma_alloc_coherent(NULL, ILITEK_DMA_SIZE, &I2CDMABuf_pa, GFP_KERNEL);
+		if (!I2CDMABuf_va) {
+			TP_ERR(NULL, "ilitek [TPD] NULL dma_alloc_coherent error\n");
+			return -ENOMEM;
+		}
+	}
+	memset(I2CDMABuf_va, 0, ILITEK_DMA_SIZE);
+#endif
+
+	return 0;
+}
+
+static int __maybe_unused ilitek_free_dma(void)
+{
+#ifdef ILITEK_ENABLE_DMA
+	if (I2CDMABuf_va) {
+		dma_free_coherent(&tpd->dev->dev, ILITEK_DMA_SIZE,
+				  I2CDMABuf_va, I2CDMABuf_pa);
+
+		I2CDMABuf_va = NULL;
+		I2CDMABuf_pa = 0;
+
+	}
+#endif
+	return 0;
+}
+
+static int __maybe_unused ilitek_power_on(bool status)
+{
+#ifdef ILITEK_ENABLE_REGULATOR_POWER_ON
+	int error;
+
+	TP_MSG(NULL, "%s\n", status ? "POWER ON" : "POWER OFF");
+
+#if ILITEK_PLAT == ILITEK_PLAT_ALLWIN
+	input_set_power_enable(&(config_info.input_type), status);
+#else
+
+	if (status) {
+		if (ts->vdd) {
+			error = regulator_enable(ts->vdd);
+			if (error < 0) {
+				TP_ERR(NULL, "regulator_enable vdd fail\n");
+				return error;
+			}
+		}
+		if (ts->vdd_i2c) {
+			error = regulator_enable(ts->vdd_i2c);
+			if (error < 0) {
+				TP_ERR(NULL, "regulator_enable vdd_i2c fail\n");
+				return error;
+			}
+		}
+	} else {
+		if (ts->vdd) {
+			error = regulator_disable(ts->vdd);
+			if (error < 0) {
+				TP_ERR(NULL, "regulator_enable vdd fail\n");
+				return error;
+			}
+		}
+		if (ts->vdd_i2c) {
+			error = regulator_disable(ts->vdd_i2c);
+			if (error < 0) {
+				TP_ERR(NULL, "regulator_enable vdd_i2c fail\n");
+				return error;
+			}
+		}
+	}
+
+#ifdef MTK_UNDTS
+	if (status)
+		hwPowerOn(PMIC_APP_CAP_TOUCH_VDD, VOL_3300, "TP");
+#endif
+#endif
+#endif
+
+	return 0;
+}
+
+static int __maybe_unused ilitek_request_regulator(struct ilitek_ts_data *ts)
+{
+#ifdef ILITEK_ENABLE_REGULATOR_POWER_ON
+	int ret = 0;
+	char *vdd_name = "vdd";
+	char *vcc_i2c_name = "vcc_i2c";
+
+#if ILITEK_PLAT == ILITEK_PLAT_MTK
+	vdd_name = "vtouch";
+	ts->vdd = regulator_get(tpd->tpd_dev, vdd_name);
+	tpd->reg = ts->vdd;
+	if (IS_ERR(ts->vdd)) {
+		TP_ERR(NULL, "regulator_get vdd fail\n");
+		ts->vdd = NULL;
+	} else {
+		ret = regulator_set_voltage(ts->vdd, 3000000, 3300000);
+		if (ret)
+			TP_ERR(NULL, "Could not set vdd to 3000~3300mv.\n");
+	}
+#elif ILITEK_PLAT != ILITEK_PLAT_ALLWIN
+	ts->vdd = regulator_get(ts->device, vdd_name);
+	if (IS_ERR(ts->vdd)) {
+		TP_ERR(NULL, "regulator_get vdd fail\n");
+		ts->vdd = NULL;
+	} else {
+		ret = regulator_set_voltage(ts->vdd, 3000000, 3300000);
+		if (ret)
+			TP_ERR(NULL, "Could not set vdd to 3000~3300mv.\n");
+
+	}
+
+	ts->vdd_i2c = regulator_get(ts->device, vcc_i2c_name);
+	if (IS_ERR(ts->vdd_i2c)) {
+		TP_ERR(NULL, "regulator_get vdd_i2c fail\n");
+		ts->vdd_i2c = NULL;
+	} else {
+		ret = regulator_set_voltage(ts->vdd_i2c, 3000000, 3300000);
+		if (ret)
+			TP_ERR(NULL, "Could not set i2c to 3000~3300mv.\n");
+	}
+#endif /* ILITEK_PLAT == ILITEK_PLAT_MTK */
+#endif /* ILITEK_ENABLE_REGULATOR_POWER_ON */
+
+	return 0;
+}
+
+static void __maybe_unused ilitek_release_regulator(void)
+{
+#if defined(ILITEK_ENABLE_REGULATOR_POWER_ON) && ILITEK_PLAT != ILITEK_PLAT_ALLWIN
+	if (ts->vdd)
+		regulator_put(ts->vdd);
+	if (ts->vdd_i2c)
+		regulator_put(ts->vdd_i2c);
+#endif
+}
+
+void ilitek_register_gesture(struct ilitek_ts_data *ts, bool init)
+{
+	if (init) {
+		device_init_wakeup(ts->device, 1);
+
+#ifdef ILITEK_WAKELOCK_SUPPORT
+		wake_lock_init(&ilitek_wake_lock, WAKE_LOCK_SUSPEND, "ilitek wakelock");
+#endif
+		return;
+	}
+
+	device_init_wakeup(ts->device, 0);
+
+#ifdef ILITEK_WAKELOCK_SUPPORT
+	wake_lock_destroy(&ilitek_wake_lock);
+#endif
+}
+
+static int _ilitek_write_then_read(unsigned char *wbuf, int wlen,
+				   unsigned char *rbuf, int rlen, void *data)
+{
+	return ilitek_write_and_read(wbuf, wlen, 1, rbuf, rlen);
+}
+
+static int ilitek_read_interrupt_in(unsigned char *rbuf, int rlen,
+				    unsigned int timeout_ms, void *data)
+{
+	return ilitek_write_and_read(NULL, 0, 0, rbuf, rlen);
+}
+
+static void _ilitek_init_ack(unsigned int tout_ms, void *data)
+{
+	UNUSED(tout_ms);
+
+	ilitek_irq_enable();
+	ts->unhandle_irq = true;
+	atomic_set(&ts->get_INT, 0);
+}
+
+static int _ilitek_wait_ack(u8 cmd, unsigned int tout_ms, void *data)
+{
+	unsigned int t_ms = 0;
+	int tmp, error = -ETIME;
+
+	UNUSED(cmd);
+
+	do {
+		tmp = atomic_read(&ts->get_INT);
+		if (tmp) {
+			error = 0;
+			break;
+		}
+
+		udelay(1000);
+		t_ms++;
+	} while (t_ms < tout_ms);
+
+	ts->unhandle_irq = false;
+	ilitek_irq_disable();
+
+	return error;
+}
+
+static void _ilitek_delay(unsigned int delay_ms)
+{
+	mdelay(delay_ms);
+}
+
+static int _ilitek_reset(unsigned int delay_ms, void *data)
+{
+	/* return error if no reset gpio found */
+	if (ts->reset_gpio < 0)
+		return -ENODEV;
+
+	ilitek_reset(delay_ms);
+	return 0;
+}
+
+struct ilitek_ts_callback dev_cb = {
+	.write_then_read = _ilitek_write_then_read,
+	.read_interrupt_in = ilitek_read_interrupt_in,
+	.init_ack = _ilitek_init_ack,
+	.wait_ack = _ilitek_wait_ack,
+	.hw_reset = _ilitek_reset,
+	.re_enum = NULL,
+	.delay_ms = _ilitek_delay,
+	.msg = NULL,
+
+	.write_then_read_direct = NULL,
+	.mode_switch_notify = NULL,
+};
+
+int ilitek_main_probe(void *client, struct device *device)
+{
+	struct ilitek_ts_settings setting;
+
+	TP_MSG(NULL, "driver version: %hhu.%hhu.%hhu.%hhu.%hhu.%hhu.%hhu\n",
+		driver_ver[0], driver_ver[1], driver_ver[2], driver_ver[3],
+		driver_ver[4], driver_ver[5], driver_ver[6]);
+
+	ts = kzalloc(sizeof(*ts), GFP_KERNEL);
+	if (!ts) {
+		TP_ERR(NULL, "allocate ts failed\n");
+		return -ENOMEM;
+	}
+
+	ts->client = client;
+	ts->device = device;
+
+	mutex_init(&ts->ilitek_mutex);
+	ts->unhandle_irq = false;
+
+	ilitek_alloc_dma();
+	ilitek_request_regulator(ts);
+	ilitek_power_on(true);
+	ilitek_request_gpio();
+
+	ilitek_reset(600);
+
+	ts->dev = ilitek_dev_init(interface_i2c, "0", false, &dev_cb, ts);
+	if (!ts->dev)
+		goto err_free_gpio;
+
+	memset(&setting, 0, sizeof(setting));
+	setting.sensor_id_mask = ILITEK_SENSOR_ID_MASK;
+	ilitek_dev_setting(ts->dev, &setting);
+
+	if (api_update_ts_info(ts->dev) < 0)
+		goto err_dev_exit;
+
+	ts->irq_trigger_type = (ts->dev->protocol.flag == PTL_V6) ?
+		IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
+
+	if (ilitek_request_irq())
+		goto err_dev_exit;
+
+#ifdef ILITEK_BOOT_UPDATE
+	ts->update_thread = kthread_run(ilitek_update_thread, NULL,
+					"ilitek_update_thread");
+	if (IS_ERR(ts->update_thread))
+		goto err_free_irq;
+#else
+	if (ilitek_request_input_dev())
+		goto err_free_irq;
+#endif
+
+	ilitek_register_resume_suspend();
+	ilitek_create_sysfsnode();
+	ilitek_create_tool_node();
+	ilitek_netlink_init(NETLINK_USERSOCK);
+
+	ts->esd_check = ILITEK_ESD_CHECK_ENABLE;
+	if (ts->esd_check)
+		ilitek_create_esd_check_workqueue();
+
+	ts->gesture_status = ILITEK_GESTURE_DEFAULT;
+	if (ts->gesture_status)
+		ilitek_register_gesture(ts, true);
+
+	ts->low_power_status = ILITEK_LOW_POWER_DEFAULT;
+
+	return 0;
+
+err_free_irq:
+	free_irq(ts->irq, ts);
+
+err_dev_exit:
+	ilitek_dev_exit(ts->dev);
+
+err_free_gpio:
+	ilitek_free_gpio();
+	ilitek_power_on(false);
+	ilitek_release_regulator();
+	ilitek_free_dma();
+	kfree(ts);
+
+	return -ENODEV;
+}
+
+int ilitek_main_remove(void *client)
+{
+	TP_MSG(NULL, "%s\n", __func__);
+
+	if (!ts)
+		return 0;
+
+	ilitek_netlink_exit();
+
+	if (ts->gesture_status)
+		ilitek_register_gesture(ts, false);
+
+	ilitek_remove_esd_check_workqueue();
+	ilitek_remove_tool_node();
+	ilitek_remove_sys_node();
+	ilitek_release_resume_suspend();
+
+	if (ts->pen_input_dev)
+		input_unregister_device(ts->pen_input_dev);
+
+	if (ts->input_dev)
+		input_unregister_device(ts->input_dev);
+
+#ifndef MTK_UNDTS
+	free_irq(ts->irq, ts);
+#endif
+
+	ilitek_dev_exit(ts->dev);
+
+	ilitek_free_gpio();
+	ilitek_power_on(false);
+	ilitek_release_regulator();
+	ilitek_free_dma();
+
+	kfree(ts);
+
+	return 0;
+}
diff --git a/drivers/input/touchscreen/ilitek/ilitek_platform_init.c b/drivers/input/touchscreen/ilitek/ilitek_platform_init.c
new file mode 100644
index 000000000000..0b7f97ab7746
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_platform_init.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ILITEK Touch IC driver
+ *
+ * Copyright (C) 2011 ILI Technology Corporation.
+ *
+ * Author: Luca Hsu <luca_hsu@ilitek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include "ilitek_ts.h"
+#include "ilitek_common.h"
+
+#if ILITEK_PLAT == ILITEK_PLAT_MTK
+
+#define TPD_OK (0)
+
+#ifdef MTK_UNDTS
+static int tpd_keys_local[TPD_KEY_COUNT] = TPD_KEYS;
+static int tpd_keys_dim_local[TPD_KEY_COUNT][4] = TPD_KEYS_DIM;
+struct touch_vitual_key_map_t touch_key_point_maping_array[] = { {key_1}, {key_2}, {key_3}, {key_4} };
+
+static struct i2c_board_info __initdata ilitek_i2c_tpd = {
+	I2C_BOARD_INFO(ILITEK_TS_NAME, 0x41)
+};
+#endif
+
+/* probe function is used for matching and initializing input device */
+static int /*__devinit*/ tpd_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	int ret = 0;
+
+	TP_MSG(NULL, "TPD probe\n");
+
+	if (!client) {
+		TP_ERR(NULL, "i2c client is NULL\n");
+		return -1;
+	}
+
+	ret = ilitek_main_probe(client, &client->dev);
+	if (ret == 0)	// If probe is success, then enable the below flag.
+		tpd_load_status = 1;
+
+	TP_MSG(NULL, "TPD probe done\n");
+	return TPD_OK;
+}
+
+static int tpd_detect(struct i2c_client *client, struct i2c_board_info *info)
+{
+	strcpy(info->type, TPD_DEVICE);
+	return TPD_OK;
+}
+
+static int /*__devexit*/ tpd_remove(struct i2c_client *client)
+{
+	TP_MSG(NULL, "TPD removed\n");
+	return ilitek_main_remove(client);
+}
+
+/* The I2C device list is used for matching I2C device and I2C device driver. */
+static const struct i2c_device_id tpd_device_id[] = {
+	{ILITEK_TS_NAME, 0},
+	{},			/* should not omitted */
+};
+
+MODULE_DEVICE_TABLE(i2c, tpd_device_id);
+
+const struct of_device_id touch_dt_match_table[] = {
+	{ .compatible = "mediatek,cap_touch",},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, touch_dt_match_table);
+
+static struct i2c_driver tpd_i2c_driver = {
+
+	.driver = {
+		.name = ILITEK_TS_NAME,
+		.of_match_table = of_match_ptr(touch_dt_match_table),
+	},
+	.probe = tpd_probe,
+	.remove = tpd_remove,
+	.id_table = tpd_device_id,
+	.detect = tpd_detect,
+};
+
+static int tpd_local_init(void)
+{
+	TP_MSG(NULL, "TPD init device driver\n");
+
+	if (i2c_add_driver(&tpd_i2c_driver) != 0) {
+		TP_ERR(NULL, "Unable to add i2c driver.\n");
+		return -1;
+	}
+	if (tpd_load_status == 0) {
+		TP_ERR(NULL, "Add error touch panel driver.\n");
+		i2c_del_driver(&tpd_i2c_driver);
+		return -1;
+	}
+#ifndef MTK_UNDTS
+	if (tpd_dts_data.use_tpd_button)
+		tpd_button_setting(tpd_dts_data.tpd_key_num, tpd_dts_data.tpd_key_local, tpd_dts_data.tpd_key_dim_local);
+
+#else
+	tpd_button_setting(TPD_KEY_COUNT, tpd_keys_local, tpd_keys_dim_local);	// initialize tpd button data
+#endif
+	tpd_type_cap = 1;
+	TP_MSG(NULL, "TPD init done\n");
+	return TPD_OK;
+}
+
+#ifdef MTK_UNDTS
+static void tpd_resume(struct early_suspend *h)
+{
+#else
+static void tpd_resume(struct device *h)
+{
+#endif
+	TP_MSG(NULL, "TPD wake up\n");
+	ilitek_resume();
+	TP_MSG(NULL, "TPD wake up done\n");
+}
+
+#ifdef MTK_UNDTS
+static void tpd_suspend(struct early_suspend *h)
+{
+#else
+static void tpd_suspend(struct device *h)
+{
+#endif
+	TP_MSG(NULL, "TPD enter sleep\n");
+	ilitek_suspend();
+	TP_MSG(NULL, "TPD enter sleep done\n");
+}
+
+static struct tpd_driver_t tpd_device_driver = {
+	.tpd_device_name = ILITEK_TS_NAME,
+	.tpd_local_init = tpd_local_init,
+	.suspend = tpd_suspend,
+	.resume = tpd_resume,
+	.tpd_have_button = 1,
+};
+
+static int __init ilitek_touch_driver_init(void)
+{
+	TP_MSG(NULL, "touch panel driver init\n");
+
+#ifdef MTK_UNDTS
+	i2c_register_board_info(2, &ilitek_i2c_tpd, 1);
+#else
+	tpd_get_dts_info();
+#endif
+	if (tpd_driver_add(&tpd_device_driver) < 0)
+		TP_ERR(NULL, "TPD add TP driver failed\n");
+
+	return 0;
+
+}
+
+static void __exit ilitek_touch_driver_exit(void)
+{
+	TP_MSG(NULL, "touch panel driver exit\n");
+	tpd_driver_remove(&tpd_device_driver);
+}
+
+#else
+
+#ifdef ILITEK_SPI_INTERFACE
+static int ilitek_touch_driver_probe(struct spi_device *spi)
+{
+	int error;
+
+	spi->bits_per_word = 8;
+	spi->mode = SPI_MODE_0;
+	error = spi_setup(spi);
+	if (error < 0) {
+		TP_ERR(NULL, "SPI setup failed, err: %d\n", error);
+		return error;
+	}
+
+	TP_MSG(NULL, "SPI start probe, max_speed_hz: %d\n", spi->max_speed_hz);
+
+	return ilitek_main_probe(spi, &spi->dev);
+}
+
+static REMOVE_FUNC(ilitek_touch_driver_remove, struct spi_device *spi)
+{
+	REMOVE_RETURN(ilitek_main_remove(spi));
+}
+#else
+static I2C_PROBE_FUNC(ilitek_touch_driver_probe, struct i2c_client *client)
+{
+	if (!client) {
+		TP_ERR(NULL, "i2c client is NULL\n");
+		return -ENODEV;
+	}
+
+	TP_MSG(NULL, "ILITEK client->addr: 0x%x, client->irq: %d\n",
+		client->addr, client->irq);
+
+	return ilitek_main_probe(client, &client->dev);
+}
+
+static REMOVE_FUNC(ilitek_touch_driver_remove, struct i2c_client *client)
+{
+	REMOVE_RETURN(ilitek_main_remove(client));
+}
+#endif
+
+#ifdef CONFIG_OF
+static struct of_device_id ilitek_touch_match_table[] = {
+	{.compatible = "tchip,ilitek",},
+	{},
+};
+#endif
+
+static const struct i2c_device_id ilitek_touch_device_id[] = {
+	{ILITEK_TS_NAME, 0},
+	{},			/* should not omitted */
+};
+MODULE_DEVICE_TABLE(i2c, ilitek_touch_device_id);
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id ilitekts_acpi_id[] = {
+	{"ILIT2901", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, ilitekts_acpi_id);
+#endif
+
+
+#ifndef ILITEK_REGISTER_SUSPEND_RESUME
+static int __maybe_unused ilitek_ts_suspend(struct device *dev)
+{
+	ilitek_suspend();
+	return 0;
+}
+
+static int __maybe_unused ilitek_ts_resume(struct device *dev)
+{
+	ilitek_resume();
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(ilitek_pm_ops, ilitek_ts_suspend, ilitek_ts_resume);
+#endif
+
+#ifdef ILITEK_SPI_INTERFACE
+static struct spi_driver ilitek_touch_device_driver = {
+#else
+static struct i2c_driver ilitek_touch_device_driver = {
+#endif
+	.driver = {
+		.name = ILITEK_TS_NAME,
+		.owner = THIS_MODULE,
+#ifdef CONFIG_OF
+		.of_match_table = ilitek_touch_match_table,
+#endif
+#ifdef CONFIG_ACPI
+		.acpi_match_table = ACPI_PTR(ilitekts_acpi_id),
+#endif
+
+#ifndef ILITEK_REGISTER_SUSPEND_RESUME
+		.pm = &ilitek_pm_ops,
+#endif
+	},
+
+	.probe = ilitek_touch_driver_probe,
+	.remove = ilitek_touch_driver_remove,
+
+#if !defined(ILITEK_SPI_INTERFACE)
+	.id_table = ilitek_touch_device_id,
+#endif
+};
+
+#if ILITEK_PLAT == ILITEK_PLAT_ALLWIN
+static const unsigned short normal_i2c[2] = { 0x41, I2C_CLIENT_END };
+struct ctp_config_info config_info = {
+	.input_type = CTP_TYPE,
+	.name = NULL,
+	.int_number = 0,
+};
+
+static int twi_id;
+static int screen_max_x;
+static int screen_max_y;
+static int revert_x_flag;
+static int revert_y_flag;
+static int exchange_x_y_flag;
+static int ctp_get_system_config(void)
+{
+	twi_id = config_info.twi_id;
+	screen_max_x = config_info.screen_max_x;
+	screen_max_y = config_info.screen_max_y;
+	TP_MSG(NULL, "Ilitek: screen_max_x = %d\n", screen_max_x);
+	revert_x_flag = config_info.revert_x_flag;
+	revert_y_flag = config_info.revert_y_flag;
+	exchange_x_y_flag = config_info.exchange_x_y_flag;
+	if ((screen_max_x == 0) || (screen_max_y == 0)) {
+		TP_ERR(NULL, "%s:read config error!\n", __func__);
+		return -1;
+	}
+	return 0;
+}
+
+int ctp_ts_detect(struct i2c_client *client, struct i2c_board_info *info)
+{
+	struct i2c_adapter *adapter = client->adapter;
+
+	if (twi_id == adapter->nr) {
+		strlcpy(info->type, ILITEK_TS_NAME, I2C_NAME_SIZE);
+		return 0;
+	} else {
+		return -ENODEV;
+	}
+}
+
+static struct i2c_board_info i2c_info_dev = {
+	I2C_BOARD_INFO(ILITEK_TS_NAME, 0x41),
+	.platform_data = NULL,
+};
+
+static int add_ctp_device(void)
+{
+	struct i2c_adapter *adap;
+	//script_parser_fetch("ctp_para", "ctp_twi_id", &twi_id, 1);
+	adap = i2c_get_adapter(twi_id);
+	i2c_new_device(adap, &i2c_info_dev);
+	return 0;
+}
+
+static int ilitek_init_allwin(void)
+{
+
+	int ret = 0;
+
+	if (input_fetch_sysconfig_para(&(config_info.input_type))) {
+		TP_ERR(NULL, "Ilitek:  ctp_fetch_sysconfig_para err.\n");
+		return -1;
+	} else {
+		ret = input_init_platform_resource(&(config_info.input_type));
+		if (0 != ret)
+			TP_ERR(NULL, "Ilitek: ctp_ops.init_platform_resource err.\n");
+	}
+
+	if (config_info.ctp_used == 0) {
+		TP_ERR(NULL, "Ilitek: *** if use ctp,please put the sys_config.fex ctp_used set to 1.\n");
+		return -1;
+	}
+
+	if (ctp_get_system_config() < 0)
+		TP_ERR(NULL, "Ilitek: %s:read config fail!\n", __func__);
+
+	add_ctp_device();
+	ilitek_touch_device_driver.address_list = normal_i2c;
+	ilitek_touch_device_driver.detect = ctp_ts_detect;
+	return 0;
+
+}
+
+#endif
+static int __init ilitek_touch_driver_init(void)
+{
+#if ILITEK_PLAT == ILITEK_PLAT_ALLWIN
+	if (ilitek_init_allwin() < 0) {
+		TP_ERR(NULL, "ilitek_init_allwin failed.\n");
+		return -ENODEV;
+	}
+#endif
+
+	TP_MSG(NULL, "add ILITEK touch device driver\n");
+
+#ifdef ILITEK_SPI_INTERFACE
+	return spi_register_driver(&ilitek_touch_device_driver);
+#else
+	return i2c_add_driver(&ilitek_touch_device_driver);
+#endif
+}
+
+static void __exit ilitek_touch_driver_exit(void)
+{
+	TP_MSG(NULL, "remove touch device driver i2c driver.\n");
+
+#ifdef ILITEK_SPI_INTERFACE
+	spi_unregister_driver(&ilitek_touch_device_driver);
+#else
+	i2c_del_driver(&ilitek_touch_device_driver);
+#endif
+}
+#endif
+
+module_init(ilitek_touch_driver_init);
+module_exit(ilitek_touch_driver_exit);
+MODULE_AUTHOR("ILITEK");
+MODULE_LICENSE("GPL");
diff --git a/drivers/input/touchscreen/ilitek/ilitek_protocol.c b/drivers/input/touchscreen/ilitek/ilitek_protocol.c
new file mode 100644
index 000000000000..945bab688405
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_protocol.c
@@ -0,0 +1,3644 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is part of ILITEK CommonFlow
+ *
+ * Copyright (c) 2022 ILI Technology Corp.
+ * Copyright (c) 2022 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (c) 2022 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#include "ilitek_protocol.h"
+
+typedef int (*protocol_func_t)(struct ilitek_ts_device *, void *);
+
+struct protocol_map {
+	u8 cmd;
+	u8 flag;
+	protocol_func_t func;
+	const char *desc;
+};
+
+static struct {
+	unsigned int size;
+	unsigned int max_cnt;
+} touch_fmts[touch_fmt_max];
+
+static struct {
+	unsigned int size;
+	unsigned int max_cnt;
+} pen_fmts[pen_fmt_max];
+
+#define X(_cmd, _protocol, _cmd_id, _api) \
+	static int _api(struct ilitek_ts_device *, void *);
+ILITEK_CMD_MAP
+#undef X
+
+#define X(_cmd, _protocol, _cmd_id, _api) {_cmd, _protocol, _api, #_cmd_id},
+struct protocol_map protocol_maps[] = { ILITEK_CMD_MAP };
+#undef X
+
+u16 le16(const u8 *p)
+{
+	return p[0] | p[1] << 8;
+}
+
+u16 be16(const u8 *p)
+{
+	return p[1] | p[0] << 8;
+}
+
+u32 le32(const u8 *p, int bytes)
+{
+	u32 val = 0;
+
+	while (bytes--)
+		val += (p[bytes] << (8 * bytes));
+
+	return val;
+}
+
+u32 be32(const u8 *p, int bytes)
+{
+	u32 val = 0;
+
+	while (bytes--)
+		val = (val << 8) | (*p++);
+
+	return val;
+}
+
+static bool is_2501x(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if (!dev)
+		return false;
+
+	if (!strcmp(dev->mcu_info.ic_name, "25011") ||
+	    !strcmp(dev->mcu_info.ic_name, "25012"))
+		return true;
+
+	return false;
+}
+
+bool is_29xx(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if (!dev)
+		return false;
+
+	if (!strcmp(dev->mcu_info.ic_name, "2900") ||
+	    !strcmp(dev->mcu_info.ic_name, "2901") ||
+	    !strcmp(dev->mcu_info.ic_name, "2910") ||
+	    !strcmp(dev->mcu_info.ic_name, "2911") ||
+	    !strcmp(dev->mcu_info.ic_name, "2531") ||
+	    !strcmp(dev->mcu_info.ic_name, "2532") ||
+	    !strcmp(dev->mcu_info.ic_name, "2921") ||
+	    !strcmp(dev->mcu_info.ic_name, "2901M") ||
+	    is_2501x(handle))
+		return true;
+
+	return false;
+}
+
+bool _is_231x(char *ic_name)
+{
+	if (!strcmp(ic_name, "2312") || !strcmp(ic_name, "2315"))
+		return true;
+
+	return false;
+}
+
+bool is_231x(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if (!dev)
+		return false;
+
+	return _is_231x(dev->mcu_info.ic_name);
+}
+
+bool has_hw_key(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if (!handle || !dev->tp_info.key_num)
+		return false;
+
+	if (dev->key.info.mode == key_hw ||
+	    dev->key.info.mode == key_hsw)
+		return true;
+
+	return false;
+}
+
+u8 get_protocol_ver_flag(u32 ver)
+{
+	if (((ver >> 16) & 0xFF) == 0x3 ||
+	     (ver & 0xFFFF00) == BL_PROTOCOL_V1_6 ||
+	     (ver & 0xFFFF00) == BL_PROTOCOL_V1_7)
+		return PTL_V3;
+
+	if (((ver >> 16) & 0xFF) == 0x6 ||
+	    (ver & 0xFFFF00) == BL_PROTOCOL_V1_8)
+		return PTL_V6;
+
+	return PTL_ANY;
+}
+
+void grid_reset(struct grids *grid)
+{
+	grid->mc.need_update = false;
+	grid->sc_x.need_update = false;
+	grid->sc_y.need_update = false;
+	grid->pen_x.need_update = false;
+	grid->pen_y.need_update = false;
+
+	grid->key_mc.need_update = false;
+	grid->key_x.need_update = false;
+	grid->key_y.need_update = false;
+
+	grid->self.need_update = false;
+
+	if (grid->mc.data)
+		_memset(grid->mc.data, 0,
+		       grid->mc.X * grid->mc.Y * sizeof(s32));
+	if (grid->sc_x.data)
+		_memset(grid->sc_x.data, 0,
+		grid->sc_x.X * grid->sc_x.Y * sizeof(s32));
+	if (grid->sc_y.data)
+		_memset(grid->sc_y.data, 0,
+		grid->sc_y.X * grid->sc_y.Y * sizeof(s32));
+	if (grid->pen_x.data)
+		_memset(grid->pen_x.data, 0,
+		grid->pen_x.X * grid->pen_x.Y * sizeof(s32));
+	if (grid->pen_y.data)
+		_memset(grid->pen_y.data, 0,
+		grid->pen_y.X * grid->pen_y.Y * sizeof(s32));
+
+	if (grid->key_mc.data)
+		_memset(grid->key_mc.data, 0,
+		grid->key_mc.X * grid->key_mc.Y * sizeof(s32));
+	if (grid->key_x.data)
+		_memset(grid->key_x.data, 0,
+		grid->key_x.X * grid->key_x.Y * sizeof(s32));
+	if (grid->key_y.data)
+		_memset(grid->key_y.data, 0,
+		grid->key_y.X * grid->key_y.Y * sizeof(s32));
+
+	if (grid->self.data)
+		_memset(grid->self.data, 0,
+		grid->self.X * grid->self.Y * sizeof(s32));
+
+	grid->dmsg.pen_need_update = false;
+	grid->dmsg.touch_need_update = false;
+	_memset(grid->dmsg.touch, 0, sizeof(grid->dmsg.touch));
+	_memset(grid->dmsg.pen, 0, sizeof(grid->dmsg.pen));
+}
+
+void grid_free(struct grids *grid)
+{
+	if (grid->mc.data)
+		CFREE(grid->mc.data);
+	if (grid->sc_x.data)
+		CFREE(grid->sc_x.data);
+	if (grid->sc_y.data)
+		CFREE(grid->sc_y.data);
+	if (grid->pen_x.data)
+		CFREE(grid->pen_x.data);
+	if (grid->pen_y.data)
+		CFREE(grid->pen_y.data);
+
+	if (grid->key_mc.data)
+		CFREE(grid->key_mc.data);
+	if (grid->key_x.data)
+		CFREE(grid->key_x.data);
+	if (grid->key_y.data)
+		CFREE(grid->key_y.data);
+
+	if (grid->self.data)
+		CFREE(grid->self.data);
+}
+
+int grid_alloc(void *handle, struct grids *grid)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int X, Y, key;
+
+	_memset(grid, 0, sizeof(*grid));
+
+	if (!dev)
+		return -EINVAL;
+
+	X = dev->tp_info.x_ch;
+	Y = dev->tp_info.y_ch;
+	key = dev->tp_info.key_num;
+
+	grid->mc.data = (s32 *)CALLOC(X * Y, sizeof(s32));
+	grid->sc_x.data = (s32 *)CALLOC(X, sizeof(s32));
+	grid->sc_y.data = (s32 *)CALLOC(Y, sizeof(s32));
+	grid->pen_x.data = (s32 *)CALLOC(X * 8, sizeof(s32));
+	grid->pen_y.data = (s32 *)CALLOC(Y * 8, sizeof(s32));
+	grid->key_mc.data = (s32 *)CALLOC(key, sizeof(s32));
+	grid->key_x.data = (s32 *)CALLOC(key, sizeof(s32));
+	grid->key_y.data = (s32 *)CALLOC(1, sizeof(s32));
+	grid->self.data = (s32 *)CALLOC(4, sizeof(s32));
+	if (!grid->mc.data || !grid->sc_x.data || !grid->sc_y.data ||
+	    !grid->pen_x.data || !grid->pen_y.data || !grid->key_mc.data ||
+	    !grid->key_x.data || !grid->key_y.data || !grid->self.data)
+		goto err_free;
+
+	grid->mc.X = X; grid->mc.Y = Y;
+	grid->sc_x.X = X; grid->sc_x.Y = 1;
+	grid->sc_y.X = 1; grid->sc_y.Y = Y;
+	grid->pen_x.X = X; grid->pen_x.Y = 8;
+	grid->pen_y.X = 8; grid->pen_y.Y = Y;
+
+	grid->key_mc.X = key; grid->key_mc.Y = 1;
+	grid->key_x.X = key; grid->key_x.Y = 1;
+	grid->key_y.X = 1; grid->key_y.Y = 1;
+
+	grid->self.X = 4, grid->self.Y = 1;
+
+	grid_reset(grid);
+
+	return 0;
+
+err_free:
+	grid_free(grid);
+
+	return -ENOMEM;
+}
+
+static u16 update_crc(u16 crc, u8 newbyte)
+{
+	char i;
+		const u16 crc_poly = 0x8408;
+
+	crc ^= newbyte;
+
+	for (i = 0; i < 8; i++) {
+		if (crc & 0x01)
+			crc = (crc >> 1) ^ crc_poly;
+		else
+			crc = crc >> 1;
+	}
+
+	return crc;
+}
+
+u16 get_crc(u32 start, u32 end,
+	    u8 *buf, u32 buf_size)
+{
+	u16 crc = 0;
+	u32 i;
+
+	if (end > buf_size || start > buf_size) {
+		TP_WARN(NULL, "start/end addr: 0x%x/0x%x buf size: 0x%x OOB\n",
+			start, end, buf_size);
+		return 0;
+	}
+
+	for (i = start; i < end && i < buf_size; i++)
+		crc = update_crc(crc, buf[i]);
+
+	return crc;
+}
+
+u32 get_checksum(u32 start, u32 end,
+		 u8 *buf, u32 buf_size)
+{
+	u32 sum = 0;
+	u32 i;
+
+	if (end > buf_size || start > buf_size) {
+		TP_WARN(NULL, "start/end addr: 0x%x/0x%x buf size: 0x%x OOB\n",
+			start, end, buf_size);
+		return 0;
+	}
+
+	for (i = start; i < end && i < buf_size; i++)
+		sum += buf[i];
+
+	return sum;
+}
+
+bool is_checksum_matched(u8 checksum, int start, int end,
+			 u8 *buf, int buf_size)
+{
+	u8 check;
+
+	check = ~(get_checksum(start, end, buf, buf_size)) + 1;
+	if (check != checksum) {
+		TP_ERR_ARR(NULL, "[data]", TYPE_U8, end - start, buf + start);
+		TP_ERR(NULL, "checksum : 0x%02x/0x%02x not matched\n",
+			check, checksum);
+		return false;
+	}
+
+	return true;
+}
+
+bool support_mcu_info(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if ((dev->ic[0].mode == BL_MODE && dev->protocol.ver < 0x010803) ||
+	    (dev->ic[0].mode == AP_MODE && dev->protocol.ver < 0x060009))
+		return false;
+
+	return true;
+}
+
+bool support_sensor_id(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if ((dev->ic[0].mode == BL_MODE && dev->protocol.ver < 0x010803) ||
+		(dev->ic[0].mode == AP_MODE && dev->protocol.ver < 0x060004))
+		return false;
+
+	return true;
+}
+
+bool support_production_info(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if ((dev->ic[0].mode == BL_MODE && dev->protocol.ver < 0x010803) ||
+	    (dev->ic[0].mode == AP_MODE && dev->protocol.ver < 0x060007))
+		return false;
+
+	return true;
+}
+
+bool support_fwid(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if ((dev->ic[0].mode == BL_MODE && dev->protocol.ver < 0x010802) ||
+		(dev->ic[0].mode == AP_MODE && dev->protocol.ver < 0x060007))
+		return false;
+
+	return true;
+}
+
+bool support_power_status(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if ((dev->ic[0].mode == BL_MODE) ||
+	    (dev->ic[0].mode == AP_MODE && dev->protocol.ver < 0x06000a))
+		return false;
+
+	return true;
+}
+
+int bridge_set_int_monitor(void *handle, bool enable)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	u8 wbuf[64];
+
+	_memset(wbuf, 0, sizeof(wbuf));
+	wbuf[0] = 0x03;
+	wbuf[1] = 0xf3;
+	wbuf[2] = (enable) ? 0x01 : 0x00;
+
+	return write_then_read_direct(dev, wbuf, 3, NULL, 0);
+}
+
+int bridge_set_test_mode(void *handle, bool enable)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	u8 wbuf[64];
+
+	_memset(wbuf, 0, sizeof(wbuf));
+	wbuf[0] = 0x03;
+	wbuf[1] = 0xf2;
+	wbuf[2] = (enable) ? 0x01 : 0x00;
+
+	return write_then_read_direct(dev, wbuf, 3, NULL, 0);
+}
+
+int reset_helper(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	bool need_re_enum = true;
+
+	if (dev->_interface == interface_i2c) {
+		/* sw reset if no reset-gpio found */
+		if (!dev->cb.hw_reset ||
+		    dev->cb.hw_reset(dev->reset_time, dev->_private) < 0)
+			return api_protocol_set_cmd(dev, SET_SW_RST,
+						    &need_re_enum);
+
+		return 0;
+	}
+
+	return api_protocol_set_cmd(dev, SET_SW_RST, &need_re_enum);
+}
+
+static int re_enum_helper(struct ilitek_ts_device *dev, u8 enum_type)
+{
+	int error;
+	int retry = 5;
+
+	if (!dev->cb.re_enum)
+		return -EINVAL;
+
+	do {
+		error = dev->cb.re_enum(enum_type, dev->_private);
+		if (!error)
+			return 0;
+
+		TP_WARN(dev->id, "re-enum failed, error: %d, retry: %d\n", error, retry);
+		dev->cb.delay_ms(500);
+	} while (!dev->setting.no_retry && retry--);
+
+	TP_ERR(dev->id, "re-enum retry failed\n");
+
+	return -ENODEV;
+}
+
+int read_interrupt_in(void *handle, u8 *buf, int rlen,
+		      unsigned int timeout_ms)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int error;
+
+	if (!dev->cb.read_interrupt_in)
+		return -EINVAL;
+
+	error = dev->cb.read_interrupt_in(buf, rlen, timeout_ms,
+					   dev->_private);
+	if (error < 0)
+		return error;
+
+	TP_PKT_ARR(dev->id, "[int-in]:", TYPE_U8, rlen, buf);
+
+	return 0;
+}
+
+int read_ctrl_in(void *handle, u8 cmd, u8 *buf, int rlen,
+		 unsigned int timeout_ms)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int error;
+
+	if (!dev->cb.read_ctrl_in)
+		return -EINVAL;
+
+	if (dev->quirks & QUIRK_BRIDGE) {
+		_memset(dev->wbuf, 0, 64);
+
+		dev->wbuf[0] = 0x03;
+		dev->wbuf[1] = 0xA4;
+		dev->wbuf[2] = 0;
+		dev->wbuf[3] = 0;
+		dev->wbuf[4] = (rlen + 6) & 0xFF;
+		dev->wbuf[5] = ((rlen + 6) >> 8) & 0xFF;
+		dev->wbuf[6] = cmd;
+
+		error = dev->cb.write_then_read_direct(dev->wbuf, 64,
+							dev->rbuf, 64, dev->_private);
+		if (error < 0)
+			return error;
+	}
+
+	error = dev->cb.read_ctrl_in(buf, rlen, timeout_ms, dev->_private);
+	if (error < 0)
+		return error;
+
+	TP_PKT_ARR(dev->id, "[ctrl-in]:", TYPE_U8, rlen, buf);
+
+	return 0;
+}
+
+int write_then_read(void *handle, u8 *cmd, int wlen,
+		    u8 *buf, int rlen)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int error;
+
+	if (!dev->cb.write_then_read)
+		return -EINVAL;
+
+	if (wlen > 0)
+		TP_PKT_ARR(dev->id, "[wbuf]:", TYPE_U8, wlen, cmd);
+
+	if (!wlen && (dev->quirks & QUIRK_WIFI_ITS_I2C ||
+	    dev->quirks & QUIRK_BRIDGE)) {
+		_memset(dev->wbuf, 0, 64);
+
+		dev->wbuf[0] = 0x03;
+		dev->wbuf[1] = 0xA3;
+		dev->wbuf[2] = 0;
+		dev->wbuf[3] = rlen;
+
+		error = write_then_read_direct(dev, dev->wbuf, 64, NULL, 0);
+		if (error < 0)
+			return error;
+	}
+
+	error = dev->cb.write_then_read(cmd, wlen, buf, rlen, dev->_private);
+
+	if (rlen > 0)
+		TP_PKT_ARR(dev->id, "[rbuf]:", TYPE_U8, rlen, buf);
+
+	return (error < 0) ? error : 0;
+}
+
+int write_then_read_direct(void *handle, u8 *cmd, int wlen,
+			   u8 *buf, int rlen)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int error;
+
+	if (!dev->cb.write_then_read_direct)
+		return -EINVAL;
+
+	if (wlen > 0)
+		TP_PKT_ARR(dev->id, "[direct-wbuf]:", TYPE_U8, wlen, cmd);
+
+	error = dev->cb.write_then_read_direct(cmd, wlen, buf, rlen,
+					       dev->_private);
+
+	if (rlen > 0)
+		TP_PKT_ARR(dev->id, "[direct-rbuf]:", TYPE_U8, rlen, buf);
+
+	return error;
+}
+
+int write_then_wait_ack(void *handle, u8 *cmd, int wlen, int timeout_ms)
+{
+	int error;
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	struct ilitek_ts_callback *cb = &dev->cb;
+
+	u8 ack_cmd;
+
+	TP_DBG(dev->id, "cmd: 0x" PFMT_X8 ", tout_ms: %d\n",
+		cmd[0], timeout_ms);
+
+	if (dev->quirks & QUIRK_WAIT_ACK_DELAY) {
+		error = write_then_read(dev, cmd, wlen, NULL, 0);
+		if (error < 0)
+			return error;
+
+		cb->delay_ms(dev->setting.wait_ack_delay);
+		return 0;
+	}
+
+	if (dev->setting.no_INT_ack) {
+		/* prevent bridge int handling flow affecting the following read */
+		if (dev->quirks & QUIRK_BRIDGE)
+			bridge_set_int_monitor(dev, false);
+
+		error = write_then_read(dev, cmd, wlen, NULL, 0);
+		if (error < 0)
+			return error;
+
+		/*
+		* for no-INT-ack flow, add delay to prevent
+		* interrupting FW flow too soon, while FW should
+		* be handling previous write command. ex. 0xcd/ 0xc3
+		*/
+		cb->delay_ms(5);
+
+		goto check_busy;
+	}
+
+	if (!cb->init_ack || !cb->wait_ack)
+		return -EINVAL;
+
+	cb->init_ack(timeout_ms, dev->_private);
+	if (dev->quirks & QUIRK_BRIDGE)
+		bridge_set_int_monitor(dev, true);
+
+	error = write_then_read(dev, cmd, wlen, NULL, 0);
+	if (error < 0)
+		return error;
+
+	ack_cmd = (cmd[0] == CMD_ACCESS_SLAVE) ? cmd[2] : cmd[0];
+	error = cb->wait_ack(ack_cmd, timeout_ms, dev->_private);
+
+	if (dev->quirks & QUIRK_BRIDGE)
+		bridge_set_int_monitor(dev, false);
+
+	/* cmd[0] should be ILITEK cmd code */
+	if (error < 0) {
+		TP_WARN(dev->id, "wait 0x" PFMT_X8 " ack %d ms timeout, err: %d\n",
+			cmd[0], timeout_ms, error);
+
+		if (dev->setting.no_retry)
+			return -EILITIME;
+
+		goto check_busy;
+	}
+
+	return 0;
+
+check_busy:
+	return api_check_busy(dev, timeout_ms, 10);
+}
+
+/* Common APIs */
+static int api_protocol_get_scrn_res(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	struct ilitek_screen_info *screen_info;
+
+	UNUSED(data);
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 28);
+	if (error < 0)
+		return error;
+
+	screen_info = (struct ilitek_screen_info *)dev->rbuf;
+
+	dev->screen_info.x_min = screen_info->x_min;
+	dev->screen_info.y_min = screen_info->y_min;
+	dev->screen_info.x_max = screen_info->x_max;
+	dev->screen_info.y_max = screen_info->y_max;
+
+	TP_DBG(dev->id, "screen x: " PFMT_U16 "~" PFMT_U16 ", screen y: " PFMT_U16 "~" PFMT_U16 "\n",
+		dev->screen_info.x_min, dev->screen_info.x_max,
+		dev->screen_info.y_min, dev->screen_info.y_max);
+
+	dev->screen_info.pressure_min = 0;
+	dev->screen_info.pressure_max = 0;
+	dev->screen_info.x_tilt_min = 0;
+	dev->screen_info.x_tilt_max = 0;
+	dev->screen_info.y_tilt_min = 0;
+	dev->screen_info.y_tilt_max = 0;
+	if (dev->protocol.ver > 0x60006) {
+		dev->screen_info.pressure_min = screen_info->pressure_min;
+		dev->screen_info.pressure_max = screen_info->pressure_max;
+		dev->screen_info.x_tilt_min = screen_info->x_tilt_min;
+		dev->screen_info.x_tilt_max = screen_info->x_tilt_max;
+		dev->screen_info.y_tilt_min = screen_info->y_tilt_min;
+		dev->screen_info.y_tilt_max = screen_info->y_tilt_max;
+
+		dev->screen_info.pen_x_min = screen_info->pen_x_min;
+		dev->screen_info.pen_y_min = screen_info->pen_y_min;
+		dev->screen_info.pen_x_max = screen_info->pen_x_max;
+		dev->screen_info.pen_y_max = screen_info->pen_y_max;
+	}
+
+	return 0;
+}
+
+static int api_protocol_get_tp_info_v3(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	struct ilitek_tp_info_v3 *tp_info;
+
+	UNUSED(data);
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 15);
+	if (error < 0)
+		return error;
+
+	tp_info = (struct ilitek_tp_info_v3 *)dev->rbuf;
+
+	dev->tp_info.block_num = 2;
+	dev->tp_info.x_resolution = tp_info->x_resolution;
+	dev->tp_info.y_resolution = tp_info->y_resolution;
+	dev->tp_info.x_ch = tp_info->x_ch;
+	dev->tp_info.y_ch = tp_info->y_ch;
+	dev->tp_info.max_fingers = tp_info->max_fingers;
+	dev->tp_info.key_num = tp_info->key_num;
+
+	dev->tp_info.support_modes = tp_info->support_modes;
+	if (dev->tp_info.support_modes > 3 || !dev->tp_info.support_modes)
+		dev->tp_info.support_modes = 1;
+
+	TP_DBG(dev->id, "touch ch.(start/end) x: " PFMT_U8 "/" PFMT_U8 ", y: " PFMT_U8 "/" PFMT_U8 "\n",
+		tp_info->touch_start_y, tp_info->touch_end_y,
+		tp_info->touch_start_x, tp_info->touch_end_x);
+
+	if (dev->tp_info.key_num) {
+		/* check v3 key is virtual or hw keys */
+		dev->key.info.mode =
+			(tp_info->touch_start_y == 0xff &&
+			 tp_info->touch_end_y == 0xff &&
+			 tp_info->touch_start_x == 0xff &&
+			 tp_info->touch_end_x == 0xff) ?
+			key_hw : key_vitual;
+	}
+
+	return 0;
+}
+
+static int api_protocol_get_tp_info_v6(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	struct ilitek_tp_info_v6 *tp_info;
+	u8 i;
+
+#define X(_enum, _code, _name) {_code, _name},
+	const struct {
+		const int code;
+		const char *str;
+	} pen_modes[] = { STYLUS_MODES };
+#undef X
+
+	UNUSED(data);
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 21);
+	if (error < 0)
+		return error;
+
+	tp_info = (struct ilitek_tp_info_v6 *)dev->rbuf;
+	dev->tp_info.x_resolution = tp_info->x_resolution;
+	dev->tp_info.y_resolution = tp_info->y_resolution;
+	dev->tp_info.x_ch = tp_info->x_ch;
+	dev->tp_info.y_ch = tp_info->y_ch;
+	dev->tp_info.max_fingers = tp_info->max_fingers;
+	dev->tp_info.key_num = tp_info->key_num;
+	dev->tp_info.ic_num = tp_info->ic_num;
+	dev->tp_info.format = tp_info->format;
+	dev->tp_info.support_modes = tp_info->support_modes;
+	dev->tp_info.die_num = tp_info->die_num;
+
+	if (dev->tp_info.format == 5)
+		api_protocol_set_cmd(dev, GET_CRYPTO_INFO, NULL);
+
+	if (dev->tp_info.ic_num > ARRAY_SIZE(dev->ic)) {
+		TP_ERR(dev->id, "invalid ic_num: " PFMT_U8 "\n", dev->tp_info.ic_num);
+		return -EINVAL;
+	}
+	TP_MSG(dev->id, "[Panel Information] Chip count: %u\n",
+		dev->tp_info.ic_num);
+
+	if (dev->tp_info.max_fingers > 40) {
+		TP_ERR(dev->id, "invalid max tp: %d > 40\n",
+			dev->tp_info.max_fingers);
+		return -EINVAL;
+	}
+
+	if (dev->protocol.ver < 0x60003)
+		return 0;
+
+	dev->tp_info.block_num = tp_info->block_num;
+	TP_MSG(dev->id, "[Panel Information] Block Number: " PFMT_U8 "\n",
+		dev->tp_info.block_num);
+
+	if (dev->protocol.ver < 0x60007)
+		return 0;
+
+	dev->tp_info.pen_modes = tp_info->pen_modes;
+
+	_memset(dev->pen_mode, 0, sizeof(dev->pen_mode));
+	if (!dev->tp_info.pen_modes)
+		_strcpy(dev->pen_mode, "Disable",
+			sizeof(dev->pen_mode));
+	for (i = 0; i < ARRAY_SIZE(pen_modes); i++) {
+		if (!(tp_info->pen_modes & pen_modes[i].code))
+			continue;
+
+		if (_strlen(dev->pen_mode))
+			_strcat(dev->pen_mode, ",", sizeof(dev->pen_mode));
+
+		_strcat(dev->pen_mode, pen_modes[i].str,
+			sizeof(dev->pen_mode));
+	}
+
+	TP_DBG(dev->id, "pen_modes: " PFMT_U8 "\n", dev->tp_info.pen_modes);
+	TP_MSG(dev->id, "[Panel Information] Pen Mode: " PFMT_C8 "\n",
+		dev->pen_mode);
+
+	dev->tp_info.pen_format = tp_info->pen_format;
+	dev->tp_info.pen_x_resolution = tp_info->pen_x_resolution;
+	dev->tp_info.pen_y_resolution = tp_info->pen_y_resolution;
+	TP_MSG(dev->id, "[Panel Information] Pen Format: 0x" PFMT_X8 "\n",
+		dev->tp_info.pen_format);
+	TP_MSG(dev->id, "[Panel Information] Pen X/Y resolution: " PFMT_U16 "/" PFMT_U16 "\n",
+		dev->tp_info.pen_x_resolution,
+		dev->tp_info.pen_y_resolution);
+
+	return 0;
+}
+
+static int api_protocol_get_tp_info(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+#define X(_enum, _id, _size, _cnt)	\
+	touch_fmts[_id].size = _size;	\
+	touch_fmts[_id].max_cnt = _cnt;
+
+	ILITEK_TOUCH_REPORT_FORMAT;
+#undef X
+
+#define X(_enum, _id, _size, _cnt)	\
+	pen_fmts[_id].size = _size;	\
+	pen_fmts[_id].max_cnt = _cnt;
+
+	ILITEK_PEN_REPORT_FORMAT;
+#undef X
+
+	if (dev->protocol.flag == PTL_V3)
+		error = api_protocol_get_tp_info_v3(dev, data);
+	else if (dev->protocol.flag == PTL_V6)
+		error = api_protocol_get_tp_info_v6(dev, data);
+	else
+		return -EINVAL;
+
+	if (error < 0)
+		return error;
+
+	if (dev->tp_info.max_fingers > 40) {
+		TP_ERR(dev->id, "invalid max fingers: %d > 40\n",
+			dev->tp_info.max_fingers);
+		return -EINVAL;
+	}
+
+	switch (dev->tp_info.format) {
+	case touch_fmt_0x1:
+	case touch_fmt_0x2:
+	case touch_fmt_0x3:
+	case touch_fmt_0x4:
+	case touch_fmt_0x10:
+		if (dev->setting.default_format_enabled)
+			goto default_fmt_enabled;
+
+		dev->fmt.touch_size = touch_fmts[dev->tp_info.format].size;
+		dev->fmt.touch_max_cnt = touch_fmts[dev->tp_info.format].max_cnt;
+		break;
+
+default_fmt_enabled:
+	default:
+	case touch_fmt_0x11:
+	case touch_fmt_0x0:
+		dev->fmt.touch_size = touch_fmts[touch_fmt_0x0].size;
+		dev->fmt.touch_max_cnt = touch_fmts[touch_fmt_0x0].max_cnt;
+		break;
+	}
+
+	switch (dev->tp_info.pen_format) {
+	case pen_fmt_0x1:
+	case pen_fmt_0x2:
+		dev->fmt.pen_size = pen_fmts[dev->tp_info.pen_format].size;
+		dev->fmt.pen_max_cnt = pen_fmts[dev->tp_info.pen_format].max_cnt;
+		break;
+	default:
+	case pen_fmt_0x0:
+		dev->fmt.pen_size = pen_fmts[pen_fmt_0x0].size;
+		dev->fmt.pen_max_cnt = pen_fmts[pen_fmt_0x0].max_cnt;
+		break;
+	}
+
+	TP_MSG(dev->id, "[Panel Information] X/Y resolution: " PFMT_U16 "/" PFMT_U16 "\n",
+		dev->tp_info.x_resolution, dev->tp_info.y_resolution);
+	TP_MSG(dev->id, "[Panel Information] X/Y channel: " PFMT_U16 "/" PFMT_U16 "\n",
+		dev->tp_info.x_ch, dev->tp_info.y_ch);
+	TP_MSG(dev->id, "[Panel Information] Support " PFMT_U8 " Fingers\n",
+		dev->tp_info.max_fingers);
+	TP_MSG(dev->id, "[Panel Information] Support " PFMT_U8 " Keys\n",
+		dev->tp_info.key_num);
+
+	TP_MSG(dev->id, "[Panel Information] Support " PFMT_U8 " modes\n",
+		dev->tp_info.support_modes);
+
+	TP_DBG(dev->id, "touch format: 0x" PFMT_X8 ", size: %u bytes, max cnt: %u per packet\n",
+		dev->tp_info.format, dev->fmt.touch_size,
+		dev->fmt.touch_max_cnt);
+
+	if (dev->tp_info.key_num > 0) {
+		error = api_protocol_set_cmd(dev, GET_KEY_INFO, NULL);
+		if (error < 0)
+			return error;
+	}
+
+	return 0;
+}
+
+static int api_protocol_get_key_info_v3(struct ilitek_ts_device *dev,
+					void *data)
+{
+	int error;
+	struct ilitek_key_info_v3 *key_info;
+	unsigned int i;
+
+	UNUSED(data);
+
+	/* Only i2c interface has key for V3 */
+	if (dev->_interface != interface_i2c)
+		return 0;
+
+	if (dev->tp_info.key_num > 20) {
+		TP_ERR(dev->id, "key count: " PFMT_U8 " invalid\n", dev->tp_info.key_num);
+		return -EINVAL;
+	}
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 29);
+	if (error < 0)
+		return error;
+
+	for (i = 0; dev->tp_info.key_num > 5U &&
+	     i < DIV_ROUND_UP(dev->tp_info.key_num, 5U) - 1U; i++) {
+		TP_MSG(dev->id, "read keyinfo again, i: %u\n", i);
+		error = write_then_read(dev, NULL, 0,
+					dev->rbuf + 29 + 5 * i, 25);
+		if (error < 0)
+			return error;
+	}
+
+	key_info = (struct ilitek_key_info_v3 *)dev->rbuf;
+	dev->key.info.x_len = be16(key_info->x_len);
+	dev->key.info.y_len = be16(key_info->y_len);
+	TP_MSG(dev->id, "key_x_len: " PFMT_U16 ", key_y_len: " PFMT_U16 "\n",
+		dev->key.info.x_len, dev->key.info.y_len);
+
+	for (i = 0; i < dev->tp_info.key_num; i++) {
+		dev->key.info.keys[i].id = key_info->keys[i].id;
+		dev->key.info.keys[i].x = be16(key_info->keys[i].x);
+		dev->key.info.keys[i].y = be16(key_info->keys[i].y);
+		TP_MSG(dev->id, "key[%u] id: " PFMT_U8 ", x: " PFMT_U16 ", y: " PFMT_U16 "\n", i,
+			dev->key.info.keys[i].id, dev->key.info.keys[i].x,
+			dev->key.info.keys[i].y);
+	}
+
+	return 0;
+}
+
+static int api_protocol_get_key_info_v6(struct ilitek_ts_device *dev,
+					void *data)
+{
+	int error;
+	struct ilitek_key_info_v6 *key_info;
+	unsigned int i, offset;
+
+	UNUSED(data);
+
+	if (dev->tp_info.key_num > ARRAY_SIZE(dev->key.info.keys)) {
+		TP_ERR(dev->id, "exception keycount " PFMT_U8 " > %d\n", dev->tp_info.key_num,
+			(int)ARRAY_SIZE(dev->key.info.keys));
+		return -EINVAL;
+	}
+
+	switch (dev->_interface) {
+	case interface_i2c:
+		if (dev->quirks & QUIRK_WIFI_ITS_I2C ||
+		    dev->quirks & QUIRK_BRIDGE) {
+			error = write_then_read(dev, dev->wbuf, 1, NULL, 0);
+			if (error < 0)
+				return error;
+			error = read_ctrl_in(dev, CMD_GET_KEY_INFO,
+					     dev->rbuf,
+					     5 + dev->tp_info.key_num * 5, 2000);
+			if (error < 0)
+				return error;
+			offset = (dev->quirks & QUIRK_BRIDGE) ? 1 : 0;
+		} else {
+			error = write_then_read(dev, dev->wbuf, 1,
+						dev->rbuf, 5 + dev->tp_info.key_num * 5);
+			if (error < 0)
+				return error;
+			offset = 0;
+		}
+		break;
+
+	case interface_usb:
+		error = write_then_read(dev, dev->wbuf, 1, NULL, 0);
+		if (error < 0)
+			return error;
+		error = write_then_read(dev, NULL, 0, dev->rbuf, 256);
+		if (error < 0)
+			return error;
+		offset = 6;
+		break;
+	case interface_hid_over_i2c:
+		error = write_then_read(dev, dev->wbuf, 1, NULL, 0);
+		if (error < 0)
+			return error;
+		error = write_then_read(dev, NULL, 0, dev->rbuf, 256);
+		if (error < 0)
+			return error;
+		offset = 4;
+		break;
+	default: return -EINVAL;
+	};
+
+	key_info = (struct ilitek_key_info_v6 *)(dev->rbuf + offset);
+	dev->key.info.mode = key_info->mode;
+	TP_MSG(dev->id, "[Panel Information] key mode: " PFMT_U8 "\n", dev->key.info.mode);
+
+	dev->key.info.x_len = key_info->x_len;
+	dev->key.info.y_len = key_info->y_len;
+	TP_MSG(dev->id, "key_x_len: " PFMT_U16 ", key_y_len: " PFMT_U16 "\n",
+		dev->key.info.x_len, dev->key.info.y_len);
+
+	for (i = 0; i < dev->tp_info.key_num; i++) {
+		dev->key.info.keys[i].id = key_info->keys[i].id;
+		dev->key.info.keys[i].x = key_info->keys[i].x;
+		dev->key.info.keys[i].y = key_info->keys[i].y;
+		TP_MSG(dev->id, "key[%u] id: " PFMT_U8 ", x: " PFMT_U16 ", y: " PFMT_U16 "\n", i,
+			dev->key.info.keys[i].id, dev->key.info.keys[i].x,
+			dev->key.info.keys[i].y);
+	}
+
+	return 0;
+}
+
+static int api_protocol_get_key_info(struct ilitek_ts_device *dev, void *data)
+{
+	if (dev->protocol.flag == PTL_V3)
+		return api_protocol_get_key_info_v3(dev, data);
+	else if (dev->protocol.flag == PTL_V6)
+		return api_protocol_get_key_info_v6(dev, data);
+
+	return -EINVAL;
+}
+
+static int api_protocol_get_ptl_ver(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	dev->protocol.flag = PTL_V6;
+	dev->reset_time = 1000;
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 3);
+	if (error < 0)
+		return error;
+
+	dev->protocol.ver = (dev->rbuf[0] << 16) + (dev->rbuf[1] << 8) +
+			     dev->rbuf[2];
+	TP_MSG(dev->id, "[Protocol Version]: %x.%x.%x\n",
+		(dev->protocol.ver >> 16) & 0xFF,
+		(dev->protocol.ver >> 8) & 0xFF,
+		dev->protocol.ver & 0xFF);
+
+	dev->protocol.flag = get_protocol_ver_flag(dev->protocol.ver);
+	switch (dev->protocol.flag) {
+	case PTL_V3:
+		dev->reset_time = 200;
+		break;
+	case PTL_V6:
+		dev->reset_time = 600;
+		break;
+	default:
+		TP_ERR(dev->id, "unrecognized protocol ver.: 0x%x\n",
+			dev->protocol.ver);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int api_protocol_get_fw_ver(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 8);
+	if (error < 0)
+		return error;
+
+	_memcpy(dev->fw_ver, dev->rbuf, 8);
+
+	if (dev->ic[0].mode == BL_MODE) {
+		TP_MSG_ARR(dev->id, "[BL Firmware Version]", TYPE_U8,
+			   8, dev->fw_ver);
+	} else {
+		TP_MSG_ARR(dev->id, "[FW Version]", TYPE_U8, 4, dev->fw_ver);
+		TP_MSG_ARR(dev->id, "[Customer Version]", TYPE_U8,
+			   4, dev->fw_ver + 4);
+	}
+
+	return 0;
+}
+
+static int api_protocol_get_mcu_mode(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	u8 i, ic_num = (data) ? *(u8 *)data : 1;
+
+	if (ic_num > ARRAY_SIZE(dev->ic))
+		return -EINVAL;
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 2 * ic_num);
+	if (error < 0)
+		return error;
+
+	for (i = 0; i < ic_num; i++) {
+		dev->ic[i].mode = dev->rbuf[i * 2];
+
+		if (dev->ic[i].mode == AP_MODE)
+			_sprintf(dev->ic[i].mode_str, 0, "AP");
+		else if (dev->ic[i].mode == BL_MODE)
+			_sprintf(dev->ic[i].mode_str, 0, "BL");
+		else
+			_sprintf(dev->ic[i].mode_str, 0, "UNKNOWN");
+	}
+
+	TP_MSG(dev->id, "[Current Mode] Master: 0x" PFMT_X8 " " PFMT_C8 "\n",
+		dev->ic[0].mode, dev->ic[0].mode_str);
+	for (i = 1; i < ic_num; i++)
+		TP_MSG(dev->id, "[Current Mode] Slave[" PFMT_U8 "]: 0x" PFMT_X8 " " PFMT_C8 "\n",
+			i, dev->ic[i].mode, dev->ic[i].mode_str);
+
+	return 0;
+}
+
+static int api_protocol_power_status(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	u8 func, lvd_level_sel;
+
+	if (!data)
+		return -EFAULT;
+
+	if (!support_power_status(dev)) {
+		_memset(&dev->pwr, 0, sizeof(dev->pwr));
+		return 0;
+	}
+
+	func = ((*(u16 *)data) >> 8) & 0xff;
+	lvd_level_sel = (*(u16 *)data) & 0xff;
+
+	dev->wbuf[1] = func;
+	switch (func) {
+	/* get level select */
+	case 0x02:
+		dev->wbuf[2] = lvd_level_sel;
+		return write_then_read(dev, dev->wbuf, 3, NULL, 0);
+
+	/* clear flag */
+	case 0x00:
+		return write_then_read(dev, dev->wbuf, 2, NULL, 0);
+
+	/* get flag */
+	case 0x01:
+		error = write_then_read(dev, dev->wbuf, 2,
+					dev->rbuf, 4);
+		if (error < 0)
+			return error;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	dev->pwr.header = be16(dev->rbuf);
+	dev->pwr.vdd33_lvd_flag = dev->rbuf[2];
+	dev->pwr.vdd33_lvd_level_sel = dev->rbuf[3];
+
+	TP_DBG(dev->id, "[Power-Status] header: 0x" PFMT_X16 ", flag: 0x" PFMT_X8 ", level_sel: 0x" PFMT_X8 "\n",
+		dev->pwr.header, dev->pwr.vdd33_lvd_flag,
+		dev->pwr.vdd33_lvd_level_sel);
+
+	return 0;
+}
+
+static int api_protocol_get_sensor_id(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	/* return 0 to skip error check */
+	if (!support_sensor_id(dev))
+		return 0;
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 3);
+	if (error < 0)
+		return error;
+
+	dev->sensor.header = be16(dev->rbuf);
+	dev->sensor.id = dev->rbuf[2];
+
+	TP_MSG(dev->id, "[Sensor ID] header: 0x" PFMT_X16 ", id: 0x" PFMT_X8 "\n",
+		dev->sensor.header,
+		(u8)(dev->sensor.id & dev->setting.sensor_id_mask));
+
+	return 0;
+}
+
+static int api_protocol_get_product_info(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	/* return 0 to skip error check */
+	if (!support_production_info(dev))
+		return 0;
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 8);
+	if (error < 0)
+		return error;
+
+	_memcpy(dev->product_info, dev->rbuf, 8);
+
+	TP_MSG_ARR(dev->id, "[Production Info]", TYPE_U8, 8, dev->product_info);
+
+	return 0;
+}
+
+static int api_protocol_get_fwid(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	/* return 0 to skip error check */
+	if (!support_fwid(dev))
+		return 0;
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 4);
+	if (error < 0)
+		return error;
+
+	dev->customer_id = le16(dev->rbuf);
+	dev->fwid = le16(dev->rbuf + 2);
+
+	TP_MSG(dev->id, "[Customer ID] 0x%04x\n", dev->customer_id);
+	TP_MSG(dev->id, "[FWID] 0x%04x\n", dev->fwid);
+
+	return 0;
+}
+
+static int api_protocol_get_crypto_info(struct ilitek_ts_device *dev,
+					void *data)
+{
+	u16 __MAYBE_UNUSED crypto_ver;
+	u32 crypto_opt;
+
+	UNUSED(data);
+
+	/*
+	 * encrypted report format should be supported after AP v6.0.8
+	 * set report format to 0 if protocol version not matched or
+	 * crypto info say it's not supported.
+	 */
+	if (dev->protocol.ver < 0x060008 ||
+	    write_then_read(dev, dev->wbuf, 1, dev->rbuf, 6) < 0) {
+		dev->tp_info.format = 0;
+		return 0;
+	}
+
+	crypto_ver = le16(dev->rbuf);
+	crypto_opt = le32(dev->rbuf + 2, 4);
+
+	TP_MSG(dev->id, "[Encrypt Ver.] 0x%x\n", crypto_ver);
+	TP_MSG(dev->id, "[Encrypt Options] 0x%x\n", crypto_opt);
+
+	if (!(crypto_opt & 1))
+		dev->tp_info.format = 0;
+
+	return 0;
+}
+
+static int api_protocol_get_hid_info(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	if (dev->protocol.ver < 0x060009)
+		return 0;
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 6);
+	if (error < 0)
+		return error;
+
+	_memcpy(&dev->hid_info, dev->rbuf, sizeof(dev->hid_info));
+
+	TP_MSG(dev->id, "vid/pid/rev: 0x%x/0x%x/0x%x\n",
+		dev->hid_info.vid, dev->hid_info.pid, dev->hid_info.rev);
+
+	return 0;
+}
+
+static bool is_special_char(char c)
+{
+	return ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') ||
+		(c >= '0' && c <= '9')) ? false : true;
+}
+
+static int api_protocol_get_mcu_ver(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	unsigned int i;
+
+#ifdef _WIN32
+/* packed below structures by 1 byte */
+#pragma pack(1)
+#endif
+	struct __PACKED__ mcu_ver {
+		u16 ic_name;
+		u8 df_start_addr[3];
+		u8 df_size;
+
+		char module_name[26];
+	} *parser;
+
+#ifdef _WIN32
+#pragma pack()
+#endif
+
+	UNUSED(data);
+
+	/*
+	 * GET_MCU_INFO (0x62) cmd support V6 and BL > v1.8.2 and AP > v6.0.7
+	 * otherwise, use GET_MCU_VER (0x61) cmd
+	 */
+	if (dev->protocol.flag == PTL_V6 && support_mcu_info(dev)) {
+		error = api_protocol_set_cmd(dev, GET_MCU_INFO, NULL);
+		if (error < 0)
+			return error;
+	} else {
+		error = write_then_read(dev, dev->wbuf, 1,
+					dev->rbuf, 32);
+		if (error < 0)
+			return error;
+
+		parser = (struct mcu_ver *)dev->rbuf;
+
+		_memset(dev->mcu_info.ic_name, 0,
+			sizeof(dev->mcu_info.ic_name));
+		_sprintf(dev->mcu_info.ic_name, 0, "%04x", parser->ic_name);
+
+		_memset(dev->mcu_info.module_name, 0,
+			sizeof(dev->mcu_info.module_name));
+		_memcpy(dev->mcu_info.module_name, parser->module_name,
+			sizeof(parser->module_name));
+	}
+
+	if (dev->protocol.flag == PTL_V6) {
+		if (is_29xx(dev)) {
+			/* modify reset time to 100ms for 29xx ICs */
+			dev->reset_time = 100;
+
+			/* set mm_addr for bin file update */
+			dev->mcu_info.mm_addr =
+				is_2501x(dev) ? MM_ADDR_2501X : MM_ADDR_29XX;
+			dev->mcu_info.min_addr = START_ADDR_29XX;
+			dev->mcu_info.max_addr = END_ADDR_LEGO;
+		} else {
+			dev->mcu_info.mm_addr = MM_ADDR_LEGO;
+			dev->mcu_info.min_addr = START_ADDR_LEGO;
+			dev->mcu_info.max_addr = END_ADDR_LEGO;
+		}
+	}
+
+	for (i = 0; i < sizeof(dev->mcu_info.module_name); i++) {
+		if (is_special_char(dev->mcu_info.module_name[i]))
+			dev->mcu_info.module_name[i] = 0;
+	}
+	if (!strcmp(dev->mcu_info.ic_name, "2133"))
+		_sprintf(dev->mcu_info.ic_name, 0, "2132S");
+
+	_memset(dev->mcu_info.ic_full_name, 0,
+		sizeof(dev->mcu_info.ic_full_name));
+	_sprintf(dev->mcu_info.ic_full_name, 0,
+		"ILI" PFMT_C8, dev->mcu_info.ic_name);
+
+	TP_MSG(dev->id, "[MCU Kernel Version] " PFMT_C8 "\n",
+		dev->mcu_info.ic_full_name);
+	TP_MSG(dev->id, "[Module Name]: [" PFMT_C8 "]\n",
+		dev->mcu_info.module_name);
+
+	return 0;
+}
+
+static int api_protocol_get_mcu_info(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	unsigned int i;
+
+#ifdef _WIN32
+/* packed below structures by 1 byte */
+#pragma pack(1)
+#endif
+	struct __PACKED__ mcu_info {
+		char ic_name[5];
+		char mask_ver[2];
+		u8 mm_addr[3];
+		char module_name[18];
+		u8 reserve[4];
+	} *parser;
+
+#ifdef _WIN32
+#pragma pack()
+#endif
+
+	UNUSED(data);
+
+	/*
+	 * GET_MCU_INFO (0x62) cmd only support V6 and BL > v1.8.2 and AP > v6.0.7
+	 * otherwise, return 0 to skip this command.
+	 */
+	if (dev->protocol.flag != PTL_V6 || !support_mcu_info(dev))
+		return 0;
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 32);
+	if (error < 0)
+		return error;
+
+	parser = (struct mcu_info *)dev->rbuf;
+
+	_memset(dev->mcu_info.ic_name, 0, sizeof(dev->mcu_info.ic_name));
+	_memcpy(dev->mcu_info.ic_name, parser->ic_name,
+		sizeof(parser->ic_name));
+
+	_memcpy(dev->mcu_info.module_name, parser->module_name,
+		sizeof(parser->module_name));
+	dev->mcu_info.mm_addr = le32(parser->mm_addr, 3);
+
+	for (i = 0; i < sizeof(dev->mcu_info.module_name); i++) {
+		if (is_special_char(dev->mcu_info.module_name[i]))
+			dev->mcu_info.module_name[i] = 0;
+	}
+
+	return 0;
+}
+
+static int api_protocol_set_fs_info(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	struct freq_settings *freq = (struct freq_settings *)data;
+
+	if (!data)
+		return -EINVAL;
+
+	dev->wbuf[1] = freq->sine.start & 0xFF;
+	dev->wbuf[2] = freq->sine.start >> 8;
+	dev->wbuf[3] = freq->sine.end & 0xFF;
+	dev->wbuf[4] = freq->sine.end >> 8;
+	dev->wbuf[5] = freq->sine.step;
+	dev->wbuf[6] = freq->mc_swcap.start & 0xFF;
+	dev->wbuf[7] = freq->mc_swcap.start >> 8;
+	dev->wbuf[8] = freq->mc_swcap.end & 0xFF;
+	dev->wbuf[9] = freq->mc_swcap.end >> 8;
+	dev->wbuf[10] = freq->mc_swcap.step;
+	dev->wbuf[11] = freq->sc_swcap.start & 0xFF;
+	dev->wbuf[12] = freq->sc_swcap.start >> 8;
+	dev->wbuf[13] = freq->sc_swcap.end & 0xFF;
+	dev->wbuf[14] = freq->sc_swcap.end >> 8;
+	dev->wbuf[15] = freq->sc_swcap.step;
+	dev->wbuf[16] = freq->frame_cnt & 0xFF;
+	dev->wbuf[17] = freq->frame_cnt >> 8;
+	dev->wbuf[18] = freq->scan_type;
+
+	if (dev->protocol.ver < 0x60005)
+		return write_then_read(dev, dev->wbuf, 19, NULL, 0);
+
+	do {
+		if (dev->protocol.ver < 0x60009) {
+			error = write_then_read(dev, dev->wbuf, 19,
+						dev->rbuf, 5);
+			break;
+		}
+
+		dev->wbuf[16] = freq->dump1.start & 0xFF;
+		dev->wbuf[17] = freq->dump1.start >> 8;
+		dev->wbuf[18] = freq->dump1.end & 0xFF;
+		dev->wbuf[19] = freq->dump1.end >> 8;
+		dev->wbuf[20] = freq->dump1.step;
+		dev->wbuf[21] = freq->dump1_val;
+		dev->wbuf[22] = freq->dump2.start & 0xFF;
+		dev->wbuf[23] = freq->dump2.start >> 8;
+		dev->wbuf[24] = freq->dump2.end & 0xFF;
+		dev->wbuf[25] = freq->dump2.end >> 8;
+		dev->wbuf[26] = freq->dump2.step;
+		dev->wbuf[27] = freq->dump2_val;
+		dev->wbuf[28] = freq->frame_cnt & 0xFF;
+		dev->wbuf[29] = freq->frame_cnt >> 8;
+		dev->wbuf[30] = freq->scan_type;
+
+		if (dev->protocol.ver < 0x6000a) {
+			error = write_then_read(dev, dev->wbuf, 31,
+						dev->rbuf, 5);
+			break;
+		}
+
+		dev->wbuf[31] = freq->mc_frame_cnt & 0xFF;
+		dev->wbuf[32] = freq->mc_frame_cnt >> 8;
+		dev->wbuf[33] = freq->dump_frame_cnt & 0xFF;
+		dev->wbuf[34] = freq->dump_frame_cnt >> 8;
+
+		error = write_then_read(dev, dev->wbuf, 35, dev->rbuf, 5);
+
+	} while (0);
+
+	if (error < 0)
+		return error;
+
+	freq->packet_steps = le16(dev->rbuf + 3);
+
+	if (dev->rbuf[0] != 0x5a || dev->rbuf[1] != 0xa5 || dev->rbuf[2]) {
+		TP_ERR(dev->id, "invalid header: 0x" PFMT_X8 "-0x" PFMT_X8 "-0x" PFMT_X8 ", total steps: " PFMT_U16 "\n",
+			dev->rbuf[0], dev->rbuf[1], dev->rbuf[2],
+			freq->packet_steps);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int api_protocol_set_short_info(struct ilitek_ts_device *dev, void *data)
+{
+	struct short_settings *_short = (struct short_settings *)data;
+
+	if (!data)
+		return -EINVAL;
+
+	TP_DBG(dev->id, "[short info] dump1: 0x" PFMT_X8 ", dump2: 0x" PFMT_X8 ", vref: 0x" PFMT_X8 ", postidle: 0x" PFMT_X16 "\n",
+		_short->dump_1, _short->dump_2,
+		_short->v_ref_L, _short->post_idle);
+
+	dev->wbuf[1] = _short->dump_1;
+	dev->wbuf[2] = _short->dump_2;
+	dev->wbuf[3] = _short->v_ref_L;
+	dev->wbuf[4] = _short->post_idle & 0xFF;
+	dev->wbuf[5] = (_short->post_idle >> 8) & 0xFF;
+
+	return write_then_read(dev, dev->wbuf, 6, NULL, 0);
+}
+
+static int api_protocol_set_open_info(struct ilitek_ts_device *dev, void *data)
+{
+	struct open_settings *open = (struct open_settings *)data;
+	int wlen = 1;
+
+	if (!data)
+		return -EINVAL;
+
+	TP_DBG(dev->id,
+		"[open info] freq.: " PFMT_U16 ", gain: 0x" PFMT_X8 ", gain_rfb: 0x" PFMT_X8
+		", afe_res_sel: 0x" PFMT_X8 ", mc_fsel: 0x" PFMT_X8 "\n",
+		open->freq, open->gain, open->gain_rfb,
+		open->afe_res_sel, open->mc_fsel);
+
+	dev->wbuf[wlen++] = open->freq & 0xFF;
+	dev->wbuf[wlen++] = (open->freq >> 8) & 0xFF;
+	dev->wbuf[wlen++] = open->gain;
+	dev->wbuf[wlen++] = open->gain_rfb;
+	dev->wbuf[wlen++] = open->afe_res_sel;
+	dev->wbuf[wlen++] = open->mc_fsel;
+
+	if (dev->protocol.ver > 0x060009) {
+		TP_DBG(dev->id, "[open info] frame: " PFMT_U16 "\n",
+			open->frame);
+
+		dev->wbuf[wlen++] = open->frame & 0xFF;
+		dev->wbuf[wlen++] = (open->frame >> 8) & 0xFF;
+	}
+
+	return write_then_read(dev, dev->wbuf, wlen, NULL, 0);
+}
+
+static int api_protocol_set_charge_info(struct ilitek_ts_device *dev,
+					void *data)
+{
+	int error, i;
+	struct charge_curve_settings *curve =
+		(struct charge_curve_settings *)data;
+
+	if (!data)
+		return -EINVAL;
+
+	TP_DBG(dev->id, "charge-curve info. scan mode: 0x" PFMT_U8 "\n",
+		curve->scan_mode);
+
+	dev->wbuf[1] = curve->scan_mode;
+	dev->wbuf[2] = curve->dump.start & 0xFF;
+	dev->wbuf[3] = (curve->dump.start >> 8) & 0xFF;
+	dev->wbuf[4] = curve->dump.end & 0xFF;
+	dev->wbuf[5] = (curve->dump.end >> 8) & 0xFF;
+	dev->wbuf[6] = curve->dump.step;
+	dev->wbuf[7] = curve->dump.post_idle & 0xFF;
+	dev->wbuf[8] = (curve->dump.post_idle >> 8) & 0xFF;
+	dev->wbuf[9] = curve->dump.fix_val & 0xFF;
+	dev->wbuf[10] = (curve->dump.fix_val >> 8) & 0xFF;
+	dev->wbuf[11] = curve->charge.start & 0xFF;
+	dev->wbuf[12] = (curve->charge.start >> 8) & 0xFF;
+	dev->wbuf[13] = curve->charge.end & 0xFF;
+	dev->wbuf[14] = (curve->charge.end >> 8) & 0xFF;
+	dev->wbuf[15] = curve->charge.step;
+	dev->wbuf[16] = curve->charge.post_idle & 0xFF;
+	dev->wbuf[17] = (curve->charge.post_idle >> 8) & 0xFF;
+	dev->wbuf[18] = curve->charge.fix_val & 0xFF;
+	dev->wbuf[19] = (curve->charge.fix_val >> 8) & 0xFF;
+	dev->wbuf[20] = curve->c_sub & 0xFF;
+	dev->wbuf[21] = (curve->c_sub >> 8) & 0xFF;
+	dev->wbuf[22] = curve->frame_cnt & 0xFF;
+	dev->wbuf[23] = (curve->frame_cnt >> 8) & 0xFF;
+
+	for (i = 0; i < (int)ARRAY_SIZE(curve->pt); i++) {
+		dev->wbuf[24 + i * 4] = curve->pt[i].x & 0xFF;
+		dev->wbuf[24 + i * 4 + 1] = (curve->pt[i].x >> 8) & 0xFF;
+		dev->wbuf[24 + i * 4 + 2] = curve->pt[i].y & 0xFF;
+		dev->wbuf[24 + i * 4 + 3] = (curve->pt[i].y >> 8) & 0xFF;
+	}
+
+	error = write_then_read(dev, dev->wbuf, 60, dev->rbuf, 5);
+	if (error < 0)
+		return error;
+
+	curve->packet_steps = le16(dev->rbuf + 3);
+
+	if (dev->rbuf[0] != AP_MODE || dev->rbuf[1] != 0xa5 || dev->rbuf[2]) {
+		TP_ERR(dev->id, "invalid header: 0x" PFMT_X8 "-0x" PFMT_X8 "-0x" PFMT_X8 ", total steps: " PFMT_U16 "\n",
+			dev->rbuf[0], dev->rbuf[1], dev->rbuf[2],
+			curve->packet_steps);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int api_protocol_set_p2p_info(struct ilitek_ts_device *dev, void *data)
+{
+	struct p2p_settings *p2p = (struct p2p_settings *)data;
+	int wlen = 1;
+
+	if (!data)
+		return -EINVAL;
+
+	TP_DBG(dev->id, "[p2p info] frame_cnt.: " PFMT_U16 ", type: 0x" PFMT_X8 "\n",
+		p2p->frame_cnt, p2p->type);
+
+	dev->wbuf[wlen++] = p2p->frame_cnt & 0xFF;
+	dev->wbuf[wlen++] = (p2p->frame_cnt >> 8) & 0xFF;
+
+	if (dev->protocol.ver > 0x060009) {
+		dev->wbuf[wlen++] = p2p->type & 0xFF;
+		dev->wbuf[wlen++] = p2p->freq & 0xFF;
+		dev->wbuf[wlen++] = (p2p->freq >> 8) & 0xFF;
+	}
+
+	return write_then_read(dev, dev->wbuf, wlen, NULL, 0);
+}
+
+static int api_protocol_set_pen_fs_info(struct ilitek_ts_device *dev,
+					void *data)
+{
+	int error;
+	struct freq_settings *freq = (struct freq_settings *)data;
+
+	if (!data)
+		return -EINVAL;
+
+	dev->wbuf[1] = freq->pen.mode;
+	dev->wbuf[2] = freq->pen.start & 0xFF;
+	dev->wbuf[3] = freq->pen.start >> 8;
+	dev->wbuf[4] = freq->pen.end & 0xFF;
+	dev->wbuf[5] = freq->pen.end >> 8;
+	dev->wbuf[6] = freq->frame_cnt & 0xFF;
+	dev->wbuf[7] = freq->frame_cnt >> 8;
+
+	error = write_then_read(dev, dev->wbuf, 8, dev->rbuf, 0);
+	if (error < 0)
+		return error;
+
+	return 0;
+}
+
+static int api_protocol_get_core_ver(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 8);
+	if (error < 0)
+		return error;
+
+	_memcpy(dev->core_ver, dev->rbuf, 8);
+
+	TP_MSG_ARR(dev->id, "[CoreVersion]", TYPE_U8, 4, dev->core_ver);
+
+	return 0;
+}
+
+static int api_protocol_get_tuning_ver(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 8);
+	if (error < 0)
+		return error;
+
+	_memcpy(dev->tuning_ver, dev->rbuf, 4);
+
+	TP_MSG_ARR(dev->id, "[TurningVersion]", TYPE_U8, 4, dev->tuning_ver);
+
+	return 0;
+}
+
+static int api_protocol_set_sw_reset(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	int wlen = 1;
+	bool need_re_enum = (data) ? *(bool *)data : false;
+	bool force_reset = (!data) ? true : false;
+
+	/* make sure touch report in default I2C-HID mode after force reset */
+	if (dev->_interface == interface_hid_over_i2c && !force_reset)
+		return 0;
+
+	dev->wbuf[1] = 0;
+	error = write_then_read(dev, dev->wbuf, wlen, dev->rbuf, 0);
+	if (error < 0)
+		return error;
+
+	dev->cb.delay_ms(dev->reset_time);
+
+	if (dev->_interface == interface_usb && need_re_enum)
+		return re_enum_helper(dev, enum_sw_reset);
+
+	return 0;
+}
+
+static int api_protocol_get_sys_busy(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	if (data)
+		*(u8 *)data = 0;
+
+	_memset(dev->rbuf, 0, 64);
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 1);
+	if (error < 0)
+		return error;
+
+	if (data)
+		*(u8 *)data = dev->rbuf[0];
+
+	return 0;
+}
+
+static int api_protocol_get_ap_crc_v6(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	u8 i, ic_num = (data) ? *(u8 *)data : 1;
+
+	if (ic_num > ARRAY_SIZE(dev->ic))
+		return -EINVAL;
+
+	/*
+	 * No need to get/print AP CRC by 0xC7 in BL mode,
+	 * and 2501x ICs would get wrong crc in BL.
+	 */
+	if (dev->ic[0].mode != AP_MODE)
+		return 0;
+
+	error = write_then_read(dev, dev->wbuf, 1,
+				dev->rbuf, 2 * ic_num);
+	if (error < 0)
+		return error;
+
+	dev->ic[0].crc[0] = le16(dev->rbuf);
+	TP_MSG(dev->id, "[FW CRC] Master: 0x%x\n", dev->ic[0].crc[0]);
+
+	for (i = 1; i < ic_num; i++) {
+		dev->ic[i].crc[0] = le16(dev->rbuf + 2 * i);
+		TP_MSG(dev->id, "[FW CRC] Slave[" PFMT_U8 "]: 0x%x\n",
+			i, dev->ic[i].crc[0]);
+	}
+
+	return 0;
+}
+
+static int api_protocol_get_ap_crc_v3(struct ilitek_ts_device *dev, void *data)
+{
+	int error, rlen;
+
+	UNUSED(data);
+
+	rlen = (is_231x(dev)) ? 4 : 2;
+
+	if (dev->_interface == interface_i2c) {
+		error = write_then_read(dev, dev->wbuf, 1, NULL, 0);
+		if (error < 0)
+			return error;
+		dev->cb.delay_ms(600);
+		error = write_then_read(dev, NULL, 0, dev->rbuf, rlen);
+		if (error < 0)
+			return error;
+	} else {
+		error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, rlen);
+		if (error < 0)
+			return error;
+	}
+
+	dev->ic[0].crc[0] = le16(dev->rbuf);
+	if (is_231x(dev))
+		dev->ic[0].crc[0] |= (le16(dev->rbuf + 2) << 16);
+
+	TP_MSG(dev->id, "[Check Code] AP: 0x%x\n", dev->ic[0].crc[0]);
+
+	return 0;
+}
+
+static int api_protocol_get_ap_crc(struct ilitek_ts_device *dev, void *data)
+{
+	if (dev->protocol.flag == PTL_V6)
+		return api_protocol_get_ap_crc_v6(dev, data);
+	else if (dev->protocol.flag == PTL_V3)
+		return api_protocol_get_ap_crc_v3(dev, data);
+
+	return -EINVAL;
+}
+
+static int api_protocol_set_mode_v3(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	u8 mode = dev->wbuf[1];
+
+	UNUSED(data);
+
+	error = write_then_read(dev, dev->wbuf, 2, NULL, 0);
+	if (error < 0)
+		return error;
+
+	/*
+	 * Bridge with V3 IC need to set bridge into/out test mode additionally.
+	 */
+	if (dev->quirks & QUIRK_BRIDGE)
+		return bridge_set_test_mode(dev, (mode) ? true : false);
+
+	return 0;
+}
+
+static int api_protocol_write_enable(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	bool in_ap = (data) ? *(bool *)data : true;
+
+	error = write_then_read(dev, dev->wbuf,
+				(in_ap) ? 3 : 10, NULL, 0);
+	if (error < 0)
+		return error;
+
+	/*
+	 * V3 need AP/BL mode switch delay
+	 */
+	if (in_ap)
+		dev->cb.delay_ms(is_231x(dev) ? 1000 : 100);
+	else
+		dev->cb.delay_ms(10);
+
+	return 0;
+}
+
+static int api_protocol_write_data_v3(struct ilitek_ts_device *dev, void *data)
+{
+	UNUSED(data);
+
+	return write_then_read(dev, dev->wbuf, 33, NULL, 0);
+}
+
+static int api_protocol_get_df_crc(struct ilitek_ts_device *dev,  void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	dev->ic[0].crc[1] = 0;
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 4);
+	if (error < 0)
+		return error;
+
+	dev->ic[0].crc[1] = le16(dev->rbuf + 2) << 16 | le16(dev->rbuf);
+	TP_MSG(dev->id, "[Check Code] Data: 0x%x\n", dev->ic[0].crc[1]);
+
+	return 0;
+}
+
+static int api_protocol_set_mode_v6(struct ilitek_ts_device *dev, void *data)
+{
+	UNUSED(data);
+
+	return write_then_read(dev, dev->wbuf, 3, NULL, 0);
+}
+
+static int api_protocol_get_crc_by_addr(struct ilitek_ts_device *dev,
+					void *data)
+{
+	int error;
+	u8 type = (data) ? *(u8 *)data : 0;
+	u32 start, end, t_ms;
+
+	dev->wbuf[1] = type;
+
+	if (type == CRC_CALCULATE) {
+		start = le32(dev->wbuf + 2, 3);
+		end = le32(dev->wbuf + 5, 3);
+		t_ms = ((end - start) / 4096 + 1) * TOUT_CD * TOUT_CD_RATIO;
+
+		error = write_then_wait_ack(dev, dev->wbuf, 8, t_ms);
+		if (error < 0)
+			return error;
+		type = CRC_GET;
+		return api_protocol_set_cmd(dev, GET_BLK_CRC_ADDR, &type);
+	}
+
+	return write_then_read(dev, dev->wbuf, 2, dev->rbuf, 2);
+}
+
+static int api_protocol_get_crc_by_num(struct ilitek_ts_device *dev,
+					void *data)
+{
+	int error;
+	u8 type = (data) ? *(u8 *)data : 0;
+	u32 t_ms = (dev->wbuf[2] == 0) ? TOUT_CF_BLOCK_0 : TOUT_CF_BLOCK_N;
+
+	dev->wbuf[1] = type;
+
+	if (type == CRC_CALCULATE) {
+		error = write_then_wait_ack(dev, dev->wbuf, 3, t_ms);
+		if (error < 0)
+			return error;
+		type = CRC_GET;
+		return api_protocol_set_cmd(dev, GET_BLK_CRC_NUM, &type);
+	}
+
+	return write_then_read(dev, dev->wbuf, 2, dev->rbuf, 2);
+}
+
+static int api_protocol_read_flash(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	u32 code = *(u32 *)data;
+	bool prepare;
+	int rlen;
+
+	if (dev->ic[0].mode != BL_MODE)
+		return -EINVAL;
+
+	if (dev->protocol.flag == PTL_V3) {
+		if ((dev->protocol.ver & 0xFFFF00) == BL_PROTOCOL_V1_7 &&
+		     dev->fw_ver[3] < 3) {
+			TP_ERR(dev->id, "BL: 0x%x, FW: 0x" PFMT_X8 "-0x" PFMT_X8 "-0x" PFMT_X8 "-0x" PFMT_X8 " not support cmd: 0x" PFMT_X8 "\n",
+				dev->protocol.ver, dev->fw_ver[0],
+				dev->fw_ver[1], dev->fw_ver[2], dev->fw_ver[3],
+				dev->wbuf[0]);
+			return -EINVAL;
+		}
+
+		return write_then_read(dev, dev->wbuf, 1, dev->rbuf, 32);
+	}
+
+	if (!data)
+		return -EINVAL;
+
+	prepare = (code >> 16) ? true : false;
+	rlen = code & 0xFFFF;
+
+	if (prepare) {
+		error = write_then_read(dev, dev->wbuf, 2, NULL, 0);
+		dev->cb.delay_ms(100);
+
+		return error;
+	}
+
+	if (dev->_interface == interface_i2c)
+		error = write_then_read(dev, dev->wbuf, 2, dev->rbuf, rlen);
+	else
+		error = write_then_read(dev, NULL, 0, dev->rbuf, rlen);
+
+	return error;
+}
+
+static int api_protocol_set_flash_addr(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	u32 addr = *(u32 *)data;
+
+	if (!data)
+		return -EINVAL;
+
+	if (dev->protocol.flag == PTL_V3) {
+		dev->wbuf[3] = addr & 0xFF;
+		dev->wbuf[2] = (addr >> 8) & 0xFF;
+		dev->wbuf[1] = (addr >> 16) & 0xFF;
+
+		error = write_then_read(dev, dev->wbuf, 4, NULL, 0);
+		if (error < 0)
+			return error;
+
+		dev->cb.delay_ms(5);
+
+		return 0;
+	}
+
+	dev->wbuf[1] = addr & 0xFF;
+	dev->wbuf[2] = (addr >> 8) & 0xFF;
+	dev->wbuf[3] = (addr >> 16) & 0xFF;
+
+	return write_then_read(dev, dev->wbuf, 4, NULL, 0);
+}
+
+static int api_protocol_set_data_len(struct ilitek_ts_device *dev, void *data)
+{
+	UNUSED(data);
+
+	return write_then_read(dev, dev->wbuf, 3, NULL, 0);
+}
+
+static int api_protocol_set_flash_enable(struct ilitek_ts_device *dev,
+					 void *data)
+{
+	int error;
+	u8 type = (data) ? *(u8 *)data : 0;
+	int wlen, rlen;
+	bool in_ap = ((type & 0x1) != 0) ? true : false;
+	bool is_slave = ((type & 0x2) != 0) ? true : false;
+
+	u32 set_start, set_end, get_start, get_end;
+
+	if (!is_slave) {
+		wlen = (in_ap) ? 3 : 9;
+		rlen = (in_ap || dev->protocol.ver < 0x010803) ? 0 : 6;
+
+		set_start = le32(dev->wbuf + 3, 3);
+		set_end = le32(dev->wbuf + 6, 3);
+
+		error = write_then_read(dev, dev->wbuf, wlen,
+					dev->rbuf, rlen);
+		if (error < 0)
+			return error;
+
+		if (in_ap || dev->protocol.ver < 0x010803)
+			return 0;
+
+		get_start = le32(dev->rbuf, 3);
+		get_end = le32(dev->rbuf + 3, 3);
+
+		if (set_start != get_start || set_end != get_end) {
+			TP_ERR(dev->id, "start/end addr.: 0x%x/0x%x vs. 0x%x/0x%x not match\n",
+				set_start, set_end, get_start, get_end);
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	error = write_then_wait_ack(dev, dev->wbuf, 9,
+				    TOUT_CC_SLAVE * TOUT_CC_SLAVE_RATIO);
+	if (error < 0)
+		return error;
+	dev->cb.delay_ms(2000);
+
+	return (dev->_interface == interface_usb) ?
+		re_enum_helper(dev, enum_sw_reset) : 0;
+}
+
+static int api_protocol_write_data_v6(struct ilitek_ts_device *dev, void *data)
+{
+	int wlen;
+
+	if (!data)
+		return -EINVAL;
+
+	wlen = *(int *)data;
+
+	return write_then_wait_ack(dev, dev->wbuf, wlen, TOUT_C3 * TOUT_C3_RATIO);
+}
+
+static int api_protocol_write_data_m2v(struct ilitek_ts_device *dev, void *data)
+{
+	int wlen;
+
+	if (!data)
+		return -EINVAL;
+
+	wlen = *(int *)data;
+
+	return write_then_wait_ack(dev, dev->wbuf, wlen, 30000);
+}
+
+static int api_protocol_access_slave(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	struct ilitek_slave_access *access;
+
+	if (!data)
+		return -EINVAL;
+
+	access = (struct ilitek_slave_access *)data;
+
+	dev->wbuf[1] = access->slave_id;
+	dev->wbuf[2] = access->func;
+	_memset(dev->rbuf, 0, sizeof(dev->rbuf));
+
+	switch (access->func) {
+	case CMD_GET_AP_CRC:
+		error = write_then_read(dev, dev->wbuf, 3, dev->rbuf, 4);
+		*((u32 *)access->data) = le32(dev->rbuf, 4);
+		break;
+
+	case CMD_GET_MCU_MOD:
+		error = write_then_read(dev, dev->wbuf, 3, dev->rbuf, 1);
+		*((u8 *)access->data) = dev->rbuf[0];
+		break;
+
+	case CMD_GET_FW_VER:
+		error = write_then_read(dev, dev->wbuf, 3, dev->rbuf, 8);
+		_memcpy((u8 *)access->data, dev->rbuf, 8);
+
+		break;
+
+	case CMD_WRITE_ENABLE:
+		dev->wbuf[3] = ((u8 *)access->data)[0];
+		dev->wbuf[4] = ((u8 *)access->data)[1];
+		dev->wbuf[5] = ((u8 *)access->data)[2];
+		dev->wbuf[6] = ((u8 *)access->data)[3];
+		dev->wbuf[7] = ((u8 *)access->data)[4];
+		dev->wbuf[8] = ((u8 *)access->data)[5];
+
+		error = write_then_wait_ack(dev, dev->wbuf, 9, 5000);
+		break;
+
+	default:
+		error = write_then_wait_ack(dev, dev->wbuf, 3, 5000);
+		break;
+	};
+
+	return error;
+}
+
+static int api_protocol_set_ap_mode(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	if (dev->cb.mode_switch_notify)
+		dev->cb.mode_switch_notify(true, false, dev->_private);
+
+	error = write_then_read(dev, dev->wbuf, 1, NULL, 0);
+
+	if (dev->cb.mode_switch_notify)
+		dev->cb.mode_switch_notify(false, false, dev->_private);
+
+	return error;
+}
+
+static int api_protocol_set_bl_mode(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+
+	UNUSED(data);
+
+	if (dev->cb.mode_switch_notify)
+		dev->cb.mode_switch_notify(true, false, dev->_private);
+
+	error = write_then_read(dev, dev->wbuf, 1, NULL, 0);
+
+	if (dev->cb.mode_switch_notify)
+		dev->cb.mode_switch_notify(false, true, dev->_private);
+
+	return error;
+}
+
+static int api_protocol_set_idle(struct ilitek_ts_device *dev, void *data)
+{
+	UNUSED(data);
+
+	return write_then_read(dev, dev->wbuf, 2, NULL, 0);
+}
+
+static int api_protocol_set_sleep(struct ilitek_ts_device *dev, void *data)
+{
+	UNUSED(data);
+
+	return write_then_read(dev, dev->wbuf, 1, NULL, 0);
+}
+
+static int api_protocol_set_wakeup(struct ilitek_ts_device *dev, void *data)
+{
+	UNUSED(data);
+
+	return write_then_read(dev, dev->wbuf, 1, NULL, 0);
+}
+
+static int api_protocol_set_func_mode(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	bool get = (data) ? *(bool *)data : true;
+
+	if (!data)
+		return -EINVAL;
+
+	if (get) {
+		error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 3);
+		if (error < 0)
+			return error;
+
+		dev->func.header = be16(dev->rbuf);
+		dev->func.mode = dev->rbuf[2];
+		TP_MSG(dev->id, "[FW Mode] 0x" PFMT_X8 "\n", dev->func.mode);
+
+		return 0;
+	}
+
+	if (dev->protocol.flag == PTL_V3) {
+		error = write_then_read(dev, dev->wbuf, 4, NULL, 0);
+		if (error < 0)
+			return error;
+		error = api_check_busy(dev, 1000, 10);
+		if (error < 0)
+			return error;
+		return 0;
+	} else if (dev->protocol.flag == PTL_V6) {
+		error = write_then_wait_ack(dev, dev->wbuf, 4,
+					    TOUT_68 * TOUT_68_RATIO);
+		if (error < 0)
+			return error;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int api_protocol_c_model_info(struct ilitek_ts_device *dev, void *data)
+{
+	UNUSED(data);
+
+	if (dev->protocol.ver < 0x060008)
+		return write_then_read(dev, dev->wbuf, 12, NULL, 0);
+
+	return write_then_read(dev, dev->wbuf, 18, NULL, 0);
+}
+
+static int api_protocol_tuning_para_v3(struct ilitek_ts_device *dev, void *data)
+{
+	UNUSED(data);
+
+	return write_then_read(dev, dev->wbuf, 2, NULL, 0);
+}
+
+static int api_protocol_tuning_para_v6(struct ilitek_ts_device *dev, void *data)
+{
+	int error;
+	struct tuning_para_settings tuning =
+		*(struct tuning_para_settings *)data;
+	u32 wlen;
+
+	int header;
+	int tout_ms;
+
+	if (!data)
+		return -EINVAL;
+
+	dev->wbuf[1] = tuning.func;
+	dev->wbuf[2] = tuning.ctrl;
+	dev->wbuf[3] = tuning.type;
+
+	if (tuning.func == 0x0) {
+		wlen = 4;
+		tout_ms = TOUT_65_READ * TOUT_65_READ_RATIO;
+
+		switch (tuning.ctrl) {
+		case 0x3: case 0x5: case 0x10:
+			wlen += tuning.len;
+			tout_ms = TOUT_65_WRITE * TOUT_65_WRITE_RATIO;
+
+			//TODO: add memory range check
+			_memcpy(dev->wbuf + 4, tuning.buf, tuning.len);
+			break;
+		}
+
+		return write_then_wait_ack(dev, dev->wbuf, wlen, tout_ms);
+	}
+
+	switch (tuning.ctrl) {
+	case 0x2: case 0x4:
+		error = write_then_read(dev, dev->wbuf, 4, NULL, 0);
+		if (error < 0)
+			return error;
+		error = read_ctrl_in(dev, CMD_TUNING_PARA_V6,
+				     dev->rbuf, 1024, 5000);
+		if (error < 0)
+			return error;
+
+		header = (dev->_interface == interface_i2c) ? 5 : 6;
+		header = (dev->quirks & QUIRK_BRIDGE) ? 6 : header;
+
+		_memcpy(tuning.buf, dev->rbuf + header, tuning.len);
+
+		break;
+	}
+
+	return 0;
+}
+
+static int api_protocol_set_cdc_init_v3(struct ilitek_ts_device *dev,
+					void *data)
+{
+	int error;
+	int wlen;
+	struct cdc_settings *set = (struct cdc_settings *)data;
+
+	if (!data)
+		return -EINVAL;
+
+	if (set->is_freq) {
+		dev->wbuf[1] = 0x0F;
+		dev->wbuf[2] = set->freq.sine.start;
+		dev->wbuf[3] = set->freq.sine.end;
+		dev->wbuf[4] = set->freq.sine.step;
+
+		error = write_then_read(dev, dev->wbuf, 5, NULL, 0);
+		if (error < 0)
+			return error;
+
+		dev->cb.delay_ms(200);
+	} else {
+		dev->wbuf[1] = set->cmd;
+		dev->wbuf[2] = 0;
+		dev->wbuf[3] = set->config & 0xFF;
+		wlen = 4;
+
+		if (set->config & 0xFF00) {
+			dev->wbuf[3] = (set->config >> 8) & 0xFF;
+			dev->wbuf[4] = set->config & 0xFF;
+			wlen = 5;
+		}
+
+		error = write_then_read(dev, dev->wbuf, wlen, NULL, 0);
+		if (error < 0)
+			return error;
+
+		dev->cb.delay_ms(10);
+	}
+
+	return api_check_busy(dev, 15000, 10);
+}
+
+static int api_protocol_get_cdc_v6(struct ilitek_ts_device *dev, void *data)
+{
+	UNUSED(data);
+
+	return write_then_wait_ack(dev, dev->wbuf, 1, TOUT_F2 * TOUT_F2_RATIO);
+}
+
+static int api_protocol_set_cdc_init_v6(struct ilitek_ts_device *dev,
+					void *data)
+{
+	struct cdc_settings *set = (struct cdc_settings *)data;
+	int wlen = 1, tout_ms;
+
+	if (!data)
+		return -EINVAL;
+
+	dev->wbuf[wlen++] = set->cmd;
+
+	if (set->is_freq) {
+		tout_ms = set->freq.sine.steps * TOUT_F1_FREQ_MC;
+		tout_ms += (set->freq.mc_swcap.steps * TOUT_F1_FREQ_SC);
+		tout_ms += (set->freq.sc_swcap.steps * TOUT_F1_FREQ_SC);
+		tout_ms += (set->freq.dump1.steps * TOUT_F1_FREQ_SC);
+		tout_ms += (set->freq.dump2.steps * TOUT_F1_FREQ_SC);
+
+		tout_ms += (set->freq.pen.steps * TOUT_F1_FREQ_MC);
+
+		tout_ms *= MAX(set->freq.frame_cnt, 1);
+		tout_ms *= TOUT_F1_FREQ_RATIO;
+
+		return write_then_wait_ack(dev, dev->wbuf, wlen, tout_ms);
+	}
+
+	if (set->is_p2p) {
+		tout_ms = MAX(set->p2p.frame_cnt, 1) *
+			TOUT_F1_OTHER * TOUT_F1_OTHER_RATIO;
+		return write_then_wait_ack(dev, dev->wbuf, wlen, tout_ms);
+	}
+
+	if (dev->protocol.ver > 0x60008)
+		dev->wbuf[wlen++] = set->config & 0xFF;
+
+	tout_ms = TOUT_F1_OTHER * TOUT_F1_OTHER_RATIO;
+	if (set->is_curve) {
+		tout_ms = set->curve.dump.steps * TOUT_F1_CURVE;
+		tout_ms += (set->curve.charge.steps * TOUT_F1_CURVE);
+		tout_ms *= MAX(set->curve.frame_cnt, 1);
+		tout_ms *= TOUT_F1_CURVE_RATIO;
+	} else if (set->is_short) {
+		tout_ms = TOUT_F1_SHORT * TOUT_F1_SHORT_RATIO;
+	} else if (set->is_open) {
+		tout_ms = MAX(set->open.frame, 1) *
+			TOUT_F1_OPEN * TOUT_F1_OPEN_RATIO;
+	} else if (set->is_key && dev->protocol.ver < 0x6000a) {
+		tout_ms = TOUT_F1_KEY;
+	}
+
+	return write_then_wait_ack(dev, dev->wbuf, wlen, tout_ms);
+}
+
+static int api_protocol_get_cdc_info_v3(struct ilitek_ts_device *dev,
+					void *data)
+{
+	int error;
+	u32 *cdc_info = (u32 *)data;
+
+	if (!data)
+		return -EINVAL;
+
+	error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 4);
+	if (error < 0)
+		return error;
+
+	*cdc_info = le32(dev->rbuf, 4);
+
+	return 0;
+}
+
+int api_protocol_set_cmd(void *handle, u8 idx, void *data)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int error;
+
+	if (!dev || idx >= ARRAY_SIZE(protocol_maps))
+		return -EINVAL;
+
+	if (!(dev->protocol.flag & protocol_maps[idx].flag) &&
+	    protocol_maps[idx].flag != PTL_ANY) {
+		TP_ERR(dev->id, "Unexpected cmd: " PFMT_C8 " for 0x" PFMT_X8 " only, now is 0x" PFMT_X8 "\n",
+			protocol_maps[idx].desc, protocol_maps[idx].flag,
+			dev->protocol.flag);
+		return -EINVAL;
+	}
+
+	dev->wbuf[0] = protocol_maps[idx].cmd;
+	error = protocol_maps[idx].func(dev, data);
+	if (error < 0) {
+		TP_ERR(dev->id, "failed to execute cmd: 0x" PFMT_X8 " " PFMT_C8 ", err: %d\n",
+			protocol_maps[idx].cmd, protocol_maps[idx].desc, error);
+		return error;
+	}
+
+	return 0;
+}
+
+int api_set_ctrl_mode(void *handle, u8 mode, bool eng, bool force)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int error;
+	u8 cmd = 0;
+
+	if (!force && dev->fw_mode == mode)
+		return 0;
+
+	_memset(dev->wbuf, 0, sizeof(dev->wbuf));
+
+	if (dev->protocol.flag == PTL_V3) {
+		/* V3 only support suspend and normal mode */
+		if (mode != mode_normal &&
+		    mode != mode_suspend &&
+		    mode != mode_test)
+			return -EPROTONOSUPPORT;
+		dev->wbuf[1] = (mode == mode_normal) ? 0x00 : 0x01;
+		cmd = SET_TEST_MOD;
+	} else if (dev->protocol.flag == PTL_V6) {
+		dev->wbuf[1] = mode;
+		dev->wbuf[2] = (eng) ? 0x01 : 0x00;
+		cmd = SET_MOD_CTRL;
+	}
+
+	error = api_protocol_set_cmd(dev, cmd, NULL);
+	if (error < 0)
+		return error;
+
+	/* switch from test to normal mode should wait 1 sec. delay */
+	if (dev->protocol.flag == PTL_V6 &&
+	    dev->fw_mode == mode_test && mode == mode_normal)
+		dev->cb.delay_ms(1000);
+	else
+		dev->cb.delay_ms(100);
+
+	dev->fw_mode = mode;
+
+	return 0;
+}
+
+u16 api_get_block_crc_by_addr(void *handle, u8 type,
+			      u32 start, u32 end)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	_memset(dev->wbuf, 0, 64);
+
+	dev->wbuf[2] = start;
+	dev->wbuf[3] = (start >> 8) & 0xFF;
+	dev->wbuf[4] = (start >> 16) & 0xFF;
+	dev->wbuf[5] = end & 0xFF;
+	dev->wbuf[6] = (end >> 8) & 0xFF;
+	dev->wbuf[7] = (end >> 16) & 0xFF;
+	if (api_protocol_set_cmd(dev, GET_BLK_CRC_ADDR, &type) < 0)
+		return 0;
+
+	return le16(dev->rbuf);
+}
+
+u16 api_get_block_crc_by_num(void *handle, u8 type,
+			     u8 block_num)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	_memset(dev->wbuf, 0, 64);
+
+	dev->wbuf[2] = block_num;
+	if (api_protocol_set_cmd(dev, GET_BLK_CRC_NUM, &type) < 0)
+		return 0;
+
+	return le16(dev->rbuf);
+}
+
+int api_set_data_len(void *handle, u16 data_len)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	_memset(dev->wbuf, 0, 64);
+
+	dev->wbuf[1] = data_len & 0xFF;
+	dev->wbuf[2] = (data_len >> 8) & 0xFF;
+
+	return api_protocol_set_cmd(dev, SET_DATA_LEN, NULL);
+}
+
+int api_write_enable_v6(void *handle, bool in_ap, bool is_slave,
+			u32 start, u32 end)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	u8 type;
+
+	_memset(dev->wbuf, 0, 64);
+	dev->wbuf[1] = 0x5A;
+	dev->wbuf[2] = 0xA5;
+	dev->wbuf[3] = start & 0xFF;
+	dev->wbuf[4] = (start >> 8) & 0xFF;
+	dev->wbuf[5] = start >> 16;
+	dev->wbuf[6] = end & 0xFF;
+	dev->wbuf[7] = (end >> 8) & 0xFF;
+	dev->wbuf[8] = end >> 16;
+
+	type = (in_ap) ? 0x1 : 0x0;
+	type |= (is_slave) ? 0x2 : 0x0;
+
+	return api_protocol_set_cmd(dev, SET_FLASH_EN, &type);
+}
+
+int api_write_data_v6(void *handle, int wlen)
+{
+	return api_protocol_set_cmd(handle, WRITE_DATA_V6, &wlen);
+}
+
+int api_access_slave(void *handle, u8 id, u8 func, void *data)
+{
+	struct ilitek_slave_access access;
+
+	access.slave_id = id;
+	access.func = func;
+	access.data = data;
+
+	return api_protocol_set_cmd(handle, ACCESS_SLAVE, &access);
+}
+
+int api_write_enable_v3(void *handle, bool in_ap, bool write_ap,
+			u32 end, u32 checksum)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	_memset(dev->wbuf, 0, 64);
+	dev->wbuf[1] = 0x5A;
+	dev->wbuf[2] = 0xA5;
+	dev->wbuf[3] = (write_ap) ? 0x0 : 0x1;
+	dev->wbuf[4] = (end >> 16) & 0xFF;
+	dev->wbuf[5] = (end >> 8) & 0xFF;
+	dev->wbuf[6] = end & 0xFF;
+	dev->wbuf[7] = (checksum >> 16) & 0xFF;
+	dev->wbuf[8] = (checksum >> 8) & 0xFF;
+	dev->wbuf[9] = checksum & 0xFF;
+
+	return api_protocol_set_cmd(dev, WRITE_ENABLE, &in_ap);
+}
+
+int api_write_data_v3(void *handle)
+{
+	return api_protocol_set_cmd(handle, WRITE_DATA_V3, NULL);
+}
+
+int api_check_busy(void *handle, int timeout_ms, int delay_ms)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	u8 busy;
+
+	/* retry 2 times at least */
+	int i = MAX(DIV_ROUND_UP(timeout_ms, delay_ms), 2);
+
+	_memset(dev->wbuf, 0, 64);
+
+	while (i--) {
+		api_protocol_set_cmd(dev, GET_SYS_BUSY, &busy);
+		if (busy == ILITEK_TP_SYSTEM_READY)
+			return 0;
+
+		/* delay ms for each check busy */
+		dev->cb.delay_ms(delay_ms);
+
+		/* if caller set no_retry then skip check busy retry */
+		if (dev->setting.no_retry)
+			break;
+	}
+
+	TP_WARN(dev->id, "check busy timeout: %d ms, state: 0x" PFMT_X8 "\n",
+		timeout_ms, busy);
+
+	return -EILIBUSY;
+}
+
+int api_to_bl_mode(void *handle, bool to_bl,
+		   u32 start, u32 end)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int cnt = 0, retry = 15;
+	const u8 target_mode = (to_bl) ? BL_MODE : AP_MODE;
+
+	do {
+		if (api_protocol_set_cmd(dev, GET_MCU_MOD, NULL) < 0)
+			continue;
+
+		if (dev->ic[0].mode == target_mode)
+			goto success_change_mode;
+
+		if (to_bl) {
+			if (dev->protocol.flag == PTL_V3 &&
+			    api_write_enable_v3(dev, true, false, 0, 0) < 0)
+				continue;
+			else if (dev->protocol.flag == PTL_V6 &&
+				 api_write_enable_v6(dev, true, false,
+						     0, 0) < 0)
+				continue;
+
+			api_protocol_set_cmd(dev, SET_BL_MODE, NULL);
+		} else {
+			if (dev->protocol.flag == PTL_V3 &&
+			    api_write_enable_v3(dev, true, false, 0, 0) < 0)
+				continue;
+			else if (dev->protocol.flag == PTL_V6 &&
+				 api_write_enable_v6(dev, false, false,
+						     start, end) < 0)
+				continue;
+
+			api_protocol_set_cmd(dev, SET_AP_MODE, NULL);
+		}
+
+		switch (dev->_interface) {
+		case interface_hid_over_i2c:
+		case interface_i2c:
+			dev->cb.delay_ms(1000 + 100 * cnt);
+			break;
+		case interface_usb:
+			re_enum_helper(dev, enum_ap_bl);
+			break;
+		}
+	} while (!dev->setting.no_retry && cnt++ < retry);
+
+	TP_ERR(dev->id, "current mode: 0x" PFMT_X8 ", change to " PFMT_C8 " mode failed\n",
+		dev->ic[0].mode, (to_bl) ? "BL" : "AP");
+	return -EFAULT;
+
+success_change_mode:
+	TP_MSG(dev->id, "current mode: 0x" PFMT_X8 " " PFMT_C8 " mode\n",
+		dev->ic[0].mode, (to_bl) ? "BL" : "AP");
+
+	/* update fw ver. in AP/BL mode */
+	api_protocol_set_cmd(dev, GET_FW_VER, NULL);
+
+	/* update protocol ver. in AP/BL mode */
+	api_protocol_set_cmd(dev, GET_PTL_VER, NULL);
+
+	return 0;
+}
+
+int api_set_idle(void *handle, bool enable)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	_memset(dev->wbuf, 0, 64);
+	dev->wbuf[1] = (enable) ? 1 : 0;
+	return api_protocol_set_cmd(dev, SET_MCU_IDLE, NULL);
+}
+
+int api_set_func_mode(void *handle, u8 mode)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int error;
+	bool get = false;
+
+	_memset(dev->wbuf, 0, 64);
+
+	switch (dev->protocol.flag) {
+	case PTL_V3:
+		dev->wbuf[1] = 0x55;
+		dev->wbuf[2] = 0xAA;
+		break;
+	case PTL_V6:
+		dev->wbuf[1] = 0x5A;
+		dev->wbuf[2] = 0xA5;
+		break;
+	default:
+		TP_ERR(dev->id, "unrecognized protocol: %x, flag: " PFMT_U8 "",
+			dev->protocol.ver, dev->protocol.flag);
+		return -EINVAL;
+	}
+	dev->wbuf[3] = mode;
+
+	if (dev->protocol.ver < 0x30400) {
+		TP_ERR(dev->id, "protocol: 0x%x not support\n",
+			dev->protocol.ver);
+		return -EINVAL;
+	}
+
+	error = api_protocol_set_cmd(dev, SET_FUNC_MOD, &get);
+	if (error < 0)
+		return error;
+	error = api_get_func_mode(dev);
+	if (error < 0)
+		return error;
+
+	return (dev->func.mode == mode) ? 0 : -EFAULT;
+}
+
+int api_get_func_mode(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	bool get = true;
+
+	return api_protocol_set_cmd(dev, SET_FUNC_MOD, &get);
+}
+
+int api_erase_data_v3(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int error;
+
+	_memset(dev->wbuf, 0xff, sizeof(dev->wbuf));
+
+	TP_INFO(dev->id, "erase data flash for " PFMT_C8 ", mode: " PFMT_X8 "\n",
+		dev->mcu_info.ic_name, dev->ic[0].mode);
+
+	if (is_231x(dev)) {
+		/* V3 231x only support erase data flash in AP mode */
+		if (dev->ic[0].mode != AP_MODE) {
+			TP_WARN(dev->id, "invalid mode: " PFMT_X8 " for data erase\n",
+				dev->ic[0].mode);
+			return 0;
+		}
+
+		error = api_write_enable_v3(dev, true, false, 0, 0);
+		if (error < 0)
+			return error;
+
+		dev->cb.delay_ms(100);
+
+		dev->wbuf[1] = 0x02;
+		error = api_protocol_set_cmd(dev, TUNING_PARA_V3, NULL);
+		if (error < 0)
+			return error;
+
+		switch (dev->_interface) {
+		case interface_usb:
+			return re_enum_helper(dev, enum_ap_bl);
+		default:
+			dev->cb.delay_ms(1500);
+			break;
+		}
+	} else {
+		/* V3 251x only support erase data flash in BL mode */
+		if (dev->ic[0].mode != BL_MODE) {
+			TP_WARN(dev->id, "invalid mode: " PFMT_X8 " for data erase\n",
+				dev->ic[0].mode);
+			return 0;
+		}
+
+		error = api_write_enable_v3(dev, false, false, 0xf01f, 0);
+		if (error < 0)
+			return error;
+
+		dev->cb.delay_ms(5);
+
+		_memset(dev->wbuf + 1, 0xFF, 32);
+		error = api_write_data_v3(dev);
+		if (error < 0)
+			return error;
+
+		dev->cb.delay_ms(500);
+	}
+
+	return 0;
+}
+
+static int api_read_flash_v3(struct ilitek_ts_device *dev, u8 *buf,
+			     u32 start, u32 len)
+{
+	int error;
+	u32 addr, end = start + len, copied;
+
+	for (addr = start, copied = 0; addr < end;
+	     addr += 32, copied += 32) {
+		error = api_protocol_set_cmd(dev, SET_ADDR, &addr);
+		if (error < 0)
+			return error;
+		error = api_protocol_set_cmd(dev, READ_FLASH, NULL);
+		if (error < 0)
+			return error;
+
+		_memcpy(buf + copied, dev->rbuf, 32);
+	}
+
+	return 0;
+}
+
+static int api_read_flash_v6(struct ilitek_ts_device *dev, u8 *buf,
+			     u32 start, u32 len)
+{
+	int error;
+	u32 code, addr, end = start + len, copied;
+	u16 data_len;
+
+	if (dev->ic[0].mode != BL_MODE)
+		return -EINVAL;
+
+	for (addr = start, copied = 0; addr < end;
+	     addr += data_len, copied += data_len) {
+		if (end - addr > 1024)
+			data_len = 2048;
+		else if (end - addr > 256)
+			data_len = 1024;
+		else if (end - addr > 64)
+			data_len = 256;
+		else
+			data_len = 64;
+
+		error = api_set_data_len(dev, data_len);
+		if (error < 0)
+			return error;
+		error = api_protocol_set_cmd(dev, SET_ADDR, &addr);
+		if (error < 0)
+			return error;
+
+		dev->wbuf[1] = 0x1; code = 1 << 16;
+		error = api_protocol_set_cmd(dev, READ_FLASH, &code);
+		if (error < 0)
+			return error;
+
+		dev->wbuf[1] = 0x0; code = data_len & 0xFFFF;
+		error = api_protocol_set_cmd(dev, READ_FLASH, &code);
+		if (error < 0)
+			return error;
+
+		if (dev->_interface == interface_hid_over_i2c)
+			_memcpy(buf + copied, dev->rbuf + 5, data_len);
+		else
+			_memcpy(buf + copied, dev->rbuf, data_len);
+	}
+
+	return 0;
+}
+
+int api_read_flash(void *handle, u8 *buf,
+		   u32 start, u32 len)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if (dev->protocol.flag == PTL_V3)
+		return api_read_flash_v3(dev, buf, start, len);
+
+	return api_read_flash_v6(dev, buf, start, len);
+}
+
+int _api_read_mp_result(void *handle)
+{
+	int error;
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	struct tuning_para_settings tuning;
+	u8 *buf = (u8 *)(&dev->mp);
+	u32 addr = (is_29xx(dev)) ? 0x2e000 : 0x3e000;
+
+	if (dev->ic[0].mode == BL_MODE)
+		return api_read_flash_v6(dev, buf, addr, 1000);
+
+	/* 1000 bytes data/ 2 bytes crc/ 1 bytes checksum */
+	tuning.len = 1003;
+	tuning.buf = buf;
+
+	tuning.func = 0x0; tuning.ctrl = 0x4; tuning.type = 0x10;
+	error = api_protocol_set_cmd(dev, TUNING_PARA_V6, &tuning);
+	if (error < 0)
+		return error;
+
+	tuning.func = 0x1; tuning.ctrl = 0x4; tuning.type = 0x10;
+
+	return api_protocol_set_cmd(dev, TUNING_PARA_V6, &tuning);
+}
+
+int api_read_mp_result(void *handle)
+{
+	int error;
+
+	api_set_ctrl_mode(handle, mode_suspend, false, true);
+	error = _api_read_mp_result(handle);
+	api_set_ctrl_mode(handle, mode_normal, false, true);
+
+	return error;
+}
+
+int _api_write_mp_result(void *handle, struct mp_station *mp)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	struct tuning_para_settings tuning;
+	u8 *buf = (u8 *)mp;
+	u16 crc;
+
+	crc = get_crc(0, 1000, buf, sizeof(struct mp_station));
+	mp->crc = crc;
+
+	tuning.func = 0x0;
+	tuning.ctrl = 0x5;
+	tuning.type = 0x10;
+	tuning.buf = buf;
+	tuning.len = 1002;
+
+	return api_protocol_set_cmd(dev, TUNING_PARA_V6, &tuning);
+}
+
+int api_write_mp_result(void *handle, struct mp_station *mp)
+{
+	int error;
+
+	api_set_ctrl_mode(handle, mode_suspend, false, true);
+	error = _api_write_mp_result(handle, mp);
+	api_set_ctrl_mode(handle, mode_normal, false, true);
+
+	return error;
+}
+
+static void mp_result(const char *item, u8 data)
+{
+	if (data == 1)
+		TP_INFO(NULL, PFMT_C8 " Result: PASS\n", item);
+	else if (data == 2)
+		TP_INFO(NULL, PFMT_C8 " Result: NG\n", item);
+	else
+		TP_INFO(NULL, PFMT_C8 " Result: N/A\n", item);
+}
+
+void api_decode_mp_result(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	struct mp_station *mp = &dev->mp;
+	int i, j;
+	struct mp_station_old *_mp;
+	char module_name[32];
+	char bar_code[256];
+
+	TP_DBG_ARR(NULL, "[MpResult Raw]:", TYPE_U8, 1002, (u8 *)mp);
+
+	TP_MSG(NULL, "mp result ver: 0x%08x\n", mp->info.mp_result_ver);
+
+	/* For Old Mp Result Format */
+	if (mp->info.mp_result_ver == 0xFFFFFFFF ||
+	    mp->info.mp_result_ver < 0x01000000) {
+		_mp = (struct mp_station_old *)mp;
+
+		for (i = 0; i < 9; i++) {
+			TP_INFO(NULL, "***Station%d***\n", i + 1);
+
+			if (!_mp->station[i].week ||
+			    _mp->station[i].week == 0xFF) {
+				TP_INFO(NULL, "No Test\n");
+				continue;
+			}
+
+			TP_INFO(NULL, "Week of year : " PFMT_U8 "\n",
+				_mp->station[i].week);
+			TP_INFO(NULL, "Year : 20%02u\n",
+				_mp->station[i].year);
+			TP_INFO_ARR(NULL, "Firmware Version : ",
+				   TYPE_U8, 8, _mp->station[i].fw_ver);
+
+			_memset(module_name, 0, sizeof(module_name));
+			_memcpy(module_name, _mp->station[i].module,
+				sizeof(_mp->station[i].module));
+			module_name[sizeof(_mp->station[i].module) + 1] = '\0';
+			for (j = 0; j < (int)sizeof(_mp->station[i].module);
+			     j++) {
+				if ((u8)module_name[j] == 0xFF) {
+					module_name[j] = '\0';
+					break;
+				}
+			}
+			TP_INFO(NULL, "Module Name : [" PFMT_C8 "]\n",
+				module_name);
+
+			mp_result("Short Test", _mp->station[i].short_test);
+			mp_result("Open Test", _mp->station[i].open_test);
+			mp_result("Self Cap Test", _mp->station[i].self_test);
+			mp_result("Uniformity Test",
+				_mp->station[i].uniform_test);
+			mp_result("DAC Test", _mp->station[i].dac_test);
+			mp_result("Key Raw Test", _mp->station[i].key_test);;
+			mp_result("Painting Test", _mp->station[i].paint_test);
+			mp_result("MicroOpen Test", _mp->station[i].mopen_test);
+			mp_result("GPIO Test", _mp->station[i].gpio_test);
+			mp_result("Final", _mp->station[i].final_result);
+
+			_memset(bar_code, 0, sizeof(bar_code));
+			_memcpy(bar_code, _mp->station[i].bar_code,
+				sizeof(_mp->station[i].bar_code));
+			bar_code[sizeof(_mp->station[i].bar_code) + 1] = '\0';
+			for (j = 0; j < (int)sizeof(_mp->station[i].bar_code);
+			     j++) {
+				if ((u8)bar_code[j] == 0xFF) {
+					bar_code[j] = '\0';
+					break;
+				}
+			}
+
+			TP_INFO(NULL, "Bar Code : " PFMT_C8 "\n", bar_code);
+			TP_INFO(NULL, "Customer ID : 0x%04x\n",
+				_mp->station[i].custom_id);
+			TP_INFO(NULL, "FWID : 0x%04x\n",
+				_mp->station[i].fwid);
+		}
+
+		return;
+	}
+
+	TP_INFO(NULL, "[MP Result]\n");
+	TP_INFO(NULL, "***Customer Info***\n");
+
+	TP_INFO(NULL, "MPResult Version:%02X.%02X.%02X.%02X\n",
+		(mp->info.mp_result_ver >> 24) & 0xFF,
+		(mp->info.mp_result_ver >> 16) & 0xFF,
+		(mp->info.mp_result_ver >> 8) & 0xFF,
+		mp->info.mp_result_ver & 0xFF);
+	TP_INFO(NULL, "Customer ID : 0x%04X\n", mp->info.customer_id);
+	TP_INFO(NULL, "FW ID : 0x%04X\n", mp->info.fwid);
+
+	for (i = 0; i < (int)ARRAY_SIZE(mp->station); i++) {
+		TP_INFO(NULL, "***Station%d***\n", i + 1);
+
+		if (!mp->station[i].week || mp->station[i].week == 0xFF) {
+			TP_INFO(NULL, "No Test\n");
+			continue;
+		}
+
+		TP_INFO(NULL, "Week of year : %d\n", mp->station[i].week);
+		TP_INFO(NULL, "Year : 20%02d\n", mp->station[i].year);
+		TP_INFO(NULL, "Firmware Version : 0x%02X.0x%02X.0x%02X.0x%02X.0x%02X.0x%02X.0x%02X.0x%02X\n",
+			mp->station[i].fw_ver[7], mp->station[i].fw_ver[6],
+			mp->station[i].fw_ver[5], mp->station[i].fw_ver[4],
+			mp->station[i].fw_ver[3], mp->station[i].fw_ver[2],
+			mp->station[i].fw_ver[1], mp->station[i].fw_ver[0]);
+
+		_memset(module_name, 0, sizeof(module_name));
+		_memcpy(module_name, mp->station[i].module,
+			sizeof(mp->station[i].module));
+		module_name[sizeof(mp->station[i].module) + 1] = '\0';
+		for (j = 0; j < (int)sizeof(mp->station[i].module); j++) {
+			if ((u8)module_name[j] == 0xFF) {
+				module_name[j] = '\0';
+				break;
+			}
+		}
+		TP_INFO(NULL, "Module Name : [" PFMT_C8 "]\n", module_name);
+
+		mp_result("Short Test", mp->station[i].short_test);
+		mp_result("Open Test", mp->station[i].open_test);
+		mp_result("Self Cap Test", mp->station[i].self_test);
+		mp_result("Uniformity Test", mp->station[i].uniform_test);
+		mp_result("DAC Test", mp->station[i].dac_test);
+		mp_result("Key Raw Test", mp->station[i].key_test);;
+		mp_result("Painting Test", mp->station[i].paint_test);
+		mp_result("MicroOpen Test", mp->station[i].mopen_test);
+		mp_result("GPIO Test", mp->station[i].gpio_test);
+		mp_result("Final", mp->station[i].final_result);
+
+		TP_INFO(NULL, "Tool Version : " PFMT_U8 "." PFMT_U8 "." PFMT_U8 "." PFMT_U8 "." PFMT_U8 "." PFMT_U8 "." PFMT_U8 "." PFMT_U8 "\n",
+			mp->station[i].tool_ver[7], mp->station[i].tool_ver[6],
+			mp->station[i].tool_ver[5], mp->station[i].tool_ver[4],
+			mp->station[i].tool_ver[3], mp->station[i].tool_ver[2],
+			mp->station[i].tool_ver[1], mp->station[i].tool_ver[0]);
+
+		_memset(bar_code, 0, sizeof(bar_code));
+		_memcpy(bar_code, mp->station[i].bar_code,
+			sizeof(mp->station[i].bar_code));
+		bar_code[sizeof(mp->station[i].bar_code) + 1] = '\0';
+		TP_INFO(NULL, "Bar Code : " PFMT_C8 "\n", bar_code);
+		TP_INFO(NULL, "Customer ID : 0x%04x\n",
+			mp->station[i].custom_id);
+		TP_INFO(NULL, "FWID : 0x%04x\n", mp->station[i].fwid);
+	}
+}
+
+int api_read_tuning(void *handle, u8 *buf, int rlen)
+{
+	int error;
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	struct tuning_para_settings tuning;
+	int got, need;
+
+	if (dev->ic[0].mode == BL_MODE)
+		return -EINVAL;
+
+	error = api_set_ctrl_mode(dev, mode_suspend, false, true);
+	if (error < 0)
+		return error;
+
+	for (got = 0, need = rlen; need > 0; got += 1024, need -= 1024) {
+		tuning.len = MIN(need, 1024);
+		tuning.buf = buf + got;
+
+		tuning.func = 0x0; tuning.ctrl = 0x2; tuning.type = 0x0;
+		error = api_protocol_set_cmd(dev, TUNING_PARA_V6, &tuning);
+		if (error < 0)
+			return error;
+
+		tuning.func = 0x1; tuning.ctrl = 0x2; tuning.type = 0x0;
+		error = api_protocol_set_cmd(dev, TUNING_PARA_V6, &tuning);
+		if (error < 0)
+			return error;
+	}
+
+	TP_DBG_ARR(dev->id, "[tuning]:", TYPE_U8, rlen, buf);
+
+	return api_set_ctrl_mode(dev, mode_normal, false, true);
+}
+
+int api_write_data_m2v(void *handle, int wlen)
+{
+	return api_protocol_set_cmd(handle, WRITE_DATA_M2V, &wlen);
+}
+
+int api_to_bl_mode_m2v(void *handle, bool to_bl)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int cnt = 0, retry = 15;
+	const u8 target_mode = (to_bl) ? BL_MODE : AP_MODE;
+	u8 mode;
+
+	if (dev->_interface != interface_usb)
+		return -EINVAL;
+
+	do {
+		dev->cb.delay_ms(100);//Reed Add : 20230927
+
+		if (api_access_slave(dev, 0x80, CMD_GET_MCU_MOD, &mode) < 0)
+			continue;
+
+		if (mode == target_mode)
+			goto success_change_mode;
+
+		dev->cb.delay_ms(300);//Reed Add : 20230927
+
+		if (to_bl && api_access_slave(dev, 0x80, CMD_SET_BL_MODE,
+					      NULL) < 0)
+			continue;
+		else if (!to_bl && api_access_slave(dev, 0x80, CMD_SET_AP_MODE,
+						    NULL) < 0)
+			continue;
+
+		do {
+			dev->cb.delay_ms(100);//Reed Add : 20230927
+			if (!api_access_slave(dev, 0x80, CMD_GET_MCU_MOD, &mode) &&
+			    mode == target_mode)
+				goto success_change_mode;
+			dev->cb.delay_ms(5000);
+		} while (!dev->setting.no_retry && cnt++ < retry);
+		break;
+	} while (!!dev->setting.no_retry && cnt++ < retry);
+
+	TP_ERR(dev->id, "M2V current mode: 0x" PFMT_X8 ", change to " PFMT_C8 " mode failed\n",
+		mode, (to_bl) ? "BL" : "AP");
+	return -EFAULT;
+
+success_change_mode:
+	TP_MSG(dev->id, "M2V current mode: 0x" PFMT_X8 " " PFMT_C8 " mode\n",
+		mode, (to_bl) ? "BL" : "AP");
+
+	return 0;
+}
+
+int api_get_ic_crc(void *handle, u8 final_fw_mode)
+{
+	int error;
+	u8 i;
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	error = api_set_ctrl_mode(dev, mode_suspend, false, true);
+	if (error < 0)
+		goto err_set_normal;
+	error = api_protocol_set_cmd(dev, GET_AP_CRC, NULL);
+	if (error < 0)
+		goto err_set_normal;
+
+	if (dev->ic[0].mode != AP_MODE)
+		return 0;
+
+	switch (dev->protocol.flag) {
+	case PTL_V3:
+		error = api_protocol_set_cmd(dev, GET_DF_CRC, NULL);
+		if (error < 0)
+			goto err_set_normal;
+		break;
+	case PTL_V6:
+		for (i = 1; i < dev->tp_info.block_num; i++) {
+			dev->ic[0].crc[i] = api_get_block_crc_by_num(dev,
+				CRC_CALCULATE, i);
+		}
+		break;
+	default:
+		error = -EINVAL; break;
+	}
+
+err_set_normal:
+	api_set_ctrl_mode(dev, final_fw_mode, false, true);
+
+	return error;
+}
+
+void api_print_ts_info(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	u8 i;
+
+	TP_INFO(dev->id, "[Protocol Version]\n");
+	TP_INFO(dev->id, "0x%02X.0x%02X.0x%02X\n",
+		(dev->protocol.ver >> 16) & 0xff,
+		(dev->protocol.ver >> 8) & 0xff,
+		dev->protocol.ver & 0xff);
+
+	TP_INFO(dev->id, "[Firmware Version]\n");
+	TP_INFO(dev->id, "0x%02X.0x%02X.0x%02X.0x%02X\n",
+		dev->fw_ver[0], dev->fw_ver[1],
+		dev->fw_ver[2], dev->fw_ver[3]);
+	TP_INFO(dev->id, "[Customer Version]\n");
+	TP_INFO(dev->id, "0x%02X.0x%02X.0x%02X.0x%02X\n",
+		dev->fw_ver[4], dev->fw_ver[5],
+		dev->fw_ver[6], dev->fw_ver[7]);
+
+	TP_INFO(dev->id, "[Kernel Version]\n");
+	if (dev->protocol.flag == PTL_V6 &&
+	    support_mcu_info(dev)) {
+		TP_INFO(dev->id, "0x%02X.0x%02X.0x%02X.0x%02X.0x%02X (" PFMT_C8 ")\n",
+			dev->mcu_info.ic_name[0], dev->mcu_info.ic_name[1],
+			dev->mcu_info.ic_name[2], dev->mcu_info.ic_name[3],
+			dev->mcu_info.ic_name[4], dev->mcu_info.ic_name);
+	} else {
+		TP_INFO(dev->id, "0x%c%c.0x%c%c\n",
+			dev->mcu_info.ic_name[2], dev->mcu_info.ic_name[3],
+			dev->mcu_info.ic_name[0], dev->mcu_info.ic_name[1]);
+	}
+
+	TP_INFO(dev->id, "[Current Mode]\n");
+	TP_INFO(dev->id, "Master : " PFMT_C8 "\n", dev->ic[0].mode_str);
+
+	if (dev->ic[0].mode != AP_MODE)
+		return;
+
+	for (i = 1; i < dev->tp_info.ic_num; i++)
+		TP_INFO(dev->id, "Slave : " PFMT_C8 "\n", dev->ic[i].mode_str);
+
+	TP_INFO(dev->id, "[Module Name]\n");
+	TP_INFO(dev->id, PFMT_C8 "\n", dev->mcu_info.module_name);
+
+	TP_INFO(dev->id, "[Core Version]\n");
+	TP_INFO(dev->id, "0x%02X.0x%02X.0x%02X.0x%02X\n",
+		dev->core_ver[0], dev->core_ver[1],
+		dev->core_ver[2], dev->core_ver[3]);
+
+	if (is_231x(dev)) {
+		switch (dev->core_ver[1]) {
+		case 0x00:
+			TP_INFO(dev->id, "(Dual Interface)\n"); break;
+		case 0x01:
+			TP_INFO(dev->id, "(USB Interface)\n"); break;
+		case 0x02:
+			TP_INFO(dev->id, "(I2C Interface)\n"); break;
+		}
+	}
+
+	if (dev->protocol.flag == PTL_V6) {
+		TP_INFO(dev->id, "[Tuning Version]\n");
+		TP_INFO(dev->id, "0x%02X.0x%02X.0x%02X.0x%02X\n",
+			dev->tuning_ver[0], dev->tuning_ver[1],
+			dev->tuning_ver[2], dev->tuning_ver[3]);
+	}
+
+	TP_INFO(dev->id, "[Panel Information]\n");
+	TP_INFO(dev->id, "X resolution : " PFMT_U16 "\n", dev->tp_info.x_resolution);
+	TP_INFO(dev->id, "Y resolution : " PFMT_U16 "\n", dev->tp_info.y_resolution);
+	TP_INFO(dev->id, "AA X Channel : " PFMT_U16 "\n", dev->tp_info.x_ch);
+	TP_INFO(dev->id, "AA Y Channel : " PFMT_U16 "\n", dev->tp_info.y_ch);
+	TP_INFO(dev->id, "Support " PFMT_U8 " Fingers\n", dev->tp_info.max_fingers);
+	TP_INFO(dev->id, "Support " PFMT_U8 " Touch Keys\n", dev->tp_info.key_num);
+
+	if (dev->tp_info.key_num) {
+		switch (dev->key.info.mode) {
+		case key_disable:
+			TP_INFO(dev->id, "Key Mode : NO_Key\n");
+			break;
+		case key_hw:
+			TP_INFO(dev->id, "Key Mode : HW_Key_1\n");
+			break;
+		case key_hsw:
+			TP_INFO(dev->id, "Key Mode : HW_Key_2\n");
+			break;
+		case key_vitual:
+			TP_INFO(dev->id, "Key Mode : Virtual_Key\n");
+			break;
+		case key_fw_disable:
+			TP_INFO(dev->id, "Key Mode : FW_disable\n");
+			break;
+		default:
+			TP_INFO(dev->id, "Key Mode : Unknown(0x" PFMT_X8 ")\n",
+				dev->key.info.mode);
+			break;
+		}
+	}
+
+	if (dev->protocol.flag == PTL_V6) {
+		TP_INFO(dev->id, "Support Pen Type : " PFMT_C8 "\n",
+			dev->pen_mode);
+		TP_INFO(dev->id, "Chip Counts : " PFMT_U8 "\n", dev->tp_info.ic_num);
+		TP_INFO(dev->id, "Report Format : " PFMT_U8 "\n", dev->tp_info.format);
+		TP_INFO(dev->id, "Block Number : " PFMT_U8 "\n", dev->tp_info.block_num);
+	}
+
+	if (dev->protocol.flag == PTL_V6) {
+		TP_INFO(dev->id, "[FW CRC]\n");
+		TP_INFO(dev->id, "Master : 0x%04X\n", dev->ic[0].crc[0]);
+		for (i = 1; i < dev->tp_info.ic_num; i++)
+			TP_INFO(dev->id, "Slave : 0x%04X\n", dev->ic[i].crc[0]);
+	} else {
+		TP_INFO(dev->id, "[Check Code]\n");
+		TP_INFO(dev->id, "AP : 0x%08X\n", dev->ic[0].crc[0]);
+		TP_INFO(dev->id, "DATA : 0x%08X\n", dev->ic[0].crc[1]);
+	}
+}
+
+void api_read_then_print_m2v_info(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	u8 m2v_mode;
+	u32 m2v_checksum;
+	u8 m2v_fw_ver[8];
+
+	if (dev->ic[0].mode != AP_MODE)
+		return;
+
+	api_set_ctrl_mode(dev, mode_suspend, false, true);
+	api_access_slave(dev, 0x80, CMD_GET_FW_VER, m2v_fw_ver);
+	api_access_slave(dev, 0x80, CMD_GET_MCU_MOD, &m2v_mode);
+	api_access_slave(dev, 0x80, CMD_GET_AP_CRC, &m2v_checksum);
+	api_set_ctrl_mode(dev, mode_normal, false, true);
+
+	TP_INFO(dev->id, "[M2V Firmware Version]\n");
+	TP_INFO(dev->id, "0x%02X.0x%02X.0x%02X.0x%02X.0x%02X.0x%02X.0x%02X.0x%02X\n",
+		m2v_fw_ver[0], m2v_fw_ver[1], m2v_fw_ver[2], m2v_fw_ver[3],
+		m2v_fw_ver[4], m2v_fw_ver[5], m2v_fw_ver[6], m2v_fw_ver[7]);
+
+	TP_INFO(dev->id, "[M2V Current Mode]\n");
+	TP_INFO(dev->id, "Mode : " PFMT_C8 " Mode\n",
+		(m2v_mode == AP_MODE) ? "AP" : "BL");
+
+	TP_INFO(dev->id, "[M2V FW CheckSum]\n");
+	TP_INFO(dev->id, "FW CheckSum : 0x%08X\n", m2v_checksum);
+}
+
+int api_update_ts_info(void *handle)
+{
+	int error;
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	/* set protocol default V6 initially for comms. afterwards */
+	dev->protocol.flag = PTL_V6;
+	dev->tp_info.ic_num = 1;
+
+	error = api_set_ctrl_mode(dev, mode_suspend, false, true);
+	if (error < 0)
+		goto err_set_normal;
+	error = api_protocol_set_cmd(dev, GET_PTL_VER, NULL);
+	if (error < 0)
+		goto err_set_normal;
+
+	/*
+	 * previous set suspend mode is in V6 format.
+	 * set suspend mode again if device protocol is checked as V3.
+	 */
+	if (dev->protocol.flag == PTL_V3) {
+		error = api_set_ctrl_mode(dev, mode_suspend, false, true);
+		if (error < 0)
+			goto err_set_normal;
+	}
+
+	error = api_protocol_set_cmd(dev, GET_MCU_MOD, NULL);
+	if (error < 0)
+		goto err_set_normal;
+	error = api_protocol_set_cmd(dev, GET_MCU_VER, NULL);
+	if (error < 0)
+		goto err_set_normal;
+	error = api_protocol_set_cmd(dev, GET_FW_VER, NULL);
+	if (error < 0)
+		goto err_set_normal;
+	error = api_protocol_set_cmd(dev, GET_AP_CRC, NULL);
+	if (error < 0)
+		goto err_set_normal;
+
+	if (dev->protocol.flag == PTL_V6) {
+		error = api_protocol_set_cmd(dev, GET_PRODUCT_INFO, NULL);
+		if (error < 0)
+			goto err_set_normal;
+		error = api_protocol_set_cmd(dev, GET_FWID, NULL);
+		if (error < 0)
+			goto err_set_normal;
+		error = api_protocol_set_cmd(dev, GET_SENSOR_ID, NULL);
+		if (error < 0)
+			goto err_set_normal;
+		error = api_protocol_set_cmd(dev, GET_HID_INFO, NULL);
+		if (error < 0)
+			goto err_set_normal;
+	}
+
+	/* BL mode should perform FW upgrade afterward */
+	if (dev->ic[0].mode != AP_MODE)
+		return 0;
+
+	/* V3 need to get DF CRC */
+	if (dev->protocol.flag == PTL_V3) {
+		error = api_protocol_set_cmd(dev, GET_DF_CRC, NULL);
+		if (error < 0)
+			goto err_set_normal;
+	}
+
+	if (dev->protocol.flag == PTL_V6) {
+		error = api_protocol_set_cmd(dev, GET_TUNING_VER, NULL);
+		if (error < 0)
+			goto err_set_normal;
+	}
+
+	error = api_protocol_set_cmd(dev, GET_CORE_VER, NULL);
+	if (error < 0)
+		goto err_set_normal;
+	error = api_protocol_set_cmd(dev, GET_SCRN_RES, NULL);
+	if (error < 0)
+		goto err_set_normal;
+	error = api_protocol_set_cmd(dev, GET_TP_INFO, NULL);
+	if (error < 0)
+		goto err_set_normal;
+	error = api_get_func_mode(dev);
+	if (error < 0)
+		goto err_set_normal;
+
+	if (dev->tp_info.ic_num > 1) {
+		error = api_protocol_set_cmd(dev, GET_AP_CRC,
+					     &dev->tp_info.ic_num);
+		if (error < 0)
+			goto err_set_normal;
+		error = api_protocol_set_cmd(dev, GET_MCU_MOD,
+					     &dev->tp_info.ic_num);
+		if (error < 0)
+			goto err_set_normal;
+	}
+
+err_set_normal:
+	api_set_ctrl_mode(dev, mode_normal, false, true);
+
+	return error;
+}
+
+void __ilitek_get_info(void *handle, struct ilitek_common_info *info)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if (!info || !dev)
+		return;
+
+	_memcpy(info, &dev->quirks, sizeof(struct ilitek_common_info));
+}
+
+void ilitek_dev_set_quirks(void *handle, u32 quirks)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if (!handle)
+		return;
+
+	dev->quirks = quirks;
+}
+
+void ilitek_dev_set_sys_info(void *handle, struct ilitek_sys_info *sys)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if (!handle)
+		return;
+
+	_memcpy(&dev->sys, sys, sizeof(struct ilitek_sys_info));
+}
+
+void ilitek_dev_setting(void *handle, struct ilitek_ts_settings *setting)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+#define X(_enum, _id, _size, _cnt)	\
+	touch_fmts[_id].size = _size;	\
+	touch_fmts[_id].max_cnt = _cnt;
+
+	ILITEK_TOUCH_REPORT_FORMAT;
+#undef X
+
+	if (!handle)
+		return;
+
+	_memcpy(&dev->setting, setting, sizeof(struct ilitek_ts_settings));
+
+	if (dev->setting.default_format_enabled) {
+		dev->fmt.touch_size = touch_fmts[touch_fmt_0x0].size;
+		dev->fmt.touch_max_cnt = touch_fmts[touch_fmt_0x0].max_cnt;
+	}
+
+	TP_MSG(dev->id, "no-retry: %d, no-INT-ack: %d\n",
+		dev->setting.no_retry, dev->setting.no_INT_ack);
+}
+
+void ilitek_dev_bind_callback(void *handle, struct ilitek_ts_callback *callback)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	if (callback) {
+		_memcpy(&dev->cb, callback, sizeof(struct ilitek_ts_callback));
+		if (dev->cb.msg)
+			g_msg = dev->cb.msg;
+	}
+}
+
+void *ilitek_dev_init(u8 _interface, const char *id,
+		      bool need_update_ts_info,
+		      struct ilitek_ts_callback *callback, void *_private)
+{
+	struct ilitek_ts_device *dev;
+
+	dev = (struct ilitek_ts_device *)MALLOC(sizeof(*dev));
+	if (!dev)
+		return NULL;
+
+	TP_MSG(NULL, "commonflow code version: 0x%x\n",
+		COMMONFLOW_CODE_VERSION);
+
+	TP_DBG(NULL, "sizeof(ilitek_ts_device): %u\n",
+		(unsigned int)sizeof(struct ilitek_ts_device));
+
+	/* initial all member to 0/ false/ NULL */
+	_memset(dev, 0, sizeof(*dev));
+
+	_strcpy(dev->id, id, sizeof(dev->id));
+	ilitek_dev_bind_callback(dev, callback);
+
+	dev->_interface = _interface;
+	dev->_private = _private;
+
+	/* set protocol default V6 initially for comms. afterwards */
+	dev->protocol.flag = PTL_V6;
+	dev->tp_info.ic_num = 1;
+
+	dev->fw_mode = mode_unknown;
+
+	if (need_update_ts_info && api_update_ts_info(dev) < 0) {
+		ilitek_dev_exit(dev);
+		return NULL;
+	}
+
+	return dev;
+}
+
+void ilitek_dev_exit(void *handle)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+
+	/*
+	 * LIBUSB would kill /dev/hidraw* and make system stop handling
+	 * device's usb. sw reset is required to re-enum usb then /dev/hidraw*
+	 * would be created and system would start to handle touch event.
+	 */
+	if (dev->quirks & QUIRK_LIBUSB || dev->setting.sw_reset_at_last)
+		api_protocol_set_cmd(dev, SET_SW_RST, NULL);
+
+	if (dev)
+		FREE(dev);
+}
diff --git a/drivers/input/touchscreen/ilitek/ilitek_protocol.h b/drivers/input/touchscreen/ilitek/ilitek_protocol.h
new file mode 100644
index 000000000000..ad9c5c18cd36
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_protocol.h
@@ -0,0 +1,916 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file is part of ILITEK CommonFlow
+ *
+ * Copyright (c) 2022 ILI Technology Corp.
+ * Copyright (c) 2022 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (c) 2022 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#ifndef __ILITEK_PROTOCOL_H__
+#define __ILITEK_PROTOCOL_H__
+
+#include "ilitek_def.h"
+
+/* quirks definition */
+#define QUIRK_WAIT_ACK_DELAY		0x1
+#define QUIRK_BRIDGE			0x2
+#define QUIRK_DAEMON_I2C		0x4
+#define QUIRK_WIFI_ITS_I2C		0x8
+#define QUIRK_LIBUSB			0x10
+
+#define START_ADDR_LEGO			0x3000
+#define START_ADDR_29XX			0x4000
+#define END_ADDR_LEGO			0x40000
+
+#define MM_ADDR_LEGO			0x3020
+#define MM_ADDR_29XX			0x4020
+#define MM_ADDR_2501X			0x4038
+
+#define DF_START_ADDR_LEGO		0x3C000
+#define DF_START_ADDR_29XX		0x2C000
+
+#define ILITEK_TP_SYSTEM_READY		0x50
+
+#define CRC_CALCULATE			0
+#define CRC_GET				1
+
+#define ILTIEK_MAX_BLOCK_NUM		20
+
+#define PTL_ANY				0x00
+#define PTL_V3				0x03
+#define PTL_V6				0x06
+
+#define BL_PROTOCOL_V1_8		0x10800
+#define BL_PROTOCOL_V1_7		0x10700
+#define BL_PROTOCOL_V1_6		0x10600
+
+#define TOUT_CF_BLOCK_0			2500
+#define TOUT_CF_BLOCK_N			500
+#define TOUT_F1_SHORT			1600
+#define TOUT_F1_OPEN			12
+#define TOUT_F1_FREQ_MC			2
+#define TOUT_F1_FREQ_SC			1
+#define TOUT_F1_CURVE			13
+#define TOUT_F1_KEY			400
+#define TOUT_F1_OTHER			27
+#define TOUT_F2				7
+#define TOUT_CD				27
+#define TOUT_C3				100
+#define TOUT_65_WRITE			135
+#define TOUT_65_READ			3
+#define TOUT_68				24
+#define TOUT_CC_SLAVE			16000
+
+#define TOUT_F1_SHORT_RATIO		2
+#define TOUT_F1_OPEN_RATIO		3
+#define TOUT_F1_FREQ_RATIO		3
+#define TOUT_F1_CURVE_RATIO		3
+#define TOUT_F1_OTHER_RATIO		3
+#define TOUT_F2_RATIO			3
+#define TOUT_CD_RATIO			3
+#define TOUT_C3_RATIO			3
+#define TOUT_65_WRITE_RATIO		3
+#define TOUT_65_READ_RATIO		3
+#define TOUT_68_RATIO			3
+#define TOUT_CC_SLAVE_RATIO		2
+
+#define AP_MODE		0x5A
+#define BL_MODE		0x55
+
+#define STYLUS_MODES			\
+	X(STYLUS_WGP,	0x1,	"WGP")	\
+	X(STYLUS_USI,	0x2,	"USI")	\
+	X(STYLUS_MPP,	0x4,	"MPP")
+
+#define ILITEK_CMD_MAP							\
+	X(0x20, PTL_ANY, GET_TP_INFO, api_protocol_get_tp_info)		\
+	X(0x21, PTL_ANY, GET_SCRN_RES, api_protocol_get_scrn_res)	\
+	X(0x22, PTL_ANY, GET_KEY_INFO, api_protocol_get_key_info)	\
+	X(0x30, PTL_ANY, SET_IC_SLEEP, api_protocol_set_sleep)		\
+	X(0x31, PTL_ANY, SET_IC_WAKE, api_protocol_set_wakeup)		\
+	X(0x34, PTL_ANY, SET_MCU_IDLE, api_protocol_set_idle)		\
+	X(0x40, PTL_ANY, GET_FW_VER, api_protocol_get_fw_ver)		\
+	X(0x42, PTL_ANY, GET_PTL_VER, api_protocol_get_ptl_ver)		\
+	X(0x43, PTL_ANY, GET_CORE_VER, api_protocol_get_core_ver)	\
+	X(0x60, PTL_ANY, SET_SW_RST, api_protocol_set_sw_reset)		\
+	X(0x61, PTL_ANY, GET_MCU_VER, api_protocol_get_mcu_ver)		\
+	X(0x68, PTL_ANY, SET_FUNC_MOD, api_protocol_set_func_mode)	\
+	X(0x80, PTL_ANY, GET_SYS_BUSY, api_protocol_get_sys_busy)	\
+	X(0xC0, PTL_ANY, GET_MCU_MOD, api_protocol_get_mcu_mode)	\
+	X(0xC1, PTL_ANY, SET_AP_MODE, api_protocol_set_ap_mode)		\
+	X(0xC2, PTL_ANY, SET_BL_MODE, api_protocol_set_bl_mode)		\
+	X(0xC5, PTL_ANY, READ_FLASH, api_protocol_read_flash)		\
+	X(0xC7, PTL_ANY, GET_AP_CRC, api_protocol_get_ap_crc)		\
+	X(0xC8, PTL_ANY, SET_ADDR, api_protocol_set_flash_addr)		\
+									\
+	/* v3 only cmds */						\
+	X(0x25, PTL_V3, GET_CDC_INFO_V3, api_protocol_get_cdc_info_v3)	\
+	X(0x63, PTL_V3, TUNING_PARA_V3, api_protocol_tuning_para_v3)	\
+	X(0xC3, PTL_V3, WRITE_DATA_V3, api_protocol_write_data_v3)	\
+	X(0xC4, PTL_V3, WRITE_ENABLE, api_protocol_write_enable)	\
+	X(0xCA, PTL_V3, GET_DF_CRC, api_protocol_get_df_crc)		\
+	X(0xF2, PTL_V3, SET_TEST_MOD, api_protocol_set_mode_v3)		\
+	X(0xF3, PTL_V3, INIT_CDC_V3, api_protocol_set_cdc_init_v3)	\
+									\
+	/* v6 only cmds */						\
+	X(0x24, PTL_V6, POWER_STATUS, api_protocol_power_status)	\
+	X(0x27, PTL_V6, GET_SENSOR_ID, api_protocol_get_sensor_id)	\
+	X(0x44, PTL_V6, GET_TUNING_VER, api_protocol_get_tuning_ver)	\
+	X(0x45, PTL_V6, GET_PRODUCT_INFO, api_protocol_get_product_info)\
+	X(0x46, PTL_V6, GET_FWID, api_protocol_get_fwid)		\
+	X(0x47, PTL_V6, GET_CRYPTO_INFO, api_protocol_get_crypto_info)	\
+	X(0x48, PTL_V6, GET_HID_INFO, api_protocol_get_hid_info)	\
+	X(0x62, PTL_V6, GET_MCU_INFO, api_protocol_get_mcu_info)	\
+	X(0x65, PTL_V6, TUNING_PARA_V6, api_protocol_tuning_para_v6)	\
+	X(0x69, PTL_V6, SET_FS_INFO, api_protocol_set_fs_info)		\
+	X(0x6A, PTL_V6, SET_SHORT_INFO, api_protocol_set_short_info)	\
+	X(0x6B, PTL_V6, C_MODEL_INFO, api_protocol_c_model_info)	\
+	X(0x6C, PTL_V6, SET_P2P_INFO, api_protocol_set_p2p_info)	\
+	X(0x6D, PTL_V6, SET_OPEN_INFO, api_protocol_set_open_info)	\
+	X(0x6E, PTL_V6, SET_CHARGE_INFO, api_protocol_set_charge_info)	\
+	X(0x6F, PTL_V6, SET_PEN_FS_INFO, api_protocol_set_pen_fs_info)	\
+	X(0xB0, PTL_V6, WRITE_DATA_M2V, api_protocol_write_data_m2v)	\
+	X(0xC3, PTL_V6, WRITE_DATA_V6, api_protocol_write_data_v6)	\
+	X(0xC9, PTL_V6, SET_DATA_LEN, api_protocol_set_data_len)	\
+	X(0xCB, PTL_V6, ACCESS_SLAVE, api_protocol_access_slave)	\
+	X(0xCC, PTL_V6, SET_FLASH_EN, api_protocol_set_flash_enable)	\
+	X(0xCD, PTL_V6, GET_BLK_CRC_ADDR, api_protocol_get_crc_by_addr)	\
+	X(0xCF, PTL_V6, GET_BLK_CRC_NUM, api_protocol_get_crc_by_num)	\
+	X(0xF0, PTL_V6, SET_MOD_CTRL, api_protocol_set_mode_v6)		\
+	X(0xF1, PTL_V6, INIT_CDC_V6, api_protocol_set_cdc_init_v6)	\
+	X(0xF2, PTL_V6, GET_CDC_V6, api_protocol_get_cdc_v6)
+
+
+#define X(_cmd, _protocol, _cmd_id, _api)	_cmd_id,
+enum ilitek_cmd_ids {
+	ILITEK_CMD_MAP
+	/* ALWAYS keep at the end */
+	MAX_CMD_CNT
+};
+#undef X
+
+#define X(_cmd, _protocol, _cmd_id, _api)	CMD_##_cmd_id = _cmd,
+enum ilitek_cmds { ILITEK_CMD_MAP };
+#undef X
+
+enum ilitek_hw_interfaces {
+	interface_i2c = 0,
+	interface_hid_over_i2c,
+	interface_usb,
+};
+
+enum ilitek_fw_modes {
+	mode_unknown = -1,
+	mode_normal = 0,
+	mode_test,
+	mode_debug,
+	mode_suspend,
+};
+
+enum ilitek_key_modes {
+	key_disable = 0,
+	key_hw = 1,
+	key_hsw = 2,
+	key_vitual = 3,
+	key_fw_disable = 0xff,
+};
+
+#define ILITEK_TOUCH_REPORT_FORMAT			\
+	X(touch_fmt_0x0,	0x0, 5, 10)	\
+	X(touch_fmt_0x1,	0x1, 6, 10)	\
+	X(touch_fmt_0x2,	0x2, 10, 5)	\
+	X(touch_fmt_0x3,	0x3, 10, 5)	\
+	X(touch_fmt_0x4,	0x4, 10, 5)	\
+	X(touch_fmt_0x10,	0x10, 10, 6)	\
+	X(touch_fmt_0x11,	0x11, 5, 10)
+
+#define X(_enum, _id, _size, _cnt)	_enum = _id,
+enum ilitek_touch_fmts {
+	ILITEK_TOUCH_REPORT_FORMAT
+	touch_fmt_max = 0x100,
+};
+#undef X
+
+#define ILITEK_PEN_REPORT_FORMAT		\
+	X(pen_fmt_0x0, 0x0, 12, 1)	\
+	X(pen_fmt_0x1, 0x1, 18, 1)	\
+	X(pen_fmt_0x2, 0x2, 22, 1)
+
+#define X(_enum, _id, _size, _cnt)	_enum = _id,
+enum ilitek_pen_fmts {
+	ILITEK_PEN_REPORT_FORMAT
+	pen_fmt_max = 0x100,
+};
+#undef X
+
+struct ilitek_slave_access {
+	u8 slave_id;
+	u8 func;
+	void *data;
+};
+
+struct tuning_para_settings {
+	u8 func;
+	u8 ctrl;
+	u8 type;
+
+	u8 *buf;
+	u32 len;
+};
+
+struct reports {
+	bool touch_need_update;
+	bool pen_need_update;
+
+	u8 touch[64];
+	u8 pen[64];
+};
+
+struct grid_data {
+	bool need_update;
+	unsigned int X, Y;
+
+	s32 *data;
+};
+
+struct grids {
+	struct grid_data mc;
+	struct grid_data sc_x;
+	struct grid_data sc_y;
+	struct grid_data pen_x;
+	struct grid_data pen_y;
+
+	struct grid_data key_mc;
+	struct grid_data key_x;
+	struct grid_data key_y;
+
+	struct grid_data self;
+
+	/* touch/pen debug message along with frame update */
+	struct reports dmsg;
+};
+
+enum ilitek_enum_type {
+	enum_ap_bl = 0,
+	enum_sw_reset,
+};
+
+typedef void (*update_grid_t)(u32, u32, struct grids *, void *);
+typedef void (*update_report_rate_t)(unsigned int);
+
+typedef int (*write_then_read_t)(u8 *, int, u8 *, int, void *);
+typedef int (*read_ctrl_in_t)(u8 *, int, unsigned int, void *);
+typedef int (*read_interrupt_in_t)(u8 *, int, unsigned int, void *);
+typedef void (*init_ack_t)(unsigned int, void *);
+typedef int (*wait_ack_t)(u8, unsigned int, void *);
+typedef int (*hw_reset_t)(unsigned int, void *);
+typedef int (*re_enum_t)(u8, void *);
+typedef void (*delay_ms_t)(unsigned int);
+
+
+typedef int (*write_then_read_direct_t)(u8 *, int, u8 *, int, void *);
+typedef void (*mode_switch_notify_t)(bool, bool, void *);
+
+#ifdef _WIN32
+/* packed below structures by 1 byte */
+#pragma pack(1)
+#endif
+
+struct __PACKED__ touch_fmt {
+	u8 id : 6;
+	u8 status : 1;
+	u8 reserve : 1;
+	u16 x;
+	u16 y;
+	u8 pressure;
+	u16 width;
+	u16 height;
+
+	u8 algo;
+};
+
+struct __PACKED__ touch_iwb_fmt {
+	u8 status : 3;
+	u8 reserve : 5;
+	u8 id : 6;
+	u8 reserve_1 : 2;
+	u16 x;
+	u16 y;
+	u16 width;
+	u16 height;
+
+	u8 algo;
+};
+
+struct __PACKED__ pen_fmt {
+	union __PACKED__ {
+		u8 modes;
+		struct __PACKED__ {
+			u8 tip_sw : 1;
+			u8 barrel_sw : 1;
+			u8 eraser : 1;
+			u8 invert : 1;
+			u8 in_range : 1;
+			u8 reserve : 3;
+		};
+	};
+	u16 x;
+	u16 y;
+	u16 pressure;
+	s16 x_tilt;
+	s16 y_tilt;
+
+	u8 battery;
+
+	union __PACKED__ {
+		/* usi v1.0 */
+		struct __PACKED__ {
+			u16 barrel_pressure;
+			u8 idx;
+			u8 color;
+			u8 width;
+			u8 style;
+		} usi_1;
+
+		/* usi v2.0 */
+		struct __PACKED__ {
+			u16 barrel_pressure;
+			u8 idx;
+			u8 color;
+			u8 color_24[3];
+			u8 no_color;
+			u8 width;
+			u8 style;
+		} usi_2;
+	};
+};
+
+struct __PACKED__ ilitek_report_fmt_info {
+	u32 touch_size;
+	u32 touch_max_cnt;
+
+	u32 pen_size;
+	u32 pen_max_cnt;
+};
+
+struct __PACKED__ ilitek_screen_info {
+	u16 x_min;
+	u16 y_min;
+	u16 x_max;
+	u16 y_max;
+	u16 pressure_min;
+	u16 pressure_max;
+	s16 x_tilt_min;
+	s16 x_tilt_max;
+	s16 y_tilt_min;
+	s16 y_tilt_max;
+	u16 pen_x_min;
+	u16 pen_y_min;
+	u16 pen_x_max;
+	u16 pen_y_max;
+};
+
+struct __PACKED__ ilitek_tp_info_v6 {
+	u16 x_resolution;
+	u16 y_resolution;
+	u16 x_ch;
+	u16 y_ch;
+	u8 max_fingers;
+	u8 key_num;
+	u8 ic_num;
+	u8 support_modes;
+	u8 format;
+	u8 die_num;
+	u8 block_num;
+	u8 pen_modes;
+	u8 pen_format;
+	u16 pen_x_resolution;
+	u16 pen_y_resolution;
+};
+
+struct __PACKED__ ilitek_tp_info_v3 {
+	u16 x_resolution;
+	u16 y_resolution;
+	u8 x_ch;
+	u8 y_ch;
+	u8 max_fingers;
+	u8 reserve;
+	u8 key_num;
+	u8 reserve_1;
+	u8 touch_start_y;
+	u8 touch_end_y;
+	u8 touch_start_x;
+	u8 touch_end_x;
+	u8 support_modes;
+};
+
+struct __PACKED__ ilitek_key_info_v6 {
+	u8 mode;
+	u16 x_len;
+	u16 y_len;
+
+	struct __PACKED__ _ilitek_key_info_v6 {
+		u8 id;
+		u16 x;
+		u16 y;
+	} keys[50];
+};
+
+struct __PACKED__ ilitek_key_info_v3 {
+	u8 x_len[2];
+	u8 y_len[2];
+
+	struct __PACKED__ _ilitek_key_info_v3 {
+		u8 id;
+		u8 x[2];
+		u8 y[2];
+	} keys[20];
+};
+
+struct __PACKED__ ilitek_ts_kernel_info {
+	char ic_name[6];
+	char mask_ver[2];
+	u32 mm_addr;
+	u32 min_addr;
+	u32 max_addr;
+	char module_name[32];
+
+	char ic_full_name[16];
+};
+
+struct __PACKED__ ilitek_key_info {
+	struct ilitek_key_info_v6 info;
+	bool clicked[50];
+};
+
+struct __PACKED__ ilitek_power_status {
+	u16 header;
+	u8 vdd33_lvd_flag;
+	u8 vdd33_lvd_level_sel;
+};
+
+struct __PACKED__ ilitek_sensor_id {
+	u16 header;
+	u8 id;
+};
+
+struct __PACKED__ ilitek_func_mode {
+	u16 header;
+	u8 mode;
+};
+
+struct __PACKED__ ilitek_ts_protocol {
+	u32 ver;
+	u8 flag;
+};
+
+struct __PACKED__ ilitek_ts_ic {
+	u8 mode;
+	u32 crc[ILTIEK_MAX_BLOCK_NUM];
+
+	char mode_str[32];
+};
+
+struct __PACKED__ ilitek_hid_info {
+	u16 pid;
+	u16 vid;
+	u16 rev;
+};
+
+struct __PACKED__ freq_category {
+	u32 start;
+	u32 end;
+	u32 step;
+	u32 steps;
+
+		u32 size;
+	char limit[1024];
+
+	u8 mode;
+
+	s32 *data;
+};
+
+struct __PACKED__ freq_settings {
+	bool prepared;
+
+	unsigned int frame_cnt;
+
+	/* add from v6.0.A */
+	unsigned int mc_frame_cnt;
+	unsigned int dump_frame_cnt;
+
+	unsigned int scan_type;
+
+	struct freq_category sine;
+	struct freq_category mc_swcap;
+	struct freq_category sc_swcap;
+	struct freq_category pen;
+
+	struct freq_category dump1;
+	struct freq_category dump2;
+	u8 dump1_val;
+	u8 dump2_val;
+
+	u16 packet_steps;
+};
+
+struct __PACKED__ short_settings {
+	bool prepared;
+
+	u8 dump_1;
+	u8 dump_2;
+	u8 v_ref_L;
+	u16 post_idle;
+};
+
+struct __PACKED__ open_settings {
+	bool prepared;
+
+	u16 freq;
+	u8 gain;
+	u8 gain_rfb;
+	u8 afe_res_sel;
+	u8 mc_fsel;
+	u16 frame;
+};
+
+struct __PACKED__ p2p_settings {
+	bool prepared;
+
+	u16 frame_cnt;
+	u8 type;
+
+	/* add from v6.0.A */
+	u16 freq;
+};
+
+struct __PACKED__ charge_curve_sweep {
+	u16 start;
+	u16 end;
+	u8 step;
+	u16 post_idle;
+	u16 fix_val;
+
+	u16 steps;
+};
+
+struct __PACKED__ charge_curve_settings {
+	bool prepared;
+
+	u8 scan_mode;
+
+	struct charge_curve_sweep dump;
+	struct charge_curve_sweep charge;
+
+	u16 c_sub;
+	u16 frame_cnt;
+
+	struct __PACKED__ charge_curve_point {
+		u16 x;
+		u16 y;
+		u16 *dump_max;
+		u16 *dump_avg;
+		u16 *charge_max;
+		u16 *charge_avg;
+	} pt[9];
+
+	u16 packet_steps;
+};
+
+struct __PACKED__ cdc_settings {
+	u8 cmd;
+	u16 config;
+
+	bool skip_checksum;
+
+	/* freq. */
+	struct freq_settings freq;
+	/* short */
+	struct short_settings _short;
+	/* open */
+	struct open_settings open;
+	/* p2p */
+	struct p2p_settings p2p;
+	/* charge curve */
+	struct charge_curve_settings curve;
+
+	/* status only writable by CDC commonflow */
+	bool is_key;
+	bool is_p2p;
+	bool is_freq;
+	bool is_curve;
+	bool is_short;
+	bool is_open;
+	bool is_16bit;
+	bool is_sign;
+	bool is_fast_mode;
+	unsigned int total_bytes;
+
+	/* error code during cdc data collection */
+	s32 error;
+};
+
+struct __PACKED__ mp_station_old {
+	struct __PACKED__ {
+		u8 week;
+		u8 year;
+		u8 fw_ver[8];
+		char module[19];
+
+		u8 short_test:2;
+		u8 open_test:2;
+		u8 self_test:2;
+		u8 uniform_test:2;
+
+		u8 dac_test:2;
+		u8 key_test:2;
+		u8 final_result:2;
+		u8 paint_test:2;
+
+		u8 mopen_test:2;
+		u8 gpio_test:2;
+		u8 reserve_1:4;
+
+		char bar_code[28];
+		u8 reserve_2[35];
+
+		u16 custom_id;
+		u16 fwid;
+		u8 idx;
+	} station[10];
+};
+
+struct __PACKED__ mp_station {
+	struct __PACKED__ {
+		u8 week;
+		u8 year;
+		u8 fw_ver[8];
+		char module[19];
+
+		u8 short_test : 2;
+		u8 open_test : 2;
+		u8 self_test : 2;
+		u8 uniform_test : 2;
+
+		u8 dac_test : 2;
+		u8 key_test : 2;
+		u8 final_result : 2;
+		u8 paint_test : 2;
+
+		u8 mopen_test : 2;
+		u8 gpio_test : 2;
+		u8 reserve : 4;
+
+		u8 tool_ver[8];
+		char bar_code[135];
+
+		u16 custom_id;
+		u16 fwid;
+		u8 idx;
+	} station[5];
+
+	struct __PACKED__ {
+		u8 reserve_1[91];
+		u32 mp_result_ver;
+		u16 customer_id;
+		u16 fwid;
+		u8 reserve_2;
+	} info;
+
+	u16 crc;
+};
+
+struct __PACKED__ ilitek_ts_settings {
+	bool no_retry;
+	bool no_INT_ack;
+
+	bool sw_reset_at_last;
+
+	u8 sensor_id_mask;
+
+	/* only used for QUIRK_WAIT_ACK_DELAY */
+	u32 wait_ack_delay;
+
+	/*
+	 * engineer mode would likely report default format
+	 * ex. IWB-format
+	 */
+	bool default_format_enabled;
+};
+
+struct __PACKED__ ilitek_sys_info {
+	u16 pid;
+};
+
+struct __PACKED__ ilitek_ts_callback {
+	/* Please don't use "repeated start" for I2C interface */
+	write_then_read_t write_then_read;
+	read_ctrl_in_t read_ctrl_in;
+	read_interrupt_in_t read_interrupt_in;
+	init_ack_t init_ack;
+	wait_ack_t wait_ack;
+	hw_reset_t hw_reset;
+	re_enum_t re_enum;
+	delay_ms_t delay_ms;
+	msg_t msg;
+
+	/* write cmd without adding any hid header */
+	write_then_read_direct_t write_then_read_direct;
+	/* notify caller after AP/BL mode switch command */
+	mode_switch_notify_t mode_switch_notify;
+};
+
+struct __PACKED__ ilitek_common_info {
+	u32 quirks;
+	u8 _interface;
+
+	u16 customer_id;
+	u16 fwid;
+
+	char pen_mode[64];
+	u8 fw_ver[8];
+	u8 core_ver[8];
+	u8 tuning_ver[4];
+	u8 product_info[8];
+
+	struct ilitek_sys_info sys;
+	struct ilitek_ts_protocol protocol;
+	struct ilitek_func_mode func;
+	struct ilitek_sensor_id sensor;
+	struct ilitek_ts_ic ic[32];
+	struct ilitek_screen_info screen;
+	struct ilitek_tp_info_v6 tp;
+	struct ilitek_key_info key;
+	struct ilitek_ts_kernel_info mcu;
+	struct ilitek_hid_info hid;
+	struct ilitek_report_fmt_info fmt;
+	struct ilitek_power_status pwr;
+};
+
+struct __PACKED__ ilitek_ts_device {
+	void *_private;
+	char id[64];
+	u32 reset_time;
+
+	struct ilitek_ts_settings setting;
+
+	u32 quirks;
+	u8 _interface;
+
+	u16 customer_id;
+	u16 fwid;
+
+	char pen_mode[64];
+	u8 fw_ver[8];
+	u8 core_ver[8];
+	u8 tuning_ver[4];
+	u8 product_info[8];
+
+	struct ilitek_sys_info sys;
+	struct ilitek_ts_protocol protocol;
+	struct ilitek_func_mode func;
+	struct ilitek_sensor_id sensor;
+	struct ilitek_ts_ic ic[32];
+	struct ilitek_screen_info screen_info;
+	struct ilitek_tp_info_v6 tp_info;
+	struct ilitek_key_info key;
+	struct ilitek_ts_kernel_info mcu_info;
+	struct ilitek_hid_info hid_info;
+	struct ilitek_report_fmt_info fmt;
+	struct ilitek_power_status pwr;
+
+	u8 fw_mode;
+	struct mp_station mp;
+
+	u8 wbuf[4096];
+	u8 rbuf[4096];
+	struct ilitek_ts_callback cb;
+};
+
+#ifdef _WIN32
+#pragma pack()
+#endif
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+u16 __DLL le16(const u8 *p);
+u16 __DLL be16(const u8 *p);
+u32 __DLL le32(const u8 *p, int bytes);
+u32 __DLL be32(const u8 *p, int bytes);
+
+bool __DLL is_29xx(void *handle);
+
+bool __DLL _is_231x(char *ic_name);
+bool __DLL is_231x(void *handle);
+
+bool __DLL has_hw_key(void *handle);
+
+u8 __DLL get_protocol_ver_flag(u32 ver);
+
+int __DLL grid_alloc(void *handle, struct grids *grid);
+void __DLL grid_free(struct grids *grid);
+void __DLL grid_reset(struct grids *grid);
+
+u16 __DLL get_crc(u32 start, u32 end,
+		  u8 *buf, u32 buf_size);
+
+u32 __DLL get_checksum(u32 start, u32 end,
+		       u8 *buf, u32 buf_size);
+
+bool __DLL is_checksum_matched(u8 checksum, int start, int end,
+			       u8 *buf, int buf_size);
+
+bool __DLL support_sensor_id(void *handle);
+bool __DLL support_production_info(void *handle);
+bool __DLL support_fwid(void *handle);
+bool __DLL support_mcu_info(void *handle);
+bool __DLL support_power_status(void *handle);
+int __DLL write_then_wait_ack(void *handle, u8 *cmd, int wlen, int timeout_ms);
+
+int __DLL bridge_set_int_monitor(void *handle, bool enable);
+int __DLL bridge_set_test_mode(void *handle, bool enable);
+
+int __DLL reset_helper(void *handle);
+
+int __DLL write_then_read(void *handle, u8 *cmd, int wlen,
+			  u8 *buf, int rlen);
+int __DLL write_then_read_direct(void *handle, u8 *cmd, int wlen,
+				 u8 *buf, int rlen);
+int __DLL read_interrupt_in(void *handle, u8 *buf, int rlen,
+			    unsigned int timeout_ms);
+int __DLL read_ctrl_in(void *handle, u8 cmd, u8 *buf, int rlen,
+		       unsigned int timeout_ms);
+
+void __DLL __ilitek_get_info(void *handle,
+			     struct ilitek_common_info *info);
+
+void __DLL ilitek_dev_set_quirks(void *handle, u32 quirks);
+void __DLL ilitek_dev_set_sys_info(void *handle, struct ilitek_sys_info *sys);
+void __DLL ilitek_dev_setting(void *handle,
+			      struct ilitek_ts_settings *setting);
+
+void __DLL ilitek_dev_bind_callback(void *handle,
+				    struct ilitek_ts_callback *callback);
+
+void __DLL *ilitek_dev_init(u8 _interface, const char *id,
+			    bool need_update_ts_info,
+			    struct ilitek_ts_callback *callback,
+			    void *_private);
+void __DLL ilitek_dev_exit(void *handle);
+
+void __DLL api_print_ts_info(void *handle);
+void __DLL api_read_then_print_m2v_info(void *handle);
+
+int __DLL api_update_ts_info(void *handle);
+
+int __DLL api_protocol_set_cmd(void *handle, u8 idx, void *data);
+int __DLL api_set_ctrl_mode(void *handle, u8 mode, bool eng, bool force);
+
+u16 __DLL api_get_block_crc_by_addr(void *handle, u8 type,
+				    u32 start, u32 end);
+u16 __DLL api_get_block_crc_by_num(void *handle, u8 type,
+				   u8 block_num);
+
+int __DLL api_set_data_len(void *handle, u16 data_len);
+int __DLL api_write_enable_v6(void *handle, bool in_ap, bool is_slave,
+			      u32 start, u32 end);
+int __DLL api_write_data_v6(void *handle, int wlen);
+int __DLL api_access_slave(void *handle, u8 id, u8 func, void *data);
+int __DLL api_check_busy(void *handle, int timeout_ms, int delay_ms);
+int __DLL api_write_enable_v3(void *handle, bool in_ap,
+			      bool write_ap, u32 end, u32 checksum);
+int __DLL api_write_data_v3(void *handle);
+
+int __DLL api_to_bl_mode(void *handle, bool bl, u32 start, u32 end);
+
+int __DLL api_write_data_m2v(void *handle, int wlen);
+int __DLL api_to_bl_mode_m2v(void *handle, bool to_bl);
+
+int __DLL api_set_idle(void *handle, bool enable);
+int __DLL api_set_func_mode(void *handle, u8 mode);
+int __DLL api_get_func_mode(void *handle);
+
+int __DLL api_erase_data_v3(void *handle);
+
+int __DLL api_read_flash(void *handle, u8 *buf,
+			 u32 start_addr, u32 len);
+
+int __DLL _api_read_mp_result(void *handle);
+int __DLL api_read_mp_result(void *handle);
+int __DLL _api_write_mp_result(void *handle, struct mp_station *mp);
+int __DLL api_write_mp_result(void *handle, struct mp_station *mp);
+void __DLL api_decode_mp_result(void *handle);
+
+int __DLL api_read_tuning(void *handle, u8 *buf, int rlen);
+
+int __DLL api_get_ic_crc(void *handle, u8 final_fw_mode);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/drivers/input/touchscreen/ilitek/ilitek_report.c b/drivers/input/touchscreen/ilitek/ilitek_report.c
new file mode 100644
index 000000000000..dbe8abfd64ef
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_report.c
@@ -0,0 +1,455 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is part of ILITEK CommonFlow
+ *
+ * Copyright (c) 2022 ILI Technology Corp.
+ * Copyright (c) 2022 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (c) 2022 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#include "ilitek_report.h"
+#include "ilitek_crypto.h"
+
+static bool is_debug_packet_id(u8 id, u8 _interface)
+{
+	return ((_interface == interface_i2c && id == 0xdb) ||
+		(_interface == interface_usb && id == 0xaa));
+}
+
+static bool is_pen_packet_id(u8 id)
+{
+	return (id == 0x0c || id == 0x0d);
+}
+
+static void touch_decode(struct ilitek_ts_device *dev,
+			 struct ilitek_report *report,
+			 u8 *buf, u8 cnt)
+{
+	struct touch_fmt *parser, *finger;
+	struct touch_iwb_fmt *parser_iwb;
+	u8 i, j, offset;
+	u32 size = dev->fmt.touch_size;
+
+	offset = (dev->quirks & QUIRK_BRIDGE) ? 4 : 0;
+
+	for (i = 0; i < cnt && i < dev->tp_info.max_fingers; i++) {
+		finger = &report->touch.finger[i];
+
+		do {
+			if (dev->protocol.flag == PTL_V3 &&
+			    dev->_interface == interface_i2c) {
+				finger->id = i;
+				finger->status = buf[1 + offset + i * 5] >> 7;
+				finger->x = ((buf[1 + offset + i * 5] & 0x3F) << 8) +
+					buf[2 + offset + i * 5];
+				finger->y = ((buf[3 + offset + i * 5] & 0x3F) << 8) +
+					buf[4 + offset + i * 5];
+				finger->pressure = buf[5 + offset + i * 5];
+				finger->height = 128;
+				finger->width = 1;
+
+				break;
+			}
+
+			parser = (struct touch_fmt *)
+				(buf + 1 + i * size);
+			parser_iwb = (struct touch_iwb_fmt *)
+				(buf + 1 + i * size);
+
+			finger->id = parser->id;
+			finger->status = parser->status;
+			finger->x = parser->x;
+			finger->y = parser->y;
+
+			if (dev->setting.default_format_enabled)
+				break;
+
+			switch (dev->tp_info.format) {
+			case touch_fmt_0x1:
+				finger->pressure = parser->pressure;
+				break;
+			case touch_fmt_0x2:
+				finger->width = parser->width;
+				finger->height = parser->height;
+				break;
+			case touch_fmt_0x3:
+				finger->pressure = parser->pressure;
+				finger->width = parser->width;
+				finger->height = parser->height;
+				break;
+			case touch_fmt_0x4:
+				finger->id = parser_iwb->id;
+				finger->status =
+					(parser_iwb->status == 0x7) ? 1 : 0;
+				finger->x = parser_iwb->x;
+				finger->y = parser_iwb->y;
+				finger->width = parser_iwb->width;
+				finger->height = parser_iwb->height;
+				break;
+			case touch_fmt_0x10:
+				finger->width = le16(buf + i * size + 6);
+				finger->height = le16(buf + i * size + 8);
+				finger->algo = buf[i * size + 10];
+				report->touch.algo = 0;
+				break;
+			case touch_fmt_0x11:
+				finger->id =
+					(!finger->id) ? 0 : finger->id - 1;
+				break;
+			}
+		} while (false);
+
+		TP_DBG(dev->id,
+		       "[touch-report] id:%hhu, status:%hhu, x:%hu, y:%hu, p:%hhu, w:%hu, h:%hu, algo: 0x%hhx\n",
+			finger->id, finger->status, finger->x, finger->y,
+			finger->pressure, finger->width, finger->height,
+			finger->algo);
+
+		if (finger->id >= dev->tp_info.max_fingers) {
+			TP_ERR(dev->id, "invalid touch id: %hhu >= %hhu\n",
+				finger->id, dev->tp_info.max_fingers);
+			return;
+		}
+
+		/*
+		 * if x/y within key's range, skip touch range check.
+		 */
+		for (j = 0; j < dev->tp_info.key_num; j++) {
+			if ((finger->x < dev->key.info.keys[j].x &&
+			     finger->x > dev->key.info.keys[j].x +
+				     dev->key.info.x_len) &&
+			    (finger->y < dev->key.info.keys[j].y &&
+			     finger->y > dev->key.info.keys[j].y +
+				     dev->key.info.y_len))
+				continue;
+
+			goto skip_touch_range_check;
+		}
+
+		if (finger->status &&
+		    (finger->x - 1 > dev->screen_info.x_max ||
+		     finger->y - 1 > dev->screen_info.y_max ||
+		     finger->x < dev->screen_info.x_min ||
+		     finger->y < dev->screen_info.y_min)) {
+			TP_ERR(dev->id, "Point[%d]: (%d, %d), Limit: (%d:%d, %d:%d) OOB\n",
+				finger->id, finger->x, finger->y,
+				dev->screen_info.x_min, dev->screen_info.x_max,
+				dev->screen_info.y_min, dev->screen_info.y_max);
+			return;
+		}
+
+skip_touch_range_check:
+		continue;
+	}
+
+	report->touch.cnt = i;
+
+	/*
+	 * report touch event callback,
+	 * which includes actual count of finger report just parsed above.
+	 */
+	if (report->cb.report_touch_event)
+		report->cb.report_touch_event(&report->touch, report->_private);
+}
+
+static void pen_decode(struct ilitek_ts_device *dev,
+		       struct ilitek_report *report,
+		       u8 *buf)
+{
+	struct pen_fmt *parser = (struct pen_fmt *)(buf + 1);
+	struct pen_fmt *pen = &report->pen.pen;
+
+	report->pen.cnt = buf[61];
+	report->pen.algo = buf[62];
+
+	memcpy(pen, parser, sizeof(struct pen_fmt));
+
+	switch (dev->tp_info.pen_format) {
+	default:
+		TP_DBG(dev->id,
+		       "[stylus-report] state:0x%hhx, x:%hu, y:%hu, pressure: %hu, x_tilt: %hd, y_tilt: %hd, battery: %hhu\n",
+			pen->modes, pen->x, pen->y, pen->pressure,
+			pen->x_tilt, pen->y_tilt, pen->battery);
+		break;
+	case 1:
+		TP_DBG(dev->id,
+		       "[stylus-report] state:0x%hhx, x:%hu, y:%hu, pressure: %hu, x_tilt: %hd, y_tilt: %hd, battery: %hhu, barrel_pressure: %hu, idx: %hhu, color: %hhu, width: %hhu, style: %hhu\n",
+			pen->modes, pen->x, pen->y, pen->pressure,
+			pen->x_tilt, pen->y_tilt, pen->battery, pen->usi_1.barrel_pressure,
+			pen->usi_1.idx, pen->usi_1.color, pen->usi_1.width,
+			pen->usi_1.style);
+		break;
+	case 2:
+		TP_DBG(dev->id,
+		       "[stylus-report] state:0x%hhx, x:%hu, y:%hu, pressure: %hu, x_tilt: %hd, y_tilt: %hd, battery: %hhu, barrel_pressure: %hu, idx: %hhu, color24: %u, no_color: %hhu, width: %hhu, style: %hhu\n",
+			pen->modes, pen->x, pen->y, pen->pressure,
+			pen->x_tilt, pen->y_tilt, pen->battery, pen->usi_2.barrel_pressure,
+			pen->usi_2.idx, le32(pen->usi_2.color_24, 3),
+			pen->usi_2.no_color, pen->usi_2.width,
+			pen->usi_2.style);
+		break;
+	}
+
+	/* report pen event callback */
+	if (report->cb.report_pen_event)
+		report->cb.report_pen_event(&report->pen, report->_private);
+}
+
+static void dmsg_decode(struct ilitek_ts_device *dev,
+			struct ilitek_report *report,
+			u8 *buf, int buf_size)
+{
+	if ((int)buf[1] >= buf_size)
+		return;
+
+	buf[buf[1]] = '\0';
+	TP_DBG(dev->id, "%s\n", (char *)(buf + 2));
+
+	if (report->cb.report_dmsg)
+		report->cb.report_dmsg((char *)(buf + 2),
+					buf_size - 2, report->_private);
+}
+
+static void report_buf(struct ilitek_report *report, u8 *buf,
+		       bool is_last)
+{
+	if (!report->cb.report_buf)
+		return;
+
+	report->cb.report_buf(buf, 64, is_last, report->_private);
+}
+
+/* return touch finger's count or negative value as error code */
+static int report_get_raw_v3(struct ilitek_ts_device *dev,
+			     struct ilitek_report *report,
+			     u8 *buf, int buf_size)
+{
+	int error;
+
+	u8 cnt;
+	int idx = (dev->quirks & QUIRK_BRIDGE) ? 4 : 0;
+
+	UNUSED(buf_size);
+
+	if (dev->_interface == interface_i2c) {
+		if (dev->quirks & QUIRK_BRIDGE) {
+			error = read_interrupt_in(dev, buf, 64, 1000);
+			if (error < 0)
+				return error;
+
+			if (buf[0] != 0x03 || buf[1] != 0xa3 || buf[2] != 0x10)
+				return -EAGAIN;
+
+			/* move algo byte to index 62 */
+			buf[62] = buf[35];
+		} else if (dev->quirks & QUIRK_DAEMON_I2C ||
+			   dev->quirks & QUIRK_BRIDGE ||
+			   dev->quirks & QUIRK_WIFI_ITS_I2C) {
+			error = read_interrupt_in(dev, buf, 64, 1000);
+			if (error < 0)
+				return error;
+		} else {
+			dev->wbuf[0] = 0x10;
+			error = write_then_read(dev, dev->wbuf, 1, buf, 32);
+			if (error < 0)
+				return error;
+
+			report->touch.algo = buf[31];
+			buf[31] = 0;
+
+			if (buf[0] == 2) {
+				error = write_then_read(dev, NULL, 0,
+							 buf + 31, 20);
+				if (error < 0)
+					return error;
+			}
+
+			/* move algo byte to index 62 */
+			buf[62] = report->touch.algo;
+		}
+
+		switch (dev->rbuf[idx]) {
+		default:
+		case 1:
+			cnt = 6;
+			break;
+		case 0:
+			cnt = 0;
+			break;
+		case 2:
+			cnt = 10;
+			break;
+		}
+	} else {
+		error = read_interrupt_in(dev, buf, 64, 1000);
+		if (error < 0)
+			return error;
+
+		cnt = buf[55];
+
+		/* move algo byte to index 62 */
+		buf[62] = buf[56];
+	}
+
+	report->touch.algo = buf[62];
+
+	report->touch.dbg_size = 64;
+	memcpy(report->touch.dbg, buf, 64);
+
+	report_buf(report, buf, true);
+
+	return cnt;
+}
+
+static bool is_iwb_fmt(struct ilitek_ts_device *dev)
+{
+	return dev->tp_info.format == touch_fmt_0x4 &&
+		!dev->setting.default_format_enabled;
+}
+
+static bool need_skip_checksum(struct ilitek_ts_device *dev,
+			       struct ilitek_report *report,
+			       u8 packet_id, bool is_first)
+{
+	/*
+	 * don't check checksum for below situation:
+	 *   1. debug packet
+	 *   2. normal mode pen packet w/ HID.
+	 *   3. IWB format packet
+	 */
+
+	if (report->skip_checksum)
+		return true;
+
+	if (is_first) {
+		if (is_debug_packet_id(packet_id, dev->_interface))
+			return true;
+
+		if ((dev->_interface == interface_usb ||
+		     dev->_interface == interface_hid_over_i2c) &&
+		    packet_id == 0x0d)
+			return true;
+	}
+
+	if (is_iwb_fmt(dev))
+		return true;
+
+	return false;
+}
+
+/* return touch finger's count or negative value as error code */
+static int report_get_raw_v6(struct ilitek_ts_device *dev,
+			     struct ilitek_report *report,
+			     u8 *buf, int buf_size)
+{
+	int error;
+	u8 i, cnt;
+	u8 size = dev->fmt.touch_size, max_cnt = dev->fmt.touch_max_cnt;
+	u8 tmp[64];
+
+	UNUSED(buf_size);
+
+	error = read_interrupt_in(dev, tmp, 64, 1000);
+	if (error < 0)
+		return error;
+
+	if (dev->tp_info.format == 5)
+		ilitek_decrypt(tmp + 1, 48);
+
+	/* set packet id to 0x48 forcely for using BRIDGE finger report */
+	if (dev->quirks & QUIRK_BRIDGE && !is_pen_packet_id(tmp[0]))
+		tmp[0] = 0x48;
+
+	if (!need_skip_checksum(dev, report, tmp[0], true) &&
+	    !is_checksum_matched(tmp[63], 0, 63, tmp, sizeof(tmp)))
+		return -EILIPROTO;
+
+	report->pen.algo = tmp[62];
+	report->touch.algo = tmp[62];
+	report->pen.dbg_size = 64;
+	report->touch.dbg_size = 64;
+	memcpy(report->pen.dbg, tmp, 64);
+	memcpy(report->touch.dbg, tmp, 64);
+	memcpy(buf, tmp, 64);
+
+	/*
+	 * no need to check contact count byte for debug packet and pen packet.
+	 */
+	if (is_pen_packet_id(tmp[0]) ||
+	    is_debug_packet_id(tmp[0], dev->_interface)) {
+		report_buf(report, tmp, true);
+		return 0;
+	}
+
+	cnt = is_iwb_fmt(dev) ? tmp[55] : tmp[61];
+	for (i = 1; i < DIV_ROUND_UP(cnt, max_cnt); i++) {
+		report_buf(report, tmp, false);
+
+		error = read_interrupt_in(dev, tmp, 64, 1000);
+		if (error < 0)
+			return error;
+
+		if (dev->tp_info.format == 5)
+			ilitek_decrypt(tmp + 1, 48);
+
+		if (!need_skip_checksum(dev, report, tmp[0], false) &&
+		    !is_checksum_matched(tmp[63], 0, 63, tmp, sizeof(tmp)))
+			return -EILIPROTO;
+
+		/* copy and skip the first rid byte */
+		memcpy(buf + i * size * max_cnt + 1, tmp + 1, 63);
+	}
+	report_buf(report, tmp, true);
+
+	return cnt;
+}
+
+int ilitek_report_update(void *handle, struct ilitek_report *report)
+{
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)handle;
+	int cnt;
+
+	if (!dev)
+		return -EINVAL;
+
+	/* initial report event */
+	memset(&report->touch, 0, sizeof(report->touch));
+	memset(&report->pen, 0, sizeof(report->pen));
+
+	memset(dev->rbuf, 0, sizeof(dev->rbuf));
+
+	switch (dev->protocol.flag) {
+	default: return -EPERM;
+	case PTL_V3:
+		cnt = report_get_raw_v3(dev, report, dev->rbuf,
+					 sizeof(dev->rbuf));
+		if (cnt < 0)
+			return cnt;
+
+		break;
+
+	case PTL_V6:
+		cnt = report_get_raw_v6(dev, report, dev->rbuf,
+					sizeof(dev->rbuf));
+		if (cnt < 0)
+			return cnt;
+
+		/* pen packet (V6 only) */
+		if (is_pen_packet_id(dev->rbuf[0])) {
+			pen_decode(dev, report, dev->rbuf);
+			return 0;
+		}
+
+		break;
+	}
+
+	/* debug message packet */
+	if (is_debug_packet_id(dev->rbuf[0], dev->_interface)) {
+		dmsg_decode(dev, report, dev->rbuf, sizeof(dev->rbuf));
+		return 0;
+	}
+
+	touch_decode(dev, report, dev->rbuf, cnt);
+
+	return 0;
+}
diff --git a/drivers/input/touchscreen/ilitek/ilitek_report.h b/drivers/input/touchscreen/ilitek/ilitek_report.h
new file mode 100644
index 000000000000..e49333f9618b
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_report.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file is part of ILITEK CommonFlow
+ *
+ * Copyright (c) 2022 ILI Technology Corp.
+ * Copyright (c) 2022 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (c) 2022 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#ifndef __ILITEK_REPORT_H__
+#define __ILITEK_REPORT_H__
+
+#include "ilitek_def.h"
+#include "ilitek_protocol.h"
+
+#ifdef _WIN32
+/* packed below structures by 1 byte */
+#pragma pack(1)
+#endif
+
+struct __PACKED__ touch_data {
+	struct touch_fmt finger[40];
+
+	u8 cnt;
+	u8 algo;
+	u8 dbg[64];
+	u32 dbg_size;
+};
+
+struct __PACKED__ pen_data {
+	struct pen_fmt pen;
+
+	u8 cnt;
+	u8 algo;
+	u8 dbg[64];
+	u32 dbg_size;
+};
+
+#ifdef _WIN32
+#pragma pack()
+#endif
+
+/* return touch event */
+typedef void(*report_touch_event_t)(struct touch_data *, void *);
+/* return pen event */
+typedef void(*report_pen_event_t)(struct pen_data *, void *);
+/* return debug msg */
+typedef void(*report_dmsg_t)(char *, int, void *);
+/* return raw data buf */
+typedef void(*report_buf_t)(u8 *, int, bool, void *);
+
+struct ilitek_report_callback {
+	report_touch_event_t report_touch_event;
+	report_pen_event_t report_pen_event;
+	report_dmsg_t report_dmsg;
+	report_buf_t report_buf;
+};
+
+struct ilitek_report {
+	struct touch_data touch;
+	struct pen_data pen;
+	struct ilitek_report_callback cb;
+
+	bool skip_checksum;
+
+	void *_private;
+};
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+	int __DLL ilitek_report_update(void *handle, struct ilitek_report *report);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/drivers/input/touchscreen/ilitek/ilitek_tool.c b/drivers/input/touchscreen/ilitek/ilitek_tool.c
new file mode 100644
index 000000000000..689c1c09d397
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_tool.c
@@ -0,0 +1,1156 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ILITEK Touch IC driver
+ *
+ * Copyright (C) 2011 ILI Technology Corporation.
+ *
+ * Author: Luca Hsu <luca_hsu@ilitek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ */
+
+#include "ilitek_ts.h"
+#include "ilitek_common.h"
+#include <linux/firmware.h>
+
+#include <linux/miscdevice.h>
+
+static struct proc_dir_entry *ilitek_proc;
+static struct proc_dir_entry *ilitek_proc_entry;
+
+#define ILITEK_IOCTL_BASE                       100
+#define ILITEK_IOCTL_I2C_WRITE_DATA             _IOWR(ILITEK_IOCTL_BASE, 0, uint64_t)
+#define ILITEK_IOCTL_I2C_WRITE_DATA_COMPAT      _IOWR(ILITEK_IOCTL_BASE, 0, uint32_t)
+#define ILITEK_IOCTL_I2C_WRITE_LENGTH           _IOWR(ILITEK_IOCTL_BASE, 1, int32_t)
+#define ILITEK_IOCTL_I2C_READ_DATA              _IOWR(ILITEK_IOCTL_BASE, 2, uint64_t)
+#define ILITEK_IOCTL_I2C_READ_DATA_COMPAT	_IOWR(ILITEK_IOCTL_BASE, 2, uint32_t)
+#define ILITEK_IOCTL_I2C_READ_LENGTH            _IOWR(ILITEK_IOCTL_BASE, 3, int32_t)
+#define ILITEK_IOCTL_DRIVER_INFORMATION		_IOWR(ILITEK_IOCTL_BASE, 8, int32_t)
+#define ILITEK_IOCTL_USB_UPDATE_RESOLUTION      _IOWR(ILITEK_IOCTL_BASE, 9, int32_t)
+#define ILITEK_IOCTL_I2C_INT_FLAG	        _IOWR(ILITEK_IOCTL_BASE, 10, int32_t)
+#define ILITEK_IOCTL_I2C_UPDATE                 _IOWR(ILITEK_IOCTL_BASE, 11, int32_t)
+#define ILITEK_IOCTL_STOP_READ_DATA             _IOWR(ILITEK_IOCTL_BASE, 12, int32_t)
+#define ILITEK_IOCTL_START_READ_DATA            _IOWR(ILITEK_IOCTL_BASE, 13, int32_t)
+#define ILITEK_IOCTL_I2C_SWITCH_IRQ		_IOWR(ILITEK_IOCTL_BASE, 15, int32_t)
+#define ILITEK_IOCTL_UPDATE_FLAG		_IOWR(ILITEK_IOCTL_BASE, 16, int32_t)
+#define ILITEK_IOCTL_I2C_UPDATE_FW		_IOWR(ILITEK_IOCTL_BASE, 18, int32_t)
+#define ILITEK_IOCTL_RESET			_IOWR(ILITEK_IOCTL_BASE, 19, int32_t)
+#define ILITEK_IOCTL_INT_STATUS			_IOWR(ILITEK_IOCTL_BASE, 20, int32_t)
+
+
+#ifdef ILITEK_TUNING_MESSAGE
+extern bool ilitek_debug_flag;
+#define ILITEK_IOCTL_DEBUG_SWITCH		_IOWR(ILITEK_IOCTL_BASE, 21, int32_t)
+#endif
+
+#define ILITEK_IOCTL_I2C_INT_CLR		_IOWR(ILITEK_IOCTL_BASE, 22, int32_t)
+#define ILITEK_IOCTL_I2C_INT_POLL		_IOWR(ILITEK_IOCTL_BASE, 23, uint64_t)
+#define ILITEK_IOCTL_I2C_INT_POLL_COMPAT	_IOWR(ILITEK_IOCTL_BASE, 23, uint32_t)
+#define ILITEK_IOCTL_I2C_ISR_TYPE		_IOWR(ILITEK_IOCTL_BASE, 24, uint32_t)
+#define ILITEK_IOCTL_I2C_NETLINK		_IOWR(ILITEK_IOCTL_BASE, 25, uint16_t)
+
+
+#define ILITEK_DEVICE_NODE_PERMISSON			0666
+
+static s32 ilitek_file_open(struct inode *inode, struct file *filp)
+{
+	ts->operation_protection = true;
+	TP_MSG(NULL, "operation_protection = %d\n", ts->operation_protection);
+	return 0;
+}
+
+static s32 ilitek_file_close(struct inode *inode, struct file *filp)
+{
+	ts->operation_protection = false;
+	TP_MSG(NULL, "operation_protection = %d\n", ts->operation_protection);
+	return 0;
+}
+
+static ssize_t ilitek_file_write(struct file *filp,
+				 const char *buf, size_t size, loff_t *f_pos)
+{
+	s32 ret = 0, count = 0;
+	u8 buffer[512];
+	u32 *data;
+	char *token = NULL, *cur = NULL;
+
+	if (size > sizeof(buffer)) {
+		TP_ERR(NULL, "invalid buf len: %zu > %zu too large\n",
+			size, sizeof(buffer));
+		return -EINVAL;
+	}
+
+	ret = copy_from_user(buffer, buf, size);
+	if (ret < 0) {
+		TP_ERR(NULL, "copy data from user space, failed");
+		return -1;
+	}
+
+	token = cur = buffer;
+
+	data = kcalloc(size, sizeof(u32), GFP_KERNEL);
+
+	while ((token = strsep(&cur, ",")) != NULL) {
+		//data[count] = str2hex(token);
+		sscanf(token, "%x", &data[count]);
+		TP_MSG(NULL, "data[%d] = %x\n", count, data[count]);
+		count++;
+	}
+
+	if (buffer[size - 2] == 'I' && (size == 20 || size == 52) && buffer[0] == 0x77 && buffer[1] == 0x77) {
+
+		TP_MSG(NULL, "IOCTL_WRITE CMD = %d\n", buffer[2]);
+		switch (buffer[2]) {
+		case 13:
+			//ilitek_irq_enable();
+			TP_MSG(NULL, "ilitek_irq_enable. do nothing\n");
+			break;
+		case 12:
+			//ilitek_irq_disable();
+			TP_MSG(NULL, "ilitek_irq_disable. do nothing\n");
+			break;
+		case 19:
+			ilitek_reset(ts->dev->reset_time);
+			break;
+#ifdef ILITEK_TUNING_MESSAGE
+		case 21:
+			TP_MSG(NULL, "ilitek The ilitek_debug_flag = %d.\n", buffer[3]);
+			if (buffer[3] == 0) {
+				ilitek_debug_flag = false;
+			} else if (buffer[3] == 1) {
+				ilitek_debug_flag = true;
+			}
+			break;
+#endif
+		case 15:
+			if (buffer[3] == 0)
+				ilitek_irq_disable();
+			else
+				ilitek_irq_enable();
+
+			break;
+		case 16:
+			ts->operation_protection = buffer[3];
+			TP_MSG(NULL, "ts->operation_protection = %d\n", ts->operation_protection);
+			break;
+		case 18:
+			ilitek_irq_disable();
+			mutex_lock(&ts->ilitek_mutex);
+			ret = ilitek_write(&buffer[3], 33);
+			mutex_unlock(&ts->ilitek_mutex);
+			ilitek_irq_enable();
+			if (ret < 0)
+				TP_ERR(NULL, "i2c write error, ret %d\n", ret);
+
+			return ret;
+			break;
+		default:
+			return -1;
+		}
+	}
+
+	if (buffer[size - 2] == 'W') {
+		ilitek_irq_disable();
+		mutex_lock(&ts->ilitek_mutex);
+		ret = ilitek_write(buffer, size - 2);
+		mutex_unlock(&ts->ilitek_mutex);
+		ilitek_irq_enable();
+		if (ret < 0) {
+			TP_ERR(NULL, "i2c write error, ret %d\n", ret);
+			return ret;
+		}
+	} else if (!strncmp(buffer, "unhandle_irq", strlen("unhandle_irq"))) {
+		ts->unhandle_irq = !ts->unhandle_irq;
+		TP_MSG(NULL, "ts->unhandle_irq = %d.\n", ts->unhandle_irq);
+	} else if (!strncmp(buffer, "dbg_pkt", strlen("dbg_pkt"))) {
+		set_log_level(log_level_pkt);
+		TP_MSG(NULL, "ilitek_log_level_value = %d.\n", log_level_pkt);
+	} else if (!strncmp(buffer, "dbg_debug", strlen("dbg_debug"))) {
+		set_log_level(log_level_dbg);
+		TP_MSG(NULL, "ilitek_log_level_value = %d.\n", log_level_dbg);
+	} else if (!strncmp(buffer, "dbg_info", strlen("dbg_info"))) {
+		set_log_level(log_level_msg);
+		TP_MSG(NULL, "ilitek_log_level_value = %d.\n", log_level_msg);
+	} else if (!strncmp(buffer, "dbg_err", strlen("dbg_err"))) {
+		set_log_level(log_level_err);
+		TP_MSG(NULL, "ilitek_log_level_value = %d.\n", log_level_err);
+	} else if (!strncmp(buffer, "dbg_num", strlen("dbg_num"))) {
+		TP_MSG(NULL, "ilitek_log_level_value = %d.\n", tp_log_level);
+	}
+#ifdef ILITEK_TUNING_MESSAGE
+	else if (!strncmp(buffer, "truning_dbg_flag", strlen("truning_dbg_flag"))) {
+		ilitek_debug_flag = !ilitek_debug_flag;
+		TP_MSG(NULL, " %s debug_flag message(%X).\n", ilitek_debug_flag ? "Enabled" : "Disabled", ilitek_debug_flag);
+	}
+#endif
+	else if (!strncmp(buffer, "irq_status", strlen("irq_status"))) {
+		TP_MSG(NULL, "gpio_get_value(i2c.irq_gpio) = %d.\n", gpio_get_value(ts->irq_gpio));
+	} else if (!strncmp(buffer, "enable", strlen("enable"))) {
+		ilitek_irq_enable();
+		TP_MSG(NULL, "irq enable\n");
+	} else if (!strncmp(buffer, "disable", strlen("disable"))) {
+		ilitek_irq_disable();
+		TP_MSG(NULL, "irq disable\n");
+	} else if (!strncmp(buffer, "info", strlen("info"))) {
+		ilitek_irq_disable();
+		mutex_lock(&ts->ilitek_mutex);
+		api_update_ts_info(ts->dev);
+		mutex_unlock(&ts->ilitek_mutex);
+		ilitek_irq_enable();
+	} else if (!strncmp(buffer, "reset", strlen("reset"))) {
+		ilitek_reset(ts->dev->reset_time);
+	}
+
+	TP_DBG(NULL, "ilitek return count = %zu\n", size);
+	kfree(data);
+	return size;
+}
+
+static FOPS_IOCTL_FUNC(ilitek_file_ioctl, uint32_t cmd, unsigned long arg)
+{
+	static u8 *buffer;
+	static unsigned long len;
+	s32 ret = 0;
+	int tmp;
+
+	buffer = kmalloc(ILITEK_IOCTL_MAX_TRANSFER, GFP_KERNEL);
+	memset(buffer, 0, ILITEK_IOCTL_MAX_TRANSFER);
+
+	switch (cmd) {
+	case ILITEK_IOCTL_I2C_WRITE_DATA:
+	case ILITEK_IOCTL_I2C_WRITE_DATA_COMPAT:
+		if (len > ILITEK_IOCTL_MAX_TRANSFER) {
+			TP_ERR(NULL, "invalid write len: %lu > %lu too large\n",
+				len, ILITEK_IOCTL_MAX_TRANSFER);
+			ret = -EINVAL;
+			break;
+		}
+
+		if (copy_from_user(buffer, (u8 *)arg, len)) {
+			TP_ERR(NULL, "copy data from user space, failed\n");
+			ret = -EFAULT;
+			break;
+		}
+
+		mutex_lock(&ts->ilitek_mutex);
+		ret = ilitek_write_and_read(buffer, len, 0, NULL, 0);
+		mutex_unlock(&ts->ilitek_mutex);
+		if (ret < 0)
+			TP_ERR(NULL, "i2c write failed, cmd: %x\n", buffer[0]);
+		break;
+	case ILITEK_IOCTL_I2C_READ_DATA:
+	case ILITEK_IOCTL_I2C_READ_DATA_COMPAT:
+		if (len > ILITEK_IOCTL_MAX_TRANSFER) {
+			TP_ERR(NULL, "invalid read len: %lu > %lu too large\n",
+				len, ILITEK_IOCTL_MAX_TRANSFER);
+			ret = -EINVAL;
+			break;
+		}
+
+		mutex_lock(&ts->ilitek_mutex);
+		ret = ilitek_write_and_read(NULL, 0, 0, buffer, len);
+		mutex_unlock(&ts->ilitek_mutex);
+		if (ret < 0) {
+			TP_ERR(NULL, "i2c read failed, buf: %x\n", buffer[0]);
+			break;
+		}
+
+		if (copy_to_user((u8 *)arg, buffer, len)) {
+			ret = -EFAULT;
+			TP_ERR(NULL, "copy data to user space, failed\n");
+		}
+		break;
+	case ILITEK_IOCTL_I2C_WRITE_LENGTH:
+	case ILITEK_IOCTL_I2C_READ_LENGTH:
+		len = arg;
+		break;
+	case ILITEK_IOCTL_DRIVER_INFORMATION:
+		memcpy(buffer, driver_ver, 7);
+		if (copy_to_user((u8 *)arg, buffer, 7))
+			ret = -EFAULT;
+		break;
+	case ILITEK_IOCTL_I2C_UPDATE:
+		break;
+	case ILITEK_IOCTL_I2C_INT_FLAG:
+		buffer[0] = !(gpio_get_value(ts->irq_gpio));
+		if (copy_to_user((u8 *)arg, buffer, 1)) {
+			TP_ERR(NULL, "copy data to user space, failed\n");
+			ret = -EFAULT;
+			break;
+		}
+		TP_DBG(NULL, "ILITEK_IOCTL_I2C_INT_FLAG = %d.\n", buffer[0]);
+		break;
+	case ILITEK_IOCTL_START_READ_DATA:
+		ilitek_irq_enable();
+		ts->unhandle_irq = false;
+		TP_MSG(NULL, "enable_irq and ts->unhandle_irq = false.\n");
+		break;
+	case ILITEK_IOCTL_STOP_READ_DATA:
+		ilitek_irq_disable();
+		ts->unhandle_irq = true;
+		TP_MSG(NULL, "disable_irq and ts->unhandle_irq = true.\n");
+		break;
+	case ILITEK_IOCTL_RESET:
+		ilitek_reset(ts->dev->reset_time);
+		break;
+	case ILITEK_IOCTL_INT_STATUS:
+		if (put_user(gpio_get_value(ts->irq_gpio), (s32 *)arg))
+			ret = -EFAULT;
+		break;
+#ifdef ILITEK_TUNING_MESSAGE
+	case ILITEK_IOCTL_DEBUG_SWITCH:
+		if (copy_from_user(buffer, (u8 *)arg, 1)) {
+			ret = -EFAULT;
+			break;
+		}
+		TP_MSG(NULL, "ilitek The debug_flag = %d.\n", buffer[0]);
+		if (buffer[0] == 0)
+			ilitek_debug_flag = false;
+		else if (buffer[0] == 1)
+			ilitek_debug_flag = true;
+		break;
+#endif
+	case ILITEK_IOCTL_I2C_SWITCH_IRQ:
+		if (copy_from_user(buffer, (u8 *)arg, 1)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		if (buffer[0] == 0)
+			ilitek_irq_disable();
+		else
+			ilitek_irq_enable();
+
+		break;
+	case ILITEK_IOCTL_UPDATE_FLAG:
+		ts->operation_protection = arg;
+		TP_MSG(NULL, "operation_protection = %d\n", ts->operation_protection);
+		break;
+	case ILITEK_IOCTL_I2C_UPDATE_FW:
+		if (copy_from_user(buffer, (u8 *)arg, 35)) {
+			TP_ERR(NULL, "copy data from user space, failed\n");
+			ret = -EFAULT;
+			break;
+		}
+
+		ilitek_irq_disable();
+		mutex_lock(&ts->ilitek_mutex);
+		ret = ilitek_write_and_read(buffer, buffer[34], 0, NULL, 0);
+		mutex_unlock(&ts->ilitek_mutex);
+		ilitek_irq_enable();
+
+		if (ret < 0)
+			TP_ERR(NULL, "i2c write, failed\n");
+
+		break;
+	case ILITEK_IOCTL_I2C_INT_CLR:
+		TP_DBG(NULL, "ILITEK_IOCTL_I2C_INT_CLR, set get_INT false\n");
+		atomic_set(&ts->get_INT, 0);
+		break;
+	case ILITEK_IOCTL_I2C_INT_POLL:
+	case ILITEK_IOCTL_I2C_INT_POLL_COMPAT:
+		tmp = atomic_read(&ts->get_INT);
+		TP_DBG(NULL, "ILITEK_IOCTL_I2C_INT_POLL, get_INT: %d\n", tmp);
+
+		if (copy_to_user((u8 *)arg, &tmp, 1)) {
+			TP_ERR(NULL, "copy data to user space, failed\n");
+			ret = -EFAULT;
+		}
+		break;
+	case ILITEK_IOCTL_I2C_ISR_TYPE:
+		TP_MSG(NULL, "ILITEK_IOCTL_I2C_ISR_TYPE, set ISR type: %lu\n", arg);
+		ts->irq_handle_type = (arg >> 16);
+		ts->irq_read_len = arg & 0xFFFF;
+		break;
+	case ILITEK_IOCTL_I2C_NETLINK:
+		TP_MSG(NULL, "ILITEK_IOCTL_I2C_NETLINK, set netlink: %s with ETH: %hhu\n",
+			(arg >> 8) ? "ON" : "OFF", (u8)(arg & 0xFF));
+
+		if (arg >> 8)
+			ret = ilitek_netlink_init(arg & 0xFF);
+		else
+			ilitek_netlink_exit();
+
+		break;
+	default:
+		TP_ERR(NULL, "unrecognized ioctl cmd: 0x%04x\n", cmd);
+		ret = -EINVAL;
+		break;
+	}
+
+	kfree(buffer);
+	return (ret < 0) ? ret : 0;
+}
+
+static ssize_t ilitek_file_read(struct file *filp, char *buf, size_t count, loff_t *f_pos)
+{
+	u8 *tmp;
+	s32 ret;
+
+	if (count > 8192)
+		count = 8192;
+
+	tmp = kmalloc(count, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+	ilitek_irq_disable();
+	mutex_lock(&ts->ilitek_mutex);
+	ret = ilitek_read(tmp, count);
+	mutex_unlock(&ts->ilitek_mutex);
+	ilitek_irq_enable();
+	if (ret < 0) {
+		TP_ERR(NULL, "i2c read error, ret %d\n", ret);
+		goto err_free;
+	}
+
+	if (copy_to_user(buf, tmp, count)) {
+		ret = -EFAULT;
+		goto err_free;
+	}
+
+err_free:
+	kfree(tmp);
+
+	return ret > 0 ? count : ret;
+}
+
+/* compat ioctl for 32/64 bit user program compatibility */
+#ifdef CONFIG_COMPAT
+static long ilitek_file_compat_ioctl(struct file *fp, uint32_t cmd,
+				     unsigned long arg)
+{
+	return ilitek_file_ioctl(fp, cmd, (unsigned long)compat_ptr(arg));
+}
+#endif
+
+
+static struct file_operations ilitek_fops = {
+	.FOPS_IOCTL = ilitek_file_ioctl,
+
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = ilitek_file_compat_ioctl,
+#endif
+
+	.read = ilitek_file_read,
+	.write = ilitek_file_write,
+	.open = ilitek_file_open,
+	.release = ilitek_file_close,
+};
+
+static struct PROC_FOPS_T ilitek_proc_fops = {
+	.PROC_IOCTL = ilitek_file_ioctl,
+
+#ifdef CONFIG_COMPAT
+	.PROC_COMPAT_IOCTL = ilitek_file_compat_ioctl,
+#endif
+
+	.PROC_READ = ilitek_file_read,
+	.PROC_WRITE = ilitek_file_write,
+	.PROC_OPEN = ilitek_file_open,
+	.PROC_RELEASE = ilitek_file_close,
+};
+
+static ssize_t ilitek_driver_version_read(struct file *fp, char __user *buf,
+					  size_t size, loff_t *off)
+{
+	int cnt;
+	u8 str[256];
+
+	if (*off)
+		return 0;
+
+	cnt = scnprintf(str, sizeof(str), "driver-version-tag: [%*phD]\n",
+			7, driver_ver);
+
+	if (copy_to_user(buf, str, cnt))
+		return -EFAULT;
+
+	*off += cnt;
+
+	return cnt;
+}
+
+static struct PROC_FOPS_T ilitek_fops_drv_version = {
+	.PROC_READ = ilitek_driver_version_read,
+};
+
+static ssize_t ilitek_update_fw_read(struct file *fp, char __user *buf,
+				     size_t size, loff_t *off)
+{
+	int error;
+	int cnt = 0;
+	u8 str[256];
+
+	if (*off)
+		return 0;
+
+	memset(str, 0, sizeof(str));
+	error = ilitek_upgrade_firmware("ilitek.hex");
+	if (error < 0) {
+		error = ilitek_upgrade_firmware("ilitek.bin");
+		if (error < 0)
+			cnt += scnprintf(str, sizeof(str),
+					 "upgrade failed, err: %d\n", error);
+	} else {
+		cnt += scnprintf(str, sizeof(str),
+				 "upgrade success, fw version: %*phD\n",
+				 8, ts->dev->fw_ver);
+	}
+
+	if (copy_to_user(buf, str, cnt))
+		return -EFAULT;
+
+	*off += cnt;
+return cnt;
+}
+
+static struct PROC_FOPS_T ilitek_fops_fwupdate = {
+	.PROC_READ = ilitek_update_fw_read,
+};
+
+static ssize_t ilitek_firmware_version_read(struct file *fp, char __user *buf,
+					    size_t size, loff_t *off)
+{
+	int error;
+	int cnt;
+	u8 str[256];
+
+	if (*off)
+		return 0;
+
+	ilitek_irq_disable();
+	mutex_lock(&ts->ilitek_mutex);
+	error = api_update_ts_info(ts->dev);
+	mutex_unlock(&ts->ilitek_mutex);
+	ilitek_irq_enable();
+
+	if (error < 0)
+		cnt = scnprintf(str, sizeof(str), "read failed, err: %d\n",
+				error);
+	else
+		cnt = scnprintf(str, sizeof(str), "fw-version-tag: [%*phD]\n",
+				8, ts->dev->fw_ver);
+
+	if (copy_to_user(buf, str, cnt))
+		return -EFAULT;
+
+	*off += cnt;
+
+	return cnt;
+}
+
+static struct PROC_FOPS_T ilitek_fops_fwversion = {
+	.PROC_READ = ilitek_firmware_version_read,
+};
+
+static ssize_t ilitek_console_write(struct file *filp, const char *buf,
+				    size_t size, loff_t *f_pos)
+{
+	int error;
+	char tmp[256], str[256];
+	char *ptr, *cur = str;
+	size_t wlen, rlen, _wlen = 0;
+	u8 cmd[64], data[64];
+
+	if (size > sizeof(tmp)) {
+		TP_ERR(NULL, "invalid buf len: %zu > %zu too large\n",
+			size, sizeof(tmp));
+		return -EINVAL;
+	}
+
+	error = copy_from_user(tmp, buf, size);
+	if (error < 0) {
+		TP_ERR(NULL, "copy_from_user failed, err: %d", error);
+		return error;
+	}
+
+	memset(str, 0, sizeof(str));
+	sscanf(tmp, "%zu:%zu:%s", &wlen, &rlen, str);
+	TP_MSG(NULL, "wlen: %zu, rlen: %zu, command: %s\n", wlen, rlen, str);
+
+	while ((ptr = strsep(&cur, "-")) && _wlen < sizeof(cmd))
+		sscanf(ptr, "%hhx", &cmd[_wlen++]);
+
+	if (wlen > 0 && wlen != _wlen) {
+		TP_ERR(NULL, "write cmd length: %zu not match with %s\n",
+			wlen, str);
+		return -EINVAL;
+	} else if (rlen > sizeof(data)) {
+		TP_ERR(NULL, "invalid read cmd length: %zu > %zu too large\n",
+			rlen, sizeof(data));
+		return -EINVAL;
+	}
+
+	if (wlen > 0)
+		TP_MSG(NULL, "[write]: %*phD, len: %zu\n",
+			(int)wlen, cmd, wlen);
+
+	error = ilitek_write_and_read(cmd, wlen, 1, data, rlen);
+	if (error < 0)
+		return error;
+
+	if (rlen > 0)
+		TP_MSG(NULL, "[read]: %*phD, len: %zu\n",
+			(int)rlen, data, rlen);
+
+	return size;
+}
+
+static struct PROC_FOPS_T ilitek_fops_console = {
+	.PROC_WRITE = ilitek_console_write,
+};
+
+static ssize_t ilitek_func_mode_write(struct file *fp, const char *buf,
+				      size_t size, loff_t *off)
+{
+	int error, cnt;
+	char str[64];
+	u8 func_mode;
+
+	cnt = MIN(size, sizeof(str));
+	memset(str, 0, sizeof(str));
+	if (copy_from_user(str, buf, cnt))
+		return -EFAULT;
+
+	sscanf(str, "%hhu", &func_mode);
+	TP_MSG(NULL, "set func mode: %hhu, support max: %hhu modes\n",
+		func_mode, ts->dev->tp_info.support_modes);
+
+	if (func_mode >= ts->dev->tp_info.support_modes)
+		return -EINVAL;
+
+	ilitek_irq_disable();
+	mutex_lock(&ts->ilitek_mutex);
+	error = api_set_ctrl_mode(ts->dev, mode_suspend, false, true);
+	error |= api_set_func_mode(ts->dev, func_mode);
+	error |= api_set_ctrl_mode(ts->dev, mode_normal, false, true);
+	mutex_unlock(&ts->ilitek_mutex);
+	ilitek_irq_enable();
+
+	return (error < 0) ? error : cnt;
+}
+
+static ssize_t ilitek_func_mode_read(struct file *fp, char __user *buf,
+				     size_t size, loff_t *off)
+{
+	int cnt = 0;
+	u8 i;
+	u8 str[256];
+
+	if (*off)
+		return 0;
+
+	ilitek_irq_disable();
+	mutex_lock(&ts->ilitek_mutex);
+	api_set_ctrl_mode(ts->dev, mode_suspend, false, true);
+	api_protocol_set_cmd(ts->dev, GET_TP_INFO, NULL);
+	api_get_func_mode(ts->dev);
+	api_set_ctrl_mode(ts->dev, mode_normal, false, true);
+	mutex_unlock(&ts->ilitek_mutex);
+	ilitek_irq_enable();
+
+	memset(str, 0, sizeof(str));
+	cnt += scnprintf(str, sizeof(str), "function mode: ");
+	for (i = 0; i < ts->dev->tp_info.support_modes; i++) {
+		if (i == ts->dev->func.mode)
+			cnt += scnprintf(str + strlen(str), sizeof(str) - cnt,
+					 "[%hhu] ", i);
+		else
+			cnt += scnprintf(str + strlen(str), sizeof(str) - cnt,
+					 "%hhu ", i);
+	}
+	cnt += scnprintf(str + strlen(str), sizeof(str) - cnt, "\n");
+
+	if (copy_to_user(buf, str, cnt))
+		return -EFAULT;
+
+	*off += cnt;
+
+	return cnt;
+}
+
+static struct PROC_FOPS_T ilitek_fops_func_mode = {
+	.PROC_READ = ilitek_func_mode_read,
+	.PROC_WRITE = ilitek_func_mode_write,
+};
+
+static ssize_t ilitek_crypto_key_write(struct file *fp, const char *buf,
+				       size_t size, loff_t *off)
+{
+	u8 crypto[AES_KEY_LEN * 2];
+
+	if (size != sizeof(crypto) ||
+	    copy_from_user(crypto, buf, sizeof(crypto)))
+		return -EFAULT;
+
+	TP_MSG(NULL, "set crypto_key: %*phD\n", AES_KEY_LEN, crypto);
+	TP_MSG(NULL, "set crypto_iv: %*phD\n", AES_KEY_LEN,
+		crypto + AES_KEY_LEN);
+
+	memcpy(crypto_key, crypto, AES_KEY_LEN);
+	memcpy(crypto_iv, crypto + AES_KEY_LEN, AES_KEY_LEN);
+
+	return sizeof(crypto);
+}
+
+static ssize_t ilitek_crypto_key_read(struct file *fp, char __user *buf,
+				      size_t size, loff_t *off)
+{
+	int cnt = 0;
+	u8 str[256];
+
+	if (*off)
+		return 0;
+
+	memset(str, 0, sizeof(str));
+	cnt += scnprintf(str, sizeof(str), "key: %*phD\n",
+			 AES_KEY_LEN, crypto_key);
+	cnt += scnprintf(str + strlen(str), sizeof(str), "iv: %*phD\n",
+			 AES_KEY_LEN, crypto_iv);
+
+	if (copy_to_user(buf, str, cnt))
+		return -EFAULT;
+
+	*off += cnt;
+
+	return cnt;
+}
+
+static struct PROC_FOPS_T ilitek_fops_crypto_key = {
+	.PROC_READ = ilitek_crypto_key_read,
+	.PROC_WRITE = ilitek_crypto_key_write,
+};
+
+static ssize_t ilitek_setmode_0_read(struct file *fp, char __user *buf,
+				     size_t size, loff_t *off)
+{
+	ilitek_irq_disable();
+	mutex_lock(&ts->ilitek_mutex);
+	api_set_ctrl_mode(ts->dev, mode_suspend, false, true);
+	api_set_func_mode(ts->dev, 0);
+	api_set_ctrl_mode(ts->dev, mode_normal, false, true);
+	mutex_unlock(&ts->ilitek_mutex);
+	ilitek_irq_enable();
+
+	return 0;
+}
+
+static struct PROC_FOPS_T ilitek_fops_setmode_0 = {
+	.PROC_READ = ilitek_setmode_0_read,
+};
+
+static ssize_t ilitek_setmode_1_read(struct file *fp, char __user *buf,
+				     size_t size, loff_t *off)
+{
+	ilitek_irq_disable();
+	mutex_lock(&ts->ilitek_mutex);
+	api_set_ctrl_mode(ts->dev, mode_suspend, false, true);
+	api_set_func_mode(ts->dev, 1);
+	api_set_ctrl_mode(ts->dev, mode_normal, false, true);
+	mutex_unlock(&ts->ilitek_mutex);
+	ilitek_irq_enable();
+
+	return 0;
+}
+
+static struct PROC_FOPS_T ilitek_fops_setmode_1 = {
+	.PROC_READ = ilitek_setmode_1_read,
+};
+
+static ssize_t ilitek_setmode_2_read(struct file *fp, char __user *buf,
+				     size_t size, loff_t *off)
+{
+	ilitek_irq_disable();
+	mutex_lock(&ts->ilitek_mutex);
+	api_set_ctrl_mode(ts->dev, mode_suspend, false, true);
+	api_set_func_mode(ts->dev, 2);
+	api_set_ctrl_mode(ts->dev, mode_normal, false, true);
+	mutex_unlock(&ts->ilitek_mutex);
+	ilitek_irq_enable();
+
+	return 0;
+}
+
+static struct PROC_FOPS_T ilitek_fops_setmode_2 = {
+	.PROC_READ = ilitek_setmode_2_read,
+};
+
+static ssize_t ilitek_driver_version_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	return scnprintf(buf, PAGE_SIZE, "driver-version-tag: [%*phD]\n",
+			 7, driver_ver);
+}
+
+static DEVICE_ATTR(driver_version, 0664, ilitek_driver_version_show, NULL);
+
+static ssize_t ilitek_eds_check_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	if (ts->esd_check)
+		return scnprintf(buf, PAGE_SIZE, "[enable] disable\n");
+
+	return scnprintf(buf, PAGE_SIZE, "enable [disable]\n");
+}
+
+static ssize_t ilitek_esd_check_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t size)
+{
+	TP_MSG(NULL, "set esd check: %hhx to %s\n", ts->esd_check, buf);
+
+	if (!strncmp(buf, "enable", 6) && !ts->esd_check) {
+		ilitek_create_esd_check_workqueue();
+		ts->esd_check = true;
+	} else if (!strncmp(buf, "disable", 7) && ts->esd_check) {
+		ilitek_remove_esd_check_workqueue();
+		ts->esd_check = false;
+	}
+
+	return size;
+}
+static DEVICE_ATTR(esd_check, 0664,
+		   ilitek_eds_check_show,
+		   ilitek_esd_check_store);
+
+
+static ssize_t ilitek_low_power_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	int i;
+	ssize_t cnt = 0;
+
+#define X(_type, _id, _str)	{.str = _str, .id = _id},
+	struct {
+		char *str;
+		u8 id;
+	} modes[] = { ILITEK_LOW_POWER_TYPES };
+#undef X
+
+
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		if (modes[i].id == ts->low_power_status) {
+			cnt += scnprintf(buf + strlen(buf), PAGE_SIZE - cnt,
+					 "[%s] ", modes[i].str);
+			continue;
+		}
+
+		cnt += scnprintf(buf + strlen(buf), PAGE_SIZE - cnt,
+				 "%s ", modes[i].str);
+	}
+
+	cnt += scnprintf(buf + strlen(buf), PAGE_SIZE - cnt, "\n");
+
+	return cnt;
+}
+
+static ssize_t ilitek_low_power_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t size)
+{
+	int i;
+
+#define X(_type, _id, _str)	{.str = _str, .id = _id},
+	struct {
+		char *str;
+		u8 id;
+	} modes[] = { ILITEK_LOW_POWER_TYPES };
+#undef X
+
+	TP_MSG(NULL, "set low power: %hhx to %s\n", ts->low_power_status, buf);
+
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		if (strncmp(buf, modes[i].str, strlen(modes[i].str)))
+			continue;
+		ts->low_power_status = modes[i].id;
+	}
+
+	return size;
+}
+static DEVICE_ATTR(low_power, 0664,
+		   ilitek_low_power_show,
+		   ilitek_low_power_store);
+
+static ssize_t ilitek_gesture_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	int i;
+	ssize_t cnt = 0;
+
+#define X(_type, _id, _str)	{.str = _str, .id = _id},
+	struct {
+		char *str;
+		u8 id;
+	} modes[] = { ILITEK_GESTURE_TYPES };
+#undef X
+
+
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		if (modes[i].id == ts->gesture_status) {
+			cnt += scnprintf(buf + strlen(buf), PAGE_SIZE - cnt,
+					 "[%s] ", modes[i].str);
+			continue;
+		}
+
+		cnt += scnprintf(buf + strlen(buf), PAGE_SIZE - cnt,
+				 "%s ", modes[i].str);
+	}
+
+	cnt += scnprintf(buf + strlen(buf), PAGE_SIZE - cnt, "\n");
+
+	return cnt;
+}
+
+static ssize_t ilitek_gesture_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t size)
+{
+	int i;
+	u8 type = ts->gesture_status;
+
+#define X(_type, _id, _str)	{.str = _str, .id = _id},
+	struct {
+		char *str;
+		u8 id;
+	} modes[] = { ILITEK_GESTURE_TYPES };
+#undef X
+
+	TP_MSG(NULL, "set gesture: %hhx to %s\n", ts->gesture_status, buf);
+
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		if (strncmp(buf, modes[i].str, strlen(modes[i].str)))
+			continue;
+		type = modes[i].id;
+	}
+
+	if (!ts->gesture_status && type)
+		ilitek_register_gesture(ts, true);
+	else if (ts->gesture_status && !type)
+		ilitek_register_gesture(ts, false);
+
+	ts->gesture_status = type;
+
+	return size;
+}
+static DEVICE_ATTR(gesture, 0664, ilitek_gesture_show, ilitek_gesture_store);
+
+static ssize_t ilitek_firmware_version_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	int ret;
+
+	ilitek_irq_disable();
+	mutex_lock(&ts->ilitek_mutex);
+	ret = api_update_ts_info(ts->dev);
+	mutex_unlock(&ts->ilitek_mutex);
+	ilitek_irq_enable();
+
+	if (ret < 0) {
+		TP_ERR(NULL, "read tp info failed, err: %d\n", ret);
+		return scnprintf(buf, PAGE_SIZE, "read failed, err: %d\n", ret);
+	}
+
+	return scnprintf(buf, PAGE_SIZE, "fw-version-tag: [%*phD]\n",
+			 8, ts->dev->fw_ver);
+}
+
+static DEVICE_ATTR(firmware_version, 0664, ilitek_firmware_version_show, NULL);
+
+static ssize_t ilitek_module_name_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	int error;
+
+	ilitek_irq_disable();
+	mutex_lock(&ts->ilitek_mutex);
+	error = api_set_ctrl_mode(ts->dev, mode_suspend, false, true);
+	if (error < 0) {
+		mutex_unlock(&ts->ilitek_mutex);
+		ilitek_irq_enable();
+		goto out;
+	}
+	error = api_protocol_set_cmd(ts->dev, GET_MCU_VER, NULL);
+	if (error < 0) {
+		mutex_unlock(&ts->ilitek_mutex);
+		ilitek_irq_enable();
+		goto out;
+	}
+	error = api_set_ctrl_mode(ts->dev, mode_normal, false, true);
+	if (error < 0)
+		TP_ERR(NULL, "read mcu ver. failed, err: %d\n", error);
+	mutex_unlock(&ts->ilitek_mutex);
+	ilitek_irq_enable();
+
+out:
+	if (error < 0)
+		return scnprintf(buf, PAGE_SIZE, "read failed, err: %d\n",
+				 error);
+
+	return scnprintf(buf, PAGE_SIZE, "module-name-tag: [%s]\n",
+			 ts->dev->mcu_info.module_name);
+}
+
+static DEVICE_ATTR(product_id, 0664, ilitek_module_name_show, NULL);
+
+static ssize_t ilitek_update_fw_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	int error;
+
+	error = ilitek_upgrade_firmware("ilitek.hex");
+	if (error < 0)
+		error = ilitek_upgrade_firmware("ilitek.bin");
+	if (error < 0)
+		return scnprintf(buf, PAGE_SIZE, "upgrade failed, err: %d\n",
+				 error);
+
+	return scnprintf(buf, PAGE_SIZE,
+			 "upgrade success, current fw version: %*phD\n",
+			 8, ts->dev->fw_ver);
+}
+
+static DEVICE_ATTR(update_fw, 0664, ilitek_update_fw_show, NULL);
+
+static struct attribute *ilitek_sysfs_attrs_ctrl[] = {
+	&dev_attr_driver_version.attr,
+	&dev_attr_firmware_version.attr,
+	&dev_attr_product_id.attr,
+	&dev_attr_gesture.attr,
+	&dev_attr_low_power.attr,
+	&dev_attr_esd_check.attr,
+	&dev_attr_update_fw.attr,
+	NULL
+};
+
+static struct attribute_group ilitek_attribute_group[] = {
+	{ .attrs = ilitek_sysfs_attrs_ctrl },
+};
+
+int ilitek_create_sysfsnode(void)
+{
+	int error;
+
+	error = sysfs_create_group(&ts->device->kobj, ilitek_attribute_group);
+	if (error < 0) {
+		TP_ERR(NULL, "sysfs_create_group failed, err: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+void ilitek_remove_sys_node(void)
+{
+	sysfs_remove_group(&ts->device->kobj, ilitek_attribute_group);
+}
+
+static struct miscdevice ilitek_misc = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "ilitek_ctrl",
+	.fops = &ilitek_fops,
+	.mode = 0666,
+};
+
+int ilitek_create_tool_node(void)
+{
+#ifdef ILITEK_TOOL
+	misc_register(&ilitek_misc);
+
+	ilitek_proc = proc_create("ilitek_ctrl", ILITEK_DEVICE_NODE_PERMISSON,
+				  NULL, &ilitek_proc_fops);
+
+	if (!ilitek_proc)
+		TP_ERR(NULL, "proc_create(ilitek_ctrl, ILITEK_DEVICE_NODE_PERMISSON, NULL, &ilitek_fops) fail\n");
+
+	ilitek_proc_entry = proc_mkdir("ilitek", NULL);
+	if (!ilitek_proc_entry) {
+		TP_ERR(NULL, "Error, failed to creat procfs.\n");
+		return -EINVAL;
+	}
+
+	if (!proc_create("driver_version", ILITEK_DEVICE_NODE_PERMISSON,
+			 ilitek_proc_entry, &ilitek_fops_drv_version))
+		TP_ERR(NULL, "failed to create procfs driver_version.\n");
+
+	if (!proc_create("firmware_version", ILITEK_DEVICE_NODE_PERMISSON,
+			 ilitek_proc_entry, &ilitek_fops_fwversion))
+		TP_ERR(NULL, "failed to create procfs firmware_version.\n");
+
+	if (!proc_create("console", ILITEK_DEVICE_NODE_PERMISSON,
+			 ilitek_proc_entry, &ilitek_fops_console))
+		TP_ERR(NULL, "failed to create procfs console.\n");
+
+	if (!proc_create("update_fw", ILITEK_DEVICE_NODE_PERMISSON,
+			 ilitek_proc_entry, &ilitek_fops_fwupdate))
+		TP_ERR(NULL, "failed to create procfs update_fw.\n");
+
+	if (!proc_create("func_mode", ILITEK_DEVICE_NODE_PERMISSON,
+			 ilitek_proc_entry, &ilitek_fops_func_mode))
+		TP_ERR(NULL, "failed to create procfs func_mode.\n");
+
+	if (!proc_create("crypto_key", ILITEK_DEVICE_NODE_PERMISSON,
+			 ilitek_proc_entry, &ilitek_fops_crypto_key))
+		TP_ERR(NULL, "failed to create procfs crypto_key.\n");
+
+	/*
+	 * below setmode_X is historical setting for some customer need
+	 * to set function mode by cat procfs node.
+	 * please make sure it's not risky to modifiy below.
+	 */
+	if (!proc_create("setmode_0", ILITEK_DEVICE_NODE_PERMISSON,
+			 ilitek_proc_entry, &ilitek_fops_setmode_0))
+		TP_ERR(NULL, "failed to create procfs setmode_0.\n");
+	if (!proc_create("setmode_1", ILITEK_DEVICE_NODE_PERMISSON,
+			 ilitek_proc_entry, &ilitek_fops_setmode_1))
+		TP_ERR(NULL, "failed to create procfs setmode_1.\n");
+	if (!proc_create("setmode_2", ILITEK_DEVICE_NODE_PERMISSON,
+			 ilitek_proc_entry, &ilitek_fops_setmode_2))
+		TP_ERR(NULL, "failed to create procfs setmode_2.\n");
+#endif
+
+	return 0;
+}
+
+int ilitek_remove_tool_node(void)
+{
+#ifdef ILITEK_TOOL
+
+	misc_deregister(&ilitek_misc);
+
+	if (ilitek_proc) {
+		TP_MSG(NULL, "remove procfs ilitek_ctrl.\n");
+		remove_proc_entry("ilitek_ctrl", NULL);
+		ilitek_proc = NULL;
+	}
+
+	if (ilitek_proc_entry) {
+		TP_MSG(NULL, "remove procfs inode\n");
+		remove_proc_entry("driver_version", ilitek_proc_entry);
+		remove_proc_entry("firmware_version", ilitek_proc_entry);
+		remove_proc_entry("console", ilitek_proc_entry);
+		remove_proc_entry("update_fw", ilitek_proc_entry);
+		remove_proc_entry("func_mode", ilitek_proc_entry);
+		remove_proc_entry("crypto_key", ilitek_proc_entry);
+
+		remove_proc_entry("setmode_0", ilitek_proc_entry);
+		remove_proc_entry("setmode_1", ilitek_proc_entry);
+		remove_proc_entry("setmode_2", ilitek_proc_entry);
+
+		remove_proc_entry("ilitek", NULL);
+		ilitek_proc_entry = NULL;
+	}
+#endif
+	return 0;
+}
diff --git a/drivers/input/touchscreen/ilitek/ilitek_ts.h b/drivers/input/touchscreen/ilitek/ilitek_ts.h
new file mode 100644
index 000000000000..9ee0b13e08cd
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_ts.h
@@ -0,0 +1,268 @@
+/*
+ * ILITEK Touch IC driver
+ *
+ * Copyright (C) 2011 ILI Technology Corporation.
+ *
+ * Author: Luca Hsu <luca_hsu@ilitek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ *
+ */
+
+#ifndef __ILITEK_TS_H__
+#define __ILITEK_TS_H__
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/i2c.h>
+#include <linux/spi/spi.h>
+
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/sched.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/cdev.h>
+#include <linux/uaccess.h>
+#include <linux/version.h>
+#include <linux/rtc.h>
+#include <linux/gpio.h>
+#include <linux/regulator/consumer.h>
+#include <linux/proc_fs.h>
+#include <linux/fs.h>
+#include <linux/pm_runtime.h>
+#include <linux/ctype.h>
+#include <linux/errno.h>
+
+#include <linux/init.h>
+#include <net/sock.h>
+#include <net/netlink.h>
+#include <linux/skbuff.h>
+#include <linux/netlink.h>
+#include <linux/sched.h>
+#include <linux/netfilter.h>
+#include <linux/netfilter_ipv4.h>
+#include <linux/ip.h>
+#include <linux/tcp.h>
+#include <linux/icmp.h>
+#include <linux/udp.h>
+
+#ifdef CONFIG_OF
+#include <linux/of_gpio.h>
+#endif
+//#if defined(CONFIG_FB)
+#if 0
+#include <linux/notifier.h>
+#include <linux/fb.h>
+#define ILITEK_BLANK_POWERDOWN			FB_BLANK_POWERDOWN
+#define	ILITEK_BLANK_UNBLANK			FB_BLANK_UNBLANK
+#define	ILITEK_EVENT_BLANK			FB_EVENT_BLANK
+#define	ILITEK_BLANK_NORMAL			FB_BLANK_NORMAL
+#elif defined(CONFIG_HAS_EARLYSUSPEND)
+#include <linux/earlysuspend.h>
+#endif
+
+#define ILITEK_BL_ADDR				0x41
+#define ILITEK_SENSOR_ID_MASK			0xff
+
+#define ILITEK_PLAT_QCOM			1
+#define ILITEK_PLAT_MTK				2
+#define ILITEK_PLAT_ROCKCHIP			3
+#define ILITEK_PLAT_ALLWIN			4
+#define ILITEK_PLAT_AMLOGIC			5
+#define ILITEK_PLAT				ILITEK_PLAT_ROCKCHIP
+//#define CONFIG_QCOM_DRM
+#if ILITEK_PLAT == ILITEK_PLAT_QCOM
+#ifdef CONFIG_QCOM_DRM
+#include <linux/msm_drm_notify.h>
+#define ILITEK_BLANK_POWERDOWN			MSM_DRM_BLANK_POWERDOWN
+#define ILITEK_BLANK_UNBLANK			MSM_DRM_BLANK_UNBLANK
+#define ILITEK_EVENT_BLANK			MSM_DRM_EVENT_BLANK
+#define ILITEK_BLANK_NORMAL			MSM_DRM_BLANK_UNBLANK
+#endif
+#endif
+
+#define ILITEK_GESTURE_TYPES			\
+	X(Disable, 0, "disable")		\
+	X(Single_Click, 1, "single-click")	\
+	X(Double_Click, 2, "double-click")
+#define ILITEK_GESTURE_DEFAULT			Gesture_Disable
+
+#define X(_type, _id, _str)	Gesture_##_type = _id,
+enum Gesture_Type {
+	ILITEK_GESTURE_TYPES
+};
+#undef X
+
+#define ILITEK_LOW_POWER_TYPES		\
+	X(Sleep,	0, "sleep")	\
+	X(Idle,		1, "idle")	\
+	X(PowerOff,	2, "poweroff")
+#define ILITEK_LOW_POWER_DEFAULT		Low_Power_Sleep
+
+#define X(_type, _id, _str)	Low_Power_##_type = _id,
+enum Low_Power_Type {
+	ILITEK_LOW_POWER_TYPES
+};
+#undef X
+
+#define ILITEK_CHECKSUM_FAILED_RELEASE		true
+
+#define ILITEK_TOUCH_PROTOCOL_B
+//#define ILITEK_REPORT_PRESSURE
+//#define ILITEK_USE_LCM_RESOLUTION
+//#define ILITEK_ISR_PROTECT
+
+#define ILITEK_TUNING_MESSAGE
+#define ILITEK_REGISTER_SUSPEND_RESUME
+#define ILITEK_ESD_CHECK_ENABLE			0
+
+#define ILITEK_TOOL
+
+#define ILITEK_ROTATE_FLAG			0
+#define ILITEK_REVERT_X				0
+#define ILITEK_REVERT_Y				0
+#define TOUCH_SCREEN_X_MAX			1080	//LCD_WIDTH
+#define TOUCH_SCREEN_Y_MAX			1920	//LCD_HEIGHT
+#define ILITEK_RESOLUTION_MAX			16384
+//#define ILITEK_ENABLE_REGULATOR_POWER_ON
+#define ILITEK_GET_GPIO_NUM
+
+#define ILITEK_GET_TIME_FUNC_WITH_TIME		0
+#define ILITEK_GET_TIME_FUNC_WITH_JIFFIES	1
+#define ILITEK_GET_TIME_FUNC			ILITEK_GET_TIME_FUNC_WITH_JIFFIES
+
+#define DOUBLE_CLICK_DISTANCE			1000
+#define DOUBLE_CLICK_ONE_CLICK_USED_TIME	800
+#define DOUBLE_CLICK_NO_TOUCH_TIME		1000
+#define DOUBLE_CLICK_TOTAL_USED_TIME		(DOUBLE_CLICK_NO_TOUCH_TIME + (DOUBLE_CLICK_ONE_CLICK_USED_TIME * 2))
+
+//#define ILITEK_WAKELOCK_SUPPORT
+#if defined(ILITEK_WAKELOCK_SUPPORT)
+#include <linux/wakelock.h>
+#endif
+
+#define ILITEK_TS_NAME				"ilitek_ts"
+
+#define ABSSUB(a, b) ((a > b) ? (a - b) : (b - a))
+
+#if ILITEK_PLAT == ILITEK_PLAT_MTK
+//#define MTK_UNDTS //no use dts and for mtk old version
+
+#define ILITEK_ENABLE_DMA
+#define ILITEK_DMA_SIZE				4096
+#define ILITEK_USE_MTK_INPUT_DEV
+
+#if define(ILITEK_USE_MTK_INPUT_DEV) && !defined(ILITEK_USE_LCM_RESOLUTION)
+#define ILITEK_USE_LCM_RESOLUTION
+#endif
+
+#ifdef ILITEK_GET_GPIO_NUM
+#undef ILITEK_GET_GPIO_NUM
+#endif
+
+#include <linux/sched.h>
+#include <linux/kthread.h>
+#include <linux/wait.h>
+#include <linux/time.h>
+
+#include <linux/namei.h>
+#include <linux/vmalloc.h>
+#include <linux/timer.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+
+#ifdef MTK_UNDTS
+
+#define TPD_KEY_COUNT   4
+#define key_1           {60, 17000}	//auto define
+#define key_2           {180, 17000}
+#define key_3           {300, 17000}
+#define key_4           {420, 17000}
+
+#define TPD_KEYS        {KEY_MENU, KEY_HOMEPAGE, KEY_BACK, KEY_SEARCH}	//change for you panel key info
+#define TPD_KEYS_DIM    {{key_1, 50, 30 }, {key_2, 50, 30 }, {key_3, 50, 30 }, {key_4, 50, 30 } }
+
+struct touch_vitual_key_map_t {
+	int point_x;
+	int point_y;
+};
+
+extern struct touch_vitual_key_map_t touch_key_point_maping_array[];
+
+#include <mach/mt_pm_ldo.h>
+#include <cust_eint.h>
+#include "cust_gpio_usage.h"
+#include <mach/mt_gpio.h>
+#include <mach/mt_typedefs.h>
+#include <pmic_drv.h>
+#include <mach/mt_boot.h>
+#include <linux/dma-mapping.h>
+
+#else
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/of_irq.h>
+#include <linux/gpio.h>
+
+#ifdef CONFIG_MTK_BOOT
+#include "mt_boot_common.h"
+#endif
+
+#endif /* MTK_UNDTS */
+
+#include "tpd.h"
+extern struct tpd_device *tpd;
+#endif /* ILITEK_PLAT == ILITEK_PLAT_MTK */
+
+#if ILITEK_PLAT == ILITEK_PLAT_ALLWIN
+#include <linux/irq.h>
+#include <linux/init-input.h>
+#include <linux/pm.h>
+#include <linux/gpio.h>
+extern struct ctp_config_info config_info;
+#endif
+
+
+#ifndef ILITEK_GET_GPIO_NUM
+#if ILITEK_PLAT == ILITEK_PLAT_MTK
+#ifdef MTK_UNDTS
+#define ILITEK_IRQ_GPIO				GPIO_CTP_EINT_PIN
+#define ILITEK_RESET_GPIO			GPIO_CTP_RST_PIN
+#else
+#define ILITEK_IRQ_GPIO				GTP_INT_PORT
+#define ILITEK_RESET_GPIO			GTP_RST_PORT
+#endif
+#elif ILITEK_PLAT == ILITEK_PLAT_ALLWIN
+#define ILITEK_IRQ_GPIO				config_info.int_number
+#define ILITEK_RESET_GPIO			config_info.wakeup_gpio.gpio
+#else
+#define ILITEK_IRQ_GPIO				9
+#define ILITEK_RESET_GPIO			10
+#endif
+#endif
+
+#define ILITEK_I2C_RETRY_COUNT			3
+
+#if ILITEK_PLAT == ILITEK_PLAT_ALLWIN
+extern int ilitek_suspend_allwin(struct i2c_client *client, pm_message_t mesg);
+extern int ilitek_resume_allwin(struct i2c_client *client);
+#endif
+
+#endif
diff --git a/drivers/input/touchscreen/ilitek/ilitek_update.c b/drivers/input/touchscreen/ilitek/ilitek_update.c
new file mode 100644
index 000000000000..d7e873a3c204
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_update.c
@@ -0,0 +1,1657 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is part of ILITEK CommonFlow
+ *
+ * Copyright (c) 2022 ILI Technology Corp.
+ * Copyright (c) 2022 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (c) 2022 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#include "ilitek_update.h"
+
+#ifdef _WIN32
+/* packed below structures by 1 byte */
+#pragma pack(1)
+#endif
+
+
+#ifdef _WIN32
+#pragma pack()
+#endif
+
+#ifndef __KERNEL__
+static int hex_to_bin(u8 ch)
+{
+	u8 cu = ch & 0xdf;
+	return -1 +
+		((ch - '0' +  1) & (unsigned)((ch - '9' - 1) &
+		('0' - 1 - ch)) >> 8) +
+		((cu - 'A' + 11) & (unsigned)((cu - 'F' - 1) &
+		('A' - 1 - cu)) >> 8);
+}
+
+static int hex2bin(u8 *dst, const u8 *src, size_t count)
+{
+	int hi = 0, lo = 0;
+
+	while (count--) {
+		hi = hex_to_bin(*src++);
+		lo = hex_to_bin(*src++);
+		if (hi < 0 || lo < 0) {
+			TP_ERR(NULL, "hex_to_bin failed, hi: %d, lo: %d\n",
+				hi, lo);
+			return -EINVAL;
+		}
+
+		*dst++ = (hi << 4) | lo;
+	}
+	return 0;
+}
+#endif
+
+static u32 get_tag_addr(u32 start, u32 end,
+			const u8 *buf, unsigned int buf_size,
+			const u8 *tag, unsigned int tag_size)
+{
+	unsigned int i;
+
+	for (i = start; i <= end - tag_size && i < buf_size - tag_size; i++) {
+		if (!memcmp(buf + i, tag, tag_size))
+			return i + tag_size + 1;
+	}
+
+	return end;
+}
+
+static u32 get_endaddr(u32 start, u32 end, const u8 *buf,
+		       unsigned int buf_size, bool is_AP)
+{
+	u32 addr;
+	u8 tag[32];
+	const u8 ap_tag[] = "ILITek AP CRC   ";
+	const u8 blk_tag[] = "ILITek END TAG  ";
+
+	_memset(tag, 0xFF, sizeof(tag));
+	_memcpy(tag + 16, (is_AP) ? ap_tag : blk_tag, 16);
+
+	addr = get_tag_addr(start, end, buf, buf_size, tag, sizeof(tag));
+	TP_DBG(NULL, "find tag in start/end: 0x%x/0x%x, tag addr: 0x%x\n",
+		start, end, addr);
+
+	return addr;
+}
+
+static int decode_mm(struct ilitek_fw_handle *fw, u32 addr,
+		     u8 *buf, u32 buf_size)
+{
+	u8 i;
+	union mapping_info *mapping;
+
+	TP_INFO(NULL, "------------Memory Mapping information------------\n");
+	TP_INFO(NULL, "memory-mapping-info addr: 0x%x\n", addr);
+
+	mapping = (union mapping_info *)(buf + addr);
+	_memset(fw->file.ic_name, 0, sizeof(fw->file.ic_name));
+
+	switch (mapping->mapping_ver[2]) {
+	case 0x2:
+		_memcpy(fw->file.ic_name, mapping->ic_name,
+			sizeof(mapping->ic_name));
+		break;
+	default:
+	case 0x1:
+		_sprintf(fw->file.ic_name, 0, "%02x%02x",
+			mapping->ic_name[1], mapping->ic_name[0]);
+		break;
+	}
+
+	if (!strcmp(fw->file.ic_name, "2133"))
+		_sprintf(fw->file.ic_name, 0, "2132S");
+
+	if (fw->dev && strcmp(fw->dev->mcu_info.ic_name, fw->file.ic_name)) {
+		TP_ERR(fw->dev->id, "IC: " PFMT_C8 ", Firmware File: " PFMT_C8 " not matched\n",
+			fw->dev->mcu_info.ic_name, fw->file.ic_name);
+		return -EINVAL;
+	}
+
+	TP_MSG(NULL, "Hex Mapping Ver.: 0x%x\n",
+		le32(mapping->mapping_ver, 3));
+	TP_MSG(NULL, "Hex Protocol: 0x%x\n",
+		le32(mapping->protocol_ver, 3));
+	TP_MSG(NULL, "Hex MCU Ver.: " PFMT_C8 "\n", fw->file.ic_name);
+
+	_memset(fw->file.fw_ver, 0, sizeof(fw->file.fw_ver));
+	fw->file.fwid = 0xffff;
+
+	fw->file.mm_addr = addr;
+	switch (addr) {
+	case 0x4038:
+	case 0x4020:
+		fw->file.mm_size = 128;
+		fw->file.fw_ver[0] = mapping->_lego.fw_ver[3];
+		fw->file.fw_ver[1] = mapping->_lego.fw_ver[2];
+		fw->file.fw_ver[2] = mapping->_lego.fw_ver[1];
+		fw->file.fw_ver[3] = mapping->_lego.fw_ver[0];
+		fw->file.fw_ver[4] = buf[0x2C007];
+		fw->file.fw_ver[5] = buf[0x2C006];
+		fw->file.fw_ver[6] = buf[0x2C005];
+		fw->file.fw_ver[7] = buf[0x2C004];
+
+		fw->file.fwid = mapping->_lego.fwid;
+		break;
+	case 0x3020:
+		fw->file.mm_size = 128;
+		fw->file.fw_ver[0] = mapping->_lego.fw_ver[3];
+		fw->file.fw_ver[1] = mapping->_lego.fw_ver[2];
+		fw->file.fw_ver[2] = mapping->_lego.fw_ver[1];
+		fw->file.fw_ver[3] = mapping->_lego.fw_ver[0];
+		fw->file.fw_ver[4] = buf[0x3C007];
+		fw->file.fw_ver[5] = buf[0x3C006];
+		fw->file.fw_ver[6] = buf[0x3C005];
+		fw->file.fw_ver[7] = buf[0x3C004];
+
+		fw->file.fwid = mapping->_lego.fwid;
+		break;
+	case 0x2020:
+		fw->file.mm_size = 132;
+		fw->file.fw_ver[0] = buf[0x2033];
+		fw->file.fw_ver[1] = buf[0x2032];
+		fw->file.fw_ver[2] = buf[0x2031];
+		fw->file.fw_ver[3] = buf[0x2030];
+		fw->file.fw_ver[4] = buf[0xF004];
+		fw->file.fw_ver[5] = buf[0xF005];
+		fw->file.fw_ver[6] = buf[0xF006];
+		fw->file.fw_ver[7] = buf[0xF007];
+
+		/* for V3 251x IC, get AP crc and DF checksum */
+		fw->file.blocks[0].check = get_crc(fw->file.blocks[0].start,
+			fw->file.blocks[0].end - 1, buf, buf_size);
+
+		if (fw->file.blocks[1].end > fw->file.blocks[1].start) {
+			fw->file.blocks[1].check = get_checksum(
+				fw->file.blocks[1].start,
+				fw->file.blocks[1].end + 1, buf, buf_size);
+		}
+		break;
+
+	case 0x500:
+		fw->file.mm_size = 132;
+		fw->file.fw_ver[0] = buf[0x52D];
+		fw->file.fw_ver[1] = buf[0x52C];
+		fw->file.fw_ver[2] = buf[0x52B];
+		fw->file.fw_ver[3] = buf[0x52A];
+		fw->file.fw_ver[4] = buf[0x1F404];
+		fw->file.fw_ver[5] = buf[0x1F405];
+		fw->file.fw_ver[6] = buf[0x1F406];
+		fw->file.fw_ver[7] = buf[0x1F407];
+
+		/* for V3 231x IC, get AP checksum and DF checksum */
+		fw->file.blocks[0].check = get_checksum(
+			fw->file.blocks[0].start,
+			fw->file.blocks[0].end + 1, buf, buf_size);
+		if (fw->file.blocks[1].end > fw->file.blocks[1].start) {
+			fw->file.blocks[1].check = get_checksum(
+				fw->file.blocks[1].start,
+				fw->file.blocks[1].end + 1, buf, buf_size);
+		}
+		break;
+	default:
+		fw->file.mm_size = 0;
+		break;
+	}
+
+	TP_MSG(NULL, "file fwid: 0x%04x\n", fw->file.fwid);
+
+	TP_INFO(NULL, "File FW Version: %02x-%02x-%02x-%02x\n",
+		fw->file.fw_ver[0], fw->file.fw_ver[1],
+		fw->file.fw_ver[2], fw->file.fw_ver[3]);
+	TP_INFO(NULL, "File Customer Version: %02x-%02x-%02x-%02x\n",
+		fw->file.fw_ver[4], fw->file.fw_ver[5],
+		fw->file.fw_ver[6], fw->file.fw_ver[7]);
+
+	if (le32(mapping->mapping_ver, 3) < 0x10000)
+		goto memory_mapping_end;
+
+	TP_INFO(NULL, "File Tuning Version: %02x-%02x-%02x-%02x\n",
+		mapping->_lego.tuning_ver[3], mapping->_lego.tuning_ver[2],
+		mapping->_lego.tuning_ver[1], mapping->_lego.tuning_ver[0]);
+
+	if (mapping->_lego.block_num > ARRAY_SIZE(fw->file.blocks)) {
+		TP_ERR(NULL, "Unexpected block num: " PFMT_U8 " > %u\n",
+			mapping->_lego.block_num,
+			(unsigned int)ARRAY_SIZE(fw->file.blocks));
+		goto memory_mapping_end;
+	}
+
+	fw->file.block_num = mapping->_lego.block_num;
+
+	TP_MSG(NULL, "Total " PFMT_U8 " blocks\n", fw->file.block_num);
+	for (i = 0; i < fw->file.block_num; i++) {
+		fw->file.blocks[i].start =
+			le32(mapping->_lego.blocks[i].addr, 3);
+		fw->file.blocks[i].end = (i == fw->file.block_num - 1) ?
+			le32(mapping->_lego.end_addr, 3) :
+			le32(mapping->_lego.blocks[i + 1].addr, 3);
+
+		/*
+		 * get end addr. of block,
+		 * i.e. address of block's final byte of crc.
+		 */
+		fw->file.blocks[i].end = get_endaddr(
+			fw->file.blocks[i].start, fw->file.blocks[i].end,
+			buf, buf_size, i == 0);
+
+		fw->file.blocks[i].check = get_crc(fw->file.blocks[i].start,
+			fw->file.blocks[i].end - 1,
+			buf, buf_size);
+
+		TP_MSG(NULL, "Block[%u], start:0x%x end:0x%x, crc:0x%x\n",
+			i, fw->file.blocks[i].start, fw->file.blocks[i].end,
+			fw->file.blocks[i].check);
+	}
+
+memory_mapping_end:
+	TP_INFO(NULL, "--------------------------------------------------\n");
+
+	return 0;
+}
+
+static int decode_hex(struct ilitek_fw_handle *fw, u8 *hex,
+		      u32 start, u32 end,
+		      u8 *buf, u32 buf_size)
+{
+	int error;
+	u8 info[4], data[16];
+	unsigned int i, len, addr, type, exaddr = 0;
+	u32 mapping_info_addr = 0;
+
+	/* m2v hex has another block at the end of hex file */
+	u8 j = (fw->m2v) ? fw->file.block_num : 0;
+
+	fw->file.blocks[j].start = (~0U);
+	fw->file.blocks[j].end = 0x0;
+	fw->file.blocks[j].check = 0x0;
+	fw->file.blocks[j + 1].start = (~0U);
+	fw->file.blocks[j + 1].end = 0x0;
+	fw->file.blocks[j + 1].check = 0x0;
+
+	for (i = start; i < end; i++) {
+		/* filter out non-hexadecimal characters */
+		if (hex_to_bin(hex[i]) < 0)
+			continue;
+
+		error = hex2bin(info, hex + i, sizeof(info));
+		if (error < 0)
+			return error;
+
+		len = info[0];
+		addr = be32(info + 1, 2);
+		type = info[3];
+
+		error = hex2bin(data, hex + i + 8, len);
+		if (error < 0)
+			return error;
+
+		switch (type) {
+		case 0xAC:
+			mapping_info_addr = be32(data, len);
+			break;
+
+		case 0xAD:
+			fw->file.blocks[1].start = be32(data, len);
+			_memset(buf + fw->file.blocks[1].start, 0, 0x1000);
+			break;
+
+		case 0xBA:
+			if (be32(data, len) != 2U)
+				break;
+
+			TP_MSG(NULL, "start to decode M2V part of hex file\n");
+			fw->m2v = true;
+			////Reed Add : 20230721��������2326��������Decode_mm,�ټ�������M2V���֡���
+			if (mapping_info_addr)
+				decode_mm(fw, mapping_info_addr, buf, buf_size);
+			return decode_hex(fw, hex, i + 10 + len * 2 + 1, end,
+					  fw->m2v_buf, ILITEK_FW_BUF_SIZE);
+
+		case 0x01:
+			goto success_return;
+
+		case 0x02:
+			exaddr = be32(data, len) << 4;
+			break;
+
+		case 0x04:
+			exaddr = be32(data, len) << 16;
+			break;
+
+		case 0x05:
+			TP_MSG(NULL, "hex data type: 0x%x, start linear address: 0x%x\n",
+				type, be32(data, len));
+			break;
+
+		case 0x00:
+			addr += exaddr;
+
+			if (addr + len > buf_size) {
+				TP_ERR(NULL, "hex addr: 0x%x, buf size: 0x%x OOB\n",
+					addr + len, buf_size);
+				return -ENOBUFS;
+			}
+			_memcpy(buf + addr, data, len);
+
+			fw->file.blocks[j].start =
+				MIN(fw->file.blocks[j].start, addr);
+
+			if (addr + len < fw->file.blocks[j + 1].start) {
+				fw->file.blocks[j].end =
+					MAX(fw->file.blocks[j].end,
+					    addr + len - 1);
+				fw->file.blocks[j].check += get_checksum(
+					0, len, data, sizeof(data));
+			} else {
+				fw->file.blocks[j + 1].end =
+					MAX(fw->file.blocks[j + 1].end,
+					    addr + len - 1);
+				fw->file.blocks[j + 1].check += get_checksum(
+					0, len, data, sizeof(data));
+			}
+
+			break;
+		default:
+			TP_ERR(NULL, "unexpected type:0x%x in hex, len:%u, addr:0x%x\n",
+				type, len, addr);
+			return -EINVAL;
+		}
+
+		i = i + 10 + len * 2;
+	}
+
+success_return:
+	if (fw->m2v)
+		fw->m2v_checksum = fw->file.blocks[fw->file.block_num].check;
+	if (mapping_info_addr)
+		return decode_mm(fw, mapping_info_addr, fw->file.buf, buf_size);
+
+	return 0;
+}
+
+static int decode_bin(struct ilitek_fw_handle *fw,
+		      u8 *bin, u32 bin_size,
+		      u8 *buf, u32 buf_size)
+{
+	int error;
+	struct ilitek_ts_device *dev = fw->dev;
+	u32 mapping_info_addr;
+
+	if (!dev) {
+		TP_ERR(NULL, "offline decode bin file is not supported\n");
+		return -EINVAL;
+	}
+
+	if (bin_size > buf_size) {
+		TP_ERR(dev->id, "bin file size: 0x%x, buf size: 0x%x OOB\n",
+			bin_size, buf_size);
+		return -ENOBUFS;
+	}
+	_memcpy(buf, bin, bin_size);
+
+	error = api_protocol_set_cmd(dev, GET_PTL_VER, NULL);
+	if (error < 0)
+		return error;
+	error = api_protocol_set_cmd(dev, GET_MCU_VER, NULL);
+	if (error < 0)
+		return error;
+
+	switch (dev->protocol.flag) {
+	case PTL_V6:
+		mapping_info_addr = dev->mcu_info.mm_addr;
+		break;
+
+	case PTL_V3:
+		/*
+		 * For 231x: AP checksum and DF checksum, DF start addr: 0x1f000
+		 * For 251x: AP crc and DF checksum, DF start addr: 0xf000
+		 */
+		if (is_231x(dev)) {
+			mapping_info_addr = 0x500;
+
+			fw->file.blocks[1].start = 0x1f000;
+			fw->file.blocks[1].end = bin_size - 1;
+			fw->file.blocks[0].start = 0x0;
+
+			/* +2 to get end addr. of last byte of 4 bytes checksum */
+			fw->file.blocks[0].end =
+				get_endaddr(fw->file.blocks[0].start,
+					    fw->file.blocks[1].start,
+					    bin, bin_size, true) + 2;
+
+		} else {
+			mapping_info_addr = 0x2020;
+			fw->file.blocks[1].start = 0xf000;
+			fw->file.blocks[1].end = bin_size - 1;
+			fw->file.blocks[0].start = 0x2000;
+			fw->file.blocks[0].end =
+				get_endaddr(fw->file.blocks[0].start,
+					    fw->file.blocks[1].start,
+					    bin, bin_size, true);
+		}
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * take the whole "buf" into decode_mm, "buf" should be
+	 * properly initialized, and the size should be
+	 * larger than "bin", which reduce OOB issue.
+	 */
+	return decode_mm(fw, mapping_info_addr, buf, buf_size);
+}
+
+#ifdef ILITEK_BOOT_UPDATE
+#include "ilitek_fw.h"
+
+static int decode_ili(struct ilitek_fw_handle *fw,
+		      u8 *buf, u32 buf_size)
+{
+	struct ilitek_ts_device *dev = fw->dev;
+	u8 *ili_buf = CTPM_FW;
+	int size = sizeof(CTPM_FW);
+	u8 id;
+
+#if defined(ILITEK_BOOT_UPDATE_ILI_VER)
+	switch (__ili_select_type__) {
+	case ili_by_sensor_id:
+		if (!support_sensor_id(dev)) {
+			TP_WARN(dev->id,
+				"protocol: 0x%x, mode: 0x" PFMT_X8 ", sensor-id not supported, take default fw(id: 0x%x)\n",
+				dev->protocol.ver, dev->ic[0].mode,
+				ILITEK_BOOT_UPDATE_DEF_ID);
+			fw->file.id = ILITEK_BOOT_UPDATE_DEF_ID;
+			break;
+		}
+
+		id = dev->sensor.id & dev->setting.sensor_id_mask;
+		if (id >= ARRAY_SIZE(ili_arr)) {
+			TP_ERR(dev->id, "invalid sensor id: " PFMT_U8 " >= %d\n",
+				dev->sensor.id, (int)ARRAY_SIZE(ili_arr));
+			return -EINVAL;
+		}
+
+		fw->file.id = id;
+		ili_buf = ili_arr[id].buf;
+		size = ili_arr[id].size;
+		break;
+	case ili_default:
+		break;
+	default:
+		TP_ERR(dev->id, "unexpected ili-select-type: %u\n",
+			__ili_select_type__);
+		return -EINVAL;
+	}
+#endif
+
+	if (!ili_buf || size < 32)
+		return -EINVAL;
+
+	fw->setting.fw_ver_check = true;
+	fw->setting.fw_ver_policy = 0;
+	_memcpy(fw->setting.fw_ver, ili_buf + 18, 8);
+
+	TP_MSG_ARR(dev->id, "IC  fw ver:", TYPE_U8, 8, dev->fw_ver);
+	TP_MSG_ARR(dev->id, "Hex fw ver:", TYPE_U8, 8, fw->setting.fw_ver);
+
+	return decode_bin(fw, ili_buf + 32, size - 32, buf, buf_size);
+}
+#endif
+
+static bool need_retry(struct ilitek_fw_handle *fw)
+{
+	struct ilitek_ts_device *dev = fw->dev;
+	u32 id;
+
+#if defined(ILITEK_BOOT_UPDATE) && defined(ILITEK_BOOT_UPDATE_ILI_VER)
+	if (fw->file.type != fw_ili)
+		return false;
+
+	switch (__ili_select_type__) {
+	case ili_by_sensor_id:
+		id = dev->sensor.id & dev->setting.sensor_id_mask;
+		if (id == fw->file.id)
+			break;
+
+		/* reload correct fw if sensor-id not matched with default fw */
+		TP_MSG(dev->id, "sensor id: 0x%x, file: 0x%x not matched, "
+			"reload fw again\n",
+			id, fw->file.id);
+
+		if (ilitek_update_load_fw(fw, "ilitek.ili") < 0) {
+			TP_ERR(dev->id, "reload ilitek.ili failed\n");
+			return false;
+		}
+
+		/* MUST DISABLE fw ver check for the second try */
+		fw->setting.fw_ver_check = false;
+
+		return true;
+	default:
+		break;
+	}
+#endif
+
+	UNUSED(dev);
+	UNUSED(id);
+
+	return false;
+}
+
+static int decode_firmware(struct ilitek_fw_handle *fw, WCHAR *filename)
+{
+	int error;
+	int size = 0;
+	u8 *buf;
+	WCHAR *file_ext;
+
+	/* initialization */
+	_memset(fw->file.buf, 0xFF, fw->file.buf_size);
+	_memset(fw->m2v_buf, 0xFF, ILITEK_FW_BUF_SIZE);
+	fw->m2v = false;
+	/*
+	 * set block num 2 for V3 AP and Data Flash as default,
+	 * for V6, block num would be updated after decoding memory mapping.
+	 */
+	fw->file.block_num = 2;
+	fw->file.blocks[0].start = (~0U);
+	fw->file.blocks[0].end = 0x0;
+	fw->file.blocks[0].check = 0x0;
+	fw->file.blocks[1].start = (~0U);
+	fw->file.blocks[1].end = 0x0;
+	fw->file.blocks[1].check = 0x0;
+
+	TP_MSG(NULL, "start to read fw file: " PFMT_C16 "\n", filename);
+
+	buf = (u8 *)CALLOC(ILITEK_FW_FILE_SIZE, 1);
+	if (!buf)
+		return -ENOMEM;
+
+	file_ext = WCSRCHR(filename, '.');
+	if (!file_ext)
+		return -ENOENT;
+
+	/* no need to read .ili file */
+	if (WCSCASECMP(file_ext, ".ili")) {
+		if (!fw->cb.read_fw) {
+			error = -EFAULT;
+			TP_ERR(NULL, "read fw callback not registered\n");
+			goto err_free;
+		}
+
+		size = fw->cb.read_fw(filename, buf, ILITEK_FW_FILE_SIZE,
+				      fw->_private);
+
+		error = size;
+		if (error < 0) {
+			TP_ERR(NULL, "read fw file: " PFMT_C16 " failed, err: %d\n",
+				filename, error);
+			goto err_free;
+		}
+	}
+
+	if (!WCSCASECMP(file_ext, ".hex")) {
+		fw->file.type = fw_hex;
+		error = decode_hex(fw, buf, 0, size, fw->file.buf,
+				   fw->file.buf_size);
+	} else if (!WCSCASECMP(file_ext, ".bin")) {
+		fw->file.type = fw_bin;
+		error = decode_bin(fw, buf, size, fw->file.buf,
+				   fw->file.buf_size);
+	}
+#ifdef ILITEK_BOOT_UPDATE
+	else if (!WCSCASECMP(file_ext, ".ili")) {
+		fw->file.type = fw_ili;
+		error = decode_ili(fw, fw->file.buf, fw->file.buf_size);
+	}
+#endif
+	else {
+		error = -EINVAL;
+	}
+
+err_free:
+	CFREE(buf);
+
+	return error;
+}
+
+static bool need_fw_update_v3(struct ilitek_fw_handle *fw)
+{
+	struct ilitek_ts_device *dev = fw->dev;
+	bool fw_file_has_data_flash =
+		(fw->file.blocks[1].start < fw->file.blocks[1].end);
+	bool need = false;
+
+	TP_INFO(dev->id, "------------V3 AP/DF Info.------------\n");
+
+	fw->file.blocks[0].check_match = (fw->setting.force_update) ?
+		false : dev->ic[0].crc[0] == fw->file.blocks[0].check;
+
+	TP_INFO(dev->id, "AP block Start/End Addr.: 0x%x/0x%x, IC/File Checksum: 0x%x/0x%x " PFMT_C8 "\n",
+		fw->file.blocks[0].start, fw->file.blocks[0].end,
+		dev->ic[0].crc[0], fw->file.blocks[0].check,
+		(fw->file.blocks[0].check_match) ? "matched" : "not matched");
+
+	fw->file.blocks[1].check_match = true;
+	if (fw_file_has_data_flash) {
+		fw->file.blocks[1].check_match = (fw->setting.force_update) ?
+			false : dev->ic[0].crc[1] == fw->file.blocks[1].check;
+
+		TP_INFO(dev->id, "DF block Start/End Addr.: 0x%x/0x%x, IC/File Checksum: 0x%x/0x%x " PFMT_C8 "\n",
+			fw->file.blocks[1].start, fw->file.blocks[1].end,
+			dev->ic[0].crc[1], fw->file.blocks[1].check,
+			(fw->file.blocks[1].check_match) ?
+			"matched" : "not matched");
+	} else if (!is_231x(dev)) {
+		/*
+		 * for 251x ICs, if no data flash in fw file,
+		 * need to switch to BL mode then erase data flash forcely.
+		 */
+		need = true;
+	}
+
+	TP_INFO(dev->id, "--------------------------------------\n");
+
+	need |= (!fw->file.blocks[0].check_match ||
+		 !fw->file.blocks[1].check_match);
+
+	if (dev->ic[0].mode == BL_MODE)
+		return true;
+
+	return need;
+}
+
+static bool need_fw_update_v6(struct ilitek_fw_handle *fw)
+{
+	struct ilitek_ts_device *dev = fw->dev;
+	u8 i;
+	bool need = false;
+
+	TP_INFO(dev->id, "------------Lego Block Info.------------\n");
+
+	for (i = 0; i < fw->file.block_num; i++) {
+		dev->ic[0].crc[i] = api_get_block_crc_by_addr(dev,
+			CRC_CALCULATE, fw->file.blocks[i].start,
+			fw->file.blocks[i].end);
+	}
+
+	for (i = 0; i < fw->file.block_num; i++) {
+		fw->file.blocks[i].check_match = (fw->setting.force_update) ?
+			false : (dev->ic[0].crc[i] == fw->file.blocks[i].check);
+
+		need = (!fw->file.blocks[i].check_match) ? true : need;
+
+		TP_INFO(dev->id, "Block[" PFMT_U8 "]: Start/End Addr.: 0x%x/0x%x, IC/File CRC: 0x%x/0x%x " PFMT_C8 "\n",
+			i, fw->file.blocks[i].start, fw->file.blocks[i].end,
+			dev->ic[0].crc[i], fw->file.blocks[i].check,
+			(fw->file.blocks[i].check_match) ?
+			"matched" : "not matched");
+	}
+
+	/* check BL mode firstly before AP-cmd related varaible, ex: ic_num */
+	if (dev->ic[0].mode == BL_MODE) {
+		need = true;
+		goto force_return;
+	}
+
+	for (i = 1; i < dev->tp_info.ic_num; i++) {
+		TP_INFO(dev->id, "Master/Slave[" PFMT_U8 "] CRC: 0x%x/0x%x " PFMT_C8 ", Slave Mode: 0x" PFMT_X8 " " PFMT_C8 "\n",
+			i, fw->file.blocks[0].check, dev->ic[i].crc[0],
+			(fw->file.blocks[0].check == dev->ic[i].crc[0]) ?
+			"matched" : "not matched",
+			dev->ic[i].mode, dev->ic[i].mode_str);
+
+		if (dev->ic[i].crc[0] == fw->file.blocks[0].check &&
+			dev->ic[i].mode == AP_MODE)
+			continue;
+		need = true;
+	}
+
+	if (fw->m2v) {
+		api_access_slave(dev, 0x80, CMD_GET_AP_CRC, &fw->m2v_checksum);
+
+		fw->file.blocks[fw->file.block_num].check_match =
+			fw->file.blocks[fw->file.block_num].check ==
+			fw->m2v_checksum;
+		TP_INFO(dev->id, "M2V IC/File Checksum: 0x%x/0x%x " PFMT_C8 "\n",
+			fw->m2v_checksum,
+			fw->file.blocks[fw->file.block_num].check,
+			(fw->file.blocks[fw->file.block_num].check_match) ?
+			"matched" : "not matched");
+
+		fw->m2v_need_update =
+			!fw->file.blocks[fw->file.block_num].check_match ||
+			fw->setting.force_update;
+		need |= fw->m2v_need_update;
+	}
+
+force_return:
+	TP_INFO(dev->id, "----------------------------------------\n");
+
+	return need;
+}
+
+static bool need_fw_update(struct ilitek_fw_handle *fw)
+{
+	struct ilitek_ts_device *dev = fw->dev;
+	bool need = false;
+
+	struct ilitek_fw_settings *set = &fw->setting;
+	u64 dev_fw_ver, file_fw_ver;
+
+	if (dev->protocol.flag == PTL_V3)
+		need = need_fw_update_v3(fw);
+	else if (dev->protocol.flag == PTL_V6)
+		need = need_fw_update_v6(fw);
+
+	if (fw->cb.update_fw_ic_info)
+		fw->cb.update_fw_ic_info(false,
+					 dev->fw_ver, dev->ic[0].crc,
+					 fw->file.block_num, fw->_private);
+
+	if (set->force_update)
+		return true;
+	else if (set->fw_check_only)
+		return false;
+
+	if (set->fw_ver_check && dev->ic[0].mode == AP_MODE) {
+		TP_INFO(dev->id, "IC FW version: %02x-%02x-%02x-%02x-%02x-%02x-%02x-%02x\n",
+			dev->fw_ver[0], dev->fw_ver[1], dev->fw_ver[2],
+			dev->fw_ver[3], dev->fw_ver[4], dev->fw_ver[5],
+			dev->fw_ver[6], dev->fw_ver[7]);
+		TP_INFO(dev->id, "File FW version: %02x-%02x-%02x-%02x-%02x-%02x-%02x-%02x\n",
+			set->fw_ver[0], set->fw_ver[1],
+			set->fw_ver[2], set->fw_ver[3],
+			set->fw_ver[4], set->fw_ver[5],
+			set->fw_ver[6], set->fw_ver[7]);
+
+		dev_fw_ver =
+			U82U64(dev->fw_ver[0], 7) + U82U64(dev->fw_ver[1], 6) +
+			U82U64(dev->fw_ver[2], 5) + U82U64(dev->fw_ver[3], 4) +
+			U82U64(dev->fw_ver[4], 3) + U82U64(dev->fw_ver[5], 2) +
+			U82U64(dev->fw_ver[6], 1) + U82U64(dev->fw_ver[7], 0);
+		file_fw_ver =
+			U82U64(set->fw_ver[0], 7) + U82U64(set->fw_ver[1], 6) +
+			U82U64(set->fw_ver[2], 5) + U82U64(set->fw_ver[3], 4) +
+			U82U64(set->fw_ver[4], 3) + U82U64(set->fw_ver[5], 2) +
+			U82U64(set->fw_ver[6], 1) + U82U64(set->fw_ver[7], 0);
+
+		TP_MSG(dev->id, "IC fw ver: 0x" PFMT_X64 ", File fw ver: 0x" PFMT_X64 "\n",
+			(long long unsigned int)dev_fw_ver,
+			(long long unsigned int)file_fw_ver);
+
+		if (file_fw_ver > dev_fw_ver) {
+			TP_INFO(dev->id, "IC FW version is older than File FW version\n");
+			return true;
+		} else if (file_fw_ver == dev_fw_ver) {
+			TP_INFO(dev->id, "File FW version is the same, " PFMT_C8 " to update\n",
+				(set->fw_ver_policy & allow_fw_ver_same) ?
+				"still need" : "no need");
+			return (set->fw_ver_policy & allow_fw_ver_same) ?
+				need : false;
+		} else {
+			TP_INFO(dev->id, "File FW version is older, " PFMT_C8 " to update\n",
+				(set->fw_ver_policy & allow_fw_ver_downgrade) ?
+				"still need" : "no need");
+			return (set->fw_ver_policy & allow_fw_ver_downgrade) ?
+				need : false;
+		}
+	}
+
+	return need;
+}
+
+static int update_master(struct ilitek_fw_handle *fw, int idx, u32 len)
+{
+	int error = 0;
+	struct ilitek_ts_device *dev = fw->dev;
+	unsigned int i;
+	u16 file_crc;
+	int retry = 3;
+
+	TP_MSG(dev->id, "updating block[%d], data len: %u, start/end addr: 0x%x/0x%x\n",
+		idx, len, fw->file.blocks[idx].start, fw->file.blocks[idx].end);
+
+err_retry:
+	if ((dev->setting.no_retry && error < 0) || retry-- < 0)
+		return (error < 0) ? error : -EINVAL;
+
+	error = api_write_enable_v6(dev, false, false,
+				     fw->file.blocks[idx].start,
+				     fw->file.blocks[idx].end);
+	if (error < 0)
+		return error;
+
+	_memset(dev->wbuf, 0xff, sizeof(dev->wbuf));
+	for (i = fw->file.blocks[idx].start;
+	     i < fw->file.blocks[idx].end; i += len) {
+		/*
+		 * check end addr. of data write buffer is within valid range.
+		 */
+		if (i + len > END_ADDR_LEGO) {
+			TP_ERR(dev->id, "block[%d] write addr. 0x%x + 0x%x > 0x%x OOB\n",
+				idx, i, len, END_ADDR_LEGO);
+			return -EINVAL;
+		}
+
+		_memcpy(dev->wbuf + 1, fw->file.buf + i, len);
+		error = api_write_data_v6(dev, len + 1);
+
+		if (error < 0)
+			goto err_retry;
+
+		fw->progress_curr = MIN(i + len - fw->file.blocks[idx].offset,
+					fw->progress_max);
+		fw->progress = (100 * fw->progress_curr) / fw->progress_max;
+		TP_DBG(dev->id, "block[%d] update progress: " PFMT_U8 "%%\n",
+			idx, fw->progress);
+
+		if (fw->cb.update_progress)
+			fw->cb.update_progress(fw->progress, fw->_private);
+	}
+
+	file_crc = get_crc(fw->file.blocks[idx].start,
+			   fw->file.blocks[idx].end - 1,
+			   fw->file.buf, fw->file.buf_size);
+	dev->ic[0].crc[idx] =
+		api_get_block_crc_by_addr(dev, CRC_GET,
+					  fw->file.blocks[idx].start,
+					  fw->file.blocks[idx].end);
+
+	TP_INFO(dev->id, "block[%d]: start/end addr.: 0x%x/0x%x, ic/file crc: 0x%x/0x%x " PFMT_C8 "\n",
+		idx, fw->file.blocks[idx].start, fw->file.blocks[idx].end,
+		dev->ic[0].crc[idx], file_crc,
+		(file_crc == dev->ic[0].crc[idx]) ?
+		"matched" : "not matched");
+
+	if (file_crc != dev->ic[0].crc[idx]) {
+		error = -EINVAL;
+		goto err_retry;
+	}
+
+	return 0;
+}
+
+static int update_slave(struct ilitek_fw_handle *fw)
+{
+	int error;
+	struct ilitek_ts_device *dev = fw->dev;
+	u8 i;
+
+	for (i = 0; i < fw->file.block_num; i++) {
+		dev->ic[0].crc[i] = api_get_block_crc_by_addr(dev,
+			CRC_CALCULATE, fw->file.blocks[i].start,
+			fw->file.blocks[i].end);
+	}
+
+	error = api_protocol_set_cmd(dev, GET_AP_CRC, &dev->tp_info.ic_num);
+	if (error < 0)
+		return error;
+
+	for (i = 0; i < dev->tp_info.ic_num; i++) {
+		if (dev->ic[0].crc[0] == dev->ic[i].crc[0] &&
+		    !fw->setting.force_update)
+			continue;
+
+		TP_INFO(dev->id, "updating slave, master/slave[" PFMT_U8 "] crc: 0x%x/0x%x\n",
+			i, dev->ic[0].crc[0], dev->ic[i].crc[0]);
+		error = api_access_slave(dev, 0x3, CMD_WRITE_DATA_V6, NULL);
+		if (error < 0)
+			return error;
+		error = api_write_enable_v6(dev, false, true,
+					    fw->file.blocks[0].start,
+					    fw->file.blocks[0].end);
+		if (error < 0)
+			return error;
+
+		goto success_return;
+	}
+
+	error = api_protocol_set_cmd(dev, GET_MCU_MOD, &dev->tp_info.ic_num);
+	if (error < 0)
+		return error;
+
+	for (i = 0; i < dev->tp_info.ic_num; i++) {
+		if (dev->ic[i].mode == AP_MODE &&
+		    !fw->setting.force_update)
+			continue;
+
+		TP_INFO(dev->id, "changing slave[" PFMT_U8 "]: 0x" PFMT_X8 " to AP mode\n",
+			i, dev->ic[i].mode);
+		error = api_access_slave(dev, 0x3, CMD_SET_AP_MODE, NULL);
+		if (error < 0)
+			return error;
+		break;
+	}
+
+success_return:
+	return 0;
+}
+
+static int update_M3_M2V(struct ilitek_fw_handle *fw, u32 len)
+{
+	int error;
+	struct ilitek_ts_device *dev = fw->dev;
+	u32 i;
+	u8 buf[6];
+	u32 AdressRange, M2V_Buf_Len, CheckSumRange;
+	u16 AddDataCount;
+
+	u8 j = fw->file.block_num;
+
+	error = api_set_ctrl_mode(dev, mode_suspend, false, true);
+	if (error < 0)
+		return error;
+
+	api_protocol_set_cmd(dev, GET_PTL_VER, NULL);
+	api_protocol_set_cmd(dev, GET_PTL_VER, NULL);
+
+	//Reed Add : 20230721
+	AdressRange = fw->file.blocks[j].end - fw->file.blocks[j].start;
+	M2V_Buf_Len = fw->file.blocks[j].end - fw->file.blocks[j].start + 1;
+	CheckSumRange = fw->file.blocks[j].check;
+	AddDataCount = len - M2V_Buf_Len % len;
+	AddDataCount = (AddDataCount >= 8) ? AddDataCount : AddDataCount + len;
+	AdressRange += AddDataCount;
+	CheckSumRange += AddDataCount * 0xFF;
+
+	error = api_to_bl_mode_m2v(dev, true);
+	if (error < 0)
+		return error;
+
+	dev->cb.delay_ms(100);//Reed Add : 20230927
+
+	error = api_set_data_len(dev, len);
+	if (error < 0)
+		return error;
+
+	TP_INFO(dev->id, "updating M2V, start/end addr.: 0x%x/0x%x, file checksum: 0x%x\n",
+		fw->file.blocks[j].start, fw->file.blocks[j].end,
+		fw->file.blocks[j].check);
+
+	//Reed Add : 20230721
+	buf[0] = (AdressRange >> 16) & 0xFF;
+	buf[1] = (AdressRange >> 8) & 0xFF;
+	buf[2] = AdressRange & 0xFF;
+	buf[3] = (CheckSumRange >> 16) & 0xFF;
+	buf[4] = (CheckSumRange >> 8) & 0xFF;
+	buf[5] = CheckSumRange & 0xFF;
+	dev->cb.delay_ms(100);//Reed Add : 20230927
+	error = api_access_slave(dev, 0x80, CMD_WRITE_ENABLE, buf);
+	if (error < 0)
+		return error;
+
+	_memset(dev->wbuf, 0xff, sizeof(dev->wbuf));
+	for (i = fw->file.blocks[j].start;
+	     i < fw->file.blocks[j].end; i += len) {
+		_memcpy(dev->wbuf + 1, fw->m2v_buf + i, len);
+
+		error = api_write_data_m2v(dev, len + 1);
+		if (error < 0)
+			return error;
+
+		fw->progress_curr = MIN(fw->progress_curr + len,
+					fw->progress_max);
+		fw->progress = (100 * fw->progress_curr) / fw->progress_max;
+		TP_DBG(dev->id, "m2v update progress: " PFMT_U8 "%%\n", fw->progress);
+
+		if (fw->cb.update_progress)
+			fw->cb.update_progress(fw->progress, fw->_private);
+	}
+
+	error = api_to_bl_mode_m2v(dev, false);
+	if (error < 0)
+		return error;
+
+	dev->cb.delay_ms(100);//Reed Add : 20230927
+
+	error = api_access_slave(dev, 0x80, CMD_GET_FW_VER, fw->m2v_fw_ver);
+	if (error < 0)
+		return error;
+
+	TP_MSG_ARR(dev->id, "update M2V success, fw version:", TYPE_U8,
+		   8, fw->m2v_fw_ver);
+
+	return 0;
+}
+
+static int ilitek_update_BL_v1_8(struct ilitek_fw_handle *fw)
+{
+	int error;
+	struct ilitek_ts_device *dev = fw->dev;
+	u8 i;
+
+	error = api_set_data_len(dev, fw->update_len);
+	if (error < 0)
+		return error;
+
+	for (i = 0; i < fw->file.block_num; i++) {
+		if (fw->file.blocks[i].check_match)
+			continue;
+
+		error = update_master(fw, i, fw->update_len);
+		if (error < 0) {
+			TP_ERR(dev->id, "Upgrade Block:" PFMT_U8 " failed, err: %d\n",
+				i, error);
+			return error;
+		}
+	}
+
+	error = api_to_bl_mode(dev, false, fw->file.blocks[0].start,
+			       fw->file.blocks[0].end);
+	if (error < 0)
+		return error;
+
+	error = api_set_ctrl_mode(dev, mode_suspend, false, true);
+	if (error < 0)
+		return error;
+
+	/* get tp info. for updating ic_num */
+	error = api_protocol_set_cmd(dev, GET_TP_INFO, NULL);
+	if (error < 0)
+		return error;
+
+	if (dev->tp_info.ic_num > 1) {
+		if (fw->cb.slave_update_notify)
+			fw->cb.slave_update_notify(true, fw->_private);
+		error = update_slave(fw);
+
+		if (fw->cb.slave_update_notify)
+			fw->cb.slave_update_notify(false, fw->_private);
+
+		if (error < 0) {
+			TP_ERR(dev->id, "upgrade slave failed, err: %d\n",
+				error);
+			return error;
+		}
+	}
+
+	if (fw->m2v && fw->m2v_need_update) {
+		error = update_M3_M2V(fw, 1024);
+		if (error < 0) {
+			TP_ERR(dev->id, "upgrade m2v slave failed, err: %d\n", error);
+			return error;
+		}
+	}
+
+	return 0;
+}
+
+static int ilitek_update_BL_v1_7(struct ilitek_fw_handle *fw)
+{
+	int error;
+	struct ilitek_ts_device *dev = fw->dev;
+	unsigned int i;
+
+	/*
+	 * Erase data initially for the case that hex w/o data flash section.
+	 * Due to historical factor, please double confirm before modify here.
+	 */
+	error = api_erase_data_v3(dev);
+	if (error < 0)
+		return error;
+
+	if (fw->file.blocks[1].end > fw->file.blocks[1].start) {
+		TP_MSG(dev->id, "updating DF block, start/end addr.: 0x%x/0x%x, file checksum: 0x%x\n",
+			fw->file.blocks[1].start, fw->file.blocks[1].end,
+			fw->file.blocks[1].check);
+
+		/* end + 1 as W.A. for V3 BL bug */
+		error = api_write_enable_v3(dev, false, false,
+					     fw->file.blocks[1].end + 1,
+					     fw->file.blocks[1].check);
+		if (error < 0)
+			return error;
+
+		for (i = fw->file.blocks[1].start;
+		     i <= fw->file.blocks[1].end; i += 32) {
+			_memset(dev->wbuf + 1, 0, 32);
+			_memcpy(dev->wbuf + 1, fw->file.buf + i,
+				MIN(fw->file.blocks[1].end - i + 1, 32));
+
+			error = api_write_data_v3(dev);
+			if (error < 0)
+				return error;
+
+			dev->cb.delay_ms(2);
+
+			error = api_check_busy(dev, 1000, 10);
+			if (error < 0)
+				return error;
+
+			fw->progress_curr += 32;
+			fw->progress_curr = MIN(fw->progress_curr,
+				fw->progress_max);
+			fw->progress = (100 * fw->progress_curr) /
+				fw->progress_max;
+			TP_DBG(dev->id, "DF update progress: " PFMT_U8 "%%\n",
+				fw->progress);
+
+			if (fw->cb.update_progress)
+				fw->cb.update_progress(fw->progress,
+						       fw->_private);
+		}
+
+		dev->cb.delay_ms(50);
+
+		dev->wbuf[0] = CMD_GET_AP_CRC;
+		error = write_then_read(dev, dev->wbuf, 1, NULL, 0);
+		if (error < 0)
+			return error;
+		error = api_check_busy(dev, 1000, 10);
+		if (error < 0)
+			return error;
+
+		dev->wbuf[0] = CMD_GET_AP_CRC;
+		error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 4);
+		if (error < 0)
+			return error;
+
+		dev->ic[0].crc[1] = (le16(dev->rbuf + 2) << 16) | le16(dev->rbuf);
+
+		TP_INFO(dev->id, "DF block, start/end addr.: 0x%x/0x%x, ic/file checkksum: 0x%x/0x%x " PFMT_C8 "\n",
+			fw->file.blocks[1].start, fw->file.blocks[1].end,
+			dev->ic[0].crc[1], fw->file.blocks[1].check,
+			(dev->ic[0].crc[1] == fw->file.blocks[1].check) ?
+			"matched" : "not matched");
+
+		if (dev->ic[0].crc[1] != fw->file.blocks[1].check)
+			return -EFAULT;
+	}
+
+	/*
+	 * Update AP code forcely if AP crc/checksum not match or
+	 * Data Flash has been updated.
+	 */
+	if (!fw->file.blocks[0].check_match ||
+	    fw->file.blocks[1].end > fw->file.blocks[1].start) {
+		TP_MSG(dev->id, "updating AP block, start/end addr.: 0x%x/0x%x, file crc: 0x%x\n",
+			fw->file.blocks[0].start, fw->file.blocks[0].end,
+			fw->file.blocks[0].check);
+
+		/* end + 1 as W.A. for V3 BL bug */
+		error = api_write_enable_v3(dev, false, true,
+					     fw->file.blocks[0].end + 1,
+					     fw->file.blocks[0].check);
+		if (error < 0)
+			return error;
+
+		for (i = fw->file.blocks[0].start;
+		     i <= fw->file.blocks[0].end; i += 32) {
+			_memset(dev->wbuf + 1, 0xFF, 32);
+			_memcpy(dev->wbuf + 1, fw->file.buf + i,
+				MIN(fw->file.blocks[1].end - i + 1, 32));
+			error = api_write_data_v3(dev);
+			if (error < 0)
+				return error;
+
+			dev->cb.delay_ms(2);
+
+			error = api_check_busy(dev, 1000, 10);
+			if (error < 0)
+				return error;
+
+			fw->progress_curr += 32;
+			fw->progress_curr = MIN(fw->progress_curr,
+				fw->progress_max);
+			fw->progress = (100 * fw->progress_curr) /
+				fw->progress_max;
+			TP_DBG(dev->id, "AP update progress: " PFMT_U8 "%%\n",
+				fw->progress);
+
+			if (fw->cb.update_progress)
+				fw->cb.update_progress(fw->progress,
+						       fw->_private);
+		}
+
+		dev->wbuf[0] = CMD_GET_AP_CRC;
+		error = write_then_read(dev, dev->wbuf, 1, NULL, 0);
+		if (error < 0)
+			return error;
+		error = api_check_busy(dev, 1000, 10);
+		if (error < 0)
+			return error;
+
+		dev->wbuf[0] = CMD_GET_AP_CRC;
+		error = write_then_read(dev, dev->wbuf, 1, dev->rbuf, 4);
+		if (error < 0)
+			return error;
+
+		dev->ic[0].crc[0] =
+			(le16(dev->rbuf + 2) << 16) | le16(dev->rbuf);
+		TP_INFO(dev->id, "AP block, start/end addr.: 0x%x/0x%x, ic/file crc: 0x%x/0x%x " PFMT_C8 "\n",
+			fw->file.blocks[0].start, fw->file.blocks[0].end,
+			dev->ic[0].crc[0], fw->file.blocks[0].check,
+			(dev->ic[0].crc[0] == fw->file.blocks[0].check) ?
+			"matched" : "not matched");
+
+		if (dev->ic[0].crc[0] != fw->file.blocks[0].check)
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int ilitek_update_BL_v1_6(struct ilitek_fw_handle *fw)
+{
+	int error;
+	struct ilitek_ts_device *dev = fw->dev;
+	struct ilitek_ts_callback *cb = &dev->cb;
+	unsigned int i, j;
+
+	u32 bytes, end, check;
+
+	if (fw->file.blocks[1].end > fw->file.blocks[1].start) {
+		TP_INFO(dev->id, "updating DF block, start/end addr.: 0x%x/0x%x, file checksum: 0x%x\n",
+			fw->file.blocks[1].start, fw->file.blocks[1].end,
+			fw->file.blocks[1].check);
+
+		/* BL 1.6 need more 32 byte 0xFF, end addr need to be multiples of 32 */
+		bytes = ((fw->file.blocks[1].end + 1) % 32) ?
+			31 + 32 - ((fw->file.blocks[1].end + 1) % 32) : 31;
+		end = fw->file.blocks[1].end + bytes;
+		check = fw->file.blocks[1].check + (bytes * 0xff);
+		TP_MSG(dev->id, "(after modified) DF start/end: 0x%x/0x%x, checksum: 0x%x\n",
+			fw->file.blocks[1].start, end, check);
+
+		/* end + 1 as W.A. for V3 BL bug */
+		error = api_write_enable_v3(dev, false, false, end + 1, check);
+		if (error < 0)
+			return error;
+
+		for (i = fw->file.blocks[1].start, j = 0;
+		     i <= fw->file.blocks[1].end; i += 32, j++) {
+			_memset(dev->wbuf + 1, 0xFF, 32);
+			_memcpy(dev->wbuf + 1, fw->file.buf + i,
+				MIN(fw->file.blocks[1].end - i + 1, 32));
+			error = api_write_data_v3(dev);
+			if (error < 0)
+				return error;
+
+			cb->delay_ms((j % 16) ? 1 : 5);
+
+			fw->progress_curr = MIN(fw->progress_curr + 32,
+				fw->progress_max);
+			fw->progress = (100 * fw->progress_curr) / fw->progress_max;
+			TP_DBG(dev->id, "DF update progress: " PFMT_U8 "%%\n", fw->progress);
+
+			if (fw->cb.update_progress)
+				fw->cb.update_progress(fw->progress, fw->_private);
+		}
+		cb->delay_ms(10);
+		/* write 31 bytes 0xFF at the end */
+		_memset(dev->wbuf + 1, 0xFF, 32); dev->wbuf[32] = 0;
+		error = api_write_data_v3(dev);
+		if (error < 0)
+			return error;
+		cb->delay_ms(10);
+	}
+
+	/*
+	* Update AP code forcely if AP crc/checksum not match or
+	* Data Flash has been updated.
+	*/
+	if (!fw->file.blocks[0].check_match ||
+	    fw->file.blocks[1].end > fw->file.blocks[1].start) {
+		TP_INFO(dev->id, "updating AP block, start/end addr.: 0x%x/0x%x, file crc: 0x%x\n",
+			fw->file.blocks[0].start, fw->file.blocks[0].end,
+			fw->file.blocks[0].check);
+
+		/* BL 1.6 need more 32 byte 0xFF, end addr need to be multiples of 32 */
+		bytes = ((fw->file.blocks[0].end + 1) % 32) ?
+			31 + 32 - ((fw->file.blocks[0].end + 1) % 32) : 31;
+		end = fw->file.blocks[0].end + bytes;
+		check = fw->file.blocks[0].check + (bytes * 0xff);
+		TP_MSG(dev->id, "(after modified) AP start/end: 0x%x/0x%x, checksum: 0x%x\n",
+			fw->file.blocks[0].start, end, check);
+
+		/* end + 1 as W.A. for V3 BL bug */
+		error = api_write_enable_v3(dev, false, true, end + 1, check);
+		if (error < 0)
+			return error;
+
+		for (i = fw->file.blocks[0].start, j = 0;
+			i <= fw->file.blocks[0].end; i += 32, j++) {
+			_memset(dev->wbuf + 1, 0xFF, 32);
+			_memcpy(dev->wbuf + 1, fw->file.buf + i,
+				MIN(fw->file.blocks[0].end - i + 1, 32));
+
+			error = api_write_data_v3(dev);
+			if (error < 0)
+				return error;
+
+			cb->delay_ms((j % 16) ? 1 : 5);
+
+			fw->progress_curr = MIN(fw->progress_curr + 32,
+				fw->progress_max);
+			fw->progress = (100 * fw->progress_curr) / fw->progress_max;
+			TP_DBG(dev->id, "AP update progress: " PFMT_U8 "%%\n", fw->progress);
+
+			if (fw->cb.update_progress)
+				fw->cb.update_progress(fw->progress, fw->_private);
+		}
+		cb->delay_ms(10);
+		/* write 31 bytes 0xFF at the end */
+		_memset(dev->wbuf + 1, 0xFF, 32); dev->wbuf[32] = 0;
+		error = api_write_data_v3(dev);
+		if (error < 0)
+			return error;
+		cb->delay_ms(10);
+
+#ifdef ILITEK_BOOT_UPDATE
+		/*
+		 * .ili file fill DF section with default 0xFF, but not 0
+		 * which make flow stuck in BL mode.
+		 * so HW-reset is need before switching to AP mode.
+		 * remove HW-reset after fixing .ili converter bug.
+		 */
+		reset_helper(dev);
+#endif
+	}
+
+	return 0;
+}
+
+static void update_progress(struct ilitek_fw_handle *fw)
+{
+	struct ilitek_ts_device *dev = fw->dev;
+	u8 i;
+	unsigned int last_end = 0, last_offset = 0;
+
+	fw->progress = 0;
+	fw->progress_max = 0;
+	fw->progress_curr = 0;
+
+	switch (dev->protocol.flag) {
+	case PTL_V3:
+		fw->progress_max +=
+			(fw->file.blocks[1].end > fw->file.blocks[1].start) ?
+			fw->file.blocks[1].end - fw->file.blocks[1].start : 0;
+		fw->progress_max +=
+			(fw->file.blocks[0].end > fw->file.blocks[0].start) ?
+			fw->file.blocks[0].end - fw->file.blocks[0].start : 0;
+		break;
+
+	case PTL_V6:
+		for (i = 0; i < fw->file.block_num; i++) {
+			if (fw->file.blocks[i].check_match)
+				continue;
+
+			fw->progress_max +=
+				fw->file.blocks[i].end -
+				fw->file.blocks[i].start;
+			last_offset += fw->file.blocks[i].start - last_end;
+			fw->file.blocks[i].offset = last_offset;
+
+			last_end = fw->file.blocks[i].end;
+		}
+
+		if (fw->m2v_need_update) {
+			fw->progress_max +=
+				fw->file.blocks[fw->file.block_num].end -
+				fw->file.blocks[fw->file.block_num].start;
+		}
+
+		break;
+	}
+}
+
+void *ilitek_update_init(void *_dev, bool need_update_ts_info,
+			 struct ilitek_update_callback *cb, void *_private)
+{
+	struct ilitek_fw_handle *fw;
+	struct ilitek_ts_device *dev = (struct ilitek_ts_device *)_dev;
+
+	if (need_update_ts_info && dev && api_update_ts_info(dev) < 0)
+		return NULL;
+
+	fw = (struct ilitek_fw_handle *)MALLOC(sizeof(*fw));
+	if (!fw)
+		return NULL;
+
+	/* initial all member to 0/ false/ NULL */
+	_memset(fw, 0, sizeof(*fw));
+	fw->dev = (dev) ? dev : NULL;
+
+	/* initial update-len to default UPDATE_LEN */
+	fw->update_len = UPDATE_LEN;
+
+	fw->dev = dev;
+	fw->_private = _private;
+	fw->file.buf_size = ILITEK_FW_BUF_SIZE;
+	fw->file.buf = (u8 *)CALLOC(fw->file.buf_size, 1);
+	if (!fw->file.buf)
+		goto err_free_fw;
+
+	fw->m2v_buf = (u8 *)CALLOC(ILITEK_FW_BUF_SIZE, 1);
+	if (!fw->m2v_buf)
+		goto err_free_fw_buf;
+
+	if (cb)
+		_memcpy(&fw->cb, cb, sizeof(*cb));
+
+	return fw;
+
+err_free_fw_buf:
+	CFREE(fw->file.buf);
+err_free_fw:
+	FREE(fw);
+
+	return NULL;
+}
+
+void ilitek_update_exit(void *handle)
+{
+	struct ilitek_fw_handle *fw = (struct ilitek_fw_handle *)handle;
+
+	if (!handle)
+		return;
+
+	if (fw->file.buf)
+		CFREE(fw->file.buf);
+
+	if (fw->m2v_buf)
+		CFREE(fw->m2v_buf);
+
+	if (fw)
+		FREE(fw);
+}
+
+void ilitek_update_set_data_length(void *handle, u16 len)
+{
+	struct ilitek_fw_handle *fw = (struct ilitek_fw_handle *)handle;
+
+	if (!fw)
+		return;
+
+	fw->update_len = len;
+}
+
+int ilitek_update_load_fw(void *handle, WCHAR *fw_name)
+{
+	int error;
+	struct ilitek_fw_handle *fw = (struct ilitek_fw_handle *)handle;
+
+	u32 i;
+
+	if (!handle)
+		return -EINVAL;
+
+	error = decode_firmware(fw, fw_name);
+	if (error < 0)
+		return error;
+
+	if (fw->cb.update_fw_file_info)
+		fw->cb.update_fw_file_info(&fw->file, fw->_private);
+
+	if (!fw->dev)
+		return 0;
+
+	/* for Lego and V6 IC, check block's start/end address validity */
+	if (fw->dev->protocol.flag == PTL_V6) {
+		for (i = 0; i < fw->file.block_num; i++) {
+			if (fw->dev->mcu_info.min_addr <=
+				fw->file.blocks[i].start &&
+			    fw->dev->mcu_info.max_addr >
+				fw->file.blocks[i].end)
+				continue;
+
+			if (!(fw->file.blocks[i].start % 0x1000))
+				continue;
+
+			TP_ERR(fw->dev->id, "Block[%u] addr. OOB (0x%x <= 0x%x/0x%x < 0x%x) or invalid start addr\n",
+				i, fw->dev->mcu_info.min_addr,
+				fw->file.blocks[i].start,
+				fw->file.blocks[i].end,
+				fw->dev->mcu_info.max_addr);
+			return -EINVAL;
+		}
+	}
+
+	TP_MSG(fw->dev->id, "IC: " PFMT_C8 ", Firmware File: " PFMT_C8 " matched\n",
+		fw->dev->mcu_info.ic_name, fw->file.ic_name);
+
+	return 0;
+}
+
+int ilitek_update_start(void *handle)
+{
+	int error;
+	s8 retry = 0;
+	struct ilitek_fw_handle *fw = (struct ilitek_fw_handle *)handle;
+	struct ilitek_ts_device *dev;
+
+	if (!handle)
+		return -EINVAL;
+	dev = fw->dev;
+
+	/*
+	 * Some platform (ITS-Bridge) might change touch controller
+	 * after loading fw file, get panel info. forcely and
+	 * re-check the ic/file are matched.
+	 */
+	error = api_update_ts_info(dev);
+	if (error < 0 || strcmp(dev->mcu_info.ic_name, fw->file.ic_name)) {
+		TP_ERR(fw->dev->id, "get ic info failed, err: %d or ic/file (" PFMT_C8 "/" PFMT_C8 ") not matched\n",
+			error, fw->dev->mcu_info.ic_name, fw->file.ic_name);
+		return -EPERM;
+	}
+
+	TP_INFO(dev->id, "[ilitek_update_start] start\n");
+
+	do {
+		TP_DBG(dev->id, "retry: %hhd, retry_limit: %hhd\n",
+			retry, fw->setting.retry);
+		if (retry)
+			reset_helper(dev);
+
+		error = api_set_ctrl_mode(dev, mode_suspend, false, true);
+		if (error < 0)
+			continue;
+
+		if (!need_fw_update(fw)) {
+			if (is_231x(dev))
+				goto erase_data_flash_231x;
+			goto success_return;
+		}
+
+		update_progress(fw);
+		if (fw->cb.update_progress)
+			fw->cb.update_progress(0, fw->_private);
+
+		error = api_to_bl_mode(dev, true, 0, 0);
+		if (error < 0)
+			continue;
+
+		TP_INFO_ARR(dev->id, "[BL Firmware Version]",
+			    TYPE_U8, 8, dev->fw_ver);
+		TP_INFO(dev->id, "[ilitek_update_start] start to program\n");
+
+		switch (dev->protocol.ver & 0xFFFF00) {
+		case BL_PROTOCOL_V1_8:
+			error = ilitek_update_BL_v1_8(fw);
+			break;
+		case BL_PROTOCOL_V1_7:
+			error = ilitek_update_BL_v1_7(fw);
+			break;
+		case BL_PROTOCOL_V1_6:
+			error = ilitek_update_BL_v1_6(fw);
+			break;
+		default:
+			TP_ERR(dev->id, "BL protocol ver: 0x%x not supported\n",
+				dev->protocol.ver);
+			continue;
+		}
+		if (error < 0)
+			continue;
+
+		error = api_to_bl_mode(dev, false,
+				       fw->file.blocks[0].start,
+				       fw->file.blocks[0].end);
+		if (error < 0)
+			continue;
+
+erase_data_flash_231x:
+		/*
+		 * If no data flash section in firmware file,
+		 * 231x need to erase data flash after change to AP mode.
+		 */
+		if (fw->file.blocks[1].end < fw->file.blocks[1].start &&
+		    is_231x(dev)) {
+			error = api_erase_data_v3(dev);
+			if (error < 0)
+				continue;
+		}
+
+success_return:
+		error = api_update_ts_info(dev);
+		if (error < 0)
+			continue;
+
+		error = api_set_ctrl_mode(dev, mode_normal, false, true);
+		if (error < 0)
+			continue;
+
+		if (fw->cb.update_fw_ic_info)
+			fw->cb.update_fw_ic_info(true,
+						 dev->fw_ver, dev->ic[0].crc,
+						 fw->file.block_num,
+						 fw->_private);
+
+		if (fw->cb.update_progress)
+			fw->cb.update_progress(100, fw->_private);
+
+		if (need_retry(fw))
+			continue;
+
+		TP_INFO(dev->id, "[ilitek_update_start] success\n");
+
+		return 0;
+	} while (!dev->setting.no_retry && ++retry < fw->setting.retry);
+
+	TP_ERR(dev->id, "[ilitek_update_start] fw update failed, err: %d\n",
+		error);
+
+	return (error < 0) ? error : -EFAULT;
+}
+
+void ilitek_update_setting(void *handle, struct ilitek_fw_settings *setting)
+{
+	struct ilitek_fw_handle *fw = (struct ilitek_fw_handle *)handle;
+
+	if (!handle)
+		return;
+
+	_memcpy(&fw->setting, setting, sizeof(struct ilitek_fw_settings));
+}
+
diff --git a/drivers/input/touchscreen/ilitek/ilitek_update.h b/drivers/input/touchscreen/ilitek/ilitek_update.h
new file mode 100644
index 000000000000..b7987b9fb121
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek/ilitek_update.h
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is part of ILITEK CommonFlow
+ *
+ * Copyright (c) 2022 ILI Technology Corp.
+ * Copyright (c) 2022 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (c) 2022 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#ifndef __ILITEK_UPDATE_H__
+#define __ILITEK_UPDATE_H__
+
+#include "ilitek_protocol.h"
+
+#define UPDATE_LEN			1024
+
+#define ILITEK_FW_FILE_SIZE		(512 * 1024)
+#define ILITEK_FW_BUF_SIZE		(256 * 1024)
+
+enum fw_file_type {
+	fw_hex = 0,
+	fw_bin,
+	fw_ili,
+};
+
+#ifdef _WIN32
+/* packed below structures by 1 byte */
+#pragma pack(1)
+#endif
+
+struct __PACKED__ mapping_info_lego {
+	u8 tuning_ver[4];
+	u8 fw_ver[4];
+	u8 core_test;
+	u8 core_day;
+	u8 core_month;
+	u8 core_year;
+	u32 core_ver;
+	u8 vendor_ver[6];
+	u8 _reserve_1[8];
+	u16 customer_id;
+	u16 fwid;
+	u16 i2c_addr;
+	u8 _reserve_2[2];
+	char model_name[16];
+	u8 _reserve_3[2];
+	u8 ic_num;
+	u8 total_tuning_num;
+	u16 sizeof_tuning;
+	u16 sizeof_tp_param;
+	u16 sizeof_sys_info;
+	u16 sizeof_sys_algo;
+	u16 sizeof_key_info;
+	u8 block_num;
+	u8 support_tuning_num;
+	u8 _reserve_4[2];
+
+	struct __PACKED__ {
+		u8 addr[3];
+	} blocks[10];
+
+	u8 _reserve_5[9];
+	u8 end_addr[3];
+	u8 _reserve_6[2];
+};
+
+union __PACKED__ mapping_info {
+	struct __PACKED__ {
+		u8 mapping_ver[3];
+		u8 protocol_ver[3];
+		u8 ic_name[6];
+
+		struct mapping_info_lego _lego;
+	};
+};
+
+/*
+ * for V3, "check" is checksum, block[0] for AP and block[1] for Data Flash.
+ * for V6, "check" is CRC.
+ */
+struct __PACKED__ ilitek_block {
+	bool check_match;
+	u32 start;
+	u32 end;
+	u32 check;
+	u32 offset;
+};
+
+struct __PACKED__ ilitek_fw_file_info {
+	char ic_name[8];
+	u8 fw_ver[8];
+	u16 fwid;
+
+	u8 block_num;
+	struct ilitek_block blocks[ILTIEK_MAX_BLOCK_NUM];
+
+	u32 mm_addr;
+	u32 mm_size;
+
+	u32 buf_size;
+	u8 *buf;
+
+	/* fw file's sensor-id or fwid or other id */
+	u32 id;
+	u8 type;
+};
+
+#ifdef _WIN32
+#pragma pack()
+#endif
+
+/* return file size in # of bytes, or negative error code */
+typedef int (*read_fw_t)(WCHAR *, u8 *, int, void *);
+/* update progress of fw updating */
+typedef void (*update_progress_t)(u8, void *);
+/* update fw info to callers */
+typedef void (*update_fw_file_info_t)(struct ilitek_fw_file_info *, void *);
+
+/* notify caller before/after slave upgrade (for ITS only) */
+typedef void (*slave_update_notify_t)(bool, void *);
+/* update fw version and crc/checksum before/after update (for ITS only) */
+typedef void (*update_fw_ic_info_t)(bool, u8 *, u32 *, int, void *);
+
+struct ilitek_update_callback {
+	read_fw_t read_fw;
+	update_progress_t update_progress;
+	update_fw_file_info_t update_fw_file_info;
+
+	slave_update_notify_t slave_update_notify;
+	update_fw_ic_info_t update_fw_ic_info;
+};
+
+enum fw_ver_check_policy {
+	allow_fw_ver_downgrade = 1,
+	allow_fw_ver_same = 2,
+};
+
+struct ilitek_fw_settings {
+	s8 retry;
+	bool fw_check_only;
+	bool force_update;
+
+	bool fw_ver_check;
+	u8 fw_ver_policy;
+	u8 fw_ver[8];
+};
+
+struct ilitek_fw_handle {
+	struct ilitek_ts_device *dev;
+	void *_private;
+
+	/* upgrade options */
+	struct ilitek_fw_settings setting;
+
+	/* common variable */
+	int update_len;
+
+	struct ilitek_fw_file_info file;
+
+	/* M3 + M2V */
+	bool m2v;
+	bool m2v_need_update;
+	u8 *m2v_buf;
+	u32 m2v_checksum;
+	u8 m2v_fw_ver[8];
+
+	/* upgrade status */
+	unsigned int progress_curr;
+	unsigned int progress_max;
+	u8 progress;
+
+	/* callbacks */
+	struct ilitek_update_callback cb;
+};
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+void __DLL *ilitek_update_init(void *_dev, bool need_update_ts_info,
+			       struct ilitek_update_callback *callback,
+			       void *_private);
+
+void __DLL ilitek_update_exit(void *handle);
+
+void __DLL ilitek_update_set_data_length(void *handle, u16 len);
+
+void __DLL ilitek_update_setting(void *handle,
+				 struct ilitek_fw_settings *setting);
+
+int __DLL ilitek_update_load_fw(void *handle, WCHAR *fw_name);
+
+int __DLL ilitek_update_start(void *handle);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git "a/drivers/input/touchscreen/ilitek/~$inline \344\273\243\347\240\201\346\217\220\344\272\244\346\265\201\347\250\213 .docx" "b/drivers/input/touchscreen/ilitek/~$inline \344\273\243\347\240\201\346\217\220\344\272\244\346\265\201\347\250\213 .docx"
new file mode 100644
index 0000000000000000000000000000000000000000..54af506a4b7c4546aaa12ec99f136c9083b62a83
GIT binary patch
literal 162
zcmZQCuPRR|FHUA439vJiGgJX_3J@1FfHc>ZFflPOG_>^}{sH8{XrBE*K_md<!NeuG
f)w8dM-eF8(e4Ne9!oaZdltBfE57ScAbow{|sQnt1

literal 0
HcmV?d00001

-- 
2.25.1


