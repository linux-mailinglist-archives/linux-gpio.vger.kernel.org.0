Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B232E08FE
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 11:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgLVKw0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 05:52:26 -0500
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:63674
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726340AbgLVKwZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 05:52:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHnI5psOw4LJshBoUtrxxgKTMkkULneWghcQwqCw3nUhUll35FjpjGq+ZR/yZXCpuEgZ/wJa14xx6gQ7QGpQF5x05LEKVr/xowvhUJAcsLXuXR0dC5XPPd6daAX68mHKNvRxYzAb5VnvMcux+vPmZiIS+dkkCYsDHwO16WGfuZ9aVmhUQwEVBDsAbbIYAk9ojYdzf2bIkwjWIJA97DUiZvTuo6gnznMHxk1Svl9ZhxaBRkK2mhk+P95//yVsRVv5Mq/SqywYk+WJNhmB8Ybu9dnUq0J+epsUe3rzUOfpsf53lrdcUtbQSF3j9yZAmD+94PL0YYPsMA+50HdBDF1J5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJo05MF2RkJdXyosOonyfU4sqqFdljSJ8AGjYD2CfP8=;
 b=TxOHLdQ7uwQPrNVbJnujLNlsf0vp7TcJAqp86a8YV39pZyQiGeAn4eMbd8/F7eEGNwxjZ+J1vwhQd/YV3WC9PTnu+8GdUANzRwfYVlnhXMsxcyxndQHzmYCfTaIWiZ1npI7T5e2GNdoZiKZ2TpjnqpxhNeJGmx9BgwaJBauo5AEXV+rGfagUbRRhNGXso74xwfqLGGRRKIqIy2gSrfdtcACqiTX/FzEVfuc6gXlQfwsuXj/3b1XmeZbgYYOMg+La5TeKEg3anD0yvHwiCh+f6g6sRzaY5OpZYjjftjxU5iKNgPkTg/NqMh57rwI1bID0hZOFE31nNEjaruwPpVPgbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJo05MF2RkJdXyosOonyfU4sqqFdljSJ8AGjYD2CfP8=;
 b=eZ+t8lHtBQiYjDK4Etn6bgA8VB2u0DTe664Paz2EBFwFsSiAnGHuWvW7DxgQL86gyGExVzTtlFfF6hLLrSqUm7RPHTzAowIkBuTiN0r+oRUSrSv17zuvGa+Ay5HHsc2N5415b+d2JY3wbON95UAbDG4uz070Ux+OP/0h6OBq0xY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2224.jpnprd01.prod.outlook.com (2603:1096:404:4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 10:51:35 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 10:51:35 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH v4 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHW10Sk0N1z3uPelU2TClNF0Jib9KoC0R+AgAAHfyCAAAV/gIAAE6EA
Date:   Tue, 22 Dec 2020 10:51:34 +0000
Message-ID: <TY2PR01MB369273CD7B38140D1BCCA32ED8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608519279-13341-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <CAMuHMdXkRUbjQk=1mqn0b7PeGX0ir=s4UwbCHfw_2mWaVEVPTg@mail.gmail.com>
         <TY2PR01MB36920B85DFCE969BF8AF229CD8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <1f13ab9c0902ed23511b0d393e633e0d7a7abc71.camel@fi.rohmeurope.com>
In-Reply-To: <1f13ab9c0902ed23511b0d393e633e0d7a7abc71.camel@fi.rohmeurope.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:21dc:f9ce:ff84:4ded]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4147a000-2814-430f-7684-08d8a6678cfb
x-ms-traffictypediagnostic: TYAPR01MB2224:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB2224C19E5630CC2B6E346613D8DF0@TYAPR01MB2224.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SFbat8LzZtzpzmZUl8/QOHjwM0mTGszlclHuz6aE3o1svQGc/2G+tQmY6NCSMq0gJbRwcKmQ1vygn0Sipg/bE0EuQpQkydIbXlkjfTWs+6kSQH6ICAOkZ2m1Hbt0TUJApz20tyqYCfN0yTJTSt+62xXHq6KHLJCcnJka8+noO7Vm9WHsHc28vqvzSoCaZbWu8kJx/hW7sIYYa3uH94FSRuFfaLPtsKo6q+WeGqB7Nr3g0bl26r5jNkGux98azWL9z3Opds+MoKVwXDj3ZNNX6W/os08nittyzYTtgG0BqtPXWC/dv6/9/EiPAcKsZ55OCSKulVybwKsh/OKOz7JhC05EObKvwGreqDqR13F8AoQeV6mHeKEBtDW3BBU8Mbwg7qTSLaqVkT6r6CmPMfwS6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(76116006)(7696005)(4326008)(478600001)(5660300002)(66476007)(55016002)(6506007)(33656002)(8676002)(4744005)(66946007)(54906003)(110136005)(316002)(86362001)(9686003)(52536014)(186003)(8936002)(2906002)(66446008)(7416002)(83380400001)(64756008)(71200400001)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NTFWanV5U1Z5OHJlcWtJUWNtWjR0UDhxaDJBRHVtVWZ4aFVxcUZWMjMwVkts?=
 =?utf-8?B?aXIwWDYwam9rWlE2L1dSd2orckg0MFJMR0Z4Y1BKR3VydnFNbTdhajNqRFcw?=
 =?utf-8?B?V1RJODJ0VkdVSWlKZWVwY2ZEbk5iRE5TR1FJUi9BN3AxcWYyR3F5T0RkYXY4?=
 =?utf-8?B?OS9pS1dLMFhPQmlNcXJDODMyeWQydFZhQUZYUmpucnBKdWdIczl0Q3N5V0xu?=
 =?utf-8?B?c1Z6c1Q4RnRIOHBaY1c4by9wMDdUWHpxQVU2UDNaWHZiQkp1MmlENS9TbVRn?=
 =?utf-8?B?YUNPTnlJcDAwSVVCOCt4cVFmaElXQjc0U09EOGVrME5sb0dWeURGaUdOK3dP?=
 =?utf-8?B?Yk1ENlR1WitVV0hMbitRS0l6SXRtMTgyNkh5MVQxeEFMdEZXY0hWZHl0dmtR?=
 =?utf-8?B?ekNRdUd3N05hUU82VTl2T0ZuVzcxblZ2QUtKWUFJVnB2UmRpNTBUVHF0QU9h?=
 =?utf-8?B?SndORG9VT25HUGFEVEFuK2VwSWJFb1VOcERuUHNIUG96VmdWdzE4MmxXYUdE?=
 =?utf-8?B?MVdhTk9OcXdaNzYzYjBKaHhqWUY5NzBvN25zNTZ2djNaNldKZlpVdk54R3dp?=
 =?utf-8?B?NVpra29jK2hhZnJmZWtQTHRiRTVPVGJkNDdEZHBieFhuUjBFaEhibi9oUW1C?=
 =?utf-8?B?eUdFMGNJWW1wa0NUdUVmOGJvNVNLWjlVOEdFbkpaZ0J5dG1yNXNJNVVka09j?=
 =?utf-8?B?dzE2d3JmRmQwRFlVaDhvRTVYSVpTdXZQWGk4T1pmYkpXT0xCRDhHS05iS2Rz?=
 =?utf-8?B?S3Vra3hlMUxNUkVneW9zTkpTMHk4L2hadjlHOGFrejRjckJpSWd0NGk1dXFH?=
 =?utf-8?B?eTNNSWpnallhaTdJRHdmYXJmVXhXWnRMTmw5dnJlai9scHgyY0syT25LT1Zq?=
 =?utf-8?B?SjZ4dTNrcEp2d01JYWg3aC8xTGtydDY5d2dsUkpabmI5dmdpR04vbUVUZWhF?=
 =?utf-8?B?T1R3cE0yRFUvZVVzYW9pU0VhV3FoK3JKWEQ3L25PNTNMSlFNRDFod2MxVGYz?=
 =?utf-8?B?akdlODM2VUp5OTlueDdTMjQzVTg2dWYxb0wycC93Y2RWTC9kVUUrZ3Z3c0lC?=
 =?utf-8?B?OFhld2RHVFR3QTBWYmFRdGM2OWF4NDJURmMweFUvbS94OTl5OXpmamhQOUtJ?=
 =?utf-8?B?S1VVNFlhSnYyL2l6NWVIZ2JuK1VwZ3F6OTd4OC9HRDJlMjBLM3h4dGxSRDVi?=
 =?utf-8?B?bHNlWjZXY2x2VDVPVVUwODhDNWZnbkcyNGMrOXRMVE9lOC9CQTlXTGFnQU81?=
 =?utf-8?B?R0x6d2dJTHptZ0pRbko1QmUwcUZXYnhycFdKVDBTUkwrWVMwRVNEV0p1MVN2?=
 =?utf-8?B?bXZIVVF1WnNjeGplUkVPeHZtRkdNQmNlQXJoTDJlTzRtSXVoWm9DSFgxaTNK?=
 =?utf-8?Q?lVOQbGxrEPWAR6q+svt+jmoHheC/i1fQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4147a000-2814-430f-7684-08d8a6678cfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 10:51:34.9507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BqqLRZniShAtLKm7X1TswdhQ3ETQ03MbCSfym9+rvPpvStAIfXCAfRmrUL1mSpaen3+M/vVsYkMluQWqt0lzgodm9gj2mOGwwdqaoPLwSocgMzIZruqRuxaIVYmIpKQU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2224
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWF0dGktc2FuLA0KDQo+IEZyb206IFZhaXR0aW5lbiwgTWF0dGksIFNlbnQ6IFR1ZXNkYXks
IERlY2VtYmVyIDIyLCAyMDIwIDY6MzkgUE0NCjxzbmlwPg0KPiA+IEFsc28sIEkgdGhpbmsgSSBz
aG91bGQgcmVtb3ZlIHRoZSBmb2xsb3dpbmcgcGF0Y2guDQo+ID4NCj4gPiBbUEFUQ0ggdjQgMDgv
MTJdIGdwaW86IGJkOTU3MW13djogQWRkIEJEOTU3NE1XRiBzdXBwb3J0DQo+IA0KPiBJIHRoaW5r
IHRoaXMgZGVwZW5kcyBvbiB3aGV0aGVyIHlvdSB3aXNoIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUN
Cj4gDQo+ID4gIlJFQ09WX0dQT1VUIiwgIkZSRVFTRUwiIGFuZCAiUlRDX0lOIiwNCj4gDQo+IHdo
aWNoIHlvdSBtZW50aW9uIGluIEdQSU8gY29tbWl0IG1lc3NhZ2UuIElmIHlvdSBwbGFuIG9uIGFk
ZGluZyB0aGUNCj4gc3VwcG9ydCwgdGhlbiB5b3UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIHRoZSBJ
Q3Mgb24gR1BJTyBkcml2ZXIsIHJpZ2h0Pw0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXBseS4NCkFz
IEkgcmVwbGllZCB0byBHZWVydC1zYW4sIGF0IGxlYXN0IHRoaXMgTUZEIGRyaXZlciB1c2VzICJi
ZDk1NzRtd2YtZ3BpbyINCmZvciBwcm9iaW5nLiBTbywgSSdsbCBrZWVwIHRoYXQgcGF0Y2ggYXMt
aXMuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
