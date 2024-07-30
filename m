Return-Path: <linux-gpio+bounces-8442-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6C49408F4
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 08:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74CCE285066
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 06:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE06E18E758;
	Tue, 30 Jul 2024 06:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IP/zOgQ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003F15D5C3;
	Tue, 30 Jul 2024 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722322558; cv=fail; b=h7oasnoEF37WpKoDmABaksZs8Pf/b9qEcr40KRwKxZNWMG8XgZcrRDz4DwzX1S0YuhNqnIqhXJqS6WEmBYpuMc9Bq/pML0gckRawhB5E8DrlCsApsKgHfC1uQjiOPNbGNCJ/jwk87DRu1oj6qpZOiglnO/t7XbrjGTolK85/UfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722322558; c=relaxed/simple;
	bh=JHPN4KNlYl9xOhUWKs0vOqyW6ajYFEtq24lkYGd2kAk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tW3hlYufDJFxSmRvExm2SnH1tRRwj9SxCvzHFZn8qa7Nu3JS0dLhXHjQvFNHM8d1eHs8BW+YckUJAEh8vzGdm3NKw6HWGA63uXg0OeMHfISa11LFHNX4j/Vg8Q2aWqWLFF07d5BV1Mo7r+BglB5ARJvscIvV8t2wz+o7Ej+LP1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IP/zOgQ1; arc=fail smtp.client-ip=40.107.94.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fM1CwQVa9qY9WJgPiVjuD071H0WWpvmTp/2hDrdRQy0nBm/E/Sk4RcH/me7/idfvhPWklFVOSKl9VoPjuHCBsK40cyAtMY9FPWaFug0NErsJsUOrxhE9QwvHyoW5de5UluGfam8r+IGibmTZY+vm73z0abfsZjiikPIQwRcaJoukWW2FGaz9KcZxAzI5l/ag5ANgfx46K+T1klct/9iQ3GKQYmtHgr6zcoYHa9dIbuPRg8R5095dwwJYV+u5cnhkQsIpfRwiG+uqIn6SNvtwns8bHuRDGVH7fuYo6KEwfO0se4p3ojRuArjxCVs3SUH+Duu/0AUXhFj3ZKqkzeGoog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNs2E5d2EGUSGgelOWvS/f0+Lqux8G+nwil0sNfzc8c=;
 b=Fxt6SPAUsRe+wEQsd573NjpGQ/PXoE8AkOaO/9d1vTpFowE+tOFumat4afj2QZYn3/JW2bAjm8xUSUTFwL7DPNYAQyD6O6CADMdxJmYqGMd/ZxfmQqiS1z+mHXpDxeirnvW5KytqDEXAohyVCslo87snoRDtxq8YtUnV8GoVj5yg7F42+uYfm0lPrnW4Zog0ulF6Sl9ZuLfJqEr51w6gUrUA1BykE1frIAq6yeP/uSh4qgHKdzkZsQzcp4ttmWEqac+Q5joObCVBCTdSVV9gCrZu5iy78CC86XWmNsLOsKyo5hg5gQNEPnNUnOUoIN+hWB4mmfSjOR4IWcORtx9IJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNs2E5d2EGUSGgelOWvS/f0+Lqux8G+nwil0sNfzc8c=;
 b=IP/zOgQ1mKYEc8+NIDvEjkaKIPZpU6cJRsz+9GFm9fYsfhX7kKZIgFX9Ei8qfP5Hl5OL46qJU91ozqiWPgFFwgVRfhX+NYsjIChl7XwHXfMSWojJF3o6+wmktylYk9E/YSGyck0oFGqlJ/+wVBpwf36Yhkv4wy+LUKtffSYJ7wE=
