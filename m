Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2083D5171
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 04:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhGZCRX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Jul 2021 22:17:23 -0400
Received: from mail-eopbgr00072.outbound.protection.outlook.com ([40.107.0.72]:12059
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230272AbhGZCRW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 25 Jul 2021 22:17:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjbKEYN5klIY1Jj0LHHlqCfJUU3kOEj0KT/UhBL76BuyomrjanOQ4rH962L9PFMmx5AIo3cel0ASAjSpR3/oCBUxy4Cfd48L54TEa5BgFhKRXHfbam/J6DQ1rwNq6l4lLxkmc7qx3smzN1lItEnYboFXHsW2UUHvv2Hwbe0ZveG/i6qlksNwpLraEkR0AkfEapyNEzA6Sf7kwe+b+Xc5TWLy3cFW56N2ILeXD1AEQbeR+bQo33w7zAYL6PiDtDWWvzuuJg5fwL0/Dd42WgkISVuZ8gMJ2jYjmg6400aNCt2l7SYMtp/Hq+/l6SqTLm3Vn5+FTuZu8khf0YVZhxWCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Im/1nR6nmYrksaRubbinMnuw6Qsdqa7rDyHraeKUOvY=;
 b=hNUbccQkb3rJawiE8jMnMqdXUZaocCSg33Wj/Qz5X7XjrjurJXNLy2kMWTC+L4J2EfhXI+EAJswM5/1eGNRYnHHrB5/C0429F2HD/IoyXcvIK2Anu/qTIkyLZ1U7HrGbw4UEFOgPxS/aNIJI80cWmxG3elWTScLdd8AXUaRcm8UiODzYvD1C5VgXfvufKyspBRCNr3aZI/X93DnJT6iOGbUnb0DqdyVi/ATZCQzOoZsioSR6NTFqJ5vsku/+vOuTzX5TV7BMjGyjUjQsaeqkyqEAslKcKiej+/eGjctuGFwWxHSNNO7lgeW8SvQDX9zsnrPSQr8iYmPUyn5LAr3BRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Im/1nR6nmYrksaRubbinMnuw6Qsdqa7rDyHraeKUOvY=;
 b=hYowtiQbpUF6/U/7hv9BRCyml0OakrNqWYMbBfEHH83gZVSD7qGFpCjRTe1ZKDVSDzSVwEJURufPWw6YPwYqThWgEEioyLpYGzFC2FRR3vdMI2wfA8dSPhL1zEHIdZjWWzb4zl1Lw9xhTAHi3JhNaM6ate7csJXT6wLyMuRqifo=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8613.eurprd04.prod.outlook.com (2603:10a6:10:2d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 02:57:50 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%8]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 02:57:50 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     kernel test robot <lkp@intel.com>, Jacky Bai <ping.bai@nxp.com>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: RE: [pinctrl:devel 6/11]
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c:228:35: warning: 'pin_reg' is
 used uninitialized in this function
Thread-Topic: [pinctrl:devel 6/11]
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c:228:35: warning: 'pin_reg' is
 used uninitialized in this function
Thread-Index: AQHXf/4tO2wB3+fEeUGRNyOyMeG1k6tUk9ag
Date:   Mon, 26 Jul 2021 02:57:49 +0000
Message-ID: <DB9PR04MB8477E37F59E30931553F33E980E89@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <202107240440.z3DVdOv6-lkp@intel.com>
In-Reply-To: <202107240440.z3DVdOv6-lkp@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a80627f6-8ec9-4b4a-88ff-08d94fe1279e
x-ms-traffictypediagnostic: DU2PR04MB8613:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DU2PR04MB861399D4DC21666D63DEB33680E89@DU2PR04MB8613.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8sDk4v76I5suxYP3vBaJu6nBShyu5CLomMofWhM9LrIiUTpzt+MXCdLTvmz4XMS30AIrI5sBbTiG+IjxXpODTYg4coynbyXYMcEUon2IUo/Zhp/mRpVpl0COu2oCRgVKWP2lfoKoF5CNCtW2dlUyhloXIq6bMNGdfs6gw0UTdEDqjsWp+O5rwcF5uxMoAGnDY7D8iMPYjtuNQsbfSb6KOxa9Jf4EFIrExhITYKTeVb414wclsXJYaJN3m5QEU5cknaaCQmVuUwVxhIR0qncW+rZdleJETJptDura7HCsiQx95zMh/7dgyzmkFdiji4IR0/vH0GuvDmjY/ZtT/eVmHAXjZNyHfsaP8zCfw+zbrOb5o8mTGy1vUAZoZAhZHGpH0eOG/kLvkt8OLKG4bYmLqiCBTNBdK5rKIs6arIHEB1bi789/CUKodxEM8elaVN6fLSTUxlG5teDHrCCoS4nimakiNQYE5JoMiJ9ajZ1Iy4URNbPf5ZNewBnIbEIiyxStdN+CnC+nPtgmouKqCy5BX8kwV0VLPtqH7tL5XP6q55Oq6ZrEx5p2uBImjGKWuLRG6szv6d51a+/3VHYtT2bk7fcCyOzqYpWVN49NvaoWVPwHF45o944fdNyfY1gNWCAcqEJTN6o+qjdyN0yZhYgWOjTiB6Rw7kQg686r6ScELJit5hYSoRPCaldFAWE7Rg1OlIQw+L5iQbgop+p2TZLJlA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(8936002)(71200400001)(64756008)(86362001)(110136005)(26005)(33656002)(66946007)(44832011)(45080400002)(38100700002)(9686003)(2906002)(186003)(54906003)(7696005)(6636002)(316002)(478600001)(122000001)(4326008)(6506007)(83380400001)(8676002)(5660300002)(52536014)(966005)(66446008)(76116006)(66476007)(55016002)(66556008)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWJkWnlXK0ZhV1Nha2VSb0taOGlHbVdjek0zT2FqYkIxZmF4bjN0SUUzejBE?=
 =?utf-8?B?OGpLZmZqS1NOZkNXcG9rMURrZGJkM1ZSQmxjRzhydHZhazdRNXhSQlp0aEl0?=
 =?utf-8?B?dkRPMlB3V1VrTWhEY0lFbk10cU9HZlU2OUxDQzJTanVNb2hsSVYvQzVPb1Bj?=
 =?utf-8?B?bVpXVlFpNC90RmJ5RTcrRVR2dUNKRXB5N0JuMktrSCswZUkzSW1tUk1lUjZJ?=
 =?utf-8?B?NGhMMTZDdUtIUXVaSWM1TWRUSlZqYVFpa1lhUFpuZnZHcWV4U2l0S1hsUjEr?=
 =?utf-8?B?aExwc2cxRUZRandaNm92dG5GOHU0Uzg5d3FkeUtDWWFoMXlQV2tLZ1pvb0FY?=
 =?utf-8?B?OEFvemlVZXJ1VkZHZjRFMzVyR1dUK0NlWXFWN0kxeWtoU28yUmhkR1Y5Qmg4?=
 =?utf-8?B?dFdFQ0VIRWdrcWsvZnk2RDRVSDhPMmhxVXNVZ1FoZWtTL3JQK2NwTWMydEpw?=
 =?utf-8?B?S2JmTlIxNm84eG1ad3lybTNpaTI4UEdHNEZhVGpDdkg0YmFZTDNsRzR2V3ZT?=
 =?utf-8?B?ODlPUXpvT0FLam4xVmZYS2V3MzU0U1o0MWpuU0JKOUhvaVhGQ2hEa1dBOWVM?=
 =?utf-8?B?cEJ3TkwxTEJOWW1wemQ1WXRqdnhqeGVYTGRqYXZJbmVrR1pZQUp6Ykd4ZFJO?=
 =?utf-8?B?NHVJVGhINVJObmNMMkY4aUU0Z2JzMitzUjVmSlhHYmJtNnJrNksrQlR4bllQ?=
 =?utf-8?B?OHZIcDVaTGxTNHJCVFZ2TUY1K1pUTko1WFVxUHpIRDE0OW8yUXpFVkQ0OFFX?=
 =?utf-8?B?MmlWVXNCSGh1SmtWTEJwOWpSMWFhT1JqYWhqUkY4YTZvMU1lcExNZFQvMEN1?=
 =?utf-8?B?bHBCTHQzcXhrcGt5WmhPbW5WK1NrVW1VcXAzM3lpMEwzOUZkYStqamY3U0Nl?=
 =?utf-8?B?eTFOODhYd1hhOFR6VERnamdyVlQ3Z0I0MWY4RzNocmRzaklFd1VhZHlYU0xM?=
 =?utf-8?B?YVVVSVM2SE11VCs3T3JrUGpEQ2tXRjd5OHJ2MTVxVVJpVzlyNUt6MzRpa0pH?=
 =?utf-8?B?WE5xekVyb21TL01IeEVUdmZiTU9mQmhFNGdGUWpXNDNZV2JMdFNNZ2l4SGNC?=
 =?utf-8?B?SFd3Q2E1TmlkTTVrT3hXRjFjSWozaXo2UGtuNVRoUDZESjdyOG5Od1JPc0Nq?=
 =?utf-8?B?WmRkdXFzYm8wVU1nTkJkeitQcENpaC9tOXdodmlCcmZQZzdZMUFmaXRYL3lS?=
 =?utf-8?B?NVphbm9WZUd5eHQ3SHNWRyt3eDdIWGcvcFhEQk1oZ0MxQm5NYXpFaldpNndI?=
 =?utf-8?B?OWhiTjRqQkM4WWNTNFBQUGRkNUZSSjRIZWFmOTlESTZTSlF1Rnp3TUtkWkRQ?=
 =?utf-8?B?cyt3dWRDeGxrdEFOZWxtTDdtNGt6cERJTGc3TEl0a3ZlZi9MQlhJMk9tS0ZG?=
 =?utf-8?B?UGtXWTR2N25wcGlkRDFoYy9FdWh5TEdzc2RvcFBML3E4MjdicVVJdlNBekJR?=
 =?utf-8?B?VTB2Y0trV0dNSFFNcitYcXhYcnl3L29rQnRMc0JjaHk5T0x3bU5HTnZPTlJ4?=
 =?utf-8?B?NDhzbnJXcktDeDJDbWtKNmhmZU5GdXNQZCtqYVBJUzRqS1l6Y0x3cm52MFhu?=
 =?utf-8?B?Z1UrMzhvWko2K2ZCZktsTGJuM2pGNldUdFZtMU5ZVEtlYjlaOU9sR0dyOERN?=
 =?utf-8?B?NXNibnc1VmtDWCtYTWhlNzR1MkM1S1lCVGtQWTdyNXN4dnVwa2Uxb3AxM0Jn?=
 =?utf-8?B?a2dTWGlkOHNOa1kwM3NrOTdmV1FmQnluellBMGRPdkI4WEJZZ1FKWjFrTktT?=
 =?utf-8?Q?RdiuI3JQ+i8N7Kv2HHUyuyq0r+uzdCcUGW9i/gj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80627f6-8ec9-4b4a-88ff-08d94fe1279e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 02:57:49.9069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6fMYLohFFA90XCXyvIpPk+oaANSI8MuDmqYcqgIdMQf0lowSxIxPWvIOS6yfLKIHd0fWdorUBoXq8bRraOIygQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8613
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiANCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZyBhcyBh
cHByb3ByaWF0ZQ0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5j
b20+DQo+IA0KPiBBbGwgd2FybmluZ3MgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToNCj4gDQo+
ICAgIGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXg4dWxwLmM6IEluIGZ1bmN0
aW9uDQo+ICdpbXg4dWxwX3BteF9ncGlvX3NldF9kaXJlY3Rpb24nOg0KPiA+PiBkcml2ZXJzL3Bp
bmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14OHVscC5jOjIyODozNTogd2FybmluZzoNCj4gPj4g
J3Bpbl9yZWcnIGlzIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV3VuaW5p
dGlhbGl6ZWRdDQo+ICAgICAgMjI4IHwgIHJlZyA9IHJlYWRsKGlwY3RsLT5iYXNlICsgcGluX3Jl
Zy0+bXV4X3JlZyk7DQo+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+DQo+IA0KDQpKYWNreSwNCkNhbiB5b3UgZml4IGl0IEFTQVA/DQoNClJlZ2FyZHMNCkFp
c2hlbmcNCg0KPiANCj4gdmltICsvcGluX3JlZyArMjI4IGRyaXZlcnMvcGluY3RybC9mcmVlc2Nh
bGUvcGluY3RybC1pbXg4dWxwLmMNCj4gDQo+ICAgIDIxOQ0KPiAgICAyMjAJc3RhdGljIGludCBp
bXg4dWxwX3BteF9ncGlvX3NldF9kaXJlY3Rpb24oc3RydWN0IHBpbmN0cmxfZGV2DQo+ICpwY3Rs
ZGV2LA0KPiAgICAyMjEJCQkJCQkgIHN0cnVjdCBwaW5jdHJsX2dwaW9fcmFuZ2UgKnJhbmdlLA0K
PiAgICAyMjIJCQkJCQkgIHVuc2lnbmVkIG9mZnNldCwgYm9vbCBpbnB1dCkNCj4gICAgMjIzCXsN
Cj4gICAgMjI0CQlzdHJ1Y3QgaW14X3BpbmN0cmwgKmlwY3RsID0gcGluY3RybF9kZXZfZ2V0X2Ry
dmRhdGEocGN0bGRldik7DQo+ICAgIDIyNQkJY29uc3Qgc3RydWN0IGlteF9waW5fcmVnICpwaW5f
cmVnOw0KPiAgICAyMjYJCXUzMiByZWc7DQo+ICAgIDIyNw0KPiAgPiAyMjgJCXJlZyA9IHJlYWRs
KGlwY3RsLT5iYXNlICsgcGluX3JlZy0+bXV4X3JlZyk7DQo+ICAgIDIyOQkJaWYgKGlucHV0KQ0K
PiAgICAyMzAJCQlyZWcgPSAocmVnICYgfkJNX09CRV9FTkFCTEVEKSB8IEJNX0lCRV9FTkFCTEVE
Ow0KPiAgICAyMzEJCWVsc2UNCj4gICAgMjMyCQkJcmVnID0gKHJlZyAmIH5CTV9JQkVfRU5BQkxF
RCkgfCBCTV9PQkVfRU5BQkxFRDsNCj4gICAgMjMzCQl3cml0ZWwocmVnLCBpcGN0bC0+YmFzZSAr
IHBpbl9yZWctPm11eF9yZWcpOw0KPiAgICAyMzQNCj4gICAgMjM1CQlyZXR1cm4gMDsNCj4gICAg
MjM2CX0NCj4gICAgMjM3DQo+IA0KPiAtLS0NCj4gMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2Vydmlj
ZSwgSW50ZWwgQ29ycG9yYXRpb24NCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuMDEuDQo+IG9yZyUyRmh5cGVy
a2l0dHklMkZsaXN0JTJGa2J1aWxkLWFsbCU0MGxpc3RzLjAxLm9yZyZhbXA7ZGF0YT0wNCU3QzAx
JTcNCj4gQ2Fpc2hlbmcuZG9uZyU0MG54cC5jb20lN0M3N2Q4ZWNiMjY0NDU0MDY2NWRiMDA4ZDk0
ZTE0YTk3ZSU3QzYNCj4gODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdD
NjM3NjI2Njc1Njk2MzQyMjQ2JQ0KPiA3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1D
NHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCDQo+IFRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMTAwMCZhbXA7c2RhdGE9WW9ycHhleXVSaktlV3hBSlZFeDYNCj4geFU5Tm1mZkJ6UzFM
ZTNWa3lROGdQQUElM0QmYW1wO3Jlc2VydmVkPTANCg==
