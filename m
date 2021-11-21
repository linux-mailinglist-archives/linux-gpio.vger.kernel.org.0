Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9F9458523
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238335AbhKURAt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:00:49 -0500
Received: from mail-eopbgr20072.outbound.protection.outlook.com ([40.107.2.72]:10334
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238686AbhKURAY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=px4VrOIkKrrT4CEWyvCzCizc9qlDxEdR42cqr5+gZb0=;
 b=mFsfLXMNr49GhNFUoDm/jomx9e+hyp7VVmsI0X+/g3R0myAGPBqvdIAO6v05aD2pzmBD3/0t7/j0prbETEuLbglhqlx3mHGrNCcnbR+LAMM1thNJRTBVIIPzrvWpL7BdXD2xzpxM/9IeOt06vWa4dm17LuTAzxr0keUnb5Q+Acw=
Received: from FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::14)
 by AM6PR08MB3815.eurprd08.prod.outlook.com (2603:10a6:20b:8b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Sun, 21 Nov
 2021 16:57:14 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:14:cafe::d0) by FR2P281CA0027.outlook.office365.com
 (2603:10a6:d10:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.13 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:13 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110"); Sun, 21 Nov 2021 16:57:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d940e0210301440
X-CR-MTA-TID: 64aa7808
Received: from e5c75253f78a.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7B117CF6-DE1F-4EA3-953F-F9AA54C7DA25.1;
        Sun, 21 Nov 2021 16:57:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5c75253f78a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:57:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7G5Qf/NbN+60u6AzlEHuGpwgzZQx/8elgD0/9/KIRcbWMmzxeNcmyMzIBH+0AelIIYi77cB6r6evNcuEhOcoLkPwW5wu+5+CeN5yyKonS10mZsFRDLd6F+46AZd0M3fBb9xwbAOX00LTcZzt12Vc69m973qU4fLXNRmzKHmSwZzGqaX5rD8T03zfgX0xbvZOizi1jt16m1fXxDDPegbR3CYFPLnMjy/+gmNIfNIQOdk02+/GWGB8nHpewuMCjmlcybWwQEI7mL8J4IJJUA44jKlYdhaZnFSyFV/xHAFzo9X8BTMkSvsn8CKzrrxNvxCWFmPCZpwe6hsy1xet5nk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=px4VrOIkKrrT4CEWyvCzCizc9qlDxEdR42cqr5+gZb0=;
 b=GC4GCkOZdjrPMRHT+Zjpqw83XNG2BaXlD5k0Ym1ntdXoFD5NUQlezt2t/aN7vUAIB4YZd9R/HllsB6aNKuUelqXm+IFqOfW1M045VFvnPtjA98Ujlw7vaqv1nfaifVTbvzlTVh2nOmPWJz2O3Ffrl3RRexLA0v+/31YK/cMf6aHXTiL8+a/xvkCcEk4dFXAkiGX+Wno1EjWOVoGO1PaTPIXy+DTJTGjjyeRqhUAqxVfvWO/NGGNjGbicERk5TbaKdMdLtYK1TUET3ueYXWBwgGyG+M88o7EYlXV2SFNsEpTSaMhnxnh3JiQgfiCAkdKuZgCFw816iq7rRzSjxtMZtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=px4VrOIkKrrT4CEWyvCzCizc9qlDxEdR42cqr5+gZb0=;
 b=mFsfLXMNr49GhNFUoDm/jomx9e+hyp7VVmsI0X+/g3R0myAGPBqvdIAO6v05aD2pzmBD3/0t7/j0prbETEuLbglhqlx3mHGrNCcnbR+LAMM1thNJRTBVIIPzrvWpL7BdXD2xzpxM/9IeOt06vWa4dm17LuTAzxr0keUnb5Q+Acw=
Received: from AS9P194CA0007.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::21)
 by VI1PR08MB2992.eurprd08.prod.outlook.com (2603:10a6:803:44::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 16:57:03 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::3c) by AS9P194CA0007.outlook.office365.com
 (2603:10a6:20b:46d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:02 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 16:56:50 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:50 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 08/11] pinctrl: apple: remove gpio-controller check
