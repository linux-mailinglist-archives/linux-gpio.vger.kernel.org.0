Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7BE578BF2B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Aug 2023 09:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbjH2HYI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Aug 2023 03:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbjH2HYB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Aug 2023 03:24:01 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 087DDAD;
        Tue, 29 Aug 2023 00:23:57 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 37T7NNXt8020414, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 37T7NNXt8020414
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 29 Aug 2023 15:23:23 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 29 Aug 2023 15:23:48 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 29 Aug 2023 15:23:47 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Tue, 29 Aug 2023 15:23:47 +0800
From:   =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?= <tychang@realtek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 6/7] dt-bindings: pinctrl: realtek: add RTD1319D pinctrl binding
Thread-Topic: [PATCH v2 6/7] dt-bindings: pinctrl: realtek: add RTD1319D
 pinctrl binding
Thread-Index: AQHZ1s/N5p5bX5jpRkqn4vwsgazoxrAA5Zpg
Date:   Tue, 29 Aug 2023 07:23:47 +0000
Message-ID: <82eda9de1be7451eaeb8e9bad1dc68bb@realtek.com>
References: <20230824105703.19612-1-tychang@realtek.com>
 <20230824105703.19612-7-tychang@realtek.com>
 <20230824211318.GB1388146-robh@kernel.org>
In-Reply-To: <20230824211318.GB1388146-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.181.166]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
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

