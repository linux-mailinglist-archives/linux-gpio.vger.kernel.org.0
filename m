Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A6F2938DC
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 12:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405528AbgJTKIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 06:08:06 -0400
Received: from mail-eopbgr60055.outbound.protection.outlook.com ([40.107.6.55]:39846
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2393052AbgJTKIF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Oct 2020 06:08:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQEdKVS8lDg4dYVeY+Uy481ArTsfNnD8Vs7NA8KaoA2jCSp48L63mwF1xK+SEyfiTR5uoWrToqXLkjOEttY+Ny5W5emdjOHqaFj+ne++vM9yMmL1igSph6xGrGYWL/IHhsWievvmG6mHyaONU1wMgjJnuVkIoAMpjUg+PDiZo4IYlzQi/aL/awfob1KNhB3UZ0BApbe+9aCSxlqeOmzhFttQLNJVg3F9asgdhd+XrSS8XN7cepZMLSUfzywD5DBHZIXBht+x9Qxs/NAG7n+7JtHDRD63rPc3k2bwC5bmPRf24YY0xPsn/D3vtUsck6OMxsaYFYNos3ng6DAR28YdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XgBtIG7UfLvUf7MJ6hKgODHl0Gpl6PUHqFYDtvIYmE=;
 b=ewD08VNgHD2wUwAnLC9xtyTaXAIpYtvN/fYStK43Lyu0pFHeOmORRcqwTjPJgnSkzF9pl/hM+xoAyhjO8lzuKyG56XHcH9zuplZs9NhEz0IaK3+lsvOYSlzE0+mUeOIbp3XGIUU0l5rH5RzOHRBiZKOGWdz63vPZCV+5XQ6MMVPSYlhesiSOgYOHIEPKJGo4uh5AB5dmH2dxcxWh9cJnqut127JbBnGQKuITCB/1uderwRPxgYuxzvL1Q3uTLeerXdrotxPviInIcmXu8rOHmW0G+Icr65lBighlMPF4u6FruW8MGsGYAgU/Z1CZKFTcef/0S9B2R9juqTwxTv0Alw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XgBtIG7UfLvUf7MJ6hKgODHl0Gpl6PUHqFYDtvIYmE=;
 b=L20Vf4feHVZc/1TyHr3QK+YaGR3VG4i7FneIhjQWwyzsa1QGYQG5mBZVxBK/w8DAq9LcmzOC/PAy20ZV+QwZ+7oQvRlARzzkBqxG4KB8YLvbvDSRagUw9nxiHKALEdauc4gyPQq3ocZVff6+RPD65d2OFFl3ARL1EXWB2ETBamg=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3068.eurprd03.prod.outlook.com (2603:10a6:7:56::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21; Tue, 20 Oct 2020 10:08:00 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::b813:5aaa:3d25:f976]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::b813:5aaa:3d25:f976%3]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 10:08:00 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "trix@redhat.com" <trix@redhat.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: bd70528: remove unneeded break
