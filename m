Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DA4681BF2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 21:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjA3U7t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 15:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjA3U7t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 15:59:49 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2073.outbound.protection.outlook.com [40.107.15.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DB6460BF
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 12:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W68FSzi5P8gr8LR4JBZ2g1CnorFiwARju3iacdVoVVhvE3BoXA6Qxf2Nmsv2cmrfZ8zAuoakzKR5Ynz6p0ZTBemPSOwkxZK/0++uRNc9c6aBe5+Rc0nqjCY0oypbh2/B7aNJIY78rD6ssHEhewAtcji02C9erpDvLuh0aHlpJpz+b7Lt/nAbpbleol7569qSnl6XoCknJtPom6Nh5RAS86fGhoo+wCzR3t4MSPVUMpTNxBl6M+clKbBVbxwUzRGSYeL45brbId7AvQCIAofTsa1stNYPGSEelLJOmicg5W1KmeXqQ9mybioq41OboLuefFtkvJ5ss4YEFlAIjw3SZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3T2dOxwELHoaPYw78qOzamikcmvEJFqEi7uh4XcyewI=;
 b=aCBoXVyyq6wSDR3kgvZnitYSWrEFR6uPorkmBx7DndphP+0b0dypV84fvSwq5SPfFzDg/4NA7eIdmj511urcNsSU5BFySQjmBuCLxUO5PZx6FqJLW6wSZ9SZ71XkCScSqZy4lzyE1g8m7xX7OGsZpHhXzcW6oo+nS+Hdz979FZoerWxeE3ygWmjFtU8HiIDCq0MjSNacYU4zzrPxDAGbli0PA0LKFZm7gOz34iUemFwLXumpQQ1ZUGkWk8I7JujR031MHehLHz+0dq4Yo+u130G0j0rVrMZUSmfDPpsiXrapxVuM85ilJR3cRNnsLWorUx4IkAgtZ1vNzE8cm5m/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T2dOxwELHoaPYw78qOzamikcmvEJFqEi7uh4XcyewI=;
 b=nVHiPm9UT6OBxfExR2maNEZH/H7O5OheA8tjBT2iU0D8QDL4DPTz/d+pugMqSA9eWCMNE51PFbCH8qB9zOfFrCTZjrewesSXesI8jfnOq9+K0q97qXYeTCIu7wIW7BDn8VwrUvK9UmJnyyPs149U4ZzEFye5I5DgmrFBne4oNoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by VI1P194MB2168.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:1c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 20:59:44 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::6322:b35d:1369:be7e]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::6322:b35d:1369:be7e%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 20:59:44 +0000
