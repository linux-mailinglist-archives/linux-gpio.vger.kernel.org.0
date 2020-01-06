Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E653130E93
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2020 09:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgAFIUG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 03:20:06 -0500
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:47840
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725821AbgAFIUF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 6 Jan 2020 03:20:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaFeGqoZglNsKoByT9+3FnvcEsYEeHQQFPjiwnDLJnw4PjPPhn/eQohuVVxgS7CcGga92+Xwitq/kQyVJRHQ32IucVXwTRx5VPB+fnreiN/dDzY7Udp+6mC30bQL8YNlsHJ9IEj5R0qPIwvyAG5X909a7FuXZ1008i0tHipe5CREtMl7g+Kp8OsP+2xLjiT1IihONnneRFp70IU9x1kzBeFlZVhBDY145ik0oRZbW5mo69FYjJV5cbNSCt+scJAkRMdYZ84FB1/OYsKlWX6pfMyS68e1+OgYXLF8LYhL91z6FfwCgDbDZzdnJGITrtxS718Ne0sjQZB1+M7VBpf0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/oJMseG49HRdN8nqpA3yt5/XFKwyz0Lj7dR+PTKxA8=;
 b=eU1heFs08V8mWSMQ93TcrF+Hoap+qcXEeJ5+KTyszxDRdDbWXP3K4QUT/BlpPtG7N8VtaiAP+dNtuwwuvyTw1Hakov4si5+wYE49shCA/yKVezxZ418jYc7CHs9+FHyACof5g5PaXilEfMDKGMkuGCXnFPAkJt29Xs/P88W5TiCqfvoOkrRuxc9mYay6os8WxqtP0ZoGlhRJLL6lA4QhS9ennFKkZgX6dxrm7JniLtlqBfwDYNvFdEy0L7B7WKny7vo6WVrk754ZDxGwKJ9/HowE43kREqnftNVcByF3B7ADr0Q6jCxJ6DTUVBc+jVASwzJUTB2C8qXjtRsA/WOPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/oJMseG49HRdN8nqpA3yt5/XFKwyz0Lj7dR+PTKxA8=;
 b=h5SklsmioSxDPyLEBNTdF/XIUDPkta2BeVzUk2t5T5oq5iBQX+aFO3He3+oOam5xMj35ROEBYCvzoT48RUy01ekByZfFAC8M1JkJlAn6vL+wmpvXUdGZFVuTWfM79EtRsGB9f24UW6gd63cIaxMw8Nd8CljFdbELEhtSMHnD8ac=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2941.jpnprd01.prod.outlook.com (20.177.104.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Mon, 6 Jan 2020 08:20:01 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 08:20:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: sh-pfc: Split R-Car H3 support in two
 independent drivers
Thread-Topic: [PATCH] pinctrl: sh-pfc: Split R-Car H3 support in two
 independent drivers
Thread-Index: AQHVtQnJr1qU3YwjV02Rx/j9qo44qqfKotuQgAHmJICAEN6W0A==
Date:   Mon, 6 Jan 2020 08:20:01 +0000
Message-ID: <TYAPR01MB4544C1FDB2791246DBDF46F7D83C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191217184242.827-1-geert+renesas@glider.be>
 <TYAPR01MB4544936355182F4091F89EECD8280@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <CAMuHMdVnoGpBvU5hH1dBHo6QXFS5voy6SmEDZKyu1JWqLfwhGQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVnoGpBvU5hH1dBHo6QXFS5voy6SmEDZKyu1JWqLfwhGQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a4280ec3-560b-42d9-6abc-08d7928139cb
x-ms-traffictypediagnostic: TYAPR01MB2941:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB29418580456C0A9695B917BAD83C0@TYAPR01MB2941.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(346002)(39850400004)(136003)(376002)(51914003)(199004)(189003)(9686003)(86362001)(26005)(2906002)(4326008)(54906003)(316002)(186003)(71200400001)(7696005)(8676002)(81156014)(81166006)(52536014)(66476007)(66946007)(76116006)(6506007)(4744005)(8936002)(66446008)(64756008)(66556008)(5660300002)(966005)(55016002)(33656002)(6916009)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2941;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: drPicp9XVFGkHHoQ5pUWwbQGnMtb37ZuutgSTNrd9gIWiDn/FdYoltrP9sOy1x8EXuUyvp4awqUTLilGHkxemJkUipB/GvGJU+Iuh1RhZb6dS3W8k1WtRcy9lzX7klrXuWtf53Nf9SIq5FnCYPointDd71gL8OzAZ1hug5PFfcra0UIKvbnxu5BiG9Ik1vCg/cGzW06tZqLSenhnpLvG/4NOqmvIZPYiS2gqRDCu9QvI9za5h0hTPsy0BwrAza6/X9Br/Et6oweolcbAYIurn6ouxJBUiWx9OHroNst35eYsHoU9lmu1+ROJ8qriDgVgAyjM/Ro+yoiHhwkD3Wgfgo5iQE33qCv7N/xIVCZC33Am6VLyh1iTSXsyUpcdGho56GDemHhIWcTbJjFCQwVBXZ25m+j/+fwRV6n1AXaBr2nbAJUqND9J01BKZiLtsT/1lsilBu5HWiJPJsU87s/L8HTz4YWxgYKhEf995hgVoPACiykFPRPgqxC5Eskq6k5ukzvBGjDnhd3SPLPOuwMZ1rliED24chPX/VW0dJfKxS8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4280ec3-560b-42d9-6abc-08d7928139cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 08:20:01.3174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nsmeWmtWR2YusPuKLBKoGA5B/dbaVlYNHSABLGQa4i3GXMXqE/1upJyX+2MFUyypjgz3G6YtCpNrUoVJ9FJEYnvj5MHX6bTMu/pfY/YUjqCfjTBUuJxyddlw4jMqhXbR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2941
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIERlY2VtYmVyIDI2LCAyMDE5IDExOjM0IFBNDQo8c25pcD4NCj4gPiA+IFN1Z2dlc3Rpb25z
IGZvciBzaW1wbGlmeWluZyBzaF9wZmNfcXVpcmtfbWF0Y2goKSwgb3IgZm9yIGFsdGVybmF0aXZl
DQo+ID4gPiBzb2x1dGlvbnMgYXJlIHdlbGNvbWUhDQo+ID4NCj4gPiBJIHdvbmRlcmVkIGlmIHVz
aW5nIHdlYWsgYXR0cmlidXRlIG9uIGJvdGggaW5mbyB2YXJpYWJsZXMgY291bGQNCj4gPiBzaW1w
bGlmeSBzaF9wZmNfcXVpcmtfbWF0Y2goKSwgYnV0IHN1Y2ggYSBjb2RlIFsxXSBkb2Vzbid0IHNl
ZW0gYmV0dGVyDQo+ID4gdGhhbiB1c2luZyAjaWZkZWYuIEFsc28sIHVzaW5nIHdlYWsgYXR0cmli
dXRlcyB3YXN0ZSBkYXRhIHNpemUNCj4gPiBpZiBSOEE3Nzk1MD1uIGFuZCBSOEE3Nzk1MT15IGZv
ciBpbnN0YW5jZS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGdyZWF0IHN1Z2dlc3Rpb24hDQo+IA0K
PiBUaGUgdHJpY2sgaXMgdG8gYWRkIF9fd2VhayB0byB0aGUgZXhpc3RpbmcgZXh0ZXJuIGRlY2xh
cmF0aW9ucyBpbiBzaF9wZmMuaCwNCj4gaW5zdGVhZCBvZiBhZGRpbmcgd2VhayBlbXB0eSBzdHJ1
Y3RzLg0KPiBXaGVuIHRoZSBzdHJ1Y3RzIGRvbid0IGV4aXN0LCB0aGVpciBhZGRyZXNzZXMganVz
dCBiZWNvbWUgemVyby4NCg0KSSdtIGhhcHB5IG15IHN1Z2dlc3Rpb24gaXMgdXNlZnVsIQ0KIyBJ
IGRpZG4ndCBrbm93IHRoZSB0cmljayB0aG91Z2ggOikNCg0KPiBTbyBJIGNhbWUgdXAgd2l0aCB0
aGUgZm9sbG93aW5nICh3aGl0ZXNwYWNlLWRhbWFnZWQpIHBhdGNoLCB3aGljaCBJIGludGVuZA0K
PiB0byBmb2xkIGludG8gdGhlIG9yaWdpbmFsLCBpZiBubyBvbmUgb2JqZWN0cy4NCg0KVGhlIHYy
IHBhdGNoIFsxXSBpcyBiZXR0ZXIgdGhhbiB2MSENCg0KWzFdDQpodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzExMzEyNzMzLw0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hp
bW9kYQ0KDQo=
