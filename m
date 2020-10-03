Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98869282387
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Oct 2020 12:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgJCKG5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Oct 2020 06:06:57 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:48876 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725681AbgJCKG5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Oct 2020 06:06:57 -0400
X-UUID: 1a6aa90af3f34b229d4135d70def2dc4-20201003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=XNRzXuFMSlzxxGZrXmTzf78PDDjCanucLXGX3tXCMVc=;
        b=t0Tw5DJ7Z3pjppfPTnYfGF9fTrRsw6yRcOwXRJNTnJymGVujSqGUSxSmYbKevSuWdrFAF4i1IiEkenEUxuThmix/hlOreIFW1sKbw3+Qsbuy8DyO49E+N5seS/pVu+WiUcvTHdnmBV+JxaA78Iu2A20Um+mm+ssMqQTa3qVxu80=;
X-UUID: 1a6aa90af3f34b229d4135d70def2dc4-20201003
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1898778443; Sat, 03 Oct 2020 18:06:50 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 3 Oct 2020 18:06:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 3 Oct 2020 18:06:42 +0800
Message-ID: <1601719607.774.1.camel@mtkswgap22>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        YueHaibing <yuehaibing@huawei.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        Loda Chou <loda.chou@mediatek.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Sat, 3 Oct 2020 18:06:47 +0800
In-Reply-To: <1599546314.24690.3.camel@mtkswgap22>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
         <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
         <1599546314.24690.3.camel@mtkswgap22>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6297D8A22D190C79E560529B8B9A1614A3F0EDC1D7AD1F9E0539D6629E5EC1AA2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWljaGFlbCAmIFN0ZXBoZW4sDQoNClBsZWFzZSBraW5kbHkgbGV0IG1lIGtub3cgeW91ciBj
b21tZW50cyBhYm91dCB0aGlzIHBhdGNoLg0KVGhhbmtzDQoNClJlZ2FyZHMsDQpIYW5rcw0KDQoN
Ck9uIFR1ZSwgMjAyMC0wOS0wOCBhdCAxNDoyNSArMDgwMCwgSGFua3MgQ2hlbiB3cm90ZToNCj4g
SGkgYWxsLA0KPiANCj4gR2VudGxlIHBpbmcgb24gdGhpcyBwYXRjaC4NCj4gDQo+IFRoYW5rcw0K
PiANCj4gDQo+IEhhbmtzIENoZW4NCj4gDQo+IA0KPiBPbiBUaHUsIDIwMjAtMDctMzAgYXQgMjE6
MzAgKzA4MDAsIEhhbmtzIENoZW4gd3JvdGU6DQo+ID4gQWRkIE1UNjc3OSBVQVJUMCBjbG9jayBz
dXBwb3J0Lg0KPiA+IA0KPiA+IEZpeGVzOiA3MTA3NzRlMDQ4NjEgKCJjbGs6IG1lZGlhdGVrOiBB
ZGQgTVQ2Nzc5IGNsb2NrIHN1cHBvcnQiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlbmRlbGwgTGlu
IDx3ZW5kZWxsLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGFua3MgQ2hl
biA8aGFua3MuY2hlbkBtZWRpYXRlay5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IE1hdHRoaWFzIEJy
dWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvY2xr
L21lZGlhdGVrL2Nsay1tdDY3NzkuYyB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9j
bGstbXQ2Nzc5LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMNCj4gPiBpbmRl
eCA5NzY2Y2NjZjU4NDQuLjZlMGQzYTE2NjcyOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9j
bGstbXQ2Nzc5LmMNCj4gPiBAQCAtOTE5LDYgKzkxOSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXRrX2dhdGUgaW5mcmFfY2xrc1tdID0gew0KPiA+ICAJCSAgICAicHdtX3NlbCIsIDE5KSwNCj4g
PiAgCUdBVEVfSU5GUkEwKENMS19JTkZSQV9QV00sICJpbmZyYV9wd20iLA0KPiA+ICAJCSAgICAi
cHdtX3NlbCIsIDIxKSwNCj4gPiArCUdBVEVfSU5GUkEwKENMS19JTkZSQV9VQVJUMCwgImluZnJh
X3VhcnQwIiwNCj4gPiArCQkgICAgInVhcnRfc2VsIiwgMjIpLA0KPiA+ICAJR0FURV9JTkZSQTAo
Q0xLX0lORlJBX1VBUlQxLCAiaW5mcmFfdWFydDEiLA0KPiA+ICAJCSAgICAidWFydF9zZWwiLCAy
MyksDQo+ID4gIAlHQVRFX0lORlJBMChDTEtfSU5GUkFfVUFSVDIsICJpbmZyYV91YXJ0MiIsDQo+
IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrDQoNCg==

