Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18AFF7749CD
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Aug 2023 22:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234366AbjHHUD7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Aug 2023 16:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbjHHUDj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Aug 2023 16:03:39 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2043.outbound.protection.outlook.com [40.107.6.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5521E7DAA
        for <linux-gpio@vger.kernel.org>; Tue,  8 Aug 2023 11:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kS6MG6IMeQHDsf4aN7za/J8UugKsGDyzgRwvxfdCu2qUVNe8lzGMHXLScrpKomE7bm+lKZrD0ecd/2TdFjr5PwPGyRRaW7jrzze8BNRXzMgBUhRae3NkUAHsT2PDs+QpN+HzUHLaoDf0RPkcUlY+6SVxPYKxrnY9kn4+VSitcT+4E7+jHoKqtg5ybff6WqIQ8xklz45m4mFVPseRM/V70TA/n487Lsq1Qj5XYtqkYp1BjKdcF70pVqrME4HdSbXZypp+c1iG0BZvDwK3T05ZWvC4Z/byrb+KVL787uVcPmvppQh0eaTS2NXVPtc/xRYrLqtj6A2GEsHlDWQYB/ujrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2u1DCjvw5kM1s0gnI5DoNrCneCkMs1xXTTMPPrjMz8=;
 b=diESIpfAtXrpF0NIou02cS1yP+jRzUMhRIQkk/X+TKMUTQIBDPBm5ugVcANX40KUCFa9jE3+xm8CdR0YpnRnaFR1wff04FWA9gPSXqc09CIg1bIONPbeC2T8NtALs/KKSddnFg27ty+ihtKCFQ1a3Lbp1MhQ4T5quS0Pp7ZwwPAVrOFIAKzeJpteShKN1msOVRRbZaJTBqdFiyi0/8Fls/3VA82OIkeRKVFAHguZp6RsWR4DTRUWh6cGZJLW23LY0AFwS1BCHQXw/EiazOmwZo/i7oz74wZCPQvULPBOT5z8PYWdBOqQpT1Qxeet1xEQsL5YgHEu3kMry8cbtUFgxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2u1DCjvw5kM1s0gnI5DoNrCneCkMs1xXTTMPPrjMz8=;
 b=hSx7CuonI4uoBg8DgowgGi/AW7L0t25ooOQnpIoroGaaUaOMDpXTakyqlSAlbol1jTICTU/JG7GdNRNrpYuvU/eg31nIjkwsVgNqtylgoKYJVay/psHbdE5F9KKDQp4NmStSr7DJrCl3LmlrOcxtfum56MoZ7Fxsw8G2xXd/qLs=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 18:21:31 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 18:21:30 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Andy Shevchenko <andy@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH] gpio: mxc: release the parent IRQ in runtime
 suspend
Thread-Topic: [EXT] Re: [PATCH] gpio: mxc: release the parent IRQ in runtime
 suspend
Thread-Index: AQHZyg3QuZHj4y9O4kCQ03OoPawPea/gqkQAgAAK6wA=
Date:   Tue, 8 Aug 2023 18:21:30 +0000
Message-ID: <PAXPR04MB91853FD015613B944B8D2085890DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230808153346.335411-1-shenwei.wang@nxp.com>
 <ZNJ9qDqDIF4s66E8@smile.fi.intel.com>
