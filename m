Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE40210EB3E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 15:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfLBOC6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 09:02:58 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:44494 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLBOC5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 09:02:57 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-35-5de5198e38f4
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 2A.6C.08102.E8915ED5; Mon,  2 Dec 2019 15:02:54 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 2 Dec 2019 15:02:42 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Topic: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Index: AQHVndzxthsd4Y8wKkm7W/92Uslk+KeRDPcAgAAbkICAAZUNgIAACqYAgAAMmACADvFigIAASP2AgARwk4CAAFfQAIAADk+A
Date:   Mon, 2 Dec 2019 14:02:41 +0000
Message-ID: <72a1f4c5768b8c08c2669ea01e60d1b614095a43.camel@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <20191118162502.GJ9761@sirena.org.uk>
         <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
         <20191119181325.GD3634@sirena.org.uk>
         <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
         <20191119193636.GH3634@sirena.org.uk>
         <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
         <20191129120925.GA5747@sirena.org.uk>
         <297fa021fb243072dbbb7bca455e57c13e8c6843.camel@fi.rohmeurope.com>
         <20191202131140.GD1998@sirena.org.uk>
In-Reply-To: <20191202131140.GD1998@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F85BB52ACDEEB44DB8C4B10B5AE452F7@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0wURxzHM7uzDx7XrifCcLZGL42N+KRp7ISgMZXGtcamhhitCcFFVo54
        D7p3GCg1wVgehxYxxQcXOEXAmgPhemBVRIMHiJ4NlYh4jVBET+Kp8VAQX0h7y6rwz+xv5juf
        +fz++C1Lqp2Mhk03WkTJKOi1dChsPfnGtXh/9P2kZY6vcXX3TQYXPDnB4NEKD8QHB3009rUW
        AHy0vYvCe681Ufh44AiFrdZCCt8+7YT4SuMAwAPPOwAe6ykkcOn47wR+uu9fClfmV0PceHQc
        4BvN5TQ+/bge4Mu1PTQ+1d7P4Jpb3QQur7kCceCZlcDdnm9wv6eDxnu6vSTOu9DO4InePyAu
        7lqzag5fZ68DfMCbx/D2uhz+nK2f4ata/ATvclhpvq+3hearin+j+Af72iA/9tcByBc3OQA/
        VNkA+U7vGYI/bH9F8CdrXzD8iGvO99yWsPgUwbIzMT3NuHTl1jBdl/82k1G/KGv88gkqF5Qv
        LAIhLOK+RDcGWmERCGXV3E2Ang7vJ5VNJ0DnhkeoIsCyNBePiv5hZCCCW4wOvq6i5ZrkysKR
        uy1MrmdyW1HTo3tQuSOgY2NvCKU2ooLykcn7kPsM5ToeALlWcd+h3X3XCcVVSKE7zl8n4RDu
        C+StrZ+UAe5TZM19QiiyKOQaekEpXXOouuVvUqlnIf+9iXfnWnTh1SCUeya5BaiheamCrkKP
        /U5Sqeeh0r2DjNLDDHS1zAdLQKRtmsE2Rdum0bZptG0afQxQDoAMQro+TbCIsUskMXOJZNIZ
        gp9tJoMLKLM3ehb8517rBgQL3CCaJbSzVG9HfEnqj1JMqdk6waxLljL1otkNEEtqI1R/ovtJ
        alWqkP2TKJneR7NZqI1SfT54IEnNya4dopghSu/TT1hWi1RWGZwhiWli1vZ0vWUqJtgQ+fFQ
        TYRZNKaKkpBp0SXL85FsDg6IHIUHvfmTXnOGYAieKqgHxLIl/orjJNtYURNc2+VVDY0mo6iJ
        Un0sA5wM6DKNH3QPQRQLtDNVDXIaHvwNP7z2MCgigqKvfrkriyzCVKTJBTt7shbpYzjT6u2d
        vufz91w6NJS1qVQTFzk7seeHgg3eyiF0kS7Li/g2561m2y1D39zW5pi5DT+ejfHmxzWt8Cbf
        KVvrvLvh/KOcWHXGmiMb+7KHL5o2pmxZ3jbxstezsmTX2PplMPFMICG84+q6hOs/L9/stgd8
        lxiUmhB5aoE4YN+khWadEBtDSmbhf2abmHtDBAAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBNb24sIDIwMTktMTItMDIgYXQgMTM6MTEgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIE1vbiwgRGVjIDAyLCAyMDE5IGF0IDA3OjU3OjEzQU0gKzAwMDAsIFZhaXR0aW5lbiwgTWF0
dGkgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDE5LTExLTI5IGF0IDEyOjA5ICswMDAwLCBNYXJrIEJy
b3duIHdyb3RlOg0KPiA+ID4gVGhlIHJlZ3VsYXRvciBkcml2ZXIgaGFzIGEgYnVuY2ggZm8gc2V0
X3N1c3BlbmRfIG9wZXJhdGlvbnMuDQo+ID4gSG1tLiBJIHNhdyB0aGVzZS4gQnV0IHVubGVzcyBJ
IGFtIG1pc3Rha2VuIGxpbnV4IG9ubHkga25vd3Mgb25lDQo+ID4gJ3N1c3BlbmQnIHN0YXRlIHdo
ZXJlYXMgdGhlIFBNSUMgaGFzIGEgZmV3IHNlcGFyYXRlIHN0YXRlcyBJIGNhbg0KPiA+IHNlZSBh
cw0KPiA+ICdzdXNwZW5kJyBzdGF0ZXMuIEFzIGZhciBhcyBJIHVuZGVyc3Rvb2QgdGhlIHNldF9z
dXNwZW5kX3ZvbHRhZ2UNCj4gPiBkb2VzDQo+ID4gbm90IGFsbG93IHNldHRpbmcgc2VwYXJhdGUg
c3VzcGVuZCB2b2x0YWdlcyBkZXBlbmRpbmcgb24gdGhlICJ0eXBlDQo+ID4gb2YNCj4gPiBzdXNw
ZW5kIiAoYXMgdGhlcmUgaXMgb25seSBvbmUgJ3N1c3BlbmQnIHN0YXRlKS4NCj4gDQo+IE5vLCBs
b29rIGF0IHRoZSBiaW5kaW5ncyAtIHdlIHN1cHBvcnQgYSBidW5jaCBvZiBkaWZmZXJlbnQNCj4g
c3VzcGVuZCBzdGF0ZXMgbWF0Y2hpbmcgdGhlIGRpZmZlcmVudCBzdXNwZW5kIHN0YXRlcyB0aGF0
IHRoZQ0KPiBrZXJuZWwgYXMgYSB3aG9sZSBzdXBwb3J0cy4gIFdlIGRvbid0IGFzc3VtZSB0aGF0
IHRoZSBkZXZpY2Ugd2lsbA0KPiBrbm93IHRoaXMgYnV0IHlvdSBjYW4gYWx3YXlzIHVzZSB0aGUg
Y3VycmVudCBzdXNwZW5kIHdlJ3JlIGdvaW5nDQo+IGZvciB0byBkZWNpZGUgd2hlcmUgdG8gdXBk
YXRlLg0KDQpIbS4gU28gaWYgSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5LCB5b3UgbWVhbiB1
c2VyIHNob3VsZCBzZXQgdGhlDQpzdXNwZW5kICd0YXJnZXQnIC0gYW5kIHRoZW4gY2FsbCB0aGUg
c2V0X3N1c3BlbmRfdm9sdGFnZSBmb3IgdGhpcw0Kc3RhdGUuIFRvIHNldCB2b2x0YWdlcyBmb3Ig
YWxsIHN0YXRlcyBvbmUgc2hvdWxkIGRvIGxvb3ANCg0KZ2V0X2N1cnJlbnRfbW9kZSgpDQoNCmZv
cl9hbGxfbW9kZXMoKSB7DQoJc2V0X21vZGUoKQ0KCXNldF92b2x0YWdlKCkNCn0NCg0KcmVzdG9y
ZV9vcmlnaW5hbF9tb2RlKCkNCg0KYW0gSSBvbiBhIHJpZ2h0IHRyYWNrPyBJJ2xsIHRyeSB0byBz
ZWUgaWYgSSBjYW4gZmluZCBzb21lIGV4YW1wbGVzIG9mDQp0aGlzIC0gdGhhbmtzLg0KDQo+IA0K
PiA+ID4gPiAoUlVOMCwgLi4uIFJVTjMpIGNvdWxkIGJlIG1hcHBlZCB0byByZWd1bGF0b3IgbW9k
ZXMNCj4gPiA+ID4gUkVHVUxBVE9SX01PREVfRkFTVCwgUkVHVUxBVE9SX01PREVfTk9STUFMLCBS
RUdVTEFUT1JfTU9ERV9JRExFDQo+ID4gPiA+IGFuZCANCj4gPiA+ID4gUkVHVUxBVE9SX01PREVf
U1RBTkRCWS4gQnV0IHJlZ3VsYXRvcnMgd2hpY2ggYXJlIGNvbnRyb2xsZWQgYnkNCj4gPiA+ID4g
dGhlc2UNCj4gPiA+IFRoYXQgZG9lc24ndCBtYWtlIHNlbnNlIGF0IGFsbCwgdGhlIG1vZGVzIGFm
ZmVjdCB0aGUgcXVhbGl0eSBvZg0KPiA+ID4gcmVndWxhdGlvbiBub3QgdGhlIHZvbHRhZ2UgdGhh
dCBpcyBzZXQuDQo+ID4gVGhhbmtzLiBJIG1pc3VuZGVyc3Rvb2QgdGhpcy4gSSB0aG91Z2h0IHRo
ZXNlIHN0YXRlcyBjb3VsZCBiZSB1c2VkDQo+ID4gZm9yDQo+ID4gc29tZSBhZGFwdGl2ZSB2b2x0
YWdlcy4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBSVU4wLC4uLlJVTjMNCj4gPiBhcmUN
Cj4gPiBkZXNpZ25lZCBmb3IgdGhhdCAtIGJ1dCBJIGRpZG4ndCBrbm93IGlmIHJlZ3VsYXRvciBm
cmFtZXdvcmsgaXMNCj4gPiBkZXNpZ25lZCBmb3IgdGhpcy4NCj4gDQo+IFRoZSBmcmFtZXdvcmsg
ZG9lc24ndCBjYXJlIGhvdyBhIGRldmljZSBpcyBjb250cm9sbGVkLCB0aGF0J3MgdXANCj4gdG8g
dGhlIGRldmljZS4gIExpa2UgSSBzYWlkIEkgcmVjb21tZW5kIGZpZ3VyaW5nIG91dCB3aGF0DQo+
IHZvbHRhZ2VzIGFyZSB1c2VmdWwgdG8gaGF2ZSBxdWljayBhY2Nlc3MgdG8gYXQgcnVudGltZSwg
Zm9yDQo+IGV4YW1wbGUgaXQncyBsaWtlbHkgdGhhdCBpdCdzIGdvb2QgdG8gaGF2ZSBxdWljayBh
Y2Nlc3MgdG8gdGhlDQo+IGhpZ2hlc3Qgdm9sdGFnZSB0aGF0J3MgYmVlbiBzZXQgKGFuZC9vciB0
aGUgdG9wIG9mIHRoZQ0KPiBjb25zdHJhaW50cykuDQoNClByb2JsZW0gaXMgdGhhdCB0aGUgcnVu
LWxldmVsIGNvbnRyb2xsZWQgcmVndWxhdG9yIGNhbid0IGJlDQppbmRpdmlkdWFsbHkgY29udHJv
bGxlZCAodW5sZXNzIGl0IGlzIG9ubHkgcmVndWxhdG9yIGluIHRoZSBncm91cCkuIEkNCm1pc3Vu
ZGVyc3Rvb2QgdGhlc2UgUkVHVUxBVE9SX01PREVfRkFTVCwgLi4uLFJFR1VMQVRPUl9NT0RFX1NU
QU5EQlkgdG8NCmJlIGdsb2JhbCAnc3RhdGVzJyByYXRoZXIgdGhhbiBzdGF0ZXMgb2YgaW5kaXZp
ZHVhbCByZWd1bGF0b3JzLiBBbmQgSQ0KdGhvdWdodCB0aGVzZSB3ZXJlIGFsc28gZGVzaWduZWQg
Zm9yIHZvbHRhZ2Ugc2NhbGluZy4gQnV0IGFzIEkgc2FpZCwgSQ0KbWlzdW5kZXJzdG9vZCB0aGVt
IC0gc28gdGhhbmtzIGZvciBjb3JyZWN0aW5nIG1lIG9uIHRoaXMuDQoNCj4gDQo+ID4gPiBUaGUg
Y3B1ZnJlcSBjb2RlIGlzIGFsbCB0aGVyZSBpbiBrZXJuZWwgLSBkcml2ZXJzL2NwdWZyZXEuICBJ
DQo+ID4gPiBjYW4ndA0KPiA+ID4gcmVtZW1iZXIgaWYgQW5kcm9pZCBzdGlsbCBoYXMgYSBjdXN0
b20gZ292ZXJub3IgaW4gdGhlaXIgdHJlZXMNCj4gPiA+IGJ1dCBpdA0KPiA+ID4gZG9lc24ndCBy
ZWFsbHkgbWFrZSBtdWNoIGRpZmZlcmVuY2UgaW4gdGVybXMgb2YgaG93IGl0IGludGVyYWN0cw0K
PiA+ID4gd2l0aA0KPiA+ID4gdGhlIHJlZ3VsYXRvciBkcml2ZXJzLg0KPiA+IFJpZ2h0LiBJIGd1
ZXNzIHlvdXIgYW5zd2VycyBtZWFuIHRoYXQgdGhlcmUgaXMgbm8gInJlZ3VsYXRvciBncm91cA0K
PiA+IGNvbnRyb2wiIGZvciAiYWRhcHRpdmUgdm9sdGFnZSBjaGFuZ2VzIiBzdXBwb3J0ZWQgYnkg
cmVndWxhdG9yDQo+IA0KPiBJIGNhbid0IHBhcnNlIHRoZSBhYm92ZSwgc29ycnkuICBXaGF0IGlz
ICJyZWd1bGF0b3IgZ3JvdXANCj4gY29udHJvbCI/DQoNCkkgbWVhbiBidW5kbGluZyB0aGUgcmVn
dWxhdG9ycyBpbiBhIGdyb3VwIC0gYW5kIGNoYW5naW5nIHN0YXRlIGZvciBhbGwNCm9mIHRoZSBi
dW5kbGVkIHJlZ3VsYXRvcnMgaW4gb25lIGdvLiBUaGUgdGhpbmcgSSBtZW50aW9uZWQgZWFybGll
ciAtDQphbmQgSSBndWVzcyB5b3UgZGlkIGFscmVhZHkgY29uZmlybSBpdCdzIG5vdCBkb2FibGUu
IEkgdGhpbmsgeW91IHNhaWQNCnRoYXQgb25seSAnbWFzcyBvcGVyYXRpb24nIG9yICdncm91cCBv
cGVyYXRpb24nIGlzIHRoZSBzdXNwZW5kLg0KDQpCdXQganVzdCB0byBjb25maXJtLCBJIG1lYW50
IGZvciBleGFtcGxlIGFzc2lnbmluZyBidWNrcyAxLDIsNiBhbmQgNw0KaW50byBhIGdyb3VwIHdo
aWNoICdzdGF0ZScgaXMgY2hhbmdlZCB2aWEgR1BJTyBsaW5lLiBTYXkgJ3N0YXRlcycgYXJlDQpS
VU4wLCBSVU4xLiBGb3IgZWFjaCBvZiB0aGVzZSBidWNrcyB3ZSBjYW4gZGVmaW5lIGEgdm9sdGFn
ZSBhbmQNCmVuYWJsZS9kaXNhYmxlIHN0YXR1cyB3aGljaCBpcyB0byBiZSB1c2VkIG9uIFJVTjAs
IGFuZCBhbm90aGVyDQp2b2x0YWdlL3N0YXRlIHR1cGxlIGZvciBSVU4xLg0KDQpXaGVuIGNlcnRh
aW4gJ3RyaWdnZXInIGlzIGRldGVjdGVkIChJIGFzc3VtZSBDUFUgbG9hZCBoZXJlIGFuZCBhZGFw
dGl2ZQ0Kdm9sdGFnZSBzY2FsaW5nIC0gYnV0IHRoaXMgaXMganVzdCBteSBhc3N1bXB0aW9uIG9m
IHRoZSB1c2UtY2FzZSBmb3INCm5vdykgdGhlIFBNSUMgc3RhdGUgY2FuIGJlIHF1aWNrbHkgY2hh
bmdlZCB2aWEgdGhpcyBHUElPIHRvZ2dsZS4NCg0KSW4gcmVhbHR5LCB3ZSBoYXZlIHR3byBHUElP
cyBhbmQgNCBzdGF0ZXMgLSBidXQgdGhhdCBkb2VzIG5vdCBjaGFuZ2UNCnRoZSBwcmluY2libGUu
IEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55ICdkZS1mYWN0bycgbWVjaGFuaXNtIHRvDQpjb250
cm9sIHN1Y2ggZ3JvdXBzLg0KDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0K
