Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 343E715D8E1
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 15:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbgBNOAA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 09:00:00 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:49950 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbgBNOAA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 09:00:00 -0500
X-AuditID: c0a8fbf4-263ff70000001e6c-f6-5e46a7de6935
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 7D.9F.07788.ED7A64E5; Fri, 14 Feb 2020 14:59:58 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Fri, 14 Feb 2020 14:59:46 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
Thread-Topic: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
Thread-Index: AQHVmWQOgs5cHlsmlU+Vdtkf5ZbC06eIlAaAgAAGWoCAAC7LgICSQxwAgAAuOwA=
Date:   Fri, 14 Feb 2020 13:59:45 +0000
Message-ID: <61e40b624a07b7fa47712fed1bf9871cdb910090.camel@fi.rohmeurope.com>
References: <20191112141819.GA22076@localhost.localdomain>
         <201911131438.KT6pnFZ7%lkp@intel.com>
         <ac16492e11899ef4ec981f7f2e84714c7d61d2a7.camel@fi.rohmeurope.com>
         <CACRpkdYAmye8wT39fqy=LN+6pXDvrcQ0SyDTCvG7aSgea3Uumw@mail.gmail.com>
         <81f96837457028ad9eeb690776526701d5b1bc8c.camel@fi.rohmeurope.com>
In-Reply-To: <81f96837457028ad9eeb690776526701d5b1bc8c.camel@fi.rohmeurope.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E2B14B7E9AEFA49B9B9613C81AC0522@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFKsWRmVeSWpSXmKPExsVyYMXvTbr3lrvFGbyfa24x5c9yJovN8/8w
        OjB53Lm2h83j8ya5AKYobpukxJKy4Mz0PH27BO6Mto9XmQuWyVQsn7yfvYHxhHQXIyeHhICJ
        RPvO+yxdjFwcQgJXGSXWLHvHCuGcYJSYfaKHsYuRg4NNwEai6yY7SIOIgKXE4RNzWEBsZgFb
        icWdrcwgtjCQfbvtEhtIuYiAncTmLdwQ5X4SF7vbwMpZBFQlbl+fyQRSwgsUP9GYAbFpO5PE
        5LNLwGo4BfwltnyYwghiMwrISnQ2vGOCWCUusenZd1aImwUkluw5zwxhi0q8fPwPKq4ksffn
        QxaQ+cwCmhLrd+lDtDpIPL0wEepiRYkp3Q/BPuEVEJQ4OfMJywRGsVlINsxC6J6FpHsWku5Z
        SLoXMLKuYpTITczMSU8sSTXUK0ot1SvKz8gFUsn5uZsYIXH1ZQfj/0OehxiZOBgPMUpyMCmJ
        8q5d7BYnxJeUn1KZkVicEV9UmpNafIhRgoNZSYT3sCJQjjclsbIqtSgfJiXNwaIkzqv+cGKs
        kADIruzU1ILUIpisDAeHkgTv1GVAjYJFqempFWmZOSUIaSYOTpDhXFIixal5KalFiaUlGfGg
        1BFfDEweICkeoL0KIO28xQWJuUBRiNZTjNocE17OXcTMcWTu0kXMQix5+XmpUuK8p5cClQqA
        lGaU5sEtesUozsGoJMxbCTKIB5hg4ea8AlrBBLSiV9MFZEVJIkJKqoEx/Jr17NLIUPvoIiUF
        GecTjH+US9w8xAXv5txnanKu8JTd/LkpQJejLrjp6o+bTAtWLt7Ebeilzixa0vIiQvbO4VNP
        5jwNsCrp/pYm/sno4J5nuwSLnpaHnA9or1r7anKEQDPri1wrpyvzQ1yNeXW9Ahd0GlSyHEp9
        WynxeNuPTe97H7dsFVJiKc5INNRiLipOBAB/xPthbQMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjAtMDItMTQgYXQgMTM6MTQgKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90
