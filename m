Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E737834E3E1
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 11:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhC3JGI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 05:06:08 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:7217 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231522AbhC3JFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 05:05:55 -0400
X-UUID: 89391d7b3651478c95b9a2985ac7472e-20210330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=0jO6xeRsQ4jm7S6lv/3PLYAMuG5ayJ2hlvYykhUxsUg=;
        b=Vyfl9nsEiTWpQhRA0JlqN2sAQIkhCIe9fvrw0YKx6R1TPoF1lmtczwzG0LdCzltKY4kE/CwGUkUn8WpfbCY0q1kdyW28nwNelM74NhUQGy+cmVjqPwTWhB9Bjy1iI+WbdLV7FIqDQjAAc9m6BVmPnFhYzqlQVKVPjKNLIm/bQok=;
X-UUID: 89391d7b3651478c95b9a2985ac7472e-20210330
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1830614071; Tue, 30 Mar 2021 17:05:43 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Mar
 2021 17:05:29 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Mar 2021 17:05:28 +0800
Message-ID: <1617095128.10316.14.camel@mhfsdcap03>
Subject: Re: [PATCH Resend v0 2/6] dt-bindings: pinctrl: mt8195: add binding
 document
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <biao.huang@mediatek.com>,
        <linus.walleij@linaro.org>, <hongzhou.yang@mediatek.com>,
        <srv_heupstream@mediatek.com>, <jg_poxu@mediatek.com>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
        <erin.lo@mediatek.com>, <hui.liu@mediatek.com>,
        <sean.wang@kernel.org>, <sj.huang@mediatek.com>,
        <eddie.huang@mediatek.com>, <linux-mediatek@lists.infradead.org>,
        <seiya.wang@mediatek.com>
Date:   Tue, 30 Mar 2021 17:05:28 +0800
In-Reply-To: <1617045684.216718.2905695.nullmailer@robh.at.kernel.org>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
         <20210329113103.11003-3-zhiyong.tao@mediatek.com>
         <1617045684.216718.2905695.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0EE61755A50B7A5DFF0EE25D2179DAD17B45A583EA5951AF67F4FD18FEE88B562000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gTW9uLCAyMDIxLTAzLTI5IGF0IDE0OjIxIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gTW9uLCAyOSBNYXIgMjAyMSAxOTozMDo1OSArMDgwMCwgWmhpeW9uZyBUYW8gd3JvdGU6DQo+
ID4gVGhlIGNvbW1pdCBhZGRzIG10ODE5NSBjb21wYXRpYmxlIG5vZGUgaW4gYmluZGluZyBkb2N1
bWVudC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGl5b25nIFRhbyA8emhpeW9uZy50YW9A
bWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvcGluY3RybC9waW5jdHJs
LW10ODE5NS55YW1sICAgICAgfCAxNTIgKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxNTIgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTUueWFtbA0K
PiA+IA0KPiANCj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdf
Y2hlY2snIG9uIHlvdXIgcGF0Y2g6DQo+IA0KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+
IA0KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOg0KPiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5NS5leGFtcGxlLmR0czoxOToxODog
ZmF0YWwgZXJyb3I6IGR0LWJpbmRpbmdzL3BpbmN0cmwvbXQ4MTk1LXBpbmZ1bmMuaDogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiAgICAxOSB8ICAgICAgICAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL3BpbmN0cmwvbXQ4MTk1LXBpbmZ1bmMuaD4NCj4gICAgICAgfCAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IGNvbXBpbGF0aW9uIHRl
cm1pbmF0ZWQuDQo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5saWI6MzQ5OiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5NS5leGFt
cGxlLmR0LnlhbWxdIEVycm9yIDENCj4gbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNo
ZWQgam9icy4uLi4NCj4gbWFrZTogKioqIFtNYWtlZmlsZToxMzgwOiBkdF9iaW5kaW5nX2NoZWNr
XSBFcnJvciAyDQo+IA0KPiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8x
NDU5NTU4DQo+IA0KPiBUaGlzIGNoZWNrIGNhbiBmYWlsIGlmIHRoZXJlIGFyZSBhbnkgZGVwZW5k
ZW5jaWVzLiBUaGUgYmFzZSBmb3IgYSBwYXRjaA0KPiBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBt
b3N0IHJlY2VudCByYzEuDQo+IA0KPiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGlu
Z19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlDQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ug
c3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvDQo+IGRh
dGU6DQo+IA0KPiBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2Ug
Y2hlY2sgYW5kIHJlLXN1Ym1pdC4NCj4gDQoNCj09PiBJIHNldCB0aGUgcGF0Y2ggZmlsZSAibXQ4
MTk1LXBpbmZ1bmMuaCIgcGF0Y2ggaW4gIjQvNiIuIHNvIHdlIHNob3VsZA0KYWRkIHRoZSBmaWxl
ICJtdDgxOTUtcGluZnVuYy5oIiBpbiB0aGlzIHBhdGNoID8gb3Igd2Ugc2hvdWxkIHB1dCBpdA0K
YmVmb3JlIHRoaXMgcGF0Y2goMi82KT8NCg0KVGhhbmtzLg0KDQo=

