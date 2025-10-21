Return-Path: <linux-gpio+bounces-27338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A76F4BF4CCE
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4927318C5671
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 07:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0292F274B5C;
	Tue, 21 Oct 2025 07:04:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022127.outbound.protection.outlook.com [40.107.75.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3AD274650;
	Tue, 21 Oct 2025 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030259; cv=fail; b=SI6Icd6ZKZLvfSPk1wp9zcJhNuOr1YQSaj10Ac0y98Leu8RGYwBnr/QDUJRaVx8FMkkVw6VxHMwLa9X1gdCHssqZAfnmyc+HiqKcCp621vQHv84Ngg2kTq1iMAtJfZl8hkwDPjnkVeQloBaJPIAqGnrzhImB4MJ/4SPQaH6SA1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030259; c=relaxed/simple;
	bh=PuVUEdkV6nfAOwhh0xvoXrndNnh6MUU3oe49PfVEXU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vi6Ujlaov49kELKxdCUv0jfSFngTF0QCShsm3arAavXZX0/X36vQ0zwAhl55TmRE7yuYpLvcSABHYpaIhI56SygoIrHCtFr1bOgRmWN47Qx6X+qpb5y/t4cAGJLr9+Ebr8uGhZzW4d/9pGK8tz7n+stz+Q6ljak0/huzBTwYHpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mu4cha0vVPBDdn7bAVWM4w8/6Lw8LwagFnyklcnzc9Uo8oskDGdzWOI8QFAEx3ragGj+NkMunTcO/wHYgbNSQHvLDDMmrfNUvXozaoardZvmxT9b6V/PYCnUpvK67ryneDzptnIL86/b0s7DEyIcLKDyRGTY2VPEFWHv/tVo/MlUEJe/Hf35sw0K5c8jstTsYBcFEVOP0WLvO+ZufaLkXLzIuCstSQuNqg2Rm/g6pXcR5U0n9oIwOyYHYCc8wb9fcdmgnM9GV0vFsGKCk9/pnzdLRuEe3u8kQF/gOSIt4JmUpWL8tOJ81hsMvQLrwncQHcEnvbhQYajz7zwIp3/6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRbUH1Gk2F/DqqOe3Lo8C8pbcAI8AgY8SLKVFuqNhZg=;
 b=p0AvJNXeBdbxyQ8twrH00xecuiwqwOTqFsbIA6rv7blSbx7s17c/76GvddWBEa+qnCnfs5AjaMuJEq3sjUA/pTTXKf1Mg7+zZr+ju4pwC7WhzJ7Od+S47ULOIa1IoTk6GvqLxKQGQ8Wscj6u6YekAfrxoh1UZFkiaIFlZpzz234M6wYX9hoJydulnwK7/mSUcD2FcJDKPOUyrfT9jBZx5hHp7tuMB8fT3bX2H0ptyF476nSa+WDRECaNvRIUfYQqebCO+bFx3fvMff2XTp34oHMtU1mG3Ven0ITGewHulsYar7xjx3yBf3ucHUmtwrQWzt0Nx79u0F+HXePCOV1ebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0034.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::17) by
 TYSPR06MB7046.apcprd06.prod.outlook.com (2603:1096:400:46b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Tue, 21 Oct 2025 07:04:13 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:4:190:cafe::20) by SI2P153CA0034.outlook.office365.com
 (2603:1096:4:190::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.4 via Frontend Transport; Tue,
 21 Oct 2025 07:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 21 Oct 2025 07:04:11 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0266F4143A8B;
	Tue, 21 Oct 2025 15:04:11 +0800 (CST)
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
Subject: [PATCH v5 0/3] Add pinctrl support for Sky1
Date: Tue, 21 Oct 2025 15:04:07 +0800
Message-ID: <20251021070410.3585997-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|TYSPR06MB7046:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 01167e65-69e2-4bce-0aed-08de107009d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M5tcC59ZyazJf8M6kxiBP8Gjuuo+vAZtlKj058O6D4hbGIgJ6yaoyAQWyJqd?=
 =?us-ascii?Q?8PqV627chLCEIdKzX/156eJU/VFtjTXllgRnlVbrbFFKZMPQqEBwpqHBGZNA?=
 =?us-ascii?Q?IUL2NGzd/HrRoxjddw2VErCYlXQExeKz7N7m15w+S1lcTx8b/QJsu26MUlTP?=
 =?us-ascii?Q?9tFBHtnO3ooXCgD40gczm415Aq5CMas9Qa5wWoNt04IWnsPdMfDIZQVfLZiq?=
 =?us-ascii?Q?HzUuuNsc9oK4yOC1v6wVJ2dlymDRUdXfEBibNpERQVaVlrhcwqpD3RWXC74K?=
 =?us-ascii?Q?vsLbQ0Jlc047LSeGve2nQTygjsyCzSnaCARrw9OdMOZBU4QRxXwY25ICPqv1?=
 =?us-ascii?Q?ZYGXpnevg2T+kHn4Sz33WR+P0hquTKDc1CJuBH/vcAdRZ0uklpPaCU3ZxyfP?=
 =?us-ascii?Q?djCtXsb3z3NX7uAa0jvKX1XWAIl2HDsTGwkvE+bsTxnm2dk/JGgmNy7lkPFY?=
 =?us-ascii?Q?nU0LzLal85Zv9ilwJ2qxmiGNdd3q41B8yzF1kHzBvXmBB+6dfOcpyQOTTY7Q?=
 =?us-ascii?Q?e9g8Ivi+fCQt7jpXltv9zrc1FYg1q8ioUEf+ErW8wRcTkipkFbATFk4/2x73?=
 =?us-ascii?Q?/vCkpdS4W5FJDOHoOSekODpLfRgSuwBKxjs5GeRc/pKnUDanAEdPIK0YYDm+?=
 =?us-ascii?Q?RWSwIYgHU6xH8zaLsaUrCuY9bUTOjG9jDGO5YhHRgmj2L/VOlq1DXmmrT+HV?=
 =?us-ascii?Q?LTMls6F8qbyyv/2Li0kkAn9dkL2AV8o5UrLuPTd+3/THv3WdsBvBc3BqnzfO?=
 =?us-ascii?Q?hgEWyZuyyryZhR76i68pfv9n26hTG+hmNbvsSXR6kPNvQ+sDi1Lw2vxyNs6C?=
 =?us-ascii?Q?/CU+zvJhFMHV9JQ00boPUVFvwQf9Rg8D7qCa1erGR6cSaJg94JZyVWsUekSD?=
 =?us-ascii?Q?2vKnHCLLC2Ys5x7x3dO2TVF2Orp3LSpNGEmL+QtbkRp612d3xHrfu2elLEIR?=
 =?us-ascii?Q?4uJgxRiWeT0xKA+oAAVOEBdIi61PYMMp6sGqDJbtJSG1F4dEjY4HiSIcnXmM?=
 =?us-ascii?Q?FWm16pZXaYbtZ2usgGxiF9MF8EnESGdOmMZgzSitbv4HQ9mxCeGd0ABQNUMp?=
 =?us-ascii?Q?8mTYvaC2rI2y3pYfQVbVtDPRkUmXAB94HjeqhRghXCorzpQNAbg+SY8o5KgA?=
 =?us-ascii?Q?h8Jq+0W5aj6Klahqy4bUM0zYJjIt6iZ5Evudh8hFnXTsAIyS5tapmdf8WUay?=
 =?us-ascii?Q?3QujxVFUDRA57Mw78p6oMDvlvxgaIRv8HpTMC8nRrAkihetxCCn4DYb+TnvG?=
 =?us-ascii?Q?WWD0Il7daJ8kTwaK7j7CjtnaLphDxTw6Ir1Xql0+JGwgAQxVQ3y2sniXM9Zz?=
 =?us-ascii?Q?gnCRebQiN6HMlfjymrlJuRfs/AWC2hh7rskf67iZMFMk3+dcm+ZvcxsSxSGe?=
 =?us-ascii?Q?RbOrWDmWAHTRVXPg8lecZI0yjHLl/+PshKw4xuZoaeUd1Md2rkDJee4hALmH?=
 =?us-ascii?Q?CSVBFvmPYWJCInC/MVuUZH8iq6Da8vxxQSPJaiH6nmPI6ZU67cuiSlnl66L+?=
 =?us-ascii?Q?wurDUxtd/eS+Suk6oaTFLdYuMra7jY31t8WkYxkkzf2qP9AyUOe+hnFp3v+m?=
 =?us-ascii?Q?HrACoUROoZ+GL5uBNT8=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 07:04:11.8675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01167e65-69e2-4bce-0aed-08de107009d4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7046

Patch 1: Add dt-binding doc for pinctrl on Sky1
Patch 2: Add pin-controller driver for sky1
Patch 3: Add pinctrl nodes for sky1

Changes for v5:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pinctrl.yaml
scripts/checkpatch.pl 000*.patch
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- Drop DS_LEVELX macro
- Fix dt-bindings style
- Fix build warning

Changes for v4:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pinctrl.yaml
scripts/checkpatch.pl 000*.patch
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- support driver_strength = <8> (mA)
- Fix dt-bindings style

Changes for v3:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pinctrl.yaml
scripts/checkpatch.pl 000*.patch
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- Re-order the patch set, and move dt-bindings to the 1st patch.
- Refine the pinctrl driver with SKY_PINFUNCTION macro
- Fix warnings when make dt_binding_check

Changes for v2:
- restructure the pinctrl driver to support pinmux=<..>
- redefine pinmux macros
- move header file from dt-bindings to dts
- fix the code-style issues

Gary Yang (3):
  dt-bindings: pinctrl: Add cix,sky1-pinctrl
  pinctrl: cix: Add pin-controller support for sky1
  arm64: dts: cix: Add pinctrl nodes for sky1

 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  92 +++
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  32 +
 arch/arm64/boot/dts/cix/sky1-pinfunc.h        | 401 ++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  10 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/cix/Kconfig                   |  14 +
 drivers/pinctrl/cix/Makefile                  |   4 +
 drivers/pinctrl/cix/pinctrl-sky1-base.c       | 573 ++++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.c            | 559 +++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.h            |  48 ++
 11 files changed, 1735 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/cix/sky1-pinfunc.h
 create mode 100644 drivers/pinctrl/cix/Kconfig
 create mode 100644 drivers/pinctrl/cix/Makefile
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1-base.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.h

-- 
2.49.0


