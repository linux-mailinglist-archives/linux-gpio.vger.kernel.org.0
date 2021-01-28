Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A433079E4
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 16:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbhA1PhR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 10:37:17 -0500
Received: from mail-vi1eur05on2118.outbound.protection.outlook.com ([40.107.21.118]:47393
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231473AbhA1PhN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Jan 2021 10:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDy4irH3H65ovtP06PP13pZ7gJeGW6mL5Ev562dhhNI=;
 b=Be1cfBlP1epzkel/DcEXZNu3u7e22OE7F8gZPPTTXwf6C+j/93YzfiqOKdhbnOjthRxjMgrhiPQsH0z7Ne+19XE6xuW6sLl7aZ2vYuEJF8mmwFJrZ7LD8TjolDs/1t8psdzMtlo4qKMgbHpeFvqFHhBq/WjglzcpHgDlyduMfEg=
Received: from DB8PR06CA0052.eurprd06.prod.outlook.com (2603:10a6:10:120::26)
 by PR3PR10MB3898.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:42::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Thu, 28 Jan
 2021 15:36:23 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::4b) by DB8PR06CA0052.outlook.office365.com
 (2603:10a6:10:120::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Thu, 28 Jan 2021 15:36:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.169.0.179)
 smtp.mailfrom=aerq.com; linaro.org; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com;linaro.org; dmarc=none action=none
 header.from=aerq.com;
Received-SPF: Fail (protection.outlook.com: domain of aerq.com does not
 designate 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 28 Jan 2021 15:36:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.54)
         by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
         ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
         tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Thu, 28 Jan 2021 15:36:23 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 4663119
X-ExclaimerImprintLatency: 697482
X-ExclaimerImprintAction: 6726ec500b304c888732f9e8bb71e171
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBIdataCOMAgdJCYaMk4NVNLtb9JexqrH8j6bVTXof2WQthSL8MPNo8Ovvm+dwF9u+wKV9HpBZtl0BIZGZDMknza3oGcCshLiqRHDR5e5GNj30WEmg2kVG4ajYuOXkukyJof//zwmU0FZpIdbfxnE1ejMwUTUFnLaE7qWMnwyih9r1rBiqkksKhvMWh5k8HU0VMAXNYZmpcnT1UZz0fqSukAkvu4acxY4RbOXd+2iM5MJLeJmgXMX6x+MA0799mLrX3YtHOXP+hz2E1Rz+yqU3TrkSPjWoWvwjI01diqf5svlGb+CxUgSq9yn3+C63/5pOvKC56XdO16ZyY5yCarAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HakKtbryokOjtKLZ6BG5Z+/o9SqYhNtdSpI6fNhAgqk=;
 b=QXk09sCft5OUQiFNfdHBkfnjrYjr2bHL3txmCErI2d/rg59kGHdxMyv9ubeFTZCJd7zX0PQV5cpYZ9p/xXSHMXzIs7/SvPZ91kpv4EOjw/G7727ujgkhBi6MnJJT64rc3gdVCTIZfGOB0oHdsXy/pTKISlzsYo9IqK/0eQpSI7Y0UCMi+na/WL4TV1SJ7NNBoTbnwCbcnz5MzmeCBPVBnWR8/JSuLFucigjSbAQh9Td1n9cp2UknNN1oEku4VQM4RxJBjwdANKbdxgjhX+Fnu4x//1kAEU1pTyehaswwAbIYORiKvVwz2B0oK/xqLVZzILaLt+jm8/i6cn6Q38UxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HakKtbryokOjtKLZ6BG5Z+/o9SqYhNtdSpI6fNhAgqk=;
 b=bWxVsLpI9Igmb6QDieLQYTQ3kQZ/xngyx8kKkIYxfGju95assr4YWiGwEYom+o6u8daxjgMMqD2glKtkmZJS4TnQ1qpx0aIj5aM9/P6C1iWQY1j1G0pKANntLIeyfle+25E4CyXMODdVj31FPyj9StK+M8QdsDqUFWAEHUgYHy4=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=aerq.com;
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:161::27)
 by AM8PR10MB4754.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:314::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Thu, 28 Jan
 2021 15:36:21 +0000
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:6512:610:6d48]) by AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:6512:610:6d48%5]) with mapi id 15.20.3763.019; Thu, 28 Jan 2021
 15:36:21 +0000
