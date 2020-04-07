Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECB481A0E87
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 15:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgDGNlp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 09:41:45 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:7166 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728573AbgDGNlp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2020 09:41:45 -0400
X-UUID: dfbf9dd631bd4f5693f93839923541e8-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=I+Idz2kS2YO8DN7EbW71q3QgUKuFjlpxCMebxFehMZE=;
        b=LDGiTVjxygBOmbSSvdxYCQmSpHbtihQnuFr4bslpdD7ArdBogzLYkIttZ3NSi/58Tz1Q6OkAzKL7BJ2xOEvys7aDdbC8ByQCOmusz54qDgdMrDdSNWhHxujp+1Gmal2mHJj6b4ykSswtjnd9Z04ZriY15n4PU0hXs162IxGQoS0=;
X-UUID: dfbf9dd631bd4f5693f93839923541e8-20200407
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1937740329; Tue, 07 Apr 2020 21:41:33 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 21:41:22 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 21:41:23 +0800
Message-ID: <1586266885.31587.1.camel@mtksdaap41>
Subject: Re: [PATCH v1 1/1] pinctrl: mediatek: remove shadow variable
 declaration
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     <light.hsieh@mediatek.com>
CC:     <linus.walleij@linaro.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date:   Tue, 7 Apr 2020 21:41:25 +0800
In-Reply-To: <1586255632-27528-1-git-send-email-light.hsieh@mediatek.com>
References: <1586255632-27528-1-git-send-email-light.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTA0LTA3IGF0IDE4OjMzICswODAwLCBsaWdodC5oc2llaEBtZWRpYXRlay5j
b20gd3JvdGU6DQo+IEZyb206IExpZ2h0IEhzaWVoIDxsaWdodC5oc2llaEBtZWRpYXRlay5jb20+
DQo+IA0KPiBSZW1vdmUgc2hhZG93IGRlY2xhcmF0aW9uIG9mIHZhcmlhYmxlICdwdWxsdXAnIGlu
IG10a19waW5jb25mX2dldCgpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaWdodCBIc2llaCA8bGln
aHQuaHNpZWhAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9waW5jdHJsLXBhcmlzLmMgfCAyIC0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1w
YXJpcy5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KPiBpbmRl
eCA4M2JmMjljLi44Zjc1MTE1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0
ZWsvcGluY3RybC1wYXJpcy5jDQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5j
dHJsLXBhcmlzLmMNCj4gQEAgLTE2NCw4ICsxNjQsNiBAQCBzdGF0aWMgaW50IG10a19waW5jb25m
X2dldChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsDQo+ICAJY2FzZSBNVEtfUElOX0NPTkZJ
R19QVV9BRFY6DQo+ICAJY2FzZSBNVEtfUElOX0NPTkZJR19QRF9BRFY6DQo+ICAJCWlmIChody0+
c29jLT5hZHZfcHVsbF9nZXQpIHsNCj4gLQkJCWJvb2wgcHVsbHVwOw0KPiAtDQo+ICAJCQlwdWxs
dXAgPSBwYXJhbSA9PSBNVEtfUElOX0NPTkZJR19QVV9BRFY7DQo+ICAJCQllcnIgPSBody0+c29j
LT5hZHZfcHVsbF9nZXQoaHcsIGRlc2MsIHB1bGx1cCwgJnJldCk7DQo+ICAJCX0gZWxzZQ0KDQpI
aSwgTGlnaHQsDQoNCldoYXQgaXMgdGhpcyBiYXNlZCBvbj8NClRoZSBjb2RlIGluIHY1LjYgZG9l
c24ndCBsb29rcyBsaWtlIHRoaXMuDQoNCkpvZS5DDQoNCg0K

