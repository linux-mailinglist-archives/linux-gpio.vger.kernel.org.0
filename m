Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDD73AC410
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 08:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbhFRGqO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 02:46:14 -0400
Received: from regular1.263xmail.com ([211.150.70.198]:44842 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbhFRGqN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 02:46:13 -0400
X-Greylist: delayed 417 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Jun 2021 02:46:13 EDT
Received: from localhost (unknown [192.168.167.69])
        by regular1.263xmail.com (Postfix) with ESMTP id 794BA754;
        Fri, 18 Jun 2021 14:36:54 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from desktop-sg5v5ea (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P30975T140062811473664S1623998207885233_;
        Fri, 18 Jun 2021 14:36:48 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f33ec33d6031fb0924d2aa586d694260>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 6
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Date:   Fri, 18 Jun 2021 14:36:48 +0800
From:   "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
To:     =?utf-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        robh+dt <robh+dt@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH v5 5/7] gpio/rockchip: support next version gpio controller
References: <20210527071239.1424430-1-jay.xu@rock-chips.com>, 
        <20210527071345.1424493-1-jay.xu@rock-chips.com>, 
        <4162826.Y6S9NjorxK@diego>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.19.158[cn]
Mime-Version: 1.0
Message-ID: <202106181436485250639@rock-chips.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgSGVpa28KCi0tLS0tLS0tLS0tLS0tCmpheS54dUByb2NrLWNoaXBzLmNvbQo+QW0gRG9ubmVy
c3RhZywgMjcuIE1haSAyMDIxLCAwOToxMzo0NSBDRVNUIHNjaHJpZWIgSmlhbnF1biBYdToKPj4g
VGhlIG5leHQgdmVyc2lvbiBncGlvIGNvbnRyb2xsZXIgb24gU29DcyBsaWtlIHJrMzU2OCBoYXZl
IG1vcmUgd3JpdGUKPj4gbWFzayBiaXRzIGZvciByZWdpc3RlcnMuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEppYW5xdW4gWHUgPGpheS54dUByb2NrLWNoaXBzLmNvbT4KPgo+PiBAQCAtNTQ5LDE1ICs2
NzcsMzMgQEAgc3RhdGljIGludCByb2NrY2hpcF9nZXRfYmFua19kYXRhKHN0cnVjdCByb2NrY2hp
cF9waW5fYmFuayAqYmFuaykKPj7CoCByZXR1cm4gUFRSX0VSUihiYW5rLT5yZWdfYmFzZSk7Cj4+
wqAKPj7CoCBiYW5rLT5pcnEgPSBpcnFfb2ZfcGFyc2VfYW5kX21hcChiYW5rLT5vZl9ub2RlLCAw
KTsKPj4gLQo+PiAtCWJhbmstPmdwaW9fcmVncyA9ICZncGlvX3JlZ3NfdjE7Cj4+IC0JYmFuay0+
Z3Bpb190eXBlID0gR1BJT19UWVBFX1YxOwo+PiArCWlmICghYmFuay0+aXJxKQo+PiArCXJldHVy
biAtRUlOVkFMOwo+PsKgCj4+wqAgYmFuay0+Y2xrID0gb2ZfY2xrX2dldChiYW5rLT5vZl9ub2Rl
LCAwKTsKPj4gLQlpZiAoIUlTX0VSUihiYW5rLT5jbGspKQo+PiAtCXJldHVybiBjbGtfcHJlcGFy
ZShiYW5rLT5jbGspOwo+PiArCWlmIChJU19FUlIoYmFuay0+Y2xrKSkKPj4gKwlyZXR1cm4gUFRS
X0VSUihiYW5rLT5jbGspOwo+PiArCj4+ICsJY2xrX3ByZXBhcmVfZW5hYmxlKGJhbmstPmNsayk7
Cj4+ICsJaWQgPSByZWFkbChiYW5rLT5yZWdfYmFzZSArIGdwaW9fcmVnc192Mi52ZXJzaW9uX2lk
KTsKPj4gKwo+PiArCS8qIElmIG5vdCBncGlvIHYyLCB0aGF0IGlzIGRlZmF1bHQgdG8gdjEuICov
Cj4+ICsJaWYgKGlkID09IEdQSU9fVFlQRV9WMikgewo+PiArCWJhbmstPmdwaW9fcmVncyA9ICZn
cGlvX3JlZ3NfdjI7Cj4+ICsJYmFuay0+Z3Bpb190eXBlID0gR1BJT19UWVBFX1YyOwo+PiArCWJh
bmstPmRiX2NsayA9IG9mX2Nsa19nZXQoYmFuay0+b2Zfbm9kZSwgMSk7Cj4+ICsJaWYgKElTX0VS
UihiYW5rLT5kYl9jbGspKSB7Cj4+ICsJZGV2X2VycihiYW5rLT5kZXYsICJjYW5ub3QgZmluZCBk
ZWJvdW5jZSBjbGtcbiIpOwo+PiArCWJhbmstPmRiX2NsayA9IE5VTEw7Cj4+ICsJY2xrX2Rpc2Fi
bGUoYmFuay0+Y2xrKTsKPj4gKwlyZXR1cm4gLUVJTlZBTDsKPj4gKwl9Cj4+ICsJfSBlbHNlIHsK
Pj4gKwliYW5rLT5ncGlvX3JlZ3MgPSAmZ3Bpb19yZWdzX3YxOwo+PiArCWJhbmstPmdwaW9fdHlw
ZSA9IEdQSU9fVFlQRV9WMTsKPj4gKwl9Cj4+wqAKPj4gLQliYW5rLT5jbGsgPSBOVUxMOwo+PiAr
CWNsa19kaXNhYmxlKGJhbmstPmNsayk7Cj4KPk5JVDogeW91IGNvdWxkIG1vdmUgdGhlICJhbHdh
eXMgZW5hYmxlIGNsb2NrIGZvciBncGlvIGNvbnRyb2xsZXIiIHBhdGNoCj5iZWZvcmUgYWRkaW5n
IHRoZSB2MiBzdXBwb3J0LiBUaGF0IHdheSB5b3Ugc2F2ZSBvbiBub3QgbmVlZGluZyB0byBhZGQK
PnRoZSBjbG9jayBoYW5kbGluZyBoZXJlLgo+IApWNiBoYXMgcmVvZGVyIHRoZSBwYXRjaGVzLCBJ
IGhhdm4ndCBhZGQgYWNrZWQtYnkgb3IgcmV2aWV3ZWQtYnkgeWV0LCBwbGVhc2UgdGFrZSBhIGxv
b2sgYWdhaW4sIHRoYW5rcwoKPk90aGVyd2lzZSBsb29rcyBuaWNlIHRvIG1lLgo+Cj5BY2tlZC1i
eTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPgo+Cj5IZWlrbwo+Cj4KPj7CoCBy
ZXR1cm4gMDsKPj7CoCB9Cj4+wqAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5j
dHJsLXJvY2tjaGlwLmggYi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1yb2NrY2hpcC5oCj4+IGlu
ZGV4IDFiNzc0YjZiYmMzZS4uNTg5ZDRkMmE5OGM5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3Bp
bmN0cmwvcGluY3RybC1yb2NrY2hpcC5oCj4+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9waW5jdHJs
LXJvY2tjaGlwLmgKPj4gQEAgLTEyMSw2ICsxMjEsNyBAQCBzdHJ1Y3Qgcm9ja2NoaXBfZHJ2IHsK
Pj7CoMKgICogQHJlZ19iYXNlOiByZWdpc3RlciBiYXNlIG9mIHRoZSBncGlvIGJhbmsKPj7CoMKg
ICogQHJlZ21hcF9wdWxsOiBvcHRpb25hbCBzZXBhcmF0ZSByZWdpc3RlciBmb3IgYWRkaXRpb25h
bCBwdWxsIHNldHRpbmdzCj4+wqDCoCAqIEBjbGs6IGNsb2NrIG9mIHRoZSBncGlvIGJhbmsKPj4g
KyAqIEBkYl9jbGs6IGNsb2NrIG9mIHRoZSBncGlvIGRlYm91bmNlCj4+wqDCoCAqIEBpcnE6IGlu
dGVycnVwdCBvZiB0aGUgZ3BpbyBiYW5rCj4+wqDCoCAqIEBzYXZlZF9tYXNrczogU2F2ZWQgY29u
dGVudCBvZiBHUElPX0lOVEVOIGF0IHN1c3BlbmQgdGltZS4KPj7CoMKgICogQHBpbl9iYXNlOiBm
aXJzdCBwaW4gbnVtYmVyCj4+IEBAIC0xNDYsNiArMTQ3LDcgQEAgc3RydWN0IHJvY2tjaGlwX3Bp
bl9iYW5rIHsKPj7CoCB2b2lkIF9faW9tZW0JKnJlZ19iYXNlOwo+PsKgIHN0cnVjdCByZWdtYXAJ
KnJlZ21hcF9wdWxsOwo+PsKgIHN0cnVjdCBjbGsJKmNsazsKPj4gKwlzdHJ1Y3QgY2xrCSpkYl9j
bGs7Cj4+wqAgaW50CWlycTsKPj7CoCB1MzIJc2F2ZWRfbWFza3M7Cj4+wqAgdTMyCXBpbl9iYXNl
Owo+Pgo+Cj4KPgo+Cj4KPgo+



