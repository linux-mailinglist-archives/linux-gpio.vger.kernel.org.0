Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44953108894
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 06:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfKYF6Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 00:58:25 -0500
Received: from mail-eopbgr690051.outbound.protection.outlook.com ([40.107.69.51]:8004
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725844AbfKYF6J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Nov 2019 00:58:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ii7J97d3BWRzzzLTFdnuszDhFjIqtCCgA2LXBlzKGVEXwxJ5BzB9OmpP1MG7gr8PzrHWoBfYvRdYktsaBb0J/ah+8EnFyYKnsG5+QV8rAKLJLRz/t9zXJi7NTPW/hcP1Ndaa5Id09MTI1TfsNBWESXCWN2H/xR2++3GhrcEKdXZbVIKrVxP2nmBPCqS66M2QqL0Eeel6a53ux+rAd63bXsS7dS8Ircd5LnbFl7tswyoZC3BHm0ObpQK0/iXaGnDr0eyvMO88XXohdO6PAzgLu9TNumK9WTMizadQIrGLhlB+5j989G2J/cHTRy142Lwu3xtyz0kRo3CCbrrXk9WfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDfzxDQGZW6XheT+Y4JFDKwUOe7QfA8Tz7Bn/45KXYw=;
 b=GIKjGjMbZnaP1PCt+DYB/2z90Sl+cLhKzzEW2lY7dZYn3Z/CFEMzpBknBB5829X912MvpaCNRJbnjEe9eglfz8SR3iZr3denYT+xqUS7/0KBCXnt3XAeRSS1FVF6HRQfC0KN3xS+euZQHMsAPO97mbNu2CZTs8xEDIBvo0622ayOU7QFIJGrb/arAgEL+3hhgrb2FNPaq+Rjs4vxpUR5C0B8NtOXfSiLA4QLeapeU/ixNw8dMJ8oyz89BxD743SBjv57em+mEgQ4BEelC5IBADbWU1bG9OWllDsE8deIIu8vZfsj+MdhIeUBwKeR1FkPhS0ASyi6tzppT2dSYfYUFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDfzxDQGZW6XheT+Y4JFDKwUOe7QfA8Tz7Bn/45KXYw=;
 b=g3Fn5ncqkYl9zRXJPyqXOtxGeXvmpoNLAHAwItzNY8mvkhVd4UE5rfSHIhPBCO7wSLrZNCswjAXfXXFFW95PePvxHy4zTAfiJLD8ViABIKzXxMNDrVYqHK7BrgUtxb4Qp3uoB1ugCdcFvJbA9o8yTe/XFujTMXSnMHM1dpN59vI=
Received: from MN2PR13MB3374.namprd13.prod.outlook.com (10.255.236.83) by
 MN2PR13MB2622.namprd13.prod.outlook.com (20.178.254.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.10; Mon, 25 Nov 2019 05:57:58 +0000
Received: from MN2PR13MB3374.namprd13.prod.outlook.com
 ([fe80::4481:4560:7083:e4c6]) by MN2PR13MB3374.namprd13.prod.outlook.com
 ([fe80::4481:4560:7083:e4c6%7]) with mapi id 15.20.2495.014; Mon, 25 Nov 2019
 05:57:58 +0000
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
Subject: [PATCH v3 3/6] irqchip: sifive: Support hierarchy irq domain
Thread-Topic: [PATCH v3 3/6] irqchip: sifive: Support hierarchy irq domain
Thread-Index: AQHVo1VJzc9tV+G/IEy0msjY0/LtiA==
Date:   Mon, 25 Nov 2019 05:57:58 +0000
Message-ID: <1574661437-28486-4-git-send-email-yash.shah@sifive.com>
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574661437-28486-1-git-send-email-yash.shah@sifive.com>
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
x-ms-office365-filtering-correlation-id: 100a0099-b65f-408c-1263-08d7716c6c38
x-ms-traffictypediagnostic: MN2PR13MB2622:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR13MB2622964B0608327AD26E9A7E8C4A0@MN2PR13MB2622.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(366004)(396003)(39840400004)(189003)(199004)(186003)(6436002)(2906002)(316002)(14454004)(7416002)(54906003)(4326008)(11346002)(71190400001)(2616005)(50226002)(8936002)(110136005)(478600001)(6512007)(446003)(6116002)(8676002)(36756003)(3846002)(25786009)(81156014)(44832011)(305945005)(5660300002)(52116002)(76176011)(256004)(26005)(81166006)(71200400001)(6506007)(386003)(2501003)(6636002)(66446008)(66556008)(86362001)(66946007)(102836004)(99286004)(6486002)(7736002)(107886003)(64756008)(66476007)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR13MB2622;H:MN2PR13MB3374.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GmoKl45B8NeGeNdjtomAcMY+p1y5BlMeE3kPPR08QccuQ333Du6eHdg4D8OLlrOkcpHLaw0f2Pm/hOIrvYuW5WeC9jEFb6bF4IY8ezQJRnVjzOHXTt+qVlRYI57j2Up0x9ngqABIpfI2jZNOEIkKBdvRflJjCi0nmmWk4K+PpFVReryJS47psNZyPhiIVNlq5qdRsFD3zbz1JvpDsS2luArvuvARr+xPPb9mn2ix2l/4S+55f30+CIF5/j32DHtt6ZbG+Jqyb5ZVYTclNb8jGMDmkTzB1EqD+UHDBhp4ReM6ClUZw/0H1JLBwaGSbtTVu1IPkrlKAbIKORWECZnXAeFB6/jPgaRq/fUmHTjPoUkPn6MSyI24PaknwCpp5sI+E72H1lq/w+Kfw68f2DrrYX4yMltwR5no5WT/MpDZ9PYWTdJdYoyoWjBZqfUBW93i
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100a0099-b65f-408c-1263-08d7716c6c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 05:57:58.4194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: izcCoBjval2l3asTKBNwDYbG/fE9l4ESGZ0xwTYhLZn3zjSuwo9hstJB9PW4HiedfR5EqVBJ96Q20F2HZTEINg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB2622
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for hierarchy irq domains. This is needed as pre-requisite for
gpio-sifive driver.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-sifive-plic.c | 30 ++++++++++++++++++++++++++----
 2 files changed, 27 insertions(+), 4 deletions(-)

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
index 7d0a12f..1592ef2 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -154,15 +154,37 @@ static struct irq_chip plic_chip =3D {
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
+static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int v=
irq,
+				 unsigned int nr_irqs, void *arg)
+{
+	int i, ret;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	struct irq_fwspec *fwspec =3D arg;
+
+	ret =3D irq_domain_translate_onecell(domain, fwspec, &hwirq, &type);
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
+	.translate	=3D irq_domain_translate_onecell,
+	.alloc		=3D plic_irq_domain_alloc,
+	.free		=3D irq_domain_free_irqs_top,
 };
=20
 static struct irq_domain *plic_irqdomain;
--=20
2.7.4

