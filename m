Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C817C7263
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 18:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344029AbjJLQYH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 12:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344015AbjJLQYG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 12:24:06 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041B5A9;
        Thu, 12 Oct 2023 09:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZUVGnvkfJnJxue5+Y68hy9b2YYglXbeaB1slF4GFgI9VF1tGSK4kCWMffgQoiMRhIVkBmYjmG0LgZb1MMOP3y5/+4ohshMxjvzO6I/7mFVkq9zuXTg/eEUCitunR3Aqs+kycxarmtTpgqXFVQrYlFp3GyCLgeT2G2XO6UJoi2pVvmR3+qip1k+Tp5BI8nR5J8wTWGV2NJ6VjjqsLz8HlYmlA2zr5bZkUviFDkfGfHixF6/gjOLAZKsrsz/HA8oGgcFS1RhiiZ09rqVe2WUbilJ8pkezHCbHQxlw3RJhOL8Fj+3Z0YGzyY2cF+k5F1yir2LnZcslQluf58gR7StG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag+bUrbPwVENSmVxQbJJlZ2Pfh1V+kHRTMmIySevRzo=;
 b=eRONJP3ru6niO6iuqVgv7IscJS865fTCYtCItXigNBfr7IYHoA1moqhRLOGaWzJltKy0zeUb8vEz7/oVat02A7AmLg8v6zdLC9chhojnE+T2rGxdeyAlp5iUHvT0o170cr/rgLx4JddcSS8c0GUXy/qpxFCk3xWycRKXv9rqxQbceF2wuLEBNshW+Tfk7E08XwPiOd8B1fMdKP/eIFbfY8YP4buW7f4tfLmF+zVPOmQDveAqJKLMNdh6taX5h5D1v51fUl/E8sfc2CDRuJORfluXOy7bua0xCOnNomfDzijdBtc7CAZHU3kPE3kBTJ4nn52/WoWspFB3BtbIl7gtZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag+bUrbPwVENSmVxQbJJlZ2Pfh1V+kHRTMmIySevRzo=;
 b=PmDm8pZs318DQnE25FUqHI4OxNB6Si9+U8bIHRb8apxxJYCI83EwCEaPThEEh6sW7rtbwQPGDo0kjgYsrzcj8SZ5q+V1TXibBeIlxr7J7igLMZEoIi8KfZ7jBkqvVVMfUXoR6cvetbWJDVPay+fhlAZ6L4EqdJHPFlb9DTv7VXQ=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB9481.jpnprd01.prod.outlook.com
 (2603:1096:604:1ca::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 16:24:00 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::db75:e192:bbfa:78a2]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::db75:e192:bbfa:78a2%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 16:24:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>
