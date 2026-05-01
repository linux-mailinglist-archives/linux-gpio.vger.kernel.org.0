Return-Path: <linux-gpio+bounces-35962-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNA4I+PO9GkYFQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35962-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 18:03:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE384ADE21
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 18:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B1263039A71
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 15:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAA53D75BC;
	Fri,  1 May 2026 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="GEhor2Xh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963683E0255
	for <linux-gpio@vger.kernel.org>; Fri,  1 May 2026 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650905; cv=none; b=oPiV/AGGQ6GiMkaqIgrT7z8Dl9ecaYTOtoDCNfJl3WeEgVE9e6/yPDubnDZaxR9AD10SxGewyTj+EOqda+KVzZhzBx9dsuTurQQv3dWUdrTX+9OyRKMbXwzChqIzf+0EjerQI8Lgf18bRd5L6E55tuE8nbWJy9JRgwPNpaXS8Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650905; c=relaxed/simple;
	bh=JP+j+6TCICqN/WR7i+VV1XoY2uZyoR7unSKG3xQnVg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glxhh3YKMBWjENNT0rrJ+rT8FcyhkHIpaHOoyTrwbbm+ID6WNX3gybunkcfcLJ5qMxuKsOYLVz/N3F1CdTUshFXd80hCp0iUpjIxWjRj8OBfvvZXBURoN3TlgHSD0N4SD/ORjlfF4AFNO8mhuICL+Fjus7Twkw5Ioa2ftZZghY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=GEhor2Xh; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a3970f1a0eso21356816d6.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2026 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650902; x=1778255702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLtmgJRm59utBOLEfAtowzngTeaKeZzm+b79FRaQwf0=;
        b=GEhor2Xhchs9e/VAinzpBGhWZkOhnOlYVFAKavBdVbF4CiEDhjWXzAZey/uZ2zfAH8
         3GABSRnh19s9dxYDxtUpQbd5n+ZKePAEcc2RyjM9zZUXxSjzLLt9YhHtsDd5TgYHQPUL
         RPQuP6uIwxaVQoidXTe/7UPk/fTZLmlDHRfDlDVta5lAYtM0gzpIwr8jeW9nDNqPeaFJ
         0Hk5/5L5LDeJWZ6+ubHXHQSuKFxW/pj1/RHVaVeTC8vLx9NHu04O26LEZ7TbvSAnONqR
         CGNv5zSKE735vWle+QIVGAor3nS2uhyH+WRavkPYM2CqUOke/5nuD9mt6S67ht7JL+IF
         HgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650902; x=1778255702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TLtmgJRm59utBOLEfAtowzngTeaKeZzm+b79FRaQwf0=;
        b=FOq9YOVazAM2+B3qW+ZQna0X10RYE99kN+pkIBy2ZaEln+7s0He3VsI6jxjEIHcR3Q
         0oo3fMZxtW9sOzjKSZIXf09HEpJy+iPRxcS64KyyxqFLHNO1kCte9kpeEyWoYBjmhoDN
         as5LngBtG8PKZ9utYiLoLrCSgDTQ/MWWlnHTyUTlfrCeW19nZWAfnUCwqRiA371bi8OF
         YTXs+ErIXHmz1qcTtiw2xUfG8fdCOgW8cesb2oNVbCeUsuXe992EKo31/OmN4X/qCsDn
         UwqhyXEk5n18jLn0E2vhqiJkzGubnV8raORY37CY+piELafHqV140gGo6pjhS3aHNL5L
         rC7w==
X-Forwarded-Encrypted: i=1; AFNElJ9bKj261iz9DKLBUYfi4cd17JMHYKZswKHigZhEstZJi0RuzJKdoPI4+hbQvcRgduhoMfhl6GS2mny2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4qBH/6AejC1PGWQkHwTYkdfZRuRNIgl+x3J2FsQ+M/pnMOBo9
	guoCC4NaVaM9MxFxePn4i3sUv31//QQnsn6yg2Pjet3qxU+aJo9y7mYCIEl9yEwl1pY=
X-Gm-Gg: AeBDieuusue0IEms85mjOldI/Q8CBt1c2Z9xN0Vj2cCs0sqoKs750RtHP+JDOXIS5K6
	2Ukv/UaxCVDKTF2+UDCrrotYkPKNBDCQZ+QsqfCvvFLry5tvSatGuNv7T/UjIsGc+2AJ5baARbV
	5WhjWuRGts+7Keexqs9i1n/yBfu845u/eynqqrx7PjH8v5gFwaM8bhUBxICfBdfiC/iGjqctw+A
	AJ9lxwr87hTFAqz5otWxLWjEPZtytAknRvylRlTgvFs1hB+cxj6u+xR3yWF1ti1aAH3doRzbUty
	EVPuP1QcyNycvgCRJBsacCFE4xhv/7KtecF1tYVF6w18HF5KB+pBSmARBbKO1IPET8Um4CsYLam
	oZ0zo+kxLbkKstjGYlKeeM+5ZQWZUSrT8ci/4M/u/GdghiHm4exbxSGwaEZ9s4rwwaMc8f1KER3
	D1UsXbGmlaxQpAybKOP7aHQIw0Tq8T4hB+AnVZGUA7JReyCSwVM8TE8C73CkOzvUKuBnyM6pn5l
	XkqCg==
