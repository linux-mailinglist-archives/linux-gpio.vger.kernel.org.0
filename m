Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437B343B8CF
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 19:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237991AbhJZSBQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 14:01:16 -0400
Received: from mail-eopbgr50080.outbound.protection.outlook.com ([40.107.5.80]:52097
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235574AbhJZSBQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 14:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Chqs754YHHtfq3U3sHYkci24EUdYmjUU1iORJX7wLoc=;
 b=i0wL07bWNeqtBIW85Mvx1rx9MMeh8LhZqXJnAMBmwbr/dnWUt2nFPL+bMuUwz6mTerc3eX6qeW+6DAp3xYsviAZCdlkaU+edUjPkwBA1Q2V8rxiTuJfR2nI2PmC8L8TQnXrlOpooOustNg5gO1Fiu+58KiRp6Nvg+T8XlGf8K5I=
Received: from AS9PR06CA0337.eurprd06.prod.outlook.com (2603:10a6:20b:466::13)
 by VI1PR0802MB2349.eurprd08.prod.outlook.com (2603:10a6:800:9f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:58:41 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::a4) by AS9PR06CA0337.outlook.office365.com
 (2603:10a6:20b:466::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 17:58:41 +0000
Received: ("Tessian outbound e27daf245730:v103"); Tue, 26 Oct 2021 17:58:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2476de55f6d3240f
X-CR-MTA-TID: 64aa7808
Received: from 172cdf31559b.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id C1D59E75-92EB-44CC-BFE5-AD42A7A6AA70.1;
        Tue, 26 Oct 2021 17:58:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 172cdf31559b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Oct 2021 17:58:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BybUAL/qk6ulhmlsqA8Dc5nlp37+km+BDoxmQIn1ps1NRfMhPXccjc5MayLPXLhHSd6pIHNdncAlpe6Jx9ypaBU0mtCxx/MCd3WMkS15lax+s1C2teCMMHMf3bxMM2vu0hs4umZhVKuXLks417iV4iG2v/3z9Vne0WUG9KPV8+0hkdF7YrNc9XcyGjxgVdCyI08FFQPe9475L66nADPs5rrrVLB3R29wZxP9ZGqYZj4Z61LkhYau/CC+DNg1kPrpTIOWWaTAFNhIE6c4rhwnHoiL1vcSQD1ll5g+J1L61TWUHGpLSO2VZCU3DADo/hpCYg/9pxn7zUD/uc3RkeMEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chqs754YHHtfq3U3sHYkci24EUdYmjUU1iORJX7wLoc=;
 b=T6hGT3IzLJMqBU97QfuShIr6fnbroXvhXGY5+9BdHscOSKeMbt5qDRDQgMGX/CCyNrmK1jxe7BbM2RbN1ymtar1K0qj7emPISPoajGWyuRUb/MriUZnddm9S/RW/nj7jwakC/5vhfvOQK9YiTbBDIhxkKAp8XfQQZ64oqOIvT4fntllnu8v0S7pQzQ/CtIaXleZhWK297bSvqMmNHyT2G3s+QcKnjTn4FfM+K4QFphlYBjOdY06zWiT2bk6Hes+o/Jj1fjl4zxmUqCicLPrwTNQCSEpJ46moP5ew2+kBpj8lRNw0UsB5Z8NYId8XdgPGaZF8XeA5VyFr/iSUiF8czA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Chqs754YHHtfq3U3sHYkci24EUdYmjUU1iORJX7wLoc=;
 b=i0wL07bWNeqtBIW85Mvx1rx9MMeh8LhZqXJnAMBmwbr/dnWUt2nFPL+bMuUwz6mTerc3eX6qeW+6DAp3xYsviAZCdlkaU+edUjPkwBA1Q2V8rxiTuJfR2nI2PmC8L8TQnXrlOpooOustNg5gO1Fiu+58KiRp6Nvg+T8XlGf8K5I=
Received: from AS8P251CA0015.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::14)
 by AM0PR08MB4179.eurprd08.prod.outlook.com (2603:10a6:208:12b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:58:21 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::d3) by AS8P251CA0015.outlook.office365.com
 (2603:10a6:20b:2f2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:58:21 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 26 Oct
 2021 17:58:21 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:20 +0000
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
Subject: [PATCH v5 0/5] pinctrl/GPIO driver for Apple SoCs
Date:   Tue, 26 Oct 2021 18:58:10 +0100
Message-ID: <20211026175815.52703-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 355eab9a-88aa-4d2c-4e25-08d998aa3e98
X-MS-TrafficTypeDiagnostic: AM0PR08MB4179:|VI1PR0802MB2349:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2349F26F27B5B83F156A9BBA94849@VI1PR0802MB2349.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WVnZro36Z542+3hxCd5p9u+QeLxxkXneEBXfk4dxecpWYbNhBFEINTqLWU/J4X3UxTon34ahMLcLWcRx0C1KLnfkLH61QfpqQSC0Om3gBf1ffSCNf72gCLcsQso7zEpcAJYikgiI7Y5m+/acuHVQ+GmAqaWnTAD9WJw32k7ZEFbyNaqXBjgQzKxLtRn+ahPvMCIRP280Rjxb4fTwYRET4yetNCv5aoTd2FdhPV8JwhcQ5ZSrEed/AFi0s3/MjS2vOZF1/ybJ8pN+yxVkxnvUZNJj2C2ESd1L+mYm68edJCP9beD2vvYro8I1LqfjxCzaZOXsqNvrIfHyZdEbfV/i3RZVTvhovIW7Lp792qvi7YnbLaS7hV4eHLoXmN/FMv2AsUkTVaDxhd2cgr3uNAi9ywjyVjJ34WpC8IMdUwG3pvoNKKbJCZK7qbEb9ZBGvboXv67O+qBdn105lmJmuIjMQ/KfP5oIHxmUgou1m6WW+08Ooo2/DbCiflMiHib2L0cA21LipO33Na5GhLizbl0nWDL9HmMGoJi/t4a2vXU4u4AifWyefXq3m9B//SoRi/byeRXhmdSX4xlZWXfLXMglSklGWS81ez8ml4xwK7MyRuut8FUEF71ZSlFFIk6TVFZT1+J4prD3A48lnqKD6yXzcPg+jOiqcGUdVtOFu5G4/XGMKaceOjcXbvQpqBPDa9JDmjHl4L7/hmmU+9ijPTw7yfJzdcD8uNUQgVvh2pyzh80v1Ebjvpg3LNiMJLa49Xu3E0CyqKcFt6h2QW4FhOtBhKykrX/lSP7Pav2yEIHlnYDbTF9YddSwJluJUL+cP9xg+VoqkiKhg9cI0TV5zAyHiITyEPvCDtaJo8cQP4D0Gvb6ArKxv6eapi2P/Ro1oQLPDP46aWOY072qChzr4fRF9Q==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(7696005)(186003)(2616005)(70586007)(6916009)(47076005)(356005)(508600001)(81166007)(8936002)(966005)(36860700001)(36756003)(44832011)(1076003)(4326008)(70206006)(426003)(5660300002)(82310400003)(336012)(2906002)(26005)(83380400001)(54906003)(6666004)(86362001)(8676002)(316002)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4179
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1a28fd27-f8a6-48f9-ef15-08d998aa32ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 78wmvLJ70KiETYYyiKkLL2iVqJYUZLwHgqzdrqvFRTU759mRKA+FF2mbqDDJIBGLhgacDy+30xyenaPoBtvSgNapGmLh7WchHzz/m621npcBfmEJMSh5HS3nUMe09PB4XIl+le+jRJopObvn5vk4JMedmGAVbX2mLw6aSD+Gd5BAOj75SKxLL3kVX1MinTZWnbH3BblYyXQtQDmVqHQKgIE0xe6tOUrxtrZF3Pq1ACEpaMhcCs3JyYf1oYf/WkMhyOJa7HtXBdCWmnSx114mVxH1ArALY+UWIgdE9OccMQd+QOojOUAWxA9LbpC+IouFtL9JjYGFD5vNsJj5Z3lBHnwll8pDkxbMY9U20HTRPws/kdtY9u4M2SmAB86yo/8uu0gVSRDnqexqRv1UDnpwMM3ssvG8zv7AC1AVqIwVMyRcM7kDNUOpPLpeEVmNgvhDCFED5TnJWSoLAPx3AKxPsw84QuD2njdqhl1dRPBuU0HczYSrXtPAEIKxI1mSTLZYVK0w2VUVgR9KqCYHZ6XRVwUtGT3c2746P/88CM19HaFZf43PUA6bMZkoxcT5tYNibiII9Swl/T6cWnvh9U7Ti6QlnU5WjbOACgEBhR/S0MyVUUBz5hzy0b0CiDF7spwcnoHxYzT1UqrIsOOPXLlk5B5D1aQAOSSf6DieQj07nmzW90QOcdzReZFbvvtDxmoEpamGGMb7CEXwKAf4H/+VP7pCP4PdsjsLnoCS7KQ7SRM31Rtyi7AH3OaC24sN/qH/jIa9eXbqDneeFtdbrCxvDMZ7TZKz/Y1nPtz9ROVqMnloqzHQBVWNehd1WBrWKrUJvuQRt4TJU72w+cbCk70F5T1HNKyGHNhenfV1Sd61K6o=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(8676002)(8936002)(44832011)(86362001)(6916009)(2616005)(316002)(1076003)(336012)(54906003)(2906002)(450100002)(4326008)(81166007)(426003)(6666004)(186003)(508600001)(36756003)(47076005)(36860700001)(83380400001)(966005)(5660300002)(70586007)(26005)(70206006)(82310400003)(7696005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 17:58:41.0217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 355eab9a-88aa-4d2c-4e25-08d998aa3e98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2349
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

Here is the v5 patchset for the Apple pinctrl/GPIO driver.

Changes since v4 [1]:
  - Renamed functions to remove duplicate 'gpio'
  - Create all 4 functions (gpio, periph1-3)
  - Applied Acks/Review tags

There is a branch here with the driver:
  https://gitlab.arm.com/linux-arm/jg-open/-/tree/pinctrl_apple_v4

Thanks,
Joey

[1]
https://lore.kernel.org/linux-gpio/20211024101838.43107-1-joey.gouly@arm.com/

Joey Gouly (4):
  dt-bindings: pinctrl: add #interrupt-cells to apple,pinctrl
  dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl
  pinctrl: add pinctrl/GPIO driver for Apple SoCs
  MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE

Marc Zyngier (1):
  gpio: Allow per-parent interrupt data

 .../bindings/pinctrl/apple,pinctrl.yaml       |  10 +
 MAINTAINERS                                   |   1 +
 drivers/gpio/gpiolib.c                        |   9 +-
 drivers/pinctrl/Kconfig                       |  16 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-apple-gpio.c          | 534 ++++++++++++++++++
 include/linux/gpio/driver.h                   |  19 +-
 7 files changed, 586 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pinctrl/pinctrl-apple-gpio.c

-- 
2.17.1

