Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6486E24B87A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Aug 2020 13:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgHTLWM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Aug 2020 07:22:12 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:59210 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729769AbgHTLV0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2020 07:21:26 -0400
X-UUID: 580e092745a84891a3507e5f51e90f4c-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ohfEWTwXhQSMstYzm/6OXzB+lRaN+zQdjX8fExzTluA=;
        b=R0qJtzBJ1vc+N8eEPOkeNxSCcZ1m//4Jc3Nf6S3JPSGBeA4C2Mlr/wxtO3VfddFN4Nzw2PISibZ0yQpJ64YKhp2UGPmLdk/r0rAYfGkD4GdCT5m59878o2NL/7esxDe7oOk0gTPOEuVF6tDNPTKFoIG84lFAxWtEVSQnd1kX+RA=;
X-UUID: 580e092745a84891a3507e5f51e90f4c-20200820
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2126183433; Thu, 20 Aug 2020 19:21:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 19:21:07 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 19:21:07 +0800
Message-ID: <1597922468.29505.1.camel@mtkswgap22>
Subject: Re: [PATCH] pinctrl: mediatek: check mtk_is_virt_gpio input
 parameter
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Sean Wang <sean.wang@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        sin_jieyang <sin_jieyang@mediatek.com>
Date:   Thu, 20 Aug 2020 19:21:08 +0800
In-Reply-To: <CAGp9Lzq7H_KREyhxNy1zBsBJdFRAA7Zc1jkGc=ZiN_og1H9KBQ@mail.gmail.com>
References: <1597317260-24348-1-git-send-email-hanks.chen@mediatek.com>
         <CAGp9Lzq7H_KREyhxNy1zBsBJdFRAA7Zc1jkGc=ZiN_og1H9KBQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 84FF2A7FAAC6C2272C02EA56389C25CB737D14086DD27890545B84F223C0307A2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gV2VkLCAyMDIwLTA4LTE5IGF0IDE2OjQzIC0wNzAwLCBTZWFuIFdhbmcgd3JvdGU6DQo+IEhp
IEhhbmtzLA0KPiANCj4gT24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgNDoxNCBBTSBIYW5rcyBDaGVu
IDxoYW5rcy5jaGVuQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBjaGVjayBtdGtfaXNf
dmlydF9ncGlvIGlucHV0IHBhcmFtZXRlciwNCj4gPiB2aXJ0dWFsIGdwaW8gbmVlZCB0byBzdXBw
b3J0IGVpbnQgbW9kZS4NCj4gPg0KPiA+IGFkZCBlcnJvciBoYW5kbGVyIGZvciB0aGUga28gY2Fz
ZQ0KPiA+IHRvIGZpeCB0aGlzIGJvb3QgZmFpbDoNCj4gPiBwYyA6IG10a19pc192aXJ0X2dwaW8r
MHgyMC8weDM4IFtwaW5jdHJsX210a19jb21tb25fdjJdDQo+ID4gbHIgOiBtdGtfZ3Bpb19nZXRf
ZGlyZWN0aW9uKzB4NDQvMHhiMCBbcGluY3RybF9wYXJpc10NCj4gDQo+IGl0IGlzIGJldHRlciB3
ZSBwb3N0IHRoZSBjb21wbGV0ZSBjYWxsIHN0YWNrIHdoZW4gdGhlIGZhaWx1cmUgb2NjdXJzDQo+
IA0KPiA+DQo+ID4gRml4ZXM6IGVkZDU0NjQ2NTAwMiAoInBpbmN0cmw6IG1lZGlhdGVrOiBhdm9p
ZCB2aXJ0dWFsIGdwaW8gdHJ5aW5nIHRvIHNldCByZWciKQ0KPiA+IFNpbmdlZC1vZmYtYnk6IHNp
bl9qaWV5YW5nIDxzaW5famlleWFuZ0BtZWRpYXRlay5jb20+DQo+IA0KPiBzaWduZWQtb2ZmLWJ5
IHdpdGggdGhlIGZ1bGwgbmFtZQ0KDQpHb3QgaXQsIEknbGwgdXBkYXRlIGl0IGluIG5leHQgdmVy
c2lvbi4NCg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBIYW5rcyBDaGVuIDxoYW5rcy5jaGVuQG1l
ZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0
cmwtbXRrLWNvbW1vbi12Mi5jIHwgNCArKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
cGluY3RybC1tdGstY29tbW9uLXYyLmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1tdGstY29tbW9uLXYyLmMNCj4gPiBpbmRleCBjNTNlMmMzOTFlMzIuLjI3YWI5YzUxMmFlMSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29t
bW9uLXYyLmMNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGst
Y29tbW9uLXYyLmMNCj4gPiBAQCAtMjU5LDYgKzI1OSwxMCBAQCBib29sIG10a19pc192aXJ0X2dw
aW8oc3RydWN0IG10a19waW5jdHJsICpodywgdW5zaWduZWQgaW50IGdwaW9fbikNCj4gPg0KPiA+
ICAgICAgICAgZGVzYyA9IChjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICopJmh3LT5zb2MtPnBp
bnNbZ3Bpb19uXTsNCj4gPg0KPiA+ICsgICAgICAgLyogaWYgdGhlIEdQSU8gaXMgbm90IHN1cHBv
cnRlZCBmb3IgZWludCBtb2RlICovDQo+ID4gKyAgICAgICBpZiAoZGVzYy0+ZWludC5laW50X20g
PT0gRUlOVF9OQSkNCj4gDQo+IHMvTk9fRUlOVF9TVVBQT1JUL0VJTlRfTkEvIHRvIGFsaWduIHdp
dGggcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1tdCouaCB1c2VzDQoNCkdvdCBpdCwgSSds
bCBmaXggaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MgZm9yIHlvdXIgcmVwbHkNCg0KDQpI
YW5rcw0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gdmlydF9ncGlvOw0KPiA+ICsN
Cj4gPiAgICAgICAgIGlmIChkZXNjLT5mdW5jcyAmJiAhZGVzYy0+ZnVuY3NbZGVzYy0+ZWludC5l
aW50X21dLm5hbWUpDQo+ID4gICAgICAgICAgICAgICAgIHZpcnRfZ3BpbyA9IHRydWU7DQo+ID4N
Cj4gPiAtLQ0KPiA+IDIuMTguMA0KDQo=

