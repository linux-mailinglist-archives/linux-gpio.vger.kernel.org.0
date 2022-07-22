Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFDB57DE43
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jul 2022 11:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236500AbiGVJ3x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jul 2022 05:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236810AbiGVJ3h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2022 05:29:37 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63AFCD0661;
        Fri, 22 Jul 2022 02:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaKg2U7ruYS3aexyrPre4VdNHALs2w+8QODXTaNis5JQS7uusUksPSHtO1DVOonYNGUZmYuk7vP5ogu8eamIBvhuEeaTES2bQQF5Zz+tyraHScYjZUlXSG7LUJucOWxt7Xv0fC6DR2RILpF78/0uBZCVJ4sv8G+llwEKiBZL614pLLu7ISR3yylPuwNgJgelXPMH//JwiXrKvI0plkydot5P1WnQ3sRaOs+Alvj+KWrzQmKCyEuz7jZ2BBMsQeQig+m3xEDI+XKsDmfTSN2NXqWSM0HpR95ppctrYbnuycyap3Vm/biuFQ3O/wqOPBhvKOmCDjpAioprS7mfv2ZNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ja9mGTERZxB1YfNeoO8HZUPtbN8/I0mhofW5/tvWqY=;
 b=jaICvyIOr5NKEk0Zyy25uL7ZD/ncNEh1OgGpbRtAhOZy4e11qbYam6dY4UhrSHP8steCBscMMU/71Ijl6aVXmQCiiK0huIo2skMizGERgm1d47Nj1Xt+IYRO5ULig0g6jyba4NBLIngSTJTQ/Y/p1iCILV+2X2PK4NeyGiCDBpdAOPh34brt9bLsyibhIuGfe7fROuvp3nEhd4IB2XZ20HEReARffCfdz7EJjD4C+QdS9gDNIxz+hnjTfZcbsaGgM65b1iQqldOp71bUlhuTyfK583Gw6OnVUBqzU1gUATag8dXrs+A6E2839d6rytBgDwdnStf5ISWestrNH+wu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ja9mGTERZxB1YfNeoO8HZUPtbN8/I0mhofW5/tvWqY=;
 b=Hib3mGEAPbMpMeTy9JYujFlfzaoXbLThiqsTNwde+r3yDwdh6qEXOGGxCggiXgUi+VevMvtCwcLGTPg5u5F/pSZ91Pskfqm8ZeDPbtV6F7TnOY3qB7gyzpecEDwwVpTbbbBuWuKA73WzR17w3QtcBOQReeALAv+qNzXgOt0Kgys=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB7571.jpnprd01.prod.outlook.com (2603:1096:400:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 09:18:42 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%6]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 09:18:42 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG
 binding
Thread-Topic: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG
 binding
Thread-Index: AQHYlsA8CcHBPp2Q3UiHwTGN6xabGq1/NVwAgAABOoCABOl6gIAAAPSwgAR4ZoCAAZCh0A==
Date:   Fri, 22 Jul 2022 09:18:42 +0000
Message-ID: <OS0PR01MB5922362CCEC0FD95A72B70A086909@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220713135528.1386594-1-biju.das.jz@bp.renesas.com>
 <20220713135528.1386594-2-biju.das.jz@bp.renesas.com>
 <24903621-358d-d380-76f4-6515c6313bbd@linaro.org>
 <OS0PR01MB5922CE20E15959AEF89C36D4868B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <1c96a873-81f7-02c4-56cc-f33a283329eb@linaro.org>
 <OS0PR01MB5922CD0716DF83F92BA63B5F868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <3b51e8c3-6ab4-373e-2c7d-29c02ffddfed@linaro.org>
