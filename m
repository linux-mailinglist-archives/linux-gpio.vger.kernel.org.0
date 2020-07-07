Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9CE216B71
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 13:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgGGLZf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 07:25:35 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:3217 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727044AbgGGLZf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 07:25:35 -0400
X-UUID: 1a1278ba04a84476844e6203b60a745f-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=vfvjtfH3Qs6aHOw/QXhcQ51ZF1iRs+TYc8vvEskKgac=;
        b=a4lwH1jhsqzlod4taTS95VZTNCoYXO3ItijaP8jF5e/2Mimn5KW7Kt4ejWZ5YJVTYxSrKcTDqyHwHVkQR1IjhC36+k6nwULgHw0Y+2+TKSA8Z/plz7na4EqiL20klEDy8HzRe8J+6NO3e/W7TMCUkPabj6i9QQGHrIdSHDTRUPk=;
X-UUID: 1a1278ba04a84476844e6203b60a745f-20200707
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 522712986; Tue, 07 Jul 2020 19:25:30 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 19:25:25 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 19:25:26 +0800
Message-ID: <1594121128.20610.9.camel@mtkswgap22>
Subject: Re: [PATCH v7 0/7] Add basic SoC Support for Mediatek MT6779 SoC
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Date:   Tue, 7 Jul 2020 19:25:28 +0800
In-Reply-To: <1593694630-26604-2-git-send-email-hanks.chen@mediatek.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
         <1593694630-26604-2-git-send-email-hanks.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 054C2A82F4257DC0A2C98A1257360749210D114C218370F82C156C88CC470A042000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWljaGFlbCwgU3RlcGhlbiwgTWF0dGhpYXMgYW5kIGFsbCwNCg0KZ2VudGxlIHBpbmcgZm9y
IHRoaXMgcGF0Y2ggc2V0DQoNCklmIG5vIG5ldyBjb21tZW50cywgSSB3b3VsZCBsaWtlIHRvIHNl
bmQgYSBuZXdlciB2ZXJzaW9uIGZvciB0aGUgc2VyaWVzLg0KDQpwYXRjaCBzZXQ6DQpodHRwczov
L2xrbWwub3JnL2xrbWwvMjAyMC83LzIvNDk3DQoNCg0KVGhhbmtzDQpIYW5rcyBDaGVuDQoNCg0K
T24gVGh1LCAyMDIwLTA3LTAyIGF0IDIwOjU3ICswODAwLCBIYW5rcyBDaGVuIHdyb3RlOg0KPiAq
KiogQkxVUkIgSEVSRSAqKioNCj4gDQo+IEFuZHkgVGVuZyAoMSk6DQo+ICAgZHQtYmluZGluZ3M6
IHBpbmN0cmw6IGFkZCBiaW5kaW5ncyBmb3IgTWVkaWFUZWsgTVQ2Nzc5IFNvQw0KPiANCj4gSGFu
a3MgQ2hlbiAoNik6DQo+ICAgcGluY3RybDogbWVkaWF0ZWs6IHVwZGF0ZSBwaW5tdXggZGVmaW5p
dGlvbnMgZm9yIG10Njc3OQ0KPiAgIHBpbmN0cmw6IG1lZGlhdGVrOiBhdm9pZCB2aXJ0dWFsIGdw
aW8gdHJ5aW5nIHRvIHNldCByZWcNCj4gICBwaW5jdHJsOiBtZWRpYXRlazogYWRkIHBpbmN0cmwg
c3VwcG9ydCBmb3IgTVQ2Nzc5IFNvQw0KPiAgIHBpbmN0cmw6IG1lZGlhdGVrOiBhZGQgbXQ2Nzc5
IGVpbnQgc3VwcG9ydA0KPiAgIGNsazogbWVkaWF0ZWs6IGFkZCBVQVJUMCBjbG9jayBzdXBwb3J0
DQo+ICAgYXJtNjQ6IGR0czogYWRkIGR0cyBub2RlcyBmb3IgTVQ2Nzc5DQo+IA0KPiAgLi4uL2Jp
bmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ2Nzc5LXBpbmN0cmwueWFtbCAgfCAgMjEwICsrDQo+
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICB8ICAg
IDEgKw0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3NzktZXZiLmR0cyAgICAg
ICAgfCAgIDMxICsNCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2Nzc5LmR0c2kg
ICAgICAgICAgIHwgIDI3MSArKysNCj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3Nzku
YyAgICAgICAgICAgICAgICAgIHwgICAgMiArDQo+ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAgMTIgKw0KPiAgZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgICAxICsNCj4gIGRyaXZlcnMvcGlu
Y3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc3OS5jICAgICAgICAgIHwgIDc4MyArKysrKysrKw0K
PiAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jICAgfCAg
IDI1ICsNCj4gIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24tdjIu
aCAgIHwgICAgMSArDQo+ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ2
Nzc5LmggICAgICB8IDIwODUgKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmMgICAgICAgICAgIHwgICAgNyArDQo+ICBpbmNsdWRl
L2R0LWJpbmRpbmdzL3BpbmN0cmwvbXQ2Nzc5LXBpbmZ1bmMuaCAgICAgICB8IDEyNDIgKysrKysr
KysrKysrDQo+ICAxMyBmaWxlcyBjaGFuZ2VkLCA0NjcxIGluc2VydGlvbnMoKykNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9t
ZWRpYXRlayxtdDY3NzktcGluY3RybC55YW1sDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3NzktZXZiLmR0cw0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2Nzc5LmR0c2kNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NzkuYw0KPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1t
dDY3NzkuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3Ry
bC9tdDY3NzktcGluZnVuYy5oDQo+IA0KDQo=

