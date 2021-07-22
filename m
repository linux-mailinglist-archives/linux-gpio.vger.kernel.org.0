Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7353D1F5D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 09:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbhGVHOL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 03:14:11 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:33297 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229642AbhGVHOL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jul 2021 03:14:11 -0400
X-UUID: 90015c13878b43a5a91e8a7b548399f9-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=s5IrH6wDMnuu5SjP/U4zZycyP9tIDwwTmZ6+1/spWp4=;
        b=C+TcI3toRstt2f3wGjn/WLTHgMjDIYha/xcL0cUl0l9Ra+rmBzSkG1/YPau7FNMQi7443oTPjKkEqUZ6M3a6f3t91rq5y+oXv4fYQvir4RUUvw9QORtMb8M19Q6wZjBSKbfmT61juuZBxCrhTJ4ckIdvwxGSYZOKILpnKVhVd4o=;
X-UUID: 90015c13878b43a5a91e8a7b548399f9-20210722
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1145440203; Thu, 22 Jul 2021 15:54:42 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Jul
 2021 15:54:31 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 15:54:31 +0800
Message-ID: <1626940470.29611.9.camel@mhfsdcap03>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        <hui.liu@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>,
        <light.hsieh@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <sean.wang@mediatek.com>,
        <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Date:   Thu, 22 Jul 2021 15:54:30 +0800
In-Reply-To: <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
         <20210710081722.1828-2-zhiyong.tao@mediatek.com>
         <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB56F3738648FD7331E8824085C280CA7BCABA8C103A164B942B52B347ACF8C22000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIxLTA3LTEzIGF0IDE1OjE3ICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IEhpLA0KPiANCj4gT24gU2F0LCBKdWwgMTAsIDIwMjEgYXQgNDoxNyBQTSBaaGl5b25nIFRhbyA8
