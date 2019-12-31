Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 221CD12D924
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2019 14:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfLaNmI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Dec 2019 08:42:08 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:3222 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726229AbfLaNmI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Dec 2019 08:42:08 -0500
X-UUID: a80561bb7126440187103987c8fdc717-20191231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ovw/5L5KUQvwakahmzrRWt8hUz9TgXmkAjJh/XPVrVM=;
        b=soW4+Uj8I1FWOJRq0kmrRPnsZRCe4bJXWSyjsMuIZ3XMSXH3TUfqWQmExUXhXT4pc26jXBhMCnZTyoOV+pqvW3eLaALKc/oSD0ab3FT4kbhFsRy9aKyEhR8gAb4bbVq6QwDCs5PrSBvSerCzLQwTZOqyiCrs/Q6oCrq2QHTNZg4=;
X-UUID: a80561bb7126440187103987c8fdc717-20191231
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1040652905; Tue, 31 Dec 2019 21:41:56 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 21:41:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 31 Dec 2019 21:41:16 +0800
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v7 3/6] Refine mtk_pinconf_get() and mtk_pinconf_set()
Date:   Tue, 31 Dec 2019 21:41:44 +0800
Message-ID: <1577799707-11855-3-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 9B17271DB44F190F0E9A6C723FA3F82DCD008452B17672C2812E0902A310BE242000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

