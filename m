Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6B85EF6F6
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 09:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388164AbfKEILZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 03:11:25 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:54806 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388074AbfKEILZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 03:11:25 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-47-5dc12eaa77ed
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 87.B3.08102.AAE21CD5; Tue,  5 Nov 2019 09:11:22 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 09:11:18 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [RFC PATCH v2 05/13] clk: bd718x7: Support ROHM BD71828 clk
 block
Thread-Topic: [RFC PATCH v2 05/13] clk: bd718x7: Support ROHM BD71828 clk
 block
Thread-Index: AQHVimBwjNMwf0EEZEiGH5vTJctNV6dwqoeAgAB0NICACqM9AIAAebOA
Date:   Tue, 5 Nov 2019 08:11:16 +0000
Message-ID: <992e5c8ae33ca347312fddfc864757df7502d492.camel@fi.rohmeurope.com>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <5c66ac7d43ae1f57c335b6e565553fe1df703a83.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <20191028233256.798AD21479@mail.kernel.org>
         <95b21eeaee8025dc430623429273116c35c1b769.camel@fi.rohmeurope.com>
         <20191105005541.7913220717@mail.kernel.org>
In-Reply-To: <20191105005541.7913220717@mail.kernel.org>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6F873D5BAD1E8488DA770566D8026B7@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxjOuff23gNyzaHCOOI0WSUuUymS+OPEKEGN7qLLdNkvlzXsul5p
        I7TktlXZsowsoEAXZYlGqBansROQiK0yZ0OJ7RClGrTyMdz8SOUjgTjU8DUyAt5LUfh1nvd9
        3ud53h/vgbT2BZsKzRa7JFvEfB0bz9yq/d+bXq8PGjYEy9LIxUg3R46N/MaRMXeYIaei/Sw5
        19qhIc571zXkn6arDHk+fhuQia4yipycvkSRNz8/05Br56YB6fSfZUnTyyuAtF3uYonnrwhF
        znruMiQS3kGehm+zpDTQypGZHi+TnSw01DQA4VVvKSfUNHwv3HQ95QRffTkrPOlpZoU7vTco
        4XTNFCXUXp7khFHfqr3xXy3ZvF+0H/rSnGfJyPpmiWnSO8oWjuiPNDoDVDHoSq8AcRCjjbi7
        9AVbAeKhFnUDfCLk18SKOwB7/VNKASGLNuOKx5zaT0IugNvOhOaGaDTO4YezAUa1Wob24uKh
        DkrFSegL7Koa1MTwTvy4cZRWjRiUhstfpaltHn2O3eNOaj6Mwm2V03PaOETwk2Otcxiglbi8
        eGQO0ygF+wYnNbG1Eb7Y/ICO4WQ81Dcz39fhwFSUUbNo9Alu9GfEpNnYPXt/3uYjfNIZ5WI7
        JOL26n6mEnzgWpTgWlC7Fqldi9SuRepfgaYe4ALRnJ8n2qVMvSw59LLVVKA831oLfCB2M2N/
        gNlQTghQEITAckjpkvn1m24ZtEv3W41FJtFmypUd+ZItBDCkdUl8pCpg0PJGseg7Sba+o1ZA
        RpfCfxz9xaBFatZBSSqU5HfshxDqMN+yLmjQJspSnnTkgDnfvkBTME41j09NskkWoySLDrsp
        Vz2QXJtyISqVoOSeSFfkvK1QLFC6MWkYrIOVQ+4LNGx1ey7QWsZitUipKfwP6ihSR00Oy/ug
        YZACgW4Zj1U2Qfk4732GlQhKifisr0WNsIsLVGox4Kv3rXK0B4ScaOW16n0+86U9/Xs+ZWDf
        2Out3I+1uEX+/c+jxycc5cBogsGcww1cWebSHY+CzSVT24uMazYe4Lc58dd1fyeXeFZXXek4
        rx9+PUBl0DdKdxPyE/DX1c0kjr/p7emUN/zXWBHZ4kH/whK999BzaSDrenhXU5dWx9hMYuZa
        WraJbwFH6JhJ9QMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gU3RlcGhlbiwNCg0KT24gTW9uLCAyMDE5LTExLTA0IGF0IDE2OjU1IC0wODAwLCBTdGVw
