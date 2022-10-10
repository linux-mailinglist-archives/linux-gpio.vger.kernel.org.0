Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F38345F9F51
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Oct 2022 15:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiJJNXe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Oct 2022 09:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiJJNXd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2022 09:23:33 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1696963FCC
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 06:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCc/jRyGrt5Zv9WfqNV8MoXpMJpA2MIZKLBtjTvRI2Tz4PiApPrFNvwL45VqmZkxOzYx9Zg71kj+N9XV2pYLwmxcomUaaL0JkHez13EDke6ZY8JMnu6iSgn4Lp0e8Vtm3GN+BT80E7WyKYcpEmOuxwciey8nUw8pU+dOEteD56tmhNh0SvYVF/fBfGVcxuHJ3R+IZifS4eFfiA+MhiuDgXDIuN9joyppXZ5yQhiAohhTtF/hFZQvovEwz86ncUXhBiVbFRo7wqCBd0nkCjXC8XSoi1WNGxmMpJHnbSYEc/V4G3/04E/AY2Ry/UMwCQfl028Gw6iLEIOjgJBmckI8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aG/e0Dq/1lOEMGVNNeuFslqD1LArNL5Ezfxq71bR0lc=;
 b=bLckGeDlBClD33nPIBZcaQ6BzAdmSVIHgATJZmj7zPiT53xqSvut1qQwEcDixfUp9exrk4OPdhay4NhHPfG9UA+aiusnZtRT/d6f7FQB7RyDJx0diq7cZixot7U2hE43yaebDAqDAiI6Sviy0NGc3rrw26Y3Pa2dggJKUrA0Kni7mJJ+OUPZ98wEgmCrTshXQJBrq3DxBYa0mWgAyYxBTg2ChUk6NFI8nYIbkR0MHqe/C0WOmJMnR5Vu4chEDpbzAzNE0ep+QXoFAyxuUaeoaobiRVlWnIFAegHQveGXJ1b6PNd0aHI9A8aLM8rW/hhsRGtigIpvnUHC++J+2X7M/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG/e0Dq/1lOEMGVNNeuFslqD1LArNL5Ezfxq71bR0lc=;
 b=AGeVEBMB9zPsHrcxpvjjzE22V8PXkMDwXUe9pippmlxdJ4qvH+PArLw5ZU3LTfWQQSUt3DVXHh+6OR3qSEtq73zqpSHeQbwLLUrgnfpSlon7bP7fdmmtgwjWKfqcrCAsLia62+TJ8+Ahv/asXcbPHQuTwgltE93AqGhWkZ2j75I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by VI1P194MB0656.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:144::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 13:23:24 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::8dfd:7542:7a0c:1f04]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::8dfd:7542:7a0c:1f04%6]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 13:23:24 +0000
