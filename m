Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F056E43F5F2
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 06:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhJ2EZZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 00:25:25 -0400
Received: from mswedge2.sunplus.com ([60.248.182.106]:47484 "EHLO
        mg.sunplus.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229504AbhJ2EZY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 00:25:24 -0400
X-Greylist: delayed 2556 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 Oct 2021 00:25:23 EDT
X-MailGates: (compute_score:DELIVER,40,3)
Received: from 172.17.9.112
        by mg02.sunplus.com with MailGates ESMTP Server V5.0(64987:0:AUTH_RELAY)
        (envelope-from <wells.lu@sunplus.com>); Fri, 29 Oct 2021 11:40:05 +0800 (CST)
Received: from sphcmbx02.sunplus.com.tw (172.17.9.112) by
 sphcmbx02.sunplus.com.tw (172.17.9.112) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 29 Oct 2021 11:40:00 +0800
Received: from sphcmbx02.sunplus.com.tw ([::1]) by sphcmbx02.sunplus.com.tw
 ([fe80::f8bb:bd77:a854:5b9e%14]) with mapi id 15.00.1497.023; Fri, 29 Oct
 2021 11:40:00 +0800
From:   =?utf-8?B?V2VsbHMgTHUg5ZGC6Iqz6aiw?= <wells.lu@sunplus.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Wells Lu <wellslutw@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "qinjian@cqplus1.com" <qinjian@cqplus1.com>,
        "dvorkin@tibbo.com" <dvorkin@tibbo.com>
Subject: RE: [PATCH 1/3] pinctrl: Add driver for Sunplus SP7021
Thread-Topic: [PATCH 1/3] pinctrl: Add driver for Sunplus SP7021
Thread-Index: AQHXyxB2JVFfQiM840ywI8+A3Cqbqavm4xsAgAJpvBA=
Date:   Fri, 29 Oct 2021 03:40:00 +0000
Message-ID: <930472fa25b7462aa49e33d694e4d759@sphcmbx02.sunplus.com.tw>
References: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
 <1635324926-22319-2-git-send-email-wells.lu@sunplus.com>
 <3ed37bf9-d698-2a03-60e7-9b357e3abfb4@infradead.org>
In-Reply-To: <3ed37bf9-d698-2a03-60e7-9b357e3abfb4@infradead.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.25.108.39]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgU2lyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQpJIG1vZGlmaWVkIGVycm9y
cyBpbiBLY29uZmlnIHlvdSBwb2ludGVkIG91dC4NCg0KQ291bGQgeW91IHBsZWFzZSB0ZWFjaCBt
ZSB3aGF0IGlzIHRoZSBuZXh0IHN0ZXAgSSBuZWVkIHRvIGRvDQooVGhpcyBpcyBteSBmaXJzdCBz
dWJtaXNzaW9uIHRvIExpbnV4IGtlcm5lbCBtYWluLWxpbmUpPw0KDQoxLiBTaG91bGQgSSBtYWtl
IGEgcGF0Y2ggW1BBVEhDIDEvMyB2Ml0gZm9yIEtjb25maWcgYW5kIHN1Ym1pdCANCiAgYWdhaW4/
DQoyLiBPciB3YWl0IGZvciBvdGhlciBmaWxlcyBvZiB0aGUgcGF0Y2ggW1BBVENIIDEvM10gYmVp
bmcgDQogIHJldmlld2VkIGFuZCB0aGVuIHN1Ym1pdCBwYXRjaCBhZ2Fpbi4NCjMuIEF0IGZpcnN0
IHBhdGNoLCBJIHVzZWQgJ2dpdCBzZW5kLWVtYWlsJyBjb21tYW5kIHRvIHNlbmQgYSANCiAgcGF0
Y2ggc2VyaWVzLiBUaGUgY29tbWFuZCBpczoNCiAgZ2l0IHNlbmQtZW1haWwgXA0KICAtLXRvIGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZyBcDQogIC0tdG8gbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5v
cmcgXA0KICAtLXRvIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgXA0KICAtLXRvIHJvYmgr
ZHRAa2VybmVsLm9yZyBcDQogIC0tdG8gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcgXA0KICAt
LWNjIGR2b3JraW5AdGliYm8uY29tIFwNCiAgLS1jYyBxaW5qaWFuQGNxcGx1czEuY29tIFwNCiAg
LS10aHJlYWQgMDAwKi5wYXRjaA0KICBQbGVhc2UgdGVhY2ggbWUgd2hhdCBjb21tYW5kIG9wdGlv
bnMgb2YgJ2dpdCBzZW5kLWVtYWlsJyANCiAgSSBzaG91bGQgdXNlIHRvIHNlbmQgdGhlIHZlcnNp
b24gMiBwYXRjaC4NCjQuIElmIHRoaXMgaXMgbm90IGEgY29ycmVjdCB3YXkgdG8gcmVwbHkgeW91
ciBlbWFpbCwgcGxlYXNlIHRlYWNoIA0KICBtZSBob3cgdG8gcmVwbHkgbWFpbnRhaW5lcnMnIGVt
YWlsLg0KDQoNCkJlc3QgcmVnYXJkcywNCg0KV2VsbHMgTHUNCg0K