aGVuIEJveWQgd3JvdGU6DQo+IFF1b3RpbmcgVmFpdHRpbmVuLCBNYXR0aSAoMjAxOS0xMC0yOCAy
MzoyODo1MSkNCj4gPiBPbiBNb24sIDIwMTktMTAtMjggYXQgMTY6MzIgLTA3MDAsIFN0ZXBoZW4g
Qm95ZCB3cm90ZToNCj4gPiA+IFF1b3RpbmcgTWF0dGkgVmFpdHRpbmVuICgyMDE5LTEwLTI0IDA0
OjQ0OjQwKQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLWJkNzE4eDcuYyBi
L2RyaXZlcnMvY2xrL2Nsay0NCj4gPiA+ID4gYmQ3MTh4Ny5jDQo+ID4gPiA+IGluZGV4IGFlNmU1
YmFlZTMzMC4uZDE3YTE5ZTA0NTkyIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2Nsay9j
bGstYmQ3MTh4Ny5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL2Nsay1iZDcxOHg3LmMNCj4g
PiA+ID4gQEAgLTgsNiArOCw3IEBADQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+ID4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L21mZC9yb2htLWJkNzE4eDcuaD4NCj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51
eC9tZmQvcm9obS1iZDcxODI4Lmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvbWZkL3JvaG0t
YmQ3MDUyOC5oPg0KPiA+ID4gDQo+ID4gPiBJdCB3b3VsZCBiZSByZWFsbHkgZ3JlYXQgdG8gbm90
IG5lZWQgdG8gaW5jbHVkZSB0aGVzZSByYW5kb20NCj4gPiA+IGhlYWRlcg0KPiA+ID4gZmlsZXMg
aW4gdGhpcyBkcml2ZXIgYW5kIGp1c3QgdXNlIHJhdyBudW1iZXJzIHNvbWVob3cuIExvb2tzIGxp
a2UNCj4gPiA+IG1heWJlDQo+ID4gPiBpdCBjYW4gYmUgZG9uZSBieSBwb3B1bGF0aW5nIGEgZGlm
ZmVyZW50IGRldmljZSBuYW1lIGZyb20gdGhlIG1mZA0KPiA+ID4gZHJpdmVyDQo+ID4gPiBkZXBl
bmRpbmcgb24gdGhlIHZlcnNpb24gb2YgdGhlIGNsayBjb250cm9sbGVyIGRlc2lyZWQ/IFRoZW4g
dGhhdA0KPiA+ID4gY2FuDQo+ID4gPiBiZQ0KPiA+ID4gbWF0Y2hlZCBpbiB0aGlzIGNsayBkcml2
ZXIgYW5kIHdlIGNhbiBqdXN0IHB1dCB0aGUgcmVnaXN0ZXIgaW5mbw0KPiA+ID4gaW4NCj4gPiA+
IHRoaXMNCj4gPiA+IGZpbGU/DQo+ID4gDQo+ID4gSSBzdGlsbCBsaWtlIGtlZXBpbmcgdGhlIGNo
aXAgdHlwZSBpbmZvcm1hdGlvbiBvbiBvbmUgaGVhZGVyIC0gbm8NCj4gPiBtYXR0ZXIgd2hhdC1l
dmVyIGZvcm1hdCB0aGUgY2xrLWNvbnRyb2xsZXIgdHlwZS92ZXJzaW9uIGluZm9ybWF0aW9uDQo+
ID4gaXMuDQo+ID4gUmF0aW9uYWxlIGlzIHRoYXQgTUZEIGFuZCBhbHNvIGZldyBvdGhlciBzdWIt
ZGV2aWNlcyAobm90IG9ubHkgdGhlDQo+ID4gY2xrKQ0KPiA+IG5lZWQgdG8gdXNlIGl0LiBDdXJy
ZW50bHkgYXQgbGVhc3QgdGhlIFJUQy4NCj4gPiANCj4gPiBCdXQgaWYgd2UgZGVmaW5lIGNsayBy
ZWdpc3RlciBpbmZvcm1hdGlvbiBmb3IgYWxsIFBNSUNzIGluIHRoaXMgYy0NCj4gPiBmaWxlLCAN
Cj4gPiB0aGVuIChJIHRoaW5rKSB3ZSBjYW4gb25seSBpbmNsdWRlIHRoZSA8bGludXgvbWZkL3Jv
aG0tZ2VuZXJpYy5oPiAtDQo+ID4gd2hpY2ggY29udGFpbnMgdGhlIFBNSUMgdHlwZSBkZWZpbmVz
IGFuZCB0aGUgZ2VuZXJpYyBNRkQgZGF0YQ0KPiA+IHN0cnVjdHVyZS4gVGhhdCB3b3VsZDoNCj4g
PiANCj4gPiAtI2luY2x1ZGUgPGxpbnV4L21mZC9yb2htLWJkNzE4eDcuaD4NCj4gPiAtI2luY2x1
ZGUgPGxpbnV4L21mZC9yb2htLWJkNzE4MjguaD4NCj4gPiAtI2luY2x1ZGUgPGxpbnV4L21mZC9y
b2htLWJkNzA1MjguaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21mZC9yb2htLWdlbmVyaWMuaD4N
Cj4gPiANCj4gPiBUaGF0IHdheSB0aGUgY2hpcC10eXBlIGluZm9ybWF0aW9uIGNvdWxkIHN0aWxs
IGJlIHNhbWUgZm9yIE1GRCBhbmQNCj4gPiBhbGwNCj4gPiBzdWItZGV2aWNlcyBidXQgY2xrIGRy
aXZlciB3b3VsZCBub3QgbmVlZCB0byBpbmNsdWRlIGFsbCB0aGUNCj4gPiBkZXRhaWxzDQo+ID4g
Zm9yIGFsbCB0aGUgUE1JQ3MuIEkgdW5kZXJzdGFuZCB5b3VyIHBvaW50IHdlbGwgYXMgY2xrIHJl
Z2lzdGVycw0KPiA+IGZvcg0KPiA+IHRoZXNlIFBNSUNzIGFyZSByZWFsbHkgKmxpbWl0ZWQqLg0K
PiA+IA0KPiANCj4gSXQncyBub3QgZXZlbiBqdXN0IGFib3V0IGNsayByZWdpc3RlcnMuIEl0J3Mg
YWxzbyBhYm91dCBob3cgd2UgaGF2ZQ0KPiBkZXZpY2UgY29tcGF0aWJsZSBzdHJpbmdzIGFuZCBk
ZXZpY2UgbmFtZXMgYnV0IHRoaXMgZHJpdmVyIGlzbid0DQo+IHVzaW5nDQo+IHRoZW0gdG8gZGlm
ZmVyZW50aWF0ZS4gSW5zdGVhZCwgaXQncyBsb29raW5nIGF0IHRoZSBwYXJlbnQgZGV2aWNlLiBJ
DQo+IGRvbid0IGdldCBpdC4gV2h5IGNhbid0IHRoZSBNRkQgcG9wdWxhdGUgZGlmZmVyZW50IGNs
ayBkZXZpY2VzIGZvcg0KPiB0aGUNCj4gZGlmZmVyZW50IFBNSUNzIGFuZCBtYWtlIHRoaXMgZHJp
dmVyIGNvbXBsZXRlbHkgb2JsaXZpb3VzIHRvIHRoZQ0KPiBwYXJlbnQNCj4gZGV2aWNlIG5hbWUv
c3RydWN0dXJlIGFuZCB0aGVzZSBoZWFkZXJzPw0KDQpQcm9iYWJseSBiZWNhdXNlIEkgZGlkbid0
IGtub3cgaG93IE1GRC9jaGlsZCBkZXZpY2UgJ21hdGNoaW5nJyB3b3Jrcy4NCg0KRG8geW91IG1l
YW4gdGhlIGNsayBkcml2ZXIgY291bGQgZG8gc29tZXRoaW5nIGxpa2U6DQoNCnN0YXRpYyBjb25z
dCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lkIGJkNzE4eDdfY2xrX2lkW10gPSB7DQogICAgICAg
IHsgImJkNzE4MzctY2xrIiwgRk9PfSwNCiAgICAgICAgeyAiYmQ3MTg0Ny1jbGsiLCBCQVJ9LA0K
ICAgICAgICB7ICJiZDcwNTI4LWNsayIsIEJBWn0sDQogICAgICAgIHsgImJkNzE4MjgtY2xrIiwg
QkFGfSwNCiAgICAgICAgeyB9LA0KfTsNCk1PRFVMRV9ERVZJQ0VfVEFCTEUocGxhdGZvcm0sIGJk
NzE4eDdfY2xrX2lkKTsNCg0Kc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgYmQ3MTgzN19j
bGsgPSB7DQogICAgICAgIC5kcml2ZXIgPSB7DQogICAgICAgICAgICAgICAgLm5hbWUgPSAiYmQ3
MTh4eC1jbGsiLA0KICAgICAgICB9LA0KICAgICAgICAucHJvYmUgPSBiZDcxODM3X2Nsa19wcm9i
ZSwNCgkuaWRfdGFibGUgPSBiZDcxOHg3X2Nsa19pZA0KfTsNCg0KYW5kIHRoZW4gaW4gTUZEIHdl
IGp1c3QgdXNlIGNvcnJlY3QgbmFtZSBzdHJpbmcgZm9yIHRoZSBtZmQgY2VsbA0KcmVwcmVzZW50
aW5nIHRoZSBjbGs/IChFZy4gb25lIG9mIHRoZSBiZDcxODM3LWNsaywgYmQ3MTg0Ny1jbGssDQpi
ZDcwNTI4LWNsaywgYmQ3MTgyOC1jbGspIGFuZCBpbiBjbGsgcHJvYmUganVzdCBkaWZmZXJlbnRp
YXRlIGJhc2VkIG9uDQpGT08sIEJBUiwgQkFaIGFuZCBCQUY/DQoNCkkgZ3Vlc3Mgd2UgY291bGQg
ZG8gdGhhdCAoZGlkbid0IHRyeSBpdCBvdXQgeWV0IHNvIEkgb25seSBndWVzcyBmb3INCm5vdykg
LSBidXQgSSB0aGluayB0aGlzIGRvbid0IHJlYWxseSBtaXRpZ2F0ZSB0aGUgbmVlZCBmb3IgY29t
bW9uDQpoZWFkZXIuIElmIHdlIGNoYW5nZSB0aGUgc3ViLWRldmljZSBtYXRjaCBtZWNoYW5pc20g
dG8gdGhpcyB0aGVuIHRoZQ0Kc2FtZSBtZWNoYW5pc20gc2hvdWxkIHByb2JhYmx5IGJlIGFwcGxp
ZWQgdG8gYWxsIHN1Yi1kZXZpY2VzLiBBbmQgdGhhdA0Kd291bGQgYmUgYSBjYXNlIHdoZXJlIEkg
d291bGQgbGlrZSB0byBzZWUgdGhlIHZlcnkgc2FtZSBGT08sIEJBUiwgQkFaDQphbmQgQkFGIGJl
aW5nIHVzZWQgZm9yIGFsbCBzdWItZGV2aWNlcyAtIG1lYW5pbmcgaXQgc2hvdWxkIHN0aWxsIGJl
IGENCk1GRCBoZWFkZXIuIEkgdGhpbmsgdGhlIGRyaXZlcnMvY2xrL2Nsay1zMm1wczExLmMsIGRy
aXZlcnMvbWZkL3NlYy0NCmNvcmUuYyBhbmQgaW5jbHVkZS9saW51eC9tZmQvc2Ftc3VuZy9jb3Jl
LmggYXJlIGV4YW1wbGVzIG9mIHRoaXMuDQoNCkJ1dCBJIGRvIGxpa2UgdGhpcyBwbGF0Zm9ybV9k
ZXZpY2VfaWQgYmFzZWQgUE1JQyBkaWZmZXJlbnRpYXRpb24NCmJldHRlci4gSXQgbG9va3MgbGlr
ZSB0aGUgImRlIGZhY3RvIiB3YXkgb2YgZG9pbmcgdGhpcy4gU3RpbGwsIGFzIEkNCnNhaWQsIEkg
ZG9uJ3Qgc2VlIHdlJ3JlIGdldHRpbmcgcmlkIG9mIGNvbW1vbiBoZWFkZXIgdGhpcyB3YXkuIEFu
eXdheXMsDQpJIHRoaW5rIEkgY2FuIGNvb2stdXAgcGF0Y2hlcyB0byBjaGFuZ2UgdGhpcyBpZiBJ
IGdldCBidXktaW4gZnJvbSBMZWUsDQpBbGV4YW5kcmUgYW5kIE1hcmsgZm9yIGNoYW5naW5nIHRo
ZSBleGlzdGluZyBtZWNoYW5pc20uDQoNClRoYW5rcyBmb3IgdGVhY2hpbmcgbWUgc29tZXRoaW5n
IG5ldyBvbmNlIGFnYWluISA6KQ0KDQpCciwNCglNYXR0aSBWYWl0dGluZW4NCg0KDQo=
