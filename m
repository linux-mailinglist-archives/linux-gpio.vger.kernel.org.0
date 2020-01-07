Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7BAE131F9E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 07:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgAGGBy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 01:01:54 -0500
Received: from mail-eopbgr50077.outbound.protection.outlook.com ([40.107.5.77]:6976
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725267AbgAGGBy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Jan 2020 01:01:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD60L1mN9mh00sFQSUEFR+7j6a7yPk6dPqyhpkKN7jUX6EVyjkHK6+sWrsXYMY/By61hR1aPesNPAuFBqBdkT0iO8NDQ2uk8QyQ2Hvr3r8DobfMSjL2QKNAG1IiwCz8Xydd1AHpMGKxSfbxCSalXpYlls01mnOjo8NkZr7eBGCrdlZVRwtULZGhZE51CmkwFtiPh6VxCL/ZiYthDdhGmefAUnh9ejaf3KYGoUwGU4rSajudJ4CM8LmMIGKj/479o8UUYzZ6E9lhnvtAj+WwlbQy5wzFH72h7xZRT/ZCb2oNronyWi/I8tDc1pFf1C04pR8xDuoA0ZnkYQyRqTdJI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kyp1/lqcXZclX2G92WcN+9Dzkq53t9hr1zWzZnpHqTs=;
 b=dhFlaJShJNNwIqFrn3SIoqSmaIBMK8m0GXiPCCedzfg0Zxd/g4j6HnQZujhLrnG1Ba7kzhR8lpR2ZlEPG6oMGaskKhmIZ18Z9VB0Zo6IBVFyyDK2f5m5l+KC5Nm2E3AkwJmY+6+JaaO5VbIM7eRDSGJ6t1auTGCWzGUYHZwxwzJ7zQbxwaxc3bFPUBARtoe9HIzx9hWGxmpDrvp76N7JFRjYPYx743NDFvw5syh5R42bNc0Gu/ob21jJqvuk50EqlM9sY6dKlvgoJ6ZXKZnzSwSTyMqTQ6hHcRsa0foQbQe2VDBqyAQhDG2rVKBOFZpwJHOg4Jdjx0OO2Ku2x6Q2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kyp1/lqcXZclX2G92WcN+9Dzkq53t9hr1zWzZnpHqTs=;
 b=ko5IYfAnqfCgcobcy1xSZraYF2K9beNV3JklA6T0IQYHhVI3fUDQh2PDu8x1UeRfPMgcZNeL9uKolQTWz7licAuWPe2/7KSV5wWcVkE5b+PV+rMl+xcCrdP/Ftv4vH3ou5FKQWQM8YE3WgrK4iUdVfUusOUF46uCe4RA8BXIjWo=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3881.eurprd04.prod.outlook.com (52.134.73.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Tue, 7 Jan 2020 06:01:49 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d968:56ad:4c0c:616f]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d968:56ad:4c0c:616f%7]) with mapi id 15.20.2602.016; Tue, 7 Jan 2020
 06:01:49 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "olof@lixom.net" <olof@lixom.net>,
        "maxime@cerno.tech" <maxime@cerno.tech>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 1/3] dt-bindings: imx: Add pinctrl binding doc for
 i.MX8MP
Thread-Topic: [PATCH V3 1/3] dt-bindings: imx: Add pinctrl binding doc for
 i.MX8MP
Thread-Index: AQHVxHRpTfntiLe8yUKqATvuncqqT6feM/AAgACAI1A=
Date:   Tue, 7 Jan 2020 06:01:48 +0000
Message-ID: <DB3PR0402MB39161890A510346EBA8EF881F53F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1578302992-5723-1-git-send-email-Anson.Huang@nxp.com>
 <20200106221246.GA17055@bogus>
