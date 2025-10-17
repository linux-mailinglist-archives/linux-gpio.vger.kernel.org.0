Return-Path: <linux-gpio+bounces-27235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE480BE6FE9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 09:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2EEDE35B42A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 07:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA86A2561AE;
	Fri, 17 Oct 2025 07:46:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023143.outbound.protection.outlook.com [52.101.127.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE01D54FA;
	Fri, 17 Oct 2025 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760687214; cv=fail; b=iZcUC5qAkAbQICqENzonoZTJl2DGJQvtrB0y7a6pAH/Qd2krFFOAC+90+ZN1Bm/nz+2LWa5MqrwiJTeJHJAw7O4SUby4yZ9pqFWcfGfrio8j9azz1OFGCSXCIi+KX0EStZHgPttCCTq5GK4nPIYcUoVcUfcwADr1hvp6qQIQOYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760687214; c=relaxed/simple;
	bh=hhQLAPjAolupjJcmlALiY7JSMch7Dr+HDk07l7y2yf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XA7Ts+KfWxY/e2/AAavSKTgaA7pQXVC7ZoDEAH1INXwq7RWyH6gVf5KIlNawEPanTkgOys3vByat3Q0gAoXR9Ml3vYPv5RyOQ7aVtd1/pBeXzqnz915CLSGW+Y0sC54JmuUM/tycdXha0cifYAXB8a3238Eaoiafyh/edix6JMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlxzARgcHiLkZEgtp0Cvyq77KS/eKWhzGTk3RjWZLe5NsJUbIrmS+YK8IiANzS9ro1rwo6CfTSBWVO9SF+K7vr4t7zFwYUcMVbV8yDGmq728GFSCfOMu5ggMf6echQx20Mm6OHf21TaAFeqzOH9PodphbPMLHKsGKo934Dlt67GbmPf+a3RoHmM9/6zHJ/zYV5bA7f/FQHaPFcGYIftwLSd0hsznXmEKpUEzjuuB+5WJv5FPl6m7uosSG6WNk9drgzxY8uTN70WgsDRwOVqDveJLXlx9ZJX4J26627BQyMlmD66WInez9WqkrBADja770qstrZnFf61uuxELdj5Z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMw/BLc6WyU37noQ/Egq3GTvTz6IcvJz4RAiUujLg10=;
 b=e81XaogpmBMkZ3v/2IkV6/ZsQskyfiOApLdX29iOiyzXYdio2ewRDpqbGEHHjQlSO6Inxalf2iguTpQVPMpIy672IRVgDCFrbp+Nj5/064biBS4tH7N8zgIbsncg9rPomhRjmWF9MDiEWT6yZ8OFKdkocx2jsngeaijLqhy+g2BQGEoH4W/6Pk+k0NJn0QK4WuJFWtTfuQBXsSq/lh4tsqOOX3aD7Za+oEbo/zlB5Tqrn43vE4QQyBxbK2darGPKwbx/cJEb/JW5FNz0HDEAEURKtUqsXGwJizfWZDzUnGpm85jRSiUaPgLZ6YDgzcVcoIo0pjQxtCv4VXeXJNdnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0029.apcprd02.prod.outlook.com (2603:1096:4:1f4::20)
 by KL1PR06MB7011.apcprd06.prod.outlook.com (2603:1096:820:11b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 07:46:47 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:1f4:cafe::7c) by SI1PR02CA0029.outlook.office365.com
 (2603:1096:4:1f4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 07:46:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 07:46:47 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 865FF40EEE9D;
	Fri, 17 Oct 2025 15:46:46 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v4 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Date: Fri, 17 Oct 2025 15:46:44 +0800
Message-ID: <20251017074646.3344924-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251017074646.3344924-1-gary.yang@cixtech.com>
References: <20251017074646.3344924-1-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|KL1PR06MB7011:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7289a4b8-ca2d-4832-8940-08de0d515331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JZ0WNSs8uYNHlEzAJCk3TyaiOsqBwKr/kFZTDuaeFm69XG7QDwoF5XaPjuHy?=
 =?us-ascii?Q?zQjerovRyWQ8JNwl6F/G+uog73LRnlyuXEvBPe6L3+T0OxJzSqcm27BkmfwM?=
 =?us-ascii?Q?MTPawuxGOjCHqBpAL1BcFN5pmmp0zGBIOTdY9GmrATQ9xarYJIYmjkTZ1hSa?=
 =?us-ascii?Q?exYva9Wpcpsk0sLHIfgXp941S6LMTe80g99elZfvEQEgxdICSHVxnYIP1VS+?=
 =?us-ascii?Q?4do/Q/wurQnc1bvvBwF2F+vUjlROpIhq2IjfYL3Ybn5qp5cByBs3sr62kqVq?=
 =?us-ascii?Q?QFKKLVZ9Ur2zxC1J6URAckbAQZo69zNfa0qr0YlFD5RgJ7PYJ5OuBm2thnAY?=
 =?us-ascii?Q?BOFODGHlRtd5jYXESk9GvcjbskDYLATTtjy6ALI7TbFqa2ibCzysYJgm5QAl?=
 =?us-ascii?Q?QUFHSgtrouormSOWWONLGWT4gri+MWBV3nfbk+F+u8SiUD5+kSNbJUuoArwE?=
 =?us-ascii?Q?zgTDNv3VAh3vtMO4kRc7JoHy6sNfPEuVkR7G2+G8XJFoHvtW+s5RoJsZMWDz?=
 =?us-ascii?Q?iisT5BqkEhpI6e8/HcRKDSIWzbEhq94Bsk58IQ5oXeld3pL8ZKuBvSs3hBDE?=
 =?us-ascii?Q?dyutFtC+gGqkhKgRo47KnENWA7e9jl3r3Cqug/3aCMVZZLkGmf5tgp1c2gXH?=
 =?us-ascii?Q?/TuRNKS7oJfsTa7MEbK1ExljSR4H9c7ltaFZEhZttBfJ7O4efrbNjr0Gk20P?=
 =?us-ascii?Q?xqOXCC7+lhyBhwuqXTFI1L+72HURxH4/jY6FnvyDsFWeFM0Hkd7LK0ScB9fD?=
 =?us-ascii?Q?33S+mIKgKTMlOfwosbPXnZ24AQx0M3uRcHHSQQw/gqEv0boe7zD88FxIM2ur?=
 =?us-ascii?Q?5C2yqyLJOw+gAZjTcv/M305kx2nJNI5jO7u5YIGpNPFktet2eKSZnqzl4PnL?=
 =?us-ascii?Q?JWIyrxXLrBIkkR3/G5N3ho0pCNtL34vSOAOF/Bts8nQhM+Zd58AHoF2u3bRi?=
 =?us-ascii?Q?J0X0y7YLylKn2R6FTK6LsTD57Crvd8UdNiYvc4da9raOI7BSejjWGpwDioa+?=
 =?us-ascii?Q?T5DQ5U36mhddaSpcdjh0XOi91XWME1Hi6eywEVSy5ascvTroXfcd6n4ptWxg?=
 =?us-ascii?Q?2d9kZnHB9btqGUDKpSWmiEnU/prheBJplhfbVlFelPUzdLgYmwL3h5pJ/GkQ?=
 =?us-ascii?Q?HVUBV1z+4wNYuYMLR7+22ium93qHIx+6tZZ7fyB18dSp6DVkEtf0fydBtqyS?=
 =?us-ascii?Q?lQQSLKmUrV+xkvcTCdEutDLCixKQCeY25XdbOrVJmkUpdoUwCOqvsCZbBXch?=
 =?us-ascii?Q?LhqlJuH1f1fbLPQYT+bvhqSlu0v25IGaY53996RIOg86Kg+DEA+IzcPMk8Db?=
 =?us-ascii?Q?DDFNfvqJ6D5dcv5Xe+KMefNibnAKDECalYrRhQzKCD4v9VNLF7+etVTlNBiC?=
 =?us-ascii?Q?5cex9NOThI0+JCOpH+78TSQ/DKgpnZ9vnV7GGVjPuyW7jRh94CtnDNKNldjv?=
 =?us-ascii?Q?OqJNIUgPba9F8v1yPMq50XEELCN/nQZi3WdKByang4+ihtbjbcRtGKN2J44R?=
 =?us-ascii?Q?KR8AxVu5x2VODedNsREIPGvzT8Wa2N1ZQJxV?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 07:46:47.0832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7289a4b8-ca2d-4832-8940-08de0d515331
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7011

The pin-controller is used to control the Soc pins.
There are two pin-controllers on Cix Sky1 platform.
One is used under S0 state, the other is used under
S0 and S5 state.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
new file mode 100644
index 000000000000..4ad160734353
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 Soc Pin Controller
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+description:
+  The pin-controller is used to control Soc pins. There are two pin-controllers
+  on Cix Sky1 platform. one is used under S0 state, the other one is used under
+  S0 and S5 state.
+
+properties:
+  compatible:
+    enum:
+      - cix,sky1-iomuxc
+      - cix,sky1-iomuxc-s5
+
+  reg:
+    items:
+      - description: gpio base
+
+# Client device subnode's properties
+patternProperties:
+  '-cfg$':
+    type: object
+    additionalProperties: false
+
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    patternProperties:
+      'pins$':
+        type: object
+        additionalProperties: false
+
+        description:
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias pull,
+          and drive strength.
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pinmux:
+            description:
+              Values are constructed from pin number and mux setting
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-strength:
+            description:
+              typical current when output high level.
+            enum: [ 2, 3, 5, 6, 8, 9, 11, 12, 13, 14, 17, 18, 20, 21, 23,
+                    24 ]
+
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    #define CIX_PAD_GPIO012_FUNC_GPIO012 (11 << 8 | 0x0)
+    #define DS_LEVEL4 (8)
+    iomuxc: pinctrl@4170000 {
+        compatible = "cix,sky1-iomuxc";
+        reg = <0x4170000 0x1000>;
+
+        wifi_vbat_gpio: wifi-vbat-gpio-cfg {
+            pins {
+                pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
+                bias-pull-up;
+                drive-strength = <DS_LEVEL4>;
+           };
+        };
+    };
-- 
2.49.0


