Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 813F053A4A7
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 14:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351876AbiFAMQB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 08:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351829AbiFAMP7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 08:15:59 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39E75BE63
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 05:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1XXV18y1/MRklIEbBBL4urJnzXQ4hmSu3dn5naGQmqpmsg80GPxKemgjrM5Qg3I1jjqeLFIkAVbo47Q8/Otyo56OpOs89gmThNnQIuzcS+ns5RNr0fFHRgF9vT1fsq5XU1lwU/eWEOZApq6zcdbFHp76lHVqiGps+z6QZqzdsDpE/MlKc4AOIfW7G95dVAqwSGL+OySZOPYuC8Q0X8iRuPuhxrwucx/oA/IVGqcmgjZUfTLH50gShitsrc/jIBY2RKXbegFBq7cofghtnJmM77I7QiuBQe3H8WLZsooRP75DpXVhalWab+czwj6M3c6oLzmQbzlWJW8VLb7OyCEzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISodmpQfIpqbRihbFNx8jzOm6k72Cv/q+oYX2GpYn2Q=;
 b=By49WYYq4GXFVcOUelAMygsxvGfY9PFbanEgkqiusa4udhHjjw1jiwO2pdpqNdEsuXnzZlu2dVysveupu84oWv7UqAzXN+yodDHMBjskaQlD+OiPqA43dwKX7f41O7h38RdH01BxoygQOxo0p/hE6+uaUHO41Law7p1eoYNMR3UO+PNHpkn+UwZENefCn6p+tvmmBh9SAuyq+iMwRqs/QA4FU4CwAwl7yv810B2oaWifJtDhQoE0sIIFUjzuz8a8D8TgF+w1CTTo2M6bd211XK9s0Dm8+IiwiF/iix+z3VQPdXH7UBcMxH7p93AM7PfLwkgc1LQPqrrMZqHsXdkZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISodmpQfIpqbRihbFNx8jzOm6k72Cv/q+oYX2GpYn2Q=;
 b=Bu3/cHsy0SPJ/LZppsyvCAmZvFcg9AFRuCtsytbxo3lQZrXmEt6ffpgIEvSnc9Aw6zwcBTFhBMokxL//Sn6Evsfkj6BsdCKEhVx1IwYI9IhZSDEmCFmqsR4VT4pcbo4LrhtD7hQFCBKT7sgiYMHgpBFqwKhwkM9fq+iIbQRjWmk=
Received: from BN9P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::35)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 12:15:55 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::27) by BN9P221CA0018.outlook.office365.com
 (2603:10b6:408:10a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 1 Jun 2022 12:15:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 12:15:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 07:15:32 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v5 2/6] pinctrl: amd: Remove amd_pingroup and use pingroup
Date:   Wed, 1 Jun 2022 17:44:34 +0530
Message-ID: <20220601121438.999369-3-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 32a8cfbb-7b97-45ef-9989-08da43c87ab6
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB27826E8E49779A904E7A5883E6DF9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXbLMME3V+woYv91k11xgiNwINGEi2OMV8/zjw8NvDzgsMQfm07cIl7IdhSRoFoN3FFJpRXisFeUM/v4M1QEGA9q/jXbhWjQ5hu7aUThXib8Um/TpjSWnI3TlAlsnw5dkMZXN31kqaJUcyMoQbbAhiDbuv6Uhe0rIT8G6cKkFUSwEhlI5UarmUl+e6vWgfMIOeXUmvluIVRNrKDBlmzNAQT33DUqqr8d1RhmM6+BC8Tz+GoN+bae0g1PifcGIp7PBWRa29EHcJhpKubR5GGpj115eFt0ixAV198GAhL7U5Th38dd2Dj04dZZNcczsOGriZjixn3KiO9LauXUsNxm9/7+2j7DT/Rz2D+fM1X8xthUKey8n8utVro3LUsAOpyneneQzy5/wuHBRQCP3/WD3HkQD/N3wcoGGneHhwJ2Igo9DL42jw5fxzsvFNokySktNgTioIXv00Hm1YYrXZDJHTrVDDOTr6Dpzqm9LNEIkcOT3Tz+p3+vPIwWqNFMU1XojIWZ5uHsy6sk+DXmc8O+jdhepDGxxdsby4R2S/g+WlDdHgrGF4QN8fgm7w2O64Q8QA5XNl7T89+kGcbxtC8ySxiJ1RGSCNHXC8QrKlxtY47IOhhzx+rmGLpi+FSmWoQmPhkxnhKoYepScc2q7I2sQBmwVRxTKDy0KdmvCGhEmAMJgCM2kupxck5WkSUj2/20Op0qQPI6a98pbz36dpXN0UvPFPP+a4n5fL4c83s60Kg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(40460700003)(16526019)(186003)(336012)(81166007)(70206006)(5660300002)(1076003)(4326008)(8936002)(426003)(36756003)(83380400001)(70586007)(7696005)(8676002)(2616005)(2906002)(110136005)(26005)(82310400005)(316002)(508600001)(47076005)(36860700001)(356005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 12:15:55.7028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a8cfbb-7b97-45ef-9989-08da43c87ab6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
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

