Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F17F72FD
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2019 12:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfKKLVC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Nov 2019 06:21:02 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:61546 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfKKLVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Nov 2019 06:21:01 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-f6-5dc9441b5a58
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 78.7B.08102.B1449CD5; Mon, 11 Nov 2019 12:20:59 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 11 Nov 2019 12:20:47 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [RFC PATCH v3 01/15] mfd: bd71828: Support ROHM BD71828 PMIC -
 core
Thread-Topic: [RFC PATCH v3 01/15] mfd: bd71828: Support ROHM BD71828 PMIC -
 core
Thread-Index: AQHVkKelpOdu4i/TI0WwCDT0fH7Tc6eFy64AgAAGbIA=
Date:   Mon, 11 Nov 2019 11:20:46 +0000
Message-ID: <2353dd472559b3a398ca090356854bf795cece6d.camel@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <9ce6f5810847422f4def629d30bae7b43dd4c6c6.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <20191111105758.GF3218@dell>
In-Reply-To: <20191111105758.GF3218@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A1C97DB1C1AFB418E250ED28722D9BA@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIJsWRmVeSWpSXmKPExsVyYMXvTbrSLidjDW684rRYcvEqu0X7u2Xs
        Fl/mnmKxmPrwCZvF/CPnWC26T29htbi9dQOLxf2vRxktvl3pYLKY8mc5k8XHnnusFpvn/2G0
        uLxrDpvF1jfrGC2Orb7CZrH0+kUmizlLT7BYXDzlanH31FE2i9a9R9gt/l3byOIg6rFm3hpG
        j/c3Wtk95q2p9tg56y67x6ZVnWwed67tYfM4fmM7k8f0eT+ZPFas/s7u8XmTXABXFLdNUmJJ
        WXBmep6+XQJ3xrcet4Ib6hXdP6+wNjBeUeti5OSQEDCR+LD7JmMXIxeHkMBVRokXV5ezQDgn
        GCVmzTzE1sXIwcEmYCPRdZMdpEFEwFBiyYmnYDXMAks4JFZfu8EMkhAWCJL4dG8aK0RRsMT5
        79+hGqwkvlz/CFbDIqAqsXXLXxYQm1fAT2LLxxlMEMsOM0q8fv8DrJlTQFOi7dQZsCJGAVmJ
        zoZ3TCA2s4C4xKZn31khzhaQWLLnPDOELSrx8vE/qLiSxN6fD1lAjmYGmrN+lz5Eq4PE1I/n
        WSFsRYkp3Q/ZIW4QlDg58wnLBEaxWUg2zELonoWkexaS7llIuhcwsq5ilMhNzMxJTyxJNdQr
        Si3VK8rPyAVSyfm5mxghSebLDsb/hzwPMTJxMB5ilORgUhLl/bv+RKwQX1J+SmVGYnFGfFFp
        TmrxIUYJDmYlEd4dFUA53pTEyqrUonyYlDQHi5I4r/rDibFCAiC7slNTC1KLYLIyHBxKErx7
        HE7GCgkWpaanVqRl5pQgpJk4OEGGc0mJFKfmpaQWJZaWZMSD0kd8MTCBgKR4gPbucwJq5y0u
        SMwFikK0nmLU5pjwcu4iZo4jc5cuYhZiycvPS5US590JUioAUppRmge36BWjOAejkjDvQpAs
        DzDfwM15BbSCCWjFgbPHQFaUJCKkpBoYk09NuT79F/cWNa2SJ3M3fXtTa9mh+eZhmNzXEv7H
        i5Zs22FeX6zjULtxxuLvMqGOk6VlS4+K/20y4FqvuDbP4lFW/L2PZha3aucyWu66K73ftSPr
        U9q7nAT7vsrXCaFNOXvX1oi1myaXuaV9qfu1Z1ej1t+6FKMK9iNXpOuZWj5sd7voezhXiaU4
        I9FQi7moOBEAbpRVx/QDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXchDQoNCkkgd2FzIHNsaWdodGx5IHdv
