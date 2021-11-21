Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B24445850B
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238623AbhKURAS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:00:18 -0500
Received: from mail-eopbgr50078.outbound.protection.outlook.com ([40.107.5.78]:19958
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238545AbhKURAL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp5HqfCaAbSrUfefJmELb4c8DbxDgGsFv5E06WPcupc=;
 b=KkIAGKQ66FRWJgg2McNK/mSsoro1fVRavTu0xkBpAG+44Rmvy2IlusxtfAkZFih+Q3L39d3HMHrlz+fcu06ZjqcCqyQgDPXwVEnwx3lwK1Ytol9ZXtsyMwzBqp/ehtXqvjMWAR+IeP3saxtDUV2KaSmaDqvU+A0YpI8jyAnK8eo=
Received: from DU2PR04CA0282.eurprd04.prod.outlook.com (2603:10a6:10:28c::17)
 by AM6PR08MB5288.eurprd08.prod.outlook.com (2603:10a6:20b:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Sun, 21 Nov
 2021 16:57:03 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::89) by DU2PR04CA0282.outlook.office365.com
 (2603:10a6:10:28c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:02 +0000
Received: ("Tessian outbound 157533e214a9:v110"); Sun, 21 Nov 2021 16:57:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14f6395a48fad051
X-CR-MTA-TID: 64aa7808
Received: from 414e3ec333ee.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id CF25309C-31EF-4512-8A2A-662999D9AE7E.1;
        Sun, 21 Nov 2021 16:56:56 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 414e3ec333ee.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:56:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5ARUCKjWFubjJA38s/VVgpyyYvoVQhskfw5VGssDgdejGTHGbqX9UL7u4f27y9HKcEP2foXql4EBJQ4402uueYyyY+ReDtxKZV1h9z9/OlGfKd4c48zsz0SjTLdfsdKtUOuzdDMwG7nygFiqagbx+Q3weLlCBObpivwfp8C4keXv7jzl1f6dEWBlRLWO5lz+dGM6OF3/xKM+vqIrtquy2rT2H9wFgd+1pFS+bJtfdKK2EoRDY0fTZ3PNyKgMgVfcEFgEg+n2i6xyladku21SsvhML76VN7hxZa5SsgbPgswt02zf+MJ4ROaytmo+eYGEIcAkRLu7UpJfnMqrVp6qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wp5HqfCaAbSrUfefJmELb4c8DbxDgGsFv5E06WPcupc=;
 b=dT/B8PiDxoZMEeoY0zDiECa4ds52PwCHTPhz6mNJkzquHKUVy3oCv0srCNViDbpb6l9ZlZvIE5lSReZGZgLfdM6YFYBnNApVJ12oLOWf+ekwdSM21/qGpz8iA/zExdufq2LPK3CMtSHfiSb000Qn0s8EpYKmhq6uhhSDnX1azlXrP4IYIX2xbyvCyyu+KB4cLR59o9ggaOxpQqbn3putynRLai4mnG+GkHRn+ZQNr2mNHZ1z1bhTD0kyFgmhDj0pF9rxYJLo53R3spFKPGnVoQyk5gU+rDEMhzPMOEpeuOMaTLqigNklNLJDcG9psRcru2D4eLuG3vPMFFgedoOUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp5HqfCaAbSrUfefJmELb4c8DbxDgGsFv5E06WPcupc=;
 b=KkIAGKQ66FRWJgg2McNK/mSsoro1fVRavTu0xkBpAG+44Rmvy2IlusxtfAkZFih+Q3L39d3HMHrlz+fcu06ZjqcCqyQgDPXwVEnwx3lwK1Ytol9ZXtsyMwzBqp/ehtXqvjMWAR+IeP3saxtDUV2KaSmaDqvU+A0YpI8jyAnK8eo=
Received: from AS9PR06CA0412.eurprd06.prod.outlook.com (2603:10a6:20b:461::6)
 by DBBPR08MB6026.eurprd08.prod.outlook.com (2603:10a6:10:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 16:56:55 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::d8) by AS9PR06CA0412.outlook.office365.com
 (2603:10a6:20b:461::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:56:54 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 16:56:49 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:49 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 04/11] pinctrl: apple: add missing bits.h header
Date:   Sun, 21 Nov 2021 16:56:35 +0000
Message-ID: <20211121165642.27883-5-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f65803f-2a6d-42f1-bc3c-08d9ad0ff10c
X-MS-TrafficTypeDiagnostic: DBBPR08MB6026:|AM6PR08MB5288:
X-Microsoft-Antispam-PRVS: <AM6PR08MB528846E5C5277725D889EA32949E9@AM6PR08MB5288.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: sCtbJFMKHG2Bx+Df/ZRF9ZqLJ3AHpPgUa5ZBjQcDkjADWUE0OwLP/0toHzSbWE1RXpWhMUjpm481cyrVl9SDicXfCsSTYdWcMuhQKNOXrdvPAHq84CqeZsuebwIvVWf0RN7JaUcdpo4/h26YcZBAymi4NpKn8yJ6sZ8pLq/bGBm4kkWnPJ54JUuXxmBgnU6u84bGVQ4a2FNXoKR+JOPTomDxhyvFvDV027c+p+/4Qga3PcLma4OdGbA7bdFEzW41m4kFl98DRpoul71c1gZkZGWr34igBghGMIScP7TCv2O2HoeC+3y9/eRFYjsGHtH1EMDzRKkTo4vHEufNRlKeZEn8sUVCeaNrCaYstCRRTzGmxJFTqqy14IwsdFNRU7VvfLZ9WF4UpJS/v7CH9c3egEx7Yo7E05WxHENAULk4TL1LoJtFm7OLD5L3saY/6PKNN6oY+G4wWPJaFsZW+08rb7E44HdrkqazQsR2m1p/fJUOnydhVYI4sdNymDx6AP/mIbR47r/jN99yqOPCKPqQ4gQLMTIfMMOS1NEQL2KiqiM2X2KR8igfxD59U1RZGzJpF8faKHkiCJ/CSysNP47x/YZP1n3FXjI3Pljgl0YxtOcfCvGLAPbKBtAlOuOabc8kQCuaYXdtz6GKwoyRYW/WlpmYotmG01ZxRwWQeEI3lhcfAKXm9Xm4QkcWRq11OHhGNsT9M6ejQDgKup7JFu9XSaw6xJQ3Zca9uYCkJkW/EvQdgFy6rZIQUs3tmVqVhi0WHDX14u4NNu8OTAHgdcE/6Q==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(44832011)(4744005)(70586007)(36756003)(70206006)(2906002)(6666004)(7696005)(47076005)(4326008)(8676002)(8936002)(36860700001)(81166007)(2616005)(336012)(426003)(316002)(508600001)(86362001)(356005)(54906003)(5660300002)(186003)(1076003)(6916009)(26005)(82310400003)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6026
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 53f71b19-ef1f-43ae-40cd-08d9ad0fec4c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: os8TlSWYb6eTYX4iz3iNUC78OQZSmiXQElTZHy5yOrUup97Nmwlde+Z9m/ad2/PkulP5oA+2BpuBpbaQ8LPuGNi0R6IERUJ05wYYr+EEPdq6HQdR98qrPeZGYvzMUee3mulFGWUDkDn/sZ4Kyb+WCuQFSH2ig4wKRBDB2vE07dnBu89qeXNUqSSfsmf6KMHbpHh0P+jqPa7fv5DW2vmwOsCRisb2vQBBR8KNorJvnef7x8fxThC0JFS5Qi1T990rMLvrsuEbkstS86UnZuS+1Q/UdfccSZlepgDZ1JQkEl5qMsX0cfjhqQ3igRLCsjUfAxl6P4zkloFEXoaTYljLc1/Br6OX/iuK5Ln6cYgYGKx9KeMKaWpESEJS8L0ZQViDvo9N5FHgIF9mpZcRz6U1YrqDi6pFECgkVzhdX0rmV2ctxSbSlQm18JhZHRz35vE1CkHFO51i9cmhDukRq3qXviTUqRZpjvs4OGg04X2vgGei30roLdZi0ABiHMGvxZjeOHtjRsz2DBaa+bptCIBpSFxEy1N5guwFzCm6EtLeqntaYV37Xnl7PcQ3lJUl9P8LoVlGTI4JLTCllek95vpbzbEbJF+qKzq6JxZ0k47sGlch+1O3/Jq82uF/NijMsbb+ElUcbPyYYlQyLn0MtkvcSgoy0AR5GvlM+R0ukP6PEQkElM3TO5mAWTzha7F4mNFG3TS4kq2dtyXgPkMf5HijiOO4XbwggJ/6JVwJrHR9gpY=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(4744005)(36756003)(82310400003)(70206006)(1076003)(70586007)(7696005)(5660300002)(47076005)(186003)(2616005)(336012)(86362001)(6916009)(316002)(4326008)(426003)(81166007)(26005)(6666004)(44832011)(508600001)(2906002)(54906003)(8936002)(8676002)(36860700001)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:02.9814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f65803f-2a6d-42f1-bc3c-08d9ad0ff10c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5288
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is needed for the BIT(n) macro.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 102940058a11..cce95367c156 100644
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

