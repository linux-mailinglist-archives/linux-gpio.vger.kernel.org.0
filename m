Return-Path: <linux-gpio+bounces-36640-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIDGM7SgAmpwvAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36640-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 05:38:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D9C5195EC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 05:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0623D30799DF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 03:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6038628505E;
	Tue, 12 May 2026 03:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="PH/ibe10"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98442F83A2;
	Tue, 12 May 2026 03:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556899; cv=none; b=UMf1J66PWhfJS0BM7Z7HlAnoNyGGj/DhPdwzKVyf/DhW203v6Ynbf9HQ/2tx8tPO1+xDcjpBaSoWVhQN4Kc0qVG91QrfNEx4kjWQL0rbXB1yZt1hk1RQRtLEcN+lwEuGFQmzpwZsXjn5lCu+l0YxUhWv2pqGbUv68TOiRnPKEHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556899; c=relaxed/simple;
	bh=ZhdPSsqU1VtoN3zjMNuxTnfCBHFJ8NuxN7BaGty72eo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oX/iepNlY+mWUaJuzKUcBbimm3ypyFNdONJkl94iJOzOglokISO9ff734Pr5js+eKavZSuHeSYmuabh4smmfQ7j+p2LCcbmfyid6LTCp9oQvnViAAW+Ozy0ExXC+X6BumcVSsV5Y/dFUlSvbGD0NE/aMuFMzVh1Dg8whqaskhZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=PH/ibe10; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64C3XJoF43571941, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778556799; bh=LtdXnQEVIb6c5aCwt7NTASRXJz0sr0Gu7xDW8knSUp0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=PH/ibe10a+mefQYnoIHyfTzenlMWsYQCsiyitA/1ih68ubpjh4k6+k9o7bZ0qieRw
	 PaDYkv2kH4AfQH0apvmW2y0R3AmXhvbyZx8kCVGVYAqtdcNTKffIieYTAIfAu73WNc
	 bG74IX0xoiIyGCHxctQB/gfrzLgQWr+UE97QgqCUaAzPbpSBx/DvdXDPjK2hasHQRb
	 xnfYO3PFRt+myy9gaBzM391GhMO4sOeVP0avb7ByxvJD+zwVm9a/LkFGNMi70CBzCT
	 6SA5VN1OvC6fQGIztGBzOIne5eXDRVhKHC2EbrBGio+kOOLzp6DuJbtlGM69b/zBDt
	 a/ZrCvPRA9YGg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 64C3XJoF43571941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 May 2026 11:33:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:19 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:19 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 12 May 2026 11:33:19 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <wbg@kernel.org>, <mathieu.dubois-briand@bootlin.com>,
        <mwalle@kernel.org>, <lars@metafoo.de>, <Michael.Hennerich@analog.com>,
        <jic23@kernel.org>, <nuno.sa@analog.com>, <andy@kernel.org>,
        <dlechner@baylibre.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 5/7] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Date: Tue, 12 May 2026 11:33:15 +0800
Message-ID: <20260512033317.1602537-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512033317.1602537-1-eleanor.lin@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Queue-Id: 77D9C5195EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36640-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[realtek.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,realtek.com:email,realtek.com:mid,realtek.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,0.1.92.12:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Tzuyi Chang <tychang@realtek.com>

Add the device tree bindings for the Realtek DHC (Digital Home Center)
RTD1625 GPIO controllers.

The RTD1625 GPIO controller features a per-pin register architecture
that differs significantly from previous generations. It utilizes
separate register blocks for GPIO configuration and interrupt control.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../bindings/gpio/realtek,rtd1625-gpio.yaml   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
new file mode 100644
index 000000000000..f13c910b73c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Realtek Semiconductor Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/realtek,rtd1625-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC RTD1625 GPIO controller
+
+maintainers:
+  - Tzuyi Chang <tychang@realtek.com>
+
+description: |
+  GPIO controller for the Realtek RTD1625 SoC, featuring a per-pin register
+  architecture that differs significantly from earlier RTD series controllers.
+  Each GPIO has dedicated registers for configuration (direction, input/output
+  values, debounce), and interrupt control supporting edge and level detection
+  modes.
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtd1625-iso-gpio
+      - realtek,rtd1625-isom-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Interrupt number of the assert GPIO interrupt, which is
+                     triggered when there is a rising edge.
+      - description: Interrupt number of the deassert GPIO interrupt, which is
+                     triggered when there is a falling edge.
+      - description: Interrupt number of the level-sensitive GPIO interrupt,
+                     triggered by a configured logic level.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-ranges
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@89100 {
+      compatible = "realtek,rtd1625-isom-gpio";
+      reg = <0x89100 0x30>;
+      interrupt-parent = <&iso_m_irq_mux>;
+      interrupts = <0>, <1>, <2>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      gpio-ranges = <&isom_pinctrl 0 0 4>;
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
-- 
2.34.1


