Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FBA25297A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Aug 2020 10:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgHZIwF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Aug 2020 04:52:05 -0400
Received: from mail-eopbgr1320127.outbound.protection.outlook.com ([40.107.132.127]:6166
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726817AbgHZIwE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Aug 2020 04:52:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9EPndt4n7Pu8aiQhC/1NuZUu7K9sD0JQekdgrBxcxQVBTHskNNUfO/zLvtEK9eNwpwCFOexZt8WBQEGPe6J9gXFOidu7iumBYky4zVM+/mK90BD3mCyTF8B+puJKEUpqYisAjTv6rFWfNiUsqelAyN73ogoM2ax+tbMwXLpsNZeTPUEqazLl59O7+czIB1oWxclD42nyrGTp6QaIpS13Z3W+IRiYcNlPrWY2XXwskoBbO2cbDtMHxhFSJ7H5SCFPmhhaIoTq8y1uWpAX2k07z3IAeOoGGySK4W/86sxC5ErsmIENwirVUeY8MW05fEFWx6lLK6/T3eYTiU01jYxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8fKj9G1Vv9MrTI//vO/GUkrCK7S6U4tQRYHrB4BPg0=;
 b=G6saWTHyN5t0+2CvcEYdrENSuaXXhgUc29DZB5Dx7CiZeWOOWMW6OFDZSSkUc+/X2qUUgabaAeSidj4VzmGL71xcZGwynEGSCRwoF7zE4uv5mbgEBQGsQDazfykT7ZHShGLG7pV8ZjXnEA8Zci0fvPPxqCcMVRRkuJ/YMVa09jqveGipC9PNph12FA+ERddb8uFaQuUDLaymbKhn4UfzL/yjNwnxjQTkpDiMltHgnIPITM9dkioh31VjEIWHJZ/9XHPHdW3lDq1ueWbZ+ujPffcrrZDsOY3VW0UI53gbf8z30xbJgLhcDWaRpDH7HPsHkmbw0TVkgZwESxttTgRTCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8fKj9G1Vv9MrTI//vO/GUkrCK7S6U4tQRYHrB4BPg0=;
 b=E6dlXiEJ258Fsgt2VvoErY1z+cjDDB+ODIaRVu5bc6n8sUjF83RLmOqN4bDM+qUIq0o11uqA7ApAeq0ryS0ptEoOvZUBmZBo16iV7CbQcb1/kJsjA/TuUrUBAsTSFMYePQn6w0/aQAl5xYugDlBBtXPZLZ6fEMqHkp8J8sImTv4=
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com (2603:1096:404:73::17)
 by TY2PR01MB5035.jpnprd01.prod.outlook.com (2603:1096:404:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 26 Aug
 2020 08:52:00 +0000
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::e1a0:8e97:f2b7:c9d9]) by TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::e1a0:8e97:f2b7:c9d9%2]) with mapi id 15.20.3326.019; Wed, 26 Aug 2020
 08:52:00 +0000
From:   Gareth Williams <gareth.williams.jx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: pinctrl: rzn1: Convert to json-schema
Thread-Topic: [PATCH] dt-bindings: pinctrl: rzn1: Convert to json-schema
Thread-Index: AQHWd60potnxulZi0USUP8M4OLJxHalCfc1wgAXw8wCAAZ7IsA==
Date:   Wed, 26 Aug 2020 08:52:00 +0000
Message-ID: <TY2PR01MB29248882CC49ED53F99A5FF7DF540@TY2PR01MB2924.jpnprd01.prod.outlook.com>
References: <20200821112059.5133-1-geert+renesas@glider.be>
 <TY2PR01MB2924258A9762FD083630B628DF560@TY2PR01MB2924.jpnprd01.prod.outlook.com>
 <CAMuHMdU2+=aesP5v3iAWp8+-LZ8dpMi+EOm7n5x74q7j8kFNPg@mail.gmail.com>
