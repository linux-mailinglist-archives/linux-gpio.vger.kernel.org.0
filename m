Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A48B255301
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 04:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgH1CYB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 22:24:01 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41216 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727124AbgH1CYA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 22:24:00 -0400
X-UUID: e134271c78e54a76a16e26c7aff23bc8-20200828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=8zZiHLm4/AXz1qOVzkvhLK1XMcwwYt53KrQz1ufHVMk=;
        b=CbWgt/q+f1kVXUIZC6RvgPGqnU8wpamfCwq/L4xzmEAq1OZ9H7ZFLZRh9uRsOKHx5/YMumlC0oYI0Pzpbxgch7CKvkaMP3htGDFriw27VoBTpXSSKTc69HLmO0MdsiAxyGtKV4rGYl9NVhVrOVDrj1XY7K2kI4yQNsuJvl63rUE=;
X-UUID: e134271c78e54a76a16e26c7aff23bc8-20200828
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1482325862; Fri, 28 Aug 2020 10:23:55 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 10:23:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Aug 2020 10:23:53 +0800
Message-ID: <1598581434.5835.2.camel@mtksdaap41>
Subject: Re: [PATCH v4 0/3] Mediatek pinctrl patch on mt8192
From:   CK Hu <ck.hu@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
        <srv_heupstream@mediatek.com>,
        Chuanjia Liu <chuanjia.liu@mediatek.com>,
        "Biao Huang" <biao.huang@mediatek.com>,
        Erin Lo <erin.lo@mediatek.com>, <hui.liu@mediatek.com>,
        <seiya.wang@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <sin_jieyang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        Sean Wang <sean.wang@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        huang eddie <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>
Date:   Fri, 28 Aug 2020 10:23:54 +0800
In-Reply-To: <CACRpkdYedyDcnL5DUD33Z2iT1jEJ_W1gvB_a8VaFnNAH1mKgzQ@mail.gmail.com>
References: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
         <CACRpkdYedyDcnL5DUD33Z2iT1jEJ_W1gvB_a8VaFnNAH1mKgzQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIExpbnVzOg0KDQpPbiBUaHUsIDIwMjAtMDgtMjcgYXQgMTA6NTIgKzAyMDAsIExpbnVzIFdh
bGxlaWogd3JvdGU6DQo+IE9uIE1vbiwgQXVnIDE3LCAyMDIwIGF0IDI6MTggQU0gWmhpeW9uZyBU
YW8gPHpoaXlvbmcudGFvQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+IA0KPiA+IFRoaXMgc2VyaWVz
IGluY2x1ZGVzIDMgcGF0Y2hlczoNCj4gPiAxLmFkZCBwaW5jdHJsIGZpbGUgb24gbXQ4MTkyLg0K
PiA+IDIuYWRkIHBpbmN0cmwgYmluZGluZyBkb2N1bWVudCBvbiBtdDgxOTIuDQo+ID4gMy5hZGQg
cGluY3RybCBkcml2ZXIgb24gTVQ4MTkyLg0KPiANCj4gUGF0Y2hlcyBhcHBsaWVkIGZvciB2NS4x
MCENCg0KSSBkb2VzIG5vdCBzZWUgdGhlc2UgcGF0Y2hlcyBpbiB5b3VyIHRyZWUgWzFdLCBoYXZl
IHlvdSBhcHBsaWVkIHRoZW0/IEkNCndvdWxkIGxpa2UgdG8gcGljayB0aGVzZSBwYXRjaGVzIGZy
b20geW91ciB0cmVlLg0KDQpbMV0NCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L2xpbnVzdy9saW51eC1waW5jdHJsLmdpdC8NCg0KUmVnYXJkcywNCkNLDQoN
Cj4gVGhhbmtzIQ0KPiBMaW51cyBXYWxsZWlqDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QN
Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCg==

