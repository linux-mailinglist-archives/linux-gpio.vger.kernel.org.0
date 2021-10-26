Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F95E43B8C7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 19:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbhJZSBA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 14:01:00 -0400
Received: from mail-vi1eur05on2075.outbound.protection.outlook.com ([40.107.21.75]:36449
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233064AbhJZSA7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 14:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XX+eNwVNoeNqgUVFfpGVI2Xxbxx1np2VkWlXA1zOmE=;
 b=Y53OrI42zGBvM0ReR5qvA3+XI0Wo0IfMMFlSs27Fuw0+fhKNqSG9cj6BKP8ClPRL0EubxqmRKn571V2lkB3rdEkF8g8+x4gOGUjhDH8wRDSEUr3vFyBg4hOv5P4NB2iSLrAYd/ZTG0dTjelyFSG0GoMWK54iQZtVdo4OAJcnfP4=
Received: from AM4PR07CA0011.eurprd07.prod.outlook.com (2603:10a6:205:1::24)
 by AM6PR08MB3016.eurprd08.prod.outlook.com (2603:10a6:209:44::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:58:33 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:1:cafe::27) by AM4PR07CA0011.outlook.office365.com
 (2603:10a6:205:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.11 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 17:58:33 +0000
Received: ("Tessian outbound 8e26f7114b75:v103"); Tue, 26 Oct 2021 17:58:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fd9709543406de84
X-CR-MTA-TID: 64aa7808
Received: from b90697f003ac.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0784287F-0839-4DE0-ADA1-47A7DA243384.1;
        Tue, 26 Oct 2021 17:58:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b90697f003ac.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Oct 2021 17:58:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LN4Io5YXhypUIfKxmeXlrmNtm6O16edz2pTaOfdT4/xUVro2EKOvz0avGUNauj6SeCOVlu/PdOHxwany4tps2uWQ2lIr1S1VhRo4kliqkhaayDNOGHG4ktjtjBywcJ6pire1lqhHgWPOxZwNSz/c0kgFty2NVmpjfms6q7amOgH2dURWzYQ1ocjmKZI0s/DAq/X7VC13C3rfO1lA2oGs+KL4I4/fBIC43n5hxMRAU0lFQHrG7ggzMgA3wG5z9Ajr1ab2vaS//XitJzdZYt/t/GehRdo06wvqeJGsb06o7MSOIJIjerJdgvCB2wvPvf4ZbsCkMTZcMLHu4Znir2Gj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XX+eNwVNoeNqgUVFfpGVI2Xxbxx1np2VkWlXA1zOmE=;
 b=GL+HmSdaBeLniWYe5GJnissLEDHC12Io44daDpwIGChzs7PxB6edqhnSIYPWxttw6p7taqxgQP0q0P8V2NhM7v3r1ddNe2YoPgl/NbLOrtASJAscIwS205HeI60iZGOL7BgzpzJHYpWUYqLJFHRTTI5+R46ZD2Quf5byoWl/cNl1olLWwF/KmzsqRfmK6e0GuphW4bQSXYlPTFmKvX83q2ExQrY1Rh+1A6Y4Zkwlibu+UBOfqnZBMa8S6xkH/WpkwCswu2OyCyF9oBHlsD5Upp+syYBb0VLElNgVhR4tZqb9oVlkLaksGvVi0zCzXXCege/ILmw7ht+3+64THvc3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XX+eNwVNoeNqgUVFfpGVI2Xxbxx1np2VkWlXA1zOmE=;
 b=Y53OrI42zGBvM0ReR5qvA3+XI0Wo0IfMMFlSs27Fuw0+fhKNqSG9cj6BKP8ClPRL0EubxqmRKn571V2lkB3rdEkF8g8+x4gOGUjhDH8wRDSEUr3vFyBg4hOv5P4NB2iSLrAYd/ZTG0dTjelyFSG0GoMWK54iQZtVdo4OAJcnfP4=
Received: from AM5PR0602CA0013.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::23) by PR2PR08MB4714.eurprd08.prod.outlook.com
 (2603:10a6:101:1c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:58:21 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::54) by AM5PR0602CA0013.outlook.office365.com
 (2603:10a6:203:a3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:58:21 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Tue, 26 Oct
 2021 17:58:23 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Oct 2021 17:58:20 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:22 +0000
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
Subject: [PATCH v5 5/5] MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE
Date:   Tue, 26 Oct 2021 18:58:15 +0100
Message-ID: <20211026175815.52703-6-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211026175815.52703-1-joey.gouly@arm.com>
References: <20211026175815.52703-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e764a1e-1a4b-4592-42e2-08d998aa3a14
X-MS-TrafficTypeDiagnostic: PR2PR08MB4714:|AM6PR08MB3016:
X-Microsoft-Antispam-PRVS: <AM6PR08MB30161372E3B7759EA3FE631094849@AM6PR08MB3016.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WcriaNeVfxQT08+qbf/Gqpx5SFN93wb/GzZy0xgh/LyKVancMlOahddMZUnGuIsYLiDku7+ovZGobEtFmiF3h1kuwv0YzM1PPzQt8jJRvtDkgB0YgCU91eDNMHYJ1/HjJxND+lOzSMJT5GKtj0MZwC0+E1ohpy3F/p3oI4PlTjgyhBCNQo3ZhMNXKOdDnNhy0JoQpBN4pzuk4IMm60zTzIgl0jNCRbRGOlpq1A69EpVA8ez4u/bfugb7cazBuYGr2BE6ger/RDnOReoaobnuMUQjzTxJoq+2/nSVMrKC2HwH5zebSBs9nci7XJGr6ojWqZ4ReXnsIuZCAlijSglcmRojERCnmx2Fq6cHgema6MhLWR42BMcw7lK//AHgI6kWCqlPMX/nAuq9V/fRaudWw4x6h+4f3GMTYbQ6Ag/Z+YGp/G+Nj2YrhrcYYkvAddmj+ziD2pm/j20uNtodWaaYNsbUryTkSl0tXx7ljlBN4TeB5t/DyS8GrwT+LZ9pxM/gKvjMRXYA5d7xykJcTPcbATly6PvQCoOr6zzC5AiRfaRHQh/np8ttOYx20NUkPIeTJ5BZGvSRid7+u125O/XY/q+zC8hbRQCJ+4i4utprwkey9HLe/KOcdfndBWUqEU6QYiU2s2/hWzMTRaevMayxCxflLV/4cJOHB/Yon0I4W9FPH0d4RKoYNIbLi7DkIsFryXSDpTJABRfdjr+QqKF5ibjK6S1d5JZNIgNvobyQAJ68geJNST6zUrcTy5mR1md3uXT6DWTG5Wq1iaUrN+oakw==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(6666004)(4744005)(86362001)(8936002)(2906002)(6916009)(336012)(426003)(44832011)(508600001)(2616005)(7696005)(82310400003)(5660300002)(36756003)(36860700001)(4326008)(70206006)(186003)(1076003)(356005)(54906003)(26005)(8676002)(70586007)(316002)(81166007)(47076005)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4714
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4c6c5d0f-e999-4928-f688-08d998aa330c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A72bi708gRMY0rZG3mOJ8BaiypyJImb5fdIQzLS8dHYhx+i/wvZSCJeeFSJaQ+FzDPGvSFNhP9/VWklsXmQ3IYEs95z53XKuiu2PLZ7biJhXp3wj9h9VcLoiUHF+ZroKiXVncEkUKHMQneG98xVDD6ju4pGk07jY8YCHES4WCoBignpe8ejNUvo+XgrGTS6748nQP9VuS5BokxOZQELTEioT8sVcxYXsx7yX6FgTeBRAOsOqbYRaPxchCaCyYZt4ZBBkSTP4Z1XRi3YB/KCsiWpID6GwRUt54zjGYx+WmOOfp5BJU2MM5YeLsFlIi/+J1z4UL8nLYjGAln67DIgsf0MocSCnkju0kMxI0EQ/6B9voIW7BHfgrXzJe6jOyFhEpRUv622LMOAMkPXixQuyxeZVgCNC7FZD1NSMvLZgBj9PvBsV2tgY94T1SNlpbwmyYj0hIhQxsWFktnEIIo+bXK/RKTDh79S9lR3+L3Z+t/fiiFxM2VoRItiUE4ztuDsKjVF3kRgDFSEPLWGaSIQHkXJkX8OBMY+u4z1t47CUeqp4o8omlhRZJoBgBTlagY5Cmylk20LAxj5D0lzI6fPxVBkw8GG6G0oXNdY2UnmFNydMyyn3sc8rhirQytxQEXu/n0WmwdjGG87jaUvT99LrqoRSTUsZQHRCi4tFrSa9vgocLW1frTROXJ6H9BdCi++Rn1O9mJWuSvArSqfJWf0MRapDQqd3GvX8OfZkbTeQIb8=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(1076003)(70206006)(36860700001)(86362001)(7696005)(82310400003)(8936002)(54906003)(2906002)(4326008)(81166007)(316002)(44832011)(6916009)(508600001)(5660300002)(186003)(6666004)(426003)(336012)(2616005)(70586007)(8676002)(36756003)(4744005)(26005)(47076005)(450100002)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 17:58:33.4505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e764a1e-1a4b-4592-42e2-08d998aa3a14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3016
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the Apple SoC pinctrl driver to the ARM/APPLE MACHINE entry
in MAINTAINERS.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Acked-by: Hector Martin <marcan@marcan.st>
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

