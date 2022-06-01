Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D67F53AA1A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 17:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344631AbiFAP3m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 11:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348790AbiFAP3l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 11:29:41 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9AB2F385
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 08:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiGtNyEQtNUR4/FfKcQlR6bQ9y6ISLzTqohzGHci1eJHCI7zsbX4fbI5RwPB4IQzdyJPFWJM1din34NkYQkxCyD5ra+IIo3UPiELhZxUh8hjcEba8ZixyJHVR2iQQBT/+jWIWeQlIBGgGnDStpJknFriGvkUP50Mca17jjTWQ3vSmwu5bat3RG1TWwfU+lRUzz4BhY6JyB9cfeYQwdsNJQrDdEj8rp4A5bPzaLPAtCRD+FX4I5JGgO37lRco6Y4+3jix1EtLNiCaAH5t8rwPSP41E0unkzmiu+ZNjcUY1CMXl1XYGWR6CYBnZHRg40CpYw2bsxmBuGQlNq8NHLUzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKWe6F/ToXQNjBb//6e8c9AoUJ7FOu45cCKw5hwEe6g=;
 b=JB3iFQT53WReupQlAMLPL9vhgT81NSfziv+dHE6c7xmSshqN+Dx6IKQHbtpTQpqvdZXfttebBoyt9a/Zr3wXRctOd5oCpF7Mpeq4bObkhjM89OfD92r/McQI2gj9AgRXNXIL2f/sRzd8eEc9onHoN6UTtXVvZugQ5+6ZVitJ/0A2x9WRKUUwgPdms+RqLds3Ej59ZvluX9oNdiaeLMfIkH4c+fr3Hu5WxvIt9nPxWOe/kZICqTl8f79bEL24V+tBz7TWa9inICEzviMQlvHbnTIGXM+ihORKym3LxfRNNWwGYLroWvq3nWKLOAhIkElB5r95B+8Anak4SAyEzJO3/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKWe6F/ToXQNjBb//6e8c9AoUJ7FOu45cCKw5hwEe6g=;
 b=gcWUgprZlbMh4fswpdzKhaXSmG2vAl97WXFsaDrs+lS2hys0e3EYnzRyxmhy5BG75hYHvED30s31j3Z0NVxTihYBWXHOodUTeW4yl9IrJq/dAZUZXeWq+R4vPsxryhKCn/2TsL74YtzW/M46Y3RqQVk/krLAW+IabAy982hPzr8=
Received: from MW4PR03CA0016.namprd03.prod.outlook.com (2603:10b6:303:8f::21)
 by MN2PR12MB3967.namprd12.prod.outlook.com (2603:10b6:208:16c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 15:29:38 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::b0) by MW4PR03CA0016.outlook.office365.com
 (2603:10b6:303:8f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 15:29:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 15:29:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 10:29:34 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v6 3/6] pinctrl: amd: Use PINCTRL_PINGROUP to manage pingroups
Date:   Wed, 1 Jun 2022 20:58:57 +0530
Message-ID: <20220601152900.1012813-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
References: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 404f1558-a32d-4bba-1908-08da43e38a16
X-MS-TrafficTypeDiagnostic: MN2PR12MB3967:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB39670D6BF7BD4D77C5FF7083E6DF9@MN2PR12MB3967.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UaYB3GSactCPgs8XD2TEWEYLZ3YOIoeBKZO9zTiOZ7LArnf1zYSfYXsW0gvBnVFxlfinrv9A7xwuYrBTyvmCQ2YVEGI4wo3oefxFF6aAZt794ihz0Ntd11vta9HV8iYScm/Yka/dj3RLn4p3Sj8uDuU7yVjt8wVBy+ccvxG9RYssk0tWr9xA4CoOBs7LzprbTUkVeycv8gKWn1t1WUSSZUy9cD/KPARGr3rfU6aPjGLAP9CaOGy4mR0+U76fQLkL/Xbgd57LG34fUEXk0G363RSfVW6edQDBlgl3Y8ljJ8BL8Vx1OodH8CK81He2syfVaPA8KhQhXhhM3LdrOznpzce34T+1o/GXAZ3fujKybG9I2pRcHJhH9ZBS9y0PZM5Qre0ZpRpADjsehDIs32oRtPkBEvtM6SnQPxucRLxlbNuQcbZhvXpqa8tN3gS8aakWBnXszRUll78mt4x72E4BwANj3fOM1K9laY5syshUWwYiCjpx1VF6p8h+XW1kFd4BmoWfzf2T2wUBc9FR/Y6f+X6yrpgSFcSe+F9+8uVrXuLn/G0QXKRTomTnr16mS33hhSZIfVgb7cjhLDGIMwETBq4o/hjVR8LxcYIqbVPOh1v+dSRDlPc2dPLBSsZfnhnpWyuGLNl5f6t/C/qM3RVqwBrFam4f+qz7WwrJ/CSCEW1N9kl/IQ4LOPCL+LJOXO8tjPggSxBC5+7YDKgXETlG67XaBTug4DJaZlAo0rgOdAM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400005)(81166007)(426003)(110136005)(47076005)(6666004)(336012)(36860700001)(508600001)(7696005)(83380400001)(8936002)(5660300002)(70206006)(26005)(86362001)(186003)(16526019)(70586007)(8676002)(40460700003)(2616005)(36756003)(4326008)(2906002)(1076003)(316002)(356005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 15:29:37.7812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 404f1558-a32d-4bba-1908-08da43e38a16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3967
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
Hence use PINCTRL_PINGROUP to manage and represent larger
number of pingroups inline.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-amd.h | 36 ++++++-----------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 551dfa664ed8..ac3ebfaadb7e 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -291,36 +291,12 @@ static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
 static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
 
 static const struct pingroup kerncz_groups[] = {
-	{
-		.name = "i2c0",
-		.pins = i2c0_pins,
-		.npins = 2,
-	},
-	{
-		.name = "i2c1",
-		.pins = i2c1_pins,
-		.npins = 2,
-	},
-	{
-		.name = "i2c2",
-		.pins = i2c2_pins,
-		.npins = 2,
-	},
-	{
-		.name = "i2c3",
-		.pins = i2c3_pins,
-		.npins = 2,
-	},
-	{
-		.name = "uart0",
-		.pins = uart0_pins,
-		.npins = 5,
-	},
-	{
-		.name = "uart1",
-		.pins = uart1_pins,
-		.npins = 5,
-	},
+	PINCTRL_PINGROUP("i2c0", i2c0_pins, 2),
+	PINCTRL_PINGROUP("i2c1", i2c1_pins, 2),
+	PINCTRL_PINGROUP("i2c2", i2c2_pins, 2),
+	PINCTRL_PINGROUP("i2c3", i2c3_pins, 2),
+	PINCTRL_PINGROUP("uart0", uart0_pins, 5),
+	PINCTRL_PINGROUP("uart1", uart1_pins, 5),
 };
 
 #endif
-- 
2.25.1

