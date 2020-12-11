Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC042D74CD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 12:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403757AbgLKLhi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 06:37:38 -0500
Received: from mail-eopbgr150088.outbound.protection.outlook.com ([40.107.15.88]:4494
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392011AbgLKLhg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 06:37:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyoH9NmhouhcVBuZrgkSGXgZx3aCgQrdetrIz+nyFDhAykaUojcjZ8Hz8P+cawZCzTRdjGTqUg9FO1J9rXQK+8rHUtfLwe+la1PAxP12QjO10VYa407ObKyv4B9fwOXj2lWOcuBY8IXLMqBAeopkciF8YQnf9sBEOFw1QK+XvC1ehkl6/YGE6+E8x9S+rMTnXGY5cpS4atYhfFlrK7XKsGpTyPm7SC1xFKaJN73sPFR9K9iOip6LQ1FeCPFb7AO8CHcX5DjdbWYChmcbT68lV5nnG9LVdDDV+gDl7xqLo01M5w3GfGKEcmZ0Jf1H9aRI/1xZqQUYJbbaaN7X1z0WCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QBGllBPkviX4oWD13mCn5twkBg/wPQztng1OZ/3JDI=;
 b=kiKimex7kREW0kCQ3r1gNsWoE6fr14g/xNKaE5jfjtu7B2bbzRp0xCRHgMqnwW/PXrM2pSI503WGh5MJufpfcsNx1Mr4ALJGvDJU8aGp+S4cF6+K0kjtikJa+xO6BIdg0nRVL70T2V6Rufok3dueeBmnzODFMAKgLopjFrGCMywPO+j671P1pEQYUgcupfm0q2UDZX1vU0KqQ+NudBF/BKiBKOUhlUi2N8cocEwuStLcDUZKpOrPMouF1y997ED6dDOBASJa4A8tu/nknlOlozOEDyZOQpWBo5G1cOrdJyeIdtNirDRsHABhlygdhztgFvAmuYXYXIlodj9GVlNZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QBGllBPkviX4oWD13mCn5twkBg/wPQztng1OZ/3JDI=;
 b=Ox5hH4ytQNoTlDa9aPHwmV5u1CtYRLDIemPBWzrxDkZgRYijTjwofvqD+nbaCrmJ5uAYEkFUrT5md8HzCM2CBWrNl+R4AsF5jRbg4kMhtOBcykQ+GrsmCcTCSXfWOYRuTKc+UAhWd65F1UYe+iUJz/PiGvi8Ec1yUTqXNhtFpSg=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2762.eurprd03.prod.outlook.com (2603:10a6:3:ef::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.17; Fri, 11 Dec 2020 11:36:47 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 11:36:47 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 02/10] mfd: rohm-generic: Add BD9571 and BD9574
Thread-Topic: [PATCH v2 02/10] mfd: rohm-generic: Add BD9571 and BD9574
Thread-Index: AQHWz7Cv7dU4yTN+/kKX3qUVvVbshKnxxG+A
Date:   Fri, 11 Dec 2020 11:36:47 +0000
Message-ID: <351953233d51a630fc295e7b92303a51c2bb1fda.camel@fi.rohmeurope.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607686060-17448-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 064005ce-37c9-4dab-3402-08d89dc90b48
x-ms-traffictypediagnostic: HE1PR0302MB2762:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB2762BA335835BF0B73D90539ADCA0@HE1PR0302MB2762.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p3k6idjPqSancv2vPeSER2OOS64PKqB/2h8sxf8aB4RjxdgCUrodw+FpUNfFfux8asyiCd7d01O9wgPNfR9fi0tsK/RW5KD/6HA3BVB00o1/N5/vSAXKkX3muHx36DYq5JNtI5E9HrlpLJO3CaD+yU0n/MqcYUNkGF87BKXzZ272eg4nEadfdvoJuiOdr8CsB9flBLR6kyyyGcvpvSVxvl+RiPMWsJj5lmGfGXF2jFZDwCl7J3swJnlQXyEDOS5fMteZ3PK7/gitOQ+Of5HPJfN3Ne4saeyfiS4/zmOAcHkAnNkvXwbM6n4aYXfhbpapIZuiGN/kI3cOwwoDWqZupLD8nP+GSLCSOwjs8RViJqEXH06kzSTQnLuOBcnz8Xpk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39840400004)(376002)(8676002)(54906003)(8936002)(6486002)(7416002)(5660300002)(76116006)(26005)(110136005)(6506007)(2906002)(186003)(478600001)(316002)(2616005)(86362001)(3450700001)(4326008)(66946007)(4001150100001)(71200400001)(64756008)(4744005)(66446008)(66476007)(66556008)(6512007)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RGd2RndadkdwL1lvUG1OTjYybEtId1ZyRVpwUG9LQllRTDBtTFRBdHJuckVZ?=
 =?utf-8?B?ZVZkbC90VjJvSGwrc1RDUXJHdEdJRlo5anc1QUQzSnpMYjlGZDBVa2pGd0R5?=
 =?utf-8?B?Qnc0b0VPaGxJVFJUQXNTWmZkQ3Qvdko4VzVPMjN1Qm9JbkJqVzkreSsrNU9D?=
 =?utf-8?B?TzgraVJuTHU4ZlE4NFJYVmppSzZqNURTenErNUpyQWoybHV0WW5iaDFmZDRF?=
 =?utf-8?B?YVhxV0NqWnV0d1JSN29PSURHTDA0RkJYWEVYYndXaHFhRzk4VXBpblJsVDhN?=
 =?utf-8?B?cHRiNlpWbE9aK0pwN0Y4bGxrTDNQSmZIWno0RjlXRE81dExTWndBdHZob25a?=
 =?utf-8?B?V1FkL2NwNno4Z1lDci9vL1lYQ09WUStWL0tpaExUdkdzS09GS3lrL3JEZ3Ar?=
 =?utf-8?B?VDVsYmFLU21GUkZhOUpERStnYitkLzd5T0RqcEhwbm12RGtRcVcvcWtxbFR1?=
 =?utf-8?B?K3IwWWZMYWMvRHVKL1Z2M3VsK25nTmhyZkN3dHpPcnF1WFd0R0V6TkxvMGdw?=
 =?utf-8?B?Tjc5RWZEK1IweUVRcG5RMmkrYkFmWlNFWWEzNy9BM0d4N3RLUHhPVjFCcGI0?=
 =?utf-8?B?UWc4MmlzTnU1TGdMY1FXeHhOc3A5R3A1a3VHanE3SG1IekZWZFEvUXBVZERZ?=
 =?utf-8?B?Tjh2dWtrM2NyejJnWFo4RVUzMHp2aWwvQXJiSndDdkVETHdDdU5KOGlvbGlx?=
 =?utf-8?B?Rm1mMmExY0tmaXVDTVo0Q0JCNnJ0M1dvUVJlc2Y5d0dMMTl5WjUxamlBdThn?=
 =?utf-8?B?eDIyRlE5VUtFckd5SFV5c2R5UVNLMmNWa0pQRFc2ZkpadklOZDdsWC9sVmpE?=
 =?utf-8?B?a1Z2RmJzaXJETWc1VDNDWjdFMnNXZWJwN3ZYL0ZobFpYMTVRS2NPamxkU0xY?=
 =?utf-8?B?aXFjQ0VWR0xXdDVvSUlaakFIME1JV3BkOExZbWZPRUpWM0hnWUMxVEk0QVEz?=
 =?utf-8?B?alhsQ1A4cGxZK1ByVU9MTkJXN3RIM3hwVDR4cTNZMHlaK1pLUjNETGlXblRn?=
 =?utf-8?B?YXlBNTVXYlVKa0NVVmwwMnNkcjh0aEFraTJTZnhqMFBDTWFPbml2MGxrY3pa?=
 =?utf-8?B?cDBmOGN5SXgrZXNMY2xLVUFmQ2ZGTWtKQjNkck9vdjBnTXdwRkFLQmYxblpv?=
 =?utf-8?B?QTJxd3ZiVEJCT3Q2RXN1Y083aUJHdzgxQWJWWW41NXd4dEdSeVYrdTlGcktj?=
 =?utf-8?B?YUticVBkQVdSQ1BnQXYrTUwrUmp2QlFDVTNCcm5tNjYwbUlQZitPWGdMOHlV?=
 =?utf-8?B?UVZrUDlLK0gzcTZtTWFFbGVkbFRLUDYxTzJRM1VsWllFVm5SU05YQ09wUTM2?=
 =?utf-8?Q?csrwLdU8on+wLeV0dNvN1xtEfyMX4DdyPb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA49F7CE7F60CB4A88A9A51A563FB329@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064005ce-37c9-4dab-3402-08d89dc90b48
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 11:36:47.5574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mqw5Wo/vhYFqLBenpWnFQ4MmGUgWWwofHopGmY9ZgUcYoZzH5G5tYjerJZAQMT28m+t+ulxs86nh/zwMl3EJQk5rD5dLrP4zk8jFFjYPHcuMO/qlVCFOF9yGNPil/do1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2762
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjAtMTItMTEgYXQgMjA6MjcgKzA5MDAsIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiBBZGQgY2hpcCBJRHMgZm9yIEJEOTU3MU1XViBhbmQgQkQ5NTc0TVdGLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJl
bmVzYXMuY29tPg0KPiAtLS0NCj4gIGluY2x1ZGUvbGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oIHwg
MiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oDQo+IGIvaW5jbHVkZS9saW51eC9t
ZmQvcm9obS1nZW5lcmljLmgNCj4gaW5kZXggNDI4M2I1Yi4uYWZmYWNmOCAxMDA2NDQNCj4gLS0t
IGEvaW5jbHVkZS9saW51eC9tZmQvcm9obS1nZW5lcmljLmgNCj4gKysrIGIvaW5jbHVkZS9saW51
eC9tZmQvcm9obS1nZW5lcmljLmgNCj4gQEAgLTEyLDYgKzEyLDggQEAgZW51bSByb2htX2NoaXBf
dHlwZSB7DQo+ICAJUk9ITV9DSElQX1RZUEVfQkQ3MTg0NywNCj4gIAlST0hNX0NISVBfVFlQRV9C
RDcwNTI4LA0KPiAgCVJPSE1fQ0hJUF9UWVBFX0JENzE4MjgsDQo+ICsJUk9ITV9DSElQX1RZUEVf
QkQ5NTcxLA0KPiArCVJPSE1fQ0hJUF9UWVBFX0JEOTU3NCwNCj4gIAlST0hNX0NISVBfVFlQRV9B
TU9VTlQNCj4gIH07DQo+ICANCg0KDQpKdXN0IGEgbm90ZSB0byBMZWUgJiBPdGhlcnM6DQpUaGlz
IHdpbGwgcHJvYmFibHkgY29uZmxpY3Qgd2l0aCB0aGUgQkQ5NTczL0JEOTU3NiBwYXRjaCBzZXJp
ZXMgKHdoaWNoDQppbnRyb2R1Y2VzIHRob3NlIGNoaXAgSURzIGhlcmUpLiBDb25mbGljdCBzaG91
bGQgYmUgdHJpdmlhbCB0aG91Z2guDQoNCldpdGggdGhhdCBub3RlOg0KUmV2aWV3ZWQtQnk6IE1h
dHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KDQoNCi0t
TWF0dGkNCg==
