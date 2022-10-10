Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E627F5F9F50
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Oct 2022 15:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiJJNXb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Oct 2022 09:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiJJNXa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2022 09:23:30 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02D761D89
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 06:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtthNjOhbSIU62UIfBcNVuQu8ZvEuty+lNBRfSzaGG3X2rf7ddv0OM9ctpycCtjnJbhOX3339yqSQD6W+/Hrbq49om27Etz7Makhm/OGaZyKlZZ874nZ4xJWI+uLw3H2jh2/c4x2eemSkxOwriOBPRI8znunG2QRpp+LUK/Kx1BbP4pmmhuSFRDktFddOJuaL+tKnTmdkhKTDADLrneDtb1jCZeMRBNkEQcnvYVWLsyEv54GYpC4xIp7RtGkjiEU/8B/vgMfDBkgxYCyppFp4ONSOcYWlS5FLszeDvpteMvjZal4bLEjGd7zGP7CSqYRraf9PxKMW9NDDMBg00HmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXbzpbzMcICvshXte+nHJTbzEN9QlZRaUP8NeUbAunI=;
 b=EFduYJKq6X7PwiUJ4FpugEkEC5ICmIqBFVPCbPbS/PAY/RwgSkKdT57w1DarSTDITNwzgORUH1Ya/MBHbwNktYezSrCOrqokZokfb8EYz5cj1TWrivOMQjMj+LQ1RhffLcXsU20Q1X9ueQKi9+VPpgP3tLJUoJRmL97/87Oe5J4tVNGAO6EHjnTLWH4ZQUg915UZ9kl/ASjMMNy+2rrMk/ZVYAaxDXOGqHreGH/j1tIoDZRgQu2ipU7oBrNMfFx6bWM9q+B7qLgCccoW9UEdGsDuWw9E8OBcD0mZ9A6jp9JYH4zuG726wsWVHfROgCSP21anV2Zsp2VWYbHf8OAviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXbzpbzMcICvshXte+nHJTbzEN9QlZRaUP8NeUbAunI=;
 b=Yp/q/C3ols8VN4blEWHz4uMyKW/YZ9/hoNpQEdGHBzpRTNrZU4OppECCOBvQowQuG6BIF5sllaZjBhV82DJ+KBPZiuMz5DWJpvmQ7+gBXlJWu2Dte3v5NCQOV/jyHaQ3uWFyvnVhUJD3IiuocYu/xyTxUWIZwRYFJ4nlBXq85Hw=
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
Subject: [PATCH 1/2] gpio: pca953x: Generalize interrupt mask register handling
Date:   Mon, 10 Oct 2022 15:20:06 +0200
Message-Id: <20221010132007.924810-2-levente.revesz@eilabs.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2e4dfaed-95b8-4597-8b46-08daaac29b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mwSpxjfkLbZWf1IUfk8A5finhQbtCC3yFHF+359b2rCY1/JVlNta28PY9bUY2Tt/P9obXmaB5Yk6ol9LNLB5KkLRebbXN69SW+PSKlv0KEKABTumkH313d8VkgTLIF935CkqWz726xDLCQY2F6/1H4VwfbBwC7mEkUru3/xEZwZDzP3URDEPr0o3OyLwOQcJ3Kb1xwzZ7wxB9PCMz9RLaXCjgwTnXkrxxJx9pE4NGtZG4OejX8Wp/EUklKuvaTgB3Dgg55GuVrexm6cK/qwDXk80ntE+zoJ+noy/vARGF2U7Bf69AHoM31+QN0rvW24+i4ZVPX2u3wMo/ca5XSVKDJYwY4pNmiE5WxSiEGshdiLSJdR8NcCeZj1ip46OD7Z9VLPYVP0zB8nsoGWdN7IPcMp65ea5RTFh5jQEBKjd3T6BozJU+T7/oSp0rWpPMe/RuH3ocWwRwSJLABqbZHtOywDV9h6Qz4JW/EO/TqRfiNN1DDhy9VfNv44/gOQ7tMS5Hu9W+E0Cp0VOgAv4zQQYvWAjKnyevevtuc1aYLsn9IZs+jb0H7PfQICdgr68p7cclOkkbVwc79/lY9ogd1npMPC4YwGu/qj4FjBa+c4xtNiQgUYpkoCex/9sUUmmZey9uFCdfyO/zpAZAC6YLArRQSKQQ9KzNN+5ZUA7//HgIzRx2r9ybDG60BI1ubja4DUp4pMU3ssyXWs4z4w6K3XMMwIROt72T6YA+ZLnbgVVRrvZz4EFQ0jbNYRcIUwiUtUK83yKtdAkRhWu1G5snvwbdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(39830400003)(396003)(376002)(451199015)(66556008)(316002)(66946007)(86362001)(66476007)(4326008)(36756003)(2906002)(5660300002)(8936002)(8676002)(110136005)(41300700001)(83380400001)(2616005)(1076003)(186003)(38100700002)(6506007)(38350700002)(478600001)(6486002)(52116002)(26005)(6512007)(6666004)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnQ4cUFpbys2RmpTeW9QNHdLNGxDVmtSMzNCL0RJck9XOGhwY2NhMkR4cFhN?=
 =?utf-8?B?ZEE0Qll6SXNDUVBKZDNPMGZQQUtZOUJ6YUtFUnl6bHhUSUJaYkxCa3dRQ0hh?=
 =?utf-8?B?RWhBTXhjc3B0UjdxbVJJeWwvSUJFKzQxZ2pQZVI2bnk3ZWR0UUs1eFc4SDdp?=
 =?utf-8?B?aVRlcHJxUW44aDkvM1hPSGw3dFJpNkVUcVU3MndsaEZtcGlldzNpQ0MzQkQy?=
 =?utf-8?B?b3J1bGxZTnM1bGJHMVJFSitSNlVwbHUxdXlhVXVRbklQWldkZ05JaTBYWnU1?=
 =?utf-8?B?dVY2U21OcXBhOTNUeCtqY2loTHdKeHU3NHpGczdyVTdUUUszY0VBQUk1SjFQ?=
 =?utf-8?B?Nllya1VGeGpIUnpHZnVxc0pCQjROOHpmM3RFdG84TzdsdUhLampyTjNPSWJF?=
 =?utf-8?B?akFkMVQ3bERFOWR0L08vaGROeFBqbmdVL3NFbXROWXgvZHI5WlhqZDR5MXNi?=
 =?utf-8?B?Z2E2WEN4R3R2QjVqYUlTajN2V3d3Wk5JdU5XZkZYbkRISUg4NmhkZ045Uzk0?=
 =?utf-8?B?ZFFhQVgwRGdOeWd2b1FoaXZPNERaTGs0MHVXYlgvR1k3b2hHckljMXM2UFNG?=
 =?utf-8?B?aXE2TUpzNjlBMWN2MU9xbnF6dzZsK2l4Nk5RZk9rSWVLNzVDQzByMU00M2Z3?=
 =?utf-8?B?QzNIQkJUQSs5SEg4Sm1qRURMdDVad3JFSW1weVhsWHZPQmo0bFVFWlFDbTMr?=
 =?utf-8?B?RzJwTXBpQkxMZ01nQUtCQzMwY2dhbStmcjRuVDhjYStXSHZ1R214THkxcmJV?=
 =?utf-8?B?dDFNRjRmVWFxcXk1elRSQkk5cTZHVForOHJ0ZWhEdm5XQ2FKMHQ3eDUzL0Rr?=
 =?utf-8?B?QWwxSUZvWGMzOGFoVkMxL2tRN0d1b0dhUGNvcDB6MVlDTnk0bWFvaGxyUzZ3?=
 =?utf-8?B?VzJlME1TNGNCVkU0Ui82NUhJKzd4d1dLR0p2VjYybVpWbHp0RHpQeTBEZDZw?=
 =?utf-8?B?YU1iWlpwejlNK1ZHUFRmd0VKZk10V0UyU1BLN1ArYzNCdHFmYi9xdUVKMW9l?=
 =?utf-8?B?aTRFZ0IwSEZPM0FiSGZzZUJubjM3cXZKQXpkaUMzRVhnS1VZSTlQcWNhKzlm?=
 =?utf-8?B?VnFmMjh4TkxOOHIxMnYzWnVjZmNkR3hrRkdIRStSQlVCdFlnWDBuby83REFE?=
 =?utf-8?B?SldEak9UL29HSXI4cW1TYXI1anhMZmozVUIwdVlrQXpFMk1xU01RMmhray8x?=
 =?utf-8?B?YTl1Y1VhdVpFU1oyNzgvVFVVZ0Q3ZUpKMUV5Mk5vY21tYUdZbTBjdng3T0FG?=
 =?utf-8?B?bGR3cGlZTHYyazhwUWY0SCs5UEVUVXcrS2E2ZzR3Q3Z1Z0R1L21YT2hYN0I4?=
 =?utf-8?B?ZU9WbWtrakMxQ1IycWltMHFCclQrN3NkREhSOG4xSEZQQzJhc0VYWFYyWHov?=
 =?utf-8?B?RGJLa08yOE1qRzZUczVaRk1TNnZ1bG0yMGlOanZWQnJSRkFsa0VpTWxzdHJV?=
 =?utf-8?B?U1lxS01FM3paZmlFeVVPUloxdWRuQlp2TDV3WjF2TVZSM0QwbHRoM2NnSVp0?=
 =?utf-8?B?QUppa2ppMHBXWFBwNENxdlpqQzNpUVU2bU1nNjlpVysyTHhSUjZNeld0bFp0?=
 =?utf-8?B?TkZqb0RqSWZsSVkybG1NTXN1N05ZN0VoQ2o3K3QyTzgvZzhaOWNpZW5wSlR3?=
 =?utf-8?B?WXZKRmR3MlFIZE5GbmRSZjlXYXo4NGU0cVcyNk5QRnRuQ0ZLeHI0c3lLMlpz?=
 =?utf-8?B?VnBod1Q1SnJONWRpdGlDaEc2a1lrU0JjZzhvQkxEN2VWQUp1aEt4NUVId1Z0?=
 =?utf-8?B?TjJzODVWQU1ROU1LV3hBemlKWUJlQkZWVi9yU2pIMzRPMlZtK3IvcVRGMnpn?=
 =?utf-8?B?eDFPcmpZT2xqZ2FGMDYxQ2U3b09WQkZqZGw0WHF5WDZjQzNmekZOTzhDdEkr?=
 =?utf-8?B?MUhVNEMrUFlKLzdqQXh2TlB3SjYyb3kzMXo2NzdoOVA5M0d3T1JlMzZYTjlO?=
 =?utf-8?B?STJ0L1JlRzNWbUkzc3hJaW9oWGVZZkczR091ZTh2c2MrVGp3WlhZRGpRK2Jo?=
 =?utf-8?B?Qlp6Wmo4TXhteUUxbW5yTWc2d3R1NDhzdmpqcks3eHVQdFdFaHRNYURpczFp?=
 =?utf-8?B?WnVpM09pNHNRSlBrNnAzREg0WmJIYzhDTzMvVnhUZW45VlF2RzBzOVo1NVJN?=
 =?utf-8?B?eitBUWI4RjFDL3ZST1BFTWJOV2JQejZodDZGeGxyZytITStkK0Z6TU5xbVJJ?=
 =?utf-8?B?Znc9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4dfaed-95b8-4597-8b46-08daaac29b9e
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 13:23:23.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bORIAN33yOdPqW6pFGsp9gKb6HXJ8AvnnaGNJNloxJXlrGNuzXiPbWBuEQjNh9QHeZLhV5guHY6f6aCUoc0b4EkZG/kHI7/01Mz0TEt7uoE=
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

