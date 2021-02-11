Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948473191A4
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 18:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhBKRzE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 12:55:04 -0500
Received: from mail-eopbgr50106.outbound.protection.outlook.com ([40.107.5.106]:56036
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232591AbhBKRww (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Feb 2021 12:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26aTqv7s1FtjjmoYd5EKtkAhd83Jpv0BaoceD36oe7o=;
 b=CY1dkVHUDC+QmnmXhIBSZ8qDxqh83Shpa3qkf/vQCu2zI4jfn1f1og0ehlB6ht0QDJ+nz5zEwKfB1FyIemXZqd+HxdPCtk7AbOKaVLNqFq9qVBP832PQI2v8uPG133mEGtCc10SWWGcI0+D9r/453IjePYox91h9KAVnS+dPceY=
Received: from MR2P264CA0094.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::34)
 by AS8PR10MB4520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:2e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 17:52:02 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::3e) by MR2P264CA0094.outlook.office365.com
 (2603:10a6:500:32::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.29 via Frontend
 Transport; Thu, 11 Feb 2021 17:52:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 104.40.229.156)
 smtp.mailfrom=aerq.com; vger.kernel.org; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com;vger.kernel.org; dmarc=none action=none
 header.from=aerq.com;
Received-SPF: Fail (protection.outlook.com: domain of aerq.com does not
 designate 104.40.229.156 as permitted sender)
 receiver=protection.outlook.com; client-ip=104.40.229.156;
 helo=eu1.smtp.exclaimer.net;
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 17:52:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.111)
         by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
         ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
         tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Thu, 11 Feb 2021 17:52:02 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 9034093
X-ExclaimerImprintLatency: 626898
X-ExclaimerImprintAction: 4b1182501ccd41198bd5fe49066a76a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYJs2eV7+FiboCBzXlD93MkvgftI/DrLpEQKQXZaB/v1j0qPS4M/tQl3KKz/sBxC2lyhupF/Y44XFn30yOXoFzQ6WG+upsdv9X5h0oRSNKFBqq8UaqFdN7IeZpZWf4FwoEp1PWuX/yfJSoCoJAeW8IwmNePxHmvKnoMEgZ8i6L5I0G5c2fYhpvI2VmoBYTr3tFp+vjE7DFHInwRn3Q3XFi7wLFBDgBSjDd8u0Bi9fkgNFNXPURc3AFGtIyPQUjAS5tc2ZG0wzK7xJbSHJ9rHynjmCcfiXSK1I8E5cIIMiEjUhAYa/UFjGbUS0ip83izksdmvsUBn0TDl9xYo3v0s+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPv0doGZSO4zi5ZT/W6NSINV3VKic15EaThR0rPQoFc=;
 b=TwJHY+vHubzd1F2pBIFdmt413ko0pBsTYaEaRwA3/z2pCzuGoHXWSNEAlvvijEHqcs+ORPSWAbZCmltMsYy5wxmHY2qXxmDcvirEGwiYKiIqYwru8qlil9IJzhNGdbvhP/h5YXTkup9iGsbddATrziXvJwO/0MPWrXlrTvA3ZMlVnRIVtesHc0GHNIM+w6ABqYXK20hKfpbaM2h1cB1NjGbaGK/0N95VrCWOmWb3dAtBfNGuFrZ4ehOMAomYU6HFZu/0qHwzSVcmuXoBT/BSXAuK8ArYKUzaNxl0xLMSzPLlej5p1UwPC/lzWFyQY78AFY4orVzSbwI4h6kGpmVVNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPv0doGZSO4zi5ZT/W6NSINV3VKic15EaThR0rPQoFc=;
 b=EZ1XJJvboqMyeZhMd2ap/ZnVgqNCkkqBLfpkYDwcACGizTdRLDaPq+mT9h4Z2HDhui1YMxOV7lzGtQJdwFyOn34DziOlpngzhT0eRvTn0r1hmva9wJna3CvTYAKsSyQ01fxPkB3/88WfOVh0Q/eqYW4VIAwpqPJiHUdgM2ATsK0=
