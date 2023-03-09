Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83E276B269C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 15:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbjCIOT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 09:19:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbjCIOTz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 09:19:55 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA33B73035;
        Thu,  9 Mar 2023 06:19:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcNAKt/fvFGgS7NPq92rDg8CA9yg7BoyUVyVC8KZfEZ2Vt281cxyAWdjfEitQlOn6njDI6mQszg5IsHT2D5sHfYu6kQK6z0rD3Q2BjdpN9LbZDnWt/JTgw45DHi8grjYnK9JERQ9sThrWEEnAriUiTBNzuIyXOq+mJJpiiHrB6N4cKP6KBBb4F7Dp48DaXbR610xnxwxuuCxiT8MDIRD3bCQ2XkAeyTizsdB1mC1yOALwrvtOSF398kwUclFP0Zyk1zt7lEryhMdOgJDbW1DdVghywL/1LVHVZg+FUx8Z0jxo1K+eI2AIw0txJXkjxQ7OEjJ1U2yIr1DvDQ3fZPhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FykOLrOcKOxBaIIya68tyDVA6ppXkHB7h15rJZtNaDY=;
 b=MZ5lAqqcwBsJtnzJmEjKYIdoPfiEQ6QCm6a1n4Sssuw6S86XguxSuYyw/ad/TmCYIzUisuj/O8kUdoCOESurG7n8g3KP/Ity3jDmwV/tsI+t/t1AdjEu1R+oIe5t2/mNjYFWlu2CFIxGmYXh+22z04LqZN8jTDyLWLCmxK8FIln+9X4Aa7v8E4EHV93mQhI27AHVCCgBHm0PLm+cCwJRqIEMu5LBgiADX0JXrf8AfpOZnTEqi4VIky9N5UjAayyznYM7O2/fl0sm3HBGQeeINRzHzAIyEWDkE2cmZFJ5H3hvm8Gsto9PWipXxW/3RP2uGxADhBp9IN+pYb5C5TdFSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FykOLrOcKOxBaIIya68tyDVA6ppXkHB7h15rJZtNaDY=;
 b=Cy8BqcRsM1bW/j6xsntY/e7zegGMPHPsekCIv9zTLrrryh53fo0W2roXsqrSDUXg7euyKNKGLTyvu1Ive0uPQFc89oY2SlAdvzRNRnR/QoJLjDbFy3KyrvihugFWmDYHHKsu7oIIUOKQ+tMTY59ItfwyvnZo5Gcsbpjnew+HYck=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11058.jpnprd01.prod.outlook.com (2603:1096:400:3ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 14:19:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 14:19:50 +0000
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
Thread-Index: AQHZUAoZhjJXzQRnckWhgNWWpo0zwa7uZ+eAgACJSoCAA3tbgIAABvEQgAAHBACAAACOAA==
Date:   Thu, 9 Mar 2023 14:19:49 +0000
Message-ID: <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com>
 <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
 <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com>
In-Reply-To: <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11058:EE_
x-ms-office365-filtering-correlation-id: a4131513-ecc4-4973-af1f-08db20a957ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ITzlGOiAPZLz3tUcyfPexLtzxPo/RlU0iSzBlGLzPSywOGkW08eKR7YIByoX6ZjZAuEtT0pLukJx80sM6TNeJmAMvAI7j7nxl1EObs4KBiv/UUMMG1ByA8mV+n9SnlR9dZvGTXCytrw9lz7wDPPKPAmMyMXM5LEKQOUOgIMtdf1kkpLSQgvbyfWRHRmwXW7L1t451XaIV5QZCyKBctHe7kPkYHly9IPEl0rAJtno65aUlXjNSF1+xbHFlEVsC1jKPTyfTrxJ8N1PZYTyiheRrtL7oTQtusC6n+ODdbnId2YS1oN/aFpZwfByPYgLn6w1L7vIqiiPWEXSZKXAZjtTf8AFKpFsXy62m2gllD5JCFd7/J27yOhKKPFJwpcA1HCJMuhHWbxe44JK6+hfsmrS5LncpnbJEBDUZqiEhe1GMLx5P/8I7kaI92luZ9AnCgGLXo89hCVmlNl00hHU0blHjWV2jGZXwW8hVdpYg3M885k2YvdUaRljbnTIXhJmOcR0iZ8a47JMa68rkeVbuVGlZHP3iw6H6wh7qvZLxh8CpqYJQvlWX949/QIB5r+tgjTsxua9WrSYRccP9TVSESBsN01eEea8M5YY1wAA+ROt3lPCCWKXZ9oMKOhU8rXpBiQ3YaU0qmmqJeKYEUBxVpml/WpVZpPBHic4kMaHGmBtaUtVM1f+BEz83eGGEOCPvNTE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199018)(54906003)(186003)(33656002)(55016003)(38100700002)(86362001)(38070700005)(122000001)(53546011)(6506007)(26005)(83380400001)(9686003)(71200400001)(52536014)(316002)(5660300002)(478600001)(966005)(7696005)(4326008)(41300700001)(6916009)(64756008)(2906002)(8936002)(76116006)(66946007)(66556008)(8676002)(66476007)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnRscXRkZFB5ZUlqYXdiaDF1TjIwenk1VThCT0tTTkZFMUYvUllJalc1alJL?=
 =?utf-8?B?blNjR3dKUTlDUVFxWXFqUTFHb3Zkb2JmT1YwNGNCT3RtK2lWZThRVmpXcEx3?=
 =?utf-8?B?a2tyeUZaSkthbUJ5enFFNkdZY0oxeHVsanFXUTdJVjlEWlFwOU1DR2R2RDFB?=
 =?utf-8?B?NFNUUFZ2aDNISlpxUi8waGRNUnBSK2VmTU5VcHlXN0VpUDJWUXBkWUI2TGZl?=
 =?utf-8?B?ZVN0UTNobmlWS1JlN0pXdEpXenJRR21JWWJZMWdxRFJIc2ZobjVTWW04OWZn?=
 =?utf-8?B?ZFpkZDgxdnduTDROUTFZN3BpTmxFVzYrbU5Xait4Tjc4WGFQN0F4aEFmT01v?=
 =?utf-8?B?RExyanIwTXlmZDZRckdmWWM1TWZXN1dYZzF1cStVYllLSFduL1Y0Vi9lZHpT?=
 =?utf-8?B?Ni9wYXV5cUgrTUxRbktGWExvdFZVbU9lVWlhTEZlcGdJTDFkRzBQV3hwZWEx?=
 =?utf-8?B?N3FqY0RZVHQrOGJFSFNEZUMzd2FEQUdsYWVMa2tqK2svTnQ4dTFRTGRscjZI?=
 =?utf-8?B?WWFKWlorODl6VzVxcTkxN3FlSEYxQU85YncxY1F6WUpFV1hZbXFWK0YwMk1K?=
 =?utf-8?B?UEFUNlh3S3FLS3VYMzRZUkhVY1ZsZVFUcXRCQ2Fhd0ZJZldmRit4STd4VWEz?=
 =?utf-8?B?N2loNHRSYm5WZVVxT0JvazhOS0M2ZTROdnZDQW9tWTdyT1NFM1NyeHhWM1Vy?=
 =?utf-8?B?QU9PMHVlV1U2UzJVVDVwR0R2bkh1SDd1WEFoYkFleEg3aVJZTUJ1YkEwTW5j?=
 =?utf-8?B?WS9ld3lhZEpaRk1IYXJGSEpJbVJmTG9kZ0hIZW85RDJDYzlHa0Y0Tk9hU2kx?=
 =?utf-8?B?YnhnUHd4QjlkTUJsNTV1aFAraVB4cXI0SjN5dGwrTE4yN0xuRXowTm9OZE5a?=
 =?utf-8?B?c01Cd3B2bzJFSGpza25EbHJWbVRWRUNNWmVYNVBRKy9VQnpjNmF6eHJ1dXJU?=
 =?utf-8?B?MUtVb0JkSVJHQlprWkVxR3FZdzVZU2I2ZFJxTXVMN1FzTGNwUXZmd1k1UGoy?=
 =?utf-8?B?M2RHRjQvcTdkT0gwNXJINm1CWDBJY2RTdlMxYWJuOTlTTEVURzh4cGpYWTRx?=
 =?utf-8?B?UU42cTAvYW1zUTViMzhIUVdaVVhVQjYvQmVhbG1OdllldlpJZm90YzFTMk1o?=
 =?utf-8?B?K2hlY2kxVisrZW9JNndwNVJ1aG9VUUY4ZlBkL0hKQVJPcFFlVHZxL0lSUUll?=
 =?utf-8?B?d2g3d0pndEZSRXlpMWVIV1ZzblEyeUdTanA3YXVRVjlINUNoM2lYaDdLamVJ?=
 =?utf-8?B?ODV0OHZTQWEvOEpaczY3M1h1S3VjbTNLcDZhTytyaEhZcVYwSnBKdzlQcGNY?=
 =?utf-8?B?ZGRBQlc4NnFuS3lLYWxqSWVEd2l2WkhkcmZEaml2cGs0SmNOWDRmN3BEdldy?=
 =?utf-8?B?OHNrNXhGR1pybzdnWUMrUDZoNVM2UkoveWIwRGd6QnFFbUcwOVJENmJFQlFa?=
 =?utf-8?B?QmpOcnZqbmdLWElnMVZud0RmKzA4TGswaFVSYkthNDhZTXBzbGFLR09ySFFm?=
 =?utf-8?B?OXB5dklhZ2dLZHl1aEFwVk1mL2NSRDcwQzZlZUtOVmdYbVhaZGF3SURqcVBX?=
 =?utf-8?B?MXBmZzhEWEdJb0ZwcXVnMWRKa1dnZEUzbDI2VWVqN1ZHcWhkLy9aMHZMVERz?=
 =?utf-8?B?OG1OcCtCbVZQZ0o2clpkSCtCcUNRZlBBbUNZR0h6VGdKZmEydGczZjRwTGoy?=
 =?utf-8?B?S3pMU0J3elpPcVdCRUk0bml1bDl2R2RKMHJMaXdhanlDWk9JTU44QWhjZmhj?=
 =?utf-8?B?Yk5Ndmt4QVlWQ21Vd0xNNXcyQXBTSnJzeDlpN1hLRnV6WWNsMnBmR1UyS01J?=
 =?utf-8?B?a0FpZFlZQXhOU2g1Q0xGWHdnMjZFZVJ4R0FqdUQ0WE8rSW5RV00vWmFYbjRJ?=
 =?utf-8?B?a1JmeXNTSnFqZ2ZZYUF2Rng4MlBBOGdqa3FFNDVBNXFQcmlEZzNBeldEd0hl?=
 =?utf-8?B?dktEdmd0bW9CR1Z1TWNYRWRTQ0ppTlFMNXRUS3p5cEQ5eVhPcGh1UFNWdCtP?=
 =?utf-8?B?RXpnSkpXUnAxbmNOQzJZWVJtRDRxLzNBSmdEcFFLZGl4MWFlN0R2d3pWMVpW?=
 =?utf-8?B?ZkczZjhsei85UU5VTlZ6VG93SmtWQWFrVUpMRTQ3NFF6eDFDVlJnK2gwbUZX?=
 =?utf-8?Q?kTM3ke9k16xS4GX6b3P97FcdL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4131513-ecc4-4973-af1f-08db20a957ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 14:19:49.9460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RXBHlsvNJOTMdFdyIvcEvaD+PepRfFvLN6ad1jW8TAcwU5eXCzZ9tBKenjQgX/KW+tTz4dywYvI2R9hG7sBloBlQQUuHfaUxIe3o+x9YplU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11058
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSwNCg0KVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NiAwMS8xM10gcGluY3RybDogY29yZTogQWRkIHBpbmN0cmxfZ2V0X2RldmljZSgp
DQo+IA0KPiBPbiBUaHUsIE1hciA5LCAyMDIzIGF0IDM6MjbigK9QTSBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2
NiAwMS8xM10gcGluY3RybDogY29yZTogQWRkDQo+ID4gPiBwaW5jdHJsX2dldF9kZXZpY2UoKSBP
biBUdWUsIE1hciA3LCAyMDIzIGF0IDEwOjEz4oCvQU0gQmlqdSBEYXMNCj4gPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2
IDAxLzEzXSBwaW5jdHJsOiBjb3JlOiBBZGQNCj4gPiA+ID4gPiBwaW5jdHJsX2dldF9kZXZpY2Uo
KSBNb24sIE1hciAwNiwgMjAyMyBhdCAwOTowMDowMkFNICswMDAwLCBCaWp1DQo+ID4gPiA+ID4g
RGFzDQo+ID4gPiBraXJqb2l0dGk6DQo+IA0KPiAuLi4NCj4gDQo+ID4gPiA+ID4gPiBBZGQgcGlu
Y3RybF9nZXRfZGV2aWNlKCkgdG8gZmluZCBhIGRldmljZSBoYW5kbGUgYXNzb2NpYXRlZA0KPiA+
ID4gPiA+ID4gd2l0aCBhIHBpbmNvbnRyb2wgZ3JvdXAoaS5lLiBieSBtYXRjaGluZyBmdW5jdGlv
biBuYW1lIGFuZA0KPiA+ID4gPiA+ID4gZ3JvdXAgbmFtZSBmb3IgYSBkZXZpY2UpLiBUaGlzIGRl
dmljZSBoYW5kbGUgY2FuIHRoZW4gYmUgdXNlZA0KPiA+ID4gPiA+ID4gZm9yIGZpbmRpbmcgbWF0
Y2ggZm9yIHRoZSBwaW4gb3V0cHV0IGRpc2FibGUgZGV2aWNlIHRoYXQNCj4gPiA+ID4gPiA+IHBy
b3RlY3RzIGRldmljZSBhZ2FpbnN0IHNob3J0IGNpcmN1aXRzIG9uIHRoZSBwaW5zLg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gTm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoZSB1c2UgY2FzZS4gUGxlYXNl
LCBjcmVhdGUgYSBiZXR0ZXINCj4gPiA+ID4gPiBjb21taXQNCj4gPiA+IG1lc3NhZ2UuDQo+ID4g
PiA+DQo+ID4gPiA+IE9LLCBCYXNpY2FsbHkgcGlubXV4X2VuYWJsZV9zZXR0aW5nIGFsbG93cyBl
eGNsdXNpdmUgYWNjZXNzIG9mIHBpbg0KPiA+ID4gPiB0byBhDQo+ID4gPiBkZXZpY2UuDQo+ID4g
PiA+IEl0IHdvbid0IGFsbG93IG11bHRpcGxlIGRldmljZXMgdG8gY2xhaW0gYSBwaW4uDQo+IA0K
PiBUaGlzIGlzIGEgY29uZnVzaW9uIHlvdSBicm91Z2h0LiBZb3UgZ290IHVzIGNvbXBsZXRlbHkg
bG9zdC4gUGxlYXNlLCB0cnkNCj4gYWdhaW4gZnJvbSB0aGUgY2xlYW4gc2hlZXQuDQo+IA0KPiA+
ID4gV2hpY2ggaXMgY29ycmVjdC4gTm8/IFNob3cgbWUgdGhlIHNjaGVtYXRpY3Mgb2YgdGhlIHJl
YWwgdXNlIGNhc2UgZm9yDQo+IHRoYXQuDQo+ID4gPg0KPiA+ID4gVGhlIG93bmVyIG9mIHRoZSBw
aW4gaXMgdGhlIGhvc3Qgc2lkZS4gSSBjYW4ndCBpbWFnaW5lIGhvdyB0aGUgc2FtZQ0KPiA+ID4g
cGluIGlzIHNoYXJlZCBpbnNpZGUgdGhlIFNvQy4gSXMgaXQgYnJva2VuIGhhcmR3YXJlIGRlc2ln
bj8NCj4gPg0KPiA+IFdlIGFyZSBkaXNjdXNzaW5nIHVzYWdlIG9mDQo+ID4NCj4gPiBlY2hvICJm
bmFtZSBnbmFtZSIgYW5kIHlvdSBhc2tlZCBhIHF1ZXN0aW9uIHdoZXRoZXIgbXVsdGlwbGUgZGV2
aWNlcw0KPiA+IGNhbiBjbGFpbSBhIHBpbiBhdCB0aGUgc2FtZSB0aW1lDQo+ID4NCj4gPiBhbmQg
bXkgYW5zd2VyIGlzIG5vLg0KPiANCj4gPiBhcyBzZXR0aW5nLT5kYXRhLm11eCB3aWxsIGJlIHVu
aXF1ZSBmb3IgYSBwaW4gYW5kIHdpbGwgYmUgY2xhaW1lZCBieQ0KPiA+IGRldmljZSBkdXJpbmcg
Y29tbWl0IHN0YXRlLg0KPiA+DQo+ID4gQW0gSSBtaXNzaW5nIGFueXRoaW5nIGhlcmU/Pw0KPiAN
Cj4gWWVzLiBUaGUgc2FtZSBmbmFtZS9nbmFtZSBjYW4gYmUgaW4gbWFueSAqcGluIGNvbnRyb2wq
IChwcm92aWRlcikgZGV2aWNlcy4NCg0KSSBhZ3JlZS4gDQoNCkkgaGF2ZSB1c2VkIHRoZSBjb2Rl
IHVzZWQgZm9yIFsxXSBnZXR0aW5nICpwaW4gY29udHJvbCogZGV2aWNlcyBhc3NvY2lhdGVkIHdp
dGggZnVuY3Rpb24gbmFtZQ0KYW5kIGdyb3VwIG5hbWUuDQoNClsxXQ0KY2F0IC9zeXMva2VybmVs
L2RlYnVnL3BpbmN0cmwvcGluY3RybC1oYW5kbGVzDQoNCmlmIG91dHB1dCBvZiBbMV0sIGNhbiBy
ZXR1cm4gbXVsdGlwbGUgZGV2aWNlcyBmb3IgYSBnaXZlbiBmbmFtZS9nbmFtZSwgdGhlbiBJIGFt
IHdyb25nLg0KUGxlYXNlIGNvcnJlY3QgbWUgaWYgdGhhdCBpcyB0aGUgY2FzZS4NCg0KU28gSSB3
YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBbMl0sIGl0IHdpbGwgZmFpbCBpZiBtdWx0aXBs
ZSBkZXZpY2VzIHRyeSB0byBhY3F1aXJlIGEgcGluLg0KDQpbMl0NCmh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9waW5jdHJsL3Bpbm11eC5jI0wx
MzINCg0KDQo+IA0KPiBTbywgaXQgZG9lcyBub3QgdW5pcXVlbHkgZGVmaW5lIHRoZSBwaW4gY29u
dHJvbCBkZXZpY2UuDQoNCkkgYWdyZWUuDQoNCg0KPiANCj4gLi4uDQo+IA0KPiA+ID4gPiA+IEFs
c28gaXQgaXMgbWlzc2luZyB0aGUgZXhwbGFuYXRpb24gd2h5IHRoZXJlIHdpbGwgYmUgbm8NCj4g
PiA+ID4gPiBjb2xsaXNpb25zIHdoZW4gbG9va2luZyBieSB0aGUgc2FtZSBwYWlyIG9mIGZ1bmN0
aW9uIGFuZCBncm91cA0KPiA+ID4gPiA+IG5hbWUgZnJvbSBkaWZmZXJlbnQNCj4gPiA+IGRldmlj
ZS4NCj4gPiA+ID4NCj4gPiA+ID4gc2V0dGluZy0+ZGF0YS5tdXggd2lsbCBiZSB1bmlxdWUgZm9y
IGEgcGluLiBTbyB0aGVyZSB3b24ndCBiZSBhDQo+ID4gPiA+IHNldHRpbmctPmNvbGxpc2lvbiB3
aGVuDQo+ID4gPiA+IGxvb2tpbmcgYnkgdGhlIHNhbWUgcGFpciBvZiBmdW5jdGlvbiBhbmQgZ3Jv
dXAgbmFtZSBmcm9tIGRpZmZlcmVudA0KPiBkZXZpY2UuDQo+ID4gPiA+DQo+ID4gPiA+ID4gKEFs
d2F5cyBpbWFnaW5lIHRoYXQgeW91IGhhdmUgMisgc2FtZSBJUCBibG9ja3Mgb24gdGhlIHBsYXRm
b3JtDQo+ID4gPiA+ID4gYmVmb3JlIGRvaW5nIGFueSBwaW4gY29udHJvbCBjb3JlIHdvcmsuIFRo
aXMgd2lsbCBoZWxwIHlvdSB0bw0KPiA+ID4gPiA+IGRlc2lnbiBpdCBwcm9wZXJseS4gKQ0KPiA+
ID4NCj4gPiA+IE5vdCBzdXJlIGhvdyB0aGUgcGFpciBmdW5jdGlvbl9uYW1lIGdyb3VwX25hbWUg
bWFrZXMgdGhlIGRldmljZSB1bmlxdWUuDQo+ID4NCj4gPiBEbyB5b3UgYWdyZWUgRGV2aWNlIGhh
bmRsZSArIGZ1bmN0aW9uX25hbWUgKyAgZ3JvdXBfbmFtZSBtYWtlIGl0IHVuaXF1ZS4NCj4gDQo+
IFllcy4NCj4gDQo+ID4gRm9yIHBpbiBvdXRkaXNhYmxlIHdlIGFyZSBtYWtpbmcgdXNlIG9mIHRo
aXMgMyBjb21iaW5hdGlvbi4NCj4gPiBTZWUgdGhlIGRldGFpbHMuDQo+ID4NCj4gPg0KPiA+IFRo
aXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgY29udHJvbGxpbmcgb3V0cHV0IGRpc2Fi
bGUgZnVuY3Rpb24NCj4gPiB1c2luZyBzeXNmcyBpbiBhIGdlbmVyaWMgd2F5IGFzIGRlc2NyaWJl
ZCBiZWxvdy4NCj4gPg0KPiA+IHwgICAgQSAgICAgfCAgICB8ICAgICBCICAgICAgfCAgICB8ICAg
ICBDICAgICB8ICAgIHwgICAgIEQgICAgICAgIHwgIHwgRSB8DQo+ID4gfHVzZXIgc3BhY2V8LS0t
PnxwaW5jdHJsIGNvcmV8PC0tPnxTb0MgcGluY3RybHw8LS0+fE91dHB1dCBkaXNhYmxlfC0tfFBX
TXwNCj4gPiB8ICAgICAgICAgIHwgICAgfCAgICAgICAgICAgIHwgICAgfCAgICAgICAgICAgfCAg
ICB8ICAgICAgICAgICAgICB8ICB8ICAgfA0KPiA+DQo+ID4gQSBleGVjdXRlcyBjb21tYW5kIHRv
IGNvbmZpZ3VyZSBhIHBpbiBncm91cCBmb3IgcGluIG91dHB1dCBkaXNhYmxlDQo+IG9wZXJhdGlv
bg0KPiA+ICAgZWNobyAiZm5hbWUgZ25hbWUgY29uZiBjb25mX3ZhbCIgPiBjb25maWd1cmUNCj4g
Pg0KPiA+IEIgcGFyc2VzIHRoZSBjb21tYW5kIGFuZCBpZGVudGlmaWVzIHRoZSBiaW5kaW5nIGRl
dmljZSBhc3NvY2lhdGVkIHdpdGgNCj4gdGhhdA0KPiA+ICAgcGluIGdyb3VwDQo+ID4NCj4gPiBD
IG1hdGNoZXMgdGhlIGJpbmRpbmcgZGV2aWNlIGFnYWluc3QgdGhlIGRldmljZSByZWdpc3RlcmVk
IGJ5IEQgZm9yDQo+ID4gICBjb25maWd1cmF0aW9uIG9wZXJhdGlvbg0KPiA+DQo+ID4gRCBtYXRj
aGVzIHRoZSBwaW4gZ3JvdXAgYW5kIGNvbmZpZ3VyZSB0aGUgcGlucyBmb3IgT3V0cHV0IGRpc2Fi
bGUNCj4gPiBvcGVyYXRpb24NCj4gPg0KPiA+IEJvdGggRCBhbmQgRSBhcmUgbGlua2VkIHRvZ2V0
aGVyIGJ5IGR0KGkuZS4gUFdNIGNoYW5uZWwgbGlua2VkIHdpdGgNCj4gPiBPdXRwdXQgIGRpc2Fi
bGUgUG9ydCkNCj4gDQo+IFNvdW5kcyBsaWtlIGFuIG92ZXJlbmdpbmVlcmVkIGhhY2sgdG8gYWNo
aWV2ZSBzb21ldGhpbmcgdGhhdCBJIGNhbid0IHJlYWQNCj4gYmV0d2VlbiB0aGUgbGluZXMuIFdo
eSBpcyB0aGlzIHNvIGNvbXBsaWNhdGVkIGludGVyZmFjZSBhbmQgZmxvdyBhcmUgbmVlZGVkDQo+
IHRvIGJlZ2luIHdpdGg/DQoNCkl0IGlzIHZlcnkgc2ltcGxlLg0KDQpJIGFtIHRyeWluZyB0byBn
aXZlIGRldGFpbHMgbGlrZSBob3cgYSBwd20gcGlucyB1c2VkIGZvciBwaW4gb3V0cHV0IGRpc2Fi
bGUNCmlzICBjb25maWd1cmVkIGZyb20gdXNlciBzcGFjZSBpbiBhIGdlbmVyaWMgd2F5Lg0KDQpN
eSB1c2UgY2FzZSBpcywNCg0KSSBoYXZlIGFuIElQIHdoaWNoIGRldGVjdHMgc2hvcnQgY2lyY3Vp
dCBiZXR3ZWVuIHRoZSBvdXRwdXQgdGVybWluYWxzIGFuZCANCmRpc2FibGUgdGhlIG91dHB1dCBm
cm9tIHB3bSBwaW5zICx3aGVuIGl0IGRldGVjdHMgc2hvcnQgY2lyY3VpdCB0byBwcm90ZWN0IGZy
b20NCnN5c3RlbSBmYWlsdXJlLg0KDQpwd20tcGlucyBhcmUgaW52b2x2ZWQgaW4gdGhpcyBvcGVy
YXRpb24uDQoNCkZyb20gdXNlciBzcGFjZSB3ZSBuZWVkIHRvIGNvbmZpZ3VyZSB0aGUgdHlwZSBv
ZiBwcm90ZWN0aW9uIGZvciB0aGlzIHBpbnMgKGVnOiBkaXNhYmxlIFBXTSBvdXRwdXQsDQp3aGVu
IGJvdGggcHdtIG91dHB1dHMgYXJlIGhpZ2ggYXQgc2FtZSB0aW1lKS4NCg0KRm9yIHRoYXQsIHdl
IG5lZWQgdG8gZmluZCBhIHByb3ZpZGVyIGRldmljZSAod2hpY2ggcHJvdmlkZXMgZ3B0LXBpbnMp
Lg0KDQpwaW5jdHJsX2dldF9kZXZpY2UoKSByZXR1cm5zICJjdXJyZW50IHByb3ZpZGVyIGRldmlj
ZSIgYXNzb2NpYXRlZCB3aXRoIGZuYW1lL2duYW1lLg0KSWYgIiBjdXJyZW50IHByb3ZpZGVyIGRl
dmljZSIgPT0gInB3bSBkZXZpY2UiIGRvIHRoZSBjb25maWd1cmF0aW9uLg0KDQpDaGVlcnMsDQpC
aWp1DQoNCg0KDQo=