From:   =?UTF-8?q?Levente=20R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        =?UTF-8?q?Levente=20R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>
Subject: [PATCH 2/2] gpio: pca953x: Add interrupt mask support for chips with the standard register set
Date:   Mon, 10 Oct 2022 15:20:07 +0200
Message-Id: <20221010132007.924810-3-levente.revesz@eilabs.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010132007.924810-1-levente.revesz@eilabs.com>
References: <20221010132007.924810-1-levente.revesz@eilabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0146.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::39) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|VI1P194MB0656:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b1021d-4872-41a4-9a59-08daaac29bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5QjPe44fsgx4CUSS7LKSD2Gb3xm9ZDjn5MvgL0YcBlwE85pmnG3oUJXg/fLk6dh4wKR9ol5raSKUcBj7y4qDWrlEShQI4gKfUSTokNwy0dWxaTFGye8TaOdTnf4LutPHWn4svd6akFPxahoyvMgNDYTkn2nZv+tOUi0D8XPH4GI0JMvv3bZVjzdr6SJJ9MTVUjiVLIgDanfmiGqaEI4PSB7wRmEGhGO23FONu6p4ncBpgsvvZjXWqIzWZzE//MKnI/4sO8zCE2x5tCrd6QxuZIA7eVH/jFpJmbq4ChFN4bQYF5vhJZUwv65yDL8Hm333QIRnSf7hWfBG8nU+OkXpzeVNFyk/EDE4BHZbD6nzx3wlWkAYsQPKefUSy+P4kvSfjXWbTNq36t3v+dnDi2W04AJYMVzYExSfWn5qxW65PP8WB+IrzCdEJpBH6drkQeLK2DiXAnrbOS4//xOyv/3pyp3VDNkQBthZ9pPmJu/ncwxcanKJe+mMDZyNWF+qcoYXSoHxyqWY0yrXtZUefvb03odReFEVlRvaEdB3Gow/I5a20QQiaeXrft5yUbqOSRy69LtcIh3ZdivOz2fUNlkuvP1yKBQbQzbFmA488wycMukQB/E/ewxsidDQfWB7LRC6E15h9aVH8K4zki4H3WN9yQUK+41eVDNw+Hkuexi7sNYDpfdNVROm8UCr3AnSPdo5hm6gf54CyByzOGkzGg1HlAZ4mIlDHkMYoEuFwq/DzLdYKQg3PqespDCNvmJwRxxSfm39JRcbr0OfE3b7BETIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(39830400003)(396003)(376002)(451199015)(66556008)(316002)(66946007)(86362001)(66476007)(4326008)(36756003)(2906002)(5660300002)(8936002)(8676002)(110136005)(41300700001)(83380400001)(2616005)(1076003)(186003)(38100700002)(6506007)(38350700002)(478600001)(6486002)(52116002)(26005)(6512007)(6666004)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUpUUjk4OVl2THFVOXVnV1lIUjV3Sktjbm5XMlNTZElrejNxQitLS1hoVDBa?=
 =?utf-8?B?KzA1bFdRRzljM1BMZXh3ZDFFYWNtK0hydzd1dXZQSjJjSXByREhDQXZQQ2Zp?=
 =?utf-8?B?OFZPTU9oMkRrRzhtb1l5cEVLbHdMRHE0bFBDK2tEczlEMTY5QXN5aDNFSERh?=
 =?utf-8?B?ZlRyelVnRnhaMm8rV0F0K1gwMzk5czZ0czk4WmN2bVNUdlpocmViNHk5UVJL?=
 =?utf-8?B?bGdUWW9mdWRnWDNCaTdGOEZHQ3dXSWdGem03SnFYbDJmeWhzYktTM3E5TW5m?=
 =?utf-8?B?K2hlQlhueVo4eDRnYmRUSGQ4NU1Ub1VScVdzTXgwMVQyZDBMeVBNU1Q3dmMx?=
 =?utf-8?B?KzdTRFN3U1NqaXpTWlFVZDV0VG1qYllveklLTStaYm5XMWU3dTYrTUxUN1Bi?=
 =?utf-8?B?YmxOekNVa3M1QWl6Y2o3bHRMSFdKTXFOdjFnK2dxL1ZXTGNFUWd5TC9ReWZk?=
 =?utf-8?B?RXp1UlBrZ0YwQzZDbDdyS0J6MnRxMDU4K1dWVmpqZm43aytGN3pZTXJZL3ds?=
 =?utf-8?B?eHhlcDZQMDZCNENtbTlsT1gyS3dYalZnbUdxYlVMWU1BbTZhdUNOdU9ReE4w?=
 =?utf-8?B?NnBqREIreUhneG5MZEx1WVRVVjJhL2RBdnNTUk1xQnVxdXJCdERpWjI3WExx?=
 =?utf-8?B?c0dnNDN2aHVTOTBFS1BSVEZtNEorWDBqc2tvQXdldjhoODBUS0hjRGZMZzlv?=
 =?utf-8?B?ZzJqdTNZbjVyZjFUcTVBS1lDd1pZeVFyYWlUZ2lsQWNVSGdpdUtsUHpKbTI3?=
 =?utf-8?B?K0kwMm1LTmEyRHA4dVZrMzYweDlickdUMVhuRVRER1JPWkZ0TS9hKy9rSndT?=
 =?utf-8?B?Snd3UGYwYXFrTVZUMXl4bGp0MW16dFJLTmZpUXVuN1YyaXRIR1UvanBMa1FH?=
 =?utf-8?B?SEtYK0REVkV1TmhkYjFCaWlzNTh4S2ZlV0FaejVOSkpvZ1p3Slh1WWxBTko4?=
 =?utf-8?B?blVKcUhwMnVsU2owTWdNR1E3RVhrZjdOTS9oN3JtNDJ5ajJ4M2FLelluOUQy?=
 =?utf-8?B?ck13UEFDMGU0NmJCRmpIZXZyRHNPa09ONE5RU1FaWTYyZExoMklOTUttL0c2?=
 =?utf-8?B?bjBPajluRUhSamJaNlJMUHc1Wk02dlllK1U3N2I1WWRFMjByRWI4ejVKR1pz?=
 =?utf-8?B?aXJVeHpjNXI2WVk3U1JhSy8rV0c1NDRMUmhhbDgrOXl2TVVBNjZabjZEVm5X?=
 =?utf-8?B?Sm1yWUt0OXVqeW41T0VMTnZ6S2owTDViOEdHYUk5QS8rMHNOUmNyUkRObS9W?=
 =?utf-8?B?Y3g4ay9JdjVFZGM1ZEhOTXFyWitWb1VkMEVQaXVPaGtoTkM0REVaK20rUHJH?=
 =?utf-8?B?aXNFd0g0YUVkSUErd1JNb2VJYVhCSGtFYktnd2w1cmtVMTZMS0lMODNiQk05?=
 =?utf-8?B?RGhnNUpaMnJyUlgyRk43S0dJMjdORWQ1V0oyaXBydVg3VlVuYzVWdWN1SDZk?=
 =?utf-8?B?a1MwcEMyWTJsOXEzOUx0Ti9KR2VLc2F3eEJYUVF0UjN2MXdWdlhFMmNrSXVW?=
 =?utf-8?B?NHl1WktXZTZuV3diTHFPY2tMWk5iTkdReFN3dzVlUmp0VGtieEMxS1hjbXJT?=
 =?utf-8?B?VGZiMk1POCtRcGNTZmZSQ0IvbTkzUEFxTkRvK0tsa012d1dGQXA0MHpQdUlN?=
 =?utf-8?B?Q0lXUDJZcXZYQnoyTmJHYkdSYnBpWVpGZFY3RWV4TWpiU3ZGSmpoY0RVT3R2?=
 =?utf-8?B?clJOYnZNOXpyOEVUd2dTcWRkTEo2OUM1QnpwdXYyb2RkK1phbGVKNzlmMDA1?=
 =?utf-8?B?aXZRdjAzNVlkUVFFWnBWVmRGRFkrM3Q5azNvd1FqYTh1MzhtNWovYjFzVm9C?=
 =?utf-8?B?VUxrMGxQd2cyTTFJMS9WeHlkVlR0UlVmTk1kNEFTMkwzdmJLTVQyMEo1L2J6?=
 =?utf-8?B?WFZwS2pRYTNWa0RDcE1oak0wcU5ScXJ2enJZUFRybERHa1phNUI3Y1FyR2Nk?=
 =?utf-8?B?TzdwT1JCR2RtQ3ZYM3Fzb3JVV1JhNXpVb1hOT0I4N2xIUmliNlBuUjZmWHhN?=
 =?utf-8?B?bEdKaDRTMWdIOWNpMTM3YlMwRGpiNGlCNmdZVU1jN3F3T082L2lCcDdVbnJS?=
 =?utf-8?B?aEdMK2N3TGNhRTVpSkNMbGVHYVhRSmlNRExGK0xLZVdxQXVnUWFuWktDMHZi?=
 =?utf-8?B?OFhqQXRjYytLN1VCSWVqK29ycUZoQjFORmduVWNaVGZoNjNuQnYreFdUQkp3?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b1021d-4872-41a4-9a59-08daaac29bd0
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 13:23:24.1957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyPU885szZqfIf+j5fHQsOhHVVawUVehE4YE3tC4EGO7F9v68o+o93MjhVAb4YxQPSKF2Oe5Wp5l0t0MwDqytOJ8QEOCWnS50IEPBY6NOBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P194MB0656
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
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

