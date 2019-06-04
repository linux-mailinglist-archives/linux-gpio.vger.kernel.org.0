Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B37E3527C
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 00:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfFDWDj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 18:03:39 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:61758 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfFDWDj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 18:03:39 -0400
X-AuditID: ac1060b2-2cbff70000003d86-4a-5cf6eab90d42
Received: from atlms2.us.megatrends.com (atlms2.us.megatrends.com [172.16.96.152])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id 4B.AE.15750.9BAE6FC5; Tue,  4 Jun 2019 18:03:37 -0400 (EDT)
Received: from ATLMS1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605]) by
 atlms2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb%12]) with mapi id
 14.03.0415.000; Tue, 4 Jun 2019 18:03:37 -0400
From:   Hongwei Zhang <Hongweiz@ami.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH linux dev-5.1 v1] ARM: dts: aspeed: Add SGPM pinmux
Thread-Topic: [PATCH linux dev-5.1 v1] ARM: dts: aspeed: Add SGPM pinmux
Thread-Index: AQHVGl3d/v6MjHMzm0SmoLtXRU7xKqaK0JyAgAE8dbA=
Date:   Tue, 4 Jun 2019 22:03:37 +0000
Message-ID: <14D3C8298A3B0F42A1EB31EE961CFF8231E4AA@atlms1.us.megatrends.com>
References: <1559601789-27121-1-git-send-email-hongweiz@ami.com>
 <CACRpkdYPHw994Ov0xCfK6tCg60tiuWrRwTcYpMSfOr4G0VKu_Q@mail.gmail.com>
In-Reply-To: <CACRpkdYPHw994Ov0xCfK6tCg60tiuWrRwTcYpMSfOr4G0VKu_Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.241]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsWyRiBhhu7OV99iDN5tULDYdZnDYv6Rc6wW
        v8//ZbaY8mc5k8Wmx9dYLZpXn2O22Dz/D6PF5V1z2CyWXr/IZNG69wi7A5fH1fZd7B5r5q1h
        9Lj48Rizx6ZVnWwed67tYfPYvKTe4/yMhYwenzfJBXBEcdmkpOZklqUW6dslcGW8m3iTpWAF
        f8Wj27tZGxi/8HUxcnJICJhI/Py6h7WLkYtDSGAXk8TlpzugnEOMEv97FrCAVLEJqEk8/dPA
        DmKLCOhIdG/7CVbELHCPWWLO55dADgeHsIC7xIJ1tRA1HhLTp/9jg7CtJDa9/8YEYrMIqEhc
        P/cdLM4r4Ctx/dBudohl7YwSbbv/gS3gFAiUuLJyOlgDo4CYxPdTa8BsZgFxiVtP5jNBnC0g
        sWTPeWYIW1Ti5eN/rBC2kkTDin9MIPcwC2hKrN+lD9GqKDGl+yE7xF5BiZMzn7BMYBSdhWTq
        LISOWUg6ZiHpWMDIsopRKLEkJzcxMye93FAvMTdTLzk/dxMjJE437WBsuWh+iJGJgxEYdhzM
        SiK8ibe/xAjxpiRWVqUW5ccXleakFh9ilOZgURLnXbnmW4yQQHpiSWp2ampBahFMlomDU6qB
        cdKihp/iwvaPZuYmcTMt/X8jRP/yRpYqY2ZnNv9Gz1OhOj+W6Mg80VE42X19YctqyakLd7mf
        CZzledFnRmnQovvFVUsibs/8nBXw22/9S9uX9QzPHH3dwoR/dQafOy6TXbi3WuC1F3f+7EXG
        kx/f2pCRlHsvpZt5Xj3jvx/2R7Xqel+sZ3jXr8RSnJFoqMVcVJwIAJ80j6fBAgAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gDQpTZW50OiBNb25kYXksIEp1bmUgMywgMjAxOSA3OjA4IFBNDQpU
bzogSG9uZ3dlaSBaaGFuZyA8SG9uZ3dlaXpAYW1pLmNvbT4NCkNjOiBKb2VsIFN0YW5sZXkgPGpv
ZWxAam1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IFJvYiBIZXJy
aW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0u
Y29tPjsgb3BlbiBsaXN0OkdQSU8gU1VCU1lTVEVNIDxsaW51eC1ncGlvQHZnZXIua2VybmVsLm9y
Zz47IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVORUQgREVWSUNFIFRSRUUgQklO
RElOR1MgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgTGludXggQVJNIDxsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCBsaW51
eCBkZXYtNS4xIHYxXSBBUk06IGR0czogYXNwZWVkOiBBZGQgU0dQTSBwaW5tdXgNCg0KSGkgSG9u
Z3dlaSwNCg0KT24gVHVlLCBKdW4gNCwgMjAxOSBhdCAxMjo0NCBBTSBIb25nd2VpIFpoYW5nIDxo
b25nd2VpekBhbWkuY29tPiB3cm90ZToNCj4NCj4gQWRkIFNHUE0gcGlubXV4IHRvIGFzdDI1MDAt
cGluY3RybCBmdW5jdGlvbiBhbmQgZ3JvdXAsIHRvIHByZXBhcmUgZm9yIA0KPiBzdXBwb3J0aW5n
IFNHUElPIGluIEFTVDI1MDAgU29DLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBIb25nd2VpIFpoYW5n
IDxob25nd2VpekBhbWkuY29tPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtYXNwZWVkLnR4dCB8IDIgKy0NCj4gIGFyY2gvYXJtL2Jv
b3QvZHRzL2FzcGVlZC1nNS5kdHNpICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysr
KysNCj4gIGRyaXZlcnMvcGluY3RybC9hc3BlZWQvcGluY3RybC1hc3BlZWQtZzUuYyAgICAgICAg
ICAgICAgICAgICB8IDQgKysrKw0KDQpQbGVhc2UgdHJ5IHRvIHNlcGFyYXRlIG91dCB0aGUgY2hh
bmdlIHRvIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpIGludG8gYSBzZXBhcmF0ZSBw
YXRjaCB0aGF0IGdvZXMgdGhyb3VnaCBBUk0gU29DLg0KDQpKdXN0IGNvbW1pdHRlZCB0aGUgRFQg
cGF0Y2ggdG8gX2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2FybS9hcm0tc29jLmdpdCAsIHBsZWFzZSBoZWxwIHRvIHJldmlldy4gVGhhbmtzIQ0KDQoNCk90
aGVyIHRoYW4gdGhhdCBpdCBsb29rcyBmaW5lIHRvIG1lLg0KDQpZb3VycywNCkxpbnVzIFdhbGxl
aWoNCg==
