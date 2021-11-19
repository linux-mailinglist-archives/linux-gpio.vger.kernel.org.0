Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE2E457789
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 20:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236448AbhKSUCt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 15:02:49 -0500
Received: from mail-bn1nam07on2110.outbound.protection.outlook.com ([40.107.212.110]:13381
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235208AbhKSUCr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Nov 2021 15:02:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6RVMzxuPaKTiP9P8tDo/ocfF+yMP1WgdVOCi+Jo5uRRz9lP8a5aII3AZlAGJOYhit8mD8fC35vkQOTNw5t/PFtnMFx88u8iZZUD+wDjAr+lHfxXIKVcmwiQNCUKQSsF7kxp1c/qXOjMLOiZoMLLMIjB6Q4X7NUoWMfHR30XCn8YSAXStvn6Mr12zUxW2WHgqVCPw5D0iXZnOXaXUn2IUQOc+K4SiKedhbV8DF6E0Jfk2QnIGuyPaShE7dbMGWt74vQpjqq3BfBVR19zfC3b6YwOE/QCbhRpPQHNdnnAkYZm7+2qkfvAkZ7IcQ4TYzdxo5klG8V9FUFj2nNpjKcVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfborKht4S6i6bKzP5zQQgPUelK4e7eCGot2VmBn4XE=;
 b=lORrXcVqvG7WubB73Nc9PtzkA8RtWu1Wr/XpwLbBAaRRlQbCGADmeJouCMlXDrh6OF8S3ojh0UH1LLMTVt+ryVqtj8hU/P29AZ7rMj37CMOvBOzgxtrdg+a7bpb+hBYUnbwLtgREQxE/NVLJW73oW5MVLmMhYHrdLL4LrvvUFR57wRXDESruOHj7/nkwPpaBG2kd34YcHOYYvJWHjHG0CvMa/mOQQdOm0mgViVNLa3gegxIrtBo459yLJ0pHHlRdaf8nVcP6OXxkyB58kSBQQyTwojTvot3eJWaVgjb1PjlirXYtkH0pnWwb9dA4OhyhT9ol9C1la/tKvlPm7zrZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfborKht4S6i6bKzP5zQQgPUelK4e7eCGot2VmBn4XE=;
 b=hprmRjuaoNi9bGLGeIwi0sWGhNfRYMe0Hwb+BGLcFtIgH0gpD6CeBlC66s2Ts+5vdMS6lreqan8pgONvoc+gCS9gOe2qfiAchI6ZrzBTXgt4xH9ahpk5wvIQT7dfc1aFhJ1Nox6VIW2m/1t0TiookYN1EDCAN3HzB9qUKW3s4zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MWHPR10MB1454.namprd10.prod.outlook.com
 (2603:10b6:300:23::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 19:59:41 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::6430:b20:8805:cd9f]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::6430:b20:8805:cd9f%5]) with mapi id 15.20.4713.019; Fri, 19 Nov 2021
 19:59:41 +0000
From:   Colin Foster <colin.foster@in-advantage.com>
To:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH v1 net-next 4/4] pinctrl: microchip-sgpio: update to support regmap
Date:   Fri, 19 Nov 2021 11:59:28 -0800
Message-Id: <20211119195928.2498441-5-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119195928.2498441-1-colin.foster@in-advantage.com>
References: <20211119195928.2498441-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CO2PR07CA0068.namprd07.prod.outlook.com (2603:10b6:100::36)
 To MWHPR1001MB2351.namprd10.prod.outlook.com (2603:10b6:301:35::37)
