Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F6C43B27A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 14:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235983AbhJZMeV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 08:34:21 -0400
Received: from mail-mw2nam10on2049.outbound.protection.outlook.com ([40.107.94.49]:14587
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231592AbhJZMeU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 08:34:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD/rY+7JkuPog/4No3LQFMjbAtoarE6BDcEcldiBwtLYVObRgUz2U0mmgrcY4NrwA0A/BwaSEs5SohGDJ441Nss9vj3bWYKB45Id8gOXfMX9CgYSFWNlO+pnJGt9PW3jlyP26qnWPX++UAWtw7klVMgIof93BbzrgyXd1eTvgXyIf7ACIYMMpD1n2qLk9QTBdDpRzUMtyTHSq0rNwSNadYe7t8aFyfUG14gG0QsA+9kWAnnWFXl18VSAjmey1ZcF4Io/TN0UovDHHXFClKP0ZlrTc9CxKUL//5BRtCnAqTfvuYifoHVhUZ6t1rDNgKWk+ow0msIUkZnP3QoiBH+gYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/+XZsaRLFwGVdL5THultExVWXE6FYuRefSgqd7vEQE=;
 b=S6LqNDpXieBdWH4IXorRJMCekvcYEcrEMFZFlzllYSSTQXiPckw6EnUer101qXhSzcSOc1RW6GyqB+xoAW4k0B19vl3kf4jp8EMLIbG961/ehSR9Ztsr6JiqL11C9aaJuMLelrfeM3AGMtqhU3m+QPaqFP0GygruaDpbUhNwye7Ffhsulwmqq3DR3H9okfQ0lxlpYH04/1IF3R03IG2Z7CAi2tGTdfuDZOXedZsKjMmfKMHWiCuX1+PZ5wVOCLwYqS953a0ZbUa85PYnWxEXdr/ZvzkdHaUYjUdIfDnn+ZbGzbkx5CfJwlNoZIhwuj+T3RK3nJVVUGZmFx4gbBn4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/+XZsaRLFwGVdL5THultExVWXE6FYuRefSgqd7vEQE=;
 b=ispZ1/I1acnmq8X3kFTjd6Ux86MXzVj0QxA7irHlH6hd2UGgixmEd1xQXfinU/JGCtFdpxo2YXMCoSu67RnFpqHNCRh7VeOXE001AsmpcFDO7uQRRXswJFe1zFo6kT4bsaL4qefj0QMohaaF94nNmZESbNXJGNGUr95SX0YJqSQADJPon3EuKqdX0m04lVc7jgjA9hsMcY+yNwVsOFamzYxU5yIXfv2N1eqQ/KleJTby8qkPmf1w3ddiOM1+4rY0wvg/lPgjukNBxMaCnlnEJRrqjB9gahW9JygSgKHObE9WVjjcglITa+kgnPaBgo5NUz5aB/UpKYxnMA20u2GEYQ==
Received: from BN9PR03CA0682.namprd03.prod.outlook.com (2603:10b6:408:10e::27)
 by CY4PR12MB1800.namprd12.prod.outlook.com (2603:10b6:903:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 12:31:55 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::e) by BN9PR03CA0682.outlook.office365.com
 (2603:10b6:408:10e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 12:31:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 12:31:55 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 26 Oct
 2021 05:31:54 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 26 Oct
 2021 12:31:54 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 26 Oct 2021 12:31:52 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>, <kkartik@nvidia.com>
Subject: [PATCH] pinctrl: tegra: Fix warnings and error
Date:   Tue, 26 Oct 2021 18:01:48 +0530
Message-ID: <20211026123148.14500-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10039344-6c5f-4901-cf98-08d9987c9894
X-MS-TrafficTypeDiagnostic: CY4PR12MB1800:
X-Microsoft-Antispam-PRVS: <CY4PR12MB18001A562E78756355DF4266B7849@CY4PR12MB1800.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CbhKbayV3JVkJhV/o8rCFLf3EyjU3rUs/41x10HjAq2Xwe359n7VBxGQbcQbtd43sehMoUulbXilviK9tpU/lOpK6spKpkqbc1YrrFPsMTe9huQqZUw2Byn9PBKaydiJrSOOIYPgGQ9BOoWgO3vNbwRHmylHiQgONKXuoJXGdYg4zV64aDD5JHTPvQQqe11tD5+k0CVGlAkUQMByeS3LMnnvvFzTZ/Wo1WYJ9sxjMcK2/wrWdxzDKoBfOYMbn/lWOX1Xnk5Kff44Q4whzDoZ5CwJx1gNCeDUenSbsvX3vzCPEffxCOEwQx70eCmSrPBi91Jf9v9BPGKEPddfE9qOiD6RR5w2gzkwYESRCCp36z9bfgrZbzwrVtRwVn0vx+W47xPF+xt0oxaobLzYbU8tr4uvrP1ndMNl9olb8iDWvYBCtVWjtZjOka5DGh9jLd9MZR9oOdrxPO1P3uRIx1gwWoB0DCdP8W/Rnx1lPH+mpXTRitkCstgqo/L7H2SkeZGL2JaSXaJrVsxbIrlWEHccjjGOETX+LLkrvqRR7gaHGiZ6tKxlbbtpNELekq+xYesffdYzdlfMC6ZHikoOEwB7scGCAvToxu/KsBlMHXNkK4iPntT0pbBIh+B/Ha9OjYH4BWkSD7uQLAZ8TyzTjL3ADylwMZdte7V9HTIEZymSIa1f5BN7ByJmkLtRDxbZ5CFKC2xhppVHRHiOAARjT+cPMA==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(110136005)(107886003)(186003)(70586007)(4326008)(7696005)(86362001)(426003)(2616005)(508600001)(47076005)(82310400003)(70206006)(1076003)(36756003)(7636003)(26005)(6666004)(8936002)(54906003)(83380400001)(336012)(356005)(316002)(36860700001)(8676002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 12:31:55.0972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10039344-6c5f-4901-cf98-08d9987c9894
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1800
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix warnings are errors caused by commit a42c7d95d29e
("pinctrl: tegra: Use correct offset for pin group").

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 0471d9c7f0ba..8d734bfc33d2 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -279,7 +279,6 @@ static struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *pctlde
 					unsigned int offset)
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
-	struct tegra_pingroup *g;
 	unsigned int group, num_pins, j;
 	const unsigned int *pins;
 	int ret;
@@ -290,7 +289,7 @@ static struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *pctlde
 			continue;
 		for (j = 0; j < num_pins; j++) {
 			if (offset == pins[j])
-				return &pmx->soc->groups[group];
+				return (struct tegra_pingroup *)&pmx->soc->groups[group];
 		}
 	}
 
@@ -338,7 +337,7 @@ static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pctldev,
 	group = tegra_pinctrl_get_group(pctldev, offset);
 
 	if (!group)
-		return -EINVAL;
+		return;
 
 	if (group->mux_reg < 0 || group->sfsel_bit < 0)
 		return;
-- 
2.17.1