Message-ID: <77a8e6b4-15d4-da2a-4697-5181994920d4@eilabs.com>
Date:   Mon, 30 Jan 2023 21:59:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
Subject: [RFC PATCH 1/3] gpio: pca953x: Replace chip type flags with a type
 enum
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Martyn Welch <martyn.welch@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>
References: <fbd33cdb-6942-e1ac-57ad-b7f3faf7eba5@eilabs.com>
Content-Language: en-US
In-Reply-To: <fbd33cdb-6942-e1ac-57ad-b7f3faf7eba5@eilabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|VI1P194MB2168:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed25c2c-c07c-4fcc-4883-08db0304e9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3dvt3eaboWt9Ejhqj2izbJ6EnX1FpiKmYxp9PMq+h3UG0Fui6QPaL1s3k+QZeE/IjUkt+yW8kaQLSdTYG+Mpi0e4YEjNga3Dp+y9tvlPKl+Tu8+UbuBOZTwYnmK/Y3Bewkjv70Updu6vNmLn+MiEO2dyOFER31yqR0NxyYuvG88rONCDQz0tH/BKRE43+XK6W0fcW/V94RcW1tzp33M3sleYhjOhB14iieYiMpZxipT8/zsRZWKHAzaay2IhAbOJErUrWgmDGMpmA2Z+oTTklvlwevy/1USkHZqZNX57D2sAqhk2VClje5bJIQibG0t8/dgIRzQbbUDrFqaSwyMRN4gP0nhppu/fYwBIyqNjvEXLcnj5zStcFQqkhC8cyIDpI72dVp/XdjqBGp6ZV3SPEhvIdcA129zXYa2hFsu/wTg2SQB4PR/IDoII26CuGDnkroNP9b6ea8O6WbOj0F5I35Fr+JyQeMVvwsrJPVTASoOpC0kmtgCyx957yLtB9IlkE8PX90D6vVVF6JdFUBNlMWtyDHz8xcr+QjE6lE8puIlRzPoj6PTG0FtgBx1k5hJUdmoKOXZRtBM4reIU2EHcyWbm/4V9wo/+M+6Kpeu5ji9ZCnhSoxZCE+l6QXJRyveyMo5SR4wUG9aNh66x0P/2JmWH4/uruf5AWhSumC+AJ8WsqClk+lTkTnENG5vvox1XhovN0456C62sLkv5VqKSb6Bou7YC0HoTQnGmZUDU52Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(346002)(39830400003)(136003)(451199018)(7416002)(30864003)(2616005)(31696002)(66574015)(86362001)(38100700002)(83380400001)(36756003)(2906002)(6506007)(6512007)(26005)(186003)(6486002)(478600001)(31686004)(41300700001)(66946007)(4326008)(110136005)(5660300002)(8936002)(66556008)(54906003)(8676002)(316002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N254VnI0cDJpRGtaNk1oaWhScVI1bURIcTFZR3lFYnJQSklHOVFNWlJWUkhH?=
 =?utf-8?B?QTNXTE44VVprYjd2SDZscDZpY05QaHoyOVdoWWsvZ204M1FtV1BUM282NzNM?=
 =?utf-8?B?WXU1UjNmcjF5ekgyYVRFa0VzTFJqbENPYklJbHl6Nnd2d0V1NE16TXBHOUFv?=
 =?utf-8?B?T1BHOUFEWWhVMWZmNk5jTTlTUXV0WkdId1ljaVNYbTVMTDY0Y2hrVW1GSWcx?=
 =?utf-8?B?aDV2bUxYN0NHam1rVS96VGFpVkxkTGVZdWJoaWR6aEl2Y2UyUDRNdDE0clF0?=
 =?utf-8?B?OHV5OGNUWTA3SWR1N0JwQ0luVHlOZCtMdldPMGdrUDJtajN1OXVBbmxIeG9j?=
 =?utf-8?B?OTMzU0U5Tzc3WGtYZm5xZW9iZ09RVXM0ajFIT1hnU2ErVVJ1OFNmM21uVTdW?=
 =?utf-8?B?ZEdsQkxSbVBsQ2lxbkYwRVJtd2VMWkUrUlNnNDZqS1VFSVZzSG1YcE01WU5C?=
 =?utf-8?B?b0M4ZEViVC9XdWJKOWNDa09IVGFLMU9MR1VYb05laEwwUm5aVWVvOGREa25C?=
 =?utf-8?B?cnRmdmhMOFJuUWt4WFJialIzd3c3YnIvRzREZDJJa1poNG80bjRQenNvNjh1?=
 =?utf-8?B?NGxGMHJFOVRCbVAzeC8zMXl1K3owamErWEtMaUtybTdZSFo5NnRMTEM3MGFq?=
 =?utf-8?B?ckFhTjVGV3ZvL00xK2pPNmlIaDhUcTJmakNoOXZCKzBnazI0RHhOU1pLMkU3?=
 =?utf-8?B?UGZPSEhGWGZxMVJvZFlyY28yUlp5UUd0Yk1abUttSmE3eDNiRWgraFErTXBr?=
 =?utf-8?B?UjhJTmtwY21rY09iVm9NSUtwZzFCMDJQV3NucWY4VUJhcE5GamV1dG1PaTJy?=
 =?utf-8?B?MllIZzdNMGUrU2xIdW9hWDZnMk5pQWNILzhtNGlPUkZ4OUZRNEVpWXc1dU5B?=
 =?utf-8?B?N3hmd1ZwY3hnRERjSUhoekFFK3c3WmxpOERjWUJObXFST3YvV3NrWWtmMm45?=
 =?utf-8?B?YmE2L1o0T2l4UDhMb0d3MklaMlJZWkMvQ0psb0dhOFhuVkMycktYV29yR05D?=
 =?utf-8?B?ZmtGeFJrcFhyeldOSTVZMk9KbnQzSVhqTnhtd0srKzN0Rjd0YXQvT21tZ2xJ?=
 =?utf-8?B?bmFodEp0Y21uU2VMS2k1UUhpWjRHYVhZejYrNWVtRmJ1VEFuS3VmaDVtczQv?=
 =?utf-8?B?OEl6cEprSXlSekJnUVQ1d0kyZlFZU2V1NVBvUGVZOUlzbnZIaTdNM3J4ZFhx?=
 =?utf-8?B?SjRmcmN2MVZ1VEVoL2ZxKzZSSThPVlJYV3R6UE8wWExBV3lBY2Q4L1JYQkJ5?=
 =?utf-8?B?bDNPOUs1Sm1YRi9BYTE2aFJ6MmdtYnVTRWdiczJIRUtmRlR6WWh4eGxkQkZ3?=
 =?utf-8?B?VFlRZVk3bzl5NUVBeGNnUFVqNXdibTUrc3pjc21GWTVMN1JYQmxOWWVnekQv?=
 =?utf-8?B?UllySFpzTlFCbGxFTHMyK0YyYkg5MDZmYWNYVlJqR2d0cXg5U0h4ZnZhVTN4?=
 =?utf-8?B?NDlDN0ZjcmFtVDRFT09LTVFzTzh0TU0vU01ZV3hQQ3lNMnYzaVdVMW05TVlO?=
 =?utf-8?B?d2hXanJhYVZ0aWRhSDJUYklKa2xMc3F0TXl4WndXTmRqeTFtM3lCQ3pEMmhW?=
 =?utf-8?B?THcxWG5wd0Q4VDFEL2JMQlYydSt0aHgzV1pUUjB6VzV0WG1lVnp4ZUx1cmJy?=
 =?utf-8?B?bEFxRk40cTlVbmNoTUZTWE1kZjFHOUZLT3IvcStTMi9CVm5iV1RwczJJdzM3?=
 =?utf-8?B?dTlPbE1YdnpENHZWMlFmUXdMMEZLUzJ1VVdkR2tLRDFUS3JRb1hsU1pPSksx?=
 =?utf-8?B?OGdFT1BuWnh0QklKeVBlK1BRRkNWUzhheS9aWmQ5OG55RzVyYkgwUStMenp1?=
 =?utf-8?B?SUhnVmtBVndFejU2N3lDcDRlRmdNSiswbGRwY3phZFdaSEZKR1NURHc4blFy?=
 =?utf-8?B?QUw0YW05LzZqT0hQMU5jWWlUL2JEVnFuZ3pyUm9sTUp5RzgvRzZwbVJwQ3BK?=
 =?utf-8?B?Y0RhNWZXVG5BbnU1bmVUVlNVMy9TM2RWUzF4NFlkWlJ4QmwzUitQdXNzNWhn?=
 =?utf-8?B?MEQ0dm8zbTdOVTlUTmFmS2l4Umd5dFFMUXI3QXpFNmUreG9sbGxrWU5nZm4y?=
 =?utf-8?B?SHRmZDd5dVlhUlNCejQrVFFkbnZxQTE0cTd5ZTVqUnMzWGxIUmg4a2JabC9T?=
 =?utf-8?B?bGxqQ1NpZWxOVm5pd1RHMGw4YjJTYTdlOCt0V1V3RnR5Umk3c2ZST1pqUzVo?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed25c2c-c07c-4fcc-4883-08db0304e9f5
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 20:59:44.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqIGgdAlP4433J9mbZtBr4qUfRPKllh5Mz+iCViWmo+CHzF6WgF8C8eCP2XDKkteAr1XSD9wZ2eVCL0VGCtPIlWLwh92Ms4Xa55ARpZusuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P194MB2168
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver supports 8 chip types. The chip type is encoded in
driver_data so that different chip types can be handled appropriately.

Encoding the type information in separate bit flags was not too
straightforward, and it didn't make it possible to encode 8 chip
types.

Replace bit flags with a pca953x_chip_type enum. Encode this enum in
driver_data as a number. Add missing chip types based on chip functions
and register layout.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
 drivers/gpio/gpio-pca953x.c | 255 ++++++++++++++++++++----------------
 1 file changed, 143 insertions(+), 112 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index e4b7f34424e4..d6099fc18b01 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -57,60 +57,78 @@
 #define PCAL6524_OUT_INDCONF	0x2c
 #define PCAL6524_DEBOUNCE	0x2d
 
-#define PCA_GPIO_MASK		GENMASK(7, 0)
-
 #define PCAL_GPIO_MASK		GENMASK(4, 0)
 #define PCAL_PINCTRL_MASK	GENMASK(6, 5)
 
-#define PCA_INT			BIT(8)
-#define PCA_PCAL		BIT(9)
-#define PCA_LATCH_INT		(PCA_PCAL | PCA_INT)
-#define PCA953X_TYPE		BIT(12)
-#define PCA957X_TYPE		BIT(13)
-#define PCAL653X_TYPE		BIT(14)
-#define PCA_TYPE_MASK		GENMASK(15, 12)
+/*
+ * driver_data
+ *
+ *   31    24 23    16 15     8 7      0
+ *   xxxxxxxx xxxxxxxx xxxx____ ________
+ *                         ^^^^ ^^^^^^^^
+ *                         |    number of gpio lines
+ *                         chip type
+ */
+
+#define PCA_GPIO_MASK		GENMASK(7, 0)
+#define PCA_TYPE_MASK		GENMASK(11, 8)
+
+enum pca953x_chip_type {
+	TYPE_PCA953X_NOINT,
+	TYPE_PCA953X,
+	TYPE_PCA950X,
+	TYPE_PCAL953X,
+	TYPE_PCAL652X,
+	TYPE_PCAL653X,
+	TYPE_PCA957X,
+	TYPE_XRA120X,
+};
+
+/* Get chip type from driver_data */
+#define PCA_GET_TYPE(x)		(((x) & PCA_TYPE_MASK) >> 8)
 
-#define PCA_CHIP_TYPE(x)	((x) & PCA_TYPE_MASK)
+/* Set chip type in driver_data */
+#define PCA_SET_TYPE(x)		((x) << 8 & PCA_TYPE_MASK)
 
 static const struct i2c_device_id pca953x_id[] = {
-	{ "pca6408", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "pca6416", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9505", 40 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9506", 40 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9534", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "pca9535", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9536", 4  | PCA953X_TYPE, },
-	{ "pca9537", 4  | PCA953X_TYPE | PCA_INT, },
-	{ "pca9538", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "pca9539", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9554", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "pca9555", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9556", 8  | PCA953X_TYPE, },
-	{ "pca9557", 8  | PCA953X_TYPE, },
-	{ "pca9574", 8  | PCA957X_TYPE | PCA_INT, },
-	{ "pca9575", 16 | PCA957X_TYPE | PCA_INT, },
-	{ "pca9698", 40 | PCA953X_TYPE, },
-
-	{ "pcal6408", 8 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6534", 34 | PCAL653X_TYPE | PCA_LATCH_INT, },
-	{ "pcal9535", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal9554b", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
-
-	{ "max7310", 8  | PCA953X_TYPE, },
-	{ "max7312", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "max7313", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "max7315", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "max7318", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca6107", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "tca6408", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "tca6416", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "tca6424", 24 | PCA953X_TYPE | PCA_INT, },
-	{ "tca9539", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "tca9554", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "xra1202", 8  | PCA953X_TYPE },
+	{ "pca6408", 8 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "pca6416", 16 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "pca9505", 40 | PCA_SET_TYPE(TYPE_PCA950X), },
+	{ "pca9506", 40 | PCA_SET_TYPE(TYPE_PCA950X), },
+	{ "pca9534", 8 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "pca9535", 16 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "pca9536", 4 | PCA_SET_TYPE(TYPE_PCA953X_NOINT), },
+	{ "pca9537", 4 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "pca9538", 8 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "pca9539", 16 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "pca9554", 8 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "pca9555", 16 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "pca9556", 8 | PCA_SET_TYPE(TYPE_PCA953X_NOINT), },
+	{ "pca9557", 8 | PCA_SET_TYPE(TYPE_PCA953X_NOINT), },
+	{ "pca9574", 8 | PCA_SET_TYPE(TYPE_PCA957X), },
+	{ "pca9575", 16 | PCA_SET_TYPE(TYPE_PCA957X), },
+	{ "pca9698", 40 | PCA_SET_TYPE(TYPE_PCA950X), },
+
+	{ "pcal6408", 8 | PCA_SET_TYPE(TYPE_PCAL953X), },
+	{ "pcal6416", 16 | PCA_SET_TYPE(TYPE_PCAL953X), },
+	{ "pcal6524", 24 | PCA_SET_TYPE(TYPE_PCAL652X), },
+	{ "pcal6534", 34 | PCA_SET_TYPE(TYPE_PCAL653X), },
+	{ "pcal9535", 16 | PCA_SET_TYPE(TYPE_PCAL953X), },
+	{ "pcal9554b", 8 | PCA_SET_TYPE(TYPE_PCAL953X), },
+	{ "pcal9555a", 16 | PCA_SET_TYPE(TYPE_PCAL953X), },
+
+	{ "max7310", 8 | PCA_SET_TYPE(TYPE_PCA953X_NOINT), },
+	{ "max7312", 16 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "max7313", 16 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "max7315", 8 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "max7318", 16 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "pca6107", 8 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "tca6408", 8 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "tca6416", 16 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "tca6424", 24 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "tca9539", 16 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "tca9554", 8 | PCA_SET_TYPE(TYPE_PCA953X), },
+	{ "xra1202", 8 | PCA_SET_TYPE(TYPE_XRA120X) },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca953x_id);
@@ -162,7 +180,7 @@ static const struct dmi_system_id pca953x_dmi_acpi_irq_info[] = {
 #endif
 
 static const struct acpi_device_id pca953x_acpi_ids[] = {
-	{ "INT3491", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ "INT3491", 16 | PCA_SET_TYPE(TYPE_PCAL953X), },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
@@ -214,6 +232,7 @@ struct pca953x_chip {
 	unsigned long driver_data;
 	struct regulator *regulator;
 
+	enum pca953x_chip_type type;
 	const struct pca953x_reg_config *regs;
 
 	u8 (*recalc_addr)(struct pca953x_chip *chip, int reg, int off);
@@ -221,6 +240,18 @@ struct pca953x_chip {
 			  u32 checkbank);
 };
 
+static bool pca953x_has_int(struct pca953x_chip *chip)
+{
+	return chip->type != TYPE_PCA953X_NOINT;
+}
+
+static bool pca953x_is_pcal_type(struct pca953x_chip *chip)
+{
+	return chip->type == TYPE_PCAL953X ||
+	       chip->type == TYPE_PCAL652X ||
+	       chip->type == TYPE_PCAL653X;
+}
+
 static int pca953x_bank_shift(struct pca953x_chip *chip)
 {
 	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
@@ -280,7 +311,7 @@ static bool pca953x_check_register(struct pca953x_chip *chip, unsigned int reg,
 
 	/* Special PCAL extended register check. */
 	if (reg & REG_ADDR_EXT) {
-		if (!(chip->driver_data & PCA_PCAL))
+		if (!pca953x_is_pcal_type(chip))
 			return false;
 		bank += 8;
 	}
@@ -347,7 +378,7 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	if (chip->type == TYPE_PCA957X) {
 		bank = PCA957x_BANK_INPUT | PCA957x_BANK_OUTPUT |
 		       PCA957x_BANK_POLARITY | PCA957x_BANK_CONFIG |
 		       PCA957x_BANK_BUSHOLD;
@@ -356,7 +387,7 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
 	}
 
-	if (chip->driver_data & PCA_PCAL) {
+	if (pca953x_is_pcal_type(chip)) {
 		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
 			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK |
 			PCAL9xxx_BANK_IRQ_STAT;
@@ -370,7 +401,7 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	if (chip->type == TYPE_PCA957X) {
 		bank = PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
 			PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
 	} else {
@@ -378,7 +409,7 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 			PCA953x_BANK_CONFIG;
 	}
 
-	if (chip->driver_data & PCA_PCAL)
+	if (pca953x_is_pcal_type(chip))
 		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
 			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK;
 
@@ -390,12 +421,12 @@ static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
+	if (chip->type == TYPE_PCA957X)
 		bank = PCA957x_BANK_INPUT;
 	else
 		bank = PCA953x_BANK_INPUT;
 
-	if (chip->driver_data & PCA_PCAL)
+	if (pca953x_is_pcal_type(chip))
 		bank |= PCAL9xxx_BANK_IRQ_STAT;
 
 	return chip->check_reg(chip, reg, bank);
@@ -645,7 +676,7 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
 	 * pull-up/pull-down configuration requires PCAL extended
 	 * registers
 	 */
-	if (!(chip->driver_data & PCA_PCAL))
+	if (!pca953x_is_pcal_type(chip))
 		return -ENOTSUPP;
 
 	mutex_lock(&chip->i2c_lock);
@@ -761,7 +792,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	int level;
 
-	if (chip->driver_data & PCA_PCAL) {
+	if (pca953x_is_pcal_type(chip)) {
 		/* Enable latch on interrupt-enabled inputs */
 		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 
@@ -843,7 +874,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	DECLARE_BITMAP(trigger, MAX_LINE);
 	int ret;
 
-	if (chip->driver_data & PCA_PCAL) {
+	if (pca953x_is_pcal_type(chip)) {
 		/* Read the current interrupt status from the device */
 		ret = pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
 		if (ret)
@@ -941,7 +972,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	if (irq_base == -1)
 		return 0;
 
-	if (!(chip->driver_data & PCA_INT))
+	if (!pca953x_has_int(chip))
 		return 0;
 
 	ret = pca953x_read_regs(chip, chip->regs->input, irq_stat);
@@ -987,7 +1018,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 {
 	struct i2c_client *client = chip->client;
 
-	if (client->irq && irq_base != -1 && (chip->driver_data & PCA_INT))
+	if (client->irq && irq_base != -1 && pca953x_has_int(chip))
 		dev_warn(&client->dev, "interrupt support not compiled in\n");
 
 	return 0;
@@ -1117,7 +1148,9 @@ static int pca953x_probe(struct i2c_client *client)
 
 	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
 
-	if (NBANK(chip) > 2 || PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	chip->type = PCA_GET_TYPE(chip->driver_data);
+
+	if (NBANK(chip) > 2 || chip->type == TYPE_PCA957X) {
 		dev_info(&client->dev, "using AI\n");
 		regmap_config = &pca953x_ai_i2c_regmap;
 	} else {
@@ -1125,7 +1158,7 @@ static int pca953x_probe(struct i2c_client *client)
 		regmap_config = &pca953x_i2c_regmap;
 	}
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCAL653X_TYPE) {
+	if (chip->type == TYPE_PCAL653X) {
 		chip->recalc_addr = pcal6534_recalc_addr;
 		chip->check_reg = pcal6534_check_register;
 	} else {
@@ -1164,7 +1197,7 @@ static int pca953x_probe(struct i2c_client *client)
 	/* initialize cached registers from their original values.
 	 * we can't share this chip with another i2c master.
 	 */
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	if (chip->type == TYPE_PCA957X) {
 		chip->regs = &pca957x_regs;
 		ret = device_pca957x_init(chip, invert);
 	} else {
@@ -1235,7 +1268,7 @@ static int pca953x_regcache_sync(struct device *dev)
 	}
 
 #ifdef CONFIG_GPIO_PCA953X_IRQ
-	if (chip->driver_data & PCA_PCAL) {
+	if (pca953x_is_pcal_type(chip)) {
 		regaddr = chip->recalc_addr(chip, PCAL953X_IN_LATCH, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
 					   regaddr + NBANK(chip) - 1);
@@ -1309,55 +1342,53 @@ static int pca953x_resume(struct device *dev)
 #endif
 
 /* convenience to stop overlong match-table lines */
-#define OF_653X(__nrgpio, __int) ((void *)(__nrgpio | PCAL653X_TYPE | __int))
-#define OF_953X(__nrgpio, __int) (void *)(__nrgpio | PCA953X_TYPE | __int)
-#define OF_957X(__nrgpio, __int) (void *)(__nrgpio | PCA957X_TYPE | __int)
+#define OF_DATA(__nrgpio, __type) ((void *)(__nrgpio | PCA_SET_TYPE(__type)))
 
 static const struct of_device_id pca953x_dt_ids[] = {
-	{ .compatible = "nxp,pca6408", .data = OF_953X(8, PCA_INT), },
-	{ .compatible = "nxp,pca6416", .data = OF_953X(16, PCA_INT), },
-	{ .compatible = "nxp,pca9505", .data = OF_953X(40, PCA_INT), },
-	{ .compatible = "nxp,pca9506", .data = OF_953X(40, PCA_INT), },
-	{ .compatible = "nxp,pca9534", .data = OF_953X( 8, PCA_INT), },
-	{ .compatible = "nxp,pca9535", .data = OF_953X(16, PCA_INT), },
-	{ .compatible = "nxp,pca9536", .data = OF_953X( 4, 0), },
-	{ .compatible = "nxp,pca9537", .data = OF_953X( 4, PCA_INT), },
-	{ .compatible = "nxp,pca9538", .data = OF_953X( 8, PCA_INT), },
-	{ .compatible = "nxp,pca9539", .data = OF_953X(16, PCA_INT), },
-	{ .compatible = "nxp,pca9554", .data = OF_953X( 8, PCA_INT), },
-	{ .compatible = "nxp,pca9555", .data = OF_953X(16, PCA_INT), },
-	{ .compatible = "nxp,pca9556", .data = OF_953X( 8, 0), },
-	{ .compatible = "nxp,pca9557", .data = OF_953X( 8, 0), },
-	{ .compatible = "nxp,pca9574", .data = OF_957X( 8, PCA_INT), },
-	{ .compatible = "nxp,pca9575", .data = OF_957X(16, PCA_INT), },
-	{ .compatible = "nxp,pca9698", .data = OF_953X(40, 0), },
-
-	{ .compatible = "nxp,pcal6408", .data = OF_953X(8, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal6416", .data = OF_953X(16, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal6534", .data = OF_653X(34, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal9535", .data = OF_953X(16, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal9554b", .data = OF_953X( 8, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_LATCH_INT), },
-
-	{ .compatible = "maxim,max7310", .data = OF_953X( 8, 0), },
-	{ .compatible = "maxim,max7312", .data = OF_953X(16, PCA_INT), },
-	{ .compatible = "maxim,max7313", .data = OF_953X(16, PCA_INT), },
-	{ .compatible = "maxim,max7315", .data = OF_953X( 8, PCA_INT), },
-	{ .compatible = "maxim,max7318", .data = OF_953X(16, PCA_INT), },
-
-	{ .compatible = "ti,pca6107", .data = OF_953X( 8, PCA_INT), },
-	{ .compatible = "ti,pca9536", .data = OF_953X( 4, 0), },
-	{ .compatible = "ti,tca6408", .data = OF_953X( 8, PCA_INT), },
-	{ .compatible = "ti,tca6416", .data = OF_953X(16, PCA_INT), },
-	{ .compatible = "ti,tca6424", .data = OF_953X(24, PCA_INT), },
-	{ .compatible = "ti,tca9539", .data = OF_953X(16, PCA_INT), },
-
-	{ .compatible = "onnn,cat9554", .data = OF_953X( 8, PCA_INT), },
-	{ .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
-	{ .compatible = "onnn,pca9655", .data = OF_953X(16, PCA_INT), },
-
-	{ .compatible = "exar,xra1202", .data = OF_953X( 8, 0), },
+	{ .compatible = "nxp,pca6408", .data = OF_DATA(8, TYPE_PCA953X), },
+	{ .compatible = "nxp,pca6416", .data = OF_DATA(16, TYPE_PCA953X), },
+	{ .compatible = "nxp,pca9505", .data = OF_DATA(40, TYPE_PCA950X), },
+	{ .compatible = "nxp,pca9506", .data = OF_DATA(40, TYPE_PCA950X), },
+	{ .compatible = "nxp,pca9534", .data = OF_DATA(8, TYPE_PCA953X), },
+	{ .compatible = "nxp,pca9535", .data = OF_DATA(16, TYPE_PCA953X), },
+	{ .compatible = "nxp,pca9536", .data = OF_DATA(4, TYPE_PCA953X_NOINT), },
+	{ .compatible = "nxp,pca9537", .data = OF_DATA(4, TYPE_PCA953X), },
+	{ .compatible = "nxp,pca9538", .data = OF_DATA(8, TYPE_PCA953X), },
+	{ .compatible = "nxp,pca9539", .data = OF_DATA(16, TYPE_PCA953X), },
+	{ .compatible = "nxp,pca9554", .data = OF_DATA(8, TYPE_PCA953X), },
+	{ .compatible = "nxp,pca9555", .data = OF_DATA(16, TYPE_PCA953X), },
+	{ .compatible = "nxp,pca9556", .data = OF_DATA(8, TYPE_PCA953X_NOINT), },
+	{ .compatible = "nxp,pca9557", .data = OF_DATA(8, TYPE_PCA953X_NOINT), },
+	{ .compatible = "nxp,pca9574", .data = OF_DATA(8, TYPE_PCA957X), },
+	{ .compatible = "nxp,pca9575", .data = OF_DATA(16, TYPE_PCA957X), },
+	{ .compatible = "nxp,pca9698", .data = OF_DATA(40, TYPE_PCA950X), },
+
+	{ .compatible = "nxp,pcal6408", .data = OF_DATA(8, TYPE_PCAL953X), },
+	{ .compatible = "nxp,pcal6416", .data = OF_DATA(16, TYPE_PCAL953X), },
+	{ .compatible = "nxp,pcal6524", .data = OF_DATA(24, TYPE_PCAL652X), },
+	{ .compatible = "nxp,pcal6534", .data = OF_DATA(34, TYPE_PCAL653X), },
+	{ .compatible = "nxp,pcal9535", .data = OF_DATA(16, TYPE_PCAL953X), },
+	{ .compatible = "nxp,pcal9554b", .data = OF_DATA(8, TYPE_PCAL953X), },
+	{ .compatible = "nxp,pcal9555a", .data = OF_DATA(16, TYPE_PCAL953X), },
+
+	{ .compatible = "maxim,max7310", .data = OF_DATA(8, TYPE_PCA953X_NOINT), },
+	{ .compatible = "maxim,max7312", .data = OF_DATA(16, TYPE_PCA953X), },
+	{ .compatible = "maxim,max7313", .data = OF_DATA(16, TYPE_PCA953X), },
+	{ .compatible = "maxim,max7315", .data = OF_DATA(8, TYPE_PCA953X), },
+	{ .compatible = "maxim,max7318", .data = OF_DATA(16, TYPE_PCA953X), },
+
+	{ .compatible = "ti,pca6107", .data = OF_DATA(8, TYPE_PCA953X), },
+	{ .compatible = "ti,pca9536", .data = OF_DATA(4, TYPE_PCA953X_NOINT), },
+	{ .compatible = "ti,tca6408", .data = OF_DATA(8, TYPE_PCA953X), },
+	{ .compatible = "ti,tca6416", .data = OF_DATA(16, TYPE_PCA953X), },
+	{ .compatible = "ti,tca6424", .data = OF_DATA(24, TYPE_PCA953X), },
+	{ .compatible = "ti,tca9539", .data = OF_DATA(16, TYPE_PCA953X), },
+
+	{ .compatible = "onnn,cat9554", .data = OF_DATA(8, TYPE_PCA953X), },
+	{ .compatible = "onnn,pca9654", .data = OF_DATA(8, TYPE_PCA953X), },
+	{ .compatible = "onnn,pca9655", .data = OF_DATA(16, TYPE_PCA953X), },
+
+	{ .compatible = "exar,xra1202", .data = OF_DATA(8, TYPE_XRA120X), },
 	{ }
 };
 
-- 
2.38.1

