Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEAEF8F72
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 13:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbfKLMMW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 07:12:22 -0500
Received: from mail-eopbgr700057.outbound.protection.outlook.com ([40.107.70.57]:60000
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726970AbfKLMMW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 07:12:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLgASq9/32Lh0MUnm8KytuHRKfjP2gR3zOptc3mc6sUu9Va5Lu4xXRkbVRtkVmlRplEXmQO0496NBkIe+p/fuuiJkCVuPB5u2+iYi0IJ+M7F9unlMsC3EUK6zUxQgtsbrU98ThMqJGepSBqVuDKW9Mgx4hugoxy7aI0T6h6UxTV6kCZ7Z7+PZjzYsUcmmgnKcfWIDB+7Qyh0WHTEhD5sm3+k5rvblxGcrPu+VTek/gjLa5Vm+zzF0mg3jMSwZk/XEwbGzbw/wXrjpcAhH8qnbK2kriiRI6aIi8xRZ26uxLp0JdNok0ba2R2RHdsSOCcbuduyxLzzqYmS/+InU707kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZtNaULOgo5BlFOvij4pkR5P0UvZDV4dwCoW0GuDIds=;
 b=lIZq39TpamI0JbEuVTxpKRPfjmBPUY1ecFSSoBfP5+yyyerANT39vIvzIIWBSPy3XgU7aWHw9cLR6tvGnp7QBoRnXkXGI9KaYYyAR4iXa11pyj0lVp2GoRk0hTEdhz8m/1T29nAihrCheXHsXsPXY5pX0Y/yxGbBtvu1cJt3Kg9noZBb7ALR15R2NONhNpNrs+5UnHRlSpX/KoyJQmvCf5CfiU0gr1yHo3f3F9whDlRgcbiTkVbUEwQPDx+4NbgrkgXeP1TqWe17GPmr1qH6aoUygG5V0AzAR+4HYOEq/v8c6l+QWMO/svEAtEYCokoZBvwRAhn6CaeLjLurzv/vZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZtNaULOgo5BlFOvij4pkR5P0UvZDV4dwCoW0GuDIds=;
 b=Mnb5QH8SnKdA5fua5Q/a6axP4eQg82TkLnHR9Acl6gizfWKMVNlAv+YR83sYtjQ61S/lec3Toedzn3iF18zDHELE6r3hp8kH4E8zB0pn1y4FzMHinyKxd9diK4+yyCdv+8UGhOvMcg5XLXxscqvifza4HrQHYZadRSUS1vFI+LY=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3541.namprd13.prod.outlook.com (52.132.247.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.17; Tue, 12 Nov 2019 12:12:20 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2451.018; Tue, 12 Nov 2019
 12:12:20 +0000
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
Subject: [PATCH 4/4] riscv: dts: Add DT support for SiFive FU540 GPIO driver
Thread-Topic: [PATCH 4/4] riscv: dts: Add DT support for SiFive FU540 GPIO
 driver
Thread-Index: AQHVmVJuVoBUr56Pbk6Ht/xANxxf1g==
Date:   Tue, 12 Nov 2019 12:12:20 +0000
Message-ID: <1573560684-48104-5-git-send-email-yash.shah@sifive.com>
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
x-ms-office365-filtering-correlation-id: 88bdbb03-31c4-411e-20cc-08d767699139
x-ms-traffictypediagnostic: CH2PR13MB3541:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB35411C45F0A244F1410B3C658C770@CH2PR13MB3541.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(136003)(346002)(39850400004)(376002)(396003)(366004)(189003)(199004)(11346002)(186003)(14454004)(25786009)(486006)(107886003)(446003)(2616005)(476003)(66946007)(6116002)(3846002)(36756003)(478600001)(4326008)(7416002)(305945005)(2501003)(7736002)(2906002)(54906003)(110136005)(316002)(99286004)(6486002)(6512007)(44832011)(8676002)(14444005)(81166006)(6436002)(66066001)(76176011)(50226002)(81156014)(6636002)(8936002)(52116002)(5660300002)(26005)(386003)(6506007)(86362001)(102836004)(66556008)(66476007)(71200400001)(256004)(64756008)(71190400001)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3541;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fQ4nMTQRYviTJExQpzrumm5nplZBVRO1yGtaPvEOr/MRiTniYnVTBxqqv3+/cVCXPLkMyI5wfcYmC3aUVhNgh6dIrx1+rGkEyJNxsEjqUQBljQRN/r1BYxqCHjiHaQ5i6QeFRjBASIC7f/jBNIabd0W/VLegaapfIIahs3Ce+llO20XdsKkK01oJi9evSEJykE+js+6Fwy48DjMImloVUAKQEHX+jPNCJ7mK8V/V07hyMjzKSdloF4PzSD8/WcEc5lBl8vofN2/1CohPsMywi9BYSj9PWiZMuOjlLKQ6hsAsRgYgf545YHZ4kRSYDo2piFDJoKRzUCadcT618zJVwmDavsEP3V3GVduMQC57mPSF/CzOzdAQ1MaeyFTKee1o983wAjwXQYOvWXT8Xr3sZ+aIbvgBPlkFeERvcUiwrOJJJkh8ahJsijDYjz+h4Ko3
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88bdbb03-31c4-411e-20cc-08d767699139
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 12:12:20.4480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2mZHbGgo7wwow0L9O4J7WoAk3xgWxS2+0YbQZ++Xy9+xR8wpKMoYKYuoF1oYC8mbK5fqgwJ1j6+AksS+Qlq6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3541
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the gpio DT node in SiFive FU540 soc-specific DT file.
Enable the gpio node in HiFive Unleashed board-specific DT file.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 14 +++++++++++++-
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  4 ++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/d=
ts/sifive/fu540-c000.dtsi
index afa43c7..2d7c284 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -246,6 +246,18 @@
 			#pwm-cells =3D <3>;
 			status =3D "disabled";
 		};
-
+		gpio: gpio@10060000 {
+			compatible =3D "sifive,fu540-c000-gpio", "sifive,gpio0";
+			interrupt-parent =3D <&plic0>;
+			interrupts =3D <7 8 9 10 11 12 13 14 15
+				      16 17 18 19 20 21 22>;
+			reg =3D <0x0 0x10060000 0x0 0x1000>;
+			gpio-controller;
+			#gpio-cells =3D <2>;
+			interrupt-controller;
+			#interrupt-cells =3D <2>;
+			clocks =3D <&prci PRCI_CLK_TLCLK>;
+			status =3D "disabled";
+		};
 	};
 };
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/ris=
cv/boot/dts/sifive/hifive-unleashed-a00.dts
index 88cfcb9..609198c 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -94,3 +94,7 @@
 &pwm1 {
 	status =3D "okay";
 };
+
+&gpio {
+	status =3D "okay";
+};
--=20
2.7.4

