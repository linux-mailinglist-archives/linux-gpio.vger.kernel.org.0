Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D33821D491
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 13:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgGMLLV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 07:11:21 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:30583 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727890AbgGMLLV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 07:11:21 -0400
X-UUID: 769eda0855344af89307eb0a729d908b-20200713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=q42cPTjFuRIZprsAfqDWm9AEfpK4UiJ6KtTPS0h5+gQ=;
        b=dalbMtPHsYCfr+r3BRPVH2AY+70HcHJ/jTZX2aVoadN7tBsdL9FyPz8mi5OL8//bsV3AaeRoU3xn7c18LHJvO4QWDNNfdeG2MlRYZqP83ehBSw5vj3o4EEeCG/cFAdnTv/a5sDeLJGS9MadUPsK1w3yEZ8XIjTrW4ShU/aHsCII=;
X-UUID: 769eda0855344af89307eb0a729d908b-20200713
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 602377913; Mon, 13 Jul 2020 19:11:18 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jul 2020 19:11:14 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 19:11:14 +0800
Message-ID: <1594638676.29621.1.camel@mtkswgap22>
Subject: Re: [PATCH v7 7/7] arm64: dts: add dts nodes for MT6779
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
Date:   Mon, 13 Jul 2020 19:11:16 +0800
In-Reply-To: <2eee3a1f-464a-359e-e7d3-0d331c8898ed@gmail.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
         <1593694630-26604-9-git-send-email-hanks.chen@mediatek.com>
         <2eee3a1f-464a-359e-e7d3-0d331c8898ed@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gRnJpLCAyMDIwLTA3LTEwIGF0IDE1OjQ3ICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMDIvMDcvMjAyMCAxNDo1NywgSGFua3MgQ2hlbiB3cm90ZToNCj4gPiB0aGlz
