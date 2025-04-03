Return-Path: <linux-gpio+bounces-18184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFECA79BD1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 08:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F002C3B174B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 06:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FF519F42C;
	Thu,  3 Apr 2025 06:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o2y/Mjl2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2081.outbound.protection.outlook.com [40.107.95.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE30F198E75;
	Thu,  3 Apr 2025 06:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743660566; cv=fail; b=eAQgVvX8wlJ52/NKgUrSBB6JSwgID0LItzaQhjiWqsWZE76DmpYvpBI1zAds52r1hqr5Rv0Z+UG7Td1eWd67D4BY/hn6igrMDzOboZfFuiA2lpsIYpDhqCbR0jW0bcB8MbMCmUTwyEYHVqachf8xOnJ9DS/DhqXiVcWG+gAdoII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743660566; c=relaxed/simple;
	bh=J26X5DEHhsoiddHBhAvylGa5ascehO/gUpHgjMc4xdQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q2XcahtlDZQAwI4a2diqOzkj0GijraUaW6a2dhFADN4iLYH59Qw12OPGISjSjSQPuE0xLxLtaYa1pHqIxTgE4qBkL96/FtU5r9jlUTDtqYH/YW385gIbb2OAPPK2oA6Clc7GskejJOr+gEes/Ih2ZfgfafPX0jJY/kk1/Mc5Zjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o2y/Mjl2; arc=fail smtp.client-ip=40.107.95.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrFU7IddJI698HKJyxTuOAUYgRWaCw7ijvAf4wswEih2yI362w+fNoNRZCKNEXLR/JXb8DJyqlFRs4nQRf3a4ethXuUDbuu2f2Zg5DG+c6/oz0aq9Cvt1wr7bZrB8uft9oZqw5vEAAuXJPuNukRc5AKCGctn1tTMMCLRkl8a2u7rp71s2nqFVwk6spsq5EYmfNceXoXEI2yy9zhdha8Y3IKUy3KONZyt7ubctfsUzsPIyTNygC1CaozX4C4oik8OjKV7Kx1nb93QQQZaT5erw/Sc197GLQWOLJnF/DQMJE7kHBwSpgVHCQ2kCDckWecdUDBNosIKc36nlWz0RkDoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+I0kNEG7+cPSApd/MI+RCWglu1hfaTCwGjTOC8b+uU=;
 b=pVD+pW+5H69sQTjgbuUT8dTAZ+K3oAkzzj36qeqn8aZFJxq4eDJiqYFOZQWJzFEAWLeW5RCi+KLu2CZX7LpPnktLPz0eijSz8IhtHSgpUj0TiZsheqiin77ijrWgqfLBq9IMptlU4HnmuhvCojKNbKYNmngmQIt+c6H4AbxlmwXX+Nq+Hxtd1NapV0k2782mjusDUwTjzh0kymOpI5+NdggypZ2ApnL1iL7iXk9WR6QiAQ0RSxR7BgAlkgbFBJzlwCr6bouX/eFfmvnawxdPkjXg2EyTlOX5xkmkWyoBkZFZWOTgcUQtRyz5uKOLgeXwHc5odVzoMZ4LTflpN+ioyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+I0kNEG7+cPSApd/MI+RCWglu1hfaTCwGjTOC8b+uU=;
 b=o2y/Mjl2TkYR+aaRLxSvCvMLWntBMXeun6XCSgb2Jjcy+E6J5UsMuw+SMOWq6TV4Rxix3lqZePED2D0GGUsocSgPQ0WEcYkCOZGgjuyesTErzBkxN++DH0CRIDVpLVUnQFwzaW0byyIvHMsbREwm2hVuKPuBr2AiOYXJnL4mc3E=
Received: from BY5PR13CA0011.namprd13.prod.outlook.com (2603:10b6:a03:180::24)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 06:09:21 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::24) by BY5PR13CA0011.outlook.office365.com
 (2603:10b6:a03:180::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Thu,
 3 Apr 2025 06:09:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 06:09:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 01:09:17 -0500
Received: from xhdmubinusm40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 01:09:13 -0500
From: Mubin Sayyed <mubin.sayyed@amd.com>
To: <dlemoal@kernel.org>, <cassel@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linus.walleij@linaro.org>,
	<brgl@bgdev.pl>, <michal.simek@amd.com>, <p.zabel@pengutronix.de>,
	<gregkh@linuxfoundation.org>, <radhey.shyam.pandey@amd.com>
CC: <linux-ide@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<git@amd.com>, Mubin Sayyed <mubin.sayyed@amd.com>
Subject: [PATCH] dt-bindings: xilinx: Remove myself from maintainership
Date: Thu, 3 Apr 2025 11:38:36 +0530
Message-ID: <20250403060836.2602361-1-mubin.sayyed@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: mubin.sayyed@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|MN0PR12MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: e81f7246-6488-4e46-7982-08dd727612b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hzvDd3yI0TubJZ/+xwWFjU299gCO9ISgOtaJAt9UT+lh9lMmzJDFvpcKOdCs?=
 =?us-ascii?Q?w/AKaZCDSY3Thm6WWQwj+A5JgI+GtafD/mb9kLJelXGhjjhuSp07AD0fFY5j?=
 =?us-ascii?Q?5LJfA8rNwizgvmcOd45x2a5DlXwdfKNyj2j9+ozY7lG1ToNStrnxw73hhKRK?=
 =?us-ascii?Q?YppvIt6JTn0XuSRY2IJXAOeQqBIWLgVq2G48tpVbcBKoAO2+h+5k8cQdRYg0?=
 =?us-ascii?Q?VyEC6+ZY5B6C/P6yArX6IeUM8R/87my/4mtF26hqMgOy6EbPTchM7lzEtMFW?=
 =?us-ascii?Q?HTHwGGLq4MBCRFGU9HMRAYTaziy/AECO6JdcHHPsggf5BPdVGbdGADXybdkf?=
 =?us-ascii?Q?+2HHocw/o4kaT2qbM8RlxoHyEna9cKYrSjlU1ov9KquuyQVf8idZa9L0RegC?=
 =?us-ascii?Q?JA4FPUEr9sRet5cQ4qio1/zC840/3AGhT0UR8Tz6blCDA7qYMPe7Cye7EzxH?=
 =?us-ascii?Q?Gw9az6w164HIUO/OiqylHxL1c8a5XPFqO6fy1Z3QIo66Fk43tu7lndlWrThD?=
 =?us-ascii?Q?XAjomhTar5FwMHNPeeNjqhOh/PXUbKoP8BFFahYBd1wJekaLpTKJDYEZ81Xd?=
 =?us-ascii?Q?eH+CWzZ8lcM8kMmfsg/AOtuJ4XOjMtzxamnE6pothoHUZ+vVGIyvFdezQ9Mn?=
 =?us-ascii?Q?erUFvoF92fMHz9WseIvOljeOM4z0ZzK9e9EJyXa4dv0edz6U5DOgiq4E4R5Q?=
 =?us-ascii?Q?UxLPOe4+YPRtqrIn9Xj/1sCJWb/xUpDcDyUklyz1EEv/mu0796EjH4bgyz9R?=
 =?us-ascii?Q?PsWb93i47fVlgdj5WGOgCkNgIOjhwa72xZXrppNO6pgjCwT/l22y3tcVRdhf?=
 =?us-ascii?Q?QZWcDXx26K+/LgicliYJ2GKZ5y4OsYeeZsqhDlDtWyDjKhNYPJSuf5ngLUGp?=
 =?us-ascii?Q?UFvhMpewHBoArADGhzuNzmrP3w78k6hYE22LUMseHBADnFpTZFn97twMgGIU?=
 =?us-ascii?Q?/oDEgzy9dtr9DqgoOm10Zy5Ra7apQx3/9iO6bhtDRqucfJH6Z/MSAJcEi8hr?=
 =?us-ascii?Q?D0L8uWdiVBMV4Hg4j1jON4N0SSTSKjPiUOMjyIkYjLtifogR+V8NFSV8yO/u?=
 =?us-ascii?Q?Wwfj7Px5Qj0ds2lKxzbIK2EXGc9AhYXRuQw4Zcsf+29jaQbxAWgSujkcNQr9?=
 =?us-ascii?Q?4+/TM6PSOYcCjV9sJ42RLDEZYTEZDf/JAQg+SsTnlg4acoZCCFOA5G7x00OI?=
 =?us-ascii?Q?QYyCyNf1b3F5yyzCm/LAsljUK8s8DtYk9Xn9qHqnav2q6c9xcmTGcB7Mh3aF?=
 =?us-ascii?Q?ymhFNCpw5HQ3T9hT5LmUamMl7nBH6sOLnoM++WmcnyyT+2BxYAPXO3aFVIKq?=
 =?us-ascii?Q?9eA5gJ+cKOTMH/PwlM1eUYOKSnYm4D6bexF9unVOWtB8CpGqkMHBo/MFJwE5?=
 =?us-ascii?Q?bJg1tQO3UJXvYchaPWRpdSvz+CyRMML9y+lmVN6gNFAE/scfgLnIHx9r37KP?=
 =?us-ascii?Q?qSn3pkK8Op6vcJqAc/bBzifhlH76vzLZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 06:09:20.0531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e81f7246-6488-4e46-7982-08dd727612b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032

As I am leaving AMD and will no longer be maintaining
these platform drivers, so removing myself from maintainership.

Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
---
 Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml        | 1 -
 .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml       | 1 -
 Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml   | 1 -
 Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml           | 1 -
 Documentation/devicetree/bindings/usb/microchip,usb5744.yaml     | 1 -
 Documentation/devicetree/bindings/usb/xlnx,usb2.yaml             | 1 -
 6 files changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
index 6ad78429dc74..c92341888a28 100644
--- a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
+++ b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Ceva AHCI SATA Controller
 
 maintainers:
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 description: |
diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
index bb93baa88879..e13e9d6dd148 100644
--- a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
+++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
@@ -12,7 +12,6 @@ description:
   PS_MODE). Every pin can be configured as input/output.
 
 maintainers:
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml b/Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml
index 1f1b42dde94d..1db85fc9966f 100644
--- a/Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Zynq UltraScale+ MPSoC and Versal reset
 
 maintainers:
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 description: |
diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index b5843f4d17d8..379dacacb526 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx SuperSpeed DWC3 USB SoC controller
 
 maintainers:
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
index e2a72deae776..c68c04da3399 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
@@ -17,7 +17,6 @@ description:
 
 maintainers:
   - Michal Simek <michal.simek@amd.com>
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
index a7f75fe36665..f295aa9d9ee7 100644
--- a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx udc controller
 
 maintainers:
-  - Mubin Sayyed <mubin.sayyed@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
 properties:
-- 
2.25.1


