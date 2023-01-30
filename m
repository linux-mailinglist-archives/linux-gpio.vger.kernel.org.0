Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 678AB681BF5
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 22:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjA3VAF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 16:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjA3VAE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 16:00:04 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2071.outbound.protection.outlook.com [40.107.14.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50456460BF
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 13:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExVQLitFSsNMzzNzaA2F3sxAcLxzsEAYmodQ8FlU0vz+4tXuVbI/Tnp8XxOd0QnLMglOpeznUlk9vdjmUF1U0+p06lqLFOtW0nz6qTpjrpotLswb3bsbuWxOQs1yRiHz6+L9UOfOwgxpFrtPRCJruwmZx9cAz/ptUoFAFPnvktCgH4hh1owutJ3to8lXDCR41GuB7sv91R/hSYAMr0JqasCqa6VVuqlJcJYyxQEOh/hoZMO2rromNJASmYin0KDdX0TWieKrCl9ZZfeiIzA/4C3jMehdmkPXQ6Yzo9o4RhrlRAvuURTv3qMJcDCUqCVLw9h/yhGxf/sdblilw/xvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJ9BYCTw+p5pqZoVY9caiBYBFRlP0XlpTsRM6hvdXDo=;
 b=cPRyNWq298s2EBlI+HuDF1X2pWj+LAybfOHpv2i6piA2v4yoAJpWR4tH2qJ7BIodDsrUgaG9n3WzlE/t2+TcjqUu8sRPpmquyGZ+tB+c7GObUk602MER1x4gtQlWjWgGU8yNcdzu5/UJyZLaY16qovWvbSzvcPAniG7MHhL0oda8XFGk+oT10VIhlTJYiwSc0a3byFpcCTViy0k3Th5IuvCeE4PAqVYmu24OD3z2OG/erA0Cbd+3LeaRGqurNndk3XSyT2XOaJfAm5p6aaFtrNvz4YIMM97C4bz6kG335xe5WvxAx/veSKYjSNK1cbGfYppT6iDnnKIm+KohzlxGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ9BYCTw+p5pqZoVY9caiBYBFRlP0XlpTsRM6hvdXDo=;
 b=bfNEmvMyoOZLz1MGlwss4lqcbGb76oZkjYvjnRDzWTEx/ugM48Xp0FBH8AHmBOCtDj0uEcUZbjP0Z3ebIogjEd2sGBfGqRMfPrZJb56olAwxu4NGqzz8nbfbtZ51TKoREO7Z3SMK2CY/xu5gkUfyGz0sq5MUptoBVuC3LbJhUgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by AS8P194MB2162.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:631::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 20:59:57 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::6322:b35d:1369:be7e]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::6322:b35d:1369:be7e%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 20:59:57 +0000
