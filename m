Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F3660E451
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 17:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbiJZPRT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 11:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234456AbiJZPRR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 11:17:17 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AC21213ED;
        Wed, 26 Oct 2022 08:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBZ36dWt26GjSMW2cfDILEhIOeKOPvyTWdb/bZdehFUtK9kejE51g8uN38MSKZljP6Vcj3T+pM2Mp4oPqV23+a+AzSRCh+bxaiiozMf11DKmLS508nCnCQowDUsWzYDqh0hd1fvgjDXWUoQLNK7vm+l4omHbMG8fFOkS8sHHiBIzJ0w91eQN3TipW3tVJ3wFBJgVkyaS698QP2evwiN7dAjO/uI1KO3O8kGjW8ZtcINJbrQse1WdlHJJcGvKy4nVbgslapvNsVpUGtmb0Leq/hRYi04ay0TvXVIn1s2sZbIgpF6bJhRr75/d+b2KS5reUlGJcIzbj+tvxEulxeVFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/tKrPMZUL+VOUAgRPaNNrvSSlWjg+N+oBudjim7Yzs=;
 b=LtGgIEcJIa8zGnTw/zgek1aX8ywsfCZvWj1/Iu2NTjlqbuPAoOohaCktYX8oB9T3CJ2EVySLxoiwDauyk0LpulrS45HrwEwnCWaHj/EgOjmtrFFwhAOxwmgJ4r09S0/w6MIQWImR1/N/9YTD/0UqvxSGG9Q9lzEu1DBkCTSq9Z9RH6PqSWZmd7LM1QCfBl2CyC+/AaKlI7/xCS4X6QjysuNQ0gCYvbRmx4Poj2OpzKNaYPWlH+3We+e/D0AA4XryY4NECRt0ndOFtYN1vr3rzyV4p7VgFvqALG7RN8wxg3Zh5uiZPAQW0pqSGphTCToR1NKlrkcjhzo7g4BkMZbHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/tKrPMZUL+VOUAgRPaNNrvSSlWjg+N+oBudjim7Yzs=;
 b=SgAF96x0uRV9Fj9KQqblhZjhiBFq0h9Ag432PfByaHKVZbam/CQzLswxwP6bpc/QV+gZ/wPi1XjMD82dtjWrvO5MAWRTV4cn1rt3aCsjUtUiuLdcEwbIMYj6gPyZfWuD2qefqB1v20Vr6jEe3b+15UQx8FTh2VKnjxn3nUF65I0=
Received: from MW4P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::8)
 by SA1PR12MB5670.namprd12.prod.outlook.com (2603:10b6:806:239::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 15:17:14 +0000
Received: from CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::17) by MW4P220CA0003.outlook.office365.com
 (2603:10b6:303:115::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 15:17:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT106.mail.protection.outlook.com (10.13.175.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 26 Oct 2022 15:17:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 10:16:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 10:15:50 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 26 Oct 2022 10:15:48 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <geert@linux-m68k.org>
Subject: [PATCH v6 1/3] dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
Date:   Wed, 26 Oct 2022 20:45:41 +0530
Message-ID: <20221026151543.20695-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221026151543.20695-1-shubhrajyoti.datta@amd.com>
References: <20221026151543.20695-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT106:EE_|SA1PR12MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d358f9f-2c78-4826-99b9-08dab765295c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f+3XvGbOkpNwFdNeRUOxmDtE9qVCKsRRWZvyk6TxIOqN/m0IoLQqFTgwZs1a/nKY9VWx8gGlUfaUCUJ4YTKwddwWAnmgyhmALVVV82Cx/PkA0wts80L1R+1IW7As278+BYt9AxLxPn4xk/gYUZ/4zMls4L1sbsWQfoRk6I+EVrAyqsSFUkPReOL+Zsz+2zbTOz/iQ70RDetIlpQLPNvmX4Ep+xUAnnEEZzk51hl3x9Y9mvtalOI4HBSYpScvDoyAziqg2Pg+w/guHk7OAKIwa6MBVsUbQJS8DvKtYziJGwe8OKsCeiHXKqyznWF1njqUKw608TaBucU7gYVMqsHkyPh67+Ppi5gYIb5FmRIlEbWwGZ1wuMj23qgF4MvhTPPNUejGqaly+ECo/hT+9zdQlEIY4C/ewqb7twyiBWAuvvzPJ++I0lmAsCMfCbz4tGxU8sdW58zZUKIKTZ5+EBQnieX62BAl3XBAoMdqtqNrLL1MeZ4rvOkgGc8geBK1epty7lzzHKVx9jR1zwRtdbE4moPC5jBDeVcLhl5sp9JwYt6CfzaVMshuQf0bsnrvEN8brI+IRIhVW56DCpOnqinHlBXmrZFlRlRDl/xlkKcsRJD7EBsmbfUzLZ6F1hqCIut88GF4iOLlfXj1R5wCasS94NPIeIOFpUWAg0dIE7TWyHnHWuubAbHoaXKGTyYhJWzbxoLg0LAxbviOhyePaX0RMgAlZgrSssckGrVlJ+arzWqRYIvd5z7mXm5YqLIWz5DA4KGKEvRaEQTJy4+plPRX10UF8t3t031rvuE9ooc3fvwoG9X2x+4S60lUqiYZupm4
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(81166007)(8676002)(4326008)(40480700001)(70206006)(2906002)(1076003)(2616005)(4744005)(44832011)(47076005)(82310400005)(36756003)(336012)(41300700001)(26005)(5660300002)(426003)(70586007)(186003)(8936002)(478600001)(356005)(86362001)(316002)(6916009)(6666004)(54906003)(82740400003)(36860700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 15:17:13.8142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d358f9f-2c78-4826-99b9-08dab765295c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5670
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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

