Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C621F225A90
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 10:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgGTI4y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 04:56:54 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:57405 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726520AbgGTI4y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 04:56:54 -0400
X-UUID: 4a01d7cb1e3647eebc06588a2fea5b89-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=MgNXdrzLeZE2YRJkMefGfmgrOOh55MjevNByUTR3tz8=;
        b=DofieDZTFgFaGzmem3I0uQ6hOy4UDcPk21YRjPL/VoXnOW6BtMr0gWlwqOsnfBPnMvtgpnjMM1kql+Xj9IQYShBDGgev+1QZRZDJ+zmTJGlk6wzOrtvvQ5kN+3fJDEvU7hGgapl113PjvzO7HQwGNGW9CiWYd2kidvWhQP1PuQo=;
X-UUID: 4a01d7cb1e3647eebc06588a2fea5b89-20200720
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 24035279; Mon, 20 Jul 2020 16:47:39 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 20 Jul
 2020 16:47:38 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 16:47:36 +0800
Message-ID: <1595234796.31296.24.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: mt8192: add binding document
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <linus.walleij@linaro.org>, <mark.rutland@arm.com>,
        <matthias.bgg@gmail.com>, <sean.wang@kernel.org>,
        <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
        <eddie.huang@mediatek.com>, <chuanjia.liu@mediatek.com>,
        <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
        <erin.lo@mediatek.com>, <sean.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Date:   Mon, 20 Jul 2020 16:46:36 +0800
In-Reply-To: <20200710163905.GA2761779@bogus>
References: <20200710072717.3056-1-zhiyong.tao@mediatek.com>
         <20200710072717.3056-3-zhiyong.tao@mediatek.com>
         <20200710163905.GA2761779@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C74FCEDDFB4A3DAD584B2CF8ED17201D8E787AFD0D5D90C5D5FE2BDB1EE1530A2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gRnJpLCAyMDIwLTA3LTEwIGF0IDEwOjM5IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gRnJpLCBKdWwgMTAsIDIwMjAgYXQgMDM6Mjc6MTZQTSArMDgwMCwgWmhpeW9uZyBUYW8gd3Jv
