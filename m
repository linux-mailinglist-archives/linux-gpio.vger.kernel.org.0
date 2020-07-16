Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7453C221B18
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 06:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgGPEEJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 00:04:09 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:46431 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725268AbgGPEEJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 00:04:09 -0400
X-UUID: ba749623530a4c2381c526515e220a1a-20200716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=62ZGypyhLbFv7qQkPl4Eyj0oI3ptJBAGbtdl2xMz2ik=;
        b=QBJJ0mwcI1a1/t7cjMQ7OKSGAblX+rPAgzGvgwGSkT21UE4wSOybWJPyOq8G5R1+PEgq9KU4RfSjiBfhsBgMoGb7fIneMqOdDdsEfB6SJ51QJtFZ2EVn4zbRbXpOG8ZutBSHJGEjypLItGQjIDoXTbyX1ihUub5Vv776AEJP87o=;
X-UUID: ba749623530a4c2381c526515e220a1a-20200716
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 222755371; Thu, 16 Jul 2020 12:04:05 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jul 2020 12:04:01 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jul 2020 12:04:01 +0800
Message-ID: <1594872242.11090.8.camel@mtkswgap22>
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
Date:   Thu, 16 Jul 2020 12:04:02 +0800
In-Reply-To: <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
         <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
         <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 267C81200BBF5CE7F5838CC7DAED8F81F4DD194442EADB67FA1A52BED7ABC1472000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTA3LTE0IGF0IDIwOjE0ICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMTQvMDcvMjAyMCAxMToyMCwgSGFua3MgQ2hlbiB3cm90ZToNCj4gPiB0aGlz
IGFkZHMgaW5pdGlhbCBNVDY3NzkgZHRzIHNldHRpbmdzIGZvciBib2FyZCBzdXBwb3J0LA0KPiA+
IGluY2x1ZGluZyBjcHUsIGdpYywgdGltZXIsIGNjZiwgcGluY3RybCwgdWFydCwgc3lzaXJxLi4u
ZXRjLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEhhbmtzIENoZW4gPGhhbmtzLmNoZW5AbWVk
aWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9N
YWtlZmlsZSAgICAgICB8ICAgMSArDQo+ID4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210Njc3OS1ldmIuZHRzIHwgIDMxICsrKw0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDY3NzkuZHRzaSAgICB8IDI3MSArKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMyBm
aWxlcyBjaGFuZ2VkLCAzMDMgaW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2Nzc5LWV2Yi5kdHMNCj4gPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Njc3OS5kdHNpDQo+
ID4gDQo+IFsuLi5dDQo+ID4gKw0KPiA+ICsJCXVhcnQwOiBzZXJpYWxAMTEwMDIwMDAgew0KPiA+
ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS11YXJ0IiwNCj4gPiArCQkJCSAgICAg
Im1lZGlhdGVrLG10NjU3Ny11YXJ0IjsNCj4gPiArCQkJcmVnID0gPDAgMHgxMTAwMjAwMCAwIDB4
NDAwPjsNCj4gPiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExNSBJUlFfVFlQRV9MRVZFTF9M
T1c+Ow0KPiA+ICsJCQljbG9ja3MgPSA8JmNsazI2bT4sIDwmaW5mcmFjZmdfYW8gQ0xLX0lORlJB
X1VBUlQwPjsNCj4gPiArCQkJY2xvY2stbmFtZXMgPSAiYmF1ZCIsICJidXMiOw0KPiA+ICsJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJCXVhcnQxOiBzZXJp
YWxAMTEwMDMwMDAgew0KPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS11YXJ0
IiwNCj4gPiArCQkJCSAgICAgIm1lZGlhdGVrLG10NjU3Ny11YXJ0IjsNCj4gPiArCQkJcmVnID0g
PDAgMHgxMTAwMzAwMCAwIDB4NDAwPjsNCj4gPiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDEx
NiBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiA+ICsJCQljbG9ja3MgPSA8JmNsazI2bT4sIDwmaW5m
cmFjZmdfYW8gQ0xLX0lORlJBX1VBUlQxPjsNCj4gPiArCQkJY2xvY2stbmFtZXMgPSAiYmF1ZCIs
ICJidXMiOw0KPiA+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICsJCX07DQo+ID4gKw0K
PiA+ICsJCXVhcnQyOiBzZXJpYWxAMTEwMDQwMDAgew0KPiA+ICsJCQljb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10Njc3OS11YXJ0IiwNCj4gPiArCQkJCSAgICAgIm1lZGlhdGVrLG10NjU3Ny11YXJ0
IjsNCj4gPiArCQkJcmVnID0gPDAgMHgxMTAwNDAwMCAwIDB4NDAwPjsNCj4gPiArCQkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDExNyBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiA+ICsJCQljbG9ja3Mg
PSA8JmNsazI2bT4sIDwmaW5mcmFjZmdfYW8gQ0xLX0lORlJBX1VBUlQyPjsNCj4gPiArCQkJY2xv
Y2stbmFtZXMgPSAiYmF1ZCIsICJidXMiOw0KPiA+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0K
PiA+ICsJCX07DQo+IA0KPiBEZXZpY2V0cmVlIGRlc2NyaWJlcyB0aGUgSFcgd2UgaGF2ZS4gQXMg
ZmFyIGFzIEkga25vdywgd2UgaGF2ZSA0IFVBUlRzIG9uIA0KPiBNVDY3NzkuIFNvIHdlIHNob3Vs
ZCBsaXN0IHRoZW0gYWxsIGhlcmUuDQo+IA0KDQpBY3R1YWxseSwgV2UgaGF2ZSBvbmx5IDMgVUFS
VHMgSFcgb24gTVQ2Nzc5LCBidXQgaGF2ZSA0IFVBUlQgY2xrIGluDQpoZWFkZXIgZmlsZSBvZiBj
bGsuDQpDTEtfSU5GUkFfVUFSVDMgaXMgYSBkdW1teSBjbGsgaW50ZXJmYWNlLCBpdCBoYXMgbm8g
ZWZmZWN0IG9uIHRoZQ0Kb3BlcmF0aW9uIG9mIHRoZSByZWFkL3dyaXRlIGluc3RydWN0aW9uLg0K
DQpJZiB5b3UgdGhpbmsgaXQgaXMgbm90IGdvb2QsIEkgY2FuIHJlbW92ZSBpdCBpbiB0aGUgaGVh
ZGVyIGZpbGUgb2YgY2xrLg0KDQpUaGFua3MNCg0KPiBSZWdhcmRzLA0KPiBNYXR0aGlhcw0KDQo=

