Return-Path: <linux-gpio+bounces-35953-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KGrIE/N9GkDFAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35953-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 17:57:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB764ADCD6
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 17:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E4903058BB9
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 15:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE473D47A0;
	Fri,  1 May 2026 15:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="fMtk1Sre"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA593D170B
	for <linux-gpio@vger.kernel.org>; Fri,  1 May 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650874; cv=none; b=SgbToPLR51U0ZGWmu52BDEQ/EdE4lOBKOhAtLAAd1au4jxFPgjVRfNoQ+TKaqwGdRiS5xc9bEhmAeLOvDjalAGJ5lKR2I17V52VP4e1CXjr4RO+iRbNr7n7hKat7loXTOa9dc6XEb25EB2pchL3mA1iGKLIfbNkhPELKD/WBzZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650874; c=relaxed/simple;
	bh=aDKuyOACGE1gNZqDJy0tqBgdZCQkU/jSoB8ed5fRm2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SC/XZ9B5VDOYNsS2wG10APhFgsJlp317gt8F1oF2B4YqADz+p4RHl4GYmaWixvcoj0wF11UeGfGNU6jaGCQ/TOBYD2d1t3elPSSi8UaK6fcFFtvj/Htpdwl6Zrapu/lTMvRSPuGj7JSkEFydiwiqChH65GO6e5bW7wGZdPcxzaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=fMtk1Sre; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8a151012558so22894686d6.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2026 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650871; x=1778255671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFcS3U32PymUNY1RdncskmbPJS8yXxMzYT9xI+/9Gm4=;
        b=fMtk1SreB86rwdZGjIcNe4L88MESDiLdwzL2hEN8M6lap7/SBDpeCiJqKTw3rMZuRa
         ooCBx9tKT6+v+VVCqqaHnHI1GbFcoUUZl2IGpKZUUtBRQEbKUogIOu/gL/DeeFcOXrSa
         sTMU3VRF4+jsL9r3egqMEdKIIQcbr2o73xPUEkZoCcAu994iyGR0Wg54RW4ZJPNjRmcm
         yRIOsO4td7jtDAn7uMe+kyL1dXmmAgvMEuy5+xxvawtYFycwSLCDW6oZhGHpkWtzgFVN
         7d39T2F4wRmV8h3uwPQ/e7rR9U7ddRrhjP+gOdkC1HxZQMnhN5LKHnXsmHKffbgp+Zpa
         tNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650871; x=1778255671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFcS3U32PymUNY1RdncskmbPJS8yXxMzYT9xI+/9Gm4=;
        b=czdBo80qv6NERSWXw6jn5SRJlQKjWKD4pVaApXOvRjkcFg7ynGgoI212P0rEh3sT/S
         dqAASJsj3s7GqDhfLP09Y7TtwhYg/T7GholqBVezWZkfo5lI3GWMowviDN0l1mM6koaA
         fKxXieYNfvuYKpGDj0K+2JUtN2xnTnU0IGCNfWooOnLYs+Vnw+j/qjPFh1Nosys/S00L
         w04udFA9ytQsz0g1KNfccD8BilEHGLR7JixQ+Bozrs4udQeI3Y4wCfdTAvVtnC7zoB1v
         tl8xGuOp9qO0ck4i49trZb1qAJ87OO1BhJ6V3zn7p4OlaXPoFNvqbRxRuWan9Nie8gkT
         Fy+w==
X-Forwarded-Encrypted: i=1; AFNElJ+Rvy/W1JjYpI9K2MuYx0Dhd374CnUeN/mzGgsM+oD8zfuCUQ/RcSOrWNY7GHHmYTeN4KDgUCSjf/Pb@vger.kernel.org
X-Gm-Message-State: AOJu0YwwMLD6lrI196k18MjIoMZ34W+6GoYHIZ9lrr19eULOxAzTSdQ2
	9tsfqSXLE/2q3gw0kwgVo5x6CEENQcAb1ig0mcM6T4jcHuJb1PEtP1s/619cpncd1uQ=
X-Gm-Gg: AeBDietgooFoJpiBL8NSIdRObYxEL4HYLVOk7BeSFqojp3esXKQLfGUjHThyiqSH1QM
	rxiF5jOCeY9q3mY2ThqQQwpzsgMsFnCg2fmcdwWG7SPHLpkUCZG7SW4hodomRlZF14/6r+te2nz
	UnT9DcqzsK9JeG3JNwrRqQ0uozOH9FvKUg8UkNoB0dQf3q7+bI9SYm5Q4GO6nQrlNfGmkc1xZLS
	xQf5PJH4IOXcT74NCRwOOmC6ZeBxmYyVI/yEOuNmhdBXZYsoSiLGyz5JKZa+INsgZhTX7WKkxMc
	svFE3HL1vrFJdQ9MignJ5ooT1CrsJn0y8BvjUwZG7c8gD+gE/hrPETN+OSQOXmpXOoX7CLYoj+U
	aL1V7lCLLYyyrKg2uDWCKtGPXPzrsqBYn3aifgg5q5UesF9dy/umSDSQQB3OH2aUuev0k1do/Ea
	ZHFLYpwncc8v1i7j46ZV/OIHyskOrPYaC5neRBjHsY2Y1Hc1LxS8EUX2rPNiB4FCRWnoYbqaA7t
	2/MxeiVAhfMrsWk
