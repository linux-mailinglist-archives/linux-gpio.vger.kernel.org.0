Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE36E430D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 07:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393389AbfJYFtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 01:49:25 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:63934 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390519AbfJYFtY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 01:49:24 -0400
X-AuditID: c0a8fbf4-183ff70000001fa6-b7-5db28ce17c46
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id A2.E7.08102.1EC82BD5; Fri, 25 Oct 2019 07:49:22 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Fri, 25 Oct 2019 07:49:17 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Topic: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Index: AQHVimAFYId2ZTjVIEaonX+EqNqiYKdqDi6AgACrYYA=
Date:   Fri, 25 Oct 2019 05:49:17 +0000
Message-ID: <5c793f1308ccc6e787260b64fe6a875a8d0eb9d0.camel@fi.rohmeurope.com>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <0182df3c49c6c804ee20ef32fc4b85b50ff45fca.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <ed0b2aa8-8a70-0341-4ecf-8959f37c53bd@ti.com>
In-Reply-To: <ed0b2aa8-8a70-0341-4ecf-8959f37c53bd@ti.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <443249D57C586E4E9B65E1E4D06AE929@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf2wMaRj2zczOTKvDdLX6XdHEJIgKJfHjI04aidycEySIkKwaOrpld7aZ
        2RVOclYuPew2ThOts9cWtS2hbLtKtdavZukvQalqU1WthrQ59KguuaU300H71/d87/M+z/P+
        8b40buwg4+l0yS7KkmDhyEji5pn/ymZ2ZflNs+saMORtfEyh/W+KKdSfX0+gnM5uEh0P3jMg
        d0O5AbVdKiVQx4fbAA00HcDQkfBpDP2b9cyALh4PA/SoKo9El/65ANCdc00kKnrSiKG8oloC
        NdYvQ+31t0mUeS1IoS/NZURyLF9SUAL4ty2ZFF9Qsoev9LRTvP/sQZJ/2hwg+ZqWCow/WvAJ
        48+cC1H8e3/C6siNoxdvEew716SnSUlLNo8259zwERnv5u8K+HINThCY5wI0Ddm5MLdhqQtE
        0ka2GcA+T7lB/9QC6K10kloTyS6GrlbKBSLoGHYTLG68RWo9OBuiYK/HPUSMY9fCoC8X6E3r
        4PVDWV/xIjh4IQ/XMMFOgf3nq4bqDLsSlvQ8wPSwJgBvBS4PGUWogsycPlLDgJ0EDzrfYBrG
        2TjofxkyaBiyLPQG7uM6joU9L758rXPw2qdOQhsaZ6dDX1WSDpNh1sflustkeMTdSekjRMO6
        Y93EYTDeMyLAMyz2DIs9I8SeEeITwHAWQKuQbkkT7OKcWbLomCXbzFb12Wqz+oG+MP1XwGD1
        z9UAo0E1+IHGuFjGZPGbjGO22FJ3mwXFnCI7LKJSDSCNczHM1allJiOTKuz+VZRt36gJNMHF
        MdM6s01GVsvaIYoZovyNnUjTHGQ+71NNo2UxTdy1Ld1iH6YxOkIzj4yPUUQpVZQFh92com1H
        iqKuh0ZFqblhtypnlAzBqlZ1aT2YQR/uyS/E6WB+USFuJCSbJMbHMUnqARhZrdXskL4H9YI4
        GnDjmEGXykapV/Pdp1eNwNSIhLE+LcIuDFPxTmBMbhuoW/Hj66jgU+VQq3/Uc2tlTdHJ+Vh7
        y9ENpx5ylTldpX9WLFsquV/85e9j74adSvhVa+KS7Okhaf0vlxN+6vLa9/8R/bnmpNdlCCUe
        +23hpLcD24mHUvfrzQvCxW2jJv69fJ93ZUet417P1jTsXUX2hvLC3817d5YuqOh4PrDqI0co
        ZmFOIi4rwv+IiJvU8gMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gRGFuLA0KDQpUaGFua3MgYWdhaW4gZm9yIGNoZWNraW5nIHRoaXMgOikNCg0KT24gVGh1
