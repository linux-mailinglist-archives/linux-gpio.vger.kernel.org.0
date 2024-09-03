Return-Path: <linux-gpio+bounces-9626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C4969B27
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 13:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44233283CC2
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 11:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80001A0BFE;
	Tue,  3 Sep 2024 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="okUryFeF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FA91A0BEC;
	Tue,  3 Sep 2024 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361650; cv=fail; b=MAf+++cex2S09oMb0Df8nf8oYFyoNViV5ycRMx/rOC0qEbLeMxo1rtr1Rr0ejsrM/+ALG+xw3TsxZD4PV8dRo2UgTJkVOx0Ylpci1RlpYJqiOwjfoFSR1AhNruRIhwo+hXaRFGqd7yLNFmKmCXi5OetL5Z7XqrefvUd+AvQf+78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361650; c=relaxed/simple;
	bh=bbLVf1DIGBslo+nRRsn8l2mPO4Ywu519bnPbHTUoDVw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JbKMKEXjr1/84WANKdSRRMO1IhwrO/6E5dct5/bVPEBoXP6xWe0o/0hfxCYzCSt093Sj69X1Fd0Ao+UR2xUyh0FaooP5epWFhcPBOgM3su/ADLby0U5R5EmlfkwI3kRP8OAHAdfymsZGVhANLoqg/Tl544EveqCmCbntFhM4VSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=okUryFeF; arc=fail smtp.client-ip=40.107.96.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbvqhnF/IZs9sgi+sD5AXaa8wA0Eok81kz3ftBKzYxIMLtWeYx7034g/Jyplz2UkakKl8YhS1ucZiC1AGse92DGTCCnYprATbGdnwQGx5jI++Oe7Bw78lXIxkbAf8B11SqM/v30eJmwOqjustRNGQRxsRsQohfMP9IU6j2i5MR0H9h0Zj3jCpqjQbAqm3W7X1fFQ8cywHP4s7nDHnxbwRUasxpVfjdJjXHmS/ux3fzli1Qjz7Tsg0qV2zGfSL4HcozpgF9csAC33mG4Xp8PnpdDbPmCrmTilH48/MmcSLz/GFHyXIkMBRGBRHp5oW2AQatn6ZVTkX2Sdy4q9XXZO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKdZdYxShb7nlimsc2twtxqP5fI4F7S+dC7qz3LcSS0=;
 b=c+TmLXX6u3mnkbr+sc0ZJBib1D4td9PRdqSm5kwo6RFdBaLkf8JwZB21UQzvJxnR0tLWgH+6BqRlUU88y2JLBJUidnP8lUb9RMvZXCXNVYHNbP91TOwDITRiWRBvbmqoEB+VZgt5SJKiF6hWrdeLkKaUiH/e6xcy5ty0pJyjE8HTjX2sjzO74dqXhq7BXJDa37iTWb8+xic9QJVh++lasL1dBhDzymePi6QmGNkkrduEdfhv1cm+DGHYS8HUpmuxk42hE5t2kSe7iosH6lbgwR/L6rX4v5WN5aHnuBGWYkgod00XB+DQIpUvn8odx36ZcXtAcGfM/MtC9Q//X6b1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKdZdYxShb7nlimsc2twtxqP5fI4F7S+dC7qz3LcSS0=;
 b=okUryFeFeQ9QavsknB2Yw8cYCwHO25V47LSXqdScjny5hR55H0+E+LYzvgzLxGHTU4WKEFX+B9gV9SIuKyWI1ZyDhkG1OrxoyHlESUJOjfKhO3RWMN73bd4IrHGN+1jlHUmBvEkQF7FwfncepMZknUtTTnkT78OULF4Mcr5hviw=
