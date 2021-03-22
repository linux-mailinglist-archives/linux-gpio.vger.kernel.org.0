Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9AE3435D5
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 01:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhCVAEZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Mar 2021 20:04:25 -0400
Received: from regular1.263xmail.com ([211.150.70.203]:60622 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhCVAEM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Mar 2021 20:04:12 -0400
Received: from localhost (unknown [192.168.167.16])
        by regular1.263xmail.com (Postfix) with ESMTP id 3D2DA812;
        Mon, 22 Mar 2021 08:03:28 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from desktop-sg5v5ea (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P13108T139929445181184S1616371407324723_;
        Mon, 22 Mar 2021 08:03:28 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <9b16350b0968b3de58eb05bec091c6a2>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: jay.xu@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Date:   Mon, 22 Mar 2021 08:03:27 +0800
From:   "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
To:     =?utf-8?B?6K645YmR576k?= <jay.xu@rock-chips.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        =?utf-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 1/2] arm64: remove select PINCTRL_ROCKCHIP from ARCH_ROCKCHIP
References: <20210305003907.1692515-1-jay.xu@rock-chips.com>, 
        <20210305003907.1692515-2-jay.xu@rock-chips.com>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.19.158[cn]
Mime-Version: 1.0
Message-ID: <202103220803269179853@rock-chips.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgSGVpa28KCkkgaGF2ZSBzZWVuIFswXSBwYXRjaCBzaW1pbGFyIHRvIHRoaXMgcGF0Y2gsIGJ1
dCBpcyB0aGVyZSBuZWVkIHRvIHJlbW92ZSBzZWxlY3TCoEdQSU9MSUIgYW5kwqBQSU5DVFJMX1JP
Q0tDSElQIGZyb23CoEFSQ0hfUk9DS0NISVAgPwoKWzBdOmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC1yb2NrY2hpcC9wYXRjaC8yMDIxMDMxNjEzNDA1OS4yMzc3MDgx
LTEtZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUvCgpCZXN0IHJlZ2FyZHMKLS0tLS0tLS0tLS0tLS0K
amF5Lnh1QHJvY2stY2hpcHMuY29tCj5QcmVwYXJlIHRvIG1ha2UgcGluY3RybCBkcml2ZXIgb2Yg
cm9ja2NoaXAgdG8gYmUgbW9kdWxlIGFibGUsIHRoaXMgcGF0Y2gKPnJlbW92ZSB0aGUgc2VsZWN0
IG9mIFBJTkNUUkxfUk9DS0NISVAgZnJvbSBBUkNIX1JPQ0tDSElQLgo+Cj5TaWduZWQtb2ZmLWJ5
OiBKaWFucXVuIFh1IDxqYXkueHVAcm9jay1jaGlwcy5jb20+Cj4tLS0KPiBhcmNoL2FybTY0L0tj
b25maWcucGxhdGZvcm1zIHwgMiAtLQo+IGRyaXZlcnMvcGluY3RybC9LY29uZmlnwqDCoMKgwqDC
oCB8IDQgKysrKwo+IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj5kaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3JtcyBiL2FyY2gv
YXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMKPmluZGV4IDZlZWNkZWY1MzhiZC4uMDM3MWNjMDJiNDQ4
IDEwMDY0NAo+LS0tIGEvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3Jtcwo+KysrIGIvYXJjaC9h
cm02NC9LY29uZmlnLnBsYXRmb3Jtcwo+QEAgLTIyNyw5ICsyMjcsNyBAQCBjb25maWcgQVJDSF9S
RU5FU0FTCj4gY29uZmlnIEFSQ0hfUk9DS0NISVAKPiBib29sICJSb2NrY2hpcCBQbGF0Zm9ybXMi
Cj4gc2VsZWN0IEFSQ0hfSEFTX1JFU0VUX0NPTlRST0xMRVIKPi0Jc2VsZWN0IEdQSU9MSUIKPiBz
ZWxlY3QgUElOQ1RSTAo+LQlzZWxlY3QgUElOQ1RSTF9ST0NLQ0hJUAo+IHNlbGVjdCBQTQo+IHNl
bGVjdCBST0NLQ0hJUF9USU1FUgo+IGhlbHAKPmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwv
S2NvbmZpZyBiL2RyaXZlcnMvcGluY3RybC9LY29uZmlnCj5pbmRleCAwM2M2MmUxY2IzOTUuLmJm
ODhhYWM3YmNjNiAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvcGluY3RybC9LY29uZmlnCj4rKysgYi9k
cml2ZXJzL3BpbmN0cmwvS2NvbmZpZwo+QEAgLTIxMCwxMSArMjEwLDE1IEBAIGNvbmZpZyBQSU5D
VFJMX09YTkFTCj4gY29uZmlnIFBJTkNUUkxfUk9DS0NISVAKPiBib29sCj4gZGVwZW5kcyBvbiBP
Rgo+KwlzZWxlY3QgR1BJT0xJQgo+IHNlbGVjdCBQSU5NVVgKPiBzZWxlY3QgR0VORVJJQ19QSU5D
T05GCj4gc2VsZWN0IEdFTkVSSUNfSVJRX0NISVAKPiBzZWxlY3QgTUZEX1NZU0NPTgo+IHNlbGVj
dCBPRl9HUElPCj4rCWRlZmF1bHQgQVJDSF9ST0NLQ0hJUAo+KwloZWxwCj4rwqDCoMKgwqDCoMKg
wqDCoMKgIFRoaXMgc3VwcG9ydCBwaW5jdHJsIGFuZCBncGlvIGRyaXZlciBmb3IgUm9ja2NoaXAg
U29Dcy4KPgo+IGNvbmZpZyBQSU5DVFJMX1NJTkdMRQo+IHRyaXN0YXRlICJPbmUtcmVnaXN0ZXIt
cGVyLXBpbiB0eXBlIGRldmljZSB0cmVlIGJhc2VkIHBpbmN0cmwgZHJpdmVyIgo+LS0KPjIuMjUu
MQo+Cj4KPgo+



