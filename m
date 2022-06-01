Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABE6753A1BF
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351605AbiFAKEq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351635AbiFAKDV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:03:21 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08on2085.outbound.protection.outlook.com [40.107.102.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3907AFD37
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GU1g4JR8XoMrBYSoqtBfDPudssrz/AND1LiXjefaZcOFY5dEVb5Q5x+lRtGby1z30bhtz5jBhroqwh/wr0Bb+gM7RCrGjxibvthRpvWnxb1NNTHTgnzBtzSpBfS9UcYSbCvr6Zvj8ZLuM4vmgeDJmmQDF6sqlFJlitm26A6REQOoF2ys6xYCNxUZ7J6Smx0KZ0+BTpbDKodoDww+Ger2dnbQdqPHS+zq/QTXWPIFK6XKlxtBb9kX9WmazR2l8V1FBSH11nWS/KAZKMwUZIig2wzlkZSeSwLS8eJd0wmRvBJHj5OpWRc6tjwrUacR9grd4NGtRD0GDPcZLQWRGVHhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6YFFLLxjAxOPok1RlVpLV6jtwHPA0Fw8HpZ8Oxclyw=;
 b=OH8UjkOmxp/TMPxVfnfUASguDMlMb6SMfpHm4+FAV5RM9tuX5TnlsTf0exq1InQsb0hwQjFEsfVTbiU1z+0ig66gjLZSm66c1t6efJu3annQ3bmwIo45BJtTacwCIcxNCNOEsB6AeDRIfXXaIsNnmVfIJ8Cxu+eoFA7XrrWuBA81CQrDObPG9B49RV+LIlMUQCHW7FBey29SRcFTuf9vj1K3C7iK5Le1cmFpz54o10znSrcOlGcmoeJ7880kEV945X0dJ3j9hKSz9KT7Po++76X20tdm/pGd61hSrW+/lNs54WbtLY7xovtIRM5M0lKqcEdCa4eMk5CuN9FgJLjc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6YFFLLxjAxOPok1RlVpLV6jtwHPA0Fw8HpZ8Oxclyw=;
 b=CCYO3f3DPxj2Du9noWeDhS5nxZviZe71bgbbSgk/8CAFOpmrEL9XbG8hPK+mQiD6NRXx2H5kzs23JOr9eE116U5EQYNfht+FTka+bmh4YA5ID7ofeqcrT3fBplGIb9gMjt0zCyisr4KdWohzSisTlorkrzqcd2nqAis7c0p9aKY=
Received: from CO2PR18CA0044.namprd18.prod.outlook.com (2603:10b6:104:2::12)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 10:03:00 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::a5) by CO2PR18CA0044.outlook.office365.com
 (2603:10b6:104:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Wed, 1 Jun 2022 10:02:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 10:02:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 05:02:57 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 1/6] pinctrl: Add pingroup and define PINCTRL_PINGROUP
Date:   Wed, 1 Jun 2022 15:32:09 +0530
Message-ID: <20220601100214.828595-2-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 479e6405-b081-473f-ee39-08da43b5e8b2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4176:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB417694DC454E2E6CE980C28AE6DF9@MN2PR12MB4176.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w7l09Eblz4CcWDCgwiBgFmbj/gjahxVy9cNAKFbzegxinqwy5pYVE3I15oeMG5wA3/AQ0HeZCF41BGeubXLMGt42vqyjlpH6KbngDOx8VVyOz8IKCIt8cXCcvlr90UYUDwrynOYRxO0DqNtYUsvpm6ymsjVyKud7nx7xt3lDcBv5M7jZy+xCnPeA23BJtH2ihvnrXOdAoFzgmFrsKwCF6TMlhT7dcEIthpYREOoIq7hVdXUusq3SVjkMqQ3pjZ5In2GJXFQHq/r+Rtzkf9zqV0GKt5a6WldACzxd+a8qr+Iej32LOWRZuIBGzeXH8K+0aJc2Q2jUZmk9JQJoI5lv+yRBeS/1Fu8AmC2+u5oAMRvsxY40W7TmaUHuw77fYDhcMO9OFkMUz4Lth7q2MPxAg0oCpwayhVZ/h/tLqJPolmm/YaOAqHIoaOpKtrsn4EnI4Uen1GLVMx9kpxQEpotGsI9IRvaE3gKk75yfx6xpgyuzQ3Do41q+19KuyfeuoqNRySy5DVoAnykkRww29vlDzuccLCyo/GIeQhra12mX0QW03WOIPNGq/X85otNLvF0DgjNa++wKBdlTffJtgV/pXbXSZXpeqDEC+tkEe07+tRe6oKdWcw5ICL66oIB2udn9SYf4qXE5VP8CqE36U+JVeyEzVkAUXW7WTN+q6IJaZzzUv7J8yTZ+Kws5VEqo77xFzIH92RCIFaB+hPQIQA4D3R7PvnGGaNjozcFAvPR+nz4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(16526019)(110136005)(82310400005)(36860700001)(1076003)(2616005)(70206006)(8676002)(70586007)(81166007)(36756003)(316002)(26005)(4326008)(186003)(6666004)(426003)(40460700003)(2906002)(47076005)(86362001)(336012)(7696005)(5660300002)(8936002)(356005)(508600001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 10:02:59.6809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 479e6405-b081-473f-ee39-08da43b5e8b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
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
---
 include/linux/pinctrl/pinctrl.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 70b45d28e7a9..4c00ab14d766 100644
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
+((struct pingroup){				\
+	.name = _name,				\
+	.pins = _pins,				\
+	.npins = _npins,			\
+})
+
 /**
  * struct pinctrl_pin_desc - boards/machines provide information on their
  * pins, pads or other muxable units in this struct
-- 
2.25.1

