Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E27745AC6D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240227AbhKWTc6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:32:58 -0500
Received: from mail-dm6nam08on2053.outbound.protection.outlook.com ([40.107.102.53]:40672
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238928AbhKWTcd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvRz43Gd4BRx6R8K0tnoGfzIsjmXXWZ4gnojegV9lEoN6vppPY9XVGG/dx/FRR3UwaO2/AxHY8PxqGlwwm6DoBKPPIW/CIIa8hi6/epxiCgPft1wLB9N2rMzNO8G5Fp0ghnlme2bO2LYRuh9+syzIaq7rYRa640bY5GOjE6pVkUnceSvskapBxj2VhO4RjmoEMVUz03QgRCjaLZ/sHTb/PuEAV6oO1ZlTXUpGfoEO+UYW8LxL/rvrkc1Vhs+7xhxgEXXlYhksGhZti5hwxm4515APJaL8ezXo0SHQN0AriX6NLGGhhocJEREKU21/wSU4YwLVTZ1Rb7OKD9+lYl/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvcjfOGoiFr7xCa8eJtl7MfccJvtc4BN3Wg2ThjqzLE=;
 b=UJU36pgPKQhvONIuXMj+rT8K0S3PLUz5ITQ+xs2kUQe1tBDT5c2OOFh3YaAKlNvpL9nFCffXulFlS1Gd3V3mY7mDyFVe2umweXgUaQ9CgQHQ33/K+SsxxzCi/cYuQrH3epTeq16VAssR7SD3+5y5fGUb5Lf0ANRUsSxa9VCcqvp1M1LPOC9p8xQ/ylQB9oxdcrM1Wmahx3BaTFuSbySdocZiQ9qx649pxH0A732WSmVkMG8khOSGAE9hYhwSfGL5+R5fs8PeNi9iVkyPowqttIKotnL91ta64axzs7QKV8BdMFtYEJeTsQbUJQOH+NilCG8CIfvzgGDAeQn921NURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvcjfOGoiFr7xCa8eJtl7MfccJvtc4BN3Wg2ThjqzLE=;
 b=jbiLaVHEmCAQclw5S7fanMw2HLkFAs+AfbK+rZu+IqHf8ki5iEYzxnNs9CCeRLe+HxbaGCnbIAdhUZhQYfqIngcNXgnNZOPDdhJqSjFdi/19BLhWGYd7znbhCSauaVUiJUxBcdt3Nq5uuNFuAyy0sMBkJcyx9cDyqg1XvmnB9ZYmSGs1WD5B+68R6p8VcaMzUZXWpMYjgqHV8XyqH7dABRNIDb+1RelYHNrFpwrYF/vwBD3XGmFThfTliRSwt2C72NKl5nIQ2cw9Rcdo4RNm2B3V6AnOsJEhr3QnU/bU+b8m1Tn3J02PD6SyBP1ZKIeKGvsiLPzyIrBk2G0lrKIW+Q==
Received: from CO1PR15CA0090.namprd15.prod.outlook.com (2603:10b6:101:20::34)
 by CH0PR12MB5155.namprd12.prod.outlook.com (2603:10b6:610:ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Tue, 23 Nov
 2021 19:29:23 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::bc) by CO1PR15CA0090.outlook.office365.com
 (2603:10b6:101:20::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:22 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:21 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:21 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 10/12] tools: gpio: Add new hardware clock type
Date:   Tue, 23 Nov 2021 11:30:37 -0800
Message-ID: <20211123193039.25154-11-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71e6bbe5-87f5-44af-f861-08d9aeb78d84
X-MS-TrafficTypeDiagnostic: CH0PR12MB5155:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5155D3870141A214E0DDE873AE609@CH0PR12MB5155.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h554u40jhPODeU66dQSYu6H7+cAlmUQBfVoO5tKVLIml7Zrr/NLqgI7zZdTer/Yp+vvJE6xq7WtvE7aOle/S37CRo0X3+vv7Lo/nbp+XkAh3wlmudqft9bOtEbWqKDm4JkyC3fFAFdWUQErlsQJCO5t4a1iogDEaLocGGYeqS6Zi3KFR4qOP3miUjmjD04XpLnCaXSzCDjsKyLBHBgxgrDnQSIw958KiIeYVaRvpUIUfXEuSHcqZ2mNXTC6gXvvJzj4FzAyiOVVasFA5Zv99+nHEvFOg6OV2jw0j63vd4nYMRdd0L1eCzua2ixTE/BmXmZZ/WWTnee/1CiYHQBpQQ1vAqqD0tHa+LXTikwP0pmtczg2UaHILirH2mSNCKTdjUETpdrYwN255djpkSm5H1G/H9ukgfQ7IFLgsP8Zqk6tF54K3KE8HK6V7bDxt1T049gGYoC/wtlkPIa8i08HenSTMMobbSjBItyUkso3yIRhbYJuJRGXKXEIA4Y6zE4jJ/ZTyeVDVBbCKAo6c4pgH8s5xg+/tswt6ZeMMGxafJqyASV0MKYcoxKZIZRQUI6Pgnw1fBaGFlZ17gCJCNCQTb9TcFzca/mE13blUBKtUvfcKw/kM5X4HlI/lWhflquWMfzDsQ9UaqgNABVCkJzqFcT5jcreM7u9Dt0ifGXrveZn6qHOPTp6+PIhCG9DsRiYEi2GzPdJRbfH3G+VIeycdg+CNVkBBrNb9lv23NdFbXl6I4Nmf19PXfRCSjPtpC43gpbk3GqCVtyZvbp7UQSpbuQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(86362001)(82310400004)(7416002)(36756003)(426003)(110136005)(336012)(508600001)(107886003)(70586007)(83380400001)(5660300002)(4326008)(70206006)(2906002)(36860700001)(356005)(2616005)(316002)(6666004)(186003)(7696005)(7636003)(26005)(47076005)(1076003)(921005)(8676002)(8936002)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:22.5166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e6bbe5-87f5-44af-f861-08d9aeb78d84
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5155
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiolib-cdev is extended to support hardware clock type, this
patch reflects that fact.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 tools/gpio/gpio-event-mon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index a2b233fdb572..bed52333698d 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -149,6 +149,7 @@ void print_usage(void)
 		"  -r         Listen for rising edges\n"
 		"  -f         Listen for falling edges\n"
 		"  -w         Report the wall-clock time for events\n"
+		"  -t         Report the hardware timestamp for events\n"
 		"  -b <n>     Debounce the line with period n microseconds\n"
 		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
 		"  -?         This helptext\n"
@@ -174,7 +175,7 @@ int main(int argc, char **argv)
 
 	memset(&config, 0, sizeof(config));
 	config.flags = GPIO_V2_LINE_FLAG_INPUT;
-	while ((c = getopt(argc, argv, "c:n:o:b:dsrfw?")) != -1) {
+	while ((c = getopt(argc, argv, "c:n:o:b:dsrfwt?")) != -1) {
 		switch (c) {
 		case 'c':
 			loops = strtoul(optarg, NULL, 10);
@@ -208,6 +209,9 @@ int main(int argc, char **argv)
 		case 'w':
 			config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
 			break;
+		case 't':
+			config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
+			break;
 		case '?':
 			print_usage();
 			return -1;
-- 
2.17.1

