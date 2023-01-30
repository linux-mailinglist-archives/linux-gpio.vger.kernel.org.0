Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69A04681BF4
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 22:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjA3VAB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 16:00:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjA3U7z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 15:59:55 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2045.outbound.protection.outlook.com [40.107.14.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79EC4305F6
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 12:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAeoHZMbKSUUxq/vjJj3syEesj/z9WXZzzk0yUxuH9ufn+7kldPCwJu6LNcMb33+8YhElA9/zSjaC15qQo4GhNq3TQwLFZ+k1Iak3v/okmuvBGXAXjvfARKqLmoIHXdm8wMHDWaR7c4lbHNOe5F9QP1VNO4d3RGHNHZR7l4ryKHDBSo6Ckw4WbGUKLYRSzxN0CGRohL++gRwY4NItud7x/pMAaAWGrNTho81aF6m0St5YNYQkVELCYYKcNH5D4I3U4L0kN+ovInsBsuPQJcCRKIGtSMrwY36JJEI1cDhZMjgarnbafqKXeaMNDYazF4Dnm9fz+/GfRIZ1g4uYT6O2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6FdJgi9rpBEzo/aTF5PIVOUtqFszIY8lZPdSl5SEbU=;
 b=IHc4gG6isb4dx3qYRCqrcp4NAzDcFNOlUGyCevY3MryexJ+21AmmeGPV/nTGbOxzVLqLL2jneXgmatEt6/nYoHi+9HFwUNNq++kyZwTJ2z2GhzFJsrQ/XOdXGUEEckb8+No1Sn+9WDVHrqNDkFI2lWSwvBuIcLHBzdsGCuHZY0OHwEys2H8iaXFmNWmPZ6ksey0B3IgwSHt89Vlw+LCnlrCZ4CHKFuajaWDHHyED82egWc2L4DcYVqNoIiKMGVJgb1qzkhQr3g+kaUEYYgHdN8th+5p0QJUBhJYZQGLdy1h4QepPCTrbGH64GtQCTm39R/6XSPmB8LgS2HrncDBr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6FdJgi9rpBEzo/aTF5PIVOUtqFszIY8lZPdSl5SEbU=;
 b=WYjFMDJJXjoPc7JypAzYUhUCEorm9bl6qQht82mvEbUoIQo1P9/hxN+u0fhoIsxe8IIVRJ4ikYRXidn4wABXSK60s94nRTdNyoXqQJSdw1TntiOOWjuzLC41+iqoG9tglHk/z9l+yKIDvdLIcphHK0lsRWe9PQ2pI6IsSRwdSgQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by AS8P194MB2162.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:631::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 20:59:50 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::6322:b35d:1369:be7e]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::6322:b35d:1369:be7e%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 20:59:50 +0000