Received: from BY5PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:1d0::27)
 by BY5PR12MB4290.namprd12.prod.outlook.com (2603:10b6:a03:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.22; Tue, 3 Sep
 2024 11:07:24 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::e9) by BY5PR04CA0017.outlook.office365.com
 (2603:10b6:a03:1d0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 11:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:07:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:07:22 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:07:18 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek
	<michal.simek@amd.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>, Praveen Teja Kundanala
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v4 0/3] pinctrl: pinctrl-zynqmp: Add Versal platform support
Date: Tue, 3 Sep 2024 16:37:14 +0530
Message-ID: <20240903110717.2283362-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|BY5PR12MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b188bc-37d3-4245-073b-08dccc0896c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GgVW9k+EUv1LkhTpHRFfolC4qsy4vdU6rjml1tnUMh9apuS6IjuRpuCItjhb?=
 =?us-ascii?Q?lHBE53Ue4/90kFpfePLmbosTnue/zRQuR6z7iQit8z7cCRDIcOGDSZw5B4qD?=
 =?us-ascii?Q?xY5x7Z2IJv8puAMYlJ7yeSwS07kH06aGhjXmxTqgmeaTebPI00Xih95JWEe4?=
 =?us-ascii?Q?eMA78sxJ6enYtlBD/B4JMreaqn38cIkdW3ys37T6R0zWULOr5tAW3Xb2el4u?=
 =?us-ascii?Q?u8Y8zWI2mBaCNORVwNW4hCI+yod0TVk3XvbcekNLodzuhDktN5rdsI89kTe/?=
 =?us-ascii?Q?sXywacbQXnvE33SgJsCR7Xu+zJRb10hzaz3fnXqC5H74jYOsTPTGzRo73hNi?=
 =?us-ascii?Q?d9WEvEVXZ7KzypBw1UHEZviN3tbAwGKRgVK+QR3WdRj6BqZ0KkW/RVfcGHvB?=
 =?us-ascii?Q?Kcn4we2bCVbUWATBelHsuaTydZ0CHaC301m5AykVM/0UUMBiVE4WcE0481Mi?=
 =?us-ascii?Q?wRGiQCcJh9TqQ8GJDqqEOG6EUL+7jrq0K2AywxqOnoYQgtsYRwPwQ0EeFJmN?=
 =?us-ascii?Q?4P35xaqJ+OlmLE8azuhGx1Gi641CKL7TZl97gL7NsMRSSdsxy1JJIXTs4CWA?=
 =?us-ascii?Q?CGtZLcCvqBsskI9Y/oYhT6ysryt+dlQbIdKC+Pz0HBVWHvnrvpy5fDay2a4d?=
 =?us-ascii?Q?vWAF4uuM6CSbK94i4z+rk/kWKagaxebDV5TKKqm5SEjTGRty2WqeDWt1MdAO?=
 =?us-ascii?Q?Bv8xrRDUiHR7HTChr7nEdCFt3kttJzRdvY5tAnnMO/aIJCMWD41bBUIS8qXY?=
 =?us-ascii?Q?G5xMzCDKpRCD0g8AaKMg2gJ7MdPL/efaUWnLfhytjIqvufG4/Bhh0F2FXlO7?=
 =?us-ascii?Q?Rvm35jja6OoofyEueoHWgA66zNqo5hgFoFB9efy27nYWglnhSyQ3LZUcJtUT?=
 =?us-ascii?Q?4aptaJThFneqQ751le5TEcDyKICEpPFf7SYWA+zMhmF06DPTUjhmq+H6OleY?=
 =?us-ascii?Q?3dS5dy2owmCmA/O9zOdKctnlJfbijxlDd6+tgYDWVuR3iy59fJUxxVrbDbyn?=
 =?us-ascii?Q?A41U0kjXY+ClIA87KKMariu0EuTpP/d5pAJq3euiUS7Oqa+Ei/oPQGUIXIA2?=
 =?us-ascii?Q?ySHN5+qvCuinLuWrbNsN/qE54IOpnLXgX0kAkbkaRovYSKPE9DJ3ukTiltqP?=
 =?us-ascii?Q?Ofko1t742VQ1CzhscJWJCnooCzuPU6F4fp6cAC3JRQ3HTHxn0cyQZ9aMqftp?=
 =?us-ascii?Q?fy3abaCXioCadfIfNdoA7RLLSK5xCJOWoruqR+Kg4I0htD2e2jQTpBGfEcC6?=
 =?us-ascii?Q?lw+dkDqgGaZO1aUVcp5GI8BOK0WE/fmZFOJHT93WOk9z+RfQo8m0zg5jsdxo?=
 =?us-ascii?Q?cO817FPAuVSMvOV2T6vIKXqeIiD+4BEsRMHv0pO0uSxHMVwcNjH00MJEmJSl?=
 =?us-ascii?Q?4Ln3NRinVdPMGkVwgK6mvRyAAPc7yslTToeQzJ6rqxvIhzcNMqRfopAz+vnS?=
 =?us-ascii?Q?GuXTw3wuV29QWu2PtiGg+bmIIZwPh8XH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:07:23.9529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b188bc-37d3-4245-073b-08dccc0896c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4290

Update the binding and pinctrl-zynqmp driver to add Versal platform
support.
Add Get Attribute ID in the Xilinx firmware driver to get the pin
information from Xilinx Platform Management Firmware.

Changes in v4:
-> 1/3 - Defined minItems for the properties, dropped the blank lines,
         dropped unused labels and unrelated nodes in example node, used
         correct email address (suggested by Krzysztof).

Changes in v3:
-> 1/3 - Mentioned all group names in conf node and also defined the
         conf node properties in $defs (suggested by Rob).

Changes in v2:
-> 1/3 - Created new binding doc for Versal platform (suggested by Rob).
-> 1/3 - Update regex for pins properties to make sure it always starts
         with "LPD" or "PMC" string.
-> 3/3 - Used firmware API to get platform information to differentiate
         platform specific code (suggested by Jay).


Sai Krishna Potthuri (3):
  dt-bindings: pinctrl: Add support for Xilinx Versal platform
  firmware: xilinx: Add Pinctrl Get Attribute ID
  pinctrl: pinctrl-zynqmp: Add support for Versal platform

 .../bindings/pinctrl/xlnx,versal-pinctrl.yaml | 385 ++++++++++++++++++
 drivers/pinctrl/pinctrl-zynqmp.c              |  97 ++++-
 include/linux/firmware/xlnx-zynqmp.h          |   1 +
 3 files changed, 478 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml

-- 
2.25.1


