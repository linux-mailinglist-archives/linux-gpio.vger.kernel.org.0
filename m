Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8AEB3B4B46
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhFYXus (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:50:48 -0400
Received: from mail-dm6nam11on2056.outbound.protection.outlook.com ([40.107.223.56]:18816
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230041AbhFYXuj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 19:50:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfYP0bfLU9TerwkPwXqA+9rSSYjracjKTGxu4p+EznEqHMkZ1srMvF1VlpoGUIJCVKs4Skww0tOiyYxd232V8KnP4H/RwIqkxlRvCaqxw5jOiQsDuKBP58Zz49ImsXADjbQ56W48NFc9+Cb9aPslltV4kmNkFPw5MuJnt0Bd43mLoDt8Bsl97OpRYdAz+/UKR/u72HCFiiPl+RV9ZHrbCvgJfymd0/nS09Wjr0Uz15+Mw6ASHNXlj/EKVfaVGc3nJ5AroCU+v+tdZpzwFd/ezbNuoe0iokxqtKHhQJw2LNKF13juo/CB5vZ+4Pjkpy0Tf+jFE2RRtlKOBtWRDRFdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+QUMly0wgQmi3zZsX6Jm0toUKr6OBDIik4TO+aYfsE=;
 b=k+Jhgt3SGbFOyIp4HeeF0RAVo2FgIgdllJ3/sMOlrNVC4Mld69+vqEX171tZjyEMXzOoEDuz8qH0bnlmEDCgfOTgOKVKQyueOU2sheBh2OP+3TmNglL+vkom2QNLpHa8/N4XmAPwKxYsNwf6JSqNiTHjUC3JerjfbKjDl5mm9vC7k0co048r8lmNO9Ulm9FJKoRu8ik1Wp0ZSDTaaJW3T6X3UhERDD7rqh7cmy1lv4yabYS8Cl1SQoF1FqeO1EvCosvtSQqMamgIJ/w+Ebbie8RWTqBy2YSJjq0dvZZHJA5/5YOgaFxVWp8WYr4n0ic1WaB5or1+ptoH49ugy4bvtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+QUMly0wgQmi3zZsX6Jm0toUKr6OBDIik4TO+aYfsE=;
 b=l6mjSqfyIlUiFZ/0e8TczjErMW2ODEzs+Datvk/xXCdQN8GQFZejSkAnz9vAAQbV4p4JG7Xq8jpHy4VdMgMWVWIkn+7iNhVKkEPoZL59gxyWiHOLoXZfYie9lemNDS4oPiRvBEEFqRV+uCDqCtwQDwRd+8gsvaXsr/dFAmWAFtBdw52DfLnc2TDCqASWl+z3Av9qraFpXlQmrKBQ7kR7gPL+U1sULA79tQExrk4AYa1b7bAZgZ8bZwq1PEnyT2wkl2IxwaPpO90+wlJentrkyl9DICi8eOLx6tAnvHesK++nvHaZcJZYEuGD25BwADoQJkYM+EjmiHP3h/tONeAxsg==
Received: from DM6PR04CA0006.namprd04.prod.outlook.com (2603:10b6:5:334::11)
 by MW3PR12MB4443.namprd12.prod.outlook.com (2603:10b6:303:2d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 23:48:16 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::54) by DM6PR04CA0006.outlook.office365.com
 (2603:10b6:5:334::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:48:16 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 23:48:14 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:14 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <dipenp@nvidia.com>, <robh+dt@kernel.org>
Subject: [RFC 09/11] tools: gpio: Add new hardware clock type
Date:   Fri, 25 Jun 2021 16:55:30 -0700
Message-ID: <20210625235532.19575-10-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625235532.19575-1-dipenp@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aa0bc96-909f-47ce-c818-08d93833b3dc
X-MS-TrafficTypeDiagnostic: MW3PR12MB4443:
X-Microsoft-Antispam-PRVS: <MW3PR12MB444336DD96FBF6FBA9706E99AE069@MW3PR12MB4443.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMw7dEdVtBg5I6vBLAncRBJr2Mbs4IwUOpNYl4zJBMxjb7k65vyWQHa4Fol59gTJMvjPigttJPNITSkR4Sp69fLZmjtr4UcnU2a7kiW7S3VPdmdukqYvRKHvfxVijhtYyeHWVCxRLR1KFZ4pEZVGUaZSznO5CFLvYN2cEWnwo1k/42e+baO7SP+Y2VIa+HEZsVXJwLFHn+QIp8RnDqE+ackOtF11htpJSYnGXgsuFdD6svsjssR5E5L2n8d8VyeTQwTrCYV13vAOVrkgb1qY9KepkJ43+KxWko6Iyo2D2/2hiADN5B50Mb8vUId33UkjLYG76AtpvcIAG2az+T4LlNwBJrdbR5sd14o+/CDj0shqukrZPZaIT9B7ej3mhi1LLo7zLfHBsBe5A6K8QwO2UbxVV2aB0SlXmZGjZl0LE37jA5LWEOlhy9fbjc/hy6/7leIQaPOq+e4rdlsQjjijUIJ0sUydHz9uH6+EpR+7r505/+nDF9YyB5DPBMYWsj3NWngdT1FkZa9x3v++nEBUVcKTBDRLCspafivv3DxxYGOhq/lNP/IGQOaDBiB6CbrZRUj7xlcKQ5cMQKG635unwuhssS7F22YrxdossxUH0ALgW2dDTAAMYQH8sp3EfsY4Vhml4t0fJKnRx+dCzSic1CAlDWShPWkBs+svCbDPRpHHW8/pEzdj8fbadhYxzE/ljNuLGqKpQS/OjUciMk1EEB7/82FkIa9NHgF28BawtXb+kSrsss2mcZDZqngFC1RbqGBCrArRugRuAF+JNJ3pIg==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(36840700001)(46966006)(83380400001)(356005)(2906002)(8936002)(70206006)(478600001)(70586007)(82740400003)(2616005)(426003)(336012)(36756003)(7416002)(110136005)(7636003)(86362001)(316002)(5660300002)(26005)(6666004)(1076003)(921005)(36860700001)(8676002)(82310400003)(186003)(7696005)(47076005)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:48:16.0554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa0bc96-909f-47ce-c818-08d93833b3dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4443
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiolib-cdev is extended to support hardware clock type, this
patch reflects that fact.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
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