Message-ID: <73a0ab72-1189-0b87-6b26-5525645a591d@eilabs.com>
Date:   Mon, 30 Jan 2023 21:59:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
Subject: [RFC PATCH 2/3] gpio: pca953x: Describe register maps with enums
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
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|AS8P194MB2162:EE_
X-MS-Office365-Filtering-Correlation-Id: 8667882f-5b4d-4f6c-958a-08db0304ed37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7VexZWHttZOwGxCerL+08oFgRuHOb/aV8pbumBgtg6TIxWpfi4et7O1vcftGngsSxpRCqb/Z1Z6ecNCfYo1UbnDvAb285Xd8r9grgWlLQ7s0dkqyTKP1MZH9rAbhN0EvTbUqg/l/9Cu81DSyYCOIUyT+M6ovP/GL+sLSEy+7lfKCLXbc6UWCWwHZOB2YCr70iOKbkQBzCEuWYGTY7/peosp02UfUnNZFjVZSXslQtbOAie91kiTY3BAPSM4CSmC0Yrd9T5JjzRVBnxqzZw/l+NCC/QJ/pnqQSgcleOGoqOE9K9ylpjSgTlDTcyahUFPfbLEP5Yvo4yuQFRHx+xpw7zMjE3A02AfARFKN0IPrBX/vX+Lb0MwgI3ORu2UbAGvK3R7NsOxWOgX0ETFFOrhVWbc6ytrhydgqbBpMEk6Qda84TRNju9a/Mn8fB4dKzgeY2B7SVOvPM+sKJraHaR3n9ycxfClTMeeV11UOXJlyD8uqEOrPAI3li/Rd3G0zFPm09TqgoR0AzgrfZT4WTWGUv4jAO1w9H76moOurmLkznTIseM8idu71FJwTX/LJaqDR75Vvl2A+Nq/Junu9GpmkxsK63EpZtl1L5jJgC5+gCOeFETwqV0z3whTIFupjRF4xTfXwZ9kxr14EMPQa1sjIL+Bsc8L39L1synL5uSIQBvhVS3pW/oqkjTUwAixc5bjPWTBJ1FGbbyT3ofeP8phc5EMUNrVW+09kS5Foxt1E8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39830400003)(366004)(346002)(136003)(396003)(376002)(451199018)(86362001)(31696002)(38100700002)(36756003)(316002)(110136005)(8936002)(66946007)(5660300002)(54906003)(66476007)(4326008)(66556008)(8676002)(2906002)(7416002)(30864003)(66574015)(2616005)(83380400001)(478600001)(6486002)(6506007)(6512007)(26005)(186003)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVRkYW5lajMzaTVsM0Z3L0dzc0ZmdUNscUVEQkRWT0pMdjgxR2x3ejZaVWN5?=
 =?utf-8?B?NGp3dGdXTFZsYU9nTS85NmhmMFVTTmVSZFJqaEorYy9NQ3Bxc1QxU0gxVXhl?=
 =?utf-8?B?bmRVVVJaNm9wYkdQRyt3aytrSWN3azd3cy8zOGlPZUtRdHY2a1kzK0Z2cjJq?=
 =?utf-8?B?NHRVN2FOcFFHRmR5ZDhYOWE0U3J0M0Z5b1k1U25CR20yaDhwOXlTS2pSa2NG?=
 =?utf-8?B?aXZTWDhXZmJpUklqUC9RRUwrY0ppRXdJRkVOY2U0TnQ3aGxER2xsZHFTODVm?=
 =?utf-8?B?c2djNm9xSlJLbFpkVmxUUUlNZ3NIdmVTS1A2TkhPYWNMTnRMbkFpNCt3RDBG?=
 =?utf-8?B?aENGMVY0WGllQklpQUdEcTZtclUzL2FyVmFYQmw5L1d1a1lrY28wV1dtK2gx?=
 =?utf-8?B?cHZISy9xVGFyb2ZOdzZObi91VWpMYnJTQmZGZWR2d2Y3dEVFclZhT1VUbHRQ?=
 =?utf-8?B?YXdUTEZxSS92b2grMUtGSjVjOWlGTEJYaW16MGcvVTgybmtMYnlkNTNaaXF2?=
 =?utf-8?B?ZTBnZlR4WjhTSXBUdlV4WW11OXBBb2R2TEtaTHJCV1hkWEluaENMem9VZkNF?=
 =?utf-8?B?MUFYc21KM25SQlZ0R2VFMzF0TS9IdlNnbElTcGxOczdDM0Y3VGFyb3VhSWdq?=
 =?utf-8?B?SmJZR1pHY21PKzhjNmg3aUZWSGhxalJqTE1DclU0c2h3cHRsZCt1R01XM21X?=
 =?utf-8?B?c2QzalgzTlc5VkJMTE9sSjBDZU5welRDR3VRT0NjblJtRGIzSnJnTzZpTjdy?=
 =?utf-8?B?N2hQUkJPSXVCT1dFajJ5emRpdlJwSnR3Yk5uY2dBeWF2YWFMTnAzUno2MHpU?=
 =?utf-8?B?aEJJZTJsZmwwQ1k2aVpibmlBUHZNUTlDS3I4Y2lwcWtmaW9DOXBIZ0FnKzR2?=
 =?utf-8?B?eFFQK05pOHd6M1BuMWtmMlF2UjVESVViTWJVelB3anBvWkJ1czBSK2h5Qmp4?=
 =?utf-8?B?aENLSy9nejVLNStFZUZWbUhBM0JidENRemQ5bTl5dy9zL3lYdW16VXBmb24z?=
 =?utf-8?B?bUpmMHBHSUFiK2pGUXZNalI5NlhSOTZOTEM3OEIzQlpxN0kwN2VPTFJHUFRr?=
 =?utf-8?B?VEpYN1phbjh3a0M5ZS9YbzZZWXZjU0lDNUxnK2pFbW5HWGgvSk1rdHozQ2g1?=
 =?utf-8?B?K3JGemtvK29kYkg1YUUrcEtFYjFzSjdNRnU0VmJ1clRTQUVaekllNkpHU2U0?=
 =?utf-8?B?QXB4Mm82dUZ1WW95SEQySnZadGJ2QU5FQWEzRHhSRjNwSWxOZDMzME9KcGFT?=
 =?utf-8?B?ZWx4K0s3amtkdk8rOHJQaGoyTkpnaEtINVA1V3JDVEFBOXowRjdoQ2Z6ODV5?=
 =?utf-8?B?cmFyT2pJd2FLOUc5R0ErUmh0U21vOXFyY0lNTVoxOHpXVDNhS3JxQ01TR1RN?=
 =?utf-8?B?NTNiSUhWQUUyY2N0aFVJOFdDbE9mYWl5bDFHcmZ1UlFkT2MzY2tEc2dRU0t3?=
 =?utf-8?B?Nkx3eXRwMktITFRQcDU0TVF5Ui9Xc1lIVlFDNnAyRVkrYTVmK2dwVzlSLy83?=
 =?utf-8?B?WjJ2NW9iWU51NzlpSnhkcGd4OGNNSnlFcUJzV2dYYkpTMjYzZ2E3ZWgzcHhL?=
 =?utf-8?B?N1RUbUsvcDAySkhkL2I5RnJmRFlEMUlrSjhoei9GWG5qcmVvclh0SmRLeGkx?=
 =?utf-8?B?djBIelFkdy9rcStQOHBuampyczRZeHlMcGhxS3pUM0pkMzNaNTNpQmFkWFZw?=
 =?utf-8?B?WVhNa2xLOW0vRjF5eHVwWmE1T1JSL1IrcTFxSlh1VGdGMFdEdWF4alVQb0NC?=
 =?utf-8?B?Z2ZrZ2JUSFMzb0lFL21zVEdQOTM4MFp6eHVMaHAzWUU3MDdtbWw0dEZIdFFo?=
 =?utf-8?B?N3Fibm9PQVplOFppN1UwRUJCdFRkd1VZV2w3OXUwaS90bEtsM1I5NG5Fa2F5?=
 =?utf-8?B?NFB6b2hXc2NEci9yWkNLMmtKdy92NUFPWWZLNUcySmZLMWpGUnR5UVluN0I2?=
 =?utf-8?B?NjE4ZStlTjdnWWZOeW9GM3Vkc2QrVjVTaW5uclhUVFgwRFhFTFJzNmhPd1JJ?=
 =?utf-8?B?SkY4MFlRZVFjdnV3bEtjOVRWZGpCU0JJTVZhZnd3bDBYamZ4cG9ETnhBVUFX?=
 =?utf-8?B?a0xpSUJVMFZmRjR3bHBPZW1sQ2tZdDdkQmpxVDN4ZXNjUVBGdEJMRkdJeXRI?=
 =?utf-8?B?anFJNjVId0hZNmprY0ZqdFFYVnQ4dzE1ek05cFloMWQyUmV1Q0ZYUVJ2RXAw?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8667882f-5b4d-4f6c-958a-08db0304ed37
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 20:59:49.9214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUcIIvvn+MUK/hET4eoWm6v9tLxo+UPp0QSdmf2QJDc9oGOZ/BcJ9P6vOl7dpPf6lOeqA04CmkZRpZrj1uaU8uAfy1hEhaxZC/XLP4VlhGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P194MB2162
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver supports 8 chip types, 6 of which have extended registers
with various functions, e.g. pull-up and pull-down bias for the gpio
lines or interrupt masking. To allow supporting these functions, the
driver has to be able to calculate the addresses of these registers.

