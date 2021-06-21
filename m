Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A683AF176
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 19:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbhFURLx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 13:11:53 -0400
Received: from mail-dm6nam12on2075.outbound.protection.outlook.com ([40.107.243.75]:52182
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230059AbhFURLw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Jun 2021 13:11:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW8EgB1Pqa0y5v2USpEg+cC6q2YDztMS+m3l7EE+4+afud1GJ4rvz6Ecvw4YrejeHBej3WLbzkqvSlVyuibJ9c5szYE4CXOV5/svGr42B4BqPXzyLfDQ00Jdr2IR214rp5KIKVnoJbik/DYgwTZyHWqbburjm4uOa0GwEqNu2XDMz45Hifud4GYU1HiN+TRZbDV0rtx/CN6zjsAy9WLJok9LF5PbXEaR1nbj475K+2foZ9pGNeOVW/QvoxaoRxaWI/ZtzxE5f83f+EtxjZNmzxY8FiNBZBIJLzRMGvkxpnZLdAfdXf5X974sY0oWl9F2/kGdCMotyBQ86F8mAO6cgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Llv05ZLZqkhZARm5moLHUgb8N7/B+OHut3MOSKrHTRw=;
 b=LLAjENvMYIg0F1ce0BUmf2/MS/NH1gC8YoxRGhPtOOg9798yntiA+XMYwLyOvp+/Fy8YsHxyMeqeEYXgZAOd52v0knF9vrSePXSt7VVvCVN2vxV5CfH4C+hq8U92B3cKpTjXZ52KqERGLSKfusBrf24cGehan28MiJh2CoKWirbzCTY3kilbvmJQyzu1TaWVMoUCZIOQcDmB/cDFbikG8CsuvaF0aD43NWpuhwhEWY893tWRnkiS31/yTQWLGy+i+zHv2u4h27DrvxQ/Vv/OOk46mvNLSBZzfE7dCBgdpB28fWjcBSMiOTEfOfgHhXdBd5/NjFt1zKcFXPIta/TIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Llv05ZLZqkhZARm5moLHUgb8N7/B+OHut3MOSKrHTRw=;
 b=ZPh5YVKL8ksGKvY00fnNtt8L/pWfMIYdGz6JLMfIkO573yq6U7jQYnYp9OxUBnUvKG0IQrJABilw/XfNeMM2rt8TRlWUEqKGyqEbZ/C3cJA53lunJKzMz8/I38xPipfY9gvqqz6g6q/qi7mkzijblmltX3bOXvMsC1ldzb4MV8s=
Received: from PH0PR02MB7640.namprd02.prod.outlook.com (2603:10b6:510:4e::24)
 by PH0PR02MB7733.namprd02.prod.outlook.com (2603:10b6:510:4c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 17:09:32 +0000
Received: from PH0PR02MB7640.namprd02.prod.outlook.com
 ([fe80::1c8a:2a13:6c57:4a3]) by PH0PR02MB7640.namprd02.prod.outlook.com
 ([fe80::1c8a:2a13:6c57:4a3%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 17:09:32 +0000
From:   Piyush Mehta <piyushm@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        git <git@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>,
        Michal Simek <michals@xilinx.com>
Subject: RE: [PATCH 2/2] gpio: modepin: Add driver support for modepin GPIO
 controller
Thread-Topic: [PATCH 2/2] gpio: modepin: Add driver support for modepin GPIO
 controller
Thread-Index: AQHXYb1lJfCxO5tPuU+yMn2AjLrheKsZiW2AgAUudAA=
Date:   Mon, 21 Jun 2021 17:09:31 +0000
Message-ID: <PH0PR02MB76400D00A4DA42FE1D72C1FAD40A9@PH0PR02MB7640.namprd02.prod.outlook.com>
References: <20210615080553.2021061-1-piyush.mehta@xilinx.com>
 <20210615080553.2021061-3-piyush.mehta@xilinx.com>
 <CACRpkdYv6yosZ1KJazrMzaizpYz-cv-y4LcCqHm+Q94jva8sAA@mail.gmail.com>
In-Reply-To: <CACRpkdYv6yosZ1KJazrMzaizpYz-cv-y4LcCqHm+Q94jva8sAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [60.243.150.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4b3768a-d0e3-4111-d1c3-08d934d75665
x-ms-traffictypediagnostic: PH0PR02MB7733:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR02MB77334E7B176D7B4743AD98D9D40A9@PH0PR02MB7733.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:551;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uisEqiQNHVAwGYPZ1Th45uqvpozuTUUXC5D6JCHmv3rJULUfjHdGvRpaBuWcU/TgMl8SPgyHhjGWC3jYMa1fZZ32ZIwg4W4oYyHe0KP79Wyw/Og4KSIldb60fOs74SXpAE1vy1bTfPZo7r1kaOW4O8gThiFi0FaZwGXHL1y8FYXzp8dtFVI/vUGt30RluHzQPKCh1SvW18hzmdS3WT4KXEGWrXYIShLfkiDKMUSDOImXpdG0DwnjTl1075OFRTg3dLawcwi9lc37r7rWiOSjRHg5Fozy2yjVEXdtBB6DMbKDeX3p/6rQXKzPKo5u4HkFw2G2OUEKSWIptHaVUslez7TS+dWxoSfmmQF2cx2LBomtk+9TINMcYFilU3FoyW3SwEx7NxmEKv7N7/5Iho7e7/hCt+zr+kcUc1Ir81B0UPT04XNZ48DIHrLqjyVFLT3YO3TaByh7jYkheZNeWplN7qlkkG2rL2o3fVx/BFT2fL9wgTo/WEvAfmPZZc7Ik1W7gKH34RjAYToT3Fo/UuVFUzj2zZxjlZBjphG+ZPhMLTLldNZ84w6igqVsHWlKGUFV2dFWWhbqgkdDFNZdEHaau6jbs9dPHyVvrvpVmdr3O2Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7640.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(376002)(396003)(346002)(33656002)(64756008)(66556008)(66476007)(4326008)(8676002)(316002)(6916009)(66446008)(55016002)(478600001)(76116006)(5660300002)(54906003)(83380400001)(66946007)(107886003)(52536014)(86362001)(9686003)(7696005)(186003)(26005)(6506007)(53546011)(8936002)(2906002)(38100700002)(122000001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEdlNnJmZGViQUZoejNrYUg5bC9RR2FvZUhkV1YrY1ZKOFMzekRHZ1FrZ01p?=
 =?utf-8?B?MklCZ2MvWkZkUGNJUTF2dXNBWmdtb1pHUHBNL0l6ZEpXbUJwS3RLMEp0Y2gv?=
 =?utf-8?B?Vi9oVGlDYmIyNzUxQXlZTm5GeTVSSkdWTjJsdjNzUlRTNzVSclA2K1BqWkVP?=
 =?utf-8?B?RU9QbURuQnRkRUMvcFNQblBzRzViZE9BMnJHUlJVdWpqaStPUWJJOVhSTFBN?=
 =?utf-8?B?bGc5SFdjSzZKODB6bFBCU3FZaE5Mb3RORy8wcURkTzBlS3hKeTQyUklRTDJ5?=
 =?utf-8?B?M1NGZzRZandUY3JwZlF5Q2xlMDBGMWc2K3hhbWtxVEVoditOS3BaYTl5Zncz?=
 =?utf-8?B?RXRZZG5FN3dtUXd3WUJKdWxuVWxaOGdLY0lVcHdwN2dyeENDMkprQzNBZEpL?=
 =?utf-8?B?Wm45N1RNMGZkdEtkTUJwbE1wa3p2SDlyOGhGWGE4ZERkK1dkSGhUWURWblFr?=
 =?utf-8?B?b2hlcmlXTXB6amg0bmNkMlIreVg0NmdXdHNOWkFKUXAzTzJ1Zi9KaEYrdW5N?=
 =?utf-8?B?aGZCQkdFQTZEc3B6S1E1RnBncUhzRUtlRmx6NndUWEZPWkNuNXRrQk5rV3JW?=
 =?utf-8?B?ZTRUT2p2aVRjcUF4WTdCc2d5UTRudzRxbXNaeXppYVBFUUU2WjJxUXU5ZWMz?=
 =?utf-8?B?bUd3V200RUs0c2RWVmY0Skk5eTVGYzBWTndPRVQzbEIvYkFVVW1LR2paaFZI?=
 =?utf-8?B?cUE2WXJ0YjdPdDUxaXZpQitrOEFkQm5NNjU3MjluNjF1aFhGeFBFd3lWWXRp?=
 =?utf-8?B?SGhzMVZWc0hubTZJc3pkcU52NE5CVnVvTVlLUE9oc29IdUMva1NhNnh1T2JE?=
 =?utf-8?B?TFFZM0daOTQvSWhKcGVnOGJVS1FObkcrcFVOY2hNcHlKYmxrUjlmMUZpTkY3?=
 =?utf-8?B?Zi96MEJZSndDTExFbXB5Q21mQnNoeUxZU0hBcmNwZjE1OEF6bUhoQVJORFFL?=
 =?utf-8?B?aUwwQStsUFdjQmgzODNwSHdKQ0o1UitVMDNIem9XZVlRQjd2UlZhMjNESVFD?=
 =?utf-8?B?cUMxWTFmQjYxOVhsRGJQWTgyVzVXT0l0a1FWSHcwNGZZK1F3TklVZG5pQ2ZK?=
 =?utf-8?B?LytZRjAydlQxTFR2RU80Wk1KaExEZGNMaTNxbGlpL1Q2MjZnaFlKZVVIYVlk?=
 =?utf-8?B?OHpnNWxjY2Z0bjV1Lzl0cnp4Mnh5SHpmY0FLaDNKcklnS09ZVXFsR3ltMndU?=
 =?utf-8?B?bCtrRFZuU0VCdTF3Rm5aMndtNlRDeVQvVURKbTBGcDlmTWZlYWVYZVByVXkw?=
 =?utf-8?B?L0tsL2h6OWFBc1Q3NTM2UE5oUkIweGQwbkY3OUtOYlo1V2JJa1BYQ2VCeWFi?=
 =?utf-8?B?Y3o3T3Q3c2VKckxGNGxJbkhJdHJsNlZpSG5KSkh5ZUlHMW1YZDN0YXlzQUxs?=
 =?utf-8?B?cHdaV1lFZDl5RlFyWnFXR1pNUlIyb0QxK0FIZWkwUzF5Vkl4MGcrVTdja2k3?=
 =?utf-8?B?Mk11ZlFFRk5RNTc4VG10ZjFBWjYxUml6bHQ0dm5Lb0IyS2dqbWR2U2g1MC9x?=
 =?utf-8?B?NFhuaEFMWHF6bmtwYVo1bWRuNG9XUmE2cUlkRmM5VVFIRXRwZ0RxYVRTblFL?=
 =?utf-8?B?NTY5RXI3SWJNcDVyQ2c2VWJ6dzdJNHh2WGF0em5OQkxoQmF3dE5FUjl1SDNK?=
 =?utf-8?B?QmlpUlR0ZGoydkpGTHNkeFhqc3ZneS9pVFF4cUpOMTJpRGZtbEVxMXREUVRO?=
 =?utf-8?B?Rk9ya2FZTlhvWlVUQWhLSWR0WGs3dVJuWlFDV1FXa2tUQ2FHdE16ZXllNFV2?=
 =?utf-8?Q?FTtBl6NUzzXIpm8SNQfQTms6lCjdaGHgnqJGMvl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7640.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b3768a-d0e3-4111-d1c3-08d934d75665
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 17:09:32.0159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBx+uOrvEuwtuXdnxlC8GooQyB6OU57OrMmnvPE63BExN5SbMLqVznXrWZphpd9Dymi0TbfQ34J8jxgTi8eSEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7733
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGludXMsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyBjb21tZW50cy4NCldlIHdpbGwg
YWRkcmVzcyBhbGwgdGhlIHJldmlld3MgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KUmVnYXJkcywN
ClBpeXVzaCBNZWh0YQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiANClNlbnQ6IEZyaWRheSwgSnVuZSAx
OCwgMjAyMSAzOjE0IFBNDQpUbzogUGl5dXNoIE1laHRhIDxwaXl1c2htQHhpbGlueC5jb20+DQpD
YzogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT47IFJvYiBI
ZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6R1BJTyBTVUJTWVNURU0gPGxp
bnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgb3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZM
QVRURU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+
OyBsaW51eC1rZXJuZWwgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51eCBBUk0g
PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGdpdCA8Z2l0QHhpbGlueC5j
b20+OyBTcmluaXZhcyBHb3VkIDxzZ291ZEB4aWxpbnguY29tPjsgTWljaGFsIFNpbWVrIDxtaWNo
YWxzQHhpbGlueC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZ3BpbzogbW9kZXBpbjog
QWRkIGRyaXZlciBzdXBwb3J0IGZvciBtb2RlcGluIEdQSU8gY29udHJvbGxlcg0KDQpIaSBQaXl1
c2ghDQoNCnRoYW5rcyBmb3IgeW91ciBwYXRjaCENCg0KT24gVHVlLCBKdW4gMTUsIDIwMjEgYXQg
MTA6MDYgQU0gUGl5dXNoIE1laHRhIDxwaXl1c2gubWVodGFAeGlsaW54LmNvbT4gd3JvdGU6DQoN
Cj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBtb2RlIHBpbiBHUElPIGNvbnRyb2xs
ZXIuIEdQSU8gTW9kZXBpbiANCj4gZHJpdmVyIHNldCBhbmQgZ2V0IHRoZSB2YWx1ZSBhbmQgc3Rh
dHVzIG9mIHRoZSBQU19NT0RFIHBpbiwgYmFzZWQgb24gDQo+IGRldmljZS10cmVlIHBpbiBjb25m
aWd1cmF0aW9uLiBUaGVzZSA0LWJpdHMgYm9vdC1tb2RlIHBpbnMgYXJlIA0KPiBkZWRpY2F0ZWQg
Y29uZmlndXJhYmxlIGFzIGlucHV0L291dHB1dC4gQWZ0ZXIgdGhlIHN0YWJpbGl6YXRpb24gb2Yg
dGhlIA0KPiBzeXN0ZW0sIHRoZXNlIG1vZGUgcGlucyBhcmUgc2FtcGxlZC4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogUGl5dXNoIE1laHRhIDxwaXl1c2gubWVodGFAeGlsaW54LmNvbT4NCg0KT0ssIHNv
dW5kcyBpbnRlcmVzdGluZyENCg0KPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCg0KSSB0aGlu
ayBJIHNhdyBzb21ld2hlcmUgdGhhdCB0aGlzIGlzIG5vdCBuZWVkZWQgYW55bW9yZSwgY2hlY2sg
aWYgeW91IG5lZWQgaXQuDQoNCj4gKyNkZWZpbmUgR0VUX09VVEVOX1BJTihwaW4pICAgICAgICAg
ICAgICgxVSA8PCAocGluKSkNCg0KRGVsZXRlIHRoaXMgbWFjcm8gYW5kIGp1c3QgdXNlIEJJVChw
aW4pIGlubGluZS4NCiNpbmNsdWRlIDxsaW51eC9iaXRzLmg+DQoNCj4gK3N0YXRpYyBpbnQgbW9k
ZXBpbl9ncGlvX2dldF92YWx1ZShzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCANCj4g
K2ludCBwaW4pIHsNCj4gKyAgICAgICB1MzIgb3V0X2VuOw0KPiArICAgICAgIHUzMiByZWd2YWwg
PSAwOw0KPiArICAgICAgIGludCByZXQ7DQo+ICsNCj4gKyAgICAgICBvdXRfZW4gPSBHRVRfT1VU
RU5fUElOKHBpbik7DQoNCkRyb3AgdGhpcyBhbmQgb3V0X2VuDQoNCj4gKyAgICAgICByZXQgPSB6
eW5xbXBfcG1fYm9vdG1vZGVfcmVhZCgmcmVndmFsKTsNCj4gKyAgICAgICBpZiAocmV0KSB7DQo+
ICsgICAgICAgICAgICAgICBwcl9lcnIoIm1vZGVwaW46IGdldCB2YWx1ZSBlcnIgJWRcbiIsIHJl
dCk7DQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiArICAgICAgIH0NCj4gKw0KPiAr
ICAgICAgIHJldHVybiAob3V0X2VuICYgKHJlZ3ZhbCA+PiA4VSkpID8gMSA6IDA7DQoNCnJldHVy
biAhIShyZWd2YWwgJiBCSVQocGluICsgOCkpOw0KDQpzaG91bGQgd29yayBhbmQgaXMgZWFzaWVy
IHRvIHJlYWQgSU1PLiBXZSBqdXN0IGNoZWNrIHRoZSByaWdodCBiaXQgaW1tZWRpYXRlbHkuDQoN
Cj4gK3N0YXRpYyB2b2lkIG1vZGVwaW5fZ3Bpb19zZXRfdmFsdWUoc3RydWN0IGdwaW9fY2hpcCAq
Y2hpcCwgdW5zaWduZWQgaW50IHBpbiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgc3RhdGUpIHsNCj4gKyAgICAgICB1MzIgb3V0X2VuOw0KPiArICAgICAgIHUzMiBi
b290cGluX3ZhbCA9IDA7DQo+ICsgICAgICAgaW50IHJldDsNCj4gKw0KPiArICAgICAgIG91dF9l
biA9IEdFVF9PVVRFTl9QSU4ocGluKTsNCg0KU2tpcCB0aGlzIGhlbHBlciB2YXJpYWJsZS4NCg0K
PiArICAgICAgIHN0YXRlID0gc3RhdGUgIT0gMCA/IG91dF9lbiA6IDA7DQoNClVoIHRoYXQgaXMg
cmVhbGx5IGhhcmQgdG8gcmVhZCBhbmQgbW9kaWZpZWQgYSBwYXJhbWV0ZXIuIFNraXAgdGhhdCB0
b28uDQoNCj4gKyAgICAgICBib290cGluX3ZhbCA9IChzdGF0ZSA8PCAoOFUpKSB8IG91dF9lbjsN
Cg0KV2hhdCB5b3Ugd2FudCBpcyBtYXNrIGFuZCBzZXQuDQoNCmJvb3RwaW5fdmFsID0gQklUKHBp
biArIDgpOw0KDQo+ICsgICAgICAgLyogQ29uZmlndXJlIGJvb3RwaW4gdmFsdWUgKi8NCj4gKyAg
ICAgICByZXQgPSB6eW5xbXBfcG1fYm9vdG1vZGVfd3JpdGUoYm9vdHBpbl92YWwpOw0KDQpUaGlz
IGp1c3QgbG9va3Mgd2VpcmQuDQoNCldoeSBhcmUgeW91IG5vdCByZWFkaW5nIHRoZSB2YWx1ZSBm
aXJzdCBzaW5jZSB5b3UgYXJlIHVzaW5nIHJlYWQvbW9kaWZ5L3dyaXRlPw0KDQpJICp0aGluayog
eW91IHdhbnQgdG8gZG8gdGhpczoNCg0KcmV0ID0genlucW1wX3BtX2Jvb3Rtb2RlX3JlYWQoJnZh
bCk7DQppZiAocmV0KQ0KICAgLyogZXJyb3IgaGFuZGxpbmcgKi8NCmlmIChzdGF0ZSkNCiAgICB2
YWwgfD0gQklUKHBpbiArIDgpOw0KZWxzZQ0KICAgIHZhbCAmPSB+QklUKHBpbiArIDgpOw0KcmV0
ID0genlucW1wX3BtX2Jvb3Rtb2RlX3dyaXRlKHZhbCk7DQppZiAocmV0KQ0KICAgLyogZXJyb3Ig
aGFuZGxpbmcgKi8NCg0KPiArLyoNCj4gKyAqIG1vZGVwaW5fZ3Bpb19kaXJfaW4gLSBTZXQgdGhl
IGRpcmVjdGlvbiBvZiB0aGUgc3BlY2lmaWVkIEdQSU8gcGluIGFzIGlucHV0DQo+ICsgKiBAY2hp
cDogICAgICBncGlvX2NoaXAgaW5zdGFuY2UgdG8gYmUgd29ya2VkIG9uDQo+ICsgKiBAcGluOiAg
ICAgICBncGlvIHBpbiBudW1iZXIgd2l0aGluIHRoZSBkZXZpY2UNCj4gKyAqDQo+ICsgKiBSZXR1
cm46IDAgYWx3YXlzDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQgbW9kZXBpbl9ncGlvX2Rpcl9pbihz
dHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgDQo+ICtwaW4pIHsNCj4gKyAgICAg
ICByZXR1cm4gMDsNCj4gK30NCg0KSSB0aGluayB5b3Ugc2FpZCB0aGlzIHdhcyBjb25maWd1cmFi
bGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpVc2UgdGhlIGRlZmluZSBHUElPX0xJTkVfRElS
RUNUSU9OX09VVCByYXRoZXIgdGhhbiAwLg0KDQo+ICtzdGF0aWMgaW50IG1vZGVwaW5fZ3Bpb19k
aXJfb3V0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGludCBwaW4sDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHN0YXRlKSB7DQo+ICsgICAgICAgcmV0dXJu
IDA7DQo+ICt9DQoNCkNvbmZpZ3VyYWJsZT8NCg0KPiArICAgICAgIHN0YXR1cyA9IGRldm1fZ3Bp
b2NoaXBfYWRkX2RhdGEoJnBkZXYtPmRldiwgY2hpcCwgY2hpcCk7DQo+ICsgICAgICAgaWYgKHN0
YXR1cykNCj4gKyAgICAgICAgICAgICAgIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgc3RhdHVz
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGFkZCBHUElPIGNo
aXBcbiIpOw0KDQpqdXN0IHJldHVybiBkZXZfZXJyX3Byb2JlKC4uLikNCg0KWW91cnMsDQpMaW51
cyBXYWxsZWlqDQo=
