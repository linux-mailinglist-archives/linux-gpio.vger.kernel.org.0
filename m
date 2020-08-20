Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF7D24B886
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Aug 2020 13:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgHTLWs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Aug 2020 07:22:48 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:57527 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730549AbgHTLWd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2020 07:22:33 -0400
X-UUID: af4d0888a4f647dab8a88998ad979dc4-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=S1Y+0IiFS8nO4Trq+5CEEIC6sfUAEGt90ibukYT0b9E=;
        b=jGbkrcesOI3wVd2mXfBAN9w/vHttcOMif6TLelF36AnrYNIbu55x54Z9wbExfm2m7KZQkrxUyQgsAXig34choBQ3fGTPRRg37vcuOuxQrWJdOP5di3NTP4Ep5GB6lvuAx9O0gQE5iA+1Jkd7fcO70uTcZwOJMbLMQMwQKXvjVX4=;
X-UUID: af4d0888a4f647dab8a88998ad979dc4-20200820
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1994942789; Thu, 20 Aug 2020 19:22:31 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 19:22:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 19:22:27 +0800
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
        sin_jieyang <sin_jieyang@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>
Subject: [PATCH v2] pinctrl: mediatek: check mtk_is_virt_gpio input parameter
Date:   Thu, 20 Aug 2020 19:22:25 +0800
Message-ID: <1597922546-29633-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F88F058F9D588338A2C62533E12951333599251915843B08FD4ABEB0C93057CF2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Y2hlY2sgbXRrX2lzX3ZpcnRfZ3BpbyBpbnB1dCBwYXJhbWV0ZXIsDQp2aXJ0dWFsIGdwaW8gbmVl
ZCB0byBzdXBwb3J0IGVpbnQgbW9kZS4NCg0KYWRkIGVycm9yIGhhbmRsZXIgZm9yIHRoZSBrbyBj
YXNlDQp0byBmaXggdGhpcyBib290IGZhaWw6DQpwYyA6IG10a19pc192aXJ0X2dwaW8rMHgyMC8w
eDM4IFtwaW5jdHJsX210a19jb21tb25fdjJdDQpsciA6IG10a19ncGlvX2dldF9kaXJlY3Rpb24r
MHg0NC8weGIwIFtwaW5jdHJsX3BhcmlzXQ0KDQpGaXhlczogZWRkNTQ2NDY1MDAyICgicGluY3Ry
bDogbWVkaWF0ZWs6IGF2b2lkIHZpcnR1YWwgZ3BpbyB0cnlpbmcgdG8gc2V0IHJlZyIpDQpTaW5n
ZWQtb2ZmLWJ5OiBKaWUgWWFuZyA8c2luX2ppZXlhbmdAbWVkaWF0ZWsuY29tPg0KU2lnbmVkLW9m
Zi1ieTogSGFua3MgQ2hlbiA8aGFua3MuY2hlbkBtZWRpYXRlay5jb20+DQoNCi0tLQ0KQ2hhbmdl
cyBzaW5jZSB2MToNCi0gdXBkYXRlIFNpbmdlZC1vZmYtYnkNCi0gYWxpZ24gd2l0aCBwaW5jdHJs
L21lZGlhdGVrL3BpbmN0cmwtbXRrLW10Ki5oIA0KDQotLS0NCiBkcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMgfCA0ICsrKysNCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
cGluY3RybC1tdGstY29tbW9uLXYyLmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1tdGstY29tbW9uLXYyLmMNCmluZGV4IGM1M2UyYzM5MWUzMi4uYTQ4NWQ3OWY1MWExIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5j
DQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMN
CkBAIC0yNTksNiArMjU5LDEwIEBAIGJvb2wgbXRrX2lzX3ZpcnRfZ3BpbyhzdHJ1Y3QgbXRrX3Bp
bmN0cmwgKmh3LCB1bnNpZ25lZCBpbnQgZ3Bpb19uKQ0KIA0KIAlkZXNjID0gKGNvbnN0IHN0cnVj
dCBtdGtfcGluX2Rlc2MgKikmaHctPnNvYy0+cGluc1tncGlvX25dOw0KIA0KKwkvKiBpZiB0aGUg
R1BJTyBpcyBub3Qgc3VwcG9ydGVkIGZvciBlaW50IG1vZGUgKi8NCisJaWYgKGRlc2MtPmVpbnQu
ZWludF9tID09IE5PX0VJTlRfU1VQUE9SVCkNCisJCXJldHVybiB2aXJ0X2dwaW87DQorDQogCWlm
IChkZXNjLT5mdW5jcyAmJiAhZGVzYy0+ZnVuY3NbZGVzYy0+ZWludC5laW50X21dLm5hbWUpDQog
CQl2aXJ0X2dwaW8gPSB0cnVlOw0KIA0KLS0gDQoyLjE4LjANCg==