Replace the register maps with an enum for each chip type. These do not
contain the same numeric values as the old defines, but the new address
calculating functions (in the next patch) use them appropriately.

Add currently used registers to struct pca953x_reg_config.

Create a reg_config struct for each chip type.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
 drivers/gpio/gpio-pca953x.c | 422 ++++++++++++++++++++++++++++--------
 1 file changed, 333 insertions(+), 89 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d6099fc18b01..3d4c3efeaf35 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -25,24 +25,10 @@
 
 #include <asm/unaligned.h>
 
-#define PCA953X_INPUT		0x00
-#define PCA953X_OUTPUT		0x01
-#define PCA953X_INVERT		0x02
-#define PCA953X_DIRECTION	0x03
-
 #define REG_ADDR_MASK		GENMASK(5, 0)
 #define REG_ADDR_EXT		BIT(6)
 #define REG_ADDR_AI		BIT(7)
 
-#define PCA957X_IN		0x00
-#define PCA957X_INVRT		0x01
-#define PCA957X_BKEN		0x02
-#define PCA957X_PUPD		0x03
-#define PCA957X_CFG		0x04
-#define PCA957X_OUT		0x05
-#define PCA957X_MSK		0x06
-#define PCA957X_INTS		0x07
-
 #define PCAL953X_OUT_STRENGTH	0x20
 #define PCAL953X_IN_LATCH	0x22
 #define PCAL953X_PULL_EN	0x23
@@ -191,25 +177,152 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
 
 #define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
 
