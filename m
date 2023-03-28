Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D66E6CB7A7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 09:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjC1HIW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 03:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjC1HIV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 03:08:21 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8F61BE4;
        Tue, 28 Mar 2023 00:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR00VaEQyaBA47YON5kmDfZD7+PFJcB7Nd+CnqrYVwADmRSzulhcQQKedvgjIgeKdZah7F6H+1cJVcBwFXPdaNnaPeZj7a3psO/vrh2Ztd9qChvMCokAjT0+oOWLVnZyRrQ0hYhJ+IAk+7jJj4JOlMefAPZG7NuMf0TlwYNvVI+aVDcDme1yGbckz9tjp02VxOHGRBDFn4gFyxwVsmI3VBueIF0cvWGYFrQ9LGnpVqFc0uLd7oN1WG3bgi26R4vymlC8biile0OkqcVQQ835Z2x3x3bYR2OUc7fi3ChQBZhj5QJHHzHe6iGFxZuIaqBrXUrUcQ6JKbvEdNIC85CXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Lat2GTKAUkP6NF3qIzCyE+CrgG00TgjVSv2pYeGVVQ=;
 b=fkTFiPtEL5VoFRjtToq8vQ5XQ1qLdYtAzJbfm+XW40lcT6ViAqHCrCTMglkqYOKOHa1j6xYFAgzAVanwIU9wCJdS3L2FU1VeSoF934Ntb4bDIyQo0V8Dh736KvRBCrasa3X59Ac9ISiZb1XSNZNoAttclsdpEBd4rX81ZZt3BGidm46Zj6a7GBQoAmFugbXCiLdYxFS3PLQbugoDFhoOHu3HQIkwaL8kCL7M4e4M3JLnsfF1oo/Nrz8dOCwTovvoel5QxoiO7uiqBXr3Ng7jeDXCYTfV3Ny86h1/JLqCq1zEVRUntVdkagrWRWcQLn3NC9jcC0UiSinZXOd9pPtEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Lat2GTKAUkP6NF3qIzCyE+CrgG00TgjVSv2pYeGVVQ=;
 b=hw4EJXFVlmUIhkABIE+z60z8+JqTkq/BTQC75CF/mEaugtGxE/QZNmXcxMli8Wj5AnG6jkEpThH1WZ+JFLnmfZ8KT7QOeJLLXhNH/CxHgpJYHMvKzGSTwsFWG3q4cBIDn0C0iYbQoCZ3ejxqeWb8m/2t76NWSVMcTvUq3RS/jg4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11448.jpnprd01.prod.outlook.com (2603:1096:400:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 07:08:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 07:08:17 +0000
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
Thread-Index: AQHZUAoZhjJXzQRnckWhgNWWpo0zwa7uZ+eAgACJSoCAA3tbgIAABvEQgAAHBACAAACOAIAG1JkAgAChRoCAABC6gIAV5i2Q
Date:   Tue, 28 Mar 2023 07:08:16 +0000
Message-ID: <OS0PR01MB5922FD45B7368BBB51BA4A8886889@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com>
 <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
 <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com>
 <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CACRpkdZS5UKc7bDPs-zx_QyJU9GwJAhB7372oSC9tB-txgghtw@mail.gmail.com>
 <OS0PR01MB5922D0321A0779A8E78B96AA86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CACRpkdbLonPgBMD6f2Rc-E3sFtMhoc0Mzt00uTUmiAnx59JC2Q@mail.gmail.com>
In-Reply-To: <CACRpkdbLonPgBMD6f2Rc-E3sFtMhoc0Mzt00uTUmiAnx59JC2Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11448:EE_
x-ms-office365-filtering-correlation-id: 7d2f1ce9-baec-44c9-c5fb-08db2f5b3463
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QGMbqSs7YLWdfYILW4FUGnbi6wx6oyNfTfK/N8ZdnRCxiks0mhrz2IS94+ruhwEii3O4wNmeXGYPorAOBNJ6wriSi4cEf5X7oIGMmBESrH+oaxSrHFIe2mUX2orkB+GvO8sXujQC+U3OI9sCuqj9R1Y+lhkSj4g+jn4DzuQGEp9jj/v1AJ2dDxqsNtJdNU5mDizXMWTsGGtuelcQcYV14BrFzsNQP9Vn5zokJeI85ca+UxiHdYqKAg54N4zLBRk/MOZpzYjdXkun8DQQ/JFoqrnhGzEPx0+Mk1lLgbhCdmFEGKYc4rHdD84jxL53HkJEZe5Ljgyq+s3D55Caovcq5gP44D9/f5Bh8+LV0Ybhsiotu8Zg6EKZ/IBvgl+cHUEY+udIo5jRerChuXtd9exZVS7ONowuZ4PjdQzL7R948dmxToBXsr1kpWIuWVKJjV/jO8WFF0nTLDUndQnI8HTAC/WFU02R7gUmVTpi2KVFNSnegcEc+jFYpFBsPOY9mr4Y0G72az8WLPW8Ey2rcyf++/+++cIbBINjGqhOvE2KLxDW5ZFB44jn2asYJrUA9fEfPhku8kMyGcqDM+HgdrgbilqLhWNwdqD6Q3efMv3RGdlMK90MJ57kyfxt9me+RLBx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199021)(2906002)(71200400001)(7696005)(4744005)(38100700002)(478600001)(86362001)(38070700005)(316002)(54906003)(122000001)(5660300002)(66556008)(41300700001)(66446008)(64756008)(8676002)(4326008)(52536014)(76116006)(6916009)(66476007)(66946007)(8936002)(55016003)(186003)(33656002)(6506007)(53546011)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTVIWCtDb2FJdzFaQ21sVjVaTm5UOTVUREVZRUg2UGs3RFlXQzhBcEVQM0RK?=
 =?utf-8?B?ZGFmZFBIRDU5Nlp1UlFHTkl5R3VTS3RHaVJaWWxDazVodnkwalJhbE9Rb3ZD?=
 =?utf-8?B?T0ExUWFaL3YvQmNqcXZON1BZZmIxekxra2pJR1JRdDd1d3c3WFI2TmpETTVK?=
 =?utf-8?B?L2wxQi9mVSs2YjF4YUVYTW5kKzAvdlRiWmIwb2ZpYmtOTHBNRjhGTW1NQS9i?=
 =?utf-8?B?Tm5GdDJCVEZCckhMZEljZ0NvWjFBMmVEUUtjS0FBc3BraFBsZHJxQWVISGFW?=
 =?utf-8?B?aForU1pXZFNQTGlXYmwwTDIzQWxTZWlRbnRoRGFPWC8zcG5tQ0dHMWY1UTBr?=
 =?utf-8?B?NlVrVTlSU3ZBT0JhMmdEUFg2VnFuMWVzL2VZQjNTcEU2aFpBc3ZqZWFIS1NX?=
 =?utf-8?B?Z3ZQQ0xEOVNkWWFwUzdtZVdqUHB2TVpRTXU3TzE2dktiM05IZDM5ZUFrdEFq?=
 =?utf-8?B?Y1BOdWRIR3phZ1ZJbWI0cEdJaWphbm91YVpwOWY4WDkrcHpMZWpTMm5NZy8w?=
 =?utf-8?B?LzhOZEd1VjRqMzZvNi9wTzZHTlE5a1YyaVBPWEtVZ1FiRE1pakRWbDg1ZjdW?=
 =?utf-8?B?eXJYSFovcW0yVlFYbWh5UWRZcmZNWW91dDZ3ZGlFK1lDcmxsbU9kS0liL2Js?=
 =?utf-8?B?M2tTRU04T3dVckFyUFZKVklYRVlmR0RnVnhIMGhzTUo0bm5DN0lWWjBZRFp6?=
 =?utf-8?B?Nk42Q2tMc3pHUTlGMWhlWjRyc2o3U2dOOWx2bld0bklmT1FOUFJsa1habnh1?=
 =?utf-8?B?WWlSL3JOcFJSY01WOGxDL3JPaHRtRXVkeWpCMXBZL0lnRi9IcG1hNFNwR3By?=
 =?utf-8?B?ekhWVE4zMmdZeWdwaWk1YjlrVlNNWno2RlVoNmYxMFN6MlBiS2RkL3hRampO?=
 =?utf-8?B?VTJZSkJOOWE1c1RiMDV0RDNqRy9UdXpqVGFqdjR4bnRJUk5HQldpV005MmJt?=
 =?utf-8?B?c2x4blRjN1Btc0VsUWRoYWpoT3RyMEFRNlNFd1pmTzZVUHJKN0QyVWtBTVlr?=
 =?utf-8?B?TjZhOWx5YnhFWEN6Y3hRSmFwWTRLLzlaVlJQWVRudnJZR2VzYWYzejg3NTJG?=
 =?utf-8?B?TVJwdGFLdm53RXdWVVlubExCSko4T1c3NXN2WW9rcE9PeThqT3FKZU9xZ0Fx?=
 =?utf-8?B?LzhhT3A0OHFBR2VERUhaTkU4V1B3NFZGc3FIUFlyNHd0RHZ6OEo3dmFoSTZN?=
 =?utf-8?B?OTlHT1kzSFdyMjRQNUZXZUlBYnBZL09MUG4xV1g5SnpOOXFMbUladm5OS1RN?=
 =?utf-8?B?S05TUkRtYTViTis5YzlTYVZEaUNLcWt2cWNrb3QrekQ3R2lTQnNSMy9WVEZ0?=
 =?utf-8?B?dXowZzJydjFjT08yQ1MwNm1pNzc3U0l4QWx5ZlJJRmNNSFJ4YndlbWYyRG9m?=
 =?utf-8?B?Y0E3S2JtREpqZlJ1YzV6VEs4ZTdIZVo4ekNyck16OGtJZ1BTZW81YzU4QTVz?=
 =?utf-8?B?cDFmMVpjZVl3QjdadTlGbVhKbVltU040WG5iZWFodE0vZUJBUXIwN3VHR0dO?=
 =?utf-8?B?aEJHYnozSXpSZEN2TTI3dVhNSXVNa1RuY1JSMWxGZkZJdGtQSnRnNktsLzRu?=
 =?utf-8?B?TmNubGNScTMzeDNvdnNPZWl5OUVHWFhqVWNvN0ExT2taQ1VQVG43b1c5Z09j?=
 =?utf-8?B?b2RYQ0p2c3MraWQrUU9Oem5Sb3B4Sy84UmZQWHJ3aVArVVlmZVdxRWQ5UmRM?=
 =?utf-8?B?R2RBc1lMaWV0ZDY5OGF1WUVtdER3WDhQaUtCeXZHQ1FhbXlSN1VrMEhsMWpr?=
 =?utf-8?B?Wm4wTHg2a2dpK2ZURyt3Y05rTEdUWkJaQlNnU3NHSERCUU0walN1Q1RHQ2lJ?=
 =?utf-8?B?bDBCanZxOUdGTnMxNk5pWkpRN3F0b2NoakxueXlxeWdHcFg1U0trR24rUHZJ?=
 =?utf-8?B?SE9oVlpieHhLdkhmRWpINWxMTWlqa3dGVWxYVHRXN3lsd0d2Uk00TFJWWlBj?=
 =?utf-8?B?TGlKb3lSbURpVG9oUzVrT09XaE9jZFdFbmpNOTFLS082VUZoNkpLVG00M21a?=
 =?utf-8?B?QjJ3ZVcwMlJ0VjRyZkkyRWJiVEdWaTR1SXUyUXlBa05zTUdHWVU3K1YwaWJt?=
 =?utf-8?B?ajJsaG9Wak93cUEvbXBaWW5NMEhjZHVxZllIdjh1NTVpVzVMMjRWcUdYOEhT?=
 =?utf-8?Q?WMviUkfAWUwzLNsgBN4H0iNcJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2f1ce9-baec-44c9-c5fb-08db2f5b3463
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 07:08:17.0123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzRsqXSviO7LlstwUGzDvGEwMbNT6IIiq/0kezvcUhvtXMJNhsfg06wqmh8zwoB2+AO7E/akv4Oj+hFLSs1m7HxddvyE1FX2wwg5hYPBXyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11448
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMgV2FsbGVpaiwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gPGtyenlz
enRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAw
MS8xM10gcGluY3RybDogY29yZTogQWRkIHBpbmN0cmxfZ2V0X2RldmljZSgpDQo+IA0KPiBPbiBU
dWUsIE1hciAxNCwgMjAyMyBhdCA5OjI3IEFNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4gd3JvdGU6DQo+IA0KPiA+IElmIHdlIGNhbm5vdCBkbyBpdCBpbiB1c2VyIHNwYWNl
LCB0aGVuIHdlIG5lZWQgdG8gbWFrZSBpdCBhcyBwYXJ0IG9mDQo+ID4gRHQgYmluZGluZ3MgYW5k
IHVzZXJzIHdpbGwgZGVmaW5lIHRoZSB1c2UgY2FzZSB0aGV5IG5lZWQgaW4gRFQuDQo+IA0KPiBU
aGF0IHNvdW5kcyBsaWtlIGEgbXVjaCBiZXR0ZXIgaWRlYSA6KQ0KPiANCj4gVGhlIGtlcm5lbCBp
cyBmb3IgcHJvdGVjdGluZyBoYXJkd2FyZSBmcm9tIHVzZXJzIGFmdGVyIGFsbCwgYW5kIGl0IHNl
ZW1zIHlvdQ0KPiB3YW50IHRvIHNlbGVjdCBvbmUgb2YgdGhlc2UgdXNlIGNhc2VzIGFuZCBEVCBp
cyBleGNlbGxlbnQgZm9yIHN5c3RlbSBjb25maWcNCj4gbGlrZSB0aGlzLg0KPiANCj4gU28gSSB3
b3VsZCBzYXkgd29yayBhaGVhZCBvbiB0aGlzIHBhdGguDQoNCkFncmVlZC4gV2lsbCBzZW5kIG5l
eHQgdmVyc2lvbiBiYXNlZCBvbiB0aGlzIGFwcHJvYWNoLg0KDQpDaGVlcnMsDQpCaWp1DQo=