cnJpZWQgSSByZWFsbHkgbWFuYWdlZCB0byBwaXNzIHlvdSBvZmYgbGFzdCB0aW1lIDopDQpHbGFk
IHRvIHNlZSBJIGRpZG4ndCBidXJuIGFsbCB0aGUgYnJpZGdlcyAoeWV0KSA7KQ0KDQpPbiBNb24s
IDIwMTktMTEtMTEgYXQgMTA6NTcgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4gT24gRnJpLCAw
MSBOb3YgMjAxOSwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiANCj4gPiBCRDcxODI4R1cgaXMg
YSBzaW5nbGUtY2hpcCBwb3dlciBtYW5hZ2VtZW50IElDIGZvciBiYXR0ZXJ5LXBvd2VyZWQNCj4g
PiBwb3J0YWJsZQ0KPiA+IGRldmljZXMuIFRoZSBJQyBpbnRlZ3JhdGVzIDcgYnVjayBjb252ZXJ0
ZXJzLCA3IExET3MsIGFuZCBhIDE1MDAgbUENCj4gPiBzaW5nbGUtY2VsbCBsaW5lYXIgY2hhcmdl
ci4gQWxzbyBpbmNsdWRlZCBpcyBhIENvdWxvbWIgY291bnRlciwgYQ0KPiA+IHJlYWwtdGltZQ0K
PiA+IGNsb2NrIChSVEMpLCAzIEdQTy9yZWd1bGF0b3IgY29udHJvbCBwaW5zLCBIQUxMIGlucHV0
IGFuZCBhIDMyLjc2OA0KPiA+IGtIeg0KPiA+IGNsb2NrIGdhdGUuDQo+ID4gDQo+ID4gQWRkIE1G
RCBjb3JlIGRyaXZlciBwcm92aWRpbmcgaW50ZXJydXB0IGNvbnRyb2xsZXIgZmFjaWxpdGllcyBh
bmQNCj4gPiBpMmMNCj4gPiBhY2Nlc3MgdG8gc3ViIGRldmljZSBkcml2ZXJzLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1l
dXJvcGUuY29tPg0KPiA+IC0tLQ0KPiA+IA0KPiA+IE5vIGNoYW5nZXMgY29tcGFyZWQgdG8gdjIN
Cj4gPiANCj4gPiAgZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgICAgICAgfCAgMTUgKysNCj4g
PiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDIgKy0NCj4gPiAgZHJpdmVy
cy9tZmQvcm9obS1iZDcxODI4LmMgICAgICAgfCAzMjIgKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiAgaW5jbHVkZS9saW51eC9tZmQvcm9obS1iZDcxODI4LmggfCA0MjUNCj4gPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUvbGludXgvbWZkL3JvaG0tZ2Vu
ZXJpYy5oIHwgICAxICsNCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCA3NjQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvcm9obS1i
ZDcxODI4LmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL3JvaG0t
YmQ3MTgyOC5oDQo+IA0KPiAvbWUgd29uZGVycyB3aHkgdGhpcyBpcyBzdGlsbCBhbiBSRkMgYWZ0
ZXIgMyByZXZpc2lvbnM/DQoNCkJlY2F1c2Ugb2YgdGhlIHJlZ3VsYXRvciBwYXJ0LiBJJ3ZlIGhh
ZCBubyBjb21tZW50cyBmb3IgaXQgLSBidXQgSQ0KZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGJlIGFw
cGxpZWQgYXMgaXMgaW4gdGhpcyBzZXJpZXMuIEkgd2FzIGtpbmQgb2YNCmhvcGluZyBzb21lb25l
IG1vcmUgZXhwZXJpZW5jZWQgY291bGQgaGF2ZSBwb2ludGVkIG1lIHRoYXQgd2hhdCBJIGhhdmUN
CnRyaWVkIHRvIGFjaGlldmUgaGVyZSBpcyBhbHJlYWR5IGhhbmRsZWQgYXMgPHNvbWV0aGluZyBJ
IGFtIG1pc3NpbmcNCm5vdz4uDQoNCkkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGFkZCBzeXNmcyBj
b250cm9sIElGIGZvciBkaXNhYmxpbmcgcmVndWxhdG9ycw0KKEkgd2lsbCBkcm9wIHRoYXQgY29t
cGxldGVseSBmcm9tIGZpcnN0IG5vbiBSRkMgcGF0Y2ggLSBidXQgSSBob3BlZCBJDQptaWdodCBn
ZXQgc29tZSBmcmllbmRseSBwb2tlcy9wdXNoZXMgdG8gcmlnaHQgZGlyZWN0aW9uKS4gTm9yIGFt
IEkNCmhhcHB5IG9uIGhvdyB0aGUgcnVuLXN0YXRlIHRyYW5zaXRpb25zIHdoaWNoIGltcGFjdCBt
YW55IHJlZ3VsYXRvcnMgYXJlDQpub3cgaGFuZGxlZCB2aWEgc2luZ2xlIHJlZ3VsYXRvciByZWZl
cmVuY2UgLSBidXQgSSBjYW4ndCB0aGluayBvZg0KYmV0dGVyIGFwcHJvYWNoIGp1c3Qgbm93LiBJ
IGhvcGVkIEkgYW0ganVzdCBtaXNzaW5nIHNvbWV0aGluZyB3aGljaCBpcw0Kb2J2aW91cyB0byBt
b3JlIGV4cGVyaWVuY2VkIHJlZ3VsYXRvciBndXlzLg0KDQpJZiBJIHdvbid0IGdldCBjb21tZW50
cyB0byByZWd1bGF0b3JzIEknbGwganVzdCBkcm9wIHRoZSBzeXNmcw0KaW50ZXJmYWNlcyAoYW5k
IHBvc3NpYmx5IHdob2xlIHJ1bi1sZXZlbCBjb250cm9sKSBhbmQgc2VuZCBzZXJpZXMNCndpdGhv
dXQgdGhlIFJGQyB0aGVuLiBCdXQgSSBhbSBzdGlsbCBjYXV0aW91c2x5IGhvcGVmdWwgdGhhdCBN
YXJrIGhhcw0KanVzdCBhIGV4dHJhb3JkaW5hcmlseSBidXN5IG1vbWVudCBhbmQgd2lsbCBnaXZl
IG1lIHNvbWUgZmVlZGJhY2sNCmJlZm9yZSBJIGZpbmlzaCB2NCA6KQ0KDQo+ID4gK3Vuc2lnbmVk
IGludCBiaXQwX29mZnNldHNbXSA9IHsxMX07CQkvKiBSVEMgSVJRDQo+ID4gcmVnaXN0ZXIgKi8N
Cj4gPiArdW5zaWduZWQgaW50IGJpdDFfb2Zmc2V0c1tdID0gezEwfTsJCS8qIFRFTVAgSVJRDQo+
ID4gcmVnaXN0ZXIgKi8NCj4gPiArdW5zaWduZWQgaW50IGJpdDJfb2Zmc2V0c1tdID0gezYsIDcs
IDgsIDl9OwkvKiBCQVQgTU9OIElSUQ0KPiA+IHJlZ2lzdGVycyAqLw0KPiA+ICt1bnNpZ25lZCBp
bnQgYml0M19vZmZzZXRzW10gPSB7NX07CQkvKiBCQVQgSVJRIHJlZ2lzdGVyICovDQo+ID4gK3Vu
c2lnbmVkIGludCBiaXQ0X29mZnNldHNbXSA9IHs0fTsJCS8qIENIRyBJUlEgcmVnaXN0ZXIgKi8N
Cj4gPiArdW5zaWduZWQgaW50IGJpdDVfb2Zmc2V0c1tdID0gezN9OwkJLyogVlNZUyBJUlEgcmVn
aXN0ZXIgKi8NCj4gPiArdW5zaWduZWQgaW50IGJpdDZfb2Zmc2V0c1tdID0gezEsIDJ9OwkJLyog
RENJTiBJUlENCj4gPiByZWdpc3RlcnMgKi8NCj4gDQo+IFNvbWV0aGluZyBhY3R1YWxseSB3cm9u
ZyB3aXRoIHRoZSB0YWJiaW5nIGhlcmUsIG9yIGlzIHRoaXMgYQ0KPiBHaXQvcGF0Y2gvbWFpbGVy
IGFub21hbHk/DQoNCkknbGwgY2hlY2sgdGhpcyAtIEkgbmVlZCB0byBzdGF0aWNpemUgdGhlc2Ug
YW55d2F5cy4NCg0KPiA+IA0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBi
ZDcxODI4X29mX21hdGNoW10gPSB7DQo+ID4gKwl7IC5jb21wYXRpYmxlID0gInJvaG0sYmQ3MTgy
OCIsIH0sDQo+ID4gKwl7IH0sDQo+ID4gK307DQo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2Ys
IGJkNzE4Mjhfb2ZfbWF0Y2gpOw0KPiA+ICsNCj4gPiArc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVy
IGJkNzE4MjhfZHJ2ID0gew0KPiA+ICsJLmRyaXZlciA9IHsNCj4gPiArCQkubmFtZSA9ICJyb2ht
LWJkNzE4MjgiLA0KPiA+ICsJCS5vZl9tYXRjaF90YWJsZSA9IGJkNzE4Mjhfb2ZfbWF0Y2gsDQo+
ID4gKwl9LA0KPiA+ICsJLnByb2JlID0gJmJkNzE4MjhfaTJjX3Byb2JlLA0KPiANCj4gSWYgJ2lk
JyBpc24ndCB1c2VkLCBwZXJoYXBzIHlvdSBzaG91bGQgYmUgdXNpbmcgcHJvYmUyPw0KDQpwcm9i
ZTI/IFNvdW5kcyBsaWtlIEkgbmVlZCB0byBkbyBteSBob21ld29yayBvbmNlIGFnYWluIDopIFRo
YW5rcyBmb3INCnRoZSBwb2ludGVyLg0KDQpSZXN0IG9mIHRoZSBjb21tZW50cyB3ZXJlIHByZXR0
eSBvYnZpb3VzIC0gdGhhbmtzLiBJJ2xsIGZpeCB0aGVzZSBmb3INCnY0Lg0KDQpCciwNCglNYXR0
aSANCg0K