+enum pca953x_reg {
+	PCA953X_REG_INPUT,
+	PCA953X_REG_OUTPUT,
+	PCA953X_REG_INVERT,
+	PCA953X_REG_DIRECTION,
+};
+
+enum pca950x_reg {
+	PCA950X_REG_INPUT,
+	PCA950X_REG_OUTPUT,
+	PCA950X_REG_INVERT,
+	PCA950X_REG_DIRECTION,
+	PCA950X_REG_INT_MASK,
+};
+
+enum pcal953x_reg {
+	PCAL953X_REG_INPUT,
+	PCAL953X_REG_OUTPUT,
+	PCAL953X_REG_INVERT,
+	PCAL953X_REG_DIRECTION,
+	PCAL953X_REG_DRIVE_STRENGTH,
+	PCAL953X_REG_INPUT_LATCH,
+	PCAL953X_REG_PULL_EN,
+	PCAL953X_REG_PULL_SEL,
+	PCAL953X_REG_INT_MASK,
+	PCAL953X_REG_INT_STATUS,
+	PCAL953X_REG_DRIVE_MODE,
+};
+
+enum pcal65xx_reg {
+	PCAL65XX_REG_INPUT,
+	PCAL65XX_REG_OUTPUT,
+	PCAL65XX_REG_INVERT,
+	PCAL65XX_REG_DIRECTION,
+	PCAL65XX_REG_DRIVE_STRENGTH,
+	PCAL65XX_REG_INPUT_LATCH,
+	PCAL65XX_REG_PULL_EN,
+	PCAL65XX_REG_PULL_SEL,
+	PCAL65XX_REG_INT_MASK,
+	PCAL65XX_REG_INT_STATUS,
+	PCAL65XX_REG_DRIVE_MODE,
+	PCAL65XX_REG_INT_EDGE,
+	PCAL65XX_REG_INT_CLEAR,
+	PCAL65XX_REG_INPUT_STATUS,
+	PCAL65XX_REG_INDIV_DRIVE_MODE,
+	PCAL65XX_REG_DEBOUNCE_EN,
+	PCAL65XX_REG_DEBOUNCE_COUNT,
+};
+
+#define PCAL65XX_MAX_NUM_DEBOUNCE_PORTS	2
+
+enum pca957x_reg {
+	PCA957X_REG_INPUT,
+	PCA957X_REG_INVERT,
+	PCA957X_REG_PULL_EN,
+	PCA957X_REG_PULL_SEL,
+	PCA957X_REG_DIRECTION,
+	PCA957X_REG_OUTPUT,
+	PCA957X_REG_INT_MASK,
+	PCA957X_REG_INT_STATUS,
+};
+
+enum xra120x_reg {
+	XRA120X_REG_INPUT,
+	XRA120X_REG_OUTPUT,
+	XRA120X_REG_INVERT,
+	XRA120X_REG_DIRECTION,
+	XRA120X_REG_PULL_EN,
+	XRA120X_REG_INT_MASK,
+	XRA120X_REG_TRISTATE,
+	XRA120X_REG_INT_STATUS,
+	XRA120X_REG_RISING_MASK,
+	XRA120X_REG_FALLING_MASK,
+	XRA120X_REG_DEBOUNCE_EN,
+};
+
 struct pca953x_reg_config {
 	int direction;
 	int output;
 	int input;
 	int invert;
+	int input_latch;
+	int int_mask;
+	int int_status;
+	int pull_en;
+	int pull_sel;
 };
 
 static const struct pca953x_reg_config pca953x_regs = {
-	.direction = PCA953X_DIRECTION,
-	.output = PCA953X_OUTPUT,
-	.input = PCA953X_INPUT,
-	.invert = PCA953X_INVERT,
+	.direction = PCA953X_REG_DIRECTION,
+	.output = PCA953X_REG_OUTPUT,
+	.input = PCA953X_REG_INPUT,
+	.invert = PCA953X_REG_INVERT,
+};
+
+static const struct pca953x_reg_config pca950x_regs = {
+	.direction = PCA950X_REG_DIRECTION,
+	.output = PCA950X_REG_OUTPUT,
+	.input = PCA950X_REG_INPUT,
+	.invert = PCA950X_REG_INVERT,
+	.int_mask = PCA950X_REG_INT_MASK,
 };
 
 static const struct pca953x_reg_config pca957x_regs = {
-	.direction = PCA957X_CFG,
-	.output = PCA957X_OUT,
-	.input = PCA957X_IN,
-	.invert = PCA957X_INVRT,
+	.direction = PCA957X_REG_DIRECTION,
+	.output = PCA957X_REG_OUTPUT,
+	.input = PCA957X_REG_INPUT,
+	.invert = PCA957X_REG_INVERT,
+	.int_mask = PCA957X_REG_INT_MASK,
+	.int_status = PCA957X_REG_INT_STATUS,
+	.pull_en = PCA957X_REG_PULL_EN,
+	.pull_sel = PCA957X_REG_PULL_SEL,
+};
+
+static const struct pca953x_reg_config xra120x_regs = {
+	.direction = XRA120X_REG_DIRECTION,
+	.output = XRA120X_REG_OUTPUT,
+	.input = XRA120X_REG_INPUT,
+	.invert = XRA120X_REG_INVERT,
+	.int_mask = XRA120X_REG_INT_MASK,
+	.int_status = XRA120X_REG_INT_STATUS,
+	.pull_en = XRA120X_REG_PULL_EN,
+};
+
+static const struct pca953x_reg_config pcal953x_regs = {
+	.direction = PCAL953X_REG_DIRECTION,
+	.output = PCAL953X_REG_OUTPUT,
+	.input = PCAL953X_REG_INPUT,
+	.invert = PCAL953X_REG_INVERT,
+	.input_latch = PCAL953X_REG_INPUT_LATCH,
+	.int_mask = PCAL953X_REG_INT_MASK,
+	.int_status = PCAL953X_REG_INT_STATUS,
+	.pull_en = PCAL953X_REG_PULL_EN,
+	.pull_sel = PCAL953X_REG_PULL_SEL,
+};
+
+static const struct pca953x_reg_config pcal65xx_regs = {
+	.direction = PCAL65XX_REG_DIRECTION,
+	.output = PCAL65XX_REG_OUTPUT,
+	.input = PCAL65XX_REG_INPUT,
+	.invert = PCAL65XX_REG_INVERT,
+	.input_latch = PCAL65XX_REG_INPUT_LATCH,
+	.int_mask = PCAL65XX_REG_INT_MASK,
+	.int_status = PCAL65XX_REG_INT_STATUS,
+	.pull_en = PCAL65XX_REG_PULL_EN,
+	.pull_sel = PCAL65XX_REG_PULL_SEL,
 };
 
 struct pca953x_chip {
@@ -257,23 +370,6 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
 	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 }
 
