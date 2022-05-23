Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793AD530F01
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 15:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbiEWNKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 09:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235916AbiEWNKM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 09:10:12 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5435402A
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 06:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqxmSIb1e3K3TyxwG8yxNB/SNyiiYxZ76lDR1hm2JBOoL/KA1fXHpcdvc3YerRJU2N7VzoMBTGZmJM+7ZH/IsutescyALt/l9oCzZhZavnGoZbOuvE+ZO82zQEIjZ8M3B8A6G9Zm/mDrcfdamrK6rvqtSSwl/cGgAScW3bl/cT3SzIbVMmNq4cRoBbzrzcMom6MHDiM+4teKZLIiwDIIOYvj7HGwEVL1n4vkf2v+I41PeiKhAQ5xkiCZxsCwVA3VqEt4JA6/jA/kz9aqrpAJ7Hfg94kiKBQEdORqQZehQRvOytd57RiPnTwfYRe8BnRQhivZzbBnVT1Ibc3dKyhqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD3MygzVvCHE0aUxYnU62DKhIrRhU6xpfhMI20pUb+0=;
 b=Xczl0xthRKsj+aEd9/RoiPyYmB7URAxVmF5qMqmEGAGqO5XUCTKM0PRix/1l0JAh3vMhFhnb1roCKTsQFGEzrP4FIV4bsi5SmnT1h2CYROBj/j1X+QZx82lxEEyztw00Qc7jJplVX6zf37J7Bar3LcwPqLBcDZpdObyI00I09c9Ba6ZuvMkt7eyDbvq5VL30MWi2OvM4+db5z6SK+570fnB0aOZXnAl+miZlzrmz0TsY+d/T/kDfG65fg41xuJETuSZX6bY1oVCWitVnzeWvPxudivWxNdAgkLOJBNXHq73qTl/rgg7LZSY/IsKPnWFx6yzjm4DzbiL9jPeATWaWvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD3MygzVvCHE0aUxYnU62DKhIrRhU6xpfhMI20pUb+0=;
 b=du99KwMRJNWrcbiJ2X4wWTCnC0KJg3SuvHnkBawi+ktTgPyxUgZGuYBj0aTX2xgbS8DFmozIzIl7VoWwP7L/K8c/vBndiJZB8aCG+gHf3kY4z5WovONpJTqszxudj1GrIGzZqk0A6btEvrv4xhNQVKk0nktIUwCPV9+i8nGN+v4=
Received: from MW4PR04CA0387.namprd04.prod.outlook.com (2603:10b6:303:81::32)
 by MN2PR12MB3790.namprd12.prod.outlook.com (2603:10b6:208:164::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 13:10:08 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::f6) by MW4PR04CA0387.outlook.office365.com
 (2603:10b6:303:81::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Mon, 23 May 2022 13:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 13:10:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 08:10:06 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/3] pinctrl: amd: Define and use PINCTRL_GRP
Date:   Mon, 23 May 2022 18:39:42 +0530
Message-ID: <20220523130944.473416-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523130944.473416-1-Basavaraj.Natikar@amd.com>
References: <20220523130944.473416-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7c9bf01-48cf-4edb-dd2f-08da3cbd8fac
X-MS-TrafficTypeDiagnostic: MN2PR12MB3790:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB37900C5C3162B20DF736F52AE6D49@MN2PR12MB3790.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9953KMlbpw6CZ9w2bQeJtosgY1ybtQ6JfN3Wfl9n3ftGRy87zG+i83yPhnmypFInBPVUKNTWddpaueaPq/v+u5zH7DPEyOuqN1Pjn2qijQsIrYeh1DEILUHo6kTuLtfNEivP5B6p+ITxsb5KrtCRqQD03RisNAw+I+fmykhhX/SVLRPf7N9mKjYp2D+rBaowUP9AQHR27e+rUDwQ1p/FFa6EqxTjIv+5iov0qn+uPdznSUPgsFmNKj1Wzg1zOcLKI1AnUWaqImNq3Qf8kJSesHZlXAa0V9Ew0oKSCoGj1HPVx8xdDFr9rrwk84b4YTmYwT1ggYy88bEub9Tt/Owh7WQ2Gh6FeXuAHernkZyQL+0+pR2LWcFxcQeacQmAbRcQqfYYUZ2uUjb7SQvlz6R1aYA2bZaRQFe5/5Qxc6h4wIKLNQZ1j1q86HkxdNL4idfg9Ze1KJ6WlFMNQzBys9B47vMukDBAb+/ajtrf3Ro8JBHyTOWhe/3fq25Kzcb0dbFO9Xggl/sTsHJCDUvYvVTjUpN6zH5kg5ZuD1rggJ6WOU/MkU2D+ZVmbUEOsa+WomUAG7d9HDRETfx1iJR4y+dxDAiVTBB5jo4Oa+uQ50F1lKa0myCs2Gv1gVII/3hCjn86i01bx2237PnGkUjduaoMLCYvRs67aKxI/dSm7Kbj287FOQ9KZ/hyhzkoZp4HfN1plN2Gr2wbFidUDTfkbK3Vx1NnMPMAQSNZNKC+zim9f/4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(110136005)(83380400001)(316002)(86362001)(82310400005)(7696005)(36860700001)(81166007)(426003)(336012)(186003)(2616005)(26005)(47076005)(40460700003)(356005)(16526019)(6666004)(36756003)(8936002)(1076003)(2906002)(5660300002)(4326008)(8676002)(70586007)(70206006)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 13:10:08.1427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c9bf01-48cf-4edb-dd2f-08da3cbd8fac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3790
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
Hence define and use PINCTRL_GRP to manage and represent
larger number of pingroups inline.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.h | 39 ++++++++---------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 1d4317073654..de2bc9dddc9c 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -296,37 +296,16 @@ static const unsigned i2c3_pins[] = {19, 20};
 static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
 static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
 
+#define PINCTRL_GRP(_name, _pins, _npins) \
+	{ .name = _name, .pins = _pins, .npins = _npins}
+
 static const struct amd_pingroup kerncz_groups[] = {
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

