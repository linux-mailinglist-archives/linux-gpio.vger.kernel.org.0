Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F48060DF74
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 13:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbiJZLYJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 07:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233406AbiJZLYG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 07:24:06 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2076.outbound.protection.outlook.com [40.107.247.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C007CABD6
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 04:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpC6PddhwRUgw+a8M9tK7vOf6E545RR87OuSL4KyvwyY1JgdEAuQGXGuW/+EZvhEOjtimfYElGnqM1UI+Zc7YHsXU+nAghgubTKiBGk62drHVLNr9PZPtTqKXlVkAJg2xob05KHpgvm9aMyblqESwIEmJBhJdmClxJ2+QWgBC7EI3ONDqavx2z+Gqyn1ZHvarU1mv9l4kUhgRy75nGIOJKVNmz5CDxr3NJ7NqJFuiyrGYCHoAsS2VCWxy2tM3WH8U3inZJAyq128Vl8RCfB6+6fvbTNrC6ybYFmlPpIhsMccCtL4zvhfg/GB0U/PNQkdtwTuSuVH3w1BhLEfnfYaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzvUhLQuo9SVLbZjUHcPJhS2osetlu4Q+7dfGpLvdx8=;
 b=Na5lZ1mSpEaZLl+JWMHauCU4pYV9XLKeS6gr05pW5TiHgpb7uDatMiHOaVH+b8iNs/EAWalR7LW4WZxg6qQV+wC5M+8kUyV47vJZjpzyiRXu73iB6/K8W2OuySBELW3Aj+TAVlVy+K77UpVLVk1ucd3h2KKYGRQO7qP++fnFAqUcY+M9pbpqzsaMhsxxjvfn2O3WTHu5xw/q9jhW3a4ho0o3B3gdj4SFIunyQQx2YblVvZysZCykf/lm3aU9dueVnwzElojVWUpkEgexV4ZS/WbIIQCZixsbNaAPQoPhg0vuCykFIXL/cT1sMcG0LlJFcUlgRu7t0kVwtcNBojcelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzvUhLQuo9SVLbZjUHcPJhS2osetlu4Q+7dfGpLvdx8=;
 b=wnlKJGImw9Q1bge7ZVwJCd9xcHSfPh6WgjWMOySCfSOsefbVDr4YK3oo8wcKz/k/H4XOig1CObJJb+axcrCAuQEeWynmSOIH6cgjCqqWuY0oPFU1mf4D1uaB5bdOTy0yTHHAKQbdCGtvKyhGin7rTsXUmHUY01P2wZxfOJkDXa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by PR3P194MB1700.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:17b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 11:24:02 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f%7]) with mapi id 15.20.5746.027; Wed, 26 Oct 2022
 11:24:00 +0000
Message-ID: <edd3f359-effb-0951-f75f-b03ebb8b7b29@eilabs.com>
Date:   Wed, 26 Oct 2022 13:23:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: [PATCH v2 4/6] gpio: pca953x: Generalize interrupt mask register
 handling
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
X-ClientProxiedBy: VI1PR0601CA0029.eurprd06.prod.outlook.com
 (2603:10a6:800:1e::39) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|PR3P194MB1700:EE_
