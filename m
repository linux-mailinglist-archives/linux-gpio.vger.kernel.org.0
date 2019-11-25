Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D918F108888
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 06:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfKYF6L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 00:58:11 -0500
Received: from mail-eopbgr690051.outbound.protection.outlook.com ([40.107.69.51]:8004
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727085AbfKYF6K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Nov 2019 00:58:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqksa4KbsK2KwTdjmJef9Ic7enMfjLtG2u6ZeEpCvr03oU68IUt4zfyKslv+yKe9Fxice0lF+FC/oRxluC/lhZlHZ9AtwRWsYKSzG4UxI+cHY/Xeb56NPdkpJuvQqm69h30cjWDf6M1RNlPyjHEjNvplpb4L7AOeWE0/o323ohoewJNxBscvBXuC9MWFu1/v/MXzlBdvoU0yKcKRh5+Caw0ugM1k5tP9psgjBp1AaUOyjKXOZQf8VTgPCaX/I666Oaern8BwF8SuuLzP3poySpg6UVtWWcUx7AdsxO8u+XZaA6iPc9QwR6utOWtLicwkJRDnmDXXQXjmEM81EUqfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOOah1TvueSfyqsytPOgIXbJSpfUJF94Jx72tziVDQI=;
 b=TyJFQv4+nlY8YdIo3oaA5S0asQL1QKbs2iQuh2bynmC4CXVSA/g1crp//eorloRJ8/riXmJDLi/xYDJ/xcvjaTz1aTiWLW1FHj9TmZPLF/jHiOH3aFLK5OlFboTBBcby9YZOjzIFLdo7DMK9oj3ZaMUA3GHp3CSYkE7kZWNqUJ1ft6ZkHe2XIpFiMM05HDXgcFFr38LbisZVM1LnrMHiz2+kq5Sx1Vx0n3ewwPGVHo5/9rJM25VE1i5NcGmOnF1djw4VDX83npW1404BI/J05tBbezx/negOn8fTuaOmm0Ehi5CWqK68BMlgoLCIRM5IspUN8toh6NANRJMWLLzRqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOOah1TvueSfyqsytPOgIXbJSpfUJF94Jx72tziVDQI=;
 b=S8CwjsO4CEgVUigeEVtY52m0d0pIJD9cdYZUfVrOyGzS0Z3EUlbeDVIY1jmnah+otZ+EO5bmA8NefGiBzfe/ELQrtlFoLVC0RGZoTL2H90/Ha25J7hTpvp6GojnCmJAFg5O1tmYf/oTcN0Nqq6sl6dYN0EHc/hdmmEeqlwpRZHg=
Received: from MN2PR13MB3374.namprd13.prod.outlook.com (10.255.236.83) by
 MN2PR13MB2622.namprd13.prod.outlook.com (20.178.254.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.10; Mon, 25 Nov 2019 05:58:03 +0000
Received: from MN2PR13MB3374.namprd13.prod.outlook.com
 ([fe80::4481:4560:7083:e4c6]) by MN2PR13MB3374.namprd13.prod.outlook.com
 ([fe80::4481:4560:7083:e4c6%7]) with mapi id 15.20.2495.014; Mon, 25 Nov 2019
 05:58:03 +0000
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
Subject: [PATCH v3 4/6] gpio: sifive: Add DT documentation for SiFive GPIO
Thread-Topic: [PATCH v3 4/6] gpio: sifive: Add DT documentation for SiFive
 GPIO
Thread-Index: AQHVo1VNE222DuqgTUu1+xO+APnzeA==
Date:   Mon, 25 Nov 2019 05:58:03 +0000
Message-ID: <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
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
x-ms-office365-filtering-correlation-id: aaf55ab0-2e0a-4088-0754-08d7716c6f4e
x-ms-traffictypediagnostic: MN2PR13MB2622:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR13MB2622E087648DD28B1D2A0F158C4A0@MN2PR13MB2622.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(136003)(376002)(346002)(366004)(396003)(39840400004)(189003)(199004)(186003)(966005)(6436002)(2906002)(316002)(14454004)(7416002)(54906003)(4326008)(6306002)(11346002)(71190400001)(2616005)(50226002)(8936002)(110136005)(478600001)(6512007)(446003)(6116002)(8676002)(36756003)(3846002)(25786009)(81156014)(44832011)(305945005)(5660300002)(52116002)(14444005)(76176011)(256004)(26005)(81166006)(71200400001)(6506007)(386003)(2501003)(6636002)(66446008)(66556008)(86362001)(66946007)(102836004)(99286004)(6486002)(7736002)(107886003)(64756008)(66476007)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR13MB2622;H:MN2PR13MB3374.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VJCIiFLgsD0fDQFbjQA5kcV/36Ceu6gbSGHAYo5uRmtICM4h7rBtW9QnjgYZUb1SclrCJMLkAMgEmEt/fDIErkTBubLt2kmLCHYRjJDuDyq/DLx+JomijvN10URxTol2UBSxUlBWpEqT/7jmx8igE2m5k9XlAQHFEd8wX3TRUTsMB6AoLITFAYXN2tozbdtlE2EjFYKsX8UtPlLmotRFL4F2nTcuzwRasTiCfqHrmZWjbrPpZWhPMurcef3h8UzlHDII6bQ8QkpluPZjPWme+tgMpJpewo9HBwWRM+BrhurB6m7zOgnvtBsyyaNH6N5pVaKgUh5escSZatcNCSCdsoZEdu5j4frGYM1pesTQArFgaE4uUzL4ep/acevKG3B2ndusDhfPHJm/pcShhGnLNAzmLi01D1m8bU6DjHb31XDtIYtiKckEmCOmrQkvC+gak5qvcaDnthTbZO5VSpGOgf/S10seNNrt4BUrl/b7Ppk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf55ab0-2e0a-4088-0754-08d7716c6f4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 05:58:03.7953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: doKMFAT9KX3wT9i6xexqeWL4NVpSUDFeJ72UmZKARd8pR0EFfrQ1A+l5iWM8K4sicOvzOLz2hWr27qXpqx0/7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB2622
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DT json-schema for GPIO controller added.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Compatible string update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/gpio/gpio-sifive.yaml      | 69 ++++++++++++++++++=
++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sifive.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sifive.yaml b/Docu=
mentation/devicetree/bindings/gpio/gpio-sifive.yaml
new file mode 100644
index 0000000..49214bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-sifive.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-sifive.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive GPIO controller
+
+maintainers:
+  - Yash Shah <yash.shah@sifive.com>
+  - Paul Walmsley <paul.walmsley@sifive.com>
+
+properties:
+  compatible:
+    items:
+      - const: sifive,fu540-c000-gpio
+      - const: sifive,gpio0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      interrupt mapping one per GPIO. Maximum 16 GPIOs.
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  clocks:
+    maxItems: 1
+
+  clock-names: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - clocks
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/clock/sifive-fu540-prci.h>
+      gpio@10060000 {
+        compatible =3D "sifive,fu540-c000-gpio", "sifive,gpio0";
+        interrupt-parent =3D <&plic>;
+        interrupts =3D <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
+        reg =3D <0x0 0x10060000 0x0 0x1000>;
+        clocks =3D <&tlclk PRCI_CLK_TLCLK>;
+        gpio-controller;
+        #gpio-cells =3D <2>;
+        interrupt-controller;
+        #interrupt-cells =3D <2>;
+      };
+
+...
--=20
2.7.4

