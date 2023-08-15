Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6243F77CCC9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 14:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236645AbjHOMiE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 08:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjHOMhc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 08:37:32 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552EED1;
        Tue, 15 Aug 2023 05:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+hA6llScfCV+OgZz1x6wIJ6leD1nKvn084Z2pZ3UYE0mYzPxkFclqIuw4GM89GLZAQBdDAVxh5E4lA5Yf6qP8V61eyr4faTGyDmNrSD5RMPrxfZ7Q3ijDKKpk6dD1uk7mhjVJr29B3yOzcHNrAf1PqliF6vffqMgulrYDWgukXs2r29lJy4lFzUz4uI6Iz5TOKtZ7XsgLUL52wV4U63qoNaKYIx9AtFlvtP/WrpDKfxqqdAcDFNaDzj0IPRImYqR95MzxMC/GkKok/ZA5eOMzXHzIdhXXmbSbWZDVFYAp/knyzZyAP88ynSzpP42hsuMtD3uT7x+EOH2/CjydSNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5NVwrFj1LucgbSn9bCD52QKIfC+qNFLi9b5lfoCIek=;
 b=kVN4w5QL9d2Lkp3S27WKpQlLe5iAiX4z53ruF6OQ5yLEPwmIJtC/aKgK+4KR1b6SB1F2fQyABqSFZM6bgpMVeUhmmxeZ1Dd2RWUHOuj/UvMrn+xCBHpKBWWv7mSVDFpvZd5PGSLOFB6cwy7iFE8Knrikp8zJcPpEgueVqgPt1OTTyNX3PiHE++g+m347OjOOLjpla5n+bgqwozn+tPHLUxTptTSDFw3Rm8af5z7zTBOWFBy68Ju9QGbN2X8gVv7gxGX9O9fcKihaOTEaq5GdOf3Powq4U16KJj+Xwes2IQE+AA7q5ZU7Cqo7rG9/GG7rjvFun5z5X3J3z2pYtKDxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5NVwrFj1LucgbSn9bCD52QKIfC+qNFLi9b5lfoCIek=;
 b=pGObvMd2LOikYytB2GHhFFyMYiwdRIV0xnW0j1FgwFOFrUhECSi+2pqTBCyQVHI2fWm+lNe+b1T/7tTnA3uNgjhn0Yw3243J8cq/Y4lLPqUiGyT5aYt2M0d/LXoFso7Q2DMUwNkei/RN4j0vvwc/Tk6ZaaykzFV4Dzm8uRD4nis=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5595.jpnprd01.prod.outlook.com (2603:1096:404:805a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 12:37:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 12:37:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH v2 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer
 dereference in rzg2l_dt_subnode_to_map()
Thread-Topic: [PATCH v2 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer
 dereference in rzg2l_dt_subnode_to_map()
Thread-Index: AQHZz032Z0yk7csr30eu789PB1uYQ6/rAX8AgABKAsA=
Date:   Tue, 15 Aug 2023 12:37:23 +0000
Message-ID: <OS0PR01MB5922A8F6EC931BBFFD9658018614A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230815075602.10473-1-biju.das.jz@bp.renesas.com>
 <20230815075602.10473-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWvKnTjae=nb7KjgrzoxcQTWxhnCETp+tYgWc5SM1C5VA@mail.gmail.com>
In-Reply-To: <CAMuHMdWvKnTjae=nb7KjgrzoxcQTWxhnCETp+tYgWc5SM1C5VA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB5595:EE_
x-ms-office365-filtering-correlation-id: 9ee00bd5-c9fe-4f09-5921-08db9d8c5fde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FRUo7RMVJr+rdj1xCDdAcP4FwjGR/xtOSPgBHtqTet6PGqd4UQF41WP4/ijIZuBaV1qZcKBebpTpIFrIqKws4e2DO0EVKK7+NW8Y8c182B+GXqtbPfRBIncITd6JhLlPODsRisaJiSQsXcpbaF6mFpHaEAqpgukDyXG0RgucR2hoPv983+xf1Yke6U/Xq4cOhBHtojLlqsfrwOM4h1luW0IOKrroKztI7+AjQ8HN9e+OfVSg3ZT1GQizKU3kkC0DlQcfUYBnjPegrpmTuWCNazj5T5awRlx/iSYz8NjguYgtU6I5KmwOHF5lwBFnRZsJxQSULNAMF6K3PQQPV82M8HhZq17BuYXTbYtS3Q8KTIg3BDtsRWm4tMXbLpQuTqBfSmLobA5SQLwAXy1jZCYqkW9cm69EJRkrKlETy0iaxes7SS5aH5eDFDeZvaQBh6zG+njHv3+9NJxjJx4cSpnqbZ2C+e6hukdYzSqSnOeiFl4vCCZGlwX95glI9LmfaaPADdYQRAkpRs9+YG2Dl17l0Fh5Xps0NzERkbflKsjfQ3503jO2x+d9Ji9DdETXqSr7JNREkBjzzS1UJljyHAC4YnWA8Sd9zKhb5YhdfQsX5jqDMa9Q6oJThjXdpgUrdCUt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199024)(1800799009)(186009)(76116006)(2906002)(52536014)(5660300002)(38070700005)(54906003)(53546011)(107886003)(33656002)(38100700002)(6506007)(41300700001)(7696005)(66946007)(4326008)(8936002)(8676002)(316002)(9686003)(26005)(122000001)(64756008)(55016003)(83380400001)(71200400001)(478600001)(86362001)(66556008)(66476007)(66446008)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXBHK3BRRlU2Q3ZqY2lOL0c2aVU4UURoK2ZGWWJqUXZvT0l2bXdlbU1qYVhD?=
 =?utf-8?B?UEk2cCttRzdyR3RLL25lRWFHR29pdGVMdUU2WmxNZWZXMU12WCtSMXVuRCtF?=
 =?utf-8?B?NllzeWpVM3c0QkE4T0lkVlZHV3daTitYNXlKZGVNV01QVlBiWG5obGdtU2F4?=
 =?utf-8?B?Q0dIWWJBODJZYlUxc2NFVGxROHV5dENnSE1pWHBzYjNzeTVFNEoxQW1iN1FI?=
 =?utf-8?B?OVFiMlJ2WVIwYURXNTI5M2QrVDBnbmJDTVowVVVxSjlzYWcyREMwWFdmOEt4?=
 =?utf-8?B?bmkyY3FjUllJeklDZ3VacWROc25DRzA0a01nZXI5cThjYlRFbUhIZVlYbnd4?=
 =?utf-8?B?ei94Z2RSNTlTckREdjBERzJ3OE5BZS9yOGQxeVlPYW5ubXEzeXNBOXg4dk1K?=
 =?utf-8?B?ZTlySDF0MWlLYjd6RE9FZmhHNnFLQWR4cjlBaHo2bm1tRmxCL1pWdGVtdDMv?=
 =?utf-8?B?Wi90VWJLZG5VdmRKS1h4SXd4ZDVsWS9oTTZ0NjdOVjVic3Nrbk5MYjNmMC9C?=
 =?utf-8?B?RUJHaWxnMDVaU0dUOGxZY0NBWDQ0SG5PVUhyVmM3cVpWMEpCdHN3dDNDUmM5?=
 =?utf-8?B?Q0ZZcW50a0lEeTY3azlGbDUxcWJEYTM4L3VKR2lmajZzZUVsNGxVQXkwWGFN?=
 =?utf-8?B?T0xMZ3NFcE5VVk42d1dLZEpDOWh5NitjQlBLejVKSUloMzNTd0hDSkZCb1A1?=
 =?utf-8?B?Q0FzZEpud3MrczRvZFM2RE4yQTFNcTRYblp4QlZuMVNUWnhTc0xlUEpSV0Fw?=
 =?utf-8?B?dDVSV0laQVNNcFpnK0EzYmFqUXRyL2RkWnE3V0ZqSVplUmpLblVvZVp1Z3dB?=
 =?utf-8?B?YUZaQXFiZ2RIeDJXaUZRNnFiUllmQ2prcyt2VlQxQXMwZk8xRDk3TW01VmJB?=
 =?utf-8?B?eU5KZ0dSK1pnNXA4RUcrR3k0SVpVZHdqZWZLUHdYcEFDNzV0M2JFUC9yQjN2?=
 =?utf-8?B?ZEN4dE1VQUNYN1h2NlpMMjN0Tm5tZUo0WnpMY2c4VUVqcUtWWFFIcHpRSmgz?=
 =?utf-8?B?Y2trRnFNbW1CZnRUTS9ObmJTT1FXZXB3UFR1M015UWZsK0syTFUvUC9zUWcw?=
 =?utf-8?B?L3VCQVJIVDMyTVNHZDFsVEJpakxMNmxmeGRmSlVFU3g1UmNZMjNZTjNudEVC?=
 =?utf-8?B?TS9hWkdBZmFCYzJQSEpkNmVsNjVlVWV2MXFoY3hOSlpzbGhnOHRLN0RsTng5?=
 =?utf-8?B?UXJmWHY3WXVZWmlEOUo1Z0R5dThKWEdxUElsWjk5MWRKeWdKKzM1c2pPbytQ?=
 =?utf-8?B?UFpSQTZoTTYzeFBLWVpNcitoOFc1Wk1YeHd0RlNCS0JQcksvUisrVitTc1NX?=
 =?utf-8?B?ZzZ1Y0o1bER3eGtBV0RHekM0NWJRNi9XZ3llSjFJV3pBNXN5U0RJR05hRkpP?=
 =?utf-8?B?aE92YVpTQWwvQy9kblQ3ei9ScmU3OXhoVExmZ2ExODhYcm9iUExIRlJFb0dk?=
 =?utf-8?B?UjV5a2JIaGZUSWJKZTBSVVJOOTZCejI5SndVYzhoUkJaY1lwVnNvU21aVFBC?=
 =?utf-8?B?ejgzMllRL2NHTUxwK3AwNEJ5VW1ueklrREFCTWdCK2hBQTR0T0NuWkhOWDVl?=
 =?utf-8?B?dUdrV1djV1ZyTmdpbkdUeU8xbEtFWEJpWWRQMS8xdG1lSFl6V1FEYWNGNWg5?=
 =?utf-8?B?eGs0b3A0TzJHeFdvcmhXcGR2TS9Qbm80NkcrUnFjU3lRRXZKdS94ZDhTYjJM?=
 =?utf-8?B?TUpXTGk4d3VGaWZtRmRpQTBTTDlhK2lnTjc2cG5uTzlqSjlZOGVIeHFoWUg2?=
 =?utf-8?B?bWJDODhpa2xhRjY0RUxGMzhkZnplOEkxYUhZZWo2TlFXUEFSb2RCWG51QUZB?=
 =?utf-8?B?YnQ4TW5HVU1vOUxpTDR6UnJLZzBIK3BNazVrYk5DT0VEM2FJMmZqUnpwcm9z?=
 =?utf-8?B?ZDhiU3VxemN4dVBOTHF4b0c2R0J5dCtsK29pTWdsczVsenB1ZWpXUVpxbUt4?=
 =?utf-8?B?ZDFCYlYzYjA5djlZSzdPQjdvYWlhMUp4OUVsRkhGQlgxeFRvL0ZheGxzWEcx?=
 =?utf-8?B?cXhTUHdjUXBKazJ1TDJ6bFN0UVkvRkl3S3BlQXNRbmFxZ2FoQkNNZU9sb3pE?=
 =?utf-8?B?QlJmUldMNFFyZlc4QytkZTNwazN2MkpJVGRxZG4rMUVTdUlOYXZGZ3JmZE1v?=
 =?utf-8?Q?ZDX6pSjFH2aAXJHSdkQgl9x/f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee00bd5-c9fe-4f09-5921-08db9d8c5fde
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 12:37:23.2351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2l1KgcjTuXqrrTM1pibs/DSVd25UKSKYVhVTzoTB8d83lrqwAcXB84wi4PRXEc6bIfvzhn8CyawkyNfPV4CFa7HCOeZy8Bu038PMHK5cVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5595
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
UEFUQ0ggdjIgMS8zXSBwaW5jdHJsOiByZW5lc2FzOiByemcybDogRml4IE5VTEwgcG9pbnRlcg0K
PiBkZXJlZmVyZW5jZSBpbiByemcybF9kdF9zdWJub2RlX3RvX21hcCgpDQo+IA0KPiBIaSBCaWp1
LA0KPiANCj4gT24gVHVlLCBBdWcgMTUsIDIwMjMgYXQgOTo1NuKAr0FNIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRml4IHRoZSBiZWxvdyByYW5k
b20gTlVMTCBwb2ludGVyIGNyYXNoIGR1cmluZyBib290IGJ5IHNlcmlhbGl6aW5nDQo+ID4gcGlu
Y3RybCBncm91cCBhbmQgZnVuY3Rpb24gY3JlYXRpb24vcmVtb3ZlIGNhbGxzIGluDQo+ID4gcnpn
MmxfZHRfc3Vibm9kZV90b19tYXAoKSB3aXRoIG11dGV4IGxvY2suDQo+ID4NCj4gPiBDcmFzaCBs
b2dzOg0KPiA+ICBwYyA6IF9fcGlfc3RyY21wKzB4MjAvMHgxNDANCj4gPiAgbHIgOiBwaW5tdXhf
ZnVuY19uYW1lX3RvX3NlbGVjdG9yKzB4NjgvMHhhNA0KPiA+ICBDYWxsIHRyYWNlOg0KPiA+ICBf
X3BpX3N0cmNtcCsweDIwLzB4MTQwDQo+ID4gIHBpbm11eF9nZW5lcmljX2FkZF9mdW5jdGlvbisw
eDM0LzB4Y2MNCj4gPiAgcnpnMmxfZHRfc3Vibm9kZV90b19tYXArMHgzMTQvMHg0NGMNCj4gPiAg
cnpnMmxfZHRfbm9kZV90b19tYXArMHgxNjQvMHgxOTQNCj4gPiAgcGluY3RybF9kdF90b19tYXAr
MHgyMTgvMHgzN2MNCj4gPiAgY3JlYXRlX3BpbmN0cmwrMHg3MC8weDNkOA0KPiA+DQo+ID4gRml4
ZXM6IGM0YzQ2MzdlYjU3ZiAoInBpbmN0cmw6IHJlbmVzYXM6IEFkZCBSWi9HMkwgcGluIGFuZCBn
cGlvDQo+ID4gY29udHJvbGxlciBkcml2ZXIiKQ0KPiA+IENjOiBzdGFibGVAa2VybmVsLm9yZw0K
PiA+IFRlc3RlZC1ieTogQ2hyaXMgUGF0ZXJzb24gPENocmlzLlBhdGVyc29uMkByZW5lc2FzLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICAqIFVwZGF0ZWQgY3Jhc2ggbG9ncyBhcyBw
ZXIgc3VibWl0dGluZyBwYXRjaGVzIGRvYy4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEN
Cj4gDQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+
ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4gQEAg
LTExLDYgKzExLDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPiA+ICAj
aW5jbHVkZSA8bGludXgvaW8uaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+
ICsjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+
ID4gICNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPg0KPiA+IEBAIC0xNTMsNiArMTU0LDcgQEAgc3RydWN0IHJ6ZzJsX3BpbmN0
cmwgew0KPiA+ICAgICAgICAgdW5zaWduZWQgaW50ICAgICAgICAgICAgICAgICAgICBod2lycVtS
WkcyTF9USU5UX01BWF9JTlRFUlJVUFRdOw0KPiA+DQo+ID4gICAgICAgICBzcGlubG9ja190ICAg
ICAgICAgICAgICAgICAgICAgIGxvY2s7DQo+ID4gKyAgICAgICBzdHJ1Y3QgbXV0ZXggICAgICAg
ICAgICAgICAgICAgIG11dGV4OyAvKiBzZXJpYWxpemUgYWRkaW5nDQo+IGdyb3VwcyBhbmQgZnVu
Y3Rpb25zICovDQo+IA0KPiBJIGd1ZXNzIGl0J3Mgbm90IHRvbyBsYXRlIHRvIGFkZCBjb21tZW50
cyB0byB0aGUgdHdvIG90aGVyIGxvY2tzDQo+IChiaXRtYXBfbG9jayBhbmQgbG9jayk/DQoNCk9L
IHdpbGwgYWRkLg0KDQo+IA0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCB1bnNpZ25l
ZCBpbnQgaW9saF9ncm91cGFfbUFbXSA9IHsgMiwgNCwgOCwgMTIgfTsgQEANCj4gPiAtMzYyLDEw
ICszNjQsMTIgQEAgc3RhdGljIGludCByemcybF9kdF9zdWJub2RlX3RvX21hcChzdHJ1Y3QgcGlu
Y3RybF9kZXYNCj4gKnBjdGxkZXYsDQo+ID4gICAgICAgICAgICAgICAgIG5hbWUgPSBucC0+bmFt
ZTsNCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICsgICAgICAgbXV0ZXhfbG9jaygmcGN0cmwtPm11
dGV4KTsNCj4gDQo+IEkgdGhpbmsgdGhpcyBpcyB0b28gbGF0ZSwgYXMga3JlYWxsb2NfYXJyYXko
KSBhYm92ZSBoYXMgYWxyZWFkeSByZWxlYXNlZA0KPiB0aGUgb2xkIG1hcC4NCg0KT0sgd2lsbCBt
b3ZlIGtyZWFsbG9jX2FycmF5KCkgdG8gcmVkdWNlIGxvY2sgc2VjdGlvbiBhbmQgYWRkIGxvY2su
DQoNCj4gDQo+ID4gICAgICAgICAvKiBSZWdpc3RlciBhIHNpbmdsZSBwaW4gZ3JvdXAgbGlzdGlu
ZyBhbGwgdGhlIHBpbnMgd2UgcmVhZCBmcm9tDQo+IERUICovDQo+ID4gICAgICAgICBnc2VsID0g
cGluY3RybF9nZW5lcmljX2FkZF9ncm91cChwY3RsZGV2LCBuYW1lLCBwaW5zLA0KPiBudW1fcGlu
bXV4LCBOVUxMKTsNCj4gPiAgICAgICAgIGlmIChnc2VsIDwgMCkgew0KPiA+ICAgICAgICAgICAg
ICAgICByZXQgPSBnc2VsOw0KPiA+ICsgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJnBjdHJs
LT5tdXRleCk7DQo+IA0KPiBQbGVhc2UgYWRkIGEgbmV3IGxhYmVsIGJlbG93LCB0byBhdm9pZCBh
ZGRpbmcgYSBjYWxsIHRvIG11dGV4X3VubG9jaygpDQo+IGhlcmUuDQpPSy4NCj4gDQo+ID4gICAg
ICAgICAgICAgICAgIGdvdG8gZG9uZTsNCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+IEBAIC0zODAs
NiArMzg0LDggQEAgc3RhdGljIGludCByemcybF9kdF9zdWJub2RlX3RvX21hcChzdHJ1Y3QNCj4g
cGluY3RybF9kZXYgKnBjdGxkZXYsDQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gcmVtb3ZlX2dy
b3VwOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gKyAgICAgICBtdXRleF91bmxvY2soJnBjdHJs
LT5tdXRleCk7DQo+ID4gKw0KPiA+ICAgICAgICAgbWFwc1tpZHhdLnR5cGUgPSBQSU5fTUFQX1RZ
UEVfTVVYX0dST1VQOw0KPiA+ICAgICAgICAgbWFwc1tpZHhdLmRhdGEubXV4Lmdyb3VwID0gbmFt
ZTsNCj4gPiAgICAgICAgIG1hcHNbaWR4XS5kYXRhLm11eC5mdW5jdGlvbiA9IG5hbWU7IEBAIC0z
OTEsNiArMzk3LDcgQEAgc3RhdGljDQo+ID4gaW50IHJ6ZzJsX2R0X3N1Ym5vZGVfdG9fbWFwKHN0
cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwNCj4gPg0KPiA+ICByZW1vdmVfZ3JvdXA6DQo+ID4g
ICAgICAgICBwaW5jdHJsX2dlbmVyaWNfcmVtb3ZlX2dyb3VwKHBjdGxkZXYsIGdzZWwpOw0KPiAN
Cj4gXl4gbmV3IGxhYmVsIGhlcmUuDQoNCk9LLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4g
KyAgICAgICBtdXRleF91bmxvY2soJnBjdHJsLT5tdXRleCk7DQo+ID4gIGRvbmU6DQo+ID4gICAg
ICAgICAqaW5kZXggPSBpZHg7DQo+ID4gICAgICAgICBrZnJlZShjb25maWdzKTsNCj4gDQo+IEdy
e29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4g
DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
