Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4166F45852C
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238430AbhKURBW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:01:22 -0500
Received: from mail-eopbgr40085.outbound.protection.outlook.com ([40.107.4.85]:5377
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238609AbhKURAm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=401qnqPt+GrMkpXA7hgK8pMgKAD8nM1s/1T2BdG2LFI=;
 b=3uV/poceirs1HgZoFaF330+JNmWv3oK4nnaIQVDy7f5/rVrKa2k8AxzYupMjFZP4rf4XDMVwJyz6XgHQfjqx1Y0ISMzZDLwShRCKIVSrret5XmB+oAcmSgGJoUSAw0OjMNIP9PrumKZvjTZYIfLb19PjuY3+dmP8CQbBRzr/XO0=
Received: from DB6P193CA0020.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::30) by
 AM0PR08MB5298.eurprd08.prod.outlook.com (2603:10a6:208:188::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 16:57:22 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::9) by DB6P193CA0020.outlook.office365.com
 (2603:10a6:6:29::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:22 +0000
Received: ("Tessian outbound 157533e214a9:v110"); Sun, 21 Nov 2021 16:57:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c4a9d586b774c16
X-CR-MTA-TID: 64aa7808
Received: from 9d18f7d39a3c.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id A789CDF4-75C7-46D0-9FEA-06C9F835B13F.1;
        Sun, 21 Nov 2021 16:57:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d18f7d39a3c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:57:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSyu+bX1ZmIGAFdXh0PB4g7zMUfTFmUOsMsM87ZhW4pyEAOwIZaSklruQ8cI/L9c6htQg6Mt8EkaggIOr5wUDEjw9BeOqKSwvzTKuIO1+Xr/y4dSGre2wqAbWB9Nhhgcsg1MkyM5RHRaCoFB36TMZtJmdqbmaenWbqMnKjYanWf7vPyqsFVw8atttEmBiIP92Upn5j/j554eZR6HFwCVxJ0VobkzP9InZaOwYrA3z/KBmwXn1qfc0VWG47pnJbfWcdNFQozQs2+BKxJFYqrIP+Ge69AAO/01ch1aSnzjHbLzBkUo1CgmAdvCO3OzlsDm7Qcwm/zZm2+44Ph1YOAksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=401qnqPt+GrMkpXA7hgK8pMgKAD8nM1s/1T2BdG2LFI=;
 b=TrQ0XQoRb949lCrECsdCOws/gRYEIs+iKizMLfgmp16y7UhiaRAKTj5FsBMJ2XY2i4L0vqT8l2NEfPEh9OVVuGP121G23zDPsHzr7TcfXASZnRtvehljPiP+xQZo87yfVderCz7KyDK9vNDwiITCfR3285Z5/2W/Q5cZpgCxqfY7OJBqf6l5MD+hI7DxL7+X4C2dBf0zL7c7Wawge6ZhJMheQjwF10bpwB82AKuBU8W44S4XNqM1nym4sLyL0THTFt6cTwFjCitk21YhV0nRUTy4ypLKJRkdL5Vcj7YgFY0sEzF9VXUU6L1Gh3/1hST40UK3dhv13sLZPzabfup5fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=401qnqPt+GrMkpXA7hgK8pMgKAD8nM1s/1T2BdG2LFI=;
 b=3uV/poceirs1HgZoFaF330+JNmWv3oK4nnaIQVDy7f5/rVrKa2k8AxzYupMjFZP4rf4XDMVwJyz6XgHQfjqx1Y0ISMzZDLwShRCKIVSrret5XmB+oAcmSgGJoUSAw0OjMNIP9PrumKZvjTZYIfLb19PjuY3+dmP8CQbBRzr/XO0=
Received: from AM5PR0402CA0011.eurprd04.prod.outlook.com
 (2603:10a6:203:90::21) by HE1PR0801MB1740.eurprd08.prod.outlook.com
 (2603:10a6:3:88::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Sun, 21 Nov
 2021 16:57:12 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::6) by AM5PR0402CA0011.outlook.office365.com
 (2603:10a6:203:90::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:12 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 16:56:51 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Sun, 21
 Nov 2021 16:56:49 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:51 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 10/11] pinctrl: apple: use modulo rather than bitwise and
Date:   Sun, 21 Nov 2021 16:56:41 +0000
Message-ID: <20211121165642.27883-11-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d31badc-ba94-4028-3c57-08d9ad0ffc8f
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1740:|AM0PR08MB5298:
X-Microsoft-Antispam-PRVS: <AM0PR08MB52989446C44114C8F23480CE949E9@AM0PR08MB5298.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:339;OLM:339;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tlQTkuzIrLs24FPvTUSfq/WyzyZy0y0EaCDio1B9f9B6JnK2G0+fe3x6Ri81X96eJLiApsDtXccMElz9Y7gsVzQNmohHkA6daZf1jiHvBUXdSEf0XmEoWC40Ax6T4PnYLlSIkm5Fr0SgBjSeouL6SH2z2CROTG+olmsUUE0VNNGLXVgTr1GhXHOf5m3TQ9s+Xx4w9Q1+T5D5draG+1KvUvd8BzlIVqfYOZTIIuoOD90ZuiVExS9sVKGXU/Ogqk7KSP/GyPMgWc+w7j+r5tlMuz3sn0q/5uwkwPb9wl7vyLJdgqY78by02uNyxXnQVqYNsx1mJSI6A1GLbqpftbyXCZPrfm3awBdEbTKCF4CUFnpaWcSukfYWEefM8H0AU6qAyebfZqgfvNpQIEjqD+cXCWsiQSX/IT0vLvsrjW6NY5OoYHMFUy438owcmpEDp505Qdqq3JLZjwNIkwfgs34bYCCVVfqpLh7NLPvw+BR1J4QmXmjm+myRqiZnmfHOZoO/RgSHLMvssXtowq3GID3Z7uIyBGJ/dCsxP0qm7+xccgRR2o5dVdwYX6li2dRZlkbLsuloYpV6io5yrxvO3GXtobo1ij+b5kT2xx6lZBiyctr4z4gxEKdrWpJw7Edjihuw8/BLMQuNTRswAn0YyVtZGbcedWmEuuoGHuZa5VVTZn8i2olWQqH8lavx3e/A8/C14fyHje35Ap6Bs1XVQUDO8oZfcZ5rmxKGLkDJPevTMdKboYwMvqo3KIYGZ2usvozBwXoKk/KF82d+/G2kpgbddA==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(4326008)(2616005)(336012)(508600001)(36756003)(70586007)(7696005)(70206006)(426003)(47076005)(83380400001)(44832011)(6666004)(4744005)(54906003)(36860700001)(82310400003)(8936002)(2906002)(8676002)(356005)(26005)(5660300002)(186003)(81166007)(6916009)(316002)(1076003)(86362001)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1740
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e8b51ab1-a2b2-4491-4619-08d9ad0ff67d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MBVRQUkOdVtfaHQhp30S0zurCRrI++h7Zw9q0gDRVbX0zzZzvTiOyxXGEVZcr5Uu+/CCCxi/rSClGUBCBVX796TuMvHvjGFHeNdxc9J0KvOWNjDNgkB0/92Omm3m2xS9PS+xhofefwXfyg8PhS19m+xuhIBdm4+cswRwtUXysHQwR9EMVdnWD5H4ZpiWcLPkmDq/AMAT7V4RKOxyt01zc6HddDDW13Tn4xbPz6AM0rP9lBQNnQGo3E0r3xJSpyY8ZhTCz3EMZedGDK7aXJy+ZBL4n6POzbaaZ4RLOcttXDHBTnTN7R8KxhF+x7YYLD0lnQYUtfRZBnT4FpejwXH8pj/loAcRrQ485yUnlHyFJBASC52TSFCBYRi1ILpxSrYz+y9jZ/y0NIR6Vgrm18TXsVW00zLFy2Xq+JigamCd+CfcTf1lefaXBrBWTyoFXBKKnYSTLGB2VcZzS6rKMXnOxMLMm4c0dsPkDDOMgEGGikY5pmnytPSNDsRtQkZpE8NpI9/6UNSklqwp87nlUegRiBWSzKqWPoI9iYyQSlHGwD6F1ZVorwe+/dQ7LJkWEmP0L5LEH+eAKRMpP72jmXpFaQSnR/3N8iCcJ3spHHRezqTITlwcvhs5r2TiTmtwx5Q0IHOM1Axfe7bEww3TR24Y57r2VTfDhKudMbqz/0emdXmx2wuibCel9K3qvfdoQWCFXFm+sCmcnJ6ksezKQWT9PVDfWNEDc2IGnHWfaPaQjjI=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(47076005)(186003)(86362001)(508600001)(8676002)(36756003)(4326008)(6666004)(81166007)(336012)(8936002)(7696005)(1076003)(4744005)(44832011)(5660300002)(6916009)(426003)(2616005)(82310400003)(54906003)(316002)(70586007)(70206006)(83380400001)(2906002)(36860700001)(26005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:22.2926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d31badc-ba94-4028-3c57-08d9ad0ffc8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5298
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This expresses the intention clearer.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 8e794ebb47da..8a58c862c33a 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -252,7 +252,7 @@ static void apple_gpio_irq_ack(struct irq_data *data)
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
 	unsigned int irqgrp = FIELD_GET(REG_GPIOx_GRP, apple_gpio_get_reg(pctl, data->hwirq));
 
-	writel(BIT(data->hwirq & 31), pctl->base + REG_IRQ(irqgrp, data->hwirq));
+	writel(BIT(data->hwirq % 32), pctl->base + REG_IRQ(irqgrp, data->hwirq));
 }
 
 static unsigned int apple_gpio_irq_type(unsigned int type)
-- 
2.17.1

