Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACA874DD972
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 13:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiCRMOR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 08:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236059AbiCRMOQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 08:14:16 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DD2E3390
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gxenv3vMXWRtlVUimQyVn+UBQKknEAcs3NelNxzCmOY=;
 b=XFqvSd1Wr5XtiKtwsL1n4bgTjQkqAeuHpk3nlXj3OkmiTHCc5OW6WOisd5qvSGY0SgKdKPcS1fhPoGcO4oOAt1mOHbjO3upag5YpD6CXwk4WmhsqBYC6vYQYH8h5J4929XjufCeEx1YZBdZQxqELulZkNxce+VmIOBAM1WiT1nQ=
Received: from DB6PR0801CA0066.eurprd08.prod.outlook.com (2603:10a6:4:2b::34)
 by AM0PR08MB4049.eurprd08.prod.outlook.com (2603:10a6:208:12c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 18 Mar
 2022 12:12:50 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::65) by DB6PR0801CA0066.outlook.office365.com
 (2603:10a6:4:2b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17 via Frontend
 Transport; Fri, 18 Mar 2022 12:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Fri, 18 Mar 2022 12:12:50 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113"); Fri, 18 Mar 2022 12:12:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: afc393a806388015
X-CR-MTA-TID: 64aa7808
Received: from c41ea85a0eff.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5222606F-4695-42CE-BC75-8359B13F4024.1;
        Fri, 18 Mar 2022 12:12:43 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c41ea85a0eff.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 18 Mar 2022 12:12:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRgyDOWttQBshkvy38oBlK01IhLcxAk+gimHVbAiT1+pTUDmD+/m2W2zEVuzcIVELJcw5AxBNnxhWmlgDTSxSUMLNG6nOzGooxcMJ/Udp8Q0L3e7wdLo5ke5t5G02YmM1oht7oUsx+o6NEBZw3gOaiSxd3NqANkJSQtevfwH8JIRECbcb0eSrzN4iVtybQopc5c50uBpemNh3EJs1cVfMFALPIPnlU0xTeyZTX1VH+sHwkSzCGeUxwAe6NGohAwTL72sU7Dr67+X7622x4HDFs7ZAHSX5OEOEjWfTU2gPSdpHxTzkhsS5H1K9xqkbSc6kHa5yagIWF+LBGsF2L7tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gxenv3vMXWRtlVUimQyVn+UBQKknEAcs3NelNxzCmOY=;
 b=OQRcLe91djYYH0iQqSBO9CWr3yAYuR3d6SmZTjtc3Z2ln+wGwQOhX3CVLtNCNMkuCUT89qIB9snl3kE1ejK+hdMJd/BxGEG7mBkNzvnfM4PYnqwzbkjrpE7Yw6gvTRHy8BR0TWZWpR+NrnO+nTMAuFGT48cXeAeK6pmSkYyNGVfhQN6IkoVSAEQwksLcYl6C28gwBC5IGK6bLncGmYryDKe34pMQcUJK9ApuCbhYEvEhT2yBUaswjuhSJfEHRk0rdbnVL4sysNvvKlQNORrVEv9NudwFs1ucT8erSc9rrRJP4UmoQaAany3EUbEcC8jizuq3GaU1gc8Led7611recw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gxenv3vMXWRtlVUimQyVn+UBQKknEAcs3NelNxzCmOY=;
 b=XFqvSd1Wr5XtiKtwsL1n4bgTjQkqAeuHpk3nlXj3OkmiTHCc5OW6WOisd5qvSGY0SgKdKPcS1fhPoGcO4oOAt1mOHbjO3upag5YpD6CXwk4WmhsqBYC6vYQYH8h5J4929XjufCeEx1YZBdZQxqELulZkNxce+VmIOBAM1WiT1nQ=
Received: from DU2P251CA0007.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::9) by
 GV1PR08MB7315.eurprd08.prod.outlook.com (2603:10a6:150:1e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.25; Fri, 18 Mar 2022 12:12:40 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::ca) by DU2P251CA0007.outlook.office365.com
 (2603:10a6:10:230::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Fri, 18 Mar 2022 12:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Fri, 18 Mar 2022 12:12:40 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Fri, 18 Mar
 2022 12:12:39 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Fri, 18
 Mar 2022 12:12:38 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 18 Mar 2022 12:12:38 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <nd@arm.com>, <brgl@bgdev.pl>, <joey.gouly@arm.com>,
        <linus.walleij@linaro.org>, <maz@kernel.org>,
        <sfr@canb.auug.org.au>
Subject: [PATCH -next v1] gpio: Properly document parent data union
Date:   Fri, 18 Mar 2022 12:12:33 +0000
Message-ID: <20220318121233.7215-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: fc9ffd7a-a4f2-4794-55e6-08da08d89f63
X-MS-TrafficTypeDiagnostic: GV1PR08MB7315:EE_|DB5EUR03FT023:EE_|AM0PR08MB4049:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4049E065B48D82BF71945BE794139@AM0PR08MB4049.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zicj8MV8TotyFjyO6di8t93zRyUp2jFJVamFk7o2fzlEkKc0c+z/vySkpRawFbhp2c52jGZGfPXoCOenXogYvzqHWZeNskxFBL04zbPEcgPdh6fr53gtAs3aqkjxxn3mlrQLW0k9uWxEE3gkICmx6aJp7cQk+H8IJmH15N5v+Hhq+v/HdOFT6z7JpSUcwZcxJwanXensaWh73y6EtnvCcCNSp9BUIMX1eImgolHMb4XiCz3bOmlj9Fo6lpKbjmaAfb+eY1at7rF5lIpfe/lJ8C7604igg5lwgm1R1fwvwLzqaSp9RKEFcD548Kp3bla0F0/ryEQ4xNvmavs6/N/BYTwQ+AnKhnWDMdUlosR0+p+paCvE6ItYZlYgqUysT464oiiSQ4Yhud9he0zJX5vJf68E/UVqdhqSjs3eBx5Q1H3rkyq7KIVBFRGhp2hD0bQo5mZBdI7AbKk3zsZaCTkiifTXSoVfSeR8ORICx4G+0yebPPws+Pg/lEkchvt6z2PiDPIGIT/nXdHzSIvnsqnSs5MPuaFH13iVc+aUBrHDXLjFtaIBgh8gfn2EAG7j9b1tH2VAAvSSZAL7q94TcIk38HH2PJQ6630KErhO7xg1qEj4nK6mXLIA9KTJYvP3qmFNsc5qNHVNT8T7u7taQ16azyhhLE+sj5WdphxC87uHbaGEcL7gjvMtVfsAlPLGD4NcJ6cNHeIJHeALObLc8H1KNFCc4SmGLt9S08Pq1Ccl7gDEJqkMLGziUQ+5IeaS4hYv4T4uNc7+OLBr3JpSr45bdtewTQITaNXFYiqfcuTsDBE=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(54906003)(4326008)(316002)(5660300002)(6666004)(336012)(8676002)(8936002)(426003)(26005)(1076003)(70206006)(36756003)(7696005)(83380400001)(2616005)(186003)(47076005)(36860700001)(82310400004)(508600001)(2906002)(70586007)(6916009)(44832011)(966005)(81166007)(40460700003)(86362001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7315
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c07acc6a-1ab1-481b-6d18-08da08d8994f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pMNn0z7gdHgrk4ov7/4gJ8LDVNhWAVoxuRt5sbFH8dPCLIjtZ3bww07hVUFmMwXQDUPQSK9k7tv3fyLpJHLmJyvQDYIeF6rqAomRgyF3u2w9o/7lvhUDmN/Z3jo51NtF6VEHcv9cYKYTm6F9t8BBRA2buCtn/PvoUPFOCdS4qgRGhM0bWM+IpxjuTEnSGVPaLTJO/D3AR8XeQXstVEoMa4n1Wb71D11ARLCKaIUnZ52SeRNFJBjM7aTyj1hQ7YL5Mq5R3BkuHwxwOldq9iPssxi5FbCLMQMuOQdJiN2vQ/ljutADnIdCD+xCPkfJwI6TwrZk78JYYenXrZ1jYcA08IETzN/FQt0/PwhbmOimOVSH7/+pfTiZ6qVYPbOHCk3du+immMq3E5SVO7nrO5Drore8gKUhnCoMR+r9GomsSHnQ3yNoKWNEtAhOmXyMfAaHnfK+h92+gaUWK/l+R4ZkB/GSVCf/EZTw3YfCOuv/sjrPCc52baw111/ul/TzLdOeCyxGnRU/m2Dn47RUV7bJ3Nn0lOlsRFAxoO+9Rk2pZLYw9I2xeCOFzcsoc14OGqEaB+RbLMQHj0r5Eii8JboU8dbEg1i+oo9SdlgAvjmHVvo4MFNlvK6IslYabCx6DQM/LwxscY1w3cIvsuSqXjXTxYEJ9WSeHJPOyW+Ev7IPYk6xD4h+zXRbGA7Rns5M5S3nT2Gfqbr7LEPfmlmPvHq8GIHRJQ214NLuKHqMdT5c/odIZEM06pvG2mcp/ggiYOmZqpaxCJrF84oKCQCPhICIGA==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(426003)(336012)(2906002)(1076003)(54906003)(107886003)(316002)(186003)(26005)(6916009)(5660300002)(36756003)(70206006)(70586007)(6666004)(7696005)(36860700001)(2616005)(44832011)(83380400001)(47076005)(40460700003)(4326008)(81166007)(966005)(8676002)(8936002)(86362001)(508600001)(82310400004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 12:12:50.6392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9ffd7a-a4f2-4794-55e6-08da08d89f63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4049
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Suppress a warning in the html docs by documenting these fields separately.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Link: https://lore.kernel.org/lkml/20211027220118.71a229ab@canb.auug.org.au/
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/gpio/driver.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b0728c8ad90c..98c93510640e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -168,13 +168,16 @@ struct gpio_irq_chip {
 
 	/**
 	 * @parent_handler_data:
+	 *
+	 * If @per_parent_data is false, @parent_handler_data is a single
+	 * pointer used as the data associated with every parent interrupt.
+	 *
 	 * @parent_handler_data_array:
 	 *
-	 * Data associated, and passed to, the handler for the parent
-	 * interrupt. Can either be a single pointer if @per_parent_data
-	 * is false, or an array of @num_parents pointers otherwise.  If
-	 * @per_parent_data is true, @parent_handler_data_array cannot be
-	 * NULL.
+	 * If @per_parent_data is true, @parent_handler_data_array is
+	 * an array of @num_parents pointers, and is used to associate
+	 * different data for each parent. This cannot be NULL if
+	 * @per_parent_data is true.
 	 */
 	union {
 		void *parent_handler_data;
-- 
2.17.1

