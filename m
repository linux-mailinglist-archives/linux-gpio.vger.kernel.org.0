Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13E7B108885
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 06:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfKYF6I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 00:58:08 -0500
Received: from mail-eopbgr690051.outbound.protection.outlook.com ([40.107.69.51]:8004
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725747AbfKYF6I (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Nov 2019 00:58:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxiKnrmRaIPxRDj6SmkKp9qzjYuisZFHIDydOQNVDzg7AhikeRRb3eAApDRH8uBqsofyLkdDS36rrJU0ZQzsXRQbgEK+2YGRSlI+ghGTtxLX7DIpOJ8SnPFQc58rldWeRoDkS8GcApSgOtlcOQlEVybAny+tz6QVrkbDF5OuiEU1BeAatCKvwB+n8xQGBPGwl/IvQ3gAZHhRHaz9pd7KU7x5QlN4J9Fipsr1rPK28sOS9+EkGmIBNfXpwLFTqiIIejU2p104iT+2jzpD4XVr6u4IjRJDDzVBK31nwtGy2PCPYOeUDgSHisymCtj3PZtE/jymgXtM+1R4ivhRFiZgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0ndFrNDRdLzXaqdzDXNZC2+7Ib782QCib2mpIHfxHY=;
 b=JlxH07A5Kqlh2uhFJMt05qkR54QjnaLwF184qkTsZo0/Ec44wTSTh9lsuarMbE4DWW8rVDMm7ZqQapVjVMjFoAwkXOGU1ESdGlJcDbxbS2vDiiN6TjhxVWiWfsqYS1FFDe11Np3E8986rdRpxDtDV9wGKl0ta5xwp+PBKc/9YFAn31ggDGlGWMy1a4qCWUN1ezP7q2asq66DaKMFvEyHRNdJLFvUH6f81xpVEPuGlJDtoCnLmXEuVjvs+LjC7moCkJX7EmJlIu8noNFa2IYn0TlC7uSSCg5k3ZTeEvVSV5mWFHg4IjIsmJm2pMXM3QnZrWmBlutwb4KwzrQTU/ELYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0ndFrNDRdLzXaqdzDXNZC2+7Ib782QCib2mpIHfxHY=;
 b=pRC3HMZwVLCcFbOS6JCCuZLlRY2ptXmdmmeFpgqpz6L6JqU6U2tYYbHixAicS3EpzJgZbRyReXeZBMv8wQcGZcIqe7o+/CHeSXUDTraTzzMcETBubHEFKK1xS9iFBQPcmJlNLQFAext0o292HiYL0TVppxnw0Tiw3PIdZogQpmI=
Received: from MN2PR13MB3374.namprd13.prod.outlook.com (10.255.236.83) by
 MN2PR13MB2622.namprd13.prod.outlook.com (20.178.254.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.10; Mon, 25 Nov 2019 05:57:53 +0000
Received: from MN2PR13MB3374.namprd13.prod.outlook.com
 ([fe80::4481:4560:7083:e4c6]) by MN2PR13MB3374.namprd13.prod.outlook.com
 ([fe80::4481:4560:7083:e4c6%7]) with mapi id 15.20.2495.014; Mon, 25 Nov 2019
 05:57:53 +0000
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
Subject: [PATCH v3 2/6] irqchip: nvic: Use irq_domain_translate_onecell
 instead of custom func
Thread-Topic: [PATCH v3 2/6] irqchip: nvic: Use irq_domain_translate_onecell
 instead of custom func
Thread-Index: AQHVo1VGEKPCS6wor0CK1EyqHBbjRg==
Date:   Mon, 25 Nov 2019 05:57:53 +0000
Message-ID: <1574661437-28486-3-git-send-email-yash.shah@sifive.com>
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
x-ms-office365-filtering-correlation-id: 6bac50ee-ac08-457a-9aec-08d7716c6927
x-ms-traffictypediagnostic: MN2PR13MB2622:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR13MB262236178E132C5D0B10FA8F8C4A0@MN2PR13MB2622.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:376;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(366004)(396003)(39840400004)(189003)(199004)(186003)(6436002)(2906002)(316002)(14454004)(7416002)(54906003)(4326008)(11346002)(71190400001)(2616005)(50226002)(8936002)(110136005)(478600001)(6512007)(446003)(6116002)(8676002)(36756003)(3846002)(25786009)(81156014)(44832011)(305945005)(5660300002)(52116002)(76176011)(256004)(26005)(81166006)(71200400001)(6506007)(386003)(2501003)(6636002)(66446008)(66556008)(86362001)(66946007)(102836004)(99286004)(6486002)(7736002)(107886003)(64756008)(66476007)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR13MB2622;H:MN2PR13MB3374.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pq94+cO+Q0GXMN3CwWbLU53KKgfosiJG5Xlzo3WLguIxc+pK0tqe5hQRxts3TFmnSsAWeDiu+9q55GnmJGku60o8v9DUgVE2WCiw2zB35OnXvcJHUoBTaUF2TaD2ZSvRAa0A9T17ODOG7g8zu/YEJMLkiXalHz8jQl6LXBkMKquJC8lCt8ZdmbX+7vkPoFCDykFn0yWlk58v/tT6+tJeiuU8P1Te8lzwRPA9/vpOHV3qskI/HAFGiMXGzwnLcUaYoj4/kJoe5qa4c1LgVGpScEojXVQivKZ0ljwptFND3rDy2dppvLSw/3Rlkj8Cn02zkdPZ224rYV8eIZJtLM8gFBcyydIQUgEMubDp+5yN9erSWpNAmwSkL21WlYYnFCLectN9EWo4kxNdKDMywDD46+4mSPXgR6lUwZ0B1u72U64RRGF4q+vo0ZG3lcDxBmlj
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bac50ee-ac08-457a-9aec-08d7716c6927
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 05:57:53.2943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +kgGP2v9hDRXfoFV7TnJuPKQmvXtbIel06kvs4HnoYmauXuzQmcOaL69aBPGWcqhNnonzEZ3fIFOw636+MZpOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB2622
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of newly introduced irq_domain_translate_onecell() instead of
custom made function.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/irqchip/irq-nvic.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
index a166d30..f747e22 100644
--- a/drivers/irqchip/irq-nvic.c
+++ b/drivers/irqchip/irq-nvic.c
@@ -45,17 +45,6 @@ nvic_handle_irq(irq_hw_number_t hwirq, struct pt_regs *r=
egs)
 	handle_IRQ(irq, regs);
 }
=20
-static int nvic_irq_domain_translate(struct irq_domain *d,
-				     struct irq_fwspec *fwspec,
-				     unsigned long *hwirq, unsigned int *type)
-{
-	if (WARN_ON(fwspec->param_count < 1))
-		return -EINVAL;
-	*hwirq =3D fwspec->param[0];
-	*type =3D IRQ_TYPE_NONE;
-	return 0;
-}
-
 static int nvic_irq_domain_alloc(struct irq_domain *domain, unsigned int v=
irq,
 				unsigned int nr_irqs, void *arg)
 {
@@ -64,7 +53,7 @@ static int nvic_irq_domain_alloc(struct irq_domain *domai=
n, unsigned int virq,
 	unsigned int type =3D IRQ_TYPE_NONE;
 	struct irq_fwspec *fwspec =3D arg;
=20
-	ret =3D nvic_irq_domain_translate(domain, fwspec, &hwirq, &type);
+	ret =3D irq_domain_translate_onecell(domain, fwspec, &hwirq, &type);
 	if (ret)
 		return ret;
=20
@@ -75,7 +64,7 @@ static int nvic_irq_domain_alloc(struct irq_domain *domai=
n, unsigned int virq,
 }
=20
 static const struct irq_domain_ops nvic_irq_domain_ops =3D {
-	.translate =3D nvic_irq_domain_translate,
+	.translate =3D irq_domain_translate_onecell,
 	.alloc =3D nvic_irq_domain_alloc,
 	.free =3D irq_domain_free_irqs_top,
 };
--=20
2.7.4

