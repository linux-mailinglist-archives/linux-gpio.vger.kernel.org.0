Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0D131523B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 15:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhBIO7V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 09:59:21 -0500
Received: from mail-mw2nam12on2068.outbound.protection.outlook.com ([40.107.244.68]:32481
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231862AbhBIO7T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Feb 2021 09:59:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+iXHKJlPyd8XHNmivTClNOewsGCiD/LhuGOBz4myKrwONIXDJmCXN7lAV5Y6RnIm7aReonoxY3axsKDptd/gAMX4p91/FsVJdaYtume+nVo4CebuSiMSszezE+gQNSpUOTYJWc6gsTR7DNymHN+mecJWqXpKSh9bNN+qY9U+Id4GApAaXHfJC0i2gD9LzWt4iIU+ruYloDR6mKE41ju8ZgQMfT9BIiReW8cOriUjkROUSBnqpdWok5DJjlVKTSs7zhgOR94BgWDcyrIHIzxTjPr9hVewqHxyf4umXkyFrM1fFMyKLg9z2VMMSQSArM86KZJVHfeW1lQ2vIxhIZNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJyjIvBcH/Rj0be9tx16cxa1/j87oYcVqhvT1slBGcc=;
 b=I473J2C/EnvFnc7YDRnC+E2/u0TGR7S7DWDIj/mn2+eo0Q5VKOa+rm+xd0v3fsYFIBnHJRpqX6IhJlx31MkvTPQOhg56SULaUrIMYaQ5tfr+U5i/2whplFZf0Imxt/PZaTcrDywUhuQP7dq/EIpWf6UJgmRtsiIIUe37E8SKUw1937bLCfLWU0AA8UC4bDA7t7maHIC5gIGKKWsl1T1/Zf8jaGApBCkf8D3N0caB/WQfqFIoqeLI4X7E6S3Iyg+JIRzHu+yvdENMtNKYrbEXL2ntF5gmDBIg39c+2UWC+EbGBVtgd6OmOx2Sa4QcNKSqz30lpLBAF2Zqa126MPZcAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJyjIvBcH/Rj0be9tx16cxa1/j87oYcVqhvT1slBGcc=;
 b=k42BEUj7LOOQHoND0nyURKrVyg0lkUIIPtEz2FWED8REziKTRiI7pCKZBq8q+T23RwI7s92jfSixSWY0NuISuiyyUSXtzA8fzQKtMa1IaJIgJCQRjX9lppehigk7S5/axNemTXhRADMRZNK9wBaORWstsd9kO89jnUVcBYStHyI=
Received: from CY4PR02MB3270.namprd02.prod.outlook.com (2603:10b6:910:78::26)
 by CY4PR02MB2759.namprd02.prod.outlook.com (2603:10b6:903:11a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.27; Tue, 9 Feb
 2021 14:58:24 +0000
Received: from CY4PR02MB3270.namprd02.prod.outlook.com
 ([fe80::294d:8067:c344:b14e]) by CY4PR02MB3270.namprd02.prod.outlook.com
 ([fe80::294d:8067:c344:b14e%7]) with mapi id 15.20.3825.028; Tue, 9 Feb 2021
 14:58:23 +0000
From:   Sai Krishna Potthuri <lakshmis@xilinx.com>
To:     Rob Herring <robh@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: RE: [PATCH v2 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
 pinctrl driver
Thread-Topic: [PATCH v2 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
 pinctrl driver
Thread-Index: AQHW7iPkn7pUhAIWCkGHT8eHIN0GcqpPOAuAgABPGqCAAHNsgIAAEFog
Date:   Tue, 9 Feb 2021 14:58:23 +0000
Message-ID: <CY4PR02MB3270ABBA4895F474338B341DBD8E9@CY4PR02MB3270.namprd02.prod.outlook.com>
References: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1611034054-63867-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <20210209022041.GA2527041@robh.at.kernel.org>
 <CY4PR02MB327015F3EF5FD8C265EE20E2BD8E9@CY4PR02MB3270.namprd02.prod.outlook.com>
 <CAL_JsqJ31VkmK526BDZy+dg_O1L1A=2EH9Lq7CqhSUE0FPi2OA@mail.gmail.com>
In-Reply-To: <CAL_JsqJ31VkmK526BDZy+dg_O1L1A=2EH9Lq7CqhSUE0FPi2OA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [183.83.142.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bfd58219-5f8a-4514-021c-08d8cd0b260b
x-ms-traffictypediagnostic: CY4PR02MB2759:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR02MB27592E4402A91F0B5613D5EEBD8E9@CY4PR02MB2759.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HrUp3m5IKMFjP0JcmSfgNfvAvtb37h2LLiSU9mInwkknH9SqgydrSH17BGVDXY9X9j6qqTD0xgdjVw38qXFsFO1BVL6YSkQa+cPbfDrf4kiGAjAl2ubAZ0IHpeKKcXupuityLF3GCJn7vO6V9qbtNerGCPSWOjbo9yvcJwxIn6sv/D0GRyJWSXqiHQEldNszSlt7h754DObxdzD9eYnFHN6SyLT9sUabLJ4T6oQGwOPzCweVeLzmlsYfM6mR3TTc0JzZdzPTfmDlqvKilqxgy8xv0FzsVommm2O8xT8hneJnAiOEWiPbG5jpU/utG1zeWKC3LjPWCvV1IcoWWevyl+EonOnGPzn576hIJOt1gsO0jKKdmbbix6tCL2ra1G1YZCrV3fozRKj1DUrNeIfWqIHaliTLMS+IijtyDzeoSNcWbTUDWuMDikX9UiZ9Fo7ejKPPVKam00Fq9Im8awHRElHNGwhyC3kDYL5oc82EDgvROZkdGBc+Hl7pXI18zqw27TdkhHqaDwcZWF69LWARtQK6ti4cfWDSd9d+aXYdshFudTk/2rH8JyyuBEKzkmbi5XwOfee7gDt9X+WTu/ra+5mYOXo5PMkKlcJc5R80jFg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR02MB3270.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(316002)(66946007)(33656002)(54906003)(86362001)(66556008)(64756008)(83380400001)(71200400001)(4326008)(5660300002)(52536014)(26005)(186003)(8936002)(6916009)(55016002)(478600001)(66446008)(53546011)(6506007)(966005)(8676002)(2906002)(7696005)(76116006)(66476007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YWllVGtEdFFKeFZ4c0x2MDBOeE0wekFrTGVKNHlJT2FzZFJNM0JPRWVNaUFC?=
 =?utf-8?B?U2JWVEllL1d2Z1RCb2dpQXJTMWZackJWQklaSWdRWHYzTzM0VnhaV0xPUTc5?=
 =?utf-8?B?bmpscStwVEw0cnJvbEh6bVR2elRIdk82V2c5aHdXczRSMWFrTEpuSnc4N01u?=
 =?utf-8?B?SUtQTHFSaEdBRklWM2c4S0RUNm9zVis1eFpzRGo4WE9TYXRUK2IxbmdXdU40?=
 =?utf-8?B?OTNOVkxua09IUmkwNmd3czkxdVA4MFBISkIvNytqaXNWMjZ2N0pyeGttdzFx?=
 =?utf-8?B?UmM1citVTkg0RWoyRU5SMkpCUi9KaGVDOEYxenNXbUFWQnlQTHZmeG5oRUhT?=
 =?utf-8?B?WVB2QkpHd1E0NnFyNXZ2ajY4T3V1Z0tWR05NWE5OQTlOWkRWc3RLcVJmZFh3?=
 =?utf-8?B?SmxueW1wQ3BHaFZrWmJJNy9QMEw0WWFLK3FxbEdxbGE0TWw2U1R3YWhLWVB0?=
 =?utf-8?B?Ry9sS2FldlUvMXhGQVNTczJkcklaVVNLNGx2b0xYVDluMTErWm1DZFBoemp2?=
 =?utf-8?B?b1BzYmRPY3hkRUVrMkJMQUJ0bDQ2NDNSQVNsbmx1cUhONmg2M2VCc0xIZXJk?=
 =?utf-8?B?Q1N4RmVtTW56c0NENmJsUWFKTHpvcXV0aEhMaTBxM0p4N0xmOUppUG5aRXht?=
 =?utf-8?B?QjV1dSs1elptVnJ4SktRZ1dHS3N6aG00RGRISm1MRTAxUnZ3M3hLSW5wR3Vp?=
 =?utf-8?B?THp3Z0twMzZqMVN1NFh1YldWV0ZXcjZOa0xIQy9Ga2l6R2lnOFhjeVhGUG1Q?=
 =?utf-8?B?blQybncrNXVBaFp0WnN0aTdTWnQ4WTZXT25iRGRCa0piZllkY1dGSXBhSW9n?=
 =?utf-8?B?eGVZY1pTbkhCdzlrM3RibC9qYXZqaFNJSzlab3EySFk5Y3ZkMnh6STFjdVpn?=
 =?utf-8?B?QytYZ3NMZzVhOXkzUE9wNXJ1OElEZWs4R3hYNFFheERCSVZYOHFCc2krZU5O?=
 =?utf-8?B?ZUZWc0psYzV2cnhTNmhMK0xjWmR3ZGR1ZUNXb2NyQzRXUVRFdktvVU9Wb2Vq?=
 =?utf-8?B?NW0xbXdQK3Z1d3AvZ2FIVTQvZ2lLSWpNeWFjVE1pRC9tQWJPRzcrZlE2M3pR?=
 =?utf-8?B?N24rWEhHU1ZDdFZvV0tuT0N3R1cvY2JsT0dXQysrVy84SENKVVJWM0hPdHJG?=
 =?utf-8?B?TUdWTFN0OVdTMitSY2d3djhkcGV1UjNpeFVkeGo0YjkrVmNWTnVFTklvNDNm?=
 =?utf-8?B?OFp1US9OblVsbUx6eWZickhCZ0NVb2krMzZxWWRpWkZxZEJwNWJqeW8zZllt?=
 =?utf-8?B?SDIxdFBpZ0UwSHNHZEJhTU5TaXdLQkU0YUJiTDlaVzAwMmZwMVdVeUdncERm?=
 =?utf-8?B?WkIwTDBML0ZjUGdoM09XOVVnOFJSSm1TTEJwWllQUmo5ZXdhaUNTVkRWcURL?=
 =?utf-8?B?c3JxRzNrdmlmZlhvN0U4WWVQWWxXOWhDb3dwQzVIS2plZldZamdEaWg2VnRY?=
 =?utf-8?B?N3VjWVpyT0ppSXcwT3dmdlVPUzRYWWM2Q1R2eUtHbWZkK1VWQUVxYVVnSDlq?=
 =?utf-8?B?bWNLVEp1aGpMY3JVUzhRUDc1T0pVZHFtWHR1RVBSQXNmUnBtSjFTd3FDOTNW?=
 =?utf-8?B?S0hOR2o1MDlCSTdmQ3NJeWxJM2lUVjVYS1U3QkorZzVtWXM5a2c3anhNWkMw?=
 =?utf-8?B?bHJrL1FkdlRpWHRBZFo1bzAwRjUzVXorMytGSWhEMC9KVWhhcU1lR000SDN1?=
 =?utf-8?B?aWJhUUNLUTRGSjNjaUg5Tkxkc2NRK3dwcWhabitKWVFxaGhBaEVqcy8xejBN?=
 =?utf-8?Q?vgRSEx0Qkl9CpJmdsmJUkqaLuB45mA1vGfGBeyM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR02MB3270.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd58219-5f8a-4514-021c-08d8cd0b260b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 14:58:23.8305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m7PY2raeNrF8xdxu3Bj23aa9TiW9WYYWAiFePc3FQySSDuh3ZXJ+h3mW0TLnEg7UZVUuW2oZwcrhWZXWBz62pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2759
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgUm9iLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDksIDIwMjEg
NzoyNyBQTQ0KPiBUbzogU2FpIEtyaXNobmEgUG90dGh1cmkgPGxha3NobWlzQHhpbGlueC5jb20+
DQo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBNaWNoYWwg
U2ltZWsNCj4gPG1pY2hhbHNAeGlsaW54LmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgZ2l0DQo+IDxnaXRAeGlsaW54
LmNvbT47IHNhaWtyaXNobmExMjQ2OEBnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAyLzNdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBBZGRlZCBiaW5kaW5nIGZvciBaeW5xTVANCj4g
cGluY3RybCBkcml2ZXINCj4gDQo+IE9uIFR1ZSwgRmViIDksIDIwMjEgYXQgMjoxNyBBTSBTYWkg
S3Jpc2huYSBQb3R0aHVyaSA8bGFrc2htaXNAeGlsaW54LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4g
PiBIaSBSb2IsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+ID4NCj4gPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPg0KPiA+ID4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgOSwgMjAyMSA3OjUxIEFN
DQo+ID4gPiBUbzogU2FpIEtyaXNobmEgUG90dGh1cmkgPGxha3NobWlzQHhpbGlueC5jb20+DQo+
ID4gPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgTWljaGFs
IFNpbWVrDQo+ID4gPiA8bWljaGFsc0B4aWxpbnguY29tPjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+
ID4gPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7DQo+ID4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3Jn
OyBnaXQgPGdpdEB4aWxpbnguY29tPjsNCj4gPiA+IHNhaWtyaXNobmExMjQ2OEBnbWFpbC5jb20N
Cj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8zXSBkdC1iaW5kaW5nczogcGluY3RybDog
QWRkZWQgYmluZGluZyBmb3INCj4gPiA+IFp5bnFNUCBwaW5jdHJsIGRyaXZlcg0KPiA+ID4NCj4g
PiA+IE9uIFR1ZSwgSmFuIDE5LCAyMDIxIGF0IDEwOjU3OjMzQU0gKzA1MzAsIFNhaSBLcmlzaG5h
IFBvdHRodXJpIHdyb3RlOg0KPiA+ID4gPiBBZGRlZCBkb2N1bWVudGF0aW9uIGFuZCBkdC1iaW5k
aW5ncyBmaWxlIHdoaWNoIGNvbnRhaW5zIE1JTyBwaW4NCj4gPiA+ID4gY29uZmlndXJhdGlvbiBk
ZWZpbmVzIGZvciBYaWxpbnggWnlucU1QIHBpbmN0cmwgZHJpdmVyLg0KPiA+ID4gPg0KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBTYWkgS3Jpc2huYSBQb3R0aHVyaQ0KPiA+ID4gPiA8bGFrc2htaS5z
YWkua3Jpc2huYS5wb3R0aHVyaUB4aWxpbnguY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIC4u
Li9iaW5kaW5ncy9waW5jdHJsL3hsbngsenlucW1wLXBpbmN0cmwueWFtbCB8IDMzNw0KPiA+ID4g
PiArKysrKysrKysrKysrKysrKysgIGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9waW5jdHJs
LXp5bnFtcC5oDQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKyB8DQo+ID4gPiA+IDIzICsrDQo+
ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDM2MCBpbnNlcnRpb25zKCspICBjcmVhdGUgbW9kZSAx
MDA2NDQNCj4gPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwv
eGxueCx6eW5xbXAtcGluY3RybC55YW1sDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtenlucW1wLmgNCj4gPiA+ID4NCj4gPiA+
ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waW5jdHJsL3hsbngsenlucW1wLXBpbmN0cmwueWENCj4gPiA+ID4gbWwNCj4gPiA+ID4gYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC94bG54LHp5bnFtcC1waW5j
dHJsLnlhDQo+ID4gPiA+IG1sDQo+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uOWYyZWZiYWZjYWE0DQo+ID4gPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwv
eGxueCx6eW5xbXAtcGluY3RyDQo+ID4gPiA+ICsrKyBsLnlhDQo+ID4gPiA+ICsrKyBtbA0KPiA+
ID4gPiBAQCAtMCwwICsxLDMzNyBAQA0KPiA+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSAlWUFNTCAxLjINCj4gPiA+ID4gKy0tLQ0K
PiA+ID4gPiArJGlkOg0KPiA+ID4gPiAraHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGlu
Y3RybC94bG54LHp5bnFtcC1waW5jdHJsLnlhbWwjDQo+ID4gPiA+ICskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiA+ID4gKw0KPiA+ID4g
PiArdGl0bGU6IFhpbGlueCBaeW5xTVAgUGluY3RybA0KPiA+ID4gPiArDQo+ID4gPiA+ICttYWlu
dGFpbmVyczoNCj4gPiA+ID4gKyAgLSBTYWkgS3Jpc2huYSBQb3R0aHVyaQ0KPiA+ID4gPiArPGxh
a3NobWkuc2FpLmtyaXNobmEucG90dGh1cmlAeGlsaW54LmNvbT4NCj4gPiA+ID4gKyAgLSBSYWph
biBWYWphIDxyYWphbi52YWphQHhpbGlueC5jb20+DQo+ID4gPiA+ICsNCj4gPiA+ID4gK2Rlc2Ny
aXB0aW9uOiB8DQo+ID4gPiA+ICsgIFBsZWFzZSByZWZlciB0byBwaW5jdHJsLWJpbmRpbmdzLnR4
dCBpbiB0aGlzIGRpcmVjdG9yeSBmb3INCj4gPiA+ID4gK2RldGFpbHMgb2YgdGhlDQo+ID4gPiA+
ICsgIGNvbW1vbiBwaW5jdHJsIGJpbmRpbmdzIHVzZWQgYnkgY2xpZW50IGRldmljZXMsIGluY2x1
ZGluZyB0aGUNCj4gPiA+ID4gK21lYW5pbmcgb2YgdGhlDQo+ID4gPiA+ICsgIHBocmFzZSAicGlu
IGNvbmZpZ3VyYXRpb24gbm9kZSIuDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgWnlucU1QJ3MgcGlu
IGNvbmZpZ3VyYXRpb24gbm9kZXMgYWN0IGFzIGEgY29udGFpbmVyIGZvciBhbg0KPiA+ID4gPiAr
IGFyYml0cmFyeSBudW1iZXIgb2YgIHN1Ym5vZGVzLiBFYWNoIG9mIHRoZXNlIHN1Ym5vZGVzIHJl
cHJlc2VudHMNCj4gPiA+ID4gKyBzb21lIGRlc2lyZWQgY29uZmlndXJhdGlvbiBmb3IgYSAgcGlu
LCBhIGdyb3VwLCBvciBhIGxpc3Qgb2YNCj4gPiA+ID4gKyBwaW5zIG9yIGdyb3Vwcy4gVGhpcyBj
b25maWd1cmF0aW9uIGNhbiBpbmNsdWRlIHRoZSAgbXV4IGZ1bmN0aW9uDQo+ID4gPiA+ICsgdG8g
c2VsZWN0IG9uIHRob3NlIHBpbihzKS9ncm91cChzKSwgYW5kIHZhcmlvdXMgcGluDQo+ID4gPiA+
ICsgY29uZmlndXJhdGlvbiAgcGFyYW1ldGVycywgc3VjaA0KPiA+ID4gYXMgcHVsbC11cCwgc2xl
dyByYXRlLCBldGMuDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgRWFjaCBjb25maWd1cmF0aW9uIG5v
ZGUgY2FuIGNvbnNpc3Qgb2YgbXVsdGlwbGUgbm9kZXMNCj4gPiA+ID4gKyBkZXNjcmliaW5nIHRo
ZSBwaW5tdXggYW5kICBwaW5jb25mIG9wdGlvbnMuIFRob3NlIG5vZGVzIGNhbiBiZQ0KPiA+ID4g
PiArIHBpbm11eCBub2RlcyBvcg0KPiA+ID4gcGluY29uZiBub2Rlcy4NCj4gPiA+ID4gKw0KPiA+
ID4gPiArICBUaGUgbmFtZSBvZiBlYWNoIHN1Ym5vZGUgaXMgbm90IGltcG9ydGFudDsgYWxsIHN1
Ym5vZGVzIHNob3VsZA0KPiA+ID4gPiArIGJlIGVudW1lcmF0ZWQgIGFuZCBwcm9jZXNzZWQgcHVy
ZWx5IGJhc2VkIG9uIHRoZWlyIGNvbnRlbnQuDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3Byb3BlcnRp
ZXM6DQo+ID4gPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gPiA+ICsgICAgY29uc3Q6IHhsbngsenlu
cW1wLXBpbmN0cmwNCj4gPiA+ID4gKw0KPiA+ID4gPiArcGF0dGVyblByb3BlcnRpZXM6DQo+ID4g
PiA+ICsgICdeKC4qLSk/KGRlZmF1bHR8Z3BpbykkJzoNCj4gPiA+ID4gKyAgICB0eXBlOiBvYmpl
Y3QNCj4gPiA+ID4gKyAgICBwYXR0ZXJuUHJvcGVydGllczoNCj4gPiA+ID4gKyAgICAgICdebXV4
KC4qKSQnOg0KPiA+ID4NCj4gPiA+ICdebXV4JyBpcyBlcXVpdmFsZW50Lg0KPiA+IEkgd2lsbCBm
aXggaW4gdjMuDQo+ID4NCj4gPiA+DQo+ID4gPiA+ICsgICAgICAgIHR5cGU6IG9iamVjdA0KPiA+
ID4gPiArICAgICAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgICAgICBQaW5jdHJsIG5v
ZGUncyBjbGllbnQgZGV2aWNlcyB1c2Ugc3Vibm9kZXMgZm9yIHBpbiBtdXhlcywNCj4gPiA+ID4g
KyAgICAgICAgICB3aGljaCBpbiB0dXJuIHVzZSBiZWxvdyBzdGFuZGFyZCBwcm9wZXJ0aWVzLg0K
PiA+ID4gPiArICAgICAgICAkcmVmOiBwaW5tdXgtbm9kZS55YW1sIw0KPiA+ID4gPiArDQo+ID4g
PiA+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4gPiA+ICsgICAgICAgICAgZ3JvdXBzOg0KPiA+
ID4gPiArICAgICAgICAgICAgZGVzY3JpcHRpb246DQo+ID4gPiA+ICsgICAgICAgICAgICAgIExp
c3Qgb2YgZ3JvdXBzIHRvIHNlbGVjdCAoZWl0aGVyIHRoaXMgb3IgInBpbnMiIG11c3QgYmUNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgc3BlY2lmaWVkKSwgYXZhaWxhYmxlIGdyb3VwcyBmb3IgdGhp
cyBzdWJub2RlLg0KPiA+ID4gPiArICAgICAgICAgICAgaXRlbXM6DQo+ID4gPiA+ICsgICAgICAg
ICAgICAgIG9uZU9mOg0KPiA+ID4gPiArICAgICAgICAgICAgICAgIC0gZW51bTogW2V0aGVybmV0
MF8wX2dycCwgZXRoZXJuZXQxXzBfZ3JwLA0KPiA+ID4gPiArIGV0aGVybmV0Ml8wX2dycCwNCj4g
PiA+DQo+ID4gPiBEb24ndCBuZWVkICdvbmVPZicgZm9yIGEgc2luZ2xlIGl0ZW0uDQo+ID4gSGVy
ZSB3ZSBoYXZlIGEgcG9zc2liaWxpdHkgdG8gaGF2ZSBtb3JlIHRoYW4gb25lIGdyb3VwIGl0ZW0g
YXMgYmVsb3csDQo+ID4gaGVuY2UgdXNlZCAnb25lT2YnLg0KPiA+IGdyb3VwcyA9ICJ1YXJ0MF80
X2dycCIsICJ1YXJ0MF81X2dycCI7IFBsZWFzZSBzdWdnZXN0IG1lIGlmIHRoZXJlIGlzIGENCj4g
PiBiZXR0ZXIvYW5vdGhlciB3YXkgdG8gcmVwcmVzZW50IHRoaXMuDQo+IA0KPiAnaXRlbXMnIGhh
cyAyIGZvcm1zOiBhIGxpc3Qgd2l0aCBhIHNjaGVtYSBwZXIgZW50cnkgb3IgYSBzY2hlbWEgdGhh
dCBhcHBsaWVzIHRvDQo+IGFsbCBlbnRyaWVzLg0KPiANCj4gMSBpdGVtOg0KPiBpdGVtczoNCj4g
ICAtIGVudW06IFsuLi5dDQo+IA0KPiBhbGwgaXRlbXM6DQo+IGl0ZW1zOg0KPiAgIGVudW06IFsu
Li5dDQo+IA0KPiBZb3Ugc2hvdWxkIHVzZSB0aGUgbGF0dGVyIGZvcm0uIFlvdSBtYXkgbmVlZCAn
bWF4SXRlbXMnIGhlcmUuIFBpY2sgYSAnc2hvdWxkDQo+IGJlIGVub3VnaCcgdmFsdWUgaWYgeW91
IGRvbid0IGhhdmUgYW4gYWN0dWFsIG1heC4NClRoYW5rcy4NClN1cmUsIEkgd2lsbCB1cGRhdGUg
YWNjb3JkaW5nbHkgaW4gdjMgZm9yIGdyb3VwcyBhbmQgcGlucy4NCg0KUmVnYXJkcw0KU2FpIEty
aXNobmENCj4gDQo+IFJvYg0K
