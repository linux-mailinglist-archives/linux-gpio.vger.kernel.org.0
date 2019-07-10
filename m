Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D63164D20
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 22:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbfGJUC2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jul 2019 16:02:28 -0400
Received: from mail-eopbgr20069.outbound.protection.outlook.com ([40.107.2.69]:2052
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727595AbfGJUC2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jul 2019 16:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=p1hq.onmicrosoft.com;
 s=selector2-p1hq-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0vStd5LdcHDtjmzw820gkQRwygP2SeKMALDPVnksxs=;
 b=hp9k7O18b3hpt9wbENGPXy70/W4LhGouVsG4zlzueD8Wcxz8aazhSvvzD7So2JQRdc9/E6EwwjrG5i9fyZKCE+nblxhOJCX69XVqdZ0nIJV+OhyUxmuTZfMSeL+JDXvqRfQCX22iDGo6R5RaJR4YZKb7fo6HPJ5lhKa4Z4WHg7g=
Received: from HE1PR01MB3001.eurprd01.prod.exchangelabs.com (10.170.254.142)
 by HE1PR01MB3707.eurprd01.prod.exchangelabs.com (20.176.161.144) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.20; Wed, 10 Jul
 2019 20:02:22 +0000
Received: from HE1PR01MB3001.eurprd01.prod.exchangelabs.com
 ([fe80::74c9:e863:a713:f675]) by HE1PR01MB3001.eurprd01.prod.exchangelabs.com
 ([fe80::74c9:e863:a713:f675%5]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 20:02:22 +0000
From:   "Claus H. Stovgaard" <cst@phaseone.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
Thread-Topic: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
Thread-Index: AQHVNWaygtE5YLg6GUS3ZZF6c1XknKbCSh0AgAH/2YA=
Date:   Wed, 10 Jul 2019 20:02:22 +0000
Message-ID: <41aedb602385b66772c4d2003f9be1df6f93a528.camel@phaseone.com>
References: <20190708082343.30726-1-brgl@bgdev.pl>
         <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
In-Reply-To: <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2.110.44.75]
user-agent: Evolution 3.30.5 
x-clientproxiedby: HE1PR0902CA0040.eurprd09.prod.outlook.com
 (2603:10a6:7:15::29) To HE1PR01MB3001.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:1d::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=cst@phaseone.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f4dd2ea-4eaf-49a2-bd1c-08d70571857a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:HE1PR01MB3707;
x-ms-traffictypediagnostic: HE1PR01MB3707:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <HE1PR01MB37075A202542958483DBC908DAF00@HE1PR01MB3707.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(39850400004)(376002)(346002)(366004)(199004)(189003)(186003)(102836004)(386003)(26005)(66556008)(66946007)(66476007)(6506007)(55236004)(5660300002)(478600001)(6436002)(64756008)(53936002)(66066001)(66446008)(86362001)(305945005)(7736002)(8676002)(4744005)(99286004)(76176011)(52116002)(54906003)(58126008)(110136005)(14454004)(316002)(36756003)(6246003)(71190400001)(71200400001)(118296001)(68736007)(6116002)(3846002)(229853002)(2616005)(476003)(6486002)(486006)(6512007)(6306002)(966005)(2906002)(11346002)(446003)(4326008)(81156014)(8936002)(81166006)(14444005)(256004)(25786009)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR01MB3707;H:HE1PR01MB3001.eurprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: phaseone.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ju+IlTRUqAhRneuOEMRJfjE9KCTKbPMTkyr12ZpQxdGXdYi+4LG506Ga17tqNrTlSxD3tMdyQVkAaDKgP7g2IkkFW/K6nzxvdMc00TpzBE9Udt980XAhJdAI7o2wWfQ/rtcpEcGS0OJYXZs7zGADRZoxQS40wNXPXbGJ4W8tnRnly+HqKU6RijxG8wLP3ZuqU/LO7wrc7YK+AXERDzodTIM3VCI0oq1xd1aSRVbRlsi+JxpSI7tZtto8xa3BbHCIOUcXaE32IxzgjCoJfodVDYApAVUTgFNNBtT911vJnGajc1GU2O2HQazMSAo5vociTVStrPUxjK1YEPv6ha8TLI+c+E0U/8BsGbJdQtucO4aFIXvtYsK+C09563A6+wHJEDLnxKf7hPMgOSv0WLmS4w5M1I/ufuuIG0XL3KFqrqY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3DB97DC24C9D74399B7BA81FE758217@eurprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phaseone.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4dd2ea-4eaf-49a2-bd1c-08d70571857a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 20:02:22.8369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cbe5b4c6-877a-4fe4-be65-3be424dd0574
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cst@phaseone.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR01MB3707
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMNCg0KT24gdGlyLCAyMDE5LTA3LTA5IGF0IDE1OjMwICswMjAwLCBMaW51cyBXYWxs
ZWlqIHdyb3RlOg0KPiANCj4gSSByZW1lbWJlciBJIGhhZCB0aGlzIGRpc2N1c3Npb24gaW4gdGhl
IHBhc3QsIGFuZCBJIG1hZGUgYSBsYXJnZQ0KPiByZWZhY3RvcmluZyB0byBtYWtlIGl0IHBvc3Np
YmxlIGZvciBkcml2ZXJzIHRoYXQgbmVlZCBncGlvZF8qDQo+IGNhbGxzIHRvIHNpbXBseSBkbzoN
Cj4gDQo+IHNlbGVjdCBHUElPTElCDQo+IA0KPiBpbiBLY29uZmlnLg0KPiANCj4gVGhpcyBzaG91
bGQgc29sdmUgYWxzbyB0aGlzIHByb2JsZW0gSSB0aGluay4NCj4gDQo+IEhvd2V2ZXIgSSBkbyBy
ZWFsaXplIHRoYXQgdGhlcmUgbWF5IGJlIHNpdHVhdGlvbnMgd2hlcmUgcGVvcGxlDQo+IHNpbXBs
eSB3YW50IHRvIG1ha2UgR1BJTyBzdXBwb3J0IGVudGlyZWx5IG9wdGlvbmFsIHdpdGhvdXQNCj4g
aGF2aW5nIHRvIGUuZy4gY3JlYXRlIGN1c3RvbSBzdHVicyBhbmQgZW5jYXBzdWxhdGUgdGhpbmdz
DQo+IGluc2lkZSBpZiBJU19FTkFCTEVEKENPTkZJR19HUElPTElCKS4NCg0KWW91IHByb3Blcmx5
IHNhdyB0aGUgZW1haWwgaW4gbGludXgtaTJjLCBidXQgd2lsbCBqdXN0IGl0IGZvcg0KY29tcGxl
dGVuZXNzLg0KaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtaTJjJm09MTU2MjU3NDQyMTI0NTY2
Jnc9Mg0KDQpUaGUgYmFja2dyb3VuZCBmb3IgZ2V0dGluZyB0aGUgd2FybmluZywgd2FzIHVwZ3Jh
ZGluZyBhIHN5c3RlbSBvbg0KWGlsaW54IFp5bnFNUCBTb0MgZnJvbSA0LjE0IHRvIDQuMTkuIEFz
IHBhcnQgb2YgdGhpcyB1cGdyYWRlIHdwICh3cml0ZQ0KcHJvdGVjdCkgaGFzIGJlZW4gaW50cm9k
dWNlZCBpbiB0aGUgYXQyNCBkcml2ZXIsIHJlc3VsdGluZyBpbiB0aGUNCndhcm5pbmcgZnJvbSBj
b21zdW1lci5oIGFzIEkgZG9uJ3QgaGF2ZSBlbmFibGVkIEdQSU9MSUIuDQoNClJlZ2FyZHMNCkNs
YXVzDQoNCg0K
