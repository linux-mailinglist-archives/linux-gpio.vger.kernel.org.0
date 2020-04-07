Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D086A1A0825
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 09:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgDGHWY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 03:22:24 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:31606 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727635AbgDGHWX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2020 03:22:23 -0400
X-UUID: 2724cb70b45a4fc59a75a60eb1c07008-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LcKOflwcAVgIoKzi1ClTy0WXvLpBoUICseaOM3oRllU=;
        b=KRbxMquyngabsCPIGMTanlXxqnSmUixsb+4xphBX8TaNZSGs/o8nCTx/n6shfAYZbgqYSs5UTtX7AELPatHv9TCcX5LYQeCTNlsvZ4V6c5GQ0jXSuOm8gXv8hK3rSe5BRL6jYB1KF+bUSv6i/8G7gO9S7Z5i6E7LohwOQsgbQU4=;
X-UUID: 2724cb70b45a4fc59a75a60eb1c07008-20200407
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 591171986; Tue, 07 Apr 2020 15:22:19 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 15:22:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 15:22:09 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v6 0/2] pinctr: mediatek: make MediaTek pinctrl-paris and related driver ready for buidling loadable module
Date:   Tue, 7 Apr 2020 15:22:08 +0800
Message-ID: <1586244130-21523-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 439E575EA29836A477196E91C88EBF3671BF192137C8D0A792237965C856E59B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KcGluY3RybDog
bWVkaWF0ZWs6IG1ha2UgTWVkaWFUZWsgcGluY3RybCB2MiBkcml2ZXIgcmVhZHkgZm9yIGJ1aWRs
aW5nIGxvYWRhYmxlIG1vZHVsZQ0KDQpJbiB0aGUgZnV0dXJlIHdlIHdhbnQgdG8gYmUgYWJsZSB0
byBidWlsZCB0aGUgTWVkaWFUZWsgcGluY3RybCBkcml2ZXIsDQpiYXNlZCBvbiBwYXJpcywgYXMg
a2VybmVsIG1vZHVsZS4gVGhpcyBwYXRjaCBhbGxvd3MgcGluY3RybC1wYXJpcy5jLCB0aGUNCmV4
dGVybmFsIGludGVycnVwdCBjb250cm9sbGVyIG10ay1laW50LmMsIGFuZCBwaW5jdHJsLW10ay1j
b21tb24tdjIuYyB0bw0KYmUgbG9hZGFibGUgYXMgbW9kdWxlLg0KDQpUaGUgZm9sbG93aW5nIGlz
IHRoZSByYXRpb25hbGUgZm9yIGRldGVybWluaW5nIHdoZXRoZXIgbXRrLWVpbnQuYywNCnBpbmN0
cmwtbXRrLWNvbW1vbi12Mi5jLCBhbmQgcGluY3RybC1wYXJpcy5jIGFyZSBidWlsdCBhcyBsb2Fk
YWJsZSBtb2R1bGU6DQoNCjEuIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnOg0KMS4x
IFBJTkNUUkxfTVRYWFhYOiBjaGFuZ2UgZnJvbSBib29sIHRvIHRyaXN0YXRlLiBJdCBpcyBzcGVj
aWZpZWQgaW4NCiAgICAgICAgZGVmY29uZmlnIGZpbGUuIE1UWFhYWCBjYW4gb25seSBiZSB0aGUg
dXNlciBvZiBwaW5jdHJsLXBhcmlzLA0KICAgICAgICB3aGljaCBjYW4gTVQ2NzY1IG9yIE1UODE4
My4gVGhlIHBhdGNoIGZvciBjaGFuZ2luZw0KICAgICAgICBQSU5DVFJMX01UNjc2NSBmcm9tIGJv
b2wgdG8gdHJpc3RhdGUgd2lsbCBiZSBnaXZlbiBhcyB0aGUgbmV4dA0KICAgICAgICBwYXRjaCBv
ZiB0aGUgcGF0Y2ggc2VyaWVzLg0KMS4yIFBJTkNUUkxfTVRLX1BBUklTOiBjaGFuZ2UgZnJvbSBi
b29sIHRvIHRyaXN0YXRlIGFuZCBzZWxlY3QNCiAgICAgICAgUElOQ1RSTF9NVEtfVjIuIE5vIG5l
ZWQgdG8gc3BlY2lmeSBpbiBkZWZjb25maWcgZmlsZS4NCiAgICAgICogUElOQ1RSTF9NVEtfUEFS
SVMgd2lsbCBiZSB5IGlmIGFueSBQSU5DVFJMX01UWFhYWCBzZWxlY3RpbmcNCiAgICAgICAgUElO
Q1RSTF9NVEtfUEFSSVMgaXMgeS4NCiAgICAgICogUElOQ1RSTF9NVEtfUEFSSVMgd2lsbCBiZSBu
IGlmIGFsbCBQSU5DVFJMX01UWFhYWCBzZWxlY3RpbmcNCiAgICAgICAgUElOQ1RSTF9NVEtfUEFS
SVMgaXMgbi4NCiAgICAgICogUElOQ1RSTF9NVEtfUEFSSVMgd2lsbCBiZSBtIGlmIHNvbWUgUElO
Q1RSTF9NVFhYWFggc2VsZWN0aW5nDQogICAgICAgIFBJTkNUUkxfTVRLX1BBUklTIGFyZSBtIGFu
ZCBvdGhlciBQSU5DVFJMX01UWFhYWCBzZWxlY3RpbmcNCiAgICAgICAgUElOQ1RSTF9NVEtfUEFS
SVMgYXJlIG4uDQoxLjMgUElOQ1RSTF9NVEtfTU9PUkU6IHNlbGVjdCBFSU5UX01USyBhbmQgUElO
Q1RSTF9NVEtfVjIuIEl0IGlzIG1ha2UNCiAgICAgICAgdG8gYmUgcmVhZHkgZm9yIGJ1aWxkaW5n
IGFzIGxvYWRhYmxlIGtlcm5lbCBtb2R1bGUgYmVjYXVzZSBpdA0KICAgICAgICBpcyBub3QgdXNl
ZCBvbiBBbmRyb2lkIGtlcm5lbC4gICAgICAgIA0KMS40IFBJTkNUUkxfTVRLX1YyOiBhZGQgdGhp
cyB0cmlzdGF0ZSBjb25maWcgd2hpY2ggZGVwZW5kcyBvbg0KICAgICAgICBQSU5DVFJMX01US19Q
QVJJUyBhbmQgUElOQ1RSTF9NVEtfTU9PUkUuIE5vIG5lZWQgdG8gc3BlY2lmeSBpbiANCiAgICAg
ICAgZGVmY29uZmlnIGZpbGUuDQogICAgICAqIFBJTkNUUkxfTVRLX1YyIHdpbGwgYmUgeSBpZiBl
aXRoZXIgUElOQ1RSTF9NVEtfUEFSSVMgb3INCiAgICAgICAgUElOQ1RSTF9NVEtfTU9PUkUgaXMg
eS4NCiAgICAgICogUElOQ1RSTF9NVEtfVjIgd2lsbCBiZSBuIGlmIGJvdGggUElOQ1RSTF9NVEtf
UEFSSVMgYW5kDQogICAgICAgIFBJTkNUUkxfTVRLX01PT1JFIGFyZSBuLg0KICAgICAgKiBQSU5D
VFJMX01US19WMiB3aWxsIGJlIG0gaWYgUElOQ1RSTF9NVEtfUEFSSVMgaXMgbSBhbmQNCiAgICAg
ICAgUElOQ1RSTF9NVEtfTU9PUkUgaXMgbi4NCjEuNSBFSU5UX01USzogY2hhbmdlIGZyb20gYm9v
bCB0byB0cmlzdGF0ZSBhbmQgYWRkIHJ1bGUgZm9yIGRlZmF1bHQuDQogICAgICAgIE5vIG5lZWQg
dG8gc3BlY2lmeSBpbiBkZWZjb25maWcgZmlsZS4NCiAgICAgICogRmlyc3QgcnVsZTogZGV0ZXJt
aW5lIGlmIEVJTlRfTVRLIGlzIHkgb3IgbiBhY2NvcmRpbmcgdG8gDQogICAgICAgIHNlbGVjdGlv
biBvZiBQSU5DVFJMX01USyBvciBQSU5DVFJMX01US19NT1JFLg0KICAgICAgKiBTZWNvbmQgcnVs
ZTogZGV0ZXJtaW5lIGlmIEVJTlRfTVRLIGlzIHksIG0sIG9yIG4gYWNjb3JkaW5nIHRvDQogICAg
ICAgIHNlbGVjdGlvbiBvZiBQSU5DVFJMX01US19QQVJJUy4NCg0KMi4gZHJpdmVycy9waW5jdHJs
L21lZGlhdGVrL01ha2VmaWxlOiBVc2UgUElOQ1RSTF9NVEtfVjIgdG8gZGV0ZXJtaW5lDQogICAg
ICAgIGlmIHBpbmN0cmwtbXRrLWNvbW1vbi12Mi5jIGlzIGJ1aWx0IGFzIGxvYWRhYmxlIG1vZHVs
ZSBvcg0KICAgICAgICBidWlsdC1pbi4NCg0KDQpMaWdodCBIc2llaCAoMik6DQogIHBpbmN0cmw6
IG1lZGlhdGVrOiBtYWtlIE1lZGlhVGVrIHBpbmN0cmwgdjIgZHJpdmVyIHJlYWR5IGZvciBidWlk
bGluZw0KICAgIGxvYWRhYmxlIG1vZHVsZQ0KICBwaW5jdHJsOiBtZWRpYXRlazogbWFrZSBNZWRp
YVRlayBNVDY3NjUgcGluY3RybCByZWFkeSBmb3IgYnVpZGluZw0KICAgIGxvYWRhYmxlIG1vZHVs
ZQ0KDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAgIHwg
MTMgKysrKysrKysrKy0tLQ0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZSAgICAg
ICAgICAgICAgICB8ICA1ICsrKy0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL210ay1laW50
LmMgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L3BpbmN0cmwtbXQ2NzY1LmMgICAgICAgIHwgIDQgKysrKw0KIGRyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysr
Kw0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmMgICAgICAgICB8ICA2
ICsrKysrKw0KIDYgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkNCg0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

