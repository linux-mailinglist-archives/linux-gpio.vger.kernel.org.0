Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BFE34CEC9
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbhC2LXx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:23:53 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:64250 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232454AbhC2LX1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 07:23:27 -0400
X-UUID: 637f2a78da4843cba6fa98dd58edd6b0-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=e+j3HOJYkEgb4OFdcu6vsVJWYgl5xZHQHq7OrdvlVdk=;
        b=fvqRQz4vub0rn+hY9GXwfnflPZeII3egNZf+hCvN+GJ/lr5VH2NOjgp4rC3PEdaSa2bN4h8jHpIkRertFNScEx2a23EPIc1RuOCaJnDFFM2C9Z4xs5wgJC4UJskxBRLG/0PSM6GM9T7Y0e+cB2N5vl5q8AuyAbN6/TZ/09W4w3U=;
X-UUID: 637f2a78da4843cba6fa98dd58edd6b0-20210329
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1676497308; Mon, 29 Mar 2021 19:23:21 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 29 Mar
 2021 19:23:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 19:23:16 +0800
Message-ID: <1617016996.10316.5.camel@mhfsdcap03>
Subject: Re: [PATCH Resend 0/6] Mediatek pinctrl patch on mt8195
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        <hui.liu@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>,
        <jg_poxu@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <erin.lo@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        Sj Huang <sj.huang@mediatek.com>,
        devicetree <devicetree@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Date:   Mon, 29 Mar 2021 19:23:16 +0800
In-Reply-To: <CAHp75Vcms=dAXcACraU4BHENee6j+CTwQtMVtURdnMHVAmTXkw@mail.gmail.com>
References: <20210329080611.9312-1-zhiyong.tao@mediatek.com>
         <CAHp75Vcms=dAXcACraU4BHENee6j+CTwQtMVtURdnMHVAmTXkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9B1EC72129735A46A7FFA3D75144C8A618421BEB0AA235F01220821420B777472000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gTW9uLCAyMDIxLTAzLTI5IGF0IDEzOjQ3ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIE1vbiwgTWFyIDI5LCAyMDIxIGF0IDExOjA5IEFNIFpoaXlvbmcgVGFvIDx6aGl5b25n
LnRhb0BtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gVGhpcyBzZXJpZXMgaW5jbHVkZXMg
NiBwYXRjaGVzOg0KPiA+IDEuYWRkIHBpbmN0cmwgZmlsZSBvbiBtdDgxOTUuDQo+ID4gMi5hZGQg
cGluY3RybCBiaW5kaW5nIGRvY3VtZW50IG9uIG10ODE5NS4NCj4gPiAzLmFkZCBwaW5jdHJsIGRl
dmljZSBub2RlIG9uIG10ODE5NS4NCj4gPiA0LmFkZCBwaW5jdHJsIGRyaXZlciBvbiBNVDgxOTUu
DQo+ID4gNS5hZGQgcGluY3RybCBkcml2ZSBmb3IgSTJDIHJlbGF0ZWQgcGlucyBvbiBNVDgxOTUu
DQo+ID4gNi5hZGQgcGluY3RybCByc2VsIHNldHRpbmcgb24gTVQ4MTk1Lg0KPiANCj4gWW91IHN1
Ym1pdHRlZCB0aGUgc2FtZSB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMgdHdpY2UsIGJ1dCBpdCBjb25m
dXNlcyBwZW9wbGUuDQo+IE5vdyB5b3UgaGF2ZSB0byBwcm9wZXJseSBzZW5kIHRoZSBzZXJpZXMg
b25seSBvbmUgdGltZSB3aXRoIHRoZQ0KPiBjb3JyZWN0IHZlcnNpb24gYWRkZWQgYW5kIGNoYW5n
ZWxvZyBleHBsYWlucyB0aGUgY2hhbmdlcyBkb25lIGJldHdlZW4NCj4gdGhlIHZlcnNpb25zLg0K
PiANCj4gDQoNCj09PiBIaSwgQW5keSwNClRoZXJlIGFyZSBubyBjaGFuZ2UgYmV0d2VlbiB0aGUg
dHdvIHZlcnNpb24uDQpCZWNhdXNlIHdlIGdldCB0aGUgcmVmdXNlZCBtYWlsIGZyb20NCiJsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmciLg0KVGhlIGVycm9yIG1haWw6DQpEZWxp
dmVyeSBoYXMgZmFpbGVkIHRvIHRoZXNlIHJlY2lwaWVudHMgb3IgZ3JvdXBzOg0KbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQpBIHByb2JsZW0gb2NjdXJyZWQgd2hpbGUgZGVs
aXZlcmluZyB0aGlzIG1lc3NhZ2UgdG8gdGhpcyBlbWFpbCBhZGRyZXNzLg0KVHJ5IHNlbmRpbmcg
dGhpcyBtZXNzYWdlIGFnYWluLiBJZiB0aGUgcHJvYmxlbSBjb250aW51ZXMsIHBsZWFzZSBjb250
YWN0DQp5b3VyIGhlbHBkZXNrLg0KVGhlIGZvbGxvd2luZyBvcmdhbml6YXRpb24gcmVqZWN0ZWQg
eW91ciBtZXNzYWdlOiBkZXNpYXRvLmluZnJhZGVhZC5vcmcNCls5MC4xNTUuOTIuMTk5XS4NCg0K
V2Ugd2lsbCBzZW5kIHYwIHZlcnNpb24gIGFuZCBhZGQgdjAgdmVyc2lvbiBpbiBldmVyeSBwYXRj
aCBuZXh0IHRpbWUuDQoNClRoYW5rcy4NCg0K

