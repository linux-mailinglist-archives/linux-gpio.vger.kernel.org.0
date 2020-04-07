Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 508681A07D6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 08:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgDGG6A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 02:58:00 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:15619 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726591AbgDGG6A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2020 02:58:00 -0400
X-UUID: 65a262dc56ac42468293d65a1efd5524-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=90ccjNQIm3aIkIokkHZonC7L4E55DM1TNyxvh7zJNG8=;
        b=QCDaE+PMKmfuJTJOZi+tcZCWZ0eU7d9ThVcUUrnEVw2JOV/qCxicEyyXAq8mmiSdPNl9A+3raP0nYdVeI5hwOqrCyOXGe7yVi6Lhp9Hk1BXT0gbd0mIPcR/kOV5Rx242O8PiwW2x1ni4iPoG0BAlDctTmKuJCtZa3odupYXSpGA=;
X-UUID: 65a262dc56ac42468293d65a1efd5524-20200407
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1672264348; Tue, 07 Apr 2020 14:57:55 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 14:57:53 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 14:57:54 +0800
Message-ID: <1586242674.19903.0.camel@mtkswgap22>
Subject: Re: [PATCH v5 1/2] pinctrl: mediatek: make MediaTek pinctrl v2
 driver ready for buidling loadable module
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     Sean Wang <sean.wang@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, <kuohong.wang@mediatek.com>
Date:   Tue, 7 Apr 2020 14:57:54 +0800
In-Reply-To: <CAGp9LzoJ1MiqQhoRnqEgrTP6FycVGJLSQR41FOYK85ic2cgmLA@mail.gmail.com>
References: <1585569648-14017-1-git-send-email-light.hsieh@mediatek.com>
         <1585569648-14017-2-git-send-email-light.hsieh@mediatek.com>
         <CAGp9LzoJ1MiqQhoRnqEgrTP6FycVGJLSQR41FOYK85ic2cgmLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTAzLTMxIGF0IDE0OjE1IC0wNzAwLCBTZWFuIFdhbmcgd3JvdGU6DQo+IEhp
