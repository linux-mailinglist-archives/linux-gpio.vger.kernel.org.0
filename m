Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2180538D14
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 10:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240926AbiEaInw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 04:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238352AbiEaInw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 04:43:52 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F7A6004E
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 01:43:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYMrUclpBQ24XqTl5h7TlEO7wHFPSplVjh2THZAPpwU1mttG0WG5Cj/CzA+FIDA1mZgGpUX7JvUxZVsQsLDSpzqAtaMbhpHhCCbjUkITOC5Q0gxLOincjutV9zUbAfmst1mIPIK2WA5ryUyKeKlCUSYDGdaebrE2sUOhe9QQJUGe/5uTLIY0tKTHf+82ZP15mV/onN/waMH9f4+fZzhbn35bokQAthFkX/k2H4Kuneww68KqWoy+3zlvxTJl7Lol8xYn22ama2pDkzJQIig2cZHwIaCYpfgINkMotfOKZyOglAC4mttgxwaW+CBdaSur7mqEjjQDwNcm6vL9D8ljAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciO4Spc0ofNx6zLEKBxlB3tXo7LUdlCTup49e5BLbaY=;
 b=PrVejiy1CiRJAH3CqaP3Cup9peIjGtjibnO21UcaEfD2MR8YTK9KV0ZgVOKbuGXQN6bXPvfqs2MkCeDN1H3AtMftm/Bze7BEA4BNEMR2mVAB3bKG3dPl7Uc5UUQyvZu3pi/91we78nvPVqKWAVmUJVMgfX6QZAZUOc3/UNsY7Nwcr1mxEaugvrroDBftYz0KpZFWyweoko8AzNniuAJmObd2pwQb6T5rdsEMrbC/xVeXMwZO5VNDf2pFEV1E3bFY5wU6Ib6Y0670HqaSf295p14IBd5PaJ1s1aewTlzhjCETJPFoeRP1f4evAluLaD9yjnkdXFJK8BUP8tmEPNVelQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciO4Spc0ofNx6zLEKBxlB3tXo7LUdlCTup49e5BLbaY=;
 b=YVdK1PduQOgQRsd5dqpr7SPAu+W5QTgA/BOZblwm78tmo9rpVqasqOjifzuifL4Lbof5IGyCNJ/YlDqu/7o9Sdccyn0SZPtQTqkxuPJHV2T5yYlGhYP0JluulpUB3+kbGQbVoGFrAzyxG5V1piU5s7x9WSkK0cOH9/VSwN1N78o=
Received: from DM5PR06CA0073.namprd06.prod.outlook.com (2603:10b6:3:4::11) by
 DM6PR12MB2649.namprd12.prod.outlook.com (2603:10b6:5:49::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Tue, 31 May 2022 08:43:49 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::ff) by DM5PR06CA0073.outlook.office365.com
 (2603:10b6:3:4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 08:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 08:43:49 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 03:43:43 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 1/6] pinctrl: Add pingroup and define PINCTRL_GRP
Date:   Tue, 31 May 2022 14:13:17 +0530
Message-ID: <20220531084322.1310250-2-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: deec5ecb-3255-41c6-d545-08da42e1aecc
X-MS-TrafficTypeDiagnostic: DM6PR12MB2649:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB26492044614EF9AEF4FB6B24E6DC9@DM6PR12MB2649.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LqAhfBbFXENWbBOrnoijfars0QIHw7nSIGmFDjLpCQ7waRgFwcj7RY+RxG+03tYb09XoMgfdeTUzakGBFspsGZfT7ewVHbxOePpUhn2fTXwPNfis6h8iPXeke15jwZv8XK30gjOi99fVKvtYqYBOAwyg3Q1MEyC7ek/i1+Y9A6RmB6tzsRi3LQfomg4I7w5zqro+V0vWKSgWFEEkQ69nI3+iIeb0b/CTyhYiET/mvxBXhpeCibLPVk45Pj7fC1lUmGhcReA7CFlEg6vvNYrIr2gd6oE21HwUHafFlnnu5Rn+pINZHX3IlIGuDMl10cpQ+AZRA+tl6NU/KYoBQytZ4xGUhl2OkzxikVAjBRAt753Zx0rvhEoi6r4EhY25TmcnhHBjnbh2Jqu0P0DsULAaZBAkJe4S6wkBLKu/ONB7oaLEMazlvkZLpQ6Weuzys0fiZQyozREKAUN5qtaBapPFCrMu9MnFguJQVMvIJDmuDjwPRfYvBaC352HhTx70DY9Gst8/PbiqzG4gQDkz+A06R8H5qK4mI6Cz82PtEeLtPXf1IetHPj0KiqT8axROrw6EYSdWLzgRA/7buMqUVO2LTmfbynfKPaoK4BzsaOPfxiCbHZqpNyCRBKMIRbXdR3MHufH/xApciC02aX8hVtqQx2NEqnAkNAJaB++mMBHGauz3KnLhTpxtfT/whmq/Eq+aGnqrfs0ZJ21raWtf3JX6GyfzOqra+DjLtDzGs932HW4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(47076005)(426003)(336012)(86362001)(7696005)(16526019)(186003)(40460700003)(1076003)(36756003)(82310400005)(356005)(81166007)(110136005)(6666004)(2906002)(2616005)(8936002)(26005)(36860700001)(316002)(8676002)(70206006)(4326008)(70586007)(5660300002)(508600001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:43:49.2987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deec5ecb-3255-41c6-d545-08da42e1aecc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2649
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add 'struct pingroup' to represent pingroup and 'PINCTRL_GRP' macro for
inline use. Both are used to manage and represent larger number
of pingroups.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 include/linux/pinctrl/pinctrl.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 70b45d28e7a9..1bdffac6e7aa 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -26,6 +26,26 @@ struct pin_config_item;
 struct gpio_chip;
 struct device_node;
 
+/**
+ * struct pingroups - provides information on pingroup
+ * @name: a name for pingroup
+ * @pins: an array of pins in the pingroup
+ * @npins: number of pins in the pingroup
+ */
+struct pingroup {
+	const char *name;
+	const unsigned int *pins;
+	unsigned int npins;
+};
+
+/* Convenience macro to define a single named or anonymous pingroup */
+#define PINCTRL_GRP(_name, _pins, _npins)	\
+((struct pingroup) {				\
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

