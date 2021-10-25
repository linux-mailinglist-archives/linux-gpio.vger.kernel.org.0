Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6189E439482
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 13:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbhJYLMb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 07:12:31 -0400
Received: from mail-mw2nam10on2044.outbound.protection.outlook.com ([40.107.94.44]:9185
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230232AbhJYLMb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Oct 2021 07:12:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qh99nV+2MRV4Iep9WDM4hbNIVgBPzfmWJIEpz9xKDlTddx4fMZFoWH5pl9r9bORIb9wV1SV2jf7FlVEXHq02L03WPmTuSDrzS04lUWOwmBszrUqIqdXmHfYxbsyarXUmqYpU06NNf7a51ihAb/EPWSronYtRWQfMla3c+rNEf89zeEKYE7AcqDkB0wpP4Nqh6ln4/BP8qMbfEMLYJASzBFLaQRKG2ioJoK6O6t2Bj9MvakwEfa+C4XD1E5QkzKxIEKYtYXzipdSw55H/GGd6imzFCL43zm6gJRy4qXgjwlrrNsJUV4dkDQFPEUVgfawCV+cG2rGQMvuzElcUjMb+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wbMqnvEuftumSowFp0/lqXyFQ70G1jQiR0UZBVe2Hw=;
 b=S2zoOov45VKRbu+pMKwZmdpZ6DUP7f3Zso8Y85OEOaDf/f0Pbu8eRnc1TwREmAImsfiHFASytMqzTAphGuIDS0p6XNw+wMSZ3v3PiTKxOWjvJE3CPEgNEIwSR1LAMEx7aAT/H1/4fGcdKqhArMPh0WMWC+lFQGsWE7kNUQNixmH9QVdDxlTDGixV8o08vh6sjFyTgOTVLJvoNJldQD4b7ktrEOTt1X7wyY1LNyXzQSivvcByzYeObzLyBzrPiaMXgvWmLviKcK+YntNI7YGZTvHMSq2TeLyK5rk2XWJymrbbYONrQ4pITWvZqobXbgJE7dONw9AxzjeLjyXb/NpgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wbMqnvEuftumSowFp0/lqXyFQ70G1jQiR0UZBVe2Hw=;
 b=YWY3G8T2JNxLHcT1vxv8UZ5NhfcKI6J6hPdYchek//SmbHv6Oxs1b+IfPBfVnFDCUnBBpQAvVlZu4Kn0wNzk3diz31Hs72sOulgrLfh0h7HvXDkCDqj+Osg5wUWCeHtclnZBMZts5fc8B5BfmlPEdBwjM0iXnMszn1JIGaD+CtnLOtPoHbfgo4GABumdY1HZeYSX4QZbOTPqKiQJ8ZGcS1HbE2wpx3hLmYQC6mQFrRD3WJ6YEjytHr+Hoi1TnK8IfgfLt2nHiF1qpW0x+l/ah9AARduwiOSvFVPWOfJazoaMDYq8fI73rFz6u7Ept/na2HMgpY9J2bBtcAnjUkrWwQ==
Received: from MW4PR04CA0124.namprd04.prod.outlook.com (2603:10b6:303:84::9)
 by DM6PR12MB2682.namprd12.prod.outlook.com (2603:10b6:5:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 11:10:07 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::89) by MW4PR04CA0124.outlook.office365.com
 (2603:10b6:303:84::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 11:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 11:10:07 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 25 Oct
 2021 04:10:06 -0700
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 25 Oct 2021 04:10:03 -0700
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>, <kkartik@nvidia.com>
Subject: [PATCH] pinctrl: tegra: Use correct offset for pin group
Date:   Mon, 25 Oct 2021 16:39:59 +0530
Message-ID: <20211025110959.27751-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c21dd8dc-38fb-445f-d1ce-08d997a800ab
X-MS-TrafficTypeDiagnostic: DM6PR12MB2682:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2682C06A920376A77078E8C0B7839@DM6PR12MB2682.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I4V6Q0SNlOHDijUjE2PFdohqbk3FuHwzv5uzoRXjaiAFwDu2WauZS0BYT7dB9lUI2sV8ajrT6dx/nrio6Eq2Y2JV2Lx6CbXT3BOjhfM4xYy2kUjUVTlGefP6IiGXPPG7kGv0YmL9WhUuVjPiLvA0ajcCzwG2fE+UMrI+C2nz4vSoafoRoZLnhDGLa8yoHagLLryIaNjn9nNy2j6hsGRri2t+2mRoOEA2PBQibi3J2ZWBt49MKHHoLWcK+K2pjdvRJVwtrbO0Fw2b0OKRSUMwzWJseRzpmIhx3t7l88ZV739aFl4VCUmtdZHHtxAoC/Rh76sBU5CU0tpLgDNYLWxQg5RdpMbCVNidsmE5dK/dEea+hL81Dq+Y7EdnKG3cTKXbOExQTBEkWmQHnQ/d6GLrQzC3RNvWnTP8PGdagKEQpOJ4SeMqzIT/GWOJOzRTBTZFaOiLu1t2botqI44tQTkasDUaxjq2lvn0vgwkvp/Z+U4tzpjV0VVZcCQlsat7j74yuVOJ/vV+xfeeXGfOGZuNEq7CyWjuMpKbo+chEr01XFW+uTc03Dp8C4uv32FhCZl1/fCpXo9BpObptykczYMFwCznEVV/5y3Nx6ELMr0OuiQ6f1jclVUxe/LE2h4fF2W3JJIU1pDisSH8sT1oixq7bscgPR0k3biwsdL0NneTf7pDegQmNj1GuIRBUH9nPtIc1Lr8MxqI5YSaeeO8s77dxg==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(7636003)(86362001)(47076005)(4326008)(186003)(316002)(336012)(70206006)(83380400001)(356005)(8676002)(2906002)(82310400003)(26005)(426003)(1076003)(54906003)(8936002)(2616005)(110136005)(5660300002)(6666004)(36860700001)(508600001)(70586007)(36756003)(107886003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 11:10:07.0126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c21dd8dc-38fb-445f-d1ce-08d997a800ab
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2682
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Function tegra_pinctrl_gpio_request_enable() and
tegra_pinctrl_gpio_disable_free() uses pin offset instead
of group offset, causing the driver to use wrong offset
to enable gpio.

Add a helper function tegra_pinctrl_get_group() to parse the
pin group and determine correct offset.

Signed-off-by: Kartik K <kkartik@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 33 +++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 195cfe557511..0471d9c7f0ba 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -275,6 +275,29 @@ static int tegra_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *pctldev,
+					unsigned int offset)
+{
+	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
+	struct tegra_pingroup *g;
+	unsigned int group, num_pins, j;
+	const unsigned int *pins;
+	int ret;
+
+	for (group = 0; group < pmx->soc->ngroups; ++group) {
+		ret = tegra_pinctrl_get_group_pins(pctldev, group, &pins, &num_pins);
+		if (ret < 0)
+			continue;
+		for (j = 0; j < num_pins; j++) {
+			if (offset == pins[j])
+				return &pmx->soc->groups[group];
+		}
+	}
+
+	dev_err(pctldev->dev, "Pingroup not found for pin %u\n", offset);
+	return NULL;
+}
+
 static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
 					     struct pinctrl_gpio_range *range,
 					     unsigned int offset)
@@ -286,7 +309,10 @@ static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
 	if (!pmx->soc->sfsel_in_mux)
 		return 0;
 
-	group = &pmx->soc->groups[offset];
+	group = tegra_pinctrl_get_group(pctldev, offset);
+
+	if (!group)
+		return -EINVAL;
 
 	if (group->mux_reg < 0 || group->sfsel_bit < 0)
 		return -EINVAL;
@@ -309,7 +335,10 @@ static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pctldev,
 	if (!pmx->soc->sfsel_in_mux)
 		return;
 
-	group = &pmx->soc->groups[offset];
+	group = tegra_pinctrl_get_group(pctldev, offset);
+
+	if (!group)
+		return -EINVAL;
 
 	if (group->mux_reg < 0 || group->sfsel_bit < 0)
 		return;
-- 
2.17.1