X-Received: by 2002:a05:6214:4c88:b0:8a6:1216:fb6f with SMTP id 6a1803df08f44-8b667a83663mr713716d6.32.1777650871067;
        Fri, 01 May 2026 08:54:31 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	matthew.gerlach@altera.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 01/12] net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via regmap
Date: Fri,  1 May 2026 10:54:09 -0500
Message-ID: <20260501155421.3329862-2-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2EB764ADCD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35953-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_GT_50(0.00)[50];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,riscstar.com:mid,riscstar.com:email]

From: Daniel Thompson <daniel@riscstar.com>

In some DesignWare XPCS implementatons the memory-mapped MDIO bus is
allocated to a register window that does not align to a page boundary.
This makes iomapping the registers problematic.

For example the Toshiba TC9564 (a PCIe Ethernet-AVB/TSN bridge) provides
an "eMAC" subsystem with the XPCS base address cuddled up to XGMAC
registers.

Let's introduce helpers to allow the driver that owns the eMAC to register
an XPCS using is regmap for the memory-mapped MDIO bus.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/Makefile            |   4 +-
 drivers/net/pcs/pcs-xpcs-regmap.c   | 203 ++++++++++++++++++++++++++++
 include/linux/pcs/pcs-xpcs-regmap.h |  20 +++
 3 files changed, 225 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
 create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h

diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index 4f7920618b900..565f1b63fce0b 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
-pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
-				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
+pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-regmap.o \
+				   pcs-xpcs-plat.o pcs-xpcs-wx.o
 
 obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
 obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