MS5SZWZpbmUgbXRrX3BpbmNvbmZfZ2V0KCk6DQogIFVzZSBvbmx5IG9uZSBvY2N1cnJlbmNlIG9m
IHJldHVybiBhdCBlbmQgb2YgdGhpcyBmdW5jdGlvbi4NCg0KMi5SZWZpbmUgbXRrX3BpbmNvbmZf
c2V0KCk6DQoyLjEgVXNlIG9ubHkgb25lIG9jY3VycmVuY2Ugb2YgcmV0dXJuIGF0IGVuZCBvZiB0
aGlzIGZ1bmN0aW9uLg0KMi4yIE1vZGlmeSBjYXNlIG9mIFBJTl9DT05GSUdfSU5QVVRfRU5BQkxF
IC0NCjIuMi4xDQogICAgUmVnYXJkIGFsbCBub24temVybyBzZXR0aW5nIHZhbHVlIGFzIGVuYWJs
ZSwgaW5zdGVhZCBvZiBhbHdheXMgZW5hYmxlLg0KMi4yLjINCiAgICBSZW1vdmUgY2hlY2sgb2Yg
aWVzX3ByZXNlbnQgZmxhZyBhbmQgYWx3YXlzIGludm9rZSBtdGtfaHdfc2V0X3ZhbHVlKCkNCiAg
ICBzaW5jZSBtdGtfaHdfcGluX2ZpZWxkX2xvb2t1cCgpIGludm9rZWQgaW5zaWRlIG10a19od19z
ZXRfdmFsdWUoKSBoYXMNCiAgICB0aGUgc2FtZSBlZmZlY3Qgb2YgY2hlY2tpbmcgaWYgaWVzIGNv
bnRyb2wgaXMgc3VwcG9ydGVkLg0KICAgIFtUaGUgcmF0aW9uYWxlIGlzIHRoYXQ6IGF2YWlsYWJs
ZSBvZiBhIGNvbnRyb2wgaXMgYWx3YXlzIGNoZWNrZWQNCiAgICAgaW4gbXRrX2h3X3Bpbl9maWVs
ZF9sb29rdXAoKSBhbmQgbm8gbmVlZCB0byBhZGQgaWVzX3ByZXNlbnQgZmxhZw0KICAgICBzcGVj
aWFsbHkgZm9yIGllcyBjb250cm9sLl0NCjIuMyBTaW1wbHkgY29kZSBsb2dpYyBmb3IgY2FzZSBv
ZiBQSU5fQ09ORklHX0lOUFVUX1NDSE1JVFQuDQoyLjQgQWRkIGNhc2UgZm9yIFBJTl9DT05GSUdf
SU5QVVRfU0NITUlUVF9FTkFCTEUgYW5kIHByb2Nlc3MgaXQgd2l0aCB0aGUNCiAgICBzYW1lIGNv
ZGUgZm9yIGNhc2Ugb2YgUElOX0NPTkZJR19JTlBVVF9TQ0hNSVRULg0KDQpDaGFuZ2UtSWQ6IEk3
YWRlZjM1NTBjY2JiMTFhZWUzZGRhZjAxNGJiZDlmNTRhOWFkMDg5DQotLS0NCiBkcml2ZXJzL3Bp
bmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYyB8ICAgMSAtDQogZHJpdmVycy9waW5jdHJs
L21lZGlhdGVrL3BpbmN0cmwtbXQ4MTgzLmMgfCAgIDEgLQ0KIGRyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLXBhcmlzLmMgIHwgMTcxICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LQ0KIDMgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgMTA4IGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMg
Yi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYw0KaW5kZXggMTIxMjI2
NC4uN2ZhZTM5NyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJs
LW10Njc2NS5jDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUu
Yw0KQEAgLTEwNzAsNyArMTA3MCw2IEBADQogCS5uZ3JwcyA9IEFSUkFZX1NJWkUobXRrX3BpbnNf
bXQ2NzY1KSwNCiAJLmVpbnRfaHcgPSAmbXQ2NzY1X2VpbnRfaHcsDQogCS5ncGlvX20gPSAwLA0K
LQkuaWVzX3ByZXNlbnQgPSB0cnVlLA0KIAkuYmFzZV9uYW1lcyA9IG10Njc2NV9waW5jdHJsX3Jl
Z2lzdGVyX2Jhc2VfbmFtZXMsDQogCS5uYmFzZV9uYW1lcyA9IEFSUkFZX1NJWkUobXQ2NzY1X3Bp
bmN0cmxfcmVnaXN0ZXJfYmFzZV9uYW1lcyksDQogCS5iaWFzX2Rpc2FibGVfc2V0ID0gbXRrX3Bp
bmNvbmZfYmlhc19kaXNhYmxlX3NldCwNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdDgxODMuYyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJs
LW10ODE4My5jDQppbmRleCA5YTc0ZDUwLi40ZWNhODE4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ4MTgzLmMNCisrKyBiL2RyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9waW5jdHJsLW10ODE4My5jDQpAQCAtNTU0LDcgKzU1NCw2IEBADQogCS5uZ3JwcyA9
IEFSUkFZX1NJWkUobXRrX3BpbnNfbXQ4MTgzKSwNCiAJLmVpbnRfaHcgPSAmbXQ4MTgzX2VpbnRf
aHcsDQogCS5ncGlvX20gPSAwLA0KLQkuaWVzX3ByZXNlbnQgPSB0cnVlLA0KIAkuYmFzZV9uYW1l
cyA9IG10ODE4M19waW5jdHJsX3JlZ2lzdGVyX2Jhc2VfbmFtZXMsDQogCS5uYmFzZV9uYW1lcyA9
IEFSUkFZX1NJWkUobXQ4MTgzX3BpbmN0cmxfcmVnaXN0ZXJfYmFzZV9uYW1lcyksDQogCS5iaWFz
X2Rpc2FibGVfc2V0ID0gbXRrX3BpbmNvbmZfYmlhc19kaXNhYmxlX3NldF9yZXYxLA0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmMgYi9kcml2ZXJz
L3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1wYXJpcy5jDQppbmRleCAzZTEzYWU3Li4yZjA3NTAw
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0K
KysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KQEAgLTgxLDM3
ICs4MSwzMCBAQCBzdGF0aWMgaW50IG10a19waW5jb25mX2dldChzdHJ1Y3QgcGluY3RybF9kZXYg
KnBjdGxkZXYsDQogCWludCB2YWwsIHZhbDIsIGVyciwgcmVnLCByZXQgPSAxOw0KIAljb25zdCBz
dHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjOw0KIA0KLQlpZiAocGluID49IGh3LT5zb2MtPm5waW5z
KQ0KLQkJcmV0dXJuIC1FSU5WQUw7DQorCWlmIChwaW4gPj0gaHctPnNvYy0+bnBpbnMpIHsNCisJ
CWVyciA9IC1FSU5WQUw7DQorCQlnb3RvIG91dDsNCisJfQ0KIAlkZXNjID0gKGNvbnN0IHN0cnVj
dCBtdGtfcGluX2Rlc2MgKikmaHctPnNvYy0+cGluc1twaW5dOw0KIA0KIAlzd2l0Y2ggKHBhcmFt
KSB7DQogCWNhc2UgUElOX0NPTkZJR19CSUFTX0RJU0FCTEU6DQotCQlpZiAoaHctPnNvYy0+Ymlh
c19kaXNhYmxlX2dldCkgew0KKwkJaWYgKGh3LT5zb2MtPmJpYXNfZGlzYWJsZV9nZXQpDQogCQkJ
ZXJyID0gaHctPnNvYy0+Ymlhc19kaXNhYmxlX2dldChodywgZGVzYywgJnJldCk7DQotCQkJaWYg
KGVycikNCi0JCQkJcmV0dXJuIGVycjsNCi0JCX0gZWxzZSB7DQotCQkJcmV0dXJuIC1FTk9UU1VQ
UDsNCi0JCX0NCisJCWVsc2UNCisJCQllcnIgPSAtRU5PVFNVUFA7DQogCQlicmVhazsNCiAJY2Fz
ZSBQSU5fQ09ORklHX0JJQVNfUFVMTF9VUDoNCi0JCWlmIChody0+c29jLT5iaWFzX2dldCkgew0K
KwkJaWYgKGh3LT5zb2MtPmJpYXNfZ2V0KQ0KIAkJCWVyciA9IGh3LT5zb2MtPmJpYXNfZ2V0KGh3
LCBkZXNjLCAxLCAmcmV0KTsNCi0JCQlpZiAoZXJyKQ0KLQkJCQlyZXR1cm4gZXJyOw0KLQkJfSBl
bHNlIHsNCi0JCQlyZXR1cm4gLUVOT1RTVVBQOw0KLQkJfQ0KKwkJZWxzZQ0KKwkJCWVyciA9IC1F
Tk9UU1VQUDsNCiAJCWJyZWFrOw0KIAljYXNlIFBJTl9DT05GSUdfQklBU19QVUxMX0RPV046DQot
CQlpZiAoaHctPnNvYy0+Ymlhc19nZXQpIHsNCisJCWlmIChody0+c29jLT5iaWFzX2dldCkNCiAJ
CQllcnIgPSBody0+c29jLT5iaWFzX2dldChodywgZGVzYywgMCwgJnJldCk7DQotCQkJaWYgKGVy
cikNCi0JCQkJcmV0dXJuIGVycjsNCi0JCX0gZWxzZSB7DQotCQkJcmV0dXJuIC1FTk9UU1VQUDsN
Ci0JCX0NCisJCWVsc2UNCisJCQllcnIgPSAtRU5PVFNVUFA7DQogCQlicmVhazsNCiAJY2FzZSBQ
SU5fQ09ORklHX1NMRVdfUkFURToNCiAJCWVyciA9IG10a19od19nZXRfdmFsdWUoaHcsIGRlc2Ms
IFBJTkNUUkxfUElOX1JFR19TUiwgJnZhbCk7DQpAQCAtMTI2LDEyICsxMTksMTYgQEAgc3RhdGlj
IGludCBtdGtfcGluY29uZl9nZXQoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KIAljYXNl
IFBJTl9DT05GSUdfT1VUUFVUX0VOQUJMRToNCiAJCWVyciA9IG10a19od19nZXRfdmFsdWUoaHcs
IGRlc2MsIFBJTkNUUkxfUElOX1JFR19ESVIsICZ2YWwpOw0KIAkJaWYgKGVycikNCi0JCQlyZXR1
cm4gZXJyOw0KLQ0KLQkJLyogSFcgdGFrZXMgaW5wdXQgbW9kZSBhcyB6ZXJvOyBvdXRwdXQgbW9k
ZSBhcyBub24temVybyAqLw0KLQkJaWYgKCh2YWwgJiYgcGFyYW0gPT0gUElOX0NPTkZJR19JTlBV
VF9FTkFCTEUpIHx8DQotCQkgICAgKCF2YWwgJiYgcGFyYW0gPT0gUElOX0NPTkZJR19PVVRQVVRf
RU5BQkxFKSkNCi0JCQlyZXR1cm4gLUVJTlZBTDsNCisJCQlnb3RvIG91dDsNCisJCS8qICAgICBD
T05GSUcgICAgIEN1cnJlbnQgZGlyZWN0aW9uIHJldHVybiB2YWx1ZQ0KKwkJICogLS0tLS0tLS0t
LS0tLSAgLS0tLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KKwkJICogT1VU
UFVUX0VOQUJMRSAgICAgICBvdXRwdXQgICAgICAgMSAoPSBIVyB2YWx1ZSkNCisJCSAqICAgICAg
ICAgICAgICAgICAgICAgaW5wdXQgICAgICAgIDAgKD0gSFcgdmFsdWUpDQorCQkgKiBJTlBVVF9F
TkFCTEUgICAgICAgIG91dHB1dCAgICAgICAwICg9IHJldmVyc2UgSFcgdmFsdWUpDQorCQkgKiAg
ICAgICAgICAgICAgICAgICAgIGlucHV0ICAgICAgICAxICg9IHJldmVyc2UgSFcgdmFsdWUpDQor
CQkgKi8NCisJCWlmIChwYXJhbSA9PSBQSU5fQ09ORklHX0lOUFVUX0VOQUJMRSkNCisJCQl2YWwg
PSAhdmFsOw0KIA0KIAkJYnJlYWs7DQogCWNhc2UgUElOX0NPTkZJR19JTlBVVF9TQ0hNSVRUX0VO
QUJMRToNCkBAIC0xNDgsMTMgKzE0NSwxMCBAQCBzdGF0aWMgaW50IG10a19waW5jb25mX2dldChz
dHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsDQogDQogCQlicmVhazsNCiAJY2FzZSBQSU5fQ09O
RklHX0RSSVZFX1NUUkVOR1RIOg0KLQkJaWYgKGh3LT5zb2MtPmRyaXZlX2dldCkgew0KKwkJaWYg
KGh3LT5zb2MtPmRyaXZlX2dldCkNCiAJCQllcnIgPSBody0+c29jLT5kcml2ZV9nZXQoaHcsIGRl
c2MsICZyZXQpOw0KLQkJCWlmIChlcnIpDQotCQkJCXJldHVybiBlcnI7DQotCQl9IGVsc2Ugew0K
KwkJZWxzZQ0KIAkJCWVyciA9IC1FTk9UU1VQUDsNCi0JCX0NCiAJCWJyZWFrOw0KIAljYXNlIE1U
S19QSU5fQ09ORklHX1REU0VMOg0KIAljYXNlIE1US19QSU5fQ09ORklHX1JEU0VMOg0KQEAgLTE3
NSwyOCArMTY5LDI0IEBAIHN0YXRpYyBpbnQgbXRrX3BpbmNvbmZfZ2V0KHN0cnVjdCBwaW5jdHJs
X2RldiAqcGN0bGRldiwNCiANCiAJCQlwdWxsdXAgPSBwYXJhbSA9PSBNVEtfUElOX0NPTkZJR19Q
VV9BRFY7DQogCQkJZXJyID0gaHctPnNvYy0+YWR2X3B1bGxfZ2V0KGh3LCBkZXNjLCBwdWxsdXAs
ICZyZXQpOw0KLQkJCWlmIChlcnIpDQotCQkJCXJldHVybiBlcnI7DQotCQl9IGVsc2Ugew0KLQkJ
CXJldHVybiAtRU5PVFNVUFA7DQotCQl9DQorCQl9IGVsc2UNCisJCQllcnIgPSAtRU5PVFNVUFA7
DQogCQlicmVhazsNCiAJY2FzZSBNVEtfUElOX0NPTkZJR19EUlZfQURWOg0KLQkJaWYgKGh3LT5z
b2MtPmFkdl9kcml2ZV9nZXQpIHsNCisJCWlmIChody0+c29jLT5hZHZfZHJpdmVfZ2V0KQ0KIAkJ
CWVyciA9IGh3LT5zb2MtPmFkdl9kcml2ZV9nZXQoaHcsIGRlc2MsICZyZXQpOw0KLQkJCWlmIChl
cnIpDQotCQkJCXJldHVybiBlcnI7DQotCQl9IGVsc2Ugew0KLQkJCXJldHVybiAtRU5PVFNVUFA7
DQotCQl9DQorCQllbHNlDQorCQkJZXJyID0gLUVOT1RTVVBQOw0KIAkJYnJlYWs7DQogCWRlZmF1
bHQ6DQotCQlyZXR1cm4gLUVOT1RTVVBQOw0KKwkJZXJyID0gLUVOT1RTVVBQOw0KIAl9DQogDQot
CSpjb25maWcgPSBwaW5jb25mX3RvX2NvbmZpZ19wYWNrZWQocGFyYW0sIHJldCk7DQorb3V0Og0K
KwlpZiAoIWVycikNCisJCSpjb25maWcgPSBwaW5jb25mX3RvX2NvbmZpZ19wYWNrZWQocGFyYW0s
IHJldCk7DQogDQotCXJldHVybiAwOw0KKwlyZXR1cm4gZXJyOw0KIH0NCiANCiBzdGF0aWMgaW50
IG10a19waW5jb25mX3NldChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsIHVuc2lnbmVkIGlu
dCBwaW4sDQpAQCAtMjE2LDYwICsyMDYsNDcgQEAgc3RhdGljIGludCBtdGtfcGluY29uZl9zZXQo
c3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LCB1bnNpZ25lZCBpbnQgcGluLA0KIA0KIAlzd2l0
Y2ggKCh1MzIpcGFyYW0pIHsNCiAJY2FzZSBQSU5fQ09ORklHX0JJQVNfRElTQUJMRToNCi0JCWlm
IChody0+c29jLT5iaWFzX2Rpc2FibGVfc2V0KSB7DQorCQlpZiAoaHctPnNvYy0+Ymlhc19kaXNh
YmxlX3NldCkNCiAJCQllcnIgPSBody0+c29jLT5iaWFzX2Rpc2FibGVfc2V0KGh3LCBkZXNjKTsN
Ci0JCQlpZiAoZXJyKQ0KLQkJCQlyZXR1cm4gZXJyOw0KLQkJfSBlbHNlIHsNCi0JCQlyZXR1cm4g
LUVOT1RTVVBQOw0KLQkJfQ0KKwkJZWxzZQ0KKwkJCWVyciA9IC1FTk9UU1VQUDsNCiAJCWJyZWFr
Ow0KIAljYXNlIFBJTl9DT05GSUdfQklBU19QVUxMX1VQOg0KLQkJaWYgKGh3LT5zb2MtPmJpYXNf
c2V0KSB7DQorCQlpZiAoaHctPnNvYy0+Ymlhc19zZXQpDQogCQkJZXJyID0gaHctPnNvYy0+Ymlh
c19zZXQoaHcsIGRlc2MsIDEpOw0KLQkJCWlmIChlcnIpDQotCQkJCXJldHVybiBlcnI7DQotCQl9
IGVsc2Ugew0KLQkJCXJldHVybiAtRU5PVFNVUFA7DQotCQl9DQorCQllbHNlDQorCQkJZXJyID0g
LUVOT1RTVVBQOw0KIAkJYnJlYWs7DQogCWNhc2UgUElOX0NPTkZJR19CSUFTX1BVTExfRE9XTjoN
Ci0JCWlmIChody0+c29jLT5iaWFzX3NldCkgew0KKwkJaWYgKGh3LT5zb2MtPmJpYXNfc2V0KQ0K
IAkJCWVyciA9IGh3LT5zb2MtPmJpYXNfc2V0KGh3LCBkZXNjLCAwKTsNCi0JCQlpZiAoZXJyKQ0K
LQkJCQlyZXR1cm4gZXJyOw0KLQkJfSBlbHNlIHsNCi0JCQlyZXR1cm4gLUVOT1RTVVBQOw0KLQkJ
fQ0KKwkJZWxzZQ0KKwkJCWVyciA9IC1FTk9UU1VQUDsNCiAJCWJyZWFrOw0KIAljYXNlIFBJTl9D
T05GSUdfT1VUUFVUX0VOQUJMRToNCiAJCWVyciA9IG10a19od19zZXRfdmFsdWUoaHcsIGRlc2Ms
IFBJTkNUUkxfUElOX1JFR19TTVQsDQogCQkJCSAgICAgICBNVEtfRElTQUJMRSk7DQotCQlpZiAo
ZXJyKQ0KKwkJLyogS2VlcCBzZXQgZGlyZWN0aW9uIHRvIGNvbnNpZGVyIHRoZSBjYXNlIHRoYXQg
YSBHUElPIHBpbg0KKwkJICogIGRvZXMgbm90IGhhdmUgU01UIGNvbnRyb2wNCisJCSAqLw0KKwkJ
aWYgKGVyciAhPSAtRU5PVFNVUFApDQogCQkJZ290byBlcnI7DQogDQogCQllcnIgPSBtdGtfaHdf
c2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5DVFJMX1BJTl9SRUdfRElSLA0KIAkJCQkgICAgICAgTVRL
X09VVFBVVCk7DQotCQlpZiAoZXJyKQ0KLQkJCWdvdG8gZXJyOw0KIAkJYnJlYWs7DQogCWNhc2Ug
UElOX0NPTkZJR19JTlBVVF9FTkFCTEU6DQotCQlpZiAoaHctPnNvYy0+aWVzX3ByZXNlbnQpIHsN
Ci0JCQltdGtfaHdfc2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5DVFJMX1BJTl9SRUdfSUVTLA0KLQkJ
CQkJIE1US19FTkFCTEUpOw0KLQkJfQ0KKwkJLyogcmVnYXJkIGFsbCBub24temVybyB2YWx1ZSBh
cyBlbmFibGUgKi8NCisJCWVyciA9IG10a19od19zZXRfdmFsdWUoaHcsIGRlc2MsIFBJTkNUUkxf
UElOX1JFR19JRVMsICEhYXJnKTsNCisJCWlmIChlcnIpDQorCQkJZ290byBlcnI7DQogDQogCQll
cnIgPSBtdGtfaHdfc2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5DVFJMX1BJTl9SRUdfRElSLA0KIAkJ
CQkgICAgICAgTVRLX0lOUFVUKTsNCi0JCWlmIChlcnIpDQotCQkJZ290byBlcnI7DQogCQlicmVh
azsNCiAJY2FzZSBQSU5fQ09ORklHX1NMRVdfUkFURToNCi0JCWVyciA9IG10a19od19zZXRfdmFs
dWUoaHcsIGRlc2MsIFBJTkNUUkxfUElOX1JFR19TUiwNCi0JCQkJICAgICAgIGFyZyk7DQotCQlp
ZiAoZXJyKQ0KLQkJCWdvdG8gZXJyOw0KLQ0KKwkJLyogcmVnYXJkIGFsbCBub24temVybyB2YWx1
ZSBhcyBlbmFibGUgKi8NCisJCWVyciA9IG10a19od19zZXRfdmFsdWUoaHcsIGRlc2MsIFBJTkNU
UkxfUElOX1JFR19TUiwgISFhcmcpOw0KIAkJYnJlYWs7DQogCWNhc2UgUElOX0NPTkZJR19PVVRQ
VVQ6DQogCQllcnIgPSBtdGtfaHdfc2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5DVFJMX1BJTl9SRUdf
RElSLA0KQEAgLTI3OSw0MSArMjU2LDI5IEBAIHN0YXRpYyBpbnQgbXRrX3BpbmNvbmZfc2V0KHN0
cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwgdW5zaWduZWQgaW50IHBpbiwNCiANCiAJCWVyciA9
IG10a19od19zZXRfdmFsdWUoaHcsIGRlc2MsIFBJTkNUUkxfUElOX1JFR19ETywNCiAJCQkJICAg
ICAgIGFyZyk7DQotCQlpZiAoZXJyKQ0KLQkJCWdvdG8gZXJyOw0KIAkJYnJlYWs7DQorCWNhc2Ug
UElOX0NPTkZJR19JTlBVVF9TQ0hNSVRUOg0KIAljYXNlIFBJTl9DT05GSUdfSU5QVVRfU0NITUlU
VF9FTkFCTEU6DQogCQkvKiBhcmcgPSAxOiBJbnB1dCBtb2RlICYgU01UIGVuYWJsZSA7DQogCQkg
KiBhcmcgPSAwOiBPdXRwdXQgbW9kZSAmIFNNVCBkaXNhYmxlDQogCQkgKi8NCi0JCWFyZyA9IGFy
ZyA/IDIgOiAxOw0KLQkJZXJyID0gbXRrX2h3X3NldF92YWx1ZShodywgZGVzYywgUElOQ1RSTF9Q
SU5fUkVHX0RJUiwNCi0JCQkJICAgICAgIGFyZyAmIDEpOw0KKwkJZXJyID0gbXRrX2h3X3NldF92
YWx1ZShodywgZGVzYywgUElOQ1RSTF9QSU5fUkVHX0RJUiwgIWFyZyk7DQogCQlpZiAoZXJyKQ0K
IAkJCWdvdG8gZXJyOw0KIA0KLQkJZXJyID0gbXRrX2h3X3NldF92YWx1ZShodywgZGVzYywgUElO
Q1RSTF9QSU5fUkVHX1NNVCwNCi0JCQkJICAgICAgICEhKGFyZyAmIDIpKTsNCi0JCWlmIChlcnIp
DQotCQkJZ290byBlcnI7DQorCQllcnIgPSBtdGtfaHdfc2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5D
VFJMX1BJTl9SRUdfU01ULCAhIWFyZyk7DQogCQlicmVhazsNCiAJY2FzZSBQSU5fQ09ORklHX0RS
SVZFX1NUUkVOR1RIOg0KLQkJaWYgKGh3LT5zb2MtPmRyaXZlX3NldCkgew0KKwkJaWYgKGh3LT5z
b2MtPmRyaXZlX3NldCkNCiAJCQllcnIgPSBody0+c29jLT5kcml2ZV9zZXQoaHcsIGRlc2MsIGFy
Zyk7DQotCQkJaWYgKGVycikNCi0JCQkJcmV0dXJuIGVycjsNCi0JCX0gZWxzZSB7DQotCQkJcmV0
dXJuIC1FTk9UU1VQUDsNCi0JCX0NCisJCWVsc2UNCisJCQllcnIgPSAtRU5PVFNVUFA7DQogCQli
cmVhazsNCiAJY2FzZSBNVEtfUElOX0NPTkZJR19URFNFTDoNCiAJY2FzZSBNVEtfUElOX0NPTkZJ
R19SRFNFTDoNCiAJCXJlZyA9IChwYXJhbSA9PSBNVEtfUElOX0NPTkZJR19URFNFTCkgPw0KIAkJ
ICAgICAgIFBJTkNUUkxfUElOX1JFR19URFNFTCA6IFBJTkNUUkxfUElOX1JFR19SRFNFTDsNCi0N
CiAJCWVyciA9IG10a19od19zZXRfdmFsdWUoaHcsIGRlc2MsIHJlZywgYXJnKTsNCi0JCWlmIChl
cnIpDQotCQkJZ290byBlcnI7DQogCQlicmVhazsNCiAJY2FzZSBNVEtfUElOX0NPTkZJR19QVV9B
RFY6DQogCWNhc2UgTVRLX1BJTl9DT05GSUdfUERfQURWOg0KQEAgLTMyMywyMCArMjg4LDE0IEBA
IHN0YXRpYyBpbnQgbXRrX3BpbmNvbmZfc2V0KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwg
dW5zaWduZWQgaW50IHBpbiwNCiAJCQlwdWxsdXAgPSBwYXJhbSA9PSBNVEtfUElOX0NPTkZJR19Q
VV9BRFY7DQogCQkJZXJyID0gaHctPnNvYy0+YWR2X3B1bGxfc2V0KGh3LCBkZXNjLCBwdWxsdXAs
DQogCQkJCQkJICAgIGFyZyk7DQotCQkJaWYgKGVycikNCi0JCQkJcmV0dXJuIGVycjsNCi0JCX0g
ZWxzZSB7DQotCQkJcmV0dXJuIC1FTk9UU1VQUDsNCi0JCX0NCisJCX0gZWxzZQ0KKwkJCWVyciA9
IC1FTk9UU1VQUDsNCiAJCWJyZWFrOw0KIAljYXNlIE1US19QSU5fQ09ORklHX0RSVl9BRFY6DQot
CQlpZiAoaHctPnNvYy0+YWR2X2RyaXZlX3NldCkgew0KKwkJaWYgKGh3LT5zb2MtPmFkdl9kcml2
ZV9zZXQpDQogCQkJZXJyID0gaHctPnNvYy0+YWR2X2RyaXZlX3NldChodywgZGVzYywgYXJnKTsN
Ci0JCQlpZiAoZXJyKQ0KLQkJCQlyZXR1cm4gZXJyOw0KLQkJfSBlbHNlIHsNCi0JCQlyZXR1cm4g
LUVOT1RTVVBQOw0KLQkJfQ0KKwkJZWxzZQ0KKwkJCWVyciA9IC1FTk9UU1VQUDsNCiAJCWJyZWFr
Ow0KIAlkZWZhdWx0Og0KIAkJZXJyID0gLUVOT1RTVVBQOw0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

