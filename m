Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A07E160DF78
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 13:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbiJZLZc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 07:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbiJZLZa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 07:25:30 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A1F40032
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 04:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha4pVUOU0yf/6LLUthSXZ7OCu1tWy7s6nhMUzpUw2vqc1p5lG/a7WLpclau2Auy0e2g8Nwc1/SkovD4gdHa7JWd2jDCEJadFJMP5AEMw9L7l9yMh54Yf12Ds8EZW6JVuDEcjynAOdYVWlWefelB5Bm5RY3j7ACGxaFCpris0Kgb1Ia3ixfhTgQFQpLaxL7iJJFtVMIvExTE+0LZSl9a0iQ7m/oQ5cFycf+0gFBM1ID4QLLnPZ5Vjb62GPpuX0jEhTorKOK4k7x1f1Cuh80C6FoY5VYHB1qEx3NiSMcCaBVSoMwpD5EmPQDg8MjRbqWwNWtBiht+84V7H2QNQnQ7Kig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeu65/TUChYD73hC622Fp5hU3jUx6l7zPma+xn/FXUs=;
 b=ScRdro/htSMHfH+N6Fi0Vd2WM7E7pBpKzuKdsQipuUSwwkr2TeLSV+WUcuF36u2hBSCWl/8WQe8jj9ohbsnyF227ikaNEQiBdQZ63whjTNEEFj0MIxCC8xwP/scje+lZWlPgWwuVb93cfR/xpc4NbijAJV4v3QyEH0kye5yYotejEWLjIZ2oFVypXZDIDS/6gSwSyMVBTjeGXVHBydInoE0N6FBXIdOmXFUpLjmsbEoFHTEV06gkMRC1yxtYtWbgjTrvTICddCaOXVAOdKsIkGZu8NkFNN5PiwbHXclJLCVDxgEeagt0Puh/GaEvaynwuxMAnbuLN7+94nqkVgq6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeu65/TUChYD73hC622Fp5hU3jUx6l7zPma+xn/FXUs=;
 b=wfZ1lDoRH/Z94omDCiaCsmuMXlihp4Hi8w5bFQlbg3RE18mkQxuffmrb5uXO+JVj4zzbfY69NDlzV3+PINb42KsekOkEEpsgkqqUy2Zh23BUzDbeYwLLx80ys1obFoks0h0IF+jRIxPSErG/6bUPhHPJwAW8un4elZZjy+T3qjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by VE1P194MB0784.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:168::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 11:25:24 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f%7]) with mapi id 15.20.5746.027; Wed, 26 Oct 2022
 11:25:24 +0000
