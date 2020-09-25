Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922B42788B5
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 14:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729150AbgIYMvF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 08:51:05 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:40893 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729140AbgIYMvF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 08:51:05 -0400
X-UUID: a07de3bf1ad3412e90aebe65da80587d-20200925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=KDuRXITI29rGTc4me2UihJK6MXBboba2ogqxBZTeDyM=;
        b=LZbanRdgaV82/7Bm21yNV4GUuvSVDezPoBuqTKvak+GfrPzd5UCTqI3Iy2rOEaW7Bas1omTEmpDW0O+B2fM8iSf4edvA1OU02/QONOhwdyONorrelxdMYbe/cemOtaOVEIZGTJXq/Gbgb1lAK1TUxsiSas6hU+zgLwkEUWgKOkw=;
X-UUID: a07de3bf1ad3412e90aebe65da80587d-20200925
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 231553404; Fri, 25 Sep 2020 20:51:00 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 20:50:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 20:50:57 +0800
Message-ID: <1601038258.15065.4.camel@mtkswgap22>
Subject: Re: [PATCH v2] pinctrl: mediatek: check mtk_is_virt_gpio input
 parameter
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
        sin_jieyang <sin_jieyang@mediatek.com>
Date:   Fri, 25 Sep 2020 20:50:58 +0800
In-Reply-To: <1597922546-29633-1-git-send-email-hanks.chen@mediatek.com>
References: <1597922546-29633-1-git-send-email-hanks.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgU2VhbiAmIExpbnV4ICYgTWF0dGhpYXMsDQoNClBsZWFzZSBraW5kbHkgbGV0IG1lIGtub3cg
eW91ciBjb21tZW50cyBhYm91dCB0aGlzIGZpeGVzIHBhdGNoLg0KVGhhbmtzDQoNClJlZ2FyZHMs
DQpIYW5rcw0KDQoNCk9uIFRodSwgMjAyMC0wOC0yMCBhdCAxOToyMiArMDgwMCwgSGFua3MgQ2hl
biB3cm90ZToNCj4gY2hlY2sgbXRrX2lzX3ZpcnRfZ3BpbyBpbnB1dCBwYXJhbWV0ZXIsDQo+IHZp
cnR1YWwgZ3BpbyBuZWVkIHRvIHN1cHBvcnQgZWludCBtb2RlLg0KPiANCj4gYWRkIGVycm9yIGhh
bmRsZXIgZm9yIHRoZSBrbyBjYXNlDQo+IHRvIGZpeCB0aGlzIGJvb3QgZmFpbDoNCj4gcGMgOiBt
dGtfaXNfdmlydF9ncGlvKzB4MjAvMHgzOCBbcGluY3RybF9tdGtfY29tbW9uX3YyXQ0KPiBsciA6
IG10a19ncGlvX2dldF9kaXJlY3Rpb24rMHg0NC8weGIwIFtwaW5jdHJsX3BhcmlzXQ0KPiANCj4g
Rml4ZXM6IGVkZDU0NjQ2NTAwMiAoInBpbmN0cmw6IG1lZGlhdGVrOiBhdm9pZCB2aXJ0dWFsIGdw
aW8gdHJ5aW5nIHRvIHNldCByZWciKQ0KPiBTaW5nZWQtb2ZmLWJ5OiBKaWUgWWFuZyA8c2luX2pp
ZXlhbmdAbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBIYW5rcyBDaGVuIDxoYW5rcy5j
aGVuQG1lZGlhdGVrLmNvbT4NCj4gDQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAtIHVw
ZGF0ZSBTaW5nZWQtb2ZmLWJ5DQo+IC0gYWxpZ24gd2l0aCBwaW5jdHJsL21lZGlhdGVrL3BpbmN0
cmwtbXRrLW10Ki5oIA0KPiANCj4gLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdGstY29tbW9uLXYyLmMgfCA0ICsrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdGstY29tbW9uLXYyLmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1t
dGstY29tbW9uLXYyLmMNCj4gaW5kZXggYzUzZTJjMzkxZTMyLi5hNDg1ZDc5ZjUxYTEgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24tdjIu
Yw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYy
LmMNCj4gQEAgLTI1OSw2ICsyNTksMTAgQEAgYm9vbCBtdGtfaXNfdmlydF9ncGlvKHN0cnVjdCBt
dGtfcGluY3RybCAqaHcsIHVuc2lnbmVkIGludCBncGlvX24pDQo+ICANCj4gIAlkZXNjID0gKGNv
bnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKikmaHctPnNvYy0+cGluc1tncGlvX25dOw0KPiAgDQo+
ICsJLyogaWYgdGhlIEdQSU8gaXMgbm90IHN1cHBvcnRlZCBmb3IgZWludCBtb2RlICovDQo+ICsJ
aWYgKGRlc2MtPmVpbnQuZWludF9tID09IE5PX0VJTlRfU1VQUE9SVCkNCj4gKwkJcmV0dXJuIHZp
cnRfZ3BpbzsNCj4gKw0KPiAgCWlmIChkZXNjLT5mdW5jcyAmJiAhZGVzYy0+ZnVuY3NbZGVzYy0+
ZWludC5laW50X21dLm5hbWUpDQo+ICAJCXZpcnRfZ3BpbyA9IHRydWU7DQo+ICANCg0K

