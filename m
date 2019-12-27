Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEEED12B399
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2019 10:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfL0Jnd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Dec 2019 04:43:33 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:52852 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfL0Jnc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Dec 2019 04:43:32 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-39-5e05d242b8aa
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 4C.78.08102.242D50E5; Fri, 27 Dec 2019 10:43:30 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Fri, 27 Dec 2019 10:43:25 +0100
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
Subject: Re: [PATCH v7 12/12] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
Thread-Topic: [PATCH v7 12/12] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
Thread-Index: AQHVtlJZu+ZgBKDQ/kGh/gU1BPf/i6fE8bMAgAjFD4A=
Date:   Fri, 27 Dec 2019 09:43:24 +0000
Message-ID: <75e9d581aef0127b4e24eb06b57ef397842cf7c9.camel@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <c95eb856c8e05a196551179c2416455c022eb3ea.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <20191221194802.GK32732@amd>
In-Reply-To: <20191221194802.GK32732@amd>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <33416C44855CEE488D9031465630B719@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0hUWRzv3Nccx+7umUnXo6XRSIVFL4g4hIUZC7c+LEZRy5Larbk5g+OM
        3RkrewpRqYW0YESDj13JitStxswcEmJytHQ38ZVGz2klK8SyNJkK657G0k/nd87v9f/wP5A1
        PhNioNXuUlS7bDMJeu7WxU9XFyV38mlLiwKx5FxHj44cHzqvIyOlrRw5HegXSHnTPZ6caLvG
        k4d1VzjydNQPyIfufIYUf77AkOGTT3hSW/4ZkC5viUDqBv8BpLmqWyCVvR0MKam8w5GO1l/J
        41a/QI42NunI+P2rXFKkVF1WDaQ3fUd1Uln1fqnB/VgneS4VCNKj+zcFqaWvnpHOlAUZ6WLV
        mE5674lL0f8Rnrhddu3eaM2wL1m9Ldzif3aZyX5p2Fv68YEuD1QbCkEYxGg5Lu5r5guBHhpR
        D8DXxv7jQpc7ALf5ghoDoYASceEDHTVEoDm49mSBQDUsug5xw4sehmpmoM24zRsf0mzBJWW1
        fAivxJ7hZpZiDs3Fnf7Bbzki+g3/3Xieo9iIbgN8ZPgAxWEoAb983vPNC1AsLsgbYihmURT2
        vBjjQ0MjfO5mOxvCkfjV/+MT7ybcGAxwdBxWy7nsXRKyJuFHA2cnYubg4hOBiREM+O7Zfu4U
        +MU9pcE96XZPcbunuN1T3H8B/hLAWbLVliG7lGWLVSVnseqwZGnHDkeWB4Q2ZuQG+OJb5wMM
        BD4QDRlTpNhZyacZf9ruMOdaZKclXc2xKU4fwJA1RYj2DI0TzXLuPkV1fKdmQs4UJc4P/Jlq
        RLQrU1GyFfU7OwtCExbXdmhGg6pkKHt3Wm2uSZqBYTRcHxPhVOxmRZVzXJZ0uh7pTm0/KDVd
        602mdtGZLWdpryFrK1gIT70qrWBhU2llBWvk7A67EhMlrqFSRKWWHPuPotcgCgLTDNFI2ena
        t/mR81qrYLSKYSNDK1zyJBWTBxJJPjTrkfPp9YKw9VsOv43L/Lc/tya1u2v8xpWGmpEV5Qm9
        A6PJG6P9NceqvG8q/HFJ24Y4f1F5e/Su8OX1q7a2jKacmZ19OL/IJpQMru2dtpCft8Gbcmhz
        +zEB+cXV9da+NHN8rGFP/O8H08z3PgYbU5OD3QOddR8OKdPe/bxvk4lzWuRlC1jVKX8FSFSW
        rvMDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBTYXQsIDIwMTktMTItMjEgYXQgMjA6NDggKzAxMDAsIFBhdmVsIE1hY2hlayB3cm90ZToN
