Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F19C22BD95
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 07:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgGXFjX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 01:39:23 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:13199 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726277AbgGXFjW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 01:39:22 -0400
X-UUID: 66bd73bc038147919ce272d953c64023-20200724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=wBDacOncVh0PojdDGdKS/zftjuMPjd4CIaDYeFLXde0=;
        b=eWpURAT14eo6meR9czwptJ9cwLjrlF/Gx+AbjSeoyNor7s/UCPAt+1AL941wbTKhathGzX+L/LSf3IE8KYiKJOsE0q1Pw+T+fuZZYID6ftCUkcLePuFHqwvqDFaSRUiVEZhSCIW1MYjBhCxjv67W6ZaD+qkp00wIu1gXsTpNQiI=;
X-UUID: 66bd73bc038147919ce272d953c64023-20200724
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 609872489; Fri, 24 Jul 2020 13:39:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jul 2020 13:39:16 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jul 2020 13:39:17 +0800
Message-ID: <1595569156.29906.6.camel@mtkswgap22>
Subject: Re: [PATCH v9 2/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Stephen Boyd <sboyd@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Loda Chou <loda.chou@mediatek.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        "Sean Wang" <sean.wang@kernel.org>, <wsd_upstream@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <devicetree@vger.kernel.org>, mtk01761 <wendell.lin@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 24 Jul 2020 13:39:16 +0800
In-Reply-To: <20200723155159.GB436360@bogus>
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
         <1595503197-15246-3-git-send-email-hanks.chen@mediatek.com>
         <20200723155159.GB436360@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVGh1LCAyMDIwLTA3LTIzIGF0IDA5OjUxIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVGh1LCAyMyBKdWwgMjAyMCAxOToxOTo1MiArMDgwMCwgSGFua3MgQ2hlbiB3cm90ZToNCj4g
PiBGcm9tOiBBbmR5IFRlbmcgPGFuZHkudGVuZ0BtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gQWRk
IGRldmljZXRyZWUgYmluZGluZ3MgZm9yIE1lZGlhVGVrIE1UNjc3OSBwaW5jdHJsIGRyaXZlci4N
Cj4gPiANCj4gPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFRlbmcgPGFuZHkudGVuZ0BtZWRpYXRlay5jb20+DQo+ID4g
U2lnbmVkLW9mZi1ieTogSGFua3MgQ2hlbiA8aGFua3MuY2hlbkBtZWRpYXRlay5jb20+DQo+ID4g
LS0tDQo+ID4gIC4uLi9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJsLnlhbWwgICAgICB8
IDE5NyArKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5NyBpbnNlcnRp
b25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY3NzktcGluY3RybC55YW1sDQo+ID4gDQo+IA0K
PiANCj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2sn
IG9uIHlvdXIgcGF0Y2g6DQo+IA0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3
OS1waW5jdHJsLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJl
ZzowOiBbMCwgMjY4NDU1OTM2LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhl
cnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJsLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0w
OiBwaW5jdHJsQDEwMDA1MDAwOnJlZzoxOiBbMCwgMjk3OTI2NjU2LCAwLCA0MDk2XSBpcyB0b28g
bG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJsLmV4YW1w
bGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzoyOiBbMCwgMjk4OTA5
Njk2LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQt
cmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVr
LG10Njc3OS1waW5jdHJsLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1
MDAwOnJlZzozOiBbMCwgMzAwMDIzODA4LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRz
L3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJsLmV4YW1wbGUuZHQueWFtbDogZXhh
bXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzo0OiBbMCwgMzAwMzUxNDg4LCAwLCA0MDk2XSBp
cyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJs
LmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzo1OiBbMCwg
MzAwNTQ4MDk2LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGlu
dXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21l
ZGlhdGVrLG10Njc3OS1waW5jdHJsLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJs
QDEwMDA1MDAwOnJlZzo2OiBbMCwgMzAxMDcyMzg0LCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiAv
YnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJsLmV4YW1wbGUuZHQueWFt
bDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzo3OiBbMCwgMzAxMTM3OTIwLCAwLCA0
MDk2XSBpcyB0b28gbG9uZw0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1w
aW5jdHJsLmV4YW1wbGUuZHQueWFtbDogZXhhbXBsZS0wOiBwaW5jdHJsQDEwMDA1MDAwOnJlZzo4
OiBbMCwgMjY4NDgwNTEyLCAwLCA0MDk2XSBpcyB0b28gbG9uZw0KPiANCj4gDQo+IFNlZSBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRj
aC8xMzM0NzQzX187ISFDVFJOS0E5d01nMEFSYncheFZxMjFzLVZhdzNJZjEtUThFV0pFREJCSVVw
MGozMFBJYUdRV0R5aENmdGJjT2dGcmpScVpNTkhvSGdPWGtzRDNnJCANCj4gDQo+IElmIHlvdSBh
bHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJv
dmUNCj4gZXJyb3IocyksIHRoZW4gbWFrZSBzdXJlIGR0LXNjaGVtYSBpcyB1cCB0byBkYXRlOg0K
PiANCj4gcGlwMyBpbnN0YWxsIGdpdCtodHRwczovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcv
ZHQtc2NoZW1hLmdpdEBtYXN0ZXIgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hlY2sgYW5kIHJl
LXN1Ym1pdC4NCj4gDQpIaSBSb2IsDQoNCkl0J3MgbXkgZmF1bHQNCkkgY291bGQgcmVwcm9kdWNl
IHRoZSBlcnJvciBsb2cgYWZ0ZXIgZHQtc2NoZW1hIHVwZGF0ZXMgdG8gdGhlIGxhdGVzdA0KdmVy
c2lvbi4NCkknbGwgZml4IGl0IGluIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzIQ0KDQpIYW5rcyBD
aGVuDQoNCg==

