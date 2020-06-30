Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84C320EC44
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 05:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729355AbgF3D5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 23:57:02 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:27191 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726710AbgF3D5A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2020 23:57:00 -0400
X-UUID: b9632d1a4fa94819ad44fda2f8b56f45-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=4lUxsw7V57/rtfRfCgvAn7FcvMGUUtdcRvghF/iSYBM=;
        b=PGUP9isYSLXgVE94dGfV09wr2suqppJLTq5ls9fhkpFM5nD8P4AgWooGath4CBESIm81MFRE+RKHwF1A/AXde7a2ISp1RBN6ljJwN4aAyWbAOQk0zdvVuk/+tsXZtboDihm/S3Mi2NBmjiwC4MZzvbVdbPJuUYTI4Ho6gsLk3Rc=;
X-UUID: b9632d1a4fa94819ad44fda2f8b56f45-20200630
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1543449792; Tue, 30 Jun 2020 11:56:55 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 11:56:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 11:56:47 +0800
Message-ID: <1593489406.20357.3.camel@mtkswgap22>
Subject: Re: [PATCH v6 1/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <wsd_upstream@mediatek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <linux-kernel@vger.kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        "Loda Chou" <loda.chou@mediatek.com>, <linux-clk@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 Jun 2020 11:56:46 +0800
In-Reply-To: <20200629215331.GA2991039@bogus>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
         <1592480018-3340-2-git-send-email-hanks.chen@mediatek.com>
         <20200629215331.GA2991039@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ADC1B506D8928896ABE48FDF843DCAE64088D056FDD7FFEC2981FE32960985E62000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gTW9uLCAyMDIwLTA2LTI5IGF0IDE1OjUzIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVGh1LCAxOCBKdW4gMjAyMCAxOTozMzozMiArMDgwMCwgSGFua3MgQ2hlbiB3cm90ZToNCj4g
PiBGcm9tOiBBbmR5IFRlbmcgPGFuZHkudGVuZ0BtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gQWRk
IGRldmljZXRyZWUgYmluZGluZ3MgZm9yIE1lZGlhVGVrIE1UNjc3OSBwaW5jdHJsIGRyaXZlci4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFRlbmcgPGFuZHkudGVuZ0BtZWRpYXRlay5j
b20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1w
aW5jdHJsLnlhbWwgIHwgIDIxMCArKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMjEwIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJs
LnlhbWwNCj4gPiANCj4gDQo+IA0KPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2Ug
ZHRfYmluZGluZ19jaGVjaycgb24geW91ciBwYXRjaDoNCj4gDQo+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJsLmV4YW1wbGUu
ZHRzOjIxOjE4OiBmYXRhbCBlcnJvcjogZHQtYmluZGluZ3MvcGluY3RybC9tdDY3NzktcGluZnVu
Yy5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+ICAgICAgICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9waW5jdHJsL210Njc3OS1waW5mdW5jLmg+DQo+ICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IGNvbXBpbGF0aW9uIHRlcm1p
bmF0ZWQuDQo+IHNjcmlwdHMvTWFrZWZpbGUubGliOjMxNTogcmVjaXBlIGZvciB0YXJnZXQgJ0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1w
aW5jdHJsLmV4YW1wbGUuZHQueWFtbCcgZmFpbGVkDQo+IG1ha2VbMV06ICoqKiBbRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ2Nzc5LXBpbmN0cmwu
ZXhhbXBsZS5kdC55YW1sXSBFcnJvciAxDQo+IG1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZp
bmlzaGVkIGpvYnMuLi4uDQo+IE1ha2VmaWxlOjEzNDc6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkdF9i
aW5kaW5nX2NoZWNrJyBmYWlsZWQNCj4gbWFrZTogKioqIFtkdF9iaW5kaW5nX2NoZWNrXSBFcnJv
ciAyDQo+IA0KPiANCj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTMx
MjAxOA0KPiANCj4gSWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFu
ZCBkaWRuJ3Qgc2VlIHRoZSBhYm92ZQ0KPiBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUgZHQtc2No
ZW1hIGlzIHVwIHRvIGRhdGU6DQo+IA0KPiBwaXAzIGluc3RhbGwgZ2l0K2h0dHBzOi8vZ2l0aHVi
LmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hlbWEuZ2l0QG1hc3RlciAtLXVwZ3JhZGUNCj4gDQo+
IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0Lg0KPiANCkkgYWxyZWFkeSByYW4gdGhlIGR0X2Jp
bmRpbmdfY2hlY2sgYW5kIGl0IGxvb2tzIGdvb2QuDQoNCj4gDQo+IA0KPiBIZXJlLCB5b3UgbmVl
ZCBwYXRjaCAyIHRvIGNvbWUgZmlyc3Qgb3IgbWVyZ2UgaXQgaW50byB0aGlzIHBhdGNoIGFzIGl0
IA0KPiBpcyBwYXJ0IG9mIHRoZSBiaW5kaW5nLg0KPiANCkknbGwgbWVyZ2UgaXQgaW50byB0aGlz
IHBhdGNoIGluIG5leHQgdmVyc2lvbi4NClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50Lg0KDQpI
YW5rcw0KDQo+IFJvYg0KPiANCg0K

