Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2776D102BFE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 19:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfKSSvm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 13:51:42 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:61826 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfKSSvm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 13:51:42 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-52-5dd439ba3be6
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 50.9F.08102.AB934DD5; Tue, 19 Nov 2019 19:51:38 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Tue, 19 Nov 2019 19:51:38 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Topic: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Index: AQHVndzxthsd4Y8wKkm7W/92Uslk+KeRDPcAgAAbkICAAZUNgIAACqYA
Date:   Tue, 19 Nov 2019 18:51:37 +0000
Message-ID: <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <20191118162502.GJ9761@sirena.org.uk>
         <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
         <20191119181325.GD3634@sirena.org.uk>
In-Reply-To: <20191119181325.GD3634@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.203.185.189]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A333FA58B8AACB4686E37B52BE649857@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1BUVRzH59znWeTWdQE5rWZ5ncYeo2ZTeZplHGsmvTU+p6lmKoKr3LiM
        cJe5u1ta47QzjOKig1CQucn7kcESuuJrW1MQEtFICo0kYFBkXEmZCKHiUfdyVfjrfM/5/r6/
        z++P34GktZq1wRTVJWuqlCowEdSZg2OBxcGX2uOfDdy14/K2yyzOvFPJ4uGCFgrn9/YxuO9M
        JsBFja003n2hjsalg1/S2OvdRePOo4co3HykB+Ceu00Aj7TvInDe+NcE/nNPN41LdpZT+EjR
        OMC/BA8w+Ogf3wL8Q3U7g2sau1hc8WsbgQ9UNFN4cMhL4LaWV3FXSxODM9o6SLzjVCOLJ68c
        pnB26+qV80V/oR+Igx07WLHQ/4l40tfFimWhMCEGqryM+PuVECOWZX9Oizf3nKXEkYu5lJhd
        VwXE/pJaSjzXcZwQ9xX+Q4gHq0dZ8a/A/A38O7PiNkmuD99ISVaXrkicpXwfbCXTgwu27j0V
        Bh5w8fEsYIGIfx51d5YyWSACWvnLAGV0hgjz0gzQeM9eMgtAyPBxKOs31ghE84tR/r9ljKFJ
        fn8kujqx0dBRfCKqG7hOmTUSKh4ZI0y9Cg34/qYNTfFPIF/oGDA0x69Dty99cY/1HYEGhuqn
        whb+OVT0zdgUAPCPIq/nDmHCYlGgf5Q2p+ZReegn0tQxKHx98t67gE43tU7NTPJPodrgUjO6
        Et3wZ9KmXoDydvey5gyz0fn9fVQOmOObQfBNp30z0r4Zad+MdDGgqwBKk1JSkyWXvGyJJruX
        aA4lTT82O9ICwFy+4RPgv4bXGgABQQN4BBJCDOcB7fHWhzY5krYpklNJ0NypsrMBIEgK0dy6
        a5firVyStO1jWXPct+ZCSojlFvXmxlt5g7VFltNl7b47D0IBcRMv6k1na3KyvPWDlFTXtE1A
        i9E8whbtlNUkWZPcLiXB2I8Ep74ghhWpc4eX63HOmS6l6a9mtAU8A3PCBaUkbCyoKCWtlOpQ
        ZVss531YL+WNUsWtPgDdArEQCFGcHetupP4DH/S5pSMIHXG45mcD4ZKmLZsHJEaNzXsL+uMg
        Xa+ePbczynn708l8z/b3Iu0/FlW/ub1rkX3OwvcHN1548nzliPSVJ+Pt08XLc8KF1+CWq4dK
        7J/lrbX4X6k8od14YVWikPt6jLJ5vYVZUXtM2/fRetvQ3HfVNdbxte7VvVS+NlG3MGFUzHZr
        3Vru8f7ak0pN/WMv3xQopyIte5rUnNL/JfWgXD4EAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMTktMTEtMTkgYXQgMTg6MTMgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDA2OjAzOjQyUE0gKzAwMDAsIFZhaXR0aW5lbiwgTWF0
dGkgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDE5LTExLTE4IGF0IDE2OjI1ICswMDAwLCBNYXJrIEJy
b3duIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDg6NTM6NTdBTSArMDIw
MCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiA+ID4gSSBkb24ndCB0aGluayBJIHNhdyB0aGlz
IGhhdmluZyB0aGUgZWZmZWN0IG9uIHNldF92b2x0YWdlKCkgdGhhdA0KPiA+ID4gSSdkDQo+ID4g
PiBoYXZlIGV4cGVjdGVkIGluIHRoZSBkcml2ZXI/ICANCj4gPiBUaGUgc3VwcG9ydCBmb3IgdGhp
cyBpcyBhZGRlZCBpbiBwYXRjaCAxMi4gSSBzaG91bGQndmUgb3JkZXJlZCB0aGUNCj4gPiBwYXRj
aCBzZXJpZXMgc28gdGhhdCBhbGwgcmVndWxhdG9yIHBhdGNoZXMgd2VyZSBvbmUgYWZ0ZXIgYW5v
dGhlci4NCj4gPiBTb3JyeSBmb3IgdGhhdC4NCj4gPiBUaGUgcGF0Y2ggMTIgYWRkcyB0aGUgcnVu
LWxldmVsIHN1cHBvcnQuIFBsZWFzZSBzZWUgdGhlIGZ1bmN0aW9ucw0KPiA+IGdldF9ydW5jb250
cm9sbGVkX2J1Y2tzX2R0KCksDQo+ID4gbWFya19yZWd1bGF0b3JfcnVubHZsX2NvbnRyb2xsZWQo
KSAoc2V0cyB0aGUgZy0+cnVubHZsKQ0KPiA+IGFuZCBzZXRfYnVja19ydW5sdmxfY29udHJvbGxl
ZCgpIChjYWxsZWQgYmFzZWQgb24gZy0+cnVubHZsKQ0KPiA+IHdoaWNoIGNoYW5nZXMgdGhlIG9w
cyB0byBkaXNhbGxvdyBzZXR0ZXJzIGFuZCB0byBnZXQgdm9sdGFnZSBiYXNlZA0KPiA+IG9uDQo+
ID4gY3VycmVudCBydW5sZXZlbCAtIGFuZCBkaWZmZXJlbnQgb3BzIGRlcGVuZGluZyBvbiBpZiBy
dW5sZXZlbHMgYXJlDQo+ID4gY29udHJvbGxlZCBieSBHUElPIG9yIEkyQy4gQWRkaXRpb25hbGx5
DQo+ID4gc2V0X2J1Y2tfcnVubHZsX2NvbnRyb2xsZWQoKQ0KPiA+IGFkZHMgRFQgcGFyc2luZyBj
YWxsLWJhY2sgZm9yIHNldHRpbmcgdGhlIGluaXRpYWwgdm9sdGFnZXMuDQo+IA0KPiBBaCwgT0su
ICBJIGRpZG4ndCBldmVuIG5vdGljZSB0aGF0IHBhdGNoIHdoZW4gSSBzY2FubmVkIHRoZSBzZXJp
ZXMuDQo+IEknbGwgbG9vayBvdXQgZm9yIHRoaXMgbmV4dCB0aW1lIGFyb3VuZCBidXQgdGhhdCBz
b3VuZHMgbGlrZSBpdCdzDQo+IGdlbmVyYWxseSBnb2luZyBpbiB0aGUgcmlnaHQgZGlyZWN0aW9u
LCBlc3BlY2lhbGx5IGlmIGl0J3MgaW50ZWdyYXRlZA0KPiB3aXRoIHRoZSBzdXNwZW5kIG1vZGUg
cmVndWxhdG9yIGJpbmRpbmdzIHRoYXQgQ2h1bnlhbiBkaWQuDQoNClByb2JhYmx5IGl0IGlzIG5v
dCBhcyBJIGFtIG5vdCBmYW1pbGlhciB3aXRoIENodW55YW4ncyB3b3JrLiBJJ2xsIHRyeQ0KbG9v
a2luZyB3aGF0IGhhcyBiZWVuIGRvbmUgb24gdGhhdCBmcm9udCA6KSBBbmQgSSBhbSBwcmV0dHkg
c3VyZSB5b3UNCm1pZ2h0IG5vdCBiZSBoYXBweSB3aXRoIHRoYXQgcGF0Y2ggLSBidXQgcGVyaGFw
cyB5b3UgY2FuIGdpdmUgbWUgYQ0KbnVkZ2UgdG8gYmV0dGVyIGRpcmVjdGlvbi4uLg0KDQo+ID4g
PiA+ICsgICAgICAgIG1pbmltdW06IDANCj4gPiA+ID4gKyAgICAgICAgbWF4aW11bTogMjAwMDAw
MA0KPiA+ID4gPiArICAgICAgICBtYXhJdGVtczogNA0KPiA+ID4gPiArICAgICAgICBkZXNjcmlw
dGlvbjoNCj4gPiA+ID4gKyAgICAgICAgICBBcnJheSBvZiB2b2x0YWdlcyBmb3IgcnVuLWxldmVs
cy4gRmlyc3QgdmFsdWUgaXMgZm9yDQo+ID4gPiA+IHJ1bi1sZXZlbCAwLA0KPiA+ID4gPiArICAg
ICAgICAgIHNlY29uZCBmb3IgcnVuLWxldmVsIDEgZXRjLiBNaWNyb3ZvbHRzLg0KPiA+ID4gV2hh
dCdzIHRoZSBtYXBwaW5nIGZyb20gYXJyYXkgaW5kZXhlcyB0byB0aGUgbmFtZXMgdXNlZCBlbHNl
d2hlcmUNCj4gPiA+IHRvDQo+ID4gPiBzdXBwb3J0IHJ1bmxldmVscz8NCj4gPiBIbW0uIFNvcnJ5
IE1hcmssIEkgZG9uJ3QgdGhpbmsgSSBmb2xsb3cgeW91ciBxdWVzdGlvbi4gRG8geW91IG1lYW4N
Cj4gPiBuYW1lcyBsaWtlIExQU1IsIFNVU1BFTkQsIElETEUsIFJVTj8gSWYgc28sIHRoZW4gSSBt
aWdodCBuZWVkIHRvDQo+ID4gcmVwaHJhc2UgdGhpcy4gVGhlIHJ1bmxldmVscyByZWZlcnJlZCBo
ZXJlIGFyZSBkaWZmZXJlbnQgZnJvbSBMUFNSLA0KPiA+IFNVU1BFTkQsIElETEUgZXRjLiBUaGV5
IGFyZSBhY3R1YWxseSAnc3ViLWxldmVscycgZm9yIFBNSUMncyBSVU4NCj4gPiBzdGF0ZS4NCj4g
PiBFZywga2luZCBvZiBhICdmYXN0IHdheScgdG8gY2hhbmdlIHZvbHRhZ2VzIGZvciBtdWx0aXBs
ZSBwb3dlcg0KPiA+IHJhaWxzDQo+ID4gd2hlbiBTb0MgaXMgYXQgUlVOIHN0YXRlLiBUaGUgbmFt
ZXMgSSBoYXZlIHNlZW4gYXJlIFJVTjAsIFJVTjEsDQo+ID4gUlVOMg0KPiA+IGFuZCBSVU4zLiBU
aGF0IG1hcHBpbmcgaXMgZGVzY3JpYmVkIGluIGRlc2NyaXB0aW9uIGFib3ZlLg0KPiANCj4gWWVz
LCBJIHRoaW5rIHRoaXMgbmVlZHMgY2xhcmlmaWNhdGlvbiBhcyBJIGNvbXBsZXRlbHkgZmFpbGVk
IHRvIHBpY2sNCj4gdXANCj4gb24gdGhpcyBhbmQgZGlkIGluZGVlZCByZWFkIHRoaXMgYXMgcmVm
ZXJyaW5nIHRvIHRoZQ0KPiBtb2Rlcy4gICJWb2x0YWdlcw0KPiB0aGF0IGNhbiBiZSBzZXQgaW4g
UlVOIG1vZGUiIG9yIHNvbWV0aGluZz8gIEkgdGFrZSBpdCB0aGVzZSB2b2x0YWdlcw0KPiBhcmUN
Cj4gZml4ZWQgYW5kIHRoZSBPUyBjYW4ndCBjaGFuZ2UgdGhlbT8NCg0KVW5mb3J0dW5hdGVseSB0
aGV5IGFyZSBub3QuIFZvbHRhZ2VzIGFuZCBlbmFibGUvZGlzYWJsZSBzdGF0dXNlcyBmb3INCmVh
Y2ggcnVuLWxldmVsIChhbmQgaW5kaXZpZHVhbGx5IGZvciBlYWNoIHJ1bi1sZXZlbCBjYXBhYmxl
IGJ1Y2spIGNhbg0KYmUgY2hhbmdlZCBhdCBydW50aW1lIHZpYSBJMkMuIEFuZCBhIGN1c3RvbWVy
IHJlcXVlc3RlZCBtZSBhbHNvIHRvDQpzdXBwb3J0IHRoaXMgLSBoZW5jZSB0aGUgaW4ta2VybmVs
IEFQSSAtIGJ1dCBJIGFtIHN1cmUgeW91IGhhdmUgc29tZQ0KbmljZSB3b3JkcyB3aGVuIHlvdSBj
aGVjayB0aGUgcGF0Y2ggMTIuIDpdDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0KDQo=