This change is necessary for a following patch, which introduces an
interrupt mask register different from what is already in the driver.

Currenty the only interrupt mask register the driver handles is
PCAL953x_INT_MASK present in the pcal chips. The functions handling
this register can easily be made generic enough to handle the interrupt
mask register of other chips that do not use the pcal register set,
and have their interrupt mask register at a different address.

Add bit flag PCA_HAS_INT_MASK, which is set for each chip with an
interrupt mask register (including pcal chips).

Define a convenience bitmask PCA_MASKED_INT similar to PCA_LATCH_INT.

Add an int_mask member to struct pca953x_reg_config. This way interrupt
mask handling code can work with registers at different addresses.

Add separate pca953x_reg_config for pcal953x chips. This differs from
the pca953x_regs in the new int_mask field.

In pca953x_readable_register and pca953x_writeable_register only check for
PCA_PCAL if the chip is not PCA957X_TYPE. No chip is both pca957x and pcal.
This makes logic for adding a different interrupt mask register
cleaner.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
 drivers/gpio/gpio-pca953x.c | 64 +++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 61e874c0cde4..71bfc38c3930 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -63,7 +63,9 @@
 
 #define PCA_INT			BIT(8)
 #define PCA_PCAL		BIT(9)
-#define PCA_LATCH_INT		(PCA_PCAL | PCA_INT)
+#define PCA_HAS_INT_MASK	BIT(10)
+#define PCA_MASKED_INT		(PCA_HAS_INT_MASK | PCA_INT)
+#define PCA_LATCH_INT		(PCA_PCAL | PCA_MASKED_INT)
 #define PCA953X_TYPE		BIT(12)
 #define PCA957X_TYPE		BIT(13)
 #define PCAL653X_TYPE		BIT(14)
