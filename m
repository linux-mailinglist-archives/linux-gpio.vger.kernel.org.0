Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A3460DF85
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 13:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbiJZL0f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 07:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233412AbiJZL0b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 07:26:31 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130081.outbound.protection.outlook.com [40.107.13.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23B992CCD
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 04:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlCGRbm9B3mVmB77JU/NVDfJ5TLMcYbS8VatkAWte+aGK4Ac3QBU2kUQGZad4qfwW3Vch1IBYYuCzxms2mFHjmV9WOf38mAxqd/vDsagVxyR6bgYlIPdFa7gomoQPd5Isb8TCUQ1AOZpypjjnJobkxdLNl+MXGkL78K47SFRiDPZhBQSkdG0r1E957aUiEGSv2hcEOksTGd9KmtNkCEqdKIYbu21om7n5W1W76sRGvxLAUji0j41qKdnBnedyt04ZlMP/5/2RxPG/nvu4/HbuyAR/Xr39Gr3c8x7IDnG/gG/TYiJmQkVSKoJ+U2Xxq6+BimlA5npCS421iG02flgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ltc/Nq0Ito67/2qjLQkKuj2So8kmQnGa3KsEpZuz2Y=;
 b=MdtRV2nNHRS7rHuyStQ02KDWp+JIXlfjgnOoKSyUej0DL3W99UaMidJGY9ppMGA5QfYWsebgH4Al7uf91BrM3eQfMpvK+kP6v6xB7wqv/+ujC91O+ASDTJR9nve8H3UsZ1drF6fgg3x5tlCDajdiosrOA9hxRpYJNBUq2FzT1NhhP0mwZlQOVbBIyHu5SBh6seD3446Z3Ob9SWPSohGd5zSD70gyDe7BRaiTi2MM9CtkpodJH+QaK4ekXhqIqW74f6nTDkadug1QSeekGPeZ6tgcbbcoQ3HSxpoHiM8zrs2E0xwjJjMeikk9pZmXtdkq7gvFaqh0Ik5/qUbcQpcQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ltc/Nq0Ito67/2qjLQkKuj2So8kmQnGa3KsEpZuz2Y=;
 b=CXkEu2KizxVHbru0oS1IyWmR76IESROv7pvUXNNru7MpERyzRG3qV2sEDb8qUGTbZAb7HWTaVUnGDYAQo/UVbVcXgmNuK2Av1vfSk9Qr9U16sTVEwaR+yGa/zayXZKPLrjZd3LaKcyi9Az/1zIkxoNPjAFxwzYr5zpPuMQkDKHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by PR3P194MB1667.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:176::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 11:26:25 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b164:96e5:86ce:3b9f%7]) with mapi id 15.20.5746.027; Wed, 26 Oct 2022
 11:26:25 +0000
