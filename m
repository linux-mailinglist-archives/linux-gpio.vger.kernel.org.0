Return-Path: <linux-gpio+bounces-8516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A31F944AB6
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 14:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5588E1C24E69
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 12:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668A819E81F;
	Thu,  1 Aug 2024 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hVXxq5/0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1AB1741FA;
	Thu,  1 Aug 2024 12:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513640; cv=fail; b=tsf8bRpfWFUH7b7SzpdeLH5jhCMHGuw/KNUjE4yBxO3zAlHqtZdlaDQKvBk08Xb1e961qG0q7wuxAMeviF5eOVnCttfSwuT9KZfBPUZ3mBNu7MqVlBdn5H1yvXdFWtJqQIpYxRjzTrrTh9fG10R2qc1m9i61kSTz632sl6jbo1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513640; c=relaxed/simple;
	bh=1GIre7aVxeYdSh45MG1HiTYIRRdByKWtBegO/kipHlc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YNLY4pZJq6792xYsdMUeOBzVEBkxp2Lt1AE42xi/v637TrtObdMy/I1YokTh68+2mFUPNnjGILkqNdMZCHgh+6l+PsURmOyk2o7MLgbxedRNjozAjxrQargj1+ScKW/6+zj9aFzlkMhUkT9dTStVDC/PO+sqJa52yj9INFhjqIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hVXxq5/0; arc=fail smtp.client-ip=40.107.236.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQLed4y8vcOWIAezTNL3LSmF9x5oGHJLcmg8/liHzdQ5527gJCm67Jcq/w1z+ZOpJxeFB57AUnJCVbUuPLCRn+JWLg9YDu36bDHOo7kbtGqkvuzKWkM6ussU22IEufqCbqkVv1/cFAnND353jAAqs0j2FODc26tVQGhJ0vKP43neImghUSEydXSKebQhkBJIi9o2F78N7vBZj6BTHy9dV/qlv/8+iNgcoxEzB7Y3vk2fT48ewj7/osrW++VgmPcrpACKZGpPblRh0sHfnQgrrvSXDf+yMaRh8UM1caW83kz5+zy5OgjMetTSZA6Mtxt94W+BQqUxObMMo6rlaF/+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRjF29+l/Gp9On4fgD079p8k3gzhuOxeY10ZewmXWJE=;
 b=mm2vgUBlfqsCuPGdS/ZnMpQknbhFFa6gntE2Cpch53269BIDZPtS5v4a5sTFvXs3VOD3tH3ssUXuBm0gW0tHmQ7rbTndqpXPKXQGs2An9Y5Wgp6BP+YqNmaAOpRxW3i/c8GNn2x/YHE6Qn/DCxEtxRYa/BKQGBe9PDEtCX/Xz2/gye4ktKfxcpP5CLA0TnUgPi2nfsI4BfaNTWWkCQHjQLBC1npSxbOw/CdXCrbowOrYwLEmZTJsigrHASaqjSAx+HOnKAQYLuwECzu/r1Rrg2OZFsUaYuaaS6McZXrdhToxqJbizVrgms6ACTCHLMX/FB3zg6yFhG6WaYtPxNZ46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRjF29+l/Gp9On4fgD079p8k3gzhuOxeY10ZewmXWJE=;
 b=hVXxq5/0CrqKirabVigWWneFVrjXXFuuemiPoBEEJT+rZdBVVK8SNzmJVizGub1Dya5Gl5PLDh61eSYbkuaMEL4/9HEKm8HFCb46UQ6O8TeEqaC8imEp384zBWb92tsjZ4jH+DaoUjvtXRuVyGLXBE2umJDXeevrl5m1fBypJIE=
