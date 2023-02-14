Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5006970DB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Feb 2023 23:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjBNWrE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Feb 2023 17:47:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjBNWrD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Feb 2023 17:47:03 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B96D2E823
        for <linux-gpio@vger.kernel.org>; Tue, 14 Feb 2023 14:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6DNYk6Jrl4awFwjZYfy2gcoSuGXVLjE3lDpO9Bo4dtg0w08B3lcoCggmWe0FKo6y+o/K8eOjhJ1jpck09AgSb6XLFCDNeUlLP9Ja3Fm7oLNq9A8udmtcb5s7Jan3jyZtZwtxMUA/g0BWQg5rEdf4XL1Nl3bkgVTYcKM5yLJJtFqwTtKBGMN6T9g8Hps7RukyV1YFi34C+zVAN42B0+QxIr3Na4EGPJVnFXh9tmysENpsgU6rZsjv39DfUMgsEa1fr7QsdLSWxV/wlAFZX7YcjHjfAM+ZOiyJB0j29YkGvlUrG3KzmWrFpsEk8/mQjG/wIwxVwUabCNXfv9QymQp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9axAYRXd4Ww3xe9TkrOcjR2jo6/18d/nHxP9tEuhwY=;
 b=KMT0K432lxvfDFDgeIwFLOg/tfdnEt5DVD/klLcnYmRBVufWx2+7lVZ59h3oq4DYYg/AGOTqtlT8PDSgg0hhcQpAOjD9kAijoZoOBe03X4RCeY1+sijj3Esl/wl5nuxiY18Kjc1Y6FqUiVC4BKCYY7K+P3vkz1u7eyIAH4qeUF2iKQWojR1FiFzuXiboWy5/SZD0Ap0YYX56LAJ4D6XMBnhqxevUa0r3VhaInuVlFf9BQsVpMzMA1H9zaMrVC9jNet8vVIWGuoxM7BiTKtgr75E0FH0Y1NgO+aAQr+lm5kYVwDD/4jDn0GB/5eGD/T7BEY3e2xMX53rvvhW0biODeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9axAYRXd4Ww3xe9TkrOcjR2jo6/18d/nHxP9tEuhwY=;
 b=OK006mmTWbxUfEtCq9MANdHqKJdvc2Yr3lsYdJzi3BC8aK19xwzgaMASJ4YjBNu4gzGyPMNgJoOLFweZjoX3h7oZa8x+qPSY61DELUCD3gtAzdNo8Y+Nv0yGamlZRhyw5mknRlR1ndZC8dK88iEYAbvWhhMF5Mtv6APpELgeEM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7680.eurprd04.prod.outlook.com (2603:10a6:102:f3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Tue, 14 Feb
 2023 22:46:59 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::31d:b51c:db92:cb15]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::31d:b51c:db92:cb15%7]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 22:46:59 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH 1/1] gpio: mxc: remove static allocation of GPIO base
