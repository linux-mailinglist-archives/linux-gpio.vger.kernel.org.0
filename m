Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C69F1596BB6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Aug 2022 10:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233930AbiHQI4I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Aug 2022 04:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234550AbiHQI4G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Aug 2022 04:56:06 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6348036A;
        Wed, 17 Aug 2022 01:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjO6vpmVclJoVwV/lB4D2Key1GQFoJjIBH4mxO3jgEWNG6uOc9phB4ZkbFOlFrYiGzsXi7EiJkJl3d2x71w/LuSWVzz9pvMjQxQBian64bTyHqWsXAcsTmu5S78Y3soJbqNF/dylHhnSAHHF50Xl03evn8gT95mxnX3YSJTrxR2nYT7I8rGWsQzOj6UHTn5NY1zEnGPr8RUJS1nGGQN+Pqhy/RaYh+tnoG0XFwSggQMHLS27zV/2h0djtOPmmirnjgfXelNkyHL35MDOqS3Yx8VEJfXvCXE36euQaHSqGfB0uSWoYK1aFhoKtywRzxB/0xle9STbzkCfSoYGQtCZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64zNFwuNKpA35XQ2x1wf2t86I5vcoIQmfGM1GQBaDCc=;
 b=YQzx+k+YEw4E3tuWqrJJ/7YAF9upOMDHt2v3uqqtuxE2Tn4hrN8eyJCrRv0QRDgs/mh/KoAkisNcZ8ivKyoQFCtKe7GCU6Rm1opkFFkjyIIk1DYNMW/ZqP1fm5DE4KmX7v5BTmidTqx0FBZK5x2iyCihBUX8K2nHI4mXRhW4Ayg22y4nXLa1E1fChBSvlLp+Oe/9VKWyIx6KchtLOg0Kiktg+nmA3KmrnGAEJRMlP2pEh5GxfvJ2QU/7UZt9cJI746B3z9Lmi1W6FIIW7wccNI1+tnwyaYOs6blxTyCZHwSENVL1FyU4mXAUTl0cEc+nkmrU5/uQ4Y2SRY8BBXjViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64zNFwuNKpA35XQ2x1wf2t86I5vcoIQmfGM1GQBaDCc=;
 b=tkkBNvVcqSuYEtDqImjNVY/NSFe5hqkQO3tVUUD7/I4K9GrC6oyaWd9+BLW0ZRoGnQ16gx0GtXn75cyiFCQS1vdmG9NdnLsVfJW2vKKuBnjq6UlB15iawGtlS708ZmQ7AAU455bHc07Jgku0h+5CTVVx2Nokgk9BqBoT/cgFt0Q=
Received: from DS7PR05CA0084.namprd05.prod.outlook.com (2603:10b6:8:57::25) by
 CY4PR1201MB0040.namprd12.prod.outlook.com (2603:10b6:910:1b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Wed, 17 Aug
 2022 08:56:02 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::e6) by DS7PR05CA0084.outlook.office365.com
 (2603:10b6:8:57::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.4 via Frontend
 Transport; Wed, 17 Aug 2022 08:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Wed, 17 Aug 2022 08:56:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 17 Aug
 2022 03:56:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 17 Aug
 2022 01:55:58 -0700
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 17 Aug 2022 03:55:56 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git-dev@amd.com>, <mans0n@gorani.run>,
        <devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <shubhrajyoti.datta@gmail.com>
Subject: [PATCH 1/2] dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
Date:   Wed, 17 Aug 2022 14:25:49 +0530
Message-ID: <20220817085550.18887-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220817085550.18887-1-shubhrajyoti.datta@amd.com>
References: <20220817085550.18887-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f15a3b4-1b7e-4133-49aa-08da802e4fb8
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0040:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KDuMbFDsK8pVFkWjjQane9j6Xw9x3WhlqqD9+9LDP7RnomBP1DO4KFTvkBjKKdJAxhjIrVacqn78lz6juRXW3KYPPWeow1jp1TO7bZujv8aZ1nqFYNxxYAZ1QTfK9r/IRPb7r/i7p7/fbmmchlRdL6JmekUS9DLyjqrWk2l7ev6w8BJhjUMTCuROUqgGC4s3pourAJm9lII+qcppfFJFoJGp0Sd/akrzyl71qY+ZXMXaoVBP9U69wasCIcPBEnDMA3YWR47LucpPwBqIqM7wc177NTERDbwHXaeE3VeheNTmpOQJVRUx6Y63x63nR8xGaR5rA6EpIs+q7fqG5wDWEwp4k5jl1hoW/ZuVjQWmKtoBqszbKIQGwb01iwoxalbZPUBI2e49pskl2O3VXChLJwciCKvtqNnws4chtFG7tCHtEB3NUremY5VZiyGOumUvdM5fcRLIsvzIh0vwxwVdm1eHcgIc5+rtU8MbCKjwzVlwcrmc7Ux5IzxoQ1iMQSveoGBjZR1YwmkappgGfLq8OudqQX3xpqLIlffRPd2TLl/2HQXy96SYuBEzef00qfJmv+5n6eFtNnFUD9tJY0YoVJfz7K8zEPtV9AQydfA4piSG7f3lDWR+LD4VXqAKoeY1+ilh+zR7HQEJ1iDrIbvwNpSiG8aJLy6ip5ajDjEBSyzML82eL9OYO9hnXMgKm5uPE9oZT73Y5HU2FqM4aldPPdeu43r5oUSGhe5w1dKnggjUfgwwJT/dOx4GckKg4ZasfcRgC1jCszdGsWtH7/SYJCZF+8PqE4gKmwIz3uZprQILOnMRl82zpPgBqwltTKVCFRNFTHszzzSHJRKwksKcyw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(346002)(39860400002)(40470700004)(46966006)(36840700001)(316002)(70586007)(41300700001)(478600001)(82310400005)(40480700001)(26005)(6666004)(70206006)(54906003)(82740400003)(86362001)(81166007)(6916009)(356005)(2616005)(2906002)(5660300002)(4744005)(47076005)(1076003)(336012)(36756003)(36860700001)(44832011)(426003)(8936002)(40460700003)(186003)(4326008)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 08:56:01.9581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f15a3b4-1b7e-4133-49aa-08da802e4fb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0040
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds compatible string for the SLG7XL45106,
I2C GPO expander.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
index 338c5312a106..503cfcb7f7c9 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - nxp,pca9570
+      - dlg,slg7xl45106
 
   reg:
     maxItems: 1
-- 
2.17.1

