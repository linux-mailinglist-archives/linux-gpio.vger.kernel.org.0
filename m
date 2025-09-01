Return-Path: <linux-gpio+bounces-25273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE6B3D8F9
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 07:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B81A3BB2F7
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 05:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BB7242917;
	Mon,  1 Sep 2025 05:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Pi5r/L/S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A33253B58
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 05:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756705385; cv=none; b=n5mP5jkSog6gNBzmZKLsila2fDR+dT9uctp6PHeB16+mpQ9GSjpqq+C3LMpmhEqpknp8fYrCLuzPWV8+2VWwUajYhFciJFd6Rnm5Yg9VMhHrFVL8sJZ+3pDjDLu1NO6xATZWlm6mj8iVu66Vh0TzKb5WG1Ltp7hMolJrdTQN5xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756705385; c=relaxed/simple;
	bh=rbBy0w9M6q9x3ha5J9MDoFowYJp2wd6lE8hvb+1vwKg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=uFjdcMHwuRM/uRBjCqt1dnY+W4LiQ2qknKsfkl1mwbmF2bKoO2+OGnYccSIY2IFrNMIDBjmKcMgLH145Y2hXVLNkYGwy7n2WNMGXvbmAqPtZdAJCrOWNxF4UqcMKzDAFRt1qDDXwogGq6Mc1/jxZ53oSC8HFakFRS6RXJ0Dvlqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Pi5r/L/S; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250901054301epoutp045b265efef3c7e2b4526d965eb38bfb9d~hEjy162az0450104501epoutp04D
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 05:43:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250901054301epoutp045b265efef3c7e2b4526d965eb38bfb9d~hEjy162az0450104501epoutp04D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756705381;
	bh=yQuDkkBEvyY5Pt7iRYQ2Pcj3famUClF/QwXS+CmFsW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pi5r/L/Se0I0CtOXS/4skK3VqXFYhPnKZpEDhSzobqC9wV4j2+cuodB3LWK8yKcCE
	 X5TriumQfXX8YV5Vx9SZFq4NN9zquDwVEiffnRNUTQTCFfbWV84Q/yFcFuz7iGaMiO
	 OM2sturRLnC4gHN9Dld2x3Ly3mgJsU4D4oAe7Gf8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250901054300epcas5p39dfcf5e8ee8f8217a7e012656831cdb3~hEjx-nab_2113321133epcas5p3D;
	Mon,  1 Sep 2025 05:43:00 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cFd7l5BBWz6B9mB; Mon,  1 Sep
	2025 05:42:59 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250901054259epcas5p13dfe6ccb7759af018a07403ceb1e86f4~hEjwhx9hK2199821998epcas5p1X;
	Mon,  1 Sep 2025 05:42:59 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054254epsmtip2cd39da9df11ba5a00e247f88f522f66d~hEjsS3DyO0761907619epsmtip2y;
	Mon,  1 Sep 2025 05:42:54 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, ravi.patel@samsung.com,
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com,
	dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 5/6] arm64: dts: axis: Add ARTPEC-8 Grizzly dts support
Date: Mon,  1 Sep 2025 10:49:25 +0530
Message-Id: <20250901051926.59970-6-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250901054259epcas5p13dfe6ccb7759af018a07403ceb1e86f4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054259epcas5p13dfe6ccb7759af018a07403ceb1e86f4
References: <20250901051926.59970-1-ravi.patel@samsung.com>
	<CGME20250901054259epcas5p13dfe6ccb7759af018a07403ceb1e86f4@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

From: SeonGu Kang <ksk4725@coasia.com>

Add initial devcie tree for the ARTPEC-8 Grizzly board.
The ARTPEC-8 Grizzly is a small board developed by Axis,
based on the Axis ARTPEC-8 SoC.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 arch/arm64/boot/dts/exynos/axis/Makefile      |  4 +++
 .../boot/dts/exynos/axis/artpec8-grizzly.dts  | 35 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/axis/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts

diff --git a/arch/arm64/boot/dts/exynos/axis/Makefile b/arch/arm64/boot/dts/exynos/axis/Makefile
new file mode 100644
index 000000000000..ccf00de64016
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_ARTPEC) += \
+	artpec8-grizzly.dtb
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts b/arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts
new file mode 100644
index 000000000000..5ae864ec3193
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-8 Grizzly board device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+/dts-v1/;
+#include "artpec8.dtsi"
+#include "artpec8-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+/ {
+	model = "ARTPEC-8 grizzly board";
+	compatible = "axis,artpec8-grizzly", "axis,artpec8";
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		stdout-path = &serial_0;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&osc_clk {
+	clock-frequency = <50000000>;
+};
-- 
2.49.0