From:   Alban Bedel <alban.bedel@aerq.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] gpio: pca953x: add support for open drain pins on PCAL6524
Date:   Thu, 28 Jan 2021 16:36:01 +0100
Message-ID: <20210128153601.153126-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [77.10.27.112]
X-ClientProxiedBy: AM5PR1001CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::38) To AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:161::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aerq-nb-1030.localdomain (77.10.27.112) by AM5PR1001CA0025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 15:36:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9fbd666-3a3b-4931-96d5-08d8c3a277ba
X-MS-TrafficTypeDiagnostic: AM8PR10MB4754:|PR3PR10MB3898:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PR3PR10MB3898CDCD13ADEB7E195777D996BA9@PR3PR10MB3898.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9R0bsnoY4YKFPWBoCmTrx3BIVvKmm5p1CXHKuZjg5DqGQx6lu/Hrc+liz1+TLXq8zoZGwp606fL5iAVTrMbP7m3frkk5Mefa/FqLr/oB96F5xi0p96/yqVOwBCfLgp+oqkcty2dEZBTkc6v3TVrntjgVOas8FuR3rdPy9hkB2hOy1ykq7iw/fUPw9pDY9zCD/IFS4t313zi+27xlbWz0I3Rz+LQaFYDciC6lhVYyNh1ys482nFs1/adHQFIoq55wDVva9Ua3g/FPh4DS2GKhBoeq0TKBGF4XqQKexoP6h61utg5A+Xeh3+CrxQ6NRFbjxRc7FF2qH01hgTl1REoDfH1jZy8jW2AdcSXBWSmfoxvisSk8KFD+cVT/eR39SDvO36USWdtJD7rec0x/j5deqVzU5ELmYqVjiYyCPUD/ikUFEwIp/LU4Tc7N3+XQkojeV03tGwtLXR4o29fXZmM9QzVhkr6O6E5ZKtzLtS0WzCwSeurvh6RYYl91R+pgRkkRRUOMwQlbDxjQVcTsnzyGEg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(396003)(39840400004)(376002)(346002)(366004)(186003)(36756003)(16526019)(956004)(2616005)(8676002)(6506007)(86362001)(44832011)(5660300002)(26005)(4326008)(6512007)(478600001)(8936002)(316002)(66476007)(6486002)(2906002)(107886003)(66556008)(66946007)(1076003)(83380400001)(110136005)(52116002)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XgPnl3yzgirA0j1MSlocu2w3/94iOsQszE3mQeHz2pmX8p5cTGX8yHTy4K9o?=
 =?us-ascii?Q?g+RDGgRB+waQCnZo7kHPatMmOkFbX8srBInE2msSvNR7JHkUyAkh5TWj7Sf+?=
 =?us-ascii?Q?fMTqX7O5vJ5W1YPWsgnsF2kKwnhhe3hUVWhtZhp9bd4uBRqQJ92w3X7kXyhK?=
 =?us-ascii?Q?JTQCmDnePH/73sEBPTFm4OpCaKCgBbKAwGSuwXnZyMmcuktZ8YO1nOZp8gK3?=
 =?us-ascii?Q?XWR4IMe/S9rWf3a1TbSiEvp/tcgC4Xi6SsIBcqigkqoRM3fllUbGEBHWVHwk?=
 =?us-ascii?Q?FoGRe2SVWdm9mlKjiQw3P5GoymMf2w0WRr/FQX8jFVZazyaxU+rIcnODXUGS?=
 =?us-ascii?Q?GBCwr6U6wakzzzOxJrNwvLX6h18K9qDWG74mxn0VlZHNx8RUBQdA62yB9J2P?=
 =?us-ascii?Q?9wxiWoAJFfjiQMdBRgIRPGQCcNXPRewMnQrrMx1JoRyAWzGnkISLytQqImqF?=
 =?us-ascii?Q?LLtnIRUWZ0Sp4fVegU5kmB8A6rVGi6KryumXRcqpDqSqQb8O0U37K7lmK+70?=
 =?us-ascii?Q?eX8LDvH1qjPvE2pC/QpB1HzRVzWKir5U3CBQw3CTcsOGpLmCeOHuGcM4JQP1?=
 =?us-ascii?Q?JndMJNBok8XHkRQEDlkxTeYRf7SxDS9wFtKQ8uwL/CgeUyQT+FYo+dnzqxoy?=
 =?us-ascii?Q?Zf8yri2hTBjzIkyK6FpAjqqvshT9+7CrvZXsNo+fcS48elSIQnhe3jz2Qhp8?=
 =?us-ascii?Q?IFn9YMAq965khB0nfSDvrVjot4QjW453ZpFLrRf9tQbxvBzpKpw/HSqq21ky?=
 =?us-ascii?Q?VmB5giiJEwe8OWPlExqguH3+L7QhFcN9y7H3WQPMuwk6KrPHJ8fD6gFPscbi?=
 =?us-ascii?Q?TdpwaHayz48sjVIE7WOVvp82iZJPhayFBG1a62JJ/2K6vkeFBGBT9/1KEmgm?=
 =?us-ascii?Q?hqPm7EM0iDmkeWhbL4Ux8x/+Fe1ks94MH3YAJS7wfU3blq7kxzlK8JrniytV?=
 =?us-ascii?Q?2qZANed6RPaftRdReIcPorAdopUymIZRAGzZgLi6RP0prOSxqaHBr7aUCzLs?=
 =?us-ascii?Q?ODp5kUFwEL3QklV82SdHtnaFR58dn+F6Mwabs77UkhSSagyH78dCeu8cY8B3?=
 =?us-ascii?Q?GbtJ9Nuw?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4754
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e5b27aee-4d50-4fec-0541-08d8c3a27622
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ykvz6bB8S5R6fG/wHeUhJWwl0c6rRzxkfsb0Oe1FCXM+d2L/zxBECfrndt5nXacPjv2Q6nre6lodwLdYiAU1Kn+4PO57UqMC/9IPtDvLDG1T2ko1OlwSEJiVs3rZcGLu/BBiXWyRETu/GYt+1X3/tEdRsZdh2wpF7bHKbMZmYMSEvQxdnmHJfc5HBcHZ0YF1h6/14IyB0sGCFaSAD+QMR9qMqyYd3whi1TSpGu7LVih/GF+coKMSRSdN7eE7kiTbQ5KO5xYasYMUemKsNfRHklyc4BZ5sn9UNWEaYI2cKbVqIi8te8vHBrlIeUq4svZ3VsMLezEO7QUt/TEbTkW0fsdxXbY4ec+GqgT+sRjmqKX0RqL6f8Qo4WAXoLu9tNLHXyN6M5PAhmJVEfRZqmYevAY2ld6cogA4f307CA1jPAA4M3JmVytyEQxQNP0Ipk0mZpmex3lNKOqFqWoP1ChLSnZPM7cFrtZ12u+2TwP09S4viTiXCCpSEOVP9imXxV1HrnhVIjPXLJqhhf9ZSEIyT15R3V3GUz/Cs8VW+iZt9BEbgDfHwHeJDQZcBdqAJD2J3++NZLPGpjWqH6AZzeDi83kRvnXkh5cbnjjtWj9tZog=
X-Forefront-Antispam-Report: CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(39840400004)(396003)(346002)(136003)(376002)(46966006)(1076003)(8676002)(47076005)(110136005)(2616005)(7596003)(4326008)(6486002)(2906002)(107886003)(7636003)(86362001)(316002)(44832011)(8936002)(36756003)(70206006)(6506007)(356005)(6512007)(70586007)(5660300002)(336012)(186003)(16526019)(478600001)(26005)(82310400003)(83380400001)(6666004)(956004);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 15:36:23.1711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fbd666-3a3b-4931-96d5-08d8c3a277ba
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3898
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From a quick glance at various datasheet the PCAL6524 seems to be the
only chip in this familly that support setting the drive mode of
single pins. Other chips either don't support it at all, or can only
set the drive mode of whole banks, which doesn't map to the GPIO API.