-#define PCA953x_BANK_INPUT	BIT(0)
-#define PCA953x_BANK_OUTPUT	BIT(1)
-#define PCA953x_BANK_POLARITY	BIT(2)
-#define PCA953x_BANK_CONFIG	BIT(3)
-
-#define PCA957x_BANK_INPUT	BIT(0)
-#define PCA957x_BANK_POLARITY	BIT(1)
-#define PCA957x_BANK_BUSHOLD	BIT(2)
-#define PCA957x_BANK_CONFIG	BIT(4)
-#define PCA957x_BANK_OUTPUT	BIT(5)
-
-#define PCAL9xxx_BANK_IN_LATCH	BIT(8 + 2)
-#define PCAL9xxx_BANK_PULL_EN	BIT(8 + 3)
-#define PCAL9xxx_BANK_PULL_SEL	BIT(8 + 4)
-#define PCAL9xxx_BANK_IRQ_MASK	BIT(8 + 5)
-#define PCAL9xxx_BANK_IRQ_STAT	BIT(8 + 6)
-
 /*
  * We care about the following registers:
  * - Standard set, below 0x40, each port can be replicated up to 8 times
@@ -373,63 +469,189 @@ static bool pcal6534_check_register(struct pca953x_chip *chip, unsigned int reg,
 	return true;
 }
 
-static bool pca953x_readable_register(struct device *dev, unsigned int reg)
+static bool pca953x_readable_register(struct device *dev, unsigned int reg_addr)
 {
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
-	u32 bank;
-
-	if (chip->type == TYPE_PCA957X) {
-		bank = PCA957x_BANK_INPUT | PCA957x_BANK_OUTPUT |
-		       PCA957x_BANK_POLARITY | PCA957x_BANK_CONFIG |
-		       PCA957x_BANK_BUSHOLD;
-	} else {
-		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
-		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
-	}
-
-	if (pca953x_is_pcal_type(chip)) {
-		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
-			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK |
-			PCAL9xxx_BANK_IRQ_STAT;
+	u32 registers;
+
+	switch (chip->type) {
+	case TYPE_PCA950X:
+		registers = BIT(PCA950X_REG_INPUT) |
+			    BIT(PCA950X_REG_OUTPUT) |
+			    BIT(PCA950X_REG_INVERT) |
+			    BIT(PCA950X_REG_DIRECTION) |
+			    BIT(PCA950X_REG_INT_MASK);
+		break;
+	case TYPE_PCAL953X:
+		registers = BIT(PCAL953X_REG_INPUT) |
+			    BIT(PCAL953X_REG_OUTPUT) |
+			    BIT(PCAL953X_REG_INVERT) |
+			    BIT(PCAL953X_REG_DIRECTION) |
+			    BIT(PCAL953X_REG_DRIVE_STRENGTH) |
+			    BIT(PCAL953X_REG_INPUT_LATCH) |
+			    BIT(PCAL953X_REG_PULL_EN) |
+			    BIT(PCAL953X_REG_PULL_SEL) |
+			    BIT(PCAL953X_REG_INT_MASK) |
+			    BIT(PCAL953X_REG_INT_STATUS) |
+			    BIT(PCAL953X_REG_DRIVE_MODE);
+		break;
+	case TYPE_PCAL652X:
+	case TYPE_PCAL653X:
+		registers = BIT(PCAL65XX_REG_INPUT) |
+			    BIT(PCAL65XX_REG_OUTPUT) |
+			    BIT(PCAL65XX_REG_INVERT) |
+			    BIT(PCAL65XX_REG_DIRECTION) |
+			    BIT(PCAL65XX_REG_DRIVE_STRENGTH) |
+			    BIT(PCAL65XX_REG_INPUT_LATCH) |
+			    BIT(PCAL65XX_REG_PULL_EN) |
+			    BIT(PCAL65XX_REG_PULL_SEL) |
+			    BIT(PCAL65XX_REG_INT_MASK) |
+			    BIT(PCAL65XX_REG_INT_STATUS) |
+			    BIT(PCAL65XX_REG_DRIVE_MODE) |
+			    BIT(PCAL65XX_REG_INT_EDGE) |
+			    BIT(PCAL65XX_REG_INPUT_STATUS) |
+			    BIT(PCAL65XX_REG_INDIV_DRIVE_MODE) |
+			    BIT(PCAL65XX_REG_DEBOUNCE_EN) |
+			    BIT(PCAL65XX_REG_DEBOUNCE_COUNT);
+		break;
+	case TYPE_PCA957X:
+		registers = BIT(PCA957X_REG_INPUT) |
+			    BIT(PCA957X_REG_INVERT) |
+			    BIT(PCA957X_REG_PULL_EN) |
+			    BIT(PCA957X_REG_PULL_SEL) |
+			    BIT(PCA957X_REG_DIRECTION) |
+			    BIT(PCA957X_REG_OUTPUT) |
+			    BIT(PCA957X_REG_INT_MASK) |
+			    BIT(PCA957X_REG_INT_STATUS);
+		break;
+	case TYPE_XRA120X:
+		registers = BIT(XRA120X_REG_INPUT) |
+			    BIT(XRA120X_REG_OUTPUT) |
+			    BIT(XRA120X_REG_INVERT) |
+			    BIT(XRA120X_REG_DIRECTION) |
+			    BIT(XRA120X_REG_OUTPUT) |
+			    BIT(XRA120X_REG_PULL_EN) |
+			    BIT(XRA120X_REG_INT_MASK) |
+			    BIT(XRA120X_REG_TRISTATE) |
+			    BIT(XRA120X_REG_INT_STATUS) |
+			    BIT(XRA120X_REG_RISING_MASK) |
+			    BIT(XRA120X_REG_FALLING_MASK) |
+			    BIT(XRA120X_REG_DEBOUNCE_EN);
+		break;
+	default:
+		registers = BIT(PCA953X_REG_INPUT) |
+			    BIT(PCA953X_REG_OUTPUT) |
+			    BIT(PCA953X_REG_INVERT) |
+			    BIT(PCAL953X_REG_DIRECTION);
+		break;
 	}
 
-	return chip->check_reg(chip, reg, bank);
+	return chip->check_reg(chip, reg_addr, registers);
 }
 
-static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
+static bool pca953x_writeable_register(struct device *dev, unsigned int reg_addr)
 {
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
-	u32 bank;
-
-	if (chip->type == TYPE_PCA957X) {
-		bank = PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
-			PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
-	} else {
-		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
-			PCA953x_BANK_CONFIG;
+	u32 registers;
+
+	switch (chip->type) {
+	case TYPE_PCA950X:
+		registers = BIT(PCA950X_REG_OUTPUT) |
+			    BIT(PCA950X_REG_INVERT) |
+			    BIT(PCA950X_REG_DIRECTION) |
+			    BIT(PCA950X_REG_INT_MASK);
+		break;
+	case TYPE_PCAL953X:
+		registers = BIT(PCAL953X_REG_OUTPUT) |
+			    BIT(PCAL953X_REG_INVERT) |
+			    BIT(PCAL953X_REG_DIRECTION) |
+			    BIT(PCAL953X_REG_DRIVE_STRENGTH) |
+			    BIT(PCAL953X_REG_INPUT_LATCH) |
+			    BIT(PCAL953X_REG_PULL_EN) |
+			    BIT(PCAL953X_REG_PULL_SEL) |
+			    BIT(PCAL953X_REG_INT_MASK) |
+			    BIT(PCAL953X_REG_DRIVE_MODE);
+		break;
+	case TYPE_PCAL652X:
+	case TYPE_PCAL653X:
+		registers = BIT(PCAL65XX_REG_OUTPUT) |
+			    BIT(PCAL65XX_REG_INVERT) |
+			    BIT(PCAL65XX_REG_DIRECTION) |
+			    BIT(PCAL65XX_REG_DRIVE_STRENGTH) |
+			    BIT(PCAL65XX_REG_INPUT_LATCH) |
+			    BIT(PCAL65XX_REG_PULL_EN) |
+			    BIT(PCAL65XX_REG_PULL_SEL) |
+			    BIT(PCAL65XX_REG_INT_MASK) |
+			    BIT(PCAL65XX_REG_DRIVE_MODE) |
+			    BIT(PCAL65XX_REG_INT_EDGE) |
+			    BIT(PCAL65XX_REG_INT_CLEAR) |
+			    BIT(PCAL65XX_REG_INDIV_DRIVE_MODE) |
+			    BIT(PCAL65XX_REG_DEBOUNCE_EN) |
+			    BIT(PCAL65XX_REG_DEBOUNCE_COUNT);
+		break;
+	case TYPE_PCA957X:
+		registers = BIT(PCA957X_REG_INVERT) |
+			    BIT(PCA957X_REG_PULL_EN) |
+			    BIT(PCA957X_REG_PULL_SEL) |
+			    BIT(PCA957X_REG_DIRECTION) |
+			    BIT(PCA957X_REG_OUTPUT) |
+			    BIT(PCA957X_REG_INT_MASK);
+		break;
+	case TYPE_XRA120X:
+		registers = BIT(XRA120X_REG_OUTPUT) |
+			    BIT(XRA120X_REG_INVERT) |
+			    BIT(XRA120X_REG_DIRECTION) |
+			    BIT(XRA120X_REG_OUTPUT) |
+			    BIT(XRA120X_REG_PULL_EN) |
+			    BIT(XRA120X_REG_INT_MASK) |
+			    BIT(XRA120X_REG_TRISTATE) |
+			    BIT(XRA120X_REG_RISING_MASK) |
+			    BIT(XRA120X_REG_FALLING_MASK) |
+			    BIT(XRA120X_REG_DEBOUNCE_EN);
+		break;
+	default:
+		registers = BIT(PCA953X_REG_OUTPUT) |
+			    BIT(PCA953X_REG_INVERT) |
+			    BIT(PCAL953X_REG_DIRECTION);
+		break;
 	}
 
-	if (pca953x_is_pcal_type(chip))
-		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
-			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK;
-
-	return chip->check_reg(chip, reg, bank);
+	return chip->check_reg(chip, reg_addr, registers);
 }
 
 static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
 {
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
-	u32 bank;
-
-	if (chip->type == TYPE_PCA957X)
-		bank = PCA957x_BANK_INPUT;
-	else
-		bank = PCA953x_BANK_INPUT;
+	u32 registers;
 
-	if (pca953x_is_pcal_type(chip))
-		bank |= PCAL9xxx_BANK_IRQ_STAT;
+	switch (chip->type) {
+	case TYPE_PCA950X:
+		registers = BIT(PCA950X_REG_INPUT);
+		break;
+	case TYPE_PCAL953X:
+		registers = BIT(PCAL953X_REG_INPUT) |
+			    BIT(PCAL953X_REG_INT_STATUS);
+		break;
+	case TYPE_PCAL652X:
+	case TYPE_PCAL653X:
+		registers = BIT(PCAL65XX_REG_INPUT) |
+			    BIT(PCAL65XX_REG_INT_STATUS) |
+			    BIT(PCAL65XX_REG_INPUT_STATUS);
+		break;
+	case TYPE_PCA957X:
+		registers = BIT(PCA957X_REG_INPUT) |
+			    BIT(PCA957X_REG_INT_STATUS);
+		break;
+	case TYPE_XRA120X:
+		registers = BIT(XRA120X_REG_INPUT) |
+			    BIT(XRA120X_REG_INT_STATUS);
+		break;
+	default:
+		registers = BIT(PCA953X_REG_INPUT);
+		break;
+	}
 
-	return chip->check_reg(chip, reg, bank);
+	return chip->check_reg(chip, reg, registers);
 }
 
 static const struct regmap_config pca953x_i2c_regmap = {
@@ -667,8 +889,8 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
 {
 	enum pin_config_param param = pinconf_to_config_param(config);
 
-	u8 pull_en_reg = chip->recalc_addr(chip, PCAL953X_PULL_EN, offset);
-	u8 pull_sel_reg = chip->recalc_addr(chip, PCAL953X_PULL_SEL, offset);
+	u8 pull_en_reg = chip->recalc_addr(chip, chip->regs->pull_en, offset);
+	u8 pull_sel_reg = chip->recalc_addr(chip, chip->regs->pull_sel, offset);
 	u8 bit = BIT(offset % BANK_SZ);
 	int ret;
 
@@ -794,12 +1016,12 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 
 	if (pca953x_is_pcal_type(chip)) {
 		/* Enable latch on interrupt-enabled inputs */