X-Received: by 2002:a05:6214:4802:b0:8ae:652b:e3c4 with SMTP id 6a1803df08f44-8b668d0b700mr535566d6.49.1777650901165;
        Fri, 01 May 2026 08:55:01 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:55:00 -0700 (PDT)
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
Subject: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615 support
Date: Fri,  1 May 2026 10:54:18 -0500
Message-ID: <20260501155421.3329862-11-elder@riscstar.com>
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
X-Rspamd-Queue-Id: 7BE384ADE21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35962-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[50];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

From: Daniel Thompson <daniel@riscstar.com>

Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
that can be accessed, along with several other peripherals, via two
PCIe endpoint functions. There is a main driver for the endpoint that
decomposes things and creates auxiliary bus devices to model the SoC.

The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
supported by an MSIGEN that bridges TC956x level interrupts to PCIe
MSIs.

Add a driver for the eMAC/MSIGEN combination.

Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  13 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
 .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 791 ++++++++++++++++++
 include/soc/toshiba/tc956x-dwmac.h            |  84 ++
 4 files changed, 890 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
 create mode 100644 include/soc/toshiba/tc956x-dwmac.h

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index e3dd5adda5aca..66bcfaccbe21f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -404,6 +404,19 @@ config DWMAC_MOTORCOMM
 	  This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
 	  controllers. Currently only YT6801 is supported.
 
+config DWMAC_TC956X
+	tristate "Toshiba TC956X DWMAC support"
+	depends on PCI
+	depends on COMMON_CLK
+	depends on TOSHIBA_TC956X_PCI
+	default m if TOSHIBA_TC956X_PCI
+	help
+	  This selects the Toshiba TC956X (and Qualcomm QPS615) support in the
+	  stmmac driver.
+
+	  This provides support for the ethernet controllers found on these
+	  devices.
+
 config STMMAC_PCI
 	tristate "STMMAC PCI bus support"
 	depends on PCI
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index a1cea2f57252e..e8e7f95dbe3e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -51,4 +51,6 @@ obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
 obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
 obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
 obj-$(CONFIG_DWMAC_MOTORCOMM)	+= dwmac-motorcomm.o
+obj-$(CONFIG_TC956X_PCI)	+= tc956x-pci.o
+obj-$(CONFIG_DWMAC_TC956X)	+= dwmac-tc956x.o
 stmmac-pci-objs:= stmmac_pci.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
