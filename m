Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAB15B9A18
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 13:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiIOLyD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 07:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbiIOLxm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 07:53:42 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8645EA1D38;
        Thu, 15 Sep 2022 04:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp57Hpwl833u7inTLVNgkriTl7CNpoEMotmkpXGluY6ZXCz9NuEXPZUS7vTA3lq6S3E3rQgjeWJnTergQ4oqzF3FfsOsR+iqKrjODsKEGJrWIgGg0KIn7mxYvl5zBPOJrcyk+rgGSY9YOF7pKEy7QtyT8YgzEnX78PItDkPujbr20lY0ASpre0cUpIhep070ds4DzEeFfCym8HnkFEhJa+9Jv99STAeaxSECm1qFPjQ3KcZYK69ZOKMIj/Q3WkCIs2hYj7JHuRk0J1z2sKxmnU5hMFKfFIefdIKOaKLttcMYkYuipu5qLNEzek+5ZXDHitLs1zKtlMTw3lWFl4u0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+H7dqBTnqjj3PzjEUxlgecE2fQvS0pGPMrbDjLZ68Q0=;
 b=jwp+9zJiDrtiOwbAE9ltZsmalb2USH081eOxbQtmdzhRnfdInd/ds+VcfYbzjd8+C+VZtysE/Lpg2BdVWplP2XDbtdCF3EBfeFVYNUIE5VK0D2iaAB/sKLrnJPUy4xikzD0RSZ/mvIriBQk6/DSJNX+L1DOjRdzosY1XTa5KGQA6tJu9NKNaGxe3890j/q4AfNs5BeYGuNq8d/8/kXaxt6SuvxmmHnRac3zSeRe23BaofycvFowhKbZy4IgqWzM8+k3PcyfWoLOz5IX1WK+wwFVhIYKACfwOErjjHTi+8lRX+jX35sbRhT+N7FQ0QjkBfcUWJaozNbnICZ6RVM4bWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+H7dqBTnqjj3PzjEUxlgecE2fQvS0pGPMrbDjLZ68Q0=;
 b=rBfQC6Q0wkjtAJRF+Ri32KzxGtbEQb/RI9z93RyoAh0TvhjOE8EGPNh0lGwrVSy6xRujNr3AXms+8Hy63Qm6TL8fejg2Dn+MrpXLTCxrIYsxVqNNFEaplKM+uZsQQxkuBXoNHyNOgGd5a73+hFfsikuJu037OFovbMG1eg6CLF8=
Received: from DM6PR01CA0028.prod.exchangelabs.com (2603:10b6:5:296::33) by
 MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.15; Thu, 15 Sep 2022 11:48:11 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::e7) by DM6PR01CA0028.outlook.office365.com
 (2603:10b6:5:296::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Thu, 15 Sep 2022 11:48:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 11:48:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 15 Sep
 2022 06:48:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 15 Sep
 2022 06:48:09 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 15 Sep 2022 06:48:07 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
Date:   Thu, 15 Sep 2022 17:18:02 +0530
Message-ID: <20220915114803.26185-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220915114803.26185-1-shubhrajyoti.datta@amd.com>
References: <20220915114803.26185-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT052:EE_|MN2PR12MB4303:EE_
X-MS-Office365-Filtering-Correlation-Id: a78b33d4-e63e-4e84-998c-08da97102a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +0zfQs7uLnv1QsI1HVchj4OGhajkk7Hod3CoDe8Le3NZ12mReyMGM5Vu0cr+AenZ1Mqlcd88/mLQ6PJYjqXSV/sJvX2moeHuq6hHqLX+BZEM5gby/lfQGLw6hf06j3QgTu1OBSJiKTAFezuCfVu9O5x0+93mC4lafqQvytnOEDDP5t9vayPGFKx1xr97uqoAmac549yuwENUzIkkklXH5HM9+04v86Ab9CFH6WF8pogx+A6lqnV7sBdGRzErwNyYjmZbw7PrDgLMhRtn7871fj4rzg4yK/lwpohM0b8+7TLiylmn4huMWRU6gjMl1r5YLcGcVcp9ErAeVPBBEMiTAgcFayUUzALFDGIxHxQzVzzhXL4BzgEAtAXo5kn3eyE7+w7+IMxjXoS3BpHrLV5ZfKZH1Q0EIbjIJI0a5306G481+/IR9DTAlYiUAo41OTeX6OjFiGvsRUAuHdSHTsj31t2niBbnkOaXChdPRJ+0yDlk0MybibVz4rHJM61bDNowf89akWb8QQVapf6LmiuxNyoGRhoJ/pYg6rlf39dni/kqOK6bj6lKjhEKQAePCELgowe4z9ZWEaj4pqrMGv2dtvOSu/mNgOhkx2679p8cvlrDgEzcreX0evph+33uuVyu3+ZcNy8S9dVjo3qnLHaPwkh13V1bNqssdGJbTm45j308P9MngsPf2cXBQzXqe830NIPTfIjXAZXRnzr+wHE5Af8W4WiXgFxAG7RGjt7uEcWVBm6mKZn0HIMnkflSpVukpuRdmTyIn9/E7mYOwxm6TTZKt6rcxGQMXvY4pipFEF+UYezopYMz4NICIvopyqfW
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(8936002)(44832011)(4744005)(70206006)(5660300002)(2906002)(6916009)(36860700001)(82740400003)(478600001)(40480700001)(26005)(6666004)(4326008)(41300700001)(8676002)(54906003)(316002)(2616005)(47076005)(40460700003)(86362001)(70586007)(1076003)(356005)(81166007)(186003)(336012)(82310400005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 11:48:11.1129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a78b33d4-e63e-4e84-998c-08da97102a58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds compatible string for the SLG7XL45106,
I2C GPO expander.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
v2:
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