LCAyMDE5LTEwLTI0IGF0IDE0OjM1IC0wNTAwLCBEYW4gTXVycGh5IHdyb3RlOg0KPiBNYXR0aQ0K
PiANCj4gT24gMTAvMjQvMTkgNjo0MSBBTSwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiA+IFJP
SE0gQkQ3MTgyOCBQb3dlciBtYW5hZ2VtZW50IElDIGludGVncmF0ZXMgNyBidWNrIGNvbnZlcnRl
cnMsIDcNCj4gPiBMRE9zLA0KPiA+IGEgcmVhbC10aW1lIGNsb2NrIChSVEMpLCAzIEdQTy9yZWd1
bGF0b3IgY29udHJvbCBwaW5zLCBIQUxMIGlucHV0DQo+ID4gYW5kIGEgMzIuNzY4IGtIeiBjbG9j
ayBnYXRlLg0KPiA+IA0KPiA+IERvY3VtZW50IHRoZSBkdCBiaW5kaW5ncyBkcml2ZXJzIGFyZSB1
c2luZy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZh
aXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiAtLS0NCj4gPiANCj4gPiBObyBjaGFuZ2Vz
IHNpbmNlIHYxDQo+ID4gDQo+ID4gICAuLi4vYmluZGluZ3MvbWZkL3JvaG0sYmQ3MTgyOC1wbWlj
LnR4dCAgICAgICAgfCAxODANCj4gPiArKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxODAgaW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yb2htLGJkNzE4MjgtcG1pYy50
eHQNCj4gDQo+IEkgd2lsbCBsZXQgbWFpbnRhaW5lcnMgd2VpZ2ggaW4gaGVyZSBidXQgaWYgdGhp
cyBpcyBuZXcgdGhpcyBzaG91bGQgDQo+IHByb2JhYmx5IGJlIGluIHRoZSB5YW1sIGZvcm1hdCB0
byBhdm9pZCBjb252ZXJzaW9uIGluIHRoZSBmdXR1cmUNCg0KT2guLi4gVGhpcyBpcyBuZXcgdG8g
bWUuIEkgZ3Vlc3MgdGhlcmUgYXJlIHJlYXNvbnMgZm9yIHRoaXMgLSBidXQgSQ0KbXVzdCBzYXkg
SSBhbSBub3QgZXhjaXRlZCBhcyBJIGhhdmUgbmV2ZXIgdXNlZCB5YW1sIGZvciBhbnl0aGluZy4g
SSdsbA0KZG8gYXMgeW91IHN1Z2dlc3QgYW5kIHdhaXQgZm9yIHdoYXQgb3RoZXJzIGhhdmUgdG8g
c2F5IDopIFRoYW5rcyBmb3INCnBvaW50aW5nIHRoaXMgb3V0IHRob3VnaC4NCg0KPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JvaG0sYmQ3MTgy
OC0NCj4gPiBwbWljLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQv
cm9obSxiZDcxODI4LQ0KPiA+IHBtaWMudHh0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjEyNWVmYTlmM2RlMA0KPiA+IC0tLSAvZGV2L251bGwNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JvaG0sYmQ3MTgy
OC1wbWljLnR4dA0KPiA+IEBAIC0wLDAgKzEsMTgwIEBADQo+ID4gKyogUk9ITSBCRDcxODI4IFBv
d2VyIE1hbmFnZW1lbnQgSW50ZWdyYXRlZCBDaXJjdWl0IGJpbmRpbmdzDQo+ID4gKw0KPiA+ICtC
RDcxODI4R1cgaXMgYSBzaW5nbGUtY2hpcCBwb3dlciBtYW5hZ2VtZW50IElDIGZvciBiYXR0ZXJ5
LXBvd2VyZWQgDQo+ID4gcG9ydGFibGUNCj4gPiArZGV2aWNlcy4gVGhlIElDIGludGVncmF0ZXMg
NyBidWNrIGNvbnZlcnRlcnMsIDcgTERPcywgYW5kIGEgMTUwMA0KPiA+IG1BIHNpbmdsZS1jZWxs
DQo+ID4gK2xpbmVhciBjaGFyZ2VyLiBBbHNvIGluY2x1ZGVkIGlzIGEgQ291bG9tYiBjb3VudGVy
LCBhIHJlYWwtdGltZQ0KPiA+IGNsb2NrIChSVEMpLA0KPiA+ICthbmQgYSAzMi43Njgga0h6IGNs
b2NrIGdhdGUuDQo+ID4gKw0KPiA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICsgLSBjb21w
YXRpYmxlCQkJOiBTaG91bGQgYmUgInJvaG0sYmQ3MTgyOCIuDQo+ID4gKyAtIHJlZwkJCQk6IEky
QyBzbGF2ZSBhZGRyZXNzLg0KPiA+ICsgLSBpbnRlcnJ1cHQtcGFyZW50CQk6IFBoYW5kbGUgdG8g
dGhlIHBhcmVudA0KPiA+IGludGVycnVwdCBjb250cm9sbGVyLg0KPiA+ICsgLSBpbnRlcnJ1cHRz
CQkJOiBUaGUgaW50ZXJydXB0IGxpbmUgdGhlIGRldmljZQ0KPiA+IGlzIGNvbm5lY3RlZCB0by4N
Cj4gPiArIC0gY2xvY2tzCQkJOiBUaGUgcGFyZW50IGNsb2NrIGNvbm5lY3RlZCB0byBQTUlDLg0K
PiA+ICsgLSAjY2xvY2stY2VsbHMJCQk6IFNob3VsZCBiZSAwLg0KPiA+ICsgLSByZWd1bGF0b3Jz
CQkJOiBMaXN0IG9mIGNoaWxkIG5vZGVzIHRoYXQNCj4gPiBzcGVjaWZ5IHRoZQ0KPiA+ICsJCQkJ
ICByZWd1bGF0b3JzLiBQbGVhc2Ugc2VlDQo+ID4gKwkJCQkgIC4uL3JlZ3VsYXRvci9yb2htLGJk
NzE4MjgtDQo+ID4gcmVndWxhdG9yLnR4dA0KPiA+ICsgLSBncGlvLWNvbnRyb2xsZXIJCTogVG8g
aW5kaWNhdGUgQkQ3MTgyOCBhY3RzIGFzIGEgR1BJTw0KPiA+IGNvbnRyb2xsZXIuDQo+ID4gKyAt
ICNncGlvLWNlbGxzCQkJOiBTaG91bGQgYmUgMi4gVGhlIGZpcnN0IGNlbGwNCj4gPiBpcyB0aGUg
cGluIG51bWJlcg0KPiA+ICsJCQkJICBhbmQgdGhlIHNlY29uZCBjZWxsIGlzIHVzZWQgdG8NCj4g
PiBzcGVjaWZ5IGZsYWdzLg0KPiA+ICsJCQkJICBTZWUgLi4vZ3Bpby9ncGlvLnR4dCBmb3IgbW9y
ZQ0KPiA+IGluZm9ybWF0aW9uLg0KPiA+ICsNCj4gPiArVGhlIEJENzE4MjggUlVOIHN0YXRlIGlz
IGRpdmlkZWQgaW50byA0IGNvbmZpZ3VyYWJsZSBydW4tbGV2ZWxzDQo+ID4gbmFtZWQgUlVOMCwN
Cj4gPiArUlVOMSwgUlVOMiBhbmQgUlVOMy4gQnVja3MgMSwgMiwgNiBhbmQgNyBjYW4gYmUgZWl0
aGVyIGNvbnRyb2xsZWQNCj4gPiBpbmRpdmlkdWFsbHkNCj4gPiArdmlhIEkyQywgb3Igc29tZS9h
bGwgb2YgdGhlbSBjYW4gYmUgYm91bmQgdG8gcnVuLWxldmVscyBhbmQNCj4gPiBjb250cm9sbGVk
IGFzIGENCj4gPiArZ3JvdXAuIElmIGJ1Y2tzIGFyZSBjb250cm9sbGVkIGluZGl2aWR1YWxseSB0
aGVzZSBydW4tbGV2ZWxzIGFyZQ0KPiA+IGlnbm9yZWQuIFNlZQ0KPiA+ICsuLi9yZWd1bGF0b3Iv
cm9obSxiZDcxODI4LXJlZ3VsYXRvci50eHQgZm9yIGhvdyB0byBkZWZpbmUNCj4gPiByZWd1bGF0
b3Igdm9sdGFnZXMNCg0KPiBUaGUgcm9obSxiZDcxODI4LXJlZ3VsYXRvci50eHQgc2hvdWxkIGJl
IHlhbWwgaWYgdGhlIG1haW50YWluZXJzIHdhbnQNCj4gaXQgDQo+IHRoYXQgd2F5Lg0KDQpMZXQn
cyBzZWUgaWYgdGhpcyBzaG91bGQgYmUgY2hhbmdlZCB0aGVuIDopDQoNCj4gPiArZm9yIHJ1bi1s
ZXZlbHMuIFJ1bi1sZXZlbHMgY2FuIGJlIGNoYW5nZWQgYnkgSTJDIG9yIEdQSU8gZGVwZW5kaW5n
DQo+ID4gb24gUE1JQydzIE9UUA0KPiA+ICtjb25maWd1cmF0aW9uLg0KPiA+ICsNCj4gPiArT3B0
aW9uYWwgcHJvcGVydGllczoNCj4gPiArLSBjbG9jay1vdXRwdXQtbmFtZXMJCTogU2hvdWxkIGNv
bnRhaW4gbmFtZSBmb3INCj4gPiBvdXRwdXQgY2xvY2suDQo+ID4gKy0gcm9obSxkdnMtdnNlbC1n
cGlvcwkJOiBHUElPcyB1c2VkIHRvIGNvbnRyb2wgUE1JQw0KPiA+IHJ1bi1sZXZlbHMuIFNob3Vs
ZA0KPiA+ICsJCQkJICBkZXNjcmliZSB0d28gR1BJT3MuIChTZWUgcnVuLWxldmVsDQo+ID4gY29u
dHJvbCBpbg0KPiA+ICsJCQkJICBkYXRhLXNoZWV0KS4gSWYgdGhpcyBwcm9wZXJ0eSBpcw0KPiA+
IG9taXR0ZWQgYnV0DQo+ID4gKwkJCQkgIHNvbWUgYnVja3MgYXJlIG1hcmtlZCB0byBiZQ0KPiA+
IGNvbnRyb2xsZWQgYnkNCj4gPiArCQkJCSAgcnVuLWxldmVscyAtIHRoZW4gT1RQIG9wdGlvbiBh
bGxvd2luZw0KPiA+ICsJCQkJICBydW4tbGV2ZWwgY29udHJvbCB2aWEgSTJDIGlzIGFzc3VtZWQu
DQo+ID4gKy0gZ3Bpby1yZXNlcnZlZC1yYW5nZXMJCTogVXNhZ2Ugb2YgR1BJTyBwaW5zIGNhbiBi
ZQ0KPiA+IGNoYW5nZWQgdmlhIE9UUC4NCj4gPiArCQkJCSAgVGhpcyBwcm9wZXJ0eSBjYW4gYmUg
dXNlZCB0byBtYXJrIHRoZQ0KPiA+IHBpbnMNCj4gPiArCQkJCSAgd2hpY2ggc2hvdWxkIG5vdCBi
ZSBjb25maWd1cmVkIGZvcg0KPiA+IEdQSU8uDQo+ID4gKwkJCQkgIFBsZWFzZSBzZWUgdGhlIC4u
L2dwaW8vZ3Bpby50eHQgZm9yDQo+ID4gbW9yZQ0KPiA+ICsJCQkJICBpbmZvcm1hdGlvbi4NCj4g
PiArDQo+ID4gK0V4YW1wbGU6DQo+ID4gKw0KPiANCj4gVGhpcyBleGFtcGxlIGRvZXMgbm90IGxv
b2sgcmlnaHQuDQo+IA0KPiBJIHNlZSB0aGF0IEkyQyBpcyByZWZlcmVuY2VkIGFib3ZlIHNvIHRo
ZSBleGFtcGxlIGNvdWxkIGxvb2sgbGlrZQ0KPiB0aGlzDQo+IA0KPiBvc2M6IG9zY2lsbGF0b3Ig
ew0KPiAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiAgICAg
ICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwxPjsNCj4gICAgICAgICAgICAgICAgICBjbG9j
ay1mcmVxdWVuY3kgID0gPDMyNzY4PjsNCj4gICAgICAgICAgICAgICAgICBjbG9jay1vdXRwdXQt
bmFtZXMgPSAib3NjIjsNCj4gICAgICAgICAgfTsNCj4gDQo+IFRoaXMgaXMgYW4gZXh0ZXJuYWwg
b3NjaWxsYXRvciBhbmQgaXMgbm90IHJlYWxseSBwYXJ0IG9mIHRoZSBwbWljIA0KPiBpdHNlbGYu
ICBJIGFtIG5vdCBzdXJlIHlvdSBldmVuIG5lZWQgdG8gZGVmaW5lIHRoYXQgc2luY2UgaXQgaXMg
bm90DQo+IHBhcnQgDQo+IG9mIHRoZSBwbWljLg0KDQpJIHRoaW5rIHlvdSBhcmUgY29ycmVjdC4g
SSdsbCBkcm9wIHRoaXMgb3NjaWxsYXRvciBmb3IgbmV4dCBwYXRjaC4NCg0KPiANCj4gaTJjIHsN
Cj4gDQo+ICAgICAgICAgIHBtaWNANGIgew0KPiANCj4gICAgICAgICAgICAgICAgICBbLi4uXQ0K
PiANCj4gICAgICAgICAgfTsNCj4gDQo+IH07DQoNCkkgZG9uJ3QgdGhpbmsgdGhlIEkyQyBub2Rl
IGlzIG5lZWRlZCBpbiBleGFtcGxlLiBJdCBpcyBub3QgcGFydCBvZiB0aGUNClBNSUMgLSBhbmQg
SSBkb24ndCBzZWUgdGhlIGNvbnRhaW5pbmcgYnVzIGluIG90aGVyIGV4YW1wbGVzIEkganVzdA0K
b3BlbmVkLiAodGhlIHR3byBvdGhlciByb2htLHh4eCBQTUlDIGRvY3MgLSB3ZWxsLCBiaWFzZWQg
YXMgSSB3cm90ZQ0KdGhlbSksIGRhOTE1MC50eHQsIGxwMzk0My50eHQsIG1heDc3Njg2LnR4dCwg
dHBzNjUwN3gudHh0LCB0cHM2NTkxMC50eHQNCi4uLg0KDQpCciwNCglNYXR0aSBWYWl0dGluZW4N
Cg0K
