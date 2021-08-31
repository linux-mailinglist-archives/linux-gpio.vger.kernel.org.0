Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59D13FC222
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 07:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235826AbhHaFaC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 01:30:02 -0400
Received: from mail-dm6nam11on2046.outbound.protection.outlook.com ([40.107.223.46]:17937
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235359AbhHaFaB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Aug 2021 01:30:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBpujUgZKRagSN0ArFpsHY3rF0oL+jFdOEcWANdPSbMzE9rB6/nz5Gx+uoRsmRv5bSyNnIhL9uZj1GIjjEORuOXskbS4G8ahYo43ihwLsXM6p/lDNoObIFoeRLF7AH2Zg/3XV4auP/x68OBSsLEn1TePfymL47dXjFgeO5CNkwL7SlwnSOFtQHjJtWDVL/wQoCj5zTfFtf5e71kllj40njgT7vGDXg4NQ6vje8ozsBtEha5qtz59Gvyq0A6+bniWGkCee4S8v6coKMXBeuVMBTrnORZWBJQCW5cEw4R1rcBxTBj0tcBwpGbmrBJQGPUSfnnupzotrcIHJH00JBU7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKsLQTsp1lR/QLaB5DpxDQ4RZs43FmUGc7JZQSf2cLA=;
 b=M5v9dtKbrevKKR7CvjM8BhtHLwv0/cXMggj6IgrE1OSl0jqMGN88xoK+hfrVbCXiw+GaQuCyWvBKfYOgq5flD4tB4TLBumh8gvX1tMU1UKvWtGqaAcftfPRi3jgAfAGc59FigQdKf3S8vUYs3wVGawdLumXLSXRwKH+a3LcplAMHuGLY3xDWaqs1VpGrngiFwSLbMHAU/GJifp9pe3GPo3/lIk9/6UGcpbqm9nIqBUNMziYgSasGx4kP1yfa+MR0Hhu+Xv/GbrBjEbWCgdvSDorgFYHUSOhjMnqaxC9zUAOC2sc2ScS8NdzKIMVAQr5m3udMRYM5/Am+WTnKrgBiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKsLQTsp1lR/QLaB5DpxDQ4RZs43FmUGc7JZQSf2cLA=;
 b=WyJE25ggotIM2vNtadz/SBD70TVIn71CgEusNY4SayDPcXt3kavvp20AGb4vBjbijH/5bKvl0wQA23oY++j+sh5xEQPA6rtE4xFu9IyXFLCx67Vsw9H+4ywTnvB8aQKA/+LayL8EHUjy8mKk1doeT3LaJ5qufJ8RwQEFp+hvvpTNPJirFr/SuVyBiak+XzgUb/9uLZArBnf0q5xTIUmaN+Nea7fHTf+W+8WDQxn92vNImrUsMzLrxY/Gnk4SVFyNpdmE5YpbkhNW29HLsoV+T8Ap5OrkSbsBMsAyWneiI4u/G/zTm1K4OMKH9x1Xsjn/bEm7U9DkqLqqNePk98rqMw==
Received: from DM5PR16CA0032.namprd16.prod.outlook.com (2603:10b6:4:15::18) by
 MWHPR12MB1373.namprd12.prod.outlook.com (2603:10b6:300:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20; Tue, 31 Aug 2021 05:29:04 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::3a) by DM5PR16CA0032.outlook.office365.com
 (2603:10b6:4:15::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Tue, 31 Aug 2021 05:29:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 05:29:04 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 05:29:03 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 05:29:01 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH 1/2] pinctrl: pimux: Add support to save and restore HW register
Date:   Tue, 31 Aug 2021 10:58:33 +0530
Message-ID: <20210831052834.4136-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210831052834.4136-1-pshete@nvidia.com>
References: <20210831052834.4136-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8b15ff4-6a22-484f-4fa4-08d96c403f21
X-MS-TrafficTypeDiagnostic: MWHPR12MB1373:
X-Microsoft-Antispam-PRVS: <MWHPR12MB13731AFC539F361953D47FCFB7CC9@MWHPR12MB1373.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMgyokw9j+daNpfg91rQM8LH1n1vFposoTtHbX+09qWayCYcPdVJuA/LiUv5TKPGPohgcd+Pc0hOKMs870TkeFmQEvMRZ5F8wUVP36FxSRvdLB2BHCRTnX42pgplvuuiogIxX7M4NqKqeV3YllaysRwKFUOx2ZQr1zA5TPciqBXGvz3cB03AXA1XwpOlDYV6qGAkAUsfKgJf8/1gwtMABaLQey8t2CWFrhvDj08O3mJZiraDwph3rOvC5VuyAtcYFUgZHwem6FN3+DYZtTon17wRIawg9d2pdDtO0p3mGXltwpZpGFliCTvmXRXrHRm/BpukHPQH6fdRf98y82hD1L4N8ohZp8GSufXBwuiITc9lGGJ9Wx5TKWOQ1/JzEqm4ZFV0vtG0YFCAkCl6/qFMh7eU7TilY97985EJ1IhRT1zdbj76LFilpGh1sF9XpIGxLEy2OGvKdi5LaRGEfB0s+ZymkEVvBtbrSYIlrV4MHC9l6t0Qm6boayTmeZybmdiUrPFzCH4TXmAUW8dx9XjwZ+0BLECrYsOmcjvk/s09HwpkxFe5TgS2aajqnCHlFh64uxn23wRYoIDz/6jzegLYF8rx8VhNL/i4WUEArY8vDDcOJUoFqUedTPZdwRDEWsLfiRCKwYNTy/ICZ1/uXTDBaWQo1AAhyRJtWRI2KGSqgAvLdqcNutaYXiuPyDBJOeGwJwek8/QB3NhCOLHA2e34egprxEhVapezwnOHUtW8a2Q=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(36840700001)(110136005)(54906003)(6666004)(82310400003)(36860700001)(36906005)(83380400001)(70206006)(2616005)(4326008)(86362001)(478600001)(5660300002)(356005)(8676002)(82740400003)(316002)(26005)(8936002)(7696005)(186003)(336012)(70586007)(36756003)(1076003)(7636003)(2906002)(426003)(47076005)(107886003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 05:29:04.1350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b15ff4-6a22-484f-4fa4-08d96c403f21
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1373
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Laxman Dewangan <ldewangan@nvidia.com>

Add support to save and restore the pincontrol HW register
for GPIO mode configurations. This helps in changing the
pin configure only during suspend and restore in resume.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: pshete <pshete@nvidia.com>
---
 drivers/pinctrl/pinmux.c       | 24 ++++++++++++++++++++++++
 drivers/pinctrl/pinmux.h       | 18 ++++++++++++++++++
 include/linux/pinctrl/pinmux.h |  9 +++++++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 6cdbd9ccf2f0..66fc0ca22623 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -317,6 +317,30 @@ int pinmux_gpio_direction(struct pinctrl_dev *pctldev,
 	return ret;
 }
 
+int pinmux_gpio_save_config(struct pinctrl_dev *pctldev,
+			    struct pinctrl_gpio_range *range,
+			    unsigned pin)
+{
+	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+
+	if (ops->gpio_save_config)
+		return ops->gpio_save_config(pctldev, range, pin);
+
+	return 0;
+}
+
+int pinmux_gpio_restore_config(struct pinctrl_dev *pctldev,
+			       struct pinctrl_gpio_range *range,
+			       unsigned pin)
+{
+	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+
+	if (ops->gpio_restore_config)
+		return ops->gpio_restore_config(pctldev, range, pin);
+
+	return 0;
+}
+
 static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
 					const char *function)
 {
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 78c3a31be882..425c31a0115b 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -31,6 +31,12 @@ int pinmux_map_to_setting(const struct pinctrl_map *map,
 void pinmux_free_setting(const struct pinctrl_setting *setting);
 int pinmux_enable_setting(const struct pinctrl_setting *setting);
 void pinmux_disable_setting(const struct pinctrl_setting *setting);
+int pinmux_gpio_save_config(struct pinctrl_dev *pctldev,
+			    struct pinctrl_gpio_range *range,
+			    unsigned pin);
+int pinmux_gpio_restore_config(struct pinctrl_dev *pctldev,
+			       struct pinctrl_gpio_range *range,
+			       unsigned pin);
 
 #else
 
@@ -89,6 +95,18 @@ static inline void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 }
 
+int pinmux_gpio_save_config(struct pinctrl_dev *pctldev,
+			    struct pinctrl_gpio_range *range,
+			    unsigned pin)
+{
+	return 0;
+}
+int pinmux_gpio_restore_config(struct pinctrl_dev *pctldev,
+			       struct pinctrl_gpio_range *range,
+			       unsigned pin)
+{
+	return 0;
+}
 #endif
 
 #if defined(CONFIG_PINMUX) && defined(CONFIG_DEBUG_FS)
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index 9a647fa5c8f1..cca87586d8c1 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -53,6 +53,8 @@ struct pinctrl_dev;
  *	depending on whether the GPIO is configured as input or output,
  *	a direction selector function may be implemented as a backing
  *	to the GPIO controllers that need pin muxing.
+ * @gpio_save_config: Save the GPIo configurations.
+ * @gpio_restore_config: Restore GPIO configurations.
  * @strict: do not allow simultaneous use of the same pin for GPIO and another
  *	function. Check both gpio_owner and mux_owner strictly before approving
  *	the pin request.
@@ -79,6 +81,13 @@ struct pinmux_ops {
 				   struct pinctrl_gpio_range *range,
 				   unsigned offset,
 				   bool input);
+	int (*gpio_save_config) (struct pinctrl_dev *pctldev,
+				 struct pinctrl_gpio_range *range,
+				 unsigned offset);
+	int (*gpio_restore_config) (struct pinctrl_dev *pctldev,
+				    struct pinctrl_gpio_range *range,
+				    unsigned offset);
+
 	bool strict;
 };
 
-- 
2.17.1

