Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8120B197B69
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2020 14:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730021AbgC3MA5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Mar 2020 08:00:57 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:25463 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729996AbgC3MA4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Mar 2020 08:00:56 -0400
X-UUID: ad913c9caa8c40668a9b277c134f23ea-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aHZOu1UIhdMUGeaAiOn3YyNfGHs7OeO5XFt+0Uq4sc8=;
        b=us9yw9J8WW4Sv0PHVq/VyFDo4EvKhHGlEKiTGnBO2RLFuTQX8sTKDQVqHHV+Q1UoPOJSrZ7HPGnG6LTvNCKFxdcoKXG5pNgXgvZbC3X1J8b9fYYtx7PabKyzzJObzlCzUBcEndJ8zG5mOIk4tY5aTGUAzp85w2n/PkCPFykcwzI=;
X-UUID: ad913c9caa8c40668a9b277c134f23ea-20200330
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 114862305; Mon, 30 Mar 2020 20:00:51 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 20:00:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Mar 2020 20:00:47 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v5 0/2] pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for buidling loadable module
Date:   Mon, 30 Mar 2020 20:00:46 +0800
Message-ID: <1585569648-14017-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F8C29F2B654CA22D3A890F74A392E3A3A920FDA8CE8213DE8FECC487E85F8B462000:8
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
cyBidWlsdCBhcyBsb2FkYWJsZSBtb2R1bGUgb3INCiAgICAgICAgYnVpbHQtaW4uDQoNCg0KTGln
aHQgSHNpZWggKDIpOg0KICBwaW5jdHJsOiBtZWRpYXRlazogbWFrZSBNZWRpYVRlayBwaW5jdHJs
IHYyIGRyaXZlciByZWFkeSBmb3IgYnVpZGxpbmcNCiAgICBsb2FkYWJsZSBtb2R1bGUNCiAgcGlu
Y3RybDogbWVkaWF0ZWs6IG1ha2UgTWVkaWFUZWsgTVQ2NzY1IHBpbmN0cmwgcmVhZHkgZm9yIGJ1
aWRpbmcNCiAgICBsb2FkYWJsZSBtb2R1bGUNCg0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9L
Y29uZmlnICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKystLS0NCiBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgNSArKystLQ0KIGRyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9tdGstZWludC5jICAgICAgICAgICAgICB8ICA5ICsrKysrKysrKw0K
IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jICAgICAgICB8ICA0ICsr
KysNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMgfCAy
NCArKysrKysrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1wYXJpcy5jICAgICAgICAgfCAgNiArKysrKysNCiA2IGZpbGVzIGNoYW5nZWQsIDU2IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCi0tIA0KMS44LjEuMS5kaXJ0eQ0K

