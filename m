Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C403088BD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jan 2021 13:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbhA2MAE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jan 2021 07:00:04 -0500
Received: from mail-bn8nam11on2064.outbound.protection.outlook.com ([40.107.236.64]:31329
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231887AbhA2L54 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Jan 2021 06:57:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZI5vXOAdPAKD5Kfk0VE9sXDetYUjalUxvT3MSqDLqhH9r9svTZiCOOqqzQnzXDlnMKSIF1we3IP229o5ziiBAscDjbUuWRlUSb/L7HkyaA1rE06cjY3D7I3wV6xI+3atclYiaFczTRSsfvHn0wFvOWrMAC7T8i98AjIW5AFji0fQ+WyyjuW9+WdQd769ugvrpONjUwLSXXPolNTisVHI9ahjzXah/KW2CpAM+Jgl7bC9WmCNzOU2Hgg+Cvj8+PToaiHI9aM2EZGsBDUcgBH8npwd1WN6Q0qjTem6VW0sgtXKizHdtrPxAzxNtS2WGGZegDtk+IxC012CEON0XZpVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPcVxT46kbKjsdaZMB7ygUpTjj0gwugh/kjWTnKjNoA=;
 b=PINIETzaC96IVoXLkUBQnTHPUtxZFNLtH5UB0MwOsuFIM+DbU+0rxREmmEpf6RV//9n4uq+c4PhlySnYqiKG9tK6UEkaj1ULj4qSxCrDJ+BI2Ibdf5gW8ARzua4avDPBe7f76SOvVKmXZmMOwfGX3iDkFXDKcwUvFvv9iwDWHCs4Jhv3/L5DS6OA6f0HgEAAuLP1Z8LjK1Q3MBHHedIpr5KOWLdOesLNWdnsAa0GTQxD2CwX7A+FSKkDax3aDDJFsbFI9ZtCZBjsSgE1qNsAwzMaY501LxDLdDEeQniIdeDPQ4df5/SYoS8gF17TGvzfWzprkJKx27kZzaEqrMcVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPcVxT46kbKjsdaZMB7ygUpTjj0gwugh/kjWTnKjNoA=;
 b=kYgYttG2Z110oxeQwViH8URPi+efESTwpBjmzU97J7qPKtOnJJDavkE5mnrNte/pWAPcWJg+F2HqXfE6UNG5jDOfW1vAgfIX/jxUFlLR1cdqPvgRJ3BCahcoszS+9O1mstnV6h5zFPPxol7r1FughqkTI+we+JNYUsYUuLYNnWE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR11MB2040.namprd11.prod.outlook.com (2603:10b6:903:29::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Fri, 29 Jan
 2021 08:20:02 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0%7]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 08:20:02 +0000
From:   quanyang.wang@windriver.com
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: free device name on error path to fix kmemleak
Date:   Fri, 29 Jan 2021 16:19:17 +0800
Message-Id: <20210129081917.1808218-1-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:203:c8::15) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qwang2-d1.wrs.com (60.247.85.82) by HKAPR03CA0010.apcprd03.prod.outlook.com (2603:1096:203:c8::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.10 via Frontend Transport; Fri, 29 Jan 2021 08:20:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 351c721e-6b29-4bb5-8846-08d8c42eac82
X-MS-TrafficTypeDiagnostic: CY4PR11MB2040:
X-Microsoft-Antispam-PRVS: <CY4PR11MB20406BF4212B6D538FF83B72F0B99@CY4PR11MB2040.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YG/HqkXteoGAEYmkv+lUaMQl7FqxgNmBbM+q63NLTZnX8GqlEnOhJ4il0rR1tzTaRgONQUzoLnhL1l3gWh0LL2kIGCgcFjNWU8aUSsZ8H4q2dCr0hc4XagAz5ZxkPd4itiqe4OJFfK6FnXh5Hpx2e8DwioJUNXE3luSPfocchxCKzgPRRZ96uBqH1+aQIx0vL65AxesvK75iLfLFO9OKgmK1wev9kPgzS6MZdrviR6yRy5MNXJZC/sR04zDuYj7cFNl3LwLvq1VB0dy1+TFSh+lDU1tARNln2/TFsoeRkz7dE0bA0D+/Xp4itaI6Fn5RMuG05bU1zsaSCulmOi3X/eSoZUFyjdunGZyr+HBcdnwtfL44sikcMUBPtyB8uaF4ywsbZa/mKWXKfmiKBZE3j34aqNhr3b0acHbyPol936x/SovzPQvc6lxtlJ0E6EyThc5ydXqmUm41Jle7BIF+llnlcQEAzXnAbWc9GKs9Q4eCenAadCKt6IMrD2wJJPzvHQeBQO8RvnHzMqVV0O8ClA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0071.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(346002)(366004)(136003)(6506007)(6512007)(9686003)(8936002)(478600001)(6666004)(36756003)(956004)(5660300002)(2616005)(86362001)(6486002)(8676002)(186003)(110136005)(66476007)(66556008)(1076003)(16526019)(4326008)(2906002)(52116002)(66946007)(83380400001)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4tmR6E6UzePxC7jB8Lu5PmGiGXODUvSoYwhkbbtuDkUu68ezPQ6NgIaSeUuf?=
 =?us-ascii?Q?RMUqQelIgudQ6C0zqY32tIXtxTqZO5WSpmLxrUGr3sDYw/gbCdrrW0kkd9My?=
 =?us-ascii?Q?0geTLpAuCmEzHr2eKqGEBg7XIQdMqkq1fwiA7E2cSk9vAk+609TCH0RJRH8G?=
 =?us-ascii?Q?kiBVSPLPS6QCxze8neHBi+G3sc9yYWzynePLgfB4El+JBGL8H+mQwz3NL+cG?=
 =?us-ascii?Q?2gdEt0DQ+TLGxmovZzBKSoxfi1bgkaxxuzwomYRFZOWzAdWs5yVE5HcDXehc?=
 =?us-ascii?Q?ESRXUP0dU+EhYJmaGp4GhMqVGfXF2xCCGgJknyPsiBKPkAwueS7lHP9XYu3o?=
 =?us-ascii?Q?UUqWwbY8xANtYqThknh0jIDMgd4CW6NDhQixkEtpsnhvTrIyW8j4x6uXPpKQ?=
 =?us-ascii?Q?fXlTZWqiJ2hBDpbt0xV3IW/MAAsIxR7yYf7vbkrqf/0IZBZWiaFFbQNSe0CY?=
 =?us-ascii?Q?f+nd3R3MSaDHo06YA/WmGSsAnKQsHY14ij5yzbYTCGOEhXy/7RrpeF+ZyGzJ?=
 =?us-ascii?Q?9OV+6coLQJrA0PEtUVe5UMeGZ4RVr9aX1ahBnI6vYBUjP3p6mleup5xCa3Jv?=
 =?us-ascii?Q?UpEb2r1fU4lZbH6VHRgAs2pMF9kuGTEL+wxwZaBeEsG3/UGaIinUmpZENEGy?=
 =?us-ascii?Q?iBuIN/B7e4iVpsGqKXlXibyrCjUZUcXUnTlf7K03ahBbdoPanaCHit4d+/DE?=
 =?us-ascii?Q?38Mgq/JW/FWRgWQU+w4Bmtjgu+PgpK1/78lUgPerTigM7mTNGseu7VKr947W?=
 =?us-ascii?Q?CbAw5XF4uXv6F40D/I1z/R5OJcisWYFafeqQ3oFx5waqRA88UbXSmg52TEgn?=
 =?us-ascii?Q?gdd2NSMDmaRSSsYYM/CALjyqN330nmcHRAZrOkn8gTxlsZulFkO3Av2X6jQv?=
 =?us-ascii?Q?auQEQjtFle93NOIUb4mqnEaWdBq2pWxt0cWrZGXPQKcisbF+agOGvxunZMBJ?=
 =?us-ascii?Q?PFf+rUuaxw27zVH5kJU7dZnVbBvXgewq/TLqxhvd+PdC1Ae1BKuSXYbuu6oW?=
 =?us-ascii?Q?zl7vcPS6Wbg4ZEmjXI0YBP7vJFZwOclyMTFcOkSvVBY5MoxHupNxOL3cEqcV?=
 =?us-ascii?Q?HCPD3Ijh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351c721e-6b29-4bb5-8846-08d8c42eac82
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:20:01.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPMJZYJO6PBBpeC6tr6Yema3E8BnMai+76ilSZJef1ShcHD58k6Aox+bvMogCDynJOINY9a/jfMiux29Gy1UE0WKHtgr84vzmmunNqHDoi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2040
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Quanyang Wang <quanyang.wang@windriver.com>

In gpiochip_add_data_with_key, we should check the return value of
dev_set_name to ensure that device name is allocated successfully
and then add a label on the error path to free device name to fix
kmemleak as below:

unreferenced object 0xc2d6fc40 (size 64):
  comm "kworker/0:1", pid 16, jiffies 4294937425 (age 65.120s)
  hex dump (first 32 bytes):
    67 70 69 6f 63 68 69 70 30 00 1a c0 54 63 1a c0  gpiochip0...Tc..
    0c ed 84 c0 48 ed 84 c0 3c ee 84 c0 10 00 00 00  ....H...<.......
  backtrace:
    [<962810f7>] kobject_set_name_vargs+0x2c/0xa0
    [<f50797e6>] dev_set_name+0x2c/0x5c
    [<94abbca9>] gpiochip_add_data_with_key+0xfc/0xce8
    [<5c4193e0>] omap_gpio_probe+0x33c/0x68c
    [<3402f137>] platform_probe+0x58/0xb8
    [<7421e210>] really_probe+0xec/0x3b4
    [<000f8ada>] driver_probe_device+0x58/0xb4
    [<67e0f7f7>] bus_for_each_drv+0x80/0xd0
    [<4de545dc>] __device_attach+0xe8/0x15c
    [<2e4431e7>] bus_probe_device+0x84/0x8c
    [<c18b1de9>] device_add+0x384/0x7c0
    [<5aff2995>] of_platform_device_create_pdata+0x8c/0xb8
    [<061c3483>] of_platform_bus_create+0x198/0x230
    [<5ee6d42a>] of_platform_populate+0x60/0xb8
    [<2647300f>] sysc_probe+0xd18/0x135c
    [<3402f137>] platform_probe+0x58/0xb8

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
 drivers/gpio/gpiolib.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7e1ad4d40e0a..091e00f2e0a9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -603,7 +603,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		ret = gdev->id;
 		goto err_free_gdev;
 	}
-	dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
+
+	ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
+	if (ret)
+		goto err_free_ida;
+
 	device_initialize(&gdev->dev);
 	dev_set_drvdata(&gdev->dev, gdev);
 	if (gc->parent && gc->parent->driver)
@@ -617,7 +621,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gdev->descs = kcalloc(gc->ngpio, sizeof(gdev->descs[0]), GFP_KERNEL);
 	if (!gdev->descs) {
 		ret = -ENOMEM;
-		goto err_free_ida;
+		goto err_free_dev_name;
 	}
 
 	if (gc->ngpio == 0) {
@@ -768,6 +772,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	kfree_const(gdev->label);
 err_free_descs:
 	kfree(gdev->descs);
+err_free_dev_name:
+	kfree(dev_name(&gdev->dev));
 err_free_ida:
 	ida_free(&gpio_ida, gdev->id);
 err_free_gdev:
-- 
2.25.1

