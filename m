Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 711D813D18C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 02:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgAPBdF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 20:33:05 -0500
Received: from mail-eopbgr80041.outbound.protection.outlook.com ([40.107.8.41]:6222
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729195AbgAPBdF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Jan 2020 20:33:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6zQ33Rg6Rv3ayYWidfNJU45xlkVy4icJa0Msc+sFyQoWmCttuVDsTLfSnrAnlKWrfAWIByTaujeoL1zGxCY0ZOY7TOsUqt0m9Dv0SIOUE8QryuUNa71d0Wk2UJ5/8h3TGJvOkSUSjhM4Y6ujHU+dF0QGCPMkb/1e/4TKbOKZiYwOjdcGRoQFmh//erbl052I+ZfeKeo4d2nn2Ce/Y7yYn4k/5TE1Qus2/1zA7UnKABCOYoYHs4jflFYCGzsQZ7qEbmTUknuL2byu7PZYgD+QtGtZNgRVbyqIyd8ndG/XsF6vQM1rQeZGs6SG99O+1osdgYQVE1H9egFU94q9NZOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMSBFlOH0fsUfj7zAMm0D7mMUFuSTeHL2UwKWlhtTfA=;
 b=nmd97X9zXEzfgtHfObuqYjeiGnhFAgkKXyF0x7jmHqBedCnq8Lbo98lB7IS296Gye7d8Mx5mNn29lETtJUqi6Rrl2TwjKmT803SXK2b8QFKR7wieEcKWVoXALqBSPBZF0bPbJnMULbOU2xwdhwlaNQLMQcAJ1NsAP0PuS1ikNQEg8miyq1qz6ZiG3aqKbPl90UWPjldPDRFNTIHb9ZquvV9nyPSU/amVY1YSmkMycMLsvyqojeHQgiCBjidWh3wc+MJ+//4yFVaY/SmFVUQPjcSZ6FkuhrY9U83xjK/O6hTwd/L3RjfhSICWwVLIM4vodvzI0YtSL2H0KznrR7O6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMSBFlOH0fsUfj7zAMm0D7mMUFuSTeHL2UwKWlhtTfA=;
 b=hQg5p9/2lneadGpfXluhO3oZJ7OnQ5RM8/cmW28buxH7ncrEi8mxXou5ikcIfckIGhVgWlzHS6WZTg5eudBO3wOInNQ+5ORBt1Yp8SYJo3LLRsWyu/NAYLQUXmJYyIRCcj010Fkq28KxFV0mbDDwQv3NwgBHUwnuv1LpbdgSMH8=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3868.eurprd04.prod.outlook.com (52.134.71.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Thu, 16 Jan 2020 01:33:00 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96%5]) with mapi id 15.20.2644.015; Thu, 16 Jan 2020
 01:33:00 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "maxime@cerno.tech" <maxime@cerno.tech>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V9 2/3] pinctrl: freescale: Add i.MX8MP pinctrl driver
 support
Thread-Topic: [PATCH V9 2/3] pinctrl: freescale: Add i.MX8MP pinctrl driver
 support
Thread-Index: AQHVy0Ux+F+v2aX9K0CMnw3y4zKppKfrt2AAgADLt/A=
Date:   Thu, 16 Jan 2020 01:33:00 +0000
Message-ID: <DB3PR0402MB3916602246D133980D508DBCF5360@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com>
 <1579052348-32167-2-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYakDK0Zp_StJ+J5UV7PRjHEnWPmZGpGpeXMZyPtUmv1g@mail.gmail.com>
In-Reply-To: <CACRpkdYakDK0Zp_StJ+J5UV7PRjHEnWPmZGpGpeXMZyPtUmv1g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6d940190-46c6-49a3-825b-08d79a2405df
x-ms-traffictypediagnostic: DB3PR0402MB3868:|DB3PR0402MB3868:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB38682FE6AAE02E0C4A67B058F5360@DB3PR0402MB3868.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(199004)(189003)(33656002)(7416002)(186003)(4326008)(478600001)(76116006)(81166006)(66946007)(66446008)(8676002)(6506007)(81156014)(4744005)(26005)(53546011)(66476007)(64756008)(71200400001)(66556008)(6916009)(86362001)(55016002)(2906002)(7696005)(5660300002)(316002)(44832011)(54906003)(8936002)(52536014)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3868;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vP0tgw8ADr48z3YvpbTzrxzXehYie7E/yshKabtkvDFeH6E1d92FTzsUv5egA5IN4AVgovlBxrb+UGUzwTsbOIx7XJ+jyg7l+Pg6v1EvMdn2gF5ETwxI4uTR3tBenqMIjiLAFWUEf3dJk5yAMoXt5fxtXImAwKJ8pzbuicQtW+bYcqEybek4XMyvijT7Ib38AcddFUFuDVXblb+SNPDo/MV/ckTLtIGxqN3lRLMV/ABWHTh2/VQtL53WvcDTHYTLg9SWXA1GEM4RR8v1KhLPXqQB+DW2tGotaal8rSZ8S6HZWiPB6R4GRnN4IGzqU8XFQEuZa1IlleXWSF7j559uNfvqh2xoCz0lRg8qZOVdgeWChlRWD7DubLtGQ9S9gqhRXb8b5IoMLzHnjNiWFfI+njqJYWm58zlRc1IrbLwuiWjLIO3Dgq1pJzQBFvDbUWSc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d940190-46c6-49a3-825b-08d79a2405df
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 01:33:00.2969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hr4ru+UJHELNhHgVLbKL0IEHgWTjksRcjWFAud6MulvOOybGYdy9Hnqn+9PjSroVl9V4lwGfHjybLtKSspD2QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3868
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIExpbnVzDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWOSAyLzNdIHBpbmN0cmw6IGZyZWVz
Y2FsZTogQWRkIGkuTVg4TVAgcGluY3RybCBkcml2ZXINCj4gc3VwcG9ydA0KPiANCj4gSGkgQW5z
b24sDQo+IA0KPiBPbiBXZWQsIEphbiAxNSwgMjAyMCBhdCAyOjQzIEFNIEFuc29uIEh1YW5nIDxB
bnNvbi5IdWFuZ0BueHAuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IEFkZCB0aGUgcGluY3RybCBk
cml2ZXIgc3VwcG9ydCBmb3IgaS5NWDhNUC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuc29u
IEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBBYmVsIFZlc2Eg
PGFiZWwudmVzYUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IE5vIGNoYW5nZS4NCj4gDQo+IENhbiB0
aGlzIHBhdGNoIGJlIGFwcGxpZWQgaW5kZXBlbmRlbnRseSBvZiB0aGUgcmVzdCBvZiB0aGUgcGF0
Y2hlcz8NCg0KSSB0aGluayBzby4NCg0KVGhhbmtzLA0KQW5zb24NCg0K
