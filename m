Return-Path: <linux-gpio+bounces-1113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B286B809EBA
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 10:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2DBEB20B45
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 09:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4A4111A3;
	Fri,  8 Dec 2023 09:03:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF51710F9;
	Fri,  8 Dec 2023 01:03:33 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3B893L4f8772529, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3B893L4f8772529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Dec 2023 17:03:21 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 8 Dec 2023 17:03:21 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 8 Dec 2023 17:03:21 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Fri, 8 Dec 2023 17:03:21 +0800
From: =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?= <tychang@realtek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: gpio: realtek: Add realtek,rtd-gpio
Thread-Topic: [PATCH v3 1/2] dt-bindings: gpio: realtek: Add realtek,rtd-gpio
Thread-Index: AQHaKPU7BovJRXVvek6zKcsdpY6YorCdUeOAgAGyNsA=
Date: Fri, 8 Dec 2023 09:03:20 +0000
Message-ID: <b3a41f598bc043ce9626b674a92b8da4@realtek.com>
References: <20231207100723.15015-1-tychang@realtek.com>
 <20231207100723.15015-2-tychang@realtek.com>
 <dd22f0fb-e07b-4bd4-bd6a-cf2d8a5687fc@linaro.org>
In-Reply-To: <dd22f0fb-e07b-4bd4-bd6a-cf2d8a5687fc@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="big5"
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

