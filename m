Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3480341E4C6
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349787AbhI3X2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:30 -0400
Received: from mail-co1nam11on2084.outbound.protection.outlook.com ([40.107.220.84]:26337
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350002AbhI3X2U (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpPQCLWd/zVLkw+4ANKbWrUGJ2ZxClFwLY8z3Vr+RxL+39tj+m0sPSnHrlqxyXpbqCGi7JrCUZj8jiLZvS/j/5zBz6wRS2oOAEZeLWyntR55nzWIDxUpRYIq+ruxf9lRIKSCiVIA9aQvu5vzBq0GCaKomFXbPGSfbUveXkt1sMZR8/KQKHXS06FROHfd8tb0KU5Wp8kkkqQF+UXHzM2XrddOM/h8JtM9vNZOjY5arbPf+vYQYhJgMSFR+pSE0XSCfzosNP9Zr2wWA6++9HogPOQ2xQOUNDEyGASAx784kqcdFXVkvntaffjZCrlcU4fl6umD6CwK4jBM01LNFaCNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOXI4+q77PvJcc43ruMqe/5BPcOD8QNygNmckJe3koY=;
 b=TkjpcYbzdcnmrsKDrQWCtYaQgPd1++K1TT+KWff+lM3ap/yLcxdOPAYiZr1lEUdI2Zzvd8a2z5doh144HIvCZkxi1j3BR9NmSV3DOmciG4BtfEEf+scBb3cwQKJM9cW5AlQceEJ0qAbNtMs2HRWQbbdK+KrpIQqSDCJLZNq2XNuZ4wTdsRGBtsN01BnprcPetasOpj+iAhS1lgfDwYWYkE5SMB/xgIhVhMfbB2HevR61PmrlFszz1toSVZb/hGoPwC8sNVRYN7ehHk58LgUn4Tcj71gQRMVv3I1Yd7chQzFkaVyUtq9VOMSwrDwfgayXkoU6IbyovHmFk3X4YG0R9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOXI4+q77PvJcc43ruMqe/5BPcOD8QNygNmckJe3koY=;
 b=X+BVchqQ1lWWew2NelHOyNLWA9bMjySHjILu93MRlwUjoNZt4SFTGpw3RXaddycEINknjfyFdyszuxmtIdEcOaFKKju3isVIL6rWONLPcLDJKGRLUkH3V+n6IVDPq94SCjasl5bhNdXzdYTatDB47sp9OV5tgocLUP1lFDwOoCBuOCb7uXR4p8qq2nu+waSaPDl+FQK2ZnW1kYp8lBKj1dAVfOJXWYBN/HRfTsydtoETnNvzSkUNt59C1SR41JXu8kxUmcE37hdCrcKvB0fpUdr4WkNMMCOqCny0TWKchY6qYs2y3fF5HI2XcmHPS/LkxSfSiRY1nW7N2nobUPb2Vg==
Received: from BN9PR03CA0375.namprd03.prod.outlook.com (2603:10b6:408:f7::20)
 by DM5PR1201MB0106.namprd12.prod.outlook.com (2603:10b6:4:4f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 23:26:35 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::73) by BN9PR03CA0375.outlook.office365.com
 (2603:10b6:408:f7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:34 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:33 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:32 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:32 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 01/11] Documentation: Add HTE subsystem guide
Date:   Thu, 30 Sep 2021 16:26:07 -0700
Message-ID: <20210930232617.6396-2-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930232617.6396-1-dipenp@nvidia.com>
References: <20210930232617.6396-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1165ad95-7d00-4e58-a2ee-08d98469be10
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0106:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB010645ED76D3E3200FE18C53AEAA9@DM5PR1201MB0106.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82G0wthBsartXBH0tlfpL2cI2OgPKNgWTxpSJISMncoa8e3spVnLbUAGHLaldgMPTQQkBu+q8B8DTtgXwWK8nyQbKBxnTJTfpCGv0Y+kOt+LWkwTlHOV+e2FNSE4XaNyLPhCwgA9i8nd4+ch9/22/WAg/v5FV4+mxgLkWBPhBpzlfH1QatZAAVnhZmKI0IuBJy68G8kaxREvlPRjK3CPwMcL2jo50NvI9+YBdJdU1Twam98ec+t5I/C506JAfMtNd5+KW3528NfG25g4IgQF7BjdcBcqhFd1HhhvLC5tSpzPf7vUXbKmfy9paVFMj8XHE4wQUwh0u1Xur6a8UeAiQzZkvoc49rR2BoM/Xrs41rYsAav2xFHzpDGFH2jbzu7TRqPGWxXK5ULerGBVby2w6dTJaSqNQ/mZ5M4qeQ4v5L8Foq2M+7g3xiRYZMw97FcYocfdQ4unnWiWRIaa/u8n9TS7K0fFbChQUGuKb71g9ECODpF9Diz6joCgI1gf2HaP+skxkxMxfksMsJkBIf0zXVMsLbuibmo9H0+V7astMaxC+Vk5fPeXFgbMiyBOxvq6zxqVeFFyQcpMDCDOGm+TlytmhWawaKUysLhRXM2sx5Sl8LYo7wLGcn77b1lZfHAhKpX+FgtWPgNkvudniG6Oo0BEVJWK7PlR2VuffFFHTK6L5BxUK+Qcvgw0yfhTdl9YMh0Gqc17Z0ZCY7axfhFXkw5SUd5iru9mD8QO7KwXVv9N6K/J3O78qQjJU33e0WtUH31XhnvoGB5TEEFIIzDjWw==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(82310400003)(186003)(47076005)(356005)(316002)(7636003)(336012)(8936002)(921005)(2906002)(6666004)(8676002)(426003)(508600001)(1076003)(5660300002)(86362001)(110136005)(36860700001)(70586007)(2616005)(70206006)(107886003)(36756003)(7696005)(83380400001)(7416002)(4326008)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:34.3120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1165ad95-7d00-4e58-a2ee-08d98469be10
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0106
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding hte document which can help understand various APIs implemented
in HTE framework for the HTE producers and the consumers.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
Changes in v2:
- Removed explanation, instead added kernel-doc references.

 Documentation/hte/hte.rst | 83 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/hte/hte.rst

diff --git a/Documentation/hte/hte.rst b/Documentation/hte/hte.rst
new file mode 100644
index 000000000000..c9b1badae601
--- /dev/null
+++ b/Documentation/hte/hte.rst
@@ -0,0 +1,83 @@
+============================================
+The Linux Hardware Timestamping Engine (HTE)
+============================================
+
+:Author: Dipen Patel
+
+Introduction
+------------
+
+Certain devices have built in hardware timestamping engines which can
+monitor sets of system signals, lines, buses etc... in realtime for state
+change; upon detecting the change they can automatically store the timestamp at
+the moment of occurrence. Such functionality may help achieve better accuracy
+in obtaining timestamp than using software counterparts i.e. ktime and friends.
+
+This document describes the API that can be used by hardware timestamping
+engine provider and consumer drivers that want to use the hardware timestamping
+engine (HTE) framework. Both consumers and providers must
+#include <linux/hte.h>.
+
+The HTE framework APIs for the providers
+----------------------------------------
+
+.. kernel-doc:: drivers/hte/hte.c
+   :functions: devm_hte_register_chip hte_push_ts_ns
+
+The HTE framework APIs for the consumers
+----------------------------------------
+
+.. kernel-doc:: drivers/hte/hte.c
+   :functions: devm_of_hte_request_ts hte_req_ts_by_hte_name hte_release_ts hte_enable_ts hte_disable_ts hte_get_clk_src_info
+
+The HTE framework public structures
+-----------------------------------
+.. kernel-doc:: include/linux/hte.h
+
+
+More on the HTE timestamp data
+------------------------------
+The struct hte_ts_data is used to pass timestamp details between the consumers
+and the providers. It expresses timestamp data in nano second in u64 data
+type. For now all the HTE APIs using struct hte_ts_data requires tsc to be in
+nano seconds. An example of the typical hte_ts_data data life cycle, for the
+GPIO line is as follows::
+
+ - Monitors GPIO line change.
+ - Detects the state change on GPIO line.
+ - Converts timestamps in nano seconds and stores it in tsc.
+ - Stores GPIO direction in dir variable if the provider has that hardware
+ capability.
+ - Pushes this hte_ts_data object to HTE subsystem.
+ - HTE subsystem increments seq counter and invokes consumer provided callback.
+ Based on callback return value, the HTE starts kernel thread and invokes
+ secondary callback in the thread context.
+
+HTE subsystem debugfs attributes
+--------------------------------
+HTE subsystem creates debugfs attributes at ``/sys/kernel/debug/hte/``.
+It also creates line/signal related debugfs attributes at
+``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
+
+`ts_requested`
+		The total number of entities requested from the given provider,
+		where entity is the provider specific and could represent
+		lines, GPIO, chip signals, buses etc...
+                The attribute will be availble at
+		``/sys/kernel/debug/hte/<provider>/``.
+
+		Read only value
+
+`total_ts`
+		The total number of entities supported by the provider.
+                The attribute will be availble at
+		``/sys/kernel/debug/hte/<provider>/``.
+
+		Read only value
+
+`dropped_timestamps`
+		The dropped timestamps for a given line.
+                The attribute will be availble at
+		``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
+
+		Read only value
-- 
2.17.1

