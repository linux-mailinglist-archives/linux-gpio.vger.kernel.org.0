Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5565E10D179
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 07:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfK2G1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 01:27:39 -0500
Received: from mail-eopbgr730051.outbound.protection.outlook.com ([40.107.73.51]:50176
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726205AbfK2G1j (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Nov 2019 01:27:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9aU/d2SxQVsjcXo7W6tLYWTQqlTvdl2468kagu46SQzTioHdP04FovUqBZklB6VAWAFxIlICOrPqxzKmArWYpS5tA2GnNFBK7BfWhEEHtyBYSSYzMvan3lQFuo6fbLLP6NSPp8CSTP4FipUjoxcvzVHoO+pdLkmGpUgfR02o/rA5hkzHOyDc5rTaiFjqD3+/M54QOK3HfiRpsTjuU+v98Gk2CbGKK9k76V0PhiLYmhhfO+ZaeWIgyUkd2ZnbJHPbSdQBBQ3zzvLeh/eVoKUi5BTRpMpS9q1zYU3fOAfv52ylW6CoN1rina2zmjUkIUqJp2aSrdWFj3fT25nvHBpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viUSNnsqM4Y7NnCnv2+KdWjxbq8l3IwXdzio077fP24=;
 b=kg6VwxbJO3/cLHqtNzhEtajpn3gNUz0o+n40e90ybvCK5MJ1Z+4P/zA5g2QFRjlp89G2lWKgbBGCu5clcpJDYnemNPKy7NHFal5MKvKHnaWhBF/tUbAzUaGMHJCMcBiCa43tj8lqZD7SZTbH6TU7IFSTjpm3DmvY5otT6vY1jn8M4HgHO0K80PGZP+JrduBcwMAodjGagvDBNLOywHfvrwA175rednw+1KqdAj9pR0+o09ca4cfNmxYtyDoZqiV+mr341m4x65ha9Iz7xUcQxYvbGlX6AhekAFz1E0GSdJfjUQJmgxbGZNyDGZdZK5ItgmHNZ9h2HWXujH9VCqGlIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viUSNnsqM4Y7NnCnv2+KdWjxbq8l3IwXdzio077fP24=;
 b=dDaWzIFF9cCuuynLT3hLCtwI/BwOBhoQyL1iu4oNhCF4Tm/kOnhPKC7Qu1Y9jB64V1HZCvRJ/rMp6Zp4lkw1T2nJ6slQilrL6JWt5QKdMbCAdL2zmP+/jNIE3lmNSbEcqinKNupZjkMPZYBhetIYF3HhAt593fLMpuGm2lx1FQA=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3621.namprd13.prod.outlook.com (20.180.14.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.7; Fri, 29 Nov 2019 06:27:35 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2495.014; Fri, 29 Nov 2019
 06:27:35 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "maz@kernel.org" <maz@kernel.org>
CC:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Subject: RE: [PATCH v3 5/6] gpio: sifive: Add GPIO driver for SiFive SoCs
Thread-Topic: [PATCH v3 5/6] gpio: sifive: Add GPIO driver for SiFive SoCs
Thread-Index: AQHVo1VQYzPWzURXhUW+zbyogELnYqeghcaAgAEtw2A=
Date:   Fri, 29 Nov 2019 06:27:35 +0000
Message-ID: <CH2PR13MB33682C26386CB4EE8A7EA1C98C460@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com>
 <1574661437-28486-6-git-send-email-yash.shah@sifive.com>
 <CACRpkdY7fGvTPcwwC0XU+XN2w_QUCj0MmOYhp183P3Lj7Qw8WA@mail.gmail.com>
In-Reply-To: <CACRpkdY7fGvTPcwwC0XU+XN2w_QUCj0MmOYhp183P3Lj7Qw8WA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5722f923-09e2-40a9-117a-08d774953942
x-ms-traffictypediagnostic: CH2PR13MB3621:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB362165964670A04D8AE3A8308C460@CH2PR13MB3621.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0236114672
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(39850400004)(136003)(376002)(366004)(346002)(396003)(199004)(189003)(13464003)(5660300002)(8936002)(53546011)(26005)(102836004)(52536014)(186003)(33656002)(71190400001)(99286004)(4326008)(2501003)(66066001)(6506007)(256004)(7696005)(71200400001)(76176011)(81156014)(81166006)(8676002)(25786009)(3846002)(6116002)(2906002)(478600001)(14454004)(7736002)(305945005)(74316002)(7416002)(55016002)(446003)(11346002)(44832011)(9686003)(316002)(86362001)(54906003)(110136005)(229853002)(6436002)(6246003)(107886003)(66476007)(66556008)(64756008)(66446008)(66946007)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3621;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zA3fOm6YafPUw3Nb2DnJbTlVo60S7E03zfjVeG86kJyKPCv/chA4Ei6zWpnS905j1BEUCjDGctyHKYaM3DmGKmIoql/KE+2INkejqBZXRd7ATyFhG4WkYCcfU77vYQT+rfHf75niK0iCUobgIavhkAo7HLJPtBQW77meAKz9egL78FHpWY/dbnCGxwU9fxaZc4HhewUze/Xl5n0WIXupiJXM5F9wlHtbkAayEYXPGFIjH8hoGllKhrigMXTWgOmfdqaP+rebn4aD/3mSaznmrd4Yra8hsU2E/12s1x27lThqmSqZMNL2PEjU6qtOl2dmb1beWJjUAUBmCPkTdNeBz2RcEjJMRJiJ3SQv5V2JdwxzjxVCdt3yVmMRAXyRS0BLddBXVDujrOA2QPI/wCL3mLgNJpfQdZFQF+L+L9DqU60cSnEmg9uynU2yEvrFH9iI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5722f923-09e2-40a9-117a-08d774953942
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2019 06:27:35.2346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fa8uHPabDltyStMfloGNmeGlpwVd45tHjPDtOz0rq+Y23V/qeBTd9rnf0MY3SidznM80wifou8r6ZaqGR1SoVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3621
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IFNlbnQ6IDI4IE5vdmVtYmVyIDIwMTkgMTc6NTANCj4g
VG86IFlhc2ggU2hhaCA8eWFzaC5zaGFoQHNpZml2ZS5jb20+DQo+IENjOiBiZ29sYXN6ZXdza2lA
YmF5bGlicmUuY29tOyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IG1hcmsucnV0bGFuZEBhcm0uY29t
OyBwYWxtZXJAZGFiYmVsdC5jb207IFBhdWwgV2FsbXNsZXkgKCBTaWZpdmUpDQo+IDxwYXVsLndh
bG1zbGV5QHNpZml2ZS5jb20+OyBhb3VAZWVjcy5iZXJrZWxleS5lZHU7IHRnbHhAbGludXRyb25p
eC5kZTsNCj4gamFzb25AbGFrZWRhZW1vbi5uZXQ7IG1hekBrZXJuZWwub3JnOyBibWVuZy5jbkBn
bWFpbC5jb207DQo+IGF0aXNoLnBhdHJhQHdkYy5jb207IFNhZ2FyIEthZGFtIDxzYWdhci5rYWRh
bUBzaWZpdmUuY29tPjsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IHJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFNhY2hpbiBHaGFkaQ0KPiA8c2FjaGluLmdoYWRp
QHNpZml2ZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNS82XSBncGlvOiBzaWZpdmU6
IEFkZCBHUElPIGRyaXZlciBmb3IgU2lGaXZlIFNvQ3MNCj4gDQo+IE9uIE1vbiwgTm92IDI1LCAy
MDE5IGF0IDY6NTggQU0gWWFzaCBTaGFoIDx5YXNoLnNoYWhAc2lmaXZlLmNvbT4gd3JvdGU6DQo+
IA0KPiA+IEFkZHMgdGhlIEdQSU8gZHJpdmVyIGZvciBTaUZpdmUgUklTQy1WIFNvQ3MuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZXNsZXkgVy4gVGVycHN0cmEgPHdlc2xleUBzaWZpdmUuY29t
Pg0KPiA+IFtBdGlzaDogVmFyaW91cyBmaXhlcyBhbmQgY29kZSBjbGVhbnVwXQ0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFlhc2ggU2hhaCA8eWFzaC5zaGFoQHNpZml2ZS5jb20+DQo+IA0KPiBSZXZpZXdlZC1i
eTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiANCj4gSSBzdXBw
b3NlIE1hcmMgd2lsbCBtZXJnZSBhbGwgcGF0Y2hlcyBpbnRvIHRoZSBpcnFjaGlwIHRyZWUgYXMg
dGhleSBhcmUgbG9naWNhbGx5DQo+IGRlcGVuZGVudD8gSWYgeW91IHdhbnQgdGhlIEdQSU8gYmlu
ZGluZ3MgYW5kIHRoaXMgZHJpdmVyIGRpcmVjdGx5IG1lcmdlZA0KPiAobm8gZGVwcykgdGhlbiBJ
IGNhbiBkbyB0aGF0IGFzIHdlbGwuDQoNClllcywgdGhlIEdQSU8gZHJpdmVyIGhhdmUgbG9naWNh
bCBkZXBlbmRlbmN5IG9uIGlycWNoaXAgcGF0Y2hlcy4gSXQgaXMgYmVzdCBpZiBNYXJjIG1lcmdl
cyBhbGwgdGhlIHBhdGNoZXMgaW50byB0aGUgaXJxY2hpcCB0cmVlLg0KDQpATWFyYyBaeW5naWVy
LCBBcmUgeW91IGdvaW5nIHRvIG1lcmdlIGFsbCB0aGUgcGF0Y2hlcyBpbnRvIHRoZSBpcnFjaGlw
IHRyZWU/DQoNCi0gWWFzaA0K
