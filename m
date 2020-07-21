Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8781D22786A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 08:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgGUGAu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 02:00:50 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:5339 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725294AbgGUGAu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 02:00:50 -0400
X-UUID: 7ab65104b14a4a6ab6d29dfb2bde717d-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=U8PX+F+mnKbPbXqn4UjkWg26k/aBzCM1RQhtMnlz4g8=;
        b=WrzwzFfIVY7/0UEwUhttN1gyFZ8Pd2vOHdMOD1GRhZ857dctw43hTGHPLJlMTWdrhMc6JNYdgwgPxjNYHe/Er2M1xYVGrmRSDTbED992XTtsDoXReL7wgbHB2yt+IYaLnE917b6DBhX9FYyBnmkaobadO1OWvLdaBFXMqpoP3PM=;
X-UUID: 7ab65104b14a4a6ab6d29dfb2bde717d-20200721
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 633919522; Tue, 21 Jul 2020 14:00:44 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 14:00:41 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 14:00:41 +0800
Message-ID: <1595311242.5599.3.camel@mtkswgap22>
Subject: Re: [PATCH v8 6/7] arm64: dts: add dts nodes for MT6779
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Date:   Tue, 21 Jul 2020 14:00:42 +0800
In-Reply-To: <742eefe1-954b-eb3f-98b7-469833df729a@gmail.com>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
         <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
         <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
         <1594872242.11090.8.camel@mtkswgap22>
         <742eefe1-954b-eb3f-98b7-469833df729a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gTW9uLCAyMDIwLTA3LTIwIGF0IDE4OjEzICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMTYvMDcvMjAyMCAwNjowNCwgSGFua3MgQ2hlbiB3cm90ZToNCj4gPiBPbiBU