X-MS-Office365-Filtering-Correlation-Id: 93eac9d8-6a67-414d-5af0-08dab744947a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZ+I5UIXKCKhqetKmiUHizFzo6ewetP8IeykakfbUcAkI8dH2xfFUV+DRbA1xKmJJcKJ4D7EjoZiL5yMYYEYt0TTiHXun0MIrZHY0MHw0f5fjH0HMTw+rJ8kJ/8TR1BKsB+mETieL6b2rrHcphAbvIE7wRbZE8GbH2jhDt6uz/xZIpRb2xUQYLhIAs1N3Tl3nsHP1OzIuUIqi+VKGTLvDvFBHoPiIGtW3WA1OtovyLHSmVBR/zFHDJhuFPjdXUXzaXUpZjp8FfAakRvO47jxNjDEq+xTsl4475gzQ7qBKK+FYF28Cq0BjYTEuuOjrw9sCjg9MrBV3T97EzPbdo+hsLFC5jGu/AQYc4r2onOYMNwbiuF2UrvMuSlhcYwno5IzjJWo7qaTnVW7RWCzpW7D3Uk98sdceBz/wtWe3XIDJubq8qwnHL5YquLMVkTpU6sMVE2iFRtKt84DCdFSxGk6ijW8Sn9q0hyjYpfemxx6WMSl94AONoOt6WLyXUeZp/Dwytezy2GjX5UfGQm6rbqVfFvKrr990vBVtomFxjUZ/d41JRMLQO9GAVemWnmdHTaMc7rwONP0EndS3MoCp5x8+eBQF+xkC+6H6HMPVsMYIH74yxt5kEBEd+WpHoYOxEcKvuUrqH6mII+v8cdQL7HMNe29FY2iQdcVQ/yl6u6P82Y3AphygzbWR1tQbSpAH+0YnNEKJneK4p5b9Ak9wm72ZQRybrkV9fPXmbOOPXhQJIyuHfnQvICyqkGaPIHxk0x5ObPqa7Hsx1NOKnCchm6D0JxOgCIA/YkVT28OJhFhBUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39840400004)(136003)(346002)(376002)(451199015)(31686004)(478600001)(31696002)(83380400001)(6486002)(86362001)(186003)(66556008)(316002)(8676002)(66476007)(66946007)(26005)(6506007)(36756003)(6512007)(7416002)(41300700001)(4326008)(110136005)(5660300002)(8936002)(38100700002)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUhWU3d6TVFGS2ZUTkpJVlM2dUU0b2VHT2pkalR2ZEtsOHF1NDBDeGdPd3F6?=
 =?utf-8?B?SE5JR2s3SncyTzFCUmd5SzBxSUtEMTF3VkZsVndxSklFSExQcy95aDV0VkZ1?=
 =?utf-8?B?aGFqVGFIaGZqd2xHMnB1a2Rnb3Fjd2pPM1FoN1Erd3dTWGNOL3psMWtIUVkr?=
 =?utf-8?B?c2JBVDRVV2VMR1lKWWxSeXRBeHg4NmJQV1NxaTZhNGltK3pYQTFYdXlWclBo?=
 =?utf-8?B?cE5LMmtzMEc4ODdodS95bXRpdTdsRlowZ0w5N1VHYzJJeS9EU3RVZmlEcnQz?=
 =?utf-8?B?OWhzdlRYcmh2QkRqdGM3dGw5S01jYXc5YytuU3JzTVdhMTlmUEZQNVZjNEJy?=
 =?utf-8?B?eVFRSjZVVmZXbmh5RnBrVlJjNWhmTGhMTzZlUjdBOE5BMHB1YzFXRmViK2tU?=
 =?utf-8?B?V1FkOU44VWNEVExaVTd2aEU5d2FnZ3FaK2w2QkkyTCtZY2ZRS0tadjAvNGJE?=
 =?utf-8?B?QWpIRGtuVzBQQXNqb2hWZGJSd3NrUS81c1pvUFoyV0VmRUg3U3pmMzA1K1Y3?=
 =?utf-8?B?RkVaOE1JNGVvaFNGMStvMVVkRXFVVEYzN2NEWGUzcTIwdG16alhnd0xMZFdz?=
 =?utf-8?B?QXpZYndZellJSWgvRlRKeEYyUDJDOWhHcFhlZHBpRmpjNTdqeWI3QzM3NUM1?=
 =?utf-8?B?dkNkcGUzTU1SYncveDhBREdFRSsyTFpiVnY5SHFZc1NsZVFrL1FvWWtLWE5m?=
 =?utf-8?B?ZXVLLzJocHZXbXBxU2Z0M253QXA3TTdiY05rZTczcHVhVzR2eGw4bGUvR0hC?=
 =?utf-8?B?ZGVMZUxncW5VYjVWeVB6QWt1eFpUZFhzZW9nd1pKZXdtYTJ0ZW1tenQ2Ykt6?=
 =?utf-8?B?RWR6Uk4wckJjejEvQ0hoaUEzbnhydGc5NG1HN1ZEZVc5aHpZb3R1T3MyNHZi?=
 =?utf-8?B?SmliQkt1UFYwK3dLZmh1Z09yNi9RZXR3ZGtLbU9zYzNhcmdTc1lXMmdSRk4r?=
 =?utf-8?B?TjhlN1pxNUx0emhPckpVV2plbG9OTnN2Znk1TjEzcEhodjV2bTY5R0VDeGZ4?=
 =?utf-8?B?L29lMDBHWDlLczFVRk1SV0xDRGxSdWdvcVVpdlFRcG1NbEdtdDBLNi9vcHFV?=
 =?utf-8?B?aFR5a1J2QTF2K1lObzE1WDBuL0dTYW9DWjQ4TTRSM2ZOSVlRTFB2UWdNSjgy?=
 =?utf-8?B?WmVtMjJsMlhEZkEvMnY1TmJ1NHFtb3N2Q0dkOGRhTXg0TXpSOFp6bmg3ejc2?=
 =?utf-8?B?UHhhRVFyZXZzVDZnRTlFTCtacGc4YUp6SjlaeWxMSktqdkpmL2w3TDJWcjF0?=
 =?utf-8?B?eCtWRlpjUjRtV3FSOG0rOXAxU0J5cFJibEFHU0J6aXcyT0d6VXZyTi80TU0y?=
 =?utf-8?B?emE1NEF5a0Ixd2t2d1dLOFltSDJxR1VjSzd1K2ZrbGh4aVRWTXZHRGtuaDNz?=
 =?utf-8?B?dGhDS1FPMStreHAzZzRIQmtNUVhtZDl0ekVtU25FYStleTYvSmN3MDArMFhu?=
 =?utf-8?B?YzFHWGwreC9zS1c3VWRYRlZ5REZKRHBNY2NscmR2VWhFdjltY0ptak5lVE50?=
 =?utf-8?B?aFVPeXYyb0U5OFM5Sjdxcm11S29SRjJybnlJczU3RjlzUjhWTVlZQVNQV1Ir?=
 =?utf-8?B?SHNQUW1RMTVkVmUxOXhEU3pGTmJlRUN1ZEhQcW9aektsV0hMVXBnR2hVOE1L?=
 =?utf-8?B?alBJZVhsWEpVbCszc1Q0MXNvRkRpbllENStrQ2JOaHhlaUs1YnEzTU4rUGVz?=
 =?utf-8?B?SDNvQVMvYy9yT21pVzRiaGVkcVVNTERqUXg0T2QxN3A2bHR0SWZhZlpGazhO?=
 =?utf-8?B?bStBUVdJV3A3cW9BVkUzM2VId01XYVpQVHJES0JkR3ZCMHRkcEhPNDN2WS9n?=
 =?utf-8?B?QnBsd25vci9LSlJ1WUU2azJQYURVeXI3dzJkbGRTaFQvMEFUVWFhNGVDcm1S?=
 =?utf-8?B?NFhLaUpOeG52SEd4VnFqdG9OOFgvUXNEWU4wYnFIQndhT2dUTEpwajgwR0V4?=
 =?utf-8?B?bVZaZWRNWkVJV2liTjlGZ2k4RVNiTDFIRFMzQXVyY0ZCdjlMQ00vbG41TW5m?=
 =?utf-8?B?cE9xV09CV1Ixbk1GM1N6a0x3QmU0L3NDbDdHT3IyQ0ZWdEpXMGkyQmZYOW1L?=
 =?utf-8?B?R21TRnlWNENrL3Z6eXZEeTZZbGlQQjYxTHVMRkJVVitCRGQwWWZ2OWFaU0lU?=
 =?utf-8?B?b0ppV2MrRElpaVliRmx4MzV1L2Y1SlNhbzVaUDFyVGlzaW1GVm94VDlPWFp3?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93eac9d8-6a67-414d-5af0-08dab744947a
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 11:24:00.4145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csa1BwgKsuwTyrjeQvhD6DnajV/fGqeX0H+uROrAM58cb9kU/0k7lqZld89rLgLQ2nz/TOTiBkBjnsujy3G+Qb0zWeFQX+6F+cfjYRh2Yus=
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

