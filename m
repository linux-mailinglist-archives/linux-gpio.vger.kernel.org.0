Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8314C45AC5B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240088AbhKWTcu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:32:50 -0500
Received: from mail-dm3nam07on2052.outbound.protection.outlook.com ([40.107.95.52]:7809
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238499AbhKWTcb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRLjv/29Xle2IPd/AztbzYLy4yWthXyGX6nLILAXrPGMwz6/2pUCIvkVdOQ2KIvUFyY0dvlELF04Ll2WN07LWp/cDwUdfu6FMtClpuro7UtPiYLq/PDCA550uz0YdDtbu+Vykq1zE6sIWcX1QyBB8GIzRdyiMy5hmgfqHpECwZPOy21ND24YE3toZTP6qVSBoNnzfVlqdlY4B+FS5LROIwizvzZHvaGLanHMDqXRaI7eIQ1iB+bFEfj+kAEMxRjittZBUWWPqTcto6+hItYJJ68PlPb7VUo1HpojU6htZERtbXvpvcDWwKw1+dVz2kFL3LgC+JmDbma6DsspGf2fCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8oHqFueAtXpQ/uhSVwmuaXW6XwgvZVgorBms7gxQx0=;
 b=S4HjPWbTkwGvwq3FLiUrnRF7d0pOGyAlyi37Mq0+BVftaugS8RQwBdd5yHrPl+Q1i4A9aYYo4Iov/nE/J2V9VBiAhtXwU4r9lE7TtIcuEtjV4EVk6ktiew879w0DHF6sILhtqPysKREHaIjjBoJYiCJEP8CGxKGSQXS4FIMaUCA7wdvV5gUcz4hG51NofTOyzwFbEip1+1oJOOWy1I92T8edewS+y6RoO5VhJd217H1MrHctCyXyiLeMSUYCt05unBq5SzCAu4u29UKK1C5NxNSeSrNvW1RBdo8Nq9oXVz7CU6UgxX15G4Hi93Dw6JbsxxsNPU719zbGN+orusPGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8oHqFueAtXpQ/uhSVwmuaXW6XwgvZVgorBms7gxQx0=;
 b=hbilr3TWYMubIWhHNo+6E6Gqt68IPW7G0CqE0NxK7CJ/Ug9AlmxPhhuEfKzYV65dv7wzwmHBoNUTg3ZUmSWLNdBNQ99FYOgQCFmNo3YpazO+QX5edfH0QOG9hwxkiIxls+9njjLoBMdGsT4CAmziAN8AIFqXn2nkR9c7SWtOc8Ac9w922LDI1uRdb8hQTFWM+SNWBE26OqmvUP1wxzgE3zR550HjtTczurVfYBVARGE2aDjooF+vUVq+TnnhKRUosON2TXHk4sDSGmAOzMk8EiJlrNuj9eiAB3SF1CDntqnPtd7bYS5Vctf0sSFts026E6fOSitp1uB9I9B4uOEzAw==
Received: from MWHPR22CA0044.namprd22.prod.outlook.com (2603:10b6:300:69::30)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 19:29:21 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:69:cafe::f0) by MWHPR22CA0044.outlook.office365.com
 (2603:10b6:300:69::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:20 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:18 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:18 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 07/12] dt-bindings: gpio: Add hardware-timestamp-engine property
