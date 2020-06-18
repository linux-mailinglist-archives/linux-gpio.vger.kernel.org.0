Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6CE1FF8FB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 18:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgFRQRA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 12:17:00 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47517 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727114AbgFRQQ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2020 12:16:59 -0400
X-UUID: 8d6f9d2f59bf434f80a7ae0cf05ec8f9-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Iw5MdckpEx2wQHfZxi4v7hZqKr+61I5sVoMJrktXj5o=;
        b=tDcZvIQhLEnEvjxHAC9mX7MyH6/x23QUaGzFMqfZ1bXIsFRxYiExxRGUKQJBDkqZUjRcfLgBpyfu/K+OSZq0wv9psDK9EZ4+L0XX1OnIRzWal5fxF96dX1XOvtqqe+YMY2/C39RWxpA3XnQGnrmw/Rvts3uAaMHXnr+EK/ZfdPM=;
X-UUID: 8d6f9d2f59bf434f80a7ae0cf05ec8f9-20200619
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1131090570; Fri, 19 Jun 2020 00:16:57 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 00:16:52 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 00:16:51 +0800
Message-ID: <1592497015.10773.21.camel@mtkswgap22>
Subject: Re: [PATCH v6 6/7] clk: mediatek: add UART0 clock support
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Date:   Fri, 19 Jun 2020 00:16:55 +0800
In-Reply-To: <a61ed70c-a360-f3af-e215-6377ea25a6ab@gmail.com>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
         <1592480018-3340-7-git-send-email-hanks.chen@mediatek.com>
         <a61ed70c-a360-f3af-e215-6377ea25a6ab@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BF32A141C01CA4CBE6F5B3E0BD896765BF1D1AEE3E31B59103E3586B8D6FC1572000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVGh1LCAyMDIwLTA2LTE4IGF0IDE3OjUxICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMTgvMDYvMjAyMCAxMzozMywgSGFua3MgQ2hlbiB3cm90ZToNCj4gPiBBZGQg
TVQ2Nzc5IFVBUlQwIGNsb2NrIHN1cHBvcnQuDQo+ID4gDQo+IA0KPiBQbGVhc2UgYSBkZCBmaXhl
cyB0YWc6DQo+IA0KPiBGaXhlczogNzEwNzc0ZTA0ODYxICgiY2xrOiBtZWRpYXRlazogQWRkIE1U
Njc3OSBjbG9jayBzdXBwb3J0IikNCg0KR290IGl0LCBJJ2xsIGFkZCBpdCBpbiBuZXh0IHZlcnNp
b24uDQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSGFua3MgQ2hlbiA8aGFua3MuY2hlbkBtZWRp
YXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogbXRrMDE3NjEgPHdlbmRlbGwubGluQG1lZGlh
dGVrLmNvbT4NCj4gDQo+IE11c3QgYmUgYSByZWFsIG5hbWUgbm90ICJtdGswMTc2MSINCg0KT29w
cywgSSdsbCB1cGRhdGUgaGlzIG5hbWUuIA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudC4N
Cg0KPiANCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS5jIHwg
ICAgMiArKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYyBiL2RyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYw0KPiA+IGluZGV4IDk3NjZjY2MuLjZlMGQzYTEgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS5jDQo+ID4gKysr
IGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS5jDQo+ID4gQEAgLTkxOSw2ICs5MTks
OCBAQA0KPiA+ICAJCSAgICAicHdtX3NlbCIsIDE5KSwNCj4gPiAgCUdBVEVfSU5GUkEwKENMS19J
TkZSQV9QV00sICJpbmZyYV9wd20iLA0KPiA+ICAJCSAgICAicHdtX3NlbCIsIDIxKSwNCj4gPiAr
CUdBVEVfSU5GUkEwKENMS19JTkZSQV9VQVJUMCwgImluZnJhX3VhcnQwIiwNCj4gPiArCQkgICAg
InVhcnRfc2VsIiwgMjIpLA0KPiA+ICAJR0FURV9JTkZSQTAoQ0xLX0lORlJBX1VBUlQxLCAiaW5m
cmFfdWFydDEiLA0KPiA+ICAJCSAgICAidWFydF9zZWwiLCAyMyksDQo+ID4gIAlHQVRFX0lORlJB
MChDTEtfSU5GUkFfVUFSVDIsICJpbmZyYV91YXJ0MiIsDQo+ID4gDQoNCg==

