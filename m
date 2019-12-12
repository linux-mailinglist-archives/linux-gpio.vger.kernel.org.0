Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB6511CEA5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 14:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729469AbfLLNoZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 08:44:25 -0500
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:59096
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729392AbfLLNoZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 08:44:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrJuJgFWUoHpLYaDKyn8nGZ+EFqxA2vTvXDPJNWT3ms9HMaGwgu+yyvWHmIAMqGbkZxx6iDONP1odlPXHBy/vsMPbb87km7XrNHnBxfmKeyl4/8KJTILcaraLtZp82TXX6jQMUBxgySdz2U3DWaz14wX2nw6AcZe2A1DZBU4RRO0b3lRZ3uH/mFinDmeQtD2dU4v5QPcoh4h++GZgqr17vAnQMRB/0/iudDZuzZxjfpUUnSy9CfHSz/cXulxv8sHQdaRuvAkr7Uey1YqFerfID7YW0SxXRabZQuokYqE3bUQwsbngT8e0wXYdkodkcjC0IRsEPL9U+HHmgKb+U3pPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc5yh4LVAiggzPN+wor+bf3kjTBee23Lfe8dsCoGEGg=;
 b=G/cqS+A50ysTKWlDMBCfmbvkNg6l9rDDJlcBoWGob549zkqaGkqswGWnsf87csOhrPkFdNTa1+B5JdWFZ+WW2EFNg18MbickiwKMFsL/0WVkXu3JyTNmV1unHfeBpkXRY5kJXHZbdMmPEuOiTHSk3ZajOzoeYntAxewmOZIXRA4LQggwyxY2dQPQSGn3l0X7U2MPfBIdmQBXzSgLQq4oCTb9pH+QEK3NysQPOq/6qRpTO2jQIi+Ek1sYZfOrBYrNvOWF08bB6VxdJQ5k0UxCmyYznCkbX2tcTvAlj/Kpm7EQKwHNZRGJgSBF5bIEOTDRIUNyyFVS4fF52xmKZ8+pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc5yh4LVAiggzPN+wor+bf3kjTBee23Lfe8dsCoGEGg=;
 b=TrGMPt6Ga4g30cMnX2CpZt+R/pOICjB+02D93F87bIFfIll71tcuI4FH0vxjONNzkRwDt0B909HM9m48ZxNjnhBJ0HCYwFor30FQ0unXm01kxnNLINPTMhZjyuxEZSbBuHjFNHCD4iU9CyD+8me/I/PrHRlGTclPo6s2KxmhQBM=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1612.jpnprd01.prod.outlook.com (52.133.160.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.17; Thu, 12 Dec 2019 13:44:21 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74db:232e:f59e:83f2]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74db:232e:f59e:83f2%3]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 13:44:21 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: rza1: reduce printed messages
Thread-Topic: [PATCH] pinctrl: rza1: reduce printed messages
Thread-Index: AQHVsD0N18LySv2+wEyDYhBVub9Giqe2QQ0AgABBLmA=
Date:   Thu, 12 Dec 2019 13:44:21 +0000
Message-ID: <TY1PR01MB1562D31F6F362D6F588BD6FE8A550@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20191211160638.31853-1-chris.brandt@renesas.com>
 <20191212094436.r5zergjlduobjq7n@uno.localdomain>
