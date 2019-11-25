Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11FFC10887D
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 06:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfKYF6C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 00:58:02 -0500
Received: from mail-eopbgr690051.outbound.protection.outlook.com ([40.107.69.51]:8004
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725468AbfKYF6C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Nov 2019 00:58:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KN+R9+mxIZYpsA7T3MQf+TRQSppMQtvcvb0r8kyurrXqdwMaDpF4+ZcRGRQwqRA/e/oPHdZuw9ZyzaI/lA8Du1QKJCxBcGvfMgjPl73jAn0SjxbzitZ63nMF60uvw1oweTCqbEMzYhAwW6SIwJ4oeLPD+7jKAeGdVVEe6Kne9x/eaiaOXWupyb2OkDMMYPSv6i1+HkFvWPqQ9Nr1WZKjCiz0U7vrdn/RRghCsmhZaNLWnCe8bOJBk3O7QMDUQLUZIz7vgRyHttW89YbjJZsInxncHxcwC9CTuBkc1NUhPjPXvzd4F3GR5qVcFw3Tu8v5X0nwt/A4Vdj+TXPT5jtpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oGUqIma0DRISkcM1XRPGcZzb/uCEiVF+OqbnloLsiE=;
 b=BOV5wvC34R3nucOUOABg10X66/AfSqqJ3AgkE37CzOiiES/SPJY9gtc8g8ngOptOPvxRFI1Ri3MJJJGrB/zAZBjHXmdLEC0PLtGWl8eUjD8i2dzGKaz/0xXbFJQI6nm72PJYUyWmsDYLbP2qMuKHCM5FiW6UDxooqOVUY4VfkDsum36zPmGCduHC5CpHIAlmN+s2CzQk6JOZhzQgzr84qwDmBJFCyUbbPAk701BnONgsRW5zQJ3o5iBcN8Gq9g9wXOoBYVEf5/0T+LxJhY7XrG8zlIUZNginEwA1C01tVOxSFvHb1MlbWJMohWhxVOxPBbZJzNs7hWBfhDIESDlk7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oGUqIma0DRISkcM1XRPGcZzb/uCEiVF+OqbnloLsiE=;
 b=a71NqHFZNtbPk3dsnguT92cn4j4OySsEDo+Na4lFZ76PbJUyiwrGuLywXZUJazl2Zn+qwN9x1rzwMVpg+Ve4rwft3DUmFIJui/GCjLlMA/Y4GIDg0KtIuW/PBqpAKhsKk7bI+YStWmt6K1gVex/1O7sErVxFP4XlgOM7MPYah1A=
Received: from MN2PR13MB3374.namprd13.prod.outlook.com (10.255.236.83) by
 MN2PR13MB2622.namprd13.prod.outlook.com (20.178.254.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.10; Mon, 25 Nov 2019 05:57:41 +0000
Received: from MN2PR13MB3374.namprd13.prod.outlook.com
 ([fe80::4481:4560:7083:e4c6]) by MN2PR13MB3374.namprd13.prod.outlook.com
 ([fe80::4481:4560:7083:e4c6%7]) with mapi id 15.20.2495.014; Mon, 25 Nov 2019
 05:57:41 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>
CC:     "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v3 0/6] GPIO & Hierarchy IRQ support for HiFive Unleashed
Thread-Topic: [PATCH v3 0/6] GPIO & Hierarchy IRQ support for HiFive Unleashed
Thread-Index: AQHVo1U/2ljv661YTECJb4nJUTETbQ==
Date:   Mon, 25 Nov 2019 05:57:41 +0000
Message-ID: <1574661437-28486-1-git-send-email-yash.shah@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BMXPR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::17) To MN2PR13MB3374.namprd13.prod.outlook.com
 (2603:10b6:208:162::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bb8af75-4b7f-4f7c-997a-08d7716c621a
x-ms-traffictypediagnostic: MN2PR13MB2622:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR13MB2622B893A1649A98EB3774A48C4A0@MN2PR13MB2622.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(136003)(376002)(346002)(366004)(396003)(39840400004)(189003)(199004)(186003)(966005)(6436002)(2906002)(316002)(14454004)(7416002)(54906003)(4326008)(6306002)(71190400001)(2616005)(50226002)(8936002)(110136005)(478600001)(6512007)(6116002)(8676002)(36756003)(3846002)(25786009)(81156014)(44832011)(305945005)(5660300002)(52116002)(14444005)(256004)(26005)(81166006)(71200400001)(6506007)(386003)(2501003)(6636002)(66446008)(66556008)(86362001)(66946007)(102836004)(99286004)(6486002)(7736002)(107886003)(64756008)(66476007)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR13MB2622;H:MN2PR13MB3374.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:3;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ibNjMQFMNrY8ZAbHle0+Yup9NsDK6TNtww5Xjo+avVxpmyA8tIuf6THRrQnLmiJxkmqH86Ribwk3NIDXYFLtqFhXidBOnxElLCIyZd328dYdSOFviIJfA7i+YJ8u15c0+IWBqYrOugnwhBzCpMO/TecccEHPsz8TCZM0+DZLBKlZVR0SXq0V/NsNgjgJOqMTp7aWpd8BUM+QikrgOJAVX9N9wHdkXpCMMIlBgTrscyg8g1Dk4me34ft61w3OOjPatVSwL2qgWnmfhB7nWvJPOk0yo0rr5q8+ld7+tkSSLuzNxWJBngoH27jK7ehDrhN8WrJ0JVXsU8wtARcB2M0sXza7OxGRfkB3nLOmcLxUXgGFH27bTWDVowYw5yMuBKLyd2tcY5k7qX06kClNtMtWyRdHCDehl/ZP9ooTk130WknT8lrlavqYpgtfVLWGTmJ3COYuZ2zFPRvGzAGv4BN20sFQd5OJ7/ubDMXWtqxPj4U=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb8af75-4b7f-4f7c-997a-08d7716c621a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 05:57:41.5489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a1FANDnilxOFDVGbC2X/bWYpIxpmV9vWDmGD7hOwk+lEqYvFDp0KZMb8M851QY9Hf1bTq+qkTUQtftjTbiw2Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB2622
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series adds GPIO drivers, DT documentation and DT nodes for
HiFive Unleashed board. The gpio patches are mostly based on Wesley's patch=
.
The patchset also adds hierarchy irq domain support as it is required by th=
is
gpio driver. It also includes the irqdomain patch to introduce
irq_domain_translate_onecell() and irq-nvic driver patch to use this newly
introduced function.

This patchset is based on Linux 5.4-rc6 and tested on HiFive Unleashed boar=
d

Changes:
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
Incorporated below changes as suggested by Linus Walleij on RFC version of =
this
patchset[0]
- Dropped PWM patches as they are already merged.
- Include "GPIO_GENERIC" and "REGMAP_MMIO" in Kconfig select option
- Remove unwanted inclusion of header files
- Use regmap MMIO instead of customised sifive_assign_bit()
- Use GPIOLIB_GENERIC and bgpio_init() to set up the accessors
- Use hierarchical irqdomain

[0] https://lore.kernel.org/linux-riscv/20181010123519.RVexDppaPFpIWl7QU_hp=
P8tc5qqWPJgeuLYn0FaGbeQ@z/

Yash Shah (6):
  genirq: introduce irq_domain_translate_onecell
  irqchip: nvic: Use irq_domain_translate_onecell instead of custom func
  irqchip: sifive: Support hierarchy irq domain
  gpio: sifive: Add DT documentation for SiFive GPIO
  gpio: sifive: Add GPIO driver for SiFive SoCs
  riscv: dts: Add DT support for SiFive FU540 GPIO driver

 .../devicetree/bindings/gpio/gpio-sifive.yaml      |  69 ++++++
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi         |  14 +-
 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts |   4 +
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-sifive.c                         | 252 +++++++++++++++++=
++++
 drivers/irqchip/Kconfig                            |   1 +
 drivers/irqchip/irq-nvic.c                         |  15 +-
 drivers/irqchip/irq-sifive-plic.c                  |  30 ++-
 include/linux/irqdomain.h                          |   5 +
 kernel/irq/irqdomain.c                             |  17 ++
 11 files changed, 399 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sifive.yaml
 create mode 100644 drivers/gpio/gpio-sifive.c

--=20
2.7.4

