Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2631B4302EC
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Oct 2021 16:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244366AbhJPOVQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Oct 2021 10:21:16 -0400
Received: from mail-eopbgr60077.outbound.protection.outlook.com ([40.107.6.77]:56485
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244361AbhJPOVL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 Oct 2021 10:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yt1R7mPV/rI5riONKdDiNcw+ruhv0R7vywwpssVH1E=;
 b=karySlwKsM9Ij5YrH8B1YhLw7wJ7dn5Ml2JcNJeS+15rwicHyPU3M68SOhKhOT3nnGylfA1QSURHsOILC073PmeUsxIS+uiW3Eo9y0rPqcrK2HhIgPBonnYDaMDsuyQHPQffTnYe86JtIlKINnKHWof1ZpHQzU0AjpIxe3mPb1Y=
Received: from AS8P189CA0024.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::29)
 by VI1PR08MB4365.eurprd08.prod.outlook.com (2603:10a6:803:fb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Sat, 16 Oct
 2021 14:18:54 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::73) by AS8P189CA0024.outlook.office365.com
 (2603:10a6:20b:31f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:54 +0000
Received: ("Tessian outbound 8e26f7114b75:v103"); Sat, 16 Oct 2021 14:18:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60f45088ccf1e7a9
X-CR-MTA-TID: 64aa7808
Received: from e4afc1a39efa.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id A18DE2A5-514A-418F-8724-FD5E675130DF.1;
        Sat, 16 Oct 2021 14:18:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4afc1a39efa.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 16 Oct 2021 14:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvjOknLDmXzKGritDEiWsiO1BvS9uCN7YWqURAxjGW/Lfjb6wz8EGSjZUfTLUVZ5KfMOyrgnGPOchbZfKV4ce4xtPPMozzMss6O6tDMcQiI/u0ldk3zYlFoOxMgETSqAsBwBd1+zPiBSySDzzQtqP5EUXcRqumSt809Fv8lkSefGoI9eYn8Ho4EAVhAOf3ZN0PKkMBnqBRavKovVIQLUs9DmCu++L44FRbgChlHtT/H5wlzzh+UW5q5RWEV0x1TuncvVqunz5E11tJ0IulafnngvX++lxkkQ4rZzvVujg2LfQfz98i2tt29qTZnChay41T5KAmuZShez4ZSbC9BZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yt1R7mPV/rI5riONKdDiNcw+ruhv0R7vywwpssVH1E=;
 b=AW1IeSpp52KkvYEPk856ffO6n5qgrXN/iOxCxTVCmlbD4RHA39pRswlZVD+6+7xXd/lST+68MZtr+vjLjAURzyrm2IL6XF7KY19oJMQCGhvDlXfK4gbxC3Z3K0QuNLiild0G1N7VkK2XtpnVPwG7v4fcj4vZjrtASnIybYhlGTnC/XG0AJBauwiL8CVx8lYZTOKfX4dOYqMCh3lySDfNHOPp0++jYAE/RR5PiKcjJ6MAkQ/6GRQv1E5nWxJA+UgklX0N7Nui2uyx9BJPl63LS7g2X8c1jKKRcMaz2O6R8VALuBSpZwplGSXyPUxNrdHR4V5Sx/dQ9iO9hD364jl4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yt1R7mPV/rI5riONKdDiNcw+ruhv0R7vywwpssVH1E=;
 b=karySlwKsM9Ij5YrH8B1YhLw7wJ7dn5Ml2JcNJeS+15rwicHyPU3M68SOhKhOT3nnGylfA1QSURHsOILC073PmeUsxIS+uiW3Eo9y0rPqcrK2HhIgPBonnYDaMDsuyQHPQffTnYe86JtIlKINnKHWof1ZpHQzU0AjpIxe3mPb1Y=
Received: from DB3PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:8:1::24) by
 VI1PR08MB4557.eurprd08.prod.outlook.com (2603:10a6:803:f5::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Sat, 16 Oct 2021 14:18:42 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::a2) by DB3PR06CA0011.outlook.office365.com
 (2603:10a6:8:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:42 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sat, 16 Oct
 2021 14:18:41 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:41 +0000
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
Subject: [PATCH v3 0/5] pinctrl/GPIO driver for Apple SoCs
Date:   Sat, 16 Oct 2021 15:18:34 +0100
Message-ID: <20211016141839.45460-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38eb4d30-2cb6-4d6a-ff5f-08d990afe25a
X-MS-TrafficTypeDiagnostic: VI1PR08MB4557:|VI1PR08MB4365:
X-Microsoft-Antispam-PRVS: <VI1PR08MB436597E8F5D8F28F63AF15EB94BA9@VI1PR08MB4365.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mv3bi1Zbv3YX+5jLDSCcyhZlFR+lrJqGqhb4j+AP6BpA9ZkrxY0pq2S9CBfG5DmMOsVyJCMZn/pYT1pBQ7rJ2M+BU/SStdcErrkBKGLAUqnkWugqoUlDttxrvPSuTzOWZpDGqrBfwn4LhUi6qjbbHimYOhDCGY7C+FFFZp0R1L2vsotgVuDrU3iPK8jmMLR1AoUF03b9MCI3WcPWcun9Ke0ldScCQR+NKA82FxxYCQ8+mOcYzSoXr5FatDbtODDwj7j1sByqNTj+G01FrDn4vED/9Qb6sCAZiMJavfKiroOrcMwDGGKmSPoFcV7qmCCPQUfeMa4jOgmMWz9EOfEPwzVNDKRhSlGEoeBZ/ZsVBCv3ZO9mVCW83sqMppXMWal6uu7ON22cIs2DyR4iPkaVo3xqOZz7t5GTE27H2fzyw3REL3gKYsEFo4yhgmZK0VjGv8tbhvj1c6254Seck3pc+01rnwnSHd8p91aNYNVZ1nNJL7DOEvjq5MB6a+0a3eN2kCwHcvkiBEST19tLfYdJkdUI4DygrhDX5TzjfouWiUaAHb9bOVAcOUnUD8Ox+opVf1xUd2wWflilQtZgC3jyKRiLXbZ2z7FdzqAImD2QExvu5adDY9nnEvJlw5RD3MfUYco5UGGsR8p7tZ2VWoDP5XWpIw4VtNTHCpEL8KMnj2TP+l6ljGiWIV7rff9klJUYG2EMyegDwNJaRvH4gUEt4ZC1EfXMOab+DwYjKaAvEvhs+fBFzEByLzaMho0KSPrjkWl3dl+AOVIzLR6/AU3G/uYw5pJmqj1EIpgIwZtMFphazw5QDEQxrcv8yfktTCprhS/iNw1j0iQOEYDxtnbObKDX9Mt9piUdsqIPdSIzhviYfoSGuERO5h0usiti9Uuh3DBq8ApeVhNDTJrSnW49Ng==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(36756003)(54906003)(186003)(7696005)(44832011)(70206006)(36860700001)(508600001)(2906002)(6916009)(1076003)(5660300002)(426003)(26005)(2616005)(82310400003)(316002)(4326008)(336012)(86362001)(83380400001)(70586007)(356005)(47076005)(8936002)(8676002)(966005)(6666004)(81166007)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4557
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: f0f1b361-7412-4e14-7819-08d990afdb95
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ozLvdp6tSoBn/x+RZ+6LVZlU3kAW611vBp7KpU4aXw6OIfi3raM/6jQ+tAhMnZewPEPXwdp+b2vfmc6tvlKmTruuesi2QyKoy+7hyZI9im8Wo4ke6Pd0ENPdspjukMCAsHA0czfp92FXpz4fpcEOAJkS1bSrFpHKzSzrrkljXMTdWtk1mzDXXseo9dpPcsYztrQJNo/t/sABEtckj+5FNx8kGrm3xkoIlwXQ1PqWYh4ipYmZuom9dGnIpU1U5BJyVKhRY7brY8m0TmobgXYYSHLy8EH2U+JA6GALr0e0hU4uG5Qkq4UswPNjoSHOe+DUkmacfjLtyYbBtEpLP1TM9UEMEezWtQaH1s4csV84w1LUbOAX/D1bcLrimQmtPzi5R/xe6s7hKStzHIADaywCu22mk9r60zQORnf7inzysL872z9xUeSLQhe8jEKSrBGK4ZhnR5ljWEX8VKhT3oBGy1FqLr/RIywKoOq6bsRl6fSi65fUY7c3L3Hj0O63js611p3vJ7Vvhxp3wI/nIGjvxJXDgYarZoDpi3/OiDdcyCpJmbQCu8B6zot3VPUloi9obNhEH2b7lofp2mX9zTN5WDjjBJ0h9xNXWq6jRzWswoAApONNvCrkVssr7Pu6M8ScpjWLb1U+nDHfwYmB4gnUrwbvNJT+aqtBLs4NLQ6m+LSFJyF/A4wZqtUAYqG7oAW3QDnDag5VDFnnfOvQwE4Z4/4vN4UlmPrtXNd1ls0t9qlGFD6hZ4Yug/m1MK7z2PonqOJwjqSWNhOspLt56Ok/lRVL8b5gt8Ppo3oMPpKK7PgDp/ZOZrc/hpAD/R3qKIAECIGYeTHUtJceOpXO0G83jF6fbbS+xmqXEPsH/hG+13I=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(508600001)(5660300002)(83380400001)(2616005)(426003)(44832011)(186003)(8936002)(36860700001)(8676002)(36756003)(966005)(86362001)(336012)(2906002)(1076003)(70206006)(70586007)(6916009)(54906003)(6666004)(81166007)(7696005)(82310400003)(47076005)(26005)(450100002)(4326008)(316002)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 14:18:54.0138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38eb4d30-2cb6-4d6a-ff5f-08d990afe25a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4365
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

Here is the v3 patchset for the Apple pinctrl/GPIO driver.

Changes since v2: [1]
  - Document apple,npins property (passes dt_binding_check)
  - Add #interrupt-cells to bindings, asked for by Sven
  - Redo macro defines, add register bits (that aren't currently used)
  - use regmap-mmio, to remove NIH shadowing
  - remove weird INPUT_ENABLE dance in apple_gpio_set_reg

I split the MAINTAINERS change into a separate commit, Hector Martin has been
collecting those in his tree, to avoid merge conflicts.

There is a branch here with the driver:
  https://gitlab.arm.com/linux-arm/jg-open/-/tree/pinctrl_apple_v3

Thanks,
Joey

note: For those that have been testing this with PCIe etc, you will
probably want to also include the last commit in the following branch, as I
dropped the clock references in the code (due to the switch to power domains):
https://gitlab.arm.com/linux-arm/jg-open/-/commits/pinctrl_apple_v3_clock

[1]
https://lore.kernel.org/linux-gpio/20211001191209.29988-1-joey.gouly@arm.com/

Joey Gouly (4):
  dt-bindings: pinctrl: add #interrupt-cells to apple,pinctrl
  dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl
  pinctrl: add pinctrl/GPIO driver for Apple SoCs
  MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE

Marc Zyngier (1):
  gpio: Allow per-parent interrupt data

 .../bindings/pinctrl/apple,pinctrl.yaml       |   9 +
 MAINTAINERS                                   |   1 +
 drivers/gpio/gpiolib.c                        |   9 +-
 drivers/pinctrl/Kconfig                       |  16 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-apple-gpio.c          | 564 ++++++++++++++++++
 include/linux/gpio/driver.h                   |  19 +-
 7 files changed, 615 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pinctrl/pinctrl-apple-gpio.c

-- 
2.17.1

