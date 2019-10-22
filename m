Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C52CE04C7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 15:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732034AbfJVNTr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 09:19:47 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:44554 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730197AbfJVNTq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 09:19:46 -0400
X-AuditID: c0a8fbf4-183ff70000001fa6-21-5daf01f0cfc3
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 55.A6.08102.0F10FAD5; Tue, 22 Oct 2019 15:19:44 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Tue, 22 Oct 2019 15:19:38 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [RFC PATCH 10/13] gpio: bd71828: Initial support for ROHM
 BD71828 PMIC GPIOs
Thread-Topic: [RFC PATCH 10/13] gpio: bd71828: Initial support for ROHM
 BD71828 PMIC GPIOs
Thread-Index: AQHVhNC0M8qm8vzoP0yjRB+AhWv9dadepj4AgAXpHQCAAH9rgIABfMWA
Date:   Tue, 22 Oct 2019 13:19:37 +0000
Message-ID: <5611c687e6fc86fefb750faf2f726472e22a7d57.camel@fi.rohmeurope.com>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <f8f8c323d378244afe4e94f48c0a94bb296cbbe0.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <CAMpxmJWXQccY8HsM6MXYBW8KC0U+7iOk+Ve-4nk=cpa=Zuk1cg@mail.gmail.com>
         <3ae3507649f2e9a66053a99b4a71e29786fc3d34.camel@fi.rohmeurope.com>
         <CAMpxmJVABg-UAzZtaQKu5ADBhi1P7CNArmstxHi5ZfdPiSKyYw@mail.gmail.com>
In-Reply-To: <CAMpxmJVABg-UAzZtaQKu5ADBhi1P7CNArmstxHi5ZfdPiSKyYw@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F351C861A47E7F41A6F91205DB16805C@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0gTYRjHe+9ud+fy4pza3uz3akRFmeQfb2URRHFR9IOCoFp26eVW8ya3
        WVn+IYTkjwT7YdJwGtKWNdNaRWmWYqtsRSXlNDJrZoFh9sO0hmbtNkv/er883+f7fJ4/npfG
        Ve/IGNogWgRJ5I0aUkk0VAy6FnwF1bpFTeUR6HxzC4WO9Too9MPmIVCRr4tEZe6nCpT/+LoC
        vb5xhUBv++8DNPAyB0Onhy5g6NvxDgW6VjYE0IvaEhLd6KkC6IHzJYnsrc0YKrE3EajZsxq9
        8dwnUfYdN4WGvVeJldFcZWkl4L60ZVNcaeURrsb6huJcl3JJrt1bR3IP225iXHGpH+MqnD8p
        rs81bZNy+/iEPbzlwBZDihi7Yvd4/e0SG5nWOf3Q9dcOPAv8mpYHwmjIxsNXDi8paxXrBdD/
        cW0eUAZ0E4An/G4iD9A0ySbAvFeU3BPFLoOfW59gssZZKw0LnME5kewOWHK1jQj17IQ9fe9H
        9BpY96s4mCVYLXTYzwQ1w26AnY5KKsTyY7C9qAiXjTB2M+wrPRcMA3YqzM3qHYGpoevjT0Vo
        aRaer3uGh3Q07H4/PFLXwDt+X3BnnJ0Lq2tjQ9GV0N7vBiE9E57O943sEAEfne0iCsFE6xiC
        dTRtHZO2jklbx6TPAcUlAFN5gzGFtwhxCyUhfaFk0qcGniRTqguELubHLfCncW0jwGjQCCbR
        mCaaiReqdKoJe0zJGXrerE+U0o2CuRFAGtdEMe2LLutUTDKfcViQTP+syTShUTNzfCd0KlZm
        7ReENEH6506haQ1k1OOqdaoISUgRDu01GC2jNkaHycOVMVFmQUwWJD7dok+UzyPRHLgP2QoP
        cLfJccacxqcGqqGoB8ynC7tt5TjtttnLcRUhmkQhRs3Uy62s3KpPF/+DPgE1DTSRTI3shge+
        zf85nwIILIBwTnLKCAs/asVkAdtg5oSpFbnX3u5bf6rY83vWn4PrmRxiMKMw083Whyf1z35n
        2Du5o+r7vRexG7cMdeaT3zttd4ed+5e1PkpavHTGkvxspZasWqp9Hq64uDyHKlh3quxoXPns
        hJNnH3av0hZpu3rrwa45LQ9ajB21PfFiVwEpbs30OY8tLx6wfmjwxmsIs56Pm4dLZv4vIobw
        YvMDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQmFydG9zeiwNCg0KSnVzdCBhIHNob3J0IG5vdGUgYXQgdGhpcyBwb2ludC4NCg0KT24g
