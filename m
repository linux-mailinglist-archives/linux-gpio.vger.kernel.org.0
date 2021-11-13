Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49AFB44F423
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 17:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235909AbhKMQdA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 11:33:00 -0500
Received: from mail-eopbgr60046.outbound.protection.outlook.com ([40.107.6.46]:50437
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236027AbhKMQc7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Nov 2021 11:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nf3+rBzltgMmGaGtosEzQ0QdPjKzFl1QvkaJlJPrZGI=;
 b=TyRE1yJkzdNv8VIDcY9FuoxryVG56QspoqwtbdTZOx88VeJd8Qw9n8i5vldv/91npGrrW0ZOxcTlYFLSfykvgMq+NtZ2AXpTKdM8BVl5O8U3dGwR+MBd3JQkCwbu4hvilGi4o8JmT1hGy5b/QK2kAzx9aua0kuefzOJzGyf5EOU=
Received: from AM6P194CA0079.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::20)
 by AM0PR08MB4546.eurprd08.prod.outlook.com (2603:10a6:208:148::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Sat, 13 Nov
 2021 16:30:04 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::d2) by AM6P194CA0079.outlook.office365.com
 (2603:10a6:209:8f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Sat, 13 Nov 2021 16:30:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:30:04 +0000
Received: ("Tessian outbound 892d2780d3aa:v109"); Sat, 13 Nov 2021 16:30:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad60bd38b55e1534
X-CR-MTA-TID: 64aa7808
Received: from 9b0d1f0f57a0.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id BF7BA4E8-E78B-4497-9587-E22CC11EB6E6.1;
        Sat, 13 Nov 2021 16:29:56 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b0d1f0f57a0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 13 Nov 2021 16:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFeEi3YIKDe+jD8hYmbEoOI1PcXpHafh6Qogi49OqNdni9J2QuPFNZIyjRzLoZe54LGRUY9mSs9vEIFt5lVfl/W/3NqYZu8qynKOKVyFQhMr6zQtsWrGrZv4AqEdc6mRYsjLZGs9PbFoQbkV8jnhw+jfdrN2ebNUaw/sAY0fY2z4xN3+noJY+6Q6HZHYnDeMfpqR2oUX1mjp2IhiKl0Je5ghjfADs9BZa4D17eSWpSRF0IX+FeV2gyRpkaWtqW3llKvNGVahcZSYriZHyqz6gvTtM7sSvwXoMwUP/vEF0QmgFHWivO8jtI2Z/XQ46RxIS3zxCO/Q3rKMgnqbmexMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nf3+rBzltgMmGaGtosEzQ0QdPjKzFl1QvkaJlJPrZGI=;
 b=A0ocfVdi9orMgcmLuxNRRvLouT+eW3FJtX/7ev+Tsc7mHemqiNkBNVf38tdrwYysLUBPoLJmaAaFyinc5N7en1r/t8hqf9Y9DVLcCwHf/G/887FKfmuhUicRGtYP3T8vjvyFDdnMNwtr79O/pDwv5576DR7s9bNDJFCIC6CCCKhcNNxkVlQvIOREJVbJHA5Pc5XJeEgT06JQhtqBG0ID09RZvXMsT4B3AUil3hCOJ5txIi8S1nKLXLt97aKZllAt7O8hSVR3GkWWn7HuvCVGaMW3N9JWtpXNSQtd5YRLLeBmxYuzNnWobT5rFodnh0go95lXFkwc0WjyDiY9iQVT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nf3+rBzltgMmGaGtosEzQ0QdPjKzFl1QvkaJlJPrZGI=;
 b=TyRE1yJkzdNv8VIDcY9FuoxryVG56QspoqwtbdTZOx88VeJd8Qw9n8i5vldv/91npGrrW0ZOxcTlYFLSfykvgMq+NtZ2AXpTKdM8BVl5O8U3dGwR+MBd3JQkCwbu4hvilGi4o8JmT1hGy5b/QK2kAzx9aua0kuefzOJzGyf5EOU=
Received: from AS9PR06CA0401.eurprd06.prod.outlook.com (2603:10a6:20b:461::11)
 by VE1PR08MB5742.eurprd08.prod.outlook.com (2603:10a6:800:1a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 13 Nov
 2021 16:29:53 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::94) by AS9PR06CA0401.outlook.office365.com
 (2603:10a6:20b:461::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:29:53 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 13 Nov
 2021 16:29:51 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:51 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 2/9] pinctrl: apple: add missing bits.h header
Date:   Sat, 13 Nov 2021 16:29:37 +0000
Message-ID: <20211113162944.22412-3-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211113162944.22412-1-joey.gouly@arm.com>
References: <20211113162944.22412-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a1d0285-74e4-4b9a-43ff-08d9a6c2d8cf
X-MS-TrafficTypeDiagnostic: VE1PR08MB5742:|AM0PR08MB4546:
X-Microsoft-Antispam-PRVS: <AM0PR08MB45469FB0DCC05CD78B9E5BA694969@AM0PR08MB4546.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: gBSqyNsYan2wza6DayNczksgwOWKaJfckGGsl23IEL1PyfuP+HeLYCvzapVSXMi6tv9SZqu0hMgVtiWkMMs5oW9K7qTltZIyIs2B6PnTSYyO/UXaNbx6Qm9vSP39C0iC6pXySndYfqoicanosFIHZGCJuLj4dPBPYHiGusJN5G2VLgVOCn7RnholNhXjkrOvcDD3yh5za+KQm2A9HlFJalhfRsDOvn3vpPluTmCI4UWmKtOs+QT2Tbwwua91jVPWpIyHgsoLkXkbfhZtw20TCbUhFkmkfpSUBF9Hfo3KggqBkTjJJxXzbsYlqFeVkUhavA7F+zcQyh4NmM58d9xOf/eou6xWbpfdnszWdcVRIGHi3HTMmMqFDRqx315t1xmZ6NFu0RI1CetkHMkWnJZ8KxdzUkxxfFRtuF/FsrRIUN0GhFiJRMI7zj+eN0/BWtCYlb6sZakRUXKH4h7TrylWysNjoJiYnh5wJvIX91ZWkzlCCS0lqOOtauANfOl4uZSvCIWawpq0twA1YoJN9iWGVuGapzEycEsqzNacx1YDiHZe2m75Nvi3fq7vKm2h27NV/SGCR1u7ZzqCuac54oBIyh2M2qI8OVqV2MT95pKVvxdEFfdBX3c5VU13qp6xguu4m9VAEzHru5kj/JsPS5GfA77mqGQvS0b385kfVndYG187Nyj52bJrUPclrqGPu9vVGZBYtycvsTpq9qsVrl/Xni63UdWLzE7am1nWXM4/UdAikOGBuBKkCAAxmnOkaxe8pUw0ssoz2W095yicRK0Bkw==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(356005)(26005)(70586007)(336012)(4326008)(81166007)(86362001)(47076005)(186003)(5660300002)(426003)(70206006)(8936002)(36860700001)(6666004)(2616005)(54906003)(2906002)(44832011)(36756003)(316002)(4744005)(508600001)(8676002)(6916009)(1076003)(7696005)(82310400003)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5742
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 931d82d2-a049-41f3-2da9-08d9a6c2d26f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mMMOeCdpkp8EQSKSdPFe1+iwpwvG//RM9k4MyugNNj9/vDGA7pga9/hI9eacIjGNmgHl0lNtcX74e7EbQq511SSbYbMqwqW9zt0XVClx65zlty2u+42dTvNq1UHb1I32c/G9x3InmGRSUSGVU71ugmZLLiN0kzROPgaU5Efgkj5IWTmzBa5fY/gtDCuQ4nY2G16CHhNqLfJf8IoAYCE4S41GMP6UjSW9esh4MYfXAli/ERgAvBudeiVXYF9S8btaInaJ1RLoPdYegToQvJyUkl3PzvpycnSVChVTKPdDgyVLdTn13QWlONNADDNRmFJCrjpSD3BtP/PdOYUHR/plzj6CcZjJ3jwzOGdQVrtk9OUibcmfbpzpNkxkWxa7a7g5eefRW/+uAyXPr3sO3OjpOdUEVA64guX6MVc9fKW86WkDns9buJoOvQM1abfN0t65vLVcBfrtM3yVVtCSdYiYqxZ2+eVHBN9Urogr468NNaJsn25ffRyNGuOsn9EkXaWIhBizbAA7KzfWClWEsuAx4YcH6Ep8WyDRoSGNYGFSrlFjj1/4vwS7+phxapOZzZsFku1T2P6+/xSAQKspMP/MOswRYfj5VTfUNrs8uIdlXaLXdSqieALhV27GqD6+bz0cnxE+iTPM/FlouiGLiBZyW8EvdhXQKQEQx9TRqVJoYFLYYcTg9/FMIDLhA9dCVJRnLVIB2ZGicXn1eMzX0YN0K22sEZeRM6DAGqyL24+BiQ=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(2906002)(316002)(4744005)(86362001)(26005)(186003)(47076005)(36860700001)(54906003)(6666004)(44832011)(81166007)(508600001)(8936002)(70206006)(70586007)(82310400003)(426003)(4326008)(1076003)(5660300002)(8676002)(7696005)(6916009)(2616005)(336012)(36756003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:30:04.0414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1d0285-74e4-4b9a-43ff-08d9a6c2d8cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4546
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 23466ee59d79..4f7fb79d8e11 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -11,6 +11,7 @@
  */
 
 #include <dt-bindings/pinctrl/apple.h>
+#include <linux/bits.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-- 
2.17.1

