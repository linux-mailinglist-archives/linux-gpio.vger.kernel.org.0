Return-Path: <linux-gpio+bounces-8443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2457B9408F6
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 08:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF2EA283E74
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 06:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003CF190041;
	Tue, 30 Jul 2024 06:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XXEb0RZh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADA518FDD3;
	Tue, 30 Jul 2024 06:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722322564; cv=fail; b=rDEzY5u8vYPxMKA9bbtCobhoc4/LJgcEQIW/WsHuY43BldM/B+vmcZNOjrpv913k6YDWCrwIBmBjpbZyhzxWDkktbsZXGaaje35XY+gAKoKM6hniFN8bwSeQmNvt/HFfZI+M2zRLyp3tCSCLQQrGAA0gr7m5T9q9xS5PJtidgmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722322564; c=relaxed/simple;
	bh=uC3LHEBQ0zGKP8SpEMeipQhSdGfrZYfs2BfSMRewaT4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ak60+jGoFvIR+5rualTxedfuMRyGSH32lBQ8SeNSlGVzf1SCrAAqVYlcxoZBcPQPP6PmxmlI82R14HvLqjv/2SrbC9IDEM4F5zqfgrHaX9izaiaWSdMDMH1Lg9w+Iu+w4kgGUZv6L8hCHMfeHVxCJxwjQbXradZqAGaFKI573Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XXEb0RZh; arc=fail smtp.client-ip=40.107.94.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjmwoRpIoX+6pvAqfSnqj20GaE1Sq831hF2srTdQzW2TzWAnZKO6094ryrMNG2dy1h6lTlbAC7+MgFspmClxkAle/0OpS6xOeRNit0Z+i0pN98iEVvtjSELn5Mg1BMI3ewgQaquRKT10zFtSjq3ccbSB7bTTcoFMVm7IE2m4TVrln/Q/GO26zkMt/o2FgoVpohnWN1arEt9Px3+wAye1z2erc9b35SnFw7fboreXumeklXSsGD+3Uh9oMieDiStik8JNf2UkHWKOVvLA5rEM0eOzx0hz9yV/chdIlnoa6FMZBpC324Z0oHv82j/lJ0v//24MMD5NtOybyRQ7XgIEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CXZ9MWGvB3ANQDVmViB27BTYURW6vEsbiGqg7sfnCc=;
 b=R+b4InLvEmOHjINailK5KX25lpthX0i75+hqWWgGMPYszM+kKTnYlMaj3nW7ywUM1/Xd9/YcCGWQ90cCPb3b+wPmssSVMIxI7HKrJLzTYOkiwdj2wxAOWWrKXOCfBRBnW1yG2jcpI/K1vttucYVWfiODqpstY5xM78cW3d8vekJTeZX/w6CMe42MkgJ6bvV8lpkjHyA7AQpmDpX7qDvDczX6oujbPHjgZacMNtwUlox/HFl9KRvp/Iyv9czjWdIzNWRjTb8z3mKVfhj1dd7aquXpk4WDjsTVF7P9Dam2IV1AMqic3BFEnoRfzrsv9LeRpOv5kEa+OZWUa/EhwjDtJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CXZ9MWGvB3ANQDVmViB27BTYURW6vEsbiGqg7sfnCc=;
 b=XXEb0RZhzvMf85Ld41IPY9Q2SPsmhczjPRXSILeWaSDPNjqYZk4hKAHCh8Yhxh9t0zSSYqsORWzHjWvhKmvLOsDc7G+6nFVlf3VvITHozL3CdGUReNGqpqQk14xqcv+Tp9CIhTijnB3La+473OG9saMxl6HSylHlo6owGid9Bj4=
