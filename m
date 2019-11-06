Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9215BF0F1B
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 07:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbfKFGpF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 01:45:05 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:48074 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfKFGpF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 01:45:05 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-41-5dc26bef4139
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 35.4A.08102.FEB62CD5; Wed,  6 Nov 2019 07:45:03 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 6 Nov 2019 07:44:59 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "simon.guinot@sequanux.org" <simon.guinot@sequanux.org>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH 13/62] gpio: gpio-f7188x: Use new GPIO_LINE_DIRECTION
Thread-Topic: [PATCH 13/62] gpio: gpio-f7188x: Use new GPIO_LINE_DIRECTION
Thread-Index: AQHVk8IIs7vdKnF54E63iVBGE/Lbsqd9j4QAgAATogA=
Date:   Wed, 6 Nov 2019 06:44:59 +0000
Message-ID: <c7cc7d66a5d3e398bf5109f58260e9dca5a317df.camel@fi.rohmeurope.com>
References: <cover.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
         <0a1fe4365ef599adde42396f0bb735c8623f679c.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
         <20191106053446.GD5290@kw.sim.vm.gnt>
In-Reply-To: <20191106053446.GD5290@kw.sim.vm.gnt>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <65F99CB176F5DD45BF14547D1568950D@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsVyYMXvTbrvsw/FGpz8pWnxZe4pFospf5Yz
        WWye/4fR4vKuOWwWc5aeYLG4fmQfkwObx/sbreweO2fdZfe4c20Pm0fb9XlsHp83yQWwRnHb
        JCWWlAVnpufp2yVwZ9xqfcxS8ESs4uKZVcwNjDPEuhg5OSQETCRmzP/MDmILCVxllLgwpRzC
        Ps4oce9dWRcjBwebgI1E102wEhEBa4nrH2+wdDFycTALrGaSODJ9BRtIQljAU2JT4w9WiCIv
        iVenF0LZVhLNByYxgcxhEVCReNfjBRLmFfCTaFm3jBFkjpDAGUaJW0/+M4MkOAWMJHrWbmME
        sRkFZCU6G94xgdjMAuISm559Z4W4WUBiyZ7zzBC2qMTLx/+g4koSe38+ZAHZxSygKbF+lz5E
        q4PE/tmvWCFsRYkp3Q/ZIW4QlDg58wnLBEaxWUg2zELonoWkexaS7llIuhcwsq5ilMhNzMxJ
        TyxJNdQrSi3VK8rPyAVSyfm5mxgh0fllB+P/Q56HGJk4GA8xSnIwKYnyemUejBXiS8pPqcxI
        LM6ILyrNSS0+xCjBwawkwhvTB5TjTUmsrEotyodJSXOwKInzqj+cGCskALIrOzW1ILUIJivD
        waEkwfsj81CskGBRanpqRVpmTglCmomDE2Q4l5RIcWpeSmpRYmlJRjwodcQXA5MHSIoHaK9L
        FlA7b3FBYi5QFKL1FKM2x4SXcxcxcxyZu3QRsxBLXn5eqpQ4rxBIqQBIaUZpHtyiV4ziHIxK
        wrzXQLI8wDQNN+cV0AomoBU+j/eBrChJREhJNTDu6HlZN4VPaeNqi5d2H5+/eZJ+/eCn3COC
        51Y/UvAOOLzj0f43SqXxqQwzr5cLTRVlcls5Q/vKDJ7X57TeSm9wjmxS4n4lVnfyxmRLIUe1
        l+8m/n+3qkBm6zO5f0sb232XZBSVWn8rmZpj6lDhxxBvLGN5UfF2GHPkwq7NIqtCpR/Na3tq
        cvatEktxRqKhFnNRcSIAhw7HvpADAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

