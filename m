Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B931FA688
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 04:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgFPCxg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 22:53:36 -0400
Received: from mail-eopbgr10043.outbound.protection.outlook.com ([40.107.1.43]:38560
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726025AbgFPCxf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 22:53:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx8Z9v7SHdUrskmNkF27Xrs9vGoVdoWNprqLL13ZDKNP+RedXZf4AVidcT8RPmZAduqh6X95DWjrMTJWZYfL+66/IaMJN11sNwXvOL21PjxM7zOz05kdPcR0lO3XO/fkBe6c66qdJRklAbmiOFwTMFbGPffB/UU4QGGR382MX6Dom/md5lXR4M8Y3ktyFrYeBu4ca03rSrzbAnT8PPwlJbvTiL25RlIj0tgMQtrOKRPDFTcSbK6rktu5rJd+OGxlKBeCYoeUlmdu83GE8sj0YsAKf+r7XYl7dqm2PBao4NYZ/AA4MgLmsnSJGyXWcpA7MSp3iCMFMaKKidCDogBD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti83isQ/CuYlDLOYnY4BZSnf+4+J4sTFhuRt32AZwJg=;
 b=gZaaWbGMVvhavhw7r/3F5iw/o4Pn9OY5T+uDnVzTGKTzQGxiUA8YPijxXCLHgWj5l35YSs2L/4Hp5vXJEYi3HBhT0SNwExK7bt1dxvW5XCB2pguSopBQJg5qom57R+UAAdp50p6C4xwvYdKyczFdt18pV9asSa7dDMSRd9+4OZ5Bi1ryyq8OXLDPNlGsGx1bZJ2q/JvDts3GnNI8/M3DVqxny2DmPBLIB2l6tIBKwMCD/kl8or/kGnW9Rnyp2SfGJy/u+KRIq6KpvEK3SO4I0JciTxK+jtO3Xy7vKb6Axaq+w9R/jA8gMW1xgPFfeDb/4iLwLsu5GFbckGYNzkqxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti83isQ/CuYlDLOYnY4BZSnf+4+J4sTFhuRt32AZwJg=;
 b=TQfh1jVs9u23Uz4caOo0N5kQdIM2l5fMJZ6U9zmYJc6T8ZgBNzgMJzZdCdSctyivWtFapaHCPt1zeiiy57x5rR2516XUQeBUmpb02PwyWcX/NyM0AiSGlVXYe79NygYBRTDyrFYev4Qw75ZVR+aJIghk9X+3wUw6ydrWeQ6k6uA=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4918.eurprd04.prod.outlook.com (2603:10a6:20b:6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Tue, 16 Jun
 2020 02:53:30 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 02:53:30 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        BOUGH CHEN <haibo.chen@nxp.com>
Subject: RE: [PATCH v2] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Topic: [PATCH v2] Revert "pinctrl: freescale: imx: Use
 'devm_of_iomap()' to avoid a resource leak in case of error in
 'imx_pinctrl_probe()'"
Thread-Index: AQHWPg9qyrpD8Vbzpk+sM4v78r2CgajalTWA
Date:   Tue, 16 Jun 2020 02:53:30 +0000
Message-ID: <AM6PR04MB4966D0FCE44CC173F95C139A809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1591673223-1680-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1591673223-1680-1-git-send-email-haibo.chen@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 02ff59ec-e408-4079-db22-08d811a073ca
x-ms-traffictypediagnostic: AM6PR04MB4918:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB49186A42AB35F40E4EF0D6D8809D0@AM6PR04MB4918.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:494;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DYy5h9vSU7l5B9HP/S/81pRVjb3DONfGRGszrYxUj4XdsJQ1xQ0Hr1fpZgP5uEgCEa6BjSudeyT6D8PrHrHCGJSSCUckRicLp/3iFqk8spYyf2Z4sGiJ25XQUexGx7NH9ro+FPDhdZjlFGmxqDHHOz1Asaw22UtFS2DImi222PoMB21oB7IdnC9AvbZnDXH0OjdP4Lo9XxH9BPw8tqFpUL+vVD+TBr2mWlVWmgpLib/PE/Ak973wRNepwCHu4GdWkSkqqN4g7Q1tqV/pQc7V1hdAPOVzzA2HxbQ7A1A65tHep7pYhtREunXS3AoeuEJSWrk4TS9wGsL/kKi83z559FX+Ui+llDbFVTuEO//nc1NsceO8kfvqMVKQsGeeAMbK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(66476007)(52536014)(33656002)(66446008)(64756008)(66556008)(7696005)(4326008)(66946007)(55016002)(7416002)(9686003)(26005)(2906002)(316002)(6506007)(186003)(71200400001)(478600001)(110136005)(8936002)(44832011)(83380400001)(8676002)(5660300002)(54906003)(86362001)(76116006)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: K4qp/t5LE5Q+JxhPLIeOvaiiu2WmcKI/JfbGREtKesuD9xyzW84R03V0Krda3a+sNSfVQfyxfu6zn+JNu5mqr1IsUoKK24WVxEmhKcw3dNTJJzVF7yQf7oB4Bd4QSi4AY/Nbl01zpv3LyFGKKw4GKxINPY7k0rr2gnXU0bINGDgVdRZlUHGjdi1u4SfEMtOQxymV6ljHyxPVm2sE8SFAG0pqykrWqLlD2mGAr5EREkgnDUBOH8biX1xFnNvWM3uM8Hex7cCRnrfH37vlLT+HspBlDrU2BdD2PQUErSjqskUiRLaZiB/WD34GsgQXYWwWDJuLIftlNORSXwHNnhJ0PwJfzEbszDA2T8DaTfWc+DBC1d5IF158Av7moEocw5UPz2iM4D+GMcaDvtRe5JBRbbKe1wJS54YdUmm0K0gynDazILUg0ExbaTDl6KKu9VBBmdTaRgTtfhTASgWBQfaVLCHG00BFpHI32eoIIW88U1Ex3OGZ2BsczMkkQXcYfwj5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ff59ec-e408-4079-db22-08d811a073ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 02:53:30.6949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgAxEcq5j4NZC65y7JYaH8UmImGL7WAqemYw3nbr453wsN6XqDK74PHPYSTqAayRKatK2igJIdwyroDv7YOdZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4918
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNCkNvdWxkIHlvdSBoZWxwIGFwcGx5IHRoaXMgcGF0Y2ggYXMgaXQgYmxvY2tl
ZCBNWDdEIGJvb3RpbmcgZm9yIGEgd2hpbGU/DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiBGcm9t
OiBoYWliby5jaGVuQG54cC5jb20gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gU2VudDogVHVlc2Rh
eSwgSnVuZSA5LCAyMDIwIDExOjI3IEFNDQo+IA0KPiBGcm9tOiBIYWlibyBDaGVuIDxoYWliby5j
aGVuQG54cC5jb20+DQo+IA0KPiBUaGlzIHJldmVydHMgY29tbWl0IGJhNDAzMjQyNjE1YzJjOTll
MjdhZjc5ODRiMTY1MDc3MWEyY2MyYzkuDQo+IA0KPiBBZnRlciBjb21taXQgMjZkOGNkZTUyNjBi
ICgicGluY3RybDogZnJlZXNjYWxlOiBpbXg6IGFkZCBzaGFyZWQgaW5wdXQgc2VsZWN0DQo+IHJl
ZyBzdXBwb3J0IikuIGkuTVg3RCBoYXMgdHdvIGlvbXV4IGNvbnRyb2xsZXJzIGlvbXV4YyBhbmQg
aW9tdXhjLWxwc3Igd2hpY2gNCj4gc2hhcmUgc2VsZWN0X2lucHV0IHJlZ2lzdGVyIGZvciBkYWlz
eSBjaGFpbiBzZXR0aW5ncy4NCj4gSWYgdXNlICdkZXZtX29mX2lvbWFwKCknLCB3aGVuIHByb2Jl
IHRoZSBpb211eGMtbHBzciwgd2lsbCBjYWxsDQo+IGRldm1fcmVxdWVzdF9tZW1fcmVnaW9uKCkg
Zm9yIHRoZSByZWdpb24gPDB4MzAzMzAwMDAtMHgzMDMzZmZmZj4gZm9yIHRoZQ0KPiBmaXJzdCB0
aW1lLiBUaGVuLCBuZXh0IHRpbWUgd2hlbiBwcm9iZSB0aGUgaW9tdXhjLCBBUEkNCj4gZGV2bV9w
bGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgd2lsbCBhbHNvIHVzZSB0aGUgQVBJDQo+IGRldm1f
cmVxdWVzdF9tZW1fcmVnaW9uKCkgZm9yIHRoZSBzaGFyZSByZWdpb24gPDB4MzAzMzAwMDAtMHgz
MDMzZmZmZj4NCj4gYWdhaW4sIHRoZW4gY2F1c2UgaXNzdWUsIGxvZyBsaWtlIGJlbG93Og0KPiAN
Cj4gWyAgICAwLjE3OTU2MV0gaW14N2QtcGluY3RybCAzMDJjMDAwMC5pb211eGMtbHBzcjogaW5p
dGlhbGl6ZWQgSU1YIHBpbmN0cmwNCj4gZHJpdmVyDQo+IFsgICAgMC4xOTE3NDJdIGlteDdkLXBp
bmN0cmwgMzAzMzAwMDAucGluY3RybDogY2FuJ3QgcmVxdWVzdCByZWdpb24gZm9yDQo+IHJlc291
cmNlIFttZW0gMHgzMDMzMDAwMC0weDMwMzNmZmZmXQ0KPiBbICAgIDAuMTkxODQyXSBpbXg3ZC1w
aW5jdHJsOiBwcm9iZSBvZiAzMDMzMDAwMC5waW5jdHJsIGZhaWxlZCB3aXRoIGVycm9yIC0xNg0K
PiANCj4gRml4ZXM6IGJhNDAzMjQyNjE1YyAoInBpbmN0cmw6IGZyZWVzY2FsZTogaW14OiBVc2Ug
J2Rldm1fb2ZfaW9tYXAoKScgdG8gYXZvaWQgYQ0KPiByZXNvdXJjZSBsZWFrIGluIGNhc2Ugb2Yg
ZXJyb3IgaW4gJ2lteF9waW5jdHJsX3Byb2JlKCknIikNCj4gU2lnbmVkLW9mZi1ieTogSGFpYm8g
Q2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiBSZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxh
aXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvcGluY3RybC9mcmVlc2Nh
bGUvcGluY3RybC1pbXguYyB8IDcgKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0
cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmMNCj4gYi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxl
L3BpbmN0cmwtaW14LmMNCj4gaW5kZXggY2I3ZTBmMDhkMmNmLi4xZjgxNTY5YzdhZTMgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYw0KPiArKysg
Yi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmMNCj4gQEAgLTgyNCwxMyAr
ODI0LDEyIEBAIGludCBpbXhfcGluY3RybF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LA0KPiAgCQkJCXJldHVybiAtRUlOVkFMOw0KPiAgCQkJfQ0KPiANCj4gLQkJCWlwY3RsLT5p
bnB1dF9zZWxfYmFzZSA9IGRldm1fb2ZfaW9tYXAoJnBkZXYtPmRldiwgbnAsDQo+IC0JCQkJCQkJ
ICAgICAgMCwgTlVMTCk7DQo+ICsJCQlpcGN0bC0+aW5wdXRfc2VsX2Jhc2UgPSBvZl9pb21hcChu
cCwgMCk7DQo+ICAJCQlvZl9ub2RlX3B1dChucCk7DQo+IC0JCQlpZiAoSVNfRVJSKGlwY3RsLT5p
bnB1dF9zZWxfYmFzZSkpIHsNCj4gKwkJCWlmICghaXBjdGwtPmlucHV0X3NlbF9iYXNlKSB7DQo+
ICAJCQkJZGV2X2VycigmcGRldi0+ZGV2LA0KPiAgCQkJCQkiaW9tdXhjIGlucHV0IHNlbGVjdCBi
YXNlIGFkZHJlc3Mgbm90IGZvdW5kXG4iKTsNCj4gLQkJCQlyZXR1cm4gUFRSX0VSUihpcGN0bC0+
aW5wdXRfc2VsX2Jhc2UpOw0KPiArCQkJCXJldHVybiAtRU5PTUVNOw0KPiAgCQkJfQ0KPiAgCQl9
DQo+ICAJfQ0KPiAtLQ0KPiAyLjE3LjENCg0K