This change is necessary for a following patch, which introduces an
interrupt mask register different from what is already in the driver.

The driver already handles an interrupt mask register for pcal
chips, PCAL953x_INT_MASK. Extend this implementation to support
interrupt mask registers at other addresses.

Add bit flag PCA_HAS_INT_MASK, which is set for each chip with an
interrupt mask register (including pcal chips).

Define a convenience bitmask PCA_MASKED_INT.

Add an int_mask member to struct pca953x_reg_config. This way interrupt
mask handling code can work with registers at different addresses.

Add separate pca953x_reg_config for pcal953x chips. This differs from
the pca953x_regs in the new int_mask field.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
Changes in v2

    1. New function pca953x_has_int_mask_reg().
    2. In pca953x_probe() replaced if-else with a switch.
	3. Fix recalc_addr inconsistency pointed out by Martyn Welch

Question:

    This patch uses the PCA_HAS_INT_MASK bit to encode if the chip has
	interrupt register mask. An alternatice approach would be to create
	a new chip type for PCA953X_TYPE chips with the mask register.
	What do you think?

 drivers/gpio/gpio-pca953x.c | 84 ++++++++++++++++++++++++-------------
 1 file changed, 56 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1725c1000445..2cf9541057a8 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -62,6 +62,8 @@
 #define PCAL_PINCTRL_MASK	GENMASK(6, 5)
 
 #define PCA_INT			BIT(8)
