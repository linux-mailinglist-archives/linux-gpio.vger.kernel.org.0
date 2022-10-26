Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9814F60DF6A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 13:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbiJZLVc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 07:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233395AbiJZLV3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 07:21:29 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2048.outbound.protection.outlook.com [40.107.247.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2915FB0B19
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 04:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHdhKlAYXvkqfcSL+Q3I8ftCweFXSL1TnOdLsHo1qBU5GVcPgPjRvXKCC342h3Ohg2zzpDUL7hyKAdYcNtr+uNIJr5NYmtNd2tEik9zzXL3nXzByzxPIb6MjH93E9afjGiaSbJqWrun5b/TB7ruxCWYupSMBHhSkBs3bHiLALU2dkoDL77OtO4XPZziogau4KSmDp6XI0DzFrxZm1sZL7Co5ceAYpQlNC/TmEhGou4C6V2lO/KrU1Kazsv9HAllSGr5v4xs5HFqEkAsFHbB4yZHtbSLjqcIkQ3XXEE2SuJVm64mG/Cai9GOU9hTV43Bh++5rLZDaQtARueQJfg5dvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ixk+qAeUstmrIJgmu07ml61uPaijeCFPtil7Xt/f4mQ=;
 b=lRDFebnJ3vZrqdOQhUGFmcxhPcSXsLOLNo+HjAd6RkN5rwPbexZTxyemCKaVy4zFRFiglRSAs8xOzK0Y+LR1/6rn8uTaslPybQIl2Sk8LgAC5/Q9gWLOUtMo6W8wzbkFFKesr+0xiG9HdJMI5qlrd+wh3izTnHWDSx0FuKvi8n9yrOHmRo43k3zlEijrUpt3wJFbeuSLGlCu2z3L7JtH0nYdSdk8OXZUCdqS1KKAfJYdIslKFmRfY4of0eNwDvUZM5w1vjpy2YK1kzIgJb+UW8GK3CXVwU2A8+z5OGpqNyklT2T2zN5xz4NNVcq8dYCRIqqTlif+tObNNs+7T66o/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ixk+qAeUstmrIJgmu07ml61uPaijeCFPtil7Xt/f4mQ=;
 b=M+ggHxYLm0LnCnTFGBjl4NwhX3EEqlvj35aW94BdxAu6FLtjqYzDIFXnkhdzYWFwVjkeEDGQmqaw+Q4eD56dx64NFs7LW8pQmNZmoir8+Pn5dGbuJvjAbFIzMIu4WgSArIGP8+hZCPxp24e3b5VpJ8cuvPUP9gBmxjXf4ROfC/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by PR3P194MB1700.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:17b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 11:21:24 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f%7]) with mapi id 15.20.5746.027; Wed, 26 Oct 2022
 11:21:24 +0000