@@ -177,6 +179,7 @@ struct pca953x_reg_config {
 	int output;
 	int input;
 	int invert;
+	int int_mask;
 };
 
 static const struct pca953x_reg_config pca953x_regs = {
@@ -186,6 +189,14 @@ static const struct pca953x_reg_config pca953x_regs = {
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
@@ -356,12 +367,13 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 	} else {
 		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
 		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
-	}
 
-	if (chip->driver_data & PCA_PCAL) {
-		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
-			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK |
-			PCAL9xxx_BANK_IRQ_STAT;
+		if (chip->driver_data & PCA_PCAL)
+			bank |= PCAL9xxx_BANK_IN_LATCH |
+				PCAL9xxx_BANK_PULL_EN |
+				PCAL9xxx_BANK_PULL_SEL |
+				PCAL9xxx_BANK_IRQ_MASK |
+				PCAL9xxx_BANK_IRQ_STAT;
 	}
 
 	return chip->check_reg(chip, reg, bank);
@@ -378,11 +390,13 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 	} else {
 		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
 			PCA953x_BANK_CONFIG;
-	}
 
-	if (chip->driver_data & PCA_PCAL)
-		bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
-			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK;
+		if (chip->driver_data & PCA_PCAL)
+			bank |= PCAL9xxx_BANK_IN_LATCH |
+				PCAL9xxx_BANK_PULL_EN |
+				PCAL9xxx_BANK_PULL_SEL |
+				PCAL9xxx_BANK_IRQ_MASK;
+	}
 
 	return chip->check_reg(chip, reg, bank);
 }
