Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9607CC066
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 12:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235002AbjJQKRP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 06:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343692AbjJQKQq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 06:16:46 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006F2171C
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 03:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgRl8w8OrvNC5eTg3Iaeodsl/ZKddODvUN+fqi5WVic6RS2GKhYwMXmTMkIxnc/jeqyYHs49I3x6SOwR5/qwcL0j50q6vaTYnfhTaDVHK45h72oT3fTRoNcDWLREXPOkOgwVBUtjbnsSAXw0jKf2aDb5SbtlTo57d9uKcnfS0VSos+oN4FSDa22Gx6qAVik6ZQE/KC0CmlUMjBz+I2VYnBnIMZtI4Y85hok8f0I45rb7/buHR5f9osGvng2n7e9kxaY4uc+kn5DjOMujTsezILKZDD1esSI8tKsfhT4UlCcrvz5hE5J9oVB6AD6pt1U57BrzblszaqYR/77UWisVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFMp/D6FKjOQYPP1GXfHhk8vcMVgNP7RQLgeMCcJnFE=;
 b=cbmiYIAB6F1HztOlmzwHvvDzO7wTfkQTqpbIl4jqrt4CZJqG/Uwn9bdzs3fHFvo5++ZVByehMxplwdBW7UoOqlrsv/BeNDe2cxRcGsdnrUvMG/Jo71aUaVllva5NhXTc4jGqWRdqmPIhCJg1WL4+0cGwmJ7CrPLzKQdUoA5qbi1cchP1PGdJQSoTZ+FuNz/jg+x6cdDo27xc6Z8OwodE+R/+HWzsabNg3FOjeokfqhdgR0RLlnCdU74U/cWkP6Wfq1/Vj/11gDu2bWZk8E/LlRfRwU3fs3l5Pl1MeIDfJ94BLjsCSQySGoMoUbcwUHmrwhWew9PeDkkKy9JhYeDPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFMp/D6FKjOQYPP1GXfHhk8vcMVgNP7RQLgeMCcJnFE=;
 b=mqVxsdcrpX+4suuVn2IapiTHRFoz9Epqi0ASBj8+lC9HsWuyyriiRD9nvziC+7CtZT3ob0URdqeEYvfhh+xKZ/TR8GzW7t16nzzvMickyuYy9li3/sRNKkPEu/3xba+P7W+9++JbBKi/5wCsXcIWWXn1Fxty47xqbOYKLzWrhUo=
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 PAXPR04MB9469.eurprd04.prod.outlook.com (2603:10a6:102:2b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 10:16:04 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 10:16:04 +0000
From:   Bough Chen <haibo.chen@nxp.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "andy@kernel.org" <andy@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/2] gpio: vf610: mask the gpio irq in system suspend and
 support wakeup
Thread-Topic: [PATCH 1/2] gpio: vf610: mask the gpio irq in system suspend and
 support wakeup
Thread-Index: AQHaAKmgJ0pxB9kBTUKFYivRV/ovLrBNwtAAgAABbZA=
Date:   Tue, 17 Oct 2023 10:16:04 +0000
Message-ID: <DB7PR04MB401053865DE9BCCDB75DDA6190D6A@DB7PR04MB4010.eurprd04.prod.outlook.com>
References: <20231017033039.1245959-1-haibo.chen@nxp.com>
 <CAMRc=MdYeOnawvT8H2dcRNnik+kfjCLovJn8rm9y4T7fpAqFLQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdYeOnawvT8H2dcRNnik+kfjCLovJn8rm9y4T7fpAqFLQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4010:EE_|PAXPR04MB9469:EE_
