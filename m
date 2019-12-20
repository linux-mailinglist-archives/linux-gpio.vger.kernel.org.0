Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8C21275D2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2019 07:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfLTGdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Dec 2019 01:33:19 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:57220 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfLTGdT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2019 01:33:19 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-5e-5dfc6b2c7575
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 32.E9.08102.C2B6CFD5; Fri, 20 Dec 2019 07:33:16 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Fri, 20 Dec 2019 07:33:12 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
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
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v7 02/12] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Topic: [PATCH v7 02/12] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Index: AQHVtlEjPJdYWhzff0OqIDcPrX4s7KfBKG6AgABNp4CAAQs1gA==
Date:   Fri, 20 Dec 2019 06:33:11 +0000
Message-ID: <e734a11ed158814119256a3fac253a8574c90837.camel@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <702daeb9d8604e2feddd5f6f92b067a2d60d81ad.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <f9b0fbb7b898691d09ed8954e8df67cf3706aa96.camel@fi.rohmeurope.com>
         <20191219143647.GQ18955@dell>
In-Reply-To: <20191219143647.GQ18955@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C16384D061ADF49AF9CC3E5ACD4B484@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TW0wUVxjumZmdOaCDwwJy3GpTpxgDKojh4ZhSNRp0+lCLaXxRNzjIyG5g
        d8nsYqFGgzFaXazBlIZ25VLpgrig4iIoCK0hYLeoXKIgqKCrSINVCRFLEIKdYarwNN/83+1/
        +A8k9QO0AZqtDkm2iuk8HUhdr5j0rlqZNmVc3Z+/DLu7uhn8/atyBo8VtVH4J/8gjUta2nU4
        9+ZlHX5QW03hR29aAf737jEC50+dJfDoiQEdrimZAvhOQyGNa19cAPhG5V0al93rInBhmY/C
        XW0JuL+tlcZHmloYPN1zidoQJlQVVwFhpPcIIxRX7RfqXf2M4PUcp4WHPY208GfvFUIoKJ4g
        hIrKcUZ47f0kMXDHvPhk0bHvG3OqNWbd7nmmk6fPMxljwVm9nUE54GqwEwRAxMWhC2NvgRME
        Qj3XDdD0HwWM9uMD6NaQk3YCCGkuHjn7GNUQysUit+8ZpWpIrhyiU4f7Z4gQLhH1dPopTbQN
        +T0/Ag1vRG9uFc7MKW4Z+v3iDzoVs9xWdN7pmvHqOSeB7tfFqTiAi0KjnWWEigG3BB3PeTWD
        SS4ceYfGddrWHHI3dpAaDkPDT6f/n/OoaULdASr6SHSxIUaDG1DH4EYtZSnKz/Uz2gbB6K9f
        Bqk8sNA1p8A1a3bNml1zzK455l+BzgOQRTSnp4oOKTZaljKjZZvJonz22CxeoN3L2FXwrvnL
        ZkBA0AwWQYIPY5O/njLqg5JtKdkm0W5KkjPTJXszQJDkQ9kHxyaMejZFzP5Okm3vqY8hxYez
        y/2njHpO7UqTpAxJfs8uhpBH7JBJCQ2WpVQpa6853TFLEzBADQ80hNola4oki5kOU5J6HEl2
        5TpUar7SK5kVO2vPEC3KVLO2gRUwb7iolIQtRWWlpJ6y2qySIZyNUJs4VWrKtH4oeg7CIeBD
        2KNq0Hzl0XzIea5UEEoFjHyrVjjEWcqQA6oN69ZGnl7DX8t78vKsr71+nPzoN+u5Gsu72uVF
        B7ulyd7Xa2tLeE/fePzCiIT1PuO9AgcTtylockdfVuWh7d/68OaBUnuE+0CKf9dX1WcqPv1i
        ODtxm4cKe1nxz4JN23fGfFa35fM85ucRqWlJ4f3J1oTbNx+PYPeC8twtEVzr35uf8ZTdJMZG
        kbJd/A/V97ob8QMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUaHUsIDIwMTktMTItMTkgYXQgMTQ6MzYgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4g