@@ -764,14 +778,16 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	int level;
 
-	if (chip->driver_data & PCA_PCAL) {
-		/* Enable latch on interrupt-enabled inputs */
-		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
-
+	if (chip->driver_data & PCA_HAS_INT_MASK) {
 		bitmap_complement(irq_mask, chip->irq_mask, gc->ngpio);
 
 		/* Unmask enabled interrupts */
-		pca953x_write_regs(chip, PCAL953X_INT_MASK, irq_mask);
+		pca953x_write_regs(chip, chip->regs->int_mask, irq_mask);
+	}
+
+	if (chip->driver_data & PCA_PCAL) {
+		/* Enable latch on interrupt-enabled inputs */
+		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 	}
 
 	/* Switch direction to input if needed */
@@ -1171,7 +1187,11 @@ static int pca953x_probe(struct i2c_client *client,
 		chip->regs = &pca957x_regs;
 		ret = device_pca957x_init(chip, invert);
 	} else {
-		chip->regs = &pca953x_regs;
+		if (chip->driver_data & PCA_PCAL)
+			chip->regs = &pcal953x_regs;
+		else
+			chip->regs = &pca953x_regs;
+
 		ret = device_pca95xx_init(chip, invert);
 	}
 	if (ret)
@@ -1245,21 +1265,23 @@ static int pca953x_regcache_sync(struct device *dev)
 	}
 
 #ifdef CONFIG_GPIO_PCA953X_IRQ
-	if (chip->driver_data & PCA_PCAL) {
-		regaddr = chip->recalc_addr(chip, PCAL953X_IN_LATCH, 0);
+	if (chip->driver_data & PCA_HAS_INT_MASK) {
+		regaddr = pca953x_recalc_addr(chip, chip->regs->int_mask, 0);
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
+	if (chip->driver_data & PCA_PCAL) {
+		regaddr = chip->recalc_addr(chip, PCAL953X_IN_LATCH, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
 					   regaddr + NBANK(chip) - 1);
 		if (ret) {
-			dev_err(dev, "Failed to sync INT mask registers: %d\n",
+			dev_err(dev, "Failed to sync INT latch registers: %d\n",
 				ret);
 			return ret;
 		}
-- 
2.37.3

