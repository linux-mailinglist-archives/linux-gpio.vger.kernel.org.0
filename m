Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA5F458524
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238651AbhKURAx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:00:53 -0500
Received: from mail-eopbgr50063.outbound.protection.outlook.com ([40.107.5.63]:53998
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238524AbhKURA0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2zUKHgN8XCzhbsV2fR/kUR2imKU/AvdmXcfwuE4vEs=;
 b=XAx6E6ZO42tFE8a11m7QpLu47J7VrOV9burbQoCtcnY17mHiP07HeiUEsE12n6kjf10A38VoggDH15cmakAZRJdlps8cT2UwDEZT0QQckbizEL0z25Dv9xWAKklX0EGtju34LyVYPago7IuGB8b/e7dKwY2Shpn3hlMbpm69uQ0=
Received: from AS9PR0301CA0022.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::18) by DB8PR08MB5164.eurprd08.prod.outlook.com
 (2603:10a6:10:e7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Sun, 21 Nov
 2021 16:57:18 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::b2) by AS9PR0301CA0022.outlook.office365.com
 (2603:10a6:20b:468::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:17 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110"); Sun, 21 Nov 2021 16:57:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a6804607b6ed58c
X-CR-MTA-TID: 64aa7808
Received: from feca4570f659.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2EBB33AB-5DC2-4F93-A4C1-33471E676A8A.1;
        Sun, 21 Nov 2021 16:57:09 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id feca4570f659.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:57:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8DKbQnQKyUkUh7fdQHeb5TUPV0fsxhKqIr99hWKrKGU5MkH5ZQy5QdMVhZ2bD18Q6pqydUO+Ha6CiTDa0oPw1Z7fsjLGOIDczsFaHqkuiNjA18lKLqP9ecQ3Hhhig6KDvMtYcl8BE/YI8xiNlmBJGEfAPiUSMLc8lvw2f+Mx1Eg6JaaP/SSThv4F5iVIWdX6RV3bgW9Oe4ipR0z8d7L53ql99fq1mSivoe3L2bmG4KsXL2abjhfd0phRIO4Y1s+OaQqESwEfYncxMIXQ1F1YypCkvLGYX0sTFm4/U7Pcen7hiPAvJxKVsHaxs8BHkUP5RC5nlGc5h/VAZKCc+DVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2zUKHgN8XCzhbsV2fR/kUR2imKU/AvdmXcfwuE4vEs=;
 b=jnb2pg+5zMlLvdTkVz+iVB3E9fyEFd5h8onsx6d9ssBK91qb09nvfN77DNCDc5fK3NcEv+zGvPvYGK2f9BwK6m9BdaNd2pRwFoql8kFr/So7F3wWftbMZnx+612hPtKVZsacm6TLSAEIonNo14ZH8qnS+bS/JZ9cpYZuEX8zXWVEyMKn4Fs3PNpOOCGmhSkE+i9XOgC0sJY1/SLJXkBbVpUu0D7cAXsZdueGHM7ng6lYyJ+UHL+1/2h45MRLS3ffjCMZCw03BJetbgmlsa4RZ2QlzRT82peIPmSyzuJIbHiSp04NzD6nzEZ6aXBwAsSSnHuuiOMokzQcV5UJTMvZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2zUKHgN8XCzhbsV2fR/kUR2imKU/AvdmXcfwuE4vEs=;
 b=XAx6E6ZO42tFE8a11m7QpLu47J7VrOV9burbQoCtcnY17mHiP07HeiUEsE12n6kjf10A38VoggDH15cmakAZRJdlps8cT2UwDEZT0QQckbizEL0z25Dv9xWAKklX0EGtju34LyVYPago7IuGB8b/e7dKwY2Shpn3hlMbpm69uQ0=
Received: from AM5PR0402CA0024.eurprd04.prod.outlook.com
 (2603:10a6:203:90::34) by DB9PR08MB6890.eurprd08.prod.outlook.com
 (2603:10a6:10:2a8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Sun, 21 Nov
 2021 16:57:08 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::2d) by AM5PR0402CA0024.outlook.office365.com
 (2603:10a6:203:90::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:08 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 16:56:51 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:50 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 09/11] pinctrl: apple: don't set gpio_chip.of_node
Date:   Sun, 21 Nov 2021 16:56:40 +0000
Message-ID: <20211121165642.27883-10-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8def6a42-28fd-41f8-ae90-08d9ad0ff9d7
X-MS-TrafficTypeDiagnostic: DB9PR08MB6890:|DB8PR08MB5164:
X-Microsoft-Antispam-PRVS: <DB8PR08MB51640A16873345C881EF2183949E9@DB8PR08MB5164.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:628;OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BgilKj1pDsYSMPWD1qFzV56Z4bU5SGOpCeZRtP1+dpIcBHpFc+hDmmGl9IvEPMBrPEhGppRdVf5HZmDUeg2z8DF2v+saKoLFwzuh8pXY6dxYfqGtetcl2y3Dg5hL1xJfhXCriW6O82sebnjk4iGYETqHwnLo4WKtApLnMlR6QaDVtiB3JoLWn8J5UPO9ymYeBKnyvTPKbmM5xCuyiHeYLgqak8H/1tLt3EnrWlJpGdub+JXuz1l/rJb9wgKVv0HEXPR8tdnmWakhBZcy2FIkPOPAGuD68XoPsKb+e1+OaUaR4hcm20ewJaVW53kZ8zJyzYarrvvx2T8dlGJJfNn3ovLJLVIMQxtiVK6NA53oHGVcP3aKi7A100racISIyIu8W5QSx58CwH2EJf9Mmda2bW7rQCl72v94SMMfn61SqE2o87M6phl3dayxSqxv6YoY9khUOctRGN2koLt2ILC8q2aymPOEb2NvGfAXE3XeyNR1GtQ+nioOZNpd8tR4o5fi3yrecEZzYN7ghE5VOXmgcrl/cXSGR6JuBpM4YHT/baloEGIINMTvyDHKoc1iXIYbn4cNoVdkIkP0frAbjq8H1i35x+5lFSKC5w7N2vh5tBVJFcoB1vpGLhJ4vazlqOwa9cLzPj2ycTZgetk/Vt0dH2vNjcnhy/BrIcckWdtbyX7gsVKtFcDbWaH5mfElqHTXSLSywFPcPth6MaHqZIZozNN+KfMJsTPiv87WRcLLMbMMeDo2p/mxhBxaFa4FxmC0Zrg/YKn/VAoadeLPA/RvhA==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(5660300002)(336012)(86362001)(2616005)(44832011)(4326008)(70206006)(70586007)(47076005)(36860700001)(26005)(426003)(1076003)(8676002)(186003)(316002)(2906002)(82310400003)(6666004)(7696005)(54906003)(36756003)(81166007)(508600001)(356005)(83380400001)(4744005)(6916009)(8936002)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6890
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e5c587d8-ceec-4f47-b76c-08d9ad0ff415
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0kb0yvkMCg7JVCrLh8aJ3yLEbdpHshzBpnApjkUmE5Af0X/7QNLQ0yLGgBsJ0URDhgwj0CcOV85u2/pE//R0ly0TUuf7sPdkCEuV1mRsRdTmYcivVHDCcvPSsbfaFTnKbgyqLNe6WzJQJ4X6gM8uLBDzVHpDR6kWNHpqPOXybcj2rC+Q1FpPajPe6zDch3qOXYeb0wH0k3F5Wy+wZzSjTTfSsRwaJTtVGQPPo1K2GJHEM8y5sy4Dn2cs+oMzW0L3TTum1pwpGmallwnqaNP6hONk2ymKQX/SDtxs5xQorcmjnSKyW8YOcWVGGhRjgeh3ZShs+C7jgiEasQAXeanQgOrnyrnmRa5KqucE6khe6h4XjkuEjOFMLREcUOMtnYFmCRP766j4O1oe+liHPBAC1CIko7cvCWtVjB/9gDNeZc/2f2dtiPA7gLF7CgmIfFCKqU85r7cMAhIL3en1H68ka0zUoSEVNSO1JC1HTIOs2hwLcThxQPjWM8X2a482RL+9IugftYOfo+n4tMzJCHCcVS/SK2okKQk4rcvAeIvelE+U342vs98dfPx3IgKc0gVFIjk58BhLzRAN3pnddf2ruLqT0glTRyK+4cdfSNv6OpcwyX87ADHkzPVRW6lPz6gsz9yX6GiDYh8i9yp2JkzsR1lebiUxZlQ2Qs1sFOErA/u1pWf7bDbTGvzwrTkDHT2XrBasboh+Bmfu7r8UW2zPVWpGq41J/HFVR+D/L6ZFg3w=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(36756003)(2616005)(6916009)(8936002)(4326008)(70586007)(2906002)(86362001)(426003)(336012)(8676002)(81166007)(54906003)(7696005)(5660300002)(47076005)(26005)(508600001)(83380400001)(36860700001)(6666004)(186003)(44832011)(70206006)(316002)(1076003)(82310400003)(4744005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:17.6342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8def6a42-28fd-41f8-ae90-08d9ad0ff9d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5164
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio core code sets of_node, so no need to do it here.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 471d3abf9d99..8e794ebb47da 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -373,7 +373,6 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 	pctl->gpio_chip.base = -1;
 	pctl->gpio_chip.ngpio = pctl->pinctrl_desc.npins;
 	pctl->gpio_chip.parent = pctl->dev;
-	pctl->gpio_chip.of_node = pctl->dev->of_node;
 
 	if (girq->num_parents) {
 		int i;
-- 
2.17.1