Message-ID: <5a4ce37a-2d5b-d179-dd1b-04fdd038c63f@eilabs.com>
Date:   Mon, 30 Jan 2023 21:59:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
Subject: [RFC PATCH 3/3] gpio: pca953x: Redesign register address calculation
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
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|AS8P194MB2162:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ade5db-568c-4962-ee7a-08db0304f1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UJY+eoWjlVbphOMItBHYSqs0BI0IPf23RjSOpoZ+Srv+oVnLDM20k1RAYCrNRFeYe88luB7ozkGZ5X/bWYF7+oh1kLDwHQsAcDM8rH0hWH1xXLuDR2EQNXZB7R38lULPYTGwBj68xV7z/nK/btIebyEoOLK4gu4UZ7eps9HrftVT1+bUbYwTUsRdmAz6tNdLE7vqDJxlaJcjqbIjh2MefQ3MpSIuMJG9fjnetNlWjgFrjh+EEN3ZKZgMIWLEpYl1xa4ANBi3yQqIJgWRCjDlEdQA6U8dam4nqxPhi2m9ausuiAJ7mliYbaR4M64Uj7pIQmSyC2a0gbCeQNBr0qwQVqrPtu42Cc0+MTPOppcm7xnYHgbnyCKMBRFrAjwKn5Kw7sUXqrzzddye3+h1KiCL1x3tC+rjWm7SHXLeZ7mH9LueDu7BfbD3+Z4fGYKW7wXqgz+OTUUM4VOfOYiZk+1DMqPADjchGmTlFIWKJpFi0mmBNo5lkBz70489wFvQBEE0T0m/P8s1Nl3ivSeZsJDEJ3SpqJ2BDZVIVtW5vJXlm7+avqKt4eA43Gg+4jjbWnfPSxG7NioV2eW5BRrK/jdnDYvZPLRb/OkWZfyH9D1Tews/Jzjn3zTkR6L3kcxyk+21GxoWng3UT/qSOZsojpI4t3PZydgmt4y+QiWr9JBVyLo3UIIe9WA41vfr8hnCCBEBRf76yOenIyuEwXXumNxa29LpctFmCX/zyUGCRB1uKnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39830400003)(366004)(346002)(136003)(396003)(376002)(451199018)(86362001)(31696002)(38100700002)(36756003)(316002)(110136005)(8936002)(66946007)(5660300002)(54906003)(66476007)(4326008)(66556008)(8676002)(2906002)(7416002)(30864003)(66574015)(2616005)(83380400001)(478600001)(6486002)(6506007)(6512007)(26005)(186003)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alkrWXBPVy8xZ1NCUnFMbGsxOTY3cFMzMUZPMXZCeGQ5OWdlTDBvRml3TjIz?=
 =?utf-8?B?blY0N3dTTmRQRHd5c2Rlc25NMkhEZVplWFMzRHpRQk95MTRMZjRTMWNEZlgv?=
 =?utf-8?B?SkovV1IzVTVMaWZadHY3SWdrMERKNTFnMW9YSVh4bkxpUWx2MGZwZDhSTWR6?=
 =?utf-8?B?MHh4RXFWbEJXbG41Zng3UGQ2VlV6VGNkbWR4S0ZsNTd3bFNRTlZaYm1TMzJQ?=
 =?utf-8?B?MTAzRHd3b29lbE1nUlpBYXh6L3F6K253YllDNzlENURjeEE0U3NoRkJ5eUpI?=
 =?utf-8?B?NkRQR05vYzBVb0RpYjBCMlBtRXpveHowb09remFGMFdmNXAxOTdjSEREMGU5?=
 =?utf-8?B?V1dzUld3bTI1K1RSWlpkR0ZqUDFpZVk5dDlrVFRKYWRzMmNvcEJ1K05Pb0x1?=
 =?utf-8?B?U3FiYlNyRFYzSFlndjh0Z2FLaGFFd29SUHIxNDVpWWJtbzFHNDR5ZWJJRjZu?=
 =?utf-8?B?MDV5aUpOMjBkd2VaYm9QYkZpNFVDd3J0Yk9RaTdzc0RzQ2NGTXJROHcwekdU?=
 =?utf-8?B?Q0d6d0FwUTRrYjU2NW52eW5uc0tOWGM1a1UreHlpR0ZYWFR0ZGdTdHJnQkFK?=
 =?utf-8?B?Si9mQ3NGK3ptYmp6WXkyTG9oaXJlTlVCMVM5NHlGY3dCMUUyWGdoUFZFRnd4?=
 =?utf-8?B?dGhUSjd6Um9FajhQVHZSSno2bFJ4MFZndHVpS3l4WjNOazJPdTlBdkF5MC95?=
 =?utf-8?B?dnEyVlZjTnVUYUl6NVptNXVrdjBFN2tRaHB5TnFsZ09ISWEvaGw2Yy9yNU5X?=
 =?utf-8?B?OWdVWjB4VVo1OFJCclE2MEhBZ3JaTDJhYll5ODJZbWtRZmc5cFNIS0lJL1hR?=
 =?utf-8?B?Vnd6c2hBMUhQbVM5VFA0MVIyVTF6VWJUZ3RIQksrbjR2eWtUN2JVSzlkajhB?=
 =?utf-8?B?U2QveWViTjlPejFJSUJMbzBPOEU3ZkRrbmdMdGEzNEJnZkFEM0xzNnd1eWtu?=
 =?utf-8?B?RlFzT1ExL2Z6L200ZGgyLzZBdWNvd2p6RWNkMVJiUU1vS3JLODh3OEVwSVpC?=
 =?utf-8?B?SXVvVmM2bGVSMTRsdFNwSUE0eEd2RkNNeWs2TWRTSlF3NEJyT3N3VWpkY1Vt?=
 =?utf-8?B?VnlPNS9RL28zQ0ZxQmF2clRlcHFQWExBM1dZNm1QWUdqaUY0RzMvaVpRR3Bz?=
 =?utf-8?B?bUwxVTZ2OVh1a2RpdnZQMlJuVGhZM3ltaklnOEZFVWtuS1BPUis2a0YwSkNk?=
 =?utf-8?B?ZVBkamFDRjZZcjZaNWEzc3QyalZpQmg4d2FRUzR5SFFQTnh6ZFgyVDJVakVh?=
 =?utf-8?B?YXNxZ3Q0R1FNRVpsdm4ydVpZYk1xKzhYdnl2UkN1YkJFK0hQQ2FZa2xVQ2po?=
 =?utf-8?B?WG9PdlkrVU9NYWFlc245cnNRUE4rcnkreWJlMWFMQWhFVHFRcHhrZ0JacWRG?=
 =?utf-8?B?ck4zUVAyT205Yks2dDFDWVRFaEE1M2lqV2RlVFZWV0tmLzhFYnhUT25oZ05i?=
 =?utf-8?B?cU4rNFlzaEloUnJLc2dkY2JvUnZ6UCtkdDJpbjU0OFo1L2xPTUhEU2x5YWVl?=
 =?utf-8?B?MmZRN2dRWHdRbkNoOXZHYjhWbDVmNU9JUWRYbVlNVVY1eFcvZHdPOXZMQy9a?=
 =?utf-8?B?SkJwN2l1bDhKT3JyYWVvdUdvdExoR1dIQ2ZzN2FZdE5kU1VBN0hKL2VxT0da?=
 =?utf-8?B?YlVPUkF4b0tOb0dLR0FoL1pVSVdQdGxjM2Naa1ZRK2JHMHQxSVpkOHpCNnNh?=
 =?utf-8?B?c3d4aEdDc3cvbnJtWFZLRXpGNkgvZXhGRGRnZzFvMnpuTDZtendZSEJiSk5Y?=
 =?utf-8?B?dDJpamw0aUhLRkp4Tk9zZXFVSDNXaUpSSElUUGQvZmVueDR4NWJITW5SMS9K?=
 =?utf-8?B?R29RM1FWNU1yaFNYOGV3UFdvMHNYUE83RFpjRTNIeWttdkg4QkhPUXY5d2Vh?=
 =?utf-8?B?WHh1WUYzcmtsRnh2RDRSQXg5MDFGUVc5Y3EvbXZEQkIwOHY5dkFzSWY3aTZD?=
 =?utf-8?B?Z2k0dDMvMEdkSVgzOUFFdkZXdkJabXZRUU1PUzR0OVZBRU9aMTNaV0d0MmY0?=
 =?utf-8?B?eVB1ZVRMb3EvaUpGK3JiMTJFS1o2VSs0eUVMM0hKT0k2WGUyK3ExSXB4WFVP?=
 =?utf-8?B?NXk2a1ZwbFcycUVjQjVCRGNDMXhxb0U1alpFUm03UjJtdE1LN3Awa1JENUZn?=
 =?utf-8?B?MXVDQ29NSWpXeEd2M1pXVVllZkV2U01XL2NTRkEwbDk0QU1UZENwL1pabFJo?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ade5db-568c-4962-ee7a-08db0304f1b9
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 20:59:57.5021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GiAaouLf7yy/P8jc1iXDm6RWrQgAIUw06Smx15RzSL7jukkrUHwtS13JRs1EKrJ0kwLuN9ewslegSfvUXMA6ZLdO0oLhJgvp+pbZxtf7l4=
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