T24gVGh1LCAxOSBEZWMgMjAxOSwgVmFpdHRpbmVuLCBNYXR0aSB3cm90ZToNCj4gDQo+ID4gSGVs
bG8gTWFyaywgTGVlLCBSb2INCj4gPiANCj4gPiBJIGp1c3Qgbm90aWNlZCB3ZSBoYXZlIGEgZGVw
ZW5kZW5jeSBoZXJlLiBUaGlzIGJpbmRpbmcgaXMgcmVmZXJyaW5nDQo+ID4gdG8NCj4gPiByZWd1
bGF0b3IgYmluZGluZyAtIHdoaWNoIHdhcyBhcHBsaWVkIGJ5IE1hcmsgYW5kIGlzIHRodXMgbWlz
c2luZw0KPiA+IGZyb20NCj4gPiB0aGUgc2VyaWVzLiBXaGF0J3MgdGhlIGJlc3Qgd2F5IGZvcndh
cmQ/DQo+ID4gDQo+ID4gT24gVGh1LCAyMDE5LTEyLTE5IGF0IDExOjQ2ICswMjAwLCBNYXR0aSBW
YWl0dGluZW4gd3JvdGU6DQo+ID4gPiBST0hNIEJENzE4MjggUG93ZXIgbWFuYWdlbWVudCBJQyBp
bnRlZ3JhdGVzIDcgYnVjayBjb252ZXJ0ZXJzLCA3DQo+ID4gPiBMRE9zLA0KPiA+ID4gYSByZWFs
LXRpbWUgY2xvY2sgKFJUQyksIDMgR1BPL3JlZ3VsYXRvciBjb250cm9sIHBpbnMsIEhBTEwgaW5w
dXQNCj4gPiA+IGFuZCBhIDMyLjc2OCBrSHogY2xvY2sgZ2F0ZS4NCj4gPiA+IA0KPiA+ID4gRG9j
dW1lbnQgdGhlIGR0IGJpbmRpbmdzIGRyaXZlcnMgYXJlIHVzaW5nLg0KPiA+ID4gDQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVy
b3BlLmNvbQ0KPiA+ID4gPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+DQo+ID4gPiAtLS0NCj4gPiA+IA0KPiA+ID4gTm8gY2hhbmdlcyBzaW5jZSB2Ng0K
PiA+IA0KPiA+IC8vc25pcA0KPiA+IA0KPiA+ID4gKyAgcmVndWxhdG9yczoNCj4gPiA+ICsgICAg
JHJlZjogLi4vcmVndWxhdG9yL3JvaG0sYmQ3MTgyOC1yZWd1bGF0b3IueWFtbA0KPiA+IA0KPiA+
IFRoaXMgZmlsZSBpcyBtaXNzaW5nIGZyb20gdGhlIHNlcmllcyBhbmQgaXMgYXBwbGllZCB0byBN
YXJrJ3MgdHJlZS4NCj4gDQo+IFNob3VsZG4ndCBtYXR0ZXIuICBJIGd1ZXNzIHRoZXkncmUgYWxs
IGhlYWRpbmcgZm9yIGhlIHNhbWUgcmVsZWFzZS4NCj4gDQpPay4gVGhhbmtzIGZvciBjbGFyaWZp
Y2F0aW9uLiBJIHdhcyBhc2tpbmcgdGhpcyBiZWNhdXNlIFJvYiBhc2tlZCBtZSB0bw0KcmVvcmRl
ciB0aGUgcGF0Y2hlcyBhIGZldyB2ZXJzaW9ucyBhZ28gc28gdGhhdCB0aGUgZHRfYmluZGluZ19j
aGVjaw0KTWFrZSB0YXJnZXQgd291bGQgbm90IGJlIGJyb2tlbiBiZXR3ZWVuIGNvbW1pdHMuIEhl
IGFza2VkIG1lIHRvIHN1Ym1pdA0KdGhlIHJlZ3VsYXRvciBhbmQgTEVEIGJpbmRpbmdzIGZpcnN0
IGFuZCBNRkQgKHdoaWNoIHJlZmVycyB0byB0aG9zZSkNCm9ubHkgYWZ0ZXIgdGhlbS4gVGh1cyBJ
IHdhcyB3b25kZXJpbmcgaWYgdGhlIGZpbmFsIG1lcmdlIG9yZGVyIG9mIE1GRA0KYW5kIHJlZ3Vs
YXRvciB0cmVlcyBpcyBzdWNoIHRoYXQgaXQgY2FuIHJlc3VsdCB0aGUgYnJlYWthZ2UgUm9iIGhv
cGVkDQp0byBhdm9pZC4gQnV0IEkgYW0gbW9yZSB0aGFuIGdsYWQgaWYgdGhlIHNlcmllcyBjYW4g
Z28gaW4gbGlrZSB0aGlzIDopDQoNClRoYW5rcyBhZ2FpbiBmb3IgYWxsIHRoZSBoZWxwIGd1eXMg
OikNCg0KQnIsDQoJTWF0dGkgDQo=
