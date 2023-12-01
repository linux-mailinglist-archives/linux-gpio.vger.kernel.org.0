Return-Path: <linux-gpio+bounces-806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 493EA800131
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 02:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3F56B20FAF
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 01:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DF117CF;
	Fri,  1 Dec 2023 01:44:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B81D67;
	Thu, 30 Nov 2023 17:44:44 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3B11iVztD4133696, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3B11iVztD4133696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Dec 2023 09:44:31 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 1 Dec 2023 09:44:32 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 1 Dec 2023 09:44:31 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Fri, 1 Dec 2023 09:44:31 +0800
From: =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] Add GPIO support for Realtek DHC(Digital Home Center) RTD SoCs.
Thread-Topic: [PATCH v2 2/2] Add GPIO support for Realtek DHC(Digital Home
 Center) RTD SoCs.
Thread-Index: AQHaGH4c7D0XjcmgAUiBOm4nmmy8ibCIvO0AgAsA7yA=
Date: Fri, 1 Dec 2023 01:44:31 +0000
Message-ID: <d687c5ac9fed4570970cb0c0282019b3@realtek.com>
References: <20231116111441.2339-1-tychang@realtek.com>
 <20231116111441.2339-3-tychang@realtek.com>
 <CACRpkdZTFWnH1iwLCeJy02OXJAgTSSVTomzDNEQ3ebWocwkgPA@mail.gmail.com>
In-Reply-To: <CACRpkdZTFWnH1iwLCeJy02OXJAgTSSVTomzDNEQ3ebWocwkgPA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
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

SGkgTGludXMsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4gSSB3aWxsIHJldmlzZSB0aGUg
a2VybmVsZG9jIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCj4NCj5IaSBUenV5aSwNCj4NCj5PbiBU
aHUsIE5vdiAxNiwgMjAyMyBhdCAxMjoxNOKAr1BNIFR6dXlpIENoYW5nIDx0eWNoYW5nQHJlYWx0
ZWsuY29tPg0KPndyb3RlOg0KPg0KPj4gVGhpcyBkcml2ZXIgZW5hYmxlcyBjb25maWd1cmF0aW9u
IG9mIEdQSU8gZGlyZWN0aW9uLCBHUElPIHZhbHVlcywgR1BJTw0KPj4gZGVib3VuY2Ugc2V0dGlu
Z3MgYW5kIGhhbmRsZXMgR1BJTyBpbnRlcnJ1cHRzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFR6
dXlpIENoYW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29tPg0KPg0KPkFwYXJ0IGZyb20gdGhlIG1pc3Np
bmcga2VybmVsZG9jIHRoYXQgdGhlIGF1dG9idWlsZGVyIGlzIGNvbXBsYWluaW5nIGFib3V0IHRo
aXMNCj5sb29rcyBnb29kIHRvIG1lLiBJZiB5b3UgZml4IHRoZSBrZXJuZWxkb2M6DQo+UmV2aWV3
ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4NCj5Zb3Vy
cywNCj5MaW51cyBXYWxsZWlqDQoNClRoYW5rcywNClR6dXlpIENoYW5nDQo=

