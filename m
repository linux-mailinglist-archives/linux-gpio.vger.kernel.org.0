Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 625E01A0E7E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 15:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgDGNhV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 09:37:21 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:37406 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728768AbgDGNhV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2020 09:37:21 -0400
X-UUID: 54718c5495274adaa35b42087b8d6fb3-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=RdRXX8sbx8HHYtoWDp4+BPvE2rMumZFXzEadK6V6dIU=;
        b=gJSRYrHaXQFc1r524SPcwM9qUo/ejzOXONSR9Y0MIsoyiWQirls47ZIa2ELUo27R2mYJLjbe3rs5p69t4ImbJJIfWxomef7mV2n6MLTl9DgCPlNkjFu3AqRcEKGTMICWZWZDB+NnP0upeCN/HyFsywQUXb+2X55OaSgYm/qIHUQ=;
X-UUID: 54718c5495274adaa35b42087b8d6fb3-20200407
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <stanley.chu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1348218777; Tue, 07 Apr 2020 21:37:16 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 21:37:11 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 21:37:10 +0800
Message-ID: <1586266634.2221.0.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/1] pinctrl: mediatek: remove shadow variable
 declaration
From:   Stanley Chu <stanley.chu@mediatek.com>
To:     "light.hsieh@mediatek.com" <light.hsieh@mediatek.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "sean.wang@kernel.org" <sean.wang@kernel.org>,
        "Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=" 
        <kuohong.wang@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>
Date:   Tue, 7 Apr 2020 21:37:14 +0800
In-Reply-To: <1586255632-27528-1-git-send-email-light.hsieh@mediatek.com>
References: <1586255632-27528-1-git-send-email-light.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C46968FC8DEA5F527A542FEB4FA622A3AA2E7B501EEE4D5BA8AE4EEE90C277142000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGlnaHQsDQoNCk9uIFR1ZSwgMjAyMC0wNC0wNyBhdCAxODozMyArMDgwMCwgbGlnaHQuaHNp
ZWhAbWVkaWF0ZWsuY29tIHdyb3RlOg0KPiBGcm9tOiBMaWdodCBIc2llaCA8bGlnaHQuaHNpZWhA
bWVkaWF0ZWsuY29tPg0KPiANCj4gUmVtb3ZlIHNoYWRvdyBkZWNsYXJhdGlvbiBvZiB2YXJpYWJs
ZSAncHVsbHVwJyBpbiBtdGtfcGluY29uZl9nZXQoKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGln
aHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3Bp
bmN0cmwvbWVkaWF0ZWsvcGluY3RybC1wYXJpcy5jIHwgMiAtLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL3BpbmN0cmwtcGFyaXMuYyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBh
cmlzLmMNCj4gaW5kZXggODNiZjI5Yy4uOGY3NTExNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvcGluY3RybC1wYXJpcy5jDQo+IEBAIC0xNjQsOCArMTY0LDYgQEAgc3RhdGljIGlu
dCBtdGtfcGluY29uZl9nZXQoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KPiAgCWNhc2Ug
TVRLX1BJTl9DT05GSUdfUFVfQURWOg0KPiAgCWNhc2UgTVRLX1BJTl9DT05GSUdfUERfQURWOg0K
PiAgCQlpZiAoaHctPnNvYy0+YWR2X3B1bGxfZ2V0KSB7DQo+IC0JCQlib29sIHB1bGx1cDsNCj4g
LQ0KPiAgCQkJcHVsbHVwID0gcGFyYW0gPT0gTVRLX1BJTl9DT05GSUdfUFVfQURWOw0KPiAgCQkJ
ZXJyID0gaHctPnNvYy0+YWR2X3B1bGxfZ2V0KGh3LCBkZXNjLCBwdWxsdXAsICZyZXQpOw0KPiAg
CQl9IGVsc2UNCg0KUmV2aWV3ZWQtYnk6IFN0YW5sZXkgQ2h1IDxzdGFubGV5LmNodUBtZWRpYXRl
ay5jb20+DQoNCg==