Message-ID: <7dabd969-f458-c428-11ef-6105f47f4332@eilabs.com>
Date:   Wed, 26 Oct 2022 13:26:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: [PATCH v2 6/6] gpio: pca953x: Enable interrupt for pca9698
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
X-ClientProxiedBy: VI1PR09CA0184.eurprd09.prod.outlook.com
 (2603:10a6:800:120::38) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|PR3P194MB1667:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9dca1d-c1ca-4a8c-6ac2-08dab744eadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+vl0AbnPj11euHigL6L30DZoyQE72ewPEpAjqNFxjGBOnhOyHK1wxoFa9HtbveRlcqSDhOK3KBUBxGm8FL9oi5D6R7pOc7T0ikDXy6RN+Ntwyk/7d0QkZmylbXTOMsDGjrazJHNsOBEoeVegrU3K6m9xqhC4otwoBNcdd+RbZzFGE1G8nG+88BhtBp8OXYslKgrXK9ASNnLr/f78BvUQgHG0irSOaHdiSfmNCqrdGllhs8m4UbWYw5aMqPsg6JEM/+z49AiqkmYv11T3lxHKD3TQ1wLAmh5pL6mKTmqpGG/PzaNeERwcDQBYetDQpbRqgHP2/Fk3kGYpd6TO7Nt31SSmJqbX3STLz+FyuCfDSmfdDz23FRMMfRJfwgmyDghzf0zkpt7Rgn8vJfNUdQ3wwXvjgSNk46afRYRgi8gg6WmzDsva9cIaz79kfHVRYgAio2d7XEHv0cm/YVm9dL1p7xGtQfwoUDit4S8VjRF+duYg2j5Rbb6e3n8lvTdSBKivE9CVDSRBg7uFI5M9lQYYAUWhYO06OeJjcT/0HnB2/EfoZ5IcydfRI+2Mi1cAFvjYP07SLP2tIKTEsHrYxYf+jP4rhR/qH1HXYeO/H6JNx3/rMYzluR4DCMC5fZbIEM2rStLOsNWA+c4EljnhidvLf73hVhCuy9eOWyeJ4ewD7/o5DyU3UHxakzJA6Fk+ynJ8P1CYwAiuETpf7vqBkJ0CebV7qZN7y2thlLGyUNJNhL0lpZ4ILsS5UTMjoTw3lE6nEF+0qIoF7c/Yov7UqKLqyhqt6G6iHfmPoJcli346BE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39840400004)(376002)(366004)(136003)(396003)(346002)(451199015)(38100700002)(6486002)(31686004)(478600001)(36756003)(110136005)(41300700001)(8936002)(26005)(6512007)(5660300002)(86362001)(66476007)(7416002)(31696002)(83380400001)(6506007)(186003)(4326008)(66556008)(66946007)(8676002)(66574015)(316002)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHRGR05WS2QrQ3pWdGtPYjJNV1VFS0FnVWJRV1YraGhXTVEwWlJmTTBZNGxL?=
 =?utf-8?B?a04wdGl6Z29SMVp0YnF1TkVWcytGS2pkSE9SRkp6eGJkQk83ek9sVGxBRHc2?=
 =?utf-8?B?RFVqQzcyK1hhRVd4WFlVV1dOT3N6dmxZaEx4d1ZtZTl0KzhqblBlemV0Q1pw?=
 =?utf-8?B?a0w1YUpqRjhwQ0NoTGFudUJodER6R09BYWlqWlJ0SlVUUEhzelpFNW1hcUNO?=
 =?utf-8?B?bWNpczBYVFFKdEd0UG5VK09yRzRKY3gxSmlwRU9ZZ1E0ejdoL1MySjZHUnVS?=
 =?utf-8?B?TDYrTVIvQ0N1SVM2VTdGalZVdnpKTDZUSm9SOXpDT3JZWmc1RHlyUmUrQ2py?=
 =?utf-8?B?UWd0Z3VTQzBSRmdvejdHKzdaOGsyV0NQKzRtSjVoaENuaHo5TGVDc3NOK1NS?=
 =?utf-8?B?cUlkUjNBWjlQcFhPRElKZThrTmdOTDFXVnB6a1hBSmpCTFdxKzNMdDBBaGdu?=
 =?utf-8?B?bzMvaC9BR1VwWU91bU1VSWRmU2ZXK1BnNGRneFNKemJDQlhob081UGNwVGNE?=
 =?utf-8?B?MU1CSEQwVTJ6RDY1Z3hkb3I2a1VFUzVQUHNUNitIU2x2bmF6TU1KMUtWNW1q?=
 =?utf-8?B?b0dCdFU5bnhrNUNUeUlQZmpEcjgzTVpOU1RHdGlEN3JURVpGcFU1VTU2NFg5?=
 =?utf-8?B?SkZNbjR2ai85Ulk4M2xnNVVLc0tuYTk0d0pxbmIzSGp4MTZxZmwvTmJHMytr?=
 =?utf-8?B?TnpvSkk5VDRqNDRDQXo3cDNIOWkvbXpoTk5WM3FGRGZwL3BDUldsVkd5OFhk?=
 =?utf-8?B?MUkraWpibnM0VjAzRWQwZmJCbnFlYXBpRHlFTFI5U3BXa0RSekVSVkV6b0R0?=
 =?utf-8?B?bVZuc2lKbExKRHh4OURVeXMzWFVISnJWWUtJTkxoanJnbjdGQ3FtcEZiT0lW?=
 =?utf-8?B?MTVCemxNMldLQ3NvT2tVSzVPQUtXWDlOUHNOTC9waEN6amR0Y011MkZ0NWty?=
 =?utf-8?B?VllZd2gwMnE4RTdnTHN4WE1MMFNYK2k4a3NCaS81WGVTb3A4NXJNOW4zZzAx?=
 =?utf-8?B?NzR0SDBuRTR0dEQ3Tys0WUdHcVNuRDBOMWVIejBMMDZRL3B1eUtHTkllT3BJ?=
 =?utf-8?B?aDhrWW1OeDVhYmNuZjB2Wkl5VVRHenFDVXpmcm9YSHpGMGNsWUJwZzFoQkpC?=
 =?utf-8?B?OXhTMks1TWJoZXJ3c1JpWDZQWnRTZFBUR2FPSzVVVXJaOWZWV0FQWkQ2bmZX?=
 =?utf-8?B?dDJsZ29oR0JKWFhXV3pDZnBNbmZwRFBpZ3FWYmNld0xnVjVVM0RlWFlyem02?=
 =?utf-8?B?MGUySnp5MmloK3Z3QnZtVVRMSjNySmg1N2xNVVQ1aWYwOStJVXM1a2hkMEZ6?=
 =?utf-8?B?MmZXVkVoczE2RmludDI3SWMyM1ZuY1MraUFQTkROby9yK0t0U0p5YVBUL0NY?=
 =?utf-8?B?aEZBdTZzTitCemJWTEMzcmtzQlVmTTd1UTlOTjJOWWdJVG5jZEltVmJ3N1A5?=
 =?utf-8?B?Nng4LzJMd2tYZHlLMVpqbThaZmtCSktQaytWbUdveC82TTJWb0NzaTR1QnlR?=
 =?utf-8?B?KzNoaUIvREVnNzFZcXJmQjRFTG9sZ256YjVKQTVrZm9YS3prSXQ5Q0hVK3I4?=
 =?utf-8?B?SS93Y0E3ek55QWhwdGd4VHhVS0dHRCtScjZRNnBaaDdXSXlqT2dsV1JxQ3A1?=
 =?utf-8?B?SFpFUGcxUjdzbVY2cEE5akFWQ2lTS1NqUmpUUG9nYjhlVC92TlpJSWZiM3dZ?=
 =?utf-8?B?YnA5aFoxVnhVeXExZFFONm5JdjR6dmpZblhYekZEUS83c1p3MmJ5Y2NrN0Fi?=
 =?utf-8?B?aVcwNFFuLzlGdkpRcFFLa0lTc0J6aXZTREIwa0VQcFl3WmNDd3Q3QlZwOE1R?=
 =?utf-8?B?bFpwdnJ2c1JMSmNxSCswdWdiWlpZb21zRE5qMjNSaFVCeS9kZDhnUGdxZEVy?=
 =?utf-8?B?OUNGSTVJYTlhd2tHWi9uc0ZXaXVPOStScW82RVhpUnhnRmJyVHl4bkdidUFu?=
 =?utf-8?B?UDNtbWp1UFA1Q0d6a0JXOVpQaXdCRXduRENxWGZCS3dWRlpxQUxQVWkrZVNO?=
 =?utf-8?B?b3E5WWxRekJ1UzdLWUpxbXFyYWFzTHozQ0VqTS91bzRnazRoN3ZkMm9DVzNF?=
 =?utf-8?B?ZnBaTVdsYWxtZU1EWWN5Y2RMMDl6K0t2amxqRFBobW54aTRkZ2g2K0l5QjhH?=
 =?utf-8?B?ZDJFQ2F6QTFwR2ZnZHpaR0lGL25XQ0djNXVuaXByZ1lwUnRGZ3g0QmZOMjlR?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9dca1d-c1ca-4a8c-6ac2-08dab744eadc
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 11:26:25.3100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSqxdFrMkY4o89fU9vYgZ/xE5dYKMYf1gQT1946fRV7vriChDEs4Q2YKYlhbMdoqQeFz3GSSjKeQTh28kgftNHPg0u7Av70mqAAWVSquTec=
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

