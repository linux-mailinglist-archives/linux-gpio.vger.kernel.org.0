Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5404318D4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 14:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbhJRMUk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 08:20:40 -0400
Received: from mail-mw2nam12on2054.outbound.protection.outlook.com ([40.107.244.54]:46177
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231686AbhJRMUh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Oct 2021 08:20:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZ08EE2y8Pe07HKmo+K+TZ5QGgz681qJ6j8sd04D4u937vqqiHUWdLN5Ydgki+kyRB0NTJpsBMNg10fF5ULxL4eUVaDh09HY/aDHbOfSOCUW2W1TJA7LovUh8FXdMUKPO8avVT9I/nFppV9a6cnLoPb/m5riadbNzr0nc0W6CW+CVka1QsAqOHpP4Mdg19i9mf4uT9fzPu9WYc/h25NQuEkc5qofmdKzWpy8Ayt2F6MN+YgPbkx72kMYvPdj8s28jbnu7z41qmB4/4MA8HiTw3RZTjDX3gBb58/v/PZgDeBFDFYvVgGjCus7zw4+VYHzx9vTvC5sdrWelWLvIYCnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgxRlqniepxSEslY2wchm7e024j5TBu98xwpBYn8IHI=;
 b=RgdOsNYLTzXx3LtvqNo2Wx/Ar+rZxOUhlZqnhoMPVei2s63ln1jNetThnlC+rg2iOykL6SA90p7APk4AN4U+lNftvv65CeTGqUi7jVGT9ygNRNmZS8RCMgt8zilx0qgY0g8RKFReYGT0JSfrE/ptc0EwT8+YmbA4Q2HKPEzqUBVLIDHSLGudu9GDMqJlQW1yj/PD2fY5Pkk4JiqbdfxRBi1aBvjKSXtqbq//GVDFiWi9gu+DEuw9l3q7KN6ZlpPtjbwVKzu7rWNR7bhuiwVv88Lt9ZPUfls/r40arkSTPWB1eaIYerxKea9Nkhsfui9gRnGx1gNeX5VzLHbAlJ/1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgxRlqniepxSEslY2wchm7e024j5TBu98xwpBYn8IHI=;
 b=DX+0wDodO7f9GlEAU65Q0rXHGxL1Fitm2BluIUWhg5J808Yjd3UzyhNiYP0psYVMLC6DRvz/PVd3h8fl5W31CobaRFWVtcKkr/1nbggNiGe1gqB/x9Qj2Cq2EBMXVcmpExALdjBVPS0sYb6jmE8A8LQZeuS5keDM3U5kgQbmCr5ZVR+gifQqNkj4VuBEr6qcRc3XuFoElU1enn1jvjThEuuJ/UTicVkg6R80cnzEDTd0HxQSV+TPFaWa2e7Fd2f6lcXEOAjr0c43RD1t4FgtqUJ3Vjz09K7VTOETCPrhsJSbCQ8NgtIBkHpx4cJA/GsXBcPiQCkYRhaNS+s82yjJkQ==
Received: from DM6PR02CA0086.namprd02.prod.outlook.com (2603:10b6:5:1f4::27)
 by CH0PR12MB5281.namprd12.prod.outlook.com (2603:10b6:610:d4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 12:18:23 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::44) by DM6PR02CA0086.outlook.office365.com
 (2603:10b6:5:1f4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 12:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 12:18:20 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 18 Oct
 2021 12:18:20 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 18 Oct 2021 12:18:17 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH 1/2] pinctrl: tegra: include lpdr pin properties
Date:   Mon, 18 Oct 2021 17:48:14 +0530
Message-ID: <20211018121815.3017-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c80faf68-bf47-45d9-a10c-08d992315fcb
X-MS-TrafficTypeDiagnostic: CH0PR12MB5281:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5281BC8722E258CAE31D7910B7BC9@CH0PR12MB5281.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73CrmVqYj81a/PF8xmrJyXChBUjHsx/eQ25Y6UfDHefErErkjYSkdPnWEe4fhe+Qvmz3GXf/HHG8KWomy7Op/vShO6Kn0j9DxOg+5GU4wSJ/e9Lt73TognLdxRqPLwQClIkNGAAgvrySlxps5lHFyLVycgPT/4RLEP70cJW5sN3ev4PKHSpd+ukat3QfVjL0cuNf0fet9yj6nlnttPXWxy77zP/7CRhQIsUvQBoWDhT8T63480g15qE/f4r5L2ekXeJDUTMf+BnobdE5OeDj6FqClVT4U3u5Q7/2IQLuJKngiJST5Wj29e3zNOKZsW8GZIl8qgEXITkZBTPtNAg5Gp5+HU424RaJXsLb/mXpsMzelf/vbHR8vZN3dCW/t+/knWZfOO29xfzbphN7NCcvzOVLccVajQEBYkp2rG4j+0vCoj5Kj/0ATNrtB98Wp3Cyix9fiVoYTnRbgZTfqwoIzzX7IhfQ3LylCnMlB+D3qo3lrNrRtMARrTBhAYC7b0GZqWPVu6QOq4xa8OeAZtCYVdJxtvYhu1KCBc4k3k48GxCOuiWNp15GTYJAyLJgvM7Xc7vS1dXEjlwyF4pvPiXP9M3L6d50OxUM+p39RVPQxBR2dDrpIqbQkLygvP5YqegOWyWZwnUupLHI92C1XujdhR1YKdw9P4vuf3NR1q8dsn68ocpzOTW6Vi/s1qar50WfGUq3c0/vzgqq6MnOOzJ5AA==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:cy;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(107886003)(7696005)(54906003)(30864003)(426003)(7636003)(336012)(70586007)(5660300002)(2906002)(36860700001)(26005)(508600001)(4326008)(8676002)(1076003)(2616005)(186003)(110136005)(8936002)(70206006)(36756003)(6666004)(86362001)(316002)(83380400001)(47076005)(82310400003)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 12:18:20.6879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c80faf68-bf47-45d9-a10c-08d992315fcb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5281
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Suresh Mangipudi <smangipudi@nvidia.com>

Update lpdr pin-property for supported pins.

lpdr property help disable most basic driver fingers
leaving only minimal base driver finger.

Signed-off-by: Suresh Mangipudi <smangipudi@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.h    |   2 +
 drivers/pinctrl/tegra/pinctrl-tegra210.c | 330 ++++++++++++-----------
 2 files changed, 168 insertions(+), 164 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index fcad7f74c5a2..f8269858eb78 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -118,6 +118,7 @@ struct tegra_function {
  * @slwr_width:		Slew Rising field width.
  * @slwf_bit:		Slew Falling register bit.
  * @slwf_width:		Slew Falling field width.
+ * @lpdr_bit:		Base driver enabling bit.
  * @drvtype_bit:	Drive type register bit.
  * @parked_bitmask:	Parked register mask. 0 if unsupported.
  *
@@ -161,6 +162,7 @@ struct tegra_pingroup {
 	s32 drvup_bit:6;
 	s32 slwr_bit:6;
 	s32 slwf_bit:6;
+	s32 lpdr_bit:6;
 	s32 drvtype_bit:6;
 	s32 drvdn_width:6;
 	s32 drvup_width:6;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index fc072a36deb3..b480f607fa16 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1276,7 +1276,7 @@ static struct tegra_function tegra210_functions[] = {
 #define PINGROUP_BIT_N(b)		(-1)
 
 #define PINGROUP(pg_name, f0, f1, f2, f3, r, hsm, drvtype, e_io_hv,	\
-		 rdrv, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b,	\
+		 lpdr, rdrv, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b,\
 		 slwr_w, slwf_b, slwf_w)				\
 	{								\
 		.name = #pg_name,					\
@@ -1317,6 +1317,7 @@ static struct tegra_function tegra210_functions[] = {
 		.slwf_bit = slwf_b,					\
 		.slwf_width = slwf_w,					\
 		.parked_bitmask = BIT(5),				\
+		.lpdr_bit = PINGROUP_BIT_##lpdr(8),			\
 	}
 
 #define DRV_PINGROUP(pg_name, r, prk_mask, drvdn_b, drvdn_w, drvup_b,	\
@@ -1337,6 +1338,7 @@ static struct tegra_function tegra210_functions[] = {
 		.drv_bank = 0,						\
 		.hsm_bit = -1,						\
 		.schmitt_bit = -1,					\
+		.lpdr_bit = -1,						\
 		.lpmd_bit = -1,						\
 		.drvdn_bit = drvdn_b,					\
 		.drvdn_width = drvdn_w,					\
@@ -1351,169 +1353,169 @@ static struct tegra_function tegra210_functions[] = {
 	}
 
 static const struct tegra_pingroup tegra210_groups[] = {
-	/*       pg_name,              f0,         f1,     f2,    f3,    r,      hsm, drvtype, e_io_hv, rdrv,  drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w */
-	PINGROUP(sdmmc1_clk_pm0,       SDMMC1,     RSVD1,  RSVD2, RSVD3, 0x3000, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc1_cmd_pm1,       SDMMC1,     SPI3,   RSVD2, RSVD3, 0x3004, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc1_dat3_pm2,      SDMMC1,     SPI3,   RSVD2, RSVD3, 0x3008, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc1_dat2_pm3,      SDMMC1,     SPI3,   RSVD2, RSVD3, 0x300c, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc1_dat1_pm4,      SDMMC1,     SPI3,   RSVD2, RSVD3, 0x3010, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc1_dat0_pm5,      SDMMC1,     RSVD1,  RSVD2, RSVD3, 0x3014, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc3_clk_pp0,       SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x301c, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc3_cmd_pp1,       SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x3020, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc3_dat0_pp5,      SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x3024, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc3_dat1_pp4,      SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x3028, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc3_dat2_pp3,      SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x302c, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(sdmmc3_dat3_pp2,      SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x3030, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pex_l0_rst_n_pa0,     PE0,        RSVD1,  RSVD2, RSVD3, 0x3038, N,   N,       Y,       0xa5c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(pex_l0_clkreq_n_pa1,  PE0,        RSVD1,  RSVD2, RSVD3, 0x303c, N,   N,       Y,       0xa58, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(pex_wake_n_pa2,       PE,         RSVD1,  RSVD2, RSVD3, 0x3040, N,   N,       Y,       0xa68, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(pex_l1_rst_n_pa3,     PE1,        RSVD1,  RSVD2, RSVD3, 0x3044, N,   N,       Y,       0xa64, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(pex_l1_clkreq_n_pa4,  PE1,        RSVD1,  RSVD2, RSVD3, 0x3048, N,   N,       Y,       0xa60, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(sata_led_active_pa5,  SATA,       RSVD1,  RSVD2, RSVD3, 0x304c, N,   N,       N,       0xa94, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(spi1_mosi_pc0,        SPI1,       RSVD1,  RSVD2, RSVD3, 0x3050, Y,   Y,       N,       0xae0, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi1_miso_pc1,        SPI1,       RSVD1,  RSVD2, RSVD3, 0x3054, Y,   Y,       N,       0xadc, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi1_sck_pc2,         SPI1,       RSVD1,  RSVD2, RSVD3, 0x3058, Y,   Y,       N,       0xae4, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi1_cs0_pc3,         SPI1,       RSVD1,  RSVD2, RSVD3, 0x305c, Y,   Y,       N,       0xad4, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi1_cs1_pc4,         SPI1,       RSVD1,  RSVD2, RSVD3, 0x3060, Y,   Y,       N,       0xad8, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi2_mosi_pb4,        SPI2,       DTV,    RSVD2, RSVD3, 0x3064, Y,   Y,       N,       0xaf4, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi2_miso_pb5,        SPI2,       DTV,    RSVD2, RSVD3, 0x3068, Y,   Y,       N,       0xaf0, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi2_sck_pb6,         SPI2,       DTV,    RSVD2, RSVD3, 0x306c, Y,   Y,       N,       0xaf8, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi2_cs0_pb7,         SPI2,       DTV,    RSVD2, RSVD3, 0x3070, Y,   Y,       N,       0xae8, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi2_cs1_pdd0,        SPI2,       RSVD1,  RSVD2, RSVD3, 0x3074, Y,   Y,       N,       0xaec, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi4_mosi_pc7,        SPI4,       RSVD1,  RSVD2, RSVD3, 0x3078, Y,   Y,       N,       0xb04, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi4_miso_pd0,        SPI4,       RSVD1,  RSVD2, RSVD3, 0x307c, Y,   Y,       N,       0xb00, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi4_sck_pc5,         SPI4,       RSVD1,  RSVD2, RSVD3, 0x3080, Y,   Y,       N,       0xb08, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(spi4_cs0_pc6,         SPI4,       RSVD1,  RSVD2, RSVD3, 0x3084, Y,   Y,       N,       0xafc, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(qspi_sck_pee0,        QSPI,       RSVD1,  RSVD2, RSVD3, 0x3088, Y,   Y,       N,       0xa90, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(qspi_cs_n_pee1,       QSPI,       RSVD1,  RSVD2, RSVD3, 0x308c, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(qspi_io0_pee2,        QSPI,       RSVD1,  RSVD2, RSVD3, 0x3090, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(qspi_io1_pee3,        QSPI,       RSVD1,  RSVD2, RSVD3, 0x3094, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(qspi_io2_pee4,        QSPI,       RSVD1,  RSVD2, RSVD3, 0x3098, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(qspi_io3_pee5,        QSPI,       RSVD1,  RSVD2, RSVD3, 0x309c, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(dmic1_clk_pe0,        DMIC1,      I2S3,   RSVD2, RSVD3, 0x30a4, N,   N,       N,       0x984, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dmic1_dat_pe1,        DMIC1,      I2S3,   RSVD2, RSVD3, 0x30a8, N,   N,       N,       0x988, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dmic2_clk_pe2,        DMIC2,      I2S3,   RSVD2, RSVD3, 0x30ac, N,   N,       N,       0x98c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dmic2_dat_pe3,        DMIC2,      I2S3,   RSVD2, RSVD3, 0x30b0, N,   N,       N,       0x990, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dmic3_clk_pe4,        DMIC3,      I2S5A,  RSVD2, RSVD3, 0x30b4, N,   N,       N,       0x994, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dmic3_dat_pe5,        DMIC3,      I2S5A,  RSVD2, RSVD3, 0x30b8, N,   N,       N,       0x998, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(gen1_i2c_scl_pj1,     I2C1,       RSVD1,  RSVD2, RSVD3, 0x30bc, N,   N,       Y,       0x9a8, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(gen1_i2c_sda_pj0,     I2C1,       RSVD1,  RSVD2, RSVD3, 0x30c0, N,   N,       Y,       0x9ac, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(gen2_i2c_scl_pj2,     I2C2,       RSVD1,  RSVD2, RSVD3, 0x30c4, N,   N,       Y,       0x9b0, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(gen2_i2c_sda_pj3,     I2C2,       RSVD1,  RSVD2, RSVD3, 0x30c8, N,   N,       Y,       0x9b4, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(gen3_i2c_scl_pf0,     I2C3,       RSVD1,  RSVD2, RSVD3, 0x30cc, N,   N,       Y,       0x9b8, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(gen3_i2c_sda_pf1,     I2C3,       RSVD1,  RSVD2, RSVD3, 0x30d0, N,   N,       Y,       0x9bc, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cam_i2c_scl_ps2,      I2C3,       I2CVI,  RSVD2, RSVD3, 0x30d4, N,   N,       Y,       0x934, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cam_i2c_sda_ps3,      I2C3,       I2CVI,  RSVD2, RSVD3, 0x30d8, N,   N,       Y,       0x938, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(pwr_i2c_scl_py3,      I2CPMU,     RSVD1,  RSVD2, RSVD3, 0x30dc, N,   N,       Y,       0xa6c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(pwr_i2c_sda_py4,      I2CPMU,     RSVD1,  RSVD2, RSVD3, 0x30e0, N,   N,       Y,       0xa70, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart1_tx_pu0,         UARTA,      RSVD1,  RSVD2, RSVD3, 0x30e4, N,   N,       N,       0xb28, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart1_rx_pu1,         UARTA,      RSVD1,  RSVD2, RSVD3, 0x30e8, N,   N,       N,       0xb24, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart1_rts_pu2,        UARTA,      RSVD1,  RSVD2, RSVD3, 0x30ec, N,   N,       N,       0xb20, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart1_cts_pu3,        UARTA,      RSVD1,  RSVD2, RSVD3, 0x30f0, N,   N,       N,       0xb1c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart2_tx_pg0,         UARTB,      I2S4A,  SPDIF, UART,  0x30f4, N,   N,       N,       0xb38, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart2_rx_pg1,         UARTB,      I2S4A,  SPDIF, UART,  0x30f8, N,   N,       N,       0xb34, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart2_rts_pg2,        UARTB,      I2S4A,  RSVD2, UART,  0x30fc, N,   N,       N,       0xb30, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart2_cts_pg3,        UARTB,      I2S4A,  RSVD2, UART,  0x3100, N,   N,       N,       0xb2c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart3_tx_pd1,         UARTC,      SPI4,   RSVD2, RSVD3, 0x3104, N,   N,       N,       0xb48, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart3_rx_pd2,         UARTC,      SPI4,   RSVD2, RSVD3, 0x3108, N,   N,       N,       0xb44, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart3_rts_pd3,        UARTC,      SPI4,   RSVD2, RSVD3, 0x310c, N,   N,       N,       0xb40, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart3_cts_pd4,        UARTC,      SPI4,   RSVD2, RSVD3, 0x3110, N,   N,       N,       0xb3c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart4_tx_pi4,         UARTD,      UART,   RSVD2, RSVD3, 0x3114, N,   N,       N,       0xb58, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart4_rx_pi5,         UARTD,      UART,   RSVD2, RSVD3, 0x3118, N,   N,       N,       0xb54, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart4_rts_pi6,        UARTD,      UART,   RSVD2, RSVD3, 0x311c, N,   N,       N,       0xb50, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(uart4_cts_pi7,        UARTD,      UART,   RSVD2, RSVD3, 0x3120, N,   N,       N,       0xb4c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dap1_fs_pb0,          I2S1,       RSVD1,  RSVD2, RSVD3, 0x3124, Y,   Y,       N,       0x95c, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(dap1_din_pb1,         I2S1,       RSVD1,  RSVD2, RSVD3, 0x3128, Y,   Y,       N,       0x954, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(dap1_dout_pb2,        I2S1,       RSVD1,  RSVD2, RSVD3, 0x312c, Y,   Y,       N,       0x958, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(dap1_sclk_pb3,        I2S1,       RSVD1,  RSVD2, RSVD3, 0x3130, Y,   Y,       N,       0x960, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(dap2_fs_paa0,         I2S2,       RSVD1,  RSVD2, RSVD3, 0x3134, Y,   Y,       N,       0x96c, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(dap2_din_paa2,        I2S2,       RSVD1,  RSVD2, RSVD3, 0x3138, Y,   Y,       N,       0x964, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(dap2_dout_paa3,       I2S2,       RSVD1,  RSVD2, RSVD3, 0x313c, Y,   Y,       N,       0x968, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(dap2_sclk_paa1,       I2S2,       RSVD1,  RSVD2, RSVD3, 0x3140, Y,   Y,       N,       0x970, -1,      -1,      -1,      -1,      28,     2,      30,     2),
-	PINGROUP(dap4_fs_pj4,          I2S4B,      RSVD1,  RSVD2, RSVD3, 0x3144, N,   N,       N,       0x97c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dap4_din_pj5,         I2S4B,      RSVD1,  RSVD2, RSVD3, 0x3148, N,   N,       N,       0x974, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dap4_dout_pj6,        I2S4B,      RSVD1,  RSVD2, RSVD3, 0x314c, N,   N,       N,       0x978, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dap4_sclk_pj7,        I2S4B,      RSVD1,  RSVD2, RSVD3, 0x3150, N,   N,       N,       0x980, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cam1_mclk_ps0,        EXTPERIPH3, RSVD1,  RSVD2, RSVD3, 0x3154, N,   N,       N,       0x918, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cam2_mclk_ps1,        EXTPERIPH3, RSVD1,  RSVD2, RSVD3, 0x3158, N,   N,       N,       0x924, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(jtag_rtck,            JTAG,       RSVD1,  RSVD2, RSVD3, 0x315c, N,   N,       N,       0xa2c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(clk_32k_in,           CLK,        RSVD1,  RSVD2, RSVD3, 0x3160, N,   N,       N,       0x940, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(clk_32k_out_py5,      SOC,        BLINK,  RSVD2, RSVD3, 0x3164, N,   N,       N,       0x944, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(batt_bcl,             BCL,        RSVD1,  RSVD2, RSVD3, 0x3168, N,   N,       Y,       0x8f8, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(clk_req,              SYS,        RSVD1,  RSVD2, RSVD3, 0x316c, N,   N,       N,       0x948, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cpu_pwr_req,          CPU,        RSVD1,  RSVD2, RSVD3, 0x3170, N,   N,       N,       0x950, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(pwr_int_n,            PMI,        RSVD1,  RSVD2, RSVD3, 0x3174, N,   N,       N,       0xa74, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(shutdown,             SHUTDOWN,   RSVD1,  RSVD2, RSVD3, 0x3178, N,   N,       N,       0xac8, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(core_pwr_req,         CORE,       RSVD1,  RSVD2, RSVD3, 0x317c, N,   N,       N,       0x94c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(aud_mclk_pbb0,        AUD,        RSVD1,  RSVD2, RSVD3, 0x3180, N,   N,       N,       0x8f4, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dvfs_pwm_pbb1,        RSVD0,      CLDVFS, SPI3,  RSVD3, 0x3184, N,   N,       N,       0x9a4, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dvfs_clk_pbb2,        RSVD0,      CLDVFS, SPI3,  RSVD3, 0x3188, N,   N,       N,       0x9a0, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(gpio_x1_aud_pbb3,     RSVD0,      RSVD1,  SPI3,  RSVD3, 0x318c, N,   N,       N,       0xa14, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(gpio_x3_aud_pbb4,     RSVD0,      RSVD1,  SPI3,  RSVD3, 0x3190, N,   N,       N,       0xa18, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(pcc7,                 RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3194, N,   N,       Y,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(hdmi_cec_pcc0,        CEC,        RSVD1,  RSVD2, RSVD3, 0x3198, N,   N,       Y,       0xa24, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(hdmi_int_dp_hpd_pcc1, DP,         RSVD1,  RSVD2, RSVD3, 0x319c, N,   N,       Y,       0xa28, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(spdif_out_pcc2,       SPDIF,      RSVD1,  RSVD2, RSVD3, 0x31a0, N,   N,       N,       0xad0, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(spdif_in_pcc3,        SPDIF,      RSVD1,  RSVD2, RSVD3, 0x31a4, N,   N,       N,       0xacc, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(usb_vbus_en0_pcc4,    USB,        RSVD1,  RSVD2, RSVD3, 0x31a8, N,   N,       Y,       0xb5c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(usb_vbus_en1_pcc5,    USB,        RSVD1,  RSVD2, RSVD3, 0x31ac, N,   N,       Y,       0xb60, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(dp_hpd0_pcc6,         DP,         RSVD1,  RSVD2, RSVD3, 0x31b0, N,   N,       N,       0x99c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(wifi_en_ph0,          RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31b4, N,   N,       N,       0xb64, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(wifi_rst_ph1,         RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31b8, N,   N,       N,       0xb68, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(wifi_wake_ap_ph2,     RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31bc, N,   N,       N,       0xb6c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(ap_wake_bt_ph3,       RSVD0,      UARTB,  SPDIF, RSVD3, 0x31c0, N,   N,       N,       0x8ec, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(bt_rst_ph4,           RSVD0,      UARTB,  SPDIF, RSVD3, 0x31c4, N,   N,       N,       0x8fc, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(bt_wake_ap_ph5,       RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31c8, N,   N,       N,       0x900, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(ap_wake_nfc_ph7,      RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31cc, N,   N,       N,       0x8f0, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(nfc_en_pi0,           RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31d0, N,   N,       N,       0xa50, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(nfc_int_pi1,          RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31d4, N,   N,       N,       0xa54, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(gps_en_pi2,           RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31d8, N,   N,       N,       0xa1c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(gps_rst_pi3,          RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31dc, N,   N,       N,       0xa20, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cam_rst_ps4,          VGP1,       RSVD1,  RSVD2, RSVD3, 0x31e0, N,   N,       N,       0x93c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cam_af_en_ps5,        VIMCLK,     VGP2,   RSVD2, RSVD3, 0x31e4, N,   N,       N,       0x92c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cam_flash_en_ps6,     VIMCLK,     VGP3,   RSVD2, RSVD3, 0x31e8, N,   N,       N,       0x930, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cam1_pwdn_ps7,        VGP4,       RSVD1,  RSVD2, RSVD3, 0x31ec, N,   N,       N,       0x91c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cam2_pwdn_pt0,        VGP5,       RSVD1,  RSVD2, RSVD3, 0x31f0, N,   N,       N,       0x928, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(cam1_strobe_pt1,      VGP6,       RSVD1,  RSVD2, RSVD3, 0x31f4, N,   N,       N,       0x920, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(lcd_te_py2,           DISPLAYA,   RSVD1,  RSVD2, RSVD3, 0x31f8, N,   N,       N,       0xa44, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(lcd_bl_pwm_pv0,       DISPLAYA,   PWM0,   SOR0,  RSVD3, 0x31fc, N,   N,       N,       0xa34, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(lcd_bl_en_pv1,        RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3200, N,   N,       N,       0xa30, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(lcd_rst_pv2,          RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3204, N,   N,       N,       0xa40, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(lcd_gpio1_pv3,        DISPLAYB,   RSVD1,  RSVD2, RSVD3, 0x3208, N,   N,       N,       0xa38, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(lcd_gpio2_pv4,        DISPLAYB,   PWM1,   RSVD2, SOR1,  0x320c, N,   N,       N,       0xa3c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(ap_ready_pv5,         RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3210, N,   N,       N,       0x8e8, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(touch_rst_pv6,        RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3214, N,   N,       N,       0xb18, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(touch_clk_pv7,        TOUCH,      RSVD1,  RSVD2, RSVD3, 0x3218, N,   N,       N,       0xb10, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(modem_wake_ap_px0,    RSVD0,      RSVD1,  RSVD2, RSVD3, 0x321c, N,   N,       N,       0xa48, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(touch_int_px1,        RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3220, N,   N,       N,       0xb14, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(motion_int_px2,       RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3224, N,   N,       N,       0xa4c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(als_prox_int_px3,     RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3228, N,   N,       N,       0x8e4, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(temp_alert_px4,       RSVD0,      RSVD1,  RSVD2, RSVD3, 0x322c, N,   N,       N,       0xb0c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(button_power_on_px5,  RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3230, N,   N,       N,       0x908, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(button_vol_up_px6,    RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3234, N,   N,       N,       0x914, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(button_vol_down_px7,  RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3238, N,   N,       N,       0x910, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(button_slide_sw_py0,  RSVD0,      RSVD1,  RSVD2, RSVD3, 0x323c, N,   N,       N,       0x90c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(button_home_py1,      RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3240, N,   N,       N,       0x904, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
-	PINGROUP(pa6,                  SATA,       RSVD1,  RSVD2, RSVD3, 0x3244, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pe6,                  RSVD0,      I2S5A,  PWM2,  RSVD3, 0x3248, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pe7,                  RSVD0,      I2S5A,  PWM3,  RSVD3, 0x324c, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(ph6,                  RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3250, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pk0,                  IQC0,       I2S5B,  RSVD2, RSVD3, 0x3254, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pk1,                  IQC0,       I2S5B,  RSVD2, RSVD3, 0x3258, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pk2,                  IQC0,       I2S5B,  RSVD2, RSVD3, 0x325c, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pk3,                  IQC0,       I2S5B,  RSVD2, RSVD3, 0x3260, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pk4,                  IQC1,       RSVD1,  RSVD2, RSVD3, 0x3264, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pk5,                  IQC1,       RSVD1,  RSVD2, RSVD3, 0x3268, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pk6,                  IQC1,       RSVD1,  RSVD2, RSVD3, 0x326c, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pk7,                  IQC1,       RSVD1,  RSVD2, RSVD3, 0x3270, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pl0,                  RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3274, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pl1,                  SOC,        RSVD1,  RSVD2, RSVD3, 0x3278, Y,   Y,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pz0,                  VIMCLK2,    RSVD1,  RSVD2, RSVD3, 0x327c, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pz1,                  VIMCLK2,    SDMMC1, RSVD2, RSVD3, 0x3280, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pz2,                  SDMMC3,     CCLA,   RSVD2, RSVD3, 0x3284, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pz3,                  SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x3288, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pz4,                  SDMMC1,     RSVD1,  RSVD2, RSVD3, 0x328c, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
-	PINGROUP(pz5,                  SOC,        RSVD1,  RSVD2, RSVD3, 0x3290, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	/*       pg_name,              f0,         f1,     f2,    f3,    r,      hsm, drvtype, e_io_hv, lpdr, rdrv,  drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w */
+	PINGROUP(sdmmc1_clk_pm0,       SDMMC1,     RSVD1,  RSVD2, RSVD3, 0x3000, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc1_cmd_pm1,       SDMMC1,     SPI3,   RSVD2, RSVD3, 0x3004, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc1_dat3_pm2,      SDMMC1,     SPI3,   RSVD2, RSVD3, 0x3008, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc1_dat2_pm3,      SDMMC1,     SPI3,   RSVD2, RSVD3, 0x300c, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc1_dat1_pm4,      SDMMC1,     SPI3,   RSVD2, RSVD3, 0x3010, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc1_dat0_pm5,      SDMMC1,     RSVD1,  RSVD2, RSVD3, 0x3014, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc3_clk_pp0,       SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x301c, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc3_cmd_pp1,       SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x3020, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc3_dat0_pp5,      SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x3024, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc3_dat1_pp4,      SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x3028, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc3_dat2_pp3,      SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x302c, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(sdmmc3_dat3_pp2,      SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x3030, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pex_l0_rst_n_pa0,     PE0,        RSVD1,  RSVD2, RSVD3, 0x3038, N,   N,       Y,       Y,	0xa5c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(pex_l0_clkreq_n_pa1,  PE0,        RSVD1,  RSVD2, RSVD3, 0x303c, N,   N,       Y,       Y,	0xa58, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(pex_wake_n_pa2,       PE,         RSVD1,  RSVD2, RSVD3, 0x3040, N,   N,       Y,       Y,	0xa68, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(pex_l1_rst_n_pa3,     PE1,        RSVD1,  RSVD2, RSVD3, 0x3044, N,   N,       Y,       Y,	0xa64, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(pex_l1_clkreq_n_pa4,  PE1,        RSVD1,  RSVD2, RSVD3, 0x3048, N,   N,       Y,       Y,	0xa60, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(sata_led_active_pa5,  SATA,       RSVD1,  RSVD2, RSVD3, 0x304c, N,   N,       N,       Y,	0xa94, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(spi1_mosi_pc0,        SPI1,       RSVD1,  RSVD2, RSVD3, 0x3050, Y,   Y,       N,       N,	0xae0, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi1_miso_pc1,        SPI1,       RSVD1,  RSVD2, RSVD3, 0x3054, Y,   Y,       N,       N,	0xadc, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi1_sck_pc2,         SPI1,       RSVD1,  RSVD2, RSVD3, 0x3058, Y,   Y,       N,       N,	0xae4, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi1_cs0_pc3,         SPI1,       RSVD1,  RSVD2, RSVD3, 0x305c, Y,   Y,       N,       N,	0xad4, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi1_cs1_pc4,         SPI1,       RSVD1,  RSVD2, RSVD3, 0x3060, Y,   Y,       N,       N,	0xad8, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi2_mosi_pb4,        SPI2,       DTV,    RSVD2, RSVD3, 0x3064, Y,   Y,       N,       N,	0xaf4, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi2_miso_pb5,        SPI2,       DTV,    RSVD2, RSVD3, 0x3068, Y,   Y,       N,       N,	0xaf0, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi2_sck_pb6,         SPI2,       DTV,    RSVD2, RSVD3, 0x306c, Y,   Y,       N,       N,	0xaf8, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi2_cs0_pb7,         SPI2,       DTV,    RSVD2, RSVD3, 0x3070, Y,   Y,       N,       N,	0xae8, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi2_cs1_pdd0,        SPI2,       RSVD1,  RSVD2, RSVD3, 0x3074, Y,   Y,       N,       N,	0xaec, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi4_mosi_pc7,        SPI4,       RSVD1,  RSVD2, RSVD3, 0x3078, Y,   Y,       N,       N,	0xb04, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi4_miso_pd0,        SPI4,       RSVD1,  RSVD2, RSVD3, 0x307c, Y,   Y,       N,       N,	0xb00, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi4_sck_pc5,         SPI4,       RSVD1,  RSVD2, RSVD3, 0x3080, Y,   Y,       N,       N,	0xb08, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(spi4_cs0_pc6,         SPI4,       RSVD1,  RSVD2, RSVD3, 0x3084, Y,   Y,       N,       N,	0xafc, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(qspi_sck_pee0,        QSPI,       RSVD1,  RSVD2, RSVD3, 0x3088, Y,   Y,       N,       N,	0xa90, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(qspi_cs_n_pee1,       QSPI,       RSVD1,  RSVD2, RSVD3, 0x308c, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(qspi_io0_pee2,        QSPI,       RSVD1,  RSVD2, RSVD3, 0x3090, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(qspi_io1_pee3,        QSPI,       RSVD1,  RSVD2, RSVD3, 0x3094, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(qspi_io2_pee4,        QSPI,       RSVD1,  RSVD2, RSVD3, 0x3098, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(qspi_io3_pee5,        QSPI,       RSVD1,  RSVD2, RSVD3, 0x309c, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(dmic1_clk_pe0,        DMIC1,      I2S3,   RSVD2, RSVD3, 0x30a4, N,   N,       N,       Y,	0x984, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dmic1_dat_pe1,        DMIC1,      I2S3,   RSVD2, RSVD3, 0x30a8, N,   N,       N,       Y,	0x988, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dmic2_clk_pe2,        DMIC2,      I2S3,   RSVD2, RSVD3, 0x30ac, N,   N,       N,       Y,	0x98c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dmic2_dat_pe3,        DMIC2,      I2S3,   RSVD2, RSVD3, 0x30b0, N,   N,       N,       Y,	0x990, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dmic3_clk_pe4,        DMIC3,      I2S5A,  RSVD2, RSVD3, 0x30b4, N,   N,       N,       Y,	0x994, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dmic3_dat_pe5,        DMIC3,      I2S5A,  RSVD2, RSVD3, 0x30b8, N,   N,       N,       Y,	0x998, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(gen1_i2c_scl_pj1,     I2C1,       RSVD1,  RSVD2, RSVD3, 0x30bc, N,   N,       Y,       Y,	0x9a8, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(gen1_i2c_sda_pj0,     I2C1,       RSVD1,  RSVD2, RSVD3, 0x30c0, N,   N,       Y,       Y,	0x9ac, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(gen2_i2c_scl_pj2,     I2C2,       RSVD1,  RSVD2, RSVD3, 0x30c4, N,   N,       Y,       Y,	0x9b0, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(gen2_i2c_sda_pj3,     I2C2,       RSVD1,  RSVD2, RSVD3, 0x30c8, N,   N,       Y,       Y,	0x9b4, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(gen3_i2c_scl_pf0,     I2C3,       RSVD1,  RSVD2, RSVD3, 0x30cc, N,   N,       Y,       Y,	0x9b8, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(gen3_i2c_sda_pf1,     I2C3,       RSVD1,  RSVD2, RSVD3, 0x30d0, N,   N,       Y,       Y,	0x9bc, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cam_i2c_scl_ps2,      I2C3,       I2CVI,  RSVD2, RSVD3, 0x30d4, N,   N,       Y,       Y,	0x934, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cam_i2c_sda_ps3,      I2C3,       I2CVI,  RSVD2, RSVD3, 0x30d8, N,   N,       Y,       Y,	0x938, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(pwr_i2c_scl_py3,      I2CPMU,     RSVD1,  RSVD2, RSVD3, 0x30dc, N,   N,       Y,       Y,	0xa6c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(pwr_i2c_sda_py4,      I2CPMU,     RSVD1,  RSVD2, RSVD3, 0x30e0, N,   N,       Y,       Y,	0xa70, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart1_tx_pu0,         UARTA,      RSVD1,  RSVD2, RSVD3, 0x30e4, N,   N,       N,       Y,	0xb28, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart1_rx_pu1,         UARTA,      RSVD1,  RSVD2, RSVD3, 0x30e8, N,   N,       N,       Y,	0xb24, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart1_rts_pu2,        UARTA,      RSVD1,  RSVD2, RSVD3, 0x30ec, N,   N,       N,       Y,	0xb20, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart1_cts_pu3,        UARTA,      RSVD1,  RSVD2, RSVD3, 0x30f0, N,   N,       N,       Y,	0xb1c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart2_tx_pg0,         UARTB,      I2S4A,  SPDIF, UART,  0x30f4, N,   N,       N,       Y,	0xb38, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart2_rx_pg1,         UARTB,      I2S4A,  SPDIF, UART,  0x30f8, N,   N,       N,       Y,	0xb34, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart2_rts_pg2,        UARTB,      I2S4A,  RSVD2, UART,  0x30fc, N,   N,       N,       Y,	0xb30, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart2_cts_pg3,        UARTB,      I2S4A,  RSVD2, UART,  0x3100, N,   N,       N,       Y,	0xb2c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart3_tx_pd1,         UARTC,      SPI4,   RSVD2, RSVD3, 0x3104, N,   N,       N,       Y,	0xb48, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart3_rx_pd2,         UARTC,      SPI4,   RSVD2, RSVD3, 0x3108, N,   N,       N,       Y,	0xb44, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart3_rts_pd3,        UARTC,      SPI4,   RSVD2, RSVD3, 0x310c, N,   N,       N,       Y,	0xb40, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart3_cts_pd4,        UARTC,      SPI4,   RSVD2, RSVD3, 0x3110, N,   N,       N,       Y,	0xb3c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart4_tx_pi4,         UARTD,      UART,   RSVD2, RSVD3, 0x3114, N,   N,       N,       Y,	0xb58, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart4_rx_pi5,         UARTD,      UART,   RSVD2, RSVD3, 0x3118, N,   N,       N,       Y,	0xb54, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart4_rts_pi6,        UARTD,      UART,   RSVD2, RSVD3, 0x311c, N,   N,       N,       Y,	0xb50, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(uart4_cts_pi7,        UARTD,      UART,   RSVD2, RSVD3, 0x3120, N,   N,       N,       Y,	0xb4c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dap1_fs_pb0,          I2S1,       RSVD1,  RSVD2, RSVD3, 0x3124, Y,   Y,       N,       Y,	0x95c, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(dap1_din_pb1,         I2S1,       RSVD1,  RSVD2, RSVD3, 0x3128, Y,   Y,       N,       N,	0x954, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(dap1_dout_pb2,        I2S1,       RSVD1,  RSVD2, RSVD3, 0x312c, Y,   Y,       N,       N,	0x958, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(dap1_sclk_pb3,        I2S1,       RSVD1,  RSVD2, RSVD3, 0x3130, Y,   Y,       N,       N,	0x960, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(dap2_fs_paa0,         I2S2,       RSVD1,  RSVD2, RSVD3, 0x3134, Y,   Y,       N,       N,	0x96c, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(dap2_din_paa2,        I2S2,       RSVD1,  RSVD2, RSVD3, 0x3138, Y,   Y,       N,       N,	0x964, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(dap2_dout_paa3,       I2S2,       RSVD1,  RSVD2, RSVD3, 0x313c, Y,   Y,       N,       N,	0x968, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(dap2_sclk_paa1,       I2S2,       RSVD1,  RSVD2, RSVD3, 0x3140, Y,   Y,       N,       N,	0x970, -1,      -1,      -1,      -1,      28,     2,      30,     2),
+	PINGROUP(dap4_fs_pj4,          I2S4B,      RSVD1,  RSVD2, RSVD3, 0x3144, N,   N,       N,       Y,	0x97c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dap4_din_pj5,         I2S4B,      RSVD1,  RSVD2, RSVD3, 0x3148, N,   N,       N,       Y,	0x974, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dap4_dout_pj6,        I2S4B,      RSVD1,  RSVD2, RSVD3, 0x314c, N,   N,       N,       Y,	0x978, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dap4_sclk_pj7,        I2S4B,      RSVD1,  RSVD2, RSVD3, 0x3150, N,   N,       N,       Y,	0x980, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cam1_mclk_ps0,        EXTPERIPH3, RSVD1,  RSVD2, RSVD3, 0x3154, N,   N,       N,       Y,	0x918, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cam2_mclk_ps1,        EXTPERIPH3, RSVD1,  RSVD2, RSVD3, 0x3158, N,   N,       N,       Y,	0x924, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(jtag_rtck,            JTAG,       RSVD1,  RSVD2, RSVD3, 0x315c, N,   N,       N,       Y,	0xa2c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(clk_32k_in,           CLK,        RSVD1,  RSVD2, RSVD3, 0x3160, N,   N,       N,       Y,	0x940, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(clk_32k_out_py5,      SOC,        BLINK,  RSVD2, RSVD3, 0x3164, N,   N,       N,       Y,	0x944, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(batt_bcl,             BCL,        RSVD1,  RSVD2, RSVD3, 0x3168, N,   N,       Y,       Y,	0x8f8, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(clk_req,              SYS,        RSVD1,  RSVD2, RSVD3, 0x316c, N,   N,       N,       Y,	0x948, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cpu_pwr_req,          CPU,        RSVD1,  RSVD2, RSVD3, 0x3170, N,   N,       N,       Y,	0x950, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(pwr_int_n,            PMI,        RSVD1,  RSVD2, RSVD3, 0x3174, N,   N,       N,       Y,	0xa74, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(shutdown,             SHUTDOWN,   RSVD1,  RSVD2, RSVD3, 0x3178, N,   N,       N,       Y,	0xac8, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(core_pwr_req,         CORE,       RSVD1,  RSVD2, RSVD3, 0x317c, N,   N,       N,       Y,	0x94c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(aud_mclk_pbb0,        AUD,        RSVD1,  RSVD2, RSVD3, 0x3180, N,   N,       N,       Y,	0x8f4, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dvfs_pwm_pbb1,        RSVD0,      CLDVFS, SPI3,  RSVD3, 0x3184, N,   N,       N,       Y,	0x9a4, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dvfs_clk_pbb2,        RSVD0,      CLDVFS, SPI3,  RSVD3, 0x3188, N,   N,       N,       Y,	0x9a0, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(gpio_x1_aud_pbb3,     RSVD0,      RSVD1,  SPI3,  RSVD3, 0x318c, N,   N,       N,       Y,	0xa14, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(gpio_x3_aud_pbb4,     RSVD0,      RSVD1,  SPI3,  RSVD3, 0x3190, N,   N,       N,       Y,	0xa18, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(pcc7,                 RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3194, N,   N,       Y,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(hdmi_cec_pcc0,        CEC,        RSVD1,  RSVD2, RSVD3, 0x3198, N,   N,       Y,       Y,	0xa24, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(hdmi_int_dp_hpd_pcc1, DP,         RSVD1,  RSVD2, RSVD3, 0x319c, N,   N,       Y,       Y,	0xa28, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(spdif_out_pcc2,       SPDIF,      RSVD1,  RSVD2, RSVD3, 0x31a0, N,   N,       N,       Y,	0xad0, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(spdif_in_pcc3,        SPDIF,      RSVD1,  RSVD2, RSVD3, 0x31a4, N,   N,       N,       Y,	0xacc, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(usb_vbus_en0_pcc4,    USB,        RSVD1,  RSVD2, RSVD3, 0x31a8, N,   N,       Y,       Y,	0xb5c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(usb_vbus_en1_pcc5,    USB,        RSVD1,  RSVD2, RSVD3, 0x31ac, N,   N,       Y,       Y,	0xb60, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(dp_hpd0_pcc6,         DP,         RSVD1,  RSVD2, RSVD3, 0x31b0, N,   N,       N,       Y,	0x99c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(wifi_en_ph0,          RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31b4, N,   N,       N,       Y,	0xb64, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(wifi_rst_ph1,         RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31b8, N,   N,       N,       Y,	0xb68, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(wifi_wake_ap_ph2,     RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31bc, N,   N,       N,       Y,	0xb6c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(ap_wake_bt_ph3,       RSVD0,      UARTB,  SPDIF, RSVD3, 0x31c0, N,   N,       N,       Y,	0x8ec, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(bt_rst_ph4,           RSVD0,      UARTB,  SPDIF, RSVD3, 0x31c4, N,   N,       N,       Y,	0x8fc, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(bt_wake_ap_ph5,       RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31c8, N,   N,       N,       Y,	0x900, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(ap_wake_nfc_ph7,      RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31cc, N,   N,       N,       Y,	0x8f0, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(nfc_en_pi0,           RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31d0, N,   N,       N,       Y,	0xa50, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(nfc_int_pi1,          RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31d4, N,   N,       N,       Y,	0xa54, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(gps_en_pi2,           RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31d8, N,   N,       N,       Y,	0xa1c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(gps_rst_pi3,          RSVD0,      RSVD1,  RSVD2, RSVD3, 0x31dc, N,   N,       N,       Y,	0xa20, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cam_rst_ps4,          VGP1,       RSVD1,  RSVD2, RSVD3, 0x31e0, N,   N,       N,       Y,	0x93c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cam_af_en_ps5,        VIMCLK,     VGP2,   RSVD2, RSVD3, 0x31e4, N,   N,       N,       Y,	0x92c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cam_flash_en_ps6,     VIMCLK,     VGP3,   RSVD2, RSVD3, 0x31e8, N,   N,       N,       Y,	0x930, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cam1_pwdn_ps7,        VGP4,       RSVD1,  RSVD2, RSVD3, 0x31ec, N,   N,       N,       Y,	0x91c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cam2_pwdn_pt0,        VGP5,       RSVD1,  RSVD2, RSVD3, 0x31f0, N,   N,       N,       Y,	0x928, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(cam1_strobe_pt1,      VGP6,       RSVD1,  RSVD2, RSVD3, 0x31f4, N,   N,       N,       Y,	0x920, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(lcd_te_py2,           DISPLAYA,   RSVD1,  RSVD2, RSVD3, 0x31f8, N,   N,       N,       Y,	0xa44, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(lcd_bl_pwm_pv0,       DISPLAYA,   PWM0,   SOR0,  RSVD3, 0x31fc, N,   N,       N,       Y,	0xa34, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(lcd_bl_en_pv1,        RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3200, N,   N,       N,       Y,	0xa30, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(lcd_rst_pv2,          RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3204, N,   N,       N,       Y,	0xa40, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(lcd_gpio1_pv3,        DISPLAYB,   RSVD1,  RSVD2, RSVD3, 0x3208, N,   N,       N,       Y,	0xa38, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(lcd_gpio2_pv4,        DISPLAYB,   PWM1,   RSVD2, SOR1,  0x320c, N,   N,       N,       Y,	0xa3c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(ap_ready_pv5,         RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3210, N,   N,       N,       Y,	0x8e8, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(touch_rst_pv6,        RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3214, N,   N,       N,       Y,	0xb18, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(touch_clk_pv7,        TOUCH,      RSVD1,  RSVD2, RSVD3, 0x3218, N,   N,       N,       Y,	0xb10, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(modem_wake_ap_px0,    RSVD0,      RSVD1,  RSVD2, RSVD3, 0x321c, N,   N,       N,       Y,	0xa48, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(touch_int_px1,        RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3220, N,   N,       N,       Y,	0xb14, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(motion_int_px2,       RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3224, N,   N,       N,       Y,	0xa4c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(als_prox_int_px3,     RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3228, N,   N,       N,       Y,	0x8e4, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(temp_alert_px4,       RSVD0,      RSVD1,  RSVD2, RSVD3, 0x322c, N,   N,       N,       Y,	0xb0c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(button_power_on_px5,  RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3230, N,   N,       N,       Y,	0x908, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(button_vol_up_px6,    RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3234, N,   N,       N,       Y,	0x914, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(button_vol_down_px7,  RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3238, N,   N,       N,       Y,	0x910, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(button_slide_sw_py0,  RSVD0,      RSVD1,  RSVD2, RSVD3, 0x323c, N,   N,       N,       Y,	0x90c, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(button_home_py1,      RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3240, N,   N,       N,       Y,	0x904, 12,      5,       20,      5,       -1,     -1,     -1,     -1),
+	PINGROUP(pa6,                  SATA,       RSVD1,  RSVD2, RSVD3, 0x3244, N,   N,       N,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pe6,                  RSVD0,      I2S5A,  PWM2,  RSVD3, 0x3248, N,   N,       N,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pe7,                  RSVD0,      I2S5A,  PWM3,  RSVD3, 0x324c, N,   N,       N,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(ph6,                  RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3250, N,   N,       N,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pk0,                  IQC0,       I2S5B,  RSVD2, RSVD3, 0x3254, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pk1,                  IQC0,       I2S5B,  RSVD2, RSVD3, 0x3258, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pk2,                  IQC0,       I2S5B,  RSVD2, RSVD3, 0x325c, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pk3,                  IQC0,       I2S5B,  RSVD2, RSVD3, 0x3260, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pk4,                  IQC1,       RSVD1,  RSVD2, RSVD3, 0x3264, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pk5,                  IQC1,       RSVD1,  RSVD2, RSVD3, 0x3268, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pk6,                  IQC1,       RSVD1,  RSVD2, RSVD3, 0x326c, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pk7,                  IQC1,       RSVD1,  RSVD2, RSVD3, 0x3270, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pl0,                  RSVD0,      RSVD1,  RSVD2, RSVD3, 0x3274, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pl1,                  SOC,        RSVD1,  RSVD2, RSVD3, 0x3278, Y,   Y,       N,       N,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pz0,                  VIMCLK2,    RSVD1,  RSVD2, RSVD3, 0x327c, N,   N,       N,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pz1,                  VIMCLK2,    SDMMC1, RSVD2, RSVD3, 0x3280, N,   N,       N,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pz2,                  SDMMC3,     CCLA,   RSVD2, RSVD3, 0x3284, N,   N,       N,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pz3,                  SDMMC3,     RSVD1,  RSVD2, RSVD3, 0x3288, N,   N,       N,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pz4,                  SDMMC1,     RSVD1,  RSVD2, RSVD3, 0x328c, N,   N,       N,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
+	PINGROUP(pz5,                  SOC,        RSVD1,  RSVD2, RSVD3, 0x3290, N,   N,       N,       Y,	-1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
 
 	/* pg_name, r, prk_mask, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w */
 	DRV_PINGROUP(pa6,    0x9c0, 0x0,       12, 5,  20, 5,  -1, -1, -1, -1),
-- 
2.17.1

