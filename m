Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF3254361AE
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 14:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbhJUMcz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 08:32:55 -0400
Received: from mail-bn8nam12on2047.outbound.protection.outlook.com ([40.107.237.47]:65238
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230231AbhJUMcs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Oct 2021 08:32:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvnDfXZdTJdPwygMyg84D5JBuI5WrxHtnEf1uCPfAVzGKTDbTuGq/H/mvDzfeCxeFoHbSiKJK5vR7Cjom6ENBwLp55RKmmTHZuGLuPYDktO5zm2dWTtPiT7Sfb9TxSSX0+9QGWfmRevBG1G8IxTqrBXxm0/FX1VjrJ2FFtZM2R0+uIMM69E642qRckkecVWL+/c24eVArTmzMa5l1O9nuud6FcI2BdeqAYpj/kOCALCEfZZwovbY7JnZI6UU4azh/EndMHN5sZjy4Wr5WMpfdVpm1CH9XXz3wZvm/rPAzlXa4Iy6udqZPi460pnvnilgNyJWueE2hbnqOIm73ky+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VVd9I5MzFSB5L6x/zPzgdk+ZRUlZH43zbMdpegbcyc=;
 b=BrdvjwDIr7LRy+otqVPiF9Gj1dgl1bUf8c2cXLLXxHYWiuV2F+wlgEQkksbbxQOLw8RztEjv5ZDzYfwwcrxu6ghwY7pI/2Gn4wOb0yrJX10BmF3yjVfCiNWd1CbJ0ZAqQM4YCFsQlXuvOh4dv2qVxCWzmlyBMBp9D+PorH8f8dWt9J6RI9ldZ1t7jmPBuYPOiPxu5aN5GeBQ+/i9CC/PACSDUv2tw24ob0SERmX4pnNMoL+xrWvk6VmIdyChpvKsNNP0XU9vqWcOj2JAFNXS7ZfxpjpzoaPENhptmIPooRUhtTPSn+cREGsCdWp+CTLHt4oubejK0DLoNnifMjOK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VVd9I5MzFSB5L6x/zPzgdk+ZRUlZH43zbMdpegbcyc=;
 b=udiACvuE7agtg/RTrP5r7aP/5u1C1mBv3pGhyacTUwDtGsr4RozvG+ocZbqTnWpjcPg1/GyVJ0AoP40iK2PyhRYLsQFBB4HlN1oruG4FIyVlFcxNJBdt+UDi60hBLAbLGG893xRQeP59tyndc5Th6MFNnqeOBA+AU/GHymmrdsSSEPI2GYHVTa+DgGjJTPBlEuJ7swPoi/ifB5wfd7xoflkMn5nhWSkC4j/IByqWLSsZINexKc39+vGvVOmHndXZ0bRbtOAww1dXkb+cnVlxtREjWd03DRj2WEF7dMirWL+lEhU/PBWKoGKl75HKehkNN5jKzHdGJN7vAo9H3G4mDw==
Received: from BN6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:405:70::15)
 by CH2PR12MB3975.namprd12.prod.outlook.com (2603:10b6:610:2f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 12:30:30 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:70:cafe::c0) by BN6PR12CA0029.outlook.office365.com
 (2603:10b6:405:70::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Thu, 21 Oct 2021 12:30:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Thu, 21 Oct 2021 12:30:29 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 21 Oct
 2021 12:30:27 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 21 Oct
 2021 12:30:26 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 21 Oct 2021 05:30:24 -0700
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: tegra186-gpio: Add Tegra234 ports
Date:   Thu, 21 Oct 2021 18:00:20 +0530
Message-ID: <20211021123021.9602-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b530077-9d41-408b-0389-08d9948e91be
X-MS-TrafficTypeDiagnostic: CH2PR12MB3975:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3975C64F9A423E227369168FB7BF9@CH2PR12MB3975.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LnsnnbyZBrOp/oWGNn3ShgEQlaFLFC0Ybw4SkxDr79r64B0eKzbfdQ29hYWcHdvW5/GDgkfD8PGj6YJNwE9mq1HmgAjOTmgJ4p9UqxcUC4fubls4eDuLEIKsYOt6GGjBRJ3kxsMQ1i9ax+PP2/o/uQH2d16yh1+Ji7Yvjafiur3n8+b/xTJQbumG1rv4NNYA86FfAeeuGBb7gKZRCsDPKowqF8Na1P3f1WyRxYwvwdTw4DRVHzdNJTDpKthCbMuxwbHcAyUWX15nhb0jGUyZ9bNHIO1cDTkHX+eUQccTq92NrpgWZTOQ7kCHLEoXwLyI5f+uVRpIrO+yofsDNJXOyEpBOzZQOVnNr+NTB5VWCoV6hYiZeVxnL16566NgU26LHDPzjAPJ4BJ2NqU0LRGC619uAIkWvN1JOncPWeQfSwNtFWrUm2iUZJX6wea5EHhmZ90S2xsu5af7w/KFxIpz5F8EYhrNTp8OCZo8F89nMBSCSjMJDMR3w00hKY6S1EIbF+fcU9rS3nBdy6+T6zTZCzTOcG8v906aj946hyz77BJmYgETezCa/BSisDWbeOUL8DmyPHutiJJ4G+rXEO6PEC4VzPcF8HFhE0oIYJli/Te3c0i4OfidVha8YVRe/7rAlu0em2hk6/nbvzAaDeJk33AlJO6miA+L8A0U5VumAJj2RwOgW7IOPyM/fcxKtioJA4agyvc8wiV/GrNhVmvtdg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(316002)(8676002)(356005)(7696005)(70206006)(47076005)(336012)(186003)(36860700001)(26005)(4326008)(110136005)(86362001)(6666004)(2906002)(107886003)(8936002)(70586007)(36756003)(82310400003)(54906003)(426003)(508600001)(2616005)(7636003)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 12:30:29.9362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b530077-9d41-408b-0389-08d9948e91be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3975
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add Tegra234 GPIO ports in dt-bindings.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 include/dt-bindings/gpio/tegra234-gpio.h | 59 ++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 include/dt-bindings/gpio/tegra234-gpio.h

diff --git a/include/dt-bindings/gpio/tegra234-gpio.h b/include/dt-bindings/gpio/tegra234-gpio.h
new file mode 100644
index 000000000000..0f59afabfe80
--- /dev/null
+++ b/include/dt-bindings/gpio/tegra234-gpio.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2020, NVIDIA CORPORATION. All rights reserved. */
+
+/*
+ * This header provides constants for binding nvidia,tegra234-gpio*.
+ *
+ * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
+ * provide names for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_TEGRA234_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA234_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* GPIOs implemented by main GPIO controller */
+#define TEGRA234_MAIN_GPIO_PORT_A 0
+#define TEGRA234_MAIN_GPIO_PORT_B 1
+#define TEGRA234_MAIN_GPIO_PORT_C 2
+#define TEGRA234_MAIN_GPIO_PORT_D 3
+#define TEGRA234_MAIN_GPIO_PORT_E 4
+#define TEGRA234_MAIN_GPIO_PORT_F 5
+#define TEGRA234_MAIN_GPIO_PORT_G 6
+#define TEGRA234_MAIN_GPIO_PORT_H 7
+#define TEGRA234_MAIN_GPIO_PORT_I 8
+#define TEGRA234_MAIN_GPIO_PORT_J 9
+#define TEGRA234_MAIN_GPIO_PORT_K 10
+#define TEGRA234_MAIN_GPIO_PORT_L 11
+#define TEGRA234_MAIN_GPIO_PORT_M 12
+#define TEGRA234_MAIN_GPIO_PORT_N 13
+#define TEGRA234_MAIN_GPIO_PORT_P 14
+#define TEGRA234_MAIN_GPIO_PORT_Q 15
+#define TEGRA234_MAIN_GPIO_PORT_R 16
+#define TEGRA234_MAIN_GPIO_PORT_X 17
+#define TEGRA234_MAIN_GPIO_PORT_Y 18
+#define TEGRA234_MAIN_GPIO_PORT_Z 19
+#define TEGRA234_MAIN_GPIO_PORT_AC 20
+#define TEGRA234_MAIN_GPIO_PORT_AD 21
+#define TEGRA234_MAIN_GPIO_PORT_AE 22
+#define TEGRA234_MAIN_GPIO_PORT_AF 23
+#define TEGRA234_MAIN_GPIO_PORT_AG 24
+
+#define TEGRA234_MAIN_GPIO(port, offset) \
+	((TEGRA234_MAIN_GPIO_PORT_##port * 8) + offset)
+
+/* GPIOs implemented by AON GPIO controller */
+#define TEGRA234_AON_GPIO_PORT_AA 0
+#define TEGRA234_AON_GPIO_PORT_BB 1
+#define TEGRA234_AON_GPIO_PORT_CC 2
+#define TEGRA234_AON_GPIO_PORT_DD 3
+#define TEGRA234_AON_GPIO_PORT_EE 4
+#define TEGRA234_AON_GPIO_PORT_GG 5
+
+#define TEGRA234_AON_GPIO(port, offset) \
+	((TEGRA234_AON_GPIO_PORT_##port * 8) + offset)
+
+#endif
-- 
2.17.1