TW9uLCAyMDE5LTEwLTIxIGF0IDE2OjM2ICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3Rl
Og0KPiBwb24uLCAyMSBwYcW6IDIwMTkgbyAwOTowMCBWYWl0dGluZW4sIE1hdHRpDQo+IDxNYXR0
aS5WYWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IG5hcGlzYcWCKGEpOg0KPiA+IE9uIFRodSwg
MjAxOS0xMC0xNyBhdCAxNDo0NSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4g
PiA+IGN6dy4sIDE3IHBhxbogMjAxOSBvIDExOjUzIE1hdHRpIFZhaXR0aW5lbg0KPiA+ID4gDQo+
ID4gPiA+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBiZDcxODI4X2dwaW8gPSB7DQo+
ID4gPiA+ICsgICAgICAgLmRyaXZlciA9IHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIC5uYW1l
ID0gImJkNzE4MjgtZ3BpbyINCj4gPiA+ID4gKyAgICAgICB9LA0KPiA+ID4gPiArICAgICAgIC5w
cm9iZSA9IGJkNzE4MjhfcHJvYmUsDQo+ID4gPiA+ICt9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICtt
b2R1bGVfcGxhdGZvcm1fZHJpdmVyKGJkNzE4MjhfZ3Bpbyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4g
K01PRFVMRV9BVVRIT1IoIk1hdHRpIFZhaXR0aW5lbiA8DQo+ID4gPiA+IG1hdHRpLnZhaXR0aW5l
bkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiA+ID4gIik7DQo+ID4gPiA+ICtNT0RVTEVfREVTQ1JJ
UFRJT04oIkJENzE4Mjggdm9sdGFnZSByZWd1bGF0b3IgZHJpdmVyIik7DQo+ID4gPiA+ICtNT0RV
TEVfTElDRU5TRSgiR1BMIik7DQo+ID4gPiANCj4gPiA+IERvbid0IHlvdSBuZWVkIGEgTU9EVUxF
X0FMSUFTKCkgaGVyZSBzaW5jZSB0aGlzIGlzIGFuIE1GRCBzdWItDQo+ID4gPiBtb2R1bGU/DQo+
ID4gDQo+ID4gSSBtdXN0IGFkbWl0IEkgZG9uJ3Qga25vdyB0aGUgZGV0YWlscyBvZiBob3cgbW9k
dWxlIGxvYWRpbmcgaXMNCj4gPiBkb25lLiBJDQo+ID4gdXNlZCBzeXN0ZW0gd2hlcmUgbW9kdWxl
cyBhcmUgbG9hZCBieSBzY3JpcHRzLiAoSSBndWVzcyB0aGUgbW9kdWxlDQo+ID4gYWxpYXMgY291
bGQgYmUgdXNlZCB0byBhbGxvdyBhdXRvbWF0aWMgbW9kdWxlIGxvYWRpbmcgW2J5IHVkZXY/XSkN
Cj4gPiANCj4gPiBDYW4geW91IHBsZWFzZSBlZHVjYXRlIG1lIC0gSWYgSSBhZGQgbW9kdWxlIGFs
aWFzZXMgbWF0Y2hpbmcgdGhlDQo+ID4gc3ViLQ0KPiA+IGRldmljZSBuYW1lIGdpdmVuIGluIGlu
IE1GRCBjZWxsIC0gc2hvdWxkIHRoZSBzdWIgbW9kdWxlIGxvYWRpbmcgYmUNCj4gPiBhdXRvbWF0
aWMgd2hlbiBNRkQgZHJpdmVyIGdldHMgcHJvYmVkPyBGb3Igc29tZSByZWFzb24gSSBkaWRuJ3Qg
Z2V0DQo+ID4gdGhhdCB3b3JraW5nIG9uIG15IHRlc3QgYmVkLiBPciBtYXliZSBJIG1pc3VuZGVy
c3Rvb2Qgc29tZXRoaW5nLg0KPiA+IA0KPiANCj4gSWYgdGhlIGdwaW8gbW9kdWxlIGlzIGEgc3Vi
LW5vZGUgb24gdGhlIGRldmljZSB0cmVlIHRoYW4geW91IG1heSBuZWVkDQo+IHRvIHVzZSBhIHN1
Yi1jb21wYXRpYmxlIHRvIGdldCB0aGUgbW9kdWxlIGxvYWRlZCBieSB1ZGV2Lg0KPiANCj4gQmFy
dA0KPiANCj4gPiBFZywgdGhpcyBzaG91bGQgYmUgZW5vdWdoIGZvciBHUElPIHN1Yi1tb2R1bGUg
dG8gYmUgYWxzbyBsb2FkOg0KPiA+IA0KPiA+IE1GRDoNCj4gPiBzdGF0aWMgc3RydWN0IG1mZF9j
ZWxsIGJkNzE4MjhfbWZkX2NlbGxzW10gPSB7DQo+ID4gICAgICAgICB7IC5uYW1lID0gImJkNzE4
MjgtcG1pYyIsIH0sDQo+ID4gICAgICAgICB7IC5uYW1lID0gImJkNzE4MjgtZ3BpbyIsIH0sDQo+
ID4gLi4uDQo+ID4gcmV0ID0gZGV2bV9tZmRfYWRkX2RldmljZXMoJmkyYy0+ZGV2LCBQTEFURk9S
TV9ERVZJRF9BVVRPLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJkNzE4MjhfbWZk
X2NlbGxzLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFSUkFZX1NJWkUoYmQ3MTgy
OF9tZmRfY2VsbHMpLCBOVUxMLCAwLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
Z21hcF9pcnFfZ2V0X2RvbWFpbihpcnFfZGF0YSkpOw0KPiA+IA0KPiA+IEdQSU8gZHJpdmVyOg0K
PiA+IE1PRFVMRV9BTElBUygicGxhdGZvcm06YmQ3MTgyOC1ncGlvIik7DQo+ID4gDQo+ID4gSSBo
YWQgdGhlIHN1Yi1kZXZpY2VzIHByb2JlZCBldmVuIHdpdGhvdXQgdGhlIE1PRFVMRV9BTElBUyAt
IGJ1dA0KPiA+IG1hbnVhbA0KPiA+IGxvYWRpbmcgaXMgcmVxdWlyZWQuIEkgd2lsbCBnbGFkbHkg
YWRkIHRoZSBhbGlhcyBpZiBpdCBzaG91bGQNCj4gPiBlbmFibGUNCj4gPiB0aGUgYXV0b21hdGlj
IG1vZHVsZSBsb2FkaW5nLg0KDQpJIGhhZCBzb21lIHByb2JsZW1zIHdpdGggbXkgdGVzdCBzZXR1
cC4gQWZ0ZXIgSSBmaXhlZCB0aG9zZSBJIHdhcyBhYmxlDQp0byB0ZXN0IHRoZSBhdXRvbWF0aWMg
bW9kdWxlIGxvYWRpbmcuIFRoZSBzdWItZGV2aWNlcyBkbyBub3QgbmVlZCBvd24NCmNvbXBhdGli
bGUgdG8gYmUgbG9hZCAtIHRoZXkgb25seSBuZWVkIHRoZSBjb3JyZWN0IG1vZHVsZV9hbGlhczoN
CiJwbGF0Zm9ybTpzdWItZGV2aWNlLW5hbWUtdXNlZC1pbi1tZmQtY2VsbCIuIElmIHRoaXMgaXMg
YWRkZWQsIHRoZQ0KbW9kdWxlIGZvciBzdWItZGV2aWNlIGlzIGxvYWQgd2hlbiBNRkQgY2VsbCB3
aXRoIG5hbWUgbWF0Y2hpbmcgdGhlDQphbGlhcyBpcyBpbnN0YW50aWF0ZWQuDQoNClNvIHRvIHlv
dXIgb3JpZ2luYWwgcXVlc3Rpb24gLSB5ZXMsIE1PRFVMRV9BTElBUygpIGlzIG5lZWRlZCBmb3IN
CmF1dG9tYXRlZCBsb2FkaW5nLiBObyBjb21wYXRpYmxlIGlzIHJlcXVpcmVkIHRoZW4gOikNCg0K
VGhhbmtzIGZvciBwb2ludGluZyBtZSB0byBjb3JyZWN0IGRpcmVjdGlvbiBoZXJlISBJdCdzIGFs
d2F5cyBuaWNlIHRvDQpsZWFybiBzb21ldGhpbmcgbmV3IQ0KDQpCciwNCglNYXR0aSBWYWl0dGlu
ZW4NCg==