Received: from MW4PR04CA0388.namprd04.prod.outlook.com (2603:10b6:303:81::33)
 by SA3PR12MB7902.namprd12.prod.outlook.com (2603:10b6:806:305::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 06:55:59 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::5b) by MW4PR04CA0388.outlook.office365.com
 (2603:10b6:303:81::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Tue, 30 Jul 2024 06:55:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 06:55:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 01:55:57 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 30 Jul 2024 01:55:53 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek
	<michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Jay
 Buddhabhatti" <jay.buddhabhatti@amd.com>, Praveen Teja Kundanala
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: Add support for Xilinx Versal platform
Date: Tue, 30 Jul 2024 12:25:46 +0530
Message-ID: <20240730065548.1371518-2-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240730065548.1371518-1-sai.krishna.potthuri@amd.com>
References: <20240730065548.1371518-1-sai.krishna.potthuri@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sai.krishna.potthuri@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|SA3PR12MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: f53e3cde-25fd-4cb8-b631-08dcb064ab0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qj6bs3aRlNJ/PM7GHJ7yEYD6oVgzzng7C1wsDovpERiC/P7VmlGPSeogYBjZ?=
 =?us-ascii?Q?jeyHp9Jw1jb5NGF51u/ux4w0xkDMljfeNo4RM8VddKjBDU4iPGtjmHQ+5qdm?=
 =?us-ascii?Q?9DaYpbYa4AU3MF9NZ2inXzI7hF09jD5dyob2f0OX4MUYXJZRusPFEghLTlxw?=
 =?us-ascii?Q?nsorGqJ16hBVb3p7WSjxnidAlCUbfbmHKbw0hqp2ARIrJx+8ZuzUGqJQ6azV?=
 =?us-ascii?Q?O+HBKt34WRnLfeSNXsZDH88jRx/Q38NDk67agzzNYh6apNubvNK1oAn54Pqj?=
 =?us-ascii?Q?90+NxcDyFdBa4gDCOshL/4346Jd4PtOc0UFbVaQuLJADo0KbivdFyoaRTFu7?=
 =?us-ascii?Q?Gl3k6oIW6NBEKhP7nPau+4WbyWslKbaXBdYkzexy27/0B2UIS2P8DyFjjxLb?=
 =?us-ascii?Q?rODMRxda8F73By0l98HQW3tfanCi3ehzylNOgLctjXh9DtqE0ElHyh6tChN2?=
 =?us-ascii?Q?7//Z5Go+NOuB9cpW9PuqV9ghIxfFn2+D9ofLAWaaL1ay2pQkQY+/fRre471B?=
 =?us-ascii?Q?jniQsNDVb3VgmiY4BXgJMKIDsMrH4Sc76isgudi7j50e0GY/2wFWQydtaK1Z?=
 =?us-ascii?Q?F43q773bdn8YXy3CDYpnApo+a50UwoVBslh+cdbZ3eX54QQNjhVKY3lczBlk?=
 =?us-ascii?Q?dCCkEm0yaWjapeCQWDvj1WlShb844CS1zazO//dc879YrgWej4/10wILefeY?=
 =?us-ascii?Q?nzmHuhJVW2EM2ns0xmLrgFgbTJkgMMtDeeWYJrboOR9IcSE36sg64e6a0vz9?=
 =?us-ascii?Q?zPm9bj/C1wF38qCYjCRaZhTy/bQwDN7YEBfb2wNiQgobGpYKZvM42f+6aIgN?=
 =?us-ascii?Q?zy95AKAIjgtQ8nZIHrbwnDjXJjyDm0bVBtl5vstD2SNhy2+L9Jq3qG9M+8mZ?=
 =?us-ascii?Q?VruRuXibAjaCEfI/QBm64h7KB9my378ouVkNDnLSvs3KVI347PabNFpetwYD?=
 =?us-ascii?Q?mVl/9bJI2uQtNmj+Sq4fqTvpivpfjCeUlU3ejHbzZSVEK6oYIYf64O22AqPH?=
 =?us-ascii?Q?QVrsXCLMrYCousVIUTLvFDqTfQmISTm8h6RQU5cgBxGUtrRq1LXt5Q3saKgK?=
 =?us-ascii?Q?e1X9yFkyNgaaIfwOjOnqwfVxnrUPiMU8ify9z9q38riQDjh4A5XtyAkgR/au?=
 =?us-ascii?Q?NFx7XG4elWNXj4sruRolfDjQ6EaeRvQqXsbCZvV+fPLNW8mL8V9kkHyfSPgk?=
 =?us-ascii?Q?0cUjOrSf6po95New4X7RcD53mSyBxA1UrLKMiCb7LZhjowBOA5QjqYrmEfHf?=
 =?us-ascii?Q?hkKj8Zf0L8Xo83DVVJmiQT/WUK4JUpMqdMhBqStaMjbxfpv8YVo3M8WzCJsn?=
 =?us-ascii?Q?ctbJxk8zu+fNLaUM6Q6kLLwRtCIHqoPtOMRqfOigqmoxl5EvYpLkGwtIX4im?=
 =?us-ascii?Q?D9o26p3drve2yo7vT4TkhlnoNkPERCTnDKSDUcu65zsCZsjJGA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 06:55:59.1044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f53e3cde-25fd-4cb8-b631-08dcb064ab0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7902

Add Xilinx Versal compatible string and corresponding groups, function and
pins properties to support pin controller features on Versal platform.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 .../bindings/pinctrl/xlnx,versal-pinctrl.yaml | 289 ++++++++++++++++++
 1 file changed, 289 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
new file mode 100644
index 000000000000..ff456a0c0a37
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
@@ -0,0 +1,289 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/xlnx,versal-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal Pinctrl
+
+maintainers:
+  - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
+
+description: |
+  Please refer to pinctrl-bindings.txt in this directory for details of the
+  common pinctrl bindings used by client devices, including the meaning of the
+  phrase "pin configuration node".
+
+  Versal's pin configuration nodes act as a container for an arbitrary number of
+  subnodes. Each of these subnodes represents some desired configuration for a
+  pin, a group, or a list of pins or groups. This configuration can include the
+  mux function to select on those pin(s)/group(s), and various pin configuration
+  parameters, such as pull-up, slew rate, etc.
+
+  Each configuration node can consist of multiple nodes describing the pinmux and
+  pinconf options. Those nodes can be pinmux nodes or pinconf nodes.
+
+  The name of each subnode is not important; all subnodes should be enumerated
+  and processed purely based on their content.
+
+properties:
+  compatible:
+    const: xlnx,versal-pinctrl
+
+patternProperties:
+  '^(.*-)?(default|gpio-grp)$':
+    type: object
+    patternProperties:
+      '^mux':
+        type: object
+        description:
+          Pinctrl node's client devices use subnodes for pin muxes,
+          which in turn use below standard properties.
+        $ref: pinmux-node.yaml#
+
+        properties:
+          pins:
+            description:
+              List of pins to select (either this or "groups" must be specified)
+            items:
+              pattern: '^((LPD|PMC)_)MIO([0-9]|[1-6][0-9]|7[0-7])$'
+
+          groups:
+            description:
+              List of groups to select (either this or "pins" must be
+              specified), available groups for this subnode.
+            items:
+              anyOf:
+                - pattern: '^((LPD|PMC)_)MIO([0-9]|[1-6][0-9]|7[0-7])$'
+                - enum: [spi0_0_grp, spi0_1_grp, spi0_2_grp, spi0_3_grp, spi0_4_grp, spi0_5_grp,
+                         spi0_ss_0_grp, spi0_ss_1_grp, spi0_ss_2_grp, spi0_ss_3_grp, spi0_ss_4_grp,
+                         spi0_ss_5_grp, spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp, spi0_ss_9_grp,
+                         spi0_ss_10_grp, spi0_ss_11_grp, spi0_ss_12_grp, spi0_ss_13_grp, spi0_ss_14_grp,
+                         spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp, spi1_0_grp, spi1_1_grp,
+                         spi1_2_grp, spi1_3_grp, spi1_4_grp, spi1_5_grp, spi1_ss_0_grp, spi1_ss_1_grp,
+                         spi1_ss_2_grp, spi1_ss_3_grp, spi1_ss_4_grp, spi1_ss_5_grp, spi1_ss_6_grp,
+                         spi1_ss_7_grp, spi1_ss_8_grp, spi1_ss_9_grp, spi1_ss_10_grp, spi1_ss_11_grp,
+                         spi1_ss_12_grp, spi1_ss_13_grp, spi1_ss_14_grp, spi1_ss_15_grp, spi1_ss_16_grp
+                         spi1_ss_17_grp, can0_0_grp, can0_1_grp, can0_2_grp, can0_3_grp, can0_4_grp,
+                         can0_5_grp, can0_6_grp, can0_7_grp, can0_8_grp, can0_9_grp, can0_10_grp,
+                         can0_11_grp, can0_12_grp, can0_13_grp, can0_14_grp, can0_15_grp, can0_16_grp,
+                         can0_17_grp, can1_0_grp, can1_1_grp, can1_2_grp, can1_3_grp, can1_4_grp,
+                         can1_5_grp, can1_6_grp, can1_7_grp, can1_8_grp, can1_9_grp, can1_10_grp,
+                         can1_11_grp, can1_12_grp, can1_13_grp, can1_14_grp, can1_15_grp, can1_16_grp,
+                         can1_17_grp, can1_18_grp, i2c0_0_grp, i2c0_1_grp, i2c0_2_grp, i2c0_3_grp,
+                         i2c0_4_grp, i2c0_5_grp, i2c0_6_grp, i2c0_7_grp, i2c0_8_grp, i2c0_9_grp,
+                         i2c0_10_grp, i2c0_11_grp, i2c0_12_grp, i2c0_13_grp, i2c0_14_grp, i2c0_15_grp,
+                         i2c0_16_grp, i2c0_17_grp, i2c1_0_grp, i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
+                         i2c1_4_grp, i2c1_5_grp, i2c1_6_grp, i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
+                         i2c1_10_grp, i2c1_11_grp, i2c1_12_grp, i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
+                         i2c1_16_grp, i2c1_17_grp, i2c1_18_grp, i2c_pmc_0_grp, i2c_pmc_1_grp,
+                         i2c_pmc_2_grp, i2c_pmc_3_grp, i2c_pmc_4_grp, i2c_pmc_5_grp, i2c_pmc_6_grp,
+                         i2c_pmc_7_grp, i2c_pmc_8_grp, i2c_pmc_9_grp, i2c_pmc_10_grp, i2c_pmc_11_grp,
+                         i2c_pmc_12_grp, ttc0_clk_0_grp, ttc0_clk_1_grp, ttc0_clk_2_grp, ttc0_clk_3_grp,
+                         ttc0_clk_4_grp, ttc0_clk_5_grp, ttc0_clk_6_grp, ttc0_clk_7_grp, ttc0_clk_8_grp,
+                         ttc0_wav_0_grp, ttc0_wav_1_grp, ttc0_wav_2_grp, ttc0_wav_3_grp, ttc0_wav_4_grp,
+                         ttc0_wav_5_grp, ttc0_wav_6_grp, ttc0_wav_7_grp, ttc0_wav_8_grp, ttc1_clk_0_grp,
+                         ttc1_clk_1_grp, ttc1_clk_2_grp, ttc1_clk_3_grp, ttc1_clk_4_grp, ttc1_clk_5_grp,
+                         ttc1_clk_6_grp, ttc1_clk_7_grp, ttc1_clk_8_grp, ttc1_wav_0_grp, ttc1_wav_1_grp,
+                         ttc1_wav_2_grp, ttc1_wav_3_grp, ttc1_wav_4_grp, ttc1_wav_5_grp, ttc1_wav_6_grp,
+                         ttc1_wav_7_grp, ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_clk_1_grp, ttc2_clk_2_grp,
+                         ttc2_clk_3_grp, ttc2_clk_4_grp, ttc2_clk_5_grp, ttc2_clk_6_grp, ttc2_clk_7_grp,
+                         ttc2_clk_8_grp, ttc2_wav_0_grp, ttc2_wav_1_grp, ttc2_wav_2_grp, ttc2_wav_3_grp,
+                         ttc2_wav_4_grp, ttc2_wav_5_grp, ttc2_wav_6_grp, ttc2_wav_7_grp, ttc2_wav_8_grp,
+                         ttc3_clk_0_grp, ttc3_clk_1_grp, ttc3_clk_2_grp, ttc3_clk_3_grp, ttc3_clk_4_grp,
+                         ttc3_clk_5_grp, ttc3_clk_6_grp, ttc3_clk_7_grp, ttc3_clk_8_grp, ttc3_wav_0_grp,
+                         ttc3_wav_1_grp, ttc3_wav_2_grp, ttc3_wav_3_grp, ttc3_wav_4_grp, ttc3_wav_5_grp,
+                         ttc3_wav_6_grp, ttc3_wav_7_grp, ttc3_wav_8_grp, wwdt0_0_grp, wwdt0_1_grp,
+                         wwdt0_2_grp, wwdt0_3_grp, wwdt0_4_grp, wwdt0_5_grp, wwdt1_0_grp, wwdt1_1_grp,
+                         wwdt1_2_grp, wwdt1_3_grp, wwdt1_4_grp, wwdt1_5_grp, sysmon_i2c0_0_grp,
+                         sysmon_i2c0_1_grp, sysmon_i2c0_2_grp, sysmon_i2c0_3_grp, sysmon_i2c0_4_grp,
+                         sysmon_i2c0_5_grp, sysmon_i2c0_6_grp, sysmon_i2c0_7_grp, sysmon_i2c0_8_grp,
+                         sysmon_i2c0_9_grp, sysmon_i2c0_10_grp, sysmon_i2c0_11_grp, sysmon_i2c0_12_grp,
+                         sysmon_i2c0_13_grp, sysmon_i2c0_14_grp, sysmon_i2c0_15_grp,
+                         sysmon_i2c0_16_grp, sysmon_i2c0_17_grp, sysmon_i2c0_alrt_0_grp,
+                         sysmon_i2c0_alrt_1_grp, sysmon_i2c0_alrt_2_grp, sysmon_i2c0_alrt_3_grp,
+                         sysmon_i2c0_alrt_4_grp, sysmon_i2c0_alrt_5_grp, sysmon_i2c0_alrt_6_grp,
+                         sysmon_i2c0_alrt_7_grp, sysmon_i2c0_alrt_8_grp, sysmon_i2c0_alrt_9_grp,
+                         sysmon_i2c0_alrt_10_grp, sysmon_i2c0_alrt_11_grp, sysmon_i2c0_alrt_12_grp,
+                         sysmon_i2c0_alrt_13_grp, sysmon_i2c0_alrt_14_grp, sysmon_i2c0_alrt_15_grp,
+                         sysmon_i2c0_alrt_16_grp, sysmon_i2c0_alrt_17_grp, uart0_0_grp, uart0_1_grp,
+                         uart0_2_grp, uart0_3_grp, uart0_4_grp, uart0_5_grp, uart0_6_grp, uart0_7_grp,
+                         uart0_8_grp, uart0_ctrl_0_grp, uart0_ctrl_1_grp, uart0_ctrl_2_grp,
+                         uart0_ctrl_3_grp, uart0_ctrl_4_grp, uart0_ctrl_5_grp, uart0_ctrl_6_grp,
+                         uart0_ctrl_7_grp, uart0_ctrl_8_grp, uart1_0_grp, uart1_1_grp, uart1_2_grp,
+                         uart1_3_grp, uart1_4_grp, uart1_5_grp, uart1_6_grp, uart1_7_grp, uart1_8_grp,
+                         uart1_ctrl_0_grp, uart1_ctrl_1_grp, uart1_ctrl_2_grp, uart1_ctrl_3_grp,
+                         uart1_ctrl_4_grp, uart1_ctrl_5_grp, uart1_ctrl_6_grp, uart1_ctrl_7_grp,
+                         uart1_ctrl_8_grp, gpio0_0_grp, gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
+                         gpio0_4_grp, gpio0_5_grp, gpio0_6_grp, gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
+                         gpio0_10_grp, gpio0_11_grp, gpio0_12_grp, gpio0_13_grp, gpio0_14_grp,
+                         gpio0_15_grp, gpio0_16_grp, gpio0_17_grp, gpio0_18_grp, gpio0_19_grp,
+                         gpio0_20_grp, gpio0_21_grp, gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
+                         gpio0_25_grp, gpio1_0_grp, gpio1_1_grp, gpio1_2_grp, gpio1_3_grp, gpio1_4_grp,
+                         gpio1_5_grp, gpio1_6_grp, gpio1_7_grp, gpio1_8_grp, gpio1_9_grp,
+                         gpio1_10_grp, gpio1_11_grp, gpio1_12_grp, gpio1_13_grp, gpio1_14_grp,
+                         gpio1_15_grp, gpio1_16_grp, gpio1_17_grp, gpio1_18_grp, gpio1_19_grp,
+                         gpio1_20_grp, gpio1_21_grp, gpio1_22_grp, gpio1_23_grp, gpio1_24_grp,
+                         gpio1_25_grp, gpio2_0_grp, gpio2_1_grp, gpio2_2_grp, gpio2_3_grp, gpio2_4_grp,
+                         gpio2_5_grp, gpio2_6_grp, gpio2_7_grp, gpio2_8_grp, gpio2_9_grp, gpio2_10_grp,
+                         gpio2_11_grp, gpio2_12_grp, gpio2_13_grp, gpio2_14_grp, gpio2_15_grp,
+                         gpio2_16_grp, gpio2_17_grp, gpio2_18_grp, gpio2_19_grp, gpio2_20_grp,
+                         gpio2_21_grp, gpio2_22_grp, gpio2_23_grp, gpio2_24_grp, gpio2_25_grp,
+                         emio0_0_grp, emio0_1_grp, emio0_2_grp, emio0_3_grp, emio0_4_grp, emio0_5_grp,
+                         emio0_6_grp, emio0_7_grp, emio0_8_grp, emio0_9_grp, emio0_10_grp,
+                         emio0_11_grp, emio0_12_grp, emio0_13_grp, emio0_14_grp, emio0_15_grp,
+                         emio0_16_grp, emio0_17_grp, emio0_18_grp, emio0_19_grp, emio0_20_grp,
+                         emio0_21_grp, emio0_22_grp, emio0_23_grp, emio0_24_grp, emio0_25_grp,
+                         emio0_26_grp, emio0_27_grp, emio0_28_grp, emio0_29_grp, emio0_30_grp,
+                         emio0_31_grp, emio0_32_grp, emio0_33_grp, emio0_34_grp, emio0_35_grp,
+                         emio0_36_grp, emio0_37_grp, emio0_38_grp, emio0_39_grp, emio0_40_grp,
+                         emio0_41_grp, emio0_42_grp, emio0_43_grp, emio0_44_grp, emio0_45_grp,
+                         emio0_46_grp, emio0_47_grp, emio0_48_grp, emio0_49_grp, emio0_50_grp,
+                         emio0_51_grp, emio0_52_grp, emio0_53_grp, emio0_54_grp, emio0_55_grp,
+                         emio0_56_grp, emio0_57_grp, emio0_58_grp, emio0_59_grp, emio0_60_grp,
+                         emio0_61_grp, emio0_62_grp, emio0_63_grp, emio0_64_grp, emio0_65_grp,
+                         emio0_66_grp, emio0_67_grp, emio0_68_grp, emio0_69_grp, emio0_70_grp,
+                         emio0_71_grp, emio0_72_grp, emio0_73_grp, emio0_74_grp, emio0_75_grp,
+                         emio0_76_grp, emio0_77_grp, gem0_0_grp, gem0_1_grp, gem1_0_grp, gem1_1_grp,
+                         trace0_0_grp, trace0_1_grp, trace0_2_grp, trace0_clk_0_grp, trace0_clk_1_grp,
+                         trace0_clk_2_grp, mdio0_0_grp, mdio0_1_grp, mdio1_0_grp, mdio1_1_grp,
+                         gem_tsu0_0_grp, gem_tsu0_1_grp, gem_tsu0_2_grp, gem_tsu0_3_grp, pcie0_0_grp,
+                         pcie0_1_grp, pcie0_2_grp, smap0_0_grp, usb0_0_grp, sd0_0_grp, sd0_1_grp,
+                         sd0_2_grp, sd0_3_grp, sd0_4_grp, sd0_5_grp, sd0_6_grp, sd0_7_grp, sd0_8_grp,
+                         sd0_9_grp, sd0_10_grp, sd0_11_grp, sd0_12_grp, sd0_13_grp, sd0_14_grp,
+                         sd0_15_grp, sd0_16_grp, sd0_17_grp, sd0_18_grp, sd0_19_grp, sd0_20_grp,
+                         sd0_21_grp, sd0_pc_0_grp, sd0_pc_1_grp, sd0_cd_0_grp, sd0_cd_1_grp,
+                         sd0_wp_0_grp, sd0_wp_1_grp, sd1_0_grp, sd1_1_grp, sd1_2_grp, sd1_3_grp,
+                         sd1_4_grp, sd1_5_grp, sd1_6_grp, sd1_7_grp, sd1_8_grp, sd1_9_grp, sd1_10_grp,
+                         sd1_11_grp, sd1_12_grp, sd1_13_grp, sd1_14_grp, sd1_15_grp, sd1_16_grp,
+                         sd1_17_grp, sd1_18_grp, sd1_19_grp, sd1_20_grp, sd1_21_grp, sd1_pc_0_grp,
+                         sd1_pc_1_grp, sd1_cd_0_grp, sd1_cd_1_grp, sd1_wp_0_grp, sd1_wp_1_grp,
+                         ospi0_0_grp, ospi0_ss_0_grp, qspi0_0_grp, qspi0_fbclk_0_grp, qspi0_ss_0_grp,
+                         test_clk_0_grp, test_scan_0_grp, tamper_trigger_0_grp]
+            maxItems: 78
+
+          function:
+            description:
+              Specify the alternative function to be configured for the
+              given pin groups.
+            enum: [spi0, spi0_ss, spi1, spi1_ss, can0, can1, i2c0, i2c1, i2c_pmc, ttc0_clk,
+                   ttc0_wav, ttc1_clk, ttc1_wav, ttc2_clk, ttc2_wav, ttc3_clk, ttc3_wav, wwdt0,
+                   wwdt1, sysmon_i2c0, sysmon_i2c0_alrt, uart0, uart0_ctrl, uart1, uart1_ctrl,
+                   gpio0, gpio1, gpio2, emio0, gem0, gem1, trace0, trace0_clk, mdio0, mdio1, gem_tsu0,
+                   pcie0, smap0, usb0, sd0, sd0_pc, sd0_cd, sd0_wp, sd1, sd1_pc, sd1_wp, sd1_cd,
+                   ospi0, ospi0_ss, qspi0, qspi0_fbclk, qspi0_ss, test_clk, test_scan, tamper_trigger]
+
+        required:
+          - function
+
+        oneOf:
+          - required: [ groups ]
+          - required: [ pins ]
+
+        additionalProperties: false
+
+      '^conf':
+        type: object
+        description:
+          Pinctrl node's client devices use subnodes for pin configurations,
+          which in turn use the standard properties below.
+        $ref: pincfg-node.yaml#
+
+        properties:
+          groups:
+            description:
+              List of pin groups as mentioned above.
+
+          pins:
+            description:
+              List of pin names to select in this subnode.
+            items:
+              pattern: '^((LPD|PMC)_)MIO([0-9]|[1-6][0-9]|7[0-7])$'
+            maxItems: 78
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          bias-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          bias-high-impedance: true
+
+          low-power-enable: true
+
+          low-power-disable: true
+
+          slew-rate:
+            enum: [0, 1]
+
+          output-enable:
+            description:
+              This will internally disable the tri-state for MIO pins.
+
+          drive-strength:
+            description:
+              Selects the drive strength for MIO pins, in mA.
+            enum: [2, 4, 8, 12]
+
+          power-source:
+            enum: [0, 1]
+
+        oneOf:
+          - required: [ groups ]
+          - required: [ pins ]
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
+    versal_firmware: versal-firmware {
+        pinctrl0: pinctrl {
+          compatible = "xlnx,versal-pinctrl";
+
+          pinctrl_uart0_default: uart0-default {
+             mux {
+                 groups = "uart0_4_grp", "uart0_5_grp";
+                 function = "uart0";
+             };
+
+             conf {
+                groups = "uart0_4_grp";
+                slew-rate = <SLEW_RATE_SLOW>;
+                power-source = <IO_STANDARD_LVCMOS18>;
+             };
+
+             conf-rx {
+                pins = "PMC_MIO42";
+                bias-pull-up;
+             };
+
+             conf-tx {
+                pins = "PMC_MIO43";
+                bias-disable;
+                input-schmitt-disable;
+             };
+          };
+        };
+    };
+
+    uart0 {
+         pinctrl-names = "default";
+         pinctrl-0 = <&pinctrl_uart0_default>;
+    };
+
+...
-- 
2.25.1