Subject: RE: [PATCH] pinctrl: renesas: rzg2l: Configure interrupt input mode
Thread-Topic: [PATCH] pinctrl: renesas: rzg2l: Configure interrupt input mode
Thread-Index: AQHZ+E84jgPTKvQQA0qBpCo0m1EvJ7BGUrqAgAAJ28A=
Date:   Thu, 12 Oct 2023 16:24:00 +0000
Message-ID: <TYCPR01MB112691C60EC823F8B55C6AEBB86D3A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231006121823.229193-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWHkhonVmbjVCfc-s1iiUSOBNg9djWxaURNLHoAEaS3+w@mail.gmail.com>
In-Reply-To: <CAMuHMdWHkhonVmbjVCfc-s1iiUSOBNg9djWxaURNLHoAEaS3+w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB9481:EE_
x-ms-office365-filtering-correlation-id: 4ab0df2d-a3d0-42c1-fc08-08dbcb3fa482
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FGpkP506xFCB7EZlwZi4rs/eexg3V2CFCsKgnjHy2zfHBW0OFw1+8c8EsNPcSY6DV6jsjpAHptHT9GgcXL7xYkgbUYasZt020MiR7gpv9d3R03zta75CHluZ8grqLgIXGk64y/2r4NSDwU0sUii/H4jcyywLuO6MPgBOgmLQ6w2YzRXhE92g0fcuABRtOle0yuCVHOI+u6PknUPuLVcxH4Lzhd69x3Q9Dn/nw0xdMGlXjUUcZYuKx8zBkzoQdaJGvxYcLOdwLnTDjZ4BgenG1SRYAP7janBduw5osfLRLS2WZudXqpe2nUPOfNEKjwvUxA3GNBOL65rIfpDhFssfKV1YcLUUsLvVen9O0I1bzvWF4iygnjEL63wj1vVWRsx+id7zzGuwkMubp9BSnz71NvskeziUqIuKrqVvRLRM40q9tIPJUoK/KXxpc/Ip4Egw8tteJ3PVuWjbpZ+AWTpb8UgZGiQ4B0l1sxUn+imixeNMWTLwbchkSh0P4Egr4sShO5g3CWQeYLBiT1r2r8AVc5FhleeFqpU/oFR2/Ur7f11e0Qf6kCCHLUGu4JWorPkES6/FPbDRtZpcgKo1ZCDi2avMhu9GuiRqiUDNQpvHscNj1EhFksaPChVxIOx2Zb6E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(76116006)(316002)(66946007)(64756008)(66446008)(54906003)(66476007)(66556008)(6916009)(9686003)(478600001)(4326008)(8676002)(8936002)(41300700001)(5660300002)(52536014)(7696005)(6506007)(55016003)(53546011)(38100700002)(38070700005)(122000001)(86362001)(2906002)(26005)(83380400001)(33656002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFlWKzNsMGpHcHVtUzhaWGtWY0NwOEw5ZUdNQWtaSHVKZW9oakhUdTh6WkxC?=
 =?utf-8?B?Y1R4UzFKbjJIRTdiVkdXWnY3YlYzemIzcTVRdzQvWTJwNmVGWnNZaDlLVjBN?=
 =?utf-8?B?UTVwWGREVkRpSDE5N1dHeDdZcUhvQVRlV0N5aWtoWFNHVnRWaCtUR21aejM2?=
 =?utf-8?B?eFhDeWt1WXh2cnk3aXVtVjRDaDEvQnNYWjFoM1V4SjFXcyt1NmlVYjRNS25X?=
 =?utf-8?B?UkxQdHFCWjJOR0wxSW16c2puaDE0TTFocDBIazFvNUQvWG5EMVVuS3dmU1Ew?=
 =?utf-8?B?K3BHV3ZLdEZFQUNmWlRjTDJlQ0RycklFci8yU0tkakR2OWlBTTlJYklWdHFQ?=
 =?utf-8?B?a1pZVEFKWHBsQkVuQWRWK1pYU0lIeHZHRDRrMk9FQ3dKWVk1amh3N0xMelNi?=
 =?utf-8?B?V3R5eGtiYzNzNitOd2RybjI5TzZORnZUaDBVckFhdlcyZGhRS09Ed2R3aUl6?=
 =?utf-8?B?S1lpVjVNZlZXRHlYOVhHQnhUUWxZQ1Z0cDZuQlBCRzVPcmp2S1ZreVFNQjFK?=
 =?utf-8?B?NWhFckQzK25mQmpoeW9KN0RKOG9HRFJCWVcvSjJJbnltZHI2bE5hZFd4SW5N?=
 =?utf-8?B?T09qTWRaZGl2QzlrZEl2cDY5YWZSRWE5QlpKaHZPWkM5d2dLZWlQdjRJRmNv?=
 =?utf-8?B?UkFvazZxWkI5cDVMdFpOWThiNTlTM2RXam5SRjNsYjFZdnlLQjI5Ym5mMzZF?=
 =?utf-8?B?SmRac1g0VzJZMXVwWVhTd0pGN0RKN3RMajZvenpqak9kcWlVTzhtUlRXRldT?=
 =?utf-8?B?MDIwd1IyMCtJbFhTUGtlaW93N2lhbXVpYjhhYldDZmQrQVl6VFdHb2RwMnVr?=
 =?utf-8?B?b2tSSE4vKy9qVFBBRDU4QjZpbG5lN2F2SWFCMVcxSXMzU2x6MVpLVHpjcnM5?=
 =?utf-8?B?WWlweEtHZGt1WVpObUxyb2VFSzdrUktQVlFGZmszN29Bd1FvWXdYZ3NRWnk2?=
 =?utf-8?B?Y3ZnSDU0VUFUeG1tTHpIOVdpd0RyT2NjY3dHYnlNWllSZUlacnNqeGpzMzAy?=
 =?utf-8?B?UzRZSlV3R1gvUWJFVDdCY3ZTT0g0UCtRT0JNdHYxN2E2REd6ZnVQMUdwdjB2?=
 =?utf-8?B?dmJoN1BWOUt5LytNZm9ncDZkcGpMZmVGeDM1UW5GNUdIeHVPVjRybVoxczlw?=
 =?utf-8?B?L0VsY2o3VC9idUovUG1Ma2VZOVdYZExLTzVJdDZPWGQxb2JJak16OWdzUGVm?=
 =?utf-8?B?UjVBd3BHMWlEdVdnU1JIM0YxTDlWRnNva1hsRTJyNk1XTGNBQ1pneDV6a1Rx?=
 =?utf-8?B?SGdDN0NBdlFrWU42UCtYeWV6bkl5RTNOaVFDOXArdWxiNWdHdFR5NFVQeC9o?=
 =?utf-8?B?K2xVK0V1T0RFQzkvSWlZc3RSb3VKMENPTWdEaHY4N3lXY2pmZHlYZTYySldv?=
 =?utf-8?B?N2wzNFVoSndveGhDTjBDNjVaSHV2RlgveS9aamdoZHRjS3NoOVdOL1BadFd3?=
 =?utf-8?B?dENvN2lUaGI1Rk9lQW1pVlpSZWFEdUFnL09iVmxMWSsway85SjNUcmJZQ2ZX?=
 =?utf-8?B?VVFveUQ1OER2NGROWWlzMUNzZXFKUXZoVlZQNGR5RDA1M3hLOVhOYlFRZTdV?=
 =?utf-8?B?SVI0YUMrZHlMUVRXclErb202VkJDZDBwWTBkVUxvWkJqVUtGUndnaG12U2xk?=
 =?utf-8?B?YlBCNUpVcmdUSmpycEIwYkt0UVFtT0xsMklOdDFDbWtobFBuQUxqVVNiaml0?=
 =?utf-8?B?UnpLOUtwNFhaRmVWZFl4TW5lQWN3ZmdLMGtMSXo4SEVQODdTYmcxc3h1QmVs?=
 =?utf-8?B?YVhYREtEck4zQ0tJbFJqSzJId3cxOUYraXJaZnU3R0RsNnB6anlXY1NFN1E4?=
 =?utf-8?B?cG94bmJBOHpXQ2Rsb1VTeGtZd3RnbTE3SmFSVWQ3OVZiVTdQbklwNWxkT1lL?=
 =?utf-8?B?Zml2L05SaVlHekg1bGppSFF3SWpTT0NSWnQzSU1Sa2hRYzBrNndnQUk2YWlC?=
 =?utf-8?B?aFM0UXJLM1N6dm03K081a3JrdVNFZ1R3M1dSaHNjcXVPMEF0ZnNCMStKK0po?=
 =?utf-8?B?ZWM2MVVJY09KUjV1U3pNa2JGYjk1RDQvZUlNNWN4d0h6TFNzYUxHS0libjV1?=
 =?utf-8?B?UkQxM1BtMllXaHlxUWk4clNwZHBJSEwvQ1hXY0xzRlQ2aHhSbkRYS3ZOZkxi?=
 =?utf-8?B?by9wbk9saDRaaGZnZk1qM1VlN2UzcFNlajNyVjd4ZkFPRW43cGlUcnR4N1hS?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab0df2d-a3d0-42c1-fc08-08dbcb3fa482
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 16:24:00.6015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uL5NlPfmyp/KIIqtfrkbi0Xe6k6xPg0998A+TF0F/P18ZNtgOmqtoj4imuMD9bR8uQmXeu3A0Qzg3eIxMf+lCzFCwk4naTdO1ggFsJYPb58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9481
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBDb25maWd1cmUgaW50ZXJydXB0IGlucHV0
DQo+IG1vZGUNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIE9jdCA2LCAyMDIzIGF0IDI6
MTjigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
IENvbmZpZ3VyZSBHUElPIGludGVycnVwdCBhcyBpbnB1dCBtb2RlLiBBbHNvIGlmIHRoZSBib290
bG9hZGVyIHNldHMNCj4gPiBncGlvIGludGVycnVwdCBwaW4gYXMgZnVuY3Rpb24sIG92ZXJyaWRl
IGl0IGFzIGdwaW8uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+
IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiA+IEBAIC0xNTgwLDYg
KzE1ODAsMjYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpcnFfY2hpcCByemcybF9ncGlvX2lycWNo
aXAgPQ0KPiB7DQo+ID4gICAgICAgICBHUElPQ0hJUF9JUlFfUkVTT1VSQ0VfSEVMUEVSUywgIH07
DQo+ID4NCj4gPiArc3RhdGljIGludCByemcybF9ncGlvX2ludGVycnVwdF9pbnB1dF9tb2RlKHN0
cnVjdCBncGlvX2NoaXAgKmNoaXAsDQo+ID4gK3Vuc2lnbmVkIGludCBvZmZzZXQpIHsNCj4gPiAr
ICAgICAgIHN0cnVjdCByemcybF9waW5jdHJsICpwY3RybCA9IGdwaW9jaGlwX2dldF9kYXRhKGNo
aXApOw0KPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IHBpbmN0cmxfcGluX2Rlc2MgKnBpbl9kZXNj
ID0gJnBjdHJsLQ0KPiA+ZGVzYy5waW5zW29mZnNldF07DQo+ID4gKyAgICAgICB1MzIgKnBpbl9k
YXRhID0gcGluX2Rlc2MtPmRydl9kYXRhOw0KPiA+ICsgICAgICAgdTMyIG9mZiA9IFJaRzJMX1BJ
Tl9DRkdfVE9fUE9SVF9PRkZTRVQoKnBpbl9kYXRhKTsNCj4gPiArICAgICAgIHU4IGJpdCA9IFJa
RzJMX1BJTl9JRF9UT19QSU4ob2Zmc2V0KTsNCj4gPiArICAgICAgIHU4IHJlZzg7DQo+ID4gKyAg
ICAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgIHJlZzggPSByZWFkYihwY3RybC0+YmFz
ZSArIFBNQyhvZmYpKTsNCj4gPiArICAgICAgIGlmIChyZWc4ICYgQklUKGJpdCkpIHsNCj4gPiAr
ICAgICAgICAgICAgICAgcmV0ID0gcnpnMmxfZ3Bpb19yZXF1ZXN0KGNoaXAsIG9mZnNldCk7DQo+
IA0KPiBXaG8gaXMgdGFraW5nIGNhcmUgb2YgY2FsbGluZyBwaW5jdHJsX2dwaW9fZnJlZSgpIHdo
ZW4gdGhlIGludGVycnVwdCBoYXMNCj4gYmVlbiBmcmVlZD8NCg0KQXQgdGhlIG1vbWVudCBubywg
bWF5YmUgd2UgY2FuIHVzZSBvZiByemcybF9ncGlvX2lycV9kb21haW5fZnJlZSgpIHRvIGNhbGwg
cGluY3RybF9ncGlvX2ZyZWUoKSwNClNpbWlsYXIgdG8gZnJlZWluZyBiaXRtYXAgcmVnaW9uPz8N
Cg0KPiANCj4gPiArICAgICAgICAgICAgICAgaWYgKHJldCkNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHJl
dHVybiByemcybF9ncGlvX2RpcmVjdGlvbl9pbnB1dChjaGlwLCBvZmZzZXQpOyB9DQo+ID4gKw0K
PiA+ICBzdGF0aWMgaW50IHJ6ZzJsX2dwaW9fY2hpbGRfdG9fcGFyZW50X2h3aXJxKHN0cnVjdCBn
cGlvX2NoaXAgKmdjLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGNoaWxkLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNoaWxkX3R5cGUsDQo+ID4gQEAgLTE1ODks
MTEgKzE2MDksMTYgQEAgc3RhdGljIGludA0KPiByemcybF9ncGlvX2NoaWxkX3RvX3BhcmVudF9o
d2lycShzdHJ1Y3QgZ3Bpb19jaGlwICpnYywNCj4gPiAgICAgICAgIHN0cnVjdCByemcybF9waW5j
dHJsICpwY3RybCA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCj4gPiAgICAgICAgIHVuc2lnbmVk
IGxvbmcgZmxhZ3M7DQo+ID4gICAgICAgICBpbnQgZ3Bpb2ludCwgaXJxOw0KPiA+ICsgICAgICAg
aW50IHJldDsNCj4gPg0KPiA+ICAgICAgICAgZ3Bpb2ludCA9IHJ6ZzJsX2dwaW9fZ2V0X2dwaW9p
bnQoY2hpbGQsIHBjdHJsLT5kYXRhKTsNCj4gPiAgICAgICAgIGlmIChncGlvaW50IDwgMCkNCj4g
PiAgICAgICAgICAgICAgICAgcmV0dXJuIGdwaW9pbnQ7DQo+ID4NCj4gPiArICAgICAgIHJldCA9
IHJ6ZzJsX2dwaW9faW50ZXJydXB0X2lucHV0X21vZGUoZ2MsIGNoaWxkKTsNCj4gPiArICAgICAg
IGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICAg
ICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnBjdHJsLT5iaXRtYXBfbG9jaywgZmxhZ3MpOw0KPiA+
ICAgICAgICAgaXJxID0gYml0bWFwX2ZpbmRfZnJlZV9yZWdpb24ocGN0cmwtPnRpbnRfc2xvdCwN
Cj4gUlpHMkxfVElOVF9NQVhfSU5URVJSVVBULCBnZXRfb3JkZXIoMSkpOw0KPiA+ICAgICAgICAg
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcGN0cmwtPmJpdG1hcF9sb2NrLCBmbGFncyk7DQo+IA0K
PiBUQkgsIGl0J3Mgbm90IHZlcnkgY2xlYXIgdG8gbWUgaG93IHRoaXMgaXMgdXNlZC4uLg0KPiBJ
IGFzc3VtZSB0aGlzIGlzIGNhbGxlZCBhcyBnaXJxLT5jaGlsZF90b19wYXJlbnRfaHdpcnEoKSBm
cm9tDQo+IGdwaW9jaGlwX2hpZXJhcmNoeV9pcnFfZG9tYWluX2FsbG9jKCk/DQo+IElzIHRoYXQg
ZG9uZSBmcm9tIHJlcXVlc3RfaXJxKCksIG9yIGF0IGludGVycnVwdCBjb250cm9sbGVyIGluaXRp
YWxpemF0aW9uDQo+IHRpbWU/DQoNCkJhc2ljYWxseSBkdXJpbmcgaTJjX2RldmljZV9wcm9iZSgp
LiBTZWUgdGhlIHN0YWNrIHRyYWNlLg0KDQpbICAgIDguMzcxODk2XSAgcnpnMmxfZ3Bpb19jaGls
ZF90b19wYXJlbnRfaHdpcnErMHhjNC8weDFiOA0KWyAgICA4LjM3Nzg4Ml0gIGdwaW9jaGlwX2hp
ZXJhcmNoeV9pcnFfZG9tYWluX2FsbG9jKzB4OTAvMHgxYTQNClsgICAgOC4zODQxNTZdICBpcnFf
ZG9tYWluX2FsbG9jX2lycXNfbG9ja2VkKzB4ZmMvMHgzNTQNClsgICAgOC4zODk3OTFdICBpcnFf
Y3JlYXRlX2Z3c3BlY19tYXBwaW5nKzB4MjA4LzB4MzUwDQpbICAgIDguMzk1MjE3XSAgaXJxX2Ny
ZWF0ZV9vZl9tYXBwaW5nKzB4NjgvMHg4Yw0KWyAgICA4LjQwMDA4N10gIG9mX2lycV9nZXQrMHg4
OC8weGNjDQpbICAgIDguNDAzODgxXSAgaTJjX2RldmljZV9wcm9iZSsweDI3MC8weDI4NA0KDQpD
aGVlcnMsDQpCaWp1DQo=
