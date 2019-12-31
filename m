Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66EF212D91D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2019 14:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfLaNl4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Dec 2019 08:41:56 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:59088 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726060AbfLaNl4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Dec 2019 08:41:56 -0500
X-UUID: 7cdea56ea6634489b398695278f284c2-20191231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iF7bo0bD8duTIrSbLoimLZ9b/gptBGQwd48GDl2KccQ=;
        b=kc/WTTbh0K4/uCPp+ggzU5eNBAcT8mJ+UFq/KGkSsgZ1qZYFaXsQMkr4Nkb+fpmgrpR74jGJOMr79uvZUGLJUx4Ax7y9sbmPBApwBpYv9n6US243aIhfynzLxo1OLZooho1kCjB+D01A5JDnGUG6UeXSOcX+sMKUDzSU2AM7t9g=;
X-UUID: 7cdea56ea6634489b398695278f284c2-20191231
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1633579298; Tue, 31 Dec 2019 21:41:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 21:42:19 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 31 Dec 2019 21:41:17 +0800
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v7 4/6] Refine mtk_pinconf_get()
Date:   Tue, 31 Dec 2019 21:41:45 +0800
Message-ID: <1577799707-11855-4-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Q29ycmVjdCBjYXNlcyBmb3IgUElOX0NPTkZJR19TTEVXX1JBVEUsIFBJTl9DT05GSUdfSU5QVVRf
U0NITUlUVF9FTkFCTEUsDQphbmQgUElOX0NPTkZJR19PVVRQVVRfRU5BQkxFIC0NClVzZSB2YXJp
YWJsZSByZXQgdG8gcmVjZWl2ZSB2YWx1ZSBpbiBtdGtfaHdfZ2V0X3ZhbHVlKCkgKGluc3RlYWQg
b2YNCnZhcmlhYmxlIHZhbCkgc2luY2UgcGluY29uZl90b19jb25maWdfcGFja2VkKCkgYXQgZW5k
IG9mIHRoaXMgZnVuY3Rpb24NCnVzZSB2YXJpYWJsZSByZXQgdG8gcGFjayBjb25maWcgdmFsdWUu
DQoNCkNoYW5nZS1JZDogSWNkZWVjZWU4ZjYxNDM0NmE5YjUzNzY0ZDIwMTIyYjJiNDk0MGIzODEN
Ci0tLQ0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmMgfCA0MCArKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRp
b25zKCspLCAyNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9waW5jdHJsLXBhcmlzLmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1wYXJpcy5jDQppbmRleCAyZjA3NTAwLi5kMDlhNzI2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KKysrIGIvZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KQEAgLTc4LDcgKzc4LDcgQEAgc3RhdGljIGludCBtdGtf
cGluY29uZl9nZXQoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KIHsNCiAJc3RydWN0IG10
a19waW5jdHJsICpodyA9IHBpbmN0cmxfZGV2X2dldF9kcnZkYXRhKHBjdGxkZXYpOw0KIAl1MzIg
cGFyYW0gPSBwaW5jb25mX3RvX2NvbmZpZ19wYXJhbSgqY29uZmlnKTsNCi0JaW50IHZhbCwgdmFs
MiwgZXJyLCByZWcsIHJldCA9IDE7DQorCWludCBlcnIsIHJlZywgcmV0ID0gMTsNCiAJY29uc3Qg
c3RydWN0IG10a19waW5fZGVzYyAqZGVzYzsNCiANCiAJaWYgKHBpbiA+PSBody0+c29jLT5ucGlu
cykgew0KQEAgLTEwNywxNyArMTA3LDExIEBAIHN0YXRpYyBpbnQgbXRrX3BpbmNvbmZfZ2V0KHN0
cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwNCiAJCQllcnIgPSAtRU5PVFNVUFA7DQogCQlicmVh
azsNCiAJY2FzZSBQSU5fQ09ORklHX1NMRVdfUkFURToNCi0JCWVyciA9IG10a19od19nZXRfdmFs
dWUoaHcsIGRlc2MsIFBJTkNUUkxfUElOX1JFR19TUiwgJnZhbCk7DQotCQlpZiAoZXJyKQ0KLQkJ
CXJldHVybiBlcnI7DQotDQotCQlpZiAoIXZhbCkNCi0JCQlyZXR1cm4gLUVJTlZBTDsNCi0NCisJ
CWVyciA9IG10a19od19nZXRfdmFsdWUoaHcsIGRlc2MsIFBJTkNUUkxfUElOX1JFR19TUiwgJnJl
dCk7DQogCQlicmVhazsNCiAJY2FzZSBQSU5fQ09ORklHX0lOUFVUX0VOQUJMRToNCiAJY2FzZSBQ
SU5fQ09ORklHX09VVFBVVF9FTkFCTEU6DQotCQllcnIgPSBtdGtfaHdfZ2V0X3ZhbHVlKGh3LCBk
ZXNjLCBQSU5DVFJMX1BJTl9SRUdfRElSLCAmdmFsKTsNCisJCWVyciA9IG10a19od19nZXRfdmFs
dWUoaHcsIGRlc2MsIFBJTkNUUkxfUElOX1JFR19ESVIsICZyZXQpOw0KIAkJaWYgKGVycikNCiAJ
CQlnb3RvIG91dDsNCiAJCS8qICAgICBDT05GSUcgICAgIEN1cnJlbnQgZGlyZWN0aW9uIHJldHVy
biB2YWx1ZQ0KQEAgLTEyOCwyMCArMTIyLDIyIEBAIHN0YXRpYyBpbnQgbXRrX3BpbmNvbmZfZ2V0
KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwNCiAJCSAqICAgICAgICAgICAgICAgICAgICAg
aW5wdXQgICAgICAgIDEgKD0gcmV2ZXJzZSBIVyB2YWx1ZSkNCiAJCSAqLw0KIAkJaWYgKHBhcmFt
ID09IFBJTl9DT05GSUdfSU5QVVRfRU5BQkxFKQ0KLQkJCXZhbCA9ICF2YWw7DQorCQkJcmV0ID0g
IXJldDsNCiANCiAJCWJyZWFrOw0KIAljYXNlIFBJTl9DT05GSUdfSU5QVVRfU0NITUlUVF9FTkFC
TEU6DQotCQllcnIgPSBtdGtfaHdfZ2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5DVFJMX1BJTl9SRUdf
RElSLCAmdmFsKTsNCisJCWVyciA9IG10a19od19nZXRfdmFsdWUoaHcsIGRlc2MsIFBJTkNUUkxf
UElOX1JFR19ESVIsICZyZXQpOw0KIAkJaWYgKGVycikNCi0JCQlyZXR1cm4gZXJyOw0KLQ0KLQkJ
ZXJyID0gbXRrX2h3X2dldF92YWx1ZShodywgZGVzYywgUElOQ1RSTF9QSU5fUkVHX1NNVCwgJnZh
bDIpOw0KLQkJaWYgKGVycikNCi0JCQlyZXR1cm4gZXJyOw0KKwkJCWdvdG8gb3V0Ow0KKwkJLyog
cmV0dXJuIGVycm9yIHdoZW4gaW4gb3V0cHV0IG1vZGUNCisJCSAqIGJlY2F1c2Ugc2NobWl0dCB0
cmlnZ2VyIG9ubHkgd29yayBpbiBpbnB1dCBtb2RlDQorCQkgKi8NCisJCWlmIChyZXQpIHsNCisJ
CQllcnIgPSAtRUlOVkFMOw0KKwkJCWdvdG8gb3V0Ow0KKwkJfQ0KIA0KLQkJaWYgKHZhbCB8fCAh
dmFsMikNCi0JCQlyZXR1cm4gLUVJTlZBTDsNCisJCWVyciA9IG10a19od19nZXRfdmFsdWUoaHcs
IGRlc2MsIFBJTkNUUkxfUElOX1JFR19TTVQsICZyZXQpOw0KIA0KIAkJYnJlYWs7DQogCWNhc2Ug
UElOX0NPTkZJR19EUklWRV9TVFJFTkdUSDoNCkBAIC0xNTQsMTMgKzE1MCw3IEBAIHN0YXRpYyBp
bnQgbXRrX3BpbmNvbmZfZ2V0KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwNCiAJY2FzZSBN
VEtfUElOX0NPTkZJR19SRFNFTDoNCiAJCXJlZyA9IChwYXJhbSA9PSBNVEtfUElOX0NPTkZJR19U
RFNFTCkgPw0KIAkJICAgICAgIFBJTkNUUkxfUElOX1JFR19URFNFTCA6IFBJTkNUUkxfUElOX1JF
R19SRFNFTDsNCi0NCi0JCWVyciA9IG10a19od19nZXRfdmFsdWUoaHcsIGRlc2MsIHJlZywgJnZh
bCk7DQotCQlpZiAoZXJyKQ0KLQkJCXJldHVybiBlcnI7DQotDQotCQlyZXQgPSB2YWw7DQotDQor
CQllcnIgPSBtdGtfaHdfZ2V0X3ZhbHVlKGh3LCBkZXNjLCByZWcsICZyZXQpOw0KIAkJYnJlYWs7
DQogCWNhc2UgTVRLX1BJTl9DT05GSUdfUFVfQURWOg0KIAljYXNlIE1US19QSU5fQ09ORklHX1BE
X0FEVjoNCi0tIA0KMS44LjEuMS5kaXJ0eQ0K

