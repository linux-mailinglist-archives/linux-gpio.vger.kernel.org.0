Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6A978BF26
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Aug 2023 09:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbjH2HXe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Aug 2023 03:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbjH2HXP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Aug 2023 03:23:15 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3468E19F;
        Tue, 29 Aug 2023 00:22:47 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 37T7M51J0019501, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 37T7M51J0019501
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 29 Aug 2023 15:22:05 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 29 Aug 2023 15:22:30 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 29 Aug 2023 15:22:30 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Tue, 29 Aug 2023 15:22:30 +0800
From:   =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?= <tychang@realtek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 5/7] dt-bindings: pinctrl: realtek: add RTD1315E pinctrl binding
Thread-Topic: [PATCH v2 5/7] dt-bindings: pinctrl: realtek: add RTD1315E
 pinctrl binding
Thread-Index: AQHZ1s+HbgdteTQm50qw2SI6YdXagLAA5J2A
Date:   Tue, 29 Aug 2023 07:22:30 +0000
Message-ID: <14b8a56d55af4b689cf06f9ff0fab30b@realtek.com>
References: <20230824105703.19612-1-tychang@realtek.com>
 <20230824105703.19612-6-tychang@realtek.com>
 <20230824211121.GA1388146-robh@kernel.org>
In-Reply-To: <20230824211121.GA1388146-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.181.166]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgUm9iLA0KDQo+T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMDY6NTc6MDFQTSArMDgwMCwgVHp1
eWkgQ2hhbmcgd3JvdGU6DQo+PiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIFJURDEzMTVF
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFR6dXlpIENoYW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29t
Pg0KPj4gLS0tDQo+PiB2MSB0byB2MiBjaGFuZ2U6DQo+PiAxLiBBZGQgYSBkZXNjcmlwdGlvbiBm
b3IgUlREMTMxNUUuDQo+PiAyLiBSZW5hbWUgcmVhbHRlayxwZHJpdmUsIHJlYWx0ZWttbmRyaXZl
IGFuZCByZWFsdGVrLGRjeWNsZS4NCj4+IDMuIEFkZCBhIGRlc2NyaXB0aW9uIGZvciBQTU9TIGFu
ZCBOTU9TIGRyaXZpbmcgc3RyZW5ndGguDQo+PiA0LiBSZW1vdmUgdGhlIHdpbGRjYXJkIGluIHRo
ZSBjb21wYXRpYmxlIHN0cmluZ3MuDQo+PiA1LiBVc2UgJy1waW5zJCcgdG8gYmUgbm9kZSBuYW1l
IHBhdHRlcm4uDQo+PiAtLS0NCj4+ICAuLi4vcGluY3RybC9yZWFsdGVrLHJ0ZDEzMTVlLXBpbmN0
cmwueWFtbCAgICAgfCAxOTEgKysrKysrKysrKysrKysrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDE5MSBpbnNlcnRpb25zKCspDQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+PiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDEzMTVlLXBpbmN0cmwu
eWFtDQo+PiBsDQo+Pg0KPj4gZGlmZiAtLWdpdA0KPj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDEzMTVlLXBpbmN0cmwueQ0KPj4gYW1sDQo+
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JlYWx0ZWsscnRk
MTMxNWUtcGluY3RybC55DQo+PiBhbWwNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmJhYmQ4N2QwNWYzMg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVhbHRlayxydGQxMzE1
ZS1waW5jdA0KPj4gKysrIHJsLnlhbWwNCj4+IEBAIC0wLDAgKzEsMTkxIEBADQo+PiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKSAjIENvcHlyaWdo
dCAyMDIzDQo+PiArUmVhbHRlayBTZW1pY29uZHVjdG9yIENvcnBvcmF0aW9uICVZQU1MIDEuMg0K
Pj4gKy0tLQ0KPj4gKyRpZDoNCj4+ICtodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waW5j
dHJsL3JlYWx0ZWsscnRkMTMxNWUtcGluY3RybC55YW1sIw0KPj4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPj4gKw0KPj4gK3RpdGxlOiBS
ZWFsdGVrIERIQyBSVEQxMzE1RSBQaW4gQ29udHJvbGxlcg0KPj4gKw0KPj4gK21haW50YWluZXJz
Og0KPj4gKyAgLSBUWSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4+ICsNCj4+ICtkZXNj
cmlwdGlvbjoNCj4+ICsgIFRoZSBSZWFsdGVrIERIQyBSVEQxMzE1RSBpcyBhIGhpZ2gtZGVmaW5p
dGlvbiBtZWRpYSBwcm9jZXNzb3IgU29DLg0KPj4gK1RoZQ0KPj4gKyAgUlREMTMxNUUgcGluIGNv
bnRyb2xsZXIgaXMgdXNlZCB0byBjb250cm9sIHBpbiBmdW5jdGlvbiwgcHVsbA0KPj4gK3VwL2Rv
d24NCj4+ICsgIHJlc2lzdG9yLCBkcml2ZSBzdHJlbmd0aCwgc2NobWl0dCB0cmlnZ2VyIGFuZCBw
b3dlciBzb3VyY2UuDQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+ICsgIGNvbXBhdGlibGU6DQo+
PiArICAgIGNvbnN0OiByZWFsdGVrLHJ0ZDEzMTVlLXBpbmN0cmwNCj4+ICsNCj4+ICsgIHJlZzoN
Cj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4+ICsg
ICctcGlucyQnOg0KPj4gKyAgICBpZjoNCj4+ICsgICAgICB0eXBlOiBvYmplY3QNCj4+ICsgICAg
dGhlbjoNCj4NCj5Ecm9wIHRoZSBpZi90aGVuLiAiLXBpbnMiIHNob3VsZCBhbHdheXMgYmUgYSBu
b2RlIChvYmplY3QpLg0KDQpJIHdpbGwgZml4IGl0IGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCj4N
Cj4+ICsgICAgICBhbGxPZjoNCj4+ICsgICAgICAgIC0gJHJlZjogcGluY2ZnLW5vZGUueWFtbCMN
Cj4+ICsgICAgICAgIC0gJHJlZjogcGlubXV4LW5vZGUueWFtbCMNCj4+ICsNCj4+ICsgICAgICBw
cm9wZXJ0aWVzOg0KPj4gKyAgICAgICAgcGluczoNCj4+ICsgICAgICAgICAgaXRlbXM6DQo+PiAr
ICAgICAgICAgICAgZW51bTogWyBncGlvXzAsIGdwaW9fMSwgZW1tY19yc3RfbiwgZW1tY19kZF9z
YiwgZW1tY19jbGssDQo+ZW1tY19jbWQsDQo+PiArICAgICAgICAgICAgICAgICAgICBncGlvXzYs
IGdwaW9fNywgZ3Bpb184LCBncGlvXzksIGdwaW9fMTAsIGdwaW9fMTEsDQo+Z3Bpb18xMiwNCj4+
ICsgICAgICAgICAgICAgICAgICAgIGdwaW9fMTMsIGdwaW9fMTQsIGdwaW9fMTUsIGdwaW9fMTYs
IGdwaW9fMTcsIGdwaW9fMTgsDQo+Z3Bpb18xOSwNCj4+ICsgICAgICAgICAgICAgICAgICAgIGdw
aW9fMjAsIGVtbWNfZGF0YV8wLCBlbW1jX2RhdGFfMSwgZW1tY19kYXRhXzIsDQo+dXNiX2NjMiwg
Z3Bpb18yNSwNCj4+ICsgICAgICAgICAgICAgICAgICAgIGdwaW9fMjYsIGdwaW9fMjcsIGdwaW9f
MjgsIGdwaW9fMjksIGdwaW9fMzAsIGdwaW9fMzEsDQo+Z3Bpb18zMiwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgIGdwaW9fMzMsIGdwaW9fMzQsIGdwaW9fMzUsIGhpZl9kYXRhLCBoaWZfZW4sIGhp
Zl9yZHksDQo+aGlmX2NsaywNCj4+ICsgICAgICAgICAgICAgICAgICAgIGdwaW9fZHVtbXlfNDAs
IGdwaW9fZHVtbXlfNDEsIGdwaW9fZHVtbXlfNDIsDQo+Z3Bpb19kdW1teV80MywNCj4+ICsgICAg
ICAgICAgICAgICAgICAgIGdwaW9fZHVtbXlfNDQsIGdwaW9fZHVtbXlfNDUsIGdwaW9fNDYsIGdw
aW9fNDcsDQo+Z3Bpb180OCwgZ3Bpb180OSwNCj4+ICsgICAgICAgICAgICAgICAgICAgIGdwaW9f
NTAsIHVzYl9jYzEsIGVtbWNfZGF0YV8zLCBlbW1jX2RhdGFfNCwgaXJfcngsDQo+dXIwX3J4LCB1
cjBfdHgsDQo+PiArICAgICAgICAgICAgICAgICAgICBncGlvXzU3LCBncGlvXzU4LCBncGlvXzU5
LCBncGlvXzYwLCBncGlvXzYxLCBncGlvXzYyLA0KPmdwaW9fZHVtbXlfNjMsDQo+PiArICAgICAg
ICAgICAgICAgICAgICBncGlvX2R1bW15XzY0LCBncGlvX2R1bW15XzY1LCBncGlvXzY2LCBncGlv
XzY3LA0KPmdwaW9fNjgsIGdwaW9fNjksDQo+PiArICAgICAgICAgICAgICAgICAgICBncGlvXzcw
LCBncGlvXzcxLCBncGlvXzcyLCBncGlvX2R1bW15XzczLA0KPmVtbWNfZGF0YV81LCBlbW1jX2Rh
dGFfNiwNCj4+ICsgICAgICAgICAgICAgICAgICAgIGVtbWNfZGF0YV83LCBncGlvX2R1bW15Xzc3
LCBncGlvXzc4LCBncGlvXzc5LA0KPmdwaW9fODAsIGdwaW9fODEsDQo+PiArICAgICAgICAgICAg
ICAgICAgICB1cjJfbG9jLCBnc3BpX2xvYywgaGlfd2lkdGgsIHNmX2VuLCBhcm1fdHJhY2VfZGJn
X2VuLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgZWp0YWdfYXVjcHVfbG9jLCBlanRhZ19hY3B1
X2xvYywgZWp0YWdfdmNwdV9sb2MsDQo+ZWp0YWdfc2NwdV9sb2MsDQo+PiArICAgICAgICAgICAg
ICAgICAgICBkbWljX2xvYywgdnRjX2RtaWNfbG9jLCB2dGNfdGRtX2xvYywgdnRjX2kyc2lfbG9j
LA0KPnRkbV9haV9sb2MsDQo+PiArICAgICAgICAgICAgICAgICAgICBhaV9sb2MsIHNwZGlmX2xv
YywgaGlmX2VuX2xvYywgc2Nhbl9zd2l0Y2gsIHdkX3JzZXQsDQo+Ym9vdF9zZWwsDQo+PiArICAg
ICAgICAgICAgICAgICAgICByZXNldF9uLCB0ZXN0bW9kZSBdDQo+PiArDQo+PiArICAgICAgICBm
dW5jdGlvbjoNCj4+ICsgICAgICAgICAgZW51bTogWyBncGlvLCBuZiwgZW1tYywgYW8sIGdzcGlf
bG9jMCwgZ3NwaV9sb2MxLCB1YXJ0MCwgdWFydDEsDQo+PiArICAgICAgICAgICAgICAgICAgdWFy
dDJfbG9jMCwgdWFydDJfbG9jMSwgaTJjMCwgaTJjMSwgaTJjNCwgaTJjNSwgcGNpZTEsDQo+PiAr
ICAgICAgICAgICAgICAgICAgZXRuX2xlZCwgZXRuX3BoeSwgc3BpLCBwd20wX2xvYzAsIHB3bTBf
bG9jMSwNCj5wd20xX2xvYzAsDQo+PiArICAgICAgICAgICAgICAgICAgcHdtMV9sb2MxLCBwd20y
X2xvYzAsIHB3bTJfbG9jMSwgcHdtM19sb2MwLA0KPnB3bTNfbG9jMSwNCj4+ICsgICAgICAgICAg
ICAgICAgICBzcGRpZl9vcHRpY2FsX2xvYzAsIHNwZGlmX29wdGljYWxfbG9jMSwgdXNiX2NjMSwg
dXNiX2NjMiwNCj4+ICsgICAgICAgICAgICAgICAgICBzZCwgZG1pY19sb2MwLCBkbWljX2xvYzEs
IGFpX2xvYzAsIGFpX2xvYzEsIHRkbV9haV9sb2MwLA0KPj4gKyAgICAgICAgICAgICAgICAgIHRk
bV9haV9sb2MxLCBoaV9sb2MwLCBoaV9tLCB2dGNfaTJzbywgdnRjX2kyc2lfbG9jMCwNCj4+ICsg
ICAgICAgICAgICAgICAgICB2dGNfaTJzaV9sb2MxLCB2dGNfZG1pY19sb2MwLCB2dGNfZG1pY19s
b2MxLA0KPnZ0Y190ZG1fbG9jMCwNCj4+ICsgICAgICAgICAgICAgICAgICB2dGNfdGRtX2xvYzEs
IGRjX2ZhbiwgcGxsX3Rlc3RfbG9jMCwgcGxsX3Rlc3RfbG9jMSwNCj4+ICsgICAgICAgICAgICAg
ICAgICBpcl9yeCwgdWFydDJfZGlzYWJsZSwgZ3NwaV9kaXNhYmxlLCBoaV93aWR0aF9kaXNhYmxl
LA0KPj4gKyAgICAgICAgICAgICAgICAgIGhpX3dpZHRoXzFiaXQsIHNmX2Rpc2FibGUsIHNmX2Vu
YWJsZSwgc2NwdV9lanRhZ19sb2MwLA0KPj4gKyAgICAgICAgICAgICAgICAgIHNjcHVfZWp0YWdf
bG9jMSwgc2NwdV9lanRhZ19sb2MyLCBzY3B1X2VqdGFnX2xvYzMsDQo+PiArICAgICAgICAgICAg
ICAgICAgYWNwdV9lanRhZ19sb2MwLCBhY3B1X2VqdGFnX2xvYzEsIGFjcHVfZWp0YWdfbG9jMiwN
Cj4+ICsgICAgICAgICAgICAgICAgICB2Y3B1X2VqdGFnX2xvYzAsIHZjcHVfZWp0YWdfbG9jMSwg
dmNwdV9lanRhZ19sb2MyLA0KPj4gKyAgICAgICAgICAgICAgICAgIGF1Y3B1X2VqdGFnX2xvYzAs
IGF1Y3B1X2VqdGFnX2xvYzEsIGF1Y3B1X2VqdGFnX2xvYzIsDQo+PiArICAgICAgICAgICAgICAg
ICAgZ3B1X2VqdGFnLCBpc29fdHJpc3RhdGUsIGRiZ19vdXQwLCBkYmdfb3V0MSwNCj5zdGFuZGJ5
X2RiZywNCj4+ICsgICAgICAgICAgICAgICAgICBzcGRpZiwgYXJtX3RyYWNlX2RlYnVnX2Rpc2Fi
bGUsDQo+YXJtX3RyYWNlX2RlYnVnX2VuYWJsZSwNCj4+ICsgICAgICAgICAgICAgICAgICBhdWNw
dV9lanRhZ19kaXNhYmxlLCBhY3B1X2VqdGFnX2Rpc2FibGUsDQo+dmNwdV9lanRhZ19kaXNhYmxl
LA0KPj4gKyAgICAgICAgICAgICAgICAgIHNjcHVfZWp0YWdfZGlzYWJsZSwgdnRjX2RtaWNfbG9j
X2Rpc2FibGUsDQo+dnRjX3RkbV9kaXNhYmxlLA0KPj4gKyAgICAgICAgICAgICAgICAgIHZ0Y19p
MnNpX2Rpc2FibGUsIHRkbV9haV9kaXNhYmxlLCBhaV9kaXNhYmxlLCBzcGRpZl9kaXNhYmxlLA0K
Pj4gKyAgICAgICAgICAgICAgICAgIGhpZl9kaXNhYmxlLCBoaWZfZW5hYmxlLCB0ZXN0X2xvb3As
IHBtaWNfcHdydXAgXQ0KPj4gKw0KPj4gKw0KPj4gKyAgICAgICAgZHJpdmUtc3RyZW5ndGg6DQo+
PiArICAgICAgICAgIGVudW06IFs0LCA4XQ0KPj4gKw0KPj4gKyAgICAgICAgYmlhcy1wdWxsLWRv
d246IHRydWUNCj4+ICsNCj4+ICsgICAgICAgIGJpYXMtcHVsbC11cDogdHJ1ZQ0KPj4gKw0KPj4g
KyAgICAgICAgYmlhcy1kaXNhYmxlOiB0cnVlDQo+PiArDQo+PiArICAgICAgICBpbnB1dC1zY2ht
aXR0LWVuYWJsZTogdHJ1ZQ0KPj4gKw0KPj4gKyAgICAgICAgaW5wdXQtc2NobWl0dC1kaXNhYmxl
OiB0cnVlDQo+PiArDQo+PiArICAgICAgICBkcml2ZS1wdXNoLXB1bGw6IHRydWUNCj4+ICsNCj4+
ICsgICAgICAgIHBvd2VyLXNvdXJjZToNCj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwNCj4+
ICsgICAgICAgICAgICBWYWxpZCBhcmd1bWVudHMgYXJlIGRlc2NyaWJlZCBhcyBiZWxvdzoNCj4+
ICsgICAgICAgICAgICAwOiBwb3dlciBzdXBwbHkgb2YgMS44Vg0KPj4gKyAgICAgICAgICAgIDE6
IHBvd2VyIHN1cHBseSBvZiAzLjNWDQo+PiArICAgICAgICAgIGVudW06IFswLCAxXQ0KPj4gKw0K
Pj4gKyAgICAgICAgcmVhbHRlayxkcml2ZS1zdHJlbmd0aC1wOg0KPj4gKyAgICAgICAgICBkZXNj
cmlwdGlvbjogfA0KPj4gKyAgICAgICAgICAgIFNvbWUgb2YgcGlucyBjYW4gYmUgZHJpdmVuIHVz
aW5nIHRoZSBQLU1PUyBhbmQgTi1NT1MNCj50cmFuc2lzdG9yIHRvDQo+PiArICAgICAgICAgICAg
YWNoaWV2ZSBmaW5lciBhZGp1c3RtZW50cy4gVGhlIGJsb2NrLWRpYWdyYW0gcmVwcmVzZW50YXRp
b24gaXMNCj5hcw0KPj4gKyAgICAgICAgICAgIGZvbGxvd3M6DQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVkREDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICB8fC0tKw0KPj4gKyAgICAgICAgICAgICAgICAgKy0tLS0t
b3x8ICAgICBQLU1PUy1GRVQNCj4+ICsgICAgICAgICAgICAgICAgIHwgICAgICB8fC0tKw0KPj4g
KyAgICAgICAgICAgIElOIC0tKyAgICAgICAgICArLS0tLS0gb3V0DQo+PiArICAgICAgICAgICAg
ICAgICB8ICAgICAgfHwtLSsNCj4+ICsgICAgICAgICAgICAgICAgICstLS0tLS18fCAgICAgTi1N
T1MtRkVUDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgfHwtLSsNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIEdORA0K
Pj4gKyAgICAgICAgICAgIFRoZSBkcml2aW5nIHN0cmVuZ3RoIG9mIHRoZSBQLU1PUy9OLU1PUyB0
cmFuc2lzdG9ycyBpbXBhY3RzIHRoZQ0KPj4gKyAgICAgICAgICAgIHdhdmVmb3JtJ3MgcmlzZS9m
YWxsIHRpbWVzLiBHcmVhdGVyIGRyaXZpbmcgc3RyZW5ndGggcmVzdWx0cyBpbg0KPj4gKyAgICAg
ICAgICAgIHNob3J0ZXIgcmlzZS9mYWxsIHRpbWVzLiBFYWNoIFAtTU9TIGFuZCBOLU1PUyB0cmFu
c2lzdG9yIG9mZmVycw0KPj4gKyAgICAgICAgICAgIDggY29uZmlndXJhYmxlIGxldmVscyAoMCB0
byA3KSwgd2l0aCBoaWdoZXIgdmFsdWVzIGluZGljYXRpbmcNCj4+ICsgICAgICAgICAgICBncmVh
dGVyIGRyaXZpbmcgc3RyZW5ndGgsIGNvbnRyaWJ1dGluZyB0byBhY2hpZXZpbmcgdGhlIGRlc2ly
ZWQNCj4+ICsgICAgICAgICAgICBzcGVlZC4NCj4+ICsNCj4+ICsgICAgICAgICAgICBUaGUgcmVh
bHRlayxkcml2ZS1zdHJlbmd0aC1wIGlzIHVzZWQgdG8gY29udHJvbCB0aGUgZHJpdmluZw0KPnN0
cmVuZ3RoDQo+PiArICAgICAgICAgICAgb2YgdGhlIFAtTU9TIG91dHB1dC4NCj4+ICsgICAgICAg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+PiArICAg
ICAgICAgIG1pbmltdW06IDANCj4+ICsgICAgICAgICAgbWF4aW11bTogNw0KPj4gKw0KPj4gKyAg
ICAgICAgcmVhbHRlayxkcml2ZS1zdHJlbmd0aC1uOg0KPj4gKyAgICAgICAgICBkZXNjcmlwdGlv
bjogfA0KPj4gKyAgICAgICAgICAgIFNpbWlsYXIgdG8gdGhlIHJlYWx0ZWssZHJpdmUtc3RyZW5n
dGgtcCwgdGhlDQo+cmVhbHRlayxkcml2ZS1zdHJlbmd0aC1uDQo+PiArICAgICAgICAgICAgaXMg
dXNlZCB0byBjb250cm9sIHRoZSBkcml2aW5nIHN0cmVuZ3RoIG9mIHRoZSBOLU1PUyBvdXRwdXQu
DQo+PiArICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQzMg0KPj4gKyAgICAgICAgICBtaW5pbXVtOiAwDQo+PiArICAgICAgICAgIG1heGltdW06IDcN
Cj4+ICsNCj4+ICsgICAgICAgIHJlYWx0ZWssZHV0eS1jeWNsZToNCj4+ICsgICAgICAgICAgZGVz
Y3JpcHRpb246IHwNCj4+ICsgICAgICAgICAgICBBbiBpbnRlZ2VyIGRlc2NyaWJpbmcgdGhlIGxl
dmVsIHRvIGFkanVzdCBvdXRwdXQgZHV0eSBjeWNsZSwNCj5jb250cm9sbGluZw0KPj4gKyAgICAg
ICAgICAgIHRoZSBwcm9wb3J0aW9uIG9mIHBvc2l0aXZlIGFuZCBuZWdhdGl2ZSB3YXZlZm9ybXMg
aW4NCj5uYW5vc2Vjb25kcy4NCj4+ICsgICAgICAgICAgICBWYWxpZCBhcmd1bWVudHMgYXJlIGRl
c2NyaWJlZCBhcyBiZWxvdzoNCj4+ICsgICAgICAgICAgICAwOiAwbnMNCj4+ICsgICAgICAgICAg
ICAyOiArIDAuMjVucw0KPj4gKyAgICAgICAgICAgIDM6ICsgMC41bnMNCj4+ICsgICAgICAgICAg
ICA0OiAtMC4yNW5zDQo+PiArICAgICAgICAgICAgNTogLTAuNW5zDQo+PiArICAgICAgICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPj4gKyAgICAgICAg
ICBlbnVtOiBbIDAsIDIsIDMsIDQsIDUgXQ0KPj4gKw0KPj4gKyAgICAgIHJlcXVpcmVkOg0KPj4g
KyAgICAgICAgLSBwaW5zDQo+PiArDQo+PiArICAgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlDQo+PiArDQo+PiArcmVxdWlyZWQ6DQo+PiArICAtIGNvbXBhdGlibGUNCj4+ICsgIC0gcmVn
DQo+PiArDQo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+PiArDQo+PiArZXhhbXBs
ZXM6DQo+PiArICAtIHwNCj4+ICsgICAgIHBpbmN0cmxANGUwMDAgew0KPj4gKyAgICAgICAgIGNv
bXBhdGlibGUgPSAicmVhbHRlayxydGQxMzE1ZS1waW5jdHJsIjsNCj4+ICsgICAgICAgICByZWcg
PSA8MHg0ZTAwMCAweDEzMD47DQo+PiArDQo+PiArICAgICAgICAgZW1tYy1oczIwMC1waW5zIHsN
Cj4+ICsgICAgICAgICAgICAgcGlucyA9ICJlbW1jX2NsayIsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAiZW1tY19jbWQiLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgImVtbWNfZGF0YV8wIiwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICJlbW1jX2RhdGFfMSIsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAiZW1tY19kYXRhXzIiLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgImVtbWNfZGF0
YV8zIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICJlbW1jX2RhdGFfNCIsDQo+PiArICAgICAg
ICAgICAgICAgICAgICAiZW1tY19kYXRhXzUiLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgImVt
bWNfZGF0YV82IiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICJlbW1jX2RhdGFfNyI7DQo+PiAr
ICAgICAgICAgICAgIGZ1bmN0aW9uID0gImVtbWMiOw0KPj4gKyAgICAgICAgICAgICByZWFsdGVr
LGRyaXZlLXN0cmVuZ3RoLXAgPSA8MHgyPjsNCj4+ICsgICAgICAgICAgICAgcmVhbHRlayxkcml2
ZS1zdHJlbmd0aC1uID0gPDB4Mj47DQo+PiArICAgICAgICAgfTsNCj4+ICsNCj4+ICsgICAgICAg
ICBpMmMtMC1waW5zIHsNCj4+ICsgICAgICAgICAgICAgcGlucyA9ICJncGlvXzEyIiwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICJncGlvXzEzIjsNCj4+ICsgICAgICAgICAgICAgZnVuY3Rpb24g
PSAiaTJjMCI7DQo+PiArICAgICAgICAgICAgIGRyaXZlLXN0cmVuZ3RoID0gPDQ+Ow0KPj4gKyAg
ICAgICAgIH07DQo+PiArICAgICB9Ow0KPj4gLS0NCj4+IDIuNDEuMA0KPj4NCg0KVGhhbmtzLA0K
VHp1eWkgQ2hhbmcNCg0K
