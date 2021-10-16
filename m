Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3CC04302F0
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Oct 2021 16:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244348AbhJPOVS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Oct 2021 10:21:18 -0400
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:42126
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244358AbhJPOVF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 Oct 2021 10:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NARTcb8v/zI74dqsUxDXg2IyW1EHiQRFHKuudMgUpE=;
 b=8P0Dmno/Z9lPW02j+raSwm/9BC6phmzbjwA2uf+rGMGWZWy8fmfFhsZoOOzvUtDTsr6w47pgy++pxAHWqZP0/aLV21/zYHl7RPM43gBe50Ikfr6R/CXu+Hk2rYwpVqI0YlsRO/mAjnE/wwvmwKHviwEcJcA17aowvMV5MA3jP+U=
Received: from DB9PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:10:1da::31)
 by VI1PR08MB3262.eurprd08.prod.outlook.com (2603:10a6:803:47::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Sat, 16 Oct
 2021 14:18:54 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::21) by DB9PR05CA0026.outlook.office365.com
 (2603:10a6:10:1da::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:54 +0000
Received: ("Tessian outbound 2e7020cc8961:v103"); Sat, 16 Oct 2021 14:18:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 601299bcb29a2b1c
X-CR-MTA-TID: 64aa7808
Received: from 033fa98a8ece.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7A628343-029D-4F49-9F7A-EBA56B7A7F3F.1;
        Sat, 16 Oct 2021 14:18:47 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 033fa98a8ece.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 16 Oct 2021 14:18:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFsgauYLedrzBHlXUrk57dOB+/LdG1rrWPv2G9a/bzLzk8krcsEs40xQ3cppnRxQnRDkrTiDun9CZzpX68DFaD7yj4M+J30Bbwmji/TeOTiJ8vYE+YTpzUcsS92Qs9Lub7RMpJ25aOYv/o08ipKerIQAZpwz5WwVpoGaM/mbkFWx/o2KOlujBLprXg4/5Tl5TfnEhWX2epDJwNnxXC1rtXojvigl6qyX/hJwQhledYg0knA3C0ESRa5dHquGQKRMiU5oosO5zsbrfVYd4CRkmFAjXunAsM4ZfkZ456+J6KivVV0ZMVZ8XYnSfzzhnqPqohDl2ytdBK9eq0ERbt0x+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NARTcb8v/zI74dqsUxDXg2IyW1EHiQRFHKuudMgUpE=;
 b=WJhs9iVyR48Hop5NEC+Sh3mJu9xuFaMuvX7+jQnXsOGG0e/hF9XTR4KKb/xq5XQglh5Z/PaXJ1AST4TBT9+PFHzQUCixizDSRN72VXci1ycNZK7pg7IMANoYr+XpVUnv8GsfqudmOX0Ff+EgvYKwzliH1DdSdk+H66OGtSRQsl+skxDdOFfI5FnZuL9P5e5D4AjfvtSvkK6B4BOO1VynvqBakWcqIDKmgSYgptQ8k9LfRYOm32GaNcXSBVcXV+WJ7QN/3YCLQMOmrkFv+B5ndG5DJ+400Fpl4lKoRQZaPqyEk53aUjtaDzdEPiXo790xXf+Y5+xKFA/dMoYNIMdAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NARTcb8v/zI74dqsUxDXg2IyW1EHiQRFHKuudMgUpE=;
 b=8P0Dmno/Z9lPW02j+raSwm/9BC6phmzbjwA2uf+rGMGWZWy8fmfFhsZoOOzvUtDTsr6w47pgy++pxAHWqZP0/aLV21/zYHl7RPM43gBe50Ikfr6R/CXu+Hk2rYwpVqI0YlsRO/mAjnE/wwvmwKHviwEcJcA17aowvMV5MA3jP+U=
Received: from DB3PR06CA0026.eurprd06.prod.outlook.com (2603:10a6:8:1::39) by
 AS8PR08MB6630.eurprd08.prod.outlook.com (2603:10a6:20b:337::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Sat, 16 Oct
 2021 14:18:45 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::ac) by DB3PR06CA0026.outlook.office365.com
 (2603:10a6:8:1::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:45 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Sat, 16 Oct
 2021 14:18:43 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 16
 Oct 2021 14:18:43 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:43 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v3 5/5] MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE
Date:   Sat, 16 Oct 2021 15:18:39 +0100
Message-ID: <20211016141839.45460-6-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016141839.45460-1-joey.gouly@arm.com>
References: <20211016141839.45460-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a8656cd-dd25-4fdb-796a-08d990afe27e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6630:|VI1PR08MB3262:
X-Microsoft-Antispam-PRVS: <VI1PR08MB32622D2C75262AC1C6169A9394BA9@VI1PR08MB3262.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: gdb+x13uO58GPbAxLG6WEp3uVMOpsxSkpwi/gNWTK91OtezEfCDjSpx4z4v52HPyKSIygLiu/zGWRL+QILHTFVwXayF2Mz9c9JfduyS7ul9k1RSJRv9DzgztJh3+/RRzJEsw9zdiDQzzkMEUyEphF3xE4t/EJ9JhF/XVJ3Tq9VPMLzp5Onk4cuBpJCi4Wfg0Rpp0voH0u6uZO+jUy1vithMEUx/uZCTuLuBMRgSowRkwdumkxwxksJlXdVVMMnjPW1gtm9T9purvbfmgKr6AooXtp792BgQBIAksWFKBsEsa5cY84PreaOUr1JGsb29Mq9zydGeRQUv84xv5XxUSkolQwBYnPrgb/2ppYz+Dq3ePmYsfYZbaMmcP86+tcqw/NEVs0mVrMOhmlfKEOX52/Z+rdaD0zkzNs/rZYaEVvXRdBfyaGcZcvR6XQCBydUZdeSoVTp2uT5d814zKMih+7HYiAom3t2iKqLaiFPLIG8PjrVOqb6Un9Y/TgtRLFSxKVwbw8iNcVvX3T1P7KiIabwkm1t0X944trD9Yn31ps9Hg+URyBOtbGH3F+BqmcNF7UzK2kpv3z0PQ5X0BWVlG8VXoaI44Si6Bad2evH6W9BYV/EZnyVBDWpVndHu/aR4b60Jvl9/yzdy4D66ThNp7Q4qhLadq5ncZEP0+riLVothcsrx76eYN9JTX+GdG7xeI/qcEW5Ee63BCf89Uf4o+WkrFCOWgq/kBmg6AMexgVJH+SrNOqYLhVv26t041vyaiddTHGoc5bYUihRLyWAf5lA==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(5660300002)(336012)(426003)(7696005)(6916009)(2906002)(4326008)(70206006)(4744005)(54906003)(26005)(70586007)(8936002)(47076005)(82310400003)(86362001)(2616005)(316002)(186003)(8676002)(36756003)(1076003)(6666004)(36860700001)(356005)(508600001)(81166007)(44832011)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6630
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9e877e6b-b703-4df4-3c67-08d990afdd1a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FCCFtPBo0i3RzjtnQpUKjqWtkxchMAqyCz4nzQP1mmpgAoabQIYOPm14cpwk3Zveyman8zZiwlNug7trRDDr4wgM8I3uSqJAngx1gWWHrC/wmV0XJJLUMtdFwXZdv/ZY3FQy2ula9nP7UyJ0RWfoULXapjAJsTzopxzgufipEPNbwKOLBWOV+ybIkYVzysrlYzgkxo2xr3b9/o+UU7gOhv3HhKP51uAuVjFovxY5Wimnu4b4Eo0jHpZL9pzY1DYUmnE0e3Evw3YtsMfNzLbbHxEewK3eSVjihn04wjWHTaZf1Qnq1H0OEGj6VtX4+jDeVv3UjbYfRDspkKUXJEjynA6g4HV5cH/Ya0VAA+TljFbzmz5wZdIYtfxPQNFj/ILzS1ZxnQ0VigtIuI8ucMDhGp+Rb1UApxxCUpH8yc3ZPHI43IDpcXl+CzcDtFATOqcHnMHVQ+Ina3/qlr56c5IkYa1aUt0oN+S2CnVWGgUKeJeysb2sI9kS5qr4F7waNOjh1R+SgqV+GodH3JFdt+HqsamDRYKZ1SkosC+2oD3WfYZHcFaoqSXh/eWOA41gHktUGIH7OZNRYfJkgjWz4DeUalWc/So6yUf8mcOHu7t4LuwQwyhwEm9VT0yj1DW8uq4Vp6pa7eBby2YEU6P7Isob9Fj61bkfKqTZVYhK/0AHQjhHIDjdGTS6IsBVcLwfkRITTEX3/QQZo/ThBNbaH6JKdS2EAQDzXd5NDRMq9q/dfQk=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(36860700001)(6916009)(5660300002)(81166007)(2906002)(508600001)(8936002)(8676002)(54906003)(47076005)(36756003)(316002)(6666004)(7696005)(4326008)(82310400003)(86362001)(44832011)(450100002)(4744005)(1076003)(26005)(2616005)(186003)(426003)(70586007)(70206006)(336012)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 14:18:54.3151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8656cd-dd25-4fdb-796a-08d990afe27e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3262
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the Apple SoC pinctrl driver to the ARM/APPLE MACHINE entry
in MAINTAINERS.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca6d6fde85cf..e83e992b8ada 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1722,6 +1722,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/irqchip/irq-apple-aic.c
+F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
 
-- 
2.17.1

