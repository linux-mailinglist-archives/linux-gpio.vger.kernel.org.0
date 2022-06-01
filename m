Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 357C053A4A6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 14:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351888AbiFAMQB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 08:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351876AbiFAMP7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 08:15:59 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF915BD3D
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 05:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbWn9gYQVFBf7LjHElqyRjBwWKmk30a/UYmWgo5SwRUWfoCzeH+JK/NPQhw1TuZalnITtFKfiZFxAoCZD1+yGJ1XokjIu1Ae4FqX7NO1OLmwxIDVWHHo3anXgjavk2faJYIE99fspQ9hjfDUueo6rQfL9AsDykq7KFAX9/dUD+kiIO5PBofrfy7F0AEqoNA4Vv+pa0iWEsLuEOC0lhGUy15AjOSXDMBfeTqJ8CpKfA043J9qe1ZNRPUt7zTllysjUTFbJlpm2G+2saJLDAe6RpndH0Zciz/suvVAW1ZUX1UjJhXoSgwe4yhvWXYHtGn5Bp7kyEwxGchc9GivYPUjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UZSRjMz/fqv4OxplMGPzqoYxpWG18/s3eXvLho7xr8=;
 b=S39uOUldDdOnBpV8NiXPjjobVDPEoKwe01cLpybz9Ype6KzzwPMhu9TfDjG6ye6gotyZWc7A2u+kT5VNDCJUYLKuFUoTUYBEWHHYT9cpo6LINOCBWyTokO1dEH1jHJPJvewQ8S99SUdlwcO+iDKc3IUgg8CvbHFGlu6aSEcLlYqI+wsHm5LMQGS9vD6iFXCSbzk5kmy/WDEw/IFcyw7ymzFSHcogb21M5OqACpzkU6Tr1IkArCz6/Fv5A/9UqdBL3ljpJ9AR7Ydw089M+FJFFlkPGr07sAThS8zBg1CJmhbk2mPttr+EP1MNCxidUo5+qyOH9Qu/E0vJmquqwxVA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UZSRjMz/fqv4OxplMGPzqoYxpWG18/s3eXvLho7xr8=;
 b=oJfI4KzlOIjKM5ZC8jwRegatHJfJKYqFZfYAFr6aQFB4tf+VNBlMHW36YwerBbVkqg2I3F+1X/83oRVuQ4VC8HibsUFTIByHg2rJe3Ixcyqy6P56J0L6Sysik2e7+MvO775KqQ4XudE5pQC/yYYul5ivTecndUxHDoE/uNk92Tk=
Received: from MW3PR06CA0008.namprd06.prod.outlook.com (2603:10b6:303:2a::13)
 by DM6PR12MB5519.namprd12.prod.outlook.com (2603:10b6:5:1b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 12:15:56 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::43) by MW3PR06CA0008.outlook.office365.com
 (2603:10b6:303:2a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 12:15:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 12:15:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 07:15:30 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v5 1/6] pinctrl: Add pingroup and define PINCTRL_PINGROUP
Date:   Wed, 1 Jun 2022 17:44:33 +0530
Message-ID: <20220601121438.999369-2-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 80a3921e-5735-4b6e-061c-08da43c87ab7
X-MS-TrafficTypeDiagnostic: DM6PR12MB5519:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB551908ACC6F7CF12C342E656E6DF9@DM6PR12MB5519.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ijGfGhwi8I0zoBnrcc+C/1qYW7AvaA4S+7vTlNLgveJfEJR5pEZxynXhkdo2Iva1e85IKQMSZB3tAWfIoNYf51yUK76BQyyMzHr9X8jNWed7tcK/vTp4dua6ajCsxW2W8xcpXJ4q/iwlMuZ8XKCL5MTpYTWsKo+OImLjcY5j1HHf4dc57HHRZSL2PgFSQhr0n68rfMTz3af/dPmWJy88z/FNJ1sAkwE1G5q4JNA15kpvHs+6B6wc+YpcnPv9YvrzmD44ITOwW6/N5PxqT4nafNB41ETZ+fYu3zSst/VgMJPsR9GX+r9cE2LrGHz80mew3lH2HPochbqkpQwe5BvQ0WEq+nN7xvWmzlevmxqSTLHuw73noKFRgJ1Wi3SyldWy8nAf97eVjiO5Rvv3jXnQqU30GTs+lzG/C8VZHkrJI+WffNwMoS0gb5to4Z3/8VWcCzmKV6+RJ7n+oUbEtwHFM5N8gwvf3WvX8Nt0nLl8pNE2zFNZTgXOB5sh5crhGO1tcNeVocUdE9s1Spi1X7thIlItwsNPXkSc1Aqj65iVpexGjRMmAPQ8b/1hyc5hTPz3YJIqCmSOZAzDsHnePNVNxEj9wRTsakQf49nOWBulH5WU+vogvhfdqYxgmdq+/1GoZo9TYYOa30T8GSp38ZtCAdf/mGhta+VYVkIGXqqPY4IrqpSo52MfAvG4oYxv6pvmVSj7GDO0adLycy5LPu1Ap2k7w1Yobd6YgEQxjB9Wcz8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(186003)(2616005)(1076003)(40460700003)(26005)(16526019)(70206006)(8676002)(4326008)(70586007)(86362001)(110136005)(81166007)(508600001)(316002)(36756003)(5660300002)(82310400005)(36860700001)(356005)(2906002)(336012)(426003)(47076005)(8936002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 12:15:55.5806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a3921e-5735-4b6e-061c-08da43c87ab7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5519
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