In-Reply-To: <20191212094436.r5zergjlduobjq7n@uno.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctN2RkYTg0MTItMWNlNS0xMWVhLWFhNTUtOTRlNmY3Njc5M2FlXGFtZS10ZXN0XDdkZGE4NDE0LTFjZTUtMTFlYS1hYTU1LTk0ZTZmNzY3OTNhZWJvZHkudHh0IiBzej0iMTA3OCIgdD0iMTMyMjA2MzE4NTgzMzkxNDgwIiBoPSJVUzh6TlhlTHErVWtmYUZRdDJmZUNyM2tkWG89IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d3b0cdc7-1bbd-488c-f2bb-08d77f0964ac
x-ms-traffictypediagnostic: TY1PR01MB1612:
x-microsoft-antispam-prvs: <TY1PR01MB1612A8A2DBCF33F260D667068A550@TY1PR01MB1612.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(189003)(199004)(186003)(316002)(8676002)(54906003)(71200400001)(81156014)(81166006)(5660300002)(8936002)(26005)(52536014)(33656002)(7696005)(2906002)(15650500001)(4744005)(6506007)(66556008)(66446008)(55016002)(86362001)(6916009)(478600001)(4326008)(66476007)(64756008)(9686003)(76116006)(66946007);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1612;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8JrpVXabJh8Yn2xlGcTRqLDKt7VavKZnrxiS3nN4UIllhXdSnqGthaSgXlm6iGxn+FKfYmGIvIVjM8r/FW/QpWDQeS26wSq85Gy+dOt1zcmGgqM3/q/30pPpSOw/Ji9r5wA7zfE+3+BB9d8pYUSdWmGO17vTQw6LMUUNuTDtS1SfmtCENiTRt4Xc/j4gYPbPTh98/4huQln719//IrDSzW7G7B8q2AxEoSynt28uku3yVWsIfvZtIEZqygxXkXyy6sbWOXpiUc1aG+Yf9B5fl8n3N1Q3YMWjBMKyB9dHO1dstSvCbUxsLbzZZDk3w8QVrhRhfFTyTlEprl/Fu8Is33sbU7G9PpQjZWKMXiNz51I+IkER4V2DVYGevGYw+xgh/aCQZsFKfO0g0JFZ5miHWX4rsEk1FKhqo7pj8RO1phsoVw+ZP8j+ww9PLvdSdpiu
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b0cdc7-1bbd-488c-f2bb-08d77f0964ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 13:44:21.4804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FSBi7yy6Qf3m2eFivB9BZG7SgG/m6/ZOeoNjPmbx+NkXPEI+ln2w1baNbdRTLAgsUQ5rIWFuTtJ8oB3VD0OqMXU/Wdjj2ZFnYNeNBa9mLMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1612
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgSmFjb3BvLA0KDQpPbiBUaHUsIERlYyAxMiwgMjAxOSwgSmFjb3BvIE1vbmRpIHdyb3RlOg0K
PiA+IC0JZGV2X2luZm8ocnphMV9wY3RsLT5kZXYsICJQYXJzZWQgZ3Bpb2NoaXAgJXMgd2l0aCAl
ZCBwaW5zXG4iLA0KPiA+ICsJZGV2X2RiZyhyemExX3BjdGwtPmRldiwgIlBhcnNlZCBncGlvY2hp
cCAlcyB3aXRoICVkIHBpbnNcbiIsDQo+ID4gIAkJIGNoaXAtPmxhYmVsLCBjaGlwLT5uZ3Bpbyk7
DQo+IA0KPiBQbGVhc2UgYWxpZ24gdGhpcyBsaW5lIHRvIHRoZSBvcGVuICggLi4uIFNvcnJ5IHRv
IGJvdGhlciBmb3Igc3VjaCBtaW5vciB0aGluZy4NCg0KRmFpciBwb2ludCENCkknbGwgZml4IGFu
ZCByZXNlbmQuDQoNCj4gVGhlcmUgYXJlIG90aGVyIGRldl9pbmZvIHdoaWNoIG1pZ2h0IHNob3cg
dXAgZnJlcXVlbnRseSwgSSdtIGxvb2tpbmcgYXQgbGluZQ0KPiAxMDU0IGluIGV4YW1wbGUuIEkg
dGhpbmsgaXQncyBmaW5lIGFzIHRoZXkgc2hvdyB0aGUgYWN0dWFsbHkgZW5hYmxlZCBncm91cHMu
Li4NCg0KWWEsIEknbSBPSyB0aGF0LiBXaGVuIGNoZWNraW5nIHNvbWVvbmUncyBsb2dzLCBJIGNh
biBzZWUgaWYgdGhleSBhY3R1YWxseSBlbmFibGVkDQp0aGUgcGlucyBvciBub3QuDQoNCkkgd2Fz
IGp1c3QgYW5ub3llZCBieSBhbGwgdGhlIHRleHQgYWJvdXQgcmVnaXN0ZXJpbmcgdGhlIHBvcnRz
Li4uLnRoYXQgY29tZXMgZnJvbQ0KdGhlIC5kdHNpIHRoYXQgbm8gb25lIGV2ZXJ5IGNoYW5nZXMu
Li4uLmFuZCBJIHdhcyBzY3JvbGxpbmcgdGhvdWdoIHRyeWluZyB0byBmaW5kDQpteSBwcmludCBk
ZWJ1ZyBtZXNzYWdlcyBmb3IgYW5vdGhlciBkcml2ZXIgSSB3YXMgZGVidWdnaW5nICAgOm8NCg0K
DQo+IEFud2F5LCBtaW5vciBhbGlnbmVtZW50IGlzc3VlIGFwYXJ0DQo+IEFja2VkLWJ5OiBKYWNv
cG8gTW9uZGkgPGphY29wb0BqbW9uZGkub3JnPg0KDQoNClRoYW5rIHlvdS4NCkknbGwgcmVzZW5k
IHdpdGggeW91ciBBQ0sNCg0KDQpDaHJpcw0KDQo=
