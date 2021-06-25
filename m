Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9ABE3B4B4F
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhFYXvD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:51:03 -0400
Received: from mail-mw2nam08on2070.outbound.protection.outlook.com ([40.107.101.70]:21600
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230137AbhFYXum (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 19:50:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqHReTvPOfyqJ3NO3JdGRmrVsHpLGHKJ6ujujDK2fNoaNmT9zDBnnMwcGMrDAhq2yoRZ8ifLyyFoNP0UEYjAisenukM6xcSqu+H6ntakDNnQPeCDFkPnAU/wfW9mJdZjYmkZNWlCx1j8lX4ZYkLknD44mT6O5hPKaYKYAJGUWl6LoArDmDOLv8mk0/jtf+OCtxO4C6H8vRnW0b8pmhQ3pKt7HSk86ehfMUsBiyM/E1QIdNgM/BJHBippIEWPp/20uqowVAk2ialjuFo3d9kP9URrKwJM0ECbZGjGB7/wYPNT5I7WCkzIRzX3CgO/BO2dqoLFr/jrF4qpfhgmliNZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8FTLM7KteR//C/rKZXf2MJCR/ZihWfFQMwp9poEZRM=;
 b=hEhMFhzoKzzwC+vaL4N+t2CQ91U6Hb62TUdEhm+aM5kG4DAr93TdGEj9Qi9Yk0mLbk44qplG8LBEi3cx/tuXOQ/szW44Deij3Sf3kJ36kMstXI8SERarg6UQ5oMACjEGI6tMGIXGeLMyVghYg7HrG1UhMlNPHRyAROlhqgnoJZO9NeUkl2qBUkOoi09jH7R1PmXV9bj6ahCrbpbQxjLMGKKfKLYuAB0zuALEJ/sX63cY4Ng7xwLuXpxHT/Geaen7q3yDPvA2n5K9ihfkCrjBzXEOZSutnYjvsL7pNBTBPw4Wz/fpytxRYkZf+iMziqDfw8nMYgpUWhcP3UijO1V3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8FTLM7KteR//C/rKZXf2MJCR/ZihWfFQMwp9poEZRM=;
 b=Kyy7aVOPnn21H+qkXPAvewMZcZhO1wQ3G9mHKei5IqQLuTQJYsFnRw4WiitqXwxvqIhcTFABDMwF1W9OZmOrPBO2AJ6m5WAbQ9C5dsTrtEzbuk2PGLK/qwxNd6uykKoK5ReOH548adoIH4Tn2mc08KV+9xCE+Gomgow0nYDImW7u+cNgpG/zEk2ck8TzmyhD6ubQarbjDec2JfSFXhrStqtiy41jVUqF4s0kkeKzhdN70hfHXdK5hFy0i16GlcELEl3vG/g3gSbbz2CU0KUpA7bdOQQCqxDypyZAZ84m3zn/JTJAe1nGQPTPjiW3tMxGk9j0vbArYEPGew3ulCmqSA==
Received: from DM6PR04CA0014.namprd04.prod.outlook.com (2603:10b6:5:334::19)
 by MN2PR12MB4013.namprd12.prod.outlook.com (2603:10b6:208:163::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 23:48:18 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::8) by DM6PR04CA0014.outlook.office365.com
 (2603:10b6:5:334::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:48:18 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 23:48:16 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:16 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <dipenp@nvidia.com>, <robh+dt@kernel.org>
Subject: [RFC 11/11] MAINTAINERS: Added HTE Subsystem
Date:   Fri, 25 Jun 2021 16:55:32 -0700
Message-ID: <20210625235532.19575-12-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625235532.19575-1-dipenp@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 342f9a54-6565-4873-a90d-08d93833b536
X-MS-TrafficTypeDiagnostic: MN2PR12MB4013:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4013432E0BAA8DC5DE6BFE80AE069@MN2PR12MB4013.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y5geudkZv/njWc6HaJo/XUjZMTuHcr6c/JdwOpVVxGo2HWaS5CzY+mE6jozm6tXu0qyayzYlsWhy+rq7Brxn6OjpGKGfduzeZ5g6I/xO/x8btYotAP9Tnux+aHsX0NSV+mIxCCKr1v1igLv1xNDtHpJ4dRKyoNxVHuz3f8Ex0X3j8+mwBJkyyhJlip+opSK8RgxKsW1KhHbAt+1SXO/EARs5Kv8Xo2gEkH7YPCnBEdmIOcgmv15IpIXk9bC6ocSlOlmG6YRhoykXxDoU8ghaPuTTQdU5XApvSEN+KZyarv09DrBJ1aiwgi6+m2kV5FVNhahZNPuLJ+5ga8DfgRZ6SESlu+EVQtAb/pSlUu512KphuxdmphZ8XOPKWo0/dnwjI3A3b06LVOAqjEjg11B5XRLFZ+iFP7cwA6to5Q4tffDDuJ7uX4VkAgV7+9R/EOI1MZphQ6e/zrUmhTklX5zUh/8Ybkxj9p1XeMu39WuCTV5JD1YsJUSLj++9+dcwvpk+G/rI4YquCjTPwo46B9v2tTUoadPU6ewnbAnuWvl4J2Dnf3zqAF1Y5yuAwtrjF2KVGuqgdns4AdgDpzC2Y5ybODkNXIzGZJ3tkNGCgT8zcsBuTqV4AR3HQhGKjWI0eNcllj8TgYSpAoyg+/VGt6/ocoZW8pSNu8CzwN3pnKDaAhfLVzzI2tEqUSbTHSTXFRKVT/qkI0M2zOZWVOovDpHK6AvNPFNO5MqBipZOF8+e7/vtKQ3cECJm14JEPKFxD+pT6Zd+t2i6fG/BjUXRxCxMsw==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(4744005)(7416002)(356005)(86362001)(7636003)(316002)(110136005)(1076003)(478600001)(2906002)(5660300002)(2616005)(921005)(36756003)(70206006)(7696005)(8936002)(336012)(8676002)(70586007)(82740400003)(6666004)(186003)(26005)(426003)(36860700001)(82310400003)(47076005)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:48:18.2452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 342f9a54-6565-4873-a90d-08d93833b536
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4013
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
index ba0cc0a67b32..29e79e7f5a50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8390,6 +8390,14 @@ L:	linux-input@vger.kernel.org
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