IExpZ2h0LA0KPiA+ICBpbnQgbXRrX3BpbmNvbmZfYmlhc19zZXRfcmV2MShzdHJ1Y3QgbXRrX3Bp
bmN0cmwgKmh3LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBtdGtfcGluX2Rlc2MgKmRlc2MsIGJvb2wgcHVsbHVwKQ0KPiA+IEBAIC00OTIsNiArNTAyLDcg
QEAgaW50IG10a19waW5jb25mX2JpYXNfc2V0X3JldjEoc3RydWN0IG10a19waW5jdHJsICpodywN
Cj4gPg0KPiA+ICAgICAgICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiArRVhQT1JUX1NZTUJPTF9H
UEwobXRrX3BpbmNvbmZfYmlhc19zZXRfcmV2MSk7DQo+ID4NCj4gPiAgaW50IG10a19waW5jb25m
X2JpYXNfZ2V0X3JldjEoc3RydWN0IG10a19waW5jdHJsICpodywNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjLCBib29sIHB1
bGx1cCwNCj4gPiBAQCAtNTE3LDYgKzUyOCw3IEBAIGludCBtdGtfcGluY29uZl9iaWFzX2dldF9y
ZXYxKHN0cnVjdCBtdGtfcGluY3RybCAqaHcsDQo+ID4NCj4gPiAgICAgICAgIHJldHVybiAwOw0K
PiA+ICB9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKG10a19waW5jb25mX2JpYXNfc2V0X3JldjEp
Ow0KPiA+DQo+IA0KPiBJIGdvdCBidWlsZCBlcnJvciB3aXRoIHRoZSBwYXRjaA0KPiANCj4gLi4v
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jOjUyOToxOiBl
cnJvcjoNCj4gcmVkZWZpbml0aW9uIG9mICdfX2tzeW10YWJfbXRrX3BpbmNvbmZfYmlhc19zZXRf
cmV2MScNCj4gLi4vZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12
Mi5jOjUwMzoxOiBub3RlOg0KPiBwcmV2aW91cyBkZWZpbml0aW9uIG9mICdfX2tzeW10YWJfbXRr
X3BpbmNvbmZfYmlhc19zZXRfcmV2MScgd2FzIGhlcmUNCj4gbWFrZVs0XTogKioqIFtkcml2ZXJz
L3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLm9dIEVycm9yIDENCj4gDQoN
Ckkgd2lsbCBjb3JyZWN0IGl0IG9uIHY2Lg0KDQo+ID4gIC8qIENvbWJvIGZvciB0aGUgZm9sbG93
aW5nIHB1bGwgcmVnaXN0ZXIgdHlwZToNCj4gPiAgICogMS4gUFUgKyBQRA0KPiA+IEBAIC03MTcs
NiArNzI5LDcgQEAgaW50IG10a19waW5jb25mX2JpYXNfc2V0X2NvbWJvKHN0cnVjdCBtdGtfcGlu
Y3RybCAqaHcsDQo+ID4gIG91dDoNCj4gPiAgICAgICAgIHJldHVybiBlcnI7DQo+ID4gIH0NCj4g
PiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3BpbmNvbmZfYmlhc19zZXRfY29tYm8pOw0KPiA+DQo+
IDxzbmlwPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1wYXJpcy5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KPiA+
IGluZGV4IDgzYmYyOWMuLjg4MjNjMGMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJs
L21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLXBhcmlzLmMNCj4gPiBAQCAtMTAsNiArMTAsNyBAQA0KPiA+ICAgKi8NCj4g
Pg0KPiA+ICAjaW5jbHVkZSA8bGludXgvZ3Bpby9kcml2ZXIuaD4NCj4gPiArI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPg0KPiA+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9tdDY1eHgu
aD4NCj4gPiAgI2luY2x1ZGUgInBpbmN0cmwtcGFyaXMuaCINCj4gPg0KPiA+IEBAIC02MzMsNiAr
NjM0LDcgQEAgc3NpemVfdCBtdGtfcGN0cmxfc2hvd19vbmVfcGluKHN0cnVjdCBtdGtfcGluY3Ry
bCAqaHcsDQo+ID4NCj4gPiAgICAgICAgIHJldHVybiBsZW47DQo+ID4gIH0NCj4gPiArRVhQT1JU
X1NZTUJPTF9HUEwobXRrX3BjdHJsX3Nob3dfb25lX3Bpbik7DQo+ID4NCj4gPiAgI2RlZmluZSBQ
SU5fREJHX0JVRl9TWiA5Ng0KPiA+ICBzdGF0aWMgdm9pZCBtdGtfcGN0cmxfZGJnX3Nob3coc3Ry
dWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LCBzdHJ1Y3Qgc2VxX2ZpbGUgKnMsDQo+ID4gQEAgLTEw
MzcsMyArMTAzOSw3IEBAIHN0YXRpYyBpbnQgbXRrX3BhcmlzX3BpbmN0cmxfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldmljZSkNCj4gPiAgICAgICAgIC5zdXNwZW5kX25vaXJxID0gbXRrX3Bhcmlz
X3BpbmN0cmxfc3VzcGVuZCwNCj4gPiAgICAgICAgIC5yZXN1bWVfbm9pcnEgPSBtdGtfcGFyaXNf
cGluY3RybF9yZXN1bWUsDQo+ID4gIH07DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKG10a19wYXJp
c19waW5jdHJsX3Byb2JlKTsNCj4gDQo+IHBsYWNlIEVYUE9SVF9TWU1CT0xfR1BMKG10a19wYXJp
c19waW5jdHJsX3Byb2JlKSBleGFjdGx5IGF0IHRoZSB0YWlsDQo+IG9mIG10a19wYXJpc19waW5j
dHJsX3Byb2JlIGRlZmluaXRpb24uDQo+IA0KDQpJIHdpbGwgbW92ZSBpdC4NCg0KPiA+ICsNCj4g
PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOw0KPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oIk1l
ZGlhVGVrIFBpbmN0cmwgQ29tbW9uIERyaXZlciBWMiBQYXJpcyIpOw0KPiA+IC0tDQo+ID4gMS44
LjEuMS5kaXJ0eQ0KDQo=

