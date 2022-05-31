Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8451538D18
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 10:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244890AbiEaInx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 04:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238352AbiEaInx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 04:43:53 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF056004E
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 01:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6PYAdG9/azxCI15caPk0U3Xs/VPWwOQL7Wd43fYP/MmK+JNcRu5nexNoyVhvcqEQNGoj4gEEzOSb1/eNaOtcOWGLja/miYHMwyB89nXnj4P8tVCffCAyNBq55kY4c4zlvUBT40IeglnEsHzgJARlIw9BUZX8AfcCQE4n+Xt1HXaP0pcGrg3zUr9M9HqWZJmPnFXTjrg8FnFlnCoJijZ0L9qw8ChdUS+sAwivhU5Msi9jj8yLzOzdkiARaQL4BewWKBgI5a0YTeVmhdqN5fDChVihRKIsbm2JRE/qIKiyNnCy/n6d/s1F16VDzRlwuN8CIZU0zHBE9h3vNWyDRwh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUlB9+WQ5J8e1glegrU60dhmem/6yFVZuioZYCMwIH8=;
 b=YLZNv0D9SHrfMIeJiWASG172HTx1U5AomxK5Yr8tVqZNiy45hQjsK3mc7Ei5NrieRHHtdXIv9f0bHnPjX9tOTxKvIQ2RU+NHKugxBMBboK3HPRJ8AbFwDbIjrNJtCSNdl6Q3Rp8TVOd/JYac+Ku4001iT23RGvk8O8XJm9787oUm3p+gla0mGVonz3OtIyroupfDrV/CQ8q9K5ThiSIXUXNmNIsrrv+p+gZYQinVtPKls1E/4CkZdnxycI4tIr5G0yXkDAHY5mH7O9CLvjbSKE4OecBdyCpVmzAwUcmAa9VTzBkhGwx9hA2xfiekAF3VZeJcNUFxq3ldoy2ClDQUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUlB9+WQ5J8e1glegrU60dhmem/6yFVZuioZYCMwIH8=;
 b=Gnr4lsWrtaEY7eIXaQOGI7vsIu2f2+PrIdb4wVmCdkTQH999o1WInB3SPbNq3o6wCqoteDXGePzdH7Ls28B/zzM6GD+T9BW9sULcHPUl2JEB0msoZIa2YnrrR2X0h4S0X+2ynDOXfQbMDOcNqwZ6DHaL41/pSb7y3YH8uau7eRM=
Received: from DM5PR06CA0095.namprd06.prod.outlook.com (2603:10b6:3:4::33) by
 DM5PR12MB1372.namprd12.prod.outlook.com (2603:10b6:3:77::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.16; Tue, 31 May 2022 08:43:50 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::6e) by DM5PR06CA0095.outlook.office365.com
 (2603:10b6:3:4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 08:43:50 +0000
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
 2022 03:43:45 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 2/6] pinctrl: amd: Remove amd_pingroup and use pingroup
Date:   Tue, 31 May 2022 14:13:18 +0530
Message-ID: <20220531084322.1310250-3-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 758b674f-7942-46e3-f061-08da42e1af8d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1372:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB13729F9EB7F4C83F69519241E6DC9@DM5PR12MB1372.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VxbnTR4ToW93etyQgCAiCM+hYub8w+4ytUDNyittOMu+osld23hKjNmlK585IKrpMwaKUXaEpJruickWeauyJQuZEUhQh1B5+ErjQ2RvWBl2uLeYDd1/VBCgwVgvOgAc5H6b8zPWKSaLnue7RzFerzLN14WQ+4Pg4lO9eJuUGNUkBIPpuDAN/D9Y0jH2ybUNK91XZrVaL2B4SNV2KlESUazDE1L+P0+enMPhImeQWQcec4uA62GzMTOXpY0ghtq1FY5v1EvXA4qJvmMN9EEOnkC4ll/Vdpbh9NEojYvKRCgoLb8/WCbK4isq6RfUvdaWUb/gPyI7nwrnknDRkEMRNrtIz46CfddoZ3XwLPY7cy/r+PsqRanbERkLJV8wbwzR5N2bzRcDpQQUa1Emyfj8uwUaezpPTCOiTerVlleDzxTFBq3kRh3n/I7dh+kfJW3pERmDmLVQVCRgwYmRc1fYT5IWeAlK6xZiuWXkJTyRGWeVFty+Ul4a9J6/pcS+8D85ok3RkQidL5q6A1lbMKaQEIKlnVxBS/MGF5WKYR9/HX+HjhzBBk04oMomTVXnXBJwL31DDXzIrq3YPGezlda2J23zKp2XDTZDoyoIoGT8s76ptPql2Lvz9M2++VZfu10v+xhMVXh6hnZKcti+PBCvZhAygW81kqDoxr5YTnlPGZEbNjkRLgpDiLgDtwUNWMYdFs/gE2yX+Wiz0AIh7rdUTtRXWmgTrpgUV6V60lQW0GY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(6666004)(110136005)(336012)(426003)(47076005)(83380400001)(82310400005)(81166007)(508600001)(36860700001)(7696005)(8936002)(5660300002)(86362001)(26005)(70586007)(70206006)(186003)(16526019)(36756003)(8676002)(2616005)(40460700003)(4326008)(1076003)(2906002)(356005)(316002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:43:50.5642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 758b674f-7942-46e3-f061-08da42e1af8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1372
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