MIME-Version: 1.0
Received: from localhost.localdomain (67.185.175.147) by CO2PR07CA0068.namprd07.prod.outlook.com (2603:10b6:100::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 19:59:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97447887-572f-441b-0179-08d9ab971fbd
X-MS-TrafficTypeDiagnostic: MWHPR10MB1454:
X-Microsoft-Antispam-PRVS: <MWHPR10MB14548F087BDD68CE466C0D97A49C9@MWHPR10MB1454.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EKk/WZmr7u8RS5aVc8LxlBveNN2xbDU9Nf4NX0DyhWY8l0iZDJo+Ho1Xh6NhW7U1unzgSyTyP3WjAaAxtb7T8ZCFPQqonZq6D+okQzFUZ2Y1KicTkjZttUTxsSvG0xKFtBDoVu7MLaqN597gEPvvBvvV8t/pWjJq4M2uOHxGm7SagItVT3WscqxH0vfTPVZ0Z9WtLuYMte0fPvxDnf1DjYCtOZx09li5ezOWwA0InZb0U4yjMoz9ibqlPIYxyMVyNuuQMmYTFUS0l6bkse2MXF1G3l9y8M+2z5gfN3Ec0YKmOlM/E1V13jD6xPyEEvUSuNkEnDhzuhAfIKyyf2z3AyUbQp4Yjb0H9mUbaswZhlWRp2njDKni7sspb3XfgwD6xXXjdilVi7KaUCrbstjNzthhhK7k7rHj+jVHt6frBiycAZihvI/gtmyu+iEGiLDvJF/Rm/CFExkCCT9m7eHmm/yT79fxikmr5ZqQfU7Z9TmBY+E9stR1uewmxoFwuatldAhE5KYcQC4jDXgWZF6+gMtZZOD+TAR71fD32+Pt/n38nqdM08UED1KAeEY7OTCg2zqCkfDN8xnFc6BKS6M3VCZMs4t2vP/Aagxmh323/j7+gElgJN7xdO0/XRRdoXvNv/hl/NdwmfzrJh7upFEOhE7Ho6y1ful4luJ/sMsvOQ1IAGs17N8n8gXFy+RSqbmnRi7lf7ocJ8tJL4c+djtfYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39840400004)(376002)(366004)(346002)(396003)(38350700002)(38100700002)(956004)(8676002)(26005)(2906002)(66946007)(52116002)(86362001)(36756003)(1076003)(186003)(83380400001)(6512007)(316002)(5660300002)(6486002)(54906003)(66556008)(66476007)(7416002)(508600001)(4326008)(2616005)(6666004)(8936002)(6506007)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AvRyOojq7+e4xyz5lTUVS4FNIqmJcoLkHKxJ383sAamWG0pLUFaqVqhVM2La?=
 =?us-ascii?Q?+lpA5s1OYLXJPgX6wNnwB96Nv7a9lt2Hnmm67pOSHqQ5UJoyUX4ynXDUFaUb?=
 =?us-ascii?Q?l4wrKJavPLZ2c/5W68zhc40PlGPtCvI6DUHEYkhegPjGykCfa1cOpzXJbEwW?=
 =?us-ascii?Q?/frqC+MfqDfAOSVmsZ1Jkv+YwkQpGdK/TM32OFAxGdIeKsHqFwwjsVEQ5MfM?=
 =?us-ascii?Q?h9sDpOoosICsYK5GyrLToKEe1iA+j5ZtA3WE0v1CMybWTQR4h6IxaF+IQceA?=
 =?us-ascii?Q?16bFsZys7+9yyWhB3LEcoluCU1Wu+VysVTJB7Z4a9CtICDhik2udui3KLmQ7?=
 =?us-ascii?Q?BMn6NqRwt5nL23JwOUlDlPEhjhXQrqYelVZLOIJPu2nXzWWFf2ihwFbQGRAI?=
 =?us-ascii?Q?mGYgB2dB3FH0ORh6ojDOTdWOgQZps5J31A8tXZxPwFcinOdjzTkRLJTTklCB?=
 =?us-ascii?Q?POIGmbelm1PEmemTT2occPptxwzIEXqDVLPAiyhDrZYvmw4smRXS2Umi0z+S?=
 =?us-ascii?Q?uoGNpc91/PRpsm9fDXp6j/I6+Tori2+L4UGAbj+DS8Mywe0B1t9fMwcrQVxa?=
 =?us-ascii?Q?FEdlhtm2j+lIghSpMir/PLRb3eq1bCTXEhPLaLrjKLZJ6ZaeOfj+0DLeQky1?=
 =?us-ascii?Q?7wIWUp05C19r5dNDDtXQxIs1PB5RGhJ2ECpek5byt3mC1fb0zbrUxLzq0bUq?=
 =?us-ascii?Q?hsPHw+5D8oX9AoeghOqo/yJP8NhxGwgBq4GEfqHJQjXU6uVXePhNXlT6H8aM?=
 =?us-ascii?Q?YDNDDfCme4m0uaUzOWMlsWDA345Ig3irfdCK/85tcZNSspzm26P0lRX3THpW?=
 =?us-ascii?Q?MVn0/WfpBj6xzGNJrtW89wtAdehDPbagJkDlGrVX9df87ZahNA2i3cbBreTa?=
 =?us-ascii?Q?VDLtBN0XWt9fKk2myGo3evXbcZ8oqnzTYGqYGqNHMdgCOwksl7Q5sN+fWpVs?=
 =?us-ascii?Q?M9OzpieFEoH6SPoJfi7pQuyg/IyfREg90M0747+VVmf4z6xfaJvQ1yYXOVAf?=
 =?us-ascii?Q?lFr5btHLCn58FAiA42byahehdd8U7h7zopL8/z/tov+m2qbPiBeV4IreCaXo?=
 =?us-ascii?Q?IhrIEo+Bopg83A4mjUq7/j3TXRLQ87oTxPlsSLrXy7o0FBuqtYlzFNxhAc9Z?=
 =?us-ascii?Q?YBYEap1AgGhH2/IP+CNBg3Ci3NG8/9fzMYrZCz0FuhGpI2vuh+wdKgB4e4NG?=
 =?us-ascii?Q?9M6HoDNg7R+LPs0HCmiYY7blGn7F0BbAcw8dxa8VCxzR3nXdwaIahmtpS2Wo?=
 =?us-ascii?Q?Ly9vWWndV5OxYNMVXLO95cDk2/md+V0KkC18Xty6BLNq2pexcpyPjqFPT5Nq?=
 =?us-ascii?Q?MkDAqGi/51YIFMyt20Fgx7KaScyqsF/T7zzbTZ29d3KWD0kJSCTmWmBgvBc3?=
 =?us-ascii?Q?c4xiZfpwR9xyRMwqxbp4oPCJavzZwvd1JJpsh+SqnCU5KlUE5+63i2OdnBds?=
 =?us-ascii?Q?w4QMJhzEsDbAzhYrO4yHyrS0hEVNbZF0bNee9/TJ/p19SdHKB2Pp0lWcJEiR?=
 =?us-ascii?Q?Xmp522ThLqZma1FNJhcKRs1zkj9pfdR7DdMMpsscN4pOKtkPkPmUz2kxEGNT?=
 =?us-ascii?Q?Yr+ZqMs3RevWvt+2/Yfs3o+I8tpn74RlvYrcERvZ9xfCJGDDitKFkxEVTuOo?=
 =?us-ascii?Q?t/k2egI2gaIh8cFEpg39jR5CCny87ia8YnNawDVlSHszUAxZkDEU5I43Kq+0?=
 =?us-ascii?Q?2sr8Lg=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97447887-572f-441b-0179-08d9ab971fbd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 19:59:41.5085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEr46dyohN186SqfN9ogOPiNXGLpj9ASNifKNKBr+vPS4wco74J/OGU67/r46hwC6aHTPJ+uEGDzcLs1qSTfD3zquw3AXqEE9WG0BjD4m8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1454
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adopt regmap instead of a direct memory map so that custom regmaps and
other interfaces can be supported.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 45 +++++++++++++++++------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index 78765faa245a..8e081c90bdb2 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -17,6 +17,7 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "core.h"
@@ -113,7 +114,7 @@ struct sgpio_priv {
 	u32 bitcount;
 	u32 ports;
 	u32 clock;
-	u32 __iomem *regs;
+	struct regmap *regs;
 	const struct sgpio_properties *properties;
 };
 
