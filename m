Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2E060DF63
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 13:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbiJZLTD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 07:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbiJZLTC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 07:19:02 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4BF9258C
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 04:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcU0bQeJiYDaD/2KZdDWfgeCUCIsI/h1VtRU3bAFcWHc8T4AwLZk75X46vIGyBkwtyL88KwbdMoKcmPQIMA6CSZXthCVCHDnElPe13q4IaYcG5Fb1wH29WJ8fo/TtO44MH+RunqR+FB3VG08rRJt2L7gtY007Z+8zoOAnSGwzxXgzr7hNHehy4qmJgSai+g7hnYW4Lo/myQGJguJgzsOggt4hWQLCzHdz0K273DUcJVoWe5ACPKYblbnv+ui6skjoLk19QlnTCWbVCSSrj3VZj5q+6FxufJ04BLpMtH2Bq+xZSxvuAjVN8LIvKRg+T2cQUguRysynUo2S2BqBP4UOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWaHyqjW7bvJ199wN4lWFztgWz/TwWZUAFoCLabTMKE=;
 b=Jgwlq/ozdqg9JWJaw6cMjYfKpOri5XwbtV2o1fSQXATx4dywGjePWpO4PI1mBPv+Cyp1xITtL8nKUhsPKuhg08VN5jfoQxLJwtCBftpcTmAw739u2wQy5X/eECCGCw3hJJ5ulE5c+j1P5efmu8yw9hQoc8apKQwtEJEtCStBGvS+ugZz91Woui0rPU8ZHLscV2ePCu/16mcEFCY+WuAEgafzgEw2fwkZEtaYMOX2n+Bez6pRDlofmEOBVbBB5QJ4ZF0FU8Yccw9pJnQUS04PfgM3imCYB8fM5YyPbT6I0l+uKoMJQjmr5Wq9+Xm1+4yKkw65KUDFyGBmrv7SKck5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWaHyqjW7bvJ199wN4lWFztgWz/TwWZUAFoCLabTMKE=;
 b=M6z7Gq073knlk5Qeet24V48P2EKBZEDd8hsqCs6IRCLUZ2Jg+JhXlfXoRC9ygI42NQoh1UBkBMnZJYpeI5z5hibsA+XDGEZ6bpeYqUp1QblkyKDqaqWble/al30Qmq8o55PE3COM5y0tY1hizKAfNIWv/yfVsLKx87ctc1O1ZHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by PR3P194MB1667.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:176::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 11:18:59 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f%7]) with mapi id 15.20.5746.027; Wed, 26 Oct 2022
 11:18:59 +0000
Message-ID: <0de783a2-d35c-6f20-4c22-86d6cd8dbc41@eilabs.com>
Date:   Wed, 26 Oct 2022 13:18:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: [PATCH v2 1/6] gpio: pca953x: Convert PCA_TYPE from bits to number
Content-Language: en-US
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        "Peter Robinson <pbrobinson"@gmail.com,
        Nate Drude <nate.d@variscite.com>
