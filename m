Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 185BCF1C72
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 18:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729384AbfKFR0S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 12:26:18 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:44998 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727572AbfKFR0S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 12:26:18 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-3b-5dc302370ffe
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 75.2E.08102.73203CD5; Wed,  6 Nov 2019 18:26:15 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 6 Nov 2019 18:26:14 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "simon.guinot@sequanux.org" <simon.guinot@sequanux.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH 13/62] gpio: gpio-f7188x: Use new GPIO_LINE_DIRECTION
Thread-Topic: [PATCH 13/62] gpio: gpio-f7188x: Use new GPIO_LINE_DIRECTION
Thread-Index: AQHVk8IIs7vdKnF54E63iVBGE/Lbsqd9j4QAgAATogCAAGLBgIAAUGSA
Date:   Wed, 6 Nov 2019 17:26:13 +0000
Message-ID: <8df22ad23d298ad04f5e3fbabf9bdb020b93c981.camel@fi.rohmeurope.com>
References: <cover.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
         <0a1fe4365ef599adde42396f0bb735c8623f679c.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
         <20191106053446.GD5290@kw.sim.vm.gnt>
         <c7cc7d66a5d3e398bf5109f58260e9dca5a317df.camel@fi.rohmeurope.com>
         <CAMuHMdXQ_MP0j1saU1KdQwG5ooA5N5x0=MjJJX+p4EN1e11K-A@mail.gmail.com>
In-Reply-To: <CAMuHMdXQ_MP0j1saU1KdQwG5ooA5N5x0=MjJJX+p4EN1e11K-A@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [176.93.194.151]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2264EE6FC82FC4C8F7A50CDA72C8F61@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTURjHO/fe3V2nq+vUdloluUqxyBeyHCRhETEVzLJPodk1b27oNrnb
        QoXAIN8pLe1DQ/OlNOmLOHOVzsjp8hVDxJdmfZBC0NKMaUZKdk83Xz6d5zz/5//8Hs55KFxW
        SCoord7EcnomU0lKiLdNq9ZjkVh3cljNqKdqqXqAUM24OjFV5dozTNVaswZUo+1VpKqqoY9Q
        TfS8waLF6u+T+WL1a8snsfrjuJ1UO7qLgLpg4jGpdlv9E8grnlGpjOlmojZdH3r6mqemZmIe
        zyoIyv7aOY3ngTuBJcCDgnQE7GhtxUqAhJLRYwDW2hbFwqUXwL6VVrIEUBRJR8GSD2Jk8KXD
        YdOgC6AanJ7BYEfzrAgJPnQMtN7+JRKKYuHcYJ0IeX3p89A2rkVpgj4Ee21tJIqldDwcHc7H
        BZYLg40/3mFI8KAvwuK7DwgUA3o/LM5b+JfHaTm0zqyIhKlp+NT+HhdiPzj7+c//vBK6+ywY
        4uJ0MGxuDxXCaNhbnSB0CYCVpdNiYQRv2P/oC1EOdlu2ASxbZsuW2bLNbNlmrgWi5wDqGG1m
        OmNiw0M41hzCGTQ6/rhu0FmB8LFLr8C6I8YBMAo4wB4KU/pJjzscybKdqYa0HA1j1KRw5kzW
        6ACQwpW+0qR7XckyaRqTk8tyhg1pL0Uo5dKg6fvJMhqxMlg2i+U21H0UpYTSh+t8U2+OTWez
        b2gzTVsyRnmg5hKFr5HVp7EcYzZpUtB2pBj59UCSF8/ldnTzXGMWo+OzgnUAHKXKZ6vrcaqn
        uqEelxF6g55VyKV1qJRGpRqzfhM0B+QUUPpIO5HqxW/3Zp85HoHxiLBJB0KYmC1JkQcU1qRg
        W+CE11Suu3TksqxluZB/XeeF3N9VFT/POjH5sHihLaAI9xRfPeB/KfDW4suDQfVTCZK4oYgT
        h9cj7EGF/pFDYxVPGmNg6FKl/Ftf7KmB+QXJLndZ4aozqbgirrHsZFWAq+vFSL8ta1nhPFMU
        P5SRODRSfM5f1uJWW+1Kwqhhwo/gnJH5C+uPGseaAwAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNCk9uIFdlZCwgMjAxOS0xMS0wNiBhdCAxMzozOCArMDEwMCwgR2VlcnQg
VXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBIaSBNYXR0aSwNCj4gDQo+IE9uIFdlZCwgTm92IDYsIDIw
MTkgYXQgNzo0NSBBTSBWYWl0dGluZW4sIE1hdHRpDQo+IDxNYXR0aS5WYWl0dGluZW5AZmkucm9o
bWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAxOS0xMS0wNiBhdCAwNjozNCArMDEw
MCwgU2ltb24gR3Vpbm90IHdyb3RlOg0KPiA+ID4gT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTI6
MTY6MDNQTSArMDIwMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiA+ID4gPiBJdCdzIGhhcmQg
Zm9yIG9jY2FzaW9uYWwgR1BJTyBjb2RlIHJlYWRlci93cml0ZXIgdG8ga25vdyBpZg0KPiA+ID4g
PiB2YWx1ZXMNCj4gPiA+ID4gMC8xDQo+ID4gPiA+IGVxdWFsIHRvIElOIG9yIE9VVC4gVXNlIGRl
ZmluZWQgR1BJT19MSU5FX0RJUkVDVElPTl9JTiBhbmQNCj4gPiA+ID4gR1BJT19MSU5FX0RJUkVD
VElPTl9PVVQgdG8gaGVscCB0aGVtIG91dC4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IE1hdHRpIFZhaXR0aW5lbiA8DQo+ID4gPiA+IG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVy
b3BlLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2ZXJzL2dwaW8vZ3Bpby1mNzE4OHgu
YyB8IDUgKysrKy0NCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8v
Z3Bpby1mNzE4OHguYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLQ0KPiA+ID4gPiBmNzE4OHguYw0KPiA+
ID4gPiBpbmRleCBmZGM2MzlmODU2ZjEuLmNhZGQwMjk5MzUzOSAxMDA2NDQNCj4gPiA+ID4gLS0t
IGEvZHJpdmVycy9ncGlvL2dwaW8tZjcxODh4LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncGlv
L2dwaW8tZjcxODh4LmMNCj4gPiA+ID4gQEAgLTI1MCw3ICsyNTAsMTAgQEAgc3RhdGljIGludA0K
PiA+ID4gPiBmNzE4OHhfZ3Bpb19nZXRfZGlyZWN0aW9uKHN0cnVjdA0KPiA+ID4gPiBncGlvX2No
aXAgKmNoaXAsIHVuc2lnbmVkIG9mZnNldCkNCj4gPiA+ID4gDQo+ID4gPiA+ICAgICBzdXBlcmlv
X2V4aXQoc2lvLT5hZGRyKTsNCj4gPiA+ID4gDQo+ID4gPiA+IC0gICByZXR1cm4gIShkaXIgJiAx
IDw8IG9mZnNldCk7DQo+ID4gPiA+ICsgICBpZiAoZGlyICYgMSA8PCBvZmZzZXQpDQo+ID4gPiA+
ICsgICAgICAgICAgIHJldHVybiBHUElPX0xJTkVfRElSRUNUSU9OX09VVDsNCj4gPiA+ID4gKw0K
PiA+ID4gPiArICAgcmV0dXJuIEdQSU9fTElORV9ESVJFQ1RJT05fSU4NCj4gPiA+IA0KPiA+ID4g
SGkgTWF0dGksDQo+ID4gPiANCj4gPiA+IEkgYW0gcHJvYmFibHkgbWlzc2luZyBzb21ldGhpbmcg
YnV0IEkgY2FuJ3QgZmluZA0KPiA+ID4gR1BJT19MSU5FX0RJUkVDVElPTl9JTg0KPiA+ID4gYW5k
IEdQSU9fTElORV9ESVJFQ1RJT05fT1VUIGRlZmluZWQgYW55d2hlcmUuDQo+ID4gDQo+ID4gU29y
cnkuIEkgYWNjaWRlbnRhbGx5IHNlbnQgdGhlIHBhdGNoIDAxLzYyIHRvIGxpbWl0ZWQgYXVkaWVu
Y2UgLQ0KPiA+IGFuZA0KPiA+IGFsc28gbWVzc2VkIHVwIHRoZSBtZXNzYWdlLUlEIGZyb20gdGhl
IHNlcmllcyBzbyB0aHJlYWRpbmcgbWVzc2FnZXMNCj4gPiBpcw0KPiA+IHByb2JhYmx5IG5vdCB3
b3JraW5nIDooIEkgZGlkIHJlc2VuZCB0aGUgcGF0Y2ggYWRkaW5nIGRlZmluZXMgdG8NCj4gPiBh
bGwNCj4gPiByZXZpZXdlcnMgeWVzdGVyZGF5IC0gdGl0bGUgc2hvdWxkIGJlICJbUkVTRU5EIFBB
VENIIDAxLzYyXSBncGlvOg0KPiA+IEFkZA0KPiA+IGRlZmluaXRpb24gZm9yIEdQSU8gZGlyZWN0
aW9uIi4NCj4gPiANCj4gPiA+IEJlc2lkZXMgSSBhbSBhbiBvY2Nhc2lvbmFsIGNvZGUgcmVhZGVy
L3dyaXRlciBhbmQgSSBmaW5kIHRoZQ0KPiA+ID4gb3JpZ2luYWwNCj4gPiA+IGNvZGUgZWFzeSB0
byB1bmRlcnN0YW5kLg0KPiA+IA0KPiA+IEdsYWQgdG8gaGVhciB0aGF0LiBXaGVuIEkgcmVhZCBj
b2RlOg0KPiA+IA0KPiA+IHJldHVybiAhKGRpciAmIDEgPDwgb2Zmc2V0KTsNCj4gPiANCj4gPiBJ
dCdzIGltcG9zc2libGUgZm9yIG1lIHRvIHRlbGwgaWYgZGlyIGhhdmluZyBiaXQgYXQgb2Zmc2V0
ICdvZmZzZXQnDQo+ID4gc2V0DQo+ID4gbWVhbnMgSU4gb3IgT1VUIC0gSSBrbm93IHRoZSBtZWFu
aW5nIG9mIGNvZGUsIGl0IGNoZWNrcyB0aGlzIGJpdA0KPiA+IGZvcg0KPiA+IGluL291dCAtIGJ1
dCB3aGljaCBkaXIgdmFsdWUgaXMgSU4gYW5kIHdoaWNoIGlzIE9VVD8NCj4gPiANCj4gPiBXaGVu
IHRoaXMgaXMgd3JpdHRlbiBhczoNCj4gPiANCj4gPiAgICAgICAgIGlmIChkaXIgJiAxIDw8IG9m
ZnNldCkNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIEdQSU9fTElORV9ESVJFQ1RJT05fT1VU
Ow0KPiA+IA0KPiA+ICAgICAgICAgcmV0dXJuIEdQSU9fTElORV9ESVJFQ1RJT05fSU4NCj4gPiAN
Cj4gPiBpdCBnZXQncyBxdWl0ZSBvYnZpb3VzIGV2ZW4gZm9yIG1lIHRoYXQgaGF2aW5nIHRoZSBt
YXRjaGluZyBiaXQgc2V0DQo+ID4gbWVhbnMgZGlyZWN0aW9uIHRvIGJlIE9VVC4NCj4gDQo+ICJz
dWdnZXN0IHBhcmVudGhlc2VzIGFyb3VuZC4uLiAiIHdhcm5pbmc/DQoNCkkgZG9uJ3QgdGhpbmsg
SSBzYXcgdGhhdC4gQWxzbywgc2ltcGxlIHRlc3Q6DQoNCiNpbmNsdWRlIDxzdGRpby5oPg0KDQpp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQ0Kew0KDQoJaW50IG9mZnNldCA9IGFyZ2M7
DQoNCglpZiAoNCAmIDEgPDwgb2Zmc2V0KQ0KCQlwcmludGYoImZvb1xuIik7DQoNCglwcmludGYo
IiVkIiwgISg0ICYgMSA8PCBvZmZzZXQpKTsNCglyZXR1cm4gISg0ICYgMSA8PCBvZmZzZXQpOw0K
DQp9DQoNCmFuZCBidWlsZGluZyB3aXRoIGdjYyAtV2FsbCBkb2VzIG5vdCBzaG93IGFueSB3YXJu
aW5ncy4NCg0Kbm9yIGRpZCBjb21waWxhdGlvbiBmb3IgdGhlIGRyaXZlcjoNClttdmFpdHRpbkBs
b2NhbGhvc3QgbGludXhdJCBtYWtlIEFSQ0g9YXJtIENST1NTX0NPTVBJTEU9JHtDQ30NCkxPQURB
RERSPTB4ODAwMDgwMDAgDQogIENBTEwgICAgc2NyaXB0cy9jaGVja3N5c2NhbGxzLnNoDQogIENB
TEwgICAgc2NyaXB0cy9hdG9taWMvY2hlY2stYXRvbWljcy5zaA0KICBDSEsgICAgIGluY2x1ZGUv
Z2VuZXJhdGVkL2NvbXBpbGUuaA0KICBDQyBbTV0gIGRyaXZlcnMvZ3Bpby9ncGlvLWY3MTg4eC5v
DQogIEtlcm5lbDogYXJjaC9hcm0vYm9vdC9JbWFnZSBpcyByZWFkeQ0KICBLZXJuZWw6IGFyY2gv
YXJtL2Jvb3QvekltYWdlIGlzIHJlYWR5DQogIEJ1aWxkaW5nIG1vZHVsZXMsIHN0YWdlIDIuDQog
IE1PRFBPU1QgMTI4MiBtb2R1bGVzDQogIExEIFtNXSAgZHJpdmVycy9ncGlvL2dwaW8tZjcxODh4
LmtvDQpbbXZhaXR0aW5AbG9jYWxob3N0IGxpbnV4XSQgDQoNCg0KSW4gYW55IGNhc2UsIG15IGlu
dGVudGlvbiB3YXMgdG8ga2VlcCB0aGUgbG9naWMgZXhhY3RseSBzYW1lIC0gZXhjZXB0DQpmb3Ig
dGhlIGRvY3VtZW50ZWQgY2hhbmdlIGZvciBjYXNlcyB3aGVyZSBJIGNoYW5nZWQgYml0LXBvc2l0
aW9uDQpzcGVjaWZpYyByZXR1cm4gdmFsdWUgdG8gMS4NCg0KQnIsDQoJTWF0dGkgVmFpdHRpbmVu
DQo=
