Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4D541F58D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 21:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhJATOa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 15:14:30 -0400
Received: from mail-am6eur05on2058.outbound.protection.outlook.com ([40.107.22.58]:58272
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229753AbhJATO3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Oct 2021 15:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvh1Dn9xZkau8nPOAqQxdGefZm70XZAdFBuR94smgls=;
 b=n4TvqYkXgmhqLNsHBKjdD4wwaCo86wSkhcgX97OBSHIxUAdsh+1QMmVuBXd89NV8bbO0wbsAFtsr0L9ZDAwaT95fYCcv+hnHRPSoBTezCalI4wKBTYC5beh0PQyP4iIp9lGsxlkDGgsbmm1BITwIolcUKGhKRuyNHRnNsmCLPz0=
Received: from AM6P193CA0116.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::21)
 by HE1PR0802MB2409.eurprd08.prod.outlook.com (2603:10a6:3:dc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 1 Oct
 2021 19:12:39 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::29) by AM6P193CA0116.outlook.office365.com
 (2603:10a6:209:85::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 19:12:38 +0000
Received: ("Tessian outbound ac52c8afb262:v103"); Fri, 01 Oct 2021 19:12:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d2165f00c100d89
X-CR-MTA-TID: 64aa7808
Received: from 003d3ba022ac.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id A2FCBE13-5E40-472F-A9AB-50D6C3A002FE.1;
        Fri, 01 Oct 2021 19:12:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 003d3ba022ac.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 Oct 2021 19:12:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fD3mRt32u7JuJOYP6TINpUlClC5zWsJOsDgrHRkzeTx9P5qaXYX3b/urSajCnF8DTPow9zJn86VoaLJYc9oKXQWUSjkWZrBoaCuvj9fnk81PiXAmzKi9X7u2n+zzTaBScANsDOAfp+PZuaqC/4P97sedIxyujjbBaBZVKU8968j/cZSf6YaDMK68t4Kd3LcD5Ddrqe0ckfYBMPHvXk3bUtW4gOdL4gxpmot6sSBAAmuiJ0I7o2za75vDX2WZHI7iguWy567M/QIJbjoljXKr6/MsyRUqQdc1OR/Mz8vAnf2eoBISxl1ym6SWbmpKUXQxRBcOAZWiqBFSZ2QY/Po7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvh1Dn9xZkau8nPOAqQxdGefZm70XZAdFBuR94smgls=;
 b=f/IelHJsARzw6Qn/XnJA40+9vhoJYxypMxd69DeaNSXmj0+wgU5NpkgY1V5RkPJygqTWIFsbZXl+w2lM02bM2NMOg/2BRCl+FKOU+cxGDztMPUE5pKDf7PVtxZphQxN0PG9Es6KEYs7uI+m0Z5Vho6L0fPbPSAy2RwPHUpEFfeCRIvkJvYHhvqOvfz+1GIl5Ewh8Jl4BQFu5WmWbsKqEOFVFJqfN9yJa30SRG+jYTSxXVJJpkgSOqSbboy6AExD+lLxKtRxLaO+q4fB/0BM1sYX3tmshecE9bQ+SgSFU7Fvp5jdHXycbYv+UbPZqIRSHm40EG/1xySadzgM6XhCJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvh1Dn9xZkau8nPOAqQxdGefZm70XZAdFBuR94smgls=;
 b=n4TvqYkXgmhqLNsHBKjdD4wwaCo86wSkhcgX97OBSHIxUAdsh+1QMmVuBXd89NV8bbO0wbsAFtsr0L9ZDAwaT95fYCcv+hnHRPSoBTezCalI4wKBTYC5beh0PQyP4iIp9lGsxlkDGgsbmm1BITwIolcUKGhKRuyNHRnNsmCLPz0=
Received: from AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) by VI1PR08MB3710.eurprd08.prod.outlook.com
 (2603:10a6:803:c5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 1 Oct
 2021 19:12:23 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::d4) by AM5PR0601CA0048.outlook.office365.com
 (2603:10a6:203:68::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 19:12:23 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Oct
 2021 19:12:24 +0000
Received: from e124191.cambridge.arm.com (10.11.7.12) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:24 +0000
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
Subject: [PATCH v2 0/3] pinctrl/GPIO driver for Apple SoCs
Date:   Fri, 1 Oct 2021 20:12:06 +0100
Message-ID: <20211001191209.29988-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d5cfce4-d431-4549-1a1c-08d9850f6f1c
X-MS-TrafficTypeDiagnostic: VI1PR08MB3710:|HE1PR0802MB2409:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2409ED111ADC616625A7681294AB9@HE1PR0802MB2409.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PHjrzUa7Qas87UgHi3FYL/b3Qpua0hQcfZKL7MIQ8gQ96qHwvGFI2nBuaEoR1cyzZ2L8nJCSGhvbZ0RJmc3g/8lqyQt920EHECexUqimZ889vVGHsdsFtw410hQ/OT6Xsz0K+ckD+qRAZDd26raVddEhz2HPf1ymTIZsGEII7uKmu06VP4r75GJR9Vp08aRkSPfu7IXlwbUYXXYuM/gH6a2KXGpCv56ksrvSjjp6odCZSf4YEfpWE2VKDlgr2PI8CvV1DF6p2pJprG5NIK3J0CNXUW/rYFSynuce9NqeulAULrN9a+U6Xcc6hHBIfoOTC4oD68ltHsLLQTF46rYO+GRHiQr0dG3Uc1sWDb6YVX8YMdXXz4IbD5dtCIFi02Sq9O0+J2gi7HHlQ0P+/QTVOR7R6ZAagMnyiPO7OPzPdouGCMhD1lu2Io+IV6q55703oHqFWnhL6KNuNL6j3GnC12BNAoV/UXHTGqlGQzk8PjkDHREV5n/4CFRsMstsShvjKKQxlt720rdFv6ITaGXp/xtWjeEmXZL3joh6zT/w3xuHpiByusJZurdYbT9LWkkcfJP8pXVKPy9BP6YP1iGa0r/LeoCMuJI38QypkOZ+MfYCLZOsx4gHpHzzFbfBaFZL24pLUXj8oHYv5q5RdCcT94yqsDV8AeP+lDUQZtm532YdUvMkZNtCfmVMhLtWPhiiZD+c1CMgyua02bVgdp9JBTny5tjsTy0rIufBV5MZdE+f4WgvQ29Z/u34m4YPyF0crSQgzKTvtOUjV0Wpj94x2qWfmNJGJldjRZYHHOefcJKXxPxskio8j0Tutf4CR2JMr1kM7NiFCoQxFT1+T5gCdx71gHrg+NmWqUl0KAzKivI=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(46966006)(36840700001)(4326008)(5660300002)(186003)(316002)(44832011)(36756003)(81166007)(8936002)(8676002)(336012)(83380400001)(356005)(86362001)(1076003)(26005)(2906002)(426003)(6666004)(966005)(2616005)(6916009)(82310400003)(7696005)(70586007)(70206006)(36860700001)(54906003)(47076005)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3710
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: bf874049-c998-4918-3e23-08d9850f65eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: es0NqrVaKU1391nTim1FKNUGW/6B8wmYL2l12eEcWt7Vo/sfxWzYBPZqsTI79jS8DE2Nkxov2KPuHUBs1+5RPn/OHpgQch1Q2QgranCSSRuHqzgxovwFYN5H0aoLv9HUPGAiciiTqEeCcIfVNr0jqJ131U35w3jLuKPKF4a0VuiyL/vA6YbNtVBzMWzcdU4V4W4a55PTwOzuNUpCIJ6dJ16jKsTflpCLST3MPXBuMGQ66H6yxiCrvCMpUvGRNDHcoKGYi/wa91wpUnXS2bmFgK4HI7csLTThyZWpLTvqy6SFwUGaNFzMHBFjHhVnuOGKqucwKTzn5nQLabAGwGVNpzsTYQ/X7EQ6acKybGJzF6l23pNDbf6dsZV5HemGxJdx3UWe4jk4w2XRgH9yyxswq+E0amjQMCdNh/XdDnTzvZe2H4ZdA8kYO5eRp0aa+kCO6u65X2RZd2GutaXGyOxWu3wLsu1AEX6IKnk3xiCur52U1JlnQYSRHli+O8c3bWn/09mJ63fsAiR/nECMuf1qa8qnRPWwCq898fsL5VjsnV6izF7UX/1U0hyIZ4sQ1zfneDRtTyecfynJ0wpA00bi+DlsJb+nn/NtHNPMLBa4YCon88hKuqmvC8RZL0XFGMVOTqKgRrKXqw+b1keM2GWqjB7IlUAiYTSoOM6NM+RTIikeiO/uI5qnxtvO20TyObMR85ysrenipJ0ehHKJVxi72U8xA76zyfUs8kT9pJn8hFxaTc4XBzfU6TDCARfEH0K6pVjnl7+sS+ozwf7OMPwaRxo9odyVUKYYhLdluqMjQ9B1N/zZSIc4zlG1oqRupWTl+9Zy7LiTzpT4yRDWDYRAWQwFi6fuO/oQSs5Gh7Pm5io=
X-Forefront-Antispam-Report: CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(70586007)(70206006)(7696005)(5660300002)(966005)(1076003)(4326008)(47076005)(450100002)(83380400001)(36860700001)(44832011)(36756003)(426003)(6916009)(82310400003)(186003)(336012)(8676002)(508600001)(6666004)(86362001)(8936002)(81166007)(2906002)(54906003)(2616005)(316002)(26005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 19:12:38.3952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5cfce4-d431-4549-1a1c-08d9850f6f1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2409
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

Here is the v2 patchset for the Apple pinctrl/GPIO driver.

I'll be away for a week, and won't be able to reply to e-mails, but I
wanted to send this out now to keep progressing and maybe people can test with
the updates.

Changes since v1 [1]:
  - Removed USE_*_GENERIC_FN defines
  - Use apple,npins instead of gpio-ranges + dt-binding commit
  - Use _relaxed accesors
  - Use per-irq context data + gpiolib core commit
  - Moved some fields from apple_gpio_pinctrl to be local variables in 
    apple_gpio_pinctrl_probe
  - Simplify the register shadowing, by simply mirroring the entire
    value of the register.
  - Ran checkpatch.pl / clang-format to fix style issues.

There is a branch here with the driver:
  https://gitlab.arm.com/linux-arm/jg-open/-/commits/pinctrl_apple_v2

Thanks,
Joey

note: For those that have been testing this with PCIe etc, you will
probably want to also include the last commit in the following branch, as I
dropped the clock references in the code (due to the switch to power domains):
https://gitlab.arm.com/linux-arm/jg-open/-/commits/pinctrl_apple_v2_clock

[1]
https://lore.kernel.org/linux-gpio/20210921222956.40719-1-joey.gouly@arm.com/

--------------

Joey Gouly (1):
  dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl

Marc Zyngier (1):
  gpio: Allow per-parent interrupt data

Stan Skowronek (1):
  pinctrl: add pinctrl/GPIO driver for Apple SoCs

 .../bindings/pinctrl/apple,pinctrl.yaml       |   4 +
 MAINTAINERS                                   |   1 +
 drivers/gpio/gpiolib.c                        |   9 +-
 drivers/pinctrl/Kconfig                       |  16 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-apple-gpio.c          | 561 ++++++++++++++++++
 include/linux/gpio/driver.h                   |  19 +-
 7 files changed, 607 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pinctrl/pinctrl-apple-gpio.c

-- 
2.17.1