ZToNCj4gSGktZGVlZWUtSG8gUGVlcHMhDQo+IA0KPiANCj4gT24gV2VkLCAyMDE5LTExLTEzIGF0
IDEwOjQwICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0KPiA+IE9uIFdlZCwgTm92IDEzLCAy
MDE5IGF0IDc6NTIgQU0gVmFpdHRpbmVuLCBNYXR0aQ0KPiA+IDxNYXR0aS5WYWl0dGluZW5AZmku
cm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+ID4gT24gV2VkLCAyMDE5LTExLTEzIGF0IDE0OjMw
ICswODAwLCBrYnVpbGQgdGVzdCByb2JvdCB3cm90ZToNCj4gPiA+ID4gSGkgTWF0dGksDQo+ID4g
PiA+IA0KPiA+ID4gPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCEgUGVyaGFwcyBzb21ldGhpbmcg
dG8gaW1wcm92ZToNCj4gPiA+ID4gDQo+ID4gPiA+IFthdXRvIGJ1aWxkIHRlc3QgV0FSTklORyBv
bg0KPiA+ID4gPiA3MGQ5N2UwOTliYjQyNmVjYjNhZDRiZjMxZTg4ZGJmMmVmNGIyZTRjXQ0KPiA+
ID4gPiANCj4gPiA+ID4gICAgNDgwICAgICAgICBzdGF0aWMgaW50IHdtdF9ncGlvX2dldF9kaXJl
Y3Rpb24oc3RydWN0DQo+ID4gPiA+IGdwaW9fY2hpcA0KPiA+ID4gPiAqY2hpcCwgdW5zaWduZWQg
b2Zmc2V0KQ0KPiA+ID4gPiAgICA0ODEgICAgICAgIHsNCj4gPiA+ID4gICAgNDgyICAgICAgICAg
ICAgICAgIHN0cnVjdCB3bXRfcGluY3RybF9kYXRhICpkYXRhID0NCj4gPiA+ID4gZ3Bpb2NoaXBf
Z2V0X2RhdGEoY2hpcCk7DQo+ID4gPiA+ICAgIDQ4MyAgICAgICAgICAgICAgICB1MzIgYmFuayA9
IFdNVF9CQU5LX0ZST01fUElOKG9mZnNldCk7DQo+ID4gPiA+ICAgIDQ4NCAgICAgICAgICAgICAg
ICB1MzIgYml0ID0gV01UX0JJVF9GUk9NX1BJTihvZmZzZXQpOw0KPiA+ID4gPiAgICA0ODUgICAg
ICAgICAgICAgICAgdTMyIHJlZ19kaXIgPSBkYXRhLT5iYW5rc1tiYW5rXS5yZWdfZGlyOw0KPiA+
ID4gPiAgICA0ODYgICAgICAgICAgICAgICAgdTMyIHZhbDsNCj4gPiA+ID4gICAgNDg3DQo+ID4g
PiA+ICAgIDQ4OCAgICAgICAgICAgICAgICB2YWwgPSByZWFkbF9yZWxheGVkKGRhdGEtPmJhc2Ug
Kw0KPiA+ID4gPiByZWdfZGlyKTsNCj4gPiA+ID4gICAgNDg5ICAgICAgICAgICAgICAgIGlmICh2
YWwgJiBCSVQoYml0KSkNCj4gPiA+ID4gID4gNDkwICAgICAgICAgICAgICAgICAgICAgICAgR1BJ
T19MSU5FX0RJUkVDVElPTl9PVVQ7DQo+ID4gPiANCj4gPiA+IFJpZ2h0LiBSZXR1cm4gaXMgbWlz
c2luZy4gSSB0aGluayBJIGFscmVhZHkgZml4ZWQgdGhpcyAtIEkgZ3Vlc3MNCj4gPiA+IEkNCj4g
PiA+IHNlbnQNCj4gPiA+IHdyb25nIHZlcnNpb24uLi4gU29ycnkgZ3V5cy4gSSdsbCBkbyB2MyB3
aXRoIG9ubHkgdGhpcyByZXR1cm4NCj4gPiA+IGFkZGVkDQo+ID4gPiAtDQo+ID4gPiBhbmQgSSds
bCBzZW5kIGl0IHRvIGxpbWl0ZWQgYW1vdW50IG9mIHJlY2lwaWVudHMgYXMgSSB0aGluayBtb3N0
DQo+ID4gPiBvZg0KPiA+ID4geW91DQo+ID4gPiBndXlzIG1heSBub3QgYmUgaW50ZXJlc3RlZC4g
UHJvYmFibHkgdG8gTGludXMgVywgR2VlcnQgYW5kIEdQSU8NCj4gPiA+IGxpc3QNCj4gPiA+IG9u
bHkuIExldCBtZSBrbm93IGlmIHlvdSB3YW50IHRvIHNlZSB0aGUgdjMgKG9yIG90aGVyIHN1YnNl
cXVlbnQNCj4gPiA+IHBhdGNoZXMpDQo+IA0KPiBJIGp1c3Qgbm90aWNlZCB0aGlzIHdhcyBuZXZl
ciBtZXJnZWQgZXZlbiB0aG91Z2ggSSB3YXMgc3VyZSBJIHNlbnQgYQ0KPiBmaXhlZCB2ZXJzaW9u
LiBJdCB0b29rIG1lIGEgd2hpbGUgYnV0IEkgZ3Vlc3MgSSBtYW5hZ2VkIHRvIGRpZyBvdXQNCj4g
dGhlDQo+IHJlYXNvbi4uLg0KPiANCj4gRmlyc3QgSSBzZW50IHYyIHdpdGggdGhlIHJldHVybiBt
aXNzaW5nOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1ncGlvLzIwMTkxMTEyMTQx
ODE5LkdBMjIwNzZAbG9jYWxob3N0LmxvY2FsZG9tYWluLw0KPiANCj4gQW5kIHRoZW4gSSBkaWQg
aW5kZWVkIHNlbmQgYSBmaXhlZCB2ZXJzaW9uOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1ncGlvLzIwMTkxMTEzMDcxNTAxLkdBMjIxNThAbG9jYWxob3N0LmxvY2FsZG9tYWluLyNa
MzBkcml2ZXJzOnBpbmN0cmw6dnQ4NTAwOnBpbmN0cmwtd210LmMNCj4gDQo+IC4uLmJ1dCB0aXRs
ZWQgdGhpcyBhcyB2MiB0b28uIEkgZ3Vlc3MgdGhhdCdzIHdoeSBpdCBuZXZlciBjYXVnaHQNCj4g
Y29ycmVjdCBhdHRlbnRpb24uDQo+IA0KPiBJIHRyaWVkIHJlYmFzaW5nIHRoaXMgdG8gY3VycmVu
dCBncGlvL2RldmVsLiBUaGUgcGluY3RybC1pbmdlbmljLmMNCj4gaGFkDQo+IGdhaW5lZCB0cml2
aWFsIGNvbmZsaWN0IC0gZG8geW91IHdhbnQgbWUgdG8gZ2V0IHRoZSBwaW5jdHJsIHRyZWUgYW5k
DQo+IGRvDQo+IG1lcmdpbmcgb24gdG9wIG9mIGl0ICYmIHJlc2VuZGluZyB0aGlzIG9yIGRvIHlv
dSB3YW50IHRvIHRyeSBhcHBseWluZw0KPiBpdD8NCg0KSSBkZWNpZGVkIHRvIGRvIHJlc2VuZCBh
cyBJIGhhZCB0aGUgY29tbWl0IHNpdHRpbmcgdGhlcmUgcmViYXNlZC4gU29ycnkNCmZvciBtZXNz
aW5nIHRoaXMgdXAuIHYzIGlzIG5vdyBmaW5hbGx5IG9uIGl0cyB3YXkuDQoNCkJlc3QgUmVnYXJk
cywNCglNYXR0aSBWYWl0dGluZW4NCg==
