Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0FB260AFC
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 08:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728838AbgIHGbm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 02:31:42 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:53472 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728501AbgIHGbm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 02:31:42 -0400
X-UUID: 0261aafbd25f48abb6b2b3ea0e3e5a84-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=UZzo7qmXCyALSuToyb3vvmrBpWA69LVmzt4LRB/qeiQ=;
        b=ZYveQDH6XVVIMBwYuEOqnQrp53Y5yIcV6hrCQ5hnjYZ3leSxv8vATtmGBNcWoGEufJsIAhdJHSqVwKD9xT6uCyZvCjc3XLAVwqLwnUPcCTZ1sFWIkbDKcbZ8E2fLAYfucpcT78EJC0PB9pjMT3QR/hX8bV62YQJ3Axb9v/ECets=;
X-UUID: 0261aafbd25f48abb6b2b3ea0e3e5a84-20200908
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1594504922; Tue, 08 Sep 2020 14:31:38 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 14:31:35 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Sep 2020 14:31:36 +0800
Message-ID: <1599546695.24690.5.camel@mtkswgap22>
Subject: Re: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     CC Hwang <cc.hwang@mediatek.com>, <wsd_upstream@mediatek.com>,
        YueHaibing <yuehaibing@huawei.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Tue, 8 Sep 2020 14:31:35 +0800
In-Reply-To: <1596114272.18804.1.camel@mtkswgap22>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
         <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
         <1595416581.5511.6.camel@mtkswgap22>
         <252ba954-ae8f-18a3-55a3-9dd844a4d5b6@gmail.com>
         <1596114272.18804.1.camel@mtkswgap22>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 76787EE110FFF9F4F0880A7419F16CD0727562E97C40491A1E90F6A9E641C2B82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgYWxsLA0KDQpHZW50bGUgcGluZyBvbiB0aGlzIHBhdGNoIHNldC4NCg0KVGhhbmtzIQ0KDQoN
CkhhbmtzIENoZW4NCg0KDQpPbiBUaHUsIDIwMjAtMDctMzAgYXQgMjE6MDQgKzA4MDAsIEhhbmtz
IENoZW4gd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+IEdlbnRsZSBwaW5nIG9uIHRoaXMgcGF0Y2gu
DQo+IA0KPiBUaGFua3MhDQo+IA0KPiBIYW5rcyBDaGVuDQo+IA0KPiANCj4gT24gV2VkLCAyMDIw
LTA3LTIyIGF0IDE3OjIxICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOg0KPiA+IA0KPiA+
IE9uIDIyLzA3LzIwMjAgMTM6MTYsIEhhbmtzIENoZW4gd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIw
MjAtMDctMjIgYXQgMTA6NDMgKzAyMDAsIE1hdHRoaWFzIEJydWdnZXIgd3JvdGU6DQo+ID4gPj4N
Cj4gPiA+PiBPbiAyMi8wNy8yMDIwIDA1OjA5LCBIYW5rcyBDaGVuIHdyb3RlOg0KPiA+ID4+PiBy
ZW1vdmUgdGhlIHJlZHVuZGFudCBjbGsgaW50ZXJmYWNlIG9mIHVhcnQuDQo+ID4gPj4+IENMS19J
TkZSQV9VQVJUMyBpcyBhIGR1bW15IGNsayBpbnRlcmZhY2UsDQo+ID4gPj4+IGl0IGhhcyBubyBl
ZmZlY3Qgb24gdGhlIG9wZXJhdGlvbiBvZiB0aGUgcmVhZC93cml0ZSBpbnN0cnVjdGlvbi4NCj4g
PiA+Pj4NCj4gPiA+Pj4gQ2hhbmdlIHNpbmNlIHYyOg0KPiA+ID4+PiBDb21taXQgImR0LWJpbmRp
bmdzOiBjbG9jazogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQiDQo+ID4gPj4NCj4gPiA+PiBT
b3JyeSBqdXN0IGFub3RoZXIgY29tbWVudC4gSSB0aGluayB3ZSBjYW4gbWFrZSB0aGlzIG9uZSBw
YXRjaCBkZWxldGluZyBldmVyeXRoaW5nLg0KPiA+ID4+DQo+ID4gPiBTb3JyeSwgSSBkb24ndCB1
bmRlcnN0YW5kIHRoZSBjb21tZW50LiBEbyBJIG5lZWQgdG8gbWVyZ2UgdGhlbSBpbnRvIG9uZQ0K
PiA+ID4gYmlnIHBhdGNoPw0KPiA+ID4gQnR3LCBpZiBJIHVzZSBvbmUgcGF0Y2gsIEkgd291bGQg
Z2V0IGNoZWNrIHBhdGNoIGZhaWwuDQo+ID4gPiAtLS0NCj4gPiA+IFsyMDIwLTA3LTIyIDE5OjEy
OjQ5LDA0NiBFUlJPUl0gUnVuIGNoZWNrIHBhdGNoIHJlc3VsdHM6DQo+ID4gPiBXQVJOSU5HOkRU
X1NQTElUX0JJTkRJTkdfUEFUQ0g6IERUIGJpbmRpbmcgZG9jcyBhbmQgaW5jbHVkZXMgc2hvdWxk
IGJlIGENCj4gPiA+IHNlcGFyYXRlIHBhdGNoLiBTZWU6DQo+ID4gPiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdA0KPiA+ID4gLS0tDQo+ID4g
DQo+ID4gSG0sIEkgdGhpbmsgdGhhdCdzIGEgZGViYXRhYmxlIGVycm9yIG1lc3NhZ2UgZnJvbSBj
aGVja3BhdGNoLCBidXQgbGV0J3MgbGVhdmUgaXQgDQo+ID4gYXMgaXQgaXMuDQo+ID4gDQo+ID4g
UmVnYXJkcywNCj4gPiBNYXR0aGlhcw0KPiA+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBIYW5rcw0K
PiA+ID4gDQo+ID4gPj4+IC0tIHJlbW92ZSBGaXhlcyB0YWcNCj4gPiA+Pj4gQ29tbWl0ICJjbGs6
IG1lZGlhdGVrOiByZW1vdmUgVUFSVDMgY2xvY2sgc3VwcG9ydCINCj4gPiA+Pj4gLS0gcmVtb3Zl
IEZpeGVzIHRhZw0KPiA+ID4+Pg0KPiA+ID4+PiBIYW5rcyBDaGVuICgyKToNCj4gPiA+Pj4gICAg
IGR0LWJpbmRpbmdzOiBjbG9jazogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQNCj4gPiA+Pj4g
ICAgIGNsazogbWVkaWF0ZWs6IHJlbW92ZSBVQVJUMyBjbG9jayBzdXBwb3J0DQo+ID4gPj4+DQo+
ID4gPj4+ICAgIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYyAgICAgIHwgMiAtLQ0K
PiA+ID4+PiAgICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210Njc3OS1jbGsuaCB8IDEgLQ0K
PiA+ID4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+ID4gPj4+DQo+ID4g
PiANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiBMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsNCg0K

