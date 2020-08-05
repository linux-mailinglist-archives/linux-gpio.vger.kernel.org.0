Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CE023C36D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 04:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgHECYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 22:24:20 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:48525 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725864AbgHECYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2020 22:24:19 -0400
X-UUID: 6989112aa27041399f0fc8111928f557-20200805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qwrcJyYbmUJ+qLAaK5A34Fz5y2cCZtNPZGVFJaXtFDA=;
        b=gT5rKgtg9oyOzlDYnb6lAX349xG0s0mxyUP6/UGhUsuuNsGr+2HKaCkxD1eL1Ngfzt9juPuKZdYBG0/FAmMUhvulafV4EoJqKnprfz9OLuFnhb3/QAsrkGuGtW16P4vhWppunmxfroRdo/PneN2JTGapBbsKNwLprwUYg4zkOJs=;
X-UUID: 6989112aa27041399f0fc8111928f557-20200805
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 991920688; Wed, 05 Aug 2020 10:24:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Aug 2020 10:24:07 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 5 Aug 2020 10:24:09 +0800
Message-ID: <1596594249.11014.1.camel@mtkswgap22>
Subject: Re: [PATCH v10 2/3] arm64: dts: add dts nodes for MT6779
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Date:   Wed, 5 Aug 2020 10:24:09 +0800
In-Reply-To: <1596115816-11758-3-git-send-email-hanks.chen@mediatek.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
         <1596115816-11758-3-git-send-email-hanks.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 53E961C257AC9D4F92D4926C719947B767AE82D2D00EF64BC8704EFF5BCD79512000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWF0dGhpYXMgYW5kIGFsbCwNCg0KR2VudGxlIHBpbmcgb24gdGhpcyBwYXRjaC4NCg0KVGhh