Received: from CH2PR07CA0047.namprd07.prod.outlook.com (2603:10b6:610:5b::21)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 12:00:35 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::a4) by CH2PR07CA0047.outlook.office365.com
 (2603:10b6:610:5b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 12:00:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 12:00:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 07:00:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 07:00:33 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 1 Aug 2024 07:00:29 -0500
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
Subject: [PATCH v3 0/3] pinctrl: pinctrl-zynqmp: Add Versal platform support
Date: Thu, 1 Aug 2024 17:30:26 +0530
Message-ID: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: sai.krishna.potthuri@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|MN2PR12MB4221:EE_
X-MS-Office365-Filtering-Correlation-Id: 3779caf7-39c9-48ee-d493-08dcb2218d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sqawm5JUbxXIj4lYz7hIvA1tDgQ2FNz1JrdXTWsUmwh0TTDgPupg+IsLj/Q2?=
 =?us-ascii?Q?xbkWcsW7rYPCavBMDsVNmVMAXJAHdcjI9TtEr/nRtRoRnn1/KY77DhAT8O+1?=
 =?us-ascii?Q?rQ/pLZ/9wDl/q1LggjRq1HlXniZyv+Xz945XI+TMnUKUHY85EMBO7Oqb4Sqx?=
 =?us-ascii?Q?D12dZFKnWnwfrVeTOV+j6XgS82IHY4FoqsV5hiDnIOtuQo8uDiUSlIUzhqtd?=
 =?us-ascii?Q?/1L5xLSYiBPw9y9aSTzY4UcflbnwHXWlKIATwLYVQW1e2g+BcAJaUfZzqSBe?=
 =?us-ascii?Q?MLOKvqOx9wTjzBuTOl+/r0C09rUxNOBgX6Vlq8vpWqQeqnedbGy71wQhkts4?=
 =?us-ascii?Q?yTB1XT7rCXbYB1APeH0UU/jOx+fhqlL12+G8ELakRiGkSMZeR3YUk16kcUCC?=
 =?us-ascii?Q?kQKFuJItVqcJ7y2v3yf3sS5Lykws9CwasqaFu8x/dD0PTl8H81CtpiGtA2MH?=
 =?us-ascii?Q?djzqgIIxH4NBwcYcJ1WupueUZboMbh3cZeKddzEjyvAECMAjvxvknY2gMRSd?=
 =?us-ascii?Q?ow7CdaNor3QvR7eAzsySi8N7dt7t6BzNrpIsvPNYXrrUYOlhHoPTVjOLb40g?=
 =?us-ascii?Q?+g69X73Mm0XI8N1H8RY+5x8Q/n3BrMWltIkrOjSZZoaUWaHcn/0xkMNYserC?=
 =?us-ascii?Q?A8xoCe3MN6DogJXLv03QHey8F+ozagdkOLD8QMOGJWTZKhIcskE1zEMDZHN6?=
 =?us-ascii?Q?1j20HZ1aieZa4aCS7pJvfBQlEfIvBnwcK1TvtW9f5Gtx/9ivL8UXPwe7m1Id?=
 =?us-ascii?Q?5pGSyzTNFOoibOa+8SW3cYyHKaMdGOckoy2LM3+XT1XY6LoI4yMsiLtgTBfi?=
 =?us-ascii?Q?PbPr9clcQilLIY0FI7gAoe2WSorJiLlysdnv2g5SPI/15B+TdyzvSytJfosV?=
 =?us-ascii?Q?3zo2JkgAGSphxajZO7RMftQbZWhJNW57xq6EXMHGts48Ok1NC2s0HA6Vi+M2?=
 =?us-ascii?Q?YaWsvdL71v3qOBG8O0aqooKD33LDZJNP6MaiObIE5nCmr5LIrkB3eNrf+jRJ?=
 =?us-ascii?Q?nLfRCDHx0cjmctu+mY6PvXhAnqu7s2IzcUNW18NV896H8c+Z1f5hnZjqY1DA?=
 =?us-ascii?Q?vrl/iZykAnO3fCuY74NasBeSsL2sOcEnUk9zAj5L1w4Kngj+D8Cftt1sTNXH?=
 =?us-ascii?Q?X2fG0P/FkqKBA/PpnbuXTCjmoWWCiUAT8rPRLxpj/kSisqxB+yHyOai0fzHN?=
 =?us-ascii?Q?0mPilW74gWavnM5Nx9B/CUlBR0YHMhJGMQ1emSx0YGJVb2mkm6OjuvLPqBO3?=
 =?us-ascii?Q?sirkB7KuQ4aQ8L65axaoq4RwGf3Agv9rj+qPmSs1wZopF60JawmgljHM656q?=
 =?us-ascii?Q?Lenb7wXw6KOqOj/t1mCd1T3giaZfHKcX1oqMz4RIzgPQw+xuS/xfYn/RXTiW?=
 =?us-ascii?Q?Atz3VyIKpUOlXxODwCWFHAnGcnA/A1k7kTxtuy1ZO4EnO7zdRXzr6zic7ezx?=
 =?us-ascii?Q?p7XrghhCaT3f/Z36d4gDgS+R/ekZD1cO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 12:00:34.9095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3779caf7-39c9-48ee-d493-08dcb2218d11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221

Update the binding and pinctrl-zynqmp driver to add Versal platform
support.
Add Get Attribute ID in the Xilinx firmware driver to get the pin
information from Xilinx Platform Management Firmware.

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

 .../bindings/pinctrl/xlnx,versal-pinctrl.yaml | 398 ++++++++++++++++++
 drivers/pinctrl/pinctrl-zynqmp.c              |  97 ++++-
 include/linux/firmware/xlnx-zynqmp.h          |   1 +
 3 files changed, 491 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml

-- 
2.25.1


