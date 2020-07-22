Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775BC228E66
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 05:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731857AbgGVDJZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 23:09:25 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:15979 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731781AbgGVDJZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 23:09:25 -0400
X-UUID: f19401ce502c4e3ebc32a63fbb087877-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=EQlBNdgxDDQYmxmxAAY+m5Jl7VPvZcgaU2N1aVAS/UA=;
        b=VlXzJ8wVm7greNXxv565ne8y6i2sXYMTtiJEJ3xb7TesYg/NrtmWy4KUe2UNDWqSAtVZqpCiWT+0w3pQixkmlxbdmPjnOmcYa9omcTXXLWSuThPeu/wVIqUbCj4g1YFcYsrI8GC3Zg+GmNJgT3hPHIrxITlcoXV2eTXk0l4qkoM=;
X-UUID: f19401ce502c4e3ebc32a63fbb087877-20200722
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 65081969; Wed, 22 Jul 2020 11:09:20 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 11:09:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 11:09:19 +0800
Message-ID: <1595387359.12347.0.camel@mtkswgap22>
Subject: Re: [PATCH 1/2] dt-bindings: clock: remove UART3 clock support
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
Date:   Wed, 22 Jul 2020 11:09:19 +0800
In-Reply-To: <22a7a43b-1345-f316-f212-4d956ada50c4@gmail.com>
References: <20200721054033.18520-1-hanks.chen@mediatek.com>
         <20200721054033.18520-2-hanks.chen@mediatek.com>
         <22a7a43b-1345-f316-f212-4d956ada50c4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gV2VkLCAyMDIwLTA3LTIyIGF0IDAwOjEwICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMjEvMDcvMjAyMCAwNzo0MCwgSGFua3MgQ2hlbiB3cm90ZToNCj4gPiByZW1v
dmUgdGhlIHJlZHVuZGFudCBjbGsgaW50ZXJmYWNlIG9mIHVhcnQuDQo+ID4gDQo+ID4gRml4ZXM6
IDcxMDc3NGUwNDg2MSAoImNsazogbWVkaWF0ZWs6IEFkZCBNVDY3NzkgY2xvY2sgc3VwcG9ydCIp
DQo+IA0KPiBUaGVzZSBhcmUgY29zbWV0aWMgY2hhbmdlcy4gVGhleSBkb24ndCBmaXggYW55IGJ1
Zywgc28gd2Ugd29uJ3QgbmVlZCBhIEZpeGVzIHRhZyANCj4gaGVyZS4gTmVpdGhlciBvbiAyLzIu
DQo+IA0KPiBSZWdhcmRzLA0KPiBNYXR0aGlhcw0KPiANCkdvdCBpdCwgSSdsbCByZW1vdmUgaXQg
aW4gbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MhDQoNCkhhbmtzDQoNCj4gPiBTaWduZWQtb2ZmLWJ5
OiBIYW5rcyBDaGVuIDxoYW5rcy5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGlu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ2Nzc5LWNsay5oIHwgMSAtDQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0
LWJpbmRpbmdzL2Nsb2NrL210Njc3OS1jbGsuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2sv
bXQ2Nzc5LWNsay5oDQo+ID4gaW5kZXggYjA4MzEzOWFmYmQyLi4yYjVmMjM1NGQ3ZWIgMTAwNjQ0
DQo+ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDY3NzktY2xrLmgNCj4gPiAr
KysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210Njc3OS1jbGsuaA0KPiA+IEBAIC0yMjks
NyArMjI5LDYgQEANCj4gPiAgICNkZWZpbmUgQ0xLX0lORlJBX1VBUlQwCQkJMjENCj4gPiAgICNk
ZWZpbmUgQ0xLX0lORlJBX1VBUlQxCQkJMjINCj4gPiAgICNkZWZpbmUgQ0xLX0lORlJBX1VBUlQy
CQkJMjMNCj4gPiAtI2RlZmluZSBDTEtfSU5GUkFfVUFSVDMJCQkyNA0KPiA+ICAgI2RlZmluZSBD
TEtfSU5GUkFfR0NFXzI2TQkJMjUNCj4gPiAgICNkZWZpbmUgQ0xLX0lORlJBX0NRX0RNQV9GUEMJ
CTI2DQo+ID4gICAjZGVmaW5lIENMS19JTkZSQV9CVElGCQkJMjcNCj4gPiANCg0K

