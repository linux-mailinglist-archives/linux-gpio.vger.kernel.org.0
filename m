Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEA4D6B8303
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 21:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjCMUmv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 16:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjCMUmr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 16:42:47 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2108.outbound.protection.outlook.com [40.107.113.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0167B994;
        Mon, 13 Mar 2023 13:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGY7Lr+HSysxGpvYhk+KKtFFIAqEZ0MkhCHtIr+jdCZDeCwU/N6OR1udGlt/DOFWHu/0/udPmBfMOo1VlvbjOOH/c6mOjV6HOL9UXDAZLJUrr/kE00gf9nTGNYiejQNWfivQGwczLY9mPy8KJdy1fSeay87tgwM/qYf1WiuGICxJaoSRrbkkFMchQwx5bTkCfcw6D4O4zJrlM2HkcZIuk3mh/ax5/s+F2Xi7hOcJ6Zi4ddI1OTcKrNE+DEr4gWU/eAx9jsABtsHzwrWdrtrmy4zCZryopfIh1YQ11bZYsMxZTUC5IwOKr8cmD/1HoiP/ULU9+Du5/sQ4aMkYqSAOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LAB0sYbmb5H2GLEvg0vuBrRU2DM9FVp2thfxsJ2z1A=;
 b=lHn9J7CEk6QD2hBW3PTOoAk4Hvc8YAgZhCZ8G/iMgkRbUiwsFxnayODDAS/K2AK87re5UMBpLGFfGsh9uIg1xmrLEFoMB0XDHWQVqsdFz6QoxHoVztMWgjA3jeQUrCvAwcAfuCmLLfUFNh1tLcn1STq2kBB/VS9Gussg/RApj3wwSkKJBZTvHyDDyI0hM7/qFtBpg1tAnhO6Xt9/pz/N6y+lSJwlWQUNhmiOmf0wgDZH+GpBHSL5zuZRFHQWVfumuTsAXZZ9/h/I//e5jtIHAp3t75fM8CSA9awsrRFSIWtei264IShG0pnkp2lhcjXzVJxpEkgKNVASx6vIiDUxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LAB0sYbmb5H2GLEvg0vuBrRU2DM9FVp2thfxsJ2z1A=;
 b=IeyoazgTmfBTNSAgIb8dHTWY/1mVRxqctsvvp/EjNY7Io0my9fQiGUfWrfXR/fAi0y9OadeDxJjOS+KpX+WmD67JlQpUgbvSs2fT3DiozwbHsiz7HMtxLgzoQ/j23NRlzniTw9aEK4TQVzZ6bskdWtxgJX3Sd8GaBjXhC+dnyzU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5862.jpnprd01.prod.outlook.com (2603:1096:604:c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Mon, 13 Mar
 2023 20:42:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.026; Mon, 13 Mar 2023
 20:42:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Thread-Topic: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Thread-Index: AQHZUAoZhjJXzQRnckWhgNWWpo0zwa7uZ+eAgACJSoCAA3tbgIAABvEQgAAHBACAAACOAIAGuRKA
Date:   Mon, 13 Mar 2023 20:42:21 +0000
Message-ID: <OS0PR01MB5922EE9EF1663CAA2F839D8586B99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com>
 <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
 <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com>
 <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5862:EE_
x-ms-office365-filtering-correlation-id: 5217f845-4fb3-420e-8d51-08db240371c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +myL/K0oBFqxZDfrKS+FxUajHN5iTbyrLUIc0k/qG6KOy22VnY0a8IGeurYYuxwCwikJcGxxejZx+5Hg7G+k2sJLHzR3GHwjD2aGICEmcpGN3xwBpFPGkxPrHSFdP7SghIBxrnf5eBb4BGNX2Chbw7MQ2BFlGuAUH7ne2fLVucIoiE8r84OiVdrMsMIbvC9ow6FgQn63VxxJvBxwST7TFsJtQ795EHJqt3FoZQJu0itZs/sOFvfI0AbMHoJ69wpvjImvkv0SVLtNf3Mxh6dJXwXbuPOrZAyQ9VdRrbnK95RBSRoNPfuCDE2QpXan5ocEO6JmwGjY1ALLcCM8O6ViVGOBCRPfx0063mv7o0NdZ8c3u/PdEQ6wpOPXsykML4CfdYnwrU+byv+fZ2SlZKzr/alTtftMW1IfelfSaO1ybj5IMK4ME9slmiUk6YlxcC2Osl3PHp0Gf/y+Ibjx4Ae3m81EPhUZcrEzunfYX92Dm1MqGB/BefvNfQyqu8+hBzESIM3pE+o2rXm0blnW/SD/T8OCgOc7kXRleyVDtUEJxTlDCOquNqK3NNhizk9//EUpDjM3nZsYeqIYNEUYQ/5p3JKF7UR7dkLmTV1+Lsrakml688XLgyh8C5wUfanc3d/g4UQntQeC5h6/92IeDAFadMUIztVtnyT27PV5ouZ88Ggl3/EVVZCTlwEcjUU0qnMw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199018)(38070700005)(33656002)(86362001)(122000001)(38100700002)(2906002)(41300700001)(52536014)(5660300002)(8936002)(55016003)(4326008)(6916009)(6506007)(53546011)(9686003)(186003)(26005)(83380400001)(316002)(54906003)(76116006)(66946007)(66556008)(66476007)(64756008)(8676002)(66446008)(71200400001)(966005)(7696005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWtrdkNnb1huajdwV2p1WTN2NldYTkV0RFFpV2VRZ0IxMzBpL1cybXRybkND?=
 =?utf-8?B?eU8wWTNEcTBFejhVaXE1UHh3Y3BpZ21EQTJFQlJhQitTbm5yeHRPZy9HeWR2?=
 =?utf-8?B?TDdYZkwySDdsL3NOVWh2U3RBL1ExVFpZR2RSOW90ZThNYWoyZ0tqTWxTVHAy?=
 =?utf-8?B?NitPM2xNWVB0dSsvc1dRSkFUejN5QVE1N1FZdW9FdVRuZEpzclBLajh1cWZW?=
 =?utf-8?B?emhHclVxeHNTbm1kVWR2WDJWUTNPemxCTXZTeHUvbVVudGlCRWI3bndLek05?=
 =?utf-8?B?REo1M0pFRitqZktFK3lBVTZBQWVxVnFadzBMUWZRS1E4RG04dnUzUVRJS0dq?=
 =?utf-8?B?a1Y5amNGcGZPaWkyVkRxeWJTNG90Y1BNc3VsTVdMSFQzYUJjeEdOVDY5Skcr?=
 =?utf-8?B?all5ZmFzbnBRUjd4a0hTbG9XMW9VVFhOaEdYdXBNVmpIWEpJdUJ1MXdWRHVT?=
 =?utf-8?B?alczaHdyOXZ1Z0JJOTNGbW1GdS85cnNUOUJVUENTZHdzSmk1MGVFcVRXTzh3?=
 =?utf-8?B?OGtNQTkvZlJXSjREb3J6TXpXZG1xcDZUSjV1SStVL0tjWWlyQ1VVancyQ0Fa?=
 =?utf-8?B?ZnhCZ1hFd3RIaUdQei82SXIzcW12blBWSmQ0bjhmdlBLNW9uc094TXdBZTE0?=
 =?utf-8?B?cVQvWHdJSGVJbzBKT2s2N01YTElkMFlGODRReHc5RUpkSmpYbkdXYUs0SWFh?=
 =?utf-8?B?YmxCc2dEUUtQOFpYZjhqaVp5MDVaa0FqdWNyNHd3M25FMmJLeFNNemVjaTRY?=
 =?utf-8?B?THN5ZzNYZnRIYVNXWnVMOUpMa2dYWjdEUTRpQ29rRXNVWXVCckp6QlFZZU5t?=
 =?utf-8?B?NnBRTXEwaHY2Rk9QNHE5SU04Q1dFSnpvM0hQV1VnY3p3b01OSnZMRDYxQVlJ?=
 =?utf-8?B?K1VVc3RxQUVxenhMNVpWS3BnRDlUajhHU1RmTXhJb2licVJVVzk3SThXT24w?=
 =?utf-8?B?L1liUzNOMkExQmdMM1NDNWJCbDNXaS9DakljVVhxVElZY1UxWmFaREM3ZHZP?=
 =?utf-8?B?WmNra1BOaDhlSnJWUU1aR29IdExvMk9qRnBDMlZCS3oxR2MwQzg3WEJrbW1C?=
 =?utf-8?B?QjEzMG1zaE9tQ3o0Qnk5eXdjeXlUL3BKMC9pWC9yWENjV0haNDJUMEkrcHhi?=
 =?utf-8?B?WW8wNW9qS3lOUnQ4Z2NKeE5yNTNpQ1R0aU11SksxWlNVVHlnOGF6TWE3WnRR?=
 =?utf-8?B?WTRqUlhwQy9Lb05jbURyMkU4SmZaVzFkZDNuc0toN24zcXd6RXFDMWdyeDdG?=
 =?utf-8?B?OXNLTWR5Z2ZvY1F2elh6andJWDJSZzRQbUpIWDVrd29WMEx3ajBYbXhQSkto?=
 =?utf-8?B?ZzhjOEQ3dHJtTVRST01uNEMyZndUWHFMUzNORDNoV1RmQUpvaEpxaWg2cGlj?=
 =?utf-8?B?bUZYZEc3NDZSY3NsYno0WmtDSXg5UU9UT3hCeWFSWmtXenRjSStPdEVrcWs4?=
 =?utf-8?B?SlFnWGh1RG44bE54bWdyWkxOUGdSQnBDMUM1T2VvZGg1Zkx6RUw1WVJscHM5?=
 =?utf-8?B?OGhsYm83M0ZVNUhPU0xZbWJ5WWVFc0g0VEYrUlJ5YnU5YWN5VUQ2ZkNqNUtp?=
 =?utf-8?B?TWFiT1grSFZKdWdaRUhMeUh0K1dNWDcwK24zOElLVWtOY21ka0hzMS9UUG5o?=
 =?utf-8?B?RDN0eUp2eG1vTEZYVzV0djBSRXc2eXZmN1lXdWVXWG9uQ0FGMVJEZXJZdnlo?=
 =?utf-8?B?cmovbUdrb203MTFqWFcyOE5oNUthbnJnZExYWWo0VTRJSzI5ZG9JK0J5V1pM?=
 =?utf-8?B?cEJadlI5Snlzd1psdExGQ1RneThCejhjRUt2L0EwMjZ2WEdBNGwrcUxQclM1?=
 =?utf-8?B?YUZuaGl6UGplY2x3Tkh0NDlsUnBva0k5dzU5d1c4N2FHUlljL0xSL0F0R05u?=
 =?utf-8?B?c2dtaWVWa1hDMlVhM1ZrMFhkZFBCNDRqc2NuenZsSU1ENjlvZEEvMy92YS9t?=
 =?utf-8?B?dGk3SkRWKzUrMDh3cktFT1B1WXVKdTFVM1dYZHZ2RVlOb0dLdzFhelRVajFm?=
 =?utf-8?B?ZHNFaUt3cldFcURvL0pLbDA4STZIeFJFV3pSK3U4Z3IvbjVkZ09MYmtqbmtz?=
 =?utf-8?B?OGNZd1pnQmEyYjBQWmlZR2Zra0JSdkhuYlZuRUN2M2pGTklESUJuNWsxb251?=
 =?utf-8?B?QlZ2NTNmWi9abjA3aS8yUGFIUnBuL3hGcUhCcWxST0Q4dFpIMjYrdit5RkhY?=
 =?utf-8?B?Z3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5217f845-4fb3-420e-8d51-08db240371c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 20:42:21.4993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lKw9L94QnoeUzQSOREj9bUh8LKFS9JdMiPRcl6ZAIqd5sSxeFVQmejcFSalF2Jmz07O6clS6kQOolg9RVTtJx4PORU1tars4ksRawDuGcV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5862
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSwNCg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY2IDAxLzEzXSBwaW5jdHJsOiBjb3Jl
OiBBZGQgcGluY3RybF9nZXRfZGV2aWNlKCkNCj4gDQo+IEhpIEFuZHksDQo+IA0KPiBUaGFua3Mg
Zm9yIHRoZSBleHBsYW5hdGlvbi4NCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwMS8x
M10gcGluY3RybDogY29yZTogQWRkIHBpbmN0cmxfZ2V0X2RldmljZSgpDQo+ID4NCj4gPiBPbiBU
aHUsIE1hciA5LCAyMDIzIGF0IDM6MjbigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAxLzEz
XSBwaW5jdHJsOiBjb3JlOiBBZGQNCj4gPiA+ID4gcGluY3RybF9nZXRfZGV2aWNlKCkgT24gVHVl
LCBNYXIgNywgMjAyMyBhdCAxMDoxM+KAr0FNIEJpanUgRGFzDQo+ID4gPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYg
MDEvMTNdIHBpbmN0cmw6IGNvcmU6IEFkZA0KPiA+ID4gPiA+ID4gcGluY3RybF9nZXRfZGV2aWNl
KCkgTW9uLCBNYXIgMDYsIDIwMjMgYXQgMDk6MDA6MDJBTSArMDAwMCwNCj4gPiA+ID4gPiA+IEJp
anUgRGFzDQo+ID4gPiA+IGtpcmpvaXR0aToNCj4gPg0KPiA+IC4uLg0KPiA+DQo+ID4gPiA+ID4g
PiA+IEFkZCBwaW5jdHJsX2dldF9kZXZpY2UoKSB0byBmaW5kIGEgZGV2aWNlIGhhbmRsZSBhc3Nv
Y2lhdGVkDQo+ID4gPiA+ID4gPiA+IHdpdGggYSBwaW5jb250cm9sIGdyb3VwKGkuZS4gYnkgbWF0
Y2hpbmcgZnVuY3Rpb24gbmFtZSBhbmQNCj4gPiA+ID4gPiA+ID4gZ3JvdXAgbmFtZSBmb3IgYSBk
ZXZpY2UpLiBUaGlzIGRldmljZSBoYW5kbGUgY2FuIHRoZW4gYmUNCj4gPiA+ID4gPiA+ID4gdXNl
ZCBmb3IgZmluZGluZyBtYXRjaCBmb3IgdGhlIHBpbiBvdXRwdXQgZGlzYWJsZSBkZXZpY2UNCj4g
PiA+ID4gPiA+ID4gdGhhdCBwcm90ZWN0cyBkZXZpY2UgYWdhaW5zdCBzaG9ydCBjaXJjdWl0cyBv
biB0aGUgcGlucy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBOb3Qgc3VyZSBJIHVuZGVyc3Rh
bmQgdGhlIHVzZSBjYXNlLiBQbGVhc2UsIGNyZWF0ZSBhIGJldHRlcg0KPiA+ID4gPiA+ID4gY29t
bWl0DQo+ID4gPiA+IG1lc3NhZ2UuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPSywgQmFzaWNhbGx5
IHBpbm11eF9lbmFibGVfc2V0dGluZyBhbGxvd3MgZXhjbHVzaXZlIGFjY2VzcyBvZg0KPiA+ID4g
PiA+IHBpbiB0byBhDQo+ID4gPiA+IGRldmljZS4NCj4gPiA+ID4gPiBJdCB3b24ndCBhbGxvdyBt
dWx0aXBsZSBkZXZpY2VzIHRvIGNsYWltIGEgcGluLg0KPiA+DQo+ID4gVGhpcyBpcyBhIGNvbmZ1
c2lvbiB5b3UgYnJvdWdodC4gWW91IGdvdCB1cyBjb21wbGV0ZWx5IGxvc3QuIFBsZWFzZSwNCj4g
PiB0cnkgYWdhaW4gZnJvbSB0aGUgY2xlYW4gc2hlZXQuDQo+ID4NCj4gPiA+ID4gV2hpY2ggaXMg
Y29ycmVjdC4gTm8/IFNob3cgbWUgdGhlIHNjaGVtYXRpY3Mgb2YgdGhlIHJlYWwgdXNlIGNhc2UN
Cj4gPiA+ID4gZm9yDQo+ID4gdGhhdC4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIG93bmVyIG9mIHRo
ZSBwaW4gaXMgdGhlIGhvc3Qgc2lkZS4gSSBjYW4ndCBpbWFnaW5lIGhvdyB0aGUNCj4gPiA+ID4g
c2FtZSBwaW4gaXMgc2hhcmVkIGluc2lkZSB0aGUgU29DLiBJcyBpdCBicm9rZW4gaGFyZHdhcmUg
ZGVzaWduPw0KPiA+ID4NCj4gPiA+IFdlIGFyZSBkaXNjdXNzaW5nIHVzYWdlIG9mDQo+ID4gPg0K
PiA+ID4gZWNobyAiZm5hbWUgZ25hbWUiIGFuZCB5b3UgYXNrZWQgYSBxdWVzdGlvbiB3aGV0aGVy
IG11bHRpcGxlIGRldmljZXMNCj4gPiA+IGNhbiBjbGFpbSBhIHBpbiBhdCB0aGUgc2FtZSB0aW1l
DQo+ID4gPg0KPiA+ID4gYW5kIG15IGFuc3dlciBpcyBuby4NCj4gPg0KPiA+ID4gYXMgc2V0dGlu
Zy0+ZGF0YS5tdXggd2lsbCBiZSB1bmlxdWUgZm9yIGEgcGluIGFuZCB3aWxsIGJlIGNsYWltZWQg
YnkNCj4gPiA+IGRldmljZSBkdXJpbmcgY29tbWl0IHN0YXRlLg0KPiA+ID4NCj4gPiA+IEFtIEkg
bWlzc2luZyBhbnl0aGluZyBoZXJlPz8NCj4gPg0KPiA+IFllcy4gVGhlIHNhbWUgZm5hbWUvZ25h
bWUgY2FuIGJlIGluIG1hbnkgKnBpbiBjb250cm9sKiAocHJvdmlkZXIpIGRldmljZXMuDQo+IA0K
PiBJIGFncmVlLg0KPiANCj4gSSBoYXZlIHVzZWQgdGhlIGNvZGUgdXNlZCBmb3IgWzFdIGdldHRp
bmcgKnBpbiBjb250cm9sKiBkZXZpY2VzIGFzc29jaWF0ZWQNCj4gd2l0aCBmdW5jdGlvbiBuYW1l
IGFuZCBncm91cCBuYW1lLg0KPiANCj4gWzFdDQo+IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9waW5j
dHJsL3BpbmN0cmwtaGFuZGxlcw0KPiANCj4gaWYgb3V0cHV0IG9mIFsxXSwgY2FuIHJldHVybiBt
dWx0aXBsZSBkZXZpY2VzIGZvciBhIGdpdmVuIGZuYW1lL2duYW1lLCB0aGVuDQo+IEkgYW0gd3Jv
bmcuDQo+IFBsZWFzZSBjb3JyZWN0IG1lIGlmIHRoYXQgaXMgdGhlIGNhc2UuDQo+IA0KPiBTbyBJ
IHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IFsyXSwgaXQgd2lsbCBmYWlsIGlmIG11bHRp
cGxlIGRldmljZXMgdHJ5DQo+IHRvIGFjcXVpcmUgYSBwaW4uDQo+IA0KPiBbMl0NCj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL3BpbmN0cmwv
cGlubXV4LmMjTDEzMg0KDQoNCkkgaGF2ZSBkb25lIHRoZSBiZWxvdyBtb2RpZmljYXRpb25zIGlu
IG15IGR0IGFuZCBjb25maXJtIHRoYXQsIHBpbmN0cmwgZnJhbWV3b3JrDQpkb2Vzbid0IGFsbG93
IDIgZGV2aWNlcyB0byBjbGFpbSBwaW5zICB3aXRoIGEgZ2l2ZW4gZnVuY3Rpb24gbmFtZSBhbmQg
Z3JvdXAgbmFtZQ0KYXQgc2FtZSB0aW1lLg0KDQpkdC1jaGFuZ2VzOg0KJmdwdCB7DQorICAgICAg
ICAgICAgICAgZ3B0Ni1waW5zIHsNCisgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxS
WkcyTF9QT1JUX1BJTk1VWCg0NCwgMCwgNSk+LCAvKiBHVElPQzZBICovDQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5NVVgoNDQsIDEsIDUpPjsgLyogR1RJ
T0M2QiAqLw0KKyAgICAgICAgICAgICAgIH07DQorDQorICAgICAgICAgICAgICAgZ3B0Ny1waW5z
IHsNCisgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkcyTF9QT1JUX1BJTk1VWCg0
NCwgMiwgNSk+LCAvKiBHVElPQzdBICovDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8UlpHMkxfUE9SVF9QSU5NVVgoNDQsIDMsIDUpPjsgLyogR1RJT0M3QiAqLw0KKyAgICAgICAg
ICAgICAgIH07DQp9Ow0KDQombXR1IHsNCg0KKyAgICAgICAgICAgICAgIGdwdDYtcGlucyB7DQor
ICAgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8UlpHMkxfUE9SVF9QSU5NVVgoNDQsIDAs
IDQpPiwgLyogTVRJT0MzQSAqLw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFJa
RzJMX1BPUlRfUElOTVVYKDQ0LCAxLCA0KT4sIC8qIE1USU9DM0IgKi8NCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JUX1BJTk1VWCg0NCwgMiwgNCk+LCAvKiBNVElP
QzNDICovDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5N
VVgoNDQsIDMsIDQpPjsgLyogTVRJT0MzRCAqLw0KICAgICAgICAgICAgICAgIH07DQp9Ow0KDQpJ
bml0aWFsbHkgTVRVIGRldmljZSBpcyBjbGFpbWluZyB0aGUgcGlucyBQNDRfMCBhbmQgUDQ0XzEu
DQoNCnJvb3RAc21hcmMtcnpnMmw6fiMgY2F0IC9zeXMva2VybmVsL2RlYnVnL3BpbmN0cmwvcGlu
Y3RybC1oYW5kbGVzDQoJZGV2aWNlOiAxMDAwMTIwMC50aW1lciBjdXJyZW50IHN0YXRlOiBkZWZh
dWx0DQogIHN0YXRlOiBkZWZhdWx0DQogICAgdHlwZTogTVVYX0dST1VQIGNvbnRyb2xsZXIgcGlu
Y3RybC1yemcybCBncm91cDogbXR1M196cGhhc2VfY2xrICgzKSBmdW5jdGlvbjogbXR1M196cGhh
c2VfY2xrICgzKQ0KICAgIHR5cGU6IE1VWF9HUk9VUCBjb250cm9sbGVyIHBpbmN0cmwtcnpnMmwg
Z3JvdXA6IG10dTNfY2xrICg0KSBmdW5jdGlvbjogbXR1M19jbGsgKDQpDQogICAgdHlwZTogTVVY
X0dST1VQIGNvbnRyb2xsZXIgcGluY3RybC1yemcybCBncm91cDogZ3B0Ni1waW5zICg1KSBmdW5j
dGlvbjogZ3B0Ni1waW5zICg1KQ0KDQpXaGVuIEl0IHRyaWVkIHRvIGxvYWQgZ3B0LCBJIGdldCB0
aGUgYmVsb3cgZXJybywNClsgICAxNS4wMjQ3MTRdIHBpbmN0cmwtcnpnMmwgMTEwMzAwMDAucGlu
Y3RybDogcGluIFA0NF8wIGFscmVhZHkgcmVxdWVzdGVkIGJ5IDEwMDAxMjAwLnRpbWVyOyBjYW5u
b3QgY2xhaW0gZm9yIDEwMDQ4MDAwLnB3bQ0KICAgICAgICAgU3RhcnRpbmcgVXBkYXRlIFVUTVAg
YWJvdXQgU3lzdGVtIFJ1bmxldmVsIENoYW5nZXMuLi4NClsgICAxNS4wNDQ4MjhdIHBpbmN0cmwt
cnpnMmwgMTEwMzAwMDAucGluY3RybDogcGluLTM1MiAoMTAwNDgwMDAucHdtKSBzdGF0dXMgLTIy
DQpbICAgMTUuMDU2NTE1XSBwaW5jdHJsLXJ6ZzJsIDExMDMwMDAwLnBpbmN0cmw6IGNvdWxkIG5v
dCByZXF1ZXN0IHBpbiAzNTIgKFA0NF8wKSBmcm9tIGdyb3VwIGdwdDYtcGlucyAgb24gZGV2aWNl
IHBpbmN0cmwtcnpnMmwNClsgICAxNS4wNzAyMjRdIHB3bS1yemcybC1ncHQgMTAwNDgwMDAucHdt
OiBFcnJvciBhcHBseWluZyBzZXR0aW5nLCByZXZlcnNlIHRoaW5ncyBiYWNrDQoNCkFmdGVyIHVu
bG9hZGluZyBtdHUgbW9kdWxlcyBhbmQgbG9hZGluZyBncHQgbW9kdWxlcywgZ3B0IG1vZHVsZSBp
cyBjbGFpbXMgdGhlIHBpbi4NCg0Kcm9vdEBzbWFyYy1yemcybDp+IyBybW1vZCByel9tdHUzX2Nu
dA0Kcm9vdEBzbWFyYy1yemcybDp+IyBybW1vZCBwd21fcnpfbXR1Mw0Kcm9vdEBzbWFyYy1yemcy
bDp+IyBjZCAvc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL3J6LW10dTMvDQpyb290QHNtYXJjLXJ6
ZzJsOi9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvcnotbXR1MyMgZWNobyAxMDAwMTIwMC50aW1l
ciA+IHVuYmluZA0Kcm9vdEBzbWFyYy1yemcybDovc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL3J6
LW10dTMjIHJtbW9kIHJ6ZzJsX3BvZWcNCnJvb3RAc21hcmMtcnpnMmw6L3N5cy9idXMvcGxhdGZv
cm0vZHJpdmVycy9yei1tdHUzIyBybW1vZCBwd21fcnpnMmxfZ3B0DQpyb290QHNtYXJjLXJ6ZzJs
Oi9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvcnotbXR1MyMgY2F0IC9zeXMva2VybmVsL2RlYnVn
L3BpbmN0cmwvcGluY3RybC1oYW5kbGVzIHwgZ3JlcCBncHQNCnJvb3RAc21hcmMtcnpnMmw6L3N5
cy9idXMvcGxhdGZvcm0vZHJpdmVycy9yei1tdHUzIw0KDQpyb290QHNtYXJjLXJ6ZzJsOi9zeXMv
YnVzL3BsYXRmb3JtL2RyaXZlcnMvcnotbXR1MyMgbW9kcHJvYmUgcnpnMmxfcG9lZw0Kcm9vdEBz
bWFyYy1yemcybDovc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL3J6LW10dTMjIG1vZHByb2JlIHB3
bV9yemcybF9ncHQNCnJvb3RAc21hcmMtcnpnMmw6L3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy9y
ei1tdHUzIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvcGluY3RybC9waW5jdHJsLWhhbmRsZXMgfCBn
cmVwIGdwdA0KICAgIHR5cGU6IE1VWF9HUk9VUCBjb250cm9sbGVyIHBpbmN0cmwtcnpnMmwgZ3Jv
dXA6IGdwdDYtcGlucyAoNSkgZnVuY3Rpb246IGdwdDYtcGlucyAoNSkNCiAgICB0eXBlOiBNVVhf
R1JPVVAgY29udHJvbGxlciBwaW5jdHJsLXJ6ZzJsIGdyb3VwOiBncHQ3LXBpbnMgKDExKSBmdW5j
dGlvbjogZ3B0Ny1waW5zICgxMSkNCg0Kcm9vdEBzbWFyYy1yemcybDovc3lzL2J1cy9wbGF0Zm9y
bS9kcml2ZXJzL3J6LW10dTMjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9waW5jdHJsL3BpbmN0cmwt
aGFuZGxlcw0KZGV2aWNlOiAxMDA0ODAwMC5wd20gY3VycmVudCBzdGF0ZTogZGVmYXVsdA0KICBz
dGF0ZTogZGVmYXVsdA0KICAgIHR5cGU6IE1VWF9HUk9VUCBjb250cm9sbGVyIHBpbmN0cmwtcnpn
MmwgZ3JvdXA6IGdwdDYtcGlucyAoNSkgZnVuY3Rpb246IGdwdDYtcGlucyAoNSkNCiAgICB0eXBl
OiBNVVhfR1JPVVAgY29udHJvbGxlciBwaW5jdHJsLXJ6ZzJsIGdyb3VwOiBncHQ3LXBpbnMgKDEx
KSBmdW5jdGlvbjogZ3B0Ny1waW5zICgxMSkNCg0KDQpTaW5jZSBJIGhhdmUgdXNlZCBzYW1lIGZ1
bmN0aW9uIG5hbWUvIGdyb3VwIG5hbWUgaXQgZ2V0cyBhIHVuaXF1ZSBzZWxlY3Rvcig1KSBhbmQg
dGhlIGZ1bmN0aW9uYWxpdHkgZm9yDQpncHQgaXMgbm90IHdvcmtpbmcgYXMgdGhlIHNlbGVjdG9y
IG1lYW50IGZvciBNVFUuDQoNCkJ1dCBpZiBJIHJlcGxhY2UgImdwdDYtcGlucyIgLT4gIm10dS1w
aW5zIiBpbiBNVFUgbm9kZSwgdGhlbiB0aGUgZnVuY3Rpb25hbGl0eSB3b3JrcyBhcyBleHBlY3Rl
ZCBhcw0KdGhlIHNlbGVjdG9yIGlzIGRpZmZlcmVudCBmb3IgbXR1LXBpbnMgYW5kIGdwdC1waW5z
IGV2ZW50aG91Z2ggYm90aCB1c2VzIHNhbWUgcGlucy4NCg0KU28gSSBiZWxpZXZlIGN1cnJlbnQg
aW1wbGVtZW50YXRpb24gaXMgYmFzZWQgb24gL3N5cy9rZXJuZWwvZGVidWcvcGluY3RybC9waW5j
dHJsLWhhbmRsZXMgaXMNCmdvb2QgdW5sZXNzIEkgbWlzcyBzb21ldGhpbmcgaGVyZS4gUGxlYXNl
IGNvcnJlY3QgbWUsaWYgeW91IHRoaW5rIG15IG9ic2VydmF0aW9uIGlzIHdyb25nLg0KDQpDaGVl
cnMsDQpCaWp1DQo=