TW9ybmluZyBTaW1vbiwNCg0KT24gV2VkLCAyMDE5LTExLTA2IGF0IDA2OjM0ICswMTAwLCBTaW1v
biBHdWlub3Qgd3JvdGU6DQo+IE9uIFR1ZSwgTm92IDA1LCAyMDE5IGF0IDEyOjE2OjAzUE0gKzAy
MDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiBJdCdzIGhhcmQgZm9yIG9jY2FzaW9uYWwg
R1BJTyBjb2RlIHJlYWRlci93cml0ZXIgdG8ga25vdyBpZiB2YWx1ZXMNCj4gPiAwLzENCj4gPiBl
cXVhbCB0byBJTiBvciBPVVQuIFVzZSBkZWZpbmVkIEdQSU9fTElORV9ESVJFQ1RJT05fSU4gYW5k
DQo+ID4gR1BJT19MSU5FX0RJUkVDVElPTl9PVVQgdG8gaGVscCB0aGVtIG91dC4NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2ht
ZXVyb3BlLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncGlvL2dwaW8tZjcxODh4LmMgfCA1
ICsrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tZjcxODh4LmMgYi9k
cml2ZXJzL2dwaW8vZ3Bpby0NCj4gPiBmNzE4OHguYw0KPiA+IGluZGV4IGZkYzYzOWY4NTZmMS4u
Y2FkZDAyOTkzNTM5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvLWY3MTg4eC5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tZjcxODh4LmMNCj4gPiBAQCAtMjUwLDcgKzI1
MCwxMCBAQCBzdGF0aWMgaW50IGY3MTg4eF9ncGlvX2dldF9kaXJlY3Rpb24oc3RydWN0DQo+ID4g
Z3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBvZmZzZXQpDQo+ID4gIA0KPiA+ICAJc3VwZXJpb19l
eGl0KHNpby0+YWRkcik7DQo+ID4gIA0KPiA+IC0JcmV0dXJuICEoZGlyICYgMSA8PCBvZmZzZXQp
Ow0KPiA+ICsJaWYgKGRpciAmIDEgPDwgb2Zmc2V0KQ0KPiA+ICsJCXJldHVybiBHUElPX0xJTkVf
RElSRUNUSU9OX09VVDsNCj4gPiArDQo+ID4gKwlyZXR1cm4gR1BJT19MSU5FX0RJUkVDVElPTl9J
Tg0KPiANCj4gSGkgTWF0dGksDQo+IA0KPiBJIGFtIHByb2JhYmx5IG1pc3Npbmcgc29tZXRoaW5n
IGJ1dCBJIGNhbid0IGZpbmQNCj4gR1BJT19MSU5FX0RJUkVDVElPTl9JTg0KPiBhbmQgR1BJT19M
SU5FX0RJUkVDVElPTl9PVVQgZGVmaW5lZCBhbnl3aGVyZS4NCg0KU29ycnkuIEkgYWNjaWRlbnRh
bGx5IHNlbnQgdGhlIHBhdGNoIDAxLzYyIHRvIGxpbWl0ZWQgYXVkaWVuY2UgLSBhbmQNCmFsc28g
bWVzc2VkIHVwIHRoZSBtZXNzYWdlLUlEIGZyb20gdGhlIHNlcmllcyBzbyB0aHJlYWRpbmcgbWVz
c2FnZXMgaXMNCnByb2JhYmx5IG5vdCB3b3JraW5nIDooIEkgZGlkIHJlc2VuZCB0aGUgcGF0Y2gg
YWRkaW5nIGRlZmluZXMgdG8gYWxsDQpyZXZpZXdlcnMgeWVzdGVyZGF5IC0gdGl0bGUgc2hvdWxk
IGJlICJbUkVTRU5EIFBBVENIIDAxLzYyXSBncGlvOiBBZGQNCmRlZmluaXRpb24gZm9yIEdQSU8g
ZGlyZWN0aW9uIi4NCg0KPiBCZXNpZGVzIEkgYW0gYW4gb2NjYXNpb25hbCBjb2RlIHJlYWRlci93
cml0ZXIgYW5kIEkgZmluZCB0aGUgb3JpZ2luYWwNCj4gY29kZSBlYXN5IHRvIHVuZGVyc3RhbmQu
DQoNCkdsYWQgdG8gaGVhciB0aGF0LiBXaGVuIEkgcmVhZCBjb2RlOg0KDQpyZXR1cm4gIShkaXIg
JiAxIDw8IG9mZnNldCk7DQoNCkl0J3MgaW1wb3NzaWJsZSBmb3IgbWUgdG8gdGVsbCBpZiBkaXIg
aGF2aW5nIGJpdCBhdCBvZmZzZXQgJ29mZnNldCcgc2V0DQptZWFucyBJTiBvciBPVVQgLSBJIGtu
b3cgdGhlIG1lYW5pbmcgb2YgY29kZSwgaXQgY2hlY2tzIHRoaXMgYml0IGZvcg0KaW4vb3V0IC0g
YnV0IHdoaWNoIGRpciB2YWx1ZSBpcyBJTiBhbmQgd2hpY2ggaXMgT1VUPw0KDQpXaGVuIHRoaXMg
aXMgd3JpdHRlbiBhczoNCg0KCWlmIChkaXIgJiAxIDw8IG9mZnNldCkNCgkJcmV0dXJuIEdQSU9f
TElORV9ESVJFQ1RJT05fT1VUOw0KDQoJcmV0dXJuIEdQSU9fTElORV9ESVJFQ1RJT05fSU4NCg0K
aXQgZ2V0J3MgcXVpdGUgb2J2aW91cyBldmVuIGZvciBtZSB0aGF0IGhhdmluZyB0aGUgbWF0Y2hp
bmcgYml0IHNldA0KbWVhbnMgZGlyZWN0aW9uIHRvIGJlIE9VVC4NCg0KQmVzdCBSZWdhcmRzDQoJ
TWF0dGkgVmFpdHRpbmVuDQoNCg==
