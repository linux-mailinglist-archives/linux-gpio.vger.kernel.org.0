Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8BB38C47B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 12:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhEUKWG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 06:22:06 -0400
Received: from mail-eopbgr10075.outbound.protection.outlook.com ([40.107.1.75]:44430
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231186AbhEUKWF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 06:22:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBGQQQhdDwc7CrM1ifysFMQ9RznNNbIR+fluuJUSA/u5fnPbHir57k7dzq3az6OC3VsRaw7bJPwPec+1IXpum49M64COerCG3st4JDMEiBzrLOoa2zTAV77wd4VjDg07MB2MB2JimIl6WIToBrFsUYEHLXXa+V3nMMP6no9gn4qFwoAHryRdnLt6Rslt+2nV/mWIwwopFXnwZeiD2E8iJyzzvaomVIO6wm4gHFPmdQV+ss3i1dN9PBIqKVkADTE5Zwf8hH1rBN2u9D1iS6+wSoTbzm2GiFWjYELN3uGIfMv9OkYjr0GPaqejDJ6nXRLQlXGdhRUQ8bHxBKFEGdVdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VgnBP7GsRc686fMu1SF89Hq9KTIfW4lKvujisEU0RY=;
 b=OmLg8i3enfAwqmtMv9tgAiNK2E/eqQwuIMDAhO/1mTum8jcyA7YUPA4Jw3S1ikzmbw21vuTIDkk52XC4HeI3pt1EFPGG+Khf6ixvU+UKlT6ZKMH3mXv8cd4supOkdXq/52ro1Yf1vBqMp2fGX0GzCOhgu3m0rApgl5amXaS2tfHWTLyRJLbhUWFy9r0HXPW++MgOpY3B5GobJGsS6cVOdhjwkxSBnpRgByNozp8cfFk4Q0O/dNuoZXeqzw2KU2NagXDTdgqPsDzPdaqG2I7Z5PMELsYSAYCJcfOWNpFy1b/Iun6C2eosLdXUcWtov3tCfgYsQhPrmyl2/+tw7aUdcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VgnBP7GsRc686fMu1SF89Hq9KTIfW4lKvujisEU0RY=;
 b=dV3ylEkNXQ0k+ZQ6zt4EfSaKUIv/ii15Nym0wZLzMmgeBV9iBSZJUcKLZMMh0K2ZiMOH+ugM1etcH43gxZ5ey1y8CnPsUUx7TiRoHaiHTF+rFrvyin7879lk7kz9AGepBw4+rJmHyHaLFTp+48XfwPHXgjOPtghmi0ePGUYgsXg=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3068.eurprd03.prod.outlook.com (2603:10a6:7:56::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.27; Fri, 21 May 2021 10:20:38 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b%7]) with mapi id 15.20.4129.033; Fri, 21 May 2021
 10:20:38 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "michael@walle.cc" <michael@walle.cc>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
