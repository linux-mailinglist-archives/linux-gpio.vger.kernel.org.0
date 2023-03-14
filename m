Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F3E6B91AC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 12:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjCNLdb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 07:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjCNLda (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 07:33:30 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C32EFAC;
        Tue, 14 Mar 2023 04:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Stp6uZ8NA9Goq9e69AEih1TIwgOt9KMGpA4FolB5klJxnfUTL53LAGf0mlTmo3R7AxfdziTlsGpLvlsTPo/4OCzpTbr8BmeGsGUGwB0CLndJ1bNr4O5+0VZ/gNdH5IW4pyK25xDSWD/xOxOEGyXIeYQZQBioaUYyvIxklsvyG/vEuMvl/pGylcyPTQqsSz7tRafuWiBP3GDp989udoi8BRBXXl+9rny9muZU/kNz7zX0N8mPdPT22/L7busl9OoIwrGK1OvEOZ7yiAvxYyN65He2WcFN9lDb/7JJTAXs7JEr5Jnlmmvwpt/cbcuNP6CSOh8Bm5HSoJyr+wHLelOOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZY0oOwtmpczsRmxotYFs+TywFi8DFuc30SwGdhmfB/k=;
 b=aTaLn4k8+RPI4F2XUi78fiOffOOOWGMRWfTT1SfXEMHNdKPpwSouyNDvV2bQ32+JbzHCp/7LPRhvCcTXGC1S7IlQzczq18UE7YJUpWBknBxRnmunkkf5Eg/nT+nQeYUoQYlj3TwfZM/+VBTSkLfaejZNokQVSkdrEoWTq8OIqX8jgLdsS3Pk3ZhTn3Dloresw1amhRAS1/5au0rb7NTOIj9LP+ODZqQwBTivJ0NUa8se7QDFZs1ff3U8Bmk0qi05fWaakNv19CCOZiGjRjfNEzjecqGoYIyLG8q/1jdwCDY81hbTrKjzRJOl8gQxbt6dFv5MSoMYvBm+/D5wO8QaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZY0oOwtmpczsRmxotYFs+TywFi8DFuc30SwGdhmfB/k=;
 b=eizMgAoUnNrMVy/sQ/Uhq5K3lSIE16Uz9GioUiSrbX98AX3HyOHWIzcFU2rhKr6o69uTPzs6BTAlS6CrVfabO3ZC4uv6WErV1hhpZcTLDKbylaSTY+dNlV4w7+n998fL9xqMslHUTaNdRiDPyswyVpKpRmFQgiJD3XEy/cvWwU4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11764.jpnprd01.prod.outlook.com (2603:1096:400:3b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 11:33:25 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 11:33:24 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
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
Thread-Index: AQHZUAoZhjJXzQRnckWhgNWWpo0zwa7uZ+eAgACJSoCAA3tbgIAABvEQgAAHBACAAACOAIAG1JkAgAChRoCAAB70AIAAHYgQ
Date:   Tue, 14 Mar 2023 11:33:24 +0000
Message-ID: <OS0PR01MB5922232D53D31CA09210A5ED86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
 <CAMuHMdXqXg7xa3wvk3hvoxUAD+sg_OD-QpAXDpm8qdvuuDK4Rw@mail.gmail.com>
In-Reply-To: <CAMuHMdXqXg7xa3wvk3hvoxUAD+sg_OD-QpAXDpm8qdvuuDK4Rw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11764:EE_
x-ms-office365-filtering-correlation-id: 2dc2db6d-d215-45b7-3f58-08db247fec5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BqkQCUXHIrQmNmKuM8PP26g4/5Nz/aZDkj6qyCEyx27QMFsMZsPOoaSqY6I8gplp7rO4EKt3+MNfGsctCXbPe1KSfrM+BSRP4JVj3jGkZrrVjegrLv6XmPe6JEtp6C0eeUK6PrV6ixMUaraqYyJTJ5Dlevve+6VavxMr3g9IE8WadCzAQzVMmKNRLOOI/jk823YWz6krr44Ca7ngYLQAlv9Eqpryv5+XAGos/SkbxBNIHIPgWUDTfYi3wxiXWMB1eKzcqvQ8pOybkEZ5RxUvZ6poHdv3jgfnjGjU5vcYL6NecD/imVh0/3GCsjiYhz93B3OaQCQ3N03a8AcHhGewm8A3Sblv4opSuSRevZXiiPsBgLpn/Kqs466ddG2Rt+Bi0HSXY6lME8b63Rc5zB7uEtaoTKqyHNQPZ9CVtpLlGFfMx14XsCA53mT6NzFEMaO5xrD2lQnAR/phy+KlTbFtrcJhVwO/VwP4pt7T59mLCtEWNEv77+jPabHARYRyEwdDvBP9bv5Wq7KyaD1pu0JWQ6B5VO+nhp2HLl8kzBXzOXLHYBBPY5LAtzdLZkaaf0jZFX/2Ts8kACDv9bxTJeVkw5P5Zm3t6STNwyVGBT+Ho+jaN7JAkrYTAVeuRk5kLPQS8iUt61Tth3+3i8i3TuBdlWblDcmWsCNL60ME+LuIZRd7EzyJGdQepmhPcXfxq3Xm1TCfoN1+KLM8/JKoMZv9mQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199018)(38100700002)(122000001)(38070700005)(8936002)(33656002)(86362001)(2906002)(41300700001)(52536014)(5660300002)(55016003)(6916009)(4326008)(6506007)(9686003)(26005)(53546011)(186003)(83380400001)(54906003)(316002)(66946007)(66476007)(66446008)(64756008)(8676002)(76116006)(7696005)(71200400001)(478600001)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHVWUVMxOFBTRjV3Tkg1ZWFEMVd5NnU5WEtTZ0d3Yzg5bjA2MHg0Z0pGZHdx?=
 =?utf-8?B?ODZ3QS9rYWtVOC9tY0x3Rnc4NTIvQURaWll1eVZWcG9ER1FoeHdneWIxaFMx?=
 =?utf-8?B?T1dPUnQvclJVNG9lcC9USTZycW5FUEJEWklIblJUVGJnLzNwM1NaNDVQRyto?=
 =?utf-8?B?Unk1bXdiaGpEUVBQNjhkeVdCd281ak56eDZ6U1Fnam1sK3lKdHdMaGNjSUNq?=
 =?utf-8?B?NTFQbkhtSXpqN2ZuaHhmOTdCMzhYYVA5RmVlcmxLZCthSS81MWlpYk5yc3Nj?=
 =?utf-8?B?Z2FrbVJLZnVTZUROdDFueTkyN21JaFY2Nk9kQW5qeG9oaUM1MDRrdTU0QXVh?=
 =?utf-8?B?ZmxaOUpMU0ovUkhWdkk3ZmJnblZPRFlQeTdXZUZ5TVpFdHBPdTNjZnJ3Y1N2?=
 =?utf-8?B?eTU1aHUwNkl3SlJkT3h0RlpTY1ppenNDWHVQeEtqa1VQbjNybXpjUGtBMk1o?=
 =?utf-8?B?WGk0NElndS9MeVhUQXF6V3o2WTNjQ1M5WVFPVGNwNTV3VFdkRXVsYTZHNkx3?=
 =?utf-8?B?eHpTWnFVVktiZDJnNmdNRWYwOU1hNVEyTjFOMUwrNC9LQVFJc1NmcHlqbnNV?=
 =?utf-8?B?ckZtUXc0U0tmQUdobnNkN3JyK3JFSEdhK1ZhNTZlVzllWnhHdVRsTHF6N0tW?=
 =?utf-8?B?NnUwNUxERDRwWjA0akpmenVicHZwN1BNSnM0WWhNc3N0UkxwdjRUNFg5RnVs?=
 =?utf-8?B?bTExd1hYS1BkOUVraVRmeE4yS040UWpXUWdUVVIvOVJjT1lIbzRxUHQ3NVAw?=
 =?utf-8?B?OTVIZGxlTVZsVG9oeVFhaFZZeTVZVTIzUFBvcWtwVnlPYjAwYmJmczRVcXJw?=
 =?utf-8?B?YTRRenlaYWxaRHd5alNnSzZxUHNvZTRXQVpCMG16d2NZQWpCZDZLZm14R09H?=
 =?utf-8?B?cERGTVpPb2JpcEN6eGpOU0ZqYjFsR0J4czhtcTR0cnFrT2R5cjc2MXpOMFd1?=
 =?utf-8?B?enEybXVoR1V5Y3Z2b1gvUGpRQnFzS25MRzEzWm9MOXhZeDBRbTYwUkd5QTFz?=
 =?utf-8?B?dW4vWURDc1k1aFEvbGNZcGRVUzFyY243VVFMUXJmRjZYM3pJNVQ2YlZWb040?=
 =?utf-8?B?QUZTUGtRL3RBdXNManNscFpYTnZlZ21FbEhQUTBsZWo4dzg0MHNBZGlBeTdu?=
 =?utf-8?B?MnZ6bHpuUjlBYS9vWFRSSGJoQkNlZTZkcGVjTzZQWUlTdkVPOWsyYkVJc1BH?=
 =?utf-8?B?dmpEVXFBakpvMGl1Y1doLy96bUwvanpyKy9IZlZhMlVoL2hZdkpzMHhPTEV6?=
 =?utf-8?B?S2RTUC82QmlwUjBoWTd0Z3BUaVpsTnpXMktPVjl2NytvQnczMU9DNHQ2R25X?=
 =?utf-8?B?dnByV2FkaXBrcFpGdGw4dFMrVm1Td1lGZEtJVEpPV3pidll5WXNPQmxkNUFt?=
 =?utf-8?B?ZjE3aGJYUjhEZ2xkREJVSFFDNHZFWWd0UjcxYnE2L2RPTUhmdm5oeldRVkZn?=
 =?utf-8?B?RHdyVytwdkM4VXlUdThibU1kUENTcHhQV3owRUdOUDFpdmlQS0pRNUFVTzNO?=
 =?utf-8?B?R3lFNVppaTVlSmRxSEkvSkdrUGRWUGZ6UGNGM2xRaFlWSDVkWXROQlZvMnRH?=
 =?utf-8?B?OE1tL0R2MU9sWGxVbGh1cWk3TzZBcDFmTkhCSnkrWGlMRlFHSzJTNTU2Wnp1?=
 =?utf-8?B?UE9TZ2lBYXpHNnVIc2tIUFFBSG5VUnJobDFVT242NzNURDJsbXNTcCs4RHUw?=
 =?utf-8?B?NDB1K0dYU2duN01PSCt0S3FadFRzYTlCZWg1U2UzMDFodUt3SlRlUnVPODFt?=
 =?utf-8?B?Y0t1eWlnZ1Q0UEhWd3BPdThoSUdnN0IzZ2NHci9hMmpra0FwZ2tSVVVnSlFI?=
 =?utf-8?B?bmJpcW5nUjBVTGRHSG5XdFRMZUh6and2enErT2xCNlREWVRGZUxubVk2NVhY?=
 =?utf-8?B?NW5QNWJtT1VKblRhUXdqdm5Nc0hGOHhlOGtIZkNVNStlZGxNVlU4eEMzbmla?=
 =?utf-8?B?ZzZPNk5iRFZWanFwOEFBTW9MZnRwRnhIbmhwSnNWWTF2dGxPc3hoQ3hvbWRS?=
 =?utf-8?B?Qk5WaVVET1R0T3cvdGkyb09ZdDR2dmJjYU1QajZMTkRjenBSeE55TDRRb2g4?=
 =?utf-8?B?Vk5BSW11azJRVTZzNWVSOWc4d1Bza2Z6dktmdTdtL2Z4M0JxTWVTdnI4dzkx?=
 =?utf-8?Q?VbCXGkRIa1geikXrc+fKiIT6D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc2db6d-d215-45b7-3f58-08db247fec5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 11:33:24.7478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7TFPuJEIfhh8h8txt23ySWFnsHLlOzmsy87dUJ5rwQbrojEujL/f5pTERiD5I4DeuXSjquEpjqRzeJXHnHopnRzZZe7UlaiCHDA8MXp9rcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11764
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjYgMDEvMTNdIHBpbmN0cmw6IGNvcmU6IEFkZCBwaW5jdHJsX2dldF9kZXZpY2UoKQ0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgTWFyIDE0LCAyMDIzIGF0IDk6MjfigK9BTSBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NiAwMS8xM10gcGluY3RybDogY29yZTogQWRkDQo+ID4gPiBwaW5jdHJs
X2dldF9kZXZpY2UoKSBPbiBUaHUsIE1hciA5LCAyMDIzIGF0IDM6MTnigK9QTSBCaWp1IERhcw0K
PiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiBJIGhhdmUgYW4g
SVAgd2hpY2ggZGV0ZWN0cyBzaG9ydCBjaXJjdWl0IGJldHdlZW4gdGhlIG91dHB1dA0KPiA+ID4g
PiB0ZXJtaW5hbHMgYW5kIGRpc2FibGUgdGhlIG91dHB1dCBmcm9tIHB3bSBwaW5zICx3aGVuIGl0
IGRldGVjdHMNCj4gPiA+ID4gc2hvcnQgY2lyY3VpdCB0byBwcm90ZWN0IGZyb20gc3lzdGVtIGZh
aWx1cmUuDQo+ID4gPiA+DQo+ID4gPiA+IHB3bS1waW5zIGFyZSBpbnZvbHZlZCBpbiB0aGlzIG9w
ZXJhdGlvbi4NCj4gPiA+ID4NCj4gPiA+ID4gRnJvbSB1c2VyIHNwYWNlIHdlIG5lZWQgdG8gY29u
ZmlndXJlIHRoZSB0eXBlIG9mIHByb3RlY3Rpb24gZm9yDQo+ID4gPiA+IHRoaXMgcGlucyAoZWc6
IGRpc2FibGUgUFdNIG91dHB1dCwgd2hlbiBib3RoIHB3bSBvdXRwdXRzIGFyZSBoaWdoDQo+ID4g
PiA+IGF0IHNhbWUNCj4gPiA+IHRpbWUpLg0KPiA+ID4NCj4gPiA+IFdoeSBkbyB5b3Ugd2FudCB0
byBkbyB0aGlzIGZyb20gdXNlciBzcGFjZT8NCj4gPg0KPiA+IFRvIHRha2UgY2FyZSBvZiB0aGUg
YmVsb3cgZmVhdHVyZXMgcHJvdmlkZWQgYnkgUG9ydCBPdXRwdXQgRW5hYmxlIGZvcg0KPiA+IEdQ
VChhLmsuYSBQV00pDQo+ID4gKFBPRUcpIElQLg0KPiA+DQo+ID4gVGhlIG91dHB1dCBwaW5zIG9m
IHRoZSBnZW5lcmFsIFBXTSB0aW1lciAoR1BUKSBjYW4gYmUgZGlzYWJsZWQgYnkNCj4gPiB1c2lu
ZyB0aGUgcG9ydCBvdXRwdXQgZW5hYmxpbmcgZnVuY3Rpb24gZm9yIHRoZSBHUFQgKFBPRUcpLg0K
PiA+IFNwZWNpZmljYWxseSwgZWl0aGVyIG9mIHRoZSBmb2xsb3dpbmcgd2F5cyBjYW4gYmUgdXNl
ZFsxXS4NCj4gPg0KPiA+IFsxXQ0KPiA+DQo+ID4gVXNlIGNhc2UgMSkNCj4gPiDil48gSW5wdXQg
bGV2ZWwgZGV0ZWN0aW9uIG9mIHRoZSBHVEVUUkdBIHRvIEdURVRSR0QgcGlucyAoaS5lOiBkZXRl
Y3QNCj4gPiBzaG9ydCBjaXJjdWl0IGluIHN3aXRjaGluZyBjaXJjdWl0IGV4dGVybmFsbHkgYW5k
IHVzZSBhbiBleHRlcm5hbA0KPiA+IHBpbihHVEVUUkdBIHRvIEdURVRSR0QpIHRvIGRpc2FibGUg
dGhlIG91dHB1dCBwaW5zIG9mIFBXTSkNCj4gPg0KPiA+IFVzZSBjYXNlIDIpDQo+ID4g4pePIE91
dHB1dC1kaXNhYmxlIHJlcXVlc3QgZnJvbSB0aGUgR1BUIChHUFQgZGV0ZWN0cyBzaG9ydCBjaXJj
dWl0IGluDQo+ID4gc3dpdGNoaW5nIGNpcmN1aXQgaW50ZXJuYWxseSBhbmQgZGlzYWJsZSB0aGUg
b3V0cHV0IHBpbnMgb2YgUFdNKQ0KPiA+DQo+ID4gVXNlIGNhc2UgMykNCj4gPiDil48gUmVnaXN0
ZXIgc2V0dGluZ3MoRGV0ZWN0IHNob3J0IGNpcmN1aXQgaW4gc3dpdGNoaW5nIGNpcmN1aXQNCj4g
PiBleHRlcm5hbGx5IGFuZCB1c2UgaW50ZXJuYWwgcmVnaXN0ZXIgdG8gZGlzYWJsZSB0aGUgb3V0
cHV0IHBpbnMgb2YNCj4gPiBQV00pDQo+ID4NCj4gPiBUaGUgYWR2YW50YWdlIG9mIHByb3ZpZGlu
ZyB0aGVzZSBvcHRpb25zIGZyb20gdXNlciBzcGFjZSBpcywgaXQgaXMNCj4gZmxleGlibGUuDQo+
ID4gUnVudGltZSB1c2VyIGNhbiBjb25maWd1cmUgdGhlIHVzZSBjYXNlIGhlIHdhbnRzIHRvIHVz
ZSBmb3IgaGlzIHByb2R1Y3QuDQo+ID4NCj4gPiArUm9iLCArIEtyenlzenRvZiBLb3psb3dza2kN
Cj4gPg0KPiA+IElmIHdlIGNhbm5vdCBkbyBpdCBpbiB1c2VyIHNwYWNlLCB0aGVuIHdlIG5lZWQg
dG8gbWFrZSBpdCBhcyBwYXJ0IG9mDQo+ID4gRHQgYmluZGluZ3MgYW5kIHVzZXJzIHdpbGwgZGVm
aW5lIHRoZSB1c2UgY2FzZSB0aGV5IG5lZWQgaW4gRFQuDQo+ID4NCj4gPiBTb21lIG9mIHRoZSBm
YWlsdXJlIGNvbmRpdGlvbnMgaW4gc3dpdGNoaW5nIGNpcmN1aXRzIGFyZSBsaWtlIGJlbG93DQo+
ID4NCj4gPiB3aGVuIHlvdSB1c2UgUFdNIHB1c2gtcHVsbCBjb25maWd1cmF0aW9uIHlvdSBTSE9V
TEQgaGF2ZSBhIGRlYWQgdGltZS4NCj4gPiBXaGVuICsgbW9zZmV0IGlzIHR1cm5lZCBvZmYgLSBt
b3NmZXQgY2FuJ3QgYmUgaW1tZWRpYXRlbHkgdHVybmVkIG9uDQo+ID4gYmVjYXVzZSB5b3Ugd2ls
bCBjcmVhdGUgYSBkaXJlY3QgcGF0aCAoc2hvcnQgY2lyY3VpdCkgYmV0d2VlbiArIGFuZCAtDQo+
ID4gYXMgcGFyYXNpdGljIGNhcGFjaXRhbmNlIHdpbGwgbGVhdmUgKyBtb3NmZXQgdHVybmVkIG9u
IGZvciBhIHdoaWxlIC4NCj4gPiBUaGlzIHdpbGwgZGVzdHJveSB5b3VyIG1vc2ZldHMuDQo+ID4N
Cj4gPiBEZWFkIHRpbWUgaXMgdGhlIGRlbGF5IG1lYXN1cmVkIGZyb20gdHVybmluZyBvZmYgdGhl
IGRyaXZlciBzd2l0Y2gNCj4gPiBjb25uZWN0ZWQgdG8gb25lIHJhaWwgb2YgdGhlIHBvd2VyIHN1
cHBseSB0byB0aGUgdGltZSB0aGUgc3dpdGNoDQo+ID4gY29ubmVjdGVkIHRvIHRoZSBvdGhlciBy
YWlsIG9mIHRoZSBwb3dlciBzdXBwbHkgaXMgdHVybmVkIG9uLg0KPiA+IFN3aXRjaGluZyBkZXZp
Y2VzIGxpa2UgTU9TRkVUcyBhbmQgSUdCVHMgdHVybiBvZmYgYWZ0ZXIgYSBkZWxheSB3aGVuDQo+
ID4gdGhlIGdhdGUgZHJpdmUgaXMgdHVybmVkIG9mZi4gSWYgdGhlIG90aGVyIHN3aXRjaCBvbiB0
aGUgaGFsZiBicmlkZ2UNCj4gPiBpcyB0dXJuZWQgb24gaW1tZWRpYXRlbHksIGJvdGggdXBwZXIg
YW5kIGxvd2VyIHN3aXRjaGVzIG1heSBiZSBpbiBhDQo+ID4gY29uZHVjdGl2ZSByZWdpb24gZm9y
IGEgYnJpZWYgbW9tZW50LCBzaG9ydGluZyB0aGUgcG93ZXIgcmFpbC4NCj4gPiBJbiBvcmRlciB0
byBhdm9pZCB0aGlzLCBhIGRlYWQgdGltZSBpcyBtYWludGFpbmVkIGJldHdlZW4gdHVybmluZyBv
ZmYNCj4gPiBvZiBvbmUgc3dpdGNoIGFuZCB0dXJuaW5nIG9uIHRoZSBvdGhlciBpbiBhIGhhbGYg
YnJpZGdlLg0KPiA+DQo+ID4gUE9FRyBJUCBwcm92aWRlcyB0aGUgYmVsb3cgcHJvdGVjdGlvbnMs
DQo+ID4NCj4gPiAxKSBXaGVuIHRoZSBHVElPQ0EgcGluIGFuZCB0aGUgR1RJT0NCIHBpbihQV00g
cGlucykgYXJlIGRyaXZlbiB0byBhbg0KPiA+IGFjdGl2ZSBsZXZlbCBzaW11bHRhbmVvdXNseSwg
dGhlIFBXTSBnZW5lcmF0ZXMgYW4gb3V0cHV0LWRpc2FibGUNCj4gPiByZXF1ZXN0IHRvIHRoZSBQ
T0VHLiBUaHJvdWdoIHJlY2VwdGlvbiBvZiB0aGVzZSByZXF1ZXN0cywgdGhlIFBPRUcgY2FuDQo+
ID4gY29udHJvbCB3aGV0aGVyIHRoZSBHVElPQ0EgYW5kIEdUSU9DQiBwaW5zIGFyZSBvdXRwdXQt
ZGlzYWJsZWQNCj4gPg0KPiA+IDIpIFBXTSBvdXRwdXQgcGlucyBjYW4gYmUgc2V0IHRvIGJlIGRp
c2FibGVkIHdoZW4gdGhlIFBXTSBvdXRwdXQgcGlucw0KPiA+IGRldGVjdCBhIGRlYWQgdGltZSBl
cnJvciBvciBzaG9ydCBjaXJjdWl0IGRldGVjdGlvbiBiZXR3ZWVuIHRoZSBvdXRwdXQNCj4gPiB0
ZXJtaW5hbHMNCj4gPg0KPiA+ID4NCj4gPiA+IEl0IHNvdW5kcyBsaWtlIHNvbWV0aGluZyB0aGUg
a2VybmVsIHNob3VsZCBiZSBkb2luZy4NCj4gPg0KPiA+IElmIHdlIGNhbm5vdCBkbyB0aGUgYWJv
dmUgdXNlIGNhc2VzWzFdIGluIHVzZXIgc3BhY2UsIHRoZW4gd2UgbmVlZCB0bw0KPiA+IG1ha2Ug
aXQgYXMgcGFydCBvZiBEdCBiaW5kaW5ncyBhbmQgaXQgd2lsbCBiZSBmdWxseSB0YWtlbiBjYXJl
IGluIGtlcm5lbC4NCj4gPg0KPiA+ID4NCj4gPiA+IFRoZSBrZXJuZWwgaGFzIGEgUFdNIHN1YnN5
c3RlbSwgYW5kIGEgcGluIGNvbnRyb2wgc3Vic3lzdGVtLCBhbmQgd2UNCj4gPiA+IGRvbid0IGV2
ZW4gaGF2ZSBhIHVzZXJzcGFjZSBBQkkgZm9yIHBpbiBjb250cm9sLg0KPiA+ID4gUGluIGNvbnRy
b2wgaXMgZGVzaWduZWQgdG8gYXZvaWQgZWxlY3RyaWNhbCBkaXNhc3RlcnMgYW5kIGEgZHJpdmVy
DQo+ID4gPiBjYW4gYWRkIGZ1cnRoZXIgcG9saWN5IGZvciBzdXJlLg0KPiA+ID4NCj4gPiA+IElm
IHlvdSB3YW50IHRvIGFkZCBwb2xpY3kgb2YgZGlmZmVyZW50IHR5cGVzIHRvIGF2b2lkIGVsZWN0
cmljYWwNCj4gPiA+IGRpc2FzdGVyIGludG8gdGhlIHBpbiBjb250cm9sIGRyaXZlciwgZ28gYWhl
YWQsIGp1c3QgcnVuIGl0IGJ5IEdlZXJ0DQo+ID4gPiBzbyBoZSdzIG9uIGJvYXJkIHdpdGggdGhl
IGlkZWFzLg0KPiA+DQo+ID4gT0suIEdlZXJ0IENhbiB5b3UgcGxlYXNlIHByb3ZpZGUgdmFsdWFi
bGUgc3VnZ2VzdGlvbiBob3cgdG8gYWRkcmVzcw0KPiA+IHRoaXMgdXNlIGNhc2VzWzFdIEFzIG1l
bnRpb25lZCBhYm92ZT8NCj4gDQo+IElzIHRoaXMgY29uZmlndXJhdGlvbiB5b3UgbmVlZCB0byBk
byBvbmNlLCBiYXNlZCBvbiB0aGUgaGFyZHdhcmUsIG9yIGRvIHlvdQ0KPiBuZWVkIHRvIGNoYW5n
ZSBpdCBhdCBydW4tdGltZT8NCg0KSSB0aGluayB0aGlzIGNvbmZpZ3VyYXRpb24gbmVlZGVkIG9u
bHkgb25jZSBiYXNlZCBvbiB0aGUgaGFyZHdhcmUuDQoNCj4gDQo+IEJlZm9yZSwgSSB3YXMgdW5k
ZXIgdGhlIGltcHJlc3Npb24geW91IG5lZWRlZCB0byBjaGFuZ2UgdGhlIGNvbmZpZ3VyYXRpb24g
YXQNCj4gcnVuLXRpbWUsIGhlbmNlIHRoZSBuZWVkIGZvciBhIHN5c2ZzIEFQSS4NCj4gSWYgY29u
ZmlndXJhdGlvbiBpcyBzdGF0aWMsIERUIGlzIHRoZSB3YXkgdG8gZ28uDQoNCkF0IHRoYXQgdGlt
ZSwgSSB3YXMgbm90IGV4cGxvcmVkIHRoZSBwb3NzaWJpbGl0eSBvZiBjcmVhdGluZyBwb2VnIGNo
YXIgZGV2aWNlLg0KDQpGb3IgZWc6IEFmdGVyIHRoZSBpbml0aWFsIHNldHRpbmcgaW4gRFQsIEkg
Z3Vlc3Mgd2l0aCBwb2VnIGNoYXIgZGV2aWNlIHdlIHNob3VsZCBiZSBhYmxlIHRvDQphY2hpZXZl
IGJlbG93IHVzZSBjYXNlcy4NCg0KVXNlIGNhc2UgMSkNCiBXZSBjYW4gcHJvdmlkZSB1c2VyIHNw
YWNlIGV2ZW50IGluZGljYXRpbmcsIE91dHB1dC1kaXNhYmxlIHJlcXVlc3QgZnJvbSB0aGUgR1RF
VFJHbiBwaW4gb2NjdXJyZWQuDQphbmQgcHJvdmlkZSBzb21lIG9wdGlvbnMgKHJkL3dyIGZpbGUg
b3BzKSB0byB1c2VyIHNwYWNlIHRvIGNsZWFyIHRoZSBmYXVsdC4NCg0KVXNlIGNhc2UgMikNCiBX
ZSBjYW4gcHJvdmlkZSB1c2VyIHNwYWNlIGV2ZW50IGluZGljYXRpbmcsIE91dHB1dC1kaXNhYmxl
IHJlcXVlc3QgZnJvbSBHUFQgZGlzYWJsZSByZXF1ZXN0IG9jY3VycmVkLg0KIGFuZCBwcm92aWRl
IHNvbWUgb3B0aW9ucyhyZC93ciBmaWxlIG9wcykgdG8gdXNlciBzcGFjZSB0byBjbGVhciB0aGUg
ZmF1bHQuDQoNClVzZSBjYXNlIDMpDQogVXNlciBzcGFjZSB0byBjb250cm9sIE91dHB1dC1kaXNh
YmxlIHRocm91Z2ggcmQvd3IgZmlsZSBvcHMuDQoNClBsZWFzZSBsZXQgbWUga25vdyBpcyBpdCBv
ayBvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nIGhlcmU/Pw0KDQpDaGVlcnMsDQpCaWp1DQo=