Cc:     linux-gpio@vger.kernel.org
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
In-Reply-To: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0167.eurprd08.prod.outlook.com
 (2603:10a6:800:d1::21) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|PR3P194MB1667:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd68b66-28e5-4068-2bfe-08dab743e0d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7/+sqnraxj1v8cQ8ZQREP5lKeOe/cBRQMZeGCEzeMy72CUmhj9oXHP2TIelRIBILc/hclSP7eTMyspk+31mEKdHrldO68oKB3ay39bKfE6u7tJWj7qB3TQqgMPRAmTD1tArDMB7q9jICevaHizRj1Inshr9jCMlBnguozSYKZFpAWt3XcnSetuN0ZwaBwLu9ERyO8lL4czWxXJOwJtXfcbomrWkn/wjDnnqInJ2j3O4xeMj/H2ns/TKRIWdNUWkrE8XfpuWA6aHi8e+inphJgiq/+eKBUw+F9SK3NR0XMlA48mJcMtp6evEb7Z6s8bG2KLqVZMB0fnQ0C2S9AxlsOCoByPBg/NeqgzaRQ1M/2rg+TUViZeokBWO+8F7xTnrg0j875l+IZhbNArjkVeZGuFu5EieAROxNAsEDOD/aMhm67t77lZF7KGVMKlUMfy1kw67x5YYtL0sDd8B0BkuojA5lukpxM+3LRr0aipvbXXovsJKkXVpydD/8/UKqIYVt2RsYqWHNycEQtIRkn2fLqcw2Ys1qFNWIEm1liUquaZflEeTjlNYfT7NsSgOKt59QQ6cb3UzsQwSYsUcQYp3TAr9YdPqeGiSIvoM7Q3M25ctlT/ymje9d5tHdUxpc4b78wxYb0y3m+HgL9sydFOcRTQf0f6M/DQglUDhjmaeQGN7tkRnoLyszl/4jtoXWqxhBe/2Jlk0yFC82cJskief6w7Nx9GYBXA7ZkQttHZvBTNCqWBy6TWR+Dn7q6gNMengaGZRHDjUUu2MlwsAWGoeuLXRP5L4akHEAvNvaG9/+z8LjNvIHNPw3F2eYbhypwva5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39830400003)(376002)(366004)(136003)(396003)(346002)(451199015)(38100700002)(921005)(6486002)(31686004)(478600001)(36756003)(110136005)(41300700001)(8936002)(26005)(6512007)(5660300002)(86362001)(66476007)(7416002)(31696002)(83380400001)(6506007)(186003)(4326008)(66556008)(66946007)(8676002)(66574015)(316002)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1RvS2xNT2luNmFNaXhTR1BCRlhIR1E0b2JWb0hWSXZaellRVlg4bkI0b1hX?=
 =?utf-8?B?bHlnYTNIUkFJZUpSL002Z2xlZWIwTGUvRjV2d3hFc0RiSitNUVBLK092YlVl?=
 =?utf-8?B?MlNIVVdEUnA3U05iUUFneVVsVmthQ3NndGNiL2lhcmVTd2dqNG52aXJ6ZEpJ?=
 =?utf-8?B?U3Rvd3lXTitQWW5lc0p2cnFudDlaeVVIZ0dtWnlYNVloby9CbnJLaFd6U0s3?=
 =?utf-8?B?NWZVSExldU1XYUx5dWQrMUs2cXdtdTFsNUd3SkppVzJLdElERkhUdTJuTmdO?=
 =?utf-8?B?akY0ODRHMEpzWlpyS2Q4U0Y5aGZYSklvd1lQYXE1RER6dDdiZGVJU3FxSXFm?=
 =?utf-8?B?Z2FVNFE4aGVoRjZoUDEyc2dJQmVITXNwb01aekFRR21VMzJPRHV2Ti9wNTFF?=
 =?utf-8?B?U3huNkhyM0JlNXV4NEFYNEJ4blgvY2dQanNKdTNiZWczcE9ObzY2Zk95Sjd5?=
 =?utf-8?B?QkwyUGV5QU16NUVKMkE5QnhiWm1kUnhLcVFzZFFHTFdWYzB4amVsZU1HZUYy?=
 =?utf-8?B?OWMyTGRFenJYbVd1aEt3T0MzZ29GVlZtSFJFUW4yVWJMeW9ld1kyMldWYzlq?=
 =?utf-8?B?SE91UzRwRGoxb25CUXM3aUsxLzE2a2M5VDd5N0ZJejBYdXF2c1Z4ZmFoQlV0?=
 =?utf-8?B?a2pzUEJybU0wWTJPK2g3djhicFE3c3oxWTlOL1R0Y0F4OXdjQXgvb2FGWWRo?=
 =?utf-8?B?NTlTNi9rZ2cyUm1WeTBXMmc4a1Y2N1hMaklIbzZHaW1teTRSd0s4VnNCMzRQ?=
 =?utf-8?B?T2E0SUh6YWxyOU1qUXMzQjZvblpJWnE3N1ZyMDJqWWVyY0RGUEk4YktHei9s?=
 =?utf-8?B?bk00UENWNlZYNVJucnpIUXZmajNMcE9OMEhVOW0yU1UwRlpSeEhvQjllaHpx?=
 =?utf-8?B?VkJDNTZiNXc5Vmxpdnc4VXpQbFVLdkJYWC8vWHYweDJNQ0habExtR05ZY0Vy?=
 =?utf-8?B?bklsclFsRjlEa0pXblNacEdobWlrb1h0dGRSMWs3YnNaeE1nVU9RV1FYV0ZX?=
 =?utf-8?B?NklOTlRiY1d2eXUrTXVQT1RpdnFPS0xTRXV4ZUdicTJnU3l2bEZ6dTlXNnpQ?=
 =?utf-8?B?VTdmMHVZZWY1NzNkcFNTMU54amViVjVvZ0dIZkk1c0lyWTh2SGJQVWlrRmxP?=
 =?utf-8?B?Y0FLamNJbENsazdyZFNYR3FVNm5yRnozV1VxZWdOQTBPMVAzSWl6Y0RqVUFW?=
 =?utf-8?B?UWM3cXRMdllnWUJIYWo1WEE2ZzdLZ0JHYzdNMHF3U3A3SEJoYUFDMWlURXhx?=
 =?utf-8?B?ZWthR2hDUnhvbExFaEduVHBnVXIvbWVHRnRnNEpQcjZYV1E3aC9rek8vZzlM?=
 =?utf-8?B?M1M5WkM0eTloMDM4ZHJ0clRLMXVRS0JGQlNwclVCZkI3clc1NHdKbFJHTmRj?=
 =?utf-8?B?ODJOcHZ5TXZNZXU3dzdBeUdjbVY3eXNEWlpNM092WkQ2eVpOQ3FjTUN2M0Js?=
 =?utf-8?B?R1pRV0N3WGwrLzZlNU9EVE1acmdaS1VHQUgvdU9RMWN3K0tzQ3k3SFV2Y2ZE?=
 =?utf-8?B?MEdLZlBSRTdHbStwcWd6dlBpdC9RRm5pZW5iYW5iNFhkbURVSVkyVkdvZE1O?=
 =?utf-8?B?YlV5VDQ4T05nN20rSkFheVpjNUxBSmlzRG5qYngvMzllOC93dkdGMW92WjJD?=
 =?utf-8?B?ZXhqQk9obHZXYlNJaFUxLzZYODNqVlRwMkN0UDZFUlN3RG5GbkpHNUluQUs0?=
 =?utf-8?B?T2RBcTU4NXpFL1RLOXBPU0QzM3U1eGxzSWJYRUtPbTV0SUtPd0h5R2dSd25U?=
 =?utf-8?B?REh4VU1qOTlaUStNSk1WU01kcnJxOGxHengyRlhTYmI1cERzVlJaM1RvQWw2?=
 =?utf-8?B?ZW42SlB5eTR3T0R6QkZRZFduMmdwMFNsWXdwVmh6LzZjcVpIVzNlYkxhMitq?=
 =?utf-8?B?Y05GcHM1MVNodnJaaDNyaU9lY3Q5MEhaUjcwOUI0UXgvZm5STG1BZXdGV0NJ?=
 =?utf-8?B?RW85V2NtU1VUVVp5T3lTdzQzS3g2TExzUjF5RW1Dd0V1SjE3cGNkV1pUejhL?=
 =?utf-8?B?aHVTZmJuNW40Q2Rxek92ZmdPdXgzMkZHZlZKbjN3RE1wVnNtcm9YNzNIbENN?=
 =?utf-8?B?cGQ4blRpVTNhUTUwTTBLU0JzK0NjQlFGam1UdXNzckRuRjN4eWE1U1Jsb1pv?=
 =?utf-8?B?alY0K3Rzc2JHSDNVWGdNNzNJbXFBc25qWFF1SjFyc2ZhcjFGS0dJL0tPTjJ1?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd68b66-28e5-4068-2bfe-08dab743e0d3
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 11:18:58.9755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMfuk5v/VrhhcPcWIapA58tnlZiF+jpS1kqVXn3nrlfvMJrA6K/Tx1NHQ8afvtGMLmjQV5yQg83jnLyGBsQ7IEv7CEAtAUe1NOFy2xBH164=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P194MB1667
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are 3 chip types already in the driver:

    * PCA953X_TYPE (standard register set, + pcal chips have extended set)
    * PCAL653X_TYPE (standard + extended register set, different spacing)
    * PCA957X_TYPE (standard + other registers, different addresses)