IGFkZHMgaW5pdGlhbCBNVDY3NzkgZHRzIHNldHRpbmdzIGZvciBib2FyZCBzdXBwb3J0LA0KPiA+
IGluY2x1ZGluZyBjcHUsIGdpYywgdGltZXIsIGNjZiwgcGluY3RybCwgdWFydCwgc3lzaXJxLi4u
ZXRjLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEhhbmtzIENoZW4gPGhhbmtzLmNoZW5AbWVk
aWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9N
YWtlZmlsZSAgICAgICB8ICAgIDEgKw0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDY3NzktZXZiLmR0cyB8ICAgMzEgKysrDQo+ID4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210Njc3OS5kdHNpICAgIHwgIDI3MSArKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMzAzIGluc2VydGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Njc3OS1ldmIuZHRzDQo+
ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3
NzkuZHRzaQ0KPiA+IA0KPiBbLi4uXQ0KPiA+ICsNCj4gPiArCQl1YXJ0Mjogc2VyaWFsQDExMDA0
MDAwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NzktdWFydCIsDQo+ID4g
KwkJCQkgICAgICJtZWRpYXRlayxtdDY1NzctdWFydCI7DQo+ID4gKwkJCXJlZyA9IDwwIDB4MTEw
MDQwMDAgMCAweDQwMD47DQo+ID4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTcgSVJRX1RZ
UEVfTEVWRUxfTE9XPjsNCj4gPiArCQkJY2xvY2tzID0gPCZjbGsyNm0+LCA8JmluZnJhY2ZnX2Fv
IENMS19JTkZSQV9VQVJUMT47DQo+IA0KPiBJIHN1cHBvc2UgdGhhdCBzaG91bGQgYmU6DQo+IA0K
PiBjbG9ja3MgPSA8JmNsazI2bT4sIDwmaW5mcmFjZmdfYW8gQ0xLX0lORlJBX1VBUlQyPjsNCj4g
DQpNeSBmYXVsdCwgSSdsbCBmaXggdGhlIHR5cG8gaW4gbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3Mh
DQoNCkhhbmtzDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IE1hdHRoaWFzDQo+IA0KPiA+ICsJCQljbG9j
ay1uYW1lcyA9ICJiYXVkIiwgImJ1cyI7DQo+ID4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+
ID4gKwkJfTsNCj4gPiArDQo+ID4gKwkJYXVkaW86IGNsb2NrLWNvbnRyb2xsZXJAMTEyMTAwMDAg
ew0KPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS1hdWRpbyIsICJzeXNjb24i
Ow0KPiA+ICsJCQlyZWcgPSA8MCAweDExMjEwMDAwIDAgMHgxMDAwPjsNCj4gPiArCQkJI2Nsb2Nr
LWNlbGxzID0gPDE+Ow0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJCW1mZ2NmZzogY2xvY2stY29u
dHJvbGxlckAxM2ZiZjAwMCB7DQo+ID4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2Nzc5
LW1mZ2NmZyIsICJzeXNjb24iOw0KPiA+ICsJCQlyZWcgPSA8MCAweDEzZmJmMDAwIDAgMHgxMDAw
PjsNCj4gPiArCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJ
CW1tc3lzOiBzeXNjb25AMTQwMDAwMDAgew0KPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10Njc3OS1tbXN5cyIsICJzeXNjb24iOw0KPiA+ICsJCQlyZWcgPSA8MCAweDE0MDAwMDAwIDAg
MHgxMDAwPjsNCj4gPiArCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiA+ICsJCX07DQo+ID4gKw0K
PiA+ICsJCWltZ3N5czogY2xvY2stY29udHJvbGxlckAxNTAyMDAwMCB7DQo+ID4gKwkJCWNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ2Nzc5LWltZ3N5cyIsICJzeXNjb24iOw0KPiA+ICsJCQlyZWcg
PSA8MCAweDE1MDIwMDAwIDAgMHgxMDAwPjsNCj4gPiArCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0K
PiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJCXZkZWNzeXM6IGNsb2NrLWNvbnRyb2xsZXJAMTYwMDAw
MDAgew0KPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS12ZGVjc3lzIiwgInN5
c2NvbiI7DQo+ID4gKwkJCXJlZyA9IDwwIDB4MTYwMDAwMDAgMCAweDEwMDA+Ow0KPiA+ICsJCQkj
Y2xvY2stY2VsbHMgPSA8MT47DQo+ID4gKwkJfTsNCj4gPiArDQo+ID4gKwkJdmVuY3N5czogY2xv
Y2stY29udHJvbGxlckAxNzAwMDAwMCB7DQo+ID4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ2Nzc5LXZlbmNzeXMiLCAic3lzY29uIjsNCj4gPiArCQkJcmVnID0gPDAgMHgxNzAwMDAwMCAw
IDB4MTAwMD47DQo+ID4gKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCj4gPiArCQl9Ow0KPiA+ICsN
Cj4gPiArCQljYW1zeXM6IGNsb2NrLWNvbnRyb2xsZXJAMWEwMDAwMDAgew0KPiA+ICsJCQljb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS1jYW1zeXMiLCAic3lzY29uIjsNCj4gPiArCQkJcmVn
ID0gPDAgMHgxYTAwMDAwMCAwIDB4MTAwMDA+Ow0KPiA+ICsJCQkjY2xvY2stY2VsbHMgPSA8MT47
DQo+ID4gKwkJfTsNCj4gPiArDQo+ID4gKwkJaXBlc3lzOiBjbG9jay1jb250cm9sbGVyQDFiMDAw
MDAwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NzktaXBlc3lzIiwgInN5
c2NvbiI7DQo+ID4gKwkJCXJlZyA9IDwwIDB4MWIwMDAwMDAgMCAweDEwMDA+Ow0KPiA+ICsJCQkj
Y2xvY2stY2VsbHMgPSA8MT47DQo+ID4gKwkJfTsNCj4gPiArDQo+ID4gKwl9Ow0KPiA+ICt9Ow0K
PiA+IA0KDQo=

