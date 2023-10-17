Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF5A7CB942
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 05:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbjJQDZ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 23:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbjJQDZ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 23:25:57 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2041.outbound.protection.outlook.com [40.107.6.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152099F
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 20:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3RKtdvA83PpnQ8SmxK0sQCEWG7BTj61d9EkrsxedZCcwPO2Z57ldQ2itigh8XYMCYeWwKNC8dcRzVC3+HjnhfIL9dGwBK5gaMkpPd6wL/KIV26EYzPN54dpwt+f9Xw8co8Gb6NJJS5150vCgDPgoAWUo/0DH4It2KQApbUzFl0GissEZTeVmVO+c4R1sJm2j7W7gpNGT+Mn/sFchXo1SQEp5ZLmKH9p8/TK8OeaBMNq589BGl57qZYNiBlcH/hI51VIoRsoFW6kLE8LUH24FlRS4AuDG3G2NPELd0GjbxBz6XG6dUmfAxDWkrIR0XAzP90LFh72ETsEjDoo+fOqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhYRKhos8bjI9tfnu5ukcLa1FX+xt5JSlluvPGkLNCM=;
 b=ERscxt1UuMsS7+ovF+y7DuTCfOK6HvQcqCnpmQfQPldp63lH+9tPHMZ3JkF2CSibYibGU+L2AuwfUUr2kz3JK7LIVg2VI8Tahb7r4mCVVM/JV1TxV72+Uj2wh4Te643KDstnjRhna4DQo0b+YxDMi9FQhDCdBs/cp/ePVqsG8AP4KUazuPU6IpvEUzgCiFbgQwvzNmCVWejQlIylIj+4xaQRigLOjBwaZY73sQoyY+bNa+FifKGDIw69/7yHV1XE6IK9PE+lDSrB4Pt/tRgmjcDHKH4rm/ir1VXWCo/+U8waVZZ3wzGDZPPAx+YRrPh1kJ5zTPKa0yGDxAgi/vqNNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhYRKhos8bjI9tfnu5ukcLa1FX+xt5JSlluvPGkLNCM=;
 b=L2K6RxUH9f1gDqWmPjw5BQTPvMTeHrL4oNuuAF0j05OqD8vDYKp1zLWIKwWrFvnXSBhnwrgIyH6iIhNfti+wS8/wfyXzd9OvQTYIYBb9xLk1oknKRxQfaHHMTP6j5+p2FUir96ZMAdxdwQy0di8VEH7ZBVlmWizr8Umi5oJJG+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 AS8PR04MB8515.eurprd04.prod.outlook.com (2603:10a6:20b:342::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 03:25:50 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 03:25:50 +0000
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     andy@kernel.org, haibo.chen@nxp.com, linux-gpio@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 1/2] gpio: vf610: mask the gpio irq in system suspend and support wakeup
Date:   Tue, 17 Oct 2023 11:30:38 +0800
Message-Id: <20231017033039.1245959-1-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To DB7PR04MB4010.eurprd04.prod.outlook.com
 (2603:10a6:5:21::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4010:EE_|AS8PR04MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 259f0f83-51ce-46f4-d6e3-08dbcec0c2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bYB1RV7hk9AzCFu99cOBQt1WF9CRNLkYSl6ReneAlQMGSo/uLjcizy2O63mH/YvEEMQthAaO+YtKzxbCOlzhgUwr4//HQ2PtVyUuKbQ8qy0i0uWgiv33WRm16zZa+SYjKnz/zhQfdpLf6P/l/Br+BUwFXYrbYzWe2mPR6nr18JGtp8LXyxgNCUAlQWGuKmJHUn/t0rodugiQmGX/0YTknd1b7HPDrnQAI62xKck0t5v9oyKvXpV9sfJ02xfwcIAKMCqL0UwiytgpRvkHbCaoK86c3ExcQESURLg2WD+wyQgo4bhN0OXTfE5DEAuIHlgva6fIcjzoCpN5KSl+yEvw4yAnL1uJ5UV09wn9OYaOhgYlbbVtpr5nXr1JV/XF3HwokxpohbkE1KXhnHc7Nmcl9arr7Ofd8cmjmSpDiaq3roLlEtx2Uc2eOpMsS0zRP6oaCaiy45EDoo2sMctinRGS9LoP6rXiOos3xjvgq6xAd0fvd5UuhPHOoZ8xkIeubScZznro6bntzmtgYnqguAuKmDLN7/5mUNPP1GjX/DpzrnDRTI65YZbgXjzpyK/TEnw4vs5nXMTp04TUJKnPaoCql6+LVrjvpQuWvC1PkMlPqZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(6666004)(9686003)(38350700005)(6512007)(15650500001)(8936002)(8676002)(5660300002)(4326008)(41300700001)(316002)(66556008)(66476007)(66946007)(6486002)(478600001)(38100700002)(6506007)(52116002)(83380400001)(86362001)(36756003)(1076003)(26005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eUJ4gnkV8S+6R/y73fcf8oaByTJn95vm/Ri3sfWO6tkormbF6nnN60tba3sG?=
 =?us-ascii?Q?nwEltNNhOJLWeHXgJk0Qi902DWW3bodvqGMPYa5050A+6rTvEqLgBIItOZcn?=
 =?us-ascii?Q?Rq/f0Bd2w6Oe99yHCGIG/p/5pYId+xvFNyiASRhUH3ivae/AQNRVHdkunFD9?=
 =?us-ascii?Q?OImBGgrxSFwC/1teNa0sDxK6SG7LYhHL9bO6PvAYse/VMT3FVf2WBAT7U86R?=
 =?us-ascii?Q?OXXB/ja4E7rapdjA0jViRVjT7W0Le+aNt2w5K5aStT2uKXL/Cz80ufKkaen8?=
 =?us-ascii?Q?t1YbHnJ4uLzXiCwdeb726XpJlZwxuIYhkRXEg648K+3rTIhVheY4u4UJml6O?=
 =?us-ascii?Q?JNRFLRyYqn3UujwrfmgxVyokadrD9ng72mPD0zRmbfa/rW5ajuA0qJqdXSoo?=
 =?us-ascii?Q?L7fMHdDASgSYjVLYhWKRvgXe0yCpIajl0nRngIbhEEyUJWT1zUnqUaXituq+?=
 =?us-ascii?Q?XDpX6EPVL6dSWFCuMS5n4mA/CARTNOJZj7snPctrIikZFfFx09xkbrSKTYKd?=
 =?us-ascii?Q?/5giDNmONwmw4FWGmhjIfM8ce0mB/iBoLMfaoZesISXZCHrN71CmF9+pYXU8?=
 =?us-ascii?Q?/Qk6QRGLEkVxkFn79Mp9p878OpAAATHjG1J3UNuxtnE5CiLbeUxWINrkXbol?=
 =?us-ascii?Q?mSki/iAuIhS3q6s0XIB0jtD2mGhGuevipCeEtgNoEfEHe9327pgMyO2akJ9V?=
 =?us-ascii?Q?4uW/TYEdrUYFsgZbCD8Ocz1H3qEQsxwgmAcqmDnj+xRPFCwYrCWlhZDGNueb?=
 =?us-ascii?Q?QJTqaFUQan8nuXBj6rGEbvK9qgOnCIHi2qRr9PDdBBYLqpq49TjFn4Y0x8A3?=
 =?us-ascii?Q?ipDbuw9Iz6rJbMlXHkL9ywA+9tPCrCLxSdgpzT+QJJU+nXJes5rVwsGFFe7r?=
 =?us-ascii?Q?C1hnaloK+w+xs4SPDMAXZB2MyCfhE2ESUYEQqMQFM+3Grw5852wnFC23Dw4i?=
 =?us-ascii?Q?jFyBew8JA6+9EcLqsOAzNjIl+WKSxB0LUPydvnxy1pVd5FM93ZdZlnUvNXIN?=
 =?us-ascii?Q?IXeOZ5PIjjmN0cJYN0M8Ky7mkKpeBO8k5gqLJsNs6L4paVZpABkvMtT9VtUs?=
 =?us-ascii?Q?GXrjdGnpB34yVC4mMQ8lpNF2stTGZxIBjs/HbdQt4gTc9fUuOcz8v3kYTW2C?=
 =?us-ascii?Q?Vy+xXgXIGeMQ7gWCqMZF9TBEBfn8a7fCiRfx/wt1ReA24nLBz3lohOAZVFdB?=
 =?us-ascii?Q?+M7wQtbpM8qHDr8rkDqsoDCs2Oiyg3YSN82ZxgfOJgYz9oUaxmySdr1NteYm?=
 =?us-ascii?Q?gKulxhFGwLNvcaZlfVLTrPx7d71dBsCXiID5fupAkoVnybANwZRitZiMECNe?=
 =?us-ascii?Q?ew7D/a6gCmfE8k2iCcAhbGoCaaCtzC1ayHzc0t/0gzlTbW+2cMbEHeYPWcwk?=
 =?us-ascii?Q?491fNa8obv4ohiD17Q/hQK/Sazc4EA/eDVaEh+Cb9d97wOOI4t+lPgOLnWrP?=
 =?us-ascii?Q?LY4SRJQyphiyQNP6+uRPFA7HRJo0Pu4Vv4pnUL+QhBeIs3JjiIWVsAKxSYnc?=
 =?us-ascii?Q?6NPB2n09OTydWGps2CwEBozKdcT7yAwBRgkiiFn/psLJ548mhbVTdfWTJ+Xw?=
 =?us-ascii?Q?jI893steZxWXXI1vLTfwJHrkUxwQKDr5JEKlo7Qi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259f0f83-51ce-46f4-d6e3-08dbcec0c2b9
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 03:25:50.2710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2cFbSa7bVejcJuy0zTVw3A1CuSngnZ0RZavJBGOESf4MgqhJhfAfB2GW6tjIesK7UJq9FeI7BuEwJ5l6OeBnA==
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

Add flag IRQCHIP_MASK_ON_SUSPEND to make sure gpio irq is masked on
suspend, if lack this flag, current irq arctitecture will not mask
the irq, and these unmasked gpio irq will wrongly wakeup the system
even they are not config as wakeup source.

Also add flag IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND to make sure the gpio
irq which is configed as wakeup source can work as expect.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index a89ae84a1fa0..77d5b8dd2bd5 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -260,7 +260,8 @@ static const struct irq_chip vf610_irqchip = {
 	.irq_unmask = vf610_gpio_irq_unmask,
 	.irq_set_type = vf610_gpio_irq_set_type,
 	.irq_set_wake = vf610_gpio_irq_set_wake,
-	.flags = IRQCHIP_IMMUTABLE,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND
+			| IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
-- 
2.34.1