SGkgUm9iLA0KDQo+T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMDY6NTc6MDJQTSArMDgwMCwgVHp1
eWkgQ2hhbmcgd3JvdGU6DQo+PiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIFJURDEzMTlE
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFR6dXlpIENoYW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29t
Pg0KPj4gLS0tDQo+PiB2MSB0byB2MiBjaGFuZ2U6DQo+PiAxLiBBZGQgYSBkZXNjcmlwdGlvbiBm
b3IgUlREMTMxOUQuDQo+PiAyLiBSZW5hbWUgcmVhbHRlayxwZHJpdmUsIHJlYWx0ZWttbmRyaXZl
IGFuZCByZWFsdGVrLGRjeWNsZS4NCj4+IDMuIEFkZCBhIGRlc2NyaXB0aW9uIGZvciBQTU9TIGFu
ZCBOTU9TIGRyaXZpbmcgc3RyZW5ndGguDQo+PiA0LiBSZW1vdmUgdGhlIHdpbGRjYXJkIGluIHRo
ZSBjb21wYXRpYmxlIHN0cmluZ3MuDQo+PiA1LiBVc2UgJy1waW5zJCcgdG8gYmUgbm9kZSBuYW1l
IHBhdHRlcm4uDQo+PiAtLS0NCj4+ICAuLi4vcGluY3RybC9yZWFsdGVrLHJ0ZDEzMTlkLXBpbmN0
cmwueWFtbCAgICAgfCAxODkgKysrKysrKysrKysrKysrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDE4OSBpbnNlcnRpb25zKCspDQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+PiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDEzMTlkLXBpbmN0cmwu
eWFtDQo+PiBsDQo+Pg0KPj4gZGlmZiAtLWdpdA0KPj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDEzMTlkLXBpbmN0cmwueQ0KPj4gYW1sDQo+
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JlYWx0ZWsscnRk
MTMxOWQtcGluY3RybC55DQo+PiBhbWwNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjg2NTNkNDJhYzFmMw0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVhbHRlayxydGQxMzE5
ZC1waW5jdA0KPj4gKysrIHJsLnlhbWwNCj4+IEBAIC0wLDAgKzEsMTg5IEBADQo+PiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKSAjIENvcHlyaWdo
dCAyMDIzDQo+PiArUmVhbHRlayBTZW1pY29uZHVjdG9yIENvcnBvcmF0aW9uICVZQU1MIDEuMg0K
Pj4gKy0tLQ0KPj4gKyRpZDoNCj4+ICtodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waW5j
dHJsL3JlYWx0ZWsscnRkMTMxOWQtcGluY3RybC55YW1sIw0KPj4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPj4gKw0KPj4gK3RpdGxlOiBS
ZWFsdGVrIERIQyBSVEQxMzE5RCBQaW4gQ29udHJvbGxlcg0KPj4gKw0KPj4gK21haW50YWluZXJz
Og0KPj4gKyAgLSBUWSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4+ICsNCj4+ICtkZXNj
cmlwdGlvbjoNCj4+ICsgIFRoZSBSZWFsdGVrIERIQyBSVEQxMzE5RCBpcyBhIGhpZ2gtZGVmaW5p
dGlvbiBtZWRpYSBwcm9jZXNzb3IgU29DLg0KPj4gK1RoZQ0KPj4gKyAgUlREMTMxOUQgcGluIGNv
bnRyb2xsZXIgaXMgdXNlZCB0byBjb250cm9sIHBpbiBmdW5jdGlvbiwgcHVsbA0KPj4gK3VwL2Rv
d24NCj4+ICsgIHJlc2lzdG9yLCBkcml2ZSBzdHJlbmd0aCwgc2NobWl0dCB0cmlnZ2VyIGFuZCBw
b3dlciBzb3VyY2UuDQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+ICsgIGNvbXBhdGlibGU6DQo+
PiArICAgIGNvbnN0OiByZWFsdGVrLHJ0ZDEzMTlkLXBpbmN0cmwNCj4+ICsNCj4+ICsgIHJlZzoN
Cj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4+ICsg
ICdeLiokJzoNCj4NCj5JbiBjYXNlIGl0IHdhcyBub3Qgb2J2aW91cywgbXkgY29tbWVudCB0byB1
c2UgJy1waW5zJyBhcHBsaWVzIGhlcmUgYW5kIHRvIHRoZSBuZXh0DQo+cGF0Y2guDQo+DQo+PiAr
ICAgIGlmOg0KPg0KPkFzIGRvZXMgZHJvcHBpbmcgaWYvdGhlbi4NCj4NCg0KSSB3aWxsIGZpeCBp
dCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+PiArICAgICAgdHlwZTogb2JqZWN0DQo+PiArICAg
IHRoZW46DQo+PiArICAgICAgYWxsT2Y6DQo+PiArICAgICAgICAtICRyZWY6IHBpbmNmZy1ub2Rl
LnlhbWwjDQo+PiArICAgICAgICAtICRyZWY6IHBpbm11eC1ub2RlLnlhbWwjDQo+PiArDQo+PiAr
ICAgICAgcHJvcGVydGllczoNCj4+ICsgICAgICAgIHBpbnM6DQo+PiArICAgICAgICAgIGl0ZW1z
Og0KPj4gKyAgICAgICAgICAgIGVudW06IFsgZ3Bpb18wLCBncGlvXzEsIGdwaW9fMiwgZ3Bpb18z
LCBncGlvXzQsIGdwaW9fNSwgZ3Bpb182LA0KPmdwaW9fNywNCj4+ICsgICAgICAgICAgICAgICAg
ICAgIGdwaW9fOCwgZ3Bpb185LCBncGlvXzEwLCBncGlvXzExLCBncGlvXzEyLCBncGlvXzEzLA0K
PmdwaW9fMTQsDQo+PiArICAgICAgICAgICAgICAgICAgICBncGlvXzE1LCBncGlvXzE2LCBncGlv
XzE3LCBncGlvXzE4LCBncGlvXzE5LCBncGlvXzIwLA0KPmdwaW9fMjEsDQo+PiArICAgICAgICAg
ICAgICAgICAgICBncGlvXzIyLCBncGlvXzIzLCB1c2JfY2MyLCBncGlvXzI1LCBncGlvXzI2LCBn
cGlvXzI3LA0KPmdwaW9fMjgsDQo+PiArICAgICAgICAgICAgICAgICAgICBncGlvXzI5LCBncGlv
XzMwLCBncGlvXzMxLCBncGlvXzMyLCBncGlvXzMzLCBncGlvXzM0LA0KPmdwaW9fMzUsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICBoaWZfZGF0YSwgaGlmX2VuLCBoaWZfcmR5LCBoaWZfY2xrLCBn
cGlvXzQwLCBncGlvXzQxLA0KPmdwaW9fNDIsDQo+PiArICAgICAgICAgICAgICAgICAgICBncGlv
XzQzLCBncGlvXzQ0LCBncGlvXzQ1LCBncGlvXzQ2LCBncGlvXzQ3LCBncGlvXzQ4LA0KPmdwaW9f
NDksDQo+PiArICAgICAgICAgICAgICAgICAgICBncGlvXzUwLCB1c2JfY2MxLCBncGlvXzUyLCBn
cGlvXzUzLCBpcl9yeCwgdXIwX3J4LA0KPnVyMF90eCwNCj4+ICsgICAgICAgICAgICAgICAgICAg
IGdwaW9fNTcsIGdwaW9fNTgsIGdwaW9fNTksIGdwaW9fNjAsIGdwaW9fNjEsIGdwaW9fNjIsDQo+
Z3Bpb182MywNCj4+ICsgICAgICAgICAgICAgICAgICAgIGdwaW9fNjQsIGVtbWNfcnN0X24sIGVt
bWNfZGRfc2IsIGVtbWNfY2xrLA0KPmVtbWNfY21kLCBlbW1jX2RhdGFfMCwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgIGVtbWNfZGF0YV8xLCBlbW1jX2RhdGFfMiwgZW1tY19kYXRhXzMsDQo+ZW1t
Y19kYXRhXzQsIGVtbWNfZGF0YV81LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgZW1tY19kYXRh
XzYsIGVtbWNfZGF0YV83LCBkdW1teSwgZ3Bpb183OCwNCj5ncGlvXzc5LCBncGlvXzgwLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgZ3Bpb184MSwgdXIyX2xvYywgZ3NwaV9sb2MsIGhpX3dpZHRo
LCBzZl9lbiwNCj5hcm1fdHJhY2VfZGJnX2VuLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgZWp0
YWdfYXVjcHVfbG9jLCBlanRhZ19hY3B1X2xvYywgZWp0YWdfdmNwdV9sb2MsDQo+ZWp0YWdfc2Nw
dV9sb2MsDQo+PiArICAgICAgICAgICAgICAgICAgICBkbWljX2xvYywgZWp0YWdfc2VjcHVfbG9j
LCB2dGNfZG1pY19sb2MsIHZ0Y190ZG1fbG9jLA0KPnZ0Y19pMnNpX2xvYywNCj4+ICsgICAgICAg
ICAgICAgICAgICAgIHRkbV9haV9sb2MsIGFpX2xvYywgc3BkaWZfbG9jLCBoaWZfZW5fbG9jLCBz
YzBfbG9jLA0KPnNjMV9sb2MsDQo+PiArICAgICAgICAgICAgICAgICAgICBzY2FuX3N3aXRjaCwg
d2RfcnNldCwgYm9vdF9zZWwsIHJlc2V0X24sIHRlc3Rtb2RlDQo+PiArIF0NCj4+ICsNCj4+ICsg
ICAgICAgIGZ1bmN0aW9uOg0KPj4gKyAgICAgICAgICBlbnVtOiBbIGdwaW8sIG5mLCBlbW1jLCB0
cDAsIHRwMSwgc2MwLCBzYzBfZGF0YTAsIHNjMF9kYXRhMSwNCj5zYzBfZGF0YTIsDQo+PiArICAg
ICAgICAgICAgICAgICAgc2MxLCBzYzFfZGF0YTAsIHNjMV9kYXRhMSwgc2MxX2RhdGEyLCBhbywg
Z3NwaV9sb2MwLA0KPmdzcGlfbG9jMSwNCj4+ICsgICAgICAgICAgICAgICAgICB1YXJ0MCwgdWFy
dDEsIHVhcnQyX2xvYzAsIHVhcnQyX2xvYzEsIGkyYzAsIGkyYzEsIGkyYzMsIGkyYzQsDQo+PiAr
ICAgICAgICAgICAgICAgICAgaTJjNSwgcGNpZTEsIHNkaW8sIGV0bl9sZWQsIGV0bl9waHksIHNw
aSwgcHdtMF9sb2MwLA0KPnB3bTBfbG9jMSwNCj4+ICsgICAgICAgICAgICAgICAgICBwd20xX2xv
YzAsIHB3bTFfbG9jMSwgcHdtMl9sb2MwLCBwd20yX2xvYzEsDQo+cHdtM19sb2MwLCBwd20zX2xv
YzEsDQo+PiArICAgICAgICAgICAgICAgICAgcWFtX2FnY19pZjAsIHFhbV9hZ2NfaWYxLCBzcGRp
Zl9vcHRpY2FsX2xvYzAsDQo+c3BkaWZfb3B0aWNhbF9sb2MxLA0KPj4gKyAgICAgICAgICAgICAg
ICAgIHVzYl9jYzEsIHVzYl9jYzIsIHZmZCwgc2QsIGRtaWNfbG9jMCwgZG1pY19sb2MxLCBhaV9s
b2MwLA0KPmFpX2xvYzEsDQo+PiArICAgICAgICAgICAgICAgICAgdGRtX2FpX2xvYzAsIHRkbV9h
aV9sb2MxLCBoaV9sb2MwLCBoaV9tLCB2dGNfaTJzbywNCj52dGNfaTJzaV9sb2MwLA0KPj4gKyAg
ICAgICAgICAgICAgICAgIHZ0Y19pMnNpX2xvYzEsIHZ0Y19kbWljX2xvYzAsIHZ0Y19kbWljX2xv
YzEsDQo+dnRjX3RkbV9sb2MwLA0KPj4gKyAgICAgICAgICAgICAgICAgIHZ0Y190ZG1fbG9jMSwg
ZGNfZmFuLCBwbGxfdGVzdF9sb2MwLCBwbGxfdGVzdF9sb2MxLCBpcl9yeCwNCj4+ICsgICAgICAg
ICAgICAgICAgICB1YXJ0Ml9kaXNhYmxlLCBnc3BpX2Rpc2FibGUsIGhpX3dpZHRoX2Rpc2FibGUs
DQo+aGlfd2lkdGhfMWJpdCwNCj4+ICsgICAgICAgICAgICAgICAgICBzZl9kaXNhYmxlLCBzZl9l
bmFibGUsIHNjcHVfZWp0YWdfbG9jMCwgc2NwdV9lanRhZ19sb2MxLA0KPj4gKyAgICAgICAgICAg
ICAgICAgIHNjcHVfZWp0YWdfbG9jMiwgYWNwdV9lanRhZ19sb2MwLCBhY3B1X2VqdGFnX2xvYzEs
DQo+YWNwdV9lanRhZ19sb2MyLA0KPj4gKyAgICAgICAgICAgICAgICAgIHZjcHVfZWp0YWdfbG9j
MCwgdmNwdV9lanRhZ19sb2MxLCB2Y3B1X2VqdGFnX2xvYzIsDQo+c2VjcHVfZWp0YWdfbG9jMCwN
Cj4+ICsgICAgICAgICAgICAgICAgICBzZWNwdV9lanRhZ19sb2MxLCBzZWNwdV9lanRhZ19sb2My
LCBhdWNwdV9lanRhZ19sb2MwLA0KPmF1Y3B1X2VqdGFnX2xvYzEsDQo+PiArICAgICAgICAgICAg
ICAgICAgYXVjcHVfZWp0YWdfbG9jMiwgaXNvX3RyaXN0YXRlLCBkYmdfb3V0MCwgZGJnX291dDEs
DQo+c3RhbmRieV9kYmcsDQo+PiArICAgICAgICAgICAgICAgICAgc3BkaWYsIGFybV90cmFjZV9k
ZWJ1Z19kaXNhYmxlLA0KPmFybV90cmFjZV9kZWJ1Z19lbmFibGUsDQo+PiArICAgICAgICAgICAg
ICAgICAgYXVjcHVfZWp0YWdfZGlzYWJsZSwgYWNwdV9lanRhZ19kaXNhYmxlLA0KPnZjcHVfZWp0
YWdfZGlzYWJsZSwNCj4+ICsgICAgICAgICAgICAgICAgICBzY3B1X2VqdGFnX2Rpc2FibGUsIHNl
Y3B1X2VqdGFnX2Rpc2FibGUsDQo+dnRjX2RtaWNfbG9jX2Rpc2FibGUsDQo+PiArICAgICAgICAg
ICAgICAgICAgdnRjX3RkbV9kaXNhYmxlLCB2dGNfaTJzaV9kaXNhYmxlLCB0ZG1fYWlfZGlzYWJs
ZSwNCj5haV9kaXNhYmxlLA0KPj4gKyAgICAgICAgICAgICAgICAgIHNwZGlmX2Rpc2FibGUsIGhp
Zl9kaXNhYmxlLCBoaWZfZW5hYmxlLCB0ZXN0X2xvb3AsDQo+PiArIHBtaWNfcHdydXAgXQ0KPj4g
Kw0KPj4gKyAgICAgICAgZHJpdmUtc3RyZW5ndGg6DQo+PiArICAgICAgICAgIGVudW06IFs0LCA4
XQ0KPj4gKw0KPj4gKyAgICAgICAgYmlhcy1wdWxsLWRvd246IHRydWUNCj4+ICsNCj4+ICsgICAg
ICAgIGJpYXMtcHVsbC11cDogdHJ1ZQ0KPj4gKw0KPj4gKyAgICAgICAgYmlhcy1kaXNhYmxlOiB0
cnVlDQo+PiArDQo+PiArICAgICAgICBpbnB1dC1zY2htaXR0LWVuYWJsZTogdHJ1ZQ0KPj4gKw0K
Pj4gKyAgICAgICAgaW5wdXQtc2NobWl0dC1kaXNhYmxlOiB0cnVlDQo+PiArDQo+PiArICAgICAg
ICBkcml2ZS1wdXNoLXB1bGw6IHRydWUNCj4+ICsNCj4+ICsgICAgICAgIHBvd2VyLXNvdXJjZToN
Cj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwNCj4+ICsgICAgICAgICAgICBWYWxpZCBhcmd1
bWVudHMgYXJlIGRlc2NyaWJlZCBhcyBiZWxvdzoNCj4+ICsgICAgICAgICAgICAwOiBwb3dlciBz
dXBwbHkgb2YgMS44Vg0KPj4gKyAgICAgICAgICAgIDE6IHBvd2VyIHN1cHBseSBvZiAzLjNWDQo+
PiArICAgICAgICAgIGVudW06IFswLCAxXQ0KPj4gKw0KPj4gKyAgICAgICAgcmVhbHRlayxkcml2
ZS1zdHJlbmd0aC1wOg0KPj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfA0KPj4gKyAgICAgICAg
ICAgIFNvbWUgb2YgcGlucyBjYW4gYmUgZHJpdmVuIHVzaW5nIHRoZSBQLU1PUyBhbmQgTi1NT1MN
Cj50cmFuc2lzdG9yIHRvDQo+PiArICAgICAgICAgICAgYWNoaWV2ZSBmaW5lciBhZGp1c3RtZW50
cy4gVGhlIGJsb2NrLWRpYWdyYW0gcmVwcmVzZW50YXRpb24gaXMNCj5hcw0KPj4gKyAgICAgICAg
ICAgIGZvbGxvd3M6DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgVkREDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICB8
fC0tKw0KPj4gKyAgICAgICAgICAgICAgICAgKy0tLS0tb3x8ICAgICBQLU1PUy1GRVQNCj4+ICsg
ICAgICAgICAgICAgICAgIHwgICAgICB8fC0tKw0KPj4gKyAgICAgICAgICAgIElOIC0tKyAgICAg
ICAgICArLS0tLS0gb3V0DQo+PiArICAgICAgICAgICAgICAgICB8ICAgICAgfHwtLSsNCj4+ICsg
ICAgICAgICAgICAgICAgICstLS0tLS18fCAgICAgTi1NT1MtRkVUDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgfHwtLSsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIEdORA0KPj4gKyAgICAgICAgICAgIFRoZSBkcml2
aW5nIHN0cmVuZ3RoIG9mIHRoZSBQLU1PUy9OLU1PUyB0cmFuc2lzdG9ycyBpbXBhY3RzIHRoZQ0K
Pj4gKyAgICAgICAgICAgIHdhdmVmb3JtJ3MgcmlzZS9mYWxsIHRpbWVzLiBHcmVhdGVyIGRyaXZp
bmcgc3RyZW5ndGggcmVzdWx0cyBpbg0KPj4gKyAgICAgICAgICAgIHNob3J0ZXIgcmlzZS9mYWxs
IHRpbWVzLiBFYWNoIFAtTU9TIGFuZCBOLU1PUyB0cmFuc2lzdG9yIG9mZmVycw0KPj4gKyAgICAg
ICAgICAgIDggY29uZmlndXJhYmxlIGxldmVscyAoMCB0byA3KSwgd2l0aCBoaWdoZXIgdmFsdWVz
IGluZGljYXRpbmcNCj4+ICsgICAgICAgICAgICBncmVhdGVyIGRyaXZpbmcgc3RyZW5ndGgsIGNv
bnRyaWJ1dGluZyB0byBhY2hpZXZpbmcgdGhlIGRlc2lyZWQNCj4+ICsgICAgICAgICAgICBzcGVl
ZC4NCj4+ICsNCj4+ICsgICAgICAgICAgICBUaGUgcmVhbHRlayxkcml2ZS1zdHJlbmd0aC1wIGlz
IHVzZWQgdG8gY29udHJvbCB0aGUgZHJpdmluZw0KPnN0cmVuZ3RoDQo+PiArICAgICAgICAgICAg
b2YgdGhlIFAtTU9TIG91dHB1dC4NCj4+ICsgICAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+PiArICAgICAgICAgIG1pbmltdW06IDANCj4+ICsg
ICAgICAgICAgbWF4aW11bTogNw0KPj4gKw0KPj4gKyAgICAgICAgcmVhbHRlayxkcml2ZS1zdHJl
bmd0aC1uOg0KPj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfA0KPj4gKyAgICAgICAgICAgIFNp
bWlsYXIgdG8gdGhlIHJlYWx0ZWssZHJpdmUtc3RyZW5ndGgtcCwgdGhlDQo+cmVhbHRlayxkcml2
ZS1zdHJlbmd0aC1uDQo+PiArICAgICAgICAgICAgaXMgdXNlZCB0byBjb250cm9sIHRoZSBkcml2
aW5nIHN0cmVuZ3RoIG9mIHRoZSBOLU1PUyBvdXRwdXQuDQo+PiArICAgICAgICAgICRyZWY6IC9z
Y2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPj4gKyAgICAgICAgICBtaW5p
bXVtOiAwDQo+PiArICAgICAgICAgIG1heGltdW06IDcNCj4+ICsNCj4+ICsgICAgICAgIHJlYWx0
ZWssZHV0eS1jeWNsZToNCj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwNCj4+ICsgICAgICAg
ICAgICBBbiBpbnRlZ2VyIGRlc2NyaWJpbmcgdGhlIGxldmVsIHRvIGFkanVzdCBvdXRwdXQgZHV0
eSBjeWNsZSwNCj5jb250cm9sbGluZw0KPj4gKyAgICAgICAgICAgIHRoZSBwcm9wb3J0aW9uIG9m
IHBvc2l0aXZlIGFuZCBuZWdhdGl2ZSB3YXZlZm9ybXMgaW4NCj5uYW5vc2Vjb25kcy4NCj4+ICsg
ICAgICAgICAgICBWYWxpZCBhcmd1bWVudHMgYXJlIGRlc2NyaWJlZCBhcyBiZWxvdzoNCj4+ICsg
ICAgICAgICAgICAwOiAwbnMNCj4+ICsgICAgICAgICAgICAyOiArIDAuMjVucw0KPj4gKyAgICAg
ICAgICAgIDM6ICsgMC41bnMNCj4+ICsgICAgICAgICAgICA0OiAtMC4yNW5zDQo+PiArICAgICAg
ICAgICAgNTogLTAuNW5zDQo+PiArICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMg0KPj4gKyAgICAgICAgICBlbnVtOiBbIDAsIDIsIDMsIDQsIDUg
XQ0KPj4gKw0KPj4gKyAgICAgIHJlcXVpcmVkOg0KPj4gKyAgICAgICAgLSBwaW5zDQo+PiArDQo+
PiArICAgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+PiArDQo+PiArcmVxdWlyZWQ6
DQo+PiArICAtIGNvbXBhdGlibGUNCj4+ICsgIC0gcmVnDQo+PiArDQo+PiArYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlDQo+PiArDQo+PiArZXhhbXBsZXM6DQo+PiArICAtIHwNCj4+ICsgICAg
IHBpbmN0cmxANGUwMDAgew0KPj4gKyAgICAgICAgIGNvbXBhdGlibGUgPSAicmVhbHRlayxydGQx
MzE5ZC1waW5jdHJsIjsNCj4+ICsgICAgICAgICByZWcgPSA8MHg0ZTAwMCAweDEzMD47DQo+PiAr
DQo+PiArICAgICAgICAgZW1tYy1oczIwMC1waW5zIHsNCj4+ICsgICAgICAgICAgICAgcGlucyA9
ICJlbW1jX2NsayIsDQo+PiArICAgICAgICAgICAgICAgICAgICAiZW1tY19jbWQiLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgImVtbWNfZGF0YV8wIiwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICJlbW1jX2RhdGFfMSIsDQo+PiArICAgICAgICAgICAgICAgICAgICAiZW1tY19kYXRhXzIiLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgImVtbWNfZGF0YV8zIiwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICJlbW1jX2RhdGFfNCIsDQo+PiArICAgICAgICAgICAgICAgICAgICAiZW1tY19kYXRh
XzUiLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgImVtbWNfZGF0YV82IiwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICJlbW1jX2RhdGFfNyI7DQo+PiArICAgICAgICAgICAgIGZ1bmN0aW9uID0g
ImVtbWMiOw0KPj4gKyAgICAgICAgICAgICByZWFsdGVrLGRyaXZlLXN0cmVuZ3RoLXAgPSA8MHgy
PjsNCj4+ICsgICAgICAgICAgICAgcmVhbHRlayxkcml2ZS1zdHJlbmd0aC1uID0gPDB4Mj47DQo+
PiArICAgICAgICAgfTsNCj4+ICsNCj4+ICsgICAgICAgICBpMmMtMC1waW5zIHsNCj4+ICsgICAg
ICAgICAgICAgcGlucyA9ICJncGlvXzEyIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICJncGlv
XzEzIjsNCj4+ICsgICAgICAgICAgICAgZnVuY3Rpb24gPSAiaTJjMCI7DQo+PiArICAgICAgICAg
ICAgIGRyaXZlLXN0cmVuZ3RoID0gPDQ+Ow0KPj4gKyAgICAgICAgIH07DQo+PiArICAgICB9Ow0K
Pj4gLS0NCj4+IDIuNDEuMA0KPj4NCg0KVGhhbmtzLA0KVHp1eWkgQ2hhbmcNCg0K
