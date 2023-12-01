Return-Path: <linux-gpio+bounces-807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3486780013B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 02:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E07F92815DF
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 01:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CCB17D2;
	Fri,  1 Dec 2023 01:51:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0601C10FF;
	Thu, 30 Nov 2023 17:51:08 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3B11ovBtB4138308, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3B11ovBtB4138308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Dec 2023 09:50:57 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 1 Dec 2023 09:50:57 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 1 Dec 2023 09:50:56 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Fri, 1 Dec 2023 09:50:56 +0800
From: =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
To: Andy Shevchenko <andy@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] Add GPIO support for Realtek DHC(Digital Home Center) RTD SoCs.
Thread-Topic: [PATCH v2 2/2] Add GPIO support for Realtek DHC(Digital Home
 Center) RTD SoCs.
Thread-Index: AQHaGH4c7D0XjcmgAUiBOm4nmmy8ibCIvO0AgAAfgoCACuJyIA==
Date: Fri, 1 Dec 2023 01:50:56 +0000
Message-ID: <3482d87c4cd74363964d1d867e0c81cd@realtek.com>
References: <20231116111441.2339-1-tychang@realtek.com>
 <20231116111441.2339-3-tychang@realtek.com>
 <CACRpkdZTFWnH1iwLCeJy02OXJAgTSSVTomzDNEQ3ebWocwkgPA@mail.gmail.com>
 <ZWCJkddstjpXTtQx@smile.fi.intel.com>
In-Reply-To: <ZWCJkddstjpXTtQx@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

SGkgQW5keSwNCg0KPg0KPk9uIEZyaSwgTm92IDI0LCAyMDIzIGF0IDEwOjM4OjQyQU0gKzAxMDAs
IExpbnVzIFdhbGxlaWogd3JvdGU6DQo+PiBPbiBUaHUsIE5vdiAxNiwgMjAyMyBhdCAxMjoxNOKA
r1BNIFR6dXlpIENoYW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29tPg0KPndyb3RlOg0KPj4NCj4+ID4g
VGhpcyBkcml2ZXIgZW5hYmxlcyBjb25maWd1cmF0aW9uIG9mIEdQSU8gZGlyZWN0aW9uLCBHUElP
IHZhbHVlcywNCj4+ID4gR1BJTyBkZWJvdW5jZSBzZXR0aW5ncyBhbmQgaGFuZGxlcyBHUElPIGlu
dGVycnVwdHMuDQo+PiA+DQo+PiA+IFNpZ25lZC1vZmYtYnk6IFR6dXlpIENoYW5nIDx0eWNoYW5n
QHJlYWx0ZWsuY29tPg0KPj4NCj4+IEFwYXJ0IGZyb20gdGhlIG1pc3Npbmcga2VybmVsZG9jIHRo
YXQgdGhlIGF1dG9idWlsZGVyIGlzIGNvbXBsYWluaW5nDQo+PiBhYm91dCB0aGlzIGxvb2tzIGdv
b2QgdG8gbWUuIElmIHlvdSBmaXggdGhlIGtlcm5lbGRvYzoNCj4+IFJldmlld2VkLWJ5OiBMaW51
cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+DQo+SSB0aGluayBJIG1pZ2h0
IGhhdmUgY29tbWVudHMgaW4gdGhlIGZ1dHVyZS4NCj5JIGhhdmVuJ3QgbG9va2VkIGF0IHRoZSBz
ZXJpZXMgZHVlIHRvIG5vdGljaW5nIExLUCBjb21wbGFpbnMuDQo+DQoNCkkgd2lsbCBmaXggdGhl
IGJ1aWxkIHdhcm5pbmcgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzLA0KVHp1eWkgQ2hh
bmcNCg0K

