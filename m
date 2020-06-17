Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C601FC438
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 04:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgFQCn5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 22:43:57 -0400
Received: from mail-am6eur05on2062.outbound.protection.outlook.com ([40.107.22.62]:34305
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726497AbgFQCn4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 22:43:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyqL50+PAL+fnSkUGjjC6BXcU6Nnc4KcrdYQH7uvLyH381HglttgEk7v3r1nOtj55Fikj+ojXbKrINK+VGdgpuxrZpMowg1GmYu+vfSt6ADwuh3JBHinSMKzo9LucEcNUyxusem5sq1sgNWNmRfXviupO6iFuVq/O26fUFQZsYVfBt8QptnidZlJvXvFSMdL367Y74nb9LTUVRoU2QYHr/YtCwAlNS7LZmbuhQ4aMlmHjpROqm91QQnA2/ud6w6wguNrIF6WHod9EekQGbjZibO6r7SpidG7D0CtaTYgPkjVJGgIoQLWnpgqpNPXQQJkaPMzuaZDVTvsXZ8yF/E+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ARIMcuSsikMMaeuNJ9CaAPhwddtJvXUflRHJjsqA3g=;
 b=aidayyu5Ta/Wc5OszRFKiIUwL72OkYc5OXqW2gr7VP32/6dXIZ9Krl7IAKykyun4vblMLHTPHOZHl0jnFQhtDnPoUYNlG0FdglE+GBPCKY9LcpMHp720brsuEn8Kv2IqZ/4SD86qXE0SP8klslu4+HaBk3CH1K66pE0ZNKBqO0dfYUqUpiQZc2RJnCjm7XsLUJvY+iOipOTpX1kZ8HPka+IUt16E6T1WEN+6BqfwR897cKcN40+im/RIBpGrxnbhOQ+4aKPfYcxh/TouEz1f7BdNnAPPWoP2BLMiIY1QpJZ5JrZMBIc1zDU0OAKEarH++y6ArHtUkJ1IMmh7ZHB6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ARIMcuSsikMMaeuNJ9CaAPhwddtJvXUflRHJjsqA3g=;
 b=Tw7w1l1PmIHl7MWvLfo7eV/m37l2pmUjHz/aJImOlwBV2Wbg7SLw8p4/kR0kmvXdzdN+qM2j/+cNtrfRVp0S3KAaoQd+nJvCPiEH0ogekGG7UGRQ585hVQxv2AHPBBmQeWQSOmfv7ZKi7KtVZof5ZDjyJlMEfJG/HOuwYEDfJiQ=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB6312.eurprd04.prod.outlook.com (2603:10a6:20b:72::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Wed, 17 Jun
 2020 02:43:52 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 02:43:51 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v2] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Topic: [PATCH v2] Revert "pinctrl: freescale: imx: Use
 'devm_of_iomap()' to avoid a resource leak in case of error in
 'imx_pinctrl_probe()'"
Thread-Index: AQHWPg9qyrpD8Vbzpk+sM4v78r2CgajalTWAgAEC94CAAIFfQA==
Date:   Wed, 17 Jun 2020 02:43:51 +0000
Message-ID: <AM6PR04MB4966633BA4F9B16F691987F5809A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1591673223-1680-1-git-send-email-haibo.chen@nxp.com>
 <AM6PR04MB4966D0FCE44CC173F95C139A809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <CAHp75VdvV-tBtZKU6WKHJy+yuesaq6c=PbxCFaJuvujeWhmm-Q@mail.gmail.com>
In-Reply-To: <CAHp75VdvV-tBtZKU6WKHJy+yuesaq6c=PbxCFaJuvujeWhmm-Q@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 29373701-1da8-4b0d-b2da-08d812684535
x-ms-traffictypediagnostic: AM6PR04MB6312:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB631299A3BB895B1DD4A985F9809A0@AM6PR04MB6312.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:328;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q/Ijh5FcQp+yCz6WY/opPMNIzgJa1ILjflGwm596aVrwtmcV9oPXF/rTHHFYPyzJg4Q4Vx0UtwbNsIL7h0j4AOpNRC7o6zRydNHmfCVcuz+qMeK2wyE17NlcYrNxGgveXamrMaop9FedbDlPV0sRNzCWkgBLDSfM87XxgvDDcFvlZGQEEp9AZfIiIwmDaAsvW5hK810mI38ma41PJeQe24DTplc5jC62izjAeXrtRGn9CWNdfvwQV5H9q7QjVIq4lVuPGxfb1jnLKGW815UKzdb9cyb45uVkMZvotsysPLL24n/EThpnW8Xu0CuQkFloEjp6qc8vhpHUnSuWI8pgHw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(4326008)(26005)(53546011)(9686003)(6506007)(52536014)(2906002)(8936002)(8676002)(7696005)(33656002)(478600001)(5660300002)(186003)(55016002)(54906003)(66446008)(66946007)(66476007)(66556008)(7416002)(86362001)(44832011)(83380400001)(316002)(76116006)(6916009)(71200400001)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rBzFtnoCZ0jegU7fV2cnYJHuQzImg6BYOLdMSJducwyyv2EGHpuD4o0CVUFdynCf9oyc5HQlpRbKYOfS6JR4gjxq5Tm/tJ9J7JwmQvja3iKMkdI9CNQrEPZggipNto348Jb60DpxVbNoLomyiZbI7VuvpZPDBM5+pqv/RrpqL5PlS3oRx8qfNngp0at9RXOJ6kMZqQm8gDd3D40LbCfk4NFQgzDFtYyT+wpSp/dN74SW/rWQUMZ1hhj4yok0Bos1epYK+0T8q4jpc9Q6IO+ntaQKnSnJohh709UDP3iaZf36+mq6xcteUDfA/caUHLhPOU5SaalnSjvZ6xkD4lZwhzal/imoox9Gx5kj3Ydq9UCg1IxK14Ys8n67ryytZZ1QlT79JQctsEBnsSbjg6lhr2OW8yrzztSyuH3IHOF+5Fk2gEIYX/wln2Mat5C6tQ3OVKWXp/xoQibcz7bGWsaj9SbPy5MIDcVGc0hDb/cOZfk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29373701-1da8-4b0d-b2da-08d812684535
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 02:43:51.8202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9QeGGoK/HNJtlJNQwER7k3y60jaoKJ3Vi+lr3VQO6dOb2ybxZfOm4p1zYfJMEy6hepbA1xpLgKg9StvhtqS44Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6312
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+DQo+IFNl
bnQ6IFdlZG5lc2RheSwgSnVuZSAxNywgMjAyMCAyOjE2IEFNDQo+IA0KPiBPbiBUdWUsIEp1biAx
NiwgMjAyMCBhdCA1OjU0IEFNIEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+
IHdyb3RlOg0KPiANCj4gPiBDb3VsZCB5b3UgaGVscCBhcHBseSB0aGlzIHBhdGNoIGFzIGl0IGJs
b2NrZWQgTVg3RCBib290aW5nIGZvciBhIHdoaWxlPw0KPiANCj4gPiA+IFRoaXMgcmV2ZXJ0cyBj
b21taXQgYmE0MDMyNDI2MTVjMmM5OWUyN2FmNzk4NGIxNjUwNzcxYTJjYzJjOS4NCj4gPiA+DQo+
ID4gPiBBZnRlciBjb21taXQgMjZkOGNkZTUyNjBiICgicGluY3RybDogZnJlZXNjYWxlOiBpbXg6
IGFkZCBzaGFyZWQNCj4gPiA+IGlucHV0IHNlbGVjdCByZWcgc3VwcG9ydCIpLiBpLk1YN0QgaGFz
IHR3byBpb211eCBjb250cm9sbGVycyBpb211eGMNCj4gPiA+IGFuZCBpb211eGMtbHBzciB3aGlj
aCBzaGFyZSBzZWxlY3RfaW5wdXQgcmVnaXN0ZXIgZm9yIGRhaXN5IGNoYWluIHNldHRpbmdzLg0K
PiA+ID4gSWYgdXNlICdkZXZtX29mX2lvbWFwKCknLCB3aGVuIHByb2JlIHRoZSBpb211eGMtbHBz
ciwgd2lsbCBjYWxsDQo+ID4gPiBkZXZtX3JlcXVlc3RfbWVtX3JlZ2lvbigpIGZvciB0aGUgcmVn
aW9uIDwweDMwMzMwMDAwLTB4MzAzM2ZmZmY+IGZvcg0KPiA+ID4gdGhlIGZpcnN0IHRpbWUuIFRo
ZW4sIG5leHQgdGltZSB3aGVuIHByb2JlIHRoZSBpb211eGMsIEFQSQ0KPiA+ID4gZGV2bV9wbGF0
Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgd2lsbCBhbHNvIHVzZSB0aGUgQVBJDQo+ID4gPiBkZXZt
X3JlcXVlc3RfbWVtX3JlZ2lvbigpIGZvciB0aGUgc2hhcmUgcmVnaW9uDQo+ID4gPiA8MHgzMDMz
MDAwMC0weDMwMzNmZmZmPiBhZ2FpbiwgdGhlbiBjYXVzZSBpc3N1ZSwgbG9nIGxpa2UgYmVsb3c6
DQo+ID4gPg0KPiA+ID4gWyAgICAwLjE3OTU2MV0gaW14N2QtcGluY3RybCAzMDJjMDAwMC5pb211
eGMtbHBzcjogaW5pdGlhbGl6ZWQgSU1YIHBpbmN0cmwNCj4gPiA+IGRyaXZlcg0KPiA+ID4gWyAg
ICAwLjE5MTc0Ml0gaW14N2QtcGluY3RybCAzMDMzMDAwMC5waW5jdHJsOiBjYW4ndCByZXF1ZXN0
IHJlZ2lvbiBmb3INCj4gPiA+IHJlc291cmNlIFttZW0gMHgzMDMzMDAwMC0weDMwMzNmZmZmXQ0K
PiA+ID4gWyAgICAwLjE5MTg0Ml0gaW14N2QtcGluY3RybDogcHJvYmUgb2YgMzAzMzAwMDAucGlu
Y3RybCBmYWlsZWQgd2l0aCBlcnJvcg0KPiAtMTYNCj4gDQo+IEl0IG1lYW5zIHRoYXQgc2hhcmVk
IHN1cHBvcnQgdG9vayBhIHdyb25nIGFwcHJvYWNoLiBJZiBzb21ldGhpbmcgaGFzIHNoYXJlZA0K
PiByZXNvdXJjZXMsIGFub3RoZXIgc2NoZW1hIHNob3VsZCBiZSB1c2VkLCBzb21ldGhpbmcgbGlr
ZSBNRkQgKHBhcmVudCBkZXZpY2UNCj4gd2hpY2gga2VlcHMgb25seSBzaGFyZWQgcmVzb3VyY2Vz
KS4gRWFzaWVzdCB3YXkgaXMgdG8gc3dpdGNoIHRvIHRoZSByZWdtYXAgQVBJLg0KPiANCg0KSSB0
aGluayBhIGJpdCBtb3JlLCBwcm9iYWJseSBpdCdzIG5vdCB3b3J0aCB0byBkbyBpdCBpbiBvcmRl
ciB0byBub3QgYnJlYWsgY3VycmVudCBkcml2ZXIgZGVzaWduIGEgbG90Lg0KTFBTUiBpb211eCBj
YXNlIGlzIGJpdCBjb21wbGljYXRlZCB0aGF0IG9ubHkgc2VsIGlucHV0IGlzIHVzaW5nIHRoZSBz
aGFyZWQgbWVtb3J5IHdpdGhpbiBhbm90aGVyIGlvbXV4Yy4NCkN1cnJlbnQgYXBwcm9hY2ggc2Vl
bXMgYWxyZWFkeSB0aGUgZWFzaWVzdCBhbmQgbW9zdCBjbGVhbiB3YXkuDQoNClJlZ2FyZHMNCkFp
c2hlbmcNCg0KPiBQLlMuIFRoZSByZXZlcnQgaXMgb2theSBhcyBhIHF1aWNrIGZpeCBidXQuLi4g
c2VlIGFib3ZlLg0KPiANCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNo
ZW5rbw0K
