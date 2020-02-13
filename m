Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA57815B94F
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 07:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729728AbgBMGIs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 01:08:48 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:9392 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729725AbgBMGIr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2020 01:08:47 -0500
X-UUID: e11c4c405be0487781949f19ef2e15d3-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8VdXVQNyjjqCbi8cPjQQlNmPIH+x+RuRE6RKW8qnHJo=;
        b=RBYtw9fFXlkv+8Cy7BIynXL3WhZ5Ur7BLmdsWh/f49+O8pwoVDVkM1LOMyhMV3+HRk84rFROagndLQKtXpIngnbHD1fbwFT8vU+5dYyOa9MZGgUJCwV7IOe40CnLlDtg2zugP+7hPT5KStfdEsZeQ1/3wuz9gb6byxuE5vtlIqs=;
X-UUID: e11c4c405be0487781949f19ef2e15d3-20200213
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1904281386; Thu, 13 Feb 2020 14:08:31 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 14:06:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 14:07:23 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v1 2/2] pinctrl: Kconfig/Makefile for building MediaTek pinctrl v2 driver as kernel module
Date:   Thu, 13 Feb 2020 14:08:25 +0800
Message-ID: <1581574105-1160-2-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1581574105-1160-1-git-send-email-light.hsieh@mediatek.com>
References: <1581574105-1160-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: C75554F7328D1A3950DBF2EEBDB12F6218876AF31B46EDEF109019BC3043D8132000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KMS4gZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL0tjb25maWc6DQoxLjEgUElOQ1RSTF9NVDY3NjU6IGNoYW5nZSBm
cm9tIGJvb2wgdG8gdHJpc3RhdGUuIEl0IGlzIHNwZWNpZmllZCBpbg0KICAgICAgICBkZWZjb25m
aWcgZmlsZS4NCjEuMiBQSU5DVFJMX01US19QQVJJUzogY2hhbmdlIGZyb20gYm9vbCB0byB0cmlz
dGF0ZSBhbmQgc2VsZWN0DQogICAgICAgIFBJTkNUUkxfTVRLX1YyLiBObyBuZWVkIHRvIHNwZWNp
ZnkgaW4gZGVmY29uZmlnIGZpbGUuDQogICAgICAqIFBJTkNUUkxfTVRLX1BBUklTIHdpbGwgYmUg
eSBpZiBhbnkgUElOQ1RSTF9NVFhYWFggc2VsZWN0aW5nDQogICAgICAgIFBJTkNUUkxfTVRLX1BB
UklTIGlzIHkuDQogICAgICAqIFBJTkNUUkxfTVRLX1BBUklTIHdpbGwgYmUgbiBpZiBhbGwgUElO
Q1RSTF9NVFhYWFggc2VsZWN0aW5nDQogICAgICAgIFBJTkNUUkxfTVRLX1BBUklTIGFyZSBuLg0K
ICAgICAgKiBQSU5DVFJMX01US19QQVJJUyB3aWxsIGJlIG0gaWYgYWxsIFBJTkNUUkxfTVRYWFhY
IHNlbGVjdGluZw0KICAgICAgICBQSU5DVFJMX01US19QQVJJUyBhcmUgbS4NCjEuMyBQSU5DVFJM
X01US19NT09SRTogc2VsZWN0IEVJTlRfTVRLIGFuZCBQSU5DVFJMX01US19WMi4NCjEuNCBQSU5D
VFJMX01US19WMjogYWRkIHRoaXMgdHJpc3RhdGUgY29uZmlnIHdoaWNoIGRlcGVuZHMgb24NCiAg
ICAgICAgUElOQ1RSTF9NVEtfUEFSSVMgYW5kIFBJTkNUUkxfTVRLX01PT1JFLiBObyBuZWVkIHRv
IHNwZWNpZnkgaW4NCiAgICAgICAgZGVmY29uZmlnIGZpbGUuDQogICAgICAqIFBJTkNUUkxfTVRL
X1YyIHdpbGwgYmUgeSBpZiBlaXRoZXIgUElOQ1RSTF9NVEtfUEFSSVMgb3INCiAgICAgICAgUElO
Q1RSTF9NVEtfTU9PUkUgaXMgeS4NCiAgICAgICogUElOQ1RSTF9NVEtfVjIgd2lsbCBiZSBuIGlm
IGJvdGggUElOQ1RSTF9NVEtfUEFSSVMgYW5kDQogICAgICAgIFBJTkNUUkxfTVRLX01PT1JFIGFy
ZSBuLg0KICAgICAgKiBQSU5DVFJMX01US19WMiB3aWxsIGJlIG0gaWYgYm90aCBQSU5DVFJMX01U
S19QQVJJUyBpcyBtIGFuZA0KICAgICAgICBQSU5DVFJMX01US19NT09SRSBpcyBuLg0KMS41IEVJ
TlRfTVRLOiBjaGFuZ2UgZnJvbSBib29sIHRvIHRyaXN0YXRlIGFuZCBhZGQgcnVsZSBmb3IgZGVm
YXVsdC4NCiAgICAgICAgTm8gbmVlZCB0byBzcGVjaWZ5IGluIGRlZmNvbmZpZyBmaWxlLg0KICAg
ICAgKiBGaXJzdCBydWxlOiBkZXRlcm1pbmUgaWYgRUlOVF9NVEsgaXMgeSBvciBuIGFjY29yZGlu
ZyB0bw0KICAgICAgICBzZWxlY3Rpb24gb2YgUElOQ1RSTF9NVEsgb3IgUElOQ1RSTF9NVEtfTU9S
RS4NCiAgICAgICogU2Vjb25kIHJ1bGU6IGRldGVybWluZSBpZiBFSU5UX01USyBpcyB5LCBtLCBv
ciBuIGFjY29yZGluZyB0bw0KICAgICAgICBzZWxlY3Rpb24gb2YgUElOQ1RSTF9NVEtfUEFSSVMu
DQoNCjIuIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZTogVXNlIFBJTkNUUkxfTVRL
X1YyIHRvIGRldGVybWluZQ0KICAgICAgICBpZiBwaW5jdHJsLW10ay1jb21tb24tdjIuYyBpcyBi
dWlsdCBhcyBrZXJuZWwgbW9kdWxlIG9yDQogICAgICAgIGJ1aWx0LWluLg0KDQpTaWduZWQtb2Zm
LWJ5OiBMaWdodCBIc2llaCA8bGlnaHQuaHNpZWhAbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcgIHwgMTcgKysrKysrKysrKysrKy0tLS0NCiBkcml2
ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFrZWZpbGUgfCAgNSArKystLQ0KIDIgZmlsZXMgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tj
b25maWcNCmluZGV4IDcwMWY5YWYuLmQ0OGMzMTMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvS2NvbmZpZw0KKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25m
aWcNCkBAIC0zLDEwICszLDEyIEBAIG1lbnUgIk1lZGlhVGVrIHBpbmN0cmwgZHJpdmVycyINCiAJ
ZGVwZW5kcyBvbiBBUkNIX01FRElBVEVLIHx8IENPTVBJTEVfVEVTVA0KIA0KIGNvbmZpZyBFSU5U
X01USw0KLQlib29sICJNZWRpYVRlayBFeHRlcm5hbCBJbnRlcnJ1cHQgU3VwcG9ydCINCisJdHJp
c3RhdGUgIk1lZGlhVGVrIEV4dGVybmFsIEludGVycnVwdCBTdXBwb3J0Ig0KIAlkZXBlbmRzIG9u
IFBJTkNUUkxfTVRLIHx8IFBJTkNUUkxfTVRLX01PT1JFIHx8IFBJTkNUUkxfTVRLX1BBUklTIHx8
IENPTVBJTEVfVEVTVA0KIAlzZWxlY3QgR1BJT0xJQg0KIAlzZWxlY3QgSVJRX0RPTUFJTg0KKwlk
ZWZhdWx0IHkgaWYgUElOQ1RSTF9NVEsgfHwgUElOQ1RSTF9NVEtfTU9PUkUNCisJZGVmYXVsdCBQ
SU5DVFJMX01US19QQVJJUw0KIA0KIGNvbmZpZyBQSU5DVFJMX01USw0KIAlib29sDQpAQCAtMTcs
MjMgKzE5LDMwIEBAIGNvbmZpZyBQSU5DVFJMX01USw0KIAlzZWxlY3QgRUlOVF9NVEsNCiAJc2Vs
ZWN0IE9GX0dQSU8NCiANCitjb25maWcgUElOQ1RSTF9NVEtfVjINCisJdHJpc3RhdGUNCisJZGVw
ZW5kcyBvbiBQSU5DVFJMX01US19NT09SRSB8fCBQSU5DVFJMX01US19QQVJJUw0KKw0KIGNvbmZp
ZyBQSU5DVFJMX01US19NT09SRQ0KLQlib29sDQorCXRyaXN0YXRlDQogCWRlcGVuZHMgb24gT0YN
CiAJc2VsZWN0IEdFTkVSSUNfUElOQ09ORg0KIAlzZWxlY3QgR0VORVJJQ19QSU5DVFJMX0dST1VQ
Uw0KIAlzZWxlY3QgR0VORVJJQ19QSU5NVVhfRlVOQ1RJT05TDQorCXNlbGVjdCBFSU5UX01USw0K
IAlzZWxlY3QgR1BJT0xJQg0KIAlzZWxlY3QgT0ZfR1BJTw0KKwlzZWxlY3QgUElOQ1RSTF9NVEtf
VjINCiANCiBjb25maWcgUElOQ1RSTF9NVEtfUEFSSVMNCi0JYm9vbA0KKwl0cmlzdGF0ZQ0KIAlk
ZXBlbmRzIG9uIE9GDQogCXNlbGVjdCBQSU5NVVgNCiAJc2VsZWN0IEdFTkVSSUNfUElOQ09ORg0K
IAlzZWxlY3QgR1BJT0xJQg0KIAlzZWxlY3QgRUlOVF9NVEsNCiAJc2VsZWN0IE9GX0dQSU8NCisJ
c2VsZWN0IFBJTkNUUkxfTVRLX1YyDQogDQogIyBGb3IgQVJNdjcgU29Dcw0KIGNvbmZpZyBQSU5D
VFJMX01UMjcwMQ0KQEAgLTgwLDcgKzg5LDcgQEAgY29uZmlnIFBJTkNUUkxfTVQyNzEyDQogCXNl
bGVjdCBQSU5DVFJMX01USw0KIA0KIGNvbmZpZyBQSU5DVFJMX01UNjc2NQ0KLQlib29sICJNZWRp
YXRlayBNVDY3NjUgcGluIGNvbnRyb2wiDQorCXRyaXN0YXRlICJNZWRpYXRlayBNVDY3NjUgcGlu
IGNvbnRyb2wiDQogCWRlcGVuZHMgb24gT0YNCiAJZGVwZW5kcyBvbiBBUk02NCB8fCBDT01QSUxF
X1RFU1QNCiAJZGVmYXVsdCBBUk02NCAmJiBBUkNIX01FRElBVEVLDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxlIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L01ha2VmaWxlDQppbmRleCBhNzQzMjVhLi40YjcxMzI4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL01ha2VmaWxlDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
TWFrZWZpbGUNCkBAIC0yLDggKzIsOSBAQA0KICMgQ29yZQ0KIG9iai0kKENPTkZJR19FSU5UX01U
SykJCSs9IG10ay1laW50Lm8NCiBvYmotJChDT05GSUdfUElOQ1RSTF9NVEspCSs9IHBpbmN0cmwt
bXRrLWNvbW1vbi5vDQotb2JqLSQoQ09ORklHX1BJTkNUUkxfTVRLX01PT1JFKSArPSBwaW5jdHJs
LW1vb3JlLm8gcGluY3RybC1tdGstY29tbW9uLXYyLm8NCi1vYmotJChDT05GSUdfUElOQ1RSTF9N
VEtfUEFSSVMpICs9IHBpbmN0cmwtcGFyaXMubyBwaW5jdHJsLW10ay1jb21tb24tdjIubw0KK29i
ai0kKENPTkZJR19QSU5DVFJMX01US19WMikJKz0gcGluY3RybC1tdGstY29tbW9uLXYyLm8NCitv
YmotJChDT05GSUdfUElOQ1RSTF9NVEtfTU9PUkUpICs9IHBpbmN0cmwtbW9vcmUubw0KK29iai0k
KENPTkZJR19QSU5DVFJMX01US19QQVJJUykgKz0gcGluY3RybC1wYXJpcy5vDQogDQogIyBTb0Mg
RHJpdmVycw0KIG9iai0kKENPTkZJR19QSU5DVFJMX01UMjcwMSkJKz0gcGluY3RybC1tdDI3MDEu
bw0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