Cj4gSGkhDQo+IA0KPiA+IFJPSE0gQkQ3MTgyOCBwb3dlciBtYW5hZ2VtZW50IElDIGhhcyB0d28g
TEVEIG91dHB1dHMgZm9yIGNoYXJnZQ0KPiA+IHN0YXR1cw0KPiA+IGFuZCBidXR0b24gcHJlc3Np
bmcgaW5kaWNhdGlvbnMuIFRoZSBMRUQgb3V0cHV0cyBjYW4gYWxzbyBiZSBmb3JjZWQNCj4gPiBi
eSBTVyBzbyBhZGQgZHJpdmVyIGFsbG93aW5nIHRvIHVzZSB0aGVzZSBMRURzIGZvciBvdGhlcg0K
PiA+IGluZGljYXRpb25zDQo+ID4gYXMgd2VsbC4NCj4gPiANCj4gPiBMZWRzIGFyZSBjb250cm9s
bGVkIGJ5IFNXIHVzaW5nICdGb3JjZSBPTicgYml0cy4gUGxlYXNlIG5vdGUgdGhlDQo+ID4gY29u
c3RyYWlucyBtZW50aW9uZWQgaW4gZGF0YS1zaGVldDoNCj4gPiAgICAgMS4gSWYgb25lIExFRCBp
cyBmb3JjZWQgT04gLSB0aGVuIGFsc28gdGhlIG90aGVyIExFRCBpcyBmb3JjZWQuDQo+ID4gICAg
ICAgICAgICAgPT4gWW91IGNhbid0IHVzZSBTVyBjb250cm9sIHRvIGZvcmNlIE9OIG9uZSBMRUQg
YW5kDQo+ID4gYWxsb3cgSFcNCj4gPiAgICAgICAgICAgICAgICB0byBjb250cm9sIHRoZSBvdGhl
ci4NCj4gPiAgICAgMi4gWW91IGNhbid0IGZvcmNlIGJvdGggTEVEcyBPRkYuIElmIHRoZSBGT1JD
RSBiaXQgZm9yIGJvdGgNCj4gPiBMRUQncyBpcw0KPiA+ICAgICAgICB6ZXJvLCB0aGVuIExFRHMg
YXJlIGNvbnRyb2xsZWQgYnkgSFcgYW5kIGluZGljYXRlDQo+ID4gYnV0dG9uL2NoYXJnZXINCj4g
PiAgICAgICAgc3RhdGVzIGFzIGV4cGxhaW5lZCBpbiBkYXRhLXNoZWV0Lg0KPiANCj4gVGhhdCdz
IHJlYWxseSBxdWl0ZSBzYWQsIGlzIGl0Pw0KPiANCj4gQWxsIHRoZSBlZmZvcnQgYW5kIGFsbCB3
ZSBnb3QgaXMgLi4uIG9uZSB3b3JraW5nIExFRC4gQmVjYXVzZQ0KPiBoYXJkd2FyZQ0KPiBkb2Vz
IG5vdCBhbGxvdyB5b3UgdG8gY29udHJvbCBib3RoIExFRHMuLi4NCg0KWWVzIGFuZCBuby4gSSBk
byBmdWxseSBhZ3JlZSB0aGF0IGl0IHdvdWxkIGJlIG11Y2ggbmljZXIgaWYgdGhlIExFRHMNCmNv
dWxkIGJlIHNldCB0byBiZSBmdWxseSBjb250cm9sbGVkIGJ5IFNXLiBPVE9ILCBrbm93aW5nIHRo
ZSBMRURzIGFyZQ0KdXN1YWxseSBPRkYsIHVzaW5nIHRoZW0gdG8gaW5kaWNhdGUgc29tZXRoaW5n
IGVsc2UgaXMgc3RpbGwgZG9hYmxlLiBJDQp0aGluayB5b3Uga25vdyB0eXBpY2FsIExFRCB1c2Ut
Y2FzZXMgYmV0dGVyIHRoYW4gSSBkbyAtIGJ1dCBJIGd1ZXNzDQp0aGF0IHNvbWUgYmxpbmsgcGF0
dGVybiBpbiBvcmRlciB0byBpbmRpY2F0ZSBlcnJvcnMgaXMgd2VsbCBkb2FibGUgd2l0aA0KdGhl
c2UgTEVEcy4NCg0KPiAuLi5hbmQgd2UgZG9uJ3QgZXZlbiBoYXZlIHN1cHBvcnQgc2VsZWN0aW5n
IGlmIHRoZSBMRUQgc2hvdWxkIGJlIHN3DQo+IG9yDQo+IGh3IGNvbnRyb2xsZWQgaW4gdGhlIG1h
aW5saW5lLCB5ZXQuLi4NCg0KV2hpY2ggc291bmRzIGxpa2Ugd2UgaGF2ZSBzdWNoIHN1cHBvcnQg
c29tZXdoZXJlIC0gYW5kIGhvcGVmdWxseSBpbg0KbWFpbmxpbmUgb25lIGRheSA7KQ0KDQpBbnl3
YXlzLCBUaGFua3MgZm9yIHRha2luZyBhIGxvb2sgYXQgdGhpcyEgOikNCg0KQnIsDQoJTWF0dGkg
VmFpdHRpbmVuDQo=
