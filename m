Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A7B1FCAE3
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 12:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgFQK3v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 06:29:51 -0400
Received: from mail-vi1eur05on2070.outbound.protection.outlook.com ([40.107.21.70]:6042
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725901AbgFQK3v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jun 2020 06:29:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGJci70p00+tn6+VAvjnecTArPiaFtozMfEEybJPD9CmI7gBT6xuSFZQwcTaqqdMMPkYZukVUG/g2y135Udo51rYrB7dxKuuOl/jzl3R1x+FtyXHkcVmUguydkVwj+hax0HYs0tBcijjYYjVMSC4OwmoWXbk4Z9PUaT0zWIvmFnDJRTik7frD0sK8XPoDU8hcJPWZPT2oJ7xJja61CiH5syCLj5dY5Vxta73AHLgoB9jKultcULJ26WEk8LONoTFF026RtygQREYdteqmAO3rnlVRLkpkc3vrhcxc2sU/0hV/f1sX+ORSZcnzuvuR00ceCBITkJ+ba3AjNIeeE7NlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzNpslDNw3i8luGdWPE8oqB01iM3dIvnonWn8KpVxkc=;
 b=TQ8dlVA0CkXVd/pTfn6yrrHGtxFHsMQg/YWGYbZi9HQVUxzyIQAWixfZdmm3BJww06S32K3gTjRXKvGErcjukpZxUN+ux3fPTPyLxhtm9uD3E03jDOVCHdtZM4rXwq3oTJc0A6qsT1nv+C4Ay2Gf7WeSOufqNSoWANJGlJIMdMJxIb3hrA4l1S12rilCFQq6oVBTgJWaTZqIHOanCc3uJIcGje2TSzVd1ni0KFPS3rkyDgeGASrMhx4wvqx+bfU0D9DKOFIZkYd0xJ9FkquQ4FigJj+HguxCBy3nyptylQhsNDm9ZVBjC18lPlpLVmypTA7wJz4IC0FI1qQSoErtDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzNpslDNw3i8luGdWPE8oqB01iM3dIvnonWn8KpVxkc=;
 b=G52mDbmea64UD0LM5HEi9PitnTPjuesTIiUHPF1MnsX34FLu/ZVWTzQ//hHdUWFZVp+vnBWynRvpBcl4aKmnjSVRH0z/5tKPNMaSHjW54WhfvpkfjY/5O6DdIxlxvU1hhHXoZdveEERff3+b9oY5W1EX3DDvrmyoiGefcCfPR9k=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4022.eurprd04.prod.outlook.com (2603:10a6:209:42::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Wed, 17 Jun
 2020 10:29:46 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 10:29:46 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V5 1/9] pinctrl: imx: Support building SCU pinctrl driver
 as module
Thread-Topic: [PATCH V5 1/9] pinctrl: imx: Support building SCU pinctrl driver
 as module
Thread-Index: AQHWP+Xe3FoK7wvcIE2WhqslqxeLCKja/NXggAAZlYCAAQ64MIAABz+AgABRaxA=
Date:   Wed, 17 Jun 2020 10:29:46 +0000
Message-ID: <AM6PR04MB4966243E1116C43C595CDD47809A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1591875295-19427-1-git-send-email-Anson.Huang@nxp.com>
 <1591875295-19427-2-git-send-email-Anson.Huang@nxp.com>
 <AM6PR04MB4966C661D52B43E6938FCBF4809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916610502199D90B4BFC5E3F59D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM6PR04MB49661AA8A25B73D04FFF6769809A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <DB3PR0402MB391687D9A9CFAAAEB3E4F236F59A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB391687D9A9CFAAAEB3E4F236F59A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d263d2e5-0540-4c76-e1ac-08d812a95b8b