In-Reply-To: <3b51e8c3-6ab4-373e-2c7d-29c02ffddfed@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98e188c6-c026-48ad-0a8d-08da6bc32c17
x-ms-traffictypediagnostic: TYWPR01MB7571:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9aT6CxQo4kd4POlFhrA5Mfj31qOcDGcn5LxTq3VYCy5eQTOiEAB1gZXKRJlb5WKRQkLf6OQ5zVYo9GuSkNU5X7DuLwCN5tXtXgTQ6HXeHTVDau3yZNSXS9XWOpNddPNK9pQ18gL65AbozDILOKwqptqy1l/KpHpdAFNj6zvu1/2YmuGKtuTwU0KkQpeWAyqLzH4CAFv7FegJJmoCD0U2n7SxW2jyLAPDtR/kKYgmyN6bWZI+SPYZPMaaueYYwqBKCJYOJvLAnP3jydJLlXgbz2E101gfm6fG3gAdBAu60jXLIB6LWLu4sqci7cIHtqTwCYCDLrKc2fG57IvXb+TqnwJvPdB4IuXjbvZXzDpQ/pxFTNHKyn7j7+c0EEav3Uh1leNFJIVYZlCQbEnOTZgG6xKk3vPwxdN5WyQNZzYCDmPrXLiVCB6CEqPmCIihEnIzVyfhSCD46d7HlkgOXTtWB9aEruJAHL5JWFEymWuJIH+ihvSGViLgeIRVB3nEy90ne0F/pI9WmuF1AoAyHQTHvDsfOl13hJp+6qjxuCvh3gMqRjKuNpH0w9TQZ2RF76p43WxRn+ZC56VNmDTyA0TsV/M2660yBKWTnWsvmcuHrh493cZUq2+JHYk+t8bYHgLcADEpSvU23s+kP1LX/zM2Jhzit6xR7UoAs0TjMZ26GUy5DvO/7RKYZ7Kjd5oGtGteZkQa19tjJFXXJ9RTrJ3vYu/I6Gu/Gtea0/8NZQDJSP/G0O3DPjE5XkaKQPsH4eLNkDBGvbLiQgR8y/CdsoTeTQY8aPhYcEY/qqIdcNinaSViVCTsW8P/4q4WXEavuYQ2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(5660300002)(2906002)(6506007)(8936002)(52536014)(38100700002)(122000001)(38070700005)(8676002)(76116006)(107886003)(83380400001)(186003)(316002)(54906003)(110136005)(66476007)(71200400001)(66946007)(66446008)(4326008)(66556008)(64756008)(7696005)(26005)(86362001)(9686003)(53546011)(41300700001)(33656002)(55016003)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dERQSEFkRzkxMU5xckxxaWJJQkFEbTFTS0FBQjB5aXF5MXFuMFZhUm81WVBp?=
 =?utf-8?B?VHhNN09kSnJTSkQ0SzJBV2ltUGp6WHhRTkpPb3ZxakJ4ZVVBeWRlWnRBRHZR?=
 =?utf-8?B?Qk9nWU8wVFBjaTZqSHA5akE1SlhneUliUE1NY2k2aFhobm4ybDlWYUpuUjlj?=
 =?utf-8?B?T2JDTE5pL3RDZ1kwcVJMa1IxcVRPVnVwbDAxZVhWN0ZZTnBUQmVnSjRXYi81?=
 =?utf-8?B?T1pKUDZtMmdCeWxtZkMvMUJ1cUVWYVBOYzZGbDd5UVh1Z0hvUTk4VGN3K05P?=
 =?utf-8?B?bE0zck1lZkZBdFZnOVA2aWpKR2M0VkRlRGQ0dTlVNlBmdjhZYU1vemNEWGxu?=
 =?utf-8?B?bDVaUklHeGlkTTZGU1IrVlNQNVNlUDJ4RDNabXgvQVRZbFRVZmdrcHNZUmpR?=
 =?utf-8?B?cDBDendTN2V4bjJsMTZnU05DTzYzQW9vNTF3Vm9QN1ltKzFtVGI3UDdoK0Jk?=
 =?utf-8?B?cnA5cThsalhuTnJuVUVOekQxc2JvSXJ3M3lpYjFxTHhIRm8zVG9VZUR3ZHli?=
 =?utf-8?B?SHFJMSttaDZhZTJvTVNKdzVWWnRETFREOHE5VlpEbmdKeU9rTitaelRGTTEx?=
 =?utf-8?B?TWZDc2wvOVNoTG5xeVZyZ1Z0aFc2RkNJcWlhdHdUZkt0MzdqMFQ3dk9nZmU3?=
 =?utf-8?B?OFd3bVZDd1pBYWo4SS9vdWluQVpDNGozM08rUDlRTkl5ckFwQlZ1OFRtOWJn?=
 =?utf-8?B?T0UwM1k3WmJCRGJ3NjNQdHVPeUtiVFM0aStialhNNXVmekloekcycWxoenZx?=
 =?utf-8?B?Y2srd2twSkZJek5tTXQ3VHV5Q1ZjRGpyemx5UWF2c0cvdndpaFhKRzNPSzNN?=
 =?utf-8?B?THcraGp1VFM1YXRJdlFXV3NnV25yMENXUHFVVFcrTlJ2MEpadDRtS29lcm9l?=
 =?utf-8?B?MWhCOWFPWU9QR0RNTHhlVWtONEs5d05ycHVvcEdOc3Q5NC81UEd3akVHVmkw?=
 =?utf-8?B?cjlDaHJDWW0xNENFK3FTQUdFR3BDdzNMVko5NnhXSFJvcWphU1NEanliRXBJ?=
 =?utf-8?B?eFVLNTkxMnBJR0RHVExBb3BVK3AzWHFNRnczMlRSZTEvbWowQWdjNlFpV2RQ?=
 =?utf-8?B?aGZQNy9XaWh4Sjk0OG9USlgyb2xvVFRyS3I2U2gvRWxPNFhKSEdpc3B5dmlL?=
 =?utf-8?B?NG16bEZOQ2g1dFYwbkVSa2oxZGI2czdrMWc5dCtWdmxtMWlRajRHNXVaSS9R?=
 =?utf-8?B?NEVlUTZWWTJqSXZFMHpiLzlEMmhkYndDMHJiMWozYVVLSkNwbTBsOVpucDha?=
 =?utf-8?B?K3N2UiszSVczZm84NHVWQmZxY2JmRVVLK0JndktLVWNUV1JmQ25rak9hU0Zl?=
 =?utf-8?B?LzVQbldYdjJPNS9mcVNxWG5FQjhlaHIxMkpGVEUxekpxVStGYThySFJLcXlU?=
 =?utf-8?B?QTJZRVRYSXJWUy9xNG5sRC9CWGhDa3BJZHorSGVxQTRsMUJwTytELzNzZDZ3?=
 =?utf-8?B?ZlROOW00WEF6Vk54YnpHQmR2b2JmdmNyTlA3d1EzUDE0ZHRSRjNvbytNOTY3?=
 =?utf-8?B?Y3Z4bktFOFk1UTJSVWlYWFN0SGx4M0ZZYXVNR1BkNE4xY1ZVbVR3SjF6alNy?=
 =?utf-8?B?Wnhsc3htRkpLZGcvVlJiSlFRb2xRalplL2VPc0hDRW9nbjR0RVJ0cjJudDVT?=
 =?utf-8?B?R3laRDVzZ1FqRlBCMXhtOEttWE5pT3kvMnJ6VUNTaWNBRXJLRFFZdCtzam11?=
 =?utf-8?B?bWErY1ZKQ0dvbmNibGQ1c3FtV0ZtQytpKzRRcVdtYU1XVGYyblZjdmVHeEI4?=
 =?utf-8?B?R1FvN2lub1MxOXpDS3VkV0szOEtCaEx5cFJvaVgzMGU4eUZuejlJaEs1aVBD?=
 =?utf-8?B?MTlNdnJJeUNBWnIxdHd5SUpIRFl0a1E4TCtvZk9qSXQ4M3NFTmsyNUlMeU9z?=
 =?utf-8?B?aUs3NTcvU3grdFJOOFdLb0cxQ01ycmluSFFxNVJsMVNBdUtpR0ppaWR4S1o1?=
 =?utf-8?B?OC8rY2JIdjRINDc0YUZ3eWdZTXM5a0pqQ3JCRVk2dC9PQ2tCVThpMVlXZDN3?=
 =?utf-8?B?eDBzTTlRdDF5WmV5MjBNaW9rZUxCdmF6UlZVRk54MWxPb1NKK0tBQzVjS2wy?=
 =?utf-8?B?VTVTODJBMjZ0ZlVlYWNyaTZ0YnFYekRueXFsL2pTbmdaSUFLY01la1VGTS9y?=
 =?utf-8?B?TkY3Znkvbm1CYjJsOHB5ZTlvdHJ1Nzc0SjhUSzVGcENQeFRNcUUvdFRUc3pX?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e188c6-c026-48ad-0a8d-08da6bc32c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 09:18:42.8535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oHAiuVBDS6DsoTFDWVnJjELI+D/EeDPFHSMLMl2HHrRsMv63nNZfGWeHwg1sFZFKl7hARKImR5V4lmHUdIVawBRUalvOtVYE4C+0uk1zMr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7571
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiByZW5lc2FzOiBB
ZGQgUlovRzJMIFBPRUcNCj4gYmluZGluZw0KPiANCj4gT24gMTgvMDcvMjAyMiAxNToxMywgQmlq
dSBEYXMgd3JvdGU6DQo+ID4gSGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCj4gPg0KPiA+PiBTdWJq
ZWN0OiBSZTogW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6IHBpbmN0cmw6IHJlbmVzYXM6IEFkZCBS
Wi9HMkwNCj4gPj4gUE9FRyBiaW5kaW5nDQo+ID4+DQo+ID4+IE9uIDE1LzA3LzIwMjIgMTI6MTcs
IEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4gSGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCj4gPj4+DQo+
ID4+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gPj4+DQo+ID4+Pj4gU3ViamVjdDogUmU6
IFtQQVRDSCAxLzJdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiByZW5lc2FzOiBBZGQgUlovRzJMDQo+
ID4+Pj4gUE9FRyBiaW5kaW5nDQo+ID4+Pj4NCj4gPj4+PiBPbiAxMy8wNy8yMDIyIDE1OjU1LCBC
aWp1IERhcyB3cm90ZToNCj4gPj4+Pj4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUg
UlovRzJMIFBvcnQgT3V0cHV0IEVuYWJsZSBmb3IgR1BUDQo+ID4+Pj4gKFBPRUcpLg0KPiA+Pj4+
Pg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+PiBSRUYtPnYxOg0KPiA+Pj4+PiAgKiBNb2RlbGxl
ZCBhcyBwaW5jb250cm9sIGFzIG1vc3Qgb2YgaXRzIGNvbmZpZ3VyYXRpb24gaXMgaW50ZW5kZWQN
Cj4gPj4+Pj4gdG8NCj4gPj4+PiBiZQ0KPiA+Pj4+PiAgICBzdGF0aWMuDQo+ID4+Pj4+ICAqIFVw
ZGF0ZWQgcmVnIHNpemUgaW4gZXhhbXBsZS4NCj4gPj4+Pj4gLS0tDQo+ID4+Pj4+ICAuLi4vYmlu
ZGluZ3MvcGluY3RybC9yZW5lc2FzLHJ6ZzJsLXBvZWcueWFtbCAgfCA2NQ0KPiA+Pj4+PiArKysr
KysrKysrKysrKysrKysrDQo+ID4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygr
KQ0KPiA+Pj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4+Pj4+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JlbmVzYXMscnpnMmwtcG9lZy55YW1sDQo+ID4+Pj4+
DQo+ID4+Pj4+IGRpZmYgLS1naXQNCj4gPj4+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGluY3RybC9yZW5lc2FzLHJ6ZzJsLXBvZWcueWFtDQo+ID4+Pj4+IGwNCj4gPj4+
Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yZW5lc2FzLHJ6
ZzJsLXBvZWcueWFtDQo+ID4+Pj4+IGwNCj4gPj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
Pj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi43NjA3ZGQ4N2ZhNjgNCj4gPj4+Pj4gLS0tIC9kZXYv
bnVsbA0KPiA+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGlu
Y3RybC9yZW5lc2FzLHJ6ZzJsLXBvZWcNCj4gPj4+Pj4gKysrIC55DQo+ID4+Pj4+ICsrKyBhbQ0K
PiA+Pj4+PiArKysgbA0KPiA+Pj4+PiBAQCAtMCwwICsxLDY1IEBADQo+ID4+Pj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwN
Cj4gPj4+Pj4gKzEuMg0KPiA+Pj4+PiArLS0tDQo+ID4+Pj4+ICskaWQ6DQo+ID4+Pj4+ICsNCj4g
Pj4+Pj4gK3RpdGxlOiBSZW5lc2FzIFJaL0cyTCBQb3J0IE91dHB1dCBFbmFibGUgZm9yIEdQVCAo
UE9FRykNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArbWFpbnRhaW5lcnM6DQo+ID4+Pj4+ICsgIC0gQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4+PiArDQo+ID4+Pj4+ICtk
ZXNjcmlwdGlvbjogfA0KPiA+Pj4+PiArICBUaGUgb3V0cHV0IHBpbnMgb2YgdGhlIGdlbmVyYWwg
UFdNIHRpbWVyIChHUFQpIGNhbiBiZSBkaXNhYmxlZA0KPiA+Pj4+PiArYnkgdXNpbmcNCj4gPj4+
Pj4gKyAgdGhlIHBvcnQgb3V0cHV0IGVuYWJsaW5nIGZ1bmN0aW9uIGZvciB0aGUgR1BUIChQT0VH
KS4NCj4gPj4+Pj4gK1NwZWNpZmljYWxseSwNCj4gPj4+Pj4gKyAgZWl0aGVyIG9mIHRoZSBmb2xs
b3dpbmcgd2F5cyBjYW4gYmUgdXNlZC4NCj4gPj4+Pj4gKyAgKiBJbnB1dCBsZXZlbCBkZXRlY3Rp
b24gb2YgdGhlIEdURVRSR0EgdG8gR1RFVFJHRCBwaW5zLg0KPiA+Pj4+PiArICAqIE91dHB1dC1k
aXNhYmxlIHJlcXVlc3QgZnJvbSB0aGUgR1BULg0KPiA+Pj4+DQo+ID4+Pj4gU2hvdWxkbid0IHRo
aXMgYWxsIGJlIHBhcnQgb2YgR1BUPyBJcyB0aGlzIGEgcmVhbCBzZXBhcmF0ZSBkZXZpY2UNCj4g
Pj4+PiBpbiB0aGUgU29DPw0KPiA+Pj4NCj4gPj4+IE5vLCBJdCBpcyBzZXBhcmF0ZSBJUCBibG9j
aywgaGF2aW5nIGl0cyBvd24gcmVnaXN0ZXIgYmxvY2ssDQo+ID4+PiBpbnRlcnJ1cHRzDQo+ID4+
IGFuZCByZXNldHMuDQo+ID4+Pg0KPiA+Pj4gUGxlYXNlIHNlZSBSRkMgZGlzY3Vzc2lvbiBoZXJl
WzFdDQo+ID4+Pg0KPiA+Pj4gWzFdDQo+ID4+Pg0KPiA+Pj4+DQo+ID4+Pj4+ICsgICogUmVnaXN0
ZXIgc2V0dGluZ3MuDQo+ID4+Pj4NCj4gPj4+PiBUaGlzIGlzIGNvbmZ1c2luZy4uLiBzbyB5b3Ug
Y2FuIHVzZSBQT0VHIHRvIG1lc3MgdXAgcmVnaXN0ZXJzIG9mDQo+ID4+Pj4gR1BUIGluZGVwZW5k
ZW50bHksIHNvIEdQVCBkb2VzIG5vdCBrbm93IGl0Pw0KPiA+Pj4NCj4gPj4+IFBPRUcgZG9lcyBu
b3QgbWVzcyB1cCByZWdpc3RlcnMgb2YgR1BULiBJdCBpcyBiYXNpY2FsbHkgZm9yDQo+IHByb3Rl
Y3Rpb24uDQo+ID4+Pg0KPiA+Pj4gVXNpbmcgUE9FRyByZWdpc3RlciwgaXQgaXMgcG9zc2libGUg
dG8gZGlzYWJsZSBHUFQgb3V0cHV0IHdpdGhvdXQNCj4gPj4+IHRoZQ0KPiA+PiBrbm93bGVkZ2Ug
b2YgR1BULCBhZnRlciBjb25maWd1cmluZyB0aGUgT3V0cHV0IGRpc2FibGUgc291cmNlIHNlbGVj
dA0KPiA+PiBpbiB0aGUgR1RJTlRBRCAoR2VuZXJhbCBQV00gVGltZXIgSW50ZXJydXB0IE91dHB1
dCBTZXR0aW5nIFJlZ2lzdGVyKQ0KPiA+PiByZWdpc3RlciBwcmVzZW50IGluIEdQVC4NCj4gPj4N
Cj4gPj4gVGhlbiB3aGF0IGRvZXMgaXQgbWVhbjoNCj4gPj4gIi4uLmZvbGxvd2luZyB3YXlzIGNh
biBiZSB1c2VkLiBSZWdpc3RlciBzZXR0aW5ncy4iDQo+ID4+IEkgY2Fubm90IHBhcnNlIGl0Lg0K
PiA+DQo+ID4gVGhyZXJlIDMgbWV0aG9kcyBtZW50aW9uZWQgaW4gY2hhcHRlciAxOS4zIG9mIFJa
L0cyTCBIVyBtYW51YWwgZm9yDQo+IE91dHB1dC1EaXNhYmxlIENvbnRyb2wgT3BlcmF0aW9uLg0K
PiA+ICJSZWdpc3RlciBzZXR0aW5ncyIgcmVmZXJyZWQgdG8gdGhlIDNyZCBtZXRob2QgYXMgbWVu
dGlvbmVkIGJlbG93Lg0KPiA+DQo+ID4gMTkuMyBPdXRwdXQtRGlzYWJsZSBDb250cm9sIE9wZXJh
dGlvbg0KPiA+IFRoZSBvdXRwdXQgb2YgdGhlIEdUSU9DeEEgYW5kIEdUSU9DeEIgcGlucyBjYW4g
YmUgZGlzYWJsZWQgd2hlbiBhbnkgb2YNCj4gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zIGFyZSBz
YXRpc2ZpZWQuDQo+ID4NCj4gPiAxKSBJbnB1dCBsZXZlbCBvciBlZGdlIGRldGVjdGlvbiBvZiB0
aGUgR1RFVFJHbiBwaW5zDQo+ID4gCVdoZW4gUE9FR0duLlBJREUgaXMgMSwgdGhlIFBPRUdHbi5Q
SURGIGZsYWcgaXMgc2V0IHRvIDEuDQo+ID4NCj4gPiAyKSBPdXRwdXQtZGlzYWJsZSByZXF1ZXN0
IGZyb20gdGhlIEdQVCBXaGVuIFBPRUdHbi5JT0NFIGlzIDEsIHRoZQ0KPiA+IFBPRUdHbi5JT0NG
IGZsYWcgaXMgc2V0IHRvIDEuDQo+ID4gVGhlIG91dHB1dC1kaXNhYmxlIHJlcXVlc3RzIGVuYWJs
ZWQgYnkgR1JQRFRFLCBHUlBBQkgsIGFuZCBHUlBBQkwgYml0cw0KPiA+IG9mIHRoZSBHVElOVEFE
IHJlZ2lzdGVyIGluIHRoZSBHUFQgYXJlIGFwcGxpZWQgdG8gdGhlIGdyb3VwIHNlbGVjdGVkDQo+
IGJ5IEdSUFsxOjBdIGJpdHMgb2YgdGhlIEdUSU5UQUQgcmVnaXN0ZXIuDQo+ID4NCj4gPiAzKSBT
U0YgYml0IHNldHRpbmcNCj4gPiBXaGVuIFBPRUdHbi5TU0YgaXMgc2V0IHRvIDEuDQo+ID4NCj4g
PiBUaGUgc3RhdGUgb2YgdGhlIEdUSU9DeEEgYW5kIHRoZSBHVElPQ3hCIHBpbnMgd2hlbiB0aGUg
b3V0cHV0IGlzDQo+IGRpc2FibGVkIGlzIGNvbnRyb2xsZWQgYnkgdGhlIEdQVCBtb2R1bGUuDQo+
ID4NCj4gPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IG5lZWQgYW55IGluZm8uDQo+IA0KPiBZ
ZXMsIG1vcmUgaW5mbyBpcyBuZWVkZWQgaW4geW91ciBwYXRjaC4gVGhlICIuLi5mb2xsb3dpbmcg
d2F5cyBjYW4gYmUNCj4gdXNlZC4gKC4uLikgUmVnaXN0ZXIgc2V0dGluZ3MuIiBkb2VzIG5vdCBl
eHBsYWluIGFueXRoaW5nLg0KDQpPayB3aWxsIHVwZGF0ZSBiaW5kaW5ncyB3aXRoIFBPRUdHbi5T
U0YgaW4gIlJlZ2lzdGVyIHNldHRpbmdzIiBzZWN0aW9uIHRvIG1ha2UgaXQgY2xlYXIuDQoNCkNo
ZWVycywNCkJpanUNCg0KDQo=
