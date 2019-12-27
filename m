Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43A2312B438
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2019 12:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfL0L3o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Dec 2019 06:29:44 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:55800 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfL0L3n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Dec 2019 06:29:43 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-c0-5e05eb24ad1a
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id E1.E8.08102.42BE50E5; Fri, 27 Dec 2019 12:29:40 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Fri, 27 Dec 2019 12:29:35 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "pavel@ucw.cz" <pavel@ucw.cz>
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
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v7 11/12] leds: Add common LED binding parsing support
 to LED class/core
Thread-Topic: [PATCH v7 11/12] leds: Add common LED binding parsing support
 to LED class/core
Thread-Index: AQHVtlJMyatI9ieot0i0jk0Qmtw3YKfE7uMAgAjliYA=
Date:   Fri, 27 Dec 2019 11:29:34 +0000
Message-ID: <bab4fd0447c16c4c30a07ead192efdba3e2f1e85.camel@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <c7abf8d15ea54fee504fbec5666d013c26d3b62a.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <20191221193758.GJ32732@amd>
In-Reply-To: <20191221193758.GJ32732@amd>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7191390565294940BE4674ED4008C769@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0wTZxjH895dr2/RI2cF+8p00ZtOnfHXwvTVGKyJmOMfXKZ/mM1RTznb
        RmjZtRCd/zAzN4HG4ESXdtAataPhh9oiVhQTU2EgJBoUEH8wZHZk4CJxKkpGdPf2pvDPe988
        3+fzfJ8/noO0cYRNg3aHW1YcUp7AJjHXQv+Gly18ostZ2bYan+nq0eMfn/6qxy+qOhh8fDDO
        4kDLTR0u67ygww8azzN44GUrwGPdhylcMVFN4Wee33W4ITAB8J3LlSxu/PsswL/VdrM4eLeL
        wpXBdgZ3dWTi/o5WFh+62qLHb3rDjDlVrPPXAXG075Be9NcdEJt8/XoxUlPCig97m1mxrS9K
        iT/7xykxVPtKLz6PfPh50pfT1u+S3EVb7VbHioyd02ydzbsLPOZ949d+YYvBpYxSYICIT0d/
        PooxpSAJGvkegMJvn+uJYeTbAYoc21oKIGT59aj0XqKcws9HDZ4SlvTT/EWImoZ6KNIzk89B
        0eoFWo8Fnf0rQGl6Haof7qaJZviF6Hv/KR3RHJ+NwlHSQ3KvA+T3xBOAgV+Crjc9TIQBfi4q
        KX6aqNO8CUWGXum0pXl0pvkWrelUNPz4zf91AV0dH2TIPrQ659zlFRpqRv90lrGano8qygb1
        2g4z0A1vnCkHs3xTEnyTtG8K7ZtC+6bQJ4GuBqB8yZ5nldzyquWKXLhccdry1c9uZ34EaPfy
        4hJ4G8uKAQqCGJgNKSGVux3U5RiTdzlz99skl82iFObJrhhAkBZSOIdV9bhcaf+3suJ8Z30A
        GcHELRo8+rWRJ1l7ZblAVt65cyAUEBccUcEZimyV9+2x57knbQoayPCktBSX7MiVFanQbbOQ
        67C41PMg1nQ1FxKccxVI+WpVQzvAGlg+XHWKhg1VQfVtSbzlx0ZP00bG4XTIaSbOTjCeYLZC
        x/vQEWCCQJjJzSHudPUHej9zRI2j1LhnRorEuaVJK60Y+DfO/jRL/iMaflLDZm5+MLByx+IT
        FyaSvzBsad5gZjKHxirmjd333v9oz+11R3sDH/f+FPLWW08md9/I8H62aeMOtDq9EWffPBg9
        uPZW1pW5yw5HvjFt2yy08aH4eJGlrnxtdiDk3b709Q+eI32pwlfpL887x7zxrL5WQ9Hr9kff
        mR8LjMsmrfqEVlzSf7eMbCP9AwAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBTYXQsIDIwMTktMTItMjEgYXQgMjA6MzcgKzAxMDAsIFBhdmVsIE1hY2hlayB3cm90ZToN
