Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9507D25F5B1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 10:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728217AbgIGIvt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 04:51:49 -0400
Received: from mail-vi1eur05on2069.outbound.protection.outlook.com ([40.107.21.69]:53025
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727122AbgIGIvt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 04:51:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhTQqkrIdSZZUKGnl5kC9O20LBmt7BUYsI0Or6nakrGPDekIkyPUvi7/GMbccew5hDIeRzEHEq2dvk2E5s9PzUJuOX4mcUKyIU8BQXkiFhekBDGwnk9vW4kdeTDEbXJ8loKnjLNfvuZx3wf3y1px+78al6WFt28TJlUzCnrJKGDDXouLn0eWTRCPrHNOGJvwitXJPBfW5/VV0Bq0qtF2SEon1Cz85Y52LIiVitmC0t5skH04iX0AD9eBt868fkrGzaOTeFptQhrPg/UeXDFs2KfSzg8h5HBcfDP7NObPbl42J8HsXQQVLBYvFYQz6kMQi6Cnr/vVRCosMU2nW0yV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLi2XLxMBXmClQD1ns4atB8aX0wyJ4nb7CwZBUUsJ4c=;
 b=mkoNDnvbw94wlD/e3QYYMQMYQ7CHYPAeTxedYX7iF22Kj58KgqM9d0/Cx8mlu4xtoBJLQi5cRqXn2LKmE/kFMhr28GeKU9p7odsNNN7GYI8wVPlQ16WGuqlL7twREyMyPN88jlvE20JP2zNQFLcr/3rgqo3cQlxMJ7LfpHNA/1tEAs/gRcAzWYXVqvRZYZOcXUhRkQDzn4XKLDibY8dbGcMh8QN+qgovneY5Bwqyk17xoK8ISq1N4yaJbmo+0aRoFWR5Nc0IzV/jXzRKRzpbWulNfobfjsrqK+2+JwzT76WjUzqP2pTiD0ixKTaNWS0bMkfgLU8aO5wKRlNEKm4i1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLi2XLxMBXmClQD1ns4atB8aX0wyJ4nb7CwZBUUsJ4c=;
 b=DYrciREW5Db1fS38H3GEHzKZcGwSI/ANW6EPGsWe9Y5YwploxFTYFQePf5LmCCzVXqg3We+xUQJY5h2yl05Ig6c9imCWHzHHhoye2dVV0sSDMXjP0ezrLnhj3/PPbgW+f9NNVMItUx77UyWYtKUknHTwkzJ0qcHmFgcecsSjo64=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 7 Sep
 2020 08:51:45 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 08:51:45 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     Sean Young <sean@mess.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Andy Duan <fugang.duan@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: RE: SONY IR issue
Thread-Topic: SONY IR issue
Thread-Index: AdaB1p1pGnCw2M4KThCyranS73PKeAATSO+AABVEJGAAD5nPAACKfohQAARZXYAAAEERUA==
Date:   Mon, 7 Sep 2020 08:51:45 +0000
Message-ID: <DB8PR04MB679515C3490C5087B29A6DA8E6280@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <DB8PR04MB679580C7C8E6888B56C8BDACE62C0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200903185513.GA31286@gofer.mess.org>
 <DB8PR04MB67950837E2355EA81FBAADD1E62D0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200904123050.GA11675@gofer.mess.org>
 <DB8PR04MB6795F1EA8A865A3CDCC79439E6280@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200907084053.GA32304@gofer.mess.org>
In-Reply-To: <20200907084053.GA32304@gofer.mess.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mess.org; dkim=none (message not signed)
 header.d=none;mess.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a61753f3-2365-4e85-354f-08d8530b3fce
x-ms-traffictypediagnostic: DBAPR04MB7432:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB7432AE5DA28637726D37D9E0E6280@DBAPR04MB7432.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: loIHdvPl1iLtJ29aqSCE5AfbIjgZ4RxQnPRSa351sYWw87ELDjJiNkOGMszTGXwk7MjcaJWVt8ciLXmmjHXpgwPklJi4+fIafKMsQQVk/gzE1kaijLYKMKK/yYVWpwGtIb2lsRLElk/C4uVQL4jsqyP9nNGmZdEXJPeKZ9agjMO/XZrECuhp+UP8FDPpGJqAU9a4268drrHfeAsY8wRiDkuC+4MMHetkarAM9D0BIVvVW3QMwZgiD361YEYHov3VvzqgYAkFzj8f/2WsCovOWQ9wTNnYuTudS3FMurwORbCUrqXmmGrN/Tg0eZTFwKBZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(7696005)(8676002)(6506007)(316002)(186003)(66476007)(64756008)(66556008)(86362001)(9686003)(55016002)(66446008)(6916009)(83380400001)(33656002)(8936002)(66946007)(5660300002)(2906002)(4326008)(3480700007)(52536014)(7116003)(26005)(478600001)(53546011)(71200400001)(76116006)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: eic1yRWcK01FDdXyixu8x4itBXVozHIyRkWA+fRLArdeotnX14PyYQaXNRoHCNV++k6jc1icJDqQRN22bJ3zMNmX3kmymrrw5f3KAe7mYtgB6VzBPuW4ShMOExw5F1DUviZeQrwujWoLbYOzVLEHmNiSReETAGJhlEuYhdTVeThUK1PUlwEh8KwFc7tmUrY4wxsZbv/2IJmO3BizVDLBACizUUsT4LzVkRCXPtDapjZYRce5NpCPcV6+T4iwwcyEC0/+n2vvrXZ20YrhZ/kWhobrRbLQGsGnU2tSdbc7RCXM2pkTSIFqWLhvICX5UuxXXNawtTOaa9PHHlI1lO4DVk2db7/V12m7LsygX4+XoiSAPI98JfLduEaSEtfXFxt4BVCUiTFxKyG1YBWEXSuJ43d2jYevZVnZWG9giYKWnOpS6zYf282rDLGpW0W7PPQxQq8AWoPeJfCK9D7Lh87p91xP/RpWJ9gZU2gTdgcM/hUjZX/+PgK1Hf3jGjNBLrg/hKa1X1C8Ui+Ys9yFBlsFe3RqkaWg7lpZ1yAV4VHDbvWmIqwSoWC8XntGY+KMKRQBWp52/0i7cG1s8gqUfQs2Vzf9VskkCd0AQOMKYNtJHBfTP8z6z1QmD5pOSHBVmjc2AiwIfPDEIret1hIXZVb+IQ==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a61753f3-2365-4e85-354f-08d8530b3fce
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 08:51:45.1765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jCzD4KwhTXV/1VRLDTcQM4XQC8pWtVP8mVCp0meCb3r7vjkVyf99BZkwenFD6qwj7IIugsVzidVspEkrrfFyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7432
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNlYW4gWW91bmcgPHNlYW5A
bWVzcy5vcmc+DQo+IFNlbnQ6IDIwMjDE6jnUwjfI1SAxNjo0MQ0KPiBUbzogSm9ha2ltIFpoYW5n
IDxxaWFuZ3FpbmcuemhhbmdAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVs
Lm9yZzsgQW5keSBEdWFuIDxmdWdhbmcuZHVhbkBueHAuY29tPjsNCj4gbGludXgtZ3Bpb0B2Z2Vy
Lmtlcm5lbC5vcmc7IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5j
b20+DQo+IFN1YmplY3Q6IFJlOiBTT05ZIElSIGlzc3VlDQo+IA0KPiBPbiBNb24sIFNlcCAwNywg
MjAyMCBhdCAwNjo1ODo0M0FNICswMDAwLCBKb2FraW0gWmhhbmcgd3JvdGU6DQo+IA0KPiAtc25p
cC0NCj4gDQo+ID4gPiA+ID4gSSB3b3VsZG4ndCBiZSBzdXJwcmlzZWQgaWYgdGhlIGdwaW8gZGV2
aWNlIGdlbmVyYXRlcyB0d28NCj4gPiA+ID4gPiBpbnRlcnJ1cHRzIGZvciB0aGUgYnJva2VuIHB1
bHNlIChvbmUgYWZ0ZXIgNjkwdXMgYW5kIGFub3RoZXIgYXQNCj4gPiA+ID4gPiAxMjAwdXMpLCBh
bmQgaWYgZGVjb2RpbmcgaGFwcGVucyBiZWZvcmUgdGhlIHNlY29uZCB0aGVuIHRoZSB3cm9uZw0K
PiBwdWxzZSBsZW5ndGggaXMgdXNlZC4NCj4gPiA+ID4gSSBhbHNvIGNoZWNrIHRoZSBudW1iZXIg
b2YgaW50ZXJydXB0IGdlbmVyYXRlZCBieSBncGlvLiBBZnRlciBJDQo+ID4gPiA+IHByZXNzIHRo
ZSBrZXksDQo+ID4gPiBSQyB0cmFuc21pdHMgNyBmcmFtZXMsIGl0IHNob3VsZCBjb250YWluIDE4
MiBmYWxsaW5nL3Jpc2luZyBlZGdlcy4NCj4gPiA+ID4gSXQgaW5kZWVkIHJlcG9ydHMgMTgyIGlu
dGVycnVwdHMgYW5kIGdvIHRocm91Z2ggaXJfcmF3X2V2ZW50X3N0b3JlDQo+ID4gPiA+IGZ1bmN0
aW9uIDE4MiB0aW1lcy4gU2luY2UgdGhlIG51bWJlciBvZiBpbnRlcnJ1cHQgaXMgYWNjdXJhdGUs
DQo+ID4gPiA+IGp1c3QgYSBmZXcNCj4gPiA+IGZhbGxpbmcvcmlzaW5nIGludGVycnVwdCBjb21l
cyBtdWNoIHF1aWNrbHkgdGhhbiBvdGhlcnMsIGJ1dCB0aGUNCj4gPiA+IGFuYWxvZyBzaWduYWwg
aXMgcGVyZmVjdC4gSXQgaXMgcmVhbGx5IG91dCBvZiBteSB1bmRlcnN0YW5kaW5nLiBJdCBzaG91
bGQgbm90IGFuDQo+IGlzc3VlIGluIElSIGxheWVyLg0KPiA+ID4NCj4gPiA+IEkgdGhpbmsgdGhl
IG5leHQgc3RlcCB3b3VsZCBiZSB0byBwdXQgZGV2X2RiZy9wcmludGsgaW4NCj4gPiA+IGdwaW8t
aXItcmVjdi5jLCBhbmQgc2VlIGlmIHRoZSByZXN1bHRzIGFyZSB0aGUgc2FtZSB0aGVyZS4gSSBz
dXNwZWN0IHRoZXkgd2lsbA0KPiBiZS4NCj4gPiBZZXMsIGFzIHlvdSBzdXNwZWN0ZWQsIHRoZSBy
ZXN1bHQgaXMgdGhlIHNhbWUgdGhlcmUuIEl0IHNlZW1zIHRvIGJlIGEgc3lzdGVtDQo+IG9yIGdw
aW8gaXNzdWUuDQo+ID4NCj4gPg0KPiA+ID4gPiA+ID4gSSBhbHNvIGhhdmUgYSBxdWVzdGlvbiwg
aWYgUkMgdHJhbnNtaXQgcmVwZWF0ZWRseSA2IHRpbWVzLCBhbmQNCj4gPiA+ID4gPiA+IFNPTlkg
ZGVjb2Rlcw0KPiA+ID4gPiA+IGRlY29kZSBhbGwgcmF3IGRhdGEgc3VjY2Vzc2Z1bGx5LCBpdCB3
aWxsIHJlcG9ydCB0byBpbnB1dA0KPiA+ID4gPiA+IHN1YnN5c3RlbQ0KPiA+ID4gPiA+IDYgdGlt
ZXMsIGRvZXMgaW5wdXQgc3Vic3lzdGVtIHdpbGwgc3RpbGwgcmVwb3J0IHRvIHVzZXJzcGFjZSA2
IHRpbWVzPw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSWYgdGhlIHNvbnkgZGVjb2RlcyB0aGUgc2Ft
ZSB2YWx1ZXMgNiB0aW1lcywgdGhlbiBzY2FuY29kZSB3aWxsDQo+ID4gPiA+ID4gcmVwb3J0ZWQg
NiBpbWVzLCBidXQgdGhlcmUgd2lsbCBiZSBvbmx5IG9uZSBrZXkgZG93biBldmVudCwgYW5kDQo+
ID4gPiA+ID4gYSBrZXkgdXAgZXZlbnQgYWJvdXQgMTAwbXMgYWZ0ZXIgdGhlIHRoZSBsYXN0IGRl
Y29kZSAocGx1cyBhIGZldw0KPiA+ID4gPiA+IG90aGVyIG1pbGxpc2Vjb25kcyBmb3IgdmFyaW91
cyB0aW1lb3V0cykuDQo+ID4gPiA+IFRoYW5rcyBmb3IgeW91ciBkZXRhaWxzLiBEb2VzIHRoaXMg
bWVhbiBpbnB1dCBzdWJzeXN0ZW0gd2lsbCBzdGlsbA0KPiA+ID4gPiByZXBvcnQNCj4gPiA+IHNj
YW5jb2RlIDYgdGltZXMsIGJ1dCBvbmx5IHJlcG9ydCBrZXljb2RlIG9uY2UgaWYgaXQgaXMgbWF0
Y2hlZD8NCj4gPiA+DQo+ID4gPiBFeGFjdGx5LiBUaGUga2V5Y29kZSBpcyBvbmx5IHJlcG9ydGVk
IG9uY2UsIHNvIHRoYXQgaWYgdGhlIHVzZXIgcHJlc3MgZS5nLg0KPiA+ID4gIjEiIHRoZXkgd2ls
bCBnZXQganVzdCBnZXQgb25lICIxIi4NCj4gPiA+DQo+ID4gPiA+IFNlYW4sIGJhc2VkIG9uIHlv
dXIgZXhwZXJpZW5jZSwgd2hlcmUgZWxzZSBkbyB5b3Ugc3VnZ2VzdCBtZSB0bw0KPiA+ID4gPiBs
b29rIGludG8NCj4gPiA+IHRoaXMgZnVydGhlcj8gSGF2ZSB5b3UgY2FtZSBhY3Jvc3Mgc3VjaCBj
YXNlLCBhIGZldyBpbnRlcnJ1cHQNCj4gPiA+IHJlc3BvbmRlZCBzbyBxdWlja2x5IHNvIHRoYXQg
ZnJvbnQgcHVsc2Uvc3BhY2UgaXMgbXVjaCBzaG9ydGVuPw0KPiA+ID4NCj4gPiA+IFRvIGJlIGhv
bmVzdCBJJ3ZlIG5ldmVyIHNlZW4gdGhpcyBiZWZvcmUuDQo+ID4gPg0KPiA+ID4gSSdtIG5vdCBz
dXJlIHdoYXQgdGhlIGNhdXNlIGNvdWxkIGJlLiBPbiB0aGUgcmFzcGJlcnJ5IHBpIGl0IGlzDQo+
ID4gPiBrbm93biB0aGF0IGxvdHMgdXNiIHRyYWZmaWMgY2F1c2VzIGRlbGF5cyBpbiB0aGUgZ3Bp
byBpbnRlcnJ1cHQNCj4gPiA+IGhhbmRsZXJzIGR1ZSB0byBzb21lIGhhcmR3YXJlIGlzc3VlLCBi
dXQgdGhpcyBjYXVzZXMgc29tZSBpbnRlcnJ1cHRzDQo+ID4gPiB0byBhcnJpdmUgbGF0ZS4gVGhp
cyBjYXVzZXMgc29tZSBvZiB0aGUgcHVsc2Uvc3BhY2UgdGltaW5ncyB0byBiZQ0KPiA+ID4gbG9u
Z2VyLCBhbmQgdGhlbiBsYXRlciBvbmVzIGFyZSBzaG9ydGVyIGFnYWluIGFzIGl0IGNhdGNoZXMg
dXAuDQo+ID4gPg0KPiA+ID4gU2ltaWxhcmx5IGlmIHRoZSBrZXJuZWwgaXMgcnVubmluZyB3aXRo
IGludGVycnVwdHMgb2ZmIGZvciB0b28gbG9uZywNCj4gPiA+IHNvbWUgb2YgdGhlIHRpbWluZ3Mg
d2lsbCBiZSBsb25nZXIgYW5kIG90aGVycyBzaG9ydGVyLg0KPiA+IFllcywgd2UgY2FuIHVuZGVy
c3RhbmQgdGhlIGludGVycnVwdCBhcnJpdmVzIGxhdGUgYW5kIGNhdXNlIHRoZSB0aW1pbmdzDQo+
IGluY29ycmVjdC4gQXQgbXkgc2lkZSwgYSBmZXcgaW50ZXJydXB0IGFycml2ZXMgdG9vIGZhc3Rl
ci4NCj4gDQo+IEknbSB3b25kZXJpbmcgd2hlcmUgeW91IGNhcHR1cmVkIHRoZSBJUiBzaWduYWwu
IElmIHlvdSBjYXB0dXJlZCB0aGUgSVIgc2lnbmFsDQo+IG9uIHRoZSB0cmFuc21pdHRlciBsZWQs
IG1ha2Ugc3VyZSB0aGUgcmVzb2x1dGlvbiBpcyBoaWdoIGVub3VnaCBzbyB5b3UgY2FuIHNlZQ0K
PiB0aGUgY2Fycmllci4gVGhlbiB5b3UgY2FuIG1ha2Ugc3VyZSB0aGVyZSBhcmUgbm8gZXJyb3Jz
IGluIHRoZXJlLg0KPiANCj4gSXQgbWlnaHQgYmUgYmV0dGVyIHRvIGNhcHR1cmUgdGhlIElSIHNp
Z25hbCBvbiB0aGUgZ3BpbyBzaWduYWwgZ29pbmcgaW50byB0aGUgU29DLg0KDQpZZXMsIHRoZSBz
aWduYWwgSSBjYXB0dXJlZCBpcyB0aGUgb3V0cHV0IG9mIHRoZSBJUiBkZXZpY2UsIGkuZS4gdGhl
IGdwaW8gc2lnbmFsIGdvaW5nIGludG8gdGhlIFNvQy4NCg0KQmVzdCBSZWdhcmRzLA0KSm9ha2lt
IFpoYW5nDQo+ID4gPiBJcyB0aGVyZSBhbnl0aGluZyB5b3UgY2FuIHRlbGwgdXMgYWJvdXQgdGhl
IGdwaW8gaGFyZHdhcmU/DQo+ID4gR1BJTyBpcyBmcm9tIG91ciBTb0MsIHBvd2VyIHN1cHBseSB3
aXRoIGV4dGVybiAzLjNWLCBhbmQgSSBjb25maWd1cmVkIGl0DQo+IGludGVybmFsIHB1bGwtdXAu
DQo+IA0KPiBUaGFua3MNCj4gU2Vhbg0K
