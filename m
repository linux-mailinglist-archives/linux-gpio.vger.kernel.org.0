Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7931034C0
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 08:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbfKTHAV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 02:00:21 -0500
Received: from mail-eopbgr740059.outbound.protection.outlook.com ([40.107.74.59]:33056
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727188AbfKTHAU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 02:00:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QudJtLN5gZkL0Q0uYE88gbELJwtZd2Lq0YDHcd9BB8SbXxGwAqB6c3LqEyYfzlxur0HzFDWHTZOtKblgUOlOfcK57U4XSfod4b2De9KnBJcT0qbAH522rBCWg9q6bXo2bonCz0pNnTSn13fdvYdKTB/zv/aAVefYdNwJbZxUnwzIaUYQsBRnjdboV0iY3wQV87U+jeMtDdVDIJYPp6amm+dV3gA+aP5WgB5b2gQ7ET4xav+cQz84eVJCoywWYI1lTzHJSTiX+3Z/gW3JU/OHK35slOqzXR6eIzjB13GviGT9InOcwaDH5vdOMjDeKPOnmiIbsTt/l9j8Sw7BHGHnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZtNaULOgo5BlFOvij4pkR5P0UvZDV4dwCoW0GuDIds=;
 b=LhDPPfaH4YSezCfTnlfV1UnRgpj9keXsVJ6Hr2Qz77/w0c6cliYtURBZM60RTR8VEXAx5VcfRDbVXnQ1fLqf/sQcMr9Kd6a/jC8YlA7MZd8YZfvC2cV2TMvpns6jaA42Pz9RrJAyUqIRFYEe88BD6w/C2NDEdTZKlPQdXk05wc5uVzPXla6iPPCNd0uFd/G4P6LxSRT64T4biAgAStROHZ7bScptdfunyDVdoD4rKdgyD5ERMmLQXEDO9KS1clLwlCflULkSow27icVZA8f84JEovGIGXR2zSUAIYpwCwmAB0rwJPgfrJKmysM42u6NvT4QkO/KmlG3GpHOF5el1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZtNaULOgo5BlFOvij4pkR5P0UvZDV4dwCoW0GuDIds=;
 b=kbYDpGR2mYzCJMx0dHws+iexY+MThCW+0Zsb9MXLmYdwDr55/pATUjgkt81AnonPr6IsX4xLO1L1mbvSt6MpKUm7kh0asKQY71j8R93mZhNl49kUM/QPRGTUvDYm+fF3mweYEHMn1sbOxmUNAG1Pe7+YKFDn6e11gQKsDFBgzjU=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3415.namprd13.prod.outlook.com (52.132.246.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.8; Wed, 20 Nov 2019 06:59:54 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 06:59:54 +0000
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
Subject: [PATCH v2 5/5] riscv: dts: Add DT support for SiFive FU540 GPIO
 driver
Thread-Topic: [PATCH v2 5/5] riscv: dts: Add DT support for SiFive FU540 GPIO
 driver
Thread-Index: AQHVn3AcQeUBZ0Ytu0eVtL/jFebGtg==
Date:   Wed, 20 Nov 2019 06:59:54 +0000
Message-ID: <1574233128-28114-6-git-send-email-yash.shah@sifive.com>
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
x-ms-office365-filtering-correlation-id: 1f318d4e-c5fb-413e-ac20-08d76d873f38
x-ms-traffictypediagnostic: CH2PR13MB3415:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB3415B8848CE35DC8EC7A75458C4F0@CH2PR13MB3415.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(39850400004)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(486006)(71200400001)(316002)(8676002)(6636002)(71190400001)(7416002)(8936002)(25786009)(99286004)(2906002)(54906003)(52116002)(76176011)(50226002)(2501003)(478600001)(110136005)(66066001)(86362001)(36756003)(81156014)(81166006)(386003)(6506007)(26005)(4326008)(102836004)(5660300002)(6512007)(476003)(446003)(11346002)(6486002)(186003)(2616005)(6116002)(3846002)(7736002)(305945005)(6436002)(66476007)(66446008)(66946007)(66556008)(14444005)(44832011)(64756008)(107886003)(256004)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3415;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fvvcx2Ee1oXlgGkchxJfkVUnrIEuXl82YPIZVKWU+0ssqbhZuzIr5dF2/eAg02IpDIZpZdkn3FS4bu5jvLrdH0f44yQXVH6Y+jjVn/VeOd1iySg25Y6yA/4TYzz9x3MhAvg6gUj9W7VOAB7fv1G1JJaSbiQYJOYweeauVpfSb+YLXzm9j/hZ2TbfhQEpl/laZzUeeEDOobWf6yOUonhjCg49XUcEHjqLiuqTGmpoxtSUdfC0oxCej8FW+UCiW5EhoL8wpUn5HG+c/9TRx7AmG9fNkAcJQRC3c5QKPhFdihZpbLs4O4l2Zzct7chpXg1ll9+iK26wlY3ymTDWT2CQoRBAGWr3M9VjqwW0c4jY7yYIM59xjC7k4aHjdLyAV85cQl6mjaklT8xuGSPGuMX5FG85cZrXEiiOiYRie0uE5Y9fKIKVrRne1m2tFtyV86jc
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f318d4e-c5fb-413e-ac20-08d76d873f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 06:59:54.7814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVZ7l/Xxvn6s7QRaWf3FMKOVCS9bzXtpmmTGRpSS8WvAOYwJYSYkuD276z0SPm3fw9MNzZaEYS/o7QzBguFNkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3415
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

