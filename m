Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99990233292
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 15:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgG3NEk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 09:04:40 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:29846 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726535AbgG3NEk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 09:04:40 -0400
X-UUID: 61cb2150daa84d339ee08bb8227ef686-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=9B9LPQrlX3PAUh89jHh+tGfGpsTtq5UlUz9JBjl2JHw=;
        b=PgrmgBWT3WZWVdd2oqwCC3x5FsNAodG5pA/++tE9xAYO/H0xDjSLafreanQQnY/OxZVmSrlHyOqpoh5RVt+opiVxr+SJffo2jLrCARkjTDAYAXg+b7k2XvPrEuorltJ63VKrkl/0KOz5QEcRgTUVyk7jjEqxT6RGEq5XJERYiTo=;
X-UUID: 61cb2150daa84d339ee08bb8227ef686-20200730
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 615329586; Thu, 30 Jul 2020 21:04:34 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 21:04:29 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 21:04:29 +0800
Message-ID: <1596114272.18804.1.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>
Date:   Thu, 30 Jul 2020 21:04:32 +0800
In-Reply-To: <252ba954-ae8f-18a3-55a3-9dd844a4d5b6@gmail.com>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
         <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
         <1595416581.5511.6.camel@mtkswgap22>
         <252ba954-ae8f-18a3-55a3-9dd844a4d5b6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FF05D014242A87BF7E5C8EAA45B129EDA2912E3E23F1213959CA97F6E6AE6AD42000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgYWxsLA0KDQpHZW50bGUgcGluZyBvbiB0aGlzIHBhdGNoLg0KDQpUaGFua3MhDQoNCkhhbmtz
IENoZW4NCg0KDQpPbiBXZWQsIDIwMjAtMDctMjIgYXQgMTc6MjEgKzAyMDAsIE1hdHRoaWFzIEJy
dWdnZXIgd3JvdGU6DQo+IA0KPiBPbiAyMi8wNy8yMDIwIDEzOjE2LCBIYW5rcyBDaGVuIHdyb3Rl
Og0KPiA+IE9uIFdlZCwgMjAyMC0wNy0yMiBhdCAxMDo0MyArMDIwMCwgTWF0dGhpYXMgQnJ1Z2dl
ciB3cm90ZToNCj4gPj4NCj4gPj4gT24gMjIvMDcvMjAyMCAwNTowOSwgSGFua3MgQ2hlbiB3cm90
ZToNCj4gPj4+IHJlbW92ZSB0aGUgcmVkdW5kYW50IGNsayBpbnRlcmZhY2Ugb2YgdWFydC4NCj4g
Pj4+IENMS19JTkZSQV9VQVJUMyBpcyBhIGR1bW15IGNsayBpbnRlcmZhY2UsDQo+ID4+PiBpdCBo
YXMgbm8gZWZmZWN0IG9uIHRoZSBvcGVyYXRpb24gb2YgdGhlIHJlYWQvd3JpdGUgaW5zdHJ1Y3Rp
b24uDQo+ID4+Pg0KPiA+Pj4gQ2hhbmdlIHNpbmNlIHYyOg0KPiA+Pj4gQ29tbWl0ICJkdC1iaW5k
aW5nczogY2xvY2s6IHJlbW92ZSBVQVJUMyBjbG9jayBzdXBwb3J0Ig0KPiA+Pg0KPiA+PiBTb3Jy
eSBqdXN0IGFub3RoZXIgY29tbWVudC4gSSB0aGluayB3ZSBjYW4gbWFrZSB0aGlzIG9uZSBwYXRj
aCBkZWxldGluZyBldmVyeXRoaW5nLg0KPiA+Pg0KPiA+IFNvcnJ5LCBJIGRvbid0IHVuZGVyc3Rh
bmQgdGhlIGNvbW1lbnQuIERvIEkgbmVlZCB0byBtZXJnZSB0aGVtIGludG8gb25lDQo+ID4gYmln
IHBhdGNoPw0KPiA+IEJ0dywgaWYgSSB1c2Ugb25lIHBhdGNoLCBJIHdvdWxkIGdldCBjaGVjayBw
YXRjaCBmYWlsLg0KPiA+IC0tLQ0KPiA+IFsyMDIwLTA3LTIyIDE5OjEyOjQ5LDA0NiBFUlJPUl0g
UnVuIGNoZWNrIHBhdGNoIHJlc3VsdHM6DQo+ID4gV0FSTklORzpEVF9TUExJVF9CSU5ESU5HX1BB
VENIOiBEVCBiaW5kaW5nIGRvY3MgYW5kIGluY2x1ZGVzIHNob3VsZCBiZSBhDQo+ID4gc2VwYXJh
dGUgcGF0Y2guIFNlZToNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3Vi
bWl0dGluZy1wYXRjaGVzLnJzdA0KPiA+IC0tLQ0KPiANCj4gSG0sIEkgdGhpbmsgdGhhdCdzIGEg
ZGViYXRhYmxlIGVycm9yIG1lc3NhZ2UgZnJvbSBjaGVja3BhdGNoLCBidXQgbGV0J3MgbGVhdmUg
aXQgDQo+IGFzIGl0IGlzLg0KPiANCj4gUmVnYXJkcywNCj4gTWF0dGhpYXMNCj4gDQo+IA0KPiA+
IA0KPiA+IEhhbmtzDQo+ID4gDQo+ID4+PiAtLSByZW1vdmUgRml4ZXMgdGFnDQo+ID4+PiBDb21t
aXQgImNsazogbWVkaWF0ZWs6IHJlbW92ZSBVQVJUMyBjbG9jayBzdXBwb3J0Ig0KPiA+Pj4gLS0g
cmVtb3ZlIEZpeGVzIHRhZw0KPiA+Pj4NCj4gPj4+IEhhbmtzIENoZW4gKDIpOg0KPiA+Pj4gICAg
IGR0LWJpbmRpbmdzOiBjbG9jazogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQNCj4gPj4+ICAg
ICBjbGs6IG1lZGlhdGVrOiByZW1vdmUgVUFSVDMgY2xvY2sgc3VwcG9ydA0KPiA+Pj4NCj4gPj4+
ICAgIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYyAgICAgIHwgMiAtLQ0KPiA+Pj4g
ICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDY3NzktY2xrLmggfCAxIC0NCj4gPj4+ICAg
IDIgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4gDQoNCg==

