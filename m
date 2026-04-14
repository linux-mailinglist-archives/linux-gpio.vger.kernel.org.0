Return-Path: <linux-gpio+bounces-35151-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKlnMPNF3mnlpwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35151-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 15:49:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0C3FAB7A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 15:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00711304A208
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 13:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8833A3E6DFA;
	Tue, 14 Apr 2026 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="pl6kX1PA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11021134.outbound.protection.outlook.com [52.101.52.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB62B3E63A4;
	Tue, 14 Apr 2026 13:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174540; cv=fail; b=SHp7oBZm8Pc5L/bJ2QIqf8ZnHE5NsMg0E8KzprBnotK210faNJ9EPTfZuIoXkgqycDXBEHhJfD9TynyJjR7gz98X50Q9KBM9lbXRwYBCLb76cDVKUyhZsCJwxb95qyMKoy8Q0b8LT5witFwkq++xko+t53vn6o8Eiz5XO9QaRuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174540; c=relaxed/simple;
	bh=H/7tphw1p5GZxdnGAdY7vnJ7mxwpU3ssqyp1QKW7D6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCVb/XG5pxBa0MBJuUC9UWo0UOHCHFIv0Fum0K6fH7Vg8cyIyH0vgj72wfMSdL6aBM3fQOGtqoI1sYW7+dNK+LtmMjoOCiSafj42eOvj3WtbOdgUixuDv+HTN4lP2JorfD5RyIJ/cXrTMJxRMx+0jf/Z31/uofdjTPgl2x/AKFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=pl6kX1PA; arc=fail smtp.client-ip=52.101.52.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulk5FvUVX0YLYXtffStD2o4SSgJtuIaKm0mRTfRCIqgBp7A88iYVIRlncgtoYeoR3SZXRk3c1y1XlAsVRwniv+CuLSdRdO3hWLE/PQiGGHbY7BvY3qRT32MW+CDIVGaurjR35DZsZcrQLscvplrMjMwsp6y513mj5vllbpe40dEE6NJeXUGjgrjH7o45RJmN4MSm9f+Fm6u9GIvDUyB+6wKasxuqEa9UrC+mXcUgXPYrYu4I5VDR84gEpjzSulxCa+JHiOspeKzcFyol0WgdrrutKFY5S09xEFvfAMNiKZjSq1ktoXyqpaPvvNpIq8aFC8wbJvtIdLMA+lUcf3yFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smRf72d9WumPdiT/XIWzf73qFT/7KntAUpwF2ddiLUs=;
 b=NHotaoZy7fyJibFW8KemMVgGXXf68EOnzJvTzMTqBvXm1SZU5L9wNfBkQeyaM121DZ5xZIjYClSg9DkDINokKOaOSIhrLRPJ9r/IcIREVoL7zFXtmBv92liQM5QDiTYA4YXMerda2N18xFuyvdbhtkKrRzbCbqLbBLCjG49lHGWdChbPAaW7eEuFB88EBImFs49RR1zgum7LXqZPae7tL72Ey5w0r3I+wx+Bl5yBhvwYyyMQW6N3jYBOCEG76lcpSL/qVD5xsu/p0Q9N6i3lVf2v6GTKlyVaTl55rXhxVGZSgwA/b5Q7UfkWjOJg9MeUdVdb4WDVmIDILDyjQuBytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smRf72d9WumPdiT/XIWzf73qFT/7KntAUpwF2ddiLUs=;
 b=pl6kX1PAnFalfG0DeTS4c0gm/dQVfotVwllqpVUEIr8Y0R/XJLy+ohMvn6kYne0g9zgyrqp/bvu7UWsXIdFCHgE0TOs4/mcc+H/klLFI3+HimYfTdw+H3n2TR5EHj1RnR5TN/EUIz2H9mJK/eKO28z2cBA0XC8S5Uy45ewjdcYnaSIQNgO5ZUw9lUhYgVlDHieYvjkEi+3Wi1zSvxOeKloCL0Pxlgco7JzJtijEqSk3tfoZlV+vxrfykrh4To6t0WcjLHa741cM7NaXk/0c49REZ5R6mNTFJKfpsGNkZCjyBa4N4dOrTlMD08ZelZ8Pfok7kx/5Cyjwq/Xs4954GIA==
