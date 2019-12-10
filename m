Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27B441185F5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 12:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfLJLMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 06:12:21 -0500
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com ([40.107.93.51]:57249
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726915AbfLJLMU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 06:12:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzkYRoRvXzCDZplfNzotJ6/H0S8WLkk1EpIw6ORQxifF883RaUI6pi2aRUiWG75FC0dzLWuZqq3770kAmBD53VU/5+ojHfMO8NshLIeTqPhiPtn9M+lQTKN3vt7E+d3EuG87CIDku12xubzEZpaXuyKMV0wUczaADD2TTy86LgbLTi7OhabrVhlbcX8c6eno+lo+CZ/7nn6e0h6ZfedwDzZ8HdXBPQCNgDD2pbDjOsoOzW8GOTj9b/utzYQKSoiZVtcUmVjAcuJFE4vYBDB82M7M0v7DBMGPFOUQuDqzCNRhGyrkORcz28iZh8lvWJTVCeX6SBNGrDrUjsJ6OVFViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+ftaHXA6rnHHEgYtPLs4V3TGx654g7b/zAmMUjpd+s=;
 b=EQvSzu/JukaL5KTr5SaqPm+V4ioPXi/D3F1zJnc9lUZMo/xlkh+ThPttuwU7I9Ce2xSj055U9r6yELE8VpVA5HfTnT4/oCZyuDIgYiE6S3tXKVyON8Clfc5KoGFWvT7GPAkbvy5mIJuFrWaZ2tSh8nHSZ+hL9KvVstJJsQDimJ1SRjVyydZBeeJjwBB8xzD+Siy3hjXqJBVRsD5GuQD9XZ6M7P4CwE3uQww+igR1pileCS3L5GHQTOV6Tu9r+24VrUpcxt4Awc57LqIlDjy+zaWl4cJMH+2TaoTBgDsuYedMlw6Fo6joNTtbwYyRBAzvDcW/vXMB/pgvc2WKFuCFAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+ftaHXA6rnHHEgYtPLs4V3TGx654g7b/zAmMUjpd+s=;
 b=ULEK9X9EbxznMH/RmZAKso+slZLwwmyeGZodBhysYCYn3eTP4qRPHPFLB8dZZQenPYh4DtjC7D1RyvuA3LSiWDYt9kFRgLG9rbMqwTqVLbQZPJ5HK8twYWm3RP7SUg+/GfgHyfpT9OT4AM4sQvYnKZByIEOTJtY/RXSClcOlujg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3656.namprd13.prod.outlook.com (20.180.4.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Tue, 10 Dec 2019 11:11:38 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 11:11:37 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com,
        paul.walmsley@sifive.com
Cc:     aou@eecs.berkeley.edu, tglx@linutronix.de, jason@lakedaemon.net,
        maz@kernel.org, bmeng.cn@gmail.com, atish.patra@wdc.com,
        sagar.kadam@sifive.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v4 0/6] GPIO & Hierarchy IRQ support for HiFive Unleashed
Date:   Tue, 10 Dec 2019 16:41:08 +0530
Message-Id: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::14) To CH2PR13MB3368.namprd13.prod.outlook.com
 (2603:10b6:610:2c::26)
