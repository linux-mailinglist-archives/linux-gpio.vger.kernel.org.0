Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DA945AC47
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235732AbhKWTc1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:32:27 -0500
Received: from mail-dm6nam11on2074.outbound.protection.outlook.com ([40.107.223.74]:36417
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229768AbhKWTcZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC4LLu0um+96c+3x87uO7eFVK0hlxnL3vqlUDvAmDWRGz8BzVAOA55TlW408J1VNHOo7iwNfBfcw5kIPOZ6UgGd6Ial3rkA/Scbs2Vldh4IQMxZmd4/eQogJeawLL+3KWqlMc3CnTDl8oiw0S2cwW2CZ5o3+xx1s29cWXZnJ6g1l0zuB7SZTKsL0rEFUew7NsdKnQpEnx5ED3w2WFbVTXes7V7Bs5B9HA7T2jHpP5JdNYtATnCXAS3JYY5Mht1M7hguG2gWGKF+LjPe8XrAbfpysL8FTLXo4YjJyqXG2UcxiUvOdFvV4l54btu/aCaDcFjn6t6bK8VCvPMhPYwgF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4rQcov5jrZ0kUa00NFoCa+jywEuhLhkYaQLI/YYK4U=;
 b=Sdc1RzpZGshP5u3enrsm+gC6N/DbZ/T1lW8B1ZmZaiqgxeB0kNqyr3ZjFYXwKToK+uN15epPOnnhK7UI9yrmsylMHgjnLH24mNSr7SOiCfYjkZ5vrjLRlTtNTclXqepAaF3NEZf58Xj1vYPHFAYSGOPxVdBa4IXxTVLfSUuh2DhbIHMoAu0T+dRqZBimHNj4JRPsqLONXRZonYNUa+U1t0Jq8aBVK3xELvdmFqJHylegejrFefctgPZTTy2LPfUSVtXFxA5vHe7FSaBMaP/iA55it+z650uC68JXNryhjlOUwvWc4SyF5UlljIeiZvSNnpV/T0YY+2zn/BYx8D2mrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4rQcov5jrZ0kUa00NFoCa+jywEuhLhkYaQLI/YYK4U=;
 b=e8ZOIqJ0DShn3jGRrDxu5NoI8eucQl3DMSY4B01ocJcVENT1AGpz3sgeZCzwfKpECZU6AC4VDfCpJweYPj6ogU7hGJRGOLr3d8FmXqUjfz9rb4G05hsq6kU3puAk2IxJJdZ7awWHhgblU8SKrdfDjV/CFSP2Uor7sZR4iGtIz87yVJvPdZ/XBE3V4N0p7vvkhaz8Emp18e55XSTBOTKYLavIjn3DWR1BBWlGbKxmDAdLsfQTVA24WcLalXfpzOh8kqC1K6WZA8p5tNH6R11tytBeUsXPxHt3Ivo0k6D5ptmWLOuyydnOnmmu6ir6vYHuyLYW2Ytlj0i/U8wIrLn6Zg==
Received: from MWHPR22CA0045.namprd22.prod.outlook.com (2603:10b6:300:69::31)
 by MW3PR12MB4347.namprd12.prod.outlook.com (2603:10b6:303:2e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 19:29:15 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:69:cafe::9d) by MWHPR22CA0045.outlook.office365.com
 (2603:10b6:300:69::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:14 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:12 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:11 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:11 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 01/12] Documentation: Add HTE subsystem guide
Date:   Tue, 23 Nov 2021 11:30:28 -0800
Message-ID: <20211123193039.25154-2-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc9a297b-266a-498a-c351-08d9aeb788d9
X-MS-TrafficTypeDiagnostic: MW3PR12MB4347:
X-Microsoft-Antispam-PRVS: <MW3PR12MB434749DA4095EC944B872586AE609@MW3PR12MB4347.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yNaooQy+V+o+5necIiVDZoBYHJYFgUP3cOddDYUxhoMmsLbaHt2seulvRhQAM3f4PxdFo+puBhdSlKGPZ0I1AG6faXWhmbsed4ws6X8RS+eGZ4i0QMasWsms/Fu8tj4lV28OjefyUsHQ94D7PGPLc7qZuZ1e6JUvlQ6DGCK97y4RwF3nAc51RBWlbMXH+yGugKJKthHiuyG6J9ChsLMD92faquNM7Ip50OMxPs5VBhzhxTlCYtKz2WoXWhkGw3jIXIrQLBzJG8kikv6kEyygEUtFH438MhW1r/TfqJLoUmbkUECITapGvI3DQyRfn6rnoSV/hN/1rX39dTYUHrHS7Nicnd6iRw927tFUvemgdlV2VVU+TakxwRUCVUSyMjFkUsEdzuSTt+LoKcqzJH0YVBfpJCoqfuoveGn6Z2XNna87u8L5xYpYk6VVOCscvq/9KDCdOLDwejIz6z/s2NxdFqV4cf6r2EqO1Uq2rYa8Cal+MkHlkwrkOsRbjnGMr8hVCvVvCxt0wpSGIPkOZtiI+Q1Poxcedr78suz7DoqirmvU2TBikpNgDD0uof7qE4j73Pqgru8EAPI0yoamMAOnDM37KQqMWcfA9KQFHhhnj31rzmtcUSwE63ZJ8d+e4/hOyNfMkMzM4hwG8Ze8Pk+u6DAgv3qN1+ZWi0Cr16pTSHW/y0uNUCMO94TDU7XRfrG6P3K2ZFdHJkzJDJLp9lxQ7eQLfbb3OfHTo/FXJeLnBamBbd9d25gNDLbm8OV2W6oN4hX81UeBMfPlS+1YYx8W0w==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(7416002)(4326008)(2616005)(7696005)(336012)(8676002)(5660300002)(36756003)(426003)(186003)(356005)(316002)(26005)(47076005)(2906002)(508600001)(7636003)(86362001)(6666004)(70206006)(1076003)(107886003)(83380400001)(110136005)(82310400004)(8936002)(70586007)(36860700001)(921005)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:14.6887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9a297b-266a-498a-c351-08d9aeb788d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4347
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding hte document which can help understand various APIs implemented
in HTE framework for the HTE producers and the consumers.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
Changes in v2:
- Removed explanation, instead added kernel-doc references.

Changes in v3:
- Addressed grammatical errors.

 Documentation/hte/hte.rst | 84 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/hte/hte.rst

diff --git a/Documentation/hte/hte.rst b/Documentation/hte/hte.rst
new file mode 100644
index 000000000000..c39e57303d12
--- /dev/null
+++ b/Documentation/hte/hte.rst
@@ -0,0 +1,84 @@
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
+in obtaining timestamps than using software counterparts i.e. ktime and
+friends.
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
+and the providers. It expresses timestamp data in nanoseconds in u64 data
+type. For now all the HTE APIs using struct hte_ts_data require tsc to be in
+nanoseconds. An example of the typical hte_ts_data data life cycle, for the
+GPIO line is as follows::
+
+ - Monitors GPIO line change.
+ - Detects the state change on GPIO line.
+ - Converts timestamps in nanoseconds and stores it in tsc.
+ - Stores GPIO direction in dir variable if the provider has that hardware
+ capability.
+ - Pushes this hte_ts_data object to HTE subsystem.
+ - HTE subsystem increments seq counter and invokes consumer provided callback.
+ Based on callback return value, the HTE starts a kernel thread and invokes
+ secondary callback in the thread context.
+
+HTE subsystem debugfs attributes
+--------------------------------
+HTE subsystem creates debugfs attributes at ``/sys/kernel/debug/hte/``.
+It also creates line/signal-related debugfs attributes at
+``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
+
+`ts_requested`
+		The total number of entities requested from the given provider,
+		where entity is specified by the provider and could represent
+		lines, GPIO, chip signals, buses etc...
+                The attribute will be available at
+		``/sys/kernel/debug/hte/<provider>/``.
+
+		Read-only value
+
+`total_ts`
+		The total number of entities supported by the provider.
+                The attribute will be available at
+		``/sys/kernel/debug/hte/<provider>/``.
+
+		Read-only value
+
+`dropped_timestamps`
+		The dropped timestamps for a given line.
+                The attribute will be available at
+		``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
+
+		Read-only value
-- 
2.17.1