x-ms-office365-filtering-correlation-id: f86663ed-3956-4487-45d4-08dbcefa11fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6IqQlT2uYzXPTTfBJzUwmsvG2as7MktycKsWYP8zXsKYQux3achLKQGVybxIgsdx0GTzWeZDc2rmvkFW7eMtrvdq1vg2TTSF8R+vuuJGCkAvC/j4qBWy2pniCJze1roL3xjD/wW4stQlAYXfhDx3uR6M8e/R5hpqORhE9pg4ut7uJgjH+Mzjcw64B5vBIBEA5LDsvGHJ5rgkI+CMki4pDHaRHZgHHVZOzk29KjMbWh3BQfk0++HwXdID66PvRx8XzJWkuLJmjbSm4k2T9fwPzsTQnZjNKNLnJneN3haFpM4SBum8gQ3UlNSV9UM4KVuqG/vWWQNucBD2k3U+8n25SBN3pLsn5ziZlTCvtx4fZMLg37Q2hgKRQmT0WiWYiW7eBCwJKfUgXspTNe+1dGwTjtV/oMtrcohtCO+p/Hk4hgbyt3txo0EBcmVsfOkzCVg+EzQ0sWrp4OPizsRWcyCGdji3xVhRKWdVp0+y9eHP2S5ZTtbYcf8hvi49ylgtbaYGZoPSpLkL/TSgGJ1OMCYCuKJJlbYqVxERv/CroHpaw/zLY2gczBxh9S3Afzw90tO+Awh7xofi6ZW3hcJIPzk2WzBS+bDz9L5vqDOoWvsdntaJ1XbmHyPMWeXFs/YXwITD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(53546011)(122000001)(38070700005)(38100700002)(83380400001)(33656002)(26005)(7696005)(6506007)(2906002)(64756008)(54906003)(66476007)(66446008)(6916009)(316002)(76116006)(478600001)(66946007)(66556008)(15650500001)(86362001)(41300700001)(71200400001)(9686003)(8936002)(8676002)(52536014)(4326008)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1NaSHJqbGZCenhJSi9XdU5uVnZPVnpxakZqaHdxR3QrZ1R0NWpQNUU4U3ND?=
 =?utf-8?B?Ri9WbTQ3Q2wvQ0xoKzdMRXlLbHFLMEtMeURxL3haZ2F0REJHQUxPUmRVRzFW?=
 =?utf-8?B?dSt5WTlNZ1hTS09xQTJlODUzUUJCdGlGR0ZnNmZlSHZEbjJSU0N1aTNuSDM3?=
 =?utf-8?B?OEdBcHVoYkx6bFpsY3E3ZlZueUVOMThEY0U4anNSWFNEZnhDbXNseWNmNmdM?=
 =?utf-8?B?LzY4K1EzQnBUOFdVYUgraVV0NHQwL1Via3FtNnYzU1VOV2Jib0xvWENUdnU2?=
 =?utf-8?B?N2tuTGgwTWRMQjBYYkwrL3NKRWhzQ2lsa3M5MTU3T3owYy9sSjJhekZWaTRY?=
 =?utf-8?B?MmdKN0loL1J0UWRNb3M3WW5HLzBKb3ZKbEZYeXk1UDBlZDFIRFozckxWSVRW?=
 =?utf-8?B?Ym5ERTdtbE1IUkQ1UStjZzJpL2czOFl6NVBQbjNjRUx2cWJHM1Y4RFY1YU4y?=
 =?utf-8?B?U1JPNUROY2l0YWRjSlhsdnpHOFR6QW54NmtWb29OelltZys1VExMVUlQS3o2?=
 =?utf-8?B?dzZPdGtzazJZdVdodFFORkhVRVJNdXpoQXU1bVhrLzEvSWJTZlBZakJRUzRO?=
 =?utf-8?B?WFNjRXoySTNqMzc5NWxvOEtTaWNlc1JURzZYZzBibzMySGlLT1RIRXBNSW9y?=
 =?utf-8?B?NzdtcEdwajRZVS91Lzd1dXJzcXNYR3RBQnZJTTN3eDVkQ3NNekxmWVBYcTFn?=
 =?utf-8?B?Z1Vyc2tqNlJkRFVVSGNsTW1YUVV2cUp6M2YweVY0VGZQRWZieXZsdzZTcjNS?=
 =?utf-8?B?bFVhSG9xRVIxVlRWcnJPOVVHQ3FxVjNzYmVIMzM5TDJVR0p1SzRPaThybkR5?=
 =?utf-8?B?YzU2OGVpWVlyNlJoelgwSHAwdC9nWTFTSUhiWnVLaWk5VlpXUm0zc2Y1TGRZ?=
 =?utf-8?B?a2Vnd3ZMRzdwR05wQzhrd1VoVjNqYkl1bkpSU2xUZ2U3cjE5N0NKd2xOR0ZE?=
 =?utf-8?B?V2xUVnY5UWVEMTJtMCt3L0JKdnBOR0FSdWhTMWdiVGFvemduYlpsNzlrN1dF?=
 =?utf-8?B?WVFVSGMxdGI1QzFiTkRxT2tnTzVpRXB2TmNUREpyWFB0ZjBZVnd4ZkhFRXRa?=
 =?utf-8?B?M0ZnSUpHZ0lwT3djVlVWVWl2UjJucFFSZldiUnlRejJZTzhwZ1g3U29lUTgx?=
 =?utf-8?B?TXB0TUl2TU1GOXo3RkJUSFpTSTh4OEJReEVUVkxUSjV3d0tXN21rbVl5bXdR?=
 =?utf-8?B?eVhxU1JIdGNIN2EySEtMRFU4b0VRYXpibGdPVVZvUmR3TFFNYmp4Uyt3WmNq?=
 =?utf-8?B?OTJWREcxVlVTRWV6RFJyWWoxaVhrOWNDYWNrVFdzeFhwL0EydXVMUUQrSWU3?=
 =?utf-8?B?UlppQTR5WnBIeFFieEEwU1h4WXhodXowR0hLQ3lGekd4WjI1WUVrTGdwTWdP?=
 =?utf-8?B?TGtsUktsSEppbGxKZm1DdWIzTFZnT2ZjdTVyQktaYk1SRDdSSGVhZjM1Ulgv?=
 =?utf-8?B?anZRRUZkQmJYZzIycTRJQWY0cEN5VGRDZ1ViZ3lxTmNKaEtQYnhsTTJLOTl0?=
 =?utf-8?B?SEpxcEliVDY1MzdNYXJmNjB3a0RKSkhlSmN0cDBaRks2dnJCOFl3OVpDbEtl?=
 =?utf-8?B?c0FsQnZEZ3dobFdhc2ljSVJ2dk9jZ3pWOXAwTlRSWGp6SHhDYkNXaVdZNnl0?=
 =?utf-8?B?U1c3cTJvTWlhR1QzMXd3Wk1JWUZnU3d1MER6MzNiMGRjeFh1b0VtcjVzKzNI?=
 =?utf-8?B?SkJERVJQK1cvVWxvQTlnWWFWU1NZR2JJaGVQSmxCWHdrNEVlMGFNY2dvS3BS?=
 =?utf-8?B?ZVRiL00wSjYxU3VxamJJNzdUb3FnU095Qzg5SnN5MWk2OURiZkJYZWFSRXc3?=
 =?utf-8?B?a3ZQdXl4RGZIcWYyNS9IbGNJQWx4WG5YKzZ4VXc0OFl0UzNYRmlPR1BkdDAy?=
 =?utf-8?B?aG55bm9iL0pkRmY0STRRdWpERVJ6VU9GY3NzcDFCZGxWSkowZDRIemllTHVK?=
 =?utf-8?B?Q3EyNkEveGlJR21ZUklTSVJwRW9sU0ZORHpsbVNFUlVkRmNDNnRxQ3N4TlNi?=
 =?utf-8?B?VksxVkN5WXFRNTRXL0pEM08xUVpSZUdXNDBWZzBoY0lWYTBhSzZJdm42bjAy?=
 =?utf-8?B?R1VJYXVvWEFRWk1NM0dtbmZKOUY3cHgrQjBPMnV4RzZsRXlDaTVETisyUExY?=
 =?utf-8?Q?vnLE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86663ed-3956-4487-45d4-08dbcefa11fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 10:16:04.1583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hPnN8VyvPaLPVT8ukd1K1+xsRbjcgZPHlutSUkyZcqpUXUkf96MfbDks06JAmX6Jdo9Ek3S8PkeCVdv72xE6zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9469
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxicmdsQGJnZGV2LnBsPg0KPiBTZW50OiAyMDIz5bm0MTDmnIgxN+aXpSAxODoxMA0KPiBUbzog
Qm91Z2ggQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiBDYzogbGludXMud2FsbGVpakBsaW5h
cm8ub3JnOyBhbmR5QGtlcm5lbC5vcmc7IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOw0KPiBk
bC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEv
Ml0gZ3BpbzogdmY2MTA6IG1hc2sgdGhlIGdwaW8gaXJxIGluIHN5c3RlbSBzdXNwZW5kIGFuZA0K
PiBzdXBwb3J0IHdha2V1cA0KPiANCj4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNToyNeKAr0FN
IDxoYWliby5jaGVuQG54cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogSGFpYm8gQ2hlbiA8
aGFpYm8uY2hlbkBueHAuY29tPg0KPiA+DQo+ID4gQWRkIGZsYWcgSVJRQ0hJUF9NQVNLX09OX1NV
U1BFTkQgdG8gbWFrZSBzdXJlIGdwaW8gaXJxIGlzIG1hc2tlZCBvbg0KPiA+IHN1c3BlbmQsIGlm
IGxhY2sgdGhpcyBmbGFnLCBjdXJyZW50IGlycSBhcmN0aXRlY3R1cmUgd2lsbCBub3QgbWFzayB0
aGUNCj4gPiBpcnEsIGFuZCB0aGVzZSB1bm1hc2tlZCBncGlvIGlycSB3aWxsIHdyb25nbHkgd2Fr
ZXVwIHRoZSBzeXN0ZW0gZXZlbg0KPiA+IHRoZXkgYXJlIG5vdCBjb25maWcgYXMgd2FrZXVwIHNv
dXJjZS4NCj4gPg0KPiA+IEFsc28gYWRkIGZsYWcgSVJRQ0hJUF9FTkFCTEVfV0FLRVVQX09OX1NV
U1BFTkQgdG8gbWFrZSBzdXJlIHRoZQ0KPiBncGlvDQo+ID4gaXJxIHdoaWNoIGlzIGNvbmZpZ2Vk
IGFzIHdha2V1cCBzb3VyY2UgY2FuIHdvcmsgYXMgZXhwZWN0Lg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL2dwaW8vZ3Bpby12ZjYxMC5jIHwgMyArKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3Bpby9ncGlvLXZmNjEwLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby12ZjYxMC5jDQo+ID4gaW5kZXgg
YTg5YWU4NGExZmEwLi43N2Q1YjhkZDJiZDUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncGlv
L2dwaW8tdmY2MTAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXZmNjEwLmMNCj4gPiBA
QCAtMjYwLDcgKzI2MCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXJxX2NoaXAgdmY2MTBfaXJx
Y2hpcCA9IHsNCj4gPiAgICAgICAgIC5pcnFfdW5tYXNrID0gdmY2MTBfZ3Bpb19pcnFfdW5tYXNr
LA0KPiA+ICAgICAgICAgLmlycV9zZXRfdHlwZSA9IHZmNjEwX2dwaW9faXJxX3NldF90eXBlLA0K
PiA+ICAgICAgICAgLmlycV9zZXRfd2FrZSA9IHZmNjEwX2dwaW9faXJxX3NldF93YWtlLA0KPiA+
IC0gICAgICAgLmZsYWdzID0gSVJRQ0hJUF9JTU1VVEFCTEUsDQo+ID4gKyAgICAgICAuZmxhZ3Mg
PSBJUlFDSElQX0lNTVVUQUJMRSB8IElSUUNISVBfTUFTS19PTl9TVVNQRU5EDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgfCBJUlFDSElQX0VOQUJMRV9XQUtFVVBfT05fU1VTUEVORCwNCj4g
PiAgICAgICAgIEdQSU9DSElQX0lSUV9SRVNPVVJDRV9IRUxQRVJTLCAgfTsNCj4gPg0KPiA+IC0t
DQo+ID4gMi4zNC4xDQo+ID4NCj4gDQo+IEJvdGggcGF0Y2hlcyBsb29rIGxpa2UgZml4ZXMsIGNh
biB5b3UgYWRkIHRoZSBGaXhlczogdGFncz8NCg0KU3VyZSwgd2lsbCBzZW5kIFYyIHRvIGluY2x1
ZGUgZml4IHRhZy4NCg0KQmVzdCBSZWdhcmRzDQpIYWlibyBDaGVuDQo+IA0KPiBCYXJ0DQo=
