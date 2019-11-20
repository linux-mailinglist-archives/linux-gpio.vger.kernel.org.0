Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADD11034AC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 07:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfKTG7Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 01:59:24 -0500
Received: from mail-eopbgr740084.outbound.protection.outlook.com ([40.107.74.84]:43232
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727003AbfKTG7X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 01:59:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX+4wT884k5kA85/56LsU/e3G1bVM8GvSl7WqlkcL5/wmX3yOmr6m7SloLJBijv7kfE5CqxIj9zgKFEMC0s/l0225DGlU1mk53rbE2yFU1UPU9GL1awFamkE5EFX2cAUEnfjbfx7m0n3vMELFjWRNiFJLgrx1Ulj0POyAhSeuYKANu2jQKEoYUo/UCaS+UACns6dbwRxjRvRHR1AExqTH1I5tKfSfDFQKrVS6Z9Zs2nDD0oU+5nKK+wm+efHQzV+yQxEdQrW+jtXrMMozAeadHRWIR6OedZNWN3PCid6Zvt7sMeMnBKlIW2ZuDQBnMkuHSj71iV+ezXh+yLbvaKFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUJLzYO7FlrPU6UtYAl030j6WY1EKyN58vXYO8xgU/U=;
 b=iM1tQIRLDeoNwOHcDck7gm5EVimYCyGCFZ0VNP7BKRuDPKHcotw71SKPzj6Oex4ed0EDEsGEKrHn+Crn2nzMW+jBx9oNkPcbyEn20d/Vleijdl/KMwvn4iWFKna/Pw3MIJZHfjUeM4O0YlSqHGtlKBgGOQlztVN12Jp/b2+Dqc4HzwWVwMMBJOUjLIKXHCkkufSp4BaIcGhYL28OdoF3RiGCS9iKqoEiHhe3PwxGATfWdZGuzLiBFPaAQ8bPHb+UvJEszKXKCtbnHkrcoVficyr6JyiFxLIxpSZoqWtiUDyK1VbRxok5hf7MElVJ6hmUYQqmgg38ci81OByCVc0qOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUJLzYO7FlrPU6UtYAl030j6WY1EKyN58vXYO8xgU/U=;
 b=CGYV2yfFrLsuJptPj7O5t1DBwCJA6AQuMb5fmppbD7XgEGOuVyXuWwQTaBnHZAAJFn/qfh3XYXuMpGRTYxvaK3RbxYto+YGTv9p1yS2x8cGnt2k/f77VH5vSSzYQ8f9lQGlutZbmyKEmBQR7n5Id+mrh9PTVNjCR/4NwnMGatik=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3415.namprd13.prod.outlook.com (52.132.246.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.8; Wed, 20 Nov 2019 06:59:21 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 06:59:21 +0000
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
Subject: [PATCH v2 1/5] genirq: introduce irq_domain_translate_onecell
Thread-Topic: [PATCH v2 1/5] genirq: introduce irq_domain_translate_onecell
Thread-Index: AQHVn3AJHBiRD+wuIUSzxWzN0+e/fg==
Date:   Wed, 20 Nov 2019 06:59:21 +0000
Message-ID: <1574233128-28114-2-git-send-email-yash.shah@sifive.com>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
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
x-ms-office365-filtering-correlation-id: c866b0bd-d336-4db2-1f56-08d76d872b55
x-ms-traffictypediagnostic: CH2PR13MB3415:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB34157DE91963C3564F31248E8C4F0@CH2PR13MB3415.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39840400004)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(486006)(71200400001)(316002)(8676002)(6636002)(71190400001)(7416002)(8936002)(25786009)(99286004)(2906002)(54906003)(52116002)(76176011)(50226002)(2501003)(478600001)(110136005)(66066001)(86362001)(36756003)(81156014)(81166006)(386003)(6506007)(26005)(4326008)(102836004)(5660300002)(6512007)(476003)(446003)(11346002)(6486002)(186003)(2616005)(6116002)(3846002)(7736002)(305945005)(6436002)(66476007)(66446008)(66946007)(66556008)(44832011)(64756008)(107886003)(256004)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3415;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: slLBVNJvOlBeUf6r7rLz+tB4xUiKV8JpS/iJPaCMmNvfK0NWkOr7DzBqKhJsD3dwBMh0nT0jg2VY/5wzw91YSi/imA4NQdV7RpmIY63VB9TLmkPgrNAd93r4LQjjrTB7kQ4UQ9QirvD3RhFkUI33jcscbq92JI5k81UydRDNC5Slnscg9f/hBg2Bel6GbQTSsBlPmxHlhWWAiP9dmCRix+IWifWe5EcCjJqU8et8i/JhXdTNR8rPRr+RPwS1YQag/zMAmA0qsrO9681vWxuR0IrpxkWjG4zsGHW0hDV0qr8tDShs42PK8slpyWWX2aedYCY9mDmxwnJg0SybqWcTO6yctU14VJZ4joKXrw0BtGpuc/lsxly2uJ/9ydJITfzObH5ILodS345adgwIwvLDYGliSjiOeuW5o+2BJFK1t/DTd59HyQcj2eRY0YUgIbGU
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c866b0bd-d336-4db2-1f56-08d76d872b55
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 06:59:21.4174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WXiS0orDLFaEUmtZPePYSyCXSBwbkIfC9+sycPanLtksB/w1l/Ryu4aQFIwFcx+iIp/bZxXT1DX4o8h75Dl4fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3415
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a new function irq_domain_translate_onecell() that is to be used as
the translate function in struct irq_domain_ops for the v2 IRQ API.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 include/linux/irqdomain.h |  5 +++++
 kernel/irq/irqdomain.c    | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 583e7ab..cad9eb8 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -426,6 +426,11 @@ int irq_domain_translate_twocell(struct irq_domain *d,
 				 unsigned long *out_hwirq,
 				 unsigned int *out_type);
=20
+int irq_domain_translate_onecell(struct irq_domain *d,
+				 struct irq_fwspec *fwspec,
+				 unsigned long *out_hwirq,
+				 unsigned int *out_type);
+
 /* IPI functions */
 int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask *dest)=
;
 int irq_destroy_ipi(unsigned int irq, const struct cpumask *dest);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 132672b..6972a48 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -987,6 +987,26 @@ const struct irq_domain_ops irq_domain_simple_ops =3D =
{
 EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
=20
 /**
+ * irq_domain_translate_onecell() - Generic translate for direct one cell
+ * bindings
+ *
+ * Device Tree IRQ specifier translation function which works with one cel=
l
+ * bindings where the cell values map directly to the hwirq number.
+ */
+int irq_domain_translate_onecell(struct irq_domain *d,
+				 struct irq_fwspec *fwspec,
+				 unsigned long *out_hwirq,
+				 unsigned int *out_type)
+{
+	if (WARN_ON(fwspec->param_count < 1))
+		return -EINVAL;
+	*out_hwirq =3D fwspec->param[0];
+	*out_type =3D IRQ_TYPE_NONE;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
+
+/**
  * irq_domain_translate_twocell() - Generic translate for direct two cell
  * bindings
  *
--=20
2.7.4

