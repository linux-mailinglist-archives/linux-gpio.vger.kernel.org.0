Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D70129D6E5
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732291AbgJ1WTH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:19:07 -0400
Received: from mail-co1nam11on2054.outbound.protection.outlook.com ([40.107.220.54]:59049
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732283AbgJ1WSs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Oct 2020 18:18:48 -0400
Received: from SN6PR11MB3039.namprd11.prod.outlook.com (2603:10b6:805:d3::27)
 by SN6PR11MB2992.namprd11.prod.outlook.com (2603:10b6:805:d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 10:46:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JL91I/ietm3n0D3mewB7hXnpgJIfuzCdlCbU8aPWKm6RVMmcvaWKsb0vLK7Xk/1mtvvjCpu3S57yjs7H3s6VEN/qY0UzfayqwTcb5l2vp4qxb4HDbLbjEDS9/C/1/vhK2QbYC1wOd3Tmj9Z0W5NEzuP69xE7oMBmUNK91bnvMXa3wsjiabmQQrPCN42d3bw8PmmTocZg9KNvnpDeqqmC5f3bNDc5swxq6QLnIOdSh1k+RzKk1alIpeGWqMDunAjryTWx9O9r4DdtHRos77V8hmLx6QRRYe7Vx/mryIdkNiFGPgTkvSMupI+gszMWZKtFZEDoXrOp724I1Boqd3y2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3GFPI16VbUrPUbo2XfBr65/q73gt0rEY7Bh33Dk7Y4=;
 b=SFlB1XadtpUnqmR+6G3RqA594bNagk6jpHhL+JioEwLIjYrnoxZ1dYP1tw0sB/+1wXyS7P9c2HijxIlSEaPql0gm4oLDpH0YzgsEbl8EU3kjoY8BPkF72VGC6RhEUv6Rzltfa4h/KW0uCHIAfCDP0dNedqZxN46PqjwU8snwC9LGro4pIUw/HPcTtv19DS2V7W7HYzSZNR97vS5HN1FwEC5OZ3qZbVPxK2BsaqLKOkRYGnDzKn92BsmXzrV6JURby+Gx6ZlJOCy0y3FhQYjLG1gCM0JapHKaMj+zbca7S4NUfxEZzG032Q3Rt52x13hkNIxpTXPLnG1OLekmvMDn7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3GFPI16VbUrPUbo2XfBr65/q73gt0rEY7Bh33Dk7Y4=;
 b=nesU95Z3UMroqrLvfOK9+vKcp/JvGEjyQmMAs5Vo6MFOLA1pmbCSp2eP/IyGYRo4mKZa9j7s8jhBE/10nbLJwlxhdFnmpsj2BrW92dhx97gGtktBfe9yM0JOp9BjuYK2UVXcFNBPe8e1Ah2xfreGN2D5ge0XpxLPu4Jejdm6iOQ=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
 by SN6PR11MB3039.namprd11.prod.outlook.com (2603:10b6:805:d3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Wed, 28 Oct
 2020 10:40:20 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::4dbe:2ab5:9b68:a966]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::4dbe:2ab5:9b68:a966%7]) with mapi id 15.20.3499.018; Wed, 28 Oct 2020
 10:40:20 +0000
From:   He Zhe <zhe.he@windriver.com>
To:     linus.walleij@linaro.org, drew@beagleboard.org,
        andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhe.he@windriver.com