Authentication-Results-Original: vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=aerq.com;
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:161::27)
 by AM0PR10MB3330.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 11 Feb
 2021 17:51:59 +0000
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:6512:610:6d48]) by AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:6512:610:6d48%5]) with mapi id 15.20.3763.019; Thu, 11 Feb 2021
 17:51:59 +0000
From:   Alban Bedel <alban.bedel@aerq.com>
To:     linux-gpio@vger.kernel.org
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org, Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH v2] gpio: pca953x: add support for open drain pins on PCAL6524
Date:   Thu, 11 Feb 2021 18:51:40 +0100
Message-ID: <20210211175140.85391-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [77.8.143.62]
X-ClientProxiedBy: AM6PR0202CA0038.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::15) To AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:161::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aerq-nb-1030.localdomain (77.8.143.62) by AM6PR0202CA0038.eurprd02.prod.outlook.com (2603:10a6:20b:3a::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 17:51:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f22d4e7a-1f97-41ac-eb06-08d8ceb5bca9
X-MS-TrafficTypeDiagnostic: AM0PR10MB3330:|AS8PR10MB4520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR10MB4520DEA127969570440FECA7968C9@AS8PR10MB4520.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3UxBpmbufV5sXxo8t9MSnihXW3pSrsIBpei/hRypL+jJRn55/qV42K3j5O/aFVrS0esID7Oiaay0cYkwMerFiKyQ7QgOwBkbMINE6Q4Wx4ylYZKnSBkMFgZyLVZyE99BS+oymjj+3PxpEDtfEQdbrFf3CqLJZ9vYY4sW5CJ+HxQ4ZgMiSGlA/62r8Q1t57XYCwKTt/5P16WeGeGkZ0TjsN+QIaJ1DdOZXjmFciCdVVTha5K+ATEzWeA7GhEaNFjdw/fWWLQDc3VKPL+BggwwPYvp5ZuTOf/7pQW+BEZjrKFMko1Ws/JV5ngnbvI/E0igc99TyK8a7ea08pGuYNTrlEIAFW3VRo20QkIaqDlv98cBXRpgPcQsbi9yHIk+0P9ZeTZvMFh7G4Bs76J+XVV6UErrj9E1LXJcC+xJL97vE//2D+b1+qOR78PCj4oDN9oZE9aEy0WUvoUQYzqSV6KJW3mr9flxccIEwC5WgHRGmw8gaYJy20GtzKp0LVwh+OCbZWMBKNwYpgfc3u+hQ2P2kg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(376002)(366004)(39840400004)(8676002)(6506007)(6512007)(16526019)(6666004)(8936002)(36756003)(66946007)(26005)(66476007)(5660300002)(186003)(66556008)(86362001)(52116002)(956004)(54906003)(1076003)(44832011)(316002)(478600001)(2906002)(2616005)(83380400001)(6486002)(4326008)(107886003)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8j0prlM7q6VK/R8lds8lG9b8Php7j5Lkk992+ZwwGSeMGmCUBVUN+Jgr7Esh?=
 =?us-ascii?Q?eYD2v+3GN+eNf/18D2O4Ee0Moz+VMOVbxJwa6n0nECbgZE0r/F6M8V1NBnx6?=
 =?us-ascii?Q?4ZkLWg4c2JTM5r6+HMYeO+8+0aJZxjlkKZx/Rz/hqapECV6x7fAWTyCkQQDj?=
 =?us-ascii?Q?HoNALhVgvrWDSPIB5Aa+JXHS39RI1I2U27gG72lQ/NqldZm9dHthFsFzMOch?=
 =?us-ascii?Q?I8o2uACptCOXZR9rK2b3VvQtV53QfG0aBddDfmduHz+Quk25aUhnCzIkR5Qf?=
 =?us-ascii?Q?cVW5UQIND125ielJ+CwoRU8QQigNOQigdsL94d9X8vz2hi35hMrHk3DiGoc+?=
 =?us-ascii?Q?nagDRJ1eVzSzvU8TCQJcpXcRI9qHNwgCREfdrW4dtdxzqsHhi/RNYVAU6+YW?=
 =?us-ascii?Q?tzQWHougJgzj7hqrKtHXlSQ7JYiqjvBCg8M7FRk3wGldf3k/9B6V1SyVq5cf?=
 =?us-ascii?Q?l/OH2oK+UaTHjqydeCs3qVYnKflXLxd8uQiZNV228DgB5e+PIm5RhxnynYcU?=
 =?us-ascii?Q?H/Ouaum7RTcgbVAHcotTRPZCLMkYO2u0vDIlRVuLzqCV5kDLnBDzAQizEcDa?=
 =?us-ascii?Q?hIrbc9mhpuXhCSrTs4DDuK8ai8vS86ELe7Ws6L2gBYRLad3HCAfOMo6tLcIl?=
 =?us-ascii?Q?79rzE0LlU0lTGUJJaW4T/rJL5KnIZRkt0hYOKVpq0FAEZn5RLlnabfYJLJAY?=
 =?us-ascii?Q?BbAzn+JbwtCJrS6j5k5Ap8r+AfeFHLT6PlpesrKYYLBCnqUspT9NoZ9fDlrc?=
 =?us-ascii?Q?oIvZGnfbHz2CU92E+d4d/E/xta8ybDftYugmA1DSEiZYWKBJJiXjp2NxZD6K?=
 =?us-ascii?Q?mpgjVMadaK0+hsDB+L3QJIWczXZrd3vAsrtGjAPjfulOhAVUzW+jPCK+/2c5?=
 =?us-ascii?Q?AR8W4029QL8jJ+oKXRGGmAQ9Hv8ipaAaBpf2VHuVT6yVnZfGuIq21NKkJOCi?=
 =?us-ascii?Q?aUIh7bo29/ycHjRW2uw+M5NGv39egAe4LS2DuF6MHDOLuWNJzapcuxcRQmWl?=
 =?us-ascii?Q?4ZhP7/+I/nHAO/tt42b3rs61Pp/Pe/+hHHhiBxDefiSsAvr56FW6FGPaBQkT?=
 =?us-ascii?Q?+Pv0GGf9DQ3dIh+fRDIeIkLvuz1YkqnRivMcMca1HvjgaI4Xbgk/2Bl0ErY1?=
 =?us-ascii?Q?hnFEnibGslTv3W64eUOQi/UtrrpfTGmtZL8ol9N0a+z+MiM5+h+d5UsMezdI?=
 =?us-ascii?Q?kyIPCmVhXKWe7uNhaCE4pX8cKADtint+kEchn2xxNEfoOBN53CmgnpWpVDrd?=
 =?us-ascii?Q?vs1MBQ6pmbS/Y2JUDyWyjLCK3Pi4/lF+YyXX7dCThSDgLhFnYLRg1bG+66hK?=
 =?us-ascii?Q?sNmlNlDZbysHVbhszpzlT2xM?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3330
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e2fa0ac1-106b-4bb9-d5d6-08d8ceb5baaa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Fhwpx/AH7HM8t8fTS+RD0bsekioixjmf7uexVQW4GBx4SyZwRiU3deH1nAMJKqqqmv0kG9cOq3xWbRBmTuJ2JMJPmY7xaHJ+fM8L3RAj+deeoyxjjw1ASG7FkCi5umFWlgxE5pUSs/ItyFN4NvNj7XszsCs79BJg5Os/LrH7yyPNrsQDa77vbGlcu84yf5h0z/PiYHSjO6byaxTxq46v1DAP4XfiSNoA7MIG0eJGKinFkDPdsaKo8DeogAjxBsjeAWiuueYhsq+Hb6pbCOGm42L0SYUn+XO8dG3kSv0oEvJL0QZ/kahSYntgn/N5zmfoWo9or+merOhyRLVnycHjAjDaLFN3dAUI342+h5oSvWAeL77Je9OMgdfWO/rYHl7q+09wYLBhngd4PKAwIxgpOn+CStTyLirwkEZyJoP/wldxLtuRyYZNS4q+1Rb3bYqLFDQvl9vmdYCqDF9WBEWGBlt72Yqtffw7ALjTFtFz9Iu4F7EIOdv/iWN6VRihqbYqQe393hA0jRQmIBxc29vx4d1kS6ojoLw6kKr21beC4hONYP6Q/s8r6rGSbX9XnXDUsSDBBb9ntVRzN3M2mHFGVx+Ew5vK91GdkqvMBcLjZChNJwfYIFyDjgGtF+hBHarV4UZC7yKx+uSL6CvUdaFq10rtBQG7Hln5f/5FKnYsPM=
X-Forefront-Antispam-Report: CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(39830400003)(346002)(376002)(136003)(396003)(36840700001)(46966006)(6506007)(83380400001)(186003)(70206006)(7596003)(6486002)(16526019)(26005)(54906003)(6666004)(6512007)(6916009)(82310400003)(956004)(2616005)(44832011)(86362001)(7636003)(316002)(4326008)(47076005)(5660300002)(8936002)(478600001)(356005)(1076003)(36860700001)(2906002)(107886003)(36756003)(8676002)(336012)(70586007);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 17:52:01.7792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f22d4e7a-1f97-41ac-eb06-08d8ceb5bca9
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4520
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From a quick glance at various datasheets the PCAL6524 and the
PCAL6534 seems to be the only chips in this family that support
setting the drive mode of single pins. Other chips either don't
support it at all, or can only set the drive mode of whole banks,
which doesn't map to the GPIO API.

Add a new flag, PCAL65xx_REGS, to mark chips that have the extra
registers needed for this feature. Then mark the needed register banks
as readable and writable, here we don't set OUT_CONF as writable,
although it is, as we only need to read it. Finally add a function
that configures the OUT_INDCONF register when the GPIO API sets the
drive mode of the pins.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
v2: - Rename the feature flag to PCAL65xx_REGS as there is at least
      the PCAL6534 which also have this feature.
    - Fixed the typos in the log message.
    - Fixed the code style issues.
---
 drivers/gpio/gpio-pca953x.c | 64 +++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 825b362eb4b7..c5c216ddfe18 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -64,6 +64,7 @@
 #define PCA_INT			BIT(8)
 #define PCA_PCAL		BIT(9)
 #define PCA_LATCH_INT		(PCA_PCAL | PCA_INT)
+#define PCAL65xx_REGS		BIT(10)
 #define PCA953X_TYPE		BIT(12)
 #define PCA957X_TYPE		BIT(13)
 #define PCA_TYPE_MASK		GENMASK(15, 12)
@@ -88,7 +89,7 @@ static const struct i2c_device_id pca953x_id[] =3D {
 	{ "pca9698", 40 | PCA953X_TYPE, },
=20
 	{ "pcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT | PCAL65xx_REGS, },
 	{ "pcal9535", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal9554b", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
@@ -265,6 +266,9 @@ static int pca953x_bank_shift(struct pca953x_chip *chip=
)
 #define PCAL9xxx_BANK_PULL_SEL	BIT(8 + 4)
 #define PCAL9xxx_BANK_IRQ_MASK	BIT(8 + 5)
 #define PCAL9xxx_BANK_IRQ_STAT	BIT(8 + 6)
+#define PCAL9xxx_BANK_OUT_CONF	BIT(8 + 7)
+
+#define PCAL65xx_BANK_INDOUT_CONF BIT(8 + 12)
=20
 /*
  * We care about the following registers:
@@ -288,6 +292,10 @@ static int pca953x_bank_shift(struct pca953x_chip *chi=
p)
  *     Pull-up/pull-down select reg	0x40 + 4 * bank_size    RW
  *     Interrupt mask register		0x40 + 5 * bank_size	RW
  *     Interrupt status register	0x40 + 6 * bank_size	R
+ *     Output port configuration	0x40 + 7 * bank_size	R
+ *
+ *   - PCAL65xx with individual pin configuration
+ *     Individual pin output config	0x40 + 12 * bank_size	RW
  *
  * - Registers with bit 0x80 set, the AI bit
  *   The bit is cleared and the registers fall into one of the
@@ -336,9 +344,12 @@ static bool pca953x_readable_register(struct device *d=
ev, unsigned int reg)
 	if (chip->driver_data & PCA_PCAL) {
 		bank |=3D PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
 			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK |
-			PCAL9xxx_BANK_IRQ_STAT;
+			PCAL9xxx_BANK_IRQ_STAT | PCAL9xxx_BANK_OUT_CONF;
 	}
=20
+	if (chip->driver_data & PCAL65xx_REGS)
+		bank |=3D PCAL65xx_BANK_INDOUT_CONF;
+
 	return pca953x_check_register(chip, reg, bank);
 }
=20
@@ -359,6 +370,9 @@ static bool pca953x_writeable_register(struct device *d=
ev, unsigned int reg)
 		bank |=3D PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
 			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK;
=20
+	if (chip->driver_data & PCAL65xx_REGS)
+		bank |=3D PCAL65xx_BANK_INDOUT_CONF;
+
 	return pca953x_check_register(chip, reg, bank);
 }
=20
@@ -618,6 +632,46 @@ static int pca953x_gpio_set_pull_up_down(struct pca953=
x_chip *chip,
 	return ret;
 }
=20
+static int pcal6524_gpio_set_drive_mode(struct pca953x_chip *chip,
+					unsigned int offset,
+					unsigned long config)
+{
+	u8 out_indconf_reg =3D pca953x_recalc_addr(chip, PCAL6524_OUT_INDCONF,
+						 offset);
+	u8 out_conf_reg =3D pca953x_recalc_addr(chip, PCAL953X_OUT_CONF, 0);
+	u8 mask =3D BIT(offset % BANK_SZ);
+	unsigned int out_conf;
+	int ret;
+	u8 val;
+
+	/* configuration requires the PCAL65xx extended registers */
+	if (!(chip->driver_data & PCAL65xx_REGS))
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
@@ -627,6 +681,9 @@ static int pca953x_gpio_set_config(struct gpio_chip *gc=
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
@@ -1232,6 +1289,7 @@ static int pca953x_resume(struct device *dev)
 /* convenience to stop overlong match-table lines */
 #define OF_953X(__nrgpio, __int) (void *)(__nrgpio | PCA953X_TYPE | __int)
 #define OF_957X(__nrgpio, __int) (void *)(__nrgpio | PCA957X_TYPE | __int)
+#define OF_L65XX(__nrgpio) OF_953X(__nrgpio, PCA_LATCH_INT | PCAL65xx_REGS=
)
=20
 static const struct of_device_id pca953x_dt_ids[] =3D {
 	{ .compatible =3D "nxp,pca6416", .data =3D OF_953X(16, PCA_INT), },
@@ -1251,7 +1309,7 @@ static const struct of_device_id pca953x_dt_ids[] =3D=
 {
 	{ .compatible =3D "nxp,pca9698", .data =3D OF_953X(40, 0), },
=20
 	{ .compatible =3D "nxp,pcal6416", .data =3D OF_953X(16, PCA_LATCH_INT), }=
,
-	{ .compatible =3D "nxp,pcal6524", .data =3D OF_953X(24, PCA_LATCH_INT), }=
,
+	{ .compatible =3D "nxp,pcal6524", .data =3D OF_L65XX(24), },
 	{ .compatible =3D "nxp,pcal9535", .data =3D OF_953X(16, PCA_LATCH_INT), }=
,
 	{ .compatible =3D "nxp,pcal9554b", .data =3D OF_953X( 8, PCA_LATCH_INT), =
},
 	{ .compatible =3D "nxp,pcal9555a", .data =3D OF_953X(16, PCA_LATCH_INT), =
},
--=20
2.25.1

