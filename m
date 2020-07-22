Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1CC22973B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 13:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgGVLQZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 07:16:25 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:51630 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726028AbgGVLQZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 07:16:25 -0400
X-UUID: f9812e6cfc094f8ea830413cadeda40d-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=kUGN4eod9+73obp1QXaVgA/WjQAmxsxhBRuAz9P0fHI=;
        b=U3FXwPQtliIYH3zOvzWBlPYGdl3P2bV8WM2jNW4aMu7zzIg45fjxVe454gZTPUkn1z7/E3ajOrnb6i61QOarGRJdWkcjuy85O4ouXV6ymOBUgqIMsJE/wOqJILLc3Jrju25f6Rl2m4ZTIPIsf0qxp4m7fgji7MHhrFrMZn1wZFE=;
X-UUID: f9812e6cfc094f8ea830413cadeda40d-20200722
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1690839541; Wed, 22 Jul 2020 19:16:22 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 19:16:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 19:16:20 +0800
Message-ID: <1595416581.5511.6.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>
Date:   Wed, 22 Jul 2020 19:16:21 +0800
In-Reply-To: <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
         <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8678F406109F856D891B379E590361900A402883DC336283B2FDBEFAF9C867542000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gV2VkLCAyMDIwLTA3LTIyIGF0IDEwOjQzICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMjIvMDcvMjAyMCAwNTowOSwgSGFua3MgQ2hlbiB3cm90ZToNCj4gPiByZW1v
dmUgdGhlIHJlZHVuZGFudCBjbGsgaW50ZXJmYWNlIG9mIHVhcnQuDQo+ID4gQ0xLX0lORlJBX1VB
UlQzIGlzIGEgZHVtbXkgY2xrIGludGVyZmFjZSwNCj4gPiBpdCBoYXMgbm8gZWZmZWN0IG9uIHRo
ZSBvcGVyYXRpb24gb2YgdGhlIHJlYWQvd3JpdGUgaW5zdHJ1Y3Rpb24uDQo+ID4gDQo+ID4gQ2hh
bmdlIHNpbmNlIHYyOg0KPiA+IENvbW1pdCAiZHQtYmluZGluZ3M6IGNsb2NrOiByZW1vdmUgVUFS
VDMgY2xvY2sgc3VwcG9ydCINCj4gDQo+IFNvcnJ5IGp1c3QgYW5vdGhlciBjb21tZW50LiBJIHRo
aW5rIHdlIGNhbiBtYWtlIHRoaXMgb25lIHBhdGNoIGRlbGV0aW5nIGV2ZXJ5dGhpbmcuDQo+IA0K
U29ycnksIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgY29tbWVudC4gRG8gSSBuZWVkIHRvIG1lcmdl
IHRoZW0gaW50byBvbmUNCmJpZyBwYXRjaD8NCkJ0dywgaWYgSSB1c2Ugb25lIHBhdGNoLCBJIHdv
dWxkIGdldCBjaGVjayBwYXRjaCBmYWlsLg0KLS0tDQpbMjAyMC0wNy0yMiAxOToxMjo0OSwwNDYg
RVJST1JdIFJ1biBjaGVjayBwYXRjaCByZXN1bHRzOg0KV0FSTklORzpEVF9TUExJVF9CSU5ESU5H
X1BBVENIOiBEVCBiaW5kaW5nIGRvY3MgYW5kIGluY2x1ZGVzIHNob3VsZCBiZSBhDQpzZXBhcmF0
ZSBwYXRjaC4gU2VlOg0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRp
bmctcGF0Y2hlcy5yc3QNCi0tLQ0KDQpIYW5rcw0KDQo+ID4gLS0gcmVtb3ZlIEZpeGVzIHRhZw0K
PiA+IENvbW1pdCAiY2xrOiBtZWRpYXRlazogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQiDQo+
ID4gLS0gcmVtb3ZlIEZpeGVzIHRhZw0KPiA+IA0KPiA+IEhhbmtzIENoZW4gKDIpOg0KPiA+ICAg
IGR0LWJpbmRpbmdzOiBjbG9jazogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQNCj4gPiAgICBj
bGs6IG1lZGlhdGVrOiByZW1vdmUgVUFSVDMgY2xvY2sgc3VwcG9ydA0KPiA+IA0KPiA+ICAgZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS5jICAgICAgfCAyIC0tDQo+ID4gICBpbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL210Njc3OS1jbGsuaCB8IDEgLQ0KPiA+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAzIGRlbGV0aW9ucygtKQ0KPiA+IA0KDQo=

