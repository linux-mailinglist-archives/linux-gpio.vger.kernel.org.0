Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEE21133CB3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 09:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbgAHILy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 03:11:54 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:42848 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgAHILy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 03:11:54 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-90-5e158ec7cb52
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 57.51.08102.7CE851E5; Wed,  8 Jan 2020 09:11:51 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 8 Jan 2020 09:11:46 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v8 09/12] rtc: bd70528: add BD71828 support
Thread-Topic: [PATCH v8 09/12] rtc: bd70528: add BD71828 support
Thread-Index: AQHVvvUfLiH9Hhbf7Ey/lHSErlTbtKffJXWAgAFCZAA=
Date:   Wed, 8 Jan 2020 08:11:45 +0000
Message-ID: <539ae83e249d50a57f86df1b6855f420767de312.camel@fi.rohmeurope.com>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
         <b904fd485b61d3f3af3c100855f5100940916abf.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
         <20200107125751.GJ14821@dell>
In-Reply-To: <20200107125751.GJ14821@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <01721F7B6EFA90448CF1131A2008E980@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xTVxz33Ht776Fy3aG0csRHsLotFqXWmOXEJ8lmco3b1OyDcYmwi1wp
        Ci3eFqPuCzEjKAqBiFFrC1rLQ+lUqo2bAzXIQ2siooBPUBxMwQdZ8DHn816KwqfzO//f63z4
        H0jr7rGxMN3mlGSbmGFktcz5qjc1s5oLDUmz/UEN8bW2cyTvWQVHnntCDNnT3cOSsoYrGrLz
        8ikNuRM8wZB7LxoBedm2nSIlbysp8u+uLg05WfYWkOtn3CwJPjkGSFN1G0vKb7RSxF1+kSGt
        oSWkM9TIkty6Bo6876hhEg2Cv9QPhIGbuZxQ6v9V+NPVyQmBoztY4W5HLSs03zxNCXtLX1NC
        VfUrThgMTFmh/XnsghTRuemn9DSbedEvY62DHX2aLO/UzU//OwJywKm4fAAhRnPx1TouH2ih
        DrUD/PvgIB2+NANc3PIYqCIWLcD5txRRBNQjC/Zd7GVUDY18EO8OdQGViEaL8Z5QmSYsSsQH
        PC3DeB7Oq72rUXMYNB33BOLVMY9+xP6zZ4esOtQAcGF+nIojkAlXbbtNqRigyXhHzrMhTKMY
        HPjn1VAkRgj7alvoMDbgvr/fD8+NuO51N6NW0WgGPn7GHLYm4opbL4ZjpuKSnd1c+AlR+NL+
        HqYIjHeNanCNuF2j3K5Rbtco90GgOQpwppiekSY6JUuCLGUnyHZrpnKstWcGQHhhnv8BPtQv
        rQcUBPVgAqSMBv76BX2SblyKPXWLVXRYk+XsDMlRDzCkjXreNFPh+FRxy1ZJtn+iJkLGGMN/
        3V28RofUrg2SlCXJn9hJEBoxHywwJOmiZClN2rwuPcM5QlMwQg3Xxuodki1VksVspzVZ3Y5k
        h7IeKhWp9BYoW63jHVlipjINW0MgHhb1ebw0bPCUe2kdY7PbpNgY3qJKkSq1Zts+F/WDGAiM
        0fy1XQobqfyazzn9SgWlVGgfRakVTnGEis0BBctvuOej3r256Mmd5d+mTTM0Vn9xpNQ833v/
        9NaB345N+GZFxYev6n4oq5xeeGj8wY0lfxU9mCMfiNQ3vWlb5TCbi7/kWNcJvy+p62Vt9EpD
        wcP/EypN991r3Oc6e9fHrzaleAs9iNQctlxYeGV2kzkv92H7vmDo8Hdj+ot3f79s4N0UI+Ow
        ihYTLTvEj2RUpOHyAwAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLA0KDQpUaGFua3MgZm9yIHRha2luZyBhIGxvb2sgYXQgdGhpcy4NCg0KT24gVHVl
