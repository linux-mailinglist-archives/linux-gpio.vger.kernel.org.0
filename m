Return-Path: <linux-gpio+bounces-25992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D20CFB54272
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85EFBA0660C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 06:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B65627F015;
	Fri, 12 Sep 2025 06:06:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022106.outbound.protection.outlook.com [52.101.126.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36237846F;
	Fri, 12 Sep 2025 06:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657218; cv=fail; b=fWI8L7DugxL3szOIcs1VOesjRQE9kY0NWJA2crrl8W1H328YlU4z6CZY2LuNx9Nih/WRbMvutBDm+z8mNsAiZlPzRMpg3VHpB2h67+aAeCt+RHtqgl/HoupcbWYrB1+nm4nSydlEx0jglqDCd4QF/ame8dqbaGYuuEarUM0SLIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657218; c=relaxed/simple;
	bh=Ai9btz1quGArzXJliY8lt27C/OnkkfcCDTz7QiG3ihU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F5i7zFTAnCN6aMlQCdhXpEyiMeSknPSaUDFrI6hKLQikBGTH0geX+qZ7jI5vpL+Mp9Tms5/Ovo06iV5CWEUYu7iBnlY4kTsLSPBl/ovHHAgjPBUmaRDx31D+fmBfYMlnk4gFbuIGfgh1PkRYFIrdsjOM8FwOsjtHT49PEozKUi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q81hFw+KuTmPPkjY9IKxd7AwrW8BFtRNhNiNwSntOMOIsK3br8i6+YVH+kN6znaD0J4hkWIjOaSED+rjDKzkKeXaNf7MT23WPlOlspvH/Xpr9rooA5jfuB92c9RkiHnzSNyGQnoRKNWAOV/VkRU2f9cyBX1cpckZ3P/qw+523KfiCmeOHcXW+/8WZlIBrTq3ytyABN2DEXNfUM1VbwiQgSIz2mTxlsUBjssf/TIempjbbD7vj0a5RYcIEoD5fhaFmxwGchX9ybAXE4rMmNH1He6mzBAS6sTHcwE6xUhJZSmtNHPJWE4UF2hesMV4In7xAyGgQQzGvPAAc+Yv7Y90kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLs3bBN2UGIELnav4B4+GwA6oh3fAE8c+1IGQsP9Zpk=;
 b=Z0/U7uj16bKML+D3XhyFT7oPOQiLLhgnDMkjrq1bXIFR/5H2MQOpyql/k/D4XKMQMbjlpETqrj+4lHnko/t1FT3NBRtBbPvEIB+gH5a8uRiZowfmEzX9ywPHwzZ7jBnOBZVdBS6n0k19aB1mdcIkon0/jv0O1HQQaSGCZl2hFR0c0z7dQiJrB3z3hjejF8N10WeeYoo3CLIDl+JO1JtQbMNbDxEOmeW1Ccpmo9UyNPS3+A3vjwoShrL9ZOmXbM7/kuAvhSvJAGFl7fa7Ota620t/g4yhgFXDREVyWft/tElfKFmoPpz1mbTywUoFfHO+8cRLkAwIM370frI1IqGHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17) by
 KUXPR06MB8032.apcprd06.prod.outlook.com (2603:1096:d10:4e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Fri, 12 Sep 2025 06:06:52 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:c6:cafe::38) by SG2P153CA0048.outlook.office365.com
 (2603:1096:4:c6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.6 via Frontend Transport; Fri,
 12 Sep 2025 06:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 06:06:51 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AD4EA41C0144;
	Fri, 12 Sep 2025 14:06:50 +0800 (CST)
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
Subject: [v2 0/3] Add pinctrl support for sky1
Date: Fri, 12 Sep 2025 14:06:47 +0800
Message-ID: <20250912060650.2180691-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|KUXPR06MB8032:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e63a0d50-c03e-426c-8721-08ddf1c29147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oo9xG0sCwNOiLaklhgxtt4hHejY+ph1IzXRVC4h7LzYXPfrvL/i6h3z3syeo?=
 =?us-ascii?Q?LDddV3eDwXXtfM2dxoFBStFoxmKnqHVVuDlgcVzbGB/YczkIMIOnnJwSSMqK?=
 =?us-ascii?Q?iuG3rcYgAKrLZYtWVpWGRZImSMZ1BbFNU1upPCKwl57RDgZzTB8UeQ20hFoY?=
 =?us-ascii?Q?orpviw3habaPk3l3K/qAEzQqqdzxG+fQk2n1CElUTxCOYkmcupZio9Z4PlmO?=
 =?us-ascii?Q?AL0+Nol7vH65PmWdy6CUB3hWFUZ5ltHUQWUi9/NQlfpbL0ISOorkAtPmcj50?=
 =?us-ascii?Q?SYetiXJ7/NjRS+XwGVDQkD1z5wMGo9JFzd5XIxBkpls7kqw5uWL/5+GGTCmi?=
 =?us-ascii?Q?pNQtI1Tx2aWVFak4BZeCFG2xocikmRCU+ARGWbLZjqXlhEtc/5+O6kQ5ezUG?=
 =?us-ascii?Q?hStkoUcBqBx4g3gh91UEa+ShDuT7uTlHzAW2U/BNVp0zdw24FyTTKFsJaQ3Y?=
 =?us-ascii?Q?66ii+An1xzqVHnyYxGniJXUvcfqEHOsaIbbfjipZGJ0jgl0nbUbkNfntvOYJ?=
 =?us-ascii?Q?WPtJYCkF16hbeB0ZKqCZZOqVWujaGvtckxkmBej5mNNo9r9trt+XvfG8KKG0?=
 =?us-ascii?Q?oHz1RyYnWPB2b46R9Rj2Bl7atKljc2HFTsqw3L9DgU8dnXaoaX/NP6WYh2tv?=
 =?us-ascii?Q?/bPNNHjrstkxJ6YUZPCjwMw2Nev2RMdrbB7/P5O4HyKKQxVgjbKxC1NMowFc?=
 =?us-ascii?Q?VIjUx7oaH87EXlurcyC6HXGI/v39gXONpB2Y0kVR43F65TV4BRElwjBPzb0R?=
 =?us-ascii?Q?Lfaf53IsgSPaV8PEb9M9dhb8zzJ/CB50EqVyFkpxIT3jhRGFqnY8SsfLY2m+?=
 =?us-ascii?Q?/EJ3LQc6VvaVfxh6AwhqwwjCtHWRK7UhrvEFN371LIx+Vje2TZho9xzwrlRp?=
 =?us-ascii?Q?pxFdmlHn+ZDva8CkaNbxUXHxxpamX4p1yFEarJsZWK8hiYxDPWcvek+UZqnj?=
 =?us-ascii?Q?k+FRqVB0gYw3V2W9GkcAmnJEZT4M0MSdubQnKn7A0gWGGtwqstPsMLRLdtW6?=
 =?us-ascii?Q?8G300osaaDzFhDYRO6CEn8IKUhX2sCB/5XHULQZZU4Ay+GsS77UVuPgnsJlf?=
 =?us-ascii?Q?rGPr/G8nRiijXSq1eP8d5hSfbTbQ3GKxUPdyydoQqpsBlpilevkdjspUjhUv?=
 =?us-ascii?Q?eodfhba4h9nbqSX+jsLwYpTSyuxlCzy9dlWPY1btYSwuXtYU/l9pJnzpfHVL?=
 =?us-ascii?Q?Y1b+tYdcDS1b/ydlLyns7Z6SmXnFG3mdN8+b4qHvbHO0pZEyRCEYRcJ8X+eA?=
 =?us-ascii?Q?Z4BQANzktm9whWJp2sMJejxt3MYbaArPGe0qRZwFom6PE/Ukm/Y46f8kVj9S?=
 =?us-ascii?Q?UzOXNliQRXHTJ3Tkd3P9REWRKR4Yb2PO41WwcyR4gg5rV9E0g3eYfN7xFmgG?=
 =?us-ascii?Q?FpTveXevLiFRpsspC7ATfiBmXFJN9riJIpU2Dx5kN+H7UjlBB+4C3AdIdQuY?=
 =?us-ascii?Q?KiKEVc9LWh9Z4uirqmN00mpfTxWKsyuyL8z4KcSi0w9d2a/WNVlyTeNDpqNW?=
 =?us-ascii?Q?YqNsz+8Np7tsq1EtDcsyZXK4up9fKtn4kPgJ?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 06:06:51.3038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e63a0d50-c03e-426c-8721-08ddf1c29147
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8032

Patch 1: add Cix pinctrl driver to support pinmux and pinconfigs
Patch 2: add Cix pinctrl nodes and header file
Patch 3: add yaml doc

Changes for v2:
- restructure the pinctrl driver to support pinmux=<..>
- redefine pinmux macros
- move header file from dt-bindings to dts
- fix the code-style issues



Gary Yang (3):
  pinctrl: cix: Add pin-controller support for sky1
  dt-bindings: pinctrl: Add cix,sky1-pinctrl
  arm64: dts: cix: Add pinctrl nodes for sky1

 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |   85 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |   32 +
 arch/arm64/boot/dts/cix/sky1-pinfunc.h        |  417 +++++
 arch/arm64/boot/dts/cix/sky1.dtsi             |   10 +
 drivers/pinctrl/Kconfig                       |    1 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/cix/Kconfig                   |   14 +
 drivers/pinctrl/cix/Makefile                  |    4 +
 drivers/pinctrl/cix/pinctrl-sky1-base.c       |  581 +++++++
 drivers/pinctrl/cix/pinctrl-sky1.c            | 1435 +++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.h            |   46 +
 11 files changed, 2626 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/cix/sky1-pinfunc.h
 create mode 100644 drivers/pinctrl/cix/Kconfig
 create mode 100644 drivers/pinctrl/cix/Makefile
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1-base.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.h

-- 
2.49.0


