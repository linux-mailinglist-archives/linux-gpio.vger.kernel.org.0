Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A95A55F094A
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Sep 2022 12:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbiI3KqR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Sep 2022 06:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbiI3Kp2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2022 06:45:28 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB121156F8B;
        Fri, 30 Sep 2022 03:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaS7Vnv1fjN+L+/0gAkGzN3Zi/36R8pGBVeT472ATAAd5HQvYG39UDxo6bMHpk5Nitvx5aEuS1TwnjCz/RSxStwaueR8zVqWSjs3wZuybmwYfWPMJ0v6wwAngeGwWTPmaNk+jzjZ0761DazeJu9MMR4jCDwo3uu6MLkBKvETq5fFM6v4eshxS2+5ClyWbVceL4rGCQVKs/DNRZ75AC6pgWxGb8sB5ak+JBQk6LowCAet6KZNhi1IJYHXhIa31gF5kah0Gyh34VdnfHWdLOW/D19DDQs3AKwilnO2+6Chkn6c2meE/Lc6xkO5AcEo1LFB6wBNhW9W1gPdTn6GUdGpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/tKrPMZUL+VOUAgRPaNNrvSSlWjg+N+oBudjim7Yzs=;
 b=OU5vSiOpJNgf3sx3XG9GKBUkDAZ+Tf9XOyqnvEbnUkmVPL3OdZyzzn5VJ+Jsk2GWw/Ye8D+NI+yUiG2/VMwn2ok4pdbdSteEjL89mpTFkZA/97yqd+3hVDJiHfU7Q5iO2RI2FyB+sXED/rY0/45FQOBJedTf3dHFUMt4GbvYIb7Ha/Gf/K9PeeoBzSXSMOnk2UVg7hV3C761JLQFkC+qaXfhpaatJO3F+RuusZ4bPHf55+wteZHmHM3IxcHnDqsO5FtRFFZhom38w1QGfcVafCIBkC0P8nh6TICd/W3qTDAcGY2jGwOUaQngvSoLbIKPh23vjmN4s52JJEVfxVpObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/tKrPMZUL+VOUAgRPaNNrvSSlWjg+N+oBudjim7Yzs=;
 b=Z/WSuleS0mQ9pZBMsvwRJ3sFe+nA+MF1hyW8+kMHV/NPg6By1Ogi1h0YzQNFhP8jExiT+0pBdwfFf57FcBYoGVOmg3RfdLL+0N4GOojpGvZTA/p8eqa16aHwG8bhNwUvGHvsrWwyQz0p0JA4RlH9Qj6RkfOXTYgoJF3PODceCZQ=
Received: from BN7PR02CA0029.namprd02.prod.outlook.com (2603:10b6:408:20::42)
 by MN0PR12MB6001.namprd12.prod.outlook.com (2603:10b6:208:37d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Fri, 30 Sep
 2022 10:23:06 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::9c) by BN7PR02CA0029.outlook.office365.com
 (2603:10b6:408:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Fri, 30 Sep 2022 10:23:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 10:23:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 05:23:05 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 30 Sep 2022 05:23:03 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
Date:   Fri, 30 Sep 2022 15:52:57 +0530
Message-ID: <20220930102259.21918-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220930102259.21918-1-shubhrajyoti.datta@amd.com>
References: <20220930102259.21918-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT093:EE_|MN0PR12MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 4815fd68-b4b0-4628-180e-08daa2cdc3eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ISyXtNj3xozTNR5p3IlHbet3I/xETp+NWJxnqgiJHFZMtopWwU7Gkwm0t7TSqLRsU9vR8bvp+q+icSGpjQ+ElVqgTyBqJeSEQGnt7jUQRC8ezpfrSytquAII8tzMLzfT+mHBpOIZ7NN7T7VK7+QFWELR1EG90RTzUD/7z9fpTTAHAwTpmyPxmbviYeev+xoKFi2B9I4FHjVyhEdvzwBB17W8gaMUBTq5NE5a+IEyLMeLuAQtdpcOA0JKIK3i6d6DRJdy4NUEI1mLw4pmwRaCG8yDme+oJPgls+g0DlQufji+zJPIMDz9xMFP470YCh5SQJLLNK82xm7KQluJyRqYUEwu+DlDWG1oRWSm2A+W5c8SOqCH0aX6TsPtehYbXC+i+dTeYvQc9PQfsn0u9aM4ubD93uf1sHUJ3BWMtz75s4x7gfQz3LYT+L0iN1DMwC8/kh+swF3tUSaKILQQZ18zrwP3NlCX1znUQQnPgQQ+HfluEAutrnzXzr13dqdHls0sU4RUNCOqR5YCcOWrwwj6QrPcYyqFvJHfvbTVLE2IgB2zGz4tXRKbfkdS8Gz82yuY//Oo9yzw0HCIRnw5wF0rzOSFbMrzS04hxdUOH7wDq161o9aJJONOp+X7FTf0cAkGHmMoSk9CMFoKlkUZW9eFbfwvk+z4IVMmYE/7QUjlb96mBz9AgCe4pQOgMTPoPbbzbmaItQd8YkU8D6kZOCq/2jDDX5F47eSv3qAl9cqAXSBT1mRbwa/Z6u5YDnPRehmmeBuI3efKLEf1LavImVx5CLtb50SvNl79IOR6h/C0yk1/ev7xumu7S9MSKx0rTq41
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(6666004)(26005)(47076005)(1076003)(8936002)(426003)(478600001)(2906002)(186003)(336012)(40480700001)(2616005)(4744005)(40460700003)(6916009)(82310400005)(4326008)(44832011)(8676002)(5660300002)(54906003)(70586007)(41300700001)(70206006)(316002)(356005)(82740400003)(81166007)(36756003)(86362001)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:23:06.4681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4815fd68-b4b0-4628-180e-08daa2cdc3eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6001
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds compatible string for the SLG7XL45106,
I2C GPO expander.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v3)

Changes in v3:
Add ack

Changes in v2:
add alphabetically

 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
index 1acaa0a3d35a..48bf414aa50e 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - dlg,slg7xl45106
       - nxp,pca9570
       - nxp,pca9571
 
-- 
2.17.1

