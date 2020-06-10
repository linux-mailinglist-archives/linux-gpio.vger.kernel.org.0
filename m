Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE16D1F5018
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 10:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgFJIMz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 04:12:55 -0400
Received: from mail-eopbgr60087.outbound.protection.outlook.com ([40.107.6.87]:48296
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726506AbgFJIMy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 04:12:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPfHUxEB5ULrYVlhmNR5Q+FtV880MsX5cGGQTqzjjOV6g6+onOqDgvNhSmIwxHdJeiulWM67IwWqfoBBczDP+WdtDkz3deu2Kn/MV5sGptwt6KRQAp0jT8oXSlku4Ytuqvb1sGBvLihedTIzeN7ZP3i/AmKHpworcug0kFoFtMYnYxhWJ4IhAJ2LK8/iCCmfQE2k3Ak2/AUrwncHwg2kQOiQ4xj0WdSSdB2QX+0WmUl28V+FfnOHJfmMRu6n2XW3eHg/9fjjA29kP5eC3AKaMBHBqMTkkL+y51b0KSnNT6zSKkxtsHz6Xezwp//4P89FZobvb8+S6ECTUk3czLch5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JDwI2mnztvedZd/2SMmY6+rtg50guhSKI23XdFWVgk=;
 b=e0/sryr5w1GqBXJ3pvF808jFHHLdFKhb7sa11xwUvgbTNPGcQQJaf/Acl4CNP0OF8WcU01RNWxqPBoxfOPsGqIueA3o0Cs6cBdnQ/aVRdVKzoUk+RtPsM8JcnaldCZE6uaiv1W4SD+JEV59S0oUJtdpS5wHVyMom/oUVHExIBTPizfORLs1SmCDszdvgQIaVYbnpwsm2X2S1B7/2ME9qoG5ILPM9p3xlgY+W78sV/qqlql+FF7h1/QEgHF5xARewglrumeC7iv5NeL/3jgXbhUQmDzTQ71G15VvM9C/nnvK8vcAM3mk72y7EdhGFCa6VZR573IWY4RKYcLhx8M+HlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JDwI2mnztvedZd/2SMmY6+rtg50guhSKI23XdFWVgk=;
 b=cY+COcVmP/FonASMHFzKLN5kuTNzaxX7/Qg2jLFuXHh2vO7jkYG1/pbE/RtrloILETZqNdYZyj2F8Y8uJINi9rFr0I4Ca/hegCWvElG50EYLsTftfEs/g4uEd6YvnMQajp1Zp8zzenK0MkfnXToMOR90yE0ESWiBwNcd0RhZNEw=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB3PR0402MB3787.eurprd04.prod.outlook.com (2603:10a6:8:12::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Wed, 10 Jun
 2020 08:12:51 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3088.018; Wed, 10 Jun 2020
 08:12:51 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 0/9] Support i.MX8 SoCs pinctrl drivers built as module
Thread-Topic: [PATCH V3 0/9] Support i.MX8 SoCs pinctrl drivers built as
 module
Thread-Index: AQHWPmrEZsqXlE5PG069+wE7LuhWwqjRftOAgAABKNA=
Date:   Wed, 10 Jun 2020 08:12:51 +0000
Message-ID: <DB3PR0402MB39167A62D9D981C2F82B7ABDF5830@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
 <DB7PR04MB49721DEE875099E086E2486E80830@DB7PR04MB4972.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB49721DEE875099E086E2486E80830@DB7PR04MB4972.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.13.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 73b96d15-ed44-4c74-3a4e-08d80d161205
x-ms-traffictypediagnostic: DB3PR0402MB3787:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3787EB3A388D7EB0A712EDC0F5830@DB3PR0402MB3787.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0430FA5CB7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O3txY9FON3foiMHwDmtKkGkj5JpC7Y20ralU5r4RXiP2IWfSwzWCi+WJ7twNR9ggUQsNLpNdEP8lDWEFm1gIkt4UyIV7G3J6qg0fB+BNmQ7ubeVqWCJ8D85jjCK41DU56i93kLK8iC13DzzMCENv7t5XTpunNODGJ7FhzegwBWPo0W8CMRmyoxisQXXiyRTXnNDzLGXwwapFa3hCntxCFu9/53fUdPt89bQ8JPxiRwTyAEb2XzByoTdxCBMWTMM0cswwVoNa2s4/kSmI2kBnjWntSU7hupBE/5rk4wO8obG4BKhsfuYot9pfv/Lf0iSnFe+XURyNciLeN0u9P2CZIJsHabkSw9SQs62TARCB8l7ObZ/IHDnfuWNCJBQob/lS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(6029001)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(55016002)(186003)(33656002)(8936002)(86362001)(478600001)(66446008)(6506007)(44832011)(26005)(9686003)(66946007)(110136005)(83380400001)(7696005)(316002)(64756008)(2906002)(66476007)(66556008)(5660300002)(8676002)(76116006)(4326008)(71200400001)(4744005)(52536014)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Djoc0rad0iJpRdXR8GmvecziynuRxRQ4fz11QQrf9izj9iJu77Ww+m/1B/GxA94sf28q3rTUTsc4sCPVzzx+pU044mXEDjwTO9M6WWRAU7Q0poEyKpmtEJD7OqmOBR91K5RBuUreTTYPORNJA9b2PlKap97cQcA6Buw3kWwidZ0WBTz79vpK9TXy3zzwXYbE6gge6clDMPrT6o1n4GdvldXaKY4IJbXANhMhESk2NESsg+JLmMw39QQItsvIooK7JpIhpXDQwlc7oG+mybF7vH2IekxqDZJW6lq0cT/AMqOGcdWW5HCvCsj6yDKTP3Di1Z2gRXOefLTuRaa5uov+I5gISJtB8HLWCDtqqFJxasuxh0Bhg6iqvSiDvmE2YXXXXRXnyaQWh/oeqgko+b57TduPde9duQHTbyvVp7CAVQAul0hN9y9QbIzw4rgF8qwVmpvSxKur1i0qjb9OvYq/XFzJs6nQqVUItWRghq2YHr4l+LMiPwT1Frj66IzgaItM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b96d15-ed44-4c74-3a4e-08d80d161205
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2020 08:12:51.5029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NLAvDM+U+JbQPmvIs0q7RHbDpDEI/f1tQuUQv35t5F5Me4Ls94+V/vUUSeCUZYt2xG5SOMBJro0ufPK5S1uRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3787
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIFYzIDAvOV0gU3VwcG9ydCBpLk1YOCBTb0NzIHBp
bmN0cmwgZHJpdmVycyBidWlsdCBhcyBtb2R1bGUNCj4gDQo+ID4gRnJvbTogQW5zb24gSHVhbmcg
PEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gU2VudDogVHVlc2RheSwgSnVuZSA5LCAyMDIwIDEw
OjIxIFBNDQo+ID4NCj4gPiBUaGVyZSBhcmUgbW9yZSBhbmQgbXJvZSByZXF1aXJlbWVudHMgdGhh
dCBTb0Mgc3BlY2lmaWMgbW9kdWxlcyBzaG91bGQNCj4gPiBiZSBidWlsdCBhcyBtb2R1bGUgaW4g
b3JkZXIgdG8gc3VwcG9ydCBnZW5lcmljIGtlcm5lbCBpbWFnZSwgc3VjaCBhcw0KPiA+IEFuZHJv
aWQgR0tJIGNvbmNlcHQuDQo+ID4NCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBzdXBwb3J0cyBpLk1Y
OCBTb0NzIHBpbmN0cmwgZHJpdmVycyB0byBiZSBidWlsdCBhcw0KPiA+IG1vZHVsZSwgaW5jbHVk
aW5nIGkuTVg4TVEvTU0vTU4vTVAvUVhQL1FNL0RYTCBTb0NzLCBhbmQgaXQgYWxzbw0KPiA+IHN1
cHBvcnRzIGJ1aWxkaW5nIGkuTVggY29tbW9uIHBpbmN0cmwgZHJpdmVyIGFuZCBpLk1YIFNDVSBj
b21tb24NCj4gPiBwaW5jdHJsIGRyaXZlciBhcyBtb2R1bGUuDQo+ID4NCj4gDQo+IFRoaXMgcGF0
Y2ggc2VyaWVzIGFsc28gY2hhbmdlZCB0aGUgZHJpdmVyIGluaXRjYWxsIGxldmVsIGZyb20gYXJj
aF9pbml0Y2FsbCB0bw0KPiBtb2R1bGVfaW5pdC4NCj4gTWF5YmUgeW91IGNvdWxkIHByb3ZpZGUg
c29tZSB0ZXN0IGluZm9ybWF0aW9uIHRvIGhlbHAgdGhlIHJldmlld2VyIHRvIGJldHRlcg0KPiB1
bmRlcnN0YW5kIHRoZSBjaGFuZ2UgaW1wYWN0Lg0KDQpUaGVyZSBhcmUgc3RpbGwgc29tZSBtb3Jl
IGNoYW5nZXMgaW4gVjQgSSBqdXN0IHNlbnQgb3V0LCB3aGljaCBpcyB0byBjb3ZlciB2YXJpb3Vz
IGNvbmZpZyBjb21iaW5hdGlvbiwNCndpbGwgYWRkIHRlc3QgaW5mbyBpbiBuZXh0IHZlcnNpb24u
IA0KDQpBbnNvbg0K
