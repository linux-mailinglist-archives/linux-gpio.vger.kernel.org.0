Return-Path: <linux-gpio+bounces-6816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F9A8D3302
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDD98B2657D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EAC16EC1A;
	Wed, 29 May 2024 09:29:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE80B16A362
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974988; cv=none; b=Stq9j4Wwu5rkVkcSyC+UDULG3IEgIQdCwnWlOsKLxtonrbgCUzx3iJqO8kD5clvvzH/5lVcYiaICNVVCrpcUYcR8xh9wXiiSjTLsXgpJxcWI+wbAxJP25DH/UAnAiqEZzKlDcwA/0rjPT4Fjo8zzs9kNtSbK6pip+9Co6kCQHH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974988; c=relaxed/simple;
	bh=8Vj2KXMLjW6yLYPbVR9bwxmDWAE3IVEg5kHIPrLC1Zg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=azul7dLAo3A22j7Xp0iKuiUQr1foCN6l1bMkarMMUxVoaIFp8gPGz1XSDc5m8IyXWBIfR8VubrEiml9brZM77ssXf/5tmNy20Ty81s9oKwMk7N5vac/iWyIKl+anss4tjAisOXfL/yO8UmcQijqkrBsc9N1sn+ehXbXk39oaihc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by albert.telenet-ops.be with bizsmtp
	id UxVg2C00H3VPV9V06xVglN; Wed, 29 May 2024 11:29:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFbu-00GHKd-0W;
	Wed, 29 May 2024 11:29:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFcq-008wS2-Dz;
	Wed, 29 May 2024 11:29:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/8] soc: renesas: Add R-Car fuse driver
Date: Wed, 29 May 2024 11:29:32 +0200
Message-Id: <7f58556cc1187ddd305935c8452e03c26949ce95.1716974502.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716974502.git.geert+renesas@glider.be>
References: <cover.1716974502.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car Gen3/Gen4 SoCs contain fuses indicating hardware support or
hardware parameters.  Add a driver to access the state of the fuses.
This supports three type of hardware fuse provides:
  1. E-FUSE non-volatile memory accessible through the Pin Function
     Controller on R-Car V3U and S4-8,
  2. E-FUSE non-volatile memory accessible through OTP_MEM on R-Car V4H
     and V4M,
  3. Fuses tightly integrated with the Pin Function Controller on R-Car
     Gen3 SoCs.

Types 1 and 2 use hardware descriptions in DT.
Type 3 relies on a platform device with accompanying platform data, to
be provided by the PFC driver.

Two APIs are provided to read the state of the fuses:
  - An kernelspace API (rcar_fuse_read()), to be used by e.g. the
    Renesas UFSHCD driver,
    Symbolic register indices are provided for convenience.
  - A userspace API, using the NVMEM framework.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.

Questions:
  - Should the NVMEM support be made optional, relaxing the dependency
    on NVMEM?
  - Currently, the NVMEM access is restricted to the root user.
    Should his be relaxed?
  - On R-Car S4, the full space from RCAR_FUSE_MON0 to RCAR_LTM0_MON2 is
    exposed.  Should this be split into separate blocks?
---
 drivers/soc/renesas/Kconfig             |   8 +
 drivers/soc/renesas/Makefile            |   1 +
 drivers/soc/renesas/rcar-fuse.c         | 201 ++++++++++++++++++++++++
 include/linux/platform_data/rcar_fuse.h |  11 ++
 include/linux/soc/renesas/rcar-fuse.h   |  41 +++++
 5 files changed, 262 insertions(+)
 create mode 100644 drivers/soc/renesas/rcar-fuse.c
 create mode 100644 include/linux/platform_data/rcar_fuse.h
 create mode 100644 include/linux/soc/renesas/rcar-fuse.h

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 3125ab575b60b8d1..13aadcf1dec7b8b8 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -376,6 +376,14 @@ config ARCH_R9A07G043
 
 endif # RISCV
 
+config FUSE_RCAR
+	tristate "R-Car Fuse support"
+	depends on (ARCH_RENESAS && ARM64) || COMPILE_TEST
+	depends on NVMEM
+	help
+	  Enable support for reading the fuses in the PFC, E-FUSE or OTP
+	  non-volatile memory block on R-Car Gen3/Gen4 SoCs.
+
 config PWC_RZV2M
 	bool "Renesas RZ/V2M PWC support" if COMPILE_TEST
 
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 725eedd9d73ceae7..8ff382a82ac94496 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -8,5 +8,6 @@ obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
 
 # Family
