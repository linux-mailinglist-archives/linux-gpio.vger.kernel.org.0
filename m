Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9D4DF091
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 16:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfJUO43 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 10:56:29 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:51512 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbfJUO43 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 10:56:29 -0400
X-AuditID: c0a8fbf4-183ff70000001fa6-18-5dadc719495a
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id D1.D0.08102.917CDAD5; Mon, 21 Oct 2019 16:56:25 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 21 Oct 2019 16:56:12 +0200
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
Thread-Index: AQHVhNC0M8qm8vzoP0yjRB+AhWv9dadepj4AgAXpHQCAAH9rgIAABXqA
Date:   Mon, 21 Oct 2019 14:56:11 +0000
Message-ID: <63a9fca56dbc174bf2c26eb602ba1c0c057488b0.camel@fi.rohmeurope.com>
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
x-originating-ip: [82.203.142.98]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C87ABB7EB9CD9C49908822B6FEB2A7F0@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUwTWRSGc2em08tHzVDBXupKwhhiXCPqasyNuoY/a8ZojMZENyJhBxlp
        FVqcaRU00e5m/aoYMYofFQrbgAJFXboiajBqBaworlUsEItKRI2Iui74FYk6w6Dw6773vuc9
        z/lxLiT1j2gjNFtsgmjhs1k6krpc+al2avy1k2nT3wVn4fLgPS3e+eq4Fg+UtFC4qLuHxqWN
        tzR4z40zGny/7m8KP3zbBPC7tl0EPjh4gsBvCh5o8D+lgwDfvVBM47q+UwA3e9toXNEeJHBx
        RYDCwZZfcFdLE423X2zU4s+hWioljqtx1wDudcd2Leeu2cKdd3VpOV/1bpoLhxpo7lpHPcEd
        dn8kuErvey3X70tYGrkqal4Gb9u43JxlmTb/tyhTaVkI5Dom5p3xnCIcoIB1ggiImFno6aXb
        lBNEQj0TAuj+2VZSvQQA6va/1jgBhDQzDzk7tUoglpmLXrbfJBRNMi6I9noTFD2WSUXFtR2U
        WrMa9fU/HtYLUP2BclLRFJOEGpyPhvromCVo38s/aJX1kUDhoqKhoghmGep3lw2FATMB7Xa8
        GoYZkO/pe406NYPKG/4lVR2Hnj/+PDQnYhLRm8poRZLMZHT6wjQ1mYLqap5Qqk5EB/d0D48Q
        g64f7aEKwTjXKIBrJO0alXaNSrtGpcuAphqgHN6cncXbhBnJomBPFq2mHPlYY83xAXVjBs6B
        L/6FfkBA4AfxkGDjdIb6k2n6MRnWzHwTL5nSRXu2IPkBgiQbqwtPlz1dJp+/WRCt36zxkGIN
        uknd+9P0jMJaLwi5gvjN/QFCFulAsxyMEYUsIW+tOds2YhMwQmkeaYyVBEumIPJ2myldWY90
        Sd4PxYqWua1NClfK5XPkVzXaAqbAwuclHhI2llR4SD1lsVoEo0EXUEoZpdRkt3wH9QIDBOxY
        XVhxo+Vv871Pr4wgZIQ33qsgbPyIZXSAwj8DUkpiPtH1IqqJS/YUtq9JyPqJnf1X3bptgYJn
        Zpu9jwv3ZkjLc5v/m2kPbfWkLjpS+f+hHl9BAjzwIt3nIGI7Sye0Ldi0ImnwU97iXSt9VTFz
        qtxL9s+88vN1aiC44aKlNaMq9cPVzdXOkqudFb/e/HLnxDFj39v43w/v8Glt51hKMvEzfiRF
        if8K25O4F/MDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhhbmtzIGFnYWluIEJhcnQgPSkNCg0KDQpPbiBNb24sIDIwMTktMTAtMjEgYXQgMTY6MzYgKzAy
MDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6DQo+IHBvbi4sIDIxIHBhxbogMjAxOSBvIDA5
OjAwIFZhaXR0aW5lbiwgTWF0dGkNCj4gPE1hdHRpLlZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNv
bT4gbmFwaXNhxYIoYSk6DQo+ID4gSGVsbG8gQmFydG9zeiwNCj4gPiANCj4gPiArDQo+ID4gPiA+
ICsgICAgICAgYmRncGlvLT5jaGlwLmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gPiA+ICsgICAgICAg
YmRncGlvLT5ncGlvLnBhcmVudCA9IHBkZXYtPmRldi5wYXJlbnQ7DQo+ID4gPiA+ICsgICAgICAg
YmRncGlvLT5ncGlvLmxhYmVsID0gImJkNzE4MjgtZ3BpbyI7DQo+ID4gPiA+ICsgICAgICAgYmRn
cGlvLT5ncGlvLm93bmVyID0gVEhJU19NT0RVTEU7DQo+ID4gPiA+ICsgICAgICAgYmRncGlvLT5n
cGlvLmdldF9kaXJlY3Rpb24gPSBiZDcxODI4X2dldF9kaXJlY3Rpb247DQo+ID4gPiA+ICsgICAg
ICAgYmRncGlvLT5ncGlvLnNldF9jb25maWcgPSBiZDcxODI4X2dwaW9fc2V0X2NvbmZpZzsNCj4g
PiA+ID4gKyAgICAgICBiZGdwaW8tPmdwaW8uY2FuX3NsZWVwID0gdHJ1ZTsNCj4gPiA+ID4gKyAg
ICAgICBiZGdwaW8tPmdwaW8uZ2V0ID0gYmQ3MTgyOF9ncGlvX2dldDsNCj4gPiA+ID4gKyAgICAg
ICBiZGdwaW8tPmdwaW8uc2V0ID0gYmQ3MTgyOF9ncGlvX3NldDsNCj4gPiA+IA0KPiA+ID4gTm90
IGltcGxlbWVudGluZyBkaXJlY3Rpb25fb3V0cHV0KCkgYW5kIGRpcmVjdGlvbl9pbnB1dCgpIGhl
cmUNCj4gPiA+IHdpbGwNCj4gPiA+IHJlc3VsdHMgaW4gd2FybmluZ3MgZnJvbSB0aGUgR1BJTyBm
cmFtZXdvcms6IGZvciBpbnN0YW5jZSB5b3UNCj4gPiA+IGltcGxlbWVudCBzZXQoKSBidXQgbm90
IGRpcmVjdGlvbl9vdXRwdXQoKS4gSSdkIHNheToganVzdCBhZGQNCj4gPiA+IHRob3NlDQo+ID4g
PiBjYWxsYmFja3MgYW5kIHJldHVybiBhbiBlcnJvciBpZiB0aGV5J3JlIGNhbGxlZCBmb3IgaW52
YWxpZCBsaW5lcw0KPiA+ID4gKGZvcg0KPiA+ID4gaW5zdGFuY2U6IGRpcmVjdGlvbl9vdXRwdXQo
KSBiZWluZyBjYWxsZWQgZm9yIGxpbmUgMykuDQo+ID4gDQo+ID4gT2suIEkgd2lsbCBpbXBsZW1l
bnQgZHVtbXkgZnVuY3Rpb25zLg0KPiA+IA0KPiA+IEJ1dCBvdXQgb2YgdGhlIGN1cmlvc2l0eSAt
IHdoeSB0aGUgR1BJTyBjb3JlIGVtaXRzIHRoZSB3YXJuaW5ncyBpZg0KPiA+IHRoZXNlIGFyZSBu
b3QgaW1wbGVtZW50ZWQ/IEkgdGhpbmsgdGhlIGNvcmUgc2hvdWxkIG5vdCByZXF1aXJlICJuby0N
Cj4gPiBvcGVyYXRpb24iIGZ1bmN0aW9ucyB0byBiZSBpbXBsZW1lbnRlZCBmb3IgcGlucyB3aGlj
aCBkb24ndCBzdXBwb3J0DQo+ID4gYm90aCBvZiB0aGUgZGlyZWN0aW9ucy4gR1BJTyBjb3JlIGNv
dWxkIG9ubHkgZW1pdCB3YXJuaW5nIGlmIGl0DQo+ID4gbmVlZHMNCj4gPiB0byBzZXQgZGlyZWN0
aW9uIHRvIHNvbWV0aGluZyB0aGUgSFcgZG9lcyBub3Qgc3VwcG9ydC4gVGhhdCB3b3VsZA0KPiA+
IGF2b2lkDQo+ID4gYWRkaW5nIHRoZSBkdW1teSBmdW5jdGlvbnMgdG8gYWxsIG9mIHRoZSBkcml2
ZXJzLCByaWdodD8NCj4gPiANCj4gDQo+IEkgbG9va2VkIGF0IHRoZSBjb2RlIGFnYWluIGFuZCBp
dCBzZWVtcyBJIHdhcyB3cm9uZy4gSWYgd2UgZG9uJ3QgaGF2ZQ0KPiBkaXJlY3Rpb25faW5wdXQo
KSBvciBkaXJlY3Rpb25fb3V0cHV0KCkgd2UgY2hlY2sgdGhlIGFjdHVhbCBkaXJlY3Rpb24NCj4g
d2l0aCBnZXRfZGlyZWN0aW9uKCkgYmVmb3JlIGVtaXR0aW5nIGFueSB3YXJuaW5ncyBhbmQgaWYg
dGhlcmUncyBubw0KPiBkaXJlY3Rpb25fb3V0cHV0KCksIGJ1dCBsaW5lIGlzIGluIGlucHV0IG1v
ZGUgdGhlbiBhbGwncyBmaW5lLiBJbg0KPiBvdGhlciB3b3JkczogZmFsc2UgYWxhcm0sIGFuZCB5
b3UgY2FuIGtlZXAgaXQgdGhpcyB3YXkuDQoNClRoYW5rcyBmb3IgY2xhcmlmeWluZyB0aGlzIC0g
aXQgbWFrZXMgc2Vuc2UgOikgSSB3b250IGNoYW5nZSB0aGlzIHRoZW4uDQoNCj4gPiA+IERvbid0
IHlvdSBuZWVkIGEgTU9EVUxFX0FMSUFTKCkgaGVyZSBzaW5jZSB0aGlzIGlzIGFuIE1GRCBzdWIt
DQo+ID4gPiBtb2R1bGU/DQo+ID4gDQo+ID4gSSBtdXN0IGFkbWl0IEkgZG9uJ3Qga25vdyB0aGUg
ZGV0YWlscyBvZiBob3cgbW9kdWxlIGxvYWRpbmcgaXMNCj4gPiBkb25lLiBJDQo+ID4gdXNlZCBz
eXN0ZW0gd2hlcmUgbW9kdWxlcyBhcmUgbG9hZCBieSBzY3JpcHRzLiAoSSBndWVzcyB0aGUgbW9k
dWxlDQo+ID4gYWxpYXMgY291bGQgYmUgdXNlZCB0byBhbGxvdyBhdXRvbWF0aWMgbW9kdWxlIGxv
YWRpbmcgW2J5IHVkZXY/XSkNCj4gPiANCj4gPiBDYW4geW91IHBsZWFzZSBlZHVjYXRlIG1lIC0g
SWYgSSBhZGQgbW9kdWxlIGFsaWFzZXMgbWF0Y2hpbmcgdGhlDQo+ID4gc3ViLQ0KPiA+IGRldmlj
ZSBuYW1lIGdpdmVuIGluIGluIE1GRCBjZWxsIC0gc2hvdWxkIHRoZSBzdWIgbW9kdWxlIGxvYWRp
bmcgYmUNCj4gPiBhdXRvbWF0aWMgd2hlbiBNRkQgZHJpdmVyIGdldHMgcHJvYmVkPyBGb3Igc29t
ZSByZWFzb24gSSBkaWRuJ3QgZ2V0DQo+ID4gdGhhdCB3b3JraW5nIG9uIG15IHRlc3QgYmVkLiBP
ciBtYXliZSBJIG1pc3VuZGVyc3Rvb2Qgc29tZXRoaW5nLg0KPiA+IA0KPiANCj4gSWYgdGhlIGdw
aW8gbW9kdWxlIGlzIGEgc3ViLW5vZGUgb24gdGhlIGRldmljZSB0cmVlIHRoYW4geW91IG1heSBu
ZWVkDQo+IHRvIHVzZSBhIHN1Yi1jb21wYXRpYmxlIHRvIGdldCB0aGUgbW9kdWxlIGxvYWRlZCBi
eSB1ZGV2Lg0KDQpKdXN0IGZvdW5kIG91dCB0aGF0IHRoZSBsYXN0IHVwZGF0ZSBicm9rZSBteSB0
ZXN0IGJlZCBJMkMgY29tcGxldGVseS4NCkknbGwgZXhwZXJpbWVudCB3aXRoIHRoZSBNT0RVTEVf
QUxJQVMgd2hlbiBJIGdldCBteSBib2FyZCBydW5uaW5nLi4uDQoNCkkgZG9uJ3Qgd2FudCB0byBh
ZGQgb3duIERUIG5vZGUgZm9yIGdwaW8gKGFuZCBhbGwgb3RoZXIgc3ViIGRldmljZXMpLg0KVGhh
dCBzaG91bGRuJ3QgYmUgbmVlZGVkLiBJdCByZWFsbHkgc2hvdWxkIGJlIGVub3VnaCB0byBraWNr
IHRoZSBNRkQNCnBhcnQgZnJvbSBEVCB1c2luZyB0aGUgY29tcGF0aWJsZSAtIHN1YmRldmljZXMg
c2hvdWxkIGJlIGxvYWQgYnkgTUZEDQp3aXRob3V0IGhhdmluZyBvd24gRFQgY29tcGF0aWJsZXMg
Zm9yIHRoZW0uIEJ1dCBJJ2xsIHNlZSBob3cgdGhpcyB3b3Jrcw0Kb3V0IC0gdGhhbmtzIQ0KDQpC
ciwNCglNYXR0aSBWYWl0dGluZW4NCg==