Replace the address calculation scheme with new reg_addr() and check_reg()
functions, one for each register layout. The new functions can work with
all of the extended registers. The functions have been tested with the
register layout of each compatible chip.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
---
 drivers/gpio/gpio-pca953x.c | 551 ++++++++++++++++++++++++++++--------
 1 file changed, 434 insertions(+), 117 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 3d4c3efeaf35..34326abf8f63 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -26,26 +26,8 @@
 #include <asm/unaligned.h>
 
 #define REG_ADDR_MASK		GENMASK(5, 0)
-#define REG_ADDR_EXT		BIT(6)
 #define REG_ADDR_AI		BIT(7)
 
-#define PCAL953X_OUT_STRENGTH	0x20
-#define PCAL953X_IN_LATCH	0x22
-#define PCAL953X_PULL_EN	0x23
-#define PCAL953X_PULL_SEL	0x24
-#define PCAL953X_INT_MASK	0x25
-#define PCAL953X_INT_STAT	0x26
-#define PCAL953X_OUT_CONF	0x27
-
-#define PCAL6524_INT_EDGE	0x28
-#define PCAL6524_INT_CLR	0x2a
-#define PCAL6524_IN_STATUS	0x2b
-#define PCAL6524_OUT_INDCONF	0x2c
-#define PCAL6524_DEBOUNCE	0x2d
-
-#define PCAL_GPIO_MASK		GENMASK(4, 0)
-#define PCAL_PINCTRL_MASK	GENMASK(6, 5)
-
 /*
  * driver_data
  *
@@ -348,9 +330,10 @@ struct pca953x_chip {
 	enum pca953x_chip_type type;
 	const struct pca953x_reg_config *regs;
 
-	u8 (*recalc_addr)(struct pca953x_chip *chip, int reg, int off);
-	bool (*check_reg)(struct pca953x_chip *chip, unsigned int reg,
-			  u32 checkbank);
+	u8 (*reg_addr)(struct pca953x_chip *chip, unsigned int reg,
+		       unsigned int offset);
+	bool (*check_reg)(struct pca953x_chip *chip, u8 reg_addr,
+			  u32 registers);
 };
 
 static bool pca953x_has_int(struct pca953x_chip *chip)
@@ -398,25 +381,33 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
  *   categories above.
  */
 
