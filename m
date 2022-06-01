Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F57153A1C8
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352079AbiFAKFb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351636AbiFAKDV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:03:21 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A83E0E9
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7ZlRyYZm+BAihABwJcfXeecPYTF00TzRLl0zmSGojjAvDF350nHSnrXHfMROdBsIAwOW0l1WTaaHa2VM5Bkn6AN/grQnWYq4t5HhQbesT476eCCYUUocVYF3RYuCI+xAcKIR0JKWpqqVdWihQvevhjX0QZ3V3h/IABfSwSGcNgFhSGyNujms/wqn0XgCC2dsliPJ/lMB0Nbe5EQclkWimryt/o7lIhxhMWiEM7epUnqcLIBnAJ4FMnF64YmrMn0MLTZ7AhsRtrZlEtCJd42WS2hu1ChVkLK3EqdgQBgeC1T5iTdKe5rMbljyab3LsMArsIl7TVOOzma/+qvMrZmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISodmpQfIpqbRihbFNx8jzOm6k72Cv/q+oYX2GpYn2Q=;
 b=bahSbgywBYcGze8sl78zyGgyUJeoN65usGDl7Z4XuExtYIw1yyXQhgr+Pf2pzbsYYa3UzQc9sv2qn3wewC/3+kRSNiZ/wdqrHLucBy1vXPXG1fk7KWWcEx47H5zzqfi+Y2KAe2nJx0PrDM2AznyeYATGgf5PvXXQJs8Tg1YAYjezJ9GVbS69+HWXK5RZxSN0R6K3u/4y5EuNMZbk7qhun1AXNRDIy2ipr8kSpars3ik37JgjIh+Sig0kpaG5MSpFvlv8xrIP+2nEV1/6A+eIt02TeBe+dwwhKhhz/lHdnYbL0QMNGi67d1KG6wDfy6g6ZPGFHil7eh8S7fjNx3HQRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISodmpQfIpqbRihbFNx8jzOm6k72Cv/q+oYX2GpYn2Q=;
 b=E8S9v/3ajxXI+26CwfBjChastEZOuben8Zdx7FiyNJDUz1dXlObcdvH3XyymdLQWLTJjms2Gc8rLBekiwLayDja9JQ+IT4CTTBF0Ui3o8CanJHzW01GT9/JuNY4VU80bxT9wY6xzI1NS9EU0y2J2IK85Ap0X1O7y7gBFgE7DGSE=
Received: from MW4PR03CA0339.namprd03.prod.outlook.com (2603:10b6:303:dc::14)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Wed, 1 Jun
 2022 10:03:03 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::c3) by MW4PR03CA0339.outlook.office365.com
 (2603:10b6:303:dc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Wed, 1 Jun 2022 10:03:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 10:03:02 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 05:02:59 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 2/6] pinctrl: amd: Remove amd_pingroup and use pingroup
Date:   Wed, 1 Jun 2022 15:32:10 +0530
Message-ID: <20220601100214.828595-3-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b0f5cec2-6d50-431b-e733-08da43b5ea6d
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB25429FE708B235143DCB9563E6DF9@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+s13WbTsIZ7bMBjEHJAFh0Z0MgVok5gM7IkXNMCEBRZ/y0WzHzDSrs4QtCIM/Us8Ao+bE4gqBaZDR7lR1OC/YNHd0L0zZDAw91CrbMmFX2vr2BpHXkBeGubax4RgWRbcEHrqYvau/hSjXz+44EChhyPwEdyfzSKQ4oiASmH367jV12F71VoBnPpDD4tmlJXcHPueQ7ryK8BS+rUESDBsFRY3WZqabxMoHhCutWK7LsbQGYk/r+7tPWWFIikdcmxRT+KHfRkVB+CcbCdowdf4M6i4XrthaW7fTpWJm+KWh5hAjYkmgRF9BFY8g8p7IUN0qLjgGK1XcP0fmN6ljd6swEfuHn82RjnNiA1/y07D/9neuOfIkouPZP2cvkGeWN3K3l4pWNr4Fn59bPrchJ84xRjtm1fgvF0hAOHdBPOgzYZqynuDzUDqTi5GM469mObFywpmC/c8pnmn9V6x7muYWmNjMxej8vs7yMa7cwnuqJ79FvP7gSzarTm7dHs+8Al91gZrkWU1jkUuMcHw6fUOeA3S30C68wAYUXcc79Bups0qIkBSxHCDaorvdHxcBq16gk0AojojrLx1DeKi7RxDXcV5Hvb3d+Z+9fpuxXZYYzLASIp1nQQm/pf7OKrsEvL/24G0nhaaFbuOJSgFEvkR4HlAlDYVohqaZnlS6ggqnUD3sOm6qzT4t1/rIMctGcZxGS+E+dcebn4uWSOg/ag81pMC5VNrS8TSlEVkpCF2SM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(86362001)(26005)(81166007)(356005)(16526019)(7696005)(1076003)(47076005)(82310400005)(8936002)(336012)(40460700003)(426003)(110136005)(316002)(36860700001)(4326008)(8676002)(2906002)(36756003)(70206006)(5660300002)(83380400001)(6666004)(70586007)(508600001)(2616005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 10:03:02.5684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f5cec2-6d50-431b-e733-08da43b5ea6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
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