dWUsIDIwMjAtMDctMTQgYXQgMjA6MTQgKzAyMDAsIE1hdHRoaWFzIEJydWdnZXIgd3JvdGU6DQo+
ID4+DQo+ID4+IE9uIDE0LzA3LzIwMjAgMTE6MjAsIEhhbmtzIENoZW4gd3JvdGU6DQo+ID4+PiB0
aGlzIGFkZHMgaW5pdGlhbCBNVDY3NzkgZHRzIHNldHRpbmdzIGZvciBib2FyZCBzdXBwb3J0LA0K
PiA+Pj4gaW5jbHVkaW5nIGNwdSwgZ2ljLCB0aW1lciwgY2NmLCBwaW5jdHJsLCB1YXJ0LCBzeXNp
cnEuLi5ldGMuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogSGFua3MgQ2hlbiA8aGFua3Mu
Y2hlbkBtZWRpYXRlay5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgfCAgIDEgKw0KPiA+Pj4gICAgYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDY3NzktZXZiLmR0cyB8ICAzMSArKysNCj4gPj4+ICAgIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2Nzc5LmR0c2kgICAgfCAyNzEgKysrKysrKysrKysr
KysrKysrKysNCj4gPj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMzAzIGluc2VydGlvbnMoKykNCj4g
Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
Njc3OS1ldmIuZHRzDQo+ID4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDY3NzkuZHRzaQ0KPiA+Pj4NCj4gPj4gWy4uLl0NCj4gPj4+ICsNCj4g
Pj4+ICsJCXVhcnQwOiBzZXJpYWxAMTEwMDIwMDAgew0KPiA+Pj4gKwkJCWNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ2Nzc5LXVhcnQiLA0KPiA+Pj4gKwkJCQkgICAgICJtZWRpYXRlayxtdDY1Nzct
dWFydCI7DQo+ID4+PiArCQkJcmVnID0gPDAgMHgxMTAwMjAwMCAwIDB4NDAwPjsNCj4gPj4+ICsJ
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTE1IElSUV9UWVBFX0xFVkVMX0xPVz47DQo+ID4+PiAr
CQkJY2xvY2tzID0gPCZjbGsyNm0+LCA8JmluZnJhY2ZnX2FvIENMS19JTkZSQV9VQVJUMD47DQo+
ID4+PiArCQkJY2xvY2stbmFtZXMgPSAiYmF1ZCIsICJidXMiOw0KPiA+Pj4gKwkJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7DQo+ID4+PiArCQl9Ow0KPiA+Pj4gKw0KPiA+Pj4gKwkJdWFydDE6IHNlcmlh
bEAxMTAwMzAwMCB7DQo+ID4+PiArCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NzktdWFy
dCIsDQo+ID4+PiArCQkJCSAgICAgIm1lZGlhdGVrLG10NjU3Ny11YXJ0IjsNCj4gPj4+ICsJCQly
ZWcgPSA8MCAweDExMDAzMDAwIDAgMHg0MDA+Ow0KPiA+Pj4gKwkJCWludGVycnVwdHMgPSA8R0lD
X1NQSSAxMTYgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gPj4+ICsJCQljbG9ja3MgPSA8JmNsazI2
bT4sIDwmaW5mcmFjZmdfYW8gQ0xLX0lORlJBX1VBUlQxPjsNCj4gPj4+ICsJCQljbG9jay1uYW1l
cyA9ICJiYXVkIiwgImJ1cyI7DQo+ID4+PiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPj4+
ICsJCX07DQo+ID4+PiArDQo+ID4+PiArCQl1YXJ0Mjogc2VyaWFsQDExMDA0MDAwIHsNCj4gPj4+
ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS11YXJ0IiwNCj4gPj4+ICsJCQkJICAg
ICAibWVkaWF0ZWssbXQ2NTc3LXVhcnQiOw0KPiA+Pj4gKwkJCXJlZyA9IDwwIDB4MTEwMDQwMDAg
MCAweDQwMD47DQo+ID4+PiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExNyBJUlFfVFlQRV9M
RVZFTF9MT1c+Ow0KPiA+Pj4gKwkJCWNsb2NrcyA9IDwmY2xrMjZtPiwgPCZpbmZyYWNmZ19hbyBD
TEtfSU5GUkFfVUFSVDI+Ow0KPiA+Pj4gKwkJCWNsb2NrLW5hbWVzID0gImJhdWQiLCAiYnVzIjsN
Cj4gPj4+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+Pj4gKwkJfTsNCj4gPj4NCj4gPj4g
RGV2aWNldHJlZSBkZXNjcmliZXMgdGhlIEhXIHdlIGhhdmUuIEFzIGZhciBhcyBJIGtub3csIHdl
IGhhdmUgNCBVQVJUcyBvbg0KPiA+PiBNVDY3NzkuIFNvIHdlIHNob3VsZCBsaXN0IHRoZW0gYWxs
IGhlcmUuDQo+ID4+DQo+ID4gDQo+ID4gQWN0dWFsbHksIFdlIGhhdmUgb25seSAzIFVBUlRzIEhX
IG9uIE1UNjc3OSwgYnV0IGhhdmUgNCBVQVJUIGNsayBpbg0KPiA+IGhlYWRlciBmaWxlIG9mIGNs
ay4NCj4gDQo+IENvcnJlY3QsIEkgZ290IGNvbmZ1c2VkIGJ5IHRoZSBmb3VyIGNsb2Nrcy4NCj4g
V2l0aCB0aGF0IGNsYXJpZmllZCBJJ20gZmluZSB3aXRoIHRoZSBwYXRjaCBhbmQgd2lsbCB0YWtl
IGl0IGFzIHNvb24gYXMgdGhlIA0KPiBjbG9jayBkcml2ZXIgcGF0Y2ggaXMgYWNjZXB0ZWQuDQo+
IA0KPiBSZWdhcmRzLA0KPiBNYXR0aGlhcw0KPiANCkdvdCBpdCwgSSBzZW5kIGEgbmV3IHNlcmlh
bCB0byBmaXggdGhlIHJlZHVuZGFudCBVQVJUIGNsaw0KaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIw
MjAvNy8yMS80NQ0KDQpUaGFua3MNCg0KSGFua3MgQ2hlbg0KDQo+ID4gQ0xLX0lORlJBX1VBUlQz
IGlzIGEgZHVtbXkgY2xrIGludGVyZmFjZSwgaXQgaGFzIG5vIGVmZmVjdCBvbiB0aGUNCj4gPiBv
cGVyYXRpb24gb2YgdGhlIHJlYWQvd3JpdGUgaW5zdHJ1Y3Rpb24uDQo+ID4gDQo+ID4gSWYgeW91
IHRoaW5rIGl0IGlzIG5vdCBnb29kLCBJIGNhbiByZW1vdmUgaXQgaW4gdGhlIGhlYWRlciBmaWxl
IG9mIGNsay4NCj4gPiANCj4gPiBUaGFua3MNCj4gPiANCj4gPj4gUmVnYXJkcywNCj4gPj4gTWF0
dGhpYXMNCj4gPiANCg0K

