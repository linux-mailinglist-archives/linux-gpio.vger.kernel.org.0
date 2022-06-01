Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA27153AA18
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 17:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346647AbiFAP3i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 11:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344631AbiFAP3i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 11:29:38 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5695B2714D
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 08:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhPnjZEt5npJ974SuT626ppu2I656BDWFmhW/36EYbczn/B7Szuea+JqA//ncqwzCrm3lzWtIR58cXbelH5+tP39OJyKGQEhWqE+dgIWkg+4Eu990RVqvho+otoaDMinjG6eBgN+/VMa8AHZxTm7Udi9slap5S6ekpfceqLL0slv80FA7M8ZY1msjLkkSmneWOboZ7tq/IemGcp3RHcSd+fgz0qhYQIQHwfBPEjzCmYo3c58PAzSnT4zSCB8lqOHL86UTE1yaWPyMOkeB0Hlp/nckPhkRoBa6nVMNlpLgrbczZGub29VRfuU30ov3iEXCpQQhemC0eEB4S/b2i9GkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISodmpQfIpqbRihbFNx8jzOm6k72Cv/q+oYX2GpYn2Q=;
 b=V1AXPvYwfxnjScELwidPkrSOnJRbFtFPpmh4+/T3zDxxchinCDk2bGzrHydYDLAimz8DB+NxMOSd+4z91So8PQofy8SqN50OBBGy6PwW/6krEErPZkfhAYuA1jz3+uKxPsI0eqG30pUiasChl/Mqs1dckucTdfMQg3ow6ErhbZEror1cmNCmVRA2znMLLnsMffygNXDVLSnQep68DoILz3akKCjZR/rUWdbchng15bpdb5O8KtR1a4e8zj6VT6HRMfXGYI/sDf2nw4It72N72NuB8+2WgCQkjuvl+o+UFLFC7FDNaFV2LoX3dOsWg5/sPdWhz3Zbr6s9pWWERVNQnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISodmpQfIpqbRihbFNx8jzOm6k72Cv/q+oYX2GpYn2Q=;
 b=ANOcYr7yI7pHEDq2hda7D+b3g1xaBVvA5FMt4fA+P8wt7zE7cf2Au+ySAP8o8/OLQx5jb3jiAeDZpG/NNqmkFDTaeTlbUdOrlR4rViGfByuonuDXbYQFOuoiXxCojiMnxb9tS6lRykr7WGlGy0AO1CmuKEifrFrCCTif1QQ8yjI=
Received: from MW4PR04CA0071.namprd04.prod.outlook.com (2603:10b6:303:6b::16)
 by DM4PR12MB6110.namprd12.prod.outlook.com (2603:10b6:8:ad::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12; Wed, 1 Jun 2022 15:29:35 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::56) by MW4PR04CA0071.outlook.office365.com
 (2603:10b6:303:6b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 15:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 15:29:35 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 10:29:32 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v6 2/6] pinctrl: amd: Remove amd_pingroup and use pingroup
Date:   Wed, 1 Jun 2022 20:58:56 +0530
Message-ID: <20220601152900.1012813-3-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: d15c854d-67d7-4fda-9d57-08da43e3887f
X-MS-TrafficTypeDiagnostic: DM4PR12MB6110:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB611034B73E7663BD0FADAD6DE6DF9@DM4PR12MB6110.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fV9nRPixPEo1cePRtud/38CAQvhzEleMmy79otn2UtHpTie8eorUcmrCP5xgA70UZA4j3/CeCyOABV/rUbU70sweG+aKU5W9mgM/ofOx1PbxgD88eae8vHg1neRyLcxzkeMbVGywi2T9nn7OkKPkHfYPYYFDzdgU2a5y+KWnPeSjOub7aGUsZTdW5q5Ew0KEoQeo8J7MTj4KK1j7A7doCEwOGxhdLPfo/7P/xfLpgypMggDlN2tSMjcx1qsX3d1ZTWXA1t8pwImOWpNjnbzNw2KhhzI89KSRvEQ6AU0BbZU2jLZrwFC9FY51WEDAg0W0DpxXBx83dqMYN1Mf4gOzi9EBMLNYiFBcKje6MUAEAsscI4a9quihTFfHQ7xCcvozf2bJXrUkJ89D0mS+vTqbbzXpKJMNPnM4FA4atMC/P/QHGKXKWaKu/aCI0TGWiNGGzAadtcplqkDU0ovL/Vj+yMJ2IAO3KGNRaqW9CnVZJBdcwP/+fRgjdGFbJV8ENnu9lrAz6gJsMXYNx4XvScUiuRiYu2GZffM87iqpKND9w/jPxnug2pOXj9XdJk+DkqOUy3TS2yNwhfu+IxsU+mnHh934rnU5b7cwB+DjyP8LmhGpVcgDbtCnLdTrWZJvMGOKBx6wi7ov+9jmByRJJ5jFbIRfC5bgMBEJi0OMoCG0y18B8zkjqNdWJz7WeuHtxI0LYeBy4rJjQLOGuKM5eC/EzbiHbpN0lEztW+VHFj13LdA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6666004)(508600001)(2906002)(40460700003)(26005)(1076003)(7696005)(186003)(47076005)(16526019)(336012)(426003)(86362001)(8936002)(2616005)(83380400001)(5660300002)(82310400005)(36756003)(110136005)(316002)(81166007)(356005)(36860700001)(8676002)(4326008)(70586007)(70206006)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 15:29:35.1329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d15c854d-67d7-4fda-9d57-08da43e3887f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6110
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove 'struct amd_pingroup' and instead use 'struct pingroup'.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-amd.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 1d4317073654..551dfa664ed8 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -74,12 +74,6 @@
 
 #define CLR_INTR_STAT	0x1UL
 
-struct amd_pingroup {
-	const char *name;
-	const unsigned *pins;
-	unsigned npins;
-};
-
 struct amd_function {
 	const char *name;
 	const char * const *groups;
@@ -90,7 +84,7 @@ struct amd_gpio {
 	raw_spinlock_t          lock;
 	void __iomem            *base;
 
-	const struct amd_pingroup *groups;
+	const struct pingroup *groups;
 	u32 ngroups;
 	struct pinctrl_dev *pctrl;
 	struct gpio_chip        gc;
@@ -296,7 +290,7 @@ static const unsigned i2c3_pins[] = {19, 20};
 static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
 static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
 
-static const struct amd_pingroup kerncz_groups[] = {
+static const struct pingroup kerncz_groups[] = {
 	{
 		.name = "i2c0",
 		.pins = i2c0_pins,
-- 
2.25.1

