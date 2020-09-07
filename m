Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4113125F4CD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 10:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgIGISC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 04:18:02 -0400
Received: from mail-am6eur05on2089.outbound.protection.outlook.com ([40.107.22.89]:5857
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727116AbgIGISA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 04:18:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKAXT+5+/4k6+WnppgG46PPODK1fCk/GdBQuJeXuZzzLT9nOPAoV59Bf9S1yaNqmjV4q1xA21htUWf1oMlTNaJou1yW+yIwvIFMcebb6DIxM5qV5y/u2elS9opUgCAudxgiU5EVSbF01nPDoV3OkRbDbt76+YHiG/hj7Yn2ehsNr5xeM5B3fPb44m/XkIViJ6XW2Tgor+SoJ4QvqO8/WX89Qa2QR2EBbwNreoG4rDZt9WkFFeqpvn/mI7zsSXTy+YKDxLaeLI47X5l7pVCYizDSAi1h4Nyv8Q/LYUgoUdv7XDeSOo/3J6LEcXRBKGqN/8IsZ36qWiW0T40wzuJExvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hqdzr5LaOutRBanLK01tugXnBMIaM11nWZjozSt1shM=;
 b=bueODYM6vjZuoHilgcNzj5HFGt4yEOfBybaUWY5qJ1xGXE1HBYCblz984x+wpJmu6ML7MF6EWo8HJ4DvzvKlL7nXT1RtJu5bcl/vz60wthfV9TcZZ3rUB0kp05HWEGvaxV8xMpko6/gSteq2bsEOLI0pdY4vGpOp7S7YkgqDfkDtNZhyuuF4QSffXREee7QXyd7V0C5AFlwTHfmRqFd3TJC+wXwb/xqMcqvtGWZQ9gaIWQeLC6V9MSoltWjHLUHZWBpLsQZLeX4FVimm0NT1K3puxxujz0CiX/FM+1xIMEKu6FTZSkn1xjWyYZSSTbsauJuyD4hIlQsmx/Cf3J+QDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hqdzr5LaOutRBanLK01tugXnBMIaM11nWZjozSt1shM=;
 b=TBiH+7GTvquhXryFTG4Z+Bj0rFY5OszSiQBSFCSCcfizpjrmL4Xz/6iu93Ez6cz4X/qFxq31f7+KmY9TcjrYCjQ1RdfVdzK6TBo7h2VqKRbBy5kSJTWPUh7XqjnxO43Ow3cFsSM44txcnc0SEvTnVQJyJv7HaBHygAzjgvZn5Z0=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5287.eurprd04.prod.outlook.com (2603:10a6:20b:7::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 7 Sep
 2020 08:17:55 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca%3]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 08:17:55 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>, Arnd Bergmann <arnd@arndb.de>
CC:     Daniel Baluta <daniel.baluta@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Topic: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Index: AQHWW4NG7QhYBuGT3kq7iNp/SHXl7akKUIoAgAACIACAAAohgIAAgi8AgACVroCAAAvugIAABlgAgAACMQCAUZ4QsA==
Date:   Mon, 7 Sep 2020 08:17:55 +0000
Message-ID: <AM6PR04MB4966AE313DE13AD65B2D47B280280@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <c00f8fe3-d12a-0f91-c301-c028e5aa3f25@nxp.com>
 <DB3PR0402MB3916C9FE00C0F4FC62ACB711F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <5e2af0c3-c832-3978-017e-0b1649aac61c@nxp.com>
 <DB3PR0402MB3916AAEE01257A7F9A25A657F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <c27109aa-280f-db0d-980b-fbd735bab0a6@nxp.com>
 <DB3PR0402MB3916A84BEF5EEC327EE35180F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a256uR0zZn9ew9UoDqP51MdA4emCfMoZuPW6n9MqD5vPQ@mail.gmail.com>
 <DB3PR0402MB391681666012C43C471FA0E2F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB391681666012C43C471FA0E2F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d663c42b-165d-420e-3607-08d8530685ec
x-ms-traffictypediagnostic: AM6PR04MB5287:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5287FEF123DA7A5A311E663580280@AM6PR04MB5287.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vr8uOFeQ7xgoOvBuijMoaLoFd5s6j85ByWixKHCkCux021gM5mr5gnB5EVq9YKtm8p8ZY3/WKfoUCcn7nxH/YpHszpn9Xe8lGIrAHn6CW/H+vDaEW0VnLtB0YqlqPK5WLVFlYUyeTeNd1B2/VVlX34ZRWIg8CSo8qa12IojLA4vHOipCVQO/7nc/5U7HOrjn6uqrMEab4YFUd0N3ViXs6FdGU7fcdMCUVs9mlbJB90CP3nQXWTt2wD6z7zhUg4RsqFYPZK+t/fR5dNp9LjQ65YyeM+naPecJh/IyC2ojLsS60XyT1kAQUO1Ip84bE3gj8/0odwmXZnF6K2r8V9YyCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(66556008)(9686003)(66946007)(76116006)(2906002)(64756008)(186003)(66446008)(26005)(55016002)(52536014)(316002)(71200400001)(110136005)(54906003)(44832011)(4326008)(33656002)(7416002)(8936002)(478600001)(66476007)(8676002)(7696005)(53546011)(6506007)(83380400001)(5660300002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EYMSV5YG+juUdpyiitSYLLfGnf/fDHnUpp5j7j/QCpFvc+PTBVliDvO/xiaQLfM6ZD3wVCzLQQ2sp/2fj9vjrM/wxrYBECbBMoC2X5hrdPoC85zNsG8zNwvvmKucx4qtIlTjV+4U2ljBSerTaqfbEEzuoV4pBhWjbRmcL3Fn6uAE6LPmb93wgFO03HtYd4cUsjc4a9VrUVN1hs5pHA1dDZwKCzRIj8DQrShZGLQ7typAcaVcpmyiwbG1hd9scO/GV9iG8nwJ7hVBFxN8kiSRXGkz2cs2YQxCeAE6qFXMojBQsLZlFLiYIep2lW1UY5T8BPq+FloOx/yxNeX2L5B8ex7svPLD060j3m2Xm29c1qiumD2TQJWv5r5NOeHXggIh1BPOPvGudzxWoEIMsZZOmWzKfk7JS6OF1XE+aqfqXvNoNbU5QnEJ5uVfC6QmDJNcvAQXWn6w2lfz20ng8L/yAKolwZXfPbbWDxjC9/e09L/g38DflppUe+9QHiFj+9f7ueNZYjC5RABmfrIsIYn7RlLMNIu+18KAjW4i32ixSdiywDfZbCqn49oO2W3jsrDMG0/VMKFc9jWw9h9TDNMyOjmcUavVxzYBlB+tDytOiW8Ma1yxJ03Om/Kg1TSwbZydsvuAGafsQoEGxdwnWQxLTg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d663c42b-165d-420e-3607-08d8530685ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 08:17:55.3495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zi9wkLy4lkc4TogI70Te8Rlqw+QALQtM/zxc2fiPEp1EM1hn1o6qw9usRkiUSfPr9Hk0nNPf0G93Vpvmfr26Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5287
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gU2VudDogRnJpZGF5
LCBKdWx5IDE3LCAyMDIwIDU6NTMgUE0NCj4gDQo+IEhpLCBBcm5kDQo+IA0KPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMS8yXSBwaW5jdHJsOiBpbXg6IFN1cHBvcnQgYnVpbGRpbmcgU0NVIHBpbmN0
cmwNCj4gPiBkcml2ZXIgYXMgbW9kdWxlDQo+ID4NCj4gPiBPbiBGcmksIEp1bCAxNywgMjAyMCBh
dCAxMToyNCBBTSBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gPiB3cm90ZToN
Cj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIHBpbmN0cmw6IGlteDogU3VwcG9ydCBi
dWlsZGluZyBTQ1UNCj4gPiA+ID4gcGluY3RybCBkcml2ZXIgYXMgbW9kdWxlDQo+ID4gPiA+ICtN
T0RVTEVfQVVUSE9SKCJEb25nIEFpc2hlbmc8YWlzaGVuZy5kb25nQG54cC5jb20+Iik7DQo+ID4g
PiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oIk5YUCBpLk1YIFNDVSBjb21tb24gcGluY3RybCBkcml2
ZXIiKTsNCj4gPiA+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsNCj4gPiA+ID4NCj4gPiA+
ID4NCj4gPiA+ID4gVGhpcyBjYW4gYmUgaW4gYSBzZXBhcmF0ZSBwYXRjaC4NCj4gPiA+DQo+ID4g
PiBJIGRvbid0IHVuZGVyc3RhbmQsIHdpdGhvdXQgYWRkaW5nIG1vZHVsZSBsaWNlbnNlLCBjaGFu
Z2luZyB0aGUgU0NVDQo+ID4gPiBwaW5jdHJsIGRyaXZlciB0byAidHJpc3RhdGUiLCB3aGVuIGJ1
aWxkaW5nIHdpdGggPU0sIHRoZSBidWlsZCB3aWxsDQo+ID4gPiBoYXZlIHdhcm5pbmcgYXMgYmVs
b3csIHNvIEkgdGhpbmsgaXQgZG9lcyBOT1QgbWFrZSBzZW5zZSB0byBzcGxpdCBpdA0KPiA+ID4g
dG8gMg0KPiA+IHBhdGNoZXMuDQo+ID4gPg0KPiA+ID4gICBDQyBbTV0gIGRyaXZlcnMvcGluY3Ry
bC9mcmVlc2NhbGUvcGluY3RybC1zY3Uubw0KPiA+ID4gICBNT0RQT1NUIE1vZHVsZS5zeW12ZXJz
DQo+ID4gPiBXQVJOSU5HOiBtb2Rwb3N0OiBtaXNzaW5nIE1PRFVMRV9MSUNFTlNFKCkgaW4NCj4g
PiBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtc2N1Lm8NCj4gPiA+ICAgTEQgW01d
ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtc2N1LmtvDQo+ID4NCj4gPiBJIGFn
cmVlIGl0IHdvdWxkIGJlIGNsZWFyZXIgdG8gZG8gaXQgYXMgc2VwYXJhdGUgcGF0Y2hlcywgYnV0
IHlvdSB0aGVuDQo+ID4gaGF2ZSB0byBiZSBjYXJlZnVsIGFib3V0IHRoZSBvcmRlciB0byBhdm9p
ZCB0aGUgcHJvYmxlbSB5b3UgbWVudGlvbi4NCj4gPg0KPiA+IEEgY2xlYXIgaW5kaWNhdGlvbiB0
aGF0IGl0IG1heSBiZSBzZW5zaWJsZSB0byBzcGxpdCB1cCB0aGUgcGF0Y2ggaXMNCj4gPiB0aGF0
IHlvdXIgY2hhbmdlbG9nIGhhcyBhIGxpc3Qgb2YgZml2ZSBpdGVtcyBpbiBpdCwgd2hpY2ggYXJl
IG1vc3RseSBkb2luZw0KPiBkaWZmZXJlbnQgdGhpbmdzLg0KPiA+IFRoZSBpZGVhbCB3YXkgdG8g
c3BsaXQgdXAgYSBwYXRjaCBzZXJpZXMgaXMgdG8gaGF2ZSBlYWNoIHBhdGNoIHdpdGggYQ0KPiA+
IGNoYW5nZWxvZyB0aGF0IGhhcyB0byBleHBsYWluIGV4YWN0bHkgb25lIHRoaW5nLCBhbmQgbWFr
ZXMgaXQgb2J2aW91cw0KPiA+IGhvdyBlYWNoIGNoYW5nZWQgbGluZSBjb3JyZXNwb25kcyB0byB0
aGUgZGVzY3JpcHRpb24sIGJ1dCBuZXZlcg0KPiA+IGV4cGxhaW4gdGhlIHNhbWUgdGhpbmcgaW4g
bW9yZSB0aGFuIG9uZSBwYXRjaCAoaS5lLiB5b3UgY29tYmluZQ0KPiA+IHBhdGNoZXMgdGhhdCBk
byB0aGUgc2FtZSB0aGluZyBpbiBtdWx0aXBsZSBmaWxlcykuDQo+ID4NCj4gPiBJbiB0aGlzIGNh
c2UsIGEgZ29vZCBzcGxpdCBtYXkgYmU6DQo+ID4NCj4gPiBwYXRjaCAxOg0KPiA+ICAgIC0gVXNl
IGZ1bmN0aW9uIGNhbGxiYWNrcyBmb3IgU0NVIHJlbGF0ZWQgZnVuY3Rpb25zIGluIHBpbmN0cmwt
aW14LmMNCj4gPiAgICAgICBpbiBvcmRlciB0byBzdXBwb3J0IHRoZSBzY2VuYXJpbyBvZiBQSU5D
VFJMX0lNWCBpcyBidWlsdCBpbg0KPiA+ICAgICAgIHdoaWxlIFBJTkNUUkxfSU1YX1NDVSBpcyBi
dWlsdCBhcyBtb2R1bGU7DQo+ID4gICAgIC0gQWxsIGRyaXZlcnMgdXNpbmcgU0NVIHBpbmN0cmwg
ZHJpdmVyIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGUNCj4gPiAgICAgICBTQ1UgcmVsYXRlZCBmdW5j
dGlvbiBjYWxsYmFjazsNCj4gPg0KPiA+IHBhdGNoIDI6DQo+ID4gICAgIC0gRXhwb3J0IFNDVSBy
ZWxhdGVkIGZ1bmN0aW9ucyBhbmQgdXNlICJJU19FTkFCTEVEIiBpbnN0ZWFkIG9mDQo+ID4gICAg
ICAgImlmZGVmIiB0byBzdXBwb3J0IFNDVSBwaW5jdHJsIGRyaXZlciB1c2VyIGFuZCBpdHNlbGYg
dG8gYmUNCj4gPiAgICAgICBidWlsdCBhcyBtb2R1bGU7DQo+ID4gICAgIC0gQ2hhbmdlIFBJTkNU
Ul9JTVhfU0NVIHRvIHRyaXN0YXRlOw0KPiA+ICAgICAtIEFkZCBtb2R1bGUgYXV0aG9yLCBkZXNj
cmlwdGlvbiBhbmQgbGljZW5zZS4NCj4gPg0KPiA+IGFuZCB0aGVuIHJld3JpdGUgdGhlIGRlc2Ny
aXB0aW9uIHRvIG5vdCBoYXZlIGEgYnVsbGV0ZWQgbGlzdC4NCj4gPg0KPiA+IFRoYXQgc2FpZCwg
SSBkb24ndCB0aGluayBpdCBpcyBjcml0aWNhbCBoZXJlLCBhbmQgSSB3b3VsZCBub3QgaGF2ZQ0K
PiA+IGNvbXBsYWluZWQgYWJvdXQgdGhlIHZlcnNpb24geW91IHNlbnQuDQo+ID4NCj4gPiBJZiB5
b3UgZW5kIHVwIGNoYW5naW5nIHRoZSBwYXRjaCwgSSB0aGluayB5b3UgY2FuIGFjdHVhbGx5IGRy
b3AgdGhlDQo+ID4gIiNpZiBJU19FTkFCTEVEKCkiIGNoZWNrIGVudGlyZWx5LCBhcyB0aGUgZnVu
Y3Rpb25zIGFyZSBub3cgYWx3YXlzDQo+ID4gYXNzdW1lZCB0byBiZSBhdmFpbGFibGUsIGFuZCB3
ZSBkb24ndCAjaWZkZWYgZGVjbGFyYXRpb25zIHdoZW4gdGhlcmUNCj4gPiBpcyBubyAjZWxzZSBw
YXRoIG90aGVyd2lzZS4NCj4gPg0KPiANCj4gVGhhbmtzIGZvciB0aGUgZ29vZCBzdWdnZXN0aW9u
LCBpZiB0aGVyZSBpcyBvdGhlciBjb21tZW50IG5lZWQgYSBWMiwgb3INCj4gbWFpbnRhaW5lciB0
aGlua3MgaXQgaXMgYmV0dGVyIHRvIHNwbGl0IGl0IGZvbGxvd2luZyB5b3VyIGd1aWRlLCBJIHdp
bGwgc2VuZCBWMg0KPiBmb2xsb3dpbmcgeW91ciBndWlkZS4NCj4gDQoNClBscyBkbyBhcyBBcm5k
IHN1Z2dlc3RlZC4NCkJlc2lkZXMgdGhhdCwgSSBoYXZlIGEgZmV3IG1pbm9yIGNvbW1lbnRzIGlu
IHNlcGFyYXRlIHJlcGxpZXMuDQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiBUaGFua3MsDQo+IEFu
c29uDQo=