emhpeW9uZy50YW9AbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRk
cyByc2VsIGRlZmluZSBmb3IgbXQ4MTk1Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWmhpeW9u
ZyBUYW8gPHpoaXlvbmcudGFvQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgaW5jbHVkZS9k
dC1iaW5kaW5ncy9waW5jdHJsL210NjV4eC5oIHwgOSArKysrKysrKysNCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQt
YmluZGluZ3MvcGluY3RybC9tdDY1eHguaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9t
dDY1eHguaA0KPiA+IGluZGV4IDdlMTZlNThmZTFmNy4uZjU5MzRhYmNkMWJkIDEwMDY0NA0KPiA+
IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDY1eHguaA0KPiA+ICsrKyBiL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDY1eHguaA0KPiA+IEBAIC0xNiw2ICsxNiwxNSBA
QA0KPiA+ICAjZGVmaW5lIE1US19QVVBEX1NFVF9SMVIwXzEwIDEwMg0KPiA+ICAjZGVmaW5lIE1U
S19QVVBEX1NFVF9SMVIwXzExIDEwMw0KPiA+DQo+ID4gKyNkZWZpbmUgTVRLX1BVTExfU0VUX1JT
RUxfMDAwICAyMDANCj4gPiArI2RlZmluZSBNVEtfUFVMTF9TRVRfUlNFTF8wMDEgIDIwMQ0KPiA+
ICsjZGVmaW5lIE1US19QVUxMX1NFVF9SU0VMXzAxMCAgMjAyDQo+ID4gKyNkZWZpbmUgTVRLX1BV
TExfU0VUX1JTRUxfMDExICAyMDMNCj4gPiArI2RlZmluZSBNVEtfUFVMTF9TRVRfUlNFTF8xMDAg
IDIwNA0KPiA+ICsjZGVmaW5lIE1US19QVUxMX1NFVF9SU0VMXzEwMSAgMjA1DQo+ID4gKyNkZWZp
bmUgTVRLX1BVTExfU0VUX1JTRUxfMTEwICAyMDYNCj4gPiArI2RlZmluZSBNVEtfUFVMTF9TRVRf
UlNFTF8xMTEgIDIwNw0KPiA+ICsNCj4gDQo+IEluc3RlYWQgb2YgYWxsIHRoZSBvYnNjdXJlIG1h
Y3JvcyBhbmQgdGhlIG5ldyBjdXN0b20gInJzZWwiIHByb3BlcnR5LA0KPiB3aGljaCBCVFcgaXMg
bm90IGluIHRoZSBiaW5kaW5ncywgY2FuJ3Qgd2UganVzdCBsaXN0IHRoZSBhY3R1YWwgYmlhcw0K
PiByZXNpc3RhbmNlIG9mIGVhY2ggc2V0dGluZz8gV2UgY291bGQgYWxzbyBtaWdyYXRlIGF3YXkg
ZnJvbSBSMVIwLg0KPiANCj09PkhpIENoZW55dSwNClRoZSByc2VsIGFjdHVhbCBiaWFzIHJlc2lz
dGFuY2Ugb2YgZWFjaCBzZXR0aW5nOg0KDQpNVEtfUFVMTF9TRVRfUlNFTF8wMDA6NzVLIGluIFBV
LCA3NWsgaW4gUEQ7DQpNVEtfUFVMTF9TRVRfUlNFTF8wMDE6MTBrIGluIFBVLCA1ayBpbiBQRDsN
Ck1US19QVUxMX1NFVF9SU0VMXzAxMDo1ayBpbiBQVSwgNzVrIGluIFBEOw0KTVRLX1BVTExfU0VU
X1JTRUxfMDExOjRrIGluIFBVLCA1SyBpbiBQRDsNCk1US19QVUxMX1NFVF9SU0VMXzEwMDozayBp
biBQVSwgNzVrIGluIFBEOw0KTVRLX1BVTExfU0VUX1JTRUxfMTAxOjJrIGluIFBVLCA1SyBpbiBQ
RDsNCk1US19QVUxMX1NFVF9SU0VMXzExMDoxLjVrIGluIFBVLCA3NWsgaW4gUEQ7DQpNVEtfUFVM
TF9TRVRfUlNFTF8xMTE6MWsgaW4gUFUsIDVrIGluIFBELg0KDQpUaGUgcnNlbCBhY3R1YWwgYmlh
cyByZXNpc3RhbmNlIGlzIGRpZmZlcmVudCBiZXR3ZWVuIFBVIGFuZCBQRC4NCg0KPiBUaGVuIHdl
IGNhbiBzcGVjaWZ5IHRoZSBzZXR0aW5nIHdpdGggdGhlIHN0YW5kYXJkIGJpYXMtcHVsbC11cC9k
b3duDQo+IHByb3BlcnRpZXMgWzFdLg0KPiANCj4gQWxzbywgcGxlYXNlIGFzayBpbnRlcm5hbGx5
IGlmIE1lZGlhdGVrIGNvdWxkIHJlbGljZW5zZSBhbGwgdGhlIGhlYWRlcg0KPiBmaWxlcyB0aGF0
IE1lZGlhdGVrIGhhcyBjb250cmlidXRlZCB1bmRlciBpbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0
cmwvIFsyXQ0KPiB0byBHUEwtMi4wIGFuZCBCU0QgZHVhbCBsaWNlbnNlLiBUaGVzZSBmaWxlcyBh
cmUgcGFydCBvZiB0aGUgRFQgYmluZGluZ3MNCj4gYW5kIHdlIHJlYWxseSB3YW50IHRoZW0gdG8g
YmUgZHVhbCBsaWNlbnNlZCBhcyB3ZWxsLCBhbmQgbm90IGp1c3QgdGhlDQo+IFlBTUwgZmlsZXMu
DQo+IA0KDQo9PT4gV2Ugd2lsbCBjb25maXJtIGl0IGludGVybmFsbHkgYW5kIHJlcGx5IGl0IGxh
dGVyLg0KDQpUaGFua3MuDQo+IA0KPiBSZWdhcmRzDQo+IENoZW5ZdQ0KPiANCj4gDQo+IFsxXSBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmNmZy1ub2RlLnlhbWwjTDM3DQo+IFsy
XSBOb3RlIHRoYXQgYSBmZXcgZmlsZXMgd2VyZSBjb250cmlidXRlZCBieSBvdGhlciBwZW9wbGUN
Cj4gDQo+ID4gICNkZWZpbmUgTVRLX0RSSVZFXzJtQSAgMg0KPiA+ICAjZGVmaW5lIE1US19EUklW
RV80bUEgIDQNCj4gPiAgI2RlZmluZSBNVEtfRFJJVkVfNm1BICA2DQo+ID4gLS0NCj4gPiAyLjE4
LjANCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiA+IExpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCg==

