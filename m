Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F1B2F2841
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jan 2021 07:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731732AbhALGPO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 01:15:14 -0500
Received: from mail-eopbgr00043.outbound.protection.outlook.com ([40.107.0.43]:57855
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726478AbhALGPK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Jan 2021 01:15:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cU7AzlCId0pbOdEzGsVb3F0Ix3+YYCtdDNsuMjcvvl9OraOsh8pWvWbAgOYZV+gyYymO0+OwCv2oD/DGJFafgAy5WKsSWuHA4u+7Mo5BSs9BQjcS2cIFrNxfh3KqRdxU4sZG6vXuCVWbuqYIYpZjrQIwuXeg8Pbicm92AyDTYMAEnbutjWKa5vb6c9rFAXy/9lHOFsrz89ZgqZyG0Ci3L6EoiS5xul+Nco1ezGIjLP/pb1+V2SqNVM9a3/I7cUeqyIsnYg7nNPXKKpElvQdj/dYv7MQS3lX+G4JsvYjMcMpFxh+eK4xUw73CvaZlmqurtEB+eL4FT3S3r2hHoGj5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goBAPrB0rBSWiFds7LvpXkqAvencYSMqvTXFKWi+wME=;
 b=hYMNqeOBEDvbTc4zrwFUUGVXHIO5Of3a2OF4MQzgDn3q4CSpYZ8WWGSZJv+A+u3UwuS7WnI4t2h1gwMXWYBSsmYZ58Yk9owoYViUV5ZRwg6m3l1qCkD6XQSfc2U2vvz2YdHPQDv+A/SyGiA1E1MtG1lPccHyStiW1pQ7tMrIPYajQ6R3II7i4x8G5eazq4KxBk6dEYmhPXyy/qlelzQPMJpDM5HDYF5o7huH36sUdhLsjCwG2qAIbNsRrnzXi+H3/wVx1m/K4ySIMcWzVGTGoQYz2z/cYWl12GY/dnT1WymEquwjdCTOHvqx3tDGG7YKQ3To6Jf4yqHrOF22w5OEXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goBAPrB0rBSWiFds7LvpXkqAvencYSMqvTXFKWi+wME=;
 b=s0Zwy7YmuWk+E+YWDI1270uuQcvV3rQDErMqIteG2kwVqlsKOhQpDeFDFe/K9SKkMCAF920Rjg+i7ja4onMX8hZR8YZjKqdKc1p8fi4AuS8/bZ+ZQLsuXizPRUtgVsgM+0MR1U02CNDybx0yHaAwfJc8czgsavYe/JFkvwH0MIY=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2315.eurprd03.prod.outlook.com (2603:10a6:3:23::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9; Tue, 12 Jan 2021 06:14:21 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 06:14:21 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 05/15] dt_bindings: mfd: Add ROHM BD71815 PMIC
Thread-Topic: [PATCH 05/15] dt_bindings: mfd: Add ROHM BD71815 PMIC
Thread-Index: AQHW5cMSW/wZL3Vm9UCNrh7KPrXJ5qoizlKAgAC6ewA=
Date:   Tue, 12 Jan 2021 06:14:21 +0000
Message-ID: <e1cfcc1222c9c78f3e5bff5059ad7ad3ee6f3c09.camel@fi.rohmeurope.com>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
         <4b3a868c07312d630de32e85d31dee7501627b73.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
         <20210111190653.GA2890911@robh.at.kernel.org>
In-Reply-To: <20210111190653.GA2890911@robh.at.kernel.org>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf3850e5-a774-4d20-0fce-08d8b6c14d2e
x-ms-traffictypediagnostic: HE1PR0301MB2315:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2315E5359D0737DBCC40092CADAA0@HE1PR0301MB2315.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yEleUNJbnBYLoyVUrITR+gGozulItbXL+Qm2t2a08h3514/UpcHX5vOAI02yjFKvwC8tHp28VP9VQ+8MNHXteZIkw9p5IniRiYmbPBr6ic83TMZCoMtXVVm4ZAL5g0WZahET4hFWoiAhhwb1er/SRphjdBf91cu+Ijt5Gx/Tboa0/PO4VGZBtHJUkj1Z8Yqe7Wa0IuZWS//txDVW+tkUm5lSCyHE6vLGxcnG8C0VJpyc6kDHbNBpy9H3WPYo9Db+DdFc+5B1bXHb4wMSWX+U4ZQy7XePOoal97aoNIjJGLH8lCEOFfrpdhVgHGxJRPKTnim3bWtofii9fMiYm3fUEQREefh+Frb+AiJbM395CwTvoLjUFX/prgHM4iWklpgKYH4MTz7yLJ9M7oX/wWT09ZXMgDsV4foDMQNEe87bTKSE9WFPkE2/suzjTyE1TdxCKIGWjsKXzy9jUnyIqBlEtA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(366004)(136003)(376002)(346002)(54906003)(316002)(2616005)(7416002)(2906002)(478600001)(3450700001)(86362001)(4326008)(966005)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(6486002)(6506007)(71200400001)(186003)(26005)(8936002)(6512007)(8676002)(6916009)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ak9vaHROR2R5RkV5QjN2OG9pMEptRkQwSnhrUk5xWDV4U2FSYWRsbUh2YWRG?=
 =?utf-8?B?Um1NbnN3dTZVQXVTMkRSVm9iajRXS0tSUU1oYjRTdmpxWnkra0NUa05CcktS?=
 =?utf-8?B?MU9rNDlvejV3ZzlFbWxXalNCRis1MGhCb2hRdkMxQTRrVmJzNk5YU1lkM1pm?=
 =?utf-8?B?MDczTklrcUhEUldpSGhncG9NVmlWbzJ6YWdIeTgramppb0sxSHZoWUFsVGxC?=
 =?utf-8?B?ZUtVeURER0Y5VWE4OGx1U04rT0d6alRmMUxaZ0lCdzRaRldtb2Q2ekpJRitB?=
 =?utf-8?B?Z0dwUmxQZzRsa1ZnTmhvc0NiSG5YU0d4cXJaRzl5Y25QY2JzSDBxYlI1c1I0?=
 =?utf-8?B?UUd1ZEo2cU9iMzZEME9IVVBKRm5rT2l3QjBYSVVDK0pXUm5IUUErc0luRnhk?=
 =?utf-8?B?bVRiUHFWcEZtQ3I5Uk9BaTd5eVJXRjVEcElSL2lpeGM3R3FXNGxPQUpBR05o?=
 =?utf-8?B?VkVrb0VVOWZjUlRCVlNWU0NEMWVBVUw2UlVUeTNGL0ZtNFQ4MmhVeTFmb1NP?=
 =?utf-8?B?T2dOSEJUQldtQzI3MEFxbVAvVEtmVnBZRFdobnprNkt2WmxFR0F3NmJCK0cv?=
 =?utf-8?B?QVROMkxNRjc2ZzM4R3FQTHdtOWJaWHNsZ3FLQ251UCtDa2d5OU5UZFB6d3d0?=
 =?utf-8?B?MU9zQXhNODNYc0pUL0JzcHp3Y3JCaDJqZWVLQ29XZHk2T1RRK1NWOTVpS01i?=
 =?utf-8?B?UEd0Uy9obStLNXpQbVRsSTJOeGFhb1dCUHZsdEEvOWw3bGJSZ0kzL0taa1Z3?=
 =?utf-8?B?Y2xLV3hzTGlIZ2ZzMEN4OERSZmttRElETkszQTJHTEo2OFphaTRrVWNESlkw?=
 =?utf-8?B?dnY4WU14NTFRcVZ6TDZzZ2cvZmx2d2diOExha1RPRlhiL1dwZ3Npa0dSWWpK?=
 =?utf-8?B?VWhUczdTZnE1TWdDalR0RFczSU9OeUZUVk1HbEdCbEZQdVlQNnc2aHJ4NjRS?=
 =?utf-8?B?a3R1UDdsRnk1N055RDhZOEZhcTN1QnVvaTlPZHBIODNWUGZBTit5NXBMeGwv?=
 =?utf-8?B?SVg4cllzVDFYUTB5c28vUG05N3B5UmM0c1ZmR3doQno1clhKdGlsQkZVRHF4?=
 =?utf-8?B?L1lnWmR4K0VVNmtSVVlwZW9zeE8zYjNDOXRqOXpWaFBGY1BHZWlmeWJYU3dT?=
 =?utf-8?B?T0ZDcStmRXovQkg5c3U1S1k1WFZta1dMK0lYbFZ5RVBRZG9qUlZiV1lsOGY3?=
 =?utf-8?B?azVudE83UWVwS1l2YUhlVXFmOFI3cnh4WU5EMStBTlBuM1UrMmR4UFhkbUNn?=
 =?utf-8?B?dGNZdVdkV1NveXNkbC9GZ0pwc0lSUkZtVkZCaDdwNTlQbEkwMmxMOWRPTUNK?=
 =?utf-8?Q?XcchF5YR8ITzJWMlzulPP8p1p1eCPswB0s?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59E20D8DD3F7FF4FBC0D7979E00091D3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3850e5-a774-4d20-0fce-08d8b6c14d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 06:14:21.2013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W0VO1I9fN36kqFd83F1qtTj+czxIncLdUX3tYPhFGQsqbEXiXNPa5OBwZUbJ6KOEP5IY4Aorc9WyRt61A8+EEJl47nQ9MtaQJHE+TL2qtsjAsd1sU82gpS1Yz/1/eGa7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2315
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBNb24sIDIwMjEtMDEtMTEgYXQgMTM6MDYgLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0K
PiBPbiBGcmksIEphbiAwOCwgMjAyMSBhdCAwMzozNDo1MlBNICswMjAwLCBNYXR0aSBWYWl0dGlu
ZW4gd3JvdGU6DQo+ID4gRG9jdW1lbnQgRFQgYmluZGluZ3MgZm9yIFJPSE0gQkQ3MTgxNS4NCj4g
PiANCj4gPiBCRDcxODE1IGlzIGEgc2luZ2xlLWNoaXAgcG93ZXIgbWFuYWdlbWVudCBJQyBtYWlu
bHkgZm9yIGJhdHRlcnktDQo+ID4gcG93ZXJlZA0KPiA+IHBvcnRhYmxlIGRldmljZXMuIFRoZSBJ
QyBpbnRlZ3JhdGVzIDUgYnVja3MsIDcgTERPcywgYSBib29zdCBkcml2ZXINCj4gPiBmb3INCj4g
PiBMRUQsIGEgYmF0dGVyeSBjaGFyZ2VyIHdpdGggYSBDb3Vsb21iIGNvdW50ZXIsIGEgcmVhbC10
aW1lIGNsb2NrLCBhDQo+ID4gMzJrSHoNCj4gPiBjbG9jayBhbmQgdHdvIGdlbmVyYWwtcHVycG9z
ZSBvdXRwdXRzIGFsdGhvdWdoIG9ubHkgb25lIGlzDQo+ID4gZG9jdW1lbnRlZCBieQ0KPiA+IHRo
ZSBkYXRhLXNoZWV0Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8
bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmlu
ZGluZ3MvbWZkL3JvaG0sYmQ3MTgxNS1wbWljLnlhbWwgICAgICAgfCAxOTgNCj4gPiArKysrKysr
KysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5OCBpbnNlcnRpb25zKCspDQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZmQvcm9obSxiZDcxODE1LXBtaWMueWFtbA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JvaG0sYmQ3MTgxNS0NCj4gPiBwbWlj
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JvaG0sYmQ3MTgx
NS0NCj4gPiBwbWljLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uMjIwNmIyMDA4YWNkDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcm9obSxiZDcxODE1LXBtaWMueWFt
bA0KPiA+IEBAIC0wLDAgKzEsMTk4IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UNCj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0K
PiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21mZC9yb2htLGJkNzE4MTUt
cG1pYy55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBST0hNIEJENzE4MTUgUG93ZXIgTWFu
YWdlbWVudCBJbnRlZ3JhdGVkIENpcmN1aXQgYmluZGluZ3MNCj4gPiArDQo+ID4gK21haW50YWlu
ZXJzOg0KPiA+ICsgIC0gTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1
cm9wZS5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIEJENzE4MTVBR1cg
aXMgYSBzaW5nbGUtY2hpcCBwb3dlciBtYW5hZ2VtZW50IElDcyBmb3IgYmF0dGVyeS0NCj4gPiBw
b3dlcmVkDQo+ID4gKyAgcG9ydGFibGUgZGV2aWNlcy4gSXQgaW50ZWdyYXRlcyA1IGJ1Y2sgY29u
dmVydGVycywgOCBMRE9zLCBhDQo+ID4gYm9vc3QgZHJpdmVyDQo+ID4gKyAgZm9yIExFRCBhbmQg
YSA1MDAgbUEgc2luZ2xlLWNlbGwgbGluZWFyIGNoYXJnZXIuIEFsc28gaW5jbHVkZWQNCj4gPiBp
cyBhIENvdWxvbWINCj4gPiArICBjb3VudGVyLCBhIHJlYWwtdGltZSBjbG9jayAoUlRDKSwgYW5k
IGEgMzIuNzY4IGtIeiBjbG9jayBnYXRlDQo+ID4gYW5kIHR3byBHUE9zLg0KPiA+ICsNCj4gPiAr
cHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgY29uc3Q6IHJvaG0sYmQ3
MTgxNQ0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAg
ICAgSTJDIHNsYXZlIGFkZHJlc3MuDQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiAr
ICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgZ3Bpby1j
b250cm9sbGVyOiB0cnVlDQo+IA0KPiBBZGQgYSBibGFuayBsaW5lIGhlcmUuDQo+IA0KPiA+ICsg
ICIjZ3Bpby1jZWxscyI6DQo+ID4gKyAgICBjb25zdDogMg0KPiA+ICsgICAgZGVzY3JpcHRpb246
IHwNCj4gPiArICAgICAgVGhlIGZpcnN0IGNlbGwgaXMgdGhlIHBpbiBudW1iZXIgYW5kIHRoZSBz
ZWNvbmQgY2VsbCBpcyB1c2VkDQo+ID4gdG8gc3BlY2lmeQ0KPiA+ICsgICAgICBmbGFncy4gU2Vl
IC4uL2dwaW8vZ3Bpby50eHQgZm9yIG1vcmUgaW5mb3JtYXRpb24uDQo+ID4gKw0KPiA+ICsgIGNs
b2NrczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+IA0KPiBBbmQgaGVyZS4NCj4gDQo+ID4gKyAg
IiNjbG9jay1jZWxscyI6DQo+ID4gKyAgICBjb25zdDogMA0KPiANCj4gQW5kIGhlcmUuDQo+IA0K
PiA+ICsgIGNsb2NrLW91dHB1dC1uYW1lczoNCj4gPiArICAgIGNvbnN0OiBiZDcxODE1LTMyay1v
dXQNCj4gPiArDQo+ID4gKyAgcm9obSxjbGtvdXQtbW9kZToNCj4gPiArICAgIGRlc2NyaXB0aW9u
OiBjbGszMmtvdXQgbW9kZS4gQ2FuIGJlIHNldCB0byAib3Blbi1kcmFpbiIgb3INCj4gPiAiY21v
cyIuDQo+ID4gKyAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvc3Ry
aW5nIg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBvcGVuLWRyYWluDQo+ID4gKyAgICAg
IC0gY21vcw0KPiA+ICsNCj4gPiArICByb2htLGNoYXJnZXItc2Vuc2UtcmVzaXN0b3Itb2htczoN
Cj4gPiArICAgIG1pbmltdW06IDEwMDAwMDAwDQo+ID4gKyAgICBtYXhpbXVtOiA1MDAwMDAwMA0K
PiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgQkQ3MTgyNyBhbmQgQkQ3MTgyOCBo
YXZlIFNBUiBBREMgZm9yIG1lYXN1cmluZyBjaGFyZ2luZw0KPiA+IGN1cnJlbnRzLg0KPiA+ICsg
ICAgICBFeHRlcm5hbCBzZW5zZSByZXNpc3RvciAoUlNFTlNFIGluIGRhdGEgc2hlZXQpIHNob3Vs
ZCBiZQ0KPiA+IHVzZWQuIElmIHNvbWUNCj4gPiArICAgICAgb3RoZXIgYnV0IDMwTU9obSByZXNp
c3RvciBpcyB1c2VkIHRoZSByZXNpc3RhbmNlIHZhbHVlDQo+ID4gc2hvdWxkIGJlIGdpdmVuDQo+
IA0KPiAnc29tZXRoaW5nIG90aGVyJw0KPiANCj4gVGhvdWdoIHRoaXMgY2FuIGJlIGV4cHJlc3Nl
ZCBhcyAnZGVmYXVsdDogMzAwMDAwMDAnDQoNCkkgZ3Vlc3MgSSdsbCB1c2UgYm90aCAnc29tZXRo
aW5nIG90aGVyJyBhbmQgJ2RlZmF1bHQ6IDMwMDAwMDAwJyBpbiBuZXh0DQp2ZXJzaW9uLiAnZGVm
YXVsdDogMzAwMDAwMDAnIGlzIG5pY2UgZm9yIG1hY2hpbmUgcGFyc2VyIC0gYnV0IGZvciBodW1h
bg0KcmVhZGVyIHRoZSAnc29tZXRoaW5nIG90aGVyJyBpcyBsaWtlbHkgdG8gYmUgc3VwZXJpb3Iu
IChObyBzY2llbnRpZmljDQp0ZXN0IGNvbmR1Y3RlZCB0byBiYWNrIG9mZiB0aGlzIHN0YXRlbWVu
dCB0aG91Z2gpLg0KDQpUaGFua3MgUm9iIQ0KDQpCZXN0IFJlZ2FyZHMNCglNYXR0aSBWYWl0dGlu
ZW4NCg==