Cj4gSGkhDQo+IA0KPiA+IFF1Y2lrIGdyZXAgZm9yICdmb3JfZWFjaCcgb3IgJ2xpbnV4LGRlZmF1
bHQtdHJpZ2dlcicgb3INCj4gDQo+IHF1aWNrLg0KPiANCj4gPiBJZiBpbml0X2RhdGEgaXMgZ292
ZW4gYnV0IG5vIHN0YXJ0aW5nIHBvaW50IGZvciBub2RlIGxvb2t1cCAtIHRoZW4NCj4gDQo+IGlz
IGdpdmVuLg0KPiANCj4gPiAocGFyZW50KSBkZXZpY2UncyBvd24gRFQgbm9kZSBpcyB1c2VkLiBJ
ZiBubyBsZWQtY29tcGF0aWJsZSBpcw0KPiA+IGdpdmVuLA0KPiA+IHRoZW4gb2ZfbWF0Y2ggaXMg
c2VhcmNoZWQgZm9yLiBJZiBuZWl0aGVyIGxlZC1jb21wYXRpYmxlIG5vdA0KPiA+IG9mX21hdGNo
DQo+IA0KPiBub3Igb2ZfbWF0Y2guDQo+IA0KPiA+IGlzIGdpdmVuIHRoZW4gZGV2aWNlJ3Mgb3du
IG5vZGUgb3IgcGFzc2VkIHN0YXJ0aW5nIHBvaW50IGFyZSB1c2VkDQo+ID4gYXMNCj4gPiBzdWNo
Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRp
bmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiA+IC0tLQ0KPiA+IA0KPiA+IE5vIGNoYW5nZXMgc2lu
Y2UgdjYNCj4gPiANCj4gPiAgZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jIHwgIDk5ICsrKysrKysr
KysrKystLQ0KPiA+ICBkcml2ZXJzL2xlZHMvbGVkLWNvcmUuYyAgfCAyNTggKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0NCj4gPiAtLS0tDQo+ID4gIGluY2x1ZGUvbGludXgvbGVk
cy5oICAgICB8ICA5NCArKysrKysrKysrKystLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDM4NSBp
bnNlcnRpb25zKCspLCA2NiBkZWxldGlvbnMoLSkNCj4gDQo+IFF1aXRlIGEgbG90IG9mIGNvZGUg
YWRkZWQgaGVyZS4gQ2FuIEkgdHJ1c3QgeW91IHRoYXQgd2Ugd2UnbGwgZGVsZXRlDQo+IDMyMCBs
aW5lcyBieSBjb252ZXJ0aW5nIGRyaXZlciBvciB0d28/DQo+IA0KPiA+ICtzdGF0aWMgdm9pZCBs
ZWRfYWRkX3Byb3BzKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxkLCBzdHJ1Y3QNCj4gPiBsZWRfcHJv
cGVydGllcyAqcHJvcHMpDQo+ID4gK3sNCj4gPiArCWlmIChwcm9wcy0+ZGVmYXVsdF90cmlnZ2Vy
KQ0KPiA+ICsJCWxkLT5kZWZhdWx0X3RyaWdnZXIgPSBwcm9wcy0+ZGVmYXVsdF90cmlnZ2VyOw0K
PiA+ICsJLyoNCj4gPiArCSAqIEFjY29yZGluZyB0byBiaW5kaW5nIGRvY3MgdGhlIExFRCBpcyBi
eS1kZWZhdWx0IHR1cm5lZCBPRkYNCj4gPiB1bmxlc3MNCj4gPiArCSAqIGRlZmF1bHRfc3RhdGUg
aXMgdXNlZCB0byBpbmRpY2F0ZSBpdCBzaG91bGQgYmUgT04gb3IgdGhhdA0KPiA+IHN0YXRlDQo+
ID4gKwkgKiBzaG91bGQgYmUga2VwdCBhcyBpcw0KPiA+ICsJICovDQo+ID4gKwlpZiAocHJvcHMt
PmRlZmF1bHRfc3RhdGUpIHsNCj4gPiArCQlsZC0+YnJpZ2h0bmVzcyA9IExFRF9PRkY7DQo+ID4g
KwkJaWYgKCFzdHJjbXAocHJvcHMtPmRlZmF1bHRfc3RhdGUsICJvbiIpKQ0KPiA+ICsJCQlsZC0+
YnJpZ2h0bmVzcyA9IExFRF9GVUxMOw0KPiANCj4gTWF4IGJyaWdodG5lc3MgaXMgbm90IGFsd2F5
cyA9PSBMRURfRlVMTCB0aGVzZSBkYXlzLg0KDQpIbW0uIFRoYXQgc291bmRzIGxpa2UgaGF2aW5n
IExFRF9GVUxMIGlzIHByZXR0eSBwb2ludGxlc3MgdGhlbiwgcmlnaHQ/DQpJIG1lYW4sIGlmIExF
RF9GVUxMIG1heSBub3QgYmUgTEVEX0ZVTEwsIHdoeSB3ZSBoYXZlIExFRF9GVUxMIHRoZW4/DQpB
bnl3YXlzLCBJIGRvbid0IGtub3cgd2hhdCB3b3VsZCBiZSBiZXR0ZXIgdmFsdWUgZm9yIHRoZSBk
ZWZhdWx0IHN0YXRlDQoib24iPyBJIGFtIHdpbGxpbmcgdG8gcmV3b3JrIHRoZSBwYXRjaCBoZXJl
IGJ1dCBJIG5lZWQgc29tZSBndWlkYW5jZS4NCk90aGVyIG9wdGlvbiBpcyB0byB1c2UgdGhlIExF
RF9GVUxMIGhlcmUgYW5kIGxlYXZlIGRyaXZlcnMgdXNpbmcNCnNvbWV0aGluZyBlbHNlIHRvIHVz
ZSBvd24gcHJvcGVydHkgcGFyc2luZyAtIG9yIGNvbnZlcnQgdGhlbSB0byB1c2UNCkxFRF9GVUxM
IHRvby4gKFNvcnJ5LCBJIGRvbid0IGtub3cgdGhlc2UgZHJpdmVycyBvciB3aHkgdGhleSBkb24n
dCB1c2UNCkxFRF9GVUxMIHNvIEkgY2FuJ3Qgc2F5IGlmIHRoaXMgbWFrZXMgc2Vuc2Ugb3Igbm90
KS4gQ2FuIHlvdSBnaXZlIG1lIGENCm51ZGdlIGFzIGhvdyB0byBpbXByb3ZlIHRoaXM/DQoNCj4g
DQo+ID4gQEAgLTMyMiw2ICszOTgsMTAgQEAgaW50IGxlZF9jbGFzc2Rldl9yZWdpc3Rlcl9leHQo
c3RydWN0IGRldmljZQ0KPiA+ICpwYXJlbnQsDQo+ID4gIAkJCWxlZF9jZGV2LT5uYW1lKTsNCj4g
PiAgDQo+ID4gIAlyZXR1cm4gMDsNCj4gPiArZXJyX291dDoNCj4gPiArCWlmIChsZWRfY2Rldi0+
Zndub2RlX293bmVkKQ0KPiA+ICsJCWZ3bm9kZV9oYW5kbGVfcHV0KGZ3KTsNCj4gPiArCXJldHVy
biByZXQ7DQo+ID4gIH0NCj4gDQo+IGxlZF9jZGV2LT5md25vZGVfb3duZWQgPSBmYWxzZSBoZXJl
Pw0KDQpIbW0uIFRoYW5rcy4gSSBkaWRuJ3QgdGhpbmsgdGhhdCB0aGUgY2RldiBpcyBub3QgZnJl
ZWQgaGVyZSBhbmQgY291bGQNCmJlIHJlLXVzZWQuIFNvIHllcy4gSSB0aGluayB3ZSBjb3VsZCBz
ZXQgdGhlIGxlZF9jZGV2LT5md25vZGVfb3duZWQgdG8NCmZhbHNlIGhlcmUuIEknbGwgZml4IHRo
aXMuIEdvb2QgY2F0Y2ggOikNCg0KPiANCj4gDQo+ID4gKy8qKg0KPiA+ICsgKiBsZWRfZmluZF9m
d25vZGUgLSBmaW5kIGZ3bm9kZSBmb3IgbGVkDQo+ID4gKyAqIEBwYXJlbnQJTEVEIGNvbnRyb2xs
ZXIgZGV2aWNlDQo+ID4gKyAqIEBpbml0X2RhdGEJbGVkIGluaXQgZGF0YSB3aXRoIG1hdGNoIGlu
Zm9ybWF0aW9uDQo+ID4gKyAqDQo+ID4gKyAqIFNjYW5zIHRoZSBmaXJtd2FyZSBub2RlcyBhbmQg
cmV0dXJucyBub2RlIG1hdGNoaW5nIHRoZSBnaXZlbg0KPiA+IGluaXRfZGF0YS4NCj4gPiArICog
Tk9URTogRnVuY3Rpb24gaW5jcmVhc2VzIHJlZmNvdW50IGZvciBmb3VuZCBub2RlLiBDYWxsZXIg
bXVzdA0KPiA+IGRlY3JlYXNlDQo+ID4gKyAqIHJlZmNvdW50IHVzaW5nIGZ3bm9kZV9oYW5kbGVf
cHV0IHdoZW4gZmluaXNoZWQgd2l0aCBub2RlLg0KPiA+ICsgKi8NCj4gPiArc3RydWN0IGZ3bm9k
ZV9oYW5kbGUgKmxlZF9maW5kX2Z3bm9kZShzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsDQo+ID4gKwkJ
CQkgICAgICBzdHJ1Y3QgbGVkX2luaXRfZGF0YSAqaW5pdF9kYXRhKQ0KPiA+ICt7DQo+ID4gKwlz
dHJ1Y3QgZndub2RlX2hhbmRsZSAqZnc7DQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIFRoaXMg
c2hvdWxkIG5ldmVyIGJlIGNhbGxlZCBXL08gaW5pdCBkYXRhLiBXZSBjb3VsZCBhbHdheXMNCj4g
PiByZXR1cm4NCj4gDQo+IHdpdGhvdXQNCg0KUmlnaHQuDQoNCj4gPiArCSAqIEZvciBub3cgd2Ug
ZG8gb25seSBkbyBub2RlIGxvb2stdXAgZm9yIGRyaXZlcnMgd2hpY2gNCj4gPiBwb3B1bGF0ZQ0K
PiA+ICsJICogdGhlIG5ldyBtYXRjaCBwcm9wZXJ0aWVzLiBXZSBjb3VsZCBhbmQgcGVyaGFwcyBz
aG91bGQgZG8NCj4gPiArCSAqIGZ3ID0gZGV2X2Z3bm9kZShwYXJlbnQpOyBpZiBnaXZlbiBmd25v
ZGUgaXMgTlVMTC4gQnV0IGluDQo+ID4gb3JkZXIgdG8NCj4gPiArCSAqIG5vdCBicmVhayBleGlz
dGluZyBzZXR1cHMgd2Uga2VlcCB0aGUgb2xkIGJlaGF2aW91ciBhbmQganVzdA0KPiA+IGRpcmVj
dGx5DQo+IA0KPiBub3QgdG8gYnJlYWsuDQoNCkluZGVlZCwgdGhhbmtzIQ0KDQo+ID4gKwkvKg0K
PiA+ICsJICogU2ltcGxlIHRoaW5ncyBhcmUgcHJldHR5LiBJIHRoaW5rIHNpbXBsZXN0IGlzIHRv
IHVzZSBEVA0KPiA+IG5vZGUtbmFtZQ0KPiA+ICsJICogZm9yIG1hdGNoaW5nIHRoZSBub2RlIHdp
dGggTEVEIC0gc2FtZSB3YXkgcmVndWxhdG9ycyB1c2UgdGhlDQo+ID4gbm9kZQ0KPiA+ICsJICog
bmFtZSB0byBtYXRjaCB3aXRoIGRlc2MuDQo+ID4gKwkgKg0KPiA+ICsJICogVGhpcyBtYXkgbm90
IHdvcmsgd2l0aCBleGlzdGluZyBMRUQgRFQgZW50cmllcyBpZiB0aGUgbm9kZQ0KPiA+IG5hbWUg
aGFzDQo+ID4gKwkgKiBiZWVuIGZyZWVseSBzZWxlY3RpYmxlLiBJbiBvcmRlciB0byB0aGlzIHRv
IHdvcmsgdGhlIGJpbmRpbmcNCj4gPiBkb2MNCj4gDQo+IHNlbGVjdGFibGU/DQoNCkFoLiBBZ2Fp
biB0aGUgc2FtZSBwcm9ibGVtIEkgaGFkIHdpdGggcmVndWxhdG9yIHZvbHRhZ2UgcmFuZ2VzIHN1
cHBvcnQuDQpFbmdsaXNoIGlzIGhhcmQuIEdvb2dsZSB0b2xkIG1lIHRoYXQgc2VsZWN0aWJsZSBv
ciBzZWxlY3RhYmxlIGFyZSBub3QNCnJlYWxseSBnb29kIHdvcmRzIHRvIHVzZSAtIGhlbmNlIEkg
ZW5kZWQgdXAgdXNpbmcgJ3BpY2thYmxlJyByYW5nZXMuIEkNCnRoaW5rIHRoaXMgY291bGQgYWxz
byBiZSAiaWYgdGhlIG5vZGUgbmFtZSBoYXMgYmVlbiBmcmVlbHkgcGlja2FibGUuDQpJJ2xsIHN3
aXRjaCB0byB0aGF0Lg0KDQo+ID4gKwkvKioNCj4gPiArCSAqIFBsZWFzZSBub3RlLCBsb2dpYyBj
aGFuZ2VkIC0gaWYgaW52YWxpZCBwcm9wZXJ0eSBpcyBmb3VuZCB3ZQ0KPiA+IGJhaWwNCj4gPiAr
CSAqIGVhcmx5IG91dCB3aXRob3V0IHBhcnNpbmcgdGhlIHJlc3Qgb2YgdGhlIHByb3BlcnRpZXMu
DQo+ID4gT3JpZ2luYWxseQ0KPiA+ICsJICogdGhpcyB3YXMgdGhlIGNhc2Ugb25seSBmb3IgJ2xh
YmVsJyBwcm9wZXJ0eS4gSSBkb24ndCBrbm93DQo+ID4gdGhlDQo+ID4gKwkgKiByYXRpb25hbGUg
YmVoaW5kIG9yaWdpbmFsIGxvZ2ljIGFsbG93aW5nIGludmFsaWQgcHJvcGVydGllcw0KPiA+IHRv
IGJlDQo+ID4gKwkgKiBnaXZlbi4gSWYgdGhlcmUgaXMgYSByZWFzb24gdGhlbiB3ZSBzaG91bGQg
cmVjb25zaWRlciB0aGlzLg0KPiA+ICsJICogSW50dWl0aXZlbHkgaXQgZmVlbHMgY29ycmVjdCB0
byBqdXN0IHllbGwgYW5kIHF1aXQgaWYgd2UgaGl0DQo+ID4gdmFsdWUgd2UNCj4gPiArCSAqIGRv
bid0IHVuZGVyc3RhbmQgLSBidXQgaW50dWl0aW9uIG1heSBiZSB3cm9uZyBhdCB0aW1lcyA6KQ0K
PiA+ICsJICovDQo+IA0KPiBJcyB0aGlzIHN1cHBvc2VkIHRvIGJlIGxpbnV4ZG9jPw0KDQpkZWZp
bml0ZWx5IG5vdC4gVGhhbmtzISBJJ2xsIHJlbW92ZSB0aGUgZXh0cmEgKg0KDQo+IA0KPiA+ICsv
KioNCj4gPiArICogbGVkX2ZpbmRfZndub2RlIC0gZmluZCBmd25vZGUgbWF0Y2hpbmcgZ2l2ZW4g
TEVEIGluaXQgZGF0YQ0KPiA+ICsgKiBAcGFyZW50OiBMRUQgY29udHJvbGxlciBkZXZpY2UgdGhp
cyBMRUQgaXMgZHJpdmVuIGJ5DQo+ID4gKyAqIEBpbml0X2RhdGE6IHRoZSBMRUQgY2xhc3MgZGV2
aWNlIGluaXRpYWxpemF0aW9uIGRhdGENCj4gPiArICoNCj4gPiArICogRmluZCB0aGUgZncgbm9k
ZSBtYXRjaGluZyBnaXZlbiBMRUQgaW5pdCBkYXRhLg0KPiA+ICsgKiBOT1RFOiBGdW5jdGlvbiBp
bmNyZWFzZXMgcmVmY291bnQgZm9yIGZvdW5kIG5vZGUuIENhbGxlciBtdXN0DQo+ID4gZGVjcmVh
c2UNCj4gPiArICogcmVmY291bnQgdXNpbmcgZndub2RlX2hhbmRsZV9wdXQgd2hlbiBmaW5pc2hl
ZCB3aXRoIG5vZGUuDQo+ID4gKyAqDQo+ID4gKyAqIFJldHVybnM6IG5vZGUgaGFuZGxlIG9yIE5V
TEwgaWYgbWF0Y2hpbmcgZncgbm9kZSB3YXMgbm90IGZvdW5kDQo+ID4gKyAqLw0KPiA+ICtzdHJ1
Y3QgZndub2RlX2hhbmRsZSAqbGVkX2ZpbmRfZndub2RlKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwN
Cj4gPiArCQkJCSAgICAgIHN0cnVjdCBsZWRfaW5pdF9kYXRhICppbml0X2RhdGEpOw0KPiA+ICsN
Cj4gDQo+IElmIGZ1bmN0aW9uIF9nZXRzXyB0aGUgbm9kZSBhbmQgaW5jcmVtZW50cyBpdHMgdXNh
Z2UgY291bnQsIGlzIGl0DQo+IG5vcm1hbGx5IGNhbGxlZCAiZ2V0Ij8NCg0KT2ssIHRoYW5rcyBm
b3IgdGhlIGd1aWRhbmNlLiBJIGRpZG4ndCBrbm93IHRoYXQuIEknbGwgY2hhbmdlIHRoaXMgdG8N
CmxlZF9nZXRfZndub2RlIDopDQoNClRoYW5rcyBhIGJ1bmNoIQ0KDQpCciwNCglNYXR0aSBWYWl0
dGluZW4NCg0K