In-Reply-To: <ZNJ9qDqDIF4s66E8@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PAXPR04MB8459:EE_
x-ms-office365-filtering-correlation-id: 8a818c2f-c4bd-4fe1-386f-08db983c49f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Di+hIAplFyZ4H5fsVxc1PuwFXZrn8jvn/a7F4dcPyoweWZzE01xWJXjVlk49M2z3/IFBbuL7YXDDOWLcy8PQS40mDLPzaLGpepnp/uxv38kCMpKqxw2SIvGmWea5ZyV4WMH6ykM8TKq8uKSWY5/Zt89q5XCjxWHI3pkOSPCyesfACJ414bXSi1g0U3t1DOY+rFK+2n4tT6uxGYjakzCXFzlJyT+jTQlKaemY1VWyHOFq/K7wp7Cz1MAKlfaRTBBF9NJJFHc7DLEHGrrkGmfZ+5MPLA9v2t1VOXlGP+UIGYp8NeJeQ72iR4XNP5r6WPAmtcDyqsHdcI2YGTho8o8dpWPoS/DqPA5DnI1VuHUQjsTRtBDylruxCZKbmMvn6zf73c3ucK3n6WSC3Ya9AbnStOGZc3Jiuny/0YAlThHrVk1P5bmiuCeaFWA7ILep6HMRP3K8ScW8vPXxr6/C349K4kdlymjnN6SfIlVbTAqxtUuB0IGHAoHmL1nNVMk8VxI+6ugWY3pOc/WfH1tSPEmakuIsN7y0lJAvM6uihpJV6jwn6xWHzqWomq2n6DohfTKor74yJNMaFWwNiGF1fEFL/1HYXQ/gzszuJTSw5jvBuk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(1800799003)(186006)(451199021)(316002)(83380400001)(2906002)(15650500001)(122000001)(8936002)(8676002)(38100700002)(5660300002)(7696005)(52536014)(76116006)(41300700001)(66446008)(66476007)(55016003)(44832011)(6916009)(66556008)(4326008)(66946007)(6506007)(53546011)(64756008)(478600001)(54906003)(33656002)(86362001)(71200400001)(9686003)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckR2S1hFM3dTMmN4OEdXdjYyT2VueU1ESXJuV3VlSzR0ek1mUnNFbHZMWEVW?=
 =?utf-8?B?bGNQeTlWbTNzUGtubGpObjFjalVCcllYUzA3bFN3NGZ3QzZOQjFKaHdWVHMy?=
 =?utf-8?B?bm5jd0JiTFdTVWhuV3BidEVpbHpMbFpsQWo4WkptMXpxUDR0NUxlNGcvcmxE?=
 =?utf-8?B?YUJyUjMvTFlDNm1rM1FYWU1xWTVPRkphRnFpcjhtTGJWelVwbmk4OExMVWt0?=
 =?utf-8?B?c2p5b0xTSktZdExhbUpPUnozd05FZFNoNXhkY3U4M0VZNGM3K3Y4VGk2RWNN?=
 =?utf-8?B?YXBETXFRUW9RSWZNWUluN0lua05HVGRJbEpPQ2lFMGQ1S1lsWVVYZER6aUtz?=
 =?utf-8?B?OVJleGJlMGxCYlhvRWhIVVBaTTliRFlEWFBpRit5cnNkSlNlcElVK0dIOEVa?=
 =?utf-8?B?c3ZvdnhVSVozMngzMmRJVUNRMHZ0RVh1RkZicWwvWS9mS1VKZ3VCWnFKTFZI?=
 =?utf-8?B?a2pGV0RmYlBkc1czZmMyWnI0MXQ1eEVrWUNOLzNybGxTQUIzK2wyTks5S2Zl?=
 =?utf-8?B?aEh6V1N6L0R5WldLR2lhdm9sYUVEbGxTRmtJUzBiMVVJNDZHYWNuZWNtMUNT?=
 =?utf-8?B?eXRralE1NGVqZkdJdjlTbGVZcE5uYndzNWkxc0JJVHlBaGZVWm50a2RLZDBz?=
 =?utf-8?B?REMvb1hNM0xmcDZFdHNKem04dGJ5a1VjM1E5cWlObzFtQlZ6WGlzdllhUjB4?=
 =?utf-8?B?TUdMZk9Xc1RkTmZKWjlVWlZvdWMyRHV5TEZHUW9CME1nMHB5a2MrdXFkYzQz?=
 =?utf-8?B?RC93aUZLM0svYXFNYWN2QzJQN1NER1V3c3lDNW5OV1ZTazdwZWdMOGNjdVFz?=
 =?utf-8?B?blFkRStydURJMzg2cS9WMzBqTDhCQTZOQmQvL1NKN0pQUXJaYnZtOUs3a0xn?=
 =?utf-8?B?ZXl6SGZzejNCUG9CeERqNVVGZFJmNy9QbzhwUmZzNzZwb3FYR1hVYlRoUGVv?=
 =?utf-8?B?VnBiZmF4WmNtMCtDRHJTUDJ2R1dISmxnY3M1elM5WW1oWG9rZzJUUXNtdUhX?=
 =?utf-8?B?S0IyT2p1aFRleHFpU09ZRXdmbGZrM2Y5Zm50dXhsUjQ0M05pV3YxTXNwdWpI?=
 =?utf-8?B?eWlPL0YvZzg0NnFiaWJ3bmxzcktNMmY4TXlGSTZIaWlycFNSaWtiNnhFYmZ5?=
 =?utf-8?B?Szhmd204UEVtRmpMU2tCNkdhQ2tvL0tPakZPN01COVpLcjlSMC9lNTJpNjlV?=
 =?utf-8?B?V0x6YTV5RTZyQVhXdnIvSk90MmVwM1J3TUVVanBQbGdiZWloejhSdWhtVkxX?=
 =?utf-8?B?TTNKYmxhRjAwZjBNK1FRVUxiMGMxR0pZMVdLNHloOEI1Uko4aXEyellrOEdN?=
 =?utf-8?B?RTZ0V3N4MllpbVVxSU1mWTNZTFJIREtDRmlKSkZUOUp1WEdLeTZML01zZ0RC?=
 =?utf-8?B?L3grbzRwZ2R3WTNGSVQwSFlsKzg2L2d1eFFGQ3F6cmNvSlVMV2hQdFI2Zlky?=
 =?utf-8?B?YW1UWWdoTzJUc0swU0NWeWl1MTdrSHcwSFpVZ2E4R1N2SmlQN0QwWkhrUXJL?=
 =?utf-8?B?QUlYdHRNaWd2RFVvbkVsbjlETHF0bXRQNnllc2h3cEI5VWIrQWFaVWlTaUtY?=
 =?utf-8?B?emlmOHI5blBBYjR2dHEvSUY4U2hpTGF2THNEQ3k2YmdqWDVscmY3VmFjcFpa?=
 =?utf-8?B?NXhob0hsWW9jWllpWUduRnVjS1BQeWxOT2FMclNMU3lqa0pNU0Q3T3VxWGNm?=
 =?utf-8?B?c045VHNzQ0czR3c3alQzVHNQRWxJQlF1S2xmdW14MmExNVcwdHEveE9yUGly?=
 =?utf-8?B?THRiQnZGSFFyb2pTb0x2SDBqdFlkUVBqYS9mdEdTTWFRd2NhWmtkdnd0dWhL?=
 =?utf-8?B?VHRVeFM4WWs2WjNkOVVmYjZHNnlERnUrdEdNZnkwYmQrNHExeXB4QVNhNm9u?=
 =?utf-8?B?WXZad1FYSmkvbHhWQUNKUzFUWjVablhpcVh0Q21CMDl5bE9DbnJvbm03Mnhr?=
 =?utf-8?B?NXJBRVdCcmFlSER4VHU5T2FWeGFhQ2NMR2xlN1NGNHJMeXBVWE5vTEczZlJR?=
 =?utf-8?B?UlV1TEZ5T0srTEFkOTJKWjhNSGJyMGc0by9pV0lzQ04zanh3WXN2WHdMQ2t4?=
 =?utf-8?B?V2c4ME9ZMytuTjRSdFZUUWhkbU1SalVpYmx6Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a818c2f-c4bd-4fe1-386f-08db983c49f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 18:21:30.8790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9H6P1xGjexzsAsYqftFF6WvW3q0QyljidUZDMc5pQ+bzrang2GiuDVW86mvga0ugQI3Z25ffkaerah7Ql7MVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCA4LCAyMDIzIDEyOjM5
IFBNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiBDYzogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgQmFydG9zeiBHb2xhc3pld3Nr
aQ0KPiA+ICtzdGF0aWMgdm9pZCBteGNfdXBkYXRlX2lycV9jaGFpbmVkX2hhbmRsZXIoc3RydWN0
IG14Y19ncGlvX3BvcnQNCj4gPiArKnBvcnQsIGJvb2wgZW5hYmxlKSB7DQo+ID4gKyAgICAgaWYg
KCFwb3J0KQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuOw0KPiANCj4gV2hlbiBjYW4gdGhpcyBi
ZSB0cnVlPw0KPiANCg0KSWYgdGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBhdCByaWdodCBwbGFjZSBh
bmQgcmlnaHQgdGltZSwgaXQgd29uJ3QgYmUgdHJ1ZS4gSnVzdCBpbiBjYXNlLiDwn5iKDQoNCj4g
PiArICAgICBpZiAoZW5hYmxlKSB7DQo+ID4gKyAgICAgICAgICAgICBpcnFfc2V0X2NoYWluZWRf
aGFuZGxlcl9hbmRfZGF0YShwb3J0LT5pcnEsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwb3J0LT5teF9pcnFfaGFuZGxlciwgcG9ydCk7DQo+ID4g
KyAgICAgICAgICAgICBpZiAocG9ydC0+aXJxX2hpZ2ggPiAwKQ0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAvKiBzZXR1cCBoYW5kbGVyIGZvciBHUElPIDE2IHRvIDMxICovDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGlycV9zZXRfY2hhaW5lZF9oYW5kbGVyX2FuZF9kYXRhKHBvcnQtPmly
cV9oaWdoLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwb3J0LT5teF9pcnFfaGFuZGxlciwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydCk7DQo+ID4gKyAgICAgfSBl
bHNlIHsNCj4gPiArICAgICAgICAgICAgIGlycV9zZXRfY2hhaW5lZF9oYW5kbGVyX2FuZF9kYXRh
KHBvcnQtPmlycSwgTlVMTCwgTlVMTCk7DQo+ID4gKyAgICAgICAgICAgICBpZiAocG9ydC0+aXJx
X2hpZ2ggPiAwKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBpcnFfc2V0X2NoYWluZWRfaGFu
ZGxlcl9hbmRfZGF0YShwb3J0LT5pcnFfaGlnaCwgTlVMTCwgTlVMTCk7DQo+ID4gKyAgICAgfQ0K
PiA+ICt9DQo+IA0KPiBXaHkgbm90DQo+IA0KPiAgICAgICAgIGlmIChlbmFibGUpDQo+ICAgICAg
ICAgICAgICAgICBpcnFfc2V0X2NoYWluZWRfaGFuZGxlcl9hbmRfZGF0YShwb3J0LT5pcnEsDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0LT5t
eF9pcnFfaGFuZGxlciwgcG9ydCk7DQo+ICAgICAgICAgZWxzZQ0KPiAgICAgICAgICAgICAgICAg
aXJxX3NldF9jaGFpbmVkX2hhbmRsZXJfYW5kX2RhdGEocG9ydC0+aXJxLCBOVUxMLCBOVUxMKTsN
Cj4gDQo+ICAgICAgICAgLyogc2V0dXAgaGFuZGxlciBmb3IgR1BJTyAxNiB0byAzMSAqLw0KPiAg
ICAgICAgIGlmIChwb3J0LT5pcnFfaGlnaCA+IDApIHsNCj4gICAgICAgICAgICAgICAgIGlmIChl
bmFibGUpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlycV9zZXRfY2hhaW5lZF9oYW5kbGVy
X2FuZF9kYXRhKHBvcnQtPmlycV9oaWdoLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0LT5teF9pcnFfaGFuZGxlciwgcG9ydCk7
DQo+ICAgICAgICAgICAgICAgICBlbHNlDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlycV9z
ZXRfY2hhaW5lZF9oYW5kbGVyX2FuZF9kYXRhKHBvcnQtPmlycV9oaWdoLCBOVUxMLCBOVUxMKTsN
Cj4gICAgICAgICB9DQo+IA0KPiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gcmVhZCBhbmQgdW5k
ZXJzdGFuZD8NCj4gDQoNCkxvb2tzIGJldHRlciB0byByZWFkLg0KDQpUaGFua3MsDQpTaGVud2Vp
DQoNCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCj4g
DQoNCg==