Subject: [PATCH] pinctrl: core: Add missing #ifdef CONFIG_GPIOLIB
Date:   Wed, 28 Oct 2020 18:39:21 +0800
Message-Id: <20201028103921.22486-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0021.apcprd03.prod.outlook.com
 (2603:1096:202::31) To SN6PR11MB3360.namprd11.prod.outlook.com
 (2603:10b6:805:c8::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR0302CA0021.apcprd03.prod.outlook.com (2603:1096:202::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.10 via Frontend Transport; Wed, 28 Oct 2020 10:40:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 859e2646-cdd3-40ca-8a1c-08d87b2dde03
X-MS-TrafficTypeDiagnostic: SN6PR11MB3039:|SN6PR11MB2992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR11MB303997B6FBF79D9D285233748F170@SN6PR11MB3039.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:15;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8PECX4egtJrTu1ToAg3arYWq6eREg+shheniC5u+FRLkF9GVxUJsOlDPL/kmj8IHaHbuSiYK0qI0wtZvJS7euaqT7oPvt7OHxr3irwgZkegL4K/Q5eHQJb2grBFsmr8QaLiQSyQsOMaq1UeX1eyVV1mn29nj2ZthQbFZ6Czs5m23Vx3ylNHqQzMuCQ+A253ZvKyz0uc8COlceqao3qM8/ryeeL8fgtAR9TVbx+DKLooXepAGu7OezQX+KJXdetLJE8JBddqgOAyDAlFATHlL5EopjTTh1WQ3DwWW+6hyb/7N9dGmJbJ/XeECW5DaUO5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3360.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39840400004)(396003)(376002)(2906002)(478600001)(2616005)(6506007)(956004)(6486002)(86362001)(316002)(52116002)(186003)(8936002)(1076003)(36756003)(16526019)(8676002)(5660300002)(26005)(66476007)(66946007)(6666004)(83380400001)(6512007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: O4fq765Fv5968WfG/kcGFf5WKGXCA/Ro0MJD3SCkErthklb3XO6lZFfKJRMVEx5q9SHIQoojVcqk8Lot8yZX6KOOXJs1MBIHTPFediow72zL86Fy+OrViVh+7Cs8XBcov36crQKKM2L0f7Au/3vVSrVjU4392TfCFLM6heZ/yo59W5bbJppMoqr4mWogXJiLGxJeP3LcgHBMe80239iAG2uHgbzjTLRl7i6YEW8kLvfVTcBYKd9og+3BsTPynk3gZYv2O3BbEzuhG3/NsdOWPjwI4xrPkLGJZE9W8+qx3PE0SODNJQH1WpGbgtqAC6e3q/Cd7P0rqT+FplYeLloK280FcIOZK8blHnA/ntrAzoQZev6jlZYxPHwg+wAmaX/irovEvtNzA5TB7u7CUNERIsrK4beSUSmALbRDsL4ifCeHc9uqM0TS4bBoCsufoUDGikOzUY9rk/r+PWyKwi8GAwDJ32j9jD3mbGYcsaNVWkhKsSND0ADVDQDVhAgS6Oi/n5dKHR0wrUByT6WFlXnzpd2QdgWg7tr1u0Mef+eZ/Mc1vABgLzZPmo7RpetoITMbRhWpCJE6BU+ZVQ6in8B0oGruihp2iYP/RP30vbh6cNsMcRHdA5rhOkXFV8P8XOmKgco9yfslOtIlF8O/fVi/Lg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 859e2646-cdd3-40ca-8a1c-08d87b2dde03
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 10:40:20.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cb+5lKesqqtyIQpLS75uhPEfNlf/5LVD1MRa8WUUUGlfgnFNIph5jYWLTU7fx6UnCHQXFRLUvEdYycCCIhIVeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3039
X-OriginatorOrg: windriver.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To fix the following build warnings when CONFIG_GPIOLIB=n.

drivers/pinctrl/core.c:1607:20: warning: unused variable 'chip' [-Wunused-variable]
 1608 |  struct gpio_chip *chip;
      |                    ^~~~
drivers/pinctrl/core.c:1606:15: warning: unused variable 'gpio_num' [-Wunused-variable]
 1607 |  unsigned int gpio_num;
      |               ^~~~~~~~
drivers/pinctrl/core.c:1605:29: warning: unused variable 'range' [-Wunused-variable]
 1606 |  struct pinctrl_gpio_range *range;
      |                             ^~~~~

Fixes: f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 drivers/pinctrl/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3663d87f51a0..9fc4433fece4 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1602,9 +1602,11 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 	struct pinctrl_dev *pctldev = s->private;
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 	unsigned i, pin;
+#ifdef CONFIG_GPIOLIB
 	struct pinctrl_gpio_range *range;
 	unsigned int gpio_num;
 	struct gpio_chip *chip;
+#endif
 
 	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
 
-- 
2.17.1