Date:   Tue, 23 Nov 2021 11:30:34 -0800
Message-ID: <20211123193039.25154-8-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abd2939b-f288-4f30-24ac-08d9aeb78c77
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41100AB7AEB65F2A449BDB36AE609@MN2PR12MB4110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSajBOMV+EpmQCOjCrxxUmOEHe+axjQi9rW5Vjop0Q6E6dG48R+d+wfnboWOZPT9gWAmDbMmGXfFEmthplHF8zQQ2uvTx6NZSP3cIjYZP4dCvYPRUK+eB+ixJC+Cc55BLpNvOJtN9u6ACYqnhTtR1qxewvnKTdeZPtMDqW7zDu2jQTiDsDh+NogI21lxzhhrHe6MCks1ngIpn2HD9MxhhclmooKSNWKxQnLNLtV4bc86obIj0zmT9L+JuPRfDTInHvjlBAzHKVnUoG8d+y9Imer2KU9HVDW3pmvyh867vO3sxrkxoW14E1uVWqDSGkc6mRZMGofC0isglO7bR9P2tBugsygGZSvD1r+87j1H79Xb1tM3eBZfB8JH6c/4NA79WNKdQgP9AQ/Zbq010W/PzbYkRwgZ2ZPl5vw5FBYEARrYidd10a0XYWKPwyCSiNdliXsBUzdlBVMlmghfSQC5XObXn1M95FmznxaBCEU0li77lT21f+AwlsDizxZxoyqe/1o7NGEvP9gJPgOJJe7qXtO/LJYwuSFJy92ADeiIpm9tzgBqaxnZXiXBsdcl65cFPDbZzY5xtP5MRdQaAUauTj/pHPbWe0CS8Jxz8JscwXpsTRPx96QxzJAXZ1ycjodfZzI0qQxG4beOCulUROA4GXPIaAYAPGXuE12a2o/H68v4sZ8NNwJbm2Z+TpscFa9CdxsGB/Zm+6eB71O7jH2pvIOB/fNZKPwNnT2yddAr4Gyw5b6U906uz5A1Jw4VLAdwIeAJXt0PMoIsyXDLP5GImQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(921005)(70206006)(1076003)(8936002)(86362001)(186003)(82310400004)(6666004)(110136005)(356005)(8676002)(508600001)(4326008)(426003)(2616005)(336012)(36756003)(107886003)(2906002)(36860700001)(47076005)(316002)(5660300002)(7636003)(7696005)(7416002)(26005)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:20.7353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abd2939b-f288-4f30-24ac-08d9aeb78c77
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some GPIO controllers can timestamp GPIO lines in real time using
hardware timestamp engine. The optional property is added to facilitate
this feature.

The nvidia GPIO controller has hardware timestamp engine as a backend
to timestamp its GPIO lines in a real time. This change set adds
hardware-timestamp-engine property to reflect that fact.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt           | 8 ++++++++
 .../devicetree/bindings/gpio/nvidia,tegra186-gpio.txt     | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index a8895d339bfe..c6ae2eaf5762 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -167,6 +167,13 @@ left to right from the passed array. An incomplete array (where the number
 of passed named are less than ngpios) will still be used up until the last
 provided valid line index.
 
+Optionally, a GPIO controller may have a "hardware-timestamp-engine" property.
+This specifies the timestamp engine node. The property is only useful if the
+hardware timestamp engine (HTE) serves as a back-end to support hardware
+timestamp GPIO lines in a real time and GPIO controller has dependency on the
+engine. It will be up to GPIO controller and HTE provider drivers to figure out
+the mapping between GPIO controller and HTE namespaces of a given GPIO line.
+
 Example:
 
 gpio-controller@00000000 {
@@ -180,6 +187,7 @@ gpio-controller@00000000 {
 		"LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
 		"Row A", "Row B", "Row C", "Row D", "NMI button",
 		"poweroff", "reset";
+	hardware-timestamp-engine = <&hadrware_ts_engine_node>;
 }
 
 The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
index adff16c71d21..20f6c9e69839 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
@@ -127,6 +127,12 @@ Required properties:
             - 8: Active low level-sensitive.
             Valid combinations are 1, 2, 3, 4, 8.
 
+Optional properties:
+- hardware-timestamp-engine
+    AON GPIO controller has timestamp engine which can hardware timestamp
+    GPIO configured as input and IRQ. This property specifies hardware
+    timestamp engine (HTE) device-tree node.
+
 Example:
 
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -162,4 +168,5 @@ gpio@c2f0000 {
 	#gpio-cells = <2>;
 	interrupt-controller;
 	#interrupt-cells = <2>;
+	hardware-timestamp-engine = <&tegra_hte_aon>;
 };
-- 
2.17.1

