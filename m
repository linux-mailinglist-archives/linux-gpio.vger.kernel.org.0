Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E3845778D
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 20:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236701AbhKSUCy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 15:02:54 -0500
Received: from mail-dm6nam10on2137.outbound.protection.outlook.com ([40.107.93.137]:31457
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236581AbhKSUCt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Nov 2021 15:02:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmPFZi5tTtf2aZbYxkMPaORPyR/0CE7gNuf7cnqIZRTrawYwgml/ElBovpBczS4S2Kma9T94FQ5v/fejm8eau9vlZbYDPFNIPozZxSfNO4nSLadc0tbIf4SfoHNQk3u3bKJKhCkWCMdz4Ou35+1KwxgYuTpZpie49zvopQ3j8PcEDqPUwh7VYhkwXsH82ootgVMW2ccPtAMvMnN+wLeEvklY6B6xbif5WIbbNXeeBo97WsAoS1UnP64IZQSC3h3A2nOkPSbr5UPurKmNlrHKs0faipZjeIE6LA5t7mWxZ/cjLwtZ421D5AgTZL3lf/D6D49+ZAXXIX4yx5yI+dO7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uYE0zfIxidrPed7qb/vmZ9e5KY/riR7DJ4fft48pms=;
 b=D0RL1odrqPZsMIjgKyV1UrRqzYgFnKaeYHSmi53bjjseUXpRv6a4vwqS2kTssgiWOnHyfSmOkOytUAJX8LUR/u4/qQ8o1X1nFNmHMjTRztonH4EyLTY8F5J50qkaY5JJJNhRwWsQR59EwMbpM8iDMo6yJuGabw/DClu4Abb/gi1ajy4kpUg73aXWikmDqL2mW6VprkEJl8Jw9uJjdjxZj8tnzjBSzvL4Umt8EqxPYvWPZa2KpxjiAiudN5hU4O8XfJrj8/XrPjW0hbEIAY4OB4mauWtsEHgap5TkFzU1IwD0D91Aj+Lce+ZAWdxaiGKn1AW1UwWclzxaygBkAYCkoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uYE0zfIxidrPed7qb/vmZ9e5KY/riR7DJ4fft48pms=;
 b=LzRNUl6DRBY7C+7kJwWffu8TE8yBkUlRpxQfEnYotTH0Wp5e5Gmvx9XCCjtEFgHPr+LrDA/uUYeCtzeVYzGSTlaemSwLLfEDTsO7B23JyVl0AvVZWLa0B3E6ziyFKSnpj0R7pR4g6QUToGQ9w217YBo9v3/5WZYvLwrUqbZJcQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by CO6PR10MB5651.namprd10.prod.outlook.com
 (2603:10b6:303:14e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 19:59:40 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::6430:b20:8805:cd9f]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::6430:b20:8805:cd9f%5]) with mapi id 15.20.4713.019; Fri, 19 Nov 2021
 19:59:40 +0000
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
Subject: [PATCH v1 net-next 3/4] pinctrl: ocelot: convert pinctrl to regmap
Date:   Fri, 19 Nov 2021 11:59:27 -0800
Message-Id: <20211119195928.2498441-4-colin.foster@in-advantage.com>
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
X-MS-Office365-Filtering-Correlation-Id: a8a8fc00-f489-41be-61fe-08d9ab971f6f
X-MS-TrafficTypeDiagnostic: CO6PR10MB5651:
X-Microsoft-Antispam-PRVS: <CO6PR10MB5651B04C9A96CD1408B9F2DFA49C9@CO6PR10MB5651.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EpgBvuiJRl8OwxYybZdmXGuDgHHfN3f5XftpjMVg37J0ymotiAFPY1IeqRWnUm9xypI2sd71mSM0ocTatmXlnA7iTD6u95EHXOO0MvS9TAE0zAvyr/LasNWrrOAmVVGefjnb3ktSLedC3Q1HMMESS7BuHKJo3jSAo/3+M59/GBnUGTHAdTnXnzBVTU9hBLBtyA7R6xIfIUwzvc5Q23+LmuRyeafZUa9Oc7HAbSfqvLHEYMZHtLFzO8IQTriJirwMcIJTsGfbvc1PCKWPz9cztWHXeFi2IO6qna20q802eyTs5ei/2/vRop8wq8vVw0nWI5xbm8umHLepbgnxMbJw6UZxb/upviK8RqNEqsKq3XluMmZOwds9fem6CahETXrs7HLWQncrSJ+9PDY+Yc0v4L3ZRk7OgY/307/p7UOZvkP+lmQTWhTxryCAiq+0+Rl0LRGRC0idI8HGBtSMQtGchXQsKfJWBkYuiFTR70FBv/M/1VE2tkjj40Hlpr/3ctIYrCYb4JFK7MQp1xu/EhJAa/9876huew9GFRLi7vYBSeDoye3Iyv9ZcoiENx8IlTsOxcNtpf2Crj98emSksEDaC6RCys6OANUuTr1oq49Uf2PZA2/V9YFJJsvZStaMqdna06dJxRVg8ttRq1nHdeGalxuTAK/AkOxvMNxJ2g4pNDYHlVvL1GtVN6/VUBZh2i8abABTmTwLF5tDR1YAQxkcFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39830400003)(396003)(136003)(376002)(8676002)(26005)(54906003)(86362001)(36756003)(6666004)(6486002)(5660300002)(6512007)(66556008)(66476007)(186003)(66946007)(2906002)(956004)(38350700002)(52116002)(38100700002)(316002)(4326008)(8936002)(6506007)(2616005)(1076003)(83380400001)(7416002)(508600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xXsWbPvK0aG5Qwt0Gr5FJ07I5VSq+26j8lvk2WFLIuDM9IbyccDfPoo2GxPN?=
 =?us-ascii?Q?tQEwLwwSmF8Dx3r+i0/jgcKjACtSKKQdnjg1XPaqc6saQCl3nECjmdNSH1m4?=
 =?us-ascii?Q?8zbh3CCahMMwGk2ETEuQXyFMXVxQ6ZyVCdZTS8Tftn5yZIcccYXqj9sTJidZ?=
 =?us-ascii?Q?RrBLkNmuWZPjy50zi8RykWFsBNJQ/u67J6SWyxZeJ5NjHXuDsNc3bp1DKo90?=
 =?us-ascii?Q?hANf/KDBtyJBVtkAFZ2MdhRDG8XejrvfM6Ix016Yqwu+btAj5jTa9s09ieRw?=
 =?us-ascii?Q?EhgJLfOvU72Y/G8Q0swgNoHN++OQlw/3yUxymiJbUDLYHsIrPKYXqwkPy19p?=
 =?us-ascii?Q?C6YgZ44dPq9Vnb+ZgndwPiar6cKiz+DxaL/dQEwAOFlilbcVnLrvP5F4DB5u?=
 =?us-ascii?Q?bH8SN+I/Kv6nQUa9CW3gef54LE7ediQPvO1DMeu4tOBOJPum420RY6xn7KcA?=
 =?us-ascii?Q?XOmsAtHOUtZ+rpgyJMHOHMaqWSRacCKX7ZfroP23vgVfCYLm17BfQVur7nz6?=
 =?us-ascii?Q?ssPF+XskSxnKjaJr1HslQoMC62Tw6EiW1w6W34ZCZnxIbQZhdEjf5hOdapaS?=
 =?us-ascii?Q?dJGyKXjvMisGAjEYytCQuLzXLkBGnbQCZChXqTh3vdf5fXgM+MBl4tj9aTBL?=
 =?us-ascii?Q?lcj8/ioxX1UJiioRrgWNOe1eo4VtVhYxqEU4yHayUQFappegy3J+o2z1lbRf?=
 =?us-ascii?Q?yKS1keM/J1fXKshDocp4kOpbS3v5gAGVlAmfZp/I596wjbEcPi5S2YTtDVNo?=
 =?us-ascii?Q?+cf5E8TWcwCWePZAhHjNGCExAtXug6UtB9LlBKGNcSnkil93nLXXGHBB2F28?=
 =?us-ascii?Q?1Xy/65Seipw8Z+3cP4bcjiMMJd2TAymMGa0+7+cz0PbnePLunz7wzG+Cdh9x?=
 =?us-ascii?Q?XuKO+L6Qe8dLzqcyPGSDQ/7aUh3mhupGqBkt7GFjA82NPWXYzGPvAoMxpPX1?=
 =?us-ascii?Q?VIgUVSixT4IZ5AxfFsksIb4l1rOvgCOsMQHWVpP3ilRrmhXjM+sTOpMvVPP7?=
 =?us-ascii?Q?omyx0CW/sYBwzqbrzqqsDgtIm7OAl61Mifpj6wguuRfZmbgqHDeO7/i2gkgB?=
 =?us-ascii?Q?NAdAlQy+C2o8q/7/ktxjApWA/8IvxbPJR7FwAPP3My80RQH9L/bFqy0KVD0E?=
 =?us-ascii?Q?WKxyymBw/V44vL5pV0fvvnEtXxyeW+NEL85wL02buH/7Avt/HhFxufCG9sKG?=
 =?us-ascii?Q?tL+ranBE6oRSnBlDiwHxa5flG1OTo69UIXf9nomcC0DpyGEOK+vN8+hTiGWd?=
 =?us-ascii?Q?hKDE0yUJ+AVid+mvGTa44JinXH3rOctiFUdJwJzU1SJX9CvpyULuc+zptyGD?=
 =?us-ascii?Q?zZlphITKZDkimzF6ZUfQysLUS/k6Rul54ZF0ZGDWCUZtQCJ83/l1Hp3fAwfG?=
 =?us-ascii?Q?ti2OCoDoD2SlMP17v+qjb+vzZ0z5I5BZSTLEQikFVNclRiKgvpjTpH+u4E42?=
 =?us-ascii?Q?K87UAr7N/IxAEflUtfE+YzzFUpSgi33HykRVoqtjjG4mNXzCBkXKHfdU2mgI?=
 =?us-ascii?Q?ZmxTHHn0A3+Ozl6uUSBoRMiJbx9aOlKHawr6n7AR3nmk9MMFh5tIuELVckVN?=
 =?us-ascii?Q?ROOZDcs0SQ8+vA2bKNvfqWLSUerh2HUmQKYfLG4dH3ZqhdU+cuyhe2VKMmH+?=
 =?us-ascii?Q?qBKTdAzF4YQ2U5+IiqMJH2hvFONMXHslI2r++E01eO9UjorEZJhXh/I2LAhv?=
 =?us-ascii?Q?Myw6Rw=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a8fc00-f489-41be-61fe-08d9ab971f6f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 19:59:40.6999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utWmXAPEaDf581JD8u0KcyOmHlYnA9HAwqw+etOqvDgUTqclfF8C/8n04hVbznkt2q2uzIx9KXpxUI1v3k/5/wFvTug7YbdUQP0Dq3w63yY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5651
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In order to allow external control via SPI, memory-mapped areas must be
changed to use the generic regmap interface. This is step 1, and is
followed by an implementation that allows a custom regmap.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 65 +++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 6941c1b45b00..b9acb80d6b3f 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -152,7 +152,7 @@ struct ocelot_pinctrl {
 	struct pinctrl_dev *pctl;
 	struct gpio_chip gpio_chip;
 	struct regmap *map;
-	void __iomem *pincfg;
+	struct regmap *pincfg;
 	struct pinctrl_desc *desc;
 	struct ocelot_pmx_func func[FUNC_MAX];
 	u8 stride;
@@ -819,7 +819,11 @@ static int ocelot_hw_get_value(struct ocelot_pinctrl *info,
 	int ret = -EOPNOTSUPP;
 
 	if (info->pincfg) {
-		u32 regcfg = readl(info->pincfg + (pin * sizeof(u32)));
+		u32 regcfg;
+
+		ret = regmap_read(info->pincfg, pin, &regcfg);
+		if (ret)
+			return ret;
 
 		ret = 0;
 		switch (reg) {
@@ -843,6 +847,24 @@ static int ocelot_hw_get_value(struct ocelot_pinctrl *info,
 	return ret;
 }
 
+static int ocelot_pincfg_clrsetbits(struct ocelot_pinctrl *info, u32 regaddr,
+				    u32 clrbits, u32 setbits)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read(info->pincfg, regaddr, &val);
+	if (ret)
+		return ret;
+
+	val &= ~clrbits;
+	val |= setbits;
+
+	ret = regmap_write(info->pincfg, regaddr, val);
+
+	return ret;
+}
+
 static int ocelot_hw_set_value(struct ocelot_pinctrl *info,
 			       unsigned int pin,
 			       unsigned int reg,
@@ -851,21 +873,23 @@ static int ocelot_hw_set_value(struct ocelot_pinctrl *info,
 	int ret = -EOPNOTSUPP;
 
 	if (info->pincfg) {
-		void __iomem *regaddr = info->pincfg + (pin * sizeof(u32));
 
 		ret = 0;
 		switch (reg) {
 		case PINCONF_BIAS:
-			ocelot_clrsetbits(regaddr, BIAS_BITS, val);
+			ret = ocelot_pincfg_clrsetbits(info, pin, BIAS_BITS,
+						       val);
 			break;
 
 		case PINCONF_SCHMITT:
-			ocelot_clrsetbits(regaddr, SCHMITT_BIT, val);
+			ret = ocelot_pincfg_clrsetbits(info, pin, SCHMITT_BIT,
+						       val);
 			break;
 
 		case PINCONF_DRIVE_STRENGTH:
 			if (val <= 3)
-				ocelot_clrsetbits(regaddr, DRIVE_BITS, val);
+				ret = ocelot_pincfg_clrsetbits(info, pin,
+							       DRIVE_BITS, val);
 			else
 				ret = -EINVAL;
 			break;
@@ -1340,10 +1364,31 @@ static const struct of_device_id ocelot_pinctrl_of_match[] = {
 	{},
 };
 
+static struct regmap *ocelot_pinctrl_create_pincfg(struct platform_device *pdev)
+{
+	void __iomem *base;
+
+	const struct regmap_config regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.max_register = 32,
+	};
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_dbg(&pdev->dev, "Failed to ioremap config registers (no extended pinconf)\n");
+		return NULL;
+	}
+
+	return devm_regmap_init_mmio(&pdev->dev, base, &regmap_config);
+}
+
 static int ocelot_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct ocelot_pinctrl *info;
+	struct regmap *pincfg;
 	void __iomem *base;
 	int ret;
 	struct regmap_config regmap_config = {
@@ -1377,11 +1422,11 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 
 	/* Pinconf registers */
 	if (info->desc->confops) {
-		base = devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(base))
-			dev_dbg(dev, "Failed to ioremap config registers (no extended pinconf)\n");
+		pincfg = ocelot_pinctrl_create_pincfg(pdev);
+		if (IS_ERR(pincfg))
+			dev_dbg(dev, "Failed to create pincfg regmap\n");
 		else
-			info->pincfg = base;
+			info->pincfg = pincfg;
 	}
 
 	ret = ocelot_pinctrl_register(pdev, info);
-- 
2.25.1