bmtzDQoNCg0KSGFua3MgQ2hlbg0KDQpPbiBUaHUsIDIwMjAtMDctMzAgYXQgMjE6MzAgKzA4MDAs
IEhhbmtzIENoZW4gd3JvdGU6DQo+IHRoaXMgYWRkcyBpbml0aWFsIE1UNjc3OSBkdHMgc2V0dGlu
Z3MgZm9yIGJvYXJkIHN1cHBvcnQsDQo+IGluY2x1ZGluZyBjcHUsIGdpYywgdGltZXIsIGNjZiwg
cGluY3RybCwgdWFydCwgc3lzaXJxLi4uZXRjLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGFua3Mg
Q2hlbiA8aGFua3MuY2hlbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICB8ICAgMSArDQo+ICBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210Njc3OS1ldmIuZHRzIHwgIDMxICsrKw0KPiAgYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDY3NzkuZHRzaSAgICB8IDI3MSArKysrKysrKysrKysrKysrKysrKw0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCAzMDMgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2Nzc5LWV2Yi5kdHMNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Njc3OS5kdHNpDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9NYWtlZmlsZSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUNCj4gaW5kZXggYTU3YWY5ZGE5
ZjVjLi40ZDFiMGY5ZDhkMWMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvTWFrZWZpbGUNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9NYWtl
ZmlsZQ0KPiBAQCAtMSw2ICsxLDcgQEANCj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjANCj4gIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSArPSBtdDI3MTItZXZiLmR0Yg0K
PiAgZHRiLSQoQ09ORklHX0FSQ0hfTUVESUFURUspICs9IG10Njc1NS1ldmIuZHRiDQo+ICtkdGIt
JChDT05GSUdfQVJDSF9NRURJQVRFSykgKz0gbXQ2Nzc5LWV2Yi5kdGINCj4gIGR0Yi0kKENPTkZJ
R19BUkNIX01FRElBVEVLKSArPSBtdDY3OTUtZXZiLmR0Yg0KPiAgZHRiLSQoQ09ORklHX0FSQ0hf
TUVESUFURUspICs9IG10Njc5Ny1ldmIuZHRiDQo+ICBkdGItJChDT05GSUdfQVJDSF9NRURJQVRF
SykgKz0gbXQ2Nzk3LXgyMC1kZXYuZHRiDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210Njc3OS1ldmIuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDY3NzktZXZiLmR0cw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjE2NGY1Y2JiMzgyMQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ2Nzc5LWV2Yi5kdHMNCj4gQEAgLTAsMCArMSwzMSBAQA0KPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArDQo+ICsvKg0KPiArICogQ29weXJp
Z2h0IChjKSAyMDE5IE1lZGlhVGVrIEluYy4NCj4gKyAqIEF1dGhvcjogTWFycy5DIDxtYXJzLmNo
ZW5nQG1lZGlhdGVrLmNvbT4NCj4gKyAqDQo+ICsgKi8NCj4gKw0KPiArL2R0cy12MS87DQo+ICsj
aW5jbHVkZSAibXQ2Nzc5LmR0c2kiDQo+ICsNCj4gKy8gew0KPiArCW1vZGVsID0gIk1lZGlhVGVr
IE1UNjc3OSBFVkIiOw0KPiArCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2Nzc5LWV2YiIsICJt
ZWRpYXRlayxtdDY3NzkiOw0KPiArDQo+ICsJYWxpYXNlcyB7DQo+ICsJCXNlcmlhbDAgPSAmdWFy
dDA7DQo+ICsJfTsNCj4gKw0KPiArCW1lbW9yeUA0MDAwMDAwMCB7DQo+ICsJCWRldmljZV90eXBl
ID0gIm1lbW9yeSI7DQo+ICsJCXJlZyA9IDwwIDB4NDAwMDAwMDAgMCAweDFlODAwMDAwPjsNCj4g
Kwl9Ow0KPiArDQo+ICsJY2hvc2VuIHsNCj4gKwkJc3Rkb3V0LXBhdGggPSAic2VyaWFsMDo5MjE2
MDBuOCI7DQo+ICsJfTsNCj4gK307DQo+ICsNCj4gKyZ1YXJ0MCB7DQo+ICsJc3RhdHVzID0gIm9r
YXkiOw0KPiArfTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ2Nzc5LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Njc3OS5kdHNpDQo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzcwZjMwOWQzMmRl
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDY3NzkuZHRzaQ0KPiBAQCAtMCwwICsxLDI3MSBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjArDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChjKSAyMDE5IE1lZGlhVGVr
IEluYy4NCj4gKyAqIEF1dGhvcjogTWFycy5DIDxtYXJzLmNoZW5nQG1lZGlhdGVrLmNvbT4NCj4g
KyAqDQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210Njc3OS1j
bGsuaD4NCj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEu
aD4NCj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2lj
Lmg+DQo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9tdDY3NzktcGluZnVuYy5oPg0K
PiArDQo+ICsvIHsNCj4gKwljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OSI7DQo+ICsJaW50
ZXJydXB0LXBhcmVudCA9IDwmc3lzaXJxPjsNCj4gKwkjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4g
Kwkjc2l6ZS1jZWxscyA9IDwyPjsNCj4gKw0KPiArCXBzY2kgew0KPiArCQljb21wYXRpYmxlID0g
ImFybSxwc2NpLTAuMiI7DQo+ICsJCW1ldGhvZCA9ICJzbWMiOw0KPiArCX07DQo+ICsNCj4gKwlj
cHVzIHsNCj4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ICsJCSNzaXplLWNlbGxzID0gPDA+
Ow0KPiArDQo+ICsJCWNwdTA6IGNwdUAwIHsNCj4gKwkJCWRldmljZV90eXBlID0gImNwdSI7DQo+
ICsJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTU1IjsNCj4gKwkJCWVuYWJsZS1tZXRob2Qg
PSAicHNjaSI7DQo+ICsJCQlyZWcgPSA8MHgwMDA+Ow0KPiArCQl9Ow0KPiArDQo+ICsJCWNwdTE6
IGNwdUAxIHsNCj4gKwkJCWRldmljZV90eXBlID0gImNwdSI7DQo+ICsJCQljb21wYXRpYmxlID0g
ImFybSxjb3J0ZXgtYTU1IjsNCj4gKwkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQo+ICsJCQly
ZWcgPSA8MHgxMDA+Ow0KPiArCQl9Ow0KPiArDQo+ICsJCWNwdTI6IGNwdUAyIHsNCj4gKwkJCWRl
dmljZV90eXBlID0gImNwdSI7DQo+ICsJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTU1IjsN
Cj4gKwkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQo+ICsJCQlyZWcgPSA8MHgyMDA+Ow0KPiAr
CQl9Ow0KPiArDQo+ICsJCWNwdTM6IGNwdUAzIHsNCj4gKwkJCWRldmljZV90eXBlID0gImNwdSI7
DQo+ICsJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTU1IjsNCj4gKwkJCWVuYWJsZS1tZXRo
b2QgPSAicHNjaSI7DQo+ICsJCQlyZWcgPSA8MHgzMDA+Ow0KPiArCQl9Ow0KPiArDQo+ICsJCWNw
dTQ6IGNwdUA0IHsNCj4gKwkJCWRldmljZV90eXBlID0gImNwdSI7DQo+ICsJCQljb21wYXRpYmxl
ID0gImFybSxjb3J0ZXgtYTU1IjsNCj4gKwkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQo+ICsJ
CQlyZWcgPSA8MHg0MDA+Ow0KPiArCQl9Ow0KPiArDQo+ICsJCWNwdTU6IGNwdUA1IHsNCj4gKwkJ
CWRldmljZV90eXBlID0gImNwdSI7DQo+ICsJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTU1
IjsNCj4gKwkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQo+ICsJCQlyZWcgPSA8MHg1MDA+Ow0K
PiArCQl9Ow0KPiArDQo+ICsJCWNwdTY6IGNwdUA2IHsNCj4gKwkJCWRldmljZV90eXBlID0gImNw
dSI7DQo+ICsJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTc1IjsNCj4gKwkJCWVuYWJsZS1t
ZXRob2QgPSAicHNjaSI7DQo+ICsJCQlyZWcgPSA8MHg2MDA+Ow0KPiArCQl9Ow0KPiArDQo+ICsJ
CWNwdTc6IGNwdUA3IHsNCj4gKwkJCWRldmljZV90eXBlID0gImNwdSI7DQo+ICsJCQljb21wYXRp
YmxlID0gImFybSxjb3J0ZXgtYTc1IjsNCj4gKwkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQo+
ICsJCQlyZWcgPSA8MHg3MDA+Ow0KPiArCQl9Ow0KPiArCX07DQo+ICsNCj4gKwlwbXUgew0KPiAr
CQljb21wYXRpYmxlID0gImFybSxhcm12OC1wbXV2MyI7DQo+ICsJCWludGVycnVwdC1wYXJlbnQg
PSA8JmdpYz47DQo+ICsJCWludGVycnVwdHMgPSA8R0lDX1BQSSA3IElSUV9UWVBFX0xFVkVMX0xP
VyAwPjsNCj4gKwl9Ow0KPiArDQo+ICsJY2xrMjZtOiBvc2NpbGxhdG9yQDAgew0KPiArCQljb21w
YXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gKwkJI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiArCQlj
bG9jay1mcmVxdWVuY3kgPSA8MjYwMDAwMDA+Ow0KPiArCQljbG9jay1vdXRwdXQtbmFtZXMgPSAi
Y2xrMjZtIjsNCj4gKwl9Ow0KPiArDQo+ICsJY2xrMzJrOiBvc2NpbGxhdG9yQDEgew0KPiArCQlj
b21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gKwkJI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiAr
CQljbG9jay1mcmVxdWVuY3kgPSA8MzI3Njg+Ow0KPiArCQljbG9jay1vdXRwdXQtbmFtZXMgPSAi
Y2xrMzJrIjsNCj4gKwl9Ow0KPiArDQo+ICsJdGltZXIgew0KPiArCQljb21wYXRpYmxlID0gImFy
bSxhcm12OC10aW1lciI7DQo+ICsJCWludGVycnVwdC1wYXJlbnQgPSA8JmdpYz47DQo+ICsJCWlu
dGVycnVwdHMgPSA8R0lDX1BQSSAxMyBJUlFfVFlQRV9MRVZFTF9MT1cgMD4sDQo+ICsJCQkgICAg
IDxHSUNfUFBJIDE0IElSUV9UWVBFX0xFVkVMX0xPVyAwPiwNCj4gKwkJCSAgICAgPEdJQ19QUEkg
MTEgSVJRX1RZUEVfTEVWRUxfTE9XIDA+LA0KPiArCQkJICAgICA8R0lDX1BQSSAxMCBJUlFfVFlQ
RV9MRVZFTF9MT1cgMD47DQo+ICsJfTsNCj4gKw0KPiArCXNvYyB7DQo+ICsJCSNhZGRyZXNzLWNl
bGxzID0gPDI+Ow0KPiArCQkjc2l6ZS1jZWxscyA9IDwyPjsNCj4gKwkJY29tcGF0aWJsZSA9ICJz
aW1wbGUtYnVzIjsNCj4gKwkJcmFuZ2VzOw0KPiArDQo+ICsJCWdpYzogaW50ZXJydXB0LWNvbnRy
b2xsZXJAMGMwMDAwMDAgew0KPiArCQkJY29tcGF0aWJsZSA9ICJhcm0sZ2ljLXYzIjsNCj4gKwkJ
CSNpbnRlcnJ1cHQtY2VsbHMgPSA8ND47DQo+ICsJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+
Ow0KPiArCQkJaW50ZXJydXB0LWNvbnRyb2xsZXI7DQo+ICsJCQlyZWcgPSA8MCAweDBjMDAwMDAw
IDAgMHg0MDAwMD4sICAvKiBHSUNEICovDQo+ICsJCQkgICAgICA8MCAweDBjMDQwMDAwIDAgMHgy
MDAwMDA+OyAvKiBHSUNSICovDQo+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19QUEkgOSBJUlFfVFlQ
RV9MRVZFTF9ISUdIIDA+Ow0KPiArDQo+ICsJCQlwcGktcGFydGl0aW9ucyB7DQo+ICsJCQkJcHBp
X2NsdXN0ZXIwOiBpbnRlcnJ1cHQtcGFydGl0aW9uLTAgew0KPiArCQkJCQlhZmZpbml0eSA9IDwm
Y3B1MCAmY3B1MSBcDQo+ICsJCQkJCQkmY3B1MiAmY3B1MyAmY3B1NCAmY3B1NT47DQo+ICsJCQkJ
fTsNCj4gKwkJCQlwcGlfY2x1c3RlcjE6IGludGVycnVwdC1wYXJ0aXRpb24tMSB7DQo+ICsJCQkJ
CWFmZmluaXR5ID0gPCZjcHU2ICZjcHU3PjsNCj4gKwkJCQl9Ow0KPiArCQkJfTsNCj4gKw0KPiAr
CQl9Ow0KPiArDQo+ICsJCXN5c2lycTogaW50cG9sLWNvbnRyb2xsZXJAMGM1M2E2NTAgew0KPiAr
CQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3Nzktc3lzaXJxIiwNCj4gKwkJCQkgICAgICJt
ZWRpYXRlayxtdDY1Nzctc3lzaXJxIjsNCj4gKwkJCWludGVycnVwdC1jb250cm9sbGVyOw0KPiAr
CQkJI2ludGVycnVwdC1jZWxscyA9IDwzPjsNCj4gKwkJCWludGVycnVwdC1wYXJlbnQgPSA8Jmdp
Yz47DQo+ICsJCQlyZWcgPSA8MCAweDBjNTNhNjUwIDAgMHg1MD47DQo+ICsJCX07DQo+ICsNCj4g
KwkJdG9wY2tnZW46IGNsb2NrLWNvbnRyb2xsZXJAMTAwMDAwMDAgew0KPiArCQkJY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDY3NzktdG9wY2tnZW4iLCAic3lzY29uIjsNCj4gKwkJCXJlZyA9IDww
IDB4MTAwMDAwMDAgMCAweDEwMDA+Ow0KPiArCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiArCQl9
Ow0KPiArDQo+ICsJCWluZnJhY2ZnX2FvOiBjbG9jay1jb250cm9sbGVyQDEwMDAxMDAwIHsNCj4g
KwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2Nzc5LWluZnJhY2ZnX2FvIiwgInN5c2NvbiI7
DQo+ICsJCQlyZWcgPSA8MCAweDEwMDAxMDAwIDAgMHgxMDAwPjsNCj4gKwkJCSNjbG9jay1jZWxs
cyA9IDwxPjsNCj4gKwkJfTsNCj4gKw0KPiArCQlwaW86IHBpbmN0cmxAMTAwMDUwMDAgew0KPiAr
CQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NzktcGluY3RybCIsICJzeXNjb24iOw0KPiAr
CQkJcmVnID0gPDAgMHgxMDAwNTAwMCAwIDB4MTAwMD4sDQo+ICsJCQkgICAgICA8MCAweDExYzIw
MDAwIDAgMHgxMDAwPiwNCj4gKwkJCSAgICAgIDwwIDB4MTFkMTAwMDAgMCAweDEwMDA+LA0KPiAr
CQkJICAgICAgPDAgMHgxMWUyMDAwMCAwIDB4MTAwMD4sDQo+ICsJCQkgICAgICA8MCAweDExZTcw
MDAwIDAgMHgxMDAwPiwNCj4gKwkJCSAgICAgIDwwIDB4MTFlYTAwMDAgMCAweDEwMDA+LA0KPiAr
CQkJICAgICAgPDAgMHgxMWYyMDAwMCAwIDB4MTAwMD4sDQo+ICsJCQkgICAgICA8MCAweDExZjMw
MDAwIDAgMHgxMDAwPiwNCj4gKwkJCSAgICAgIDwwIDB4MTAwMGIwMDAgMCAweDEwMDA+Ow0KPiAr
CQkJcmVnLW5hbWVzID0gImdwaW8iLCAiaW9jZmdfcm0iLA0KPiArCQkJCSAgICAiaW9jZmdfYnIi
LCAiaW9jZmdfbG0iLA0KPiArCQkJCSAgICAiaW9jZmdfbGIiLCAiaW9jZmdfcnQiLA0KPiArCQkJ
CSAgICAiaW9jZmdfbHQiLCAiaW9jZmdfdGwiLA0KPiArCQkJCSAgICAiZWludCI7DQo+ICsJCQln
cGlvLWNvbnRyb2xsZXI7DQo+ICsJCQkjZ3Bpby1jZWxscyA9IDwyPjsNCj4gKwkJCWdwaW8tcmFu
Z2VzID0gPCZwaW8gMCAwIDIxMD47DQo+ICsJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsNCj4gKwkJ
CSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47DQo+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjA0
IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiArCQl9Ow0KPiArDQo+ICsJCWFwbWl4ZWQ6IGNsb2Nr
LWNvbnRyb2xsZXJAMTAwMGMwMDAgew0KPiArCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3
NzktYXBtaXhlZCIsICJzeXNjb24iOw0KPiArCQkJcmVnID0gPDAgMHgxMDAwYzAwMCAwIDB4ZTAw
PjsNCj4gKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCj4gKwkJfTsNCj4gKw0KPiArCQl1YXJ0MDog
c2VyaWFsQDExMDAyMDAwIHsNCj4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2Nzc5LXVh
cnQiLA0KPiArCQkJCSAgICAgIm1lZGlhdGVrLG10NjU3Ny11YXJ0IjsNCj4gKwkJCXJlZyA9IDww
IDB4MTEwMDIwMDAgMCAweDQwMD47DQo+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTE1IElS
UV9UWVBFX0xFVkVMX0xPVz47DQo+ICsJCQljbG9ja3MgPSA8JmNsazI2bT4sIDwmaW5mcmFjZmdf
YW8gQ0xLX0lORlJBX1VBUlQwPjsNCj4gKwkJCWNsb2NrLW5hbWVzID0gImJhdWQiLCAiYnVzIjsN
Cj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICsJCX07DQo+ICsNCj4gKwkJdWFydDE6IHNl
cmlhbEAxMTAwMzAwMCB7DQo+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS11YXJ0
IiwNCj4gKwkJCQkgICAgICJtZWRpYXRlayxtdDY1NzctdWFydCI7DQo+ICsJCQlyZWcgPSA8MCAw
eDExMDAzMDAwIDAgMHg0MDA+Ow0KPiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExNiBJUlFf
VFlQRV9MRVZFTF9MT1c+Ow0KPiArCQkJY2xvY2tzID0gPCZjbGsyNm0+LCA8JmluZnJhY2ZnX2Fv
IENMS19JTkZSQV9VQVJUMT47DQo+ICsJCQljbG9jay1uYW1lcyA9ICJiYXVkIiwgImJ1cyI7DQo+
ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiArCQl9Ow0KPiArDQo+ICsJCXVhcnQyOiBzZXJp
YWxAMTEwMDQwMDAgew0KPiArCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NzktdWFydCIs
DQo+ICsJCQkJICAgICAibWVkaWF0ZWssbXQ2NTc3LXVhcnQiOw0KPiArCQkJcmVnID0gPDAgMHgx
MTAwNDAwMCAwIDB4NDAwPjsNCj4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTcgSVJRX1RZ
UEVfTEVWRUxfTE9XPjsNCj4gKwkJCWNsb2NrcyA9IDwmY2xrMjZtPiwgPCZpbmZyYWNmZ19hbyBD
TEtfSU5GUkFfVUFSVDI+Ow0KPiArCQkJY2xvY2stbmFtZXMgPSAiYmF1ZCIsICJidXMiOw0KPiAr
CQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gKwkJfTsNCj4gKw0KPiArCQlhdWRpbzogY2xvY2st
Y29udHJvbGxlckAxMTIxMDAwMCB7DQo+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3
OS1hdWRpbyIsICJzeXNjb24iOw0KPiArCQkJcmVnID0gPDAgMHgxMTIxMDAwMCAwIDB4MTAwMD47
DQo+ICsJCQkjY2xvY2stY2VsbHMgPSA8MT47DQo+ICsJCX07DQo+ICsNCj4gKwkJbWZnY2ZnOiBj
bG9jay1jb250cm9sbGVyQDEzZmJmMDAwIHsNCj4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ2Nzc5LW1mZ2NmZyIsICJzeXNjb24iOw0KPiArCQkJcmVnID0gPDAgMHgxM2ZiZjAwMCAwIDB4
MTAwMD47DQo+ICsJCQkjY2xvY2stY2VsbHMgPSA8MT47DQo+ICsJCX07DQo+ICsNCj4gKwkJbW1z
eXM6IHN5c2NvbkAxNDAwMDAwMCB7DQo+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3
OS1tbXN5cyIsICJzeXNjb24iOw0KPiArCQkJcmVnID0gPDAgMHgxNDAwMDAwMCAwIDB4MTAwMD47
DQo+ICsJCQkjY2xvY2stY2VsbHMgPSA8MT47DQo+ICsJCX07DQo+ICsNCj4gKwkJaW1nc3lzOiBj
bG9jay1jb250cm9sbGVyQDE1MDIwMDAwIHsNCj4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ2Nzc5LWltZ3N5cyIsICJzeXNjb24iOw0KPiArCQkJcmVnID0gPDAgMHgxNTAyMDAwMCAwIDB4
MTAwMD47DQo+ICsJCQkjY2xvY2stY2VsbHMgPSA8MT47DQo+ICsJCX07DQo+ICsNCj4gKwkJdmRl
Y3N5czogY2xvY2stY29udHJvbGxlckAxNjAwMDAwMCB7DQo+ICsJCQljb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10Njc3OS12ZGVjc3lzIiwgInN5c2NvbiI7DQo+ICsJCQlyZWcgPSA8MCAweDE2MDAw
MDAwIDAgMHgxMDAwPjsNCj4gKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCj4gKwkJfTsNCj4gKw0K
PiArCQl2ZW5jc3lzOiBjbG9jay1jb250cm9sbGVyQDE3MDAwMDAwIHsNCj4gKwkJCWNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ2Nzc5LXZlbmNzeXMiLCAic3lzY29uIjsNCj4gKwkJCXJlZyA9IDww
IDB4MTcwMDAwMDAgMCAweDEwMDA+Ow0KPiArCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiArCQl9
Ow0KPiArDQo+ICsJCWNhbXN5czogY2xvY2stY29udHJvbGxlckAxYTAwMDAwMCB7DQo+ICsJCQlj
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS1jYW1zeXMiLCAic3lzY29uIjsNCj4gKwkJCXJl
ZyA9IDwwIDB4MWEwMDAwMDAgMCAweDEwMDAwPjsNCj4gKwkJCSNjbG9jay1jZWxscyA9IDwxPjsN
Cj4gKwkJfTsNCj4gKw0KPiArCQlpcGVzeXM6IGNsb2NrLWNvbnRyb2xsZXJAMWIwMDAwMDAgew0K
PiArCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NzktaXBlc3lzIiwgInN5c2NvbiI7DQo+
ICsJCQlyZWcgPSA8MCAweDFiMDAwMDAwIDAgMHgxMDAwPjsNCj4gKwkJCSNjbG9jay1jZWxscyA9
IDwxPjsNCj4gKwkJfTsNCj4gKw0KPiArCX07DQo+ICt9Ow0KDQo=

