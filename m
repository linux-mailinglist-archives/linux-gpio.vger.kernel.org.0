Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007B5278778
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 14:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbgIYMnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 08:43:41 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:33073 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727132AbgIYMnl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 08:43:41 -0400
X-UUID: 23bf95cf5e8f49a7963bc3e590f18c70-20200925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ornwd0xIbodqPslY6x5SaQbP0oSnDGkJiLJuG7h19MQ=;
        b=K/ZWuELZEScysC9PBj6873h2NS5Xjmh/gJYAhmAjRRioEmYc3vwY3jJ3Kejf+2qB9SVGxO/cU3IaAUJ1ECshv0v1hL7oYxG2nRsi59KLv6k4vWZNmGsRE6Cwzc/9AKONfnA7GlvwCqlht5Iwd7uL5oBn68p3qfCtt0cWtnVNrxE=;
X-UUID: 23bf95cf5e8f49a7963bc3e590f18c70-20200925
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 977183465; Fri, 25 Sep 2020 20:43:38 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 20:43:36 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 20:43:35 +0800
Message-ID: <1601037817.15065.1.camel@mtkswgap22>
Subject: Re: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
        <wsd_upstream@mediatek.com>, YueHaibing <yuehaibing@huawei.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Fri, 25 Sep 2020 20:43:37 +0800
In-Reply-To: <1599546695.24690.5.camel@mtkswgap22>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
         <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
         <1595416581.5511.6.camel@mtkswgap22>
         <252ba954-ae8f-18a3-55a3-9dd844a4d5b6@gmail.com>
         <1596114272.18804.1.camel@mtkswgap22> <1599546695.24690.5.camel@mtkswgap22>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWljaGFlbCAmIFN0ZXBoZW4sDQoNCkdlbnRsZSBwaW5nIG9uIHRoaXMgY2xrIHBhdGNoLg0K
