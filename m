Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 079EE53A1CE
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351440AbiFAKFi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351731AbiFAKD4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:03:56 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD60812D0B
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBkmqky5TwF4FBgSK9dZxhBAgPPtxKuZ0o93VtPzcveNgEp+OyIE6A8p9P5+DPzEhOk2TDFeqYMWOeKE6iQSTBJyFQyDNTfacvQV7muC8GGZx3tSQlTOm071BQsERn6qX6AeSxrOgAEbIDDkO+h4uANmPKQMyPNSuyCQ6ea+8CX5oKVzTvfbcsgE3v5lFKOZP8a80U/3Ny77QrZjUZGGYI1JnVa0SsxYcz9zBi5hjoaIelAMnhJvO/Bsh9hTdmtQwEn98v3zfcntQoajoljviSccRJjw9HvucB28UFygvqZZdCISEfWXrQzdwqHBQ/rakstzs1OTjmR7cddcQG2A7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7iLDjsksD010xQLH2CmQwvHp25FEiFz3lybrkmV/ik=;
 b=SeGPtyOHSTsQAfm+wBb5rrN6echVzrwQzeNm6x+jSlKzEptbEkgo5pFUDZvcVHKQPVHI7zsqOT+WzHeaMXQtIuX1mJ0d/DxZgeILlc3l845e69kUMrcMs0+6OZBRi/RwVBvc7qJUvODmHiOx5WRCvPd1vq38PaxUJvufBvQ39woZY9X9Asebh9w64jUNZFH/XX+gkPsvZFW/KmJs9H9vplo77B7RjdoyZaaI+I9zcwkTbr3CaT3WQSXI0qUgdmsStGs6ArIH+NHqKaiUgUOpMH2eafdCg4TqW2jXHJ95TVWnw39jXIY71OJEjzJJQJgLpnYvyA1K/wbafMqs80urZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7iLDjsksD010xQLH2CmQwvHp25FEiFz3lybrkmV/ik=;
 b=MszCakycDSDGsgicPng2eoeYJfQu6UYtnqVz2Q1Bn2BFOpNfFm4l6UUFHfPt2K+UHWRgV7IjgMC6SoedVGdnDPc4w38evzCHzK94nBJVmHMlZWU00uHbhhw+nH9xaH/qtS8DrGbxmHxZb4/GEzawHsKOA/xBeLnt5C1JIrFSMfo=
Received: from MWHPR10CA0022.namprd10.prod.outlook.com (2603:10b6:301::32) by
 BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Wed, 1 Jun 2022 10:03:07 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:0:cafe::e5) by MWHPR10CA0022.outlook.office365.com
 (2603:10b6:301::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 10:03:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 10:03:06 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 05:03:04 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 4/6] pinctrl: amd: Define and use AMD_PINS macro
Date:   Wed, 1 Jun 2022 15:32:12 +0530
Message-ID: <20220601100214.828595-5-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601100214.828595-1-Basavaraj.Natikar@amd.com>
References: <20220601100214.828595-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a66ba95-554a-4f1c-06bd-08da43b5ecfe
X-MS-TrafficTypeDiagnostic: BY5PR12MB4902:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4902F6A540141326E93415FAE6DF9@BY5PR12MB4902.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PzqBrI69+TD2+mSKmPIIwZ6QODljji8lbNZ+gKmCl2lIRGITB8U/MbJhJKr7fcWZ/OKrLlbysRlq5H2UUzIt0Bw4BH0qqyYTdSScNYAhEW+IZyDqR0yEjUUZIskN4RjBakiEklEqjBZYVR35vVCEv3Hq3GdxJHk1x52nngPAOaWchrX5NCkXN7eCSRnWJcrLWlzkdnuvZ11/RWpUZk/QmCUwuQwkOFUgF6tRca51GbreKmoeu5WUm/QsgZK6F+zGjImdJP2urcQMj2zGmcQVBFWiRuTJStl5fJku1nwgYVxUBqn7Ee1wAP2/GVSW8uoPlCdDe8RbsbHzeedimigyOb7rhTillRFdrPbU3BzZclfed/Ajdc/jMmriM2GJa9wjwVIBmZX3kTA2D3r5cT/EamtQ/hoFZbZtoWwgI8yeAv+SNlZHaVxKmTUE8NSj3UTA7xGFfy2pLpqRLYaehOtUspnCEyDwdzGEaIaVhprwhez00qOhpEKAW3MNeb6xn7l9D8nRdX3WZGo11v1O4i6ioesr+DrjXFISWLiiVaNYmmC31Ll17RaO8X45D3Jo0XBPE0GJV6ng72iYH5wdHss5jUf0XniUiZ1Riiedh7fSWdhjIhdPKfvw2UjJosdBMfy5Y2ltpyM3KH2vcDHyyH6rYUxxsbEZ56rvVPlYHFr6J+yKZxbovlSGiL2DBYl29pWWw3c1UVpoXzTC5TDKSVckPB8g5FeJfUAYonpVs2xV1FU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(5660300002)(70586007)(70206006)(86362001)(186003)(316002)(40460700003)(508600001)(8676002)(8936002)(1076003)(26005)(16526019)(82310400005)(356005)(81166007)(36860700001)(2616005)(7696005)(2906002)(6666004)(36756003)(110136005)(47076005)(83380400001)(336012)(426003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 10:03:06.8684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a66ba95-554a-4f1c-06bd-08da43b5ecfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4902
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

AMD pingroup can be extended to support multi-function pins.
Hence define and use a macro "AMD_PINS" to represent larger
number of pins.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.h | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index ac3ebfaadb7e..be74fb106fa7 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -282,21 +282,14 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(183, "GPIO_183"),
 };
 
-static const unsigned i2c0_pins[] = {145, 146};
-static const unsigned i2c1_pins[] = {147, 148};
-static const unsigned i2c2_pins[] = {113, 114};
-static const unsigned i2c3_pins[] = {19, 20};
-
-static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
-static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
-
+#define AMD_PINS(...) ((const unsigned int []){__VA_ARGS__})
 static const struct pingroup kerncz_groups[] = {
-	PINCTRL_PINGROUP("i2c0", i2c0_pins, 2),
-	PINCTRL_PINGROUP("i2c1", i2c1_pins, 2),
-	PINCTRL_PINGROUP("i2c2", i2c2_pins, 2),
-	PINCTRL_PINGROUP("i2c3", i2c3_pins, 2),
-	PINCTRL_PINGROUP("uart0", uart0_pins, 5),
-	PINCTRL_PINGROUP("uart1", uart1_pins, 5),
+	PINCTRL_PINGROUP("i2c0", AMD_PINS(145, 146), 2),
+	PINCTRL_PINGROUP("i2c1", AMD_PINS(147, 148), 2),
+	PINCTRL_PINGROUP("i2c2", AMD_PINS(113, 114), 2),
+	PINCTRL_PINGROUP("i2c3", AMD_PINS(19, 20), 2),
+	PINCTRL_PINGROUP("uart0", AMD_PINS(135, 136, 137, 138, 139), 5),
+	PINCTRL_PINGROUP("uart1", AMD_PINS(140, 141, 142, 143, 144), 5),
 };
 
 #endif
-- 
2.25.1

