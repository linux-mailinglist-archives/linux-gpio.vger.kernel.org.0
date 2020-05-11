Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB111CD541
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2020 11:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbgEKJfa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 05:35:30 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:45545 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgEKJf3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2020 05:35:29 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 04B9ZMhcC011823, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 04B9ZMhcC011823
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 11 May 2020 17:35:22 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 11 May 2020 17:35:21 +0800
Received: from RTEXMB04.realtek.com.tw ([fe80::8001:f5f5:a41e:f8d4]) by
 RTEXMB04.realtek.com.tw ([fe80::8001:f5f5:a41e:f8d4%3]) with mapi id
 15.01.1779.005; Mon, 11 May 2020 17:35:21 +0800
From:   =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
To:     =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: RE: [PATCH 0/7] pinctrl: update realtek DHC pinctrl driver
Thread-Topic: [PATCH 0/7] pinctrl: update realtek DHC pinctrl driver
Thread-Index: AQHWJ3YO7IoOZEcXFE2FnhobPA94y6iinpyQ
Date:   Mon, 11 May 2020 09:35:21 +0000
Message-ID: <0c38518c6989410eb8f2b9445f72978f@realtek.com>
References: <20200511092505.4799-1-tychang@realtek.com>
In-Reply-To: <20200511092505.4799-1-tychang@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.181.134]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RGVhciBhbGwsDQoNClBsZWFzZSBpZ25vcmUgdGhlc2UgbWFpbHMuIEkgYW0gdGVzdGluZyBnaXQg
c2VuZC1lbWFpbCBieSBteXNlbGYuIA0KU29ycnkgZm9yIGFueSBpbmNvbnZlbmllbmNlLg0KDQpC
ZXN0IFJlZ2FyZHMsDQpUWSBDaGFuZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogVFkgQ2hhbmcgW21haWx0bzp0eWNoYW5nQHJlYWx0ZWsuY29tXSANClNlbnQ6IE1vbmRheSwg
TWF5IDExLCAyMDIwIDU6MjUgUE0NClRvOiBUWV9DaGFuZ1vlvLXlrZDpgLhdDQpDYzogbGludXMu
d2FsbGVpakBsaW5hcm8ub3JnOyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgQW5kcmVhcyBGw6RyYmVyDQpTdWJqZWN0OiBbUEFUQ0ggMC83
XSBwaW5jdHJsOiB1cGRhdGUgcmVhbHRlayBESEMgcGluY3RybCBkcml2ZXINCg0KSGkgQW5kcmVh
cywNCg0KVGhpcyBzZXJpZXMgdXBkYXRlIHJlYWx0ZWsgREhDIHBpbmN0cmwgZHJpdmVyIHdpdGgg
dGhlIGZvbGxvd2luZyBkZXRhaWxzOg0KDQoqIGFkZCBtaXNzZWQgcGlucw0KKiBhZGQgcGluIGNv
bmZpZ3VyYXRpb24gZmVhdHVyZSANCiogYWRkIHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrIGZ1bmN0
aW9uDQoqIGZpeCB0aGUgd2FybmluZ3MgY2hlY2tlZCBieSBydW5uaW5nIHNjcmlwdHMvY2hlY2tw
YXRjaA0KKiBhZGQgcmVhbHRlayBwaW5jdHJsIGRvY3VtZW50YXRpb24NCiogbW92ZSByZWFsdGVr
IHBpbmN0cmwgZHJpdmVyIHRvIHJlYWx0ZWsgZGlyZWN0b3J5DQoNCg0KQ2M6IGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZw0KQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnDQpDYzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KQ2M6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3Vz
ZS5kZT4NCg0KVFkgQ2hhbmcgKDcpOg0KICBwaW5jdHJsOiByZWFsdGVrOiBydGQxMjk1OiBBZGQg
bWlzc2VkIHBpbnMuDQogIHBpbmN0cmw6IHJlYWx0ZWs6IHJ0ZDEyOTU6IEFkZCBwaW4gY29uZmln
cy4NCiAgcGluY3RybDogcmVhbHRlazogcnRkMTE5NTogQWRkIG1pc3NlZCBwaW5zIGFuZCBwaW4g
Y29uZmlncy4NCiAgcGluY3RybDogcmVhbHRlazogQWRkIHBpbmN0cmwgRG9jdW1lbnRhdGlvbi4N
CiAgcGluY3RybDogcmVhbHRlazogREhDOiBGaXggcGluY3RybCBkcml2ZXIgY29kaW5nIHN0eWxl
Lg0KICBwaW5jdHJsOiByZWFsdGVrOiBESEM6IE1vdmUgZmlsZXMgdG8gcmVhbHRlayBkaXJlY3Rv
cnkgYW5kIHJlbmFtZS4NCiAgcGluY3RybDogcmVhbHRlazogREhDOiBBZGQgc3VzcGVuZC9yZXN1
bWUgY2FsbGJhY2sgZnVuY3Rpb24uDQoNCiAuLi4vYmluZGluZ3MvcGluY3RybC9yZWFrdGVrLHBp
bmN0cmwudHh0ICAgICAgfCAgIDkgKw0KIGRyaXZlcnMvcGluY3RybC9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxMCArLQ0KIGRyaXZlcnMvcGluY3RybC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMiArLQ0KIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXJ0ZDExOXgu
YyAgICAgICAgICAgICB8IDM4MyAtLS0tLS0tLS0NCiBkcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9L
Y29uZmlnICAgICAgICAgICAgICAgfCAgMTAgKw0KIGRyaXZlcnMvcGluY3RybC9yZWFsdGVrL01h
a2VmaWxlICAgICAgICAgICAgICB8ICAgMyArDQogZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGlu
Y3RybC1ydGQuYyAgICAgICAgIHwgNjAwICsrKysrKysrKysrKysNCiAuLi4vcGluY3RybC97ID0+
IHJlYWx0ZWt9L3BpbmN0cmwtcnRkMTE5NS5oICAgfCA0OTAgKysrKysrKystLS0NCiAuLi4vcGlu
Y3RybC97ID0+IHJlYWx0ZWt9L3BpbmN0cmwtcnRkMTI5NS5oICAgfCA4MDUgKysrKysrKysrKysr
KysrLS0tDQogOSBmaWxlcyBjaGFuZ2VkLCAxNjc5IGluc2VydGlvbnMoKyksIDYzMyBkZWxldGlv
bnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BpbmN0cmwvcmVha3RlayxwaW5jdHJsLnR4dA0KIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3BpbmN0cmwvcGluY3RybC1ydGQxMTl4LmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9waW5jdHJsL3JlYWx0ZWsvS2NvbmZpZw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Bp
bmN0cmwvcmVhbHRlay9NYWtlZmlsZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0
cmwvcmVhbHRlay9waW5jdHJsLXJ0ZC5jDQogcmVuYW1lIGRyaXZlcnMvcGluY3RybC97ID0+IHJl
YWx0ZWt9L3BpbmN0cmwtcnRkMTE5NS5oICg2NCUpDQogcmVuYW1lIGRyaXZlcnMvcGluY3RybC97
ID0+IHJlYWx0ZWt9L3BpbmN0cmwtcnRkMTI5NS5oICg2MiUpDQoNCi0tIA0KMi4yNi4yDQoNCg==
