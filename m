Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8F826548E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 23:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgIJV54 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 17:57:56 -0400
Received: from mail-am6eur05on2080.outbound.protection.outlook.com ([40.107.22.80]:22249
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730416AbgIJLwW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Sep 2020 07:52:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSyGtDz3Wu9VSjQ3k67cGy9XRkf3jS2Ib7Q9gSsrpwFuIilg3Dj0rVNBncAHaV9oRDm/VW8jaaSnFJ6d1F/2a7JL3K5lb7mfcvLwD/6r58WdpszKRNaV7wFOZ9OX6RtScyXdCgyF+MNAlfayWsUbq69kU5emp2dQXE7YWUMqEx9DkHq3g4hvgeK5MmlTXgHS6HJbNnXPSRrVYcj8w7OCHRlp7LGMAXbnOp3Zt9OYkDL7H8MEhCSBmIlsYihcbZgRnGZjd1sbqHX7r7pdizqtgKzvUJhT+nkNEdG1XCjjHQmtYtvpt0/gZdLS3Z/+jWu88aBFFaoacWl80f7zvMcYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d52VfT4afyUfLOrLh2HJN2wQsuLpZWFoPC09B05xdos=;
 b=QhXcyNCipw3/DG8X9NBFWy+2RL8ODqM3YC98uDegEhR1+77yizLgouKOqmdFqCZUm8tc81G+CzvsEH40geTQW+PJKBA7BokhNP7ExjX6GUi8i2LJnsghLUIgYYxbnvqrCqTnC9xINr2W20OIVOW6snrHR+4rMvXapMr3JARZGQjdspgyj4GMlG33C++EjpmOR7wrLhCKEOHSP36xaaBOhuM0OzGcbBhPYUpaqKuU6cad8E7OqPkS6lw5vkjOSt2iqBtEGhG+fZmVNl8fqZ/7NOATzEPkOTFmJvN1at200YXR1qpTctQB0RE/Jeyo9djRJnCoRTje8gEsa1+2zTSusw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d52VfT4afyUfLOrLh2HJN2wQsuLpZWFoPC09B05xdos=;
 b=ASWOOkZmx4tmprAM4gmXyOXVIaENCAvhejVNXTEoTzGCzAYMkxu13JGXC3w7ecGhKY0GdC4AHeLTstktF+vjL1N+ngtlMJPuG2qOcsL7GlUiL8IDCUXYMuz19QOPNFoP0FUwl34wNR7xYZprfYwTeNwI/tJoAUtsJKLtELXruWs=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB8PR04MB5882.eurprd04.prod.outlook.com (2603:10a6:10:ae::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 11:52:18 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 11:52:18 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     Sean Young <sean@mess.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Andy Duan <fugang.duan@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: RE: SONY IR issue
Thread-Topic: SONY IR issue
Thread-Index: AdaB1p1pGnCw2M4KThCyranS73PKeAATSO+AABVEJGAAD5nPAACKfohQAARZXYAAAEERUAAx0uZAAGDBd3A=
Date:   Thu, 10 Sep 2020 11:52:18 +0000
Message-ID: <DB8PR04MB67959176915216CD8B87C005E6270@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <DB8PR04MB679580C7C8E6888B56C8BDACE62C0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200903185513.GA31286@gofer.mess.org>
 <DB8PR04MB67950837E2355EA81FBAADD1E62D0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200904123050.GA11675@gofer.mess.org>
 <DB8PR04MB6795F1EA8A865A3CDCC79439E6280@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200907084053.GA32304@gofer.mess.org>
 <DB8PR04MB679515C3490C5087B29A6DA8E6280@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <DB8PR04MB6795A60FBD4FBB3409C103E4E6290@DB8PR04MB6795.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB6795A60FBD4FBB3409C103E4E6290@DB8PR04MB6795.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mess.org; dkim=none (message not signed)
 header.d=none;mess.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7bea5ff9-f9b9-4994-e758-08d8557ff859
x-ms-traffictypediagnostic: DB8PR04MB5882:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB58823D686BFBB88356138712E6270@DB8PR04MB5882.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pwS39opdVjI//ClbNZCh532f7Q7jnnLp7f58midsFzlWTWvtZTlqkfUpT3uwWj1V3uCA2FSkZaXYCuQ6/ip0mUfuQ5PiPaEGqh6awN4jnh0wrrTahyoEoSKzD9R9e5WkSZs8zpCGkbnXqCqyKd3u9IuloiqBlE2u3six7OT+r0z80hPwpo+Gw1FPVnpcBGjyQn0NUxqFgHfsqif1HhMlHuGrhxf2JQHq+ee2oMybCA1z6V7X0kpES3Lna2TrKpeyrXgHEcYcFet+PE95MqykCISoR6+Zj5guc2G6kVtwKJnCD+Qowej1x/mer5LH/v8N+YWUNTFx5KITMyGDDnF9dw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(26005)(2906002)(6916009)(186003)(6506007)(54906003)(53546011)(478600001)(4326008)(8676002)(55016002)(86362001)(9686003)(33656002)(66556008)(8936002)(76116006)(66446008)(7116003)(66476007)(64756008)(71200400001)(66946007)(3480700007)(7696005)(316002)(52536014)(83380400001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: wcHQd/sUKCuM/75T75uZxq1AhIbINGGO73lw29TeK+BjeNNJ4F3JYMHusgVr24pwr4yznYgnIJ+xXXum4Bh2F9XzseJMWr4kmUwTdwQmlIs+5KXtCcNgMWcK7YpwTKM5SnG7iexcluWemfWZMvhcKEy/vZ0jwAq3LJfvgeYw1TMnRWfjADupCtng6fnx6Ae/B8QLe6YtNSibTwDFWomHypdWi0ej899sOduUKuVtyhnI4lAAUKzqQgkBAUi+f51JK3paMfxuNSpTjYX572fALgmHqcTm3R5xU4GR5gsd4EqnUA9GxpKHMtJjGwW0nVFEmIFP9ZcGn4CqDBLqsTmdf0iOWdKHT3jh6f3vg+OwbdGeLgtOOXGqzhR1v+MkO0yiA0hL9k/QxZUG53fN34sm39lIqtmE9jHkfVDMqKf23MHXiLk4eKdsxrsZwM2MjyVEscYHD0idItlZsQaMtU7f4TzUNAc5kp2LunE6MPF+ojnYKOGgODz0X6ZGYnn8T9/Q3fW1UXIG0NurkzE7Wf+BSR2DxcyLGuxh2W2UJb/vgNm18Oedip+RjJNz7kb1CVbvLU0TbLJwWchSuA9y2rg38Tiz5XkjQhQ4NIAmoHP94PSDoH23yGP+IqJ7xl5t/KmD8Z5GLag25hv+p9P5erODWA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bea5ff9-f9b9-4994-e758-08d8557ff859
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 11:52:18.6504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pB/Wa0VK8b3g7s6TNOFxj1yC0OAdFjVp1kWBew1PBiQ0Zm/L3zsZ/O+2jk0gHqjGHBYKbfwe1cxNEp/g/7MI9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5882
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpIaSBTZWFuLA0KDQpXZSBoYXZlIGFscmVhZHkgZm91bmQgdGhlIHJvb3QgY2F1c2UsIHVuYmFs
YW5jZWQgaW50ZXJydXB0IHJlc3BvbnNlIGNhdXNlIHRpbWluZyBpbmNvcnJlY3Qgd2hlbiBjcHVp
ZGxlIGFjdGl2ZS4gQWZ0ZXIgZGlzYWJsZSBjcHVpZGxlLCBHUElPIElSIHdvcmtzIGZpbmUuDQpI
b3dldmVyLCB0aGF0J3MgYSBiYXJiYXJpYyBwcmFjdGljZS4gSXQncyBpbXBvc3NpYmxlIGZvciB1
cyB0byBkaXNhYmxlIGNwdWlkbGUgaW4gYSByZWFsIHN5c3RlbS4gDQoNCk5vdyB0d28gaXNzdWVz
IGluIGZyb250IG9mIG1lOg0KT25lIGlzIGhpZ2ggY3B1IGxvYWRpbmcsIGFmdGVyIHRlc3Rpbmcs
IEdQSU8gSVIgY2FuIGFsd2F5cyBkZWNvZGUsIGl0IHNlZW1zIG5vdCBhIHNldmVyZSBwcm9ibGVt
LiBBbm90aGVyIGlzIGNwdWlkbGUsIGl0IGxlYWRzIHRvIGEgaGlnaCBwcm9iYWJpbGl0eSBvZiBk
ZWNvZGluZyBmYWlsZWQuDQoNCkkgaGF2ZSBhIGhhbGYtYmFrZWQgaWRlYSwgY2FuIHlvdSBoZWxw
IGV2YWx1YXRlIGl0PyBJcyBpdCBwb3NzaWJsZSB0byBkeW5hbWljYWxseSBkaXNhYmxlIGFuZCBl
bmFibGUgY3B1aWRsZSBmcm9tIGdwaW9faXJfcmVjdl9pcnE/IE9yIGRvIHRoaXMgc29tZXdoZXJl
IGVsc2UgaW4gSVIgZnJhbWV3b3JrPw0KDQpXaGVuIGZpcnN0IGVudGVyaW5nIGdwaW9faXJfcmVj
dl9pcnEsIGludm9rZXMgY3B1X2xhdGVuY3lfcW9zX2FkZF9yZXF1ZXN0IHRvIGRpc2FibGUgY3B1
aWRsZSwgY29uY3VycmVudGx5IHN0YXJ0IGEgdGltZXIuIFRoZW4gZW50ZXJpbmcgZ3Bpb19pcl9y
ZWN2X2lycSBhZ2FpbiBhbmQgYWdhaW4sDQpjaGVjayB0aGUgdGltZXIuIElmIHRpbWVyIHZhbHVl
IHNtYWxsZXIgdGhhbiBWQUxVRV9USU1FT1VULCBqdXN0IHJlc2V0IHRoZSB0aW1lci4gSWYgdGlt
ZXIgdmFsdWUgbGFyZ2UgdGhhbiBWQUxVRV9USU1FT1VULCBtZWFucyBvbmUgbG9vcCBmaW5pc2gs
IGludm9rZXMgDQpjcHVfbGF0ZW5jeV9xb3NfcmVtb3ZlX3JlcXVlc3QgdG8gZW5hYmxlIHRoZSBj
cHVpZGxlLiBUaGUgVkFMVUVfVElNRU9VVCBpcyB0aGUgZ2FwIGJldHdlZW4gY29udGludW91cyBz
aWduYWxzLiBUaGUgZGlmZmljdWx0IGlzIGhvdyB0byB0dW5lIFZBTFVFX1RJTUVPVVQgdG8gc2F0
aXNmeSBhbGwgSVIgcHJvdG9jb2xzLg0KDQpJIHdyb3RlIGEgZHJhZnQsIGFuZCBpdCBjYW4gd29y
ayBmaW5lIGF0IG15IHNpZGU6DQotLS0gYS9kcml2ZXJzL21lZGlhL3JjL2dwaW8taXItcmVjdi5j
DQorKysgYi9kcml2ZXJzL21lZGlhL3JjL2dwaW8taXItcmVjdi5jDQpAQCAtMTEsNiArMTEsNyBA
QA0KICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KICNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+DQog
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KKyNpbmNsdWRlIDxsaW51eC9wbV9x
b3MuaD4NCiAjaW5jbHVkZSA8bGludXgvaXJxLmg+DQogI2luY2x1ZGUgPG1lZGlhL3JjLWNvcmUu
aD4NCg0KQEAgLTIwLDEzICsyMSwzMiBAQCBzdHJ1Y3QgZ3Bpb19yY19kZXYgew0KICAgICAgICBz
dHJ1Y3QgcmNfZGV2ICpyY2RldjsNCiAgICAgICAgc3RydWN0IGdwaW9fZGVzYyAqZ3Bpb2Q7DQog
ICAgICAgIGludCBpcnE7DQorICAgICAgIHN0cnVjdCB0aW1lcl9saXN0IGNwdWlkbGVfY2hhbmdl
Ow0KKyAgICAgICBib29sIGNwdWlkbGVfYWN0aXZlOw0KKyAgICAgICBzdHJ1Y3QgcG1fcW9zX3Jl
cXVlc3QgcW9zOw0KIH07DQoNCitzdGF0aWMgdm9pZCBncGlvX2lyX2NwdWlkbGVfY2hhbmdlKHN0
cnVjdCB0aW1lcl9saXN0ICp0KQ0KK3sNCisgICAgICAgc3RydWN0IGdwaW9fcmNfZGV2ICpncGlv
X2RldiA9IGZyb21fdGltZXIoZ3Bpb19kZXYsIHQsIGNwdWlkbGVfY2hhbmdlKTsNCisNCisgICAg
ICAgaWYgKCEoZ3Bpb19kZXYtPmNwdWlkbGVfYWN0aXZlKSkgew0KKyAgICAgICAgICAgICAgIHBt
X3Fvc19yZW1vdmVfcmVxdWVzdCgmZ3Bpb19kZXYtPnFvcyk7DQorICAgICAgICAgICAgICAgZ3Bp
b19kZXYtPmNwdWlkbGVfYWN0aXZlID0gdHJ1ZTsNCisgICAgICAgfQ0KK30NCisNCiBzdGF0aWMg
aXJxcmV0dXJuX3QgZ3Bpb19pcl9yZWN2X2lycShpbnQgaXJxLCB2b2lkICpkZXZfaWQpDQogew0K
ICAgICAgICBpbnQgdmFsOw0KICAgICAgICBzdHJ1Y3QgZ3Bpb19yY19kZXYgKmdwaW9fZGV2ID0g
ZGV2X2lkOw0KDQorICAgICAgIGlmIChncGlvX2Rldi0+Y3B1aWRsZV9hY3RpdmUpIHsNCisgICAg
ICAgICAgICAgICBwbV9xb3NfYWRkX3JlcXVlc3QoJmdwaW9fZGV2LT5xb3MsIDEsIDApOw0KKyAg
ICAgICAgICAgICAgIGdwaW9fZGV2LT5jcHVpZGxlX2FjdGl2ZSA9IGZhbHNlOw0KKyAgICAgICB9
DQorICAgICAgIG1vZF90aW1lcigmZ3Bpb19kZXYtPmNwdWlkbGVfY2hhbmdlLCBqaWZmaWVzICsg
bXNlY3NfdG9famlmZmllcygxMjUpKTsNCisNCiAgICAgICAgdmFsID0gZ3Bpb2RfZ2V0X3ZhbHVl
KGdwaW9fZGV2LT5ncGlvZCk7DQogICAgICAgIGlmICh2YWwgPj0gMCkNCiAgICAgICAgICAgICAg
ICBpcl9yYXdfZXZlbnRfc3RvcmVfZWRnZShncGlvX2Rldi0+cmNkZXYsIHZhbCA9PSAxKTsNCkBA
IC02MSw2ICs4MSw5IEBAIHN0YXRpYyBpbnQgZ3Bpb19pcl9yZWN2X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQogICAgICAgIGlmIChncGlvX2Rldi0+aXJxIDwgMCkNCiAgICAg
ICAgICAgICAgICByZXR1cm4gZ3Bpb19kZXYtPmlycTsNCg0KKyAgICAgICBncGlvX2Rldi0+Y3B1
aWRsZV9hY3RpdmUgPSB0cnVlOw0KKyAgICAgICB0aW1lcl9zZXR1cCgmZ3Bpb19kZXYtPmNwdWlk
bGVfY2hhbmdlLCBncGlvX2lyX2NwdWlkbGVfY2hhbmdlLCAwKTsNCisNCiAgICAgICAgcmNkZXYg
PSBkZXZtX3JjX2FsbG9jYXRlX2RldmljZShkZXYsIFJDX0RSSVZFUl9JUl9SQVcpOw0KICAgICAg
ICBpZiAoIXJjZGV2KQ0KICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KDQpJbmRlZWQs
IHRvIGEgY2VydGFpbiBkZWdyZWUsIGl0IGNhbm5vdCBlbnN1cmUgdGhlIGZpcnN0IHNpZ25hbCB0
byBiZSBkZWNvZGVkLCBzaW5jZSBhdCB0aGF0IHBvaW50IGNwdWlkbGUgaXMgYWN0aXZlLCBpbnRl
cnJ1cHQgbWF5IGJlIGRlbGF5ZWQsIHNvIHRoZSBoZWFkZXIgbWF5IG5vdCBzYXRpc2Z5IHRoZSBw
cm90b2NvbC4NCkFjdHVhbGx5LCBJIGhhdmUgbm90IG1lZXQgc3VjaCBjYXNlIHVuZGVyIG15IHRl
c3QuIEx1Y2tpbHksIGl0IHdvdWxkIHRyYW5zbWl0IG11bHRpcGxlIHNpZ25hbHMgYXQgb25jZSBw
cmVzcy4NCg0KQmVzdCBSZWdhcmRzLA0KSm9ha2ltIFpoYW5nDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9ha2ltIFpoYW5nDQo+IFNlbnQ6IDIwMjDlubQ55pyIOOaX
pSAxNjo0MQ0KPiBUbzogU2VhbiBZb3VuZyA8c2VhbkBtZXNzLm9yZz4NCj4gQ2M6IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZzsgQW5keSBEdWFuIDxmdWdhbmcuZHVhbkBueHAuY29tPjsNCj4g
bGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pl
d3NraUBiYXlsaWJyZS5jb20+DQo+IFN1YmplY3Q6IFJFOiBTT05ZIElSIGlzc3VlDQo+IA0KPiAN
Cj4gSGkgU2VhbiwNCj4gDQo+IEdQSU8gSVIgUmVjdiBleHRyZW1lbHkgcmVseSBvbiB0aGUgcmVh
bC10aW1lIHBlcmZvcm1hbmNlIG9mIHRoZSBpbnRlcnJ1cHQNCj4gcmVzcG9uc2UsIGFmdGVyIHR1
cm4gb2ZmIGNwdWlkbGUsIElSIGNhbiB3b3JrIHN0ZWFkaWx5IG5vdy4NCj4gDQo+IE11Y2ggdGhh
bmtzIGZvciB5b3VyIGtpbmRseSBoZWxwLiDwn5iKDQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IEpv
YWtpbSBaaGFuZw0K
