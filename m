Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92ED34F583
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 02:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbhCaAct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 20:32:49 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:13077 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232812AbhCaAcj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 20:32:39 -0400
X-UUID: 3b620f5789f040b58e1d623ca5e5f01e-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=DXPc7QmuVWhuN+C5z7frEfmFSAwLLesUieWs9jVeZXQ=;
        b=ZIUjiD6L4vqVXZL6sF9W5z1cQ+GG+yJwtNzRFFccFvvos3aGDxvyJucFTBhvmKLirF7rToRkeBRiFEClwxVX6lk6zmFVmokpXQ3sPGhR4wMeqwWMPDZ29Jv40COPEpX+FjWG7dWFyEswAwWhax9bpPXKJQS9e0855HtOICh6Kl8=;
X-UUID: 3b620f5789f040b58e1d623ca5e5f01e-20210331
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1003236120; Wed, 31 Mar 2021 08:32:34 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar
 2021 08:32:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 08:32:24 +0800
Message-ID: <1617150743.10316.18.camel@mhfsdcap03>
Subject: Re: [PATCH Resend v0 2/6] dt-bindings: pinctrl: mt8195: add binding
 document
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <biao.huang@mediatek.com>,
        <linus.walleij@linaro.org>, <hongzhou.yang@mediatek.com>,
        <srv_heupstream@mediatek.com>, <jg_poxu@mediatek.com>,
        <devicetree@vger.kernel.org>, <mark.rutland@arm.com>,
        <matthias.bgg@gmail.com>, <sean.wang@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <erin.lo@mediatek.com>,
        <hui.liu@mediatek.com>, <sean.wang@kernel.org>,
        <sj.huang@mediatek.com>, <eddie.huang@mediatek.com>,
        <linux-mediatek@lists.infradead.org>, <seiya.wang@mediatek.com>
Date:   Wed, 31 Mar 2021 08:32:23 +0800
In-Reply-To: <20210330133913.GA212608@robh.at.kernel.org>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
         <20210329113103.11003-3-zhiyong.tao@mediatek.com>
         <1617045684.216718.2905695.nullmailer@robh.at.kernel.org>
         <1617095128.10316.14.camel@mhfsdcap03>
         <20210330133913.GA212608@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A48D422117B9453A0B782F79C39ADB8FF7E7B8CFD789280697FA7F235F1D758D2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIxLTAzLTMwIGF0IDA4OjM5IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVHVlLCBNYXIgMzAsIDIwMjEgYXQgMDU6MDU6MjhQTSArMDgwMCwgemhpeW9uZyB0YW8gd3Jv
dGU6DQo+ID4gT24gTW9uLCAyMDIxLTAzLTI5IGF0IDE0OjIxIC0wNTAwLCBSb2IgSGVycmluZyB3
cm90ZToNCj4gPiA+IE9uIE1vbiwgMjkgTWFyIDIwMjEgMTk6MzA6NTkgKzA4MDAsIFpoaXlvbmcg
VGFvIHdyb3RlOg0KPiA+ID4gPiBUaGUgY29tbWl0IGFkZHMgbXQ4MTk1IGNvbXBhdGlibGUgbm9k
ZSBpbiBiaW5kaW5nIGRvY3VtZW50Lg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
WmhpeW9uZyBUYW8gPHpoaXlvbmcudGFvQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4g
PiA+ICAuLi4vYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5NS55YW1sICAgICAgfCAxNTIg
KysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTUyIGluc2VydGlv
bnMoKykNCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5NS55YW1sDQo+ID4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVj
aycgb24geW91ciBwYXRjaDoNCj4gPiA+IA0KPiA+ID4geWFtbGxpbnQgd2FybmluZ3MvZXJyb3Jz
Og0KPiA+ID4gDQo+ID4gPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOg0KPiA+ID4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTUuZXhh
bXBsZS5kdHM6MTk6MTg6IGZhdGFsIGVycm9yOiBkdC1iaW5kaW5ncy9waW5jdHJsL210ODE5NS1w
aW5mdW5jLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4gPiA+ICAgIDE5IHwgICAgICAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9tdDgxOTUtcGluZnVuYy5oPg0KPiA+ID4g
ICAgICAgfCAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+DQo+ID4gPiBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLg0KPiA+ID4gbWFrZVsxXTogKioq
IFtzY3JpcHRzL01ha2VmaWxlLmxpYjozNDk6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTk1LmV4YW1wbGUuZHQueWFtbF0gRXJyb3IgMQ0KPiA+
ID4gbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCj4gPiA+IG1h
a2U6ICoqKiBbTWFrZWZpbGU6MTM4MDogZHRfYmluZGluZ19jaGVja10gRXJyb3IgMg0KPiA+ID4g
DQo+ID4gPiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xNDU5NTU4DQo+
ID4gPiANCj4gPiA+IFRoaXMgY2hlY2sgY2FuIGZhaWwgaWYgdGhlcmUgYXJlIGFueSBkZXBlbmRl
bmNpZXMuIFRoZSBiYXNlIGZvciBhIHBhdGNoDQo+ID4gPiBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRo
ZSBtb3N0IHJlY2VudCByYzEuDQo+ID4gPiANCj4gPiA+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFr
ZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUNCj4gPiA+IGVycm9y
KHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1h
IGlzIHVwIHRvDQo+ID4gPiBkYXRlOg0KPiA+ID4gDQo+ID4gPiBwaXAzIGluc3RhbGwgZHRzY2hl
bWEgLS11cGdyYWRlDQo+ID4gPiANCj4gPiA+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0Lg0K
PiA+ID4gDQo+ID4gDQo+ID4gPT0+IEkgc2V0IHRoZSBwYXRjaCBmaWxlICJtdDgxOTUtcGluZnVu
Yy5oIiBwYXRjaCBpbiAiNC82Ii4gc28gd2Ugc2hvdWxkDQo+ID4gYWRkIHRoZSBmaWxlICJtdDgx
OTUtcGluZnVuYy5oIiBpbiB0aGlzIHBhdGNoID8gb3Igd2Ugc2hvdWxkIHB1dCBpdA0KPiA+IGJl
Zm9yZSB0aGlzIHBhdGNoKDIvNik/DQo+IA0KPiBJdCBpcyBwYXJ0IG9mIHRoZSBiaW5kaW5nLCBz
byBpdCBiZWxvbmdzIGluIHRoaXMgcGF0Y2guDQo+IA0KPiBSb2INCg0KPT0+IFRoYW5rcyBmb3Ig
eW91ciBzdWdnZXN0aW9uLiBXZSB3aWxsIGFkZCBpdCBpbiB0aGlzIHBhdGNoIGluIG5leHQNCnZl
cnNpb24uDQoNCg==