Received: from SN7PR18CA0004.namprd18.prod.outlook.com (2603:10b6:806:f3::13)
 by SJ0PR18MB3898.namprd18.prod.outlook.com (2603:10b6:a03:2e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 13:48:53 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:f3:cafe::f1) by SN7PR18CA0004.outlook.office365.com
 (2603:10b6:806:f3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Tue,
 14 Apr 2026 13:48:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 14 Apr 2026 13:48:53 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 638474186B59;
	Tue, 14 Apr 2026 06:48:51 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 14 Apr 2026 06:48:32 -0700
Subject: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776174532; l=3398;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=H/7tphw1p5GZxdnGAdY7vnJ7mxwpU3ssqyp1QKW7D6E=;
 b=NkDfTTRAq0DF26cvYyFWrZQdoPAnIjCcmzZLMkDSC/quUivjWhiYwxa/TRR1naPdR7ITrXISl
 C1kUWdw7dFbAYSfLEfQj8tpjt2/KQ1DICEtgPrPIHjJdQhEVvP7/Z36
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|SJ0PR18MB3898:EE_
X-MS-Office365-Filtering-Correlation-Id: 18087240-ab17-4232-b63b-08de9a2c90e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|30052699003|1800799024|36860700016|376014|921020|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EwkqRO38EN5spTKJO8qOVxx8HpBxSiO+lhPF/Am6C5KJc6sinQCMWGsu9FZ3w0m2pqpOWEXHr0qZkTSYd8fJJoF/JSUCRlZB6gZV6UjvdRVxo99ubQD9ub6wJsg607huGjl8TE5wiVxVkFfuRP1+Q4VSLj3CnSnCwosxBstk9UwwJz968OHhePtCC9pUUA1kfM8P7Kyv/fug83lu2zK9vI12/34zxOXOMgTLz8rGMh3quaClYc3SD5zpY42/xWUu38qiJ6tijM7IW9KNE8sslSOWKwkQPCRVth+rlN7o5icvrxsNvXnA6JOVKYKVnw1nSSB0RYxJlK1rkXqm2Dt57oqtm+UPKLf8fqsaZNdaRcPlBbRF/i+MOyKmh5zktVUU5ULgX9D8i68F7de0ugvxdOwiVeyZieS/acrINxtoL49SIZWIxRZfQ3ZP7w5QIm/XZaH8Qg4bjhgCq6vUUHFkh6pMArFYwbGEo3o5CHD22ATCT8AAu8GilSpdlQB+tdMaGkNTpHzTAIi0HDRdsAdD1VbCN6YaqfWxleYbWSiJ4EOVOic379PpM9KZGlJFeL3EEAwwVvfCE8DjMNkrcY1Y94uokTZfEfV1uXNUQvsMvMnGF6DrA0ZPLaW9XJCXS0dDZfpe0NP4SzhH5zY9LBPhsbolnR8tiMRH4O8VtRZrJ+XPfFZxPgSPAUYIt2O/XUX8eYz6BTQejp/TSh+mETZIQqxaUzvsryBdj3aKP9hT1kh37VDgPaHmsD4AKh399xSnTaTBU+noOokwq8VRN4MIQA==
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(30052699003)(1800799024)(36860700016)(376014)(921020)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dm1s41BSMtgKWw7XOO5/hLg4wKRhszh631SBZKV3yI0YBGM6qr5vP3PuMXBkpP23hV+H1zN4K9y+8JjKQHnPqpxkICxonRMSdLrMjXVvf3T3oG1meFozoYSRREfGeRYraHBjQw4WN2kCpzXeaL7JfOoIaDFvp8oAP1mHHgTNX0r0D1tFK+eGNR124cnp8v5ql60y+U/81rRi086jw2TRa6+RUUvHVTVIiIJca/jp+f70KjtWrzOp/mTF/gXLKhoum5DfxK29BRnh0kD53IcIbTmYM1gEp6NnPwILk2izj0L0dlnqBzbFzg+L3wcWtF7eoytVp5biRlb9OC2K4acuN4LdJ4PXltZYMNROTiT6J8EEMtduGjp5riPmAd/Dw8TX7kRbFbTdiJ6FGF9OxhLhfubFgJ5bnAPPMZV4EqkbiE3pIF6Tc2I4yTfbET8i+XmB
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:48:53.2390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18087240-ab17-4232-b63b-08de9a2c90e9
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB3898
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35151-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:dkim,axiado.com:email,axiado.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[axiado.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axiado.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pstepanovic@axiado.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DD0C3FAB7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree binding for the Axiado SGPIO controller.

The SGPIO controller provides a serialized interface for
controlling multiple GPIO signals over a limited number of
physical lines. It supports configurable data direction and
interrupt handling.

The binding describes the properties required to instantiate
the controller and register it as a GPIO provider.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../devicetree/bindings/gpio/axiado,sgpio.yaml     | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml b/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml
new file mode 100644
index 000000000000..1533446d69f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/axiado,sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado SGPIO Controller
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - SriNavmani A <srinavmani@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description: |
+  The SGPIO controller provides a serialized interface for controlling
+  multiple GPIO signals over a limited number of physical lines.
+  It supports configurable data direction and interrupt handling.
+
+properties:
+  compatible:
+    enum:
+      - axiado,sgpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  design-variant:
+    description: SGPIO design variant size in bits (e.g. 128 or 512).
+    enum: [128, 512]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  ngpios:
+    description: The number of gpios this controller has.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  bus-frequency:
+    description: The SGPIO shift clock frequency in Hz.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  apb-frequency:
+    description: The APB bus frequency in Hz.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  dout-init:
+    description: Initial values for the dout registers.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - design-variant
+  - ngpios
+  - bus-frequency
+  - apb-frequency
+  - dout-init
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    sgpio@a000 {
+            compatible = "axiado,sgpio";
+            reg = <0xa000 0x800>;
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupt-parent = <&gpio6>;
+            interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+            design-variant = <128>;
+            ngpios = <128>;
+            bus-frequency = <1000000>;
+            apb-frequency = <100000000>;
+            dout-init = <0x00300000 0x00006371 0x00003800 0x00000000>;
+    };

-- 
2.34.1