Message-ID: <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
Date:   Wed, 26 Oct 2022 13:21:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: [PATCH v2 2/6] gpio: pca953x: Add PCAL953X as a separate chip type
Content-Language: en-US
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>
Cc:     linux-gpio@vger.kernel.org
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
In-Reply-To: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0302CA0007.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::17) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|PR3P194MB1700:EE_
X-MS-Office365-Filtering-Correlation-Id: 54018047-a293-41e7-8766-08dab7443788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dFQPkSgn7x1jL/iDSwjBZt43gIPrxhBTamtbmDu8FMjWoZ6Aa5FgGAbvh2XF1ZupL6JovR5+yXBONFUBzjJ7vEzA/3RqfBHPLHbRgH75Nt3p8xgbB/LYRS+qHigJinqxsr6STaqHipgovH/YBDQgKzQF8U4M3EEFWY/orL23qYgsTLTq00l/fY3emvf+/jpL8StX++liZsSX1/zw41QK9qM8dSj7b99bVbvGC8XiWX4KKGppbKCGEhHAWCCWuX7vpB3K93Gn+1LKNQXsbqQAznETo3Zkr4SWj63MYXV6P5KVBNmntMyzU7MDoODmRqNVQcVYBf7RykLejs/3VswVVDIfnDlyGiDKxGy6uuqQq0joksql2qxfSdsrM878S0HO7ZqCUhhGnEQkqG2j5UKaPDDDLqg941Ykuv3uZgYsVOdH/N4FjFFmWBQkAVXMZku4QuQLOG29Ez03lJa63mCK29nChnEGuCvZ/TJXcH5YGWb1i/fmy+rnAm+zZxlyT5J3H00YtLwHw+wRMroOHF20vJ/tqKYwX9AC2vzBUZzlJgsT7tDk16D2Vv8Mbn77TcVC2Alg5BrTZHEL+XFLpU+Pq8Q7lmvyWK+0iVVijxiL7pTOWxe4uiM5P+yS5lt9mlX6b8Tp3n9LJNejpooSARdMKL83I4XfGMyEbYvxoZXBg2/9fy/WGn8vFjwXkWpz6hrPXCZGdHC5vKpxKgWhYflE4933O+KGU/XYN2Ow2a5npSG48RyH69B54l9XArQ+pUXWSqgi0mS8za4n898Jsu75l2QrIf9tfjq279HlW0WJPU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39830400003)(136003)(346002)(376002)(451199015)(31686004)(478600001)(31696002)(83380400001)(6486002)(86362001)(186003)(66574015)(66556008)(316002)(8676002)(66476007)(66946007)(26005)(6506007)(36756003)(6512007)(7416002)(41300700001)(4326008)(110136005)(5660300002)(8936002)(38100700002)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djdFYVRIZFdTVzJTdXlvQktkazBicXVkYmRvZ1BKV3RVTTRkNDI2MGhnYWdI?=
 =?utf-8?B?YUtxWjZOOGV0bHBxOVd4NlQ4SVhEazB2anh3bS9CcGNjZXlOOThpNGxna2Fa?=
 =?utf-8?B?R2d6d2s3OFR5Nlh6YjJUN3VVeGJvRnRJYWJvSStadzM1cW9hVGZmVG5WSEht?=
 =?utf-8?B?NHpCNDA4UTBzaWgxalRrdC8rRXp1UVllU3NsS3RMRS9GcURQVjZacDcwcnIr?=
 =?utf-8?B?Rm1hMHorWDgrNTByeDJlRzlhQkVQcHZaeHJISUJMbnBKQmpFck5lcCtURmMr?=
 =?utf-8?B?QUVnQ3VlVVVhU0xBa3cyTmZqL3JKbzVURVBXdmdGaWRLSm1kWU0xTGNpVVIy?=
 =?utf-8?B?NDY5SjVPUE9TMjlEVlA2R1hGallaVUVtdVY0T285TEQ2SlltcmZKOTVzN096?=
 =?utf-8?B?VW5YN0dVeVQ1Mi9aWmFQVDE4QkpUWWVQYTJOVWZqV3Fpc3hiVzg5STN2Z2Vq?=
 =?utf-8?B?MDNxdzRIekIxRmlWZllKblZBM3orTXZpckd4TEUwSTFzM2hwTUYvdmh5dFFO?=
 =?utf-8?B?dWNMTVl6VTJpemwycXg5NTFlN0hIaDJFelBkSjBLVVBnbTROeWwyUDRERTZS?=
 =?utf-8?B?blVZMkttdjBrTHM0TkNZeStOTG9ZaW5KR1VXMm5CUjdOenVvS1d3bkoxNHl5?=
 =?utf-8?B?bXdnV1dIT1FsZTZWQXEzVVY4a0pyUjg3T0NsVUlYVE8rb1NZNXd1b0Z5RWQ2?=
 =?utf-8?B?R0dFOFNSSTU3Y1ZmK2hoTW5RaXhWTkd1eHI4azkvbXRGZmRmUEtSSWRkamJy?=
 =?utf-8?B?UUhVbGJxbVdxM1hUZTJ3bUZRZjJ6dUhjbFRCZW1IQ3VwRVR4UlUzSDRQRWZo?=
 =?utf-8?B?UHRndnhCL0QvTDlSenpKenl6cjhhMStUNjNzTmM0QjJUZDJIeEhKNWhiQjlG?=
 =?utf-8?B?dDFWUWw3c3FBY3lKNXo4OVJTV0xsRmNacEF5UCsxbDlnZEZTWU14WW11WFRT?=
 =?utf-8?B?TXUwWGE2NnhpMGFocnRwVFdBRW0rUHJQMndOWW4yV2RsVXZBTTU4aGhiZDRz?=
 =?utf-8?B?cE5lVk1nMUNWeU1QY3dBQ05JM3pCR3JZdVcxLzhzaDFoMTYvV3FWMnhUL3cz?=
 =?utf-8?B?VmhUOWZMeG84bFFiTUErQXFJTE00dlFtY1JaaFFMWlNsUXpaVzE3ZXFBTWI2?=
 =?utf-8?B?eEFkRWJiQXZrKzZVdzJZRFRHckhUQTYrWUd4Zmp6NjN1Y2F0WmROL0tmTE5H?=
 =?utf-8?B?L0w3SzZNWnhvWkxYdit2aWthYk05SEt5U0dLTEVWeWdKQ2dIaDNwQ0h4Q1Y5?=
 =?utf-8?B?T0xvK2I2UTJZVlBhVUprNjN1UXJORXg5c1ovSXRja2t6K2p6YkkrOU13ODJt?=
 =?utf-8?B?dXFIOWYxU0Vva2ZyUU8ranh1dWxFeldPY2VjYzNxREVPUDZqRStsYmFVVnZa?=
 =?utf-8?B?Q2VwZ244R0xRMC9HajFZVkpNT2hDbTlWUG40Q1FhQ05KdldBd2FCYkxBaURv?=
 =?utf-8?B?cDB0NGUxN0hrY0x1bFJ1N29XZTkrOHd1Z05lV3U2ODVvem1XWEd2NDNpR25k?=
 =?utf-8?B?ZUplV3Y3L0xzajIvQWJyUXlPMFZVTVlVenpNSUNjOGVUcnlYOFoyYmgzZEg4?=
 =?utf-8?B?K0NRMVFuYnlLZTRyQ1dFbDlXaHcvYndzd1hUZCs5TUFBd0JQdHF4elhTK0JE?=
 =?utf-8?B?VC8yeEZoOFhqQ3FNWEIwYU1xMENrQVYvUE9ISzFrNmY2THAzRERCNVJXdDRC?=
 =?utf-8?B?RDhaUGJtVStXbWhIRTgwblEvaGJxSHE5L0VmcjFyMTZlSzZqVVhKdi91L2tI?=
 =?utf-8?B?eTlTMVNsU0NLY29PQlVXdXE1WGMrZURnbWtoUXdHLzlhWEgzaGdtNU80ZWIx?=
 =?utf-8?B?ZGlXYWE3TmJvUHNKTzhaazZBSmpmQnhTanVZcTZKTkJETEFYYUlDQUo1bDhK?=
 =?utf-8?B?eFVFd3dLRS8zdjRPSExTL3g1N0ZocGhwRFkwenlyLy9hU1RBazI5OGw4WVNB?=
 =?utf-8?B?Q3dRTE1qb0ZLdlpjSHNzVXI5MnNVL2grTUUxa29wNktZajFta2hWUExTbjRa?=
 =?utf-8?B?UUx6aS9CQnJxMW5paUtHV0pBMDZWaVNhQXNJd3NCS3NpaUZRYXBGQWhhVkE3?=
 =?utf-8?B?YWhkckV1dG1veTY0MVZkN0lMZTA2QlI0dVQ4NGpyY2t2Tmh4b1ZOVk93aTky?=
 =?utf-8?B?Z09mZ2ozb0wwVVNlUVpjMVNwTEpnQ3dab3g5MWl6ZndIaXIwMzlHMkNFckVC?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54018047-a293-41e7-8766-08dab7443788
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 11:21:24.4324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beF4t6cQPnxxUTLzmkIjlteoRF+Riq8bqSA6Q1QGeb0o4WJLGOcAsfYM4+X1FU/u/Cn5n9PJk3G9zIwjJ1UdeHyFzpTSC1CNZAL/T7xN7jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P194MB1700
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The PCAL-ness of a chip can be known from its chip type:
PCAL953X and PCAL653X chips have the PCAL register set, the others
do not. It's better to have a separate chip type for PCAL953X chips:
this encodes that the driver needs to use their extended registers,
without the need for a separate PCA_PCAL flag in the driver_data.