Thread-Topic: [PATCH] gpio: bd70528: remove unneeded break
Thread-Index: AQHWpk7PU2Dv45hS80+h/uWqZCrO16mgRR4A
Date:   Tue, 20 Oct 2020 10:08:00 +0000
Message-ID: <5b13773306265f89366b86afba71d2b4a4130e2b.camel@fi.rohmeurope.com>
References: <20201019193353.13066-1-trix@redhat.com>
In-Reply-To: <20201019193353.13066-1-trix@redhat.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9427545f-f66b-4f2e-750d-08d874e006c7
x-ms-traffictypediagnostic: HE1PR03MB3068:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB30681FA2FB9DD5FB330D6C94AD1F0@HE1PR03MB3068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ytzalaXpL8JbUjdwesX6okSvNoWruwb0KfJAsYaUnpvHlm2QI3sYQFeKbNF6nvs1yjmdqcVPghvxchSN/5s1TBA/jkyJ/TAR1mN5TUWfi6jdIcIqK6KYkzD3NnROweKVnZv+XfI6L8xhV/0i0tJMjDdyJ7mtw3p4G2FXaUZUdRNJeTqX/LC9lsxamFN7L+Nvcry+Aih25svCRXqPCZyD2XOj4CDaYRshQXbSJBj9H5fxivjwkg0pHN/aUNA75TcZkVD4Ym+PZD68zlsq5dlwMNJOagIPp/MMi//zH2+VOn0hE7cQn4yHhrpocvZ59ihg32Glpf0ktIy3xoWxynMWGg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(2616005)(186003)(8936002)(478600001)(8676002)(26005)(66476007)(66446008)(76116006)(3450700001)(5660300002)(4326008)(6506007)(66946007)(4001150100001)(316002)(66556008)(6512007)(71200400001)(6486002)(54906003)(110136005)(2906002)(83380400001)(64756008)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: S3itfo8X7RBUrurYFidFLLU/XOFhYfXfacrmEF3rJ0v6yjp9w4H0mjK5I0mDB/21ycwn/hmmGGmptlNWCg5scqwAKAHUj2MTWOXHzSGyHgVXHPSRFawAmqPZS/MC0AmQLgsdEhNBEX3Erh7qSO+fZ3E6IsKfV8jB/dCduUTiv0gSg4eIgSf/sEq/SysyOVZGzoDIx+OmllgtSKWiFbcM3iv357ZjKXOLw5taowQMvBWW3wt8efXQ2mXza6jw/CENEvUt5xzilmRTaWSO1Iyu++63v2SetlsiB3ZCzSvNVAcu9dEhcaKUkaIQykLpFT3UtTf/q1aB4RJI2BywdNlUQ4sXJEGk+nJNAAHdWyjRQd36+CN3fjs7Uwwt7T30U/uVcYKxPbWiUJrNPSbsiycV0aX5sKSwobw92EFaLC590CD+lRIB85nFJb1K8RyBaGNinVtzOtKv5j8a/1Q8JdJsSd3rrjUjFz0A/m6iZfGq6ddL9xA95GtV45yKMvlYWnzOXkfKhbwjsuw4dCSAgPs+Y8aZBAFB470FSDkDXRgMZXm3W23wOTI/Ue/10DLXyy37ycjFVzansWS933OtQ1bbmx8PK5raTndpZV0fcNIOQZaI2IohhPty0TG+CvH4kYagGjp8liQvsMRTx+gctrtN3A==
Content-Type: text/plain; charset="utf-8"
Content-ID: <794500F484CE6E4398A5CE3CC6A87948@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9427545f-f66b-4f2e-750d-08d874e006c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 10:08:00.6847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WxZE1s29lt77+Bh26evm8QmQ6Q0o3vSA7r0CggkbydAUv7NhHE1ZmphHUAeZxfUnjtWHR0iKiLAwyY1U0yyfJ/cz4OrAT4lgcz5tbugfESC8vjwdtQsFHsUBGdkoncDg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3068
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhhbmtzIFRvbSwNCg0KT24gTW9uLCAyMDIwLTEwLTE5IGF0IDEyOjMzIC0wNzAwLCB0cml4QHJl
ZGhhdC5jb20gd3JvdGU6DQo+IEZyb206IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNvbT4NCj4gDQo+
IEEgYnJlYWsgaXMgbm90IG5lZWRlZCBpZiBpdCBpcyBwcmVjZWRlZCBieSBhIHJldHVybg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3Bpby9ncGlvLWJkNzA1MjguYyB8IDMgLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1iZDcwNTI4
LmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby0NCj4gYmQ3MDUyOC5jDQo+IGluZGV4IDQ1YjNkYThkYTMz
Ni4uOTMxZTU3NjVmZTkyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1iZDcwNTI4
LmMNCj4gKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tYmQ3MDUyOC5jDQo+IEBAIC03MSwxNyArNzEs
MTQgQEAgc3RhdGljIGludCBiZDcwNTI4X2dwaW9fc2V0X2NvbmZpZyhzdHJ1Y3QNCj4gZ3Bpb19j
aGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgb2Zmc2V0LA0KPiAgCQkJCQkgIEdQSU9fT1VUX1JFRyhv
ZmZzZXQpLA0KPiAgCQkJCQkgIEJENzA1MjhfR1BJT19EUklWRV9NQVNLLA0KPiAgCQkJCQkgIEJE
NzA1MjhfR1BJT19PUEVOX0RSQUlOKTsNCj4gLQkJYnJlYWs7DQpNeSBwZXJzb25hbCB0YXN0ZSBp
cyBhbHNvIHRvIG9taXQgdGhlc2UgYnJlYWtzIGJ1dCBJIGFtIHByZXR0eSBzdXJlIEkNCnNhdyBz
b21lIHRvb2xpbmcgaXNzdWluZyBhIHdhcm5pbmcgYWJvdXQgZmFsbGluZyB0aHJvdWdoIHRoZSBz
d2l0Y2gtDQpjYXNlIGJhY2sgd2hlbiBJIHdyb3RlIHRoaXMuIE1vc3QgcHJvYmFibHkgY2hlY2tw
YXRjaCBkaWRuJ3QgbGlrZSB0aGF0DQpiYWNrIHRoZW4uIEFueXdheXMgLSBpZiB5b3UgaGF2ZSBu
byB3YXJuaW5ncyBmcm9tIGFueSBvZiB0aGUgdG9vbHMgLQ0KdGhpcyBpbmRlZWQgbG9va3MgYmV0
dGVyICh0byBtZSkgd2l0aG91dCB0aGUgYnJlYWsgOikNCg0KPiAgCWNhc2UgUElOX0NPTkZJR19E
UklWRV9QVVNIX1BVTEw6DQo+ICAJCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoYmRncGlvLT5j
aGlwLnJlZ21hcCwNCj4gIAkJCQkJICBHUElPX09VVF9SRUcob2Zmc2V0KSwNCj4gIAkJCQkJICBC
RDcwNTI4X0dQSU9fRFJJVkVfTUFTSywNCj4gIAkJCQkJICBCRDcwNTI4X0dQSU9fUFVTSF9QVUxM
KTsNCj4gLQkJYnJlYWs7DQo+ICAJY2FzZSBQSU5fQ09ORklHX0lOUFVUX0RFQk9VTkNFOg0KPiAg
CQlyZXR1cm4gYmQ3MDUyOF9zZXRfZGVib3VuY2UoYmRncGlvLCBvZmZzZXQsDQo+ICAJCQkJCSAg
ICBwaW5jb25mX3RvX2NvbmZpZ19hcmd1bWVudCgNCj4gY29uZmlnKSk7DQo+IC0JCWJyZWFrOw0K
PiAgCWRlZmF1bHQ6DQoNCkFjdHVhbGx5IC0gbXkgcGVyc29uYWwgdGFzdGUgd291bGQgYmUgdG8g
YWxzbyBnZXQgcmlkIG9mIHRoZSBlbXB0eQ0KZGVmYXVsdCBoZXJlIC0gYnV0IEkgZ3Vlc3MgaXQg
d2FzIGFsc28gYWRkZWQgdG8gbWFrZSBzb21lIHRvb2wgaGFwcHkuLi4NCg0KPiAgCQlicmVhazsN
Cj4gIAl9DQoNCkFja2VkLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5y
b2htZXVyb3BlLmNvbT4NCg0K