A later patch in this series adds yet another type. This would take up all
4 bits allocated to chip type information in driver_data, leaving no space
for new types in the future.

Convert PCA_TYPE defines from bits to numbers.

Replace if-else statements with cleaner switch statements. This makes it
easier to add new types.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
Changes in v2:

    This is a new patch.

 drivers/gpio/gpio-pca953x.c | 43 ++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index ebe1943b85dd..bee81101ba28 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -64,9 +64,9 @@
 #define PCA_INT			BIT(8)
 #define PCA_PCAL		BIT(9)
 #define PCA_LATCH_INT		(PCA_PCAL | PCA_INT)
-#define PCA953X_TYPE		BIT(12)
-#define PCA957X_TYPE		BIT(13)
-#define PCAL653X_TYPE		BIT(14)
+#define PCA953X_TYPE		(0x00 << 12)
+#define PCAL653X_TYPE		(0x02 << 12)
+#define PCA957X_TYPE		(0x03 << 12)
 #define PCA_TYPE_MASK		GENMASK(15, 12)
 
 #define PCA_CHIP_TYPE(x)	((x) & PCA_TYPE_MASK)
@@ -349,13 +349,17 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	switch (PCA_CHIP_TYPE(chip->driver_data)) {
+	case PCA953X_TYPE:
+	case PCAL653X_TYPE:
+		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
+		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
+		break;
+	case PCA957X_TYPE:
 		bank = PCA957x_BANK_INPUT | PCA957x_BANK_OUTPUT |
 		       PCA957x_BANK_POLARITY | PCA957x_BANK_CONFIG |
 		       PCA957x_BANK_BUSHOLD;
-	} else {
-		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
-		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
+		break;
 	}
 
 	if (chip->driver_data & PCA_PCAL) {
@@ -372,12 +376,16 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
-		bank = PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
-			PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
-	} else {
+	switch (PCA_CHIP_TYPE(chip->driver_data)) {
+	case PCA953X_TYPE:
+	case PCAL653X_TYPE:
 		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
-			PCA953x_BANK_CONFIG;
+		       PCA953x_BANK_CONFIG;
+		break;
+	case PCA957X_TYPE:
+		bank = PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
+		       PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
+		break;
 	}
 
 	if (chip->driver_data & PCA_PCAL)
@@ -392,10 +400,15 @@ static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
-		bank = PCA957x_BANK_INPUT;
-	else
+	switch (PCA_CHIP_TYPE(chip->driver_data)) {
+	case PCA953X_TYPE:
+	case PCAL653X_TYPE:
 		bank = PCA953x_BANK_INPUT;
+		break;
+	case PCA957X_TYPE:
+		bank = PCA957x_BANK_INPUT;
+		break;
+	}
 
 	if (chip->driver_data & PCA_PCAL)
 		bank |= PCAL9xxx_BANK_IRQ_STAT;
-- 
2.37.3