-		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
+		pca953x_write_regs(chip, chip->regs->input_latch, chip->irq_mask);
 
 		bitmap_complement(irq_mask, chip->irq_mask, gc->ngpio);
 
 		/* Unmask enabled interrupts */
-		pca953x_write_regs(chip, PCAL953X_INT_MASK, irq_mask);
+		pca953x_write_regs(chip, chip->regs->int_mask, irq_mask);
 	}
 
 	/* Switch direction to input if needed */
@@ -876,7 +1098,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 
 	if (pca953x_is_pcal_type(chip)) {
 		/* Read the current interrupt status from the device */
-		ret = pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
+		ret = pca953x_read_regs(chip, chip->regs->int_status, trigger);
 		if (ret)
 			return false;
 
@@ -1068,7 +1290,7 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 	for (i = 0; i < NBANK(chip); i++)
 		bitmap_set_value8(val, 0x02, i * BANK_SZ);
 
-	ret = pca953x_write_regs(chip, PCA957X_BKEN, val);
+	ret = pca953x_write_regs(chip, chip->regs->pull_en, val);
 	if (ret)
 		goto out;
 
@@ -1158,6 +1380,30 @@ static int pca953x_probe(struct i2c_client *client)
 		regmap_config = &pca953x_i2c_regmap;
 	}
 