SGkgS3J6eXN6dG9mLA0KDQo+PiBkaWZmIC0tZ2l0DQo+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ncGlvL3JlYWx0ZWsscnRkLWdwaW8ueWFtbA0KPj4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9yZWFsdGVrLHJ0ZC1ncGlvLnlhbWwNCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjk4NGU3ZGJkMzIyZQ0K
Pj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2dwaW8vcmVhbHRlayxydGQtZ3Bpby55YW1sDQo+PiBAQCAtMCwwICsxLDY5IEBADQo+PiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKSAjIENv
cHlyaWdodCAyMDIzDQo+PiArUmVhbHRlayBTZW1pY29uZHVjdG9yIENvcnBvcmF0aW9uICVZQU1M
IDEuMg0KPj4gKy0tLQ0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZ3Bp
by9yZWFsdGVrLHJ0ZC1ncGlvLnlhbWwjDQo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+PiArDQo+PiArdGl0bGU6IFJlYWx0ZWsgREhD
IEdQSU8gY29udHJvbGxlcg0KPj4gKw0KPj4gK21haW50YWluZXJzOg0KPj4gKyAgLSBUenV5aSBD
aGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjoNCj4+ICsg
IFRoZSBHUElPIGNvbnRyb2xsZXIgaXMgZGVzaWduZWQgZm9yIHRoZSBSZWFsdGVrIERIQyAoRGln
aXRhbCBIb21lDQo+PiArQ2VudGVyKQ0KPj4gKyAgUlREIHNlcmllcyBTb0MgZmFtaWx5LCB3aGlj
aCBhcmUgaGlnaC1kZWZpbml0aW9uIG1lZGlhIHByb2Nlc3NvciBTb0NzLg0KPj4gKw0KPj4gK3By
b3BlcnRpZXM6DQo+PiArICBjb21wYXRpYmxlOg0KPj4gKyAgICBlbnVtOg0KPj4gKyAgICAgIC0g
cmVhbHRlayxydGQxMjk1LW1pc2MtZ3Bpbw0KPj4gKyAgICAgIC0gcmVhbHRlayxydGQxMjk1LWlz
by1ncGlvDQo+PiArICAgICAgLSByZWFsdGVrLHJ0ZDEzOTUtaXNvLWdwaW8NCj4+ICsgICAgICAt
IHJlYWx0ZWsscnRkMTYxOS1pc28tZ3Bpbw0KPj4gKyAgICAgIC0gcmVhbHRlayxydGQxMzE5LWlz
by1ncGlvDQo+PiArICAgICAgLSByZWFsdGVrLHJ0ZDE2MTliLWlzby1ncGlvDQo+PiArICAgICAg
LSByZWFsdGVrLHJ0ZDEzMTlkLWlzby1ncGlvDQo+PiArICAgICAgLSByZWFsdGVrLHJ0ZDEzMTVl
LWlzby1ncGlvDQo+DQo+SWYgdGhlcmUgaXMgZ29pbmcgdG8gYmUgcmVzZW5kLCBwbGVhc2Ugb3Jk
ZXIgdGhpcyBsaXN0IGFscGhhbnVtZXJpY2FsbHkuDQo+DQoNCkkgd2lsbCByZXZpc2UgaXQgaW4g
dGhlIG5leHQgdmVyc2lvbg0KDQo+PiArDQo+PiArICByZWc6DQo+PiArICAgIGl0ZW1zOg0KPj4g
KyAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gY29udHJvbGxlciByZWdpc3RlcnMNCj4+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCByZWdpc3RlcnMNCj4+ICsNCj4NCj4uLi4N
Cj4NCj4+ICsNCj4+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+ICtleGFt
cGxlczoNCj4+ICsgIC0gfA0KPj4gKyAgICBncGlvQDEwMCB7DQo+PiArICAgICAgY29tcGF0aWJs
ZSA9ICJyZWFsdGVrLHJ0ZDEzMTlkLWlzby1ncGlvIjsNCj4+ICsgICAgICByZWcgPSA8MHgxMDAg
MHgxMDA+LA0KPj4gKyAgICAgICAgICAgIDwweDAwMCAweDBiMD47DQo+DQo+VGhhdCdzIG9kZC4g
V2h5IG9yZGVyIGlzIGRlY3JlYXNpbmc/IElzbid0IDB4MCB0aGUgYWRkcmVzcyBvZiB0aGUgU29D
IChzb2NAMCk/DQo+DQoNClRoZSBEVFMgdXNlIGluIG91ciBwbGF0Zm9ybSBmb2xsb3dzIHRoaXMg
c3RydWN0dXJlOg0KDQpzb2NAMCB7DQogICAgcmJ1czogcmJ1c0A5ODAwMDAwMCB7DQoJICAgIC4u
Lg0KICAgICAgICBpc286IHN5c2NvbkA3MDAwIHsNCgkJICAgIC4uLg0KICAgICAgICAgICAgZ3Bp
bzogZ3Bpb0AxMDAgew0KICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVhbHRlayxydGQx
MzE5ZC1pc28tZ3BpbyI7DQogICAgICAgICAgICAgICAgcmVnID0gPDB4MTAwIDB4MTAwPiwNCiAg
ICAgICAgICAgICAgICAgICAgICA8MHgwMDAgMHgwYjA+Ow0KICAgICAgICAgICAgICAgIGludGVy
cnVwdC1wYXJlbnQgPSA8Jmlzb19pcnFfbXV4PjsNCiAgICAgICAgICAgICAgICBpbnRlcnJ1cHRz
ID0gPDE5PiwgPDIwPjsNCiAgICAgICAgICAgICAgICBncGlvLXJhbmdlcyA9IDwmcGluY3RybCAw
IDAgODI+Ow0KICAgICAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsNCiAgICAgICAgICAgICAg
ICAjZ3Bpby1jZWxscyA9IDwyPjsNCiAgICAgICAgICAgIH07DQogICAgICAgIH07DQogICAgfTsN
Cn07DQoNClRoZSBiYXNlIGFkZHJlc3MgZm9yIHRoZSBHUElPIGNvbnRyb2xsZXIgaXMgMHg5ODAw
NzEwMC4gVGhlIHNlY29uZCBsaW5lIG9mDQoncmVnJyByZWZlcnMgdG8gdGhlIEdQSU8gaW50ZXJy
dXB0IHN0YXR1cyByZWdpc3RlcnMsIHdoaWNoIGFyZSBkaXN0cmlidXRlZA0Kd2l0aGluIHRoZSBy
YW5nZSBvZiAweDk4MDA3MDAwIHRvIDB4OTgwMDcwQUYuIFdvdWxkIGl0IGJlIGFkdmlzYWJsZSB0
byBmZXRjaCB0aGUNCnN5c2NvbiBmcm9tIHBhcmVudCBub2RlKGlzbzogc3lzY29uQDcwMDApIHRv
IGhhbmRsZSB0aGUgR1BJTyBpbnRlcnJ1cHQgc3RhdHVzDQpyZWdpc3RlcnM/DQoNCj5JdCBpcywg
YnR3LCAweDAsIG5vdCAweDAwMC4gVGhlIHNhbWUgZm9yIDB4MGIwIC0+IDB4YjAsIHVubGVzcyB5
b3Ugd2FudCB0byBwYWQNCj50byBmdWxsIHdvcmQuDQo+DQoNCkkgd2lsbCByZXZpc2UgaXQgaW4g
dGhlIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzLA0KVHp1eWkgQ2hhbmcNCg==

