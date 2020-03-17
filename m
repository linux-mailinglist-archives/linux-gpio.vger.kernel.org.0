Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6CDD187C06
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2020 10:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgCQJ25 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Mar 2020 05:28:57 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:43246 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725730AbgCQJ24 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2020 05:28:56 -0400
X-UUID: 4e2a6919cd614f4b911b5e93c50896c1-20200317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=caBY5KaLBvbbFihcSr1PWRfxvxROOG5oXS91E6JZO7o=;
        b=fmVRythI/bDR5VQc/ca29cvuySrkeEeuriLbKZxgqgx8kvdCOcJSOioufGDXm7O5J6S0QhgAH4dF2RfAGOMucnzOyWG69EoJAhB/8E9TLc5k/AjYVqPVPa0X3eIsQoNAmgyh0bELQpexrAI3n8sjUwKe3h4tSEcrK1q1doCUOPw=;
X-UUID: 4e2a6919cd614f4b911b5e93c50896c1-20200317
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1665547931; Tue, 17 Mar 2020 17:28:52 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Mar 2020 17:26:28 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 17 Mar 2020 17:28:02 +0800
Message-ID: <1584437324.12211.10.camel@mtkswgap22>
Subject: Re: [PATCH v4 2/2] pinctrl: make MediaTek MT6765 pinctrl ready for
 buidling loadable module
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     Sean Wang <sean.wang@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, <kuohong.wang@mediatek.com>
Date:   Tue, 17 Mar 2020 17:28:44 +0800
In-Reply-To: <CAGp9Lzo-HkmiitBBJF9Mybbrdgy-Kphfyi2wf0SwMGXTeuWGVA@mail.gmail.com>
References: <1583825986-8189-1-git-send-email-light.hsieh@mediatek.com>
         <1583825986-8189-3-git-send-email-light.hsieh@mediatek.com>
         <CAGp9Lzo-HkmiitBBJF9Mybbrdgy-Kphfyi2wf0SwMGXTeuWGVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gU3VuLCAyMDIwLTAzLTE1IGF0IDE0OjE1IC0wNzAwLCBTZWFuIFdhbmcgd3JvdGU6DQo+IEhp
LCBMaWdodA0KPiANCj4gT24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMTI6MzkgQU0gPGxpZ2h0Lmhz
aWVoQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBMaWdodCBIc2llaCA8bGln
aHQuaHNpZWhAbWVkaWF0ZWsuY29tPg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBtYWtlIHBpbmN0cmwt
bXQ2NzY1IHJlYWR5IGZvciBidWlsZGluZyBhcyBsb2FkYWJsZSBtb2R1bGUuDQo+IHMvYnVpbGRp
bmcvYnVpbGRpbmcvDQo+IA0KPiBJIGdvdCBidWlsZCBlcnJvciBhZnRlciB3aGVuIHRob3NlIHR3
byBwYXRjaGVzIGFyZSBiZWluZyBhcHBsaWVkDQo+IC4uL2RyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9waW5jdHJsLW10ay1jb21tb24tdjIuYzo1Mjk6MTogZXJyb3I6DQo+ICdtdGtfcGluY29uZl9i
aWFzX3NldF9nZXYxJyB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKQ0KPiANCg0K
T0suIEkgd2lsbCBmaXggaXQuDQoNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExpZ2h0IEhzaWVo
IDxsaWdodC5oc2llaEBtZWRpYXRlay5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IE1hdHRoaWFzIEJy
dWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvcGlu
Y3RybC9tZWRpYXRlay9LY29uZmlnICAgICAgICAgIHwgMiArLQ0KPiA+ICBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYyB8IDQgKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL0tjb25maWcNCj4gPiBpbmRleCA0Y2QxMTA5Li5jNjQ1ZmRiIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9waW5j
dHJsL21lZGlhdGVrL0tjb25maWcNCj4gPiBAQCAtODksNyArODksNyBAQCBjb25maWcgUElOQ1RS
TF9NVDI3MTINCj4gPiAgICAgICAgIHNlbGVjdCBQSU5DVFJMX01USw0KPiA+DQo+ID4gIGNvbmZp
ZyBQSU5DVFJMX01UNjc2NQ0KPiA+IC0gICAgICAgYm9vbCAiTWVkaWF0ZWsgTVQ2NzY1IHBpbiBj
b250cm9sIg0KPiA+ICsgICAgICAgdHJpc3RhdGUgIk1lZGlhdGVrIE1UNjc2NSBwaW4gY29udHJv
bCINCj4gPiAgICAgICAgIGRlcGVuZHMgb24gT0YNCj4gPiAgICAgICAgIGRlcGVuZHMgb24gQVJN
NjQgfHwgQ09NUElMRV9URVNUDQo+ID4gICAgICAgICBkZWZhdWx0IEFSTTY0ICYmIEFSQ0hfTUVE
SUFURUsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXQ2NzY1LmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYw0KPiA+
IGluZGV4IDkwNWRhZThjLi4yYzU5ZDM5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jDQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMNCj4gPiBAQCAtNiw2ICs2LDcgQEANCj4gPiAgICoNCj4g
PiAgICovDQo+ID4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICAjaW5jbHVk
ZSAicGluY3RybC1tdGstbXQ2NzY1LmgiDQo+ID4gICNpbmNsdWRlICJwaW5jdHJsLXBhcmlzLmgi
DQo+ID4NCj4gPiBAQCAtMTEwMywzICsxMTA0LDYgQEAgc3RhdGljIGludCBfX2luaXQgbXQ2NzY1
X3BpbmN0cmxfaW5pdCh2b2lkKQ0KPiA+ICAgICAgICAgcmV0dXJuIHBsYXRmb3JtX2RyaXZlcl9y
ZWdpc3RlcigmbXQ2NzY1X3BpbmN0cmxfZHJpdmVyKTsNCj4gPiAgfQ0KPiA+ICBhcmNoX2luaXRj
YWxsKG10Njc2NV9waW5jdHJsX2luaXQpOw0KPiA+ICsNCj4gPiArTU9EVUxFX0xJQ0VOU0UoIkdQ
TCB2MiIpOw0KPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oIk1lZGlhVGVrIE1UNjc2NSBQaW5jdHJs
IERyaXZlciIpOw0KPiA+IC0tDQo+ID4gMS44LjEuMS5kaXJ0eQ0KDQo=

