Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 141BC2E1A7C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Dec 2020 10:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgLWJX4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Dec 2020 04:23:56 -0500
Received: from mail-eopbgr1310131.outbound.protection.outlook.com ([40.107.131.131]:17376
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727892AbgLWJX4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Dec 2020 04:23:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLI6rwdC8TsAXqe7GSd9GhpJHHis/d4M/yTgApr/vEAUdH1vtOZ32gRiWQ48oyYJOvmOvZv7EwPDee1DQB9ThIC+AGU70EZQkiFXX2RvSCUFoAOQ1Sz0Qmo9VypbczXCUOi0RMT/fzJLVEwEsU/qb8XZb6Tkqi4qp0qT1Ta8PPFYdWe9n9szuu0sLzQo+7QdcfxbO0tOivkrhB/6q91NGnb8DECRfc3omilGYqoWV863+U771ekheqfU9+DVXA2POx0DcXojK/B5qFDE4y01z9ShSBTExBISw+lLqfkbf47k+dscsvF/G4fgr5vhTsOKg6EApWwBC2Y7wOYAYealxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHk5FOcmj24oi1FyME6Na6TXvHCZgf3NWBitDIGOrgM=;
 b=W5mWY2qXTjhnQHuooMVHmufm393xdzlB+ECkSNL0YYwXOEWB/Bjti0Uj9Jfh8ZkFtgcZ/t+W0AQkG9XQ8LNLXamRKdhnH78sFTRJw1Xs3xsgdVYwKRjfwI/5mgr+MZPNJySHUvWYugBXfPc6C8wfDSmcjpvei9MqdNfz1nxDZ9Mt82NnQbMA6ioOmVRo2iKyTMrGPlG9MPLMuPxm+zQ+63YnQTdyIPcTKRfkdUe72G38OMZBh1F4Khs1fsCFTZH+BCDXGWDmVUHW/UL0iUMuVi30gD77XOmNuMlRx6kjqm13AtDmWT32fmynySFjc6ZpISVx3KllAfmn1XqX3tUAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHk5FOcmj24oi1FyME6Na6TXvHCZgf3NWBitDIGOrgM=;
 b=f88o9ovkvdbrurgNcQmE5cxuRQD405Td+tejG7BHeEIdpNbbjvEJH8vPZs9elIaf4jwQ2EIgUnymul5UD3gHgOmW0RxaylU8kYyQ6pueJX153xtf5pC1oBEdAl7PvMrilSvYDfk0uRhbGC2T/NAt+tBeZ1SmOoOKClcgm85F1/s=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB5002.jpnprd01.prod.outlook.com (2603:1096:404:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Wed, 23 Dec
 2020 09:22:17 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 09:22:17 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC:     Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-power@fi.rohmeurope.com" <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "matti.vaittinen@fi.rohmeurope.com" 
        <matti.vaittinen@fi.rohmeurope.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Subject: RE: [PATCH v5 05/12] regulator: bd9571mwv: Add BD9574MWF support
Thread-Topic: [PATCH v5 05/12] regulator: bd9571mwv: Add BD9574MWF support
Thread-Index: AQHW2FS6Pnc2o50fQkyF3DxfwoHR7aoEZ36AgAABuNA=
Date:   Wed, 23 Dec 2020 09:22:17 +0000
Message-ID: <TY2PR01MB3692A8A89B398207ACD198B2D8DE0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608636139-564-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <7fcdab0e-7330-ee7c-abb8-7d89078a9621@gmail.com>
In-Reply-To: <7fcdab0e-7330-ee7c-abb8-7d89078a9621@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 03792628-8c27-4d20-9223-08d8a7243e3b
x-ms-traffictypediagnostic: TY2PR01MB5002:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB5002FB798F94B9171210E77ED8DE0@TY2PR01MB5002.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KGrrdPr/Bn47S2L4o+alJS0QzJcCWqKLPlp/b2lfsy1DMY0Ev95mbI5QwpuuYJXSXQ3F5p/NvWf6fDkuvYc0E4U8/Dnlh+pyluanuFrYn+n6d9ZdoGh+VRlRg7zEuo2jfnRrADLsAxLwnDg1kxEp8pUtDSJ0iITpPPxPjz3VYEKXebWfip9IMfeOS8P5Qr0AXQDCYZSIBZmgl0s+e4Zz6sR76jX//jJqfeVECKFI0Jp448tX/y/WcEPGBwNPCkwyXatEq2dUIkBjzAqHLpMKo7geVHy/uesR85ogbD8klg/ahMdNKGgVck38MkzWHWZddsIkkM/2bKCoRU/WBeGce4wBJIXykAb7wBHUIaaz3Ev77RRMF0kupUtqUwGFI1XNc7F+bCEO7tM2DHgvDSk7vw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(6916009)(6506007)(5660300002)(2906002)(26005)(55236004)(53546011)(55016002)(4326008)(76116006)(86362001)(66476007)(66946007)(9686003)(316002)(71200400001)(66446008)(4744005)(66556008)(64756008)(52536014)(478600001)(33656002)(7696005)(54906003)(8936002)(7416002)(8676002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QVFVdDZZcDYwdVlTNXdSc2tSOER3cU94N1lMNlc1aWN6QW84Q21VL2Jxak1Q?=
 =?utf-8?B?Y0tEa0tlSVRlS21GSUNzNFlSWXh6SSthRkMxRkpCeklmVGpvRStjNGJGTVpy?=
 =?utf-8?B?T091a242bmsyTHVHUDZ3NTlhaFlsaUR6dDMvaDlFRGV3eUxzbUowbWc3L2pC?=
 =?utf-8?B?SWlOQS9kMGdNc3luMVJWUkUxeFhvcnk2ZDNONlNHVTBwaEdadDlEQVNrZ1Rr?=
 =?utf-8?B?WGhnWXIvV2dpTFpwajdQeGE4N00ySDl6WkViaXFUYjZWandDZW5oMDZsaFZI?=
 =?utf-8?B?L2dDN253bmF2OVZZRERMaXlCTXdsQ1JSVUtMaTUvUnhwTHRvOFVVeHhQQXdj?=
 =?utf-8?B?OWlaa2xBNjlkazJKczdweGZpMFZSRTFjV1VRZTQwdnRtVjJ1VTE1cE9HZUlo?=
 =?utf-8?B?amhqQ2doRGVLNUNocWpPZ29kL0hDb1JNSTFtMW52K0ZWUG5HUUQ4VU5DMEVN?=
 =?utf-8?B?Q1k3SG44TU9vQlVpeXNYTnEvZXVmQlQ5V3BYVHFpazBndzYvY3kya2x2MjND?=
 =?utf-8?B?d2lrZzM5bmVvcTJNcUZyTGs4TU9xRi84RUNBQWkwbFdYc3NueWRUaHJXZzQz?=
 =?utf-8?B?LzY5MlprekpEdjlaM2R1TGg0clVRK1JpV29xWk9pMjJZQkhiNEVNbTZXTnV1?=
 =?utf-8?B?Q1dlSzdaUmxkS1psZFVLM0d1SVZiTERHV0F3amhGRnhpY05BRWIzWmxGVjJS?=
 =?utf-8?B?UUdNV0lRZUgrSzc5UXFSTGNRQjJ4NG85eEhVbnNKSGNWaFEwQXlLQzJFa3RZ?=
 =?utf-8?B?bHZCUzZrcDlQU1dtM3BCTWtwa1hGZ0tHKzBPVWxjOWs2Q3NLWm1sTFE5cldK?=
 =?utf-8?B?aDZMVExOMCtMVS82ZTVvZlQvdHJGTG5XQmJBSFFURHYzWDRpcmtKSkVGV2xS?=
 =?utf-8?B?bDdLRGJhSmxQWlZuejN5OU4xTThhbEJrTmdJby9ZRk9HZkU4bVFlUmdPbEpU?=
 =?utf-8?B?T3ZuRS9vaWdNVEU3UWFvRUM4WDNLcDlNYTdXQXkrZVB6Yk5uakV6TW04NVN5?=
 =?utf-8?B?UldIM2hiZ3hwODdzUmc0QndReGI4Rld6T0Z1SmRQSXNaV3JPanN1YmhaYXNV?=
 =?utf-8?B?TTBvY1ZCU1gvVjU5dS9TWGc4dWFQMUR1UzIydC9UYWpFcnpzYzNEMlBVNHFU?=
 =?utf-8?B?dUtxZm0xQ0ovWFdHbndhQUErSXp0KzFQWDRCMFJqUUM0MHI2MVA1Y0JlU212?=
 =?utf-8?B?TUVKUUhpckhmK2ptbkF6NnBYcGZkeEYra2QrVXR0c1J0UXdFMGxoWnZhMDdL?=
 =?utf-8?B?eHZEeExVSFZLOXlFSlRFckVQUVlYYUhNbWcwT1VRblNGVXlFSWhSSEd2dzJL?=
 =?utf-8?Q?dCI5UagfGdXo4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03792628-8c27-4d20-9223-08d8a7243e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 09:22:17.6438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOV1JRM7+dkEX0sLdd3MehdjT5elRFQVLoSDuWg1JfTDmRY+VcJKq+D+Lhv8BDeXiV9vui1DMflo54O8XX+pg6eWuqLR2rsDjBl9Vp0cZgCN3AtGjrfXurPgdJPUpZtl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5002
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgU2VyZ2VpLA0KDQo+IEZyb206IFNlcmdlaSBTaHR5bHlvdiwgU2VudDogV2VkbmVzZGF5LCBE
ZWNlbWJlciAyMywgMjAyMCA2OjE1IFBNDQo+IA0KPiBPbiAyMi4xMi4yMDIwIDE0OjIyLCBZb3No
aWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gDQo+ID4gQWRkIHN1cHBvcnQgZm9yIEJEOTU3NE1XRiB3
aGljaCBpcyBzaWxpbWFyIGNoaXAgd2l0aCBCRDk1NzFNV1YuDQo+IA0KPiAgICAgU2ltaWxhciAo
YWdhaW4pPyA6LSkNCg0KVGhhbmsgeW91IGZvciBwb2ludGVkIGl0IG91dCEgSSdsbCBmaXggdGhp
cyBhbmQgcGF0Y2ggOC8xMi4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
