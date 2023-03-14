Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA0B6B8D4A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 09:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjCNI2U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 04:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjCNI2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 04:28:06 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B54B92728;
        Tue, 14 Mar 2023 01:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XI4Qj6G0fZeLCskX5SlO205yMkwaUETBKgukgFc0xb12TyzIHX6HEScNSkqQiEwSicJfR8U2kmiB3VcUu7FRPOEl8LewjxLJQsgnuUGvaPputmkxCeWGorwuC3Ik8IS1XZlEMXs/XpELH34KXRXq8T/khQGTYnklGe4piLb8OcTt0VbPxXQVkMGkS72wh4pxFgAJSUnXl6PcB/gePa5WjQjb1PsGzbSSbbCj1gA8aO+LQTZv/1y0BbStw3FuSF86SQdhthiBadAmG5Yc8VfR1BsvF0Ob6iCBusY2ExATNhpHUCnIyC5X+d/xlaFbz5H0VB3xaRl4sC6CPubwgzEUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++xt3t9Uj2oO8T5ektRgtN3kxL3hgrAE6Nw8MVqUE6U=;
 b=TaKpcD6a2dvYcuQV4hl/RF0i1NMsnpXLEqruuRhkeKVFM1YVlTJuAJUmRI1fQEkfxxrPSphHFUWXPkvcvJ5JVRKOckYtrQ7BI4nry1zrBKvHAF5gqzWKmV3KVlvulA5U1aPjhs3Ireo/TsMWPzBxSpg5ptOHs7RbGspRSYDCHOskRJ4SrGTR+BMWd5TQ2LbDjJibbNdb/hO/QD7V/RCbFIFM5aTF2LTlsDEJ6UlsUZNuJENBQ5VXA86AB7EU3QeGcwX6EgJSq8TRKC33k3A2KuFunBcxUo2y2/v6ujR1N6WjZUrnf3owcwgesTpf94/73XnMF5U/kdYpPYp/0Vvqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++xt3t9Uj2oO8T5ektRgtN3kxL3hgrAE6Nw8MVqUE6U=;
 b=lHmjQf6E5LXRO+Ybds1REIwhpveT3vsylzmnjzdFbvQo7NX6TcaNNImf6hvAFHJxY2zGA2q5A4PBVJljFRp8A4GEWoFBGwZnoSgunqurSwUUoA1lQZ/I1dAIXVwREuRnyD1JovvKybSzqYtvSZZDgWJlPdV2X/IXW1LRkdyR+14=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8154.jpnprd01.prod.outlook.com (2603:1096:604:1a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 08:27:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 08:27:31 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Thread-Topic: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Thread-Index: AQHZUAoZhjJXzQRnckWhgNWWpo0zwa7uZ+eAgACJSoCAA3tbgIAABvEQgAAHBACAAACOAIAG1JkAgAChRoA=
Date:   Tue, 14 Mar 2023 08:27:31 +0000
Message-ID: <OS0PR01MB5922D0321A0779A8E78B96AA86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com>
 <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
 <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com>
 <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CACRpkdZS5UKc7bDPs-zx_QyJU9GwJAhB7372oSC9tB-txgghtw@mail.gmail.com>
In-Reply-To: <CACRpkdZS5UKc7bDPs-zx_QyJU9GwJAhB7372oSC9tB-txgghtw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8154:EE_
x-ms-office365-filtering-correlation-id: 765ed5f0-1cf6-44ac-02c2-08db2465f44f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cK3YIE9DCp/jwNpEWK8vHDAcsMaXmISUurw8sNIqo4ukjJazpIjse7rMcyFXoqAXSGVUPQmlj4wyjUvnDmwaErngqdpB/2y7fk6+2Ns4IbdF7BGkSuAipZ5+M8HF0lN1WVMJST5rwO6CFqM0rDS6EU7ev0HyrLLYdeDArRtKSzTbQ4tQlSy1dYKdxblR19KNohVnLkAHWwsrVHR9zc4KVOa/+a0fFqXyEbwbRbxEJvLjnFVoYO8isfSPrrgW8mLpidhS9fUY8AQ9zn1AUx6s1t1imJI6Y1z2GdmCQYMi+mCDSrJeRmv/iT3VwU55lgE5PPkL86ulT+isgVd9UhFKgyNLA95i7sIO7QF4FOOCauDddCoxDTtlMBMtdfhrFeQMw60uT1t1CJCmbkqQ+Q42fWIGLkzac76nHcJeYvmUd4s3R5Wwa1M9tpg4Q+CQLDcbVqkqMNAy28FnfDVxDjdMHX06y8M0iXbxaXUvPZ3DwUv8Tm3b+a56oKu1JE4/qdvegESrbiLFnlojfbmJjP5QjOxu2N9w37iJfWuAkNgNyHuTVCiWuiG/tPdh/hzyRbZsrfyXJiXPFfagonHTgKvy3iJnkInH94BWPZVPbTeqND3aJMAox0gfAnwW+aMdZH/uhMj74Vg0wCxmT30BxzjN27ZuOpALeU/piv2ZvgZXvI1MtIzf1RSLiFsLczOdZnZuI5nridWTErW9IpamjcfOXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199018)(33656002)(54906003)(316002)(478600001)(52536014)(71200400001)(5660300002)(2906002)(8936002)(4326008)(66556008)(64756008)(6916009)(76116006)(8676002)(66946007)(66476007)(66446008)(7696005)(41300700001)(122000001)(86362001)(38070700005)(55016003)(38100700002)(186003)(26005)(6506007)(53546011)(9686003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDk1Yk5DL3ZnMFRHcGRQdFR2OWV2ZUEvZzhBd3JoRGowKzhTMjFRYy9WSzRP?=
 =?utf-8?B?QnoyR083VEgxdnZpMStmUGV6N2tIa2RSNUZrMGNtbmNrNmhVdnJOYlZoRC8r?=
 =?utf-8?B?MUpVMCtKWjBYeWxzaUdhNDhCNFpzdUt6RHlNNUZ4aHNDa0wzczlmZGE3clNW?=
 =?utf-8?B?ODJibHpjRHEwbDlreDk3REJ5c2dWSlhIdDVZanRMS1FlSGpqT0pNUWRGZjZS?=
 =?utf-8?B?WTdlWlF4UGdPb3FQbUNkMGdJKytrdTNSbnNLcXdnTzBmRjc5L3R3Sk1INmJk?=
 =?utf-8?B?TDQvWTF2LzFuQXI1eThhanlnYVNFTGYwSHZ5NHdFN01oR01KNGNTd1pIWGFR?=
 =?utf-8?B?WVRLTGlHZElUQ0R4Ty9wYzFwK0N4U2lBSXFndFU0S0xHNUpFRkl3RWNUWktp?=
 =?utf-8?B?NVFBYXEyQkxya0JXRTJQT0NGa210L3l2TWU1cmYvbG9pQjdEbExXR0hRdENn?=
 =?utf-8?B?YU9lNm5pQzN1ZnVRZlVyT1R2YzcyUnVjNUt4RWw1VjVPSFBUckhPWWw1NWJW?=
 =?utf-8?B?UzBGN05salUzWWRWK3h0SlZxRUZKV0FmMlZWNUUzTG9Cbm9TNWlNSU44YnJv?=
 =?utf-8?B?MnBUZkcvZHVNYUw5aFR6NVVUUVJ3ZVFYdlRnL0Z2OTVvNlEzMmZma25lOWV1?=
 =?utf-8?B?ekk3c2ZBVUJJTHlkZDFMOVIyWEpvZGIwMWd6RExFV0c1TDRQVUtMem03RlJL?=
 =?utf-8?B?SFJrdG1nbHVBRWNwVkZkS01SU3d0aVcrQVBDbFkyOGxZcE9QcExpZWxZSnhK?=
 =?utf-8?B?bnRtaXQ1YUt3aXl2YzAxMHBrUnV6VlNqR3ZLeGM0QWNnRFlKNXhIb1FBc3pY?=
 =?utf-8?B?L2pCdUgzQlFaL3oxZTdla1llSkZQdmpzYzczbHJrUGRQMk9nSmtzaUxJVE1Y?=
 =?utf-8?B?UmVYN2dnMmxVRzdrbG94cWR3VFFyZkFLTDJ4YVN2bFVwN0Z6ZzdFbHVCbGZZ?=
 =?utf-8?B?YlpLMzJwL3pyS0w3SnVZcnZuOXFzNWJBRDZSWXIrR2wrbEphZmZRVzAzcUp5?=
 =?utf-8?B?eXZ0M1lKNkllKzN0d0tQL1RsVUFyWWxNaUhvelA5S3NUNmNBa3d4VExaZmht?=
 =?utf-8?B?a2N6dHA0ZFcrRTI0aEJpRW9UQnVLbjZNcTZjR2VRU1JMMnQxRTMyZm9IRGNH?=
 =?utf-8?B?TUxsdkc5Y0VOVXpocXh2a0g4VE1yNXZHa3dVRWZVTkpUZWVKOUNRdnlRV2xN?=
 =?utf-8?B?d3V1ZmV1SjN4U2oyWWc2dWlJb1lPSmJBdWFXOE54VlJuQkNPNnNOeVJRd05z?=
 =?utf-8?B?RytHdlMzVjFoZldDeUVNbXVUdTFvTEh5WUdiYzZDNVFiWXpCSEdROG5LQi9H?=
 =?utf-8?B?L2g3TDZCNWYwZU13Ym90blozNGRkNlNwb0lwb1E3K1dmZ1J5aS9Dam1ld3NL?=
 =?utf-8?B?TGR2cDllUDVObGp4OSt2N2xySmNkZHRYZEJmb1JKQ1hQWUVzSDl4dFJMTWJo?=
 =?utf-8?B?ZXh1MVNMM2tXSHh2akNzcEEzemx0V0lVcVlEcC9zREpvWXFncHRSUHZ6eFZ0?=
 =?utf-8?B?UlRiV1hucmVRK2Rhc3lidnJYM0lUTW9iU0VvdUNkWXhxS0VEZnFWSnh4M0g0?=
 =?utf-8?B?Z0w1NU9xWjVITTYrdVAyQldHaFJ3OGtUbjN3allIS3NVSCtCeE10dUZJU003?=
 =?utf-8?B?SE9QY2tSb0lxejB5aFhsU3laYi9sb0RsV3JZYXdSSnZLL2tra2YxdEFDRTM2?=
 =?utf-8?B?VFhDcVZaQVExdk83VXJnT01nbFBGQjF1YnFXaCtpL3VKWTBrUTNFc05Gc3hN?=
 =?utf-8?B?QTZVSUFkREJFRW92RkxITmg2UjdTbXRVY200c3JOZnh4am9wZHlrZlBjc0w3?=
 =?utf-8?B?RVl0SjFhb0diOHR6MGpIVlRMQmdVMkxocjEzUHJLTmFuZDhGT2xVUWY2T3lS?=
 =?utf-8?B?MXRsM2xJTW1Kc2l1ek51b2U2Und0dUo0WkVtMEh0KytFK3l3Y2UyWDkxNjlP?=
 =?utf-8?B?M0NPMnVFTkFNdE1OOTNwSC9RVXl6ZjlPcEZFeUMwY0ZvS2ZBZGJIakQ1OGU4?=
 =?utf-8?B?V2x1bml6U3hpT0RZdFhQZGVuaGpyaUNBTlp4VllFN3lybmJIclV6Y1paazBo?=
 =?utf-8?B?VG9vSmQ5MmN3cU1XUmFZRktWVmh3bWNpRUthZzhGN0o0czlYR1dIWldzTTNi?=
 =?utf-8?Q?UJA8ZDYqb47b4NCH8neKgcJ3V?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765ed5f0-1cf6-44ac-02c2-08db2465f44f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 08:27:31.1860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XvIJIM0h9GVvu+KqaQsNMsIipuuvu+/WxNp0thAsgZ70vjPNBpcDQmUzMJQa8STjesYUX8BEqm2QDZNIlqkLNLXpnPKQcKry23oBkJjW/J4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8154
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMgVywNCg0KVGhhbmtzIGZvciBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY2IDAxLzEzXSBwaW5jdHJsOiBjb3JlOiBBZGQgcGluY3RybF9nZXRfZGV2aWNlKCkNCj4g
DQo+IE9uIFRodSwgTWFyIDksIDIwMjMgYXQgMzoxOeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEkgaGF2ZSBhbiBJUCB3aGljaCBkZXRl
Y3RzIHNob3J0IGNpcmN1aXQgYmV0d2VlbiB0aGUgb3V0cHV0IHRlcm1pbmFscw0KPiA+IGFuZCBk
aXNhYmxlIHRoZSBvdXRwdXQgZnJvbSBwd20gcGlucyAsd2hlbiBpdCBkZXRlY3RzIHNob3J0IGNp
cmN1aXQgdG8NCj4gPiBwcm90ZWN0IGZyb20gc3lzdGVtIGZhaWx1cmUuDQo+ID4NCj4gPiBwd20t
cGlucyBhcmUgaW52b2x2ZWQgaW4gdGhpcyBvcGVyYXRpb24uDQo+ID4NCj4gPiBGcm9tIHVzZXIg
c3BhY2Ugd2UgbmVlZCB0byBjb25maWd1cmUgdGhlIHR5cGUgb2YgcHJvdGVjdGlvbiBmb3IgdGhp
cw0KPiA+IHBpbnMgKGVnOiBkaXNhYmxlIFBXTSBvdXRwdXQsIHdoZW4gYm90aCBwd20gb3V0cHV0
cyBhcmUgaGlnaCBhdCBzYW1lDQo+IHRpbWUpLg0KPiANCj4gV2h5IGRvIHlvdSB3YW50IHRvIGRv
IHRoaXMgZnJvbSB1c2VyIHNwYWNlPw0KDQpUbyB0YWtlIGNhcmUgb2YgdGhlIGJlbG93IGZlYXR1
cmVzIHByb3ZpZGVkIGJ5IFBvcnQgT3V0cHV0IEVuYWJsZSBmb3IgR1BUKGEuay5hIFBXTSkNCihQ
T0VHKSBJUC4gDQoNClRoZSBvdXRwdXQgcGlucyBvZiB0aGUgZ2VuZXJhbCBQV00gdGltZXIgKEdQ
VCkgY2FuIGJlIGRpc2FibGVkIGJ5DQp1c2luZyB0aGUgcG9ydCBvdXRwdXQgZW5hYmxpbmcgZnVu
Y3Rpb24gZm9yIHRoZSBHUFQgKFBPRUcpLiANClNwZWNpZmljYWxseSwgZWl0aGVyIG9mIHRoZSBm
b2xsb3dpbmcgd2F5cyBjYW4gYmUgdXNlZFsxXS4NCg0KWzFdDQoNClVzZSBjYXNlIDEpDQril48g
SW5wdXQgbGV2ZWwgZGV0ZWN0aW9uIG9mIHRoZSBHVEVUUkdBIHRvIEdURVRSR0QgcGlucyAoaS5l
OiBkZXRlY3Qgc2hvcnQgY2lyY3VpdCBpbiBzd2l0Y2hpbmcgY2lyY3VpdA0KZXh0ZXJuYWxseSBh
bmQgdXNlIGFuIGV4dGVybmFsIHBpbihHVEVUUkdBIHRvIEdURVRSR0QpIHRvIGRpc2FibGUgdGhl
IG91dHB1dCBwaW5zIG9mIFBXTSkNCg0KVXNlIGNhc2UgMikNCuKXjyBPdXRwdXQtZGlzYWJsZSBy
ZXF1ZXN0IGZyb20gdGhlIEdQVCAoR1BUIGRldGVjdHMgc2hvcnQgY2lyY3VpdCBpbiBzd2l0Y2hp
bmcgY2lyY3VpdCBpbnRlcm5hbGx5IGFuZCANCmRpc2FibGUgdGhlIG91dHB1dCBwaW5zIG9mIFBX
TSkNCg0KVXNlIGNhc2UgMykNCuKXjyBSZWdpc3RlciBzZXR0aW5ncyhEZXRlY3Qgc2hvcnQgY2ly
Y3VpdCBpbiBzd2l0Y2hpbmcgY2lyY3VpdA0KZXh0ZXJuYWxseSBhbmQgdXNlIGludGVybmFsIHJl
Z2lzdGVyIHRvIGRpc2FibGUgdGhlIG91dHB1dCBwaW5zIG9mIFBXTSkNCg0KVGhlIGFkdmFudGFn
ZSBvZiBwcm92aWRpbmcgdGhlc2Ugb3B0aW9ucyBmcm9tIHVzZXIgc3BhY2UgaXMsIGl0IGlzIGZs
ZXhpYmxlLg0KUnVudGltZSB1c2VyIGNhbiBjb25maWd1cmUgdGhlIHVzZSBjYXNlIGhlIHdhbnRz
IHRvIHVzZSBmb3IgaGlzIHByb2R1Y3QuDQoNCitSb2IsICsgS3J6eXN6dG9mIEtvemxvd3NraQ0K
DQpJZiB3ZSBjYW5ub3QgZG8gaXQgaW4gdXNlciBzcGFjZSwgdGhlbiB3ZSBuZWVkIHRvIG1ha2Ug
aXQgYXMgcGFydCBvZg0KRHQgYmluZGluZ3MgYW5kIHVzZXJzIHdpbGwgZGVmaW5lIHRoZSB1c2Ug
Y2FzZSB0aGV5IG5lZWQgaW4gRFQuDQoNClNvbWUgb2YgdGhlIGZhaWx1cmUgY29uZGl0aW9ucyBp
biBzd2l0Y2hpbmcgY2lyY3VpdHMgYXJlIGxpa2UgYmVsb3cNCg0Kd2hlbiB5b3UgdXNlIFBXTSBw
dXNoLXB1bGwgY29uZmlndXJhdGlvbiB5b3UgU0hPVUxEIGhhdmUgYSBkZWFkIHRpbWUuDQpXaGVu
ICsgbW9zZmV0IGlzIHR1cm5lZCBvZmYgLSBtb3NmZXQgY2FuJ3QgYmUgaW1tZWRpYXRlbHkgdHVy
bmVkIG9uDQpiZWNhdXNlIHlvdSB3aWxsIGNyZWF0ZSBhIGRpcmVjdCBwYXRoIChzaG9ydCBjaXJj
dWl0KSBiZXR3ZWVuICsgYW5kIC0NCmFzIHBhcmFzaXRpYyBjYXBhY2l0YW5jZSB3aWxsIGxlYXZl
ICsgbW9zZmV0IHR1cm5lZCBvbiBmb3IgYSB3aGlsZSAuDQpUaGlzIHdpbGwgZGVzdHJveSB5b3Vy
IG1vc2ZldHMuDQoNCkRlYWQgdGltZSBpcyB0aGUgZGVsYXkgbWVhc3VyZWQgZnJvbSB0dXJuaW5n
IG9mZiB0aGUgZHJpdmVyIHN3aXRjaA0KY29ubmVjdGVkIHRvIG9uZSByYWlsIG9mIHRoZSBwb3dl
ciBzdXBwbHkgdG8gdGhlIHRpbWUgdGhlIHN3aXRjaA0KY29ubmVjdGVkIHRvIHRoZSBvdGhlciBy
YWlsIG9mIHRoZSBwb3dlciBzdXBwbHkgaXMgdHVybmVkIG9uLiANClN3aXRjaGluZyBkZXZpY2Vz
IGxpa2UgTU9TRkVUcyBhbmQgSUdCVHMgdHVybiBvZmYgYWZ0ZXIgYSBkZWxheSANCndoZW4gdGhl
IGdhdGUgZHJpdmUgaXMgdHVybmVkIG9mZi4gSWYgdGhlIG90aGVyIHN3aXRjaCBvbiB0aGUgaGFs
Zg0KYnJpZGdlIGlzIHR1cm5lZCBvbiBpbW1lZGlhdGVseSwgYm90aCB1cHBlciBhbmQgbG93ZXIg
c3dpdGNoZXMgbWF5IGJlIA0KaW4gYSBjb25kdWN0aXZlIHJlZ2lvbiBmb3IgYSBicmllZiBtb21l
bnQsIHNob3J0aW5nIHRoZSBwb3dlciByYWlsLiANCkluIG9yZGVyIHRvIGF2b2lkIHRoaXMsIGEg
ZGVhZCB0aW1lIGlzIG1haW50YWluZWQgYmV0d2VlbiB0dXJuaW5nIG9mZg0Kb2Ygb25lIHN3aXRj
aCBhbmQgdHVybmluZyBvbiB0aGUgb3RoZXIgaW4gYSBoYWxmIGJyaWRnZS4NCg0KUE9FRyBJUCBw
cm92aWRlcyB0aGUgYmVsb3cgcHJvdGVjdGlvbnMsDQoNCjEpIFdoZW4gdGhlIEdUSU9DQSBwaW4g
YW5kIHRoZSBHVElPQ0IgcGluKFBXTSBwaW5zKSBhcmUgZHJpdmVuIHRvIGFuIGFjdGl2ZSBsZXZl
bCBzaW11bHRhbmVvdXNseSwgdGhlDQpQV00gZ2VuZXJhdGVzIGFuIG91dHB1dC1kaXNhYmxlIHJl
cXVlc3QgdG8gdGhlIFBPRUcuIFRocm91Z2ggcmVjZXB0aW9uIG9mIHRoZXNlIHJlcXVlc3RzLA0K
dGhlIFBPRUcgY2FuIGNvbnRyb2wgd2hldGhlciB0aGUgR1RJT0NBIGFuZCBHVElPQ0IgcGlucyBh
cmUgb3V0cHV0LWRpc2FibGVkDQoNCjIpIFBXTSBvdXRwdXQgcGlucyBjYW4gYmUgc2V0IHRvIGJl
IGRpc2FibGVkIHdoZW4gdGhlIFBXTSBvdXRwdXQgcGlucyBkZXRlY3QgYSBkZWFkIHRpbWUgZXJy
b3INCm9yIHNob3J0IGNpcmN1aXQgZGV0ZWN0aW9uIGJldHdlZW4gdGhlIG91dHB1dCB0ZXJtaW5h
bHMNCg0KPiANCj4gSXQgc291bmRzIGxpa2Ugc29tZXRoaW5nIHRoZSBrZXJuZWwgc2hvdWxkIGJl
IGRvaW5nLg0KDQpJZiB3ZSBjYW5ub3QgZG8gdGhlIGFib3ZlIHVzZSBjYXNlc1sxXSBpbiB1c2Vy
IHNwYWNlLCB0aGVuIHdlIG5lZWQgdG8gbWFrZSBpdCBhcyBwYXJ0IG9mDQpEdCBiaW5kaW5ncyBh
bmQgaXQgd2lsbCBiZSBmdWxseSB0YWtlbiBjYXJlIGluIGtlcm5lbC4NCg0KPiANCj4gVGhlIGtl
cm5lbCBoYXMgYSBQV00gc3Vic3lzdGVtLCBhbmQgYSBwaW4gY29udHJvbCBzdWJzeXN0ZW0sIGFu
ZCB3ZSBkb24ndA0KPiBldmVuIGhhdmUgYSB1c2Vyc3BhY2UgQUJJIGZvciBwaW4gY29udHJvbC4N
Cj4gUGluIGNvbnRyb2wgaXMgZGVzaWduZWQgdG8gYXZvaWQgZWxlY3RyaWNhbCBkaXNhc3RlcnMg
YW5kIGEgZHJpdmVyIGNhbiBhZGQNCj4gZnVydGhlciBwb2xpY3kgZm9yIHN1cmUuDQo+IA0KPiBJ
ZiB5b3Ugd2FudCB0byBhZGQgcG9saWN5IG9mIGRpZmZlcmVudCB0eXBlcyB0byBhdm9pZCBlbGVj
dHJpY2FsIGRpc2FzdGVyDQo+IGludG8gdGhlIHBpbiBjb250cm9sIGRyaXZlciwgZ28gYWhlYWQs
IGp1c3QgcnVuIGl0IGJ5IEdlZXJ0IHNvIGhlJ3Mgb24gYm9hcmQNCj4gd2l0aCB0aGUgaWRlYXMu
DQoNCk9LLiBHZWVydCBDYW4geW91IHBsZWFzZSBwcm92aWRlIHZhbHVhYmxlIHN1Z2dlc3Rpb24g
aG93IHRvIGFkZHJlc3MgdGhpcyB1c2UgY2FzZXNbMV0NCkFzIG1lbnRpb25lZCBhYm92ZT8NCg0K
Q3VycmVudGx5IFBpbiBjb250cm9sIGRyaXZlciBpcyB1c2VkIGZvciBpZGVudGlmeWluZyB0aGUg
cHdtIGRldmljZSBieSB1c2luZw0KcHdtIGduYW1lL2ZuYW1lIGFuZCBjb25maWd1cmluZyB0aGUg
dmFyaW91cyB1c2UgY2FzZXMgYXMgbWVudGlvbmVkIGFib3ZlWzFdDQpmb3IgYSBzeXN0ZW0uDQoN
Cj4gDQo+ID4gRm9yIHRoYXQsIHdlIG5lZWQgdG8gZmluZCBhIHByb3ZpZGVyIGRldmljZSAod2hp
Y2ggcHJvdmlkZXMgZ3B0LXBpbnMpLg0KPiA+DQo+ID4gcGluY3RybF9nZXRfZGV2aWNlKCkgcmV0
dXJucyAiY3VycmVudCBwcm92aWRlciBkZXZpY2UiIGFzc29jaWF0ZWQgd2l0aA0KPiBmbmFtZS9n
bmFtZS4NCj4gPiBJZiAiIGN1cnJlbnQgcHJvdmlkZXIgZGV2aWNlIiA9PSAicHdtIGRldmljZSIg
ZG8gdGhlIGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcywgc29y
cnkuDQoNCkFuZHkgbWVudGlvbmVkLCB0aGUgc2FtZSBmbmFtZS9nbmFtZSBjYW4gYmUgdXNlZCBp
biBtYW55ICpwaW4gY29udHJvbCogKHByb3ZpZGVyKSBkZXZpY2VzLg0KDQpCdXQgd2hlbiBjaGVj
a2luZyB0aGUgY29kZSgvc3lzL2tlcm5lbC9kZWJ1Zy9waW5jdHJsL3BpbmN0cmwtaGFuZGxlcyks
IGF0IGEgZ2l2ZW4gdGltZSwgDQp0aGVyZSB3aWxsIGJlIG9ubHkgb25lIGRldmljZSBjbGFpbXMg
UGlucyBhc3NvY2lhdGVkIHdpdGggYSBnaXZlbiBmbmFtZS9nbmFtZS4gDQoNCkN1cnJlbnRseSBw
aW5jdHJsX2dldF9kZXZpY2UoKSByZXR1cm5zIHRoZSBjdXJyZW50ICpwaW4gY29udHJvbCogKHBy
b3ZpZGVyKSBkZXZpY2UNCnRoYXQgY2xhaW1lZCBwaW5zIGFzc29jaWF0ZWQgd2l0aCBhIGdpdmVu
IGZuYW1lL2duYW1lLg0KDQpDaGVlcnMsDQpCaWp1DQo=