Add a new flag, PCAL6524, to mark chips that have the extra registers
needed for this feature. Then mark the needed register banks as
readable and writable, here we don't set OUT_CONF as writable,
although it is, as we only need to read it. Finally add a function
that configure the OUT_INDCONF register when the GPIO API set the
drive mode of the pins.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 drivers/gpio/gpio-pca953x.c | 64 +++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 825b362eb4b7..db0b3dab1490 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -64,6 +64,8 @@
 #define PCA_INT			BIT(8)
 #define PCA_PCAL		BIT(9)
 #define PCA_LATCH_INT		(PCA_PCAL | PCA_INT)
+#define PCAL6524		BIT(10)
+
 #define PCA953X_TYPE		BIT(12)
 #define PCA957X_TYPE		BIT(13)
 #define PCA_TYPE_MASK		GENMASK(15, 12)
@@ -88,7 +90,7 @@ static const struct i2c_device_id pca953x_id[] =3D {
 	{ "pca9698", 40 | PCA953X_TYPE, },
=20
 	{ "pcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT | PCAL6524, },
 	{ "pcal9535", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal9554b", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
@@ -265,6 +267,9 @@ static int pca953x_bank_shift(struct pca953x_chip *chip=
)
 #define PCAL9xxx_BANK_PULL_SEL	BIT(8 + 4)
 #define PCAL9xxx_BANK_IRQ_MASK	BIT(8 + 5)
 #define PCAL9xxx_BANK_IRQ_STAT	BIT(8 + 6)
+#define PCAL9xxx_BANK_OUT_CONF	BIT(8 + 7)
+
+#define PCAL6524_BANK_INDOUT_CONF BIT(8 + 12)
=20
 /*
  * We care about the following registers:
@@ -288,6 +293,10 @@ static int pca953x_bank_shift(struct pca953x_chip *chi=
p)
  *     Pull-up/pull-down select reg	0x40 + 4 * bank_size    RW
  *     Interrupt mask register		0x40 + 5 * bank_size	RW
  *     Interrupt status register	0x40 + 6 * bank_size	R
+ *     Output port configuration	0x40 + 7 * bank_size	R
+ *
+ *   - PCAL6524 with individual pin configuration
+ *     Individual pin output config	0x40 + 12 * bank_size	RW
  *
  * - Registers with bit 0x80 set, the AI bit
  *   The bit is cleared and the registers fall into one of the
@@ -336,9 +345,12 @@ static bool pca953x_readable_register(struct device *d=
ev, unsigned int reg)
 	if (chip->driver_data & PCA_PCAL) {
 		bank |=3D PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
 			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK |
-			PCAL9xxx_BANK_IRQ_STAT;
+			PCAL9xxx_BANK_IRQ_STAT | PCAL9xxx_BANK_OUT_CONF;
 	}
=20
+	if (chip->driver_data & PCAL6524)
+		bank |=3D PCAL6524_BANK_INDOUT_CONF;
+
 	return pca953x_check_register(chip, reg, bank);
 }
=20
@@ -359,6 +371,9 @@ static bool pca953x_writeable_register(struct device *d=
ev, unsigned int reg)
 		bank |=3D PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
 			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK;
=20
+	if (chip->driver_data & PCAL6524)
+		bank |=3D PCAL6524_BANK_INDOUT_CONF;
+
 	return pca953x_check_register(chip, reg, bank);
 }
=20
@@ -618,6 +633,46 @@ static int pca953x_gpio_set_pull_up_down(struct pca953=
x_chip *chip,
 	return ret;
 }
=20
+static int pcal6524_gpio_set_drive_mode(struct pca953x_chip *chip,
+					unsigned int offset,
+					unsigned long config)
+{
+	u8 out_conf_reg =3D pca953x_recalc_addr(
+		chip, PCAL953X_OUT_CONF, 0);
+	u8 out_indconf_reg =3D pca953x_recalc_addr(
+		chip, PCAL6524_OUT_INDCONF, offset);
+	u8 mask =3D BIT(offset % BANK_SZ), val;
+	unsigned int out_conf;
+	int ret;
+
+	/* configuration requires PCAL6524 extended registers */
+	if (!(chip->driver_data & PCAL6524))
+		return -ENOTSUPP;
+
+	if (config =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN)
+		val =3D mask;
+	else if (config =3D=3D PIN_CONFIG_DRIVE_PUSH_PULL)
+		val =3D 0;
+	else
+		return -EINVAL;
+
+	mutex_lock(&chip->i2c_lock);
+
+	/* Invert the value if ODENn is set */
+	ret =3D regmap_read(chip->regmap, out_conf_reg, &out_conf);
+	if (ret)
+		goto exit;
+	if (out_conf & BIT(offset / BANK_SZ))
+		val ^=3D mask;
+
+	/* Configure the drive mode */
+	ret =3D regmap_write_bits(chip->regmap, out_indconf_reg, mask, val);
+
+exit:
+	mutex_unlock(&chip->i2c_lock);
+	return ret;
+}
+
 static int pca953x_gpio_set_config(struct gpio_chip *gc, unsigned int offs=
et,
 				   unsigned long config)
 {
@@ -627,6 +682,9 @@ static int pca953x_gpio_set_config(struct gpio_chip *gc=
, unsigned int offset,
 	case PIN_CONFIG_BIAS_PULL_UP:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		return pca953x_gpio_set_pull_up_down(chip, offset, config);
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return pcal6524_gpio_set_drive_mode(chip, offset, config);
 	default:
 		return -ENOTSUPP;
 	}
@@ -1251,7 +1309,7 @@ static const struct of_device_id pca953x_dt_ids[] =3D=
 {
 	{ .compatible =3D "nxp,pca9698", .data =3D OF_953X(40, 0), },
=20
 	{ .compatible =3D "nxp,pcal6416", .data =3D OF_953X(16, PCA_LATCH_INT), }=
,
-	{ .compatible =3D "nxp,pcal6524", .data =3D OF_953X(24, PCA_LATCH_INT), }=
,
+	{ .compatible =3D "nxp,pcal6524", .data =3D OF_953X(24, PCA_LATCH_INT | P=
CAL6524), },
 	{ .compatible =3D "nxp,pcal9535", .data =3D OF_953X(16, PCA_LATCH_INT), }=
,
 	{ .compatible =3D "nxp,pcal9554b", .data =3D OF_953X( 8, PCA_LATCH_INT), =
},
 	{ .compatible =3D "nxp,pcal9555a", .data =3D OF_953X(16, PCA_LATCH_INT), =
},
--=20
2.25.1