Date:   Sun, 21 Nov 2021 16:56:39 +0000
Message-ID: <20211121165642.27883-9-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7f03923-8737-4e8f-c021-08d9ad0ff756
X-MS-TrafficTypeDiagnostic: VI1PR08MB2992:|AM6PR08MB3815:
X-Microsoft-Antispam-PRVS: <AM6PR08MB381544E6AA06E50B3DD02035949E9@AM6PR08MB3815.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wyXsKEBjur6vT2huMHRXoRNKyIQj/5PVr+s1fD+zGlGtod0RrOZC1mVQ8V/CKnyRV16jeKEHrBqfLdaGQ/RQpG00kEHBZK4bsnRlidJ0NSDQaiHE+ctZo64JcHNhzrg9SIflD5BlovCvhj/85PO+NX5OnVhkfIV9gEZbIRh1heGLUToVFORhjOSyngG/6WtphkG4kCzEoV6qaQCiZ/XuVOsYzZAuGc/4xqTY39jc0jNB42qDZqje0ZYE/MrPB6yC9a+FddbNJ3NZBt6HBYglhRmSCYZZ+Lk20NGXUeiScu24irq8xY3jlVvrnOaRBisVihOuBCeaK9bXKZkBTWC1mUVbsnOaXm4Nwf8AkEwjMJp2+o4KUI+XvlMSJruQ/m/rtDTgYtZHs+BxWNmuYkHiKTMnD0WsLf23wzX4eXvLXmCk0YhS++qJ5qKChuGxGvRvYVNnaorz3VvkOcuf2R3d+Y6ex5Wpr/OtqcLG1VQ8LvRQIfFPOkd9cVaWWBqceA+t/qGW2lUHQw1WsqHJ8mFHCjAzLgdZZwXzLR2bQF6DTXBYrWTcwIxUTcuKP9kiwf/Aqvl8stZimdnv8kUbhBx/hFotpu7c5gqaUJAi7K28RzRTE+qCfwtCNF+1BmydMfdp702XCB8oWYl+ROYNpa+xbQFaTj0U1FZfmlrkTAbX7LFkXTbDoMAKF3rt08oAL5Ae1V1pCtkMaZtXa/K4B6xb+Ise9Fmuz4kj/YHegvSAqM6N/9gS+NH/efsJ1EeqaT0p
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(81166007)(508600001)(54906003)(2616005)(82310400003)(4744005)(316002)(336012)(1076003)(426003)(8676002)(36860700001)(6916009)(5660300002)(186003)(7696005)(8936002)(2906002)(47076005)(36756003)(356005)(70206006)(26005)(4326008)(6666004)(44832011)(86362001)(70586007)(83380400001)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2992
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a6223cc8-c54d-465b-fb22-08d9ad0ff0f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Be4c8r7858/itq+g67MN+u1AmMbw9Jwk8CcABrWDrJsuFx8Jaj1B7qfVcqb8E0xUIMAf8NQoFUNyrMSNAARTUBSL2j8RKQMgtH1pXmWiWtJ3VZ1uHgjozWH5ypSzRd67y+EvJFMcdLbS2+kN9Tw3F0VlhzIr/rXe/8C4zmyuptJBCgh3+hzEjc//WZKyKEolTR0nY8T04mzSFD/arrRhjnSdE4N5EF/GIP8J2oSUhvOU5GJYvhNxWbc7Ae0rhz9WG0K5FZTku/gFthaEt0RgDNcZGmNZzBefkVu7fBwhIhMV0tJFzrjlNKwUXBEUgs9AzmwBZ/HI4H6cKNl8ClFeX4TE86B/C7uQZyclSOj4w9UdXkORVzecqXiZxerlYemTe3CirR+NYuvzNWwsFnpQmNxMGBoZoDCOyEc2CjM15SYfBPHvJZQ2DUyJk5IshOYtYjI+1L7Mj8KH7PIxi/WonktE3YtnBqlihhN/Y0RgvobpszmtvJZTWxE0tr4DzQxqhfh1+oW8VEybpj2ClNKRXKgQSoZwNfHhKp9neKrvlvl7+3yj4ftlAmzgG0Ma20EXAZjW8hvYgg1qFSCJLoGomNW2y02D6CFlbs844zY++w2jxoU6fR/xsRGvfDbAiPPgALSclOvfJLreWnPQ/IRwvvKdtOTyMHam7sP/vWFhNFxRu2l5Py/WYh/5ueG+f3BsYCj1ksWO7OYMW0O9lmGIZ8+UQaaX+xLnTus/mAd+n+g=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(36756003)(47076005)(1076003)(2616005)(70586007)(508600001)(2906002)(81166007)(7696005)(82310400003)(8676002)(70206006)(36860700001)(336012)(426003)(4744005)(44832011)(4326008)(8936002)(86362001)(6916009)(316002)(26005)(54906003)(5660300002)(186003)(83380400001)(6666004)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:13.4288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f03923-8737-4e8f-c021-08d9ad0ff756
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3815
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Having this missing, but everything else valid shouldn't result
in a failure.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index fb34cbe189ce..471d3abf9d99 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -360,10 +360,6 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 	void **irq_data = NULL;
 	int ret;
 
-	if (!of_property_read_bool(pctl->dev->of_node, "gpio-controller"))
-		return dev_err_probe(pctl->dev,	-ENODEV,
-				     "No gpio-controller property\n");
-
 	pctl->irq_chip = apple_gpio_irqchip;
 
 	pctl->gpio_chip.label = dev_name(pctl->dev);
-- 
2.17.1

