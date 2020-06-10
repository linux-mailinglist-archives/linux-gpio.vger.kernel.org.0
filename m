Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AD41F4FE6
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 10:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgFJIFF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 04:05:05 -0400
Received: from mail-am6eur05on2040.outbound.protection.outlook.com ([40.107.22.40]:28009
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726081AbgFJIFF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 04:05:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzrC+StsMeAcGti05hkOkORzQ/+FOnSbhiSc3tCM7uKT7CcdXVBe6/hiYy05kD92e9FXa3n8btJd8B/zyP76Jl08EvKSnOXbqieH0vUD3EafNcp7pmnv0xlSambs6sf0UOi9GJHFXmWLhmxZMkRKCYGmIY0MNyolqp14DoD+hUMSyZ9T8tGRNG7Xbk7u+1NBnZzp5NxoUE1MBChkEftzCl9Jj3BfBk78SD1AzP0X91JtRop1d9CXCdDA4IY0QajkKqrwY3OMwxKmyzRajcALJDCs21wMwXn/48HspZRkqOyPJnFHSnIIJOth19kTIX3UxGMJA5RaQcMwbWMAnLmnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT5EaRQVpYWIRHCuHHLo5DaYJg1ysfnzxLHi2VDxLd8=;
 b=Mi4AIDlQQgJ41jh6cXXwk694+tg+1CzzGTP8lPdL8T3DJG/g0MiY6/wfOLoLDm4AgjqghCTw/ZZ2HY4SLAAL6cHJUlnQMi/fLTmbQI3Y21kFRjKqluc3Jb4PVuTWR6E3Nm6I8NYIDCubcWcfJEJzpVmBeGD2yn5Btv+PsSkVIne+WCAZYc9l23AIHtTzXFI+qEgE4aoTmUAS4oCIH+2khbevzrnEQjjQAZ9MDr2I8q4h1QZeVhHrkhocFH3JhrKiGFDbylv7WsvTwKA6Uopjm/wNkUumjvVRRDk67tn+RXrzjRQqCSiUp9ZvIRYR155wpzMNFK020+YZV50sbHRMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT5EaRQVpYWIRHCuHHLo5DaYJg1ysfnzxLHi2VDxLd8=;
 b=qnU863f3FeFPugVYqEhjoP2TMN560Z0JuidotMfTPRV9+zBblRfClpkBb5TGI28kW64PwlqBw/k1Kaup38YZk0EqbEUBEzNI3SOzdgQWdG6wSCDGtp7EI1JOxylfsEUW3fmxLzhnjZR29ZKDcwNuTsG1XsztDeh35ZnJnOfPL1w=
Received: from DB7PR04MB4972.eurprd04.prod.outlook.com (2603:10a6:10:1c::11)
 by DB7PR04MB4427.eurprd04.prod.outlook.com (2603:10a6:5:30::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 08:04:57 +0000
Received: from DB7PR04MB4972.eurprd04.prod.outlook.com
 ([fe80::8cb5:8821:ad1a:7f6e]) by DB7PR04MB4972.eurprd04.prod.outlook.com
 ([fe80::8cb5:8821:ad1a:7f6e%4]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 08:04:57 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 0/9] Support i.MX8 SoCs pinctrl drivers built as module
Thread-Topic: [PATCH V3 0/9] Support i.MX8 SoCs pinctrl drivers built as
 module
Thread-Index: AQHWPmrEVFpeNeUrREGCcvDpD9lSNKjRfJ0g
Date:   Wed, 10 Jun 2020 08:04:57 +0000
Message-ID: <DB7PR04MB49721DEE875099E086E2486E80830@DB7PR04MB4972.eurprd04.prod.outlook.com>
References: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3f9a20c0-a16d-460f-89af-08d80d14f7a0
x-ms-traffictypediagnostic: DB7PR04MB4427:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB44277E8110CDA3C2202B3D1780830@DB7PR04MB4427.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0430FA5CB7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eqDWgCaq/oItxmFNIyEIySiqlw2ZP8Cjx5qK8X96qsXqCllkC6L/q0RkJ0g3VZiRGYe3PURgBwvRoAWR4Dw/XIOP2gPZfTTop3H7Bff8BjeSQWp+7bMpPCotot1MyUe+rD35k+oeV0/S5cLSN7IHl2gE2k0Tcen9NwHEVcKrWi/MoruI/RVcdOTlLLazybKlSIkkmM+6AAi446zNOh6ulS54eJOgdyAYeB2V9njtHLjqUtCeZvbWUdg7BsYeyetRznSlI0yHwoRhh4gThwYK1+8ISGEZVYd4k4HBEvienMxV+7wf3ccFoU4Ly+EQkZ5tZNyaRH3KUN8fUhNkd+aN89NA6mQ/sqRZ0+JlUokcqMUNF8hsuKONTlsp7jQq6Kyj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4972.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(6029001)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(71200400001)(8676002)(2906002)(5660300002)(9686003)(55016002)(316002)(66556008)(33656002)(52536014)(110136005)(66446008)(64756008)(44832011)(86362001)(66476007)(76116006)(7696005)(26005)(478600001)(186003)(8936002)(4326008)(6506007)(66946007)(83380400001)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Is/rz5nbu1DV4GKhZ6KOVI/csW7dHg7GKXepyOXGLM7X3tvSN21rWTzkD6bDFzpO0kev4c0mapeatfljgczDzrk9xYKM1R05W5YDnZlKBFdVIPJHtWubDRNQCUHLZ4hJ4LWkcH5NONm1Na5zHjPMy35Y3xq7erWINK/N/IfXZv+cjEBec0oyfDhEyT2Elju0IhnApsgEuNPIZeeDb+pM5wOb03O6Vt83amXM/EQLvjVXKsq9GOHRjRD4jpED4XGUSIpW1JR2923ANM+XSYqLLY/+kWLo5t3IQ2vvVeShmv6E78K7QTXHNTr6pHtlCa/ACJBdlxLP4WXPFuyLwTIJc6QjtlsU5V78jy6uGkzLFK/2noek9PA8VrW327n6DbrLS7ip/rkwaqhWOwAOAyczZStcHd5Bl9NRB8w3mjRrLOW95JXAgr87Ry89CL6kKT9l0+QFQkcwUfUbwlfsdm02lEDw1uHndhU9PbwKk4SdwzE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9a20c0-a16d-460f-89af-08d80d14f7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2020 08:04:57.6433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6A5ls0PsGN2kWqd5SeH2nZyz7zv4A+jLqcrbstqNDwqniwdznN3QG0Q125XszAhuTZOcStNFUFRU/4J/SHTF/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4427
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gU2VudDogVHVlc2Rh
eSwgSnVuZSA5LCAyMDIwIDEwOjIxIFBNDQo+IA0KPiBUaGVyZSBhcmUgbW9yZSBhbmQgbXJvZSBy
ZXF1aXJlbWVudHMgdGhhdCBTb0Mgc3BlY2lmaWMgbW9kdWxlcyBzaG91bGQgYmUNCj4gYnVpbHQg
YXMgbW9kdWxlIGluIG9yZGVyIHRvIHN1cHBvcnQgZ2VuZXJpYyBrZXJuZWwgaW1hZ2UsIHN1Y2gg
YXMgQW5kcm9pZCBHS0kNCj4gY29uY2VwdC4NCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIHN1cHBv
cnRzIGkuTVg4IFNvQ3MgcGluY3RybCBkcml2ZXJzIHRvIGJlIGJ1aWx0IGFzIG1vZHVsZSwNCj4g
aW5jbHVkaW5nIGkuTVg4TVEvTU0vTU4vTVAvUVhQL1FNL0RYTCBTb0NzLCBhbmQgaXQgYWxzbyBz
dXBwb3J0cw0KPiBidWlsZGluZyBpLk1YIGNvbW1vbiBwaW5jdHJsIGRyaXZlciBhbmQgaS5NWCBT
Q1UgY29tbW9uIHBpbmN0cmwgZHJpdmVyIGFzDQo+IG1vZHVsZS4NCj4gDQoNClRoaXMgcGF0Y2gg
c2VyaWVzIGFsc28gY2hhbmdlZCB0aGUgZHJpdmVyIGluaXRjYWxsIGxldmVsIGZyb20gYXJjaF9p
bml0Y2FsbCB0byBtb2R1bGVfaW5pdC4NCk1heWJlIHlvdSBjb3VsZCBwcm92aWRlIHNvbWUgdGVz
dCBpbmZvcm1hdGlvbiB0byBoZWxwIHRoZSByZXZpZXdlciB0byBiZXR0ZXIgdW5kZXJzdGFuZA0K
dGhlIGNoYW5nZSBpbXBhY3QuDQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiBDb21wYXJlZCB0byBW
MiwgdGhlIGNoYW5nZXMgYXJlIGFzIGJlbG93Og0KPiAJLSBhZGQgImRlcGVuZHMgb24gT0YiIHRv
IFBJTkNUUkxfSU1YIHRvIGZpeCBidWlsZCBlcnJvciB1c2luZyB4ODYNCj4gcmFuZGNvbmZpZzsN
Cj4gCS0gY2hhbmdlIHRoZSBjb25maWcgZGVwZW5kZW5jeSBvZiBQSU5DVFJMX0lNWF9TQ1UgdG8g
c3VwcG9ydCBzY2VuYXJpbw0KPiBvZg0KPiAJICBidWlsZGluZyBpbiBQSU5DVFJMX0lNWCB3aGls
ZSBidWlsZGluZyBQSU5DVFJMX0lNWF9TQ1UgYXMgbW9kdWxlLA0KPiBubyBvdGhlcg0KPiAJICBn
b29kIGNob2ljZSBpbiBteSBtaW5kLCBpZiB5b3UgaGF2ZSBiZXR0ZXIgaWRlYSB3aXRob3V0IGNo
YW5naW5nIHRoZQ0KPiBkcml2ZXINCj4gCSAgY29kZSwgcGxlYXNlIGFkdmlzZS4NCj4gDQo+IEFu
c29uIEh1YW5nICg5KToNCj4gICBwaW5jdHJsOiBpbXg6IFN1cHBvcnQgYnVpbGRpbmcgU0NVIHBp
bmN0cmwgZHJpdmVyIGFzIG1vZHVsZQ0KPiAgIHBpbmN0cmw6IGlteDogU3VwcG9ydCBidWlsZGlu
ZyBpLk1YIHBpbmN0cmwgZHJpdmVyIGFzIG1vZHVsZQ0KPiAgIHBpbmN0cmw6IGlteDhtbTogU3Vw
cG9ydCBidWlsZGluZyBhcyBtb2R1bGUNCj4gICBwaW5jdHJsOiBpbXg4bW46IFN1cHBvcnQgYnVp
bGRpbmcgYXMgbW9kdWxlDQo+ICAgcGluY3RybDogaW14OG1xOiBTdXBwb3J0IGJ1aWxkaW5nIGFz
IG1vZHVsZQ0KPiAgIHBpbmN0cmw6IGlteDhtcDogU3VwcG9ydCBidWlsZGluZyBhcyBtb2R1bGUN
Cj4gICBwaW5jdHJsOiBpbXg4cXhwOiBTdXBwb3J0IGJ1aWxkaW5nIGFzIG1vZHVsZQ0KPiAgIHBp
bmN0cmw6IGlteDhxbTogU3VwcG9ydCBidWlsZGluZyBhcyBtb2R1bGUNCj4gICBwaW5jdHJsOiBp
bXg4ZHhsOiBTdXBwb3J0IGJ1aWxkaW5nIGFzIG1vZHVsZQ0KPiANCj4gIGRyaXZlcnMvcGluY3Ry
bC9mcmVlc2NhbGUvS2NvbmZpZyAgICAgICAgICAgfCAyNyArKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0NCj4gIGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYyAgICAgfCAg
NCArKysrDQo+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmggICAgIHwg
IDIgKy0NCj4gIGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXg4ZHhsLmMgfCAg
OSArKystLS0tLS0NCj4gZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteDhtbS5j
ICB8IDEwICsrKystLS0tLS0NCj4gZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlt
eDhtbi5jICB8IDEwICsrKystLS0tLS0NCj4gZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5j
dHJsLWlteDhtcC5jICB8IDEwICsrKystLS0tLS0NCj4gZHJpdmVycy9waW5jdHJsL2ZyZWVzY2Fs
ZS9waW5jdHJsLWlteDhtcS5jICB8ICA5ICsrKystLS0tLQ0KPiBkcml2ZXJzL3BpbmN0cmwvZnJl
ZXNjYWxlL3BpbmN0cmwtaW14OHFtLmMgIHwgIDkgKysrLS0tLS0tDQo+IGRyaXZlcnMvcGluY3Ry
bC9mcmVlc2NhbGUvcGluY3RybC1pbXg4cXhwLmMgfCAgOSArKystLS0tLS0NCj4gIGRyaXZlcnMv
cGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1zY3UuYyAgICAgfCAgNiArKysrKysNCj4gIDExIGZp
bGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDU1IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0N
Cj4gMi43LjQNCg0K
