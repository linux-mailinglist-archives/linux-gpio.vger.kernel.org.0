Return-Path: <linux-gpio+bounces-34854-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH4uLpzE1Wkx9gcAu9opvQ
	(envelope-from <linux-gpio+bounces-34854-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 04:59:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BDC3B66A2
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 04:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D62853034DF5
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 02:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A864C36F41F;
	Wed,  8 Apr 2026 02:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="r67pmIvF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95C1366560;
	Wed,  8 Apr 2026 02:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775616942; cv=none; b=ffVnDBcy8nMomWfdvBW4Zk45gZGFOUN3D1KvKh+wvRCyd+JPF9+L1quBQfHvKUxCCRlerfkqIaQ7poc/IU4tvU/kUK5h90mhb/AsE0Crhpaho8WvvBuN903N4J8FKzElMrlpmcAJeH5E4Mj8Y6aq2+rktzBVNGdYtgrmLQNOVzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775616942; c=relaxed/simple;
	bh=0c/zh9AL9+FKEmJBDPRVLWMCvnzS5SzgjfQcEgpQHOk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=II3oj+ppF/yk/gbJNTh+ja/47CX1iszxU9t4bcYWddAspNfNkK0ivWcqZdLCMq8BCMyybgkCU25WlBGgzquvAhEjcomC8xek6ZlPUitHdWbGIJM8Ygy/MOnCiAhPU3mq9UoX9c1qHZ8Z+Do7+2iBmE2mPLct9WAQp7m3yGwaPC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=r67pmIvF; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6382qkBcB2349159, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775616766; bh=swGybb+9llsVg/eIQciZTiYrsdseWcN8ezhyU/fBs9k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=r67pmIvFfWZGBZ6/hTkhiLRUlTp4Spt0kNxBRcR+2ojCyeQoW47JNlg3w2X+e2snR
	 sQnYVhvsecUEkYSzyOm9NJdCQ8N5vM2eS+UdkSn/sI1tQgABJO8v33RvO3R04bSBLq
	 qIkhHUMtqvmNY8gY1HnJ8Eu/rLcSeWfNVAfSTV/QG1G2PWJHMZVuQrQz9aXvuvibmE
	 euYhcET2XCJlGk3L5Pg8AAIB4q/zKhpgUEdZXlem+YjYcPkIR8Cwu0EnG6op6V5/Mh
	 aLgVYhJFgl+Qovmkfsj62GJHhw8R7A9jMZ/7auEHaJSBF/3lpdDmnKvdJs25MPHTNV
	 aP2yBhPem60Mw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6382qkBcB2349159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2026 10:52:46 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 10:52:46 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 10:52:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 8 Apr 2026 10:52:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH v2 2/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Date: Wed, 8 Apr 2026 10:52:41 +0800
Message-ID: <20260408025243.1155482-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260408025243.1155482-1-eleanor.lin@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34854-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:email,realtek.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.1.92.12:email];
	DKIM_TRACE(0.00)[realtek.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9BDC3B66A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tzuyi Chang <tychang@realtek.com>

Add the device tree bindings for the Realtek DHC (Digital Home Center)
RTD1625 GPIO controllers.

The RTD1625 GPIO controller features a per-pin register architecture
that differs significantly from previous generations. It utilizes
separate register blocks for GPIO configuration and interrupt control.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Merge two memory regions into one.
- Add a description for the reg region.
---
 .../bindings/gpio/realtek,rtd1625-gpio.yaml   | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
new file mode 100644
index 000000000000..de873876b8c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
@@ -0,0 +1,82 @@
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
+    description: |
+      Memory region containing both interrupt control and GPIO
+      configuration registers in a contiguous address space.
+
+      For realtek,rtd1625-iso-gpio:
+        - Base + 0x0 ~ 0xff: Interrupt control registers
+        - Base + 0x100 ~ 0x397: GPIO configuration registers
+
+      For realtek,rtd1625-isom-gpio:
+        - Base + 0x0 ~ 0x1f: Interrupt control registers
+        - Base + 0x20 ~ 0x2f: GPIO configuration registers
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