-static bool pca953x_check_register(struct pca953x_chip *chip, unsigned int reg,
-				   u32 checkbank)
+/*
+ * Register types:
+ *   - Single register: 1 byte for each GPIO port.
+ *   - Double register: 2 bytes for each GPIO port.
+ *   - One-byte register: Only a single byte.
+ */
+
+/* Check if register address belongs to any of the registers in a set. */
+static bool pca953x_check_reg(struct pca953x_chip *chip, u8 reg_addr,
+			      u32 registers)
 {
 	int bank_shift = pca953x_bank_shift(chip);
-	int bank = (reg & REG_ADDR_MASK) >> bank_shift;
-	int offset = reg & (BIT(bank_shift) - 1);
+	int reg;
+	int offset;
 
-	/* Special PCAL extended register check. */
-	if (reg & REG_ADDR_EXT) {
-		if (!pca953x_is_pcal_type(chip))
-			return false;
-		bank += 8;
-	}
+	reg_addr &= REG_ADDR_MASK;
+
+	reg = reg_addr >> bank_shift;
+
+	/* Which byte this is in a register bank. */
+	offset = reg_addr & (BIT(bank_shift) - 1);
 
-	/* Register is not in the matching bank. */
-	if (!(BIT(bank) & checkbank))
+	/* Address does not belong to any of the registers. */
+	if (!(BIT(reg) & registers))
 		return false;
 
-	/* Register is not within allowed range of bank. */
+	/* Offset is not within allowed range of the register. */
 	if (offset >= NBANK(chip))
 		return false;
 
@@ -424,46 +415,287 @@ static bool pca953x_check_register(struct pca953x_chip *chip, unsigned int reg,
 }
 
 /*
- * Unfortunately, whilst the PCAL6534 chip (and compatibles) broadly follow the
- * same register layout as the PCAL6524, the spacing of the registers has been
- * fundamentally altered by compacting them and thus does not obey the same
- * rules, including being able to use bit shifting to determine bank. These
- * chips hence need special handling here.
+ * Convert register address to register enum value.
+ * Returns -1 if reg_addr is invalid.
  */
-static bool pcal6534_check_register(struct pca953x_chip *chip, unsigned int reg,
-				    u32 checkbank)
+static int pcal953x_reg_addr_to_reg(int bank_shift, u8 reg_addr)
 {
-	int bank_shift;
-	int bank;
+	int reg;
+
+	if (reg_addr < (4U << bank_shift)) {
+		/* Basic registers. */
+		reg = reg_addr >> bank_shift;
+	} else if (reg_addr < 0x40) {
+		reg = -1;
+	} else if (reg_addr < 0x4F) {
+		/* Extended registers */
+		reg = ((reg_addr - 0x40) >> bank_shift) +
+			PCAL953X_REG_DRIVE_STRENGTH;
+
+		/* Compensate skipped reg numbers due to double registers. */
+		if (reg > PCAL953X_REG_DRIVE_STRENGTH)
+			reg -= 1;
+
+	} else if (reg_addr == 0x4F) {
+		/* Drive Mode register. Always 1 byte. */
+		reg = PCAL953X_REG_DRIVE_MODE;
+	} else {
+		reg = -1;
+	}
+
+	return reg;
+}
+
+static int pcal953x_calculate_reg_offset(int bank_offset, u8 reg_addr,
+					 enum pcal953x_reg reg)
+{
+	/*
+	 * Single registers and one-byte registers always start on a bank
+	 * border, the offset is the distance from reg_addr to the bank border.
+	 *
+	 * Double registers span over two banks, so the offset can be larger
+	 * than a bank. The offset is the distance from reg_addr to either an
+	 * odd or an even bank border, depending on the base address of the
+	 * register.
+	 */
+
+	u8 ext_addr;
+
+	if (reg <= PCAL953X_REG_DIRECTION)
+		return reg_addr % bank_offset;
+
+	/* Count banks from the base address of the extended regs. */
+	ext_addr = reg_addr - 0x40;
+
+	/* Double register in bank (N,N+1), N is even. */
+	if (reg == PCAL953X_REG_DRIVE_STRENGTH)
+		return ext_addr % (bank_offset * 2);
+	/* Drive Mode has no offsets. */
+	else if (reg == PCAL953X_REG_DRIVE_MODE)
+		return 0;
+	else
+		return ext_addr % bank_offset;
+}
+
+/* Check if offset is valid for register reg. */
+static bool pcal953x_check_reg_offset(int bank_size, enum pcal953x_reg reg,
+				      unsigned int offset)
+{
+	int maxoffset = bank_size - 1;
+
+	/* Double register */
+	if (reg == PCAL953X_REG_DRIVE_STRENGTH)
+		maxoffset = 2 * bank_size - 1;
+
+	/* One byte register */
+	if (reg == PCAL953X_REG_DRIVE_MODE)
+		maxoffset = 0;
+
+	/* Offset is not within allowed range of the register. */
+	if (offset > maxoffset)
+		return false;
+
+	return true;
+}
+
+/* Check if register address belongs to any of the registers in a set. */
+static bool pcal953x_check_reg(struct pca953x_chip *chip, u8 reg_addr,
+			       u32 registers)
+{
+	int bank_shift = pca953x_bank_shift(chip);
+	int bank_offset = BIT(bank_shift);
+	int reg;
 	int offset;
 
-	if (reg >= 0x54) {
-		/*
-		 * Handle lack of reserved registers after output port
-		 * configuration register to form a bank.
-		 */
-		reg -= 0x54;
-		bank_shift = 16;
-	} else if (reg >= 0x30) {
-		/*
-		 * Reserved block between 14h and 2Fh does not align on
-		 * expected bank boundaries like other devices.
-		 */
-		reg -= 0x30;
-		bank_shift = 8;
+	reg_addr &= REG_ADDR_MASK;
+
+	reg = pcal953x_reg_addr_to_reg(bank_shift, reg_addr);
+
+	/* Address does not belong to any of the registers. */
+	if (!(BIT(reg) & registers))
+		return false;
+
+	offset = pcal953x_calculate_reg_offset(bank_offset, reg_addr, reg);
+
+	if (!pcal953x_check_reg_offset(NBANK(chip), reg, offset))
+		return false;
+
+	return true;
+}
+
+/*
+ * Convert register address to register enum value.
+ * Returns -1 if reg_addr is invalid.
+ */
+static int pcal65xx_reg_addr_to_reg(int bank_offset, u8 ext_base_addr,
+				    u8 reg_addr)
+{
+	int reg;
+
+	if (reg_addr < 4 * bank_offset) {
+		/* Basic registers. */
+		reg = reg_addr / bank_offset;
+	} else if (reg_addr < ext_base_addr) {
+		reg = -1;
+	} else if (reg_addr < ext_base_addr + 15 * bank_offset) {
+		/* Extended registers */
+		reg = ((reg_addr - ext_base_addr) / bank_offset) +
+			PCAL65XX_REG_DRIVE_STRENGTH;
+
+		/* Compensate for skipped reg numbers after double registers. */
+		if (reg > PCAL65XX_REG_DRIVE_STRENGTH)
+			reg -= 1;
+
+		if (reg > PCAL65XX_REG_INT_EDGE)
+			reg -= 1;
 	} else {
-		bank_shift = 0;
+		reg = -1;
 	}
 
-	bank = bank_shift + reg / NBANK(chip);
-	offset = reg % NBANK(chip);
+	return reg;
+}
+
+static int pcal65xx_calculate_reg_offset(int bank_offset, u8 ext_base_addr,
+					 u8 reg_addr, enum pcal65xx_reg reg)
+{
+	/*
+	 * Single registers and one-byte registers always start on a bank
+	 * border, the offset is the distance from reg_addr to the bank border.
+	 *
+	 * Double registers span over two banks, so the offset can be larger
+	 * than a bank. The offset is the distance from reg_addr to either an
+	 * odd or an even bank border, depending on the base address of the
+	 * register.
+	 */
 
-	/* Register is not in the matching bank. */
-	if (!(BIT(bank) & checkbank))
+	u8 ext_addr;
+
+	if (reg <= PCAL65XX_REG_DIRECTION)
+		return reg_addr % bank_offset;
+
+	/* Count banks in relation to the base address of the extended regs. */
+	ext_addr = reg_addr - ext_base_addr;
+
+	/* Double register in bank (N,N+1), N is even. */
+	if (reg == PCAL65XX_REG_DRIVE_STRENGTH || reg == PCAL65XX_REG_INT_EDGE)
+		return ext_addr % (bank_offset * 2);
+	else
+		return ext_addr % bank_offset;
+}
+
+/* Check if offset is valid for register reg. */
+static bool pcal65xx_check_reg_offset(int bank_size, enum pcal65xx_reg reg,
+				      unsigned int offset)
+{
+	int maxoffset = bank_size - 1;
+	int num_debounce_ports = min(bank_size, PCAL65XX_MAX_NUM_DEBOUNCE_PORTS);
+
+	/* Double registers */
+	if (reg == PCAL65XX_REG_DRIVE_STRENGTH || reg == PCAL65XX_REG_INT_EDGE)
+		maxoffset = 2 * bank_size - 1;
+
+	/* One byte registers */
+	if (reg == PCAL65XX_REG_DRIVE_MODE || reg == PCAL65XX_REG_DEBOUNCE_COUNT)
+		maxoffset = 0;
+
+	if (reg == PCAL65XX_REG_DEBOUNCE_EN)
+		maxoffset = num_debounce_ports;
+
+	/* Offset is not within allowed range of the register. */
+	if (offset > maxoffset)
 		return false;
 
-	/* Register is not within allowed range of bank. */
-	if (offset >= NBANK(chip))
+	return true;
+}
+
+/* Check if register address belongs to any of the registers in a set. */
+static bool pcal652x_check_reg(struct pca953x_chip *chip, u8 reg_addr,
+			       u32 registers)
+{
+	int bank_shift = pca953x_bank_shift(chip);
+	int bank_offset = BIT(bank_shift);
+	int ext_base_addr = 0x40;
+	int num_debounce_ports = min(NBANK(chip), PCAL65XX_MAX_NUM_DEBOUNCE_PORTS);
+	int max_addr;
+	int reg;
+	int offset;
+
+	reg_addr &= REG_ADDR_MASK;
+
+	max_addr = ext_base_addr + (13U << bank_shift) + num_debounce_ports;
+	if (reg_addr > max_addr)
+		return false;
+
+	/*
+	 * The debounce count register is not aligned to bank offset.
+	 * Add enough offset to reg_address to form a bank.
+	 */
+	if (reg_addr == ext_base_addr + (13U << bank_shift) + num_debounce_ports)
+		reg_addr += bank_offset - num_debounce_ports;
+
+
+	reg = pcal65xx_reg_addr_to_reg(bank_offset, ext_base_addr, reg_addr);
+	if (reg < 0)
+		return false;
+
+	/* Address does not belong to any of the registers. */
+	if (!(BIT(reg) & registers))
+		return false;
+
+	offset = pcal65xx_calculate_reg_offset(bank_offset, ext_base_addr,
+					       reg_addr, reg);
+
+	if (!pcal65xx_check_reg_offset(NBANK(chip), reg, offset))
+		return false;
+
+	return true;
+}
+
+/* Check if register address belongs to any of the registers in a set. */
+static bool pcal653x_check_reg(struct pca953x_chip *chip, u8 reg_addr,
+			       u32 registers)
+{
+	/* PCAL653X has no padding (reserved registers) between banks. */
+
+	int bank_offset = NBANK(chip);
+	int ext_base_addr = 0x30;
+	int num_debounce_ports = min(NBANK(chip), PCAL65XX_MAX_NUM_DEBOUNCE_PORTS);
+	int max_addr;
+	int reg;
+	int offset;
+
+	reg_addr &= REG_ADDR_MASK;
+
+	max_addr = ext_base_addr + 13 * bank_offset + num_debounce_ports;
+	if (reg_addr > max_addr)
+		return false;
+
+	/*
+	 * The drive mode register is only 1 byte long with no padding after it.
+	 * Add enough offset to reg_addr to form a bank.
+	 */
+	if (reg_addr > ext_base_addr + 7 * bank_offset)
+		reg_addr += bank_offset - 1;
+
+	/*
+	 * The debounce count register is not aligned to bank offset. Add enough
+	 * offset to reg_address to form a bank.
+	 */
+	if (reg_addr == ext_base_addr + 13 * bank_offset + num_debounce_ports)
+		reg_addr += bank_offset - num_debounce_ports;
+
+	reg = pcal65xx_reg_addr_to_reg(bank_offset, 0x30, reg_addr);
+	if (reg < 0)
+		return false;
+
+	/* Address does not belong to any of the registers. */
+	if (!(BIT(reg) & registers))
+		return false;
+
+	offset = pcal65xx_calculate_reg_offset(bank_offset, ext_base_addr,
+					       reg_addr, reg);
+
+	if (!pcal65xx_check_reg_offset(NBANK(chip), reg, offset))
 		return false;
 
 	return true;
@@ -686,51 +918,125 @@ static const struct regmap_config pca953x_ai_i2c_regmap = {
 	.max_register = 0x7f,
 };
 
-static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off)
+/* Get the i2c address of register reg for line at offset. */
+static u8 pca953x_reg_addr(struct pca953x_chip *chip, unsigned int reg,
+			   unsigned int offset)
 {
 	int bank_shift = pca953x_bank_shift(chip);
-	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
-	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
-	u8 regaddr = pinctrl | addr | (off / BANK_SZ);
+	u8 reg_addr = (reg << bank_shift) + offset / BANK_SZ;
 
-	return regaddr;
+	return reg_addr;
+}
+
+/* Get the i2c address of register reg for line at offset. */
+static u8 pcal953x_reg_addr(struct pca953x_chip *chip, unsigned int reg,
+			    unsigned int offset)
+{
+	int bank_shift = pca953x_bank_shift(chip);
+	u8 reg_addr;
+
+	if (reg == PCAL953X_REG_DRIVE_MODE) {
+		/* One byte register on a fixed address. */
+		return 0x4F;
+	}
+
+	if (reg < PCAL953X_REG_DRIVE_STRENGTH)
+		reg_addr = reg << bank_shift;
+	else
+		reg_addr = 0x40 + ((reg - 4) << bank_shift);
+
+	/* Compensate for double register. */
+	if (reg > PCAL953X_REG_DRIVE_STRENGTH)
+		reg_addr += BIT(bank_shift);
+
+	if (reg == PCAL953X_REG_DRIVE_STRENGTH)
+		/*
+		 * Double register. Return the specific byte for given offset.
+		 * e.g. offset=0 -> byte 0, offset=4 -> byte 1.
+		 */
+		reg_addr += 2 * offset / BANK_SZ;
+	else
+		reg_addr += offset / BANK_SZ;
+
+	return reg_addr;
+}
+
+static u8 pcal65xx_reg_addr_common(int bank_offset,
+				   unsigned int ext_base_addr,
+				   enum pcal65xx_reg reg,
+				   int offset)
+{
+	u8 reg_addr;
+
+	if (reg < PCAL65XX_REG_DRIVE_STRENGTH)
+		reg_addr = reg * bank_offset;
+	else
+		reg_addr = ext_base_addr + (reg - 4) * bank_offset;
+
+	/* Compensate for double register. */
+	if (reg > PCAL65XX_REG_DRIVE_STRENGTH)
+		reg_addr += bank_offset;
+
+	if (reg > PCAL65XX_REG_INT_EDGE)
+		reg_addr += bank_offset;
+
+	if (reg == PCAL65XX_REG_DRIVE_STRENGTH || reg == PCAL65XX_REG_INT_EDGE)
+		/*
+		 * Double register. Return the specific byte for given offset.
+		 * e.g. offset=0 -> byte 0, offset=4 -> byte 1.
+		 */
+		reg_addr += 2 * offset / BANK_SZ;
+	else if (reg == PCAL65XX_REG_DRIVE_MODE || reg == PCAL65XX_REG_DEBOUNCE_COUNT)
+		/* One byte register. Do not add offset. */
+		;
+	else
+		reg_addr += offset / BANK_SZ;
+
+	return reg_addr;
+}
+
+/* Get the i2c address of register reg for line at offset. */
+static u8 pcal652x_reg_addr(struct pca953x_chip *chip, unsigned int reg,
+			    unsigned int offset)
+{
+	int bank_offset = BIT(pca953x_bank_shift(chip));
+	u8 reg_addr = pcal65xx_reg_addr_common(bank_offset, 0x40, reg, offset);
+	int num_debounce_ports = min(NBANK(chip), PCAL65XX_MAX_NUM_DEBOUNCE_PORTS);
+
+	/* The reserved registers before the Debounce Count register are missing. */
+	if (reg == PCAL65XX_REG_DEBOUNCE_COUNT)
+		reg_addr -= bank_offset - num_debounce_ports;
+
+	return reg_addr;
 }
 
 /*
- * The PCAL6534 and compatible chips have altered bank alignment that doesn't
- * fit within the bit shifting scheme used for other devices.
+ * Get the i2c address of register reg for line at offset.
+ *
+ * PCAL653X does not have padding between the register banks, unlike other chip
+ * types.
  */
-static u8 pcal6534_recalc_addr(struct pca953x_chip *chip, int reg, int off)
+static u8 pcal653x_reg_addr(struct pca953x_chip *chip, unsigned int reg,
+			    unsigned int offset)
 {
-	int addr;
-	int pinctrl;
-
-	addr = (reg & PCAL_GPIO_MASK) * NBANK(chip);
-
-	switch (reg) {
-	case PCAL953X_OUT_STRENGTH:
-	case PCAL953X_IN_LATCH:
-	case PCAL953X_PULL_EN:
-	case PCAL953X_PULL_SEL:
-	case PCAL953X_INT_MASK:
-	case PCAL953X_INT_STAT:
-		pinctrl = ((reg & PCAL_PINCTRL_MASK) >> 1) + 0x20;
-		break;
-	case PCAL6524_INT_EDGE:
-	case PCAL6524_INT_CLR:
-	case PCAL6524_IN_STATUS:
-	case PCAL6524_OUT_INDCONF:
-	case PCAL6524_DEBOUNCE:
-		pinctrl = ((reg & PCAL_PINCTRL_MASK) >> 1) + 0x1c;
-		break;
-	}
+	int bank_offset = NBANK(chip);
+	u8 reg_addr = pcal65xx_reg_addr_common(bank_offset, 0x30, reg, offset);
+	int num_debounce_ports = min(NBANK(chip), PCAL65XX_MAX_NUM_DEBOUNCE_PORTS);
+
+	/* Drive Mode is only one byte, not a full bank. */
+	if (reg > PCAL65XX_REG_DRIVE_MODE)
+		reg_addr -= (bank_offset - 1);
+
+	/* Debounce Count is only num_debounce_ports bytes long, not a full bank. */
+	if (reg == PCAL65XX_REG_DEBOUNCE_COUNT)
+		reg_addr -= bank_offset - num_debounce_ports;
 
-	return pinctrl + addr + (off / BANK_SZ);
+	return reg_addr;
 }
 
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
 {
-	u8 regaddr = chip->recalc_addr(chip, reg, 0);
+	u8 regaddr = chip->reg_addr(chip, reg, 0);
 	u8 value[MAX_BANK];
 	int i, ret;
 
@@ -748,7 +1054,7 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long
 
 static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
 {
-	u8 regaddr = chip->recalc_addr(chip, reg, 0);
+	u8 regaddr = chip->reg_addr(chip, reg, 0);
 	u8 value[MAX_BANK];
 	int i, ret;
 
@@ -767,7 +1073,7 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *
 static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
+	u8 dirreg = chip->reg_addr(chip, chip->regs->direction, off);
 	u8 bit = BIT(off % BANK_SZ);
 	int ret;
 
@@ -781,8 +1087,8 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 		unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
-	u8 outreg = chip->recalc_addr(chip, chip->regs->output, off);
+	u8 dirreg = chip->reg_addr(chip, chip->regs->direction, off);
+	u8 outreg = chip->reg_addr(chip, chip->regs->output, off);
 	u8 bit = BIT(off % BANK_SZ);
 	int ret;
 
@@ -802,7 +1108,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 inreg = chip->recalc_addr(chip, chip->regs->input, off);
+	u8 inreg = chip->reg_addr(chip, chip->regs->input, off);
 	u8 bit = BIT(off % BANK_SZ);
 	u32 reg_val;
 	int ret;
@@ -819,7 +1125,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 outreg = chip->recalc_addr(chip, chip->regs->output, off);
+	u8 outreg = chip->reg_addr(chip, chip->regs->output, off);
 	u8 bit = BIT(off % BANK_SZ);
 
 	mutex_lock(&chip->i2c_lock);
@@ -830,7 +1136,7 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
+	u8 dirreg = chip->reg_addr(chip, chip->regs->direction, off);
 	u8 bit = BIT(off % BANK_SZ);
 	u32 reg_val;
 	int ret;
@@ -889,8 +1195,8 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
 {
 	enum pin_config_param param = pinconf_to_config_param(config);
 
-	u8 pull_en_reg = chip->recalc_addr(chip, chip->regs->pull_en, offset);
-	u8 pull_sel_reg = chip->recalc_addr(chip, chip->regs->pull_sel, offset);
+	u8 pull_en_reg = chip->reg_addr(chip, chip->regs->pull_en, offset);
+	u8 pull_sel_reg = chip->reg_addr(chip, chip->regs->pull_sel, offset);
 	u8 bit = BIT(offset % BANK_SZ);
 	int ret;
 
@@ -1253,13 +1559,13 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 	u8 regaddr;
 	int ret;
 
-	regaddr = chip->recalc_addr(chip, chip->regs->output, 0);
+	regaddr = chip->reg_addr(chip, chip->regs->output, 0);
 	ret = regcache_sync_region(chip->regmap, regaddr,
 				   regaddr + NBANK(chip) - 1);
 	if (ret)
 		goto out;
 
-	regaddr = chip->recalc_addr(chip, chip->regs->direction, 0);
+	regaddr = chip->reg_addr(chip, chip->regs->direction, 0);
 	ret = regcache_sync_region(chip->regmap, regaddr,
 				   regaddr + NBANK(chip) - 1);
 	if (ret)
@@ -1404,12 +1710,23 @@ static int pca953x_probe(struct i2c_client *client)
 		break;
 	}
 
-	if (chip->type == TYPE_PCAL653X) {
-		chip->recalc_addr = pcal6534_recalc_addr;
-		chip->check_reg = pcal6534_check_register;
-	} else {
-		chip->recalc_addr = pca953x_recalc_addr;
-		chip->check_reg = pca953x_check_register;
+	switch (chip->type) {
+	case TYPE_PCAL953X:
+		chip->reg_addr = pcal953x_reg_addr;
+		chip->check_reg = pcal953x_check_reg;
+		break;
+	case TYPE_PCAL652X:
+		chip->reg_addr = pcal652x_reg_addr;
+		chip->check_reg = pcal652x_check_reg;
+		break;
+	case TYPE_PCAL653X:
+		chip->reg_addr = pcal653x_reg_addr;
+		chip->check_reg = pcal653x_check_reg;
+		break;
+	default:
+		chip->reg_addr = pca953x_reg_addr;
+		chip->check_reg = pca953x_check_reg;
+		break;
 	}
 
 	chip->regmap = devm_regmap_init_i2c(client, regmap_config);
@@ -1497,14 +1814,14 @@ static int pca953x_regcache_sync(struct device *dev)
 	 * The ordering between direction and output is important,
 	 * sync these registers first and only then sync the rest.
 	 */
-	regaddr = chip->recalc_addr(chip, chip->regs->direction, 0);
+	regaddr = chip->reg_addr(chip, chip->regs->direction, 0);
 	ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip) - 1);
 	if (ret) {
 		dev_err(dev, "Failed to sync GPIO dir registers: %d\n", ret);
 		return ret;
 	}
 
-	regaddr = chip->recalc_addr(chip, chip->regs->output, 0);
+	regaddr = chip->reg_addr(chip, chip->regs->output, 0);
 	ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip) - 1);
 	if (ret) {
 		dev_err(dev, "Failed to sync GPIO out registers: %d\n", ret);
@@ -1513,7 +1830,7 @@ static int pca953x_regcache_sync(struct device *dev)
 
 #ifdef CONFIG_GPIO_PCA953X_IRQ
 	if (pca953x_is_pcal_type(chip)) {
-		regaddr = chip->recalc_addr(chip, chip->regs->input_latch, 0);
+		regaddr = chip->reg_addr(chip, chip->regs->input_latch, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
 					   regaddr + NBANK(chip) - 1);
 		if (ret) {
@@ -1522,7 +1839,7 @@ static int pca953x_regcache_sync(struct device *dev)
 			return ret;
 		}
 
-		regaddr = chip->recalc_addr(chip, chip->regs->int_mask, 0);
+		regaddr = chip->reg_addr(chip, chip->regs->int_mask, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
 					   regaddr + NBANK(chip) - 1);
 		if (ret) {
-- 
2.38.1


