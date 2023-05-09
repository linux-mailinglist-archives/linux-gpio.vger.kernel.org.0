Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6C786FCA44
	for <lists+linux-gpio@lfdr.de>; Tue,  9 May 2023 17:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235482AbjEIPb5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 May 2023 11:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjEIPb4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 May 2023 11:31:56 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2059.outbound.protection.outlook.com [40.107.13.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5192716
        for <linux-gpio@vger.kernel.org>; Tue,  9 May 2023 08:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiHACvUOC7fNzhflMqJbYb7hjXICEBbHjdHIADsk+Nr+llcOLUmRQLHRZlms1jU9gqSpCXwVphNQtx4ydyA7LD1OzteNAn8fUdj4cOsfS7PTjnEkajBNGkvxiZkRNsJh/HvdmHkv52xl97VRkK/+FM0tV0clz+4c0lyN+G/PBLM+1XK92hwj4IdtFJdILMx9uBskWAfcekCInjQJ6VcpD6Xn87wygw5dlYXlL2QRwIwL5RI9u4Ka0+iCnRyuJRMMYVL8fbR1M6UB4vvV5VQ3pK2r1KN6pUmUsYa1QDUSAhWLQzAthv+7rA/Y2+k4jrLh3UlSZ1LqTXNO5/02mtVtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYYDO/ZHjRPjJL3vkiHEy8a4MVknvqbiA7mPGilvZIo=;
 b=lvOTwUXNOW8Maz3DjHAxfQTKj0NciKC8SGkLxRMKxB49/EYSF2NHeb7v/VxrhoHN4mO06IIbLbW/RWvJOqkgiEpcC2zxg+RipNqCrTh0PtHt8b0GHrO5hB7XaJqq4ywCHaJmG/PFWxG0sQNT8/JRJKwuU06ba90mkr3B1xTbq07DJ10pEwyXBCSh9OkAqJsetAbXoq/8dOiRzc0DoCBqzSoyku/N0jI8jb9qrcBQy9jnyoXSmVDa2EAbYgI/n1silLZakGJb716gr4lZjxt+QCMWvymcf/U+4s8UfxXj2UChynfBmoszGTd3Jjw2EqPo7K/Dpnr+pT2DT4Zvdo7jZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYYDO/ZHjRPjJL3vkiHEy8a4MVknvqbiA7mPGilvZIo=;
 b=ce02nAc8dzHkfCqNa+DI8x/1uA+QXpJM8Y9GTQawBsgFw0Qd1WKqTG++crW9I22RRRjAu0dRczT09p06V99dWx2EjVTosJk9DSgxo/PbzggrPMq8dNljLzOUbRnYlruQRROsWqjX3sAbk58D8B1r4rIhqXY1RhuB3EhDsLGjurQ=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU2PR04MB8871.eurprd04.prod.outlook.com (2603:10a6:10:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 15:31:47 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 15:31:47 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        dl-linux-imx <linux-imx@nxp.com>,
        Fugang Duan <fugang.duan@nxp.com>
Subject: RE: [EXT] Re: [PATCH 1/1] gpio: mxc: use platform_get_irq_optional()
 to avoid error message
Thread-Topic: [EXT] Re: [PATCH 1/1] gpio: mxc: use platform_get_irq_optional()
 to avoid error message
Thread-Index: AQHZgeXE7VwULtYKukuHXGV0qREEM69RqMwAgABprXA=
Date:   Tue, 9 May 2023 15:31:46 +0000
Message-ID: <PAXPR04MB9185BFE399C00B2BEB3184C589769@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230508194555.1057007-1-shenwei.wang@nxp.com>
 <CAHp75VesbGkmG_7haH3LvHawA1Z3=TGv+w-kqF5nUkaTd5tfag@mail.gmail.com>
In-Reply-To: <CAHp75VesbGkmG_7haH3LvHawA1Z3=TGv+w-kqF5nUkaTd5tfag@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU2PR04MB8871:EE_
x-ms-office365-filtering-correlation-id: 26ed353b-7dcc-48fe-e7df-08db50a2803e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RYTtwgtwdT87fu37CFl9GwHmxGGLmYt61LtjvSJnlughtgwTDrlesDp+RcmLNLzGnG+0TcjrCH3EzZ5rncCzdZpOQ1b8fG1UR8WT7Ug0dqjjrUZnqPbfV7TaiNq4NRqetcYrb0c30UKiZOMFpM4P1Pg5vdyWpthD5qhYbSzdSaMKb0MWtK2in+A/XpqlFJQmGqsEUxjzCQCXdXGim/4//afOA3KpVdIGXeuEUD3gFk8BQ6Kg7RThAzs3X2mI9sITRgsC3DWjj7/vrbrqoz/iDZzUhg67orKudaeuB53JZc6TWHTIWSXJdx5g90EWRgizN72cQXbxoSMiX8j5xj7eh6iYAL0Xu7TP6hwbkGEJqCBQM1kC2B0GWleBvqyjfWg6hSQriViFH5rBtr81mpcEjhyCSPdJdSmltKo9F82JYyTsY7r4Gir+qyhqpnqvLbknYBoax6KEpJTVDVGUv0rvk0A9C6aiU1iS4UB5XkdNz59n1DLxQ4I3GoiHo336PwJF0QeLfRdCiSaAcOyRFwIggKTxuVd5NGUWE8kOfqvG1TiCAJPo/q/JNKC6/H6SDwXkxXGVjOC8xnJbvRzdVNm36HTDd81ybT2L9GNmllVICSq3QiS9+imRJir0GoLtV05n
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(86362001)(33656002)(316002)(54906003)(66946007)(66476007)(64756008)(4326008)(7696005)(76116006)(6916009)(66446008)(66556008)(478600001)(55016003)(8676002)(52536014)(2906002)(44832011)(5660300002)(8936002)(15650500001)(41300700001)(38100700002)(38070700005)(122000001)(186003)(53546011)(9686003)(6506007)(55236004)(26005)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QndPOUhyUmFscklZMEx2WHZwTjhyR0tBOXFnUVlsdEYxZXB2YnZXZFFSb0tw?=
 =?utf-8?B?OGx2TlJnakZyM3lLT2ltVE9zZEVOblN2MWpWL0cxWHk2QkZ1VVlWN0p5SmFQ?=
 =?utf-8?B?U1J5bjByTW5odkxnOFB3b1orVjZPM084d0Q4N1BsaHhhYkhSUzVvQi80L1dD?=
 =?utf-8?B?Tk5heFdKUThtNnRURmViMTdaSXpMaXdSUy9uTUdPeVhIdkM5ODArOFRzUW8x?=
 =?utf-8?B?MHh2bVR3OGkvNUhiK2xSVTFUaGFQU2tWOHY3Yk0zM3Yxd3VGd2hlamthaHYz?=
 =?utf-8?B?WTBscXFSUWErRW01U05jTHprMnpPcDYyRFYzT0ZxdXpOUFZMb0NtSG4rMHFJ?=
 =?utf-8?B?cDJhSjVlUDBib0FaZ2lTVGZvYlNKd0c2cVVHYTVPRHRCcWtjOXRNQWJrUjBT?=
 =?utf-8?B?UlNRSnhsSHV6a3N0QlhWWEI1eEcwUCtsOUN2M1dBRjIzQ2lVb2hIeFhKMytj?=
 =?utf-8?B?N28vZ3VVWVBTK2JKcXVJTEdVZzREUTRuelQ5TlVqUWN4RDdHc3pGS1FVeXk0?=
 =?utf-8?B?akpsbHJCdGdDMmdQSTJ5TlZFSHJYTmVBeTJLcjRXaW1Hc3VrbDcvN04vRDUw?=
 =?utf-8?B?aFBjK2t3VCtlTDNMMTJMbHBiR29qN3FFcFYyVmdKWDBzTmllaCtnSHhzckxZ?=
 =?utf-8?B?UUZsd2FrbzdCeDdmMGRqK2RXVjlKa1NZbnc5QWErWFErQzNNc3l2V1hyRjNT?=
 =?utf-8?B?Y0plaTlxVTAwdGtnMjBNbGRoY3pnVDBCeXJNWDhUNERUMld2a2poQmhXT0xu?=
 =?utf-8?B?d3lteFJwRU5KczYrTjNWcy9DTnBoTXk1Y09LczZzYnp2VUlpTjJlN0lWSHc4?=
 =?utf-8?B?czJiVzBZSmtTM0FzVTJmdE5xdGQ5K1d3VmFZTEtSRUkwQU96UzdVcGc5LzJ0?=
 =?utf-8?B?Nm1aSEZvME9uV0JUcG1IcjkyZ2Z0VzZSVmkxV2FCOG5KUC9TbytycUZpdERz?=
 =?utf-8?B?UHZjY1FlN2tOdVRZK1htVnNJL2RaWkdOT1BQSjZxNG5uY2o0SE9zYlZzeDV2?=
 =?utf-8?B?dTBjUjVza0JiRktyMFhZUVZxT1BIRnJZUWxDenJnd0NTQWNucFVPTWo5dHgw?=
 =?utf-8?B?VW5rc0E3WmtVd0JONnFlNURDczhqZ1JQR0JHaTJsN3BSdEZGeE93anZNcTQw?=
 =?utf-8?B?QUo1VWhsU2RiejBKY1pUdy9Jd2FIc2MvMzJOSTByVlNzMjVwcnozNDJEdjJO?=
 =?utf-8?B?WVhtM04wanErSUc0djl5NDkya1FVd3RzNzRZRnRlYXpMZXMwdEF4RW5kYytt?=
 =?utf-8?B?M2paNkVvdFRMYnl6VThlT3hNNnA4SVpsM0Vqd1g4S3dFb2FSS1Q5blFha1kw?=
 =?utf-8?B?YThDOTYrQmRMd3IwOUZ4Q25tTWVzdFJjL1BqQzNuWVdOc2RjbHpPd09IZmtX?=
 =?utf-8?B?UkJqQmxJODlCUW50ODJRVlI3WEw5NjBkSTBCWVBXdlBMZzZsWXEvZHhKQ1NL?=
 =?utf-8?B?bm5iby9MOW1pWWptTUROL3duYlRoelZFWVVxUkxTRVBkaHNpbEJYbmFPbGN4?=
 =?utf-8?B?Um96cjI0dGV3UVIydUlkT2RNSzlPTUVMNm05WERZbjg4cXNDVnViZnJ0Sng3?=
 =?utf-8?B?YzgzZGp3NzJvWEF4VE52MHMzNGNCNStwR1JsZGRXZ2I0RTZ4WElxc1RJMUpX?=
 =?utf-8?B?NjkweklETVdja0t1azhmK1JoTDVzN0pCMUUyTXVLakFLclphV3dRSkhBa2JK?=
 =?utf-8?B?MzdNU1RBbFh3NEh2Q29DT01WQ0tIRzBkV0NKZVZKMjZTek1YY0NscjlnU2Ra?=
 =?utf-8?B?RGJTRk91TDIwVEZMUkRhajJYNU9mWUMvNzVkTDBkK2xLRkthRzlnRG1ENnlQ?=
 =?utf-8?B?eFZsb0I0NElXcFA0bVRBekdOcnVkRHExc3V2eDBSNXk2SkhaSG1XczJKcTYy?=
 =?utf-8?B?MXZVNEtCbitLT3U1ZXRaV1hibm5QRDhpL1lISllQMy9iL3huUHlRSVpnN2tj?=
 =?utf-8?B?Umh3NVFScVZDK3ZjbHFNL2FVYm51RnpVdm1nUi93ZFJDM3d3VXpiV21zKzhF?=
 =?utf-8?B?VGVjbTZEK1BjbXp1NUZDSzRBTGwxYVhhSDhuTW5tdjRkU1hsSUNYeDNvUHJ2?=
 =?utf-8?B?QmtRL2p5bkFSQ0JaN3lROUJDUTUzRVM2MGs3YTRYaEVUcHBDR2I1blZrdkpp?=
 =?utf-8?Q?I6TxOm/eeIQBrcFWGnN4yopmA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ed353b-7dcc-48fe-e7df-08db50a2803e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 15:31:46.9327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OniM1P8ND87uhi3vEF3xQ4J48J0C5tOwCoRZ9052ZXhjMg4yKPmD65nPsBctZsflGFJMGqfRAzjSno4vrMkteg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8871
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgOSwgMjAy
MyA0OjEyIEFNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiBD
YzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgQmFydG9zeiBHb2xh
c3pld3NraQ0KPiA8YnJnbEBiZ2Rldi5wbD47IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+OyBTdGVwaGVuDQo+IEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+
OyBSYWZhZWwgSi4gV3lzb2NraQ0KPiA8cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+OyBsaW51
eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsNCj4gZGwtbGludXgt
aW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEZ1Z2FuZyBEdWFuIDxmdWdhbmcuZHVhbkBueHAuY29t
Pg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIDEvMV0gZ3BpbzogbXhjOiB1c2UgcGxhdGZv
cm1fZ2V0X2lycV9vcHRpb25hbCgpIHRvDQo+IGF2b2lkIGVycm9yIG1lc3NhZ2UNCj4gDQo+IENh
dXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBj
bGlja2luZyBsaW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCBy
ZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQgdGhpcw0KPiBlbWFpbCcgYnV0dG9u
DQo+IA0KPiANCj4gT24gTW9uLCBNYXkgOCwgMjAyMyBhdCAxMDo0NuKAr1BNIFNoZW53ZWkgV2Fu
ZyA8c2hlbndlaS53YW5nQG54cC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogRnVnYW5n
IER1YW4gPGZ1Z2FuZy5kdWFuQG54cC5jb20+DQo+ID4NCj4gPiBVc2UgcGxhdGZvcm1fZ2V0X2ly
cV9vcHRpb25hbCgpIHRvIGF2b2lkIGVycm9yIG1lc3NhZ2UgZm9yIHRoZQ0KPiANCj4gYW4gZXJy
b3INCj4gDQo+ID4gb3B0aW9uYWwgaXJxLg0KPiANCj4gLi4uDQo+IA0KPiA+ICAgICAgICAgaWYg
KGlycV9jb3VudCA+IDEpIHsNCj4gPiAtICAgICAgICAgICAgICAgcG9ydC0+aXJxX2hpZ2ggPSBw
bGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDEpOw0KPiA+ICsgICAgICAgICAgICAgICBwb3J0LT5pcnFf
aGlnaCA9IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwocGRldiwgMSk7DQo+ID4gICAgICAgICAg
ICAgICAgIGlmIChwb3J0LT5pcnFfaGlnaCA8IDApDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgcG9ydC0+aXJxX2hpZ2ggPSAwOw0KPiANCj4gSSB3b3VsZCByYXRoZXIgZG8NCj4gDQo+ICAg
ZXJyID0gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbChwZGV2LCAxKTsNCj4gICBpZiAoZXJyID49
IDApDQoNClNob3VsZCBiZSAiaWYgKGVyciA+IDApIiwgcmlnaHQ/IEFzIHRoZSBwbGF0Zm9ybV9n
ZXRfaXJxX29wdGlvbmFsKCkgcmV0dXJuIG5vbi16ZXJvDQpJUlEgbnVtYmVyIG9uIHN1Y2Nlc3Mu
DQoNClJlZ2FyZHMsDQpTaGVud2VpDQoNCj4gICAgIHBvcnQtPmlycV9oaWdoID0gZXJyOw0KPiAN
Cj4gPiAgICAgICAgIH0NCj4gDQo+IEFuZCBsb29raW5nIGludG8gdGhlIGNvZGUgdGhlIGFib3Zl
IHBpZWNlIG1ha2VzIG1vcmUgc2Vuc2UgYWZ0ZXIgYXNraW5nIGZvcg0KPiB0aGUgZmlyc3QgKG1h
bmRhdG9yeSkgSVJRLg0KPiANCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hl
dmNoZW5rbw0K
