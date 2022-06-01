Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDB4153A4A5
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 14:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351829AbiFAMQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 08:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351882AbiFAMP7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 08:15:59 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14885C37A
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 05:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpbjwGeC9Spe1sL3NRLuOIhPEOp49ZXgfidfUmk8QoYiDWYj8osndrfflhY5CeOeaVuCxLLizjGShx1bGytnmCxCn2/UhfbBFKDS6vt2vG7+wvAePP/K1xHGtCfQL6DB47k91untJoXuXZVaI9aRZ19bn/Wd8ka0L4czxg+vg5H50fmY+pKqdHZ2pP7Z41JQntKI2xhprOmtpHJMauNbi2FQSdZd38i+LCy5d4pcZdHREAkSKpq16wPhSAnBNp0eM91tmWOGQVXHvNzHYdx4zYgcDZSzryDpAXfF4FXNT1sZt/7WKAUgTTvRYGjgEZUQJsN+CGqLTFlvMfSBBPibTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKWe6F/ToXQNjBb//6e8c9AoUJ7FOu45cCKw5hwEe6g=;
 b=ZHnAZ7PxDxdxSMvEaxRiliPaQDyVW6CKvCfq/keV8mRsEl2Adexg27+X+jzWl/Jwp2s7j4HypqgcFujcn4nhKXT1aXnrfnwUlRzafQimjzZYSXKP9j9JYENLgqR4riIVdQXOq2lnMknE7zppqAUt3BZRc5ntOXmmZy/auGouVX4tBqRlye/g7zMTKSh/25gwv/olK+3GCPONuFiAchijJoOc2tUCUHVodn2Y7nyIqeEA0W1yMJ/Nnfl+2kzMZqdPxnoeGYXpzQ9C34gLqd78LFxfg8Pr0Tub2JRyj+7xzizQljbkg7ahyjwtpJgDV650WP+Igv1qBT5mlwQIsTOYiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKWe6F/ToXQNjBb//6e8c9AoUJ7FOu45cCKw5hwEe6g=;
 b=VyOPwUGJLnImgsisgh116H5o0ARJV0elbhVxwdpzpfv3OXM2f3kz7oNFm4ID9SJxUVkbHTwfD0inZFfmaVso1P69G3pafukgN3Z4aWFN2FWST5Zd/XDWMoiW2AxBbxV3DvsYPnH2wgFnjxvfUSWNe9bVvUJGC44xUbWV7MTpoJ8=
Received: from MW3PR06CA0010.namprd06.prod.outlook.com (2603:10b6:303:2a::15)
 by BN6PR12MB1412.namprd12.prod.outlook.com (2603:10b6:404:1b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 12:15:57 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::42) by MW3PR06CA0010.outlook.office365.com
 (2603:10b6:303:2a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15 via Frontend
 Transport; Wed, 1 Jun 2022 12:15:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 12:15:56 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 07:15:34 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v5 3/6] pinctrl: amd: Use PINCTRL_PINGROUP to manage pingroups
Date:   Wed, 1 Jun 2022 17:44:35 +0530
Message-ID: <20220601121438.999369-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601121438.999369-1-Basavaraj.Natikar@amd.com>
References: <20220601121438.999369-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dfa3df8-dec7-44ae-5eb0-08da43c87b54
X-MS-TrafficTypeDiagnostic: BN6PR12MB1412:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1412495D8DCE7CF66929EBF9E6DF9@BN6PR12MB1412.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L142ewo9/g77w/EjVhJn145EfpuGwo6LYjLOc5Z52PisrorjFLHi27zfUc/wC49OPHDAUdk81mD18Pw0jk0uQPvNYb9PAIFrq1YCCm2/cl9GRjzjp/R4nuB7uOYhz2ndgTR/Tl67JOJZt1SR/EEPYxplAR1JGn1Ijt8wnZUUq7rjflwZPy6YZwPlwtFnqO7WbstVWiY7jN1rxjZKk1yGTsZFpSfJIJcgX0a9d74ERQHdkK4hQwpXQMSZe3bbS6dGyWi6b7UF1ykOKe4tixbcSpzFSrBGtQYRA1SrlWXmGCevlOIc8QR81yIX2tHBqHAneBS4YQvO+JfB8bDxTc1kvJOdLrmOZCyHHgrGZpZrjve4E0riZY69h7sDHf1yAX5g7zJfRAT5JtAMJsK8Sbhi3h0cxRXblveTcTfutjvZ4kI1zt5IcdW/KszpCRcPKyP5TCMjtzkVuR9dcsOZCO9kLLCtUlFEXMZ8cQNbhdEQCmmjKyb0lex1Bi11SnkUfQs9VpVh+3TwOKMsJJBI9qAnVIXFl8Lann942PEBXOzCqIhGZY+88LSTtwfdAZVZZv8ORUmstQVC5IaBotImj0YfM5NjQiq5fRnUwt5KOvaV8kjY0e2XtSPbsqN02lBn68TcqH85lzRyn1mQk+eWAflfWLEXCQ9msOXt2YRkr52BIL6MyDHWshwcn5t6ClLX2okjAaXzUofMZr0UhFtXyP8BlLj2nPHeFtKfLxEet7j3N5g=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36860700001)(82310400005)(5660300002)(36756003)(47076005)(8936002)(2906002)(83380400001)(426003)(336012)(7696005)(356005)(26005)(16526019)(186003)(2616005)(1076003)(40460700003)(110136005)(508600001)(316002)(70206006)(8676002)(4326008)(70586007)(81166007)(86362001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 12:15:56.6118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfa3df8-dec7-44ae-5eb0-08da43c87b54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1412
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