MIME-Version: 1.0
Received: from dhananjayk-PowerEdge-R620.open-silicon.com (114.143.65.226) by PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Tue, 10 Dec 2019 11:11:32 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [114.143.65.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7fda11a-cdce-4751-ea98-08d77d61b96a
X-MS-TrafficTypeDiagnostic: CH2PR13MB3656:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB365677E52E2FC2A541B3956B8C5B0@CH2PR13MB3656.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 02475B2A01
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(6029001)(396003)(39850400004)(366004)(136003)(346002)(376002)(199004)(189003)(36756003)(66476007)(1006002)(107886003)(52116002)(6666004)(66946007)(6506007)(26005)(956004)(316002)(2616005)(81166006)(8936002)(81156014)(16526019)(186003)(8676002)(44832011)(966005)(6636002)(5660300002)(86362001)(6486002)(7416002)(66556008)(6512007)(4326008)(478600001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3656;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jq126DPC1c7G97V4VVCA95CgS90rkO6iHGGr7UmCy3k78t5ZiIyD5BRfbbFPXmJVcpvsd9NAhsV3eur0fpooOY7p1tMG7f9WNhdby3vez1mo+5JWxox5ugyUllxbh7FKzHbOFxPA0Ikh8q2h2tIXNb1oiq+XQ8Kx4Gmj1pKWA/4ackKoRoTzyPoyyKIAKmJS94oMOsjNWG9/82TFVD4XzFPFoUxyp67nJ/DV/h/Ki38JPpVtX1TkWkUNYEYQZHwqY5b9V7ccirAtORy95Ey5Kg+eLeNOdyNHOnPwSzpmg9DtbPZAyQ0M5XjDCY3FXEzMfTAMLJfmg+N+ssNa/KLRzDiEpKmW6f/ZNok9RCJYyh/mhslCxzFXM6k6bZaF+NEsZpNPMODhre7sgyG2qAuSSJTJgKRtTrOcOf1EXpuMXh+PSKQl80eDZ7QG+O6bdghZw2FPcDW11hvCXpuELYamC+mdRRQALOzjJmk0WJ9gm6k=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fda11a-cdce-4751-ea98-08d77d61b96a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 11:11:37.8572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwkgpWrFxnN/EyThHp01mQMVS3kEg08kkjZZ82mcOWxRZv10Ry1U6k1Fn+GHsTKYRkW0xIhM4F9de3e+JhBLlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3656
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series adds GPIO drivers, DT documentation and DT nodes for
HiFive Unleashed board. The gpio patches are mostly based on Wesley's patch.
The patchset also adds hierarchy irq domain support as it is required by this
gpio driver. It also includes the irqdomain patch to introduce
irq_domain_translate_onecell() and irq-nvic driver patch to use this newly
introduced function.

This patchset is based on Linux 5.4-rc6 and tested on HiFive Unleashed board

Changes:
v4 vs v3:
- Rename the DT yaml document to more standard naming (sifive,gpio.yaml)
- Drop "clock-names" property from yaml document
- Add "minItems" to "interrupts" node in yaml

v3 vs v2:
- Include patch for irq-nvic driver to use irq_domain_translate_onecell
- Remove unnecessary inclusion of header files
- Use a single prefix for all symbols in this driver
- Rename the "enabled" field of struct sifive_gpio to "irq_state"
- Remove unused variables and locking from probe()
- Other minor changes

v2 vs v1:
- Add patch to introduce irq_domain_translate_onecell() and use it in
  the sifive PLIC driver
- Drop the usage of own locks, instead use internal bgpio_locks
- Consistently use regmap for register access throughout the gpio code
- Convert the GPIO DT documentation into a json schema
- Other minor changes based upon feedback received on v1

v1 vs RFC:
Incorporated below changes as suggested by Linus Walleij on RFC version of this
patchset[0]
- Dropped PWM patches as they are already merged.
- Include "GPIO_GENERIC" and "REGMAP_MMIO" in Kconfig select option
- Remove unwanted inclusion of header files
- Use regmap MMIO instead of customised sifive_assign_bit()
- Use GPIOLIB_GENERIC and bgpio_init() to set up the accessors
- Use hierarchical irqdomain

[0] https://lore.kernel.org/linux-riscv/20181010123519.RVexDppaPFpIWl7QU_hpP8tc5qqWPJgeuLYn0FaGbeQ@z/

Yash Shah (6):
  genirq: introduce irq_domain_translate_onecell
  irqchip: nvic: Use irq_domain_translate_onecell instead of custom func
  irqchip: sifive: Support hierarchy irq domain
  gpio: sifive: Add DT documentation for SiFive GPIO
  gpio: sifive: Add GPIO driver for SiFive SoCs
  riscv: dts: Add DT support for SiFive FU540 GPIO driver

 .../devicetree/bindings/gpio/sifive,gpio.yaml      |  68 ++++++
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi         |  15 +-
 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts |   4 +
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-sifive.c                         | 252 +++++++++++++++++++++
 drivers/irqchip/Kconfig                            |   1 +
 drivers/irqchip/irq-nvic.c                         |  15 +-
 drivers/irqchip/irq-sifive-plic.c                  |  30 ++-
 include/linux/irqdomain.h                          |   5 +
 kernel/irq/irqdomain.c                             |  17 ++
 11 files changed, 399 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
 create mode 100644 drivers/gpio/gpio-sifive.c

-- 
2.7.4