+	switch (chip->type) {
+	case TYPE_PCA950X:
+		chip->regs = &pca950x_regs;
+		break;
+	case TYPE_PCAL953X:
+		chip->regs = &pcal953x_regs;
+		break;
+	case TYPE_PCAL652X:
+		chip->regs = &pcal65xx_regs;
+		break;
+	case TYPE_PCAL653X:
+		chip->regs = &pcal65xx_regs;
+		break;
+	case TYPE_PCA957X:
+		chip->regs = &pca957x_regs;
+		break;
+	case TYPE_XRA120X:
+		chip->regs = &xra120x_regs;
+		break;
+	default:
+		chip->regs = &pca953x_regs;
+		break;
+	}
+
 	if (chip->type == TYPE_PCAL653X) {
 		chip->recalc_addr = pcal6534_recalc_addr;
 		chip->check_reg = pcal6534_check_register;
@@ -1198,10 +1444,8 @@ static int pca953x_probe(struct i2c_client *client)
 	 * we can't share this chip with another i2c master.
 	 */
 	if (chip->type == TYPE_PCA957X) {
-		chip->regs = &pca957x_regs;
 		ret = device_pca957x_init(chip, invert);
 	} else {
-		chip->regs = &pca953x_regs;
 		ret = device_pca95xx_init(chip, invert);
 	}
 	if (ret)
@@ -1269,7 +1513,7 @@ static int pca953x_regcache_sync(struct device *dev)
 
 #ifdef CONFIG_GPIO_PCA953X_IRQ
 	if (pca953x_is_pcal_type(chip)) {
-		regaddr = chip->recalc_addr(chip, PCAL953X_IN_LATCH, 0);
+		regaddr = chip->recalc_addr(chip, chip->regs->input_latch, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
 					   regaddr + NBANK(chip) - 1);
 		if (ret) {
@@ -1278,7 +1522,7 @@ static int pca953x_regcache_sync(struct device *dev)
 			return ret;
 		}
 
-		regaddr = chip->recalc_addr(chip, PCAL953X_INT_MASK, 0);
+		regaddr = chip->recalc_addr(chip, chip->regs->int_mask, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
 					   regaddr + NBANK(chip) - 1);
 		if (ret) {
-- 
2.38.1

