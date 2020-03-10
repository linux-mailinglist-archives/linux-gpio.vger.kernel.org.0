Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C4E17F123
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2020 08:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgCJHkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Mar 2020 03:40:01 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:16379 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726414AbgCJHkB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Mar 2020 03:40:01 -0400
X-UUID: 7950064baa6e405cadb70414ba26358b-20200310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NYAYLiqknTa8F+ltVJIHSI4VfwyoRZFMoaTE2/jt4QE=;
        b=Ta1LeOoRKAQcjyBOsiUndEVSIzcXXOyYPEEjMx0E2NlQo4MfbxmBTOYgml3i8ueeWONY4MLlnzLgPA9qyLIsjYMej2t0g0gnOrIlSAfb12VOu4ukyrK9yAzLsz48MliPfYHRYh7LlZrLWvfdgb/yAVxMU2bSCwsMzq1fQie8ccw=;
X-UUID: 7950064baa6e405cadb70414ba26358b-20200310
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 190110147; Tue, 10 Mar 2020 15:39:54 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 15:37:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Mar 2020 15:40:05 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v4 0/2]  pinctrl: make MediaTek pinctrl v2 driver and MT6765 pinctrl driver ready for building loadable module
Date:   Tue, 10 Mar 2020 15:39:44 +0800
Message-ID: <1583825986-8189-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 4F31806DE4A9A9017B0C66F63ACC6A2852320298527D30BE3BF7D8E1FC65B3552000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KSW4gdGhlIGZ1
dHVyZSB3ZSB3YW50IHRvIGJlIGFibGUgdG8gYnVpbGQgdGhlIE1lZGlhVGVrIHBpbmN0cmwgZHJp
dmVyLCBiYXNlZCBvbiBwYXJpcywgYXMga2VybmVsIG1vZHVsZS4gVGhpcyBwYXRjaCBhbGxvd3Mg
cGluY3RybC1wYXJpcy5jLCB0aGUgZXh0ZXJuYWwgaW50ZXJydXB0IGNvbnRyb2xsZXIgbXRrLWVp
bnQuYywgYW5kIHBpbmN0cmwtbXRrLWNvbW1vbi12Mi5jIHRvIGJlIGxvYWRhYmxlIGFzIG1vZHVs
ZS4NCg0KVGhlIGZvbGxvd2luZyBpcyB0aGUgcmF0aW9uYWxlIGZvciBkZXRlcm1pbmluZyB3aGV0
aGVyIG10ay1laW50LmMsIHBpbmN0cmwtbXRrLWNvbW1vbi12Mi5jLCBhbmQgcGluY3RybC1wYXJp
cy5jIGFyZSBidWlsdCBhcyBsb2FkYWJsZSBtb2R1bGU6DQoNCjEuIGRyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9LY29uZmlnOg0KMS4xIFBJTkNUUkxfTVRYWFhYOiBjaGFuZ2UgZnJvbSBib29sIHRv
IHRyaXN0YXRlLiBJdCBpcyBzcGVjaWZpZWQgaW4NCiAgICAgICAgZGVmY29uZmlnIGZpbGUuIE1U
WFhYWCBjYW4gb25seSBiZSB0aGUgdXNlciBvZiBwaW5jdHJsLXBhcmlzLA0KICAgICAgICB3aGlj
aCBjYW4gTVQ2NzY1IG9yIE1UODE4My4gVGhlIHBhdGNoIGZvciBjaGFuZ2luZw0KICAgICAgICBQ
SU5DVFJMX01UNjc2NSBmcm9tIGJvb2wgdG8gdHJpc3RhdGUgd2lsbCBiZSBnaXZlbiBhcyB0aGUg
bmV4dA0KICAgICAgICBwYXRjaCBvZiB0aGUgcGF0Y2ggc2VyaWVzLg0KMS4yIFBJTkNUUkxfTVRL
X1BBUklTOiBjaGFuZ2UgZnJvbSBib29sIHRvIHRyaXN0YXRlIGFuZCBzZWxlY3QNCiAgICAgICAg
UElOQ1RSTF9NVEtfVjIuIE5vIG5lZWQgdG8gc3BlY2lmeSBpbiBkZWZjb25maWcgZmlsZS4NCiAg
ICAgICogUElOQ1RSTF9NVEtfUEFSSVMgd2lsbCBiZSB5IGlmIGFueSBQSU5DVFJMX01UWFhYWCBz
ZWxlY3RpbmcNCiAgICAgICAgUElOQ1RSTF9NVEtfUEFSSVMgaXMgeS4NCiAgICAgICogUElOQ1RS
TF9NVEtfUEFSSVMgd2lsbCBiZSBuIGlmIGFsbCBQSU5DVFJMX01UWFhYWCBzZWxlY3RpbmcNCiAg
ICAgICAgUElOQ1RSTF9NVEtfUEFSSVMgaXMgbi4NCiAgICAgICogUElOQ1RSTF9NVEtfUEFSSVMg
d2lsbCBiZSBtIGlmIHNvbWUgUElOQ1RSTF9NVFhYWFggc2VsZWN0aW5nDQogICAgICAgIFBJTkNU
UkxfTVRLX1BBUklTIGFyZSBtIGFuZCBvdGhlciBQSU5DVFJMX01UWFhYWCBzZWxlY3RpbmcNCiAg
ICAgICAgUElOQ1RSTF9NVEtfUEFSSVMgYXJlIG4uDQoxLjMgUElOQ1RSTF9NVEtfTU9PUkU6IHNl
bGVjdCBFSU5UX01USyBhbmQgUElOQ1RSTF9NVEtfVjIuIEl0IGlzIG1ha2UNCiAgICAgICAgdG8g
YmUgcmVhZHkgZm9yIGJ1aWxkaW5nIGFzIGxvYWRhYmxlIGtlcm5lbCBtb2R1bGUgYmVjYXVzZSBp
dA0KICAgICAgICBpcyBub3QgdXNlZCBvbiBBbmRyb2lkIGtlcm5lbC4gICAgICAgIA0KMS40IFBJ
TkNUUkxfTVRLX1YyOiBhZGQgdGhpcyB0cmlzdGF0ZSBjb25maWcgd2hpY2ggZGVwZW5kcyBvbg0K
ICAgICAgICBQSU5DVFJMX01US19QQVJJUyBhbmQgUElOQ1RSTF9NVEtfTU9PUkUuIE5vIG5lZWQg
dG8gc3BlY2lmeSBpbiANCiAgICAgICAgZGVmY29uZmlnIGZpbGUuDQogICAgICAqIFBJTkNUUkxf
TVRLX1YyIHdpbGwgYmUgeSBpZiBlaXRoZXIgUElOQ1RSTF9NVEtfUEFSSVMgb3INCiAgICAgICAg
UElOQ1RSTF9NVEtfTU9PUkUgaXMgeS4NCiAgICAgICogUElOQ1RSTF9NVEtfVjIgd2lsbCBiZSBu
IGlmIGJvdGggUElOQ1RSTF9NVEtfUEFSSVMgYW5kDQogICAgICAgIFBJTkNUUkxfTVRLX01PT1JF
IGFyZSBuLg0KICAgICAgKiBQSU5DVFJMX01US19WMiB3aWxsIGJlIG0gaWYgUElOQ1RSTF9NVEtf
UEFSSVMgaXMgbSBhbmQNCiAgICAgICAgUElOQ1RSTF9NVEtfTU9PUkUgaXMgbi4NCjEuNSBFSU5U
X01USzogY2hhbmdlIGZyb20gYm9vbCB0byB0cmlzdGF0ZSBhbmQgYWRkIHJ1bGUgZm9yIGRlZmF1
bHQuDQogICAgICAgIE5vIG5lZWQgdG8gc3BlY2lmeSBpbiBkZWZjb25maWcgZmlsZS4NCiAgICAg
ICogRmlyc3QgcnVsZTogZGV0ZXJtaW5lIGlmIEVJTlRfTVRLIGlzIHkgb3IgbiBhY2NvcmRpbmcg
dG8gDQogICAgICAgIHNlbGVjdGlvbiBvZiBQSU5DVFJMX01USyBvciBQSU5DVFJMX01US19NT1JF
Lg0KICAgICAgKiBTZWNvbmQgcnVsZTogZGV0ZXJtaW5lIGlmIEVJTlRfTVRLIGlzIHksIG0sIG9y
IG4gYWNjb3JkaW5nIHRvDQogICAgICAgIHNlbGVjdGlvbiBvZiBQSU5DVFJMX01US19QQVJJUy4N
Cg0KMi4gZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxlOiBVc2UgUElOQ1RSTF9NVEtf
VjIgdG8gZGV0ZXJtaW5lDQogICAgICAgIGlmIHBpbmN0cmwtbXRrLWNvbW1vbi12Mi5jIGlzIGJ1
aWx0IGFzIGxvYWRhYmxlIG1vZHVsZSBvcg0KICAgICAgICBidWlsdC1pbi4NCg0KTGlnaHQgSHNp
ZWggKDIpOg0KICBwaW5jdHJsOiBtYWtlIE1lZGlhVGVrIHBpbmN0cmwgdjIgZHJpdmVyIHJlYWR5
IGZvciBidWlkbGluZyBsb2FkYWJsZQ0KICAgIG1vZHVsZQ0KICBwaW5jdHJsOiBtYWtlIE1lZGlh
VGVrIE1UNjc2NSBwaW5jdHJsIHJlYWR5IGZvciBidWlkbGluZyBsb2FkYWJsZQ0KICAgIG1vZHVs
ZQ0KDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAgIHwg
MTUgKysrKysrKysrKysrLS0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxlICAg
ICAgICAgICAgICAgIHwgIDUgKysrLS0NCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVp
bnQuYyAgICAgICAgICAgICAgfCAgOSArKysrKysrKysNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0
ZWsvcGluY3RybC1tdDY3NjUuYyAgICAgICAgfCAgNCArKysrDQogZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysr
KysrDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYyAgICAgICAgIHwg
IDYgKysrKysrDQogZHJpdmVycy9waW5jdHJsL3BpbmNvbmYtZ2VuZXJpYy5jICAgICAgICAgICAg
ICAgIHwgIDEgKw0KIDcgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkNCg0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

