Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 302C257C707
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jul 2022 11:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbiGUJAr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jul 2022 05:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiGUJAq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 05:00:46 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2790C2495F
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jul 2022 02:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNuZX6KRJNI/RNH9RZRAR56dWEGrgDVbY7Rj9dgIpijkHcVc1eKKNwutW63RtgGnGUZbz3nozwtGsWQTW0839UxgIc6f6HO9FKx0BJ9RP9rQdBv7CklIV02Une8pQuC1jFlYk/oYTHiqGEpvWAj8Q2evb6pquVCQJjNx8QwBapqQ1KOlVx71zFZiOJ5yEmJYaoovs6H37hYHZCZLaepsi8lmmFwJIr9n7v0tQEYkHtbX9kxTW9o+10WzfpU6uWMX5Cpn3iW2tEEn36w6BeJClHL6ZfAp41rHvrdJG70zLl2mCn3T8ACx3EwFONNXMxy5FhP2uEeXxRN5JhfIfk3MEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrEry1aELx64LwJwov0FPUKGrQNwkqE0Zmi+J0U5Kh8=;
 b=kLYOGMFCa7IaL+lH1FxTbLach4U1MOOWQp9NrnTuPz2NTQHzgk7RaJA+KO25GQum/J/9kkw1kgk3H4zdcVuNBB/krsa3Tr7M68uC4rlHn6TGCAw3wXuzaxJf9xuKrvl0yjctyJC6ZohJEHi46rXAxAuL46w4jMvTSiCgrpP2uuZWZYZnDU2F8A1nMOjVdHYd1gnPmhFXwMscuDtSdoJU908yRCh9ZyE2jp55j7nzxvfGmOvyo2UUStyL2BQmq275xq64Qr5S08zH7d1nwdxTXs2wFMJEmRtd0CfezM037KuhALEVBJrjYD3/K7eVkcGXFWXoXjUUjBPNyV0Yb38LkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrEry1aELx64LwJwov0FPUKGrQNwkqE0Zmi+J0U5Kh8=;
 b=bPNni67OOLo7w4Zk0Fd7cDQPjdXZL9VPQtmyAe+r00xA9lae8tA2FQQ2XJPFrRPQFV1ShgI89AYkrUoOvjniyWDvhC9xZDqmLM9odh5wRwIz1fA90dz5rkHH92Q+6FNpRJAJwLtXkfGCdCieFjOaNn4Kv38sVsQv26HOsfKe4lg=
Received: from BN9PR03CA0427.namprd03.prod.outlook.com (2603:10b6:408:113::12)
 by PH7PR02MB9050.namprd02.prod.outlook.com (2603:10b6:510:1f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Thu, 21 Jul
 2022 09:00:42 +0000
Received: from BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::a2) by BN9PR03CA0427.outlook.office365.com
 (2603:10b6:408:113::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Thu, 21 Jul 2022 09:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT007.mail.protection.outlook.com (10.13.3.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 09:00:41 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 21 Jul 2022 02:00:30 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 21 Jul 2022 02:00:30 -0700
Envelope-to: linux-gpio@vger.kernel.org,
 brgl@bgdev.pl,
 shubhrajyoti.datta@amd.com,
 linus.walleij@linaro.org
Received: from [10.140.6.59] (port=56810 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1oES2h-0009LA-AF; Thu, 21 Jul 2022 02:00:23 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-gpio@vger.kernel.org>, <brgl@bgdev.pl>
CC:     <git-dev@xilinx.com>, <shubhrajyoti.datta@amd.com>,
        <michal.simek@xilinx.com>, <linus.walleij@linaro.org>
Subject: [PATCH v3] gpio: xilinx: add missing blank line after declarations
Date:   Thu, 21 Jul 2022 14:30:21 +0530
Message-ID: <20220721090021.17005-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd674dcd-3be3-4b1c-b48b-08da6af77d65
X-MS-TrafficTypeDiagnostic: PH7PR02MB9050:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgcCiOdalM+KAZoFtWvxxJMevR7a/HGXpfOQ0qdOxCVwU+hL/9cYR/I+uaA8LrM1uG207DWKkyUlAjgYJIEPJDJSx+hlaT87ApOV9jX3vOi4JCZqMXaoGuiaiE9rEZB8xy+PJhKdvsiYGvkBkIf0RZGGoXoKVjUIerAooUMcGxgezzxV8/ivLe0khPRCrf11xrcwLfxobXbhzvQVvjHnxirx4fxO+5bClGtfwJeyyYkkq6EhY2aGixd3oRTbSdL26wYKiq4ODZCKxvCIhVTteEt6A9TOANr8LiOM3zFqjyo7N7bPG+yfasj1yEYJ/JlaKcpB3zBpKOLslyNOgEq3diP/1+de9Zw0ySkrEB3HS9nNSPStBzckIAguid05Xm7GGARbxjZniWwD8XQdZ0cvE2Z5Hu9JTwZRlOp1VI4DxOsT5RnZQr2P/WV3UEL196ob4bdyP3zys8+DMO2hM98uKMx6ACqCgtBpCV5zBtNohlPYGGe0jUhW+SeTFxwwJFIwDY8ZiWYH2iLaBH6U29Ww4HDKWDouLOIMHMsxd0dQVcip4EboznF6P1C2L5Z2dp9mUqsgS5Kgg8dzXS63PYoM0z4AdnhxAYhNf6quVWwQTQDmp/0RwNtIroKN5eceLPOXmXoNKpO19h90m0vCog/4YNOicHZMigjtKXMA0ShKXe5p/ymnIxGji0lmS7PP+1nRrLJnS4t6HY2/n/iAGElC9/Sa+664b8n1hpKLn3Fb8x0/qR/6I/U2Fj+RHAq7/Q6TjvGYvKyUBs8Kr+E9g3+fwv+oMHxm/hMk4qpqljew5xQ/x/Mh11u3UaB3Wk453eb8IvzuSvHW+E3WjesZEhKvLg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(40470700004)(36840700001)(316002)(110136005)(40480700001)(83380400001)(356005)(8936002)(36756003)(82740400003)(7636003)(82310400005)(54906003)(44832011)(47076005)(2616005)(36860700001)(186003)(4326008)(70586007)(426003)(5660300002)(70206006)(1076003)(478600001)(41300700001)(8676002)(40460700003)(9786002)(7696005)(2906002)(336012)(26005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 09:00:41.7911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd674dcd-3be3-4b1c-b48b-08da6af77d65
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB9050
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a missing blank line. No functional changes.

WARNING: Missing a blank line after declarations
128: FILE: drivers/gpio/gpio-xilinx.c:120:
+       void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
+       xgpio_set_value32(a, bit, xgpio_readreg(addr));

WARNING: Missing a blank line after declarations
136: FILE: drivers/gpio/gpio-xilinx.c:126:
+       void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
+       xgpio_writereg(addr, xgpio_get_value32(a, bit));

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2: Update commit message
v3: No change

 drivers/gpio/gpio-xilinx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index b6d3a57e27ed..7f129e7eae78 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -117,12 +117,14 @@ static inline int xgpio_regoffset(struct xgpio_instance *chip, int ch)
 static void xgpio_read_ch(struct xgpio_instance *chip, int reg, int bit, unsigned long *a)
 {
 	void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
+
 	xgpio_set_value32(a, bit, xgpio_readreg(addr));
 }
 
 static void xgpio_write_ch(struct xgpio_instance *chip, int reg, int bit, unsigned long *a)
 {
 	void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
+
 	xgpio_writereg(addr, xgpio_get_value32(a, bit));
 }
 
-- 
2.17.1

