Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8D6538D16
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 10:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241386AbiEaInz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 04:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238352AbiEaIny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 04:43:54 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2089.outbound.protection.outlook.com [40.107.101.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D2F712FA
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 01:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+CW/++cZCaqyql7npKWyMJdIpDN8et4xsKR9btJhq7jN5+PJO20t1dScN6x06xtfdEI5hM/pUlZwoj26iyXbupH/Mq0bdHHyuQH5J5yBsO1KwUY9yVjGJLPern4QDOhbuvGCp0/qE9Jb1bGJBWgoBZjPSgngL7qnXYDp/z8YML+KZy7hLFuaG82dJcWW/KgF+jzWqIPD+pRHtlE+9YkVRyCeqanHMeOuJfY4VEtwCx03YBCxNtTB5p6WbFkAyQi26APr3IxZ3VZwKayYQw5WSGCSnmJRauZ+QCibM0u0FTZYJIERZDUWeMzZdZKIOg0tf6j4bCLU036sZwZbJ+USA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4EErcWMdIcFsV9qTGJ375EMDldagsISOqk2H8HKIHw=;
 b=hDy3SSAS1XMdJZVD1VUoJBgaRImzKY04gqroz+DOv71pIKeukFAG2fHIxLD9HmCap3bsbYDuqsCXK33MnZm610KT8PEOBfygY0uS4RF5GpRo4rgUNIMTdtyEyp+C1Mvsxp4QlysEm276g+vjwL67XX3/OR8x7c5xQ4ZKJmKtvuKbyEDfYR+wfmvhdFfFFu3u+CujNlaZv/p2FBO6TKl+nyM2lzhRCDztERXNi8hO1ptH+1NbPZJG9VxWKq+h4mUnMWJUAeKsToqY9uTsy2VA0vHlm/p8E0qVj3rMaLgv6p1t2oWAxxPxHEG6KiZdAHUY7HSeGumeOGTgNcMaI3m9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4EErcWMdIcFsV9qTGJ375EMDldagsISOqk2H8HKIHw=;
 b=mryl78n/KZ2/e1INfAO9TTgRbEfNv4c/xXvUBIxmHVOM5BHVecUHCpQTUp+BMvDy3mWMZf6/Rx2uVHi3u/jkKRUDNoJu00IHe4rjo+uwNT/VpIps2/gObWCds/Ck7AS1qYH/Tij0hghiuKCEy96QS58YcZczkOl3X1ezZFPXbC0=
Received: from DM5PR06CA0085.namprd06.prod.outlook.com (2603:10b6:3:4::23) by
 BN8PR12MB2852.namprd12.prod.outlook.com (2603:10b6:408:9a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.18; Tue, 31 May 2022 08:43:51 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::e8) by DM5PR06CA0085.outlook.office365.com
 (2603:10b6:3:4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Tue, 31 May 2022 08:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 08:43:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 03:43:47 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 3/6] pinctrl: amd: Use PINCTRL_GRP to manage pingroups
Date:   Tue, 31 May 2022 14:13:19 +0530
Message-ID: <20220531084322.1310250-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab9a2895-7992-472a-8a2f-08da42e1afc9
X-MS-TrafficTypeDiagnostic: BN8PR12MB2852:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB2852FAAE3A427E36985DCAD0E6DC9@BN8PR12MB2852.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dx3QzbLr16XQpbNt3xVoJVvAbiGmU1uIrwZAJTP5STLznpAkHyIv6GgfnvmLsM+PTTA4FiaGoMZugebg2CCczEvxDrhQP9556Pmzs4qGaYGuF1inIlfOltOR1ScUmzRdBEtmiOrUW7xTGjl/Ewql5WbzwCtAOuFwK24o3c6acTvVWHHBkdg3pZF92Bl8R7TLRsm3FZ1YLFx45hAbhgyDTJRv/gb5JCERUwqZfOyRQnDwbeYRKyymhCW8Lq5NoVY5Au11RnS/jF0+5/dJhMdFOgBPw9oRVL+Pe3/ttOtn/EHKmsMkyoFjqEdAFbg8l5gqtx+230kBY60VmmReM3cFJEt6p74cKM9qU+9Kvhi9wVLPco7iT6V2S2kO1Xr1rRymWpKUXUVzQ8H12lTNBjh6veHGZf/lQHUMYhOzPnZfvpdKtVMDCOcNqdwlrPMUGOx80Mw6HT+lhevFfXw4cHrjLf9HScMolq67kTwbI4brjfhT5/6bJmNQT3odCOYOtEZ47vbX7gk8LkyllH0A6MspPqGi2n/XCeRlQZGklhFeQZHrOYiRMwRTf6Nv55uPwDvGXOTwLybxYS128iNRn6uMdpCRQ6kz/mkhQHCwGB9y8ODvXAwIjsIkFzmnYl9Z6HxKIfTOpWK6Z/DESW1q5btYrL9FfH6uA0CJll6l0M6skMk5ZMcVvKnqTJ4QfSTJjiu3Dac8ChJTR+28m6T3nCCrqhMt0aadBl6bwnYiBT9Uy2M=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(83380400001)(8936002)(70586007)(70206006)(36860700001)(5660300002)(47076005)(426003)(336012)(316002)(36756003)(8676002)(4326008)(110136005)(356005)(82310400005)(7696005)(16526019)(186003)(86362001)(6666004)(2616005)(1076003)(81166007)(508600001)(26005)(2906002)(40460700003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:43:50.9704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9a2895-7992-472a-8a2f-08da42e1afc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2852
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
Hence use PINCTRL_GRP to manage and represent larger number
of pingroups inline.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.h | 36 ++++++-----------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 551dfa664ed8..d47217e7b39f 100644
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
+	PINCTRL_GRP("i2c0", i2c0_pins, 2),
+	PINCTRL_GRP("i2c1", i2c1_pins, 2),
+	PINCTRL_GRP("i2c2", i2c2_pins, 2),
+	PINCTRL_GRP("i2c3", i2c3_pins, 2),
+	PINCTRL_GRP("uart0", uart0_pins, 5),
+	PINCTRL_GRP("uart1", uart1_pins, 5),
 };
 
 #endif
-- 
2.25.1

