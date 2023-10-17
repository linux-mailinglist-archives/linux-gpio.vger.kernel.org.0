Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1602E7CB943
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 05:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbjJQDZ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 23:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbjJQDZ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 23:25:57 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2041.outbound.protection.outlook.com [40.107.6.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AB295
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 20:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF6eZzr1r8TexDkaYtTGY/ic2uMQ95w2HSP41uzYPsi2xzsfKoBRQqohgoyaunRyJ9N6YmaHZFanzjSIrf4+tNbQkbFWd+sjoklp2qi2u5RcY8LsPENt9zx27cjqj6MazCImF+oSxRa86v+dWi6dwvWFtvnKeT8isG8HsDBBMGUrR9UqwykLQFrF/ZE4fUyRbBz9XMJGGBMEuQX+HSK/vn+7oyhl71Qa1n1DpBZpUPyO2qiKT5oZSDdgalJ8GgtZHeKs+Mvuu0vsxTgJpq3v9lmgp0T73FzF3tDtoAXoMKfBFpiQyjnencqjuOCVuzEcn9hTm/5oFz7SzPfrTvl4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sUYjjwU9clOQkAMwE5jQS9r7uVlFn6xRBfkPQiuCXk=;
 b=moSSwscggHIGWXzzPRrXZ0ocsXRsn3kSDqSDNcDbVMbByWhhAHYtHUxizi007z26ndtnrdHwU00v03lPaRdDN4B++VX0r43xrwRSne54c6gRRYW6eaHf341x/e3B3tb8w0KxiAnoDGCSza5HHnifDdt0pHsWvizizVhK8Z83fLUxrLGveLsg6Rlr3Y/1yKeqTClBC4C1JZRbUF3RgLe9XM1YPMRqvBJGnQnH1P6C6kaFLBsixq0B6Fac4f5w8YxDGbU8gcWigL1nOfGkcnjNQxuDE8c8tAUJnteOqDZpoCwSav4ZfNreK1YWVDDZSHTxg7wLFWZD+fHq3NOkS+w6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sUYjjwU9clOQkAMwE5jQS9r7uVlFn6xRBfkPQiuCXk=;
 b=D0QWG5icvBrDUjfV5NBB8D1X59aY1N1+LeU+T48x47TLhYKC1c+4BzXVslyJCk4xVAAuZj8kpYk3qWWmcp2QMRNbF3sEgO98q92eV9j+vDKYlfn7wttle43RQNlfKU5NBT7n5cyPVFW8iOSbpTx65+ETQnXBQ9iTT8eGmHxQ92Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 AS8PR04MB8515.eurprd04.prod.outlook.com (2603:10a6:20b:342::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 03:25:53 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 03:25:53 +0000
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     andy@kernel.org, haibo.chen@nxp.com, linux-gpio@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 2/2] gpio: vf610: config the data value before the direction setting to avoid glitch
Date:   Tue, 17 Oct 2023 11:30:39 +0800
Message-Id: <20231017033039.1245959-2-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017033039.1245959-1-haibo.chen@nxp.com>
References: <20231017033039.1245959-1-haibo.chen@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To DB7PR04MB4010.eurprd04.prod.outlook.com
 (2603:10a6:5:21::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4010:EE_|AS8PR04MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 587dfdd9-d5b9-418a-f879-08dbcec0c4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QfkghxZZmxlKvYIjxT70ZhD3ZzAvbvhsKeP2AR2w0nP+6QO54xnCHZqCYrxkz7tdxkmm509d08yvfCvNuWV/prNHcq+IImjzeNsh708PEGyxlR8sw07GLwpqEPfxRPR3YSHH8wBsd8hY4hERkEZx1Ef+2I+njrL6HXtLetpZ8CiuWVbYFfOvZKpH1FMLQ2OObjxcrkFOeimk8EtjsIgXCMejjyif4abhD8IWqs55/OSkrRSuxWCTW0FkMEoTeymNtM+hypFd35m/G5/rLcOyUMavl5YXPvdrAJljAP5Wvo8S8d5yBtEqHXqCNDoDIcR59WJPkm/XKfyfHw+GqgY4T493c//+t5vvgMaX65YZuCzPkQSWNSPOuy56nZXbAGM7bNDx5m+R6KUNs8jLcVvr2tSKPMYrUtmAwos7XR9gMm0yvwUJPX4NOIjbveMHnv4aCVu4hDRB7y1s0BHMC82PHYzdsXpk6lA58IthBX+MU6wEugrr+LG8lDSXll8sD5Ph3OoMZoOLGTlFBECX+HNc0ljFUDSSbnc4n9L/ndlwHFnE+r4m9STh7OBegUzx86oY5DmzU+riIKcuZS6fcBYN8VQD719cZ8i7NDEO5D4XMip7E/V8UX7so/h69KxCk0RA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(4744005)(2906002)(6666004)(9686003)(38350700005)(6512007)(8936002)(8676002)(5660300002)(4326008)(41300700001)(316002)(66556008)(66476007)(66946007)(6486002)(478600001)(38100700002)(6506007)(52116002)(83380400001)(86362001)(36756003)(1076003)(26005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cZiRgWgNgeHDk9Fy7gEkNI/+BSkXOR9KQFOIzGUbKZ0hhAR+uu8nHkorRufQ?=
 =?us-ascii?Q?BtP3S7hfhrC1US8IYfs2lVQcv0IokPuInsLHm7uYMUDjECRlRsm2oCa5dos/?=
 =?us-ascii?Q?NrpvwH+e/z4d+HtJv1Kx/PWmPH0b429Tt+En7nBqdb9VrilFzwO4MnS9JrX+?=
 =?us-ascii?Q?ybPXHaA8iaDTBTdpuaPFwE4+V1AsKcK0t0GEFokB1KpAvXMW7Zv9voLLvUm8?=
 =?us-ascii?Q?0u/aac2eGgy3daTSTT+GG0JPHz60v99Aj1LnjWNuob4Hp+4UEsYPJloCmPnu?=
 =?us-ascii?Q?Vr0gOxt8jmsHE/aMTupTGapU5vl4ZbiJMVV2iRW/1eYvNw/+0yWy8krNuWcp?=
 =?us-ascii?Q?x2Bqkx4cqki6Gy4ynScmek62klwbOOKEMhuceSCngv3xX9HWfVS93SDvXy4q?=
 =?us-ascii?Q?GdDN2krBsNzmYDOE/9Hq8aurNzwwVEJ7g0qGbims1q2HdPcv2vYDijrNKgg6?=
 =?us-ascii?Q?wn2Z4neTR+zdgitOO7bhkDxWAuJJUYyG+pQo3yP29qaI8+ZTuIA61Cog4hqi?=
 =?us-ascii?Q?CrGcwJ6fgj/1LH9ohHem2DUpWjm2oVLOUro6WaEBwJMHYuGInkCdHqjvCRRu?=
 =?us-ascii?Q?WfMvd48wU8zwoj2SvWzMhgKDfR0PpJCxg6rIXlmlc5+61tKgDkoY847zS7w9?=
 =?us-ascii?Q?jKnFrLagUQh1iqqocEqUYqupilVMr3rMBaIOz2Csnk7ndurZQSh+T+jU64BW?=
 =?us-ascii?Q?/+WxAIszHBPYG/R8RMZc3N/LZ4wKskvYurDShk/AD3nTSZrbODc5Ky6IH9qq?=
 =?us-ascii?Q?gBpY/7HlgmuPmVAvxmXj7yMK+RJ/sVzKw4l9XuN8LRwEtrbqdRkwHq5jNDfD?=
 =?us-ascii?Q?YPh/KRvowBWvs26ZoQKEOzwjIKjOyTkQ3qVIEK/fOWzQM51lNO5/IP++64xO?=
 =?us-ascii?Q?kBZUsM+3u0nsjk/1IFO3oHkbVKTeZjBUJXUwAMI8G+n3X6bgG+VZaX01zy2g?=
 =?us-ascii?Q?LgX89LObDwBkXpLUDWpSOHX9KBb18VCK8YV/cZQobaX88eT3BzA6y19evv+v?=
 =?us-ascii?Q?f5Y5MQPAqz70qT1DgK+NfUN5/o8e7S56Wa1HjYYY9FoajF7TLaiYbnoHAjRJ?=
 =?us-ascii?Q?uKYbsyDrHdVOJL9xfmXNBERa24K4CaMrrRBLggI+FCiPClymw8KogEzhLUEh?=
 =?us-ascii?Q?ImGExxzeUEIV2/gtlulS+1zQ49Jst2iASHWWPC0icVp7Lb2vANBZXZoIi9PR?=
 =?us-ascii?Q?qWnsf4TinUo446Ysm+jC22QE7FY9SgGDMfWrKXXsp6X2FBXYz6s8huxQiwd3?=
 =?us-ascii?Q?JMOeRKTPYBIfVtQ29VeLabI+FQeFkScCJJEDqffmm88CPRCUV8B9FFaaUZS3?=
 =?us-ascii?Q?9SDDYG2B4aYuz1zMLM7MTiM8dN0nHUcsCwVsIg4xzvsAZ/weWzf71nl4TY2O?=
 =?us-ascii?Q?OutVMbLftpE4JjUWKXYJQaPXUTTFSw6f6Kwe2jaIzzos32NLVGW1gA0OLgwz?=
 =?us-ascii?Q?ccSEghOP6N7wlAZfQXlS+Y8GMWrrRiSBu78NLl3dcm8yv2gSsc4SFRLTHLJl?=
 =?us-ascii?Q?rdDZ5/Kll7ovlGpSFn4nmcbN1Om/i/npY9gwnInNTqQXpGHRBltT8vVUxI5+?=
 =?us-ascii?Q?Se+0aeDwKEVl43v1+4lqCBjDwitCbg+9wuW7BKIc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587dfdd9-d5b9-418a-f879-08dbcec0c4c3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 03:25:53.6139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RalCAMpHBxsOagrM6KcZdBDjb6ch3CkpEkXhIdxu42oXs9na8tnMMEXzDvHOsEnYP5mbb00Bdjdil+izN/heKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8515
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

We find a glitch when config the pad as output high. To avoid this
glitch, move the data value setting before direction config in the
function vf610_gpio_direction_output().

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 77d5b8dd2bd5..444501c56a3b 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -140,14 +140,14 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 	unsigned long mask = BIT(gpio);
 	u32 val;
 
+	vf610_gpio_set(chip, gpio, value);
+
 	if (port->sdata->have_paddr) {
 		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
 		val |= mask;
 		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
 	}
 
-	vf610_gpio_set(chip, gpio, value);
-
 	return pinctrl_gpio_direction_output(chip->base + gpio);
 }
 
-- 
2.34.1