According to its datasheet, interrupts in pca9698 work exactly the same
as in pca9505 and pca9506. Enable interrupt support pca9698.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
Changes in v2:

    This is a new patch.

 drivers/gpio/gpio-pca953x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1e563d5b77e8..b21b86dd1eea 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -90,7 +90,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "pca9557", 8  | PCA953X_TYPE, },
 	{ "pca9574", 8  | PCA957X_TYPE | PCA_INT, },
 	{ "pca9575", 16 | PCA957X_TYPE | PCA_INT, },
-	{ "pca9698", 40 | PCA953X_TYPE, },
+	{ "pca9698", 40 | PCA953X_TYPE | PCA_MASKED_INT, },
 
 	{ "pcal6408", 8 | PCAL953X_TYPE | PCA_MASKED_INT, },
 	{ "pcal6416", 16 | PCAL953X_TYPE | PCA_MASKED_INT, },
@@ -1401,7 +1401,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pca9557", .data = OF_953X( 8, 0), },
 	{ .compatible = "nxp,pca9574", .data = OF_957X( 8, PCA_INT), },
 	{ .compatible = "nxp,pca9575", .data = OF_957X(16, PCA_INT), },
-	{ .compatible = "nxp,pca9698", .data = OF_953X(40, 0), },
+	{ .compatible = "nxp,pca9698", .data = OF_953X(40, PCA_MASKED_INT), },
 
 	{ .compatible = "nxp,pcal6408", .data = OF_L953X( 8, PCA_MASKED_INT), },
 	{ .compatible = "nxp,pcal6416", .data = OF_L953X(16, PCA_MASKED_INT), },
-- 
2.37.3