+obj-$(CONFIG_FUSE_RCAR)		+= rcar-fuse.o
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
diff --git a/drivers/soc/renesas/rcar-fuse.c b/drivers/soc/renesas/rcar-fuse.c
new file mode 100644
index 0000000000000000..8fb2374f919b83e5
--- /dev/null
+++ b/drivers/soc/renesas/rcar-fuse.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * R-Car Gen3/Gen4 E-FUSE/OTP Driver
+ *
+ * Copyright (C) 2024 Glider bv
+ */
+
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_data/rcar_fuse.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/soc/renesas/rcar-fuse.h>
+
+struct rcar_fuse {
+	struct device *dev;
+	void __iomem *base;
+	unsigned int offset;
+	unsigned int nregs;
+	struct nvmem_device *nvmem;
+};
+
+struct rcar_fuse_data {
+	unsigned int bank;	/* 0: PFC + E-FUSE, 1: OPT_MEM + E-FUSE */
+	unsigned int offset;
+	unsigned int nregs;
+};
+
+/* NVMEM access must not use the rcar_fuse singleton */
+static int rcar_fuse_nvmem_read(void *priv, unsigned int offset, void *val,
+				size_t bytes)
+{
+	struct rcar_fuse *fuse = priv;
+	u32 *buf = val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(fuse->dev);
+	if (ret < 0)
+		return ret;
+
+	for (; bytes >= 4; bytes -= 4, offset += 4)
+		*buf++ = readl(fuse->base + fuse->offset + offset);
+
+	pm_runtime_put(fuse->dev);
+
+	return 0;
+}
+
+static struct rcar_fuse *rcar_fuse;
+static DEFINE_MUTEX(rcar_fuse_lock);	/* Protects rcar_fuse singleton */
+
+int rcar_fuse_read(unsigned int idx, u32 *val)
+{
+	int ret;
+
+	guard(mutex)(&rcar_fuse_lock);
+
+	if (!rcar_fuse)
+		return -EPROBE_DEFER;
+
+	if (idx >= rcar_fuse->nregs)
+		return -EINVAL;
+
+	ret = pm_runtime_resume_and_get(rcar_fuse->dev);
+	if (ret < 0)
+		return ret;
+
+	*val = readl(rcar_fuse->base + rcar_fuse->offset + idx * sizeof(u32));
+
+	pm_runtime_put(rcar_fuse->dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rcar_fuse_read);
+
+static int rcar_fuse_probe(struct platform_device *pdev)
+{
+	const struct rcar_fuse_platform_data *pdata;
+	const struct rcar_fuse_data *data;
+	struct device *dev = &pdev->dev;
+	struct nvmem_config nvmem;
+	struct rcar_fuse *fuse;
+	int ret;
+
+	guard(mutex)(&rcar_fuse_lock);
+
+	if (rcar_fuse)
+		return -EEXIST;
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret < 0)
+		return ret;
+
+	fuse = devm_kzalloc(dev, sizeof(*fuse), GFP_KERNEL);
+	if (!fuse)
+		return -ENOMEM;
+
+	fuse->dev = dev;
+
+	data = device_get_match_data(dev);
+	if (!data) {
+		/* Fuse block integrated into PFC */
+		pdata = dev->platform_data;
+		if (!pdata)
+			return -EINVAL;
+
+		fuse->base = pdata->base;
+		fuse->offset = pdata->offset;
+		fuse->nregs = pdata->nregs;
+	} else {
+		/* PFC + E-FUSE or OTP_MEM + E-FUSE */
+		fuse->base = devm_platform_ioremap_resource(pdev, data->bank);
+		if (IS_ERR(fuse->base))
+			return PTR_ERR(fuse->base);
+
+		fuse->offset = data->offset;
+		fuse->nregs = data->nregs;
+	};
+
+	memset(&nvmem, 0, sizeof(nvmem));
+	nvmem.dev = dev;
+	nvmem.name = "fuse";
+	nvmem.id = -1;
+	nvmem.owner = THIS_MODULE;
+	nvmem.type = NVMEM_TYPE_OTP;
+	nvmem.read_only = true;
+	nvmem.root_only = true;
+	nvmem.reg_read = rcar_fuse_nvmem_read;
+	nvmem.size = fuse->nregs * 4;
+	nvmem.word_size = 4;
+	nvmem.stride = 4;
+	nvmem.priv = fuse;
+
+	fuse->nvmem = devm_nvmem_register(dev, &nvmem);
+	if (IS_ERR(fuse->nvmem))
+		return dev_err_probe(dev, PTR_ERR(fuse->nvmem),
+				     "failed to register NVMEM device\n");
+
+	rcar_fuse = fuse;
+
+	return 0;
+}
+
+static void rcar_fuse_remove(struct platform_device *pdev)
+{
+	guard(mutex)(&rcar_fuse_lock);
+
+	rcar_fuse = NULL;
+}
+
+static const struct rcar_fuse_data rcar_fuse_v3u = {
+	.bank = 0,
+	.offset = 0xc0,
+	.nregs = 10,
+};
+
+static const struct rcar_fuse_data rcar_fuse_s4 = {
+	.bank = 0,
+	.offset = 0xc0,
+	.nregs = 35,
+};
+
+static const struct rcar_fuse_data rcar_fuse_v4h = {
+	.bank = 1,
+	.offset = 0x100,
+	.nregs = 40
+};
+
+static const struct rcar_fuse_data rcar_fuse_v4m = {
+	.bank = 1,
+	.offset = 0x100,
+	.nregs = 4,
+};
+
+static const struct of_device_id rcar_fuse_match[] = {
+	{ .compatible = "renesas,r8a779a0-efuse", .data = &rcar_fuse_v3u },
+	{ .compatible = "renesas,r8a779f0-efuse", .data = &rcar_fuse_s4 },
+	{ .compatible = "renesas,r8a779g0-otp", .data = &rcar_fuse_v4h },
+	{ .compatible = "renesas,r8a779h0-otp", .data = &rcar_fuse_v4m },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rcar_fuse_driver = {
+	.probe = rcar_fuse_probe,
+	.remove_new = rcar_fuse_remove,
+	.driver = {
+		.name = "rcar_fuse",
+		.of_match_table = rcar_fuse_match,
+	},
+};
+module_platform_driver(rcar_fuse_driver);
+
+MODULE_DESCRIPTION("Renesas R-Car E-FUSE/OTP driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Geert Uytterhoeven");
diff --git a/include/linux/platform_data/rcar_fuse.h b/include/linux/platform_data/rcar_fuse.h
new file mode 100644
index 0000000000000000..07933336b5f4e668
--- /dev/null
+++ b/include/linux/platform_data/rcar_fuse.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __LINUX_PLATFORM_DATA_RCAR_FUSE_H__
+#define __LINUX_PLATFORM_DATA_RCAR_FUSE_H__
+
+struct rcar_fuse_platform_data {
+	void __iomem *base;
+	unsigned int offset;
+	unsigned int nregs;
+};
+
+#endif /* __LINUX_PLATFORM_DATA_RCAR_FUSE_H__ */
diff --git a/include/linux/soc/renesas/rcar-fuse.h b/include/linux/soc/renesas/rcar-fuse.h
new file mode 100644
index 0000000000000000..37fc23ef74057066
--- /dev/null
+++ b/include/linux/soc/renesas/rcar-fuse.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __LINUX_SOC_RENESAS_RCAR_FUSE_H__
+#define __LINUX_SOC_RENESAS_RCAR_FUSE_H__
+
+#define RCAR_FUSE_MON0		0
+#define RCAR_FUSE_MON1		1
+#define RCAR_FUSE_MON2		2
+#define RCAR_FUSE_MON3		3
+#define RCAR_FUSE_MON4		4
+#define RCAR_FUSE_MON5		5
+#define RCAR_FUSE_MON6		6
+#define RCAR_FUSE_MON7		7
+#define RCAR_FUSE_MON8		8
+#define RCAR_FUSE_MON9		9
+
+#define RCAR_LTM0_MON0		32
+#define RCAR_LTM0_MON1		33
+#define RCAR_LTM0_MON2		34
+
+#define RCAR_OTPMONITOR0	0
+#define RCAR_OTPMONITOR3	3
+#define RCAR_OTPMONITOR28	28
+#define RCAR_OTPMONITOR32	32
+#define RCAR_OTPMONITOR33	33
+#define RCAR_OTPMONITOR34	34
+#define RCAR_OTPMONITOR35	35
+#define RCAR_OTPMONITOR36	36
+#define RCAR_OTPMONITOR37	37
+#define RCAR_OTPMONITOR38	38
+#define RCAR_OTPMONITOR39	39
+
+#if IS_ENABLED(CONFIG_FUSE_RCAR)
+int rcar_fuse_read(unsigned int idx, u32 *val);
+#else
+static inline int rcar_fuse_read(unsigned int idx, u32 *val)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* __LINUX_SOC_RENESAS_RCAR_FUSE_H__ */
-- 
2.34.1