DQpUaGFua3MuDQoNClJlZ2FyZHMsDQpIYW5rcw0KDQoNCk9uIFR1ZSwgMjAyMC0wOS0wOCBhdCAx
NDozMSArMDgwMCwgSGFua3MgQ2hlbiB3cm90ZToNCj4gSGkgYWxsLA0KPiANCj4gR2VudGxlIHBp
bmcgb24gdGhpcyBwYXRjaCBzZXQuDQo+IA0KPiBUaGFua3MhDQo+IA0KPiANCj4gSGFua3MgQ2hl
bg0KPiANCj4gDQo+IE9uIFRodSwgMjAyMC0wNy0zMCBhdCAyMTowNCArMDgwMCwgSGFua3MgQ2hl
biB3cm90ZToNCj4gPiBIaSBhbGwsDQo+ID4gDQo+ID4gR2VudGxlIHBpbmcgb24gdGhpcyBwYXRj
aC4NCj4gPiANCj4gPiBUaGFua3MhDQo+ID4gDQo+ID4gSGFua3MgQ2hlbg0KPiA+IA0KPiA+IA0K
PiA+IE9uIFdlZCwgMjAyMC0wNy0yMiBhdCAxNzoyMSArMDIwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3
cm90ZToNCj4gPiA+IA0KPiA+ID4gT24gMjIvMDcvMjAyMCAxMzoxNiwgSGFua3MgQ2hlbiB3cm90
ZToNCj4gPiA+ID4gT24gV2VkLCAyMDIwLTA3LTIyIGF0IDEwOjQzICswMjAwLCBNYXR0aGlhcyBC
cnVnZ2VyIHdyb3RlOg0KPiA+ID4gPj4NCj4gPiA+ID4+IE9uIDIyLzA3LzIwMjAgMDU6MDksIEhh
bmtzIENoZW4gd3JvdGU6DQo+ID4gPiA+Pj4gcmVtb3ZlIHRoZSByZWR1bmRhbnQgY2xrIGludGVy
ZmFjZSBvZiB1YXJ0Lg0KPiA+ID4gPj4+IENMS19JTkZSQV9VQVJUMyBpcyBhIGR1bW15IGNsayBp
bnRlcmZhY2UsDQo+ID4gPiA+Pj4gaXQgaGFzIG5vIGVmZmVjdCBvbiB0aGUgb3BlcmF0aW9uIG9m
IHRoZSByZWFkL3dyaXRlIGluc3RydWN0aW9uLg0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gQ2hhbmdl
IHNpbmNlIHYyOg0KPiA+ID4gPj4+IENvbW1pdCAiZHQtYmluZGluZ3M6IGNsb2NrOiByZW1vdmUg
VUFSVDMgY2xvY2sgc3VwcG9ydCINCj4gPiA+ID4+DQo+ID4gPiA+PiBTb3JyeSBqdXN0IGFub3Ro
ZXIgY29tbWVudC4gSSB0aGluayB3ZSBjYW4gbWFrZSB0aGlzIG9uZSBwYXRjaCBkZWxldGluZyBl
dmVyeXRoaW5nLg0KPiA+ID4gPj4NCj4gPiA+ID4gU29ycnksIEkgZG9uJ3QgdW5kZXJzdGFuZCB0
aGUgY29tbWVudC4gRG8gSSBuZWVkIHRvIG1lcmdlIHRoZW0gaW50byBvbmUNCj4gPiA+ID4gYmln
IHBhdGNoPw0KPiA+ID4gPiBCdHcsIGlmIEkgdXNlIG9uZSBwYXRjaCwgSSB3b3VsZCBnZXQgY2hl
Y2sgcGF0Y2ggZmFpbC4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IFsyMDIwLTA3LTIyIDE5OjEyOjQ5
LDA0NiBFUlJPUl0gUnVuIGNoZWNrIHBhdGNoIHJlc3VsdHM6DQo+ID4gPiA+IFdBUk5JTkc6RFRf
U1BMSVRfQklORElOR19QQVRDSDogRFQgYmluZGluZyBkb2NzIGFuZCBpbmNsdWRlcyBzaG91bGQg
YmUgYQ0KPiA+ID4gPiBzZXBhcmF0ZSBwYXRjaC4gU2VlOg0KPiA+ID4gPiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdA0KPiA+ID4gPiAtLS0N
Cj4gPiA+IA0KPiA+ID4gSG0sIEkgdGhpbmsgdGhhdCdzIGEgZGViYXRhYmxlIGVycm9yIG1lc3Nh
Z2UgZnJvbSBjaGVja3BhdGNoLCBidXQgbGV0J3MgbGVhdmUgaXQgDQo+ID4gPiBhcyBpdCBpcy4N
Cj4gPiA+IA0KPiA+ID4gUmVnYXJkcywNCj4gPiA+IE1hdHRoaWFzDQo+ID4gPiANCj4gPiA+IA0K
PiA+ID4gPiANCj4gPiA+ID4gSGFua3MNCj4gPiA+ID4gDQo+ID4gPiA+Pj4gLS0gcmVtb3ZlIEZp
eGVzIHRhZw0KPiA+ID4gPj4+IENvbW1pdCAiY2xrOiBtZWRpYXRlazogcmVtb3ZlIFVBUlQzIGNs
b2NrIHN1cHBvcnQiDQo+ID4gPiA+Pj4gLS0gcmVtb3ZlIEZpeGVzIHRhZw0KPiA+ID4gPj4+DQo+
ID4gPiA+Pj4gSGFua3MgQ2hlbiAoMik6DQo+ID4gPiA+Pj4gICAgIGR0LWJpbmRpbmdzOiBjbG9j
azogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQNCj4gPiA+ID4+PiAgICAgY2xrOiBtZWRpYXRl
azogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQNCj4gPiA+ID4+Pg0KPiA+ID4gPj4+ICAgIGRy
aXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYyAgICAgIHwgMiAtLQ0KPiA+ID4gPj4+ICAg
IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ2Nzc5LWNsay5oIHwgMSAtDQo+ID4gPiA+Pj4g
ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4gPj4+DQo+ID4gPiA+IA0K
PiA+IA0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+ID4gTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiBM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0K

