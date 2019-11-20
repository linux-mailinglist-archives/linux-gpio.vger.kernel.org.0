Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD4C1034A8
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 07:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbfKTG7R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 01:59:17 -0500
Received: from mail-eopbgr740044.outbound.protection.outlook.com ([40.107.74.44]:49032
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725268AbfKTG7Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 01:59:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoKvUJe05c7LMezVAYwT2/+BXDHRaoNC6fewizVHJxOp3KtFBVUWPu0TspON++ohpIRhrUHEH4sKpku4q5HbRPjJfcz8AaIYK66oHoCAeQpATO7OTVsFYD0A3InNGxIoa7vkbJuKv3RQO00ZvxHKG7CJToi6oqZdUVZFXEONAen9zj6ecCYn8eNCrsEi8CnQflS/BhfIEbQIZlb4+71ijpGOHiQnoyjQqgROVg9TyEebT+fPjErTiI0ovmdPKTwANKazgzI1qt4MMoLlwj2jB9MBsUE2WsRc2GcibOKdqGy0nYFXQNxZUjmkpSMYuA7EAUkp1mY/LmXSJFUzhJMb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhK3zUpsigEyzUU/4LOqLJTAPXXTufJkcGVCBUVs2xM=;
 b=GJGPjbf4KQ1GoYPVuLPPMgS5a9LBs+Ek8D51Ol+tdRN0oFKVf1xqinXX+xtPK/47j/dRmgDb3jwi/2xJ9Xsw4PWtQNrqp5UvOu/5qUSZ/R4TADD9ZORHmjYOyOlWTJDrOhkzgj/GAd+NUWAY0SKjlMJgEi0UXA51h02NMaWwiAAWSx81T+zAB8pypRnZHwNGVW/r7LGzyECepWhRjs9nz2DyOXETogs5nRFjJtNQJFGwuM82nKqt1xtmtasF4WRhKZ6A3DFQ7ivswu+BJ26OvD8Dzvp4Eoce2QPKnpuRj6RuQzxq3x7gI3D0LA/p4p7icrq3Z8yUw9RH6Dk+7FjXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhK3zUpsigEyzUU/4LOqLJTAPXXTufJkcGVCBUVs2xM=;
 b=O2r/mRlSiFH4UFu8QPwGFzfvVFtJ4cmVC1t1BydiPKaCU2s62es++r7iD3OsPT4P9jd8xYlPOiasz3YGqkU3ibq3jgghZ1wQ26cGPNNLsgp50ToUHxEsybWz0FOc6Rp7gm8oygwx5rYh3B20eZp3wtvimW8o+Ma7cfC9JTIcHFo=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3415.namprd13.prod.outlook.com (52.132.246.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.8; Wed, 20 Nov 2019 06:59:12 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 06:59:12 +0000
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
Subject: [PATCH v2 0/5] GPIO & Hierarchy IRQ support for HiFive Unleashed
Thread-Topic: [PATCH v2 0/5] GPIO & Hierarchy IRQ support for HiFive Unleashed
Thread-Index: AQHVn3ADRjhbwD8pMkWU28XE+jflng==
Date:   Wed, 20 Nov 2019 06:59:11 +0000
Message-ID: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0208.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::28) To CH2PR13MB3368.namprd13.prod.outlook.com
 (2603:10b6:610:2c::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f4ddd14-882f-4159-3cd8-08d76d872586
x-ms-traffictypediagnostic: CH2PR13MB3415:
x-ms-exchange-purlcount: 1
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB3415FFB6E660FBA7E40C6AB18C4F0@CH2PR13MB3415.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(39840400004)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(486006)(71200400001)(316002)(8676002)(6636002)(71190400001)(966005)(7416002)(8936002)(25786009)(99286004)(2906002)(54906003)(52116002)(50226002)(2501003)(478600001)(110136005)(66066001)(86362001)(36756003)(81156014)(81166006)(386003)(6506007)(26005)(4326008)(102836004)(6306002)(5660300002)(6512007)(476003)(6486002)(186003)(2616005)(6116002)(3846002)(7736002)(305945005)(6436002)(66476007)(66446008)(66946007)(66556008)(14444005)(44832011)(64756008)(107886003)(256004)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3415;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3+CgMCRxl4PngPhtziQCHfVkyU0z+WJjgZzV4mc5qTB5A6CJ7Fd5WY9Vj3sLX6idpBy4HsgYDONezH9gkhEs6Dxfl1Hu4ajEb7b1geq19ZJfAzT51BQV+uvt/LAEiVXBEwi6v3iypuBA/UxL4V7IWI5/2WqcUolkGqqo/5/QAQ8OYz/L5sWaTUlazFs2x/7xqVxj+NKXNTNiych8QWNtSRcFiff/gx02jZeP2yoevcHN5fbmsMzSkEyGyDjGqz+Ve3ikf0bYwVSrzXRQhjwPZwdvDfEoZZzplNWRHCE/nXgCyhU1EPTdocWjrMoXMeryLpkWNpOJL+lvuULpxfo2fZu+UKeaMh0tp6dGSLG5xvP95+1bs7g3nmKAgkDF+X/RnSYFHlDZ8UNYj1zYOWEo+RxPZ0XVdayYxIwHyfcW/m7rsOqfHmKF25o/bFHbRjM0dG0NorRVymwpp5Lg0Dm4bD/vrFGvzHK+AoJoruB85t0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4ddd14-882f-4159-3cd8-08d76d872586
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 06:59:11.8698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZ71Rc4WefvOMpdNd1tDsAml4dVhEKWvUCuXPigk69t8Rznod0meCLjnE2gCHFBBuIsUJiHsuzGMLORUqJOH+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3415
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series adds GPIO drivers, DT documentation and DT nodes for
HiFive Unleashed board. The gpio patches are mostly based on Wesley's patch=
.
The patchset also adds hierarchy irq domain support as it is required by th=
is
gpio driver.

This patchset is based on Linux 5.4-rc6 and tested on HiFive Unleashed boar=
d

Changes:
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

Yash Shah (5):
  genirq: introduce irq_domain_translate_onecell
  irqchip: sifive: Support hierarchy irq domain
  gpio: sifive: Add DT documentation for SiFive GPIO
  gpio: sifive: Add GPIO driver for SiFive SoCs
  riscv: dts: Add DT support for SiFive FU540 GPIO driver

 .../devicetree/bindings/gpio/gpio-sifive.yaml      |  69 ++++++
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi         |  14 +-
 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts |   4 +
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-sifive.c                         | 256 +++++++++++++++++=
++++
 drivers/irqchip/Kconfig                            |   1 +
 drivers/irqchip/irq-sifive-plic.c                  |  30 ++-
 include/linux/irqdomain.h                          |   5 +
 kernel/irq/irqdomain.c                             |  20 ++
 10 files changed, 404 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sifive.yaml
 create mode 100644 drivers/gpio/gpio-sifive.c

--=20
2.7.4

