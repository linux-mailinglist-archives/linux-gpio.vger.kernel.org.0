Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE577821C1
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 05:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbjHUDKo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Aug 2023 23:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232603AbjHUDKo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Aug 2023 23:10:44 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37CE9C
        for <linux-gpio@vger.kernel.org>; Sun, 20 Aug 2023 20:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jv8EZp2sLEY3EcVy0xYv+ssy1M593cvlNXV/Taho5maFgluDOgVkJP0JQsNXr2HR8sLZR3fpzuoU3awCK5pXfR/NRD+fhyo8VJrAOpN5AT7n6Wp8hrznTG1Bd18L9+Q+vabqW2s4/GFi3gZ8SYCrp1mmUxN/Z5XJqnAH9hp0HFCicMpXT6gXfPF3C++sofhkQDWEi61GhHk1j8+dzPfNxOvopf4cHdWjjVTUCilqL/u9IeEcB+iDSpQyjMRLzWxvUh4p+he0MAvQ0kS+FD4GCFEIuDlRifBXfCchdRynZERJvQY3a7KAd8HSU8YT1AiKtaT4SPzAMrXbtM6d3C/4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zk2oJTQR0S+BbRKb3J2N7ATcvrai2OBpRq/k2a2fiA4=;
 b=Bnz9UFUZ9RJ+D7Y3TaP9+jkT4ER3BgzAQMF+AcrFQp6wWJTLMANrgQEUNHbx8m316bqJa4zxXvh0j+Ktgcps0ABktf0egs+zTxfrYJa3dILZrj5xJel5n59dNePHFF/zEJnCRzsZvxbRzBi+l5swBnyJ3OZdE5ZYW1OQ4V1Qcin1NkfVBM5zOBxy9Ct5fsDEUZDy033Jpri4JZrUHwoRIe4vCbTx4fgjMwxb4NrlyJOcRuQrzhZbd76XCbpXhEAvz6aNFiF9bxt6g/S54au+nc9iMC97K9ZBp07fAaIpR4aY+atpZyywXrX4dD0mCL2x8e51k6RtuRspmIeSCvF+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zk2oJTQR0S+BbRKb3J2N7ATcvrai2OBpRq/k2a2fiA4=;
 b=IPrXVIDd6dCeHA3FrygKHRJmq+BugGqltWYmRlTLE542S253tfWogZB0F/LmKASw/vK49vjSBWlNqI9DEgbgoVeBCoCB7gVb2S8HtsR47Tx22xBP3zyyWYaBmbMGBi+q0DaJQEoidqx52yA2OeTDCLSXlRrlL44Jt5lBeGv6Y8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 AM0PR04MB6946.eurprd04.prod.outlook.com (2603:10a6:208:186::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 03:10:38 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::d73c:e747:3911:dcc]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::d73c:e747:3911:dcc%5]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 03:10:38 +0000
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     andy@kernel.org, haibo.chen@nxp.com, shenwei.wang@nxp.com,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH] gpio: mxc: set the port->irq high to 0 for imx2
Date:   Mon, 21 Aug 2023 11:14:43 +0800
Message-Id: <20230821031443.1443530-1-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::24)
 To DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4010:EE_|AM0PR04MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: 1baea590-0e11-451f-6d8c-08dba1f4316d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W6iTsLP+rQA8Dp8SRSQ34PmhoOrTcnKjhARlYcyYWAM7f+N+UE59BIBzBXj2qGkx+jR3HdsUWJ3BGcCfZThAr/syrRt40pMtO6yj7VhM8MOkJcDkddBnjvxDEDKRFNU0lsV3d/Y0wPgDSkegSgYdITJ3XlVwhNjlc0AXdmttsGDzRAAvhL4sXlfL2quP2iiCPEsE5ejzfdVv53PGcYLPR+WCuWyAkrTzoWOgHgQfQKqLwGbOvie6X/VbogGufwbPaqtl5i6fWyq7KiijbqQRvKx8CdA/WmhH/W5Uw321DRaqCWC9/umSkXyBojxMV7CdDuTcELpAsxxbGsLX153/QI28bnk8ULIbTQ9M5Db6IwqQNVjQZrI8sPNjoNOa6R7FFUGP+eEEtWJqzF/rFMkdH8IyQr7sVIK+fpKvHnTJhlbQ8hFg57OD1Vuf2aV/wKBfkZgtsvQzAmL5Jgkimt96nAuQRgIslxthbFARLLJbyf9PHLgO5XF/y41dnS5/XksQow9KxRyMTecxaAAgIXu2hNYVYFpAkif67wCilC695za1FWc/CCGpOu1DPwdRk+pX0iid+9xaGGUsBWCWmLAsoO3g5yv/jTNCmQzMAkSbBd2oD3sNZk2rPJRVxSEacqOa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(66476007)(66556008)(66946007)(316002)(9686003)(6512007)(8676002)(8936002)(2616005)(4326008)(1076003)(41300700001)(36756003)(478600001)(6666004)(38100700002)(38350700002)(52116002)(6506007)(6486002)(4744005)(2906002)(83380400001)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H7PXIyZzo1z/mMfMb1yDRi0LnhcTLSlaKReX+0JqLLaS8/1qEvT17jBgLdZJ?=
 =?us-ascii?Q?raTIDpIrWM0WUVBVrUGubSDGHvylsLTnIUBNgK1vxI3rQ+k60LHpRJvHXFRZ?=
 =?us-ascii?Q?m2A1tEkCqh6M4uQjslTqPTq8G3x3YqRPX6UOJrvJ9NpagjFlxwnj845Ci3iQ?=
 =?us-ascii?Q?Qj6NQ/BFiPQHpPJvq+NbPQFewi3b4psG6Y0SzSOpYUs5E45rsVOXVeH8/PHN?=
 =?us-ascii?Q?e89IvQxOTxNnTnufobyqcGFc0Qekyfu6Q9oTxERkVPfSatFnLs/PXmZWnIYG?=
 =?us-ascii?Q?SWu0rKecaDe2RSDu/VDtDPM1GNTECLO5MJC/PII7M6Wq5jwZJnB5Ra/jppyw?=
 =?us-ascii?Q?EjD1Xj3Kui5q6m0LP3eq4UmC/wlJgbLks5r1nbyqqTlIU/UtJqgptRu1yjBj?=
 =?us-ascii?Q?ivqfS5jN9G6VxrZNT0OE2mukmEPsMzSK++TyUqTjlRx4f63lGFdA44lQOMGt?=
 =?us-ascii?Q?MXhat1ZoTCcUvZW8u6n6F4smpBeqXSLeoPbBhWM4CUcFmOfRTEd1AsiFsBjs?=
 =?us-ascii?Q?zDNUJVuq4yvwJ7T1EOHI37yYCcGGEtZqZ52qA2+Pcn80JNzIEEI3cbax65g/?=
 =?us-ascii?Q?cDFhnkfpP9eZoZi4MhKM/HalEhIzwTXwVI9G4U3JZiOd3Qt5nqqgBK3GFDSl?=
 =?us-ascii?Q?KUk+GO4MkT3AHGIfZjFH4kdNuZI61fsi3hm1FPp6aTAkzJBx7VtXYzkpurS+?=
 =?us-ascii?Q?qYvejlh0sKtXarMEROD8SKBpsa8m0cFJ7dUnb7w6e/khL4D/5NhTExtVnaoM?=
 =?us-ascii?Q?/53vGBbIgEwXmbv9P3edWhajqf13jArHSdCGRe/XS/ffoijUSDBUNyYkrQjO?=
 =?us-ascii?Q?rohVsQhT/Ce2v+iFpMRgGj/N6tRnMYltsTnuNIZTX3MwTr4uwDbgb7Zl84nv?=
 =?us-ascii?Q?KNcy2FvJW2Cbov/c+AXZ9rTrKyaT/zeCkmpWZyezANdtIzo5JNP4bH3jKVIH?=
 =?us-ascii?Q?kDJrXk2yjOQrUdz/r1gEla2mVIq3SRrFGFCvUrwcxB8tGju6I+qIa/lam2in?=
 =?us-ascii?Q?peSmHwTqtCpESdyc/J5kIwa5eSUwCGQAnaL0n9rlabDcyzKSNSSlvEu4n50B?=
 =?us-ascii?Q?EpkvqOtKF/C8wyaK7SHd3zfLaIYstVIuyzmaCtweXed6IwNEXujeccjOZ53h?=
 =?us-ascii?Q?5Y4pgWixoTY4hZ/fsXF9uaWOPnO/zANPVgLmjN1taxqD7W3+p7pxBTqwu72o?=
 =?us-ascii?Q?CPozCfkfgm8/wgPdXsAp1HjmCiioLG/m1S4ckPf6uzlGci317ssHWFg6UnZv?=
 =?us-ascii?Q?PgPjr3AkWW6ufTBWwTvGUQjuk2WivvE1WcF10ZH5FNYOpVtd1J2puSx6mFhU?=
 =?us-ascii?Q?FZV0KvYih3LDZLe5RgVl6Gd386oYySqfvSzjpOdF7krwmzA2lxBKg1dgzfvA?=
 =?us-ascii?Q?/9/Bi9ggo1aFSswQi7AkRncFhyDNEKHbrN6+k50OWM/mwZ9qqKNjywFrzO+f?=
 =?us-ascii?Q?/FT0j1OMhB1wCKTqIYOJ3WQynpViaVTz+jU9QIhDCsd9bLDA8G4pUFFXR1/6?=
 =?us-ascii?Q?2cbzPLercwCWI+mstPEX11Srq8nWbrp4CXIzZH02uw3BE6HNW+TvaskaNxGo?=
 =?us-ascii?Q?7sjmxDA40X+kRO7wxZoDp3xmaI/5/9PYGEpov3vS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1baea590-0e11-451f-6d8c-08dba1f4316d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 03:10:38.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfXAMV/6m7BmAIYi7t1a1Q0QfYttRt37d8ChqJZNA3DTg3L3/DfJB5MR1zc/rqimgxSZGvwlAAoP/n/hYmhMfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6946
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

MX2 has one interrupt for all gpio ports, so do not need the value
port->irq_high, need to set to 0. Current setting is -1, which will
meet issue in gpio_set_wake_irq().

Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspend")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 004c6ad7ce52..c96602da7e3a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -479,7 +479,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		 * the handler is needed only once, but doing it for every port
 		 * is more robust and easier.
 		 */
-		port->irq_high = -1;
+		port->irq_high = 0;
 		port->mx_irq_handler = mx2_gpio_irq_handler;
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
-- 
2.34.1