LCAyMDIwLTAxLTA3IGF0IDEyOjU3ICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6DQo+IE9uIE1vbiwg
MzAgRGVjIDIwMTksIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gDQo+ID4gUk9ITSBCRDcxODI4
IFBNSUMgUlRDIGJsb2NrIGlzIGZyb20gbWFueSBwYXJ0cyBzaW1pbGFyIHRvIG9uZQ0KPiA+IG9u
IEJENzA1MjguIFN1cHBvcnQgQkQ3MTgyOCBSVEMgdXNpbmcgQkQ3MDUyOCBSVEMgZHJpdmVyIGFu
ZA0KPiA+IGF2b2lkIHJlLWludmVudGluZyB0aGUgd2hlZWwuDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+
DQo+ID4gQWNrZWQtYnk6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290
bGluLmNvbT4NCj4gPiAtLS0NCj4gPiArDQo+ID4gIHN0cnVjdCBiZDcwNTI4X3J0Y19hbG0gew0K
PiA+ICAJc3RydWN0IGJkNzA1MjhfcnRjX2RhdGEgZGF0YTsNCj4gPiAgCXU4IGFsbV9tYXNrOw0K
PiA+IEBAIC00NSw2ICs1Myw4IEBAIHN0cnVjdCBiZDcwNTI4X3J0Y19hbG0gew0KPiA+ICBzdHJ1
Y3QgYmQ3MDUyOF9ydGMgew0KPiA+ICAJc3RydWN0IHJvaG1fcmVnbWFwX2RldiAqbWZkOw0KPiAN
Cj4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgeW91IGZpeGVkIHRoaXMgdXAgYmUgbW9y
ZSBmb3J0aGNvbWluZy4NCj4gSXQgdG9vayBzb21lIGdyZXBwaW5nIHRvIGZpbmQgb3V0IHdoYXQg
dGhpcyBhY3R1YWxseSBtZWFudC4gIEFuIE1GRA0KPiBpc24ndCByZWFsbHkgYSB0aGluZywgd2Ug
bWFkZSBpdCB1cC4gIEhlcmUgeW91IGFyZSByZWZlcnJpbmcgdG8gdGhpcw0KPiBwbGF0Zm9ybSBk
ZXZpY2UncyBwYXJlbnQncyBkZXZpY2UgZGF0YS4NCg0KSSBsaWtlIE1GRC4gTXVsdGkgRnVuY3Rp
b24gRGV2aWNlIGlzIGEgcmVhbCB0aGluZy4gRGV2aWNlIHdpdGggbXVsdGlwbGUNCmZ1bmN0aW9u
YWxpdGllcyBtZWxkIGluLiBJdCBkZXNjcmliZXMgbWFueSBQTUlDcyBvciBGUEdBIGRlc2lnbnMN
CnRlcnJpYmx5IHdlbGwuIEJ1dCB0aGUgbmFtaW5nIGlzIG5vdCBzb21ldGhpbmcgSSBsaWtlIGZp
Z2h0aW5nIGZvciAtIGlmDQpNRkQgaXMgbm90IG5pY2UgdG8geW91ciBleWVzIHdlIGNhbiBjaGFu
Z2UgaXQuIEJ1dCBsZXQncyBkbyBpdCBpbg0Kc2VwYXJhdGUgcGF0Y2ggc2V0IE9rPyBDaGFuZ2lu
ZyB0aGUgInJvaG1fcmVnbWFwX2RldiIgd2lsbCBpbnZvbHZlDQpjaGFuZ2luZyBidW5jaCBvZiBl
eGlzdGluZyBkcml2ZXJzIGFuZCBpcyBub3QgYnkgYW55IG1lYW5zIHJlbGF0ZWQgd2l0aA0KYWRk
aW5nIHRoZSBzdXBwb3J0IGZvciBCRDcxODI4Lg0KDQo+IA0KPiBXaXRoIHRoYXQgaW4gbWluZCBJ
IG9mZmVyIHNvbWUgc3VnZ2VzdGlvbnM6DQo+IA0KPiAgICdzdHJ1Y3Qgcm9obV9wYXJlbnRfZGRh
dGEgcGRkYXRhJw0KPiAgICdzdHJ1Y3Qgcm9obV9wYXJlbnRfZGRhdGEgcGFyZW50Jw0KDQpCb3Ro
IGFyZSBmaW5lIHdpdGggbWUgYnV0IHRoaXMgY2hhbmdlIGlzIHJlZmxlY3RlZCB0byBkcml2ZXJz
IG5vdA0KcmVsYXRlZCB0byBCRDcxODI4IGxpa2U6DQpiZDcwNTI4LXJlZ3VsYXRvci5jDQpncGlv
LWJkNzA1MjguYw0Kd2F0Y2hkb2cvYmQ3MDUyOF93ZHQuYw0KDQpJJ2QgcmF0aGVyIG5vdCBjaGFu
Z2UgV0RUIHdpdGggdGhpcyBzZXJpZXMuIFNvIEknZCBwcmVmZXIgaW5jcmVtZW50YWwNCnBhdGNo
IGZvciB0aGlzIGluIHRoZSByZWxlYXNlIGZvbGxvd2luZyB0aGlzIHNlcmllcy4NCiANCj4gPiAg
LyogV0RUIG1hc2tzICovDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL3JvaG0t
YmQ3MTgyOC5oDQo+ID4gYi9pbmNsdWRlL2xpbnV4L21mZC9yb2htLWJkNzE4MjguaA0KPiA+IGlu
ZGV4IGQwMTNlMDNmNzQyZC4uMDE3YTRjMDFjYjMxIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUv
bGludXgvbWZkL3JvaG0tYmQ3MTgyOC5oDQo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tZmQvcm9o
bS1iZDcxODI4LmgNCj4gPiBAQCAtNSw2ICs1LDcgQEANCj4gPiAgI2RlZmluZSBfX0xJTlVYX01G
RF9CRDcxODI4X0hfXw0KPiA+ICANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L21mZC9yb2htLWdlbmVy
aWMuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21mZC9yb2htLXNoYXJlZC5oPg0KPiANCj4gSXNu
J3QgZ2VuZXJpYyBzaGFyZWQ/DQoNCkdvb2QgcG9pbnQuIFRoZSByb2htLXNoYXJlZCBjb250YWlu
cyBzdHVmZiBjb21tb24gZm9yIG9ubHkgZmV3IG9mIHRoZQ0KUE1JQ3MgKGN1cnJlbnRseSBCRDcw
NTI4IGFuZCBCRDcxODI4KSB3aGVyZSBhcyByb2htLWdlbmVyaWMgaXMgaW50ZW5kZWQNCnRvIGJl
IHVzZWQgZm9yIHN0dWZmIHRoYXQgaXMgZ2VuZXJpYyB0byBtb3JlIG9yIGxlc3MgYWxsIG9mIHRo
ZSBQTUlDcy4NCk9yIHRoYXQgd2FzIG15IGluaXRpYWwgaWRlYS4gQnV0IGFzIEkndmUgYmVlbiB0
b2xkIC0gbmFtaW5nLWlzLWhhcmQgOikNClN1Z2dlc3Rpb25zPw0KDQo+IA0KPiA+IGIvaW5jbHVk
ZS9saW51eC9tZmQvcm9obS1zaGFyZWQuaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi5mMTZmYzNiNTAwMGUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrIGIvaW5jbHVkZS9saW51eC9tZmQvcm9obS1zaGFyZWQuaA0KPiA+IEBAIC0wLDAgKzEsMjcg
QEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgKi8N
Cj4gPiArLyogQ29weXJpZ2h0IChDKSAyMDE4IFJPSE0gU2VtaWNvbmR1Y3RvcnMgKi8NCj4gDQo+
IFRoaXMgaXMgdmVyeSBvdXQgb2YgZGF0YSBub3chDQoNCk9rLg0KDQo+ID4gKy8qDQo+ID4gKyAq
IFJUQyBkZWZpbml0aW9ucyBzaGFyZWQgYmV0d2Vlbg0KPiA+ICsgKg0KPiA+ICsgKiBCRDcwNTI4
DQo+ID4gKyAqIGFuZCBCRDcxODI4DQo+IA0KPiBUaGlzIHJlYWRzIHBvb3JseS4NCj4gDQo+IEVp
dGhlciBmb3JtIGEgYnVsbGV0IHBvaW50ZWQgbGlzdCwgb3IganVzdCB3cml0ZSBpdCBvdXQuDQoN
Ck9rDQoNCg0KQmVzdCBSZWdhcmRzDQoJTWF0dGkNCg0K