+#define PCA_HAS_INT_MASK	BIT(9)
+#define PCA_MASKED_INT		(PCA_INT | PCA_HAS_INT_MASK)
 #define PCA953X_TYPE		(0x00 << 12)
 #define PCAL953X_TYPE		(0x01 << 12)
 #define PCAL653X_TYPE		(0x02 << 12)
@@ -89,13 +91,13 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "pca9575", 16 | PCA957X_TYPE | PCA_INT, },
 	{ "pca9698", 40 | PCA953X_TYPE, },
 
-	{ "pcal6408", 8 | PCAL953X_TYPE | PCA_INT, },
-	{ "pcal6416", 16 | PCAL953X_TYPE | PCA_INT, },
-	{ "pcal6524", 24 | PCAL953X_TYPE | PCA_INT, },
-	{ "pcal6534", 34 | PCAL653X_TYPE | PCA_INT, },
-	{ "pcal9535", 16 | PCAL953X_TYPE | PCA_INT, },
-	{ "pcal9554b", 8  | PCAL953X_TYPE | PCA_INT, },
-	{ "pcal9555a", 16 | PCAL953X_TYPE | PCA_INT, },
+	{ "pcal6408", 8 | PCAL953X_TYPE | PCA_MASKED_INT, },
+	{ "pcal6416", 16 | PCAL953X_TYPE | PCA_MASKED_INT, },
+	{ "pcal6524", 24 | PCAL953X_TYPE | PCA_MASKED_INT, },
+	{ "pcal6534", 34 | PCAL653X_TYPE | PCA_MASKED_INT, },
+	{ "pcal9535", 16 | PCAL953X_TYPE | PCA_MASKED_INT, },
+	{ "pcal9554b", 8  | PCAL953X_TYPE | PCA_MASKED_INT, },
+	{ "pcal9555a", 16 | PCAL953X_TYPE | PCA_MASKED_INT, },
 
 	{ "max7310", 8  | PCA953X_TYPE, },
 	{ "max7312", 16 | PCA953X_TYPE | PCA_INT, },
