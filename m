Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A25CA77C961
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 10:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbjHOIbW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 04:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235649AbjHOIbP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 04:31:15 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477E8127;
        Tue, 15 Aug 2023 01:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsaUtkNqUMI+6bsnQ0qBpUl1rwV0r6L9EHEgIImU0LikhwITCwsa7Cr3NR5Cqkj/P3uou6hMz0Fiea5zXU7AMIneFMjZ8g47AXPc946+KyE8KsiYI9JmuKU2CaoU/OZDIKeLKwaK62Yn6SyvlrUN+lYEuHJuMEz5iNgEsBtCgcQpbYfPjRf9qZ8u1SNPm3U1mFM9UAymh9t3Ipq45MRaC25x84+d9FLbPqoO/cFJLljny8IMg13TFnIvB6mrHQ+c8Rr0OaoY63vEtdBfVBmYzLdT5fA6vUUNK5KuKvHsIpv7ijzd0OPeLiEK3eQ02f9eL0iChmEn2sQSCoxXq3yB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT2rAp37W4c+iEROotczTPB4NcI1pTu0PC038xw0rlI=;
 b=XuaxaHUK5KZCkpbruwlPeR/UNg8EerRJqWjQgB+t3yrYpuytTlFtwdwVLVdg2tFt57ZE90+VXIqCql2XHeIgjo3B3V8CvQXToYQusf+LvSKLx1Si6GiSmNlYPxQQWSWFMiZ0y5MrITT2pMf7GrG5hDnJdTDNo2Z+vQrdTJgozy8HZJrCvzXk+fdQBS9NhESgWccmh8Nrm2mumlmR59ZnGXhmkoDCnfM0FFnVmaJIThAenHpcI0KXr8fzyEAY52Gx9aooB6Z5Gno9m2+1pkK2V2UQvKU8nM0xemGHpSvS49qLa6zZE+J68sigDMaCAJIzMGFqBMxWnDdE1pcicNUFjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT2rAp37W4c+iEROotczTPB4NcI1pTu0PC038xw0rlI=;
 b=Xl2qR9vcxJ1TsqZJlskHK/mYW5oKBA1bth5yXJo0tnaebqx/bkQpq9xxcJ/7PpofOY9BBcgZ0XDh2bHGiUX/1UMVb18zC0etHF3pY3T6pv7WMGJj/00SijGu7sf7iYlOMygs89YEkS0IpzAHeYcZe5+Qm+tuG/B3+Om8zfw7wHo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11657.jpnprd01.prod.outlook.com (2603:1096:400:3b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 08:31:03 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 08:31:03 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "stable@kernel.org" <stable@kernel.org>
Subject: RE: [PATCH v2 3/3] pinctrl: renesas: rza2: Add lock around
 pinctrl_generic{{add,remove}_group,{add,remove}_function}
Thread-Topic: [PATCH v2 3/3] pinctrl: renesas: rza2: Add lock around
 pinctrl_generic{{add,remove}_group,{add,remove}_function}
Thread-Index: AQHZz036zK2a2oi+20WJpLMRUqLUY6/rA1aAgAACPgA=
Date:   Tue, 15 Aug 2023 08:31:03 +0000
Message-ID: <OS0PR01MB59220111B6F878617D47372B8614A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230815075602.10473-1-biju.das.jz@bp.renesas.com>
 <20230815075602.10473-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdX8qChEqHPk57fjDy=uxPbk0GF+VzEjdcFB7Xhu_3z-5A@mail.gmail.com>
In-Reply-To: <CAMuHMdX8qChEqHPk57fjDy=uxPbk0GF+VzEjdcFB7Xhu_3z-5A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11657:EE_
x-ms-office365-filtering-correlation-id: e4dc217b-ef90-43bc-5442-08db9d69f62f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HZPO8tn8lFktzeImHHDTroRujD8byVIt3xF6IQxCGO5AKLZzP9XsL6lu71VY9FQjH0PwqqYw/DR8bnRRRtRDVeKGjrojs7Ka3oFsz48OT1NO6F3fWaO/FhBh5CaRyc9NaMN3f8Symb1dJ/EM0h9VifwmJTlH3pIURebDuUvhH80fof8IeIHY3F42B6BxdHHTBMr/CK5gUyzfAGVzPn+EZFT5H/sXyjq9QGT8NsHB/8vb+cQIF3uUeDIRKEfoHpjpEfmwsgnpKmfF2gAvnwLbtITUZ8eho+fEA7Et2b/8kQjYsgDOBZjZU1gXAhA823T7KVFIOhdKRUTZnd2TxhFtpT+r0aDhLSL2yZ9VmXeMSZ0LwpTzjBZQeKdJxJ3KqNh/1fOOj6gURhgMJacQ4ExGgkKkL7gX4+Um+QOXD/Pi/l+eMLNQsJi1qY4TUvPde5qwvQPS5t28+3mWQiS7HK3uvMqhc53FchbhhQ6uNfQF5WaG5zfjGxCF5H49IyuWqUloimv00lYFuuDN3Va2o5yVVCEAyBVJ4eKaL3nCDMmLDXeMoNXlVH3SxMt3wQd68EY/zvvnNXF0Lec4RO2QgKsO+AcrHfmpAHN/U9nNXvqp5vBULq1Ux3hHvMKxVx/ubcvf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199021)(186006)(1800799006)(2906002)(26005)(53546011)(6506007)(55016003)(83380400001)(38070700005)(478600001)(41300700001)(52536014)(5660300002)(7696005)(8936002)(8676002)(71200400001)(33656002)(86362001)(316002)(54906003)(66946007)(66556008)(66446008)(76116006)(66476007)(6916009)(4326008)(122000001)(38100700002)(64756008)(966005)(9686003)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R05KSitZdjNucjFXZ1graHJXMk5RU29VVUIvMm42UmlRVURKRnVsSFRTa3RR?=
 =?utf-8?B?bDJCVUd4NzVZdk0zT2JacWJTaDdIbUFtWmFrdkk2SEtiTnl6SUM4cUJvczNN?=
 =?utf-8?B?cjFCcEhhUXIrdGhGR08xRFFuanR6eUxNSktwbDBEY0pSWGNpdzRkUE1sVHRo?=
 =?utf-8?B?cXgzRmlBQ09ya0ZWbWNVMHZqbnE2cXlibXhxWG9PbmRXcGYza2UxaGtaMFox?=
 =?utf-8?B?QzRqRWRtOUU5ak5sUEE4Y2dIelVoSXFia04xRm95RVA2cjhUQnZRckdxbk9p?=
 =?utf-8?B?RjVyaytSUXoxWE5hWDdxK0VNV1pHZGRpajA5UUF3dTdvTGE4bGE5Nms3eURh?=
 =?utf-8?B?cTR5dW83SnpaU1pZUTg3NDFHbEdQNXQ2bm5sVk5mdDFodUhFTW15Z3dMQVEv?=
 =?utf-8?B?QmwwWEFCV2NSQlNLNnRuRUMxYXRWSkRBZVI1ZW0xNnJIZHpRZ1h6Y0crSkZY?=
 =?utf-8?B?cEViOFFrcU0xa2dLRGxxQ24rak1RdkNnbEwvWWJBdHFXNk5KMGNDTTlUczRy?=
 =?utf-8?B?NGVEZThTSEExbjRMb0s4SE9pUnZpbjFwaU01RjB5aG91RW5rcE9OWXN6aHJ0?=
 =?utf-8?B?dEtIN2k1MFFScXQvSDVMM0hFR2VpSlZOeURYQkREeTdwNlZsZHIyaHoxSmtL?=
 =?utf-8?B?N3IxTnJoczYxMzdHNGJqdTZ2VVZlcUYwZFJOMzV3ZHhoZGRuQlhrbGI4d3ZJ?=
 =?utf-8?B?OUFhR2R3VWJtQVRJYWZJekVuTXpFR2NWQmo1UGFLcDZwbWFjVFkwSnorZUxD?=
 =?utf-8?B?TlVUSEFTY1pHamFxaEFTOUpuYkNZa0U2L3FpOSthNDdYLzU2dnY5bDFhb1Y3?=
 =?utf-8?B?elRpcmNYT0NOYWxnbG02bndZYnJzcUhCbG1UZTVGREVuWUNmendSaFQ3dElV?=
 =?utf-8?B?VVE1VzQ0dktzRk9VaCtxZDZTY0NFQjZJNGRsK0xScEdNV2xDMjRlRWpVbDQ1?=
 =?utf-8?B?VGFtSXFiVnNQVWxSTUlVVnRzc0txZGU4RjEvNVFtdXRpbmE0Vjc4dmFLOW43?=
 =?utf-8?B?ekpCSk1mRUZLbHh5NlJlUkFTa2YveE5vV2RpY2dVcVd4aFpHZlhhRGMyZFYv?=
 =?utf-8?B?TGRiNFFMNjZBMnlkc2lFdUNmME1nYWlxUUdLaHRYUitDRUQxNDQzbVNXR1ZP?=
 =?utf-8?B?UFU3STE0K20wblRsOUhoaWxZNVlPL0xKeEN0Mld4WDFPbmdGZXErNlljUHgv?=
 =?utf-8?B?ZW5GVitUUkNhVmVJTE5mdDVQMmZuQVAyNUxKSThUa1k2MjNIU0hkVit1cEl4?=
 =?utf-8?B?ZkxYK2RsSnhuZHJaaEFHL0hsckNlTFZtejJKMHI0cDBINnVrbmRRMDF5bXo3?=
 =?utf-8?B?RnpnMlNvR0lqakcyS1dkc3ByZ1VLaUZHcmxhZHBSN3lrdHBlOGY4SlpmVmJz?=
 =?utf-8?B?cExFa0FabWdHcFFBd0RqREVsRitvcG1RbWl6a0t1NENJcENjNjhCS2ZMczlH?=
 =?utf-8?B?NEM3RDFmUzgwVDFpRWhCR25hRlZnMmNONnJTUk8zbU9VSGo3S1E4eDZVYi8z?=
 =?utf-8?B?aXpJRnA5SFdNdkk3OFVDWldSa0JvZDVVc3NRN2tWbGJqS0R1YW1YZWk2NmFm?=
 =?utf-8?B?TVJuTHNYQjdDRmpTbFY2V241L2VDMjh2VG9sWUZOakRPNHNkdC9pVDIvczNo?=
 =?utf-8?B?ZlM3QS8wditneVZ5UzZqbHY1dU96ZGF2NVkzc1lNQ3luenVGUzFCMFMxYVVo?=
 =?utf-8?B?MmVCSll6dWdCdWdDcEFsOVhPOXdIZnRXYVVWTzhjUHlMdDlOaGFSRllBdnor?=
 =?utf-8?B?Z2dpY1hpdGhUWHRLVm9hYWFSdzFaelREaGNZRWkzYll0NFoyZXEzK3FaVkdu?=
 =?utf-8?B?eHpWRTVLUFV2bGJHbnhSMStpOWR0eGdaczdkbUY2VWxLeDNwR3JpN3F6UTZy?=
 =?utf-8?B?UFI2Rkwwb0hZenQ1WkE4dWY3U1A1NU5FdEFrTHB4R3dDWkVzUzY5R2VTRzFK?=
 =?utf-8?B?K29nNHFXNEpONXRySjJoWkJBQWRQRUlLMFp4Nk9pMW1OcklmcDkrTFpPYkJ4?=
 =?utf-8?B?QjFHanpzbzRGdVJyVElsZVk1TUhTYllzWi91dnJ4Nk5VTjE2OHRhRVVacWlC?=
 =?utf-8?B?azVaRHBKTlJXaDZTS1daNitSekxwTmRtMXc0ZDZ4Zlh1aXF1Sk16ZUFzRGh3?=
 =?utf-8?Q?ZgGKu+vtVm5rbC4rxSCAN8QOZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dc217b-ef90-43bc-5442-08db9d69f62f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 08:31:03.0130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r2PU9k0h+qDNXHDZlDcHqVdAwckc8ljqBMYQ6PT10PC3iH6JIwAGthq0xeLbEUPlDD9wiNACbIpTBAddM9HfBILAfPu5Y3KoiTaU2h/sGaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11657
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMy8zXSBwaW5jdHJsOiByZW5lc2FzOiByemEyOiBBZGQgbG9jayBhcm91bmQNCj4g
cGluY3RybF9nZW5lcmlje3thZGQscmVtb3ZlfV9ncm91cCx7YWRkLHJlbW92ZX1fZnVuY3Rpb259
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBBdWcgMTUsIDIwMjMgYXQgOTo1NuKAr0FN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gVGhl
IHBpbmN0cmwgZ3JvdXAgYW5kIGZ1bmN0aW9uIGNyZWF0aW9uL3JlbW92ZSBjYWxscyBleHBlY3Qg
Y2FsbGVyIHRvDQo+ID4gdGFrZSBjYXJlIG9mIGxvY2tpbmcuIEFkZCBsb2NrIGFyb3VuZCB0aGVz
ZSBmdW5jdGlvbnMuDQo+ID4NCj4gPiBGaXhlczogYjU5ZDBlNzgyNzA2ICgicGluY3RybDogQWRk
IFJaL0EyIHBpbiBhbmQgZ3BpbyBjb250cm9sbGVyIikNCj4gPiBDYzogc3RhYmxlQGtlcm5lbC5v
cmcNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICAqIE5vIGNoYW5nZS4NCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMv
cGluY3RybC1yemEyLmMNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJs
LXJ6YTIuYw0KPiANCj4gPiBAQCAtMzU5LDEwICszNjEsMTMgQEAgc3RhdGljIGludCByemEyX2R0
X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJsX2Rldg0KPiAqcGN0bGRldiwNCj4gPiAgICAgICAg
ICAgICAgICAgcHNlbF92YWxbaV0gPSBNVVhfRlVOQyh2YWx1ZSk7DQo+ID4gICAgICAgICB9DQo+
ID4NCj4gPiArICAgICAgIG11dGV4X2xvY2soJnByaXYtPm11dGV4KTsNCj4gPiAgICAgICAgIC8q
IFJlZ2lzdGVyIGEgc2luZ2xlIHBpbiBncm91cCBsaXN0aW5nIGFsbCB0aGUgcGlucyB3ZSByZWFk
IGZyb20NCj4gRFQgKi8NCj4gPiAgICAgICAgIGdzZWwgPSBwaW5jdHJsX2dlbmVyaWNfYWRkX2dy
b3VwKHBjdGxkZXYsIG5wLT5uYW1lLCBwaW5zLCBucGlucywNCj4gTlVMTCk7DQo+ID4gLSAgICAg
ICBpZiAoZ3NlbCA8IDApDQo+ID4gKyAgICAgICBpZiAoZ3NlbCA8IDApIHsNCj4gPiArICAgICAg
ICAgICAgICAgbXV0ZXhfdW5sb2NrKCZwcml2LT5tdXRleCk7DQo+ID4gICAgICAgICAgICAgICAg
IHJldHVybiBnc2VsOw0KPiANCj4gUGxlYXNlIGRvIG5vdCBtaXggImNsZWFudXAgKyByZXR1cm4i
IGFuZCAiZ290byBjbGVhbnVwIiBzdHlsZSBpbiB0aGUgc2FtZQ0KPiBmdW5jdGlvbi4gIEkuZS4g
Z290byBuZXcgbGFiZWwgYmVsb3cuDQoNCk9LLg0KDQo+IA0KPiA+ICsgICAgICAgfQ0KPiA+DQo+
ID4gICAgICAgICAvKg0KPiA+ICAgICAgICAgICogUmVnaXN0ZXIgYSBzaW5nbGUgZ3JvdXAgZnVu
Y3Rpb24gd2hlcmUgdGhlICdkYXRhJyBpcyBhbg0KPiA+IGFycmF5IFBTRUwNCj4gDQo+ID4gQEAg
LTM5OCw2ICs0MDQsNyBAQCBzdGF0aWMgaW50IHJ6YTJfZHRfbm9kZV90b19tYXAoc3RydWN0IHBp
bmN0cmxfZGV2DQo+ID4gKnBjdGxkZXYsDQo+ID4NCj4gPiAgcmVtb3ZlX2dyb3VwOg0KPiA+ICAg
ICAgICAgcGluY3RybF9nZW5lcmljX3JlbW92ZV9ncm91cChwY3RsZGV2LCBnc2VsKTsNCj4gDQo+
IF5eIG5ldyBsYWJlbCBoZXJlLg0KT0suDQoNCj4gDQo+ID4gKyAgICAgICBtdXRleF91bmxvY2so
JnByaXYtPm11dGV4KTsNCj4gPg0KPiA+ICAgICAgICAgZGV2X2Vycihwcml2LT5kZXYsICJVbmFi
bGUgdG8gcGFyc2UgRFQgbm9kZSAlc1xuIiwgbnAtPm5hbWUpOw0KPiA+DQo+IA0KPiBUaGUgcmVz
dCBMR1RNICh1bmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGNyaXRpY2FsIGluIHRoZSByZWFs
IHJvb3QNCj4gY2F1c2Ugb2YgdGhlIGlzc3VlPykuDQoNClRoZSByb290IGNhdXNlIGlzIHJhY2Ug
Y29uZGl0aW9uIGhlcmUgaW4gcGN0bGRldi0+bnVtX2dyb3VwcyBhbmQNCnJhZGl4X3RyZWVfaW5z
ZXJ0IGFkZHMgd2l0aCB3cm9uZyBncm91cCBhbmQgc2VsZWN0b3IgZW50cnkuDQoNCmh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9waW5jdHJsL2Nv
cmUuYyNMNjU2DQoNCmZ1bmN0aW9uIDA6IHVzYjAsIGdyb3VwcyA9IFsgdXNiMCBdDQouLi4uDQou
Li4uLg0KZnVuY3Rpb24gOTogc3BpMSwgZ3JvdXBzID0gWyBzcGkxIF0NCmZ1bmN0aW9uIChudWxs
KTogQ09VTEQgTk9UIEdFVCBHUk9VUFMNCg0KQ2hlZXJzLA0KQmlqdQ0K
