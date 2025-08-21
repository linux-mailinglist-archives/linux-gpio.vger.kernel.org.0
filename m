Return-Path: <linux-gpio+bounces-24747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B0B2F84B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0748AC3BE4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 12:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6FE31E116;
	Thu, 21 Aug 2025 12:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tn/XqV/e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029DB31DDB3
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780051; cv=none; b=j9nrpHu9Xh+e8PaD7EcXsE4QmEFGH2Vc6Ta+0DRgIozu0Y7gHMmtzMMmL+4boT4gE/ts6Czstac073T1uPUJhd+s2hJMf4wRJoFlSrNDqpR1muqSfBbJfVbRMLy0lpCz9cQdWyeRHBMBrVq7dYgTAmHfJwKw7yFIsd9fzT3M6v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780051; c=relaxed/simple;
	bh=H20kbB01HSzoou3Dd20sVeX/yRKosnJk2jlg+ScneE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=un+qwLa7NSa7HgvhrfNzSu/5dmnkiwe6xQuA8ClGCn794LpzVBQn3o7qRf2feCtEX7TM5tk3E9b6njTpBaL8I2jaiyJFQe5H1BXZOGS3I+cxJ1tHgWY7E++b5PhiKsqPJcLdDNd3zkdaS0xsRRwslESGsZLXgDp2Izr6nNPFlGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tn/XqV/e; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250821124047epoutp01e89b81c95b93d26f75346b94cb16430b~dyKaMXnRP2177121771epoutp01B
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250821124047epoutp01e89b81c95b93d26f75346b94cb16430b~dyKaMXnRP2177121771epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780047;
	bh=n0Q2ttgMVHkIxH49XCSYelsE3H+73bDXAyTbXoEJkr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tn/XqV/e5+jmbTyhKmR1PbzX29X20VRgnztrwcaa50D4FmsUh6tG/7ZB9dKQJUniX
	 cMvtM2lI+PxgrVYUWoeKc0tqJaYDYgJJcvkpc1AQqbDwSqi7Fo4tvnWdMbEVxNAMVt
	 L9ddwMv8+6nbBWivHqYkURq3ZT2lkOmnqUhhG36E=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250821124046epcas5p413589b3804274e9bb1deb17aa2a8f138~dyKZidys31461614616epcas5p4w;
	Thu, 21 Aug 2025 12:40:46 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c72ws5GWLz6B9m8; Thu, 21 Aug
	2025 12:40:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250821124045epcas5p37f0a50fb18e6f468a7c57ab406795419~dyKYGTw991593415934epcas5p3b;
	Thu, 21 Aug 2025 12:40:45 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124040epsmtip2e6f144e3f4eeb6ec40735fde574e01f0~dyKTiv-3B2604326043epsmtip2L;
	Thu, 21 Aug 2025 12:40:40 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v2 06/10] dt-bindings: arm: Convert Axis board/soc bindings
 to json-schema
Date: Thu, 21 Aug 2025 18:02:50 +0530
Message-ID: <20250821123310.94089-7-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821123310.94089-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124045epcas5p37f0a50fb18e6f468a7c57ab406795419
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124045epcas5p37f0a50fb18e6f468a7c57ab406795419
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124045epcas5p37f0a50fb18e6f468a7c57ab406795419@epcas5p3.samsung.com>

Convert Axis SoC bindings to DT schema format using json-schema.
Existing bindings supports ARTPEC-6 SoC and board.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 .../devicetree/bindings/arm/axis.txt          | 13 ---------
 .../devicetree/bindings/arm/axis.yaml         | 29 +++++++++++++++++++
 2 files changed, 29 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml

diff --git a/Documentation/devicetree/bindings/arm/axis.txt b/Documentation/devicetree/bindings/arm/axis.txt
deleted file mode 100644
index ebd33a88776f..000000000000
--- a/Documentation/devicetree/bindings/arm/axis.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-Axis Communications AB
-ARTPEC series SoC Device Tree Bindings
-
-ARTPEC-6 ARM SoC
-================
-
-Required root node properties:
-- compatible = "axis,artpec6";
-
-ARTPEC-6 Development board:
----------------------------
-Required root node properties:
-- compatible = "axis,artpec6-dev-board", "axis,artpec6";
diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
new file mode 100644
index 000000000000..610806d87416
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axis.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axis ARTPEC platforms
+
+maintainers:
+  - Jesper Nilsson <jesper.nilsson@axis.com>
+  - linux-arm-kernel@axis.com
+
+description: |
+  ARM platforms using SoCs designed by Axis branded as "ARTPEC".
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Axis ARTPEC-6 SoC board
+        items:
+          - enum:
+              - axis,artpec6-dev-board
+          - const: axis,artpec6
+
+additionalProperties: true
+
+...
--
2.49.0