diff --git a/drivers/net/pcs/pcs-xpcs-regmap.c b/drivers/net/pcs/pcs-xpcs-regmap.c
new file mode 100644
index 0000000000000..20a54a3605951
--- /dev/null
+++ b/drivers/net/pcs/pcs-xpcs-regmap.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synopsys DesignWare XPCS regmap helpers
+ *
+ * Copyright (C) 2026 RISCstar Solutions.
+ * Copyright (C) 2024 Serge Semin
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mdio.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/pcs/pcs-xpcs-regmap.h>
+#include <linux/regmap.h>
+
+#include "pcs-xpcs.h"
+
+/* Page select register for the indirect MMIO CSRs access */
+#define DW_VR_CSR_VIEWPORT		0xff
+
+struct dw_xpcs_regmap {
+	struct device *dev;
+	struct mii_bus *bus;
+	struct regmap *regmap;
+	bool reg_indir;
+};
+
+static ptrdiff_t xpcs_regmap_addr_format(int dev, int reg)
+{
+	return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
+}
+
+static u16 xpcs_regmap_addr_page(ptrdiff_t csr)
+{
+	return FIELD_GET(0x1fff00, csr);
+}
+
+static ptrdiff_t xpcs_regmap_addr_offset(ptrdiff_t csr)
+{
+	return FIELD_GET(0xff, csr);
+}
+
+static int xpcs_regmap_read_reg_indirect(struct dw_xpcs_regmap *pxpcs, int dev,
+					 int reg)
+{
+	ptrdiff_t csr, ofs;
+	unsigned int val;
+	u16 page;
+	int res;
+
+	csr = xpcs_regmap_addr_format(dev, reg);
+	page = xpcs_regmap_addr_page(csr);
+	ofs = xpcs_regmap_addr_offset(csr);
+
+	res = regmap_write(pxpcs->regmap, DW_VR_CSR_VIEWPORT, page);
+	if (res < 0)
+		return res;
+
+	res = regmap_read(pxpcs->regmap, ofs, &val);
+	if (res < 0)
+		return res;
+
+	return val & 0xffff;
+}
+
+static int xpcs_regmap_write_reg_indirect(struct dw_xpcs_regmap *pxpcs, int dev,
+					  int reg, u16 val)
+{
+	ptrdiff_t csr, ofs;
+	u16 page;
+	int res;
+
+	csr = xpcs_regmap_addr_format(dev, reg);
+	page = xpcs_regmap_addr_page(csr);
+	ofs = xpcs_regmap_addr_offset(csr);
+
+	res = regmap_write(pxpcs->regmap, DW_VR_CSR_VIEWPORT, page);
+	if (res < 0)
+		return res;
+
+	return regmap_write(pxpcs->regmap, ofs, val);
+}
+
+static int xpcs_regmap_read_reg_direct(struct dw_xpcs_regmap *pxpcs, int dev,
+				       int reg)
+{
+	unsigned int val;
+	ptrdiff_t csr;
+	int res;
+
+	csr = xpcs_regmap_addr_format(dev, reg);
+	res = regmap_read(pxpcs->regmap, csr, &val);
+	if (res < 0)
+		return res;
+
+	return val & 0xffff;
+}
+
+static int xpcs_regmap_write_reg_direct(struct dw_xpcs_regmap *pxpcs, int dev,
+					int reg, u16 val)
+{
+	ptrdiff_t csr = xpcs_regmap_addr_format(dev, reg);
+
+	return regmap_write(pxpcs->regmap, csr, val);
+}
+
+static int xpcs_regmap_read_c22(struct mii_bus *bus, int addr, int reg)
+{
+	struct dw_xpcs_regmap *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_regmap_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
+	else
+		return xpcs_regmap_read_reg_direct(pxpcs, MDIO_MMD_VEND2, reg);
+}
+
+static int xpcs_regmap_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
+{
+	struct dw_xpcs_regmap *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_regmap_write_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg, val);
+	else
+		return xpcs_regmap_write_reg_direct(pxpcs, MDIO_MMD_VEND2, reg, val);
+}
+
+static int xpcs_regmap_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
+{
+	struct dw_xpcs_regmap *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_regmap_read_reg_indirect(pxpcs, dev, reg);
+	else
+		return xpcs_regmap_read_reg_direct(pxpcs, dev, reg);
+}
+
+static int xpcs_regmap_write_c45(struct mii_bus *bus, int addr, int dev,
+				 int reg, u16 val)
+{
+	struct dw_xpcs_regmap *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_regmap_write_reg_indirect(pxpcs, dev, reg, val);
+	else
+		return xpcs_regmap_write_reg_direct(pxpcs, dev, reg, val);
+}
+
+struct dw_xpcs *devm_xpcs_regmap_register(struct device *dev,
+					  const struct xpcs_regmap_config *config)
+{
+	static atomic_t id = ATOMIC_INIT(-1);
+	struct dw_xpcs_regmap *pxpcs;
+	int ret;
+
+	pxpcs = devm_kzalloc(dev, sizeof(*pxpcs), GFP_KERNEL);
+	if (!pxpcs)
+		return ERR_PTR(-ENOMEM);
+
+	pxpcs->dev = dev;
+	pxpcs->regmap = config->regmap;
+	pxpcs->reg_indir = config->reg_indir;
+
+	pxpcs->bus = devm_mdiobus_alloc_size(dev, 0);
+	if (!pxpcs->bus)
+		return ERR_PTR(-ENOMEM);
+
+	pxpcs->bus->name = "DW XPCS MCI/APB3";
+	pxpcs->bus->read = xpcs_regmap_read_c22;
+	pxpcs->bus->write = xpcs_regmap_write_c22;
+	pxpcs->bus->read_c45 = xpcs_regmap_read_c45;
+	pxpcs->bus->write_c45 = xpcs_regmap_write_c45;
+	pxpcs->bus->phy_mask = ~0;
+	pxpcs->bus->parent = dev;
+	pxpcs->bus->priv = pxpcs;
+
+	snprintf(pxpcs->bus->id, MII_BUS_ID_SIZE,
+		 "dwxpcs-%x", atomic_inc_return(&id));
+
+	/* MDIO-bus here serves as just a back-end engine abstracting out
+	 * the MDIO and MCI/APB3 IO interfaces utilized for the DW XPCS CSRs
+	 * access.
+	 */
+	ret = devm_mdiobus_register(dev, pxpcs->bus);
+	if (ret) {
+		dev_err(dev, "Failed to create MDIO bus\n");
+		return ERR_PTR(ret);
+	}
+
+	return xpcs_create_mdiodev(pxpcs->bus, 0);
+}
+EXPORT_SYMBOL_GPL(devm_xpcs_regmap_register);
diff --git a/include/linux/pcs/pcs-xpcs-regmap.h b/include/linux/pcs/pcs-xpcs-regmap.h
new file mode 100644
index 0000000000000..19c99d4160365
--- /dev/null
+++ b/include/linux/pcs/pcs-xpcs-regmap.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_PCS_XPCS_REGMAP_H
+#define __LINUX_PCS_XPCS_REGMAP_H
+
+#include <linux/types.h>
+
+struct device;
+struct regmap;
+struct dw_xpcs;
+
+struct xpcs_regmap_config {
+	struct regmap *regmap;
+	bool reg_indir;
+};
+
+struct dw_xpcs *devm_xpcs_regmap_register(
+		struct device *dev, const struct xpcs_regmap_config *config);
+
+#endif /* __LINUX_PCS_XPCS_REGMAP_H */
-- 
2.51.0


