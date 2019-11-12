Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBD38F8F62
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 13:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfKLMME (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 07:12:04 -0500
Received: from mail-eopbgr700045.outbound.protection.outlook.com ([40.107.70.45]:56193
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726970AbfKLMME (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 07:12:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsMsC9uNSZlbQglh6wdhOtXO0aDIa22/cCIQOtyoWFDNdSfxQK2FEQryRMo7mSyvM52rwLLWxTaNW6iY4bd9sDglZEh8i5UoNCged0G734gO3M17j3BUj8DYSUE4mRa2/T+7UyrtBQ8/JZL7/Fbu1aeDKeBwQ9LkW7Ehg33SjIrem3HNc7GvqeM4FeB7vAmNqxgYT5ufN2+mdfKnmDrJIXda0sKiWBg72VdZ7ZtKV2SIjhYAc1CbVTSK4Q6vSCsPiAeSOK0sSNl6pGiS6nqgSKgPHI8te0g221lwnuk+Rn5qW890rzuWAsq2FxROCubCCexAEiEkfB9fibmkH5pzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOx0yBuKI1C9e0DlnWeylfjcgLwdh5gDYQFrQ9ovYz0=;
 b=RVzA/AUieDvaTt2O1vPD2m/L6mBsvvzmJR1zY8Nw0gQCtnU/in4mdFUHv7R6walsmrW5WwzQH5xbj6NvLjoHN0rZFBIssDLeoeHZdR+TtWw/j9SGHGAcFAYbK6l3JNxftJlvhWuVWCGAUtCdXz0jwFE56daFhTkW2LfeIKB1bAuzSDGFLxE6kFrIMpRfmeIS/KDMKc7wH7EqPSeHDXRDgtatCS90njeyfGpnzHhCRYnUWSNaHJMJhTrix1y0ClPuDPjX8dKF2rRKnsGMXzlIoNRef42tMUJkU8fZl4h1NnixtLb8x59b2uRQotmTQPAihcDvTyh6zZZN9zNzwPqISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOx0yBuKI1C9e0DlnWeylfjcgLwdh5gDYQFrQ9ovYz0=;
 b=FyiONRyY+zO5UxWmeeEVxtGMOJ8dwNYgS2H2m9NGYbnYYwfRuZ81Sm3PQO+cYE3sN1xPSZOZwHhmNhz79/y2RrzWQSx+FH1Nv3kmnHwloBQmXAhFinYn535zs+yp/p5N8Z8McdadyO6dx9Jm5hLJFUOdX6M0C7mBlK0Cf1kJuPY=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3541.namprd13.prod.outlook.com (52.132.247.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.17; Tue, 12 Nov 2019 12:11:59 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2451.018; Tue, 12 Nov 2019
 12:11:59 +0000
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
Subject: [PATCH 1/4] irqchip: sifive: Support hierarchy irq domain
Thread-Topic: [PATCH 1/4] irqchip: sifive: Support hierarchy irq domain
Thread-Index: AQHVmVJiuq127ZCTBUqmuCH0wyl5Fw==
Date:   Tue, 12 Nov 2019 12:11:59 +0000
Message-ID: <1573560684-48104-2-git-send-email-yash.shah@sifive.com>
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::17) To CH2PR13MB3368.namprd13.prod.outlook.com
 (2603:10b6:610:2c::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abb036b8-2aa6-468d-8143-08d7676984af
x-ms-traffictypediagnostic: CH2PR13MB3541:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB35415396BC0C34E3951657E08C770@CH2PR13MB3541.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39840400004)(136003)(346002)(376002)(396003)(366004)(189003)(199004)(11346002)(186003)(14454004)(25786009)(486006)(107886003)(446003)(2616005)(476003)(66946007)(6116002)(3846002)(36756003)(478600001)(4326008)(7416002)(305945005)(2501003)(7736002)(2906002)(54906003)(110136005)(316002)(99286004)(6486002)(6512007)(44832011)(8676002)(81166006)(6436002)(66066001)(76176011)(50226002)(81156014)(6636002)(8936002)(52116002)(5660300002)(26005)(386003)(6506007)(86362001)(102836004)(66556008)(66476007)(71200400001)(256004)(64756008)(71190400001)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3541;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OV68bTN+aNXG4TB2H+413IX+IHaZbqWssg3uZVrMz48gC4nh0XZLmVimHRn47XdCq50WlE6r/4PSpq3oxi3X2FWI7sbl2AgfMOZ6I+53vmTHLqEqESuip6GucgM08ICbJ9lnlufDe5NHxkUrnNj14VAlukRKDU7armEBr7lTWI2TO2MRyWL6kjYzM2Bx3snEZA/SVZrDwaLioHialiczZc4dYjLwCuVoJKap/mhzvQsfNUo3eTSxCXRFJECfC5yhm5igKl3kI6F0VHtgKpsLyI+EsA3FMwgI+nUdoMQ09fRWfNicJBVAdMh388mjWn1lhZdpuqhl4TGu7FMznp64C0TcnXseMWVxqKpG9J6VdF5Xv2vntWc3QQC5jxwqclfo4zvItnal9ibiPWu4jwjUctGre4y1V1ysB05TjCxNqHDpBLbDwtY3Ru+qwwLcsCpy
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb036b8-2aa6-468d-8143-08d7676984af
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 12:11:59.4214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sFiaiDMnkcAOwYTl8MI14jy7fZropQhi5xDgIEtOAm4hyQEsxN4b3Q5OVqjLmBikCckPoTg4njbT451WilGTUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3541
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for hierarchy irq domains. This is needed as pre-requisite for
gpio-sifive driver.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-sifive-plic.c | 41 +++++++++++++++++++++++++++++++++++=
----
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index ccbb897..a398552 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -488,6 +488,7 @@ endmenu
 config SIFIVE_PLIC
 	bool "SiFive Platform-Level Interrupt Controller"
 	depends on RISCV
+	select IRQ_DOMAIN_HIERARCHY
 	help
 	   This enables support for the PLIC chip found in SiFive (and
 	   potentially other) RISC-V systems.  The PLIC controls devices
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive=
-plic.c
index 7d0a12f..2fa1c84 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -154,15 +154,48 @@ static struct irq_chip plic_chip =3D {
 static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hwirq)
 {
-	irq_set_chip_and_handler(irq, &plic_chip, handle_fasteoi_irq);
-	irq_set_chip_data(irq, NULL);
+	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
+			    handle_fasteoi_irq, NULL, NULL);
 	irq_set_noprobe(irq);
 	return 0;
 }
=20
+static int plic_irq_domain_translate(struct irq_domain *d,
+				     struct irq_fwspec *fwspec,
+				     unsigned long *hwirq, unsigned int *type)
+{
+	if (WARN_ON(fwspec->param_count < 1))
+		return -EINVAL;
+	*hwirq =3D fwspec->param[0];
+	*type =3D IRQ_TYPE_NONE;
+	return 0;
+}
+
+static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int v=
irq,
+				 unsigned int nr_irqs, void *arg)
+{
+	int i, ret;
+	irq_hw_number_t hwirq;
+	unsigned int type =3D IRQ_TYPE_NONE;
+	struct irq_fwspec *fwspec =3D arg;
+
+	ret =3D plic_irq_domain_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	for (i =3D 0; i < nr_irqs; i++) {
+		ret =3D plic_irqdomain_map(domain, virq + i, hwirq + i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct irq_domain_ops plic_irqdomain_ops =3D {
-	.map		=3D plic_irqdomain_map,
-	.xlate		=3D irq_domain_xlate_onecell,
+	.translate	=3D plic_irq_domain_translate,
+	.alloc		=3D plic_irq_domain_alloc,
+	.free		=3D irq_domain_free_irqs_top,
 };
=20
 static struct irq_domain *plic_irqdomain;
--=20
2.7.4

