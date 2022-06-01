Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAAB53A1BC
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351072AbiFAKEo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351606AbiFAKDV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:03:21 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 914A0101EB
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAX0w+U8teVEmmoOMg4uAVMLUGzotJgc7K+nNNg5CmVeI01PLKnfO5eH9YWiLNbR6xiK5ry9OoBV1IflNiUZ/NBahv25KgXvO1nDpcS5CFa1LcOKTuZ4+lMFN7EpVK0r5Lvzkvw1JCaXqWk54HloD8rt7Bt/KExlpt9ceywVu9yEl9ZDOc+AQYLcAOXwT9/YBm7uPDt8/xTIoReLLp+2n7dPaVHvxx+CU+4FiYJ7YAYk/bb6n28tzgfmycDQnQ3rbSAlX9EsPb/wPLEYPBQo2ZXfIBbu5hZSScpt/Ox3oEqqWy1xVjgi9ereGkpG98ISsQ9WZYhNLWDNr4cQPUcXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKWe6F/ToXQNjBb//6e8c9AoUJ7FOu45cCKw5hwEe6g=;
 b=RIZQxsSSuUV/rsbMiLmQb/2vctC5wzalah9gDWJ6cqT7Ir8yaXgtj+pyRwIjHxP6MeXarLK2XmKWnx59UzGGL9ho+e4nnPVfYynGRkr1QyqHYPdiuKBjE+sl8Fqt/DdlzH6xvCSpTcwL0LztD3LCcDoE9HB/6MyqNA6rHaTQaY2p1otDWwFu4HcGkfmS5teAFhSP68d2LSLqGFtnxatsgq5fCZmXLQJwdmhaqjZqJqioTQ/Lxa3ZmwS2KQm5roe+l+bOkkw3g9vmaZeKTjhnaYpA7C83WlZpwkIWS22l8fypVuBNALxXLQe+/9zsr1xJ+eTrmhwUcCyyJmddSy+dFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKWe6F/ToXQNjBb//6e8c9AoUJ7FOu45cCKw5hwEe6g=;
 b=E/f1h7j+OtvMit388p4ML0T6ZUY/z9clsURlcWuVt89PCPniI/vh+FIzGbNNpzGuUcPPb4+zDThKj3VAUczVXQzv0yFB2Qzc43YFFwApbiUELagSC0dsER3oJhbwOPZZSPMAwI871anHX04uK8KTejeSGHZyAaAxU2TCq4cptcM=
Received: from MW4PR04CA0039.namprd04.prod.outlook.com (2603:10b6:303:6a::14)
 by SJ1PR12MB6049.namprd12.prod.outlook.com (2603:10b6:a03:48c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Wed, 1 Jun
 2022 10:03:05 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::9e) by MW4PR04CA0039.outlook.office365.com
 (2603:10b6:303:6a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 10:03:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 10:03:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 05:03:01 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 3/6] pinctrl: amd: Use PINCTRL_PINGROUP to manage pingroups
Date:   Wed, 1 Jun 2022 15:32:11 +0530
Message-ID: <20220601100214.828595-4-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4aa9f08-a021-4099-5cea-08da43b5ebad
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6049:EE_
X-Microsoft-Antispam-PRVS: <SJ1PR12MB6049D4D551E5A56B8430DB30E6DF9@SJ1PR12MB6049.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0OCM3DYxqIrVUMU+c9LMmmXiFIufrdZTXFOknzKG5cnxJMFh8rMDmMblovDwfpIYpn+eMulqzGvZuUMMguZT4vfZ7g1oLJZ9vSEcAM3g6iOJrl1O/nuCJG8K5AknmtzMEdmBfTZ7DnFhXJ1mdSSmI107ZVr8EwcyNFxYFsnsQVCuE7lyxb36KqO3YYlG84J7RGg5BrVT3/2znFmLKaCMOAtbHA0Z88M0AWTGT8BUB/mo5F++G/qzrdVzcjexLkyo1Lxw1Jw7wcrnMwoUacV7XyWBlJr10TFbMxH73qCSLinuui4yxOX/JHF8Z2LWuGekyx/9shx1eZBslBvF0nNMpfBMZSFMqVAgvC3KwNPjxGsILPomC+WdH3zICaRnW7oLKTM3Ism/nDBaQBYtMBxnUFwRrm5EMm2XjALL8KMwGMOxpaKmbbRSM3LkgOxJcgdf0x/ZzNm1P5wgO03TOrh1YChJAERVvcc/oghd/FsYfsHd10F+9T70+V4/a+MDtZSGTsEW9hp4GwjHXZ5c5roQJjTVTf+ILnuHnF/T3FmRLZnhJEnM8poskvRXGuqfTKk3rIw/MOlLf0bdx2OrMmncr/pVlD3kB1w/oAqxgFxy4uWTm2240ijGQNV1fjFaktu1Mx2uQcnScqcbAYr4jgTNxsAgr7En+3L/1WZu5aCZ5aKcKcSIcfuLHPmCbanSL1jg2hsE7ovL0f4OdHOK4Z4xvfYX5WS5KobM4nlVzPxAZiM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(7696005)(2616005)(82310400005)(1076003)(4326008)(70586007)(26005)(6666004)(8676002)(86362001)(36860700001)(40460700003)(336012)(426003)(83380400001)(47076005)(16526019)(70206006)(186003)(110136005)(316002)(8936002)(508600001)(81166007)(5660300002)(36756003)(356005)(2906002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 10:03:04.6620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4aa9f08-a021-4099-5cea-08da43b5ebad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6049
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