Thread-Topic: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
Thread-Index: AQHXTgpu4aWqZZ8ASUmBHpkD9gskvKrttrqAgAADE4A=
Date:   Fri, 21 May 2021 10:20:38 +0000
Message-ID: <01b1781e9ec9c474227ad914fea49db8a3a3712d.camel@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VcZwYdA5R=peC+8jHVT6UDsAT9msSs=W6C7rgfyjGPtXA@mail.gmail.com>
In-Reply-To: <CAHp75VcZwYdA5R=peC+8jHVT6UDsAT9msSs=W6C7rgfyjGPtXA@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [213.255.186.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9abc9f0-eac8-4274-2913-08d91c42144f
x-ms-traffictypediagnostic: HE1PR03MB3068:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB306817B78A34BD859C626094AD299@HE1PR03MB3068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x2bji8FOW427CO2+5m/ZkVitzEyYQd0opmr/z6poJXscHhEDS+AYLJal40twOiHEocQdbJYBo9z6aZC8bFEEUMzsOPK2YLRAsc3hSkgCpkRc5VttmbftX/eOdWUoV0N6Ql7MiY9623Q8lXTvhlCj6Hdo0jR+ACvRB4E44E5qFcnALlnsenhTaXRt2bw660ZxO9DphjuPp9aSMc2BKOSdnT27eg5ajL2hZS/TZntWfI/X3Z1k9FRjMCkuPz8iY2ygn1rDBhpYwz1P5IK26ABXlGUYF4cjqM2G1/fiz7KFsXX+FZFf4IPF8kW6aq2g1EsQpq5uZxee+LZSxUzSIUFToTPQjUZ/xmolmwFoiq45tK89X4s7symxmR6Jv2/wzS1rKpvVQ4le9oPydBellP/nZHkMJEPziacrf1k24QibPcEFk1b2/PSoxAhGhkQe8+59MtHu6yUfwwpHVYFqqTCUPfdfgZp+2eBvhZ2VpJMH5/G/dCUqIKWof/Ee4NmveNnA8+YOAFA4pWB8J4i+UAxTJmsiIJyyABKTOxJw583ZIHdgEpWuS182D3qcgqS+FbvdsQJz8Y3S3VzYbmuyXYJ0ZPvuxs8wLR9QQMQLdbkwUXY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(2616005)(316002)(26005)(6916009)(2906002)(54906003)(86362001)(5660300002)(8676002)(83380400001)(6486002)(66446008)(38100700002)(53546011)(6506007)(6512007)(186003)(4326008)(76116006)(66556008)(66476007)(66946007)(8936002)(478600001)(122000001)(3450700001)(64756008)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WXp3ZGVjSWhKZ0xJY3lId0E5MHNKcWQyQzMrYnJmQlJZdSs3aDVIMjhOdlJi?=
 =?utf-8?B?dnp2ZzlDQmRUZWV6eDB4ZUxmaEVJaEJ0ZGtmYVZBYWI1ZmNMK09pRXVZNXd3?=
 =?utf-8?B?b3FSM1ZDbEJFRGJza1UyMWNpSlRUWmNPTDFsNUlmL3BzNWJKWFJWbllyRzkw?=
 =?utf-8?B?SGgrZ2VSRFR2Y2lCMVRkcUQ0dHp6N090RGc1S01HTWNJYk16VmVUVmJPUkNy?=
 =?utf-8?B?Tmp3YXdnVWVJcDY2S2lTN1ZiV1hhM3pHeEtRYkc1bmFUUUhzZjR6cHB5eVhk?=
 =?utf-8?B?U1NmZGZDM1NUYjhGb21lVy9rNUs3elYwbWtKejQzTVpFbUxMNVZyNCtOYUdG?=
 =?utf-8?B?bGJUdWprMjVvUjdHaVRtdmNmci8yNDR4OGRPdjVLUm8xK1lKeVBWZVJGWTNj?=
 =?utf-8?B?dEUvWGd6eUY5NFFMOHlQSGJ4V1diWSttb2pUUURzSlE2YVM4b0NqK1gyU2V0?=
 =?utf-8?B?UmkwVFZ4WFlHc09Gd3c2eHI3QXloMVVZRWttRmkzS3lkM3hBcnBSMG9UWmxI?=
 =?utf-8?B?dExGcXNqVXQ3V2oxQVdqQklranhnVDV4a01Xb2RubG44NzZ4eFdjKzNmVU9w?=
 =?utf-8?B?OEludGUzdEpsYzJBWlQrU2ZnRjR6dGlVUjB2Yk85K1grV0R3U2lIL1k5QjNT?=
 =?utf-8?B?ZzM0TnBHUXVUVzQvb0dCQk54bkhHUkJpWVVKd2s4SkhQTyttd3pOblRuajBv?=
 =?utf-8?B?TjZ6NXVkL0JJNDZLZkxSTjBCRzI5OVZDd1k1Q0NWZncybmJwQ0FSWlFFMkM5?=
 =?utf-8?B?czFvOW45Rnl1UVB6UEVpc3pFMGViVW03dHVDVEg5cjdTV1ozOW9ZSWg2Ti9x?=
 =?utf-8?B?NFpwT0xDMk9EbldVUzBMMjRQQW02K2VFazdXblAwZ3l3WlR0OHdMZUlzclpJ?=
 =?utf-8?B?Z2hZTTdEclg0VjNVTnU0Mm91Q2xSb3lna2dGdDhOYVl6eVJBeW5GMjd0clBp?=
 =?utf-8?B?a3hidnFqUFZETXpkWGQwempOdGRwR0l5Y1FDdDJNWjdWaWRvUlFjdXFBcE9M?=
 =?utf-8?B?Qk1ZU0NKMGJURWE2ajVPVzZGTGlUd2xNdTBFYmVieGp3dW13a0hQNENlNFZ1?=
 =?utf-8?B?aGVpS3pLUU00eU0rUWxkeDc3bFpKNHFvUWRSb0xXZzB5alBqeHZ2NmV0b1B0?=
 =?utf-8?B?Y1JKcnFKVjhzUVZvVW8zWVZWV3ZrdG1NNnZjajgxWlFrNUp0T2RTanAxT3F0?=
 =?utf-8?B?Uis3VkdUelo1RFpERG5xcEJRUlplc2liYTdYZTZNZjlvbzJ6N3BqMmtXVTlo?=
 =?utf-8?B?amFBUFVBY3dwTEQxQm1HQ3Y0NHVibXI1L28vcWUxU0srald6b25kZWVGa1FR?=
 =?utf-8?B?T29YZEE2elJsU0o5M2s2MGFub1N6T2dDaTBPalRjd0pHRzIyeW5KOXBMT1A3?=
 =?utf-8?B?OUFDd1dBK0FqbFpWUCtzb1ZGNTlsVjNzaHFXU0lLOGt6YXFUTURIdDR4NE9X?=
 =?utf-8?B?V2toMHloTkkycEZaQnlYUVhwdThkTVBQYmxkaWJQQTNIV2VGS3ZPbU5RSjJR?=
 =?utf-8?B?TXVXMTRTOEpBRGVYUk4yWHhnMm5iQWwxMi9kd0d2TE1Da1ZYYnFETGFRanhx?=
 =?utf-8?B?QUU5dHlwaEtKZWRnU0twMVpDWEFPWFRqYjBaZDVKZmpyRVJKS0Ridnd1SjQv?=
 =?utf-8?B?QjhERG1hd0tiQUZ1ZVZXdnhnVDJXazkxNzg5byswNjhhN09CQThGMXl6cHRV?=
 =?utf-8?B?eGNIMVVtS0NwQm5yVUZORFlXdUd3SmcwR0ZPaDZzckJ6SGVQeGo1dGR5U0dM?=
 =?utf-8?Q?08fZgWI0ja3NwYhUjk71TquNPmbT3hz0QNMIBYO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C58DDE66053C8448AB777E9C18903313@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9abc9f0-eac8-4274-2913-08d91c42144f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 10:20:38.2404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+uqzJCDuI5ikmCta5GdGgF+aWY1vwrpyh1GM2K+JTwnktpyY4rSr7nY6r1Jwp4i2MZbvlc+Wjc+kig2ioV0C9smdnvElUf89ydi1SDWKwQdXGUwBdYM3OFsxKCefGj2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3068
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjEtMDUtMjEgYXQgMTM6MDkgKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToNCj4gT24gRnJpLCBNYXkgMjEsIDIwMjEgYXQgMTI6NTMgUE0gTWF0dGkgVmFpdHRpbmVuDQo+
IDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+IFRoZSBzZXRf
Y29uZmlnIGFuZCBpbml0X3ZhbGlkX21hc2sgR1BJTyBvcGVyYXRpb25zIGFyZSB1c3VhbGx5IHZl
cnkNCj4gPiBJQw0KPiA+IHNwZWNpZmljLiBBbGxvdyBJQyBkcml2ZXJzIHRvIHByb3ZpZGUgdGhl
c2UgY3VzdG9tIG9wZXJhdGlvbnMgYXQNCj4gPiBncGlvLXJlZ21hcCByZWdpc3RyYXRpb24uDQo+
IA0KPiBUaGFua3MgZm9yIHRoaXMuIEluIGdlbmVyYWwgKGZyb20gZGVzaWduIHAuby52LikgbG9v
a3MgZ29vZCB0byBtZSwNCj4gb25lDQo+IHF1ZXN0aW9uIGJlbG93LCB0aG91Z2guDQo+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1l
dXJvcGUuY29tPg0KPiA+IA0KPiA+IC0tLQ0KPiA+IENoYW5nZWxvZyB2MjogKGJhc2VkIG9uIHN1
Z2dlc3Rpb25zIGJ5IE1pY2hhZWwgV2FsbGUpDQo+ID4gICAtIGRyb3AgZ3Bpb19yZWdtYXBfc2V0
X2RydmRhdGEoKQ0KPiANCj4gQnV0IHdoeSBkbyB3ZSBoYXZlIGdwaW9fcmVnbWFwX2dldF9kcnZk
YXRhKCkNCg0KSSB3YXMgdGhpbmtpbmcgdGhlIGRyaXZlcnMgbWlnaHQgc3RpbGwgbmVlZCB0byBn
ZXQgdGhlIGRydmRhdGEuIEJ1dCBub3cNCkkgZG9uJ3Qgc2VlIGhvdyB0aGV5IGNvdWxkIGVhc2ls
eSBnZXQgaXQgdmlhIHRoaXMgQVBJLiBZZXMsIHRoZQ0KcmVnbWFwX2dwaW8gc3RydWN0ICh3aGlj
aCBpcyB1c2VkIHRvIG9idGFpbiB0aGUgZGF0YSB2aWEgdGhpcyBBUEkpIGlzDQpyZXR1cm5lZCBi
eSB0aGUgcmVnaXN0cmF0aW9uIC0gYnV0IHRoZSBvbmx5IHBsYWNlIHdoZXJlIElDIGRyaXZlciBj
b3VsZA0Kc3RvcmUgdGhpcyBpcyBpbiB0aGUgZHJ2ZGF0YSA6KSBTbyB5ZXMsIHRoaXMgaXMgbmV4
dCB0byB1c2VsZXNzIG5vdy4NCg0KU3VyZSB0aGlzIEFQSSBjb3VsZCBiZSB1c2VkIGluIHByb2Jl
LCBhZnRlciB0aGUgcmVnaXN0cmF0aW9uIC0gYnV0DQp0aGVyZSB0aGUgZHJpdmVyIHNob3VsZCBo
YXZlIGFjY2VzcyB0byBkcnZkYXRhIGFuZCBjb25maWcgYW55d2F5cy4NCg0KSSdsbCBkcm9wIGFs
c28gdGhlIGdwaW9fcmVnbWFwX2dldF9kcnZkYXRhKCkgaW4gbmV4dCB2ZXJzaW9uLiBUaGFua3MN
CmZvciBwb2ludGluZyB0aGlzIG91dC4NCg0KPiAgYW5kIHdoeSBpcyBpdCBkaWZmZXJlbnQNCj4g
bm93IHRvIHRoZSBuZXcgbWVtYmVyIGhhbmRsaW5nPw0KDQpIbW0uIEkgYW0gdW5zdXJlIHdoYXQg
eW91IG1lYW4gYnkgdGhpcz8NCg0KPiANCj4gPiAgIC0gZHJvcCBjaGVja3MgYW5kIFdBUk4oKSBm
b3IgcHJldHR5IG11Y2ggaW1wb3NzaWJsZSBjYXNlcw0KDQo=