Message-ID: <9df1a016-36be-14b7-9674-d18c7df208c7@eilabs.com>
Date:   Wed, 26 Oct 2022 13:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: [PATCH v2 5/6] gpio: pca953x: Add interrupt mask support for chips
 with the standard register set
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
X-ClientProxiedBy: VI1PR0101CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::50) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|VE1P194MB0784:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8c112e-0b4c-4a50-8a9a-08dab744c69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q2ka5/mS1PvgWz7S0aj5zHmh3FrG2vgM0f9zDnidCbUmtlGkx4QOhKfkJzPBqLkRceoqWwh7Tma4KZJPwiEbMUIBPKl9NqGDgD+EAA3gEx9se4nQv8XFbRZ8Wxq6RxEDOpGP2o3zX1FmqGlX+8z7rACffJU/d6M7o8JiGWDss7wvThs5l1ky8oHd+hB465TjA1+aLRQ2z4m+M2iBLMHuQYgExXG5ASYfZudWu/UkCMg67lM3iv3L/LdQr0qCySRnrzI05pasR1kF7vwAVQxIRCeqav4ujZVAGk90XlmdpVKMYfUC8iEHgNBKy23xNj1QyfOYO5ud0L+novSv9+fl8jLAMHlxlUgNoEcuC0Y2xhczQEfRJ4lRd6A+TNTf4sAa08Rq5qohs5eIk0XplgnoF9L77n/NrOydj9mLXGNmVxCrJlrYlSW8Z9PtRLWKr3uTyvktkvaWZrgyUK+jV6cpHEzHp8k4Q66S2604O5G+RUxvUFAsf2387BRoycbQ8JWQ3rpwr3j6pcPLpTlmBC4kQGPwiDcUCQ3H+eMfWM4aCeyHik5GT21zZlZUpEYAnBPQgID2Cv4gUwgWFT6GRkgpa7eQGtWFjXvnqepTIj9v4gV3Zxhu9djJyWk51K3N+sGIeuDRbTU3xX6EtSfmn5sq8fW55wR3l7CT/Pxs6bvrN7CN94eP4gI1PfFyLdwLQHjpOoxJMejJoaC5do2Z/KZ2O/hatSXwNbkHTRgOjNOiSR01IH2+W2mHb5SJdvGi+xFIbZ5kt3cjN6C9L3Z2t+KBQM5rJsm/2OSyOuBLUWwtKAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39830400003)(346002)(136003)(376002)(451199015)(31696002)(86362001)(36756003)(31686004)(38100700002)(2616005)(2906002)(6512007)(6506007)(26005)(478600001)(83380400001)(186003)(66574015)(66476007)(8676002)(110136005)(6486002)(66556008)(316002)(5660300002)(41300700001)(66946007)(4326008)(7416002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjYvR1NCdUZLaGNkRmtlWXUrQW1mb1BhWWplQzJodXQwUDdtRWNoT2hCSU1N?=
 =?utf-8?B?MVhFL2xJL3ZzclV1STNIYVlZdzg4aHNIZGs3TDc4ZHlGTjdJMGpmSjBwKzlN?=
 =?utf-8?B?K0J2dTZ6Yk9LaVJ4RVpPRnZkWllDOW5vdHg3dHBsUkJTTGc5TWg0TFoxc005?=
 =?utf-8?B?Q0RwdllZajRXWUdXV0ZFNEZ0SDFhSmxmS2VGWHRQeDdvaEYzdWRHTkxEbi9x?=
 =?utf-8?B?QTEyWVZvOHJtTDhTZ2FXRUx0UHVOZTFzdWNPQXkyYloxaDNJc0ZmUHZSaGJG?=
 =?utf-8?B?SmpFN1Rsd0FGaGsxcDRiMWF0aGg4NDJ1MkJ6SEJGeHUycVpxRmdTOHozNkRQ?=
 =?utf-8?B?TVh3R2lEQm92VUtJWWQ4SlRGQnlrdDkxQXpKVHFIOVR0N3Z3dkozRkhCTGtB?=
 =?utf-8?B?b3dBNm94cHlwWERHREdjWitmS3pxa3pZYnU5NU00bDk5LzBYeGRhem5VVWIz?=
 =?utf-8?B?MGx3VmU0K2lBbmVnK3U5dzNqVGZ4UXc1TDlNWkpsL2oveWJyd1pBZlNmeVhm?=
 =?utf-8?B?bmVIaXN6aDJIQ005Vm1aaHdNS0M4MDFWQ0pHazU3ODJleXd5Rmt4Z2EwYVF4?=
 =?utf-8?B?MzIxRlZCbkhsMXBMaERMM1plU08xeGxQelo2bXlBVWVpVnRuZDFkcXRCSytD?=
 =?utf-8?B?dFNZMkVsSWo1TlJzZ0hkN2cwcEpFcy82c3R4VDUrRFNtOVk1bUpIcEFEZFUy?=
 =?utf-8?B?cytHZkpqUTM5ZUZEZCtIM1NHdkJyTjg5UjlKRUJibDlwbUg3b0JJelNoQy80?=
 =?utf-8?B?Y1hGeUlINGYxWHdLazVpMlZqMTd5bzNGTFo4WjU5eEp5OEQ5aTZabUVxUnNw?=
 =?utf-8?B?NUFSU3VaV3lGbHd4RWIxL1FweHFXUjZyQi84dFhoQ0R5UW9mY3pqeWV4d3E3?=
 =?utf-8?B?Z2hFTkRaYXd0ZXlQTlFXR2ZrT3hFYlFac1d1ZlF0SWhxemZVUkQ3Y1FpRU5j?=
 =?utf-8?B?YUpFN3R6eGhmTld0d0taRDhubjJ3S2d0UVo0WTNCV0h1Z28yKzMrd2ZmZnFj?=
 =?utf-8?B?TitabkhLcVRGRjdWa2FBcDlnRnl5cTlzWlRSV0RQSHpNSzEvWXl3RDk2K2FX?=
 =?utf-8?B?V05Ua05hbHNQVExkbE5KMWM0WHRLVGc2b0owSkVmbGw1d1NVYjlKMFZSVC80?=
 =?utf-8?B?TE03UlBsRTAxVGVCQi9BZzg1RUkxRDhCdXo4Rmt6VXNEVE5Xd0ZwZDFPaCtC?=
 =?utf-8?B?RWlpakhRZnJjOVNydlhRd3VsQ3JKR2FGOVpSSE5GQnQ1OUUzcVErT1gzVnc4?=
 =?utf-8?B?L25rWWpJeVVPY1NFM1NCYWVNcWJDemVMbFI2a1UwRGpCZWxiV3ZRd1dzaVZq?=
 =?utf-8?B?V0M3eHUvZXZIdFRKdVlLWkY2QjZtajByb3NrZmZ4UVplTSt4bzhVVFprVUpR?=
 =?utf-8?B?c25NeENMRTNZdkJXb255RVdzbnhsaG9VbE9HZzl3WnNiZGxhUzR1QmhxTGNs?=
 =?utf-8?B?SXBnZk9GczZyYzdySi8vY2xZTDdWV1NlelI4aTNxWTlNMmtFUUZXREgrL2JN?=
 =?utf-8?B?UGloWGloMGUwTXBDU0tGQ01MdlZYUjE5Y0M2SWQzeC9LTTJvcmZSOWM0cDlp?=
 =?utf-8?B?VUZLSDAzaDBYaVBwZmRYTWNaN1pZOWVuSnZ4T1B1ZTdWaHB5QjkyWmJJdEFM?=
 =?utf-8?B?TTNiVzZRODlXK0NGVldaQnB1NDFwTGNMZjRmTW96ZnFXa0xXdDRoWkl6aGx1?=
 =?utf-8?B?OVZJRGEvaVBySk1MRmFsZVVWTzRjcyt3cnlDRzcyN3kzbzFUa251Zmw4dk5r?=
 =?utf-8?B?azZnelYycTI4NXVZS2Flay83Zks2VUtMTmpSL21TUHNMdVR2dmxmdnloVkIv?=
 =?utf-8?B?NFFhWDJ1WUduMnZ4L3duTEFHMmFMQkJkRFYrbk5QU3F5d3hxdkxUK29CMFk0?=
 =?utf-8?B?NSsxTzNaRnI5QU9pYXEzZVRNbHlSNVNaUEx1aEl0K1ZyM2N6WDdFTElXcm04?=
 =?utf-8?B?RnFCWlZLbnhLbmlTZHJXcUt2eTlnTzk0V1ZBUjdtc0RpbEhhVFhxaVpwOHlp?=
 =?utf-8?B?K1BsMWo5QW96V290cEMyNUpJTFh0OFdGcXEyT2JCanc1ZW5BUXlKRDBkZ3pa?=
 =?utf-8?B?dVBGNVp6S1VLTGY4NGZ3b21xelM4YzVsbDZDbjkvei9IY2hoQVkxZlFDYUU5?=
 =?utf-8?B?cVJacHhlaitFRjM0ckM0WThZVEJoNHNQMnJqMG9vUDRiNkkyUU4vdlRFb0F6?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8c112e-0b4c-4a50-8a9a-08dab744c69e
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 11:25:24.6003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbSchezSSCKgrdXa8dsnOjVSIb5DzesX0O0Di3UKnbDS4GvncgVqCtqFUdLR+e3MyPdAAalg300SCoTyEPswcQ4v4OyGqW1AxONn2n6kCaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P194MB0784
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some chips in the pca953x family in addition to the standard 4
registers have a fifth interrupt mask register:

    0: INPUT
    1: OUTPUT
    2: POLARITY
    3: CONFIGURATION
    4: INTERRUPT MASK

Chips with this register:

    - pca9505
    - pca9506
    - pca9698

This register defaults to all interrupts disabled. The driver has to set
the register to use interrupts with these chips.

Add PCA953X_INT_MASK register. Use it as the interrupt register of
(non-pcal) pca953x chips.

Set pca9505 and pca9506 to use this register.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
Changes in v2:

    No changes.

 drivers/gpio/gpio-pca953x.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 2cf9541057a8..1e563d5b77e8 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -28,6 +28,7 @@
 #define PCA953X_OUTPUT		0x01
 #define PCA953X_INVERT		0x02
 #define PCA953X_DIRECTION	0x03
+#define PCA953X_INT_MASK	0x04
 
 #define REG_ADDR_MASK		GENMASK(5, 0)
 #define REG_ADDR_EXT		BIT(6)
@@ -75,8 +76,8 @@
 static const struct i2c_device_id pca953x_id[] = {
 	{ "pca6408", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "pca6416", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9505", 40 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9506", 40 | PCA953X_TYPE | PCA_INT, },
+	{ "pca9505", 40 | PCA953X_TYPE | PCA_MASKED_INT, },
+	{ "pca9506", 40 | PCA953X_TYPE | PCA_MASKED_INT, },
 	{ "pca9534", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "pca9535", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "pca9536", 4  | PCA953X_TYPE, },
@@ -186,6 +187,7 @@ static const struct pca953x_reg_config pca953x_regs = {
 	.output = PCA953X_OUTPUT,
 	.input = PCA953X_INPUT,
 	.invert = PCA953X_INVERT,
+	.int_mask = PCA953X_INT_MASK,
 };
 
 static const struct pca953x_reg_config pcal953x_regs = {
@@ -255,6 +257,7 @@ static inline bool pca953x_has_int_mask_reg(const struct pca953x_chip *chip)
 #define PCA953x_BANK_OUTPUT	BIT(1)
 #define PCA953x_BANK_POLARITY	BIT(2)
 #define PCA953x_BANK_CONFIG	BIT(3)
+#define PCA953x_BANK_INT_MASK	BIT(4)
 
 #define PCA957x_BANK_INPUT	BIT(0)
 #define PCA957x_BANK_POLARITY	BIT(1)
@@ -276,6 +279,8 @@ static inline bool pca953x_has_int_mask_reg(const struct pca953x_chip *chip)
  *     Output port			0x00 + 1 * bank_size	RW
  *     Polarity Inversion port		0x00 + 2 * bank_size	RW
  *     Configuration port		0x00 + 3 * bank_size	RW
+ *   - Some chips have the standard layout with additional interrupt mask:
+ *     Interrupt Mask port		0x00 + 4 * bank_size	RW
  *   - PCA957x with mixed up registers
  *     Input port			0x00 + 0 * bank_size	R
  *     Polarity Inversion port		0x00 + 1 * bank_size	RW
@@ -379,6 +384,10 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 	case PCA953X_TYPE:
 		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
 		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
+
+		if (pca953x_has_int_mask(chip))
+			bank |= PCA953x_BANK_INT_MASK;
+
 		break;
 	case PCAL953X_TYPE:
 	case PCAL653X_TYPE:
@@ -407,6 +416,10 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 	case PCA953X_TYPE:
 		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
 		       PCA953x_BANK_CONFIG;
+
+		if (pca953x_has_int_mask(chip))
+			bank |= PCA953x_BANK_INT_MASK;
+
 		break;
 	case PCAL953X_TYPE:
 	case PCAL653X_TYPE:
@@ -1374,8 +1387,8 @@ static int pca953x_resume(struct device *dev)
 static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pca6408", .data = OF_953X(8, PCA_INT), },
 	{ .compatible = "nxp,pca6416", .data = OF_953X(16, PCA_INT), },
-	{ .compatible = "nxp,pca9505", .data = OF_953X(40, PCA_INT), },
-	{ .compatible = "nxp,pca9506", .data = OF_953X(40, PCA_INT), },
+	{ .compatible = "nxp,pca9505", .data = OF_953X(40, PCA_MASKED_INT), },
+	{ .compatible = "nxp,pca9506", .data = OF_953X(40, PCA_MASKED_INT), },
 	{ .compatible = "nxp,pca9534", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "nxp,pca9535", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "nxp,pca9536", .data = OF_953X( 4, 0), },
-- 
2.37.3