Otherwise the interrupt mask register works exactly the same as the
corresponding register in the already supported pcal chips.

Add PCA_953X_INT_MASK register. Use it as the interrupt register of
(non-pcal) pca953x chips.

Set pca9505 and pca9506 to use this register.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
 drivers/gpio/gpio-pca953x.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 71bfc38c3930..bb8355540a46 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -28,6 +28,7 @@
 #define PCA953X_OUTPUT		0x01
 #define PCA953X_INVERT		0x02
 #define PCA953X_DIRECTION	0x03
+#define PCA953X_INT_MASK	0x04
 
 #define REG_ADDR_MASK		GENMASK(5, 0)
 #define REG_ADDR_EXT		BIT(6)
@@ -76,8 +77,8 @@
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
@@ -187,6 +188,7 @@ static const struct pca953x_reg_config pca953x_regs = {
 	.output = PCA953X_OUTPUT,
 	.input = PCA953X_INPUT,
 	.invert = PCA953X_INVERT,
+	.int_mask = PCA953X_INT_MASK,
 };
 
 static const struct pca953x_reg_config pcal953x_regs = {
@@ -240,6 +242,7 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
 #define PCA953x_BANK_OUTPUT	BIT(1)
 #define PCA953x_BANK_POLARITY	BIT(2)
 #define PCA953x_BANK_CONFIG	BIT(3)
+#define PCA953x_BANK_INT_MASK	BIT(4)
 
 #define PCA957x_BANK_INPUT	BIT(0)
 #define PCA957x_BANK_POLARITY	BIT(1)
@@ -261,6 +264,8 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
  *     Output port			0x00 + 1 * bank_size	RW
  *     Polarity Inversion port		0x00 + 2 * bank_size	RW
  *     Configuration port		0x00 + 3 * bank_size	RW
+ *   - Some chips have the standard layout with additional interrupt mask:
+ *     Interrupt Mask port		0x00 + 4 * bank_size	RW
  *   - PCA957x with mixed up registers
  *     Input port			0x00 + 0 * bank_size	R
  *     Polarity Inversion port		0x00 + 1 * bank_size	RW
@@ -374,6 +379,8 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 				PCAL9xxx_BANK_PULL_SEL |
 				PCAL9xxx_BANK_IRQ_MASK |
 				PCAL9xxx_BANK_IRQ_STAT;
+		else if (chip->driver_data & PCA_HAS_INT_MASK)
+			bank |= PCA953x_BANK_INT_MASK;
 	}
 
 	return chip->check_reg(chip, reg, bank);
@@ -396,6 +403,8 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 				PCAL9xxx_BANK_PULL_EN |
 				PCAL9xxx_BANK_PULL_SEL |
 				PCAL9xxx_BANK_IRQ_MASK;
+		else if (chip->driver_data & PCA_HAS_INT_MASK)
+			bank |= PCA953x_BANK_INT_MASK;
 	}
 
 	return chip->check_reg(chip, reg, bank);
@@ -1342,8 +1351,8 @@ static int pca953x_resume(struct device *dev)
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

