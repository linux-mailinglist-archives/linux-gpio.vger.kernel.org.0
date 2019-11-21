Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7426104DCD
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 09:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfKUI02 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 03:26:28 -0500
Received: from mail-eopbgr790074.outbound.protection.outlook.com ([40.107.79.74]:10435
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726170AbfKUI02 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Nov 2019 03:26:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CML7GUZk99wddAzTZgJK0AaDnNwvapOsIHhdhQFxSLOZ8yxALndivk+YIXO4pnhV3CbIzXcDCB9XFcNEX8CDIia+9Pxh/G3fwFCdG1KatuhpSsf3cbjgNRqtNU8Nc+EgrQ6plPIm0g5HACmsN9GnXEL60i+fxjhKqyS7bls71G5i5NhmW2aEVhsxf4mDtxaWNi+K/+cp4JhpqoPmOOeKY2gavalM2yjJwWwbWz4Vrbl9Ny0W9WlYrRTVVQzNqGuJ+nyYDrUBNOMWYKuC8jtOUeWp4iMSMtbA9qVTHB/ISr1ZJprG4jF0ht1M+puTCYWbqolzVAXpiZQsB6k72MplNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lU9cWMIPiYHwVyQUUrfkQYj1anBgZAlTDlv6URNbx+U=;
 b=Lk4+5eVZ9ITSwnsoj/dG+twZWL11pxc0gzdXtnyu5p4RfRQzmOcnxIGZrwO23jPBuWcq8IaRR1Qq3KdqBazdvLYNvIOV7lWGukOV3cMsu0ayen3EY1XYsClUcRQkzhy7Z9abUscVmgPjRmIEnvWiNOihBb//wQ0BNbEret9FZv+Xz8UShvH9NCS7+cCXguDS11SZlLfRjYCVLlT7HEl63UkVdP6JUXzIpjKSy6+E90MWJo+6iiJDNkQo+ryczIvPZ40Da7wgi+57syVGQY83bB9L4M4R+t9ec7nro6pllv5zeN9W5iCnTcdl5hDvUw6qNi274r69aTAkx+q9zkYTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lU9cWMIPiYHwVyQUUrfkQYj1anBgZAlTDlv6URNbx+U=;
 b=tK7wnDUNLL4B2fVPf0VYXdRyqZh9wAYb7E9FAoOyNxjIgv7AinVc6g708Xlmm+5GBECGHEDlrdSXFpzCRYLwi4jCQiqG3lhjkLKr4AqEzsdB4PSqdx1IrBq91lVERT3bFYjJtxoyDndYEnn4VWILnNvwE95NQcACqLgOH8u0mVs=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3622.namprd13.prod.outlook.com (20.180.4.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.7; Thu, 21 Nov 2019 08:26:24 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.018; Thu, 21 Nov 2019
 08:26:24 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     Andreas Schwab <schwab@suse.de>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "maz@kernel.org" <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Subject: RE: [PATCH v2 5/5] riscv: dts: Add DT support for SiFive FU540 GPIO
 driver
Thread-Topic: [PATCH v2 5/5] riscv: dts: Add DT support for SiFive FU540 GPIO
 driver
Thread-Index: AQHVn3AcQeUBZ0Ytu0eVtL/jFebGtqeTxthcgAGEqlA=
Date:   Thu, 21 Nov 2019 08:26:23 +0000
Message-ID: <CH2PR13MB3368B53AE4978141B463A1418C4E0@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
        <1574233128-28114-6-git-send-email-yash.shah@sifive.com>
 <mvmlfsaoqp3.fsf@suse.de>
In-Reply-To: <mvmlfsaoqp3.fsf@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cd3682b-b9cc-4e31-b7e6-08d76e5c7ee0
x-ms-traffictypediagnostic: CH2PR13MB3622:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB3622C5A58B9702FFDD43C1EA8C4E0@CH2PR13MB3622.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(39850400004)(346002)(376002)(366004)(396003)(136003)(13464003)(199004)(189003)(446003)(102836004)(6436002)(478600001)(53546011)(6506007)(14454004)(11346002)(66446008)(66476007)(64756008)(66946007)(9686003)(66066001)(55016002)(26005)(4326008)(66556008)(44832011)(186003)(107886003)(3846002)(6246003)(229853002)(6116002)(8676002)(7736002)(8936002)(6916009)(33656002)(99286004)(2906002)(81156014)(81166006)(7416002)(305945005)(54906003)(256004)(316002)(25786009)(76176011)(5660300002)(71190400001)(71200400001)(7696005)(76116006)(52536014)(74316002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3622;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w3GIV36VhljK/osjGAy0eLVPUX4q63abjzJSkhTor5azxJ7q5t/uriAXIScmKoZtSJry/fJgjvzcvjznSm1+KYuEanPCdVzVqXEv+oUVlmHRhGFH8asrBVM5y+lL/W+G6WP/VQtEN1K0lri1pbKEFXV7geQthOYUujefzBKrRK4VuesZyPh4xAluEyB/1WoK63RTKNdPye2sPrDHJGpDwTCWQtvzLrtGAjjawcQsVM0+7vyQRVkOYkX4in71sW31+9VxaOAxnidTgJEYZxu1ed5pXSwUCYOHRAnuNAQvTbA3RDh2SgE6f5k3BhTj+tZs5OtENwd0GDrr566MQp6e8fI0AEFm6445uagQmcCRY3acc08d9nJ+eA3cJttkVFBZZUZMlIy9THPQQl9FKDZaA+T3Q5ODcDKbjS0rHhbGLFip7Xfbpmo+7R4fIVdUopzt
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd3682b-b9cc-4e31-b7e6-08d76e5c7ee0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 08:26:23.9288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arigcGFqJ2BvWXXIZxmyo/FsleuY2vE+DqFKZXvynEAi3SNrSoLGikLaQOMtbnneeBCsBjaG2yeQCC/gBSyDZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3622
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Andreas Schwab <schwab@suse.de>
> Sent: 20 November 2019 14:44
> To: Yash Shah <yash.shah@sifive.com>
> Cc: linus.walleij@linaro.org; bgolaszewski@baylibre.com;
> robh+dt@kernel.org; mark.rutland@arm.com; palmer@dabbelt.com; Paul
> Walmsley ( Sifive) <paul.walmsley@sifive.com>;
> devicetree@vger.kernel.org; aou@eecs.berkeley.edu;
> jason@lakedaemon.net; linux-gpio@vger.kernel.org; maz@kernel.org; linux-
> kernel@vger.kernel.org; atish.patra@wdc.com; Sagar Kadam
> <sagar.kadam@sifive.com>; tglx@linutronix.de; bmeng.cn@gmail.com;
> linux-riscv@lists.infradead.org; Sachin Ghadi <sachin.ghadi@sifive.com>
> Subject: Re: [PATCH v2 5/5] riscv: dts: Add DT support for SiFive FU540 G=
PIO
> driver
>=20
> On Nov 20 2019, Yash Shah wrote:
>=20
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > index 88cfcb9..609198c 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > @@ -94,3 +94,7 @@
> >  &pwm1 {
> >  	status =3D "okay";
> >  };
> > +
> > +&gpio {
> > +	status =3D "okay";
> > +};
>=20
> How about adding a gpio-restart?

I am planning to add it in a separate patch.

- Yash