dGU6DQo+ID4gVGhlIGNvbW1pdCBhZGRzIG10ODE5MiBjb21wYXRpYmxlIG5vZGUgaW4gYmluZGlu
ZyBkb2N1bWVudC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGl5b25nIFRhbyA8emhpeW9u
Zy50YW9AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvcGluY3RybC9w
aW5jdHJsLW10ODE5Mi55YW1sICAgICAgfCAxNzAgKysrKysrKysrKysrKysrKysrDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNzAgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIu
eWFtbA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbA0KPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jNjk4YjdmNjU5NTANCj4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvcGluY3RybC1tdDgxOTIueWFtbA0KPiA+IEBAIC0wLDAgKzEsMTcwIEBADQo+ID4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0K
PiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3Rp
dGxlOiBNZWRpYXRlayBNVDgxOTIgUGluIENvbnRyb2xsZXINCj4gPiArDQo+ID4gK21haW50YWlu
ZXJzOg0KPiA+ICsgIC0gTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0K
PiANCj4gU2hvdWxkIGJlIHNvbWVvbmUgd2hvIGtub3dzIHRoZSBoL3cgKE1lZGlhdGVrKS4NCj4g
DQo9PT4gDQpEZWFyIFJvYiwNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uDQp3ZSB3aWxs
IGNoYW5nZSBpdCBpbiB2Mi4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gKyAgVGhl
IE1lZGlhdGVrJ3MgUGluIGNvbnRyb2xsZXIgaXMgdXNlZCB0byBjb250cm9sIFNvQyBwaW5zLg0K
PiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgY29u
c3Q6IG1lZGlhdGVrLG10ODE5Mi1waW5jdHJsDQo+ID4gKw0KPiA+ICsgIGdwaW8tY29udHJvbGxl
cjogdHJ1ZQ0KPiA+ICsNCj4gPiArICAnI2dwaW8tY2VsbHMnOg0KPiA+ICsgICAgZGVzY3JpcHRp
b246DQo+ID4gKyAgICAgIE51bWJlciBvZiBjZWxscyBpbiBHUElPIHNwZWNpZmllci4gU2luY2Ug
dGhlIGdlbmVyaWMgR1BJTyBiaW5kaW5nIGlzIHVzZWQsDQo+ID4gKyAgICAgIHRoZSBhbW91bnQg
b2YgY2VsbHMgbXVzdCBiZSBzcGVjaWZpZWQgYXMgMi4gU2VlIHRoZSBiZWxvdw0KPiA+ICsgICAg
ICBtZW50aW9uZWQgZ3BpbyBiaW5kaW5nIHJlcHJlc2VudGF0aW9uIGZvciBkZXNjcmlwdGlvbiBv
ZiBwYXJ0aWN1bGFyIGNlbGxzLg0KPiA+ICsgICAgY29uc3Q6IDINCj4gPiArDQo+ID4gKyAgZ3Bp
by1yYW5nZXM6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogZ3BpbyB2YWxpZCBudW1iZXIgcmFuZ2Uu
DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBkZXNj
cmlwdGlvbjoNCj4gPiArICAgICAgUGh5c2ljYWwgYWRkcmVzcyBiYXNlIGZvciBncGlvIGJhc2Ug
cmVnaXN0ZXJzLiBUaGVyZSBhcmUgMTEgR1BJTw0KPiA+ICsgICAgICBwaHlzaWNhbCBhZGRyZXNz
IGJhc2UgaW4gbXQ4MTkyLg0KPiA+ICsgICAgbWF4SXRlbXM6IDExDQo+ID4gKw0KPiA+ICsgIHJl
Zy1uYW1lczoNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBHcGlvIGJhc2UgcmVn
aXN0ZXIgbmFtZXMuIFRoZXJlIGFyZSAxMSBncGlvIGJhc2UgcmVnaXN0ZXIgbmFtZXMgaW4gbXQ4
MTkyLg0KPiA+ICsgICAgICBUaGV5IGFyZSAiaW9jZmcwIiwgImlvY2ZnX3JtIiwgImlvY2ZnX2Jt
IiwgImlvY2ZnX2JsIiwgImlvY2ZnX2JyIiwNCj4gPiArICAgICAgImlvY2ZnX2xtIiwgImlvY2Zn
X2xiIiwgImlvY2ZnX3J0IiwgImlvY2ZnX2x0IiwgImlvY2ZnX3RsIiwgImVpbnQiLg0KPiANCj4g
U2hvdWxkIGJlIGEgc2NoZW1hLg0KPT0+b2ssIHdlIHdpbGwgcmV0YWluIHRoZSBkZXNjcmlwdGlv
biAiR3BpbyBiYXNlIHJlZ2lzdGVyIG5hbWVzLiIsIFRoZQ0Kb3RoZXIgZGVzY3JpcHRpb24gd2ls
bCBiZSByZW1vdmVkLiBJcyBpdCBvaz8NCj4gDQo+ID4gKyAgICBtYXhJdGVtczogMTENCj4gPiAr
DQo+ID4gKyAgaW50ZXJydXB0LWNvbnRyb2xsZXI6IHRydWUNCj4gPiArDQo+ID4gKyAgJyNpbnRl
cnJ1cHQtY2VsbHMnOg0KPiA+ICsgICAgY29uc3Q6IDINCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0
czoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGUgaW50ZXJydXB0IG91dHB1dHMgdG8gc3lzaXJx
Lg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyNQSU4gQ09ORklHVVJBVElPTiBO
T0RFUw0KPiA+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gPiArICBzdWJub2RlIGZvcm1hdDoNCj4g
DQo+IFRoZSBjaGlsZCBub2RlIG5hbWUgaXMgJ3N1Ym5vZGUgZm9ybWF0Jz8NCj4gDQpObywgJ3N1
Ym5vZGUgZm9ybWF0JyBpcyBub3QgY2hpbGQgbmFtZS4gSXQgaXMgdXNlZCB0byBkZXNjcmliZSB0
aGUNCnN1Ym5vZGUgZm9ybWF0LiBzbyB3ZSBzaG91bGQgcmVtb3ZlIGl0Pw0KPiA+ICsgICAgZGVz
Y3JpcHRpb246DQo+ID4gKyAgICAgIEEgcGluY3RybCBub2RlIHNob3VsZCBjb250YWluIGF0IGxl
YXN0IG9uZSBzdWJub2RlcyByZXByZXNlbnRpbmcgdGhlDQo+ID4gKyAgICAgIHBpbmN0cmwgZ3Jv
dXBzIGF2YWlsYWJsZSBvbiB0aGUgbWFjaGluZS4gRWFjaCBzdWJub2RlIHdpbGwgbGlzdCB0aGUN
Cj4gPiArICAgICAgcGlucyBpdCBuZWVkcywgYW5kIGhvdyB0aGV5IHNob3VsZCBiZSBjb25maWd1
cmVkLCB3aXRoIHJlZ2FyZCB0byBtdXhlcg0KPiA+ICsgICAgICBjb25maWd1cmF0aW9uLCBwdWxs
dXBzLCBkcml2ZSBzdHJlbmd0aCwgaW5wdXQgZW5hYmxlL2Rpc2FibGUgYW5kDQo+ID4gKyAgICAg
IGlucHV0IHNjaG1pdHQuDQo+ID4gKw0KPiA+ICsgICAgICBub2RlIHsNCj4gPiArICAgICAgICBw
aW5tdXggPSA8UElOX05VTUJFUl9QSU5NVVg+Ow0KPiA+ICsgICAgICAgIEdFTkVSSUNfUElOQ09O
RklHOw0KPiA+ICsgICAgICB9Ow0KPiANCj4gSWYgeW91IHdhbnQgdG8gcHJlc2VydmUgZm9ybWF0
dGluZywgZGVzY3JpcHRpb24gbmVlZHMgYSBsaXRlcmFsIGJsb2NrIA0KPiBub3RhdGlvbiBvbiB0
aGUgZW5kICgnfCcpLg0KPT0+b2ssIHdlIHdpbGwgY2hhbmdlIGl0IGluIHYyLiB3ZSB3aWxsIGFk
ZCAoJ3wnKSBhZnRlciAiZGVzY3JpcHRpb246Ig0KaW4gdjIuDQo+IA0KPiA+ICsgICctcGlubXV4
JCc6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgSW50ZWdlciBhcnJheSwgcmVw
cmVzZW50cyBncGlvIHBpbiBudW1iZXIgYW5kIG11eCBzZXR0aW5nLg0KPiA+ICsgICAgICBTdXBw
b3J0ZWQgcGluIG51bWJlciBhbmQgbXV4IHZhcmllcyBmb3IgZGlmZmVyZW50IFNvQ3MsIGFuZCBh
cmUgZGVmaW5lZA0KPiA+ICsgICAgICBhcyBtYWNyb3MgaW4gZHQtYmluZGluZ3MvcGluY3RybC88
c29jPi1waW5mdW5jLmggZGlyZWN0bHkuDQo+ID4gKyAgICAkcmVmOiAiL3NjaGVtYXMvcGluY3Ry
bC9waW5jZmctbm9kZS55YW1sIg0KPiA+ICsNCj4gPiArICBHRU5FUklDX1BJTkNPTkZJRzoNCj4g
DQo+IFlvdSBqdXN0IGRlZmluZWQgYSBwcm9wZXJ0eSBjYWxsZWQgJ0dFTkVSSUNfUElOQ09ORklH
Jy4uDQo9PT4geWVzLCBpdCBpcy4gQnV0IHdlIGFkZCBhbGwgcHJvcGVydHkgZGVzY3JpcHRpb24g
aW4gdGhlDQpHRU5FUklDX1BJTkNPTkZJRy4NCj4gLg0KPiANCj4gPiArICAgIGRlc2NyaXB0aW9u
Og0KPiA+ICsgICAgICBJdCBpcyB0aGUgZ2VuZXJpYyBwaW5jb25maWcgb3B0aW9ucyB0byB1c2Us
IGJpYXMtZGlzYWJsZSwNCj4gPiArICAgICAgYmlhcy1wdWxsLWRvd24sIGJpYXMtcHVsbC11cCwg
aW5wdXQtZW5hYmxlLCBpbnB1dC1kaXNhYmxlLCBvdXRwdXQtbG93LA0KPiA+ICsgICAgICBvdXRw
dXQtaGlnaCwgaW5wdXQtc2NobWl0dC1lbmFibGUsIGlucHV0LXNjaG1pdHQtZGlzYWJsZQ0KPiA+
ICsgICAgICBhbmQgZHJpdmUtc3RyZW5ndGggYXJlIHZhbGlkLg0KPiA+ICsNCj4gPiArICAgICAg
U29tZSBzcGVjaWFsIHBpbnMgaGF2ZSBleHRyYSBwdWxsIHVwIHN0cmVuZ3RoLCB0aGVyZSBhcmUg
UjAgYW5kIFIxIHB1bGwtdXANCj4gPiArICAgICAgcmVzaXN0b3JzIGF2YWlsYWJsZSwgYnV0IGZv
ciB1c2VyLCBpdCdzIG9ubHkgbmVlZCB0byBzZXQgUjFSMCBhcyAwMCwgMDEsDQo+ID4gKyAgICAg
IDEwIG9yIDExLiBTbyBJdCBuZWVkcyBjb25maWcgIm1lZGlhdGVrLHB1bGwtdXAtYWR2IiBvcg0K
PiA+ICsgICAgICAibWVkaWF0ZWsscHVsbC1kb3duLWFkdiIgdG8gc3VwcG9ydCBhcmd1bWVudHMg
Zm9yIHRob3NlIHNwZWNpYWwgcGlucy4NCj4gPiArICAgICAgVmFsaWQgYXJndW1lbnRzIGFyZSBm
cm9tIDAgdG8gMy4NCj4gPiArDQo+ID4gKyAgICAgIFdlIGNhbiB1c2UgIm1lZGlhdGVrLHRkc2Vs
IiB3aGljaCBpcyBhbiBpbnRlZ2VyIGRlc2NyaWJpbmcgdGhlIHN0ZXBzIGZvcg0KPiA+ICsgICAg
ICBvdXRwdXQgbGV2ZWwgc2hpZnRlciBkdXR5IGN5Y2xlIHdoZW4gYXNzZXJ0ZWQgKGhpZ2ggcHVs
c2Ugd2lkdGggYWRqdXN0bWVudCkuDQo+ID4gKyAgICAgIFZhbGlkIGFyZ3VtZW50cyAgYXJlIGZy
b20gMCB0byAxNS4NCj4gPiArICAgICAgV2UgY2FuIHVzZSAibWVkaWF0ZWsscmRzZWwiIHdoaWNo
IGlzIGFuIGludGVnZXIgZGVzY3JpYmluZyB0aGUgc3RlcHMgZm9yDQo+ID4gKyAgICAgIGlucHV0
IGxldmVsIHNoaWZ0ZXIgZHV0eSBjeWNsZSB3aGVuIGFzc2VydGVkIChoaWdoIHB1bHNlIHdpZHRo
IGFkanVzdG1lbnQpLg0KPiA+ICsgICAgICBWYWxpZCBhcmd1bWVudHMgYXJlIGZyb20gMCB0byA2
My4NCj4gPiArDQo+ID4gKyAgICAgIFdoZW4gY29uZmlnIGRyaXZlLXN0cmVuZ3RoLCBpdCBjYW4g
c3VwcG9ydCBzb21lIGFyZ3VtZW50cywgc3VjaCBhcw0KPiA+ICsgICAgICBNVEtfRFJJVkVfNG1B
LCBNVEtfRFJJVkVfNm1BLCBldGMuIFNlZSBkdC1iaW5kaW5ncy9waW5jdHJsL210NjV4eC5oLg0K
PiA+ICsgICAgICBJdCBjYW4gb25seSBzdXBwb3J0IDIvNC82LzgvMTAvMTIvMTQvMTZtQSBpbiBt
dDgxOTIuDQo+ID4gKyAgICAgIEZvciBJMkMgcGlucywgdGhlcmUgYXJlIGV4aXN0aW5nIGdlbmVy
aWMgZHJpdmluZyBzZXR1cCBhbmQgdGhlIHNwZWNpZmljDQo+ID4gKyAgICAgIGRyaXZpbmcgc2V0
dXAuIEkyQyBwaW5zIGNhbiBvbmx5IHN1cHBvcnQgMi80LzYvOC8xMC8xMi8xNC8xNm1BIGRyaXZp
bmcNCj4gPiArICAgICAgYWRqdXN0bWVudCBpbiBnZW5lcmljIGRyaXZpbmcgc2V0dXAuIEJ1dCBp
biBzcGVjaWZpYyBkcml2aW5nIHNldHVwLA0KPiA+ICsgICAgICB0aGV5IGNhbiBzdXBwb3J0IDAu
MTI1LzAuMjUvMC41LzFtQSBhZGp1c3RtZW50LiBJZiB3ZSBlbmFibGUgc3BlY2lmaWMNCj4gPiAr
ICAgICAgZHJpdmluZyBzZXR1cCBmb3IgSTJDIHBpbnMsIHRoZSBleGlzdGluZyBnZW5lcmljIGRy
aXZpbmcgc2V0dXAgd2lsbCBiZQ0KPiA+ICsgICAgICBkaXNhYmxlZC4gRm9yIHNvbWUgc3BlY2lh
bCBmZWF0dXJlcywgd2UgbmVlZCB0aGUgSTJDIHBpbnMgc3BlY2lmaWMNCj4gPiArICAgICAgZHJp
dmluZyBzZXR1cC4gVGhlIHNwZWNpZmljIGRyaXZpbmcgc2V0dXAgaXMgY29udHJvbGxlZCBieSBF
MUUwRU4uDQo+ID4gKyAgICAgIFNvIHdlIG5lZWQgYWRkIGV4dHJhIHZlbmRvciBkcml2aW5nIHBy
ZXBlcnR5IGluc3RlYWQgb2YNCj4gPiArICAgICAgdGhlIGdlbmVyaWMgZHJpdmluZyBwcm9wZXJ0
eS4NCj4gPiArICAgICAgV2UgY2FuIGFkZCAibWVkaWF0ZWssZHJpdmUtc3RyZW5ndGgtYWR2ID0g
PFhYWD47IiB0byBkZXNjcmliZSB0aGUgc3BlY2lmaWMNCj4gPiArICAgICAgZHJpdmluZyBzZXR1
cCBwcm9wZXJ0eS4gIlhYWCIgbWVhbnMgdGhlIHZhbHVlIG9mIEUxRTBFTi4gRU4gaXMgMCBvciAx
Lg0KPiA+ICsgICAgICBJdCBpcyB1c2VkIHRvIGVuYWJsZSBvciBkaXNhYmxlIHRoZSBzcGVjaWZp
YyBkcml2aW5nIHNldHVwLg0KPiA+ICsgICAgICBFMUUwIGlzIHVzZWQgdG8gZGVzY3JpYmUgdGhl
IGRldGFpbCBzdHJlbmd0aCBzcGVjaWZpY2F0aW9uIG9mIHRoZSBJMkMgcGluLg0KPiA+ICsgICAg
ICBXaGVuIEUxPTAvRTA9MCwgdGhlIHN0cmVuZ3RoIGlzIDAuMTI1bUEuDQo+ID4gKyAgICAgIFdo
ZW4gRTE9MC9FMD0xLCB0aGUgc3RyZW5ndGggaXMgMC4yNW1BLg0KPiA+ICsgICAgICBXaGVuIEUx
PTEvRTA9MCwgdGhlIHN0cmVuZ3RoIGlzIDAuNW1BLg0KPiA+ICsgICAgICBXaGVuIEUxPTEvRTA9
MSwgdGhlIHN0cmVuZ3RoIGlzIDFtQS4NCj4gPiArICAgICAgU28gdGhlIHZhbGlkIGFyZ3VtZW50
cyBvZiAibWVkaWF0ZWssZHJpdmUtc3RyZW5ndGgtYWR2IiBhcmUgZnJvbSAwIHRvIDcuDQo+ID4g
Kw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+
ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsgIC0gaW50ZXJydXB0LWNvbnRyb2xsZXINCj4gPiArICAt
ICcjaW50ZXJydXB0LWNlbGxzJw0KPiA+ICsgIC0gZ3Bpby1jb250cm9sbGVyDQo+ID4gKyAgLSAn
I2dwaW8tY2VsbHMnDQo+ID4gKyAgLSBncGlvLXJhbmdlcw0KPiA+ICsNCj4gPiArZXhhbXBsZXM6
DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAgICAgICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5j
dHJsL210ODE5Mi1waW5mdW5jLmg+DQo+ID4gKyAgICAgICAgICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4gKyAgICAgICAgICAgIHBp
bzogcGluY3RybEAxMDAwNTAwMCB7DQo+IA0KPiBEcm9wIHVudXNlZCBsYWJlbHMuDQo9PT4gd2Ug
d2lsbCBjaGFuZ2UgaXQgaW4gdjIuDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXBpbmN0cmwiOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgIHJlZyA9IDwwIDB4MTAwMDUwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwwIDB4MTFjMjAwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwwIDB4MTFkMTAwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwwIDB4MTFkMzAwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwwIDB4MTFkNDAwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwwIDB4MTFlMjAwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwwIDB4MTFlNzAwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwwIDB4MTFlYTAwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwwIDB4MTFmMjAwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwwIDB4MTFmMzAwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwwIDB4MTAwMGIwMDAgMCAweDEwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgIHJlZy1uYW1lcyA9ICJpb2NmZzAiLCAiaW9jZmdfcm0iLCAiaW9jZmdfYm0iLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICJpb2NmZ19ibCIsICJpb2NmZ19iciIsICJpb2NmZ19s
bSIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgImlvY2ZnX2xiIiwgImlvY2ZnX3J0
IiwgImlvY2ZnX2x0IiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAiaW9jZmdfdGwi
LCAiZWludCI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgZ3Bpby1jb250cm9sbGVyOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICNncGlvLWNlbGxzID0gPDI+Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgIGdwaW8tcmFuZ2VzID0gPCZwaW8gMCAwIDIyMD47DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDIxMiBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgaTJjMF9waW5zX2E6IGkyYzAgew0KPiANCj4gRG9lc24ndCBtYXRjaCB0aGUg
c2NoZW1hLg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgcGlucyB7DQo+IA0KPiBE
b2Vzbid0IG1hdGNoIHRoZSBzY2hlbWEuIFdoeSBkbyB5b3UgbmVlZCAyIGxldmVscyBvZiBub2Rl
cyBoZXJlPw0KPT0+IElzICBUaGUgMiBsZXZlbHMgb2Ygbm9kZXMgImkyYzAiIGFuZCAiSTJjMSI/
IHdlIGp1c3QgbGlzdCB0aGVtIGFzDQpleGFtcGxlLiBCZWNhdXNlIHBpbm11eCBhbmQgZ3BpbyBz
ZXR0aW5nIHByb3BlcnR5IGFyZSBjYWxsZWQgd2hlbiBvdGhlcg0KbW9kdWxlcyBpcyByZWdpc3Rl
cmVkLiBGb3IgZXhhbXBsZSwgd2hlbiB3ZSBhZGQgdGhlDQpkZXNjcmlwdGlvbiJwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOyBwaW5jdHJsLTAgPSA8JmkyYzBfcGluc19hPjsiIGluDQppMmMwIG5v
ZGUuIGl0IHdpbGwgYWJvdmUgcHJvcGVydHkgc2V0dGluZyB3aGVuIGkyYzAgaXMgcmVnaXN0ZXIu
DQpEbyB5b3UgbWVhbiB0aGF0IHdlIGRvbid0IG5lZWQgYWRkIHRoZW0gaGVyZT8gSWYgaXQgaXMu
IFdlIHdpbGwgcmVtb3ZlDQoiaTJjMCIgYW5kICJJMmMxIiAgcHJvcGVydHkgc2V0dGluZyBpbiB2
Mi4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPFBJ
Tk1VWF9HUElPMTE4X19GVU5DX1NDTDE+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDxQSU5NVVhfR1BJTzExOV9fRlVOQ19TREExPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBtZWRpYXRlayxwdWxsLXVwLWFkdiA9IDwzPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZWRpYXRlayxkcml2ZS1zdHJlbmd0
aC1hZHYgPSA8Nz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAgICAgICBpMmMxX3BpbnNfYTog
aTJjMSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHBpbnMgew0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxQSU5NVVhfR1BJTzE0MV9fRlVOQ19T
Q0wyPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UElO
TVVYX0dQSU8xNDJfX0ZVTkNfU0RBMj47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWVkaWF0ZWsscHVsbC1kb3duLWFkdiA9IDwyPjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBtZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1hZHYgPSA8ND47DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAgICAgIH07DQo+
ID4gKyAgICAgICAgICAgIH07DQo+ID4gLS0gDQo+ID4gMi4xOC4wDQoNCg==