@@ -176,6 +178,7 @@ struct pca953x_reg_config {
 	int output;
 	int input;
 	int invert;
+	int int_mask;
 };
 
 static const struct pca953x_reg_config pca953x_regs = {
@@ -185,6 +188,14 @@ static const struct pca953x_reg_config pca953x_regs = {
 	.invert = PCA953X_INVERT,
 };
 
+static const struct pca953x_reg_config pcal953x_regs = {
+	.direction = PCA953X_DIRECTION,
+	.output = PCA953X_OUTPUT,
+	.input = PCA953X_INPUT,
+	.invert = PCA953X_INVERT,
+	.int_mask = PCAL953X_INT_MASK,
+};
+
 static const struct pca953x_reg_config pca957x_regs = {
 	.direction = PCA957X_CFG,
 	.output = PCA957X_OUT,
@@ -235,6 +246,11 @@ static inline bool pca953x_has_interrupt(const struct pca953x_chip *chip)
 	return chip->driver_data & PCA_INT;
 }
 
+static inline bool pca953x_has_int_mask_reg(const struct pca953x_chip *chip)
+{
+	return chip->driver_data & PCA_HAS_INT_MASK;
+}
+
 #define PCA953x_BANK_INPUT	BIT(0)
 #define PCA953x_BANK_OUTPUT	BIT(1)
 #define PCA953x_BANK_POLARITY	BIT(2)
@@ -790,14 +806,16 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	int level;
 
-	if (pca953x_is_pcal_type(chip)) {
-		/* Enable latch on interrupt-enabled inputs */
-		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
-
+	if (pca953x_has_int_mask_reg(chip)) {
 		bitmap_complement(irq_mask, chip->irq_mask, gc->ngpio);
 
 		/* Unmask enabled interrupts */
-		pca953x_write_regs(chip, PCAL953X_INT_MASK, irq_mask);
+		pca953x_write_regs(chip, chip->regs->int_mask, irq_mask);
+	}
+
+	if (pca953x_is_pcal_type(chip)) {
+		/* Enable latch on interrupt-enabled inputs */
+		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 	}
 
 	/* Switch direction to input if needed */
@@ -1193,12 +1211,20 @@ static int pca953x_probe(struct i2c_client *client,
 	/* initialize cached registers from their original values.
 	 * we can't share this chip with another i2c master.
 	 */
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
-		chip->regs = &pca957x_regs;
-		ret = device_pca957x_init(chip, invert);
-	} else {
+	switch (PCA_CHIP_TYPE(chip->driver_data)) {
+	case PCA953X_TYPE:
 		chip->regs = &pca953x_regs;
 		ret = device_pca95xx_init(chip, invert);
+		break;
+	case PCAL953X_TYPE:
+	case PCAL653X_TYPE:
+		chip->regs = &pcal953x_regs;
+		ret = device_pca95xx_init(chip, invert);
+		break;
+	case PCA957X_TYPE:
+		chip->regs = &pca957x_regs;
+		ret = device_pca957x_init(chip, invert);
+		break;
 	}
 	if (ret)
 		goto err_exit;
@@ -1264,21 +1290,23 @@ static int pca953x_regcache_sync(struct device *dev)
 	}
 
 #ifdef CONFIG_GPIO_PCA953X_IRQ
-	if (pca953x_is_pcal_type(chip)) {
-		regaddr = chip->recalc_addr(chip, PCAL953X_IN_LATCH, 0);
+	if (pca953x_has_int_mask_reg(chip)) {
+		regaddr = chip->recalc_addr(chip, chip->regs->int_mask, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
 					   regaddr + NBANK(chip) - 1);
 		if (ret) {
-			dev_err(dev, "Failed to sync INT latch registers: %d\n",
+			dev_err(dev, "Failed to sync INT mask registers: %d\n",
 				ret);
 			return ret;
 		}
+	}
 
-		regaddr = chip->recalc_addr(chip, PCAL953X_INT_MASK, 0);
+	if (pca953x_is_pcal_type(chip)) {
+		regaddr = chip->recalc_addr(chip, PCAL953X_IN_LATCH, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
 					   regaddr + NBANK(chip) - 1);
 		if (ret) {
-			dev_err(dev, "Failed to sync INT mask registers: %d\n",
+			dev_err(dev, "Failed to sync INT latch registers: %d\n",
 				ret);
 			return ret;
 		}
@@ -1362,13 +1390,13 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pca9575", .data = OF_957X(16, PCA_INT), },
 	{ .compatible = "nxp,pca9698", .data = OF_953X(40, 0), },
 
-	{ .compatible = "nxp,pcal6408", .data = OF_L953X( 8, PCA_INT), },
-	{ .compatible = "nxp,pcal6416", .data = OF_L953X(16, PCA_INT), },
-	{ .compatible = "nxp,pcal6524", .data = OF_L953X(24, PCA_INT), },
-	{ .compatible = "nxp,pcal6534", .data = OF_L653X(34, PCA_INT), },
-	{ .compatible = "nxp,pcal9535", .data = OF_L953X(16, PCA_INT), },
-	{ .compatible = "nxp,pcal9554b", .data = OF_L953X( 8, PCA_INT), },
-	{ .compatible = "nxp,pcal9555a", .data = OF_L953X(16, PCA_INT), },
+	{ .compatible = "nxp,pcal6408", .data = OF_L953X( 8, PCA_MASKED_INT), },
+	{ .compatible = "nxp,pcal6416", .data = OF_L953X(16, PCA_MASKED_INT), },
+	{ .compatible = "nxp,pcal6524", .data = OF_L953X(24, PCA_MASKED_INT), },
+	{ .compatible = "nxp,pcal6534", .data = OF_L653X(34, PCA_MASKED_INT), },
+	{ .compatible = "nxp,pcal9535", .data = OF_L953X(16, PCA_MASKED_INT), },
+	{ .compatible = "nxp,pcal9554b", .data = OF_L953X( 8, PCA_MASKED_INT), },
+	{ .compatible = "nxp,pcal9555a", .data = OF_L953X(16, PCA_MASKED_INT), },
 
 	{ .compatible = "maxim,max7310", .data = OF_953X( 8, 0), },
 	{ .compatible = "maxim,max7312", .data = OF_953X(16, PCA_INT), },
-- 
2.37.3