In-Reply-To: <20200106221246.GA17055@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9e9cd291-2132-4892-362d-08d79337158d
x-ms-traffictypediagnostic: DB3PR0402MB3881:|DB3PR0402MB3881:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3881E5FDA6A9179102BD719FF53F0@DB3PR0402MB3881.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;SFS:(10001)(10009020)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(199004)(189003)(76116006)(7696005)(64756008)(66446008)(66556008)(6916009)(66946007)(66476007)(6506007)(186003)(2906002)(44832011)(4326008)(26005)(9686003)(55016002)(45080400002)(478600001)(52536014)(316002)(86362001)(33656002)(8936002)(71200400001)(81166006)(54906003)(81156014)(8676002)(7416002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3881;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N4k/xoIkOQ145bMrXqgywixefk5MgRSVad3q/l0tysSseTVuM1U1FTUOZ1dHCedJ12YoFohMd/HXDf1Bp9rn7iXKIqIetDoRrewGn+Jwl/85DbfUh4SQvFXd73B2d/OSgT5cihjhbbtLbx3OEMMzfPpDJkIvkEwC80Kpl/OMo/IMeBLamnWq9Uuw8Oi0cBTTyArCCgek8DBxlgTA+y8P/ag4HP9Nlj8fRG1/EZBQFdHrhCI/iUUlzY4NK+PemBMSU1eOBEuGLOZVgZ2Yf+bZ28osNEhQzEbii8SFkLrq/9cejvO/2RQ7MsyfesWhzy99E+vvUJ8opf1GuOjcWu65LWoDaV9oEUp210DOKxKcExOmkA/+W7K/2tDgCI5gZ0GnmLte9tz9BSxJQ1ZhaIAsFKVq6NoLdAVHLsEI+GmQA5SG6DRd/z4ZhgOmiPQ9EYJG21lxcOOsOFYNlkGBx5J4QrajGPU1Z213rPWfLSVeoNe3Z6OA/03Su3mNog37aSpVjqEHicr7TPBWJ1M43WWA09NH5BXqrvncFEYVA9NTUkU2nyCTt9rkm/3u80tct9cUhq6odqK3bvTCU5DRcnTK8A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9cd291-2132-4892-362d-08d79337158d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 06:01:48.4807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tdxO+C6aDCMu5w/lK0OKuX9YzK+rYIsytV1nIC2Szhci/pb6RXSPgID32nPMi3pw1O/2p4KqA6Bjc9nC5QUJEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3881
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIFJvYg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMS8zXSBkdC1iaW5kaW5nczogaW14
OiBBZGQgcGluY3RybCBiaW5kaW5nIGRvYyBmb3INCj4gaS5NWDhNUA0KPiANCj4gT24gTW9uLCBK
YW4gMDYsIDIwMjAgYXQgMDU6Mjk6NTBQTSArMDgwMCwgQW5zb24gSHVhbmcgd3JvdGU6DQo+ID4g
QWRkIGJpbmRpbmcgZG9jIGZvciBpLk1YOE1QIHBpbmN0cmwgZHJpdmVyLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gUmV2aWV3
ZWQtYnk6IEFiZWwgVmVzYSA8YWJlbC52ZXNhQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdl
cyBzaW5jZSBWMjoNCj4gPiAJLSB1c2UgRFQgc2NoZW1hIGluc3RlYWQgb2YgdHh0IGZvciBiaW5k
aW5nIGRvYy4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvZnNsLGlteDhtcC1w
aW5jdHJsLnlhbWwgICAgICAgfCAgNjUgKysNCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OG1wLXBpbmZ1bmMuaCAgICAgfCA5MzENCj4gKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOTk2IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwv
ZnNsLGlteDhtcC1waW5jdHJsLnlhbWwNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1waW5mdW5jLmgNCj4gPg0KPiA+IGRpZmYgLS1n
aXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2ZzbCxp
bXg4bXAtcGluY3RybC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGluY3RybC9mc2wsaW14OG1wLXBpbmN0cmwueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+ID4gaW5kZXggMDAwMDAwMC4uY2RiNmMyMQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1w
LXBpbmN0cmwueWFtDQo+ID4gKysrIGwNCj4gPiBAQCAtMCwwICsxLDY1IEBADQo+ID4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgJVlBTUwgMS4yDQo+ID4gKy0t
LQ0KPiA+ICskaWQ6DQo+ID4gK2h0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJGZGV2aQ0KPiA+ICtjZXRyZWUub3JnJTJGc2NoZW1h
cyUyRnBpbmN0cmwlMkZmc2wlMkNpbXg4bXAtDQo+IHBpbmN0cmwueWFtbCUyMyZhbXA7ZGF0DQo+
ID4NCj4gK2E9MDIlN0MwMSU3Q2Fuc29uLmh1YW5nJTQwbnhwLmNvbSU3Q2ZhY2Q0NDI2ZTZlNTRi
YzU0MTZiMDhkNzkNCj4gMmY1OTMxOSUNCj4gPg0KPiArN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5
OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM3MTM5NDU1NzYxOTU3NTANCj4gNSZhbXA7cw0KPiA+DQo+
ICtkYXRhPTBPM3cxVTZ2czl4VnE2QiUyQmh5VDROejVIZEt1azZYRHltUFVnN3dReTBsTSUzRCZh
bXA7DQo+IHJlc2VydmVkPTANCj4gPiArJHNjaGVtYToNCj4gPiAraHR0cHM6Ly9ldXIwMS5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZkZXZpDQo+ID4g
K2NldHJlZS5vcmclMkZtZXRhLQ0KPiBzY2hlbWFzJTJGY29yZS55YW1sJTIzJmFtcDtkYXRhPTAy
JTdDMDElN0NhbnNvbi5odWENCj4gPg0KPiArbmclNDBueHAuY29tJTdDZmFjZDQ0MjZlNmU1NGJj
NTQxNmIwOGQ3OTJmNTkzMTklN0M2ODZlYTFkM2JjMmINCj4gNGM2ZmE5Mg0KPiA+DQo+ICtjZDk5
YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzcxMzk0NTU3NjE5NTc1MDUmYW1wO3NkYXRhPVhVTiUyQkcN
Cj4gek1PcXBWTlJqDQo+ID4gK1VNMUNPNkNYUE9NVDcyRHRkZWZMcyUyQnMlMkJHUGFHSSUzRCZh
bXA7cmVzZXJ2ZWQ9MA0KPiA+ICsNCj4gPiArdGl0bGU6IEZyZWVzY2FsZSBJTVg4TVAgSU9NVVgg
Q29udHJvbGxlcg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBBbnNvbiBIdWFu
ZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOg0KPiA+ICsg
IFBsZWFzZSByZWZlciB0byBmc2wsaW14LXBpbmN0cmwudHh0IGFuZCBwaW5jdHJsLWJpbmRpbmdz
LnR4dCBpbg0KPiA+ICt0aGlzIGRpcmVjdG9yeQ0KPiA+ICsgIGZvciBjb21tb24gYmluZGluZyBw
YXJ0IGFuZCB1c2FnZS4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJs
ZToNCj4gPiArICAgIGNvbnN0OiBmc2wsaW14OG1wLWlvbXV4Yw0KPiA+ICsNCj4gPiArIyBDbGll
bnQgZGV2aWNlIHN1Ym5vZGUncyBwcm9wZXJ0aWVzDQo+ID4gK3BhdHRlcm5Qcm9wZXJ0aWVzOg0K
PiA+ICsgICctZ3JwJCc6DQo+ID4gKyAgICB0eXBlOiBvYmplY3QNCj4gPiArICAgIGRlc2NyaXB0
aW9uOg0KPiA+ICsgICAgICBQaW5jdHJsIG5vZGUncyBjbGllbnQgZGV2aWNlcyB1c2Ugc3Vibm9k
ZXMgZm9yIGRlc2lyZWQgcGluIGNvbmZpZ3VyYXRpb24uDQo+ID4gKyAgICAgIENsaWVudCBkZXZp
Y2Ugc3Vibm9kZXMgdXNlIGJlbG93IHN0YW5kYXJkIHByb3BlcnRpZXMuDQo+ID4gKw0KPiA+ICsg
ICAgcHJvcGVydGllczoNCj4gPiArICAgICAgZnNsLHBpbnM6DQo+ID4gKyAgICAgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5nDQo+IA0KPiBzdHJpbmcgb3Iu
Li4NCj4gDQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgICAgICBlYWNoIGVu
dHJ5IGNvbnNpc3RzIG9mIDYgaW50ZWdlcnMgYW5kIHJlcHJlc2VudHMgdGhlIG11eA0KPiA+ICsg
YW5kIGNvbmZpZw0KPiANCj4gaW50ZWdlcnM/DQoNCkkgdGhpbmsgaXQgc2hvdWxkIGJlIHVpbnQz
Mi1hcnJheQ0KDQo+IA0KPiA+ICsgICAgICAgICAgc2V0dGluZyBmb3Igb25lIHBpbi4gVGhlIGZp
cnN0IDUgaW50ZWdlcnMgPG11eF9yZWcgY29uZl9yZWcgaW5wdXRfcmVnDQo+ID4gKyAgICAgICAg
ICBtdXhfdmFsIGlucHV0X3ZhbD4gYXJlIHNwZWNpZmllZCB1c2luZyBhIFBJTl9GVU5DX0lEIG1h
Y3JvLCB3aGljaA0KPiBjYW4NCj4gPiArICAgICAgICAgIGJlIGZvdW5kIGluIDxhcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtcGluZnVuYy5oPi4NCj4gVGhlIGxhc3QNCj4gPiAr
ICAgICAgICAgIGludGVnZXIgQ09ORklHIGlzIHRoZSBwYWQgc2V0dGluZyB2YWx1ZSBsaWtlIHB1
bGwtdXAgb24gdGhpcyBwaW4uDQo+IFBsZWFzZQ0KPiA+ICsgICAgICAgICAgcmVmZXIgdG8gaS5N
WDhNIFBsdXMgUmVmZXJlbmNlIE1hbnVhbCBmb3IgZGV0YWlsZWQgQ09ORklHIHNldHRpbmdzLg0K
PiA+ICsNCj4gPiArICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAtIGZzbCxwaW5zDQo+ID4gKw0K
PiA+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtyZXF1aXJl
ZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsNCj4gPiArYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAjIFBp
bm11eCBjb250cm9sbGVyIG5vZGUNCj4gPiArICAtIHwNCj4gPiArICAgIGlvbXV4YzogcGluY3Ry
bEAzMDMzMDAwMCB7DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsaW14OG1wLWlvbXV4
YyI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4MzAzMzAwMDAgMHgxMDAwMD47DQo+ID4gKw0KPiA+
ICsgICAgICAgIHBpbmN0cmxfdWFydDI6IHVhcnQyZ3JwIHsNCj4gPiArICAgICAgICAgICAgZnNs
LHBpbnMgPSA8DQo+ID4gKyAgICAgICAgICAgICAgICBNWDhNUF9JT01VWENfVUFSVDJfUlhEX19V
QVJUMl9EQ0VfUlgJMHg0OQ0KPiA+ICsgICAgICAgICAgICAgICAgTVg4TVBfSU9NVVhDX1VBUlQy
X1RYRF9fVUFSVDJfRENFX1RYCTB4NDkNCj4gDQo+IFJ1biAnbWFrZSBkdF9iaW5kaW5nX2NoZWNr
Jy4gRG9lc24ndCBidWlsZDoNCj4gDQo+IEVycm9yOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1wLQ0KPiBwaW5jdHJsLmV4YW1wbGUuZHRzOjIzLjIx
LTIyIHN5bnRheCBlcnJvciBGQVRBTCBFUlJPUjogVW5hYmxlIHRvIHBhcnNlDQo+IGlucHV0IHRy
ZWUNCg0KSSBmaXggaXQgYnkgTk9UIHVzaW5nIE1hY3JvIERlZmluaXRpb24gYXMgYmVsb3csIGJ1
dCBzdGlsbCBoYXZlIHNvbWUgYnVpbGQgZXJyb3Igd2hpY2ggbG9va3MgbGlrZQ0KbXkgZW52aXJv
bm1lbnQgaXNzdWUsIHBsZWFzZSBoZWxwIHJldmlldyBWNCwgdGhhbmtzLg0KDQogICAgICAgICAg
ICAgZnNsLHBpbnMgPSA8DQogICAgICAgICAgICAgICAgIDB4MjI4IDB4NDg4IDB4NUYwIDB4MCAw
eDYgICAgICAgMHg0OQ0KICAgICAgICAgICAgICAgICAweDIyOCAweDQ4OCAweDAwMCAweDAgMHgw
ICAgICAgIDB4NDkNCiAgICAgICAgICAgICA+Ow0KDQoNCiAgQ0hLRFQgICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1wLXBpbmN0cmwueWFtbA0KICBT
Q0hFTUEgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wcm9jZXNzZWQtc2NoZW1h
LnlhbWwNCiAgRFRDICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3Ry
bC9mc2wsaW14OG1wLXBpbmN0cmwuZXhhbXBsZS5kdC55YW1sDQpGQVRBTCBFUlJPUjogVW5rbm93
biBvdXRwdXQgZm9ybWF0ICJ5YW1sIg0Kc2NyaXB0cy9NYWtlZmlsZS5saWI6MzEwOiByZWNpcGUg
Zm9yIHRhcmdldCAnRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvZnNs
LGlteDhtcC1waW5jdHJsLmV4YW1wbGUuZHQueWFtbCcgZmFpbGVkDQptYWtlWzFdOiAqKiogW0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2ZzbCxpbXg4bXAtcGluY3Ry
bC5leGFtcGxlLmR0LnlhbWxdIEVycm9yIDENCm1ha2VbMV06ICoqKiBEZWxldGluZyBmaWxlICdE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1wLXBpbmN0
cmwuZXhhbXBsZS5kdC55YW1sJw0KTWFrZWZpbGU6MTI2MzogcmVjaXBlIGZvciB0YXJnZXQgJ2R0
X2JpbmRpbmdfY2hlY2snIGZhaWxlZA0KbWFrZTogKioqIFtkdF9iaW5kaW5nX2NoZWNrXSBFcnJv
ciAyDQoNCg0KVGhhbmtzLA0KQW5zb24NCg==