Date:   Tue, 14 Feb 2023 16:46:42 -0600
Message-Id: <20230214224642.3804927-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::43) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 574c63b5-628e-457c-dbce-08db0edd6127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ny243lCq0iysQ5ROh7v3q77dj8RrpNjo4VbZhkJuy+EHc8whUD6s3CSf4rbXtwvAbkXvGL92upAdPAIHWlBwCTrpVIeR37hR/WdT9xY96OqFCTw/YYJEZYmyLsQwdzne9bZHpxzg1rSqJW088IUOt37w1LBghIJEgGykBUUWI0KPAMEm5+8Cyo7hjaEZ9n60nYvgmqttol+w1n8Bp7F/IgkQiNISp+o+WtvS0kuy3HnD6EqXfixdkQoWCQSGITsW36jDY1AWMX7EoNCrO3uCB0lk1JJ3QLw0l9XV3WrSIfi2QbnDkX/CfxA10odJQY4RoH+ld2cdavvw0+VBRJ9ddRuo6vPl8KoGyuk5x9A3DCTiUI7Fp7i9LUWpekoIJB6lsTakIDIFuiE1BRauX2kRf0MCZrAOvUDZ+72U0pTqaRhQSOU+PnhnPeXKZIAHFysdLcOerE62WXhV7x/NCT2agWdIVR0riDmsF+KTk8vLcp8UPC5/6JSEqms3F252ZSYw26FNrG5EN0kmQJOMy8D8enfSozjeFY4q4Hxujssu40aBx3tR3MfiXZt8fqb1lhS2oKcVpDWwKMW3OnRELmvVcYBzVfdoc7gkFbKKKB4cbaJ9XziMautLFUZaWpGL7dXOOaCQdVwW0auefE7rNPQOTOp2zsFDWADGETPuL2FIWltJaMY6yo5+pgV79/byK7fAZT82SV+qbpxl8Pw2320SKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199018)(26005)(6506007)(6666004)(1076003)(186003)(6512007)(52116002)(55236004)(2616005)(8676002)(110136005)(4326008)(66556008)(66946007)(6486002)(316002)(478600001)(8936002)(83380400001)(41300700001)(5660300002)(66476007)(44832011)(4744005)(2906002)(38350700002)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lXRetyBUHH4f9Rk/aOIrtrSqOQ3so/H7nMyfHN9ms0JygByb1qhnhSfa7P7Q?=
 =?us-ascii?Q?Op8QvfSDR1i+09CBI311Slq8rulJPkC3pTnNdlKFGe56ZZ572mHflkiGPBCa?=
 =?us-ascii?Q?mcYwK2c025XnGOdcnNpQI3laoUmNekOCH0PC79/sWoRDGf0KgjCudwPElcLY?=
 =?us-ascii?Q?enwTkkub6OEzEU1YH39UgMufr/IZivegxvROHAWZQIbCNJ/zVEKMK2wHIy/J?=
 =?us-ascii?Q?k3Ttw5H0Fv4/7yBDXei7zegudjFFF0TaTSd3JZFZBK+FT1ezCty8f1+nJgOR?=
 =?us-ascii?Q?Zyojrzlctw3i2U/XimQv+MEzKDn8d3Ws9OrOmx4KsYcS1y19+zYfGYD2ENmV?=
 =?us-ascii?Q?bwQvKl74oznjr5aSjeDje9cJzbx4VzKCYByoQ1Z5OY4Uk52TOyJ1p/Xcf+Tz?=
 =?us-ascii?Q?yBSjb/Xyai4rQdgLxZ2og3q7s5dpBs6pk0b2cLqB2Bx2vae+eeN46/g6JCGG?=
 =?us-ascii?Q?SUyMjvPtFSKyC10/WQkjktHWsgdbcnJ54rjwcy4c7+xD3GgWkI71u3yDflnH?=
 =?us-ascii?Q?nJh7tTK2xi25vtuLbulvba94Ydj8/yYXiWb9fgaOapkrD/J6dYIHOUEIX89K?=
 =?us-ascii?Q?3ohOuNW6zczZR3M4K4oEouclODRnA2MwA4CaDbXehKwjMPXUyUn7KHt091SF?=
 =?us-ascii?Q?ys19I76Jgbc0YC51UNMzZ0GzteYEzk+Z+iVlPRSfGdUOo5rTFPf6NWuBl7hO?=
 =?us-ascii?Q?PizUmCE8JQg1awwTGi2jc0LitHYcB7doCdRDP0RxGKWio65W41VA4mieBd9Y?=
 =?us-ascii?Q?zuVsljSw/ocW0TVZPNwiSEalcCU5DQB6pf3BoLe8o98RnGJjNPOawI26ZVx2?=
 =?us-ascii?Q?bXNCUfaiwT7Gc2e4aWpdyAX8O6R0KrVMQTlQIPL1v0Qx5/3O8MPIkQj0SWWB?=
 =?us-ascii?Q?qcYhCzVWjm73Ob3PGfRKnDcTYS/MJFw//lniEGpbz9IhDH7gQaQnxolp3oN+?=
 =?us-ascii?Q?BjstxUf7J2tWsyS0ZAGcnLD0Si7tH6u4moVYAfG0b3ANf6pLgASeAi4DhGMU?=
 =?us-ascii?Q?7uItBp22mQayXw/xnHRtmD/llBq8U9MtfpRR20Ucu1UyOm0m/tbnEqtI+LZB?=
 =?us-ascii?Q?lDeJWw3+nOaQ8hoP1ayh9VhIvgNUIUc/CE1HwuGzeNfz3R/F4fb0dmRDmkg5?=
 =?us-ascii?Q?Vk+0tSynxr3szHUogwkmaLyVJo/NVSS2C3c/it/BeExG+WnUnPGRlX0+zBGe?=
 =?us-ascii?Q?3NxmQI8JrO4N/Xs4jVPhp5jbsOPI3tWVfvpn8xKykjnRms8okBCCrcDKTnZC?=
 =?us-ascii?Q?HaaxNbPZVEwH4jdFQbLdwO3rb6sIf/4DKpYfM52vgTOAly7SGWlsAr7iFatJ?=
 =?us-ascii?Q?PP+F+IJDlg03u0Dc8m6wkkbLFOXIsBOzUpI3GQ4xkX4KMjcGH6Cq+aW0MX5M?=
 =?us-ascii?Q?Ujj4tDWvJpKt0xnXJMaaNg8MqtGDzgBr9uHM0a3c2PZ7Q23so77XBozVSrfH?=
 =?us-ascii?Q?3W9Cxg2LC5IY3C/Pk8RCkDyRdm/QNQf7AWZF8v3d4NTYin8IujCOLZm5yi0M?=
 =?us-ascii?Q?zIT08e8Vd80u6suc5aq4IXv7W2tmlf43w41CuCcJziKL3UxTasJDFYZzDPQX?=
 =?us-ascii?Q?45029q61xuFdpK3aOSYmU4Xmze2ReFjv8ihwnY30?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574c63b5-628e-457c-dbce-08db0edd6127
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 22:46:59.2851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ge9LuNhzv3jCwLhdaXDafbV2HuUd+OYl/k6LuRHGNZxrhS6sJ9RRiUkD8FpmaIhwMHjcrL05th3EyuuDPAmP/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7680
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The latest gpio driver framework will give the following warning
when it detects the static allocation of the GPIO bases.

"[    1.329312] gpio gpiochip0: Static allocation of GPIO base is
deprecated, use dynamic allocation."

This patch removes the static allocation of GPIO base to get rid
of the warning message.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index d5626c572d24..07948175441c 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -450,8 +450,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	port->gc.request = gpiochip_generic_request;
 	port->gc.free = gpiochip_generic_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
-	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
-					     pdev->id * 32;
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
 	if (err)
-- 
2.34.1