Received: from DS7PR03CA0021.namprd03.prod.outlook.com (2603:10b6:5:3b8::26)
 by CH3PR12MB8911.namprd12.prod.outlook.com (2603:10b6:610:169::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.30; Tue, 30 Jul
 2024 06:55:54 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::69) by DS7PR03CA0021.outlook.office365.com
 (2603:10b6:5:3b8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Tue, 30 Jul 2024 06:55:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 06:55:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 01:55:53 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 30 Jul 2024 01:55:49 -0500
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
Subject: [PATCH v2 0/3] pinctrl: pinctrl-zynqmp: Add Versal platform support
Date: Tue, 30 Jul 2024 12:25:45 +0530
Message-ID: <20240730065548.1371518-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: sai.krishna.potthuri@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|CH3PR12MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 16272b02-71a8-4c8c-9796-08dcb064a808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I/qmCzTLQV84FliK6k87IVZOjv8q1ipf18o+lpyjdlfQD0HlwfFo/pMNKOIU?=
 =?us-ascii?Q?ZKeXdpeb9mhIaU5qMjtXUbvHqhzQWFVVYK+4prxf+XsrOLqc9iiBmuqw1n1f?=
 =?us-ascii?Q?G0rns1rlNZrrVWF4R4JGz5jo+Dxk2IcaXbP1uU8VLl9ZiOQPzSUNnZS6fXW7?=
 =?us-ascii?Q?Ad6pCTXgShfG9+nl9sU22B45clMy0LnsSb82BWmKDht9HghjnsYNwHGq7ui4?=
 =?us-ascii?Q?RwxsL3LHiamtKMX/t5tn75Ys4DYdxcZGc5MoQeY+4aX1a9C5vOrvdKceKssu?=
 =?us-ascii?Q?C1/p0s810UgauzzSqddWB1uUgIxprfrP5wSyzq0bw3egOwoqZUQnJPmpdt0N?=
 =?us-ascii?Q?2N6W8BHZBGc/1ulgxwoYx+WhmNxfwgQrfo7hsRUWlhf3PzB+8njfSFYwR5nw?=
 =?us-ascii?Q?4FfFoB0772p9Bh17R0haN2/3P4jCQewkWMezb/y4JYzt72jo6ldXEK6tGl4x?=
 =?us-ascii?Q?mZ+1CN9MJP53cmsd1z8/bzRWOWSbIrL84Qz6dhufmrFAyuALlNjA8Y67Elsn?=
 =?us-ascii?Q?7wuSJ9HURE7Lls6TVTzqUavl6Rhqi3dQHcHZ+9bIwHKl7Sb+LVp3pVG5FVHK?=
 =?us-ascii?Q?NrqL/L80p4dHx2S3ua+Yaj0vX6D1kS6Je+MuDpPU899/3y7ixo3SGltye/kF?=
 =?us-ascii?Q?/91JvBwsGVRqv0lAzzicBI6xYihGTf7Vml2vFJhG1KtF9CmTX9Jm7EGFjRq3?=
 =?us-ascii?Q?j4Y+N0G4Ql2p/f0DviVvTGzqBAOE03A5H3XLK1NYfwVLJeabBNBL57DMuCLH?=
 =?us-ascii?Q?VWXgQFxs3CIK0GYOPYoisOb0rtozg/Brmy4cr2SbHRRQWqbQ/7b5XUWY/LZv?=
 =?us-ascii?Q?I2ARa4Jpl7HxIqF81rmQB4r7wDAt7335qbFQdARGtkdhEj9KpsgMmkZNFFa0?=
 =?us-ascii?Q?LU5QTpigJMzgyDT6ZfFmq/Jh3KSJzev0ACVzGJiMx+TahJT6eYSza1Gm46Ij?=
 =?us-ascii?Q?1s3+viy/CfhkacNbptemv/6VNserAZMeezt9dxPl3TJh+hnewB0M4TeGZnZ0?=
 =?us-ascii?Q?mD7YjsFftDsAVMNwony0SOnnlBkBQVNhUTILURzHKv9U4ZGpLtdkGi38iXsZ?=
 =?us-ascii?Q?jZQ6wUbv5PS0brClOWfn0EDCl/Ppk/1apiJGioSgnO2C/ESRmZ7etjXqoKvs?=
 =?us-ascii?Q?I5LtbwkgJBSioTiFUdrGeDK1uDH32RRVptYcpbpaORghwLwJDoEBgBLAsq1E?=
 =?us-ascii?Q?neqWE2orgKRKMRuwG5y9wnk59gyvkEqjQaSX7EnDoSRtYyE8ZxSB8oseXZya?=
 =?us-ascii?Q?Bw7wCvtIj+4rb3Kk/lClLGRc56wxjNoOKQn6Tfx4XT3SFKUdNof2x4A1CXld?=
 =?us-ascii?Q?2qfXHQrRbmfn1knCYlPYgyD1OdgPJqeCB4JgRU1rKRNscHzYZWil95LyqS7t?=
 =?us-ascii?Q?AeeOjjARz0rnSR4Yaw1F7lixlwxAWeMqPSjK1PpLHZYXQzcMlnb9+8NqxgPe?=
 =?us-ascii?Q?kb+Ps9z+Sq3dwwEOqraBou8lsnJNzzD6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 06:55:54.1027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16272b02-71a8-4c8c-9796-08dcb064a808
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8911

Update the binding and pinctrl-zynqmp driver to add Versal platform
support.
Add Get Attribute ID in the Xilinx/AMD firmware driver to get the pin
information from Xilinx/AMD Platform Management Firmware.

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

 .../bindings/pinctrl/xlnx,versal-pinctrl.yaml | 289 ++++++++++++++++++
 drivers/pinctrl/pinctrl-zynqmp.c              |  97 +++++-
 include/linux/firmware/xlnx-zynqmp.h          |   1 +
 3 files changed, 382 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml

-- 
2.25.1


