Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CD141E4E7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350849AbhI3X2m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:42 -0400
Received: from mail-dm6nam12on2080.outbound.protection.outlook.com ([40.107.243.80]:43073
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350273AbhI3X23 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/9Mu7gT518u1aU5z/g2b0QMPm7KTFH/0Z1UP1P0om+orcCdHXS7Xi7EDfS1NGY9mIwn5e56mWIb25QS4gurgM2WKh6qEG+NULU3SHzCaSzAoMdNn0YFEpz3ds7GgweHvTFyz/VRcB1RflzyGFLnjexzCwglvYgtddZ2CCM97tKE2dFrd4IJbFxumap9FAG0MMv0DIVqFjMi1dvxZMTGWvbXQar9vXsK/+3VdOoPRAHU18s69oNLuL5zmkIPORYF8DpecDyRCfDUVLjwfBWpNEkHhZ/b90XtKdI3XRv/4dsTFBDQGcXSP+FPWhiUh1qVn8shaITSHjnJkUejvc1T0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4jY95cdxUUioPOBCgII5cEX79seHfYCBfbue7ZUpuI=;
 b=Q8dIICles6zrtdNswCHr25nzNEz13MPYXaEXvv7B80fUqfPNJEB+13oiHuFv4boPxR08o5L8FhVRTn8v/+bFMkTUhh46CHTYJTFOdaqE2+Du0eE6t1p1vTyYJ3IUHyPCbH3XY6PnDLi5RdFyiwE6ozHMScyh+YGt0yvltH3hwvRWGkXwkY3xXSXM3ktoLR4x4Litw2GBCJFf9nS/keOc873tQfPc6ErmDVAH076tsoHxDIQ/o9uBsg9oTutiVTbT2Hio0/JyIfq2szuzO0SkYGkl+8/A+8wkX2f512uJ6jmF0yy2h0U8afU+y1ibPOoTu8t+RmJpzNXMBwoQ9WMBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4jY95cdxUUioPOBCgII5cEX79seHfYCBfbue7ZUpuI=;
 b=f1EhhifuaVmwPRQjh+6CTHM8Xicu/aneRYyF92O65LERz4Fy+RGMvoxGh2VTRMPoucg20RRJWw+TK3UeYDjG6pjW0o8O9OpJkBOgj+7cR6rSyKXpRfhPAFDwmjQZ1cWocw0WSsU80tQzod/lY6/UT4WtR8pjeqOYLbikFGVNZCD45LV0sa1HTr3wmSDnP6R88kUcyBKaqCCKqh5M8QLfstIy37ViJVLJkHMcMJSz7j3XXOS+HlKUEpzI9xbiD9jLjQRvUKlGxwKNsBULGARYDK2osp7rR0iDsRCmus76I8aSzcDaS0epl1VSOYP4rcnQ7WYFDO6VCS7nYXH/HfIFDw==
Received: from MWHPR13CA0048.namprd13.prod.outlook.com (2603:10b6:300:95::34)
 by CY4PR1201MB0055.namprd12.prod.outlook.com (2603:10b6:910:1b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16; Thu, 30 Sep
 2021 23:26:43 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:95:cafe::ad) by MWHPR13CA0048.outlook.office365.com
 (2603:10b6:300:95::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.7 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:42 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:42 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:42 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 11/11] MAINTAINERS: Added HTE Subsystem
Date:   Thu, 30 Sep 2021 16:26:17 -0700
Message-ID: <20210930232617.6396-12-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930232617.6396-1-dipenp@nvidia.com>
References: <20210930232617.6396-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75297164-fede-43e0-78f2-08d98469c315
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0055:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00557E878420A87542DDDBD6AEAA9@CY4PR1201MB0055.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5KSfr9wbLMZGUQ8hBvPYIl6xg38l9g0eHZAZZRG/uBV9z+rKCfZ1Xb85yRzSCiD8YxkjWWZaXdFgMeaQl6MQuIuFh03UYNViL0v6+1Om3JNYAjpx1+vu0ss7x0m//NMbUsjfvAHp95qKT7JdlarqSffhtUKAw+hSx2fImq4sdOyi5+31uph7MYng0zsrqlBVsThUvk99yMOadxZvRZuTD3/URNl6gsKbJXcIidI0C2exyxPTQNej8ZRVeIvGOltFw0Uv9sgOmRt6V2kWg06RzixtbE9qWXzGDL6OIe9j+77YyIYJoD1CILsj9gZbrBNF/UgUrPVMcfkoqnnfFIoVXavHrTKkUYXInjBn56z7QvemTc0csRsNwxV0f2yKL9ghMFRfxWAgZdfSTgLPqCJQo7rpisdLbLbDdH3S95f4gTEFBmRRrwGIvU2F0+3r/JpKrUlkpNYR2ZMzYilqaUyHpayMK1Q4XEJAVblH2B2iNLz39IccKDZd2arZ/lvJHQGrBT7kpO3J3gXXkSTINNpctrAghzH0a5dO9freaOrKeqHNggnxGOBPjy/YzsOCOlMtjZNZKMR0M3rWNS+hyD0ds8fgoV+LROy5T/mP7SrLT50WN1rPhpSdgPUO7TX8zabc1EYsb1DVdFRMPquZllHOzvjA4Q5QPlqki+oyxLCEkz7OggjdjNlxqCkYn8Be2mg97qB4xTy/n7rt+H4VDS2skhAUjBObLu+Af7WnNHund2jgGAd8Z/ooUz14dVBlkeDwJDp53SXvNj4hGhIhxrgzdQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(1076003)(70206006)(110136005)(6666004)(7696005)(70586007)(82310400003)(316002)(107886003)(4744005)(186003)(426003)(36860700001)(4326008)(336012)(2616005)(26005)(7416002)(8936002)(86362001)(2906002)(921005)(5660300002)(7636003)(356005)(47076005)(36756003)(508600001)(8676002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:42.8353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75297164-fede-43e0-78f2-08d98469c315
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0055
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added myself as a maintainer for this new Hardware Timestamping Engine
(HTE) subsystem.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index abd0dd5aa003..03ae8056c35b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8659,6 +8659,14 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/touchscreen/htcpen.c
 
+HTE SUBSYSTEM
+M:	dipenp@nvidia.com
+S:	Maintained
+F:	drivers/hte/*
+F:	include/linux/hte.h
+F:	Documentation/hte/*
+F:	Documentation/devicetree/bindings/hte/*
+
 HTS221 TEMPERATURE-HUMIDITY IIO DRIVER
 M:	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
 L:	linux-iio@vger.kernel.org
-- 
2.17.1