@@ -134,31 +135,42 @@ static inline int sgpio_addr_to_pin(struct sgpio_priv *priv, int port, int bit)
 	return bit + port * priv->bitcount;
 }
 
-static inline u32 sgpio_readl(struct sgpio_priv *priv, u32 rno, u32 off)
+static inline u32 sgpio_get_addr(struct sgpio_priv *priv, u32 rno, u32 off)
+{
+	return priv->properties->regoff[rno] + off;
+}
+
+static u32 sgpio_readl(struct sgpio_priv *priv, u32 rno, u32 off)
 {
-	u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];
+	u32 addr = sgpio_get_addr(priv, rno, off);
+	u32 val = 0;
+	int ret;
 
-	return readl(reg);
+	ret = regmap_read(priv->regs, addr, &val);
+	WARN_ONCE(ret, "error reading sgpio reg %d\n", ret);
+
+	return val;
 }
 
-static inline void sgpio_writel(struct sgpio_priv *priv,
+static void sgpio_writel(struct sgpio_priv *priv,
 				u32 val, u32 rno, u32 off)
 {
-	u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];
+	u32 addr = sgpio_get_addr(priv, rno, off);
+	int ret;
 
-	writel(val, reg);
+	ret = regmap_write(priv->regs, addr, val);
+	WARN_ONCE(ret, "error writing sgpio reg %d\n", ret);
 }
 
 static inline void sgpio_clrsetbits(struct sgpio_priv *priv,
 				    u32 rno, u32 off, u32 clear, u32 set)
 {
-	u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];
-	u32 val = readl(reg);
+	u32 val = sgpio_readl(priv, rno, off);
 
 	val &= ~clear;
 	val |= set;
 
-	writel(val, reg);
+	sgpio_writel(priv, val, rno, off);
 }
 
 static inline void sgpio_configure_bitstream(struct sgpio_priv *priv)
@@ -807,7 +819,13 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
 	struct reset_control *reset;
 	struct sgpio_priv *priv;
 	struct clk *clk;
+	u32 __iomem *regs;
 	u32 val;
+	struct regmap_config regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+	};
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -832,9 +850,14 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	priv->regs = devm_regmap_init_mmio(dev, regs, &regmap_config);
 	if (IS_ERR(priv->regs))
 		return PTR_ERR(priv->regs);
+
 	priv->properties = device_get_match_data(dev);
 	priv->in.is_input = true;
 
-- 
2.25.1

