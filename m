Return-Path: <linux-gpio+bounces-24923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B2EB33EE1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 14:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDCC1487528
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 12:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689A72F1FF6;
	Mon, 25 Aug 2025 12:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="joOM4RsX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9092EFD9C
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123653; cv=none; b=hPii3ERTlWGASQq1owxuErFM4DXh4e1XoW0OahQH0oFjViSqazTeEI5Bog5J844yPKScGkD+FQMUYDYfWFyzGO8N/R6dLm/QJehsWJ1v5AKgHIcx6A8ZW94no3iWsEPkWH7f1dDH+JwspAx/1kGdizJO6WPfMDusgvIWXLFJL6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123653; c=relaxed/simple;
	bh=0Il8Nt1kybn5uGMkxQ44SRJa+gR1NDLoFX8RrwK2pE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=oA+7mkqGEtPoKAQ1VUtwwrl/sy/oV4dAKHih482xRo6dNYN9lAz1t43ZEqRgeUtTQSWCmUcaTVdMxjMd54JcvJUUySmw4rH1fuYH0MuLHCqN4Kyh9o/upBWYwYYy4QzQrsk7L/WUFo5NDgxjvoeNWNjB/iVIkEMaImUw71N+Y+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=joOM4RsX; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825120727epoutp048ce2e075530c7cbd89fc97d6c110b2dc~fASc5FgtH0996509965epoutp04b
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 12:07:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825120727epoutp048ce2e075530c7cbd89fc97d6c110b2dc~fASc5FgtH0996509965epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123647;
	bh=Ei/NeTCCzsFUiMaHhKgEEWTgoZdYOJOjSv/L+yVAyog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=joOM4RsXPKxZJbgEAoQtFhEAU4dqLaJWtESlDxyQtJiK0hIxlwGuEKU/ol9+tn0N/
	 oiai/2zSAwnY1pk2kD3oUyqqJbeIpG7mqRwL7mUus2piMpxLjywmwS3VWZKc7jZSzB
	 EbFkRgUr3JId2uTs17sYSSVAyg2c+wxfuiI0QzrU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250825120726epcas5p28620320dcbcb2688312536c5ea44d50b~fAScPJ0Cn1102111021epcas5p2I;
	Mon, 25 Aug 2025 12:07:26 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9V0Y75Rrz6B9m5; Mon, 25 Aug
	2025 12:07:25 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250825120725epcas5p36cdf2c4e839db307f1cc0dc81346b913~fASazDxdW2789627896epcas5p3h;
	Mon, 25 Aug 2025 12:07:25 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120720epsmtip2db3d64839a45053623581dab6453fdbc~fASWRSwAH0172901729epsmtip2n;
	Mon, 25 Aug 2025 12:07:20 +0000 (GMT)
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
Subject: [PATCH v3 06/10] dt-bindings: arm: Convert Axis board/soc bindings
 to json-schema
Date: Mon, 25 Aug 2025 17:14:32 +0530
Message-Id: <20250825114436.46882-7-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250825114436.46882-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250825120725epcas5p36cdf2c4e839db307f1cc0dc81346b913
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120725epcas5p36cdf2c4e839db307f1cc0dc81346b913
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120725epcas5p36cdf2c4e839db307f1cc0dc81346b913@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Convert Axis SoC bindings to DT schema format using json-schema.
Existing bindings supports ARTPEC-6 SoC and board.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
index 000000000000..f9c218dc6883
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