Remove PCA_PCAL bit and PCA_LATCH_INT bitmask.

Add pca953x_is_pcal_type() function to check if chip is PCAL.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
Changes in v2:

    This is a new patch.

 drivers/gpio/gpio-pca953x.c | 87 ++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 39 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index bee81101ba28..dcd508368520 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -62,9 +62,8 @@
 #define PCAL_PINCTRL_MASK	GENMASK(6, 5)
 
 #define PCA_INT			BIT(8)
-#define PCA_PCAL		BIT(9)
-#define PCA_LATCH_INT		(PCA_PCAL | PCA_INT)
 #define PCA953X_TYPE		(0x00 << 12)
+#define PCAL953X_TYPE		(0x01 << 12)
 #define PCAL653X_TYPE		(0x02 << 12)
 #define PCA957X_TYPE		(0x03 << 12)
 #define PCA_TYPE_MASK		GENMASK(15, 12)
@@ -90,13 +89,13 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "pca9575", 16 | PCA957X_TYPE | PCA_INT, },
 	{ "pca9698", 40 | PCA953X_TYPE, },
 
-	{ "pcal6408", 8 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6534", 34 | PCAL653X_TYPE | PCA_LATCH_INT, },
-	{ "pcal9535", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal9554b", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ "pcal6408", 8 | PCAL953X_TYPE | PCA_INT, },
+	{ "pcal6416", 16 | PCAL953X_TYPE | PCA_INT, },
+	{ "pcal6524", 24 | PCAL953X_TYPE | PCA_INT, },
+	{ "pcal6534", 34 | PCAL653X_TYPE | PCA_INT, },
+	{ "pcal9535", 16 | PCAL953X_TYPE | PCA_INT, },
+	{ "pcal9554b", 8  | PCAL953X_TYPE | PCA_INT, },
+	{ "pcal9555a", 16 | PCAL953X_TYPE | PCA_INT, },
 
 	{ "max7310", 8  | PCA953X_TYPE, },
 	{ "max7312", 16 | PCA953X_TYPE | PCA_INT, },
@@ -161,7 +160,7 @@ static const struct dmi_system_id pca953x_dmi_acpi_irq_info[] = {
 #endif
 
 static const struct acpi_device_id pca953x_acpi_ids[] = {
-	{ "INT3491", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ "INT3491", 16 | PCAL953X_TYPE | PCA_INT, },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
@@ -225,6 +224,12 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
 	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 }
 
+static inline bool pca953x_is_pcal_type(const struct pca953x_chip *chip)
+{
+	int chip_type = PCA_CHIP_TYPE(chip->driver_data);
+	return chip_type == PCAL953X_TYPE || chip_type == PCAL653X_TYPE;
+}
+
 #define PCA953x_BANK_INPUT	BIT(0)
 #define PCA953x_BANK_OUTPUT	BIT(1)
 #define PCA953x_BANK_POLARITY	BIT(2)
@@ -279,7 +284,7 @@ static bool pca953x_check_register(struct pca953x_chip *chip, unsigned int reg,
 
 	/* Special PCAL extended register check. */
 	if (reg & REG_ADDR_EXT) {
-		if (!(chip->driver_data & PCA_PCAL))
+		if (!pca953x_is_pcal_type(chip))
 			return false;
 		bank += 8;
 	}
@@ -351,10 +356,17 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 
 	switch (PCA_CHIP_TYPE(chip->driver_data)) {
 	case PCA953X_TYPE:
-	case PCAL653X_TYPE:
 		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
 		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
 		break;
+	case PCAL953X_TYPE:
+	case PCAL653X_TYPE:
+		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
+		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG |
+		       PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
+		       PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK |
+		       PCAL9xxx_BANK_IRQ_STAT;
+		break;
 	case PCA957X_TYPE:
 		bank = PCA957x_BANK_INPUT | PCA957x_BANK_OUTPUT |
 		       PCA957x_BANK_POLARITY | PCA957x_BANK_CONFIG |
@@ -362,12 +374,6 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 		break;
 	}
 
-	if (chip->driver_data & PCA_PCAL) {
-		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
-			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK |
-			PCAL9xxx_BANK_IRQ_STAT;
-	}
-
 	return chip->check_reg(chip, reg, bank);
 }
 
@@ -378,20 +384,22 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 
 	switch (PCA_CHIP_TYPE(chip->driver_data)) {
 	case PCA953X_TYPE:
-	case PCAL653X_TYPE:
 		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
 		       PCA953x_BANK_CONFIG;
 		break;
+	case PCAL953X_TYPE:
+	case PCAL653X_TYPE:
+		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
+		       PCA953x_BANK_CONFIG | PCAL9xxx_BANK_IN_LATCH |
+		       PCAL9xxx_BANK_PULL_EN | PCAL9xxx_BANK_PULL_SEL |
+		       PCAL9xxx_BANK_IRQ_MASK;
+		break;
 	case PCA957X_TYPE:
 		bank = PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
 		       PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
 		break;
 	}
 
-	if (chip->driver_data & PCA_PCAL)
-		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
-			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK;
-
 	return chip->check_reg(chip, reg, bank);
 }
 
@@ -402,17 +410,17 @@ static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
 
 	switch (PCA_CHIP_TYPE(chip->driver_data)) {
 	case PCA953X_TYPE:
-	case PCAL653X_TYPE:
 		bank = PCA953x_BANK_INPUT;
 		break;
+	case PCAL953X_TYPE:
+	case PCAL653X_TYPE:
+		bank = PCA953x_BANK_INPUT | PCAL9xxx_BANK_IRQ_STAT;
+		break;
 	case PCA957X_TYPE:
 		bank = PCA957x_BANK_INPUT;
 		break;
 	}
 
-	if (chip->driver_data & PCA_PCAL)
-		bank |= PCAL9xxx_BANK_IRQ_STAT;
-
 	return chip->check_reg(chip, reg, bank);
 }
 
@@ -661,7 +669,7 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
 	 * pull-up/pull-down configuration requires PCAL extended
 	 * registers
 	 */
-	if (!(chip->driver_data & PCA_PCAL))
+	if (!pca953x_is_pcal_type(chip))
 		return -ENOTSUPP;
 
 	mutex_lock(&chip->i2c_lock);
@@ -777,7 +785,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	int level;
 
-	if (chip->driver_data & PCA_PCAL) {
+	if (pca953x_is_pcal_type(chip)) {
 		/* Enable latch on interrupt-enabled inputs */
 		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 
@@ -859,7 +867,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	DECLARE_BITMAP(trigger, MAX_LINE);
 	int ret;
 
-	if (chip->driver_data & PCA_PCAL) {
+	if (pca953x_is_pcal_type(chip)) {
 		/* Read the current interrupt status from the device */
 		ret = pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
 		if (ret)
@@ -1251,7 +1259,7 @@ static int pca953x_regcache_sync(struct device *dev)
 	}
 
 #ifdef CONFIG_GPIO_PCA953X_IRQ
-	if (chip->driver_data & PCA_PCAL) {
+	if (pca953x_is_pcal_type(chip)) {
 		regaddr = chip->recalc_addr(chip, PCAL953X_IN_LATCH, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
 					   regaddr + NBANK(chip) - 1);
@@ -1325,8 +1333,9 @@ static int pca953x_resume(struct device *dev)
 #endif
 
 /* convenience to stop overlong match-table lines */
-#define OF_653X(__nrgpio, __int) ((void *)(__nrgpio | PCAL653X_TYPE | __int))
 #define OF_953X(__nrgpio, __int) (void *)(__nrgpio | PCA953X_TYPE | __int)
+#define OF_L953X(__nrgpio, __int) (void *)(__nrgpio | PCAL953X_TYPE | __int)
+#define OF_L653X(__nrgpio, __int) ((void *)(__nrgpio | PCAL653X_TYPE | __int))
 #define OF_957X(__nrgpio, __int) (void *)(__nrgpio | PCA957X_TYPE | __int)
 
 static const struct of_device_id pca953x_dt_ids[] = {
@@ -1348,13 +1357,13 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pca9575", .data = OF_957X(16, PCA_INT), },
 	{ .compatible = "nxp,pca9698", .data = OF_953X(40, 0), },
 
-	{ .compatible = "nxp,pcal6408", .data = OF_953X(8, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal6416", .data = OF_953X(16, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal6534", .data = OF_653X(34, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal9535", .data = OF_953X(16, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal9554b", .data = OF_953X( 8, PCA_LATCH_INT), },
-	{ .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_LATCH_INT), },
+	{ .compatible = "nxp,pcal6408", .data = OF_L953X( 8, PCA_INT), },
+	{ .compatible = "nxp,pcal6416", .data = OF_L953X(16, PCA_INT), },
+	{ .compatible = "nxp,pcal6524", .data = OF_L953X(24, PCA_INT), },
+	{ .compatible = "nxp,pcal6534", .data = OF_L653X(34, PCA_INT), },
+	{ .compatible = "nxp,pcal9535", .data = OF_L953X(16, PCA_INT), },
+	{ .compatible = "nxp,pcal9554b", .data = OF_L953X( 8, PCA_INT), },
+	{ .compatible = "nxp,pcal9555a", .data = OF_L953X(16, PCA_INT), },
 
 	{ .compatible = "maxim,max7310", .data = OF_953X( 8, 0), },
 	{ .compatible = "maxim,max7312", .data = OF_953X(16, PCA_INT), },
-- 
2.37.3