x-ms-traffictypediagnostic: AM6PR04MB4022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4022DBAC168E4FAE4ABF6021809A0@AM6PR04MB4022.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /uPBJuh2gESHczZV3FS+f6PkUeqgxCfLhP+iFxOLPqilNHkxqskaYACtpuqM6cq7qLGkVb7+IYMGF3cZxhXurqPL/iUrCwwi9bAdyEvBEb/vanOP2TkjYCJS41TX8Hi28XIfLycr74G+pWlXolQCWI63tQ1tkPlAEJvIloqLTRB7oQMme4UhR7/6ZyyBon/WABLwEH1eHfBAvEqnG2tLNh9rFBlzA7kFAvCT3G3visK6pasQlPwgYJpxjLodUJF3C3A7LNVDTsblMDrKjq9H66tsTYYspibX29to1BCzStQ2dQ0DQFCEf7D1wEoe4txoulpPIxL219XmbzFQZH18NJsFE/COpsME+D1hARBadA42KcgIxySa9GboxJCzbU1D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(4326008)(5660300002)(52536014)(86362001)(55016002)(9686003)(478600001)(44832011)(186003)(2906002)(26005)(71200400001)(316002)(66446008)(66946007)(64756008)(66476007)(66556008)(110136005)(76116006)(33656002)(7696005)(8676002)(8936002)(6506007)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: hG1dJnAphRifZlJgS9sGqTO57H7mZhhO3AQUnmdvfDem5gtmJf19sjFUJRLsd+BmhG8vd0ojzLf1dPaqsw8Hpeqk7Yx+AWyK7qQ3MXQaaHyf+H48KQKmjT6nTZN2fGLis4cWzPqkq64ocOYIaOS1s4Y8wx9UQjs7ST8sjrTMgoaRGgZ1rK4g6G8+ubycUdd7JeKmRhTrogzVqD0gZLnB5umIGVLDaxNOjkJzuWDVFKb58wKSPXCK7hFMFhvX713SPv5eJncxfpahIlFWqESUvTa4WFB5rWyLxePGHURl6RGYOA006miWLDX7Yzqv4hVDiGsi1UpXXe+CR11qJdlzreil4qeszZ4lVUMJmHevpcft7Xcp0ghKviKR6Op6YMi/9K8wpm/xIFMp2H6nRApVXiWbeTpKqDFWWTlFi6lkIbeWUOEQq3+uKhmkGz9SBceYIBH0Ohf9Jek64Q41ZzOlr7qWzVay1n4RvIPKLuZHVDghawMvjdFDdhTQIM07pNfX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d263d2e5-0540-4c76-e1ac-08d812a95b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 10:29:46.6822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /N1LM/s97LOp87amvDmqy6kCCc4AGXzfbLku5EIicKgck8w8lqr/KgYyHI1EG4HNsqt7hIhDFYpFzAoXY3opjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4022
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Wy4uLl0NCg0KPiA+ID4gPiA+IC0gKiBAZGV2OiBhIHBvaW50ZXIgYmFjayB0byBjb250YWluaW5n
IGRldmljZQ0KPiA+ID4gPiA+IC0gKiBAYmFzZTogdGhlIG9mZnNldCB0byB0aGUgY29udHJvbGxl
ciBpbiB2aXJ0dWFsIG1lbW9yeQ0KPiA+ID4gPiA+IC0gKi8NCj4gPiA+ID4gPiAtc3RydWN0IGlt
eF9waW5jdHJsIHsNCj4gPiA+ID4gPiAtCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gPiA+ID4gPiAt
CXN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bDsNCj4gPiA+ID4gPiAtCXZvaWQgX19pb21lbSAqYmFz
ZTsNCj4gPiA+ID4gPiAtCXZvaWQgX19pb21lbSAqaW5wdXRfc2VsX2Jhc2U7DQo+ID4gPiA+ID4g
LQljb25zdCBzdHJ1Y3QgaW14X3BpbmN0cmxfc29jX2luZm8gKmluZm87DQo+ID4gPiA+ID4gLQlz
dHJ1Y3QgaW14X3Bpbl9yZWcgKnBpbl9yZWdzOw0KPiA+ID4gPiA+IC0JdW5zaWduZWQgaW50IGdy
b3VwX2luZGV4Ow0KPiA+ID4gPiA+IC0Jc3RydWN0IG11dGV4IG11dGV4Ow0KPiA+ID4gPiA+ICsJ
aW50ICgqaW14X3BpbmNvbmZfZ2V0KShzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsIHVuc2ln
bmVkDQo+ID4gPiA+ID4gK2ludA0KPiA+IHBpbl9pZCwNCj4gPiA+ID4gPiArCQkJICAgICAgIHVu
c2lnbmVkIGxvbmcgKmNvbmZpZyk7DQo+ID4gPiA+ID4gKwlpbnQgKCppbXhfcGluY29uZl9zZXQp
KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwgdW5zaWduZWQNCj4gPiA+ID4gPiAraW50DQo+
ID4gcGluX2lkLA0KPiA+ID4gPiA+ICsJCQkgICAgICAgdW5zaWduZWQgbG9uZyAqY29uZmlncywg
dW5zaWduZWQgaW50IG51bV9jb25maWdzKTsNCj4gPiA+ID4gPiArCXZvaWQgKCppbXhfcGluY3Ry
bF9wYXJzZV9waW4pKHN0cnVjdCBpbXhfcGluY3RybCAqaXBjdGwsDQo+ID4gPiA+ID4gKwkJCQkg
ICAgICB1bnNpZ25lZCBpbnQgKnBpbl9pZCwgc3RydWN0IGlteF9waW4gKnBpbiwNCj4gPiA+ID4g
PiArCQkJCSAgICAgIGNvbnN0IF9fYmUzMiAqKmxpc3RfcCk7DQo+ID4gPiA+DQo+ID4gPiA+IENv
bXBhcmVkIHdpdGggVjQsIHRoaXMgbmV3IGltcGxlbWVudGF0aW9uIHNlZW1zIGEgYml0IGNvbXBs
aWNhdGVkLg0KPiA+ID4gPiBJIGd1ZXNzIHdlIGRvbid0IGhhdmUgdG8gc3VwcG9ydCBQSU5DVFJM
X0lNWD15ICYmDQo+ID4gPiA+IFBJTkNUUkxfSU1YX1NDVT1tIGNhc2UuDQo+ID4gPiA+IFdpbGwg
dGhhdCBtYWtlIHRoZSBzdXBwb3J0IGEgYml0IGVhc2llcj8NCj4gPiA+DQo+ID4gPiBJIGFtIE5P
VCBzdXJlIGlmIHN1Y2ggc2NlbmFyaW8gbWVldHMgcmVxdWlyZW1lbnQsIHRoZSBmYWN0IGlzIG90
aGVyDQo+ID4gPiBub24taS5NWCBTb0MgYWxzbyBzZWxlY3RzIHRoZSBQSU5DVFJMX0lNWCB3aGlj
aCB3aWxsIG1ha2UNCj4gPiA+IFBJTkNUUkxfSU1YPXksIHNvIGluIHRoYXQgY2FzZSwgZXZlbiBh
bGwgaS5NWCBQSU5DVFJMIGRyaXZlcnMgYXJlDQo+ID4gPiBzZXQgdG8gbW9kdWxlLCBpdCB3aWxs
IHN0aWxsIGhhdmUgUElOQ1RSTF9JTVg9eSBhbmQNCj4gPiA+IFBJTkNUUkxfSU1YX1NDVT1tLCB0
aGVuIGJ1aWxkIHdpbGwgZmFpbC4gQW5kIEkgYmVsaWV2ZSB0aGUgYXV0bw0KPiA+ID4gYnVpbGQg
dGVzdCBtYXkgYWxzbyBjb3ZlciBzdWNoIGNhc2UgYW5kIGJ1aWxkIGVycm9yIHdpbGwgYmUNCj4g
PiA+IHJlcG9ydGVkLCB0aGF0IGlzIHdoeSB0aGlzIGNoYW5nZSBpcyBuZWVkZWQgYW5kIHdpdGgg
dGhpcyBjaGFuZ2UsDQo+ID4gPiBmdW5jdGlvbiBpcyBOT1QgaW1wYWN0ZWQsDQo+ID4gPg0KPiA+
DQo+ID4gSXMgaXQgcG9zc2libGUgdG8gYWRkIHNvbWUgY29uc3RyYWluc3QgdG8gbWFrZSBzdXJl
IFBJTkNUUkxfSU1YX1NDVQ0KPiA+IHZhbHVlIGlzIHRoZSBzYW1lIGFzIFBJTkNUUkxfSU1YPyBP
ciBjb21iaW5lIHRoZW0gaW50byBvbmU/DQo+ID4gSWYgd2UgY2FuIGRvIHRoYXQsIGl0IG1heSBl
YXNlIHRoZSBpbXBsZW1lbnRhdGlvbiBhIGxvdCBhbmQgbWFrZSB0aGUNCj4gPiBjb2RlIHN0aWxs
IGNsZWFuLg0KPiANCj4gQ29tYmluZSBQSU5DVFJMX0lNWF9TQ1UgYW5kIFBJTkNUUkxfSU1YIGlz
IE5PVCBtYWtpbmcgc2Vuc2UsIHNpbmNlIGZvcg0KPiBub24tU0NVIHBsYXRmb3JtcywgUElOQ1RS
TF9JTVhfU0NVIGlzIE5PVCBuZWNlc3NhcnksIHRvIG1ha2UNCj4gUElOQ1RSTF9JTVhfU0NVIHNh
bWUgdmFsdWUgYXMgUElOQ1RSTF9JTVgsIHVubGVzcyBtYWtlICJzZWxlY3QNCj4gUElOQ1RSTF9J
TVhfU0NVIiBpbiBQSU5DVFJMX0lNWCwgYnV0IHRoYXQgaXMgYWxzbyBOT1QgbWFraW5nIHNlbnNl
LA0KPiBiZWNhdXNlLCBQSU5DVFJMX0lNWCBkb2VzIE5PVCBkZXBlbmRzIG9uIFBJTkNUUkxfSU1Y
X1NDVSBhdCBhbGwuDQo+IA0KDQpQSU5DVFJMX0lNWF9TQ1UgY291bGQgYmUgY29uZGl0aW9uYWxs
eSBjb21waWxlZC4gDQpTb21ldGhpbmcgbGlrZSBmb2xsb3dzOg0Kb2JqLSQoQ09ORklHX1BJTkNU
UkxfSU1YKSArPSBwaW5jdHJsLWlteC1jb3JlLm8NCnBpbmN0cmwtaW14LWNvcmUteSA6PSBwaW5j
dHJsLWlteC5vDQpwaW5jdHJsLWlteC1jb3JlLSQoQ09ORklHX1BJTkNUUkxfSU1YX1NDVSkgKz0g
cGluY3RybC1zY3Uubw0KDQpDYW4geW91IHRyeSBpZiB0aGlzIHdheSBjb3VsZCB3b3JrPw0KDQpS
ZWdhcmRzDQpBaXNoZW5nDQoNCj4gVGhlIGNoYW5nZSBpcyBOT1QgdGhhdCBiaWcgSU1PLCBhbmQg
bm8gYmV0dGVyIGlkZWEgaW4gbXkgbWluZCwgaGF2ZSB0cmllZCB0aGF0DQo+IGluIHByZXZpb3Vz
IHZlcnNpb25zIG9mIHBhdGNoIHNlcmllcy4NCj4gDQo+IEFuc29uDQo=
