Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350773471E2
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 07:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhCXGvq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 02:51:46 -0400
Received: from regular1.263xmail.com ([211.150.70.204]:59058 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbhCXGvW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 02:51:22 -0400
Received: from localhost (unknown [192.168.167.235])
        by regular1.263xmail.com (Postfix) with ESMTP id C248C556;
        Wed, 24 Mar 2021 14:50:30 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from desktop-sg5v5ea (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P24304T139684921460480S1616568629027815_;
        Wed, 24 Mar 2021 14:50:29 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4364d0d3bd60dc464c6010413030266f>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: jay.xu@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Date:   Wed, 24 Mar 2021 14:50:29 +0800
From:   "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
To:     =?utf-8?B?6K645YmR576k?= <jay.xu@rock-chips.com>,
        "Tao Huang" <huangtao@rock-chips.com>,
        =?utf-8?B?5p2o5Yev?= <kever.yang@rock-chips.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        =?utf-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
        bgolaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND 0/7] gpio-rockchip driver
References: <20210324064541.949630-1-jay.xu@rock-chips.com>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.19.158[cn]
Mime-Version: 1.0
Message-ID: <202103241450286417142@rock-chips.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SSdtIGZvcmdldCB0byBzZW5kLXRvIGluY2x1ZGUgQmFydG9zeiwgSSdsbCByZW1lbWJlciBpbiBu
ZXh0IHZlcnNpb24KCi0tLS0tLS0tLS0tLS0tCmpheS54dUByb2NrLWNoaXBzLmNvbQo+U2VwYXJh
dGUgZ3BpbyBkcml2ZXIgZnJvbSBwaW5jdHJsIGRyaXZlciwgYW5kIHN1cHBvcnQgdjIgY29udHJv
bGxlci4KPgo+SmlhbnF1biBYdSAoNyk6Cj7CoCBwaW5jdHJsL3JvY2tjaGlwOiBzZXBhcmF0ZSBz
dHJ1Y3Qgcm9ja2NoaXBfcGluX2JhbmsgdG8gYSBoZWFkIGZpbGUKPsKgIHBpbmN0cmwvcGluY3Ry
bC1yb2NrY2hpcC5oOiBhZGQgcGluY3RybCBkZXZpY2UgdG8gZ3BpbyBiYW5rIHN0cnVjdAo+wqAg
Z3Bpbzogc2VwYXJhdGUgZ3BpbyBkcml2ZXIgZnJvbSBwaW5jdHJsLXJvY2tjaGlwIGRyaXZlcgo+
wqAgZ3Bpby9yb2NrY2hpcDogdXNlIHN0cnVjdCByb2NrY2hpcF9ncGlvX3JlZ3MgZm9yIGdwaW8g
Y29udHJvbGxlcgo+wqAgZ3Bpby9yb2NrY2hpcDogc3VwcG9ydCBuZXh0IHZlcnNpb24gZ3BpbyBj
b250cm9sbGVyCj7CoCBncGlvL3JvY2tjaGlwOiBhbHdheXMgZW5hYmxlIGNsb2NrIGZvciBncGlv
IGNvbnRyb2xsZXIKPsKgIGdwaW8vcm9ja2NoaXA6IGRyb3AgaXJxX2djX2xvY2svaXJxX2djX3Vu
bG9jayBmb3IgaXJxIHNldCB0eXBlCj4KPiBkcml2ZXJzL2dwaW8vS2NvbmZpZ8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOCArCj4gZHJpdmVycy9ncGlvL01ha2VmaWxlwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4gZHJpdmVycy9ncGlvL2dwaW8tcm9ja2No
aXAuY8KgwqDCoMKgwqDCoCB8IDc1OCArKysrKysrKysrKysrKysrKysrKysrKysKPiBkcml2ZXJz
L3BpbmN0cmwvcGluY3RybC1yb2NrY2hpcC5jIHwgOTA5ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtcm9ja2NoaXAuaCB8IDI4NiArKysrKysr
KysKPiA1IGZpbGVzIGNoYW5nZWQsIDEwNzIgaW5zZXJ0aW9ucygrKSwgODkwIGRlbGV0aW9ucygt
KQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwaW8vZ3Bpby1yb2NrY2hpcC5jCj4gY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXJvY2tjaGlwLmgKPgo+LS0K
PjIuMjUuMQo+Cj4KPg==



