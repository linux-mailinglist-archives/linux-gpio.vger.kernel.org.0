Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE9253AA15
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 17:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243035AbiFAP3h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 11:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344631AbiFAP3g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 11:29:36 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2CB2ED5D
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 08:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwcboE5cqRKldyKkqPkZiAIqhChU63erdS8wEx+QlV0E/HDD6k/FHojmHY1Qk1ELkOFJ3TNy0C1oLqZVb18YM8j8DfGJrdLOCVID68b9YXV5qdwz+An58byUXJop9lA8vLFd2l5CPDjWeCyc3T6bcb92ix+RNbAqud7K+VvUWiYqvaUk7mC3kKK+dL1/M72TDYejJavrsK38s1oDnZexBtMaciToGv1dQ9YIuDCcAULJVzI5fSnrYMpYoDFufTI+6h5gfgQXpJlNejqzpIb46x7aUpFLx/OERVR2HONX1BCDfy0BjqxjfXv8XzM0eKSYgBZdmXy5mykonFl2iqt0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33k7kwoqE+c1GqmNZx36fZJvmHDVPss0TGn/w17z29Q=;
 b=hbk4EPDx7iX5wjsx2tNGIdx6UWb/1obsUHov0HC1ImPW3Q2lsbQBBtudYy28sSSM2W0ROzI0H14KX5VPEWvlF3Ayzi62UOpQlXOSy6/9WmzsMy8gBjAIy0Ln1ks9TBZFR+Q2t9bquaaSO5PqcC9JF6QRfhuSB5i8UnAJIdaOWPCVG8xg+Ek+T9tkSU6P67VxX6fGmnfm8Ad3mdtSlIxm1hGgLBUHPyJtGxoqE0l5+zG86qjFclv8eVd6/D//XBqI1IJ3fWttgGWNmN2l/fHW13tADCQzVepbyRw5kFyNowJC6MASyZMhVKN2lMcIUMGL1usxKyMstX/uWvVXZ8eyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33k7kwoqE+c1GqmNZx36fZJvmHDVPss0TGn/w17z29Q=;
 b=ktlp10jvoyUD42OUyNWc4R4hpX9NHst2B4WuIhcWeXL4NxD3S85QBed/MfkJwfcJwwmC8k0SL1kLBhk9ErTdQypNrpSaJtn84jLXYptpLPZM0E79ztR1sZB38whrS9TV4cufNLEisZmIPWWrWbW6NclAvRzNDuMFgRgqcQm7ZEc=
Received: from MW4PR04CA0066.namprd04.prod.outlook.com (2603:10b6:303:6b::11)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 15:29:33 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::c0) by MW4PR04CA0066.outlook.office365.com
 (2603:10b6:303:6b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 15:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 15:29:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 10:29:30 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v6 1/6] pinctrl: Add pingroup and define PINCTRL_PINGROUP
Date:   Wed, 1 Jun 2022 20:58:55 +0530
Message-ID: <20220601152900.1012813-2-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: f49b2fa3-6b1f-4d30-15d9-08da43e3870e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4469:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB446954EF5A17143BF7FA13B4E6DF9@MN2PR12MB4469.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ht3Fwpm8UmEv5tZ+kSHKlqTvrV5zz5IW+zJApt5Ys/C/4Op4+2PF+A5pQTfzh45SVmPzh2dhrwd2kmk8p4ShdJvijG/8MjbjTNpT4k63bvVeuFqSJsImQAbgf4NgvmNj94vO1NmrMjAcKIi5oHO+9C5n9P/NcTa6K1iX1Q8nCLDQFW9KGIHQwYNnVqiw6gUqoikB7+LMmjE17w3XYRz4ItmVD6s3a570lK97pfnmiP4+tvH1PsnWj0BpAdYCyc/r/k9+tQ6/kRcUAEEU9vVkfiG4kEcpQ98Q/wk/XDO9tMLNKcW1cZvrO6WeEji7F/DEqkX+fljaOsO3HEO4VmHO+QiYv0GwGyUB2orStwbEjlecwkeTCm9Xo5oOcAyB7lFh8qnG/r4G4eYgiZG213amByYSFjxHLkBXOIFEGYmg/qnt8EUyN8W1E/s2zV54JJI8LigW9RQPRwoY6rxrj8+r0WQkiOQZNrhAc/yyRuXtTjzUq7gC97NT7+CDLYTU85534bj5k52JUaLFiedfHP2LaQXHIHkE+Rzfj7MQwkF3rlhaVwaReIGBrZuHGswJekqjwAC8/B4e9JpaoIZL36kf8GhKe4my6JI3WJQ4hAEDbCKUZTKWkylGNVZYxMdw3NVqy6f15BgFnYwiM3eiR3kaiUeIAVSetED2I6fxo/KTLBBkSZs150YGWr4G9ugxbHok5Mu7irzYo+XgUgmprVHOlY8TAo36rHb7Tab5RM+4j98=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(82310400005)(508600001)(26005)(8936002)(356005)(36756003)(81166007)(40460700003)(86362001)(6666004)(5660300002)(7696005)(1076003)(2616005)(336012)(426003)(47076005)(186003)(36860700001)(16526019)(316002)(8676002)(110136005)(2906002)(4326008)(70206006)(70586007)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 15:29:32.6956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f49b2fa3-6b1f-4d30-15d9-08da43e3870e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add 'struct pingroup' to represent pingroup and 'PINCTRL_PINGROUP'
macro for inline use. Both are used to manage and represent
larger number of pingroups.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pinctrl/pinctrl.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 70b45d28e7a9..487117ccb1bc 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -26,6 +26,26 @@ struct pin_config_item;
 struct gpio_chip;
 struct device_node;
 
+/**
+ * struct pingroup - provides information on pingroup
+ * @name: a name for pingroup
+ * @pins: an array of pins in the pingroup
+ * @npins: number of pins in the pingroup
+ */
+struct pingroup {
+	const char *name;
+	const unsigned int *pins;
+	size_t npins;
+};
+
+/* Convenience macro to define a single named or anonymous pingroup */
+#define PINCTRL_PINGROUP(_name, _pins, _npins)	\
+(struct pingroup){				\
+	.name = _name,				\
+	.pins = _pins,				\
+	.npins = _npins,			\
+}
+
 /**
  * struct pinctrl_pin_desc - boards/machines provide information on their
  * pins, pads or other muxable units in this struct
-- 
2.25.1

