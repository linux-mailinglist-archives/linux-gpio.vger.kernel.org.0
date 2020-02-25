Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8E2E16BAD4
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2020 08:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbgBYHi6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Feb 2020 02:38:58 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:19962 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729563AbgBYHi6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Feb 2020 02:38:58 -0500
X-UUID: e1152e0e1cce48338a42ddf2b2eff2f9-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JOPFLx0c64QohXvIceHZUjk7yf6iTiPFaEfvoGNhpc0=;
        b=mL+UYeipL+Rww3LkSnW+is6ZUJ+DpDAvT/XnKeKkpfMAvvpNcIl/Iqi8YdrymYDVZFfoyspOCII1now4TmMv0wFtK4yc28g6sVNB5wV91zsHOANgdNkLRMvMq+fqgzrDstagiX7T2CQCoAeHV3Z7vQUqbnUpc7qZ+EPoihHFiPc=;
X-UUID: e1152e0e1cce48338a42ddf2b2eff2f9-20200225
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 712588057; Tue, 25 Feb 2020 15:38:53 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 15:37:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 15:39:04 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v3 0/2] pinctrl: make MediaTek pinctrl v2 driver and MT6765 pinctrl driver ready for building loadable module
Date:   Tue, 25 Feb 2020 15:38:49 +0800
Message-ID: <1582616331-7702-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
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
ZHVsZS4NCg0KVGhlIGZvbGxvd2luZyBpcyB0aGUgcmF0aW9uYWxlIGZvciBkZXRlcm1pbmluZyB3
aGV0aGVyIG10ay1laW50LmMsDQpwaW5jdHJsLW10ay1jb21tb24tdjIuYywgYW5kIHBpbmN0cmwt
cGFyaXMuYyBhcmUgYnVpbHQgYXMgbG9hZGFibGUgbW9kdWxlOg0KDQoxLiBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvS2NvbmZpZzoNCjEuMSBQSU5DVFJMX01UWFhYWDogY2hhbmdlIGZyb20gYm9v
bCB0byB0cmlzdGF0ZS4gSXQgaXMgc3BlY2lmaWVkIGluDQogICAgICAgIGRlZmNvbmZpZyBmaWxl
LiBNVFhYWFggY2FuIG9ubHkgYmUgdGhlIHVzZXIgb2YgcGluY3RybC1wYXJpcywNCiAgICAgICAg
d2hpY2ggY2FuIE1UNjc2NSBvciBNVDgxODMuIFRoZSBwYXRjaCBmb3IgY2hhbmdpbmcNCiAgICAg
ICAgUElOQ1RSTF9NVDY3NjUgZnJvbSBib29sIHRvIHRyaXN0YXRlIHdpbGwgYmUgZ2l2ZW4gYXMg
dGhlIG5leHQNCiAgICAgICAgcGF0Y2ggb2YgdGhlIHBhdGNoIHNlcmllcy4NCjEuMiBQSU5DVFJM
X01US19QQVJJUzogY2hhbmdlIGZyb20gYm9vbCB0byB0cmlzdGF0ZSBhbmQgc2VsZWN0DQogICAg
ICAgIFBJTkNUUkxfTVRLX1YyLiBObyBuZWVkIHRvIHNwZWNpZnkgaW4gZGVmY29uZmlnIGZpbGUu
DQogICAgICAqIFBJTkNUUkxfTVRLX1BBUklTIHdpbGwgYmUgeSBpZiBhbnkgUElOQ1RSTF9NVFhY
WFggc2VsZWN0aW5nDQogICAgICAgIFBJTkNUUkxfTVRLX1BBUklTIGlzIHkuDQogICAgICAqIFBJ
TkNUUkxfTVRLX1BBUklTIHdpbGwgYmUgbiBpZiBhbGwgUElOQ1RSTF9NVFhYWFggc2VsZWN0aW5n
DQogICAgICAgIFBJTkNUUkxfTVRLX1BBUklTIGlzIG4uDQogICAgICAqIFBJTkNUUkxfTVRLX1BB
UklTIHdpbGwgYmUgbSBpZiBzb21lIFBJTkNUUkxfTVRYWFhYIHNlbGVjdGluZw0KICAgICAgICBQ
SU5DVFJMX01US19QQVJJUyBhcmUgbSBhbmQgb3RoZXIgUElOQ1RSTF9NVFhYWFggc2VsZWN0aW5n
DQogICAgICAgIFBJTkNUUkxfTVRLX1BBUklTIGFyZSBuLg0KMS4zIFBJTkNUUkxfTVRLX01PT1JF
OiBzZWxlY3QgRUlOVF9NVEsgYW5kIFBJTkNUUkxfTVRLX1YyLiBJdCBpcyBtYWtlDQogICAgICAg
IHRvIGJlIHJlYWR5IGZvciBidWlsZGluZyBhcyBsb2FkYWJsZSBrZXJuZWwgbW9kdWxlIGJlY2F1
c2UgaXQNCiAgICAgICAgaXMgbm90IHVzZWQgb24gQW5kcm9pZCBrZXJuZWwuICAgICAgICANCjEu
NCBQSU5DVFJMX01US19WMjogYWRkIHRoaXMgdHJpc3RhdGUgY29uZmlnIHdoaWNoIGRlcGVuZHMg
b24NCiAgICAgICAgUElOQ1RSTF9NVEtfUEFSSVMgYW5kIFBJTkNUUkxfTVRLX01PT1JFLiBObyBu
ZWVkIHRvIHNwZWNpZnkgaW4gDQogICAgICAgIGRlZmNvbmZpZyBmaWxlLg0KICAgICAgKiBQSU5D
VFJMX01US19WMiB3aWxsIGJlIHkgaWYgZWl0aGVyIFBJTkNUUkxfTVRLX1BBUklTIG9yDQogICAg
ICAgIFBJTkNUUkxfTVRLX01PT1JFIGlzIHkuDQogICAgICAqIFBJTkNUUkxfTVRLX1YyIHdpbGwg
YmUgbiBpZiBib3RoIFBJTkNUUkxfTVRLX1BBUklTIGFuZA0KICAgICAgICBQSU5DVFJMX01US19N
T09SRSBhcmUgbi4NCiAgICAgICogUElOQ1RSTF9NVEtfVjIgd2lsbCBiZSBtIGlmIFBJTkNUUkxf
TVRLX1BBUklTIGlzIG0gYW5kDQogICAgICAgIFBJTkNUUkxfTVRLX01PT1JFIGlzIG4uDQoxLjUg
RUlOVF9NVEs6IGNoYW5nZSBmcm9tIGJvb2wgdG8gdHJpc3RhdGUgYW5kIGFkZCBydWxlIGZvciBk
ZWZhdWx0Lg0KICAgICAgICBObyBuZWVkIHRvIHNwZWNpZnkgaW4gZGVmY29uZmlnIGZpbGUuDQog
ICAgICAqIEZpcnN0IHJ1bGU6IGRldGVybWluZSBpZiBFSU5UX01USyBpcyB5IG9yIG4gYWNjb3Jk
aW5nIHRvIA0KICAgICAgICBzZWxlY3Rpb24gb2YgUElOQ1RSTF9NVEsgb3IgUElOQ1RSTF9NVEtf
TU9SRS4NCiAgICAgICogU2Vjb25kIHJ1bGU6IGRldGVybWluZSBpZiBFSU5UX01USyBpcyB5LCBt
LCBvciBuIGFjY29yZGluZyB0bw0KICAgICAgICBzZWxlY3Rpb24gb2YgUElOQ1RSTF9NVEtfUEFS
SVMuDQoNCjIuIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZTogVXNlIFBJTkNUUkxf
TVRLX1YyIHRvIGRldGVybWluZQ0KICAgICAgICBpZiBwaW5jdHJsLW10ay1jb21tb24tdjIuYyBp
cyBidWlsdCBhcyBsb2FkYWJsZSBtb2R1bGUgb3INCiAgICAgICAgYnVpbHQtaW4uDQoNCkxpZ2h0
IEhzaWVoICgyKToNCiAgcGluY3RybDogbWFrZSBNZWRpYVRlayBwaW5jdHJsIHYyIGRyaXZlciBy
ZWFkeSBmb3IgYnVpZGxpbmcgbG9hZGFibGUNCiAgICBtb2R1bGUNCiAgcGluY3RybDogbWFrZSBN
ZWRpYVRlayBNVDY3NjUgcGluY3RybCByZWFkeSBmb3IgYnVpZGxpbmcgbG9hZGFibGUNCiAgICBt
b2R1bGUNCg0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAg
ICB8IDE1ICsrKysrKysrKysrKy0tLQ0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmls
ZSAgICAgICAgICAgICAgICB8ICA1ICsrKy0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL210
ay1laW50LmMgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrDQogZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMgICAgICAgIHwgIDQgKysrKw0KIGRyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuYyB8IDI0ICsrKysrKysrKysrKysrKysr
KysrKysrKw0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmMgICAgICAg
ICB8ICA1ICsrKysrDQogZHJpdmVycy9waW5jdHJsL3BpbmNvbmYtZ2VuZXJpYy5jICAgICAgICAg
ICAgICAgIHwgIDEgKw0KIDcgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkNCg0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