new file mode 100644
index 0000000000000..27ff83dd3bd9e
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
@@ -0,0 +1,791 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ *
+ * Derived from code having the following copyrights:
+ * Copyright (C) 2011-2012  Vayavya Labs Pvt Ltd
+ * Copyright (C) 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/iopoll.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/pcs/pcs-xpcs-regmap.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/phy.h>
+#include <linux/regmap.h>
+#include <linux/stmmac.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <soc/toshiba/tc956x-dwmac.h>
+
+#include "common.h"
+#include "dwxgmac2.h"
+#include "stmmac.h"
+
+#define DRIVER_NAME			"dwmac-tc956x"
+
+#define TC956X_PTP_CLOCK_RATE		(250 * HZ_PER_MHZ)
+
+#define TC956X_RX_FIFO_KB		46	/* Shared by all RX queues */
+#define TC956X_TX_FIFO_KB		46	/* Shared by all TX queues */
+
+/* Fields and values for the EMACTL registers */
+#define EMAC_SP_SEL_MASK		GENMASK(3, 0)
+#define SP_SEL_SGMII_2500M		4
+#define SP_SEL_SGMII_1000M		5
+#define SP_SEL_SGMII_100M		6
+#define SP_SEL_SGMII_10M		7
+#define EMAC_PHY_INF_SEL_MASK		GENMASK(5, 4)
+#define PCS_CLK_PHY			1	/* Clock from PHY */
+#define EMAC_INV_SGM_SIG_DET		BIT(6)	/* 1 = polarity inverted */
+#define EMAC_LPIHWCLKEN			BIT(8)	/* 1 = low power mode */
+#define EMAC_INIT_DONE			BIT(21)
+
+/* MSIGEN Registers */
+#define MSI_OUT_EN_OFFSET		0x0000
+#define MSI_MASK_CLR_OFFSET		0x000c
+#define MSI_MASK_VALUE			BIT(0)
+#define MSI_INT_STS_OFFSET		0x0010
+
+enum msigen_hwirq {
+	HWIRQ_LPI		= 0,
+	HWIRQ_PMT		= 1,
+	HWIRQ_EVENT		= 2,
+	HWIRQ_TX0		= 3,
+	HWIRQ_RX0		= 11,
+	HWIRQ_XPCS		= 19,
+	HWIRQ_PHY		= 20,
+	HWIRQ_PFMAILBOX		= 21,
+	HWIRQ_MSIREQ_PLS	= 24
+};
+
+#define HWIRQ_COUNT			25
+
+/* Offset to the XPCS memory block, relative to the EMAC address range */
+#define DWMAC_XPCS_OFFSET		0x3a00
+
+/* Offset to the PMATOP memory block, relative to the EMAC address range */
+#define DWMAC_PMATOP_OFFSET			0x4000
+
+#define PMA_CML_GL_PM_CFG0			0x01b8
+
+/*
+ * Five sets three registers must be configured for PMA.  The HWT_REFCLK
+ * registers are each separated by 0x14 bytes.  The Common0 configuration
+ * registers are separated by 0x8 bytes.
+ */
+#define PMA_REG_COUNT				5
+
+#define PMA_HWT_REFCK_R_EN			0x1080
+#define PMA_HWT_REFCK_TERM_EN			0x1090
+#define PMA_HWT_REFCK_STRIDE			0x0014
+
+#define PMA_COMM_CFG_0_1			0x1888
+#define PMA_COMM_CFG_0_1_STRIDE			0x0008
+
+/* PMA_COMM_CFG_0_1 fields (WRITE_MASK is a field name) */
+#define COMM_CFG_WRITE_MASK_MASK		GENMASK(16, 9)
+#define WRITE_MASK_VALUE			0xf7	/* Power-on value */
+#define COMM_CFG_ENABLE				BIT(8)
+#define COMM_CFG_WRITE_DATA_MASK		GENMASK(7, 0)
+#define WRITE_DATA_VALUE			0x04	/* Power-on value */
+
+/**
+ * struct tc956x_data - Toshiba-specific platform data
+ * @dev:		Device pointer
+ * @irq_domain:		MSIGEN IRQ domain
+ * @auxbus_data:	Pointer to data passed from the parent device
+ * @plat:		Pointer to our stmmac platform data
+ * @dma_cfg:		DMA config buffer used by plat_stmmacenet_data
+ * @mdio_bus_data:	MDIO bus data used by plat_stmmacenet_data
+ * @axi:		AXI data used by plat_stmmacenet_data
+ * @desc:		DMA descriptor data used by mac_device_info
+ * @dma:		DMA operations data used by mac_device_info
+ */
+struct tc956x_data {
+	struct device *dev;
+	struct irq_domain *irq_domain;
+	struct tc956x_dwmac_data *auxbus_data;
+	struct plat_stmmacenet_data *plat;
+
+	/* These three fields are used by the plat_stmmacenet_data structure */
+	struct stmmac_dma_cfg dma_cfg;
+	struct stmmac_mdio_bus_data mdio_bus_data;
+	struct stmmac_axi axi;
+
+	/* These two fields are used by the mac_device_info structure */
+	struct stmmac_desc_ops desc;
+	struct stmmac_dma_ops dma;
+};
+
+struct tc956x_mac_speed {
+	phy_interface_t phy_interface;
+	int speed;
+	u32 sp_sel;
+};
+
+static struct tc956x_mac_speed mac_speed[] = {
+	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_SGMII_2500M, },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_2500,  SP_SEL_SGMII_2500M, },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M, },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_100,   SP_SEL_SGMII_100M, },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_10,    SP_SEL_SGMII_10M, },
+};
+
+/* TC956x uses indirect addressing so this need only describe a 1KiB range */
+static const struct regmap_config xpcs_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_base	= 0x00,		/* Minimum XPCS reg offset */
+	.max_register	= 0xff,		/* Register DW_VR_CSR_VIEWPORT */
+	.reg_shift	= REGMAP_UPSHIFT(2),
+};
+
+static void tc956x_msigen_irq_handler(struct irq_desc *desc)
+{
+	struct irq_domain *irq_domain = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct irq_chip_generic *gc;
+	unsigned long status;
+	unsigned int hwirq;
+
+	gc = irq_get_domain_generic_chip(irq_domain, 0);
+
+	chained_irq_enter(chip, desc);
+
+	status = irq_reg_readl(gc, MSI_INT_STS_OFFSET);
+	for_each_set_bit(hwirq, &status, HWIRQ_COUNT)
+		generic_handle_domain_irq(irq_domain, hwirq);
+
+	/*
+	 * Clear the MSI flag. Most interrupts within TC956X are level-high
+	 * type. If any interrupts are still asserted then clearing this flag
+	 * will cause the (edge-triggered) MSI to be regenerated.
+	 */
+	irq_reg_writel(gc, MSI_MASK_VALUE, MSI_MASK_CLR_OFFSET);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int tc956x_msigen_irq_chip_init(struct irq_chip_generic *gc)
+{
+	struct tc956x_data *td = gc->domain->host_data;
+
+	gc->reg_base = td->auxbus_data->msigen;
+	gc->chip_types[0].regs.mask = MSI_OUT_EN_OFFSET;
+	gc->chip_types[0].chip.irq_mask = irq_gc_mask_clr_bit;
+	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_set_bit;
+
+	/* Disable all interrupts */
+	irq_reg_writel(gc, 0, MSI_OUT_EN_OFFSET);
+
+	return 0;
+}
+
+static void tc956x_msigen_irq_chip_exit(struct irq_chip_generic *gc)
+{
+	irq_reg_writel(gc, 0, MSI_OUT_EN_OFFSET);
+}
+
+static int tc956x_msigen_irq_domain_init(struct irq_domain *irq_domain)
+{
+	struct tc956x_data *td = irq_domain->host_data;
+
+	irq_set_chained_handler_and_data(td->auxbus_data->msigen_irq,
+					 tc956x_msigen_irq_handler,
+					 irq_domain);
+
+	return 0;
+}
+
+static void tc956x_msigen_irq_domain_exit(struct irq_domain *irq_domain)
+{
+	struct tc956x_data *td = irq_domain->host_data;
+
+	irq_set_chained_handler_and_data(td->auxbus_data->msigen_irq,
+					 NULL, NULL);
+}
+
+/* We have one IRQ chip instance with 25 IRQs in its domain */
+static struct irq_domain *
+tc956x_msigen_irq_domain_instantiate(struct tc956x_data *td)
+{
+	struct irq_domain_chip_generic_info dgc_info;
+	struct irq_domain_info info;
+
+	dgc_info.name = "tc956x-msigen";
+	dgc_info.handler = handle_level_irq;
+	dgc_info.irqs_per_chip = HWIRQ_COUNT;
+	dgc_info.num_ct = 1;
+	dgc_info.init = tc956x_msigen_irq_chip_init;
+	dgc_info.exit = tc956x_msigen_irq_chip_exit;
+
+	info.domain_flags = IRQ_DOMAIN_FLAG_DESTROY_GC;
+	info.size = HWIRQ_COUNT;
+	info.hwirq_max = HWIRQ_COUNT;
+	info.ops = &irq_generic_chip_ops;
+	info.host_data = td;
+	info.dgc_info = &dgc_info;
+	info.init = tc956x_msigen_irq_domain_init;
+	info.exit = tc956x_msigen_irq_domain_exit;
+
+	return devm_irq_domain_instantiate(td->dev, &info);
+}
+
+/**
+ * tc956x_pma_init() - Initialize PMA
+ * @td:	bsp_priv pointer
+ *
+ * Initialize (or re-initialize) the PMA, configure the clocks and wait for the
+ * eMAC to be ready.
+ */
+static void tc956x_pma_init(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	void __iomem *emac_ctl = td->auxbus_data->emac_ctl;
+	u32 id = td->auxbus_data->mac_id;
+	void __iomem *pmatop;
+	u32 val;
+	u32 i;
+
+	/*
+	 * When we re-initialize the PMA then the reset will already have
+	 * been deasserted. We must make sure the PMA reset is asserted before
+	 * we change the clock settings.
+	 */
+	tc956x_reset_assert(chip, id, MAC_RESET_PMA);
+
+	pmatop = td->auxbus_data->emac + DWMAC_PMATOP_OFFSET;
+
+	/* Power on CML buffer (0 = normal mode, 1 = power down) */
+	writel(0, pmatop + PMA_CML_GL_PM_CFG0);
+
+	/* This value switches clock from C0_REFCK to CLK_REF_I */
+	val = u32_encode_bits(WRITE_MASK_VALUE, COMM_CFG_WRITE_MASK_MASK);
+	val |= COMM_CFG_ENABLE;
+	val |= u32_encode_bits(WRITE_DATA_VALUE, COMM_CFG_WRITE_DATA_MASK);
+
+	for (i = 0; i < PMA_REG_COUNT; i++) {
+		u32 offset =  i * PMA_HWT_REFCK_STRIDE;
+
+		/* Disable C0_REFCK and 100 ohm termination */
+		writel(0, pmatop + PMA_HWT_REFCK_R_EN + offset);
+		writel(0, pmatop + PMA_HWT_REFCK_TERM_EN + offset);
+
+		/* Switch clock from C0_REFCK to CLK_REF_I */
+		offset =  i * PMA_COMM_CFG_0_1_STRIDE;
+		writel(val, pmatop + PMA_COMM_CFG_0_1 + offset);
+	}
+
+	tc956x_reset_deassert(chip, id, MAC_RESET_PMA);
+
+	WARN_ON(readl_poll_timeout(emac_ctl, val, val & EMAC_INIT_DONE, 50, 1000000));
+}
+
+static int tc956x_mac_speed_select(struct tc956x_data *td, int speed)
+{
+	phy_interface_t phy_interface = td->plat->phy_interface;
+	struct net_device *netdev;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mac_speed); i++) {
+		if (mac_speed[i].speed != speed)
+			continue;
+
+		if (mac_speed[i].phy_interface == phy_interface)
+			return mac_speed[i].sp_sel;
+	}
+	netdev = dev_get_drvdata(td->dev);
+	netdev_err(netdev, "%s/%d unsupported\n",
+		   phy_modes(phy_interface), speed);
+
+	return -EOPNOTSUPP;
+}
+
+static int tc956x_mac_configure(struct tc956x_data *td, int speed)
+{
+	void __iomem *emac_ctl = td->auxbus_data->emac_ctl;
+	int sp_sel;
+	u32 val;
+
+	sp_sel = tc956x_mac_speed_select(td, speed);
+	if (sp_sel < 0)
+		return sp_sel;
+
+	val = readl(emac_ctl);
+	val |= EMAC_LPIHWCLKEN;
+	val &= ~EMAC_INV_SGM_SIG_DET;
+	val = u32_replace_bits(val, PCS_CLK_PHY, EMAC_PHY_INF_SEL_MASK);
+	val = u32_replace_bits(val, sp_sel, EMAC_SP_SEL_MASK);
+	writel(val, emac_ctl);
+
+	return 0;
+}
+
+static int tc956x_mac_enable(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	struct plat_stmmacenet_data *plat = td->plat;
+	u32 id = td->auxbus_data->mac_id;
+	int ret;
+
+	tc956x_clock_enable(chip, id, MAC_CLOCK_TX);
+	tc956x_clock_enable(chip, id, MAC_CLOCK_RX);
+	tc956x_clock_enable(chip, id, MAC_CLOCK_ALL);
+	if (id)
+		tc956x_clock_enable(chip, id, MAC_CLOCK_RMII);
+
+	/* Set the speed related registers */
+	ret = tc956x_mac_configure(td, plat->max_speed);
+	if (ret)
+		return ret;
+
+	tc956x_reset_deassert(chip, id, MAC_RESET_MAC);
+	tc956x_pma_init(td);
+	tc956x_reset_deassert(chip, id, MAC_RESET_XPCS);
+
+	return 0;
+}
+
+static void tc956x_mac_disable(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	u32 id = td->auxbus_data->mac_id;
+
+	tc956x_reset_assert(chip, id, MAC_RESET_MAC);
+	tc956x_reset_assert(chip, id, MAC_RESET_PMA);
+	tc956x_reset_assert(chip, id, MAC_RESET_XPCS);
+
+	tc956x_clock_disable(chip, id, MAC_CLOCK_ALL);
+	tc956x_clock_disable(chip, id, MAC_CLOCK_RX);
+	tc956x_clock_disable(chip, id, MAC_CLOCK_TX);
+	if (id)
+		tc956x_clock_disable(chip, id, MAC_CLOCK_RMII);
+}
+
+static void tc956x_mac_init_state(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	u32 id = td->auxbus_data->mac_id;
+
+	tc956x_clock_disable(chip, id, MAC_CLOCK_125M);
+	tc956x_clock_disable(chip, id, MAC_CLOCK_312_5M);
+
+	tc956x_mac_disable(td);
+}
+
+/*
+ * Override method for dwxgmac301_dma_ops->init_rx_chan
+ *
+ * This differs from the dwxgmac301_dma_ops->init_rx_chan by translating the DMA
+ * address for TC956x internal bus. The window that provides DMA access to PCI
+ * is linearly mapped at 0x10_0000_0000.
+ */
+static void tc956x_dma_init_rx_chan(struct stmmac_priv *priv,
+				    void __iomem *ioaddr,
+				    struct stmmac_dma_cfg *dma_cfg,
+				    dma_addr_t phy, u32 chan)
+{
+	dma_addr_t translated = phy + TC956X_SLV00_SRC_ADDR;
+
+	dwxgmac2_dma_init_rx_chan(priv, ioaddr, dma_cfg, phy, chan);
+
+	writel(upper_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
+	writel(lower_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
+}
+
+/* Override method for dwxgmac301_dma_ops->init_tx_chan */
+static void tc956x_dma_init_tx_chan(struct stmmac_priv *priv,
+				    void __iomem *ioaddr,
+				    struct stmmac_dma_cfg *dma_cfg,
+				    dma_addr_t phy, u32 chan)
+{
+	dma_addr_t translated = phy + TC956X_SLV00_SRC_ADDR;
+
+	dwxgmac2_dma_init_tx_chan(priv, ioaddr, dma_cfg, phy, chan);
+
+	writel(upper_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
+	writel(lower_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
+}
+
+/* Override method for dwxgmac210_desc_ops->set_addr */
+static void tc956x_desc_set_addr(struct dma_desc *p, dma_addr_t addr)
+{
+	dma_addr_t translated = addr + TC956X_SLV00_SRC_ADDR;
+
+	p->des0 = cpu_to_le32(lower_32_bits(translated));
+	p->des1 = cpu_to_le32(upper_32_bits(translated));
+}
+
+/* Override method for dwxgmac210_desc_ops->set_sec_addr */
+static void tc956x_desc_set_sec_addr(struct dma_desc *p, dma_addr_t addr,
+				     bool is_valid)
+{
+	dma_addr_t translated = addr + TC956X_SLV00_SRC_ADDR;
+
+	p->des2 = cpu_to_le32(lower_32_bits(translated));
+	p->des3 = cpu_to_le32(upper_32_bits(translated));
+}
+
+/*
+ * Use mac_setup to apply the override methods above.
+ *
+ * The memory for the modified ops structures is pre-allocated as part of
+ * struct tc956x_data.
+ */
+static int tc956x_mac_setup(void *apriv, struct mac_device_info *mac)
+{
+	struct stmmac_priv *priv = apriv;
+	struct stmmac_desc_ops *desc;
+	struct stmmac_dma_ops *dma;
+	struct tc956x_data *td;
+
+	td = priv->plat->bsp_priv;
+
+	/* dwxgmac301_dma_ops needs extending to provide DMA address translation */
+	dma = &td->dma;
+	*dma = dwxgmac301_dma_ops;
+	dma->init_rx_chan = tc956x_dma_init_rx_chan;
+	dma->init_tx_chan = tc956x_dma_init_tx_chan;
+	mac->dma = dma;
+
+	/* dwxgmac210_desc_ops also needs extending for the same reason */
+	desc = &td->desc;
+	*desc = dwxgmac210_desc_ops;
+	desc->set_addr = tc956x_desc_set_addr;
+	desc->set_sec_addr = tc956x_desc_set_sec_addr;
+	mac->desc = desc;
+
+	priv->hw = mac;
+
+	return dwxgmac2_setup(priv);
+}
+
+static int tc956x_pcs_init(struct stmmac_priv *priv)
+{
+	struct xpcs_regmap_config xpcs_regmap_cfg;
+	void __iomem *emac = priv->ioaddr;
+	struct regmap *xpcs_regmap;
+	void __iomem *xpcs_addr;
+	struct dw_xpcs *xpcs;
+
+	xpcs_addr = emac + DWMAC_XPCS_OFFSET;
+	xpcs_regmap = devm_regmap_init_mmio(priv->device, xpcs_addr,
+					    &xpcs_regmap_config);
+	if (IS_ERR(xpcs_regmap))
+		return PTR_ERR(xpcs_regmap);
+
+	xpcs_regmap_cfg.regmap = xpcs_regmap;
+	xpcs_regmap_cfg.reg_indir = true;
+
+	xpcs = devm_xpcs_regmap_register(priv->device, &xpcs_regmap_cfg);
+	if (IS_ERR(xpcs))
+		return PTR_ERR(xpcs);
+
+	xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
+	priv->hw->phylink_pcs = xpcs_to_phylink_pcs(xpcs);
+
+	return 0;
+}
+
+static struct phylink_pcs *tc956x_select_pcs(struct stmmac_priv *priv,
+					     phy_interface_t interface)
+{
+	return priv->hw->phylink_pcs;
+}
+
+static void tc956x_fix_mac_speed(void *bsp_priv, phy_interface_t interface,
+				 int speed, unsigned int mode)
+{
+	struct tc956x_data *td = bsp_priv;
+
+	tc956x_mac_configure(td, speed);
+	tc956x_pma_init(td);
+}
+
+static int tc956x_dwmac_suspend(struct device *dev, void *bsp_priv)
+{
+	struct tc956x_data *td = bsp_priv;
+
+	tc956x_mac_disable(td);
+
+	return 0;
+}
+
+static int tc956x_dwmac_resume(struct device *dev, void *bsp_priv)
+{
+	struct tc956x_data *td = bsp_priv;
+
+	return tc956x_mac_enable(td);
+}
+
+/* Called by tc956x_dwmac_probe(); return errors with dev_err_probe() */
+static int tc956x_dwmac_parse_dt(struct tc956x_data *td)
+{
+	struct device_node *mdio_node;
+	struct device *dev = td->dev;
+	struct device_node *np;
+
+	np = dev_of_node(dev);
+	if (!np)
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	/* Find the MDIO bus */
+	for_each_child_of_node(np, mdio_node) {
+		if (of_device_is_compatible(mdio_node,
+					    "snps,dwmac-mdio"))
+			break;
+	}
+
+	/* Pass the MDIO bus (if there is one) to the core driver */
+	if (mdio_node) {
+		td->plat->mdio_node = mdio_node;
+		td->plat->mdio_bus_data->needs_reset = true;
+	}
+
+	return 0;
+}
+
+static int tc956x_lookup_max_speed(phy_interface_t phy_interface)
+{
+	switch (phy_interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return SPEED_2500;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+/* Called by tc956x_dwmac_probe(); return errors with dev_err_probe() */
+static int tc956x_plat_dat_init(struct tc956x_data *td)
+{
+	struct plat_stmmacenet_data *plat;
+	phy_interface_t phy_interface;
+	struct device *dev = td->dev;
+	struct stmmac_axi *axi;
+	u32 speed;
+	int ret;
+	u32 i;
+
+	phy_interface = device_get_phy_mode(dev);
+	if (phy_interface < 0)
+		return -ENODEV;
+
+	/* The platform structure is allocated with devm_kzalloc() */
+	plat = stmmac_plat_dat_alloc(dev);
+	if (!plat)
+		return -ENOMEM;
+
+	ret = tc956x_lookup_max_speed(phy_interface);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "unsupported phy speed\n");
+	speed = ret;
+
+	plat->core_type = DWMAC_CORE_XGMAC;
+	plat->bus_id = td->auxbus_data->mac_id;
+	plat->phy_interface = phy_interface;
+	plat->mdio_bus_data = &td->mdio_bus_data;
+	/* Parent PCI device is used for DMA */
+	plat->dma_device = dev->parent;
+	plat->dma_cfg = &td->dma_cfg;
+	plat->dma_cfg->pbl = 32;
+	plat->dma_cfg->pblx8 = true;
+
+	/*
+	 * Our MAC clock rate is fixed at 125 MHz.  For XGMAC, clk_csr 0
+	 * represents "divide by 62" and gets the best rate under 2.5 MHz.
+	 */
+	plat->clk_csr = 0;	/* MDC clock = clk_csr_i / 62 */
+	plat->force_sf_dma_mode = 1;
+	plat->max_speed = speed;
+	plat->unicast_filter_entries = 32;
+
+	/*
+	 * TC956x has 8 RX queues but we observe significantly reduced RX
+	 * bandwidth if we don't have at least 8k FIFO space per queue, so
+	 * by default we avoid using all the queues.
+	 */
+	plat->rx_queues_to_use = 4;
+
+	/*
+	 * TX956x has 8 TX queues but only #0 to #3 work for general IP traffic.
+	 * For now we will limit the driver to only these queues.
+	 */
+	plat->tx_queues_to_use = 4;
+
+	/*
+	 * Oversized FIFOs result in reduced performance in bandwidth tests.
+	 * Limit them to 8KiB per queue, or the total available.
+	 */
+	plat->tx_fifo_size =
+		min(TC956X_TX_FIFO_KB, 8 * plat->tx_queues_to_use) * SZ_1K;
+	plat->rx_fifo_size =
+		min(TC956X_RX_FIFO_KB, 8 * plat->rx_queues_to_use) * SZ_1K;
+	plat->host_dma_width = 36;
+
+	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
+	plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
+
+	/* Default RX chan is set to queue index (0..rx_queues_to_use-1) */
+	for (i = 0; i < plat->rx_queues_to_use; i++)
+		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
+
+	for (i = 0; i < plat->tx_queues_to_use; i++) {
+		plat->tx_queues_cfg[i].weight = 12;
+		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
+
+		/* Only queues 5-8 support time-based scheduling on TC956X */
+		if (i >= 5)
+			plat->tx_queues_cfg[i].tbs_en = 1;
+	}
+
+	plat->fix_mac_speed = tc956x_fix_mac_speed;
+	plat->suspend = tc956x_dwmac_suspend;
+	plat->resume = tc956x_dwmac_resume;
+	plat->mac_setup = tc956x_mac_setup;
+	plat->pcs_init = tc956x_pcs_init;
+	plat->select_pcs = tc956x_select_pcs;
+
+	plat->bsp_priv = td;
+	plat->clk_ptp_rate = TC956X_PTP_CLOCK_RATE;
+
+	/* AXI Configuration */
+	axi = &td->axi;
+	axi->axi_lpi_en = 1;
+	axi->axi_wr_osr_lmt = 31;
+	axi->axi_rd_osr_lmt = 31;
+	/* All sizes (2^2..2^8) are supported */
+	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
+	plat->axi = axi;
+
+	plat->mac_port_sel_speed = speed;
+	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
+
+	td->plat = plat;
+
+	return 0;
+}
+
+/*
+ * The domain was created with IRQ_DOMAIN_FLAG_DESTROY_GC, so any mapped IRQs
+ * will be disposed when the domain is removed (when the device is destroyed).
+ */
+static int tc956x_stmmac_resources_init(struct tc956x_data *td,
+					struct stmmac_resources *res)
+{
+	struct irq_domain *irq_domain = td->irq_domain;
+	u32 i;
+
+	res->irq = irq_create_mapping(irq_domain, HWIRQ_EVENT);
+	if (!res->irq)
+		return -EINVAL;
+
+	for (i = 0; i < td->plat->tx_queues_to_use; i++) {
+		res->tx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_TX0 + i);
+		if (!res->tx_irq[i])
+			return -EINVAL;
+	}
+
+	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
+		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
+		if (!res->tx_irq[i])
+			return -EINVAL;
+	}
+
+	res->addr = td->auxbus_data->emac;
+
+	return 0;
+}
+
+static int tc956x_dwmac_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct stmmac_resources res = { };
+	struct device *dev = &adev->dev;
+	struct tc956x_data *td;
+	int ret;
+
+	td = devm_kzalloc(dev, sizeof(*td), GFP_KERNEL);
+	if (!td)
+		return -ENOMEM;
+
+	td->dev = dev;
+	td->auxbus_data = dev_get_platdata(dev);
+	if (!td->auxbus_data)
+		return dev_err_probe(dev, -EINVAL, "no platform data\n");
+
+	ret = tc956x_plat_dat_init(td);
+	if (ret)
+		return ret;
+
+	ret = tc956x_dwmac_parse_dt(td);
+	if (ret)
+		return ret;
+
+	td->irq_domain = tc956x_msigen_irq_domain_instantiate(td);
+	if (IS_ERR(td->irq_domain))
+		return dev_err_probe(dev, PTR_ERR(td->irq_domain),
+				     "failed to instantiate IRQ domain\n");
+
+	/* Put the MAC in a known initial state */
+	tc956x_mac_init_state(td);
+
+	ret = tc956x_stmmac_resources_init(td, &res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to initialize stmmac resources\n");
+
+	ret = tc956x_mac_enable(td);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable MAC\n");
+
+	ret = stmmac_dvr_probe(dev, td->plat, &res);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed stmmac probe\n");
+
+	return 0;
+}
+
+static void tc956x_dwmac_remove(struct auxiliary_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct net_device *ndev = dev_get_drvdata(dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct tc956x_data *td = priv->plat->bsp_priv;
+
+	stmmac_dvr_remove(dev);
+	tc956x_mac_disable(td);
+}
+
+static const struct auxiliary_device_id tc956x_dwmac_ids[] = {
+	{ .name = TC956X_PCIE_DRIVER_NAME "." TC956X_XGMAC_DEV_NAME, },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, tc956x_dwmac_ids);
+
+static struct auxiliary_driver tc956x_dwmac_driver = {
+	.name		= DRIVER_NAME,
+	.probe		= tc956x_dwmac_probe,
+	.remove		= tc956x_dwmac_remove,
+	.id_table	= tc956x_dwmac_ids,
+	.driver = {
+		.name	= DRIVER_NAME,
+		.pm	= &stmmac_simple_pm_ops,
+		.owner	= THIS_MODULE,
+	},
+};
+module_auxiliary_driver(tc956x_dwmac_driver);
+
+MODULE_DESCRIPTION("Toshiba TC956x PCIe Ethernet Network Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/soc/toshiba/tc956x-dwmac.h b/include/soc/toshiba/tc956x-dwmac.h
new file mode 100644
index 0000000000000..5ca39cf764be9
--- /dev/null
+++ b/include/soc/toshiba/tc956x-dwmac.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __TOSHIBA_TC956X_DWMAC_H__
+#define __TOSHIBA_TC956X_DWMAC_H__
+
+#include <linux/compiler_types.h>
+#include <linux/types.h>
+
+#define TC956X_PCIE_DRIVER_NAME	"tc956x_pci"
+
+#define TC956X_XGMAC_DEV_NAME	"dwmac-tc956x"
+
+/* Starting address of the space translated by the PCIe endpoint bridge */
+#define TC956X_SLV00_SRC_ADDR	0x0000001000000000ULL
+
+enum tc956x_reset_id {
+	MAC_RESET_MAC		= 7,
+	MAC_RESET_PMA		= 30,
+	MAC_RESET_XPCS		= 31,
+};
+
+enum tc956x_clock_id {
+	MAC_CLOCK_TX		= 7,
+	MAC_CLOCK_RX		= 14,
+	MAC_CLOCK_ALL		= 31,
+	MAC_CLOCK_125M		= 29,
+	MAC_CLOCK_312_5M	= 30,
+	MAC_CLOCK_RMII		= 15,	/* eMAC 1 only */
+};
+
+/**
+ * struct tc956x_dwmac_data - Structure passed to stmmac auxiliary devices.
+ * @chip:		Context pointer needed for reset and clock operations
+ * @emac:		I/O mapped address used by eMAC
+ * @emac_ctl:		I/O mapped address used for eMAC control
+ * @msigen:		I/O mapped address used by MSIGEN
+ * @msigen_irq:		IRQ number used by MSIGEN
+ * @rev_id:		Chip revision ID (for quirks)
+ * @mac_id:		Unique device ID (0 or 1)
+ *
+ * This structure is passed via platform data to the stmmac auxiliary devices.
+ */
+struct tc956x_dwmac_data {
+	const struct tc956x_chip *chip;
+	void __iomem *emac;
+	void __iomem *emac_ctl;
+	void __iomem *msigen;
+	unsigned int msigen_irq;
+	u8 rev_id;
+	u8 mac_id;
+};
+
+extern void tc956x_reset_clock_set(const struct tc956x_chip *chip, bool reset,
+				   bool reg0, bool set, u8 bit);
+
+static inline void tc956x_reset_assert(const struct tc956x_chip *chip,
+				       u8 mac_id, enum tc956x_reset_id id)
+{
+	tc956x_reset_clock_set(chip, true, !mac_id, true, (u8)id);
+}
+
+static inline void tc956x_reset_deassert(const struct tc956x_chip *chip,
+					 u8 mac_id, enum tc956x_reset_id id)
+{
+	tc956x_reset_clock_set(chip, true, !mac_id, false, (u8)id);
+}
+
+static inline void tc956x_clock_enable(const struct tc956x_chip *chip,
+				       u8 mac_id, enum tc956x_clock_id id)
+{
+	tc956x_reset_clock_set(chip, false, !mac_id, true, (u8)id);
+}
+
+static inline void tc956x_clock_disable(const struct tc956x_chip *chip,
+					u8 mac_id, enum tc956x_clock_id id)
+{
+	tc956x_reset_clock_set(chip, false, !mac_id, false, (u8)id);
+}
+
+#endif /* __TOSHIBA_TC956X_DWMAC_H__*/
-- 
2.51.0