In-Reply-To: <CAMuHMdU2+=aesP5v3iAWp8+-LZ8dpMi+EOm7n5x74q7j8kFNPg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2d0a81f2-32aa-4e80-818d-08d8499d4bd4
x-ms-traffictypediagnostic: TY2PR01MB5035:
x-microsoft-antispam-prvs: <TY2PR01MB5035CECADE92550BFEC78CD9DF540@TY2PR01MB5035.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tAs/Q8IllTQ+VYAsfyJ4h7tyZ71Y6n4Ran0+tE+QlFp1DwH1vTIr1jls58qAaibxrLEKgux0a4bRL7+0Sg12t7r/Eeb2YLJQFnZqwbWlm2HhHSyInAa0v8zz+HgmDikzaP4vW5gov8l0wnEb13RWh259MDiu7qV2uHVldEGRtFZAivcvkxhEB2+uKrolFK/bLa7snStE0+BTMDMR1K+cKdXB/HPk/eP+6xniJpBCgDV90WwFkTQTFx9Qcxu8KaufDLuDPvwKVZNqIDMQdZOvXSsvB+4yhXo8S5eBqWzqNPMKYw7XPBnjl7yBmVb0e1y+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB2924.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(53546011)(55016002)(26005)(33656002)(7696005)(186003)(8936002)(316002)(6506007)(5660300002)(54906003)(4326008)(478600001)(4744005)(66556008)(8676002)(66946007)(6916009)(64756008)(76116006)(66476007)(86362001)(71200400001)(9686003)(52536014)(2906002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: aUVQBpEKmktHW+HGy2AAK+WvT5+5X6e/UZDnfFVIhJv9I/SA/HluzusPnmGfBwBvFOjDjHQN9rFKTqKbOt3+s1uedfkSHMDyx1FqBHmBbBLM2wWpVKi23vdSAeMpEKCfJdZTRcqac62I6NlO0+sX/kTVl0CfJMvIPI+GKwyrcoSYQGqA9SHxY/s/pi1b+ezLSEpwamKaAYSuVazY41epJ8QKQ0F6yeGJKkGcml0ltwAcEbw0YtMRrFTu8+26ZPaYjlXT8Yr/AtCneyDJMcRDXcM1drVlppfPACZ90366MNINook88MjmyQ2J7cbp0HFtPba2Jj7os/3WTLrfbpOg0ZH+Lih3k5BBMCbs3Toa4ViU1lkcwcmR3ekwthCwLQTQO1yykKKjpZ3BdvREtQhNEm1a9eOiczBJWR+onnE9DH8l2Jna+wMsHIrwVnDdJfS/IEV779IjW1Ulz5wJqB1rX+9qbAF0bdwhGeG+nbMuTZUFRNpkjuz0uKHYlnvDNN5P1buyqWcyXQS0GMFnbVj21lX5rTwaBPJmL+pGy4fsHeKTY1b6XNAZwVjNIC/ZywnEt6E9YiYYtJ0FGPvhF9iPMJlDcoRLr7Ed8Iy1DRWanuoDwP7vfSfLW+THmVPnuT4Wz6v8ka/HTK46B2oxfiT4Ww==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2924.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0a81f2-32aa-4e80-818d-08d8499d4bd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2020 08:52:00.2497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mSXG5MCKvGoh0cBikSuyXv9y2xruQIdvlRQprUMbPMih1oIckpd2H3WSes90ASmcz9UQIFGLdHqUZLo7nYf1WtkaxYlRn4WFM+DweHelLrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5035
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFR1ZSwgQXVnIDI1LCAyMDIwIGF0IDA4OjEyIEFNIEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOg0KPiANCj4gSGkgR2FyZXRo
LA0KPiANCj4gT24gTW9uLCBBdWcgMjQsIDIwMjAgYXQgNToxMCBQTSBHYXJldGggV2lsbGlhbXMg
PGdhcmV0aC53aWxsaWFtcy5qeEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gT24gRnJpLCBBdWcg
MjEsIDIwMjAgYXQgMTI6MTIgUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4gd3JvdGU6DQo+ID4gPiBDb252ZXJ0IHRoZSBSZW5lc2FzIFJaL04xIFBpbiBjb250
cm9sbGVyIERldmljZSBUcmVlIGJpbmRpbmcNCj4gPiA+IGRvY3VtZW50YXRpb24gdG8ganNvbi1z
Y2hlbWEuDQo+ID4gPg0KPiA+ID4gVXNlICJwaW5jdHJsIiBnZW5lcmljIG5vZGUgbmFtZS4NCj4g
PiA+IERyb3AgZ2VuZXJpYyBhbmQgY29uc3VtZXIgZXhhbXBsZXMsIGFzIHRoZXkgZG8gbm90IGJl
bG9uZyBoZXJlLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4NCj4gPiBUaGlzIGlzIGEgY2xlYW4gYW5k
IHN1aXRhYmxlIGNvbnZlcnNpb24gdG8gbWUuDQo+ID4gRm9yIGNvbXBsZXRpb24gSSByYW4gdGhp
cyBhZ2FpbnN0IG15IGR0cyBmaWxlcyBmb3IgdGhlIHJ6bjEgZm9yDQo+ID4gdGVzdGluZyBwdXJw
b3NlcyBvbiBuZXh0LTIwMjAwODI0IHdpdGhvdXQgaXNzdWVzLg0KPiA+DQo+ID4gUmV2aWV3ZWQt
Ynk6IEdhcmV0aCBXaWxsaWFtcyA8Z2FyZXRoLndpbGxpYW1zLmp4QHJlbmVzYXMuY29tPg0KPiA+
IFRlc3RlZC1ieTogR2FyZXRoIFdpbGxpYW1zIDxnYXJldGgud2lsbGlhbXMuanhAcmVuZXNhcy5j
b20+DQo+IA0KPiBUaGFuayB5b3UhDQo+IA0KPiBCVFcsIGRvIHlvdSBwbGFuIHRvIHVwc3RyZWFt
IGFueSBvZiB0aG9zZSBEVFMgZmlsZXM/IEN1cnJlbnRseSwgbm8gdXBzdHJlYW0NCj4gRFRTIGZp
bGUgZm9yIFJaL04xIGNvbnRhaW5zIHBpbmN0cmwgcHJvcGVydGllcy4NCg0KSSBkbywgYWx0aG91
Z2ggSSBhaW0gdG8gY29tcGxldGUgcmVtYWluaW5nIGRyaXZlciB3b3JrIGZpcnN0IHNvIHRoYXQg
SSBjYW4gYmUgY29uZmlkZW50DQp0aGUgRFRTIGlzIGNvcnJlY3QgYW5kIGNvbXBsZXRlLg0KDQpS
ZWdhcmRzLA0KDQpHYXJldGggDQo=
