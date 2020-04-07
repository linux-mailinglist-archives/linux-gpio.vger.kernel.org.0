Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 962AC1A1685
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 22:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgDGUIb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 16:08:31 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:57256 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726712AbgDGUIb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2020 16:08:31 -0400
X-UUID: a0ef26e745474e91b944c1724fec8f54-20200408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=k0N1E34+nhOU0U/t407+WqxpA7Qe1683WlAodaboMmc=;
        b=aa0Ov3M//Qlk8MygQrpBA19ALUUpS/FILEZp/xgo1qn6/eUjBlPCmR0xqIijCg9tgCrBZ7ex23IWKFyCY5iLgfX0yn6qfcPmYPFjgwQGIgccXXMmXMW2W5VTCyC44oPmy5JkmNitC5918Kh3MziMHz8FPpTLlh9a1pyDC61VaHI=;
X-UUID: a0ef26e745474e91b944c1724fec8f54-20200408
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <sean.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1293237371; Wed, 08 Apr 2020 04:08:24 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Apr 2020 04:08:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Apr 2020 04:08:16 +0800
From:   <sean.wang@mediatek.com>
To:     <linus.walleij@linaro.org>, <linux-mediatek@lists.infradead.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Light Hsieh <light.hsieh@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v7 1/2] pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for buidling loadable module
Date:   Wed, 8 Apr 2020 04:08:16 +0800
Message-ID: <9feeb04805e5a406fe22a92e3f280abda39ddda4.1586289920.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: E4434ADE93FB1DFDD2AC2821CF367BC3B4DFB0D230027CD63D42298064DF61562000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KSW4gdGhlIGZ1
dHVyZSB3ZSB3YW50IHRvIGJlIGFibGUgdG8gYnVpbGQgdGhlIE1lZGlhVGVrIHBpbmN0cmwgZHJp
dmVyLA0KYmFzZWQgb24gcGFyaXMsIGFzIGtlcm5lbCBtb2R1bGUuIFRoaXMgcGF0Y2ggYWxsb3dz
IHBpbmN0cmwtcGFyaXMuYywgdGhlDQpleHRlcm5hbCBpbnRlcnJ1cHQgY29udHJvbGxlciBtdGst
ZWludC5jLCBhbmQgcGluY3RybC1tdGstY29tbW9uLXYyLmMgdG8NCmJlIGxvYWRhYmxlIGFzIG1v
ZHVsZS4NCg0KU2lnbmVkLW9mZi1ieTogU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0ZWsuY29t
Pg0KU2lnbmVkLW9mZi1ieTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4N
ClJldmlld2VkLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPg0K
LS0tDQp2Ni0+djc6IG5vIGNoYW5nZQ0KLS0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tj
b25maWcgICAgICAgICAgICAgIHwgMTEgKysrKysrKy0tDQogZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL01ha2VmaWxlICAgICAgICAgICAgIHwgIDUgKystLQ0KIGRyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9tdGstZWludC5jICAgICAgICAgICB8ICA5ICsrKysrKysNCiAuLi4vcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuYyAgfCAyNCArKysrKysrKysrKysrKysrKysrDQog
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYyAgICAgIHwgIDYgKysrKysN
CiA1IGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvcGlu
Y3RybC9tZWRpYXRlay9LY29uZmlnDQppbmRleCA3MDFmOWFmNjNmNWUuLjU1MWFjNzE2YjEwYyAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnDQorKysgYi9kcml2
ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KQEAgLTMsMTAgKzMsMTIgQEAgbWVudSAiTWVk
aWFUZWsgcGluY3RybCBkcml2ZXJzIg0KIAlkZXBlbmRzIG9uIEFSQ0hfTUVESUFURUsgfHwgQ09N
UElMRV9URVNUDQogDQogY29uZmlnIEVJTlRfTVRLDQotCWJvb2wgIk1lZGlhVGVrIEV4dGVybmFs
IEludGVycnVwdCBTdXBwb3J0Ig0KKwl0cmlzdGF0ZSAiTWVkaWFUZWsgRXh0ZXJuYWwgSW50ZXJy
dXB0IFN1cHBvcnQiDQogCWRlcGVuZHMgb24gUElOQ1RSTF9NVEsgfHwgUElOQ1RSTF9NVEtfTU9P
UkUgfHwgUElOQ1RSTF9NVEtfUEFSSVMgfHwgQ09NUElMRV9URVNUDQogCXNlbGVjdCBHUElPTElC
DQogCXNlbGVjdCBJUlFfRE9NQUlODQorCWRlZmF1bHQgeSBpZiBQSU5DVFJMX01USyB8fCBQSU5D
VFJMX01US19NT09SRQ0KKwlkZWZhdWx0IFBJTkNUUkxfTVRLX1BBUklTDQogDQogY29uZmlnIFBJ
TkNUUkxfTVRLDQogCWJvb2wNCkBAIC0xNyw2ICsxOSw5IEBAIGNvbmZpZyBQSU5DVFJMX01USw0K
IAlzZWxlY3QgRUlOVF9NVEsNCiAJc2VsZWN0IE9GX0dQSU8NCiANCitjb25maWcgUElOQ1RSTF9N
VEtfVjINCisJdHJpc3RhdGUNCisNCiBjb25maWcgUElOQ1RSTF9NVEtfTU9PUkUNCiAJYm9vbA0K
IAlkZXBlbmRzIG9uIE9GDQpAQCAtMjUsMTUgKzMwLDE3IEBAIGNvbmZpZyBQSU5DVFJMX01US19N
T09SRQ0KIAlzZWxlY3QgR0VORVJJQ19QSU5NVVhfRlVOQ1RJT05TDQogCXNlbGVjdCBHUElPTElC
DQogCXNlbGVjdCBPRl9HUElPDQorCXNlbGVjdCBQSU5DVFJMX01US19WMg0KIA0KIGNvbmZpZyBQ
SU5DVFJMX01US19QQVJJUw0KLQlib29sDQorCXRyaXN0YXRlDQogCWRlcGVuZHMgb24gT0YNCiAJ
c2VsZWN0IFBJTk1VWA0KIAlzZWxlY3QgR0VORVJJQ19QSU5DT05GDQogCXNlbGVjdCBHUElPTElC
DQogCXNlbGVjdCBFSU5UX01USw0KIAlzZWxlY3QgT0ZfR1BJTw0KKwlzZWxlY3QgUElOQ1RSTF9N
VEtfVjINCiANCiAjIEZvciBBUk12NyBTb0NzDQogY29uZmlnIFBJTkNUUkxfTVQyNzAxDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxlIGIvZHJpdmVycy9waW5j
dHJsL21lZGlhdGVrL01ha2VmaWxlDQppbmRleCBhNzQzMjVhYmQ4NzcuLjRiNzEzMjg3NmU3MSAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZQ0KKysrIGIvZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxlDQpAQCAtMiw4ICsyLDkgQEANCiAjIENvcmUN
CiBvYmotJChDT05GSUdfRUlOVF9NVEspCQkrPSBtdGstZWludC5vDQogb2JqLSQoQ09ORklHX1BJ
TkNUUkxfTVRLKQkrPSBwaW5jdHJsLW10ay1jb21tb24ubw0KLW9iai0kKENPTkZJR19QSU5DVFJM
X01US19NT09SRSkgKz0gcGluY3RybC1tb29yZS5vIHBpbmN0cmwtbXRrLWNvbW1vbi12Mi5vDQot
b2JqLSQoQ09ORklHX1BJTkNUUkxfTVRLX1BBUklTKSArPSBwaW5jdHJsLXBhcmlzLm8gcGluY3Ry
bC1tdGstY29tbW9uLXYyLm8NCitvYmotJChDT05GSUdfUElOQ1RSTF9NVEtfVjIpCSs9IHBpbmN0
cmwtbXRrLWNvbW1vbi12Mi5vDQorb2JqLSQoQ09ORklHX1BJTkNUUkxfTVRLX01PT1JFKSArPSBw
aW5jdHJsLW1vb3JlLm8NCitvYmotJChDT05GSUdfUElOQ1RSTF9NVEtfUEFSSVMpICs9IHBpbmN0
cmwtcGFyaXMubw0KIA0KICMgU29DIERyaXZlcnMNCiBvYmotJChDT05GSUdfUElOQ1RSTF9NVDI3
MDEpCSs9IHBpbmN0cmwtbXQyNzAxLm8NCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvbXRrLWVpbnQuYyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGstZWludC5jDQpp
bmRleCA3ZTUyNmJjZjVlMGIuLjIyNzM2ZjYwYzE2YyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGlu
Y3RybC9tZWRpYXRlay9tdGstZWludC5jDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
bXRrLWVpbnQuYw0KQEAgLTE1LDYgKzE1LDcgQEANCiAjaW5jbHVkZSA8bGludXgvaW8uaD4NCiAj
aW5jbHVkZSA8bGludXgvaXJxY2hpcC9jaGFpbmVkX2lycS5oPg0KICNpbmNsdWRlIDxsaW51eC9p
cnFkb21haW4uaD4NCisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQogI2luY2x1ZGUgPGxpbnV4
L29mX2lycS5oPg0KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCiANCkBAIC0z
NzksNiArMzgwLDcgQEAgaW50IG10a19laW50X2RvX3N1c3BlbmQoc3RydWN0IG10a19laW50ICpl
aW50KQ0KIA0KIAlyZXR1cm4gMDsNCiB9DQorRVhQT1JUX1NZTUJPTF9HUEwobXRrX2VpbnRfZG9f
c3VzcGVuZCk7DQogDQogaW50IG10a19laW50X2RvX3Jlc3VtZShzdHJ1Y3QgbXRrX2VpbnQgKmVp
bnQpDQogew0KQEAgLTM4Niw2ICszODgsNyBAQCBpbnQgbXRrX2VpbnRfZG9fcmVzdW1lKHN0cnVj
dCBtdGtfZWludCAqZWludCkNCiANCiAJcmV0dXJuIDA7DQogfQ0KK0VYUE9SVF9TWU1CT0xfR1BM
KG10a19laW50X2RvX3Jlc3VtZSk7DQogDQogaW50IG10a19laW50X3NldF9kZWJvdW5jZShzdHJ1
Y3QgbXRrX2VpbnQgKmVpbnQsIHVuc2lnbmVkIGxvbmcgZWludF9udW0sDQogCQkJICB1bnNpZ25l
ZCBpbnQgZGVib3VuY2UpDQpAQCAtNDQwLDYgKzQ0Myw3IEBAIGludCBtdGtfZWludF9zZXRfZGVi
b3VuY2Uoc3RydWN0IG10a19laW50ICplaW50LCB1bnNpZ25lZCBsb25nIGVpbnRfbnVtLA0KIA0K
IAlyZXR1cm4gMDsNCiB9DQorRVhQT1JUX1NZTUJPTF9HUEwobXRrX2VpbnRfc2V0X2RlYm91bmNl
KTsNCiANCiBpbnQgbXRrX2VpbnRfZmluZF9pcnEoc3RydWN0IG10a19laW50ICplaW50LCB1bnNp
Z25lZCBsb25nIGVpbnRfbikNCiB7DQpAQCAtNDUxLDYgKzQ1NSw3IEBAIGludCBtdGtfZWludF9m
aW5kX2lycShzdHJ1Y3QgbXRrX2VpbnQgKmVpbnQsIHVuc2lnbmVkIGxvbmcgZWludF9uKQ0KIA0K
IAlyZXR1cm4gaXJxOw0KIH0NCitFWFBPUlRfU1lNQk9MX0dQTChtdGtfZWludF9maW5kX2lycSk7
DQogDQogaW50IG10a19laW50X2RvX2luaXQoc3RydWN0IG10a19laW50ICplaW50KQ0KIHsNCkBA
IC00OTUsMyArNTAwLDcgQEAgaW50IG10a19laW50X2RvX2luaXQoc3RydWN0IG10a19laW50ICpl
aW50KQ0KIA0KIAlyZXR1cm4gMDsNCiB9DQorRVhQT1JUX1NZTUJPTF9HUEwobXRrX2VpbnRfZG9f
aW5pdCk7DQorDQorTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOw0KK01PRFVMRV9ERVNDUklQVElP
TigiTWVkaWFUZWsgRUlOVCBEcml2ZXIiKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0
ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMNCmluZGV4IGQzMTY5YTg3ZTFiMy4uNmVhNDBiNTAx
MzI4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNv
bW1vbi12Mi5jDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29t
bW9uLXYyLmMNCkBAIC0xMiw2ICsxMiw3IEBADQogI2luY2x1ZGUgPGxpbnV4L2dwaW8vZHJpdmVy
Lmg+DQogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KICNpbmNsdWRlIDxsaW51
eC9pby5oPg0KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCiAjaW5jbHVkZSA8bGludXgvb2Zf
aXJxLmg+DQogDQogI2luY2x1ZGUgIm10ay1laW50LmgiDQpAQCAtMjA0LDYgKzIwNSw3IEBAIGlu
dCBtdGtfaHdfc2V0X3ZhbHVlKHN0cnVjdCBtdGtfcGluY3RybCAqaHcsIGNvbnN0IHN0cnVjdCBt
dGtfcGluX2Rlc2MgKmRlc2MsDQogDQogCXJldHVybiAwOw0KIH0NCitFWFBPUlRfU1lNQk9MX0dQ
TChtdGtfaHdfc2V0X3ZhbHVlKTsNCiANCiBpbnQgbXRrX2h3X2dldF92YWx1ZShzdHJ1Y3QgbXRr
X3BpbmN0cmwgKmh3LCBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjLA0KIAkJICAgICBp
bnQgZmllbGQsIGludCAqdmFsdWUpDQpAQCAtMjIzLDYgKzIyNSw3IEBAIGludCBtdGtfaHdfZ2V0
X3ZhbHVlKHN0cnVjdCBtdGtfcGluY3RybCAqaHcsIGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2Mg
KmRlc2MsDQogDQogCXJldHVybiAwOw0KIH0NCitFWFBPUlRfU1lNQk9MX0dQTChtdGtfaHdfZ2V0
X3ZhbHVlKTsNCiANCiBzdGF0aWMgaW50IG10a194dF9maW5kX2VpbnRfbnVtKHN0cnVjdCBtdGtf
cGluY3RybCAqaHcsIHVuc2lnbmVkIGxvbmcgZWludF9uKQ0KIHsNCkBAIC0zNjEsNiArMzY0LDcg
QEAgaW50IG10a19idWlsZF9laW50KHN0cnVjdCBtdGtfcGluY3RybCAqaHcsIHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQogDQogCXJldHVybiBtdGtfZWludF9kb19pbml0KGh3LT5laW50
KTsNCiB9DQorRVhQT1JUX1NZTUJPTF9HUEwobXRrX2J1aWxkX2VpbnQpOw0KIA0KIC8qIFJldmlz
aW9uIDAgKi8NCiBpbnQgbXRrX3BpbmNvbmZfYmlhc19kaXNhYmxlX3NldChzdHJ1Y3QgbXRrX3Bp
bmN0cmwgKmh3LA0KQEAgLTM4MCw2ICszODQsNyBAQCBpbnQgbXRrX3BpbmNvbmZfYmlhc19kaXNh
YmxlX3NldChzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KIA0KIAlyZXR1cm4gMDsNCiB9DQorRVhQ
T1JUX1NZTUJPTF9HUEwobXRrX3BpbmNvbmZfYmlhc19kaXNhYmxlX3NldCk7DQogDQogaW50IG10
a19waW5jb25mX2JpYXNfZGlzYWJsZV9nZXQoc3RydWN0IG10a19waW5jdHJsICpodywNCiAJCQkJ
IGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKmRlc2MsIGludCAqcmVzKQ0KQEAgLTQwMiw2ICs0
MDcsNyBAQCBpbnQgbXRrX3BpbmNvbmZfYmlhc19kaXNhYmxlX2dldChzdHJ1Y3QgbXRrX3BpbmN0
cmwgKmh3LA0KIA0KIAlyZXR1cm4gMDsNCiB9DQorRVhQT1JUX1NZTUJPTF9HUEwobXRrX3BpbmNv
bmZfYmlhc19kaXNhYmxlX2dldCk7DQogDQogaW50IG10a19waW5jb25mX2JpYXNfc2V0KHN0cnVj
dCBtdGtfcGluY3RybCAqaHcsDQogCQkJIGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKmRlc2Ms
IGJvb2wgcHVsbHVwKQ0KQEAgLTQyMSw2ICs0MjcsNyBAQCBpbnQgbXRrX3BpbmNvbmZfYmlhc19z
ZXQoc3RydWN0IG10a19waW5jdHJsICpodywNCiANCiAJcmV0dXJuIDA7DQogfQ0KK0VYUE9SVF9T
WU1CT0xfR1BMKG10a19waW5jb25mX2JpYXNfc2V0KTsNCiANCiBpbnQgbXRrX3BpbmNvbmZfYmlh
c19nZXQoc3RydWN0IG10a19waW5jdHJsICpodywNCiAJCQkgY29uc3Qgc3RydWN0IG10a19waW5f
ZGVzYyAqZGVzYywgYm9vbCBwdWxsdXAsIGludCAqcmVzKQ0KQEAgLTQ0MCw2ICs0NDcsNyBAQCBp
bnQgbXRrX3BpbmNvbmZfYmlhc19nZXQoc3RydWN0IG10a19waW5jdHJsICpodywNCiANCiAJcmV0
dXJuIDA7DQogfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKG10a19waW5jb25mX2JpYXNfZ2V0KTsNCiAN
CiAvKiBSZXZpc2lvbiAxICovDQogaW50IG10a19waW5jb25mX2JpYXNfZGlzYWJsZV9zZXRfcmV2
MShzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KQEAgLTQ1NCw2ICs0NjIsNyBAQCBpbnQgbXRrX3Bp
bmNvbmZfYmlhc19kaXNhYmxlX3NldF9yZXYxKHN0cnVjdCBtdGtfcGluY3RybCAqaHcsDQogDQog
CXJldHVybiAwOw0KIH0NCitFWFBPUlRfU1lNQk9MX0dQTChtdGtfcGluY29uZl9iaWFzX2Rpc2Fi
bGVfc2V0X3JldjEpOw0KIA0KIGludCBtdGtfcGluY29uZl9iaWFzX2Rpc2FibGVfZ2V0X3JldjEo
c3RydWN0IG10a19waW5jdHJsICpodywNCiAJCQkJICAgICAgY29uc3Qgc3RydWN0IG10a19waW5f
ZGVzYyAqZGVzYywgaW50ICpyZXMpDQpAQCAtNDcxLDYgKzQ4MCw3IEBAIGludCBtdGtfcGluY29u
Zl9iaWFzX2Rpc2FibGVfZ2V0X3JldjEoc3RydWN0IG10a19waW5jdHJsICpodywNCiANCiAJcmV0
dXJuIDA7DQogfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKG10a19waW5jb25mX2JpYXNfZGlzYWJsZV9n
ZXRfcmV2MSk7DQogDQogaW50IG10a19waW5jb25mX2JpYXNfc2V0X3JldjEoc3RydWN0IG10a19w
aW5jdHJsICpodywNCiAJCQkgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjLCBi
b29sIHB1bGx1cCkNCkBAIC00OTAsNiArNTAwLDcgQEAgaW50IG10a19waW5jb25mX2JpYXNfc2V0
X3JldjEoc3RydWN0IG10a19waW5jdHJsICpodywNCiANCiAJcmV0dXJuIDA7DQogfQ0KK0VYUE9S
VF9TWU1CT0xfR1BMKG10a19waW5jb25mX2JpYXNfc2V0X3JldjEpOw0KIA0KIGludCBtdGtfcGlu
Y29uZl9iaWFzX2dldF9yZXYxKHN0cnVjdCBtdGtfcGluY3RybCAqaHcsDQogCQkJICAgICAgY29u
c3Qgc3RydWN0IG10a19waW5fZGVzYyAqZGVzYywgYm9vbCBwdWxsdXAsDQpAQCAtNTE1LDYgKzUy
Niw3IEBAIGludCBtdGtfcGluY29uZl9iaWFzX2dldF9yZXYxKHN0cnVjdCBtdGtfcGluY3RybCAq
aHcsDQogDQogCXJldHVybiAwOw0KIH0NCitFWFBPUlRfU1lNQk9MX0dQTChtdGtfcGluY29uZl9i
aWFzX2dldF9yZXYxKTsNCiANCiAvKiBDb21ibyBmb3IgdGhlIGZvbGxvd2luZyBwdWxsIHJlZ2lz
dGVyIHR5cGU6DQogICogMS4gUFUgKyBQRA0KQEAgLTcxNSw2ICs3MjcsNyBAQCBpbnQgbXRrX3Bp
bmNvbmZfYmlhc19zZXRfY29tYm8oc3RydWN0IG10a19waW5jdHJsICpodywNCiBvdXQ6DQogCXJl
dHVybiBlcnI7DQogfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKG10a19waW5jb25mX2JpYXNfc2V0X2Nv
bWJvKTsNCiANCiBpbnQgbXRrX3BpbmNvbmZfYmlhc19nZXRfY29tYm8oc3RydWN0IG10a19waW5j
dHJsICpodywNCiAJCQkgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjLA0KQEAg
LTczNSw2ICs3NDgsNyBAQCBpbnQgbXRrX3BpbmNvbmZfYmlhc19nZXRfY29tYm8oc3RydWN0IG10
a19waW5jdHJsICpodywNCiBvdXQ6DQogCXJldHVybiBlcnI7DQogfQ0KK0VYUE9SVF9TWU1CT0xf
R1BMKG10a19waW5jb25mX2JpYXNfZ2V0X2NvbWJvKTsNCiANCiAvKiBSZXZpc2lvbiAwICovDQog
aW50IG10a19waW5jb25mX2RyaXZlX3NldChzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KQEAgLTc2
NCw2ICs3NzgsNyBAQCBpbnQgbXRrX3BpbmNvbmZfZHJpdmVfc2V0KHN0cnVjdCBtdGtfcGluY3Ry
bCAqaHcsDQogDQogCXJldHVybiBlcnI7DQogfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKG10a19waW5j
b25mX2RyaXZlX3NldCk7DQogDQogaW50IG10a19waW5jb25mX2RyaXZlX2dldChzdHJ1Y3QgbXRr
X3BpbmN0cmwgKmh3LA0KIAkJCSAgY29uc3Qgc3RydWN0IG10a19waW5fZGVzYyAqZGVzYywgaW50
ICp2YWwpDQpAQCAtNzg4LDYgKzgwMyw3IEBAIGludCBtdGtfcGluY29uZl9kcml2ZV9nZXQoc3Ry
dWN0IG10a19waW5jdHJsICpodywNCiANCiAJcmV0dXJuIDA7DQogfQ0KK0VYUE9SVF9TWU1CT0xf
R1BMKG10a19waW5jb25mX2RyaXZlX2dldCk7DQogDQogLyogUmV2aXNpb24gMSAqLw0KIGludCBt
dGtfcGluY29uZl9kcml2ZV9zZXRfcmV2MShzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KQEAgLTgw
OSw2ICs4MjUsNyBAQCBpbnQgbXRrX3BpbmNvbmZfZHJpdmVfc2V0X3JldjEoc3RydWN0IG10a19w
aW5jdHJsICpodywNCiANCiAJcmV0dXJuIGVycjsNCiB9DQorRVhQT1JUX1NZTUJPTF9HUEwobXRr
X3BpbmNvbmZfZHJpdmVfc2V0X3JldjEpOw0KIA0KIGludCBtdGtfcGluY29uZl9kcml2ZV9nZXRf
cmV2MShzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KIAkJCSAgICAgICBjb25zdCBzdHJ1Y3QgbXRr
X3Bpbl9kZXNjICpkZXNjLCBpbnQgKnZhbCkNCkBAIC04MjYsMTggKzg0MywyMSBAQCBpbnQgbXRr
X3BpbmNvbmZfZHJpdmVfZ2V0X3JldjEoc3RydWN0IG10a19waW5jdHJsICpodywNCiANCiAJcmV0
dXJuIDA7DQogfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKG10a19waW5jb25mX2RyaXZlX2dldF9yZXYx
KTsNCiANCiBpbnQgbXRrX3BpbmNvbmZfZHJpdmVfc2V0X3JhdyhzdHJ1Y3QgbXRrX3BpbmN0cmwg
Kmh3LA0KIAkJCSAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjLCB1MzIgYXJn
KQ0KIHsNCiAJcmV0dXJuIG10a19od19zZXRfdmFsdWUoaHcsIGRlc2MsIFBJTkNUUkxfUElOX1JF
R19EUlYsIGFyZyk7DQogfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKG10a19waW5jb25mX2RyaXZlX3Nl
dF9yYXcpOw0KIA0KIGludCBtdGtfcGluY29uZl9kcml2ZV9nZXRfcmF3KHN0cnVjdCBtdGtfcGlu
Y3RybCAqaHcsDQogCQkJICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKmRlc2MsIGlu
dCAqdmFsKQ0KIHsNCiAJcmV0dXJuIG10a19od19nZXRfdmFsdWUoaHcsIGRlc2MsIFBJTkNUUkxf
UElOX1JFR19EUlYsIHZhbCk7DQogfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKG10a19waW5jb25mX2Ry
aXZlX2dldF9yYXcpOw0KIA0KIGludCBtdGtfcGluY29uZl9hZHZfcHVsbF9zZXQoc3RydWN0IG10
a19waW5jdHJsICpodywNCiAJCQkgICAgIGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKmRlc2Ms
IGJvb2wgcHVsbHVwLA0KQEAgLTg3OCw2ICs4OTgsNyBAQCBpbnQgbXRrX3BpbmNvbmZfYWR2X3B1
bGxfc2V0KHN0cnVjdCBtdGtfcGluY3RybCAqaHcsDQogDQogCXJldHVybiBlcnI7DQogfQ0KK0VY
UE9SVF9TWU1CT0xfR1BMKG10a19waW5jb25mX2Fkdl9wdWxsX3NldCk7DQogDQogaW50IG10a19w
aW5jb25mX2Fkdl9wdWxsX2dldChzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KIAkJCSAgICAgY29u
c3Qgc3RydWN0IG10a19waW5fZGVzYyAqZGVzYywgYm9vbCBwdWxsdXAsDQpAQCAtOTIwLDYgKzk0
MSw3IEBAIGludCBtdGtfcGluY29uZl9hZHZfcHVsbF9nZXQoc3RydWN0IG10a19waW5jdHJsICpo
dywNCiANCiAJcmV0dXJuIDA7DQogfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKG10a19waW5jb25mX2Fk
dl9wdWxsX2dldCk7DQogDQogaW50IG10a19waW5jb25mX2Fkdl9kcml2ZV9zZXQoc3RydWN0IG10
a19waW5jdHJsICpodywNCiAJCQkgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNj
LCB1MzIgYXJnKQ0KQEAgLTk0Niw2ICs5NjgsNyBAQCBpbnQgbXRrX3BpbmNvbmZfYWR2X2RyaXZl
X3NldChzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KIA0KIAlyZXR1cm4gZXJyOw0KIH0NCitFWFBP
UlRfU1lNQk9MX0dQTChtdGtfcGluY29uZl9hZHZfZHJpdmVfc2V0KTsNCiANCiBpbnQgbXRrX3Bp
bmNvbmZfYWR2X2RyaXZlX2dldChzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KIAkJCSAgICAgIGNv
bnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKmRlc2MsIHUzMiAqdmFsKQ0KQEAgLTk2OSwzICs5OTIs
NCBAQCBpbnQgbXRrX3BpbmNvbmZfYWR2X2RyaXZlX2dldChzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3
LA0KIA0KIAlyZXR1cm4gMDsNCiB9DQorRVhQT1JUX1NZTUJPTF9HUEwobXRrX3BpbmNvbmZfYWR2
X2RyaXZlX2dldCk7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0
cmwtcGFyaXMuYyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmMNCmlu
ZGV4IDM4NTNlYzNhMmE4ZS4uZDAwNmNlNGM5MjM4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waW5j
dHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL3BpbmN0cmwtcGFyaXMuYw0KQEAgLTEwLDYgKzEwLDcgQEANCiAgKi8NCiANCiAjaW5jbHVk
ZSA8bGludXgvZ3Bpby9kcml2ZXIuaD4NCisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQogI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvbXQ2NXh4Lmg+DQogI2luY2x1ZGUgInBpbmN0cmwt
cGFyaXMuaCINCiANCkBAIC02MzMsNiArNjM0LDcgQEAgc3NpemVfdCBtdGtfcGN0cmxfc2hvd19v
bmVfcGluKHN0cnVjdCBtdGtfcGluY3RybCAqaHcsDQogDQogCXJldHVybiBsZW47DQogfQ0KK0VY
UE9SVF9TWU1CT0xfR1BMKG10a19wY3RybF9zaG93X29uZV9waW4pOw0KIA0KICNkZWZpbmUgUElO
X0RCR19CVUZfU1ogOTYNCiBzdGF0aWMgdm9pZCBtdGtfcGN0cmxfZGJnX3Nob3coc3RydWN0IHBp
bmN0cmxfZGV2ICpwY3RsZGV2LCBzdHJ1Y3Qgc2VxX2ZpbGUgKnMsDQpAQCAtMTAyMSw2ICsxMDIz
LDcgQEAgaW50IG10a19wYXJpc19waW5jdHJsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYsDQogDQogCXJldHVybiAwOw0KIH0NCitFWFBPUlRfU1lNQk9MX0dQTChtdGtfcGFyaXNf
cGluY3RybF9wcm9iZSk7DQogDQogc3RhdGljIGludCBtdGtfcGFyaXNfcGluY3RybF9zdXNwZW5k
KHN0cnVjdCBkZXZpY2UgKmRldmljZSkNCiB7DQpAQCAtMTA0MCwzICsxMDQzLDYgQEAgY29uc3Qg
c3RydWN0IGRldl9wbV9vcHMgbXRrX3BhcmlzX3BpbmN0cmxfcG1fb3BzID0gew0KIAkuc3VzcGVu
ZF9ub2lycSA9IG10a19wYXJpc19waW5jdHJsX3N1c3BlbmQsDQogCS5yZXN1bWVfbm9pcnEgPSBt
dGtfcGFyaXNfcGluY3RybF9yZXN1bWUsDQogfTsNCisNCitNT0RVTEVfTElDRU5TRSgiR1BMIHYy
Iik7DQorTU9EVUxFX0RFU0NSSVBUSU9OKCJNZWRpYVRlayBQaW5jdHJsIENvbW1vbiBEcml2ZXIg
VjIgUGFyaXMiKTsNCi0tIA0KMi4yNS4xDQo=

