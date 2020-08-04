Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D692723B19A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 02:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728698AbgHDAPW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 20:15:22 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:36653 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728329AbgHDAPW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 20:15:22 -0400
X-UUID: ef7542779436431f80815dec5f03a96e-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3spY01kwf4O6wv7cicumcVELIxjbsq4/eTGUCLDHWqw=;
        b=XinFr6mmrVN0Q5O7bKYQJPJO8TT9FPpJ0Gy02/VbSxVKidrAchUt5dSoPu1FGIp+L7KEZPSSwFSH8kw4yV1J9XQruu8OSwk+OVKYSbF0Fwd4Bt7TkG8xAsKoOjeQ5B3zDpSbrwTOov3CwZRHM2VCZGaW8pS84ofNl4KUdS2VAEg=;
X-UUID: ef7542779436431f80815dec5f03a96e-20200804
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 50072949; Tue, 04 Aug 2020 08:15:12 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 Aug
 2020 08:15:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 08:15:05 +0800
Message-ID: <1596500071.20778.0.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: mt8192: add binding
 document
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <seiya.wang@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
        <jg_poxu@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <chuanjia.liu@mediatek.com>,
        <sean.wang@kernel.org>, <srv_heupstream@mediatek.com>,
        <biao.huang@mediatek.com>, <erin.lo@mediatek.com>,
        <mark.rutland@arm.com>, <hongzhou.yang@mediatek.com>,
        <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
        <robh+dt@kernel.org>, <hui.liu@mediatek.com>,
        <eddie.huang@mediatek.com>, <sean.wang@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <sj.huang@mediatek.com>,
        <linus.walleij@linaro.org>
Date:   Tue, 4 Aug 2020 08:14:31 +0800
In-Reply-To: <20200803214054.GA3184946@bogus>
References: <20200801043303.32149-1-zhiyong.tao@mediatek.com>
         <20200801043303.32149-3-zhiyong.tao@mediatek.com>
         <20200803214054.GA3184946@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7534D64DA8CF1C4E84B2CC352E2ADD1F41974CB8CC880301656CE46078BDEF9C2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gTW9uLCAyMDIwLTA4LTAzIGF0IDE1OjQwIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gU2F0LCAwMSBBdWcgMjAyMCAxMjozMzowMiArMDgwMCwgWmhpeW9uZyBUYW8gd3JvdGU6DQo+
ID4gVGhlIGNvbW1pdCBhZGRzIG10ODE5MiBjb21wYXRpYmxlIG5vZGUgaW4gYmluZGluZyBkb2N1
bWVudC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGl5b25nIFRhbyA8emhpeW9uZy50YW9A
bWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvcGluY3RybC9waW5jdHJs
LW10ODE5Mi55YW1sICAgICAgfCAxNzUgKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxNzUgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA3NTUgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbA0K
PiA+IA0KPiANCj4gDQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5k
aW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNoOg0KDQo9PT4gRGVhciBSb2IsDQpJIHdpbGwgZml4IGl0
IGluIHYzLiBUaGFua3MuDQo+IA0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTky
LmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzowOiBbMCwg
MjY4NDU1OTM2LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGlu
dXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3Bp
bmN0cmwtbXQ4MTkyLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAw
OnJlZzoxOiBbMCwgMjk3OTI2NjU2LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRzL3Jv
YmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5j
dHJsQDEwMDA1MDAwOnJlZzoyOiBbMCwgMjk4OTA5Njk2LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0K
PiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLmV4YW1wbGUuZHQueWFtbDogZXhh
bXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzozOiBbMCwgMjk5MDQwNzY4LCAwLCA0MDk2XSBp
cyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLmV4YW1wbGUu
ZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzo0OiBbMCwgMjk5MTA2MzA0
LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2
aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4
MTkyLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzo1OiBb
MCwgMzAwMDIzODA4LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcv
bGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJs
L3BpbmN0cmwtbXQ4MTkyLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1
MDAwOnJlZzo2OiBbMCwgMzAwMzUxNDg4LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRz
L3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBw
aW5jdHJsQDEwMDA1MDAwOnJlZzo3OiBbMCwgMzAwNTQ4MDk2LCAwLCA0MDk2XSBpcyB0b28gbG9u
Zw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLmV4YW1wbGUuZHQueWFtbDog
ZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzo4OiBbMCwgMzAxMDcyMzg0LCAwLCA0MDk2
XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLmV4YW1w
bGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzo5OiBbMCwgMzAxMTM3
OTIwLCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQt
cmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwt
bXQ4MTkyLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzox
MDogWzAsIDI2ODQ4MDUxMiwgMCwgNDA5Nl0gaXMgdG9vIGxvbmcNCj4gDQo+IA0KPiBTZWUgaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMzM5NjYxDQo+IA0KPiBJZiB5b3UgYWxy
ZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3Zl
DQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSBkdC1zY2hlbWEgaXMgdXAgdG8gZGF0ZToNCj4g
DQo+IHBpcDMgaW5zdGFsbCBnaXQraHR0cHM6Ly9naXRodWIuY29tL2RldmljZXRyZWUtb3JnL2R0
LXNjaGVtYS5naXRAbWFzdGVyIC0tdXBncmFkZQ0KPiANCj4gUGxlYXNlIGNoZWNrIGFuZCByZS1z
dWJtaXQuDQo+IA0KDQo=

