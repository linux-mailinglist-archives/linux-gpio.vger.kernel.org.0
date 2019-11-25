Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251B7108881
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 06:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbfKYF6D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 00:58:03 -0500
Received: from mail-eopbgr690051.outbound.protection.outlook.com ([40.107.69.51]:8004
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725844AbfKYF6D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Nov 2019 00:58:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtuMTv24xCVrgxepin+8GoJqQMSxm6OtzkKJOfqifbIG0w/mSOzyGLwlUQCCn3fFFPCVYvHojkW/sn+2sXPlYFEpv7IIVhU1uVXD/IG+Rvvi0VMXHsyB738RB/z91ZWwZuuJPE0ZEOnC9UH/Q/LzUpdEXiyMxBlpZOs/u0n/kRdfFaOm9pzUt9xyX8sNXwUg6a+LJx3OfjjGY2tvknsnzVjoawFiAyouMOclCZIWLQYQESZvsx3ay+X5viFl2hmHqrbp6iCdAYNtJ9AJbzTFDM+RdlvU6v7orC16X7phtL/IJpUwBKF1mdNCK8eGczFXTGSsTQT33B+J2zQEkpVQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3+bmIg4wjm2qc8yIreyg11mjgAao2tIJuvFbWciS+s=;
 b=P4awv856kWzgxJJGvOwcf6gUPJUvmWo1Y4L0oaAsitocggWNrIGP3gXL/epBtY+BGBmlLMA1Mzur0Xro4ACmzxhG3Qsbgb9ZrB7BVCEwzpO99DvkOAwa5x789d6bVDWbppAWXE+eiEhxnTtKPGmciENSB/sq7603dsi76ztFECCdOdqo0fcB8llPoJVu15fb5fch+1RTPfycjoYW5AacfyDCRjTMCDAt1uXX4fMbcH3yxvbOiS1QRq8b5se0b9GuKi27NggaGuaqXmuSyC1+xujBn2hLzYtsMavdcXGPeJ2QKkOr+R+46nqWG9uS5Z7x3yYpWfo1LIcYu/zKiNRXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3+bmIg4wjm2qc8yIreyg11mjgAao2tIJuvFbWciS+s=;
 b=pnZv9R+eqZM89a6yQuJRiycn9cwgdS0ltW2qxwj4jZmvs558hX67qzqaHX1bAXgaoCEYB6BAeHk9PbYDjeEYbHy3aAsa/YSrjX3vpZfDEEE66oAp9expzy91EU5PbEaM55QbwVv/PQt7yAP/bHc8Titn4AfyFFcSpHW0yMeNEBs=
Received: from MN2PR13MB3374.namprd13.prod.outlook.com (10.255.236.83) by
 MN2PR13MB2622.namprd13.prod.outlook.com (20.178.254.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.10; Mon, 25 Nov 2019 05:57:48 +0000
Received: from MN2PR13MB3374.namprd13.prod.outlook.com
 ([fe80::4481:4560:7083:e4c6]) by MN2PR13MB3374.namprd13.prod.outlook.com
 ([fe80::4481:4560:7083:e4c6%7]) with mapi id 15.20.2495.014; Mon, 25 Nov 2019
 05:57:48 +0000
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
Subject: [PATCH v3 1/6] genirq: introduce irq_domain_translate_onecell
Thread-Topic: [PATCH v3 1/6] genirq: introduce irq_domain_translate_onecell
Thread-Index: AQHVo1VDopSZswPJJE2VT7JTBNGe5A==
Date:   Mon, 25 Nov 2019 05:57:47 +0000
Message-ID: <1574661437-28486-2-git-send-email-yash.shah@sifive.com>
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
x-ms-office365-filtering-correlation-id: 8acea5b6-82a9-4167-749d-08d7716c65ea
x-ms-traffictypediagnostic: MN2PR13MB2622:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR13MB26224B555E8D844897D9E5918C4A0@MN2PR13MB2622.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(366004)(396003)(39840400004)(189003)(199004)(186003)(6436002)(2906002)(316002)(14454004)(7416002)(54906003)(4326008)(11346002)(71190400001)(2616005)(50226002)(8936002)(110136005)(478600001)(6512007)(446003)(6116002)(8676002)(36756003)(3846002)(25786009)(81156014)(44832011)(305945005)(5660300002)(52116002)(76176011)(256004)(26005)(81166006)(71200400001)(6506007)(386003)(2501003)(6636002)(66446008)(66556008)(86362001)(66946007)(102836004)(99286004)(6486002)(7736002)(107886003)(64756008)(66476007)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR13MB2622;H:MN2PR13MB3374.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BKNvQ3gEwJwQ9VTZR117u22w7qHDkc2wfLxUSrpN4YByfU6k5/UzvO5mD1HEObeREyzOVccXGlHzYKVKPnYnEpHcCSlJSoiyAkzowK5vBEoRMeBaOE1Prjqe8N62ZbKbmrDLKUZiLyNyuiuCnidB15iRy2rhs2G/4jeKibQlMKeq+KbNX1j3eQiBcywzP/9xeVkW1aCCJiBUPx4/Pys3/MZN4+iRXuwVMEAxdcOPYomlzfVXkaTFNERQ3jEhap8vzLPSfCDiXdxIGUHjRcUNmePhhpX7sPfYVpgKTuJRYArnah1jyBd8LN8Jqd0je1AJZGTPenShj22+yyfn31/ysO5MLKOwEee7AubT9VGUsd9KwJj6JoCLFTXGhWafxyeuH+v3Hp8+5F5vP9PGPrSAIfTMd5c4GjF92mDCkXZGAr4LgQvewKr8y1gv8GuftDT9
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acea5b6-82a9-4167-749d-08d7716c65ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 05:57:47.8544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5p/nrJWMox8gPit1aWrblolfvkQ8XZLPVSkXY5EP/nUjZYNhdw6pIMc/PR6RtlheEh4jeAgOGJeVkDQT3fviA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB2622
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a new function irq_domain_translate_onecell() that is to be used as
the translate function in struct irq_domain_ops.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 include/linux/irqdomain.h |  5 +++++
 kernel/irq/irqdomain.c    | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

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
index 132672b..cf57d87d 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -987,6 +987,23 @@ const struct irq_domain_ops irq_domain_simple_ops =3D =
{
 EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
=20
 /**
+ * irq_domain_translate_onecell() - Generic translate for direct one cell
+ * bindings
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

