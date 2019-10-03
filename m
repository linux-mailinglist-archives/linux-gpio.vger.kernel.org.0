Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5710CA0DD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 17:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfJCPDb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 11:03:31 -0400
Received: from mail-eopbgr50060.outbound.protection.outlook.com ([40.107.5.60]:58638
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725874AbfJCPDb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 3 Oct 2019 11:03:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcfdO0BCRAsdGwzV7wRuhdhQvfZsg6c7T/xDLB+6MxIsuyx5aKRbv+NNWHQojD+0EAeRygCT7OJbNWC/FPpqNIkExrmlReY7m6zsW6b4XEQQVBhoyN+eYGS0cMU4ObcLl5v45dRVAbb4SpRaFsUwNAaf2lXddQC420wJ84MXlgNiRQ3qTDzh34HgB8EwjKfPPOU13zaDKW0jGYMHIiRwnKGNlcluPYil8fes4EMczVOvJmrIF3/KTWvaGMmgdxmmJIs3mJIXXS++OKBRgowOGl0r2uKR3efiLcOu0ZziKGQZ/Rr0fA+HFubZfTuH6e3tJi29ps0u/A5tIehakvrfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPWMFZrnCDQSkFqubBJkFuPnI42s2SkYQbBAUWrU1D0=;
 b=a0+mOQq9y4lsZZiNkrLZY1OwTSdRF47vSQM+yZpbWi1lAq0mAy59YhT3RlApOv1ELqJ2cK4xaLUEkIiksNcxBWM2CH32/OELWuSRLSLymY6jmZKXlW2AYlljIOzBoHTKzzjFd4aIbXMnx/hVcQBkecLs7nnZM5OV9z3eDqrFidw/U8PcbGi3cHGOLT4h3m9pEWHgdOQjemPDpe0Ec61k7jNpZVStfRgIPHvql9DNS36Nn7JmXsxncFmVrMlyE7aMEyW/lpdCZhN8ksKkLvGHscmZd1yxnRSYEjyvwCgVI9KNDPjjC37SjvFfokkccNe2uZb1NtfNHoFRinOjMLMZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sondrel.com; dmarc=pass action=none header.from=sondrel.com;
 dkim=pass header.d=sondrel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sondrel.onmicrosoft.com; s=selector2-sondrel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPWMFZrnCDQSkFqubBJkFuPnI42s2SkYQbBAUWrU1D0=;
 b=qkUzMgvSQlvOoJVocpnUYwUdmPfbsd51nEShqCaZ76NLc1xUaNNuTE18qGc+WLrm2E28/ZxOw9qvZrS/KjU8aNZ+OHNWJXgy59T6HFfdi1XpoRiY79/tb6UQbsMRfEkw6P3pta0gXs5PCsLomyT5TPHw4cy9EP63KGs2ZynTz7k=
Received: from DB7P191MB0314.EURP191.PROD.OUTLOOK.COM (52.134.99.151) by
 DB7P191MB0330.EURP191.PROD.OUTLOOK.COM (52.134.102.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 15:03:26 +0000
Received: from DB7P191MB0314.EURP191.PROD.OUTLOOK.COM
 ([fe80::41b3:6511:3af4:771b]) by DB7P191MB0314.EURP191.PROD.OUTLOOK.COM
 ([fe80::41b3:6511:3af4:771b%6]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 15:03:26 +0000
From:   James Hartley <james.hartley@sondrel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Bresticker <abrestic@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] pinctrl: pistachio: Pass irqchip when adding gpiochip
Thread-Topic: [PATCH] pinctrl: pistachio: Pass irqchip when adding gpiochip
Thread-Index: AQHVeKHaGuih/s7B0U+SBMqyiBGjvKdJBgcA
Date:   Thu, 3 Oct 2019 15:03:26 +0000
Message-ID: <928541b4-6e50-f23a-4e2f-c88777a4380c@sondrel.com>
References: <20191001214536.18477-1-linus.walleij@linaro.org>
In-Reply-To: <20191001214536.18477-1-linus.walleij@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [195.88.9.101]
x-clientproxiedby: LO2P265CA0345.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::21) To DB7P191MB0314.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:5:7::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=james.hartley@sondrel.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09c86a3e-40a3-415a-1952-08d74812d7c5
x-ms-traffictypediagnostic: DB7P191MB0330:
x-microsoft-antispam-prvs: <DB7P191MB0330D7B05B88C28BC1C12855F99F0@DB7P191MB0330.EURP191.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(376002)(396003)(346002)(39840400004)(199004)(189003)(51914003)(11346002)(256004)(66066001)(476003)(478600001)(31696002)(14454004)(26005)(4326008)(186003)(5660300002)(31686004)(6486002)(6436002)(8936002)(8676002)(81166006)(81156014)(66476007)(2906002)(3846002)(6116002)(7736002)(71200400001)(110136005)(64756008)(316002)(66446008)(66556008)(2501003)(66946007)(54906003)(102836004)(386003)(6246003)(36756003)(44832011)(446003)(86362001)(99286004)(76176011)(6506007)(486006)(53546011)(229853002)(25786009)(2616005)(52116002)(71190400001)(6512007)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P191MB0330;H:DB7P191MB0314.EURP191.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: sondrel.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yRhxDl8xF/DXQ5PaCeKMfacDuLKIrfOR4qKifRTGTopRVWfpedfe2mMZzjohSW9ywg7zxynlt0Ei9kk/lxNADpxGF9RzJPTAxKNZgGDoUVHQjDHaNu55I/FpPAFZ9yl2vRmoB1Lh3c2wWyLVzGbUpnrdxR7eoIFZqFrUnmKSMOYzv5Za0yqmJZ7x0h92ffirzIUT1FzKdBtRggmn9gOa77Btcd2Z0K7qvAiSEnvm5fsGy3v4cTm0d2I7NNbflxqydZTfd5C1BDuaWMj4mwqqzprJPRAY5IBkVvVWms/9eJzmgMixhCwsmyemsGX43XKMYflAGcNgmumZXHdCGtH+NVoanStrQhiVniF+J0UJqU1afdMcWodbKpzaRey+lMyZbcS4KAXC71NmW+a7gnjnvTzlyWxvyp7Psq59v0LuliI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <60AB35AA4C8ECB4296A7E8CB254BA367@EURP191.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sondrel.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c86a3e-40a3-415a-1952-08d74812d7c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 15:03:26.7321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4faa3872-698e-4896-80ec-148b916cb1ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sAgaYJhbLtzlKkx3+tJUyqa3xhkR3ERmmfWW0QLNPP8SA6dOao53lu2r7c1VqSX6IFy0os+YoyYsJb0d3fH8s1yEV2m1ozYTi80QAAB4pxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P191MB0330
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNCk9uIDAxLzEwLzIwMTkgMjI6NDUsIExpbnVzIFdhbGxlaWogd3JvdGU6DQo+
IFdlIG5lZWQgdG8gY29udmVydCBhbGwgb2xkIGdwaW8gaXJxY2hpcHMgdG8gcGFzcyB0aGUgaXJx
Y2hpcA0KPiBzZXR1cCBhbG9uZyB3aGVuIGFkZGluZyB0aGUgZ3Bpb19jaGlwLiBGb3IgbW9yZSBp
bmZvIHNlZQ0KPiBkcml2ZXJzL2dwaW8vVE9ETy4NCj4NCj4gRm9yIGNoYWluZWQgaXJxY2hpcHMg
dGhpcyBpcyBhIHByZXR0eSBzdHJhaWdodC1mb3J3YXJkDQo+IGNvbnZlcnNpb24uDQo+DQo+IENj
OiBBbmRyZXcgQnJlc3RpY2tlciA8YWJyZXN0aWNAY2hyb21pdW0ub3JnPg0KPiBDYzogSmFtZXMg
SGFydGxleSA8amFtZXMuaGFydGxleUBzb25kcmVsLmNvbT4NCj4gQ2M6IFRoaWVycnkgUmVkaW5n
IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwv
cGluY3RybC1waXN0YWNoaW8uYyB8IDI2ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1waXN0YWNoaW8uYyBiL2RyaXZlcnMv
cGluY3RybC9waW5jdHJsLXBpc3RhY2hpby5jDQo+IGluZGV4IDM3OWU5YTZhNmQ4OS4uZWI0MGFl
OWY4NjM5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1waXN0YWNoaW8u
Yw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1waXN0YWNoaW8uYw0KPiBAQCAtMTM1
Miw2ICsxMzUyLDcgQEAgc3RhdGljIGludCBwaXN0YWNoaW9fZ3Bpb19yZWdpc3RlcihzdHJ1Y3Qg
cGlzdGFjaGlvX3BpbmN0cmwgKnBjdGwpDQo+ICAJZm9yIChpID0gMDsgaSA8IHBjdGwtPm5iYW5r
czsgaSsrKSB7DQo+ICAJCWNoYXIgY2hpbGRfbmFtZVtzaXplb2YoImdwaW9YWCIpXTsNCj4gIAkJ
c3RydWN0IGRldmljZV9ub2RlICpjaGlsZDsNCj4gKwkJc3RydWN0IGdwaW9faXJxX2NoaXAgKmdp
cnE7DQo+ICANCj4gIAkJc25wcmludGYoY2hpbGRfbmFtZSwgc2l6ZW9mKGNoaWxkX25hbWUpLCAi
Z3BpbyVkIiwgaSk7DQo+ICAJCWNoaWxkID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUobm9kZSwgY2hp
bGRfbmFtZSk7DQo+IEBAIC0xMzgzLDIzICsxMzg0LDI4IEBAIHN0YXRpYyBpbnQgcGlzdGFjaGlv
X2dwaW9fcmVnaXN0ZXIoc3RydWN0IHBpc3RhY2hpb19waW5jdHJsICpwY3RsKQ0KPiAgDQo+ICAJ
CWJhbmstPmdwaW9fY2hpcC5wYXJlbnQgPSBwY3RsLT5kZXY7DQo+ICAJCWJhbmstPmdwaW9fY2hp
cC5vZl9ub2RlID0gY2hpbGQ7DQo+IC0JCXJldCA9IGdwaW9jaGlwX2FkZF9kYXRhKCZiYW5rLT5n
cGlvX2NoaXAsIGJhbmspOw0KPiAtCQlpZiAocmV0IDwgMCkgew0KPiAtCQkJZGV2X2VycihwY3Rs
LT5kZXYsICJGYWlsZWQgdG8gYWRkIEdQSU8gY2hpcCAldTogJWRcbiIsDQo+IC0JCQkJaSwgcmV0
KTsNCj4gKw0KPiArCQlnaXJxID0gJmJhbmstPmdwaW9fY2hpcC5pcnE7DQo+ICsJCWdpcnEtPmNo
aXAgPSAmYmFuay0+aXJxX2NoaXA7DQo+ICsJCWdpcnEtPnBhcmVudF9oYW5kbGVyID0gcGlzdGFj
aGlvX2dwaW9faXJxX2hhbmRsZXI7DQo+ICsJCWdpcnEtPm51bV9wYXJlbnRzID0gMTsNCj4gKwkJ
Z2lycS0+cGFyZW50cyA9IGRldm1fa2NhbGxvYyhwY3RsLT5kZXYsIDEsDQo+ICsJCQkJCSAgICAg
c2l6ZW9mKCpnaXJxLT5wYXJlbnRzKSwNCj4gKwkJCQkJICAgICBHRlBfS0VSTkVMKTsNCj4gKwkJ
aWYgKCFnaXJxLT5wYXJlbnRzKSB7DQo+ICsJCQlyZXQgPSAtRU5PTUVNOw0KPiAgCQkJZ290byBl
cnI7DQo+ICAJCX0NCj4gKwkJZ2lycS0+cGFyZW50c1swXSA9IGlycTsNCj4gKwkJZ2lycS0+ZGVm
YXVsdF90eXBlID0gSVJRX1RZUEVfTk9ORTsNCj4gKwkJZ2lycS0+aGFuZGxlciA9IGhhbmRsZV9s
ZXZlbF9pcnE7DQo+ICANCj4gLQkJcmV0ID0gZ3Bpb2NoaXBfaXJxY2hpcF9hZGQoJmJhbmstPmdw
aW9fY2hpcCwgJmJhbmstPmlycV9jaGlwLA0KPiAtCQkJCQkgICAwLCBoYW5kbGVfbGV2ZWxfaXJx
LCBJUlFfVFlQRV9OT05FKTsNCj4gKwkJcmV0ID0gZ3Bpb2NoaXBfYWRkX2RhdGEoJmJhbmstPmdw
aW9fY2hpcCwgYmFuayk7DQo+ICAJCWlmIChyZXQgPCAwKSB7DQo+IC0JCQlkZXZfZXJyKHBjdGwt
PmRldiwgIkZhaWxlZCB0byBhZGQgSVJRIGNoaXAgJXU6ICVkXG4iLA0KPiArCQkJZGV2X2Vycihw
Y3RsLT5kZXYsICJGYWlsZWQgdG8gYWRkIEdQSU8gY2hpcCAldTogJWRcbiIsDQo+ICAJCQkJaSwg
cmV0KTsNCj4gLQkJCWdwaW9jaGlwX3JlbW92ZSgmYmFuay0+Z3Bpb19jaGlwKTsNCj4gIAkJCWdv
dG8gZXJyOw0KPiAgCQl9DQo+IC0JCWdwaW9jaGlwX3NldF9jaGFpbmVkX2lycWNoaXAoJmJhbmst
PmdwaW9fY2hpcCwgJmJhbmstPmlycV9jaGlwLA0KPiAtCQkJCQkgICAgIGlycSwgcGlzdGFjaGlv
X2dwaW9faXJxX2hhbmRsZXIpOw0KPiAgDQo+ICAJCXJldCA9IGdwaW9jaGlwX2FkZF9waW5fcmFu
Z2UoJmJhbmstPmdwaW9fY2hpcCwNCj4gIAkJCQkJICAgICBkZXZfbmFtZShwY3RsLT5kZXYpLCAw
LA0KDQpJIGRvbid0IGhhdmUgYSBwbGF0Zm9ybSByaWdodCBub3cgdG8gdGVzdCB0aGlzIGJ1dCBh
cyB5b3Ugc2F5LCB0aGlzIGlzIGENCnN0cmFpZ2h0IGZvcndhcmQgY29udmVyc2lvbi4gVGhhbmtz
IGZvciB0aGUgcGF0Y2guwqAgQUNLLg0KDQpKYW1lcy4NCg0KDQo=
