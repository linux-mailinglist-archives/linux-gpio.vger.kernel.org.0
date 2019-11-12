Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F609F8F65
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 13:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfKLMMI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 07:12:08 -0500
Received: from mail-eopbgr700063.outbound.protection.outlook.com ([40.107.70.63]:56544
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726970AbfKLMMI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 07:12:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nO2ZES2f+AU7NfpL0Q849G7RfpsnTgOq3OYN9N7QLXVodh/gtD3WjibHSorsklQrTA7DyOmTE5jR8RWeeGFK930QbQRTT0KJCydNo9PHRlUiN+v6sJYqXRoCD0Zlqt+q40/xA/iIO/6YpQcO/2YqOa3T+4MO2K2nPKu0ebUNqqlkGB/P6qHVMnGxOkPiWwRYOBNGcAyc/u0MPG2kf61GE0DIgzxJnDxv+cPOuBR0omEhP8oA+w/geSW6lO06Q7qi4y8DTDV8Bp9BlnRbU2LmDwjNfOTzkO5l9DFizW3npEK/4te3vvtmN28MAR/z03Kh6vjUqyfbaeH5hRdXy/K+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxa/CBogdj8j8XuJbmYeGFh0eftJ0B6KQUSxLAa2K+w=;
 b=TGMZGy1Kjex2CU2qvn4xc3RTg6db3woq/lVw1/kWhyyPeahFZVrrZmY++bLVjX55veFGrH8AIi1H1Iykf7JdiXUUKRX3ii6JM3JySlPKWfF9KTgzXJmhM1XKLvOeZWM6yJXA93p/eO0zvXx8XCp27+S1n37xrcpjHkPqojfjy/g470WhUZrtJYWwSFbYCWL2WsacEL5CUXW1Vxt7a/U79bXZcrSMPBGbA/l/qDQak1jJx3lOP2myslenA3U0vbSByiooltbm3RWXVTjUe8tFqCLka854Xi3U1j0QeQGNzUHP/ZShrmhaLbQrIou3NyMnlKVVmRQk39kspe5y25rqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxa/CBogdj8j8XuJbmYeGFh0eftJ0B6KQUSxLAa2K+w=;
 b=Qg+c7Lyd1rQn8BTMpROSDJNmFi4f41tu5grxzhWHDW3JE5XRSfZqCKQYNcavMagtdyKi/2GqCila1B90ic/JGyYKSRdRg1VJEm6FUZmpZXs98Lb2Fa8bM2tBC9Qc6Z4lZ0azN42Hi7K7PCyeagywUEfmfeynuqE66YN/4CdqxDg=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3541.namprd13.prod.outlook.com (52.132.247.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.17; Tue, 12 Nov 2019 12:12:06 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2451.018; Tue, 12 Nov 2019
 12:12:06 +0000
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
Subject: [PATCH 2/4] gpio: sifive: Add DT documentation for SiFive GPIO
Thread-Topic: [PATCH 2/4] gpio: sifive: Add DT documentation for SiFive GPIO
Thread-Index: AQHVmVJmBhj+jTok9UKZTpmxOnAggA==
Date:   Tue, 12 Nov 2019 12:12:06 +0000
Message-ID: <1573560684-48104-3-git-send-email-yash.shah@sifive.com>
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
x-ms-office365-filtering-correlation-id: 521c19bb-e2b3-4fde-f985-08d7676988d3
x-ms-traffictypediagnostic: CH2PR13MB3541:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB3541C9AB783DE2E2C46155E98C770@CH2PR13MB3541.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(39840400004)(136003)(346002)(376002)(396003)(366004)(189003)(199004)(11346002)(186003)(14454004)(25786009)(486006)(107886003)(446003)(2616005)(476003)(66946007)(6116002)(3846002)(36756003)(478600001)(4326008)(7416002)(305945005)(2501003)(7736002)(2906002)(54906003)(110136005)(316002)(99286004)(6486002)(6512007)(44832011)(8676002)(14444005)(81166006)(6436002)(66066001)(76176011)(50226002)(81156014)(6636002)(8936002)(52116002)(5660300002)(26005)(386003)(6506007)(86362001)(102836004)(66556008)(66476007)(71200400001)(256004)(64756008)(71190400001)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3541;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d8zBPPRrEzdargIbduXTMNZmArqmUaV7eLwlrfA+FguVqBMxoojN4zUqbVxyJZwfERFlDu7B6inOk268JeCxiShCZn14zllDX0yQYnbj3DdZZ69oXvdHWGepfBz8QSF2Jc/Zkyk1VinbwMe5xRxRINaxbbcZmaDZSt8WIDc9fV5ZFDsBZ9qmRe2r2SPvKy0Eowl4pOvk3VWo5JU8QKE2p1H53Ml3GB4Mo6/eNQNRp7uWNUXfmFqeh/EbxaeYpw7VRIBbhp4wG4QRtDJrYse0ZPJ18aDLxDjf13WZS4a/RxuZPBfl9YmTyPi6nvNZh2KZMX4os4Mar7E3GVC/41lzKDfXg9RpSchhDeGAQre9xVZ3Myl/Ms5mkFnjWwAUgOiYLgoUng86zhmjUMqlNd0xQz5yWqB3giX3F7aKWHnUpRzgYSqVncamDAV+UgdqWxjr
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521c19bb-e2b3-4fde-f985-08d7676988d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 12:12:06.3683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vn7qWNhCF6sU4HBQkrW/HYXHhZZmvsKKy4Rshm9O1cF4knmQIhYbW7e7JxlqLrbEL4m9eDmnLxUVDSi99SQXfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3541
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DT documentation for GPIO controller added.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Compatible string update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/gpio/gpio-sifive.txt       | 33 ++++++++++++++++++=
++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sifive.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sifive.txt b/Docum=
entation/devicetree/bindings/gpio/gpio-sifive.txt
new file mode 100644
index 0000000..d3416d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-sifive.txt
@@ -0,0 +1,33 @@
+SiFive GPIO controller bindings
+
+Required properties:
+- compatible: Should be "sifive,<chip>-gpio" and "sifive,gpio<version>".
+  Supported compatible strings are: "sifive,fu540-c000-gpio" for the SiFiv=
e
+  GPIO v0 as integrated onto the SiFive FU540 chip, and "sifive,gpio0" for=
 the
+  SiFive GPIO v0 IP block with no chip integration tweaks.
+  Please refer to sifive-blocks-ip-versioning.txt for details.
+- reg: Physical base address and length of the controller's registers.
+- clocks: Should contain a clock identifier for the GPIO's parent clock.
+- #gpio-cells : Should be 2
+  - The first cell is the GPIO offset number.
+  - The second cell indicates the polarity of the GPIO
+- gpio-controller : Marks the device node as a GPIO controller.
+- interrupt-controller: Marks the device node as an interrupt controller.
+- #interrupt-cells : Should be 2.
+  - The first cell is the GPIO offset number within the GPIO controller.
+  - The second cell is the edge/level to use for interrupt generation.
+- interrupts: Specify the interrupts, one per GPIO
+
+Example:
+
+gpio: gpio@10060000 {
+	compatible =3D "sifive,fu540-c000-gpio","sifive,gpio0";
+	interrupt-parent =3D <&plic>;
+	interrupts =3D <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
+	reg =3D <0x0 0x10060000 0x0 0x1000>;
+	clocks =3D <&tlclk>;
+	gpio-controller;
+	#gpio-cells =3D <2>;
+	interrupt-controller;
+	#interrupt-cells =3D <2>;
+};
--=20
2.7.4

