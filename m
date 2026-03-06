Return-Path: <linux-gpio+bounces-32666-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCoILq/MqmnwXAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32666-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 13:46:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B887220EAA
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 13:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D38F33051DD0
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 12:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8D0390C8C;
	Fri,  6 Mar 2026 12:42:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10176285C88;
	Fri,  6 Mar 2026 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800942; cv=none; b=MGaBJykt7hZpENVQYdP6nuuXQ5IhIlPdenUKAn5k4uJbNx9kXKfNjys2LvHzjiqmq58b/pKCezRSUrBwZvB2vAtH3u41+H1KdlIvxbLaccIFWVzOQlpuan+3LecM1Xk9KxOwUUAuGpKLgnhBXS3Um1CTdvR/K4fD0yqQunz1YCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800942; c=relaxed/simple;
	bh=mPT8n+MaX4Lh4CkPfpwTkyH556XOL8xul6h5uB8F66k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=maX0PENxv34e2bNcf5wq22fZRbsxMCQSjBBV0h3Hdb1ke7Jn7nD5AciyyvyDA/NWNHoDZV9mz1Ejonf2R5VB83OIfMlV/91HFvHvL1qqAjIQvggvpP3FOVWDONubRbKpQQxJvA+GyU4Mc+NwTvncen5QuzNGg2GMaT79tlnDqHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Mar
 2026 20:42:14 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 20:42:14 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 6 Mar 2026 20:40:26 +0800
Subject: [PATCH v4 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260306-upstream_pinctrl-v4-2-ad4e8ab8b489@aspeedtech.com>
References: <20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com>
In-Reply-To: <20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <linux-clk@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772800933; l=3826;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=mPT8n+MaX4Lh4CkPfpwTkyH556XOL8xul6h5uB8F66k=;
 b=r8CRLYKKssCEgJyYltzECKcfCQ1H2FB/QUpDzWdO0pUk13xIh9akUiRbohD2istSQDNo3E1/7
 EcIKmmVOjd8AYue9aWrT6NEiTm+cHgwa6L3AYUhU0L1VaIzq78lkaHm
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Queue-Id: 5B887220EAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32666-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,aspeedtech.com:mid,aspeedtech.com:email,devicetree.org:url]
X-Rspamd-Action: no action

Add a device tree binding for the pin controller found in the
ASPEED AST2700 SoC0.

The controller manages various peripheral functions such as eMMC, USB,
VGA DDC, JTAG, and PCIe root complex signals.

Describe the AST2700 SoC0 pin controller using standard pin multiplexing
and configuration properties.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
new file mode 100644
index 000000000000..caf8616c70e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 SoC0 Pin Controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description:
+  The AST2700 features a dual-SoC architecture with two interconnected SoCs,
+  each having its own System Control Unit (SCU) for independent pin control.
+  This pin controller manages the pin multiplexing for SoC0.
+
+  The SoC0 pin controller manages pin functions including eMMC, VGA DDC,
+  dual USB3/USB2 ports (A and B), JTAG, and PCIe root complex interfaces.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-soc0-pinctrl
+
+patternProperties:
+  '-state$':
+    type: object
+    allOf:
+      - $ref: pinmux-node.yaml#
+      - $ref: pincfg-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum:
+          - EMMC
+          - JTAGDDR
+          - JTAGM0
+          - JTAGPCIEA
+          - JTAGPCIEB
+          - JTAGPSP
+          - JTAGSSP
+          - JTAGTSP
+          - JTAGUSB3A
+          - JTAGUSB3B
+          - PCIERC0PERST
+          - PCIERC1PERST
+          - TSPRSTN
+          - UFSCLKI
+          - USB2AD0
+          - USB2AD1
+          - USB2AH
+          - USB2AHP
+          - USB2AHPD0
+          - USB2AXH
+          - USB2AXH2B
+          - USB2AXHD1
+          - USB2AXHP
+          - USB2AXHP2B
+          - USB2AXHPD1
+          - USB2BD0
+          - USB2BD1
+          - USB2BH
+          - USB2BHP
+          - USB2BHPD0
+          - USB2BXH
+          - USB2BXH2A
+          - USB2BXHD1
+          - USB2BXHP
+          - USB2BXHP2A
+          - USB2BXHPD1
+          - USB3AXH
+          - USB3AXH2B
+          - USB3AXHD
+          - USB3AXHP
+          - USB3AXHP2B
+          - USB3AXHPD
+          - USB3BXH
+          - USB3BXH2A
+          - USB3BXHD
+          - USB3BXHP
+          - USB3BXHP2A
+          - USB3BXHPD
+          - VB
+          - VGADDC
+
+      groups:
+        enum:
+          - EMMCCDN
+          - EMMCG1
+          - EMMCG4
+          - EMMCG8
+          - EMMCWPN
+          - JTAG0
+          - PCIERC0PERST
+          - PCIERC1PERST
+          - TSPRSTN
+          - UFSCLKI
+          - USB2A
+          - USB2AAP
+          - USB2ABP
+          - USB2ADAP
+          - USB2AH
+          - USB2AHAP
+          - USB2B
+          - USB2BAP
+          - USB2BBP
+          - USB2BDBP
+          - USB2BH
+          - USB2BHBP
+          - USB3A
+          - USB3AAP
+          - USB3ABP
+          - USB3B
+          - USB3BAP
+          - USB3BBP
+          - VB0
+          - VB1
+          - VGADDC
+
+required:
+  - compatible
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: false

-- 
2.34.1


