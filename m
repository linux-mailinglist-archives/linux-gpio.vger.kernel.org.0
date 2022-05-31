Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60B5F538D15
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 10:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241766AbiEaInz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 04:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241386AbiEaIny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 04:43:54 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68551719D6
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 01:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbLeSHlhRqjpdHPzn2/8FqKFw+8C3ACe1ksTzAOFsTEli9UpfTxl2RbE2TlGpK21eH3khcvG88y83RH4PHDAPhXRBL80d4365wJcxmChMKXJWAaWik3i1IJIrjTCAxUjlNowpkvXacuecCWlXc8Ff3rXKxj/n3Vhq9d8GPx5Zct8Hg9Nwziyr2gkX4vSGioT7l8pTDGlllAc8X7lBj/zSMmN/J0UARNIqzJa3+25FuJuZxW5CJ88TzhQIeysCVAZWxzcrdZCvE3wpLVRMdHGWkRmRXmnP0+Cbse4tJD0n1xnOkNZQIFMCoyWijZMxtHuJ4xcNpdrnFnwJA+cfs6jUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diBI26/ivRukYI+05uj0h/VUn11wwo36FwKZcChkbBQ=;
 b=UoABxYH6lsjwTkiD66Qw0vvssVU3CXvawMcwWEWMes5ojojOe9Dlp8xousOHAVoan3mOA0naEn728xy3uPZdchn00TIIV+TsXw6leXuaM/yCjFCQZ5Co4aupPQLGYYLmbzkdQXTPanFpq4nv8jTlu3lCUcOtqv71sEZt1R8FtgI+W+MhIIHawUGtJRsBJijuN7bqkqDlDBUvv2HpVoWzPDPXQgWE1gtNr8l8bSfnrjMwGS838rPCM4q5d3XW3e8k4Dr8xembI/TiK3McZ76OGBsYYUivD1Gm6OCzf1bJeX/HDlQIrwnc0WjsbqSYJlGzub30viuOGWcPhSGzTfbaUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=none
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diBI26/ivRukYI+05uj0h/VUn11wwo36FwKZcChkbBQ=;
 b=Qd+/p4rySxxXG+568dMvF2JG4idcspNf73SdQBBythj2EXJtYqKv0lQtXeWbQM1P6MESO7r5cxVq98qf9ZrzUwA+5C6SyziVenDbHH2sLcJxBEEW3tl+TXsl8P4ceEedegd4dSyaj5NQqeSKIZMUlR2q9CVjSu+vgIO9PyRSRhY=
Received: from DM5PR06CA0076.namprd06.prod.outlook.com (2603:10b6:3:4::14) by
 DM4PR12MB5794.namprd12.prod.outlook.com (2603:10b6:8:61::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.14; Tue, 31 May 2022 08:43:51 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::8f) by DM5PR06CA0076.outlook.office365.com
 (2603:10b6:3:4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 08:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 08:43:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 03:43:49 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 4/6] pinctrl: amd: Define and use AMD_PINS macro
Date:   Tue, 31 May 2022 14:13:20 +0530
Message-ID: <20220531084322.1310250-5-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 503da5f9-16e8-42d8-f90b-08da42e1b03b
X-MS-TrafficTypeDiagnostic: DM4PR12MB5794:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5794D2EDB51E82582B580016E6DC9@DM4PR12MB5794.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s64dcQVivxoJAGfFam6EO0ZRiizCbzS+ZBAu7KukK5nPqCHiSHe5cFvoJfWt41FparLSAmw9nw/ukm3kGMZI17TzFneYPadR0KYZlRdW4racAfeceXfNMPuptyNeCgXB5cOVVklPlhbnRQop7BD2YfSY7ods4ItTs1Zck9Y6C6oFFLSEj5iRUckIZ/3C8a9RTIImI8K1qjBLwCYaXdWtl3F+jw5YyfN50N8A3ox1X2u8hDeh7mOuxm0F0mmQa+Bg4551O4aSZw+R8gqvDRmjxNK7W3s4USxfny/r8zpklTImnCN4ocOP+KopTSkF2s58gip1+ma0lq7gTQuw3q7LE1GGoJj4CtnMWsVEGx8UM+1Qs6mrC3KtB16X0rrtInRBASdoEbFp/piinB9Z896ny5vwVD1YDH8FgXIdHfZtTcj+yMBeBwk7e7IemRXw1Fj/DAMKCvUHAEkhB+aTE6ZHU6x2L8lvHzXP8/0NgcA2z56C5gYjZZgEubKaqodaNeG+ZU2erQX0GPYIMPIrghjdHG5Lh9oGKseZw7yLaD0t2KEthK8x4o1+zs7xZMn1uSlKSUzkaqf3ZWCnyoInFRSMwoTXUoTaifgVZ1S82vxgFhFnT1PzRT0a8FhMkvm/OeWvNhDKWPJ85XLGS6MplUCKttwkI5XDIgedMWVl8XlxmLLFzvQKhqhKg5KWc5Qs73yv5l81M3ZLcDinmV29jJsU/pOW5T9p5SytB/VKALXP9Lg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2616005)(8936002)(4326008)(1076003)(110136005)(336012)(82310400005)(70586007)(81166007)(508600001)(426003)(7696005)(26005)(356005)(36860700001)(5660300002)(70206006)(86362001)(83380400001)(2906002)(47076005)(40460700003)(36756003)(16526019)(6666004)(186003)(316002)(8676002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:43:51.7048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 503da5f9-16e8-42d8-f90b-08da42e1b03b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5794
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
index d47217e7b39f..5443a4a38eec 100644
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
-	PINCTRL_GRP("i2c0", i2c0_pins, 2),
-	PINCTRL_GRP("i2c1", i2c1_pins, 2),
-	PINCTRL_GRP("i2c2", i2c2_pins, 2),
-	PINCTRL_GRP("i2c3", i2c3_pins, 2),
-	PINCTRL_GRP("uart0", uart0_pins, 5),
-	PINCTRL_GRP("uart1", uart1_pins, 5),
+	PINCTRL_GRP("i2c0", AMD_PINS(145, 146), 2),
+	PINCTRL_GRP("i2c1", AMD_PINS(147, 148), 2),
+	PINCTRL_GRP("i2c2", AMD_PINS(113, 114), 2),
+	PINCTRL_GRP("i2c3", AMD_PINS(19, 20), 2),
+	PINCTRL_GRP("uart0", AMD_PINS(135, 136, 137, 138, 139), 5),
+	PINCTRL_GRP("uart1", AMD_PINS(140, 141, 142, 143, 144), 5),
 };
 
 #endif
-- 
2.25.1

