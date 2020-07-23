Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F8122ADC0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 13:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgGWL3g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 07:29:36 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:37899 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727769AbgGWL3g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 07:29:36 -0400
X-UUID: da6ec72dba7f4142b8da6916a5078a04-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=h6iJ9UF693GrpDdmR7RuLUhXwqBFPofdnXMMN+00wK4=;
        b=cPaLs2PoPr2U6VNyPvRfPCvPyExUKPO2NKDKt5pqZ06nbcQDeJO3nuNHSNyigld7If3UL/E0OyGAKZJOvpVBmXw9q6IPNEi9nTZMQnt70S9Z33/9uwF0YM3B368bIv2DI573jfxZJ73gJJrDhi0w5UBtfoOgvROa8prxjODOL0M=;
X-UUID: da6ec72dba7f4142b8da6916a5078a04-20200723
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1476753335; Thu, 23 Jul 2020 19:29:29 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:29:26 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 19:29:26 +0800
Message-ID: <1595503768.5511.8.camel@mtkswgap22>
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Date:   Thu, 23 Jul 2020 19:29:28 +0800
In-Reply-To: <CACRpkdZNL=mnF0dx63bQPpHVLcAHA=oSEiiHzH8vi3+X58y5Jw@mail.gmail.com>
References: <1594717479-8160-1-git-send-email-hanks.chen@mediatek.com>
         <1594717479-8160-3-git-send-email-hanks.chen@mediatek.com>
         <CACRpkdZNL=mnF0dx63bQPpHVLcAHA=oSEiiHzH8vi3+X58y5Jw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVGh1LCAyMDIwLTA3LTE2IGF0IDE1OjI2ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBUdWUsIEp1bCAxNCwgMjAyMCBhdCAxMTowNCBBTSBIYW5rcyBDaGVuIDxoYW5rcy5jaGVu
QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEZyb206IEFuZHkgVGVuZyA8YW5keS50ZW5n
QG1lZGlhdGVrLmNvbT4NCj4gPg0KPiA+IEFkZCBkZXZpY2V0cmVlIGJpbmRpbmdzIGZvciBNZWRp
YVRlayBNVDY3NzkgcGluY3RybCBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5
IFRlbmcgPGFuZHkudGVuZ0BtZWRpYXRlay5jb20+DQo+ICguLi4pDQo+IA0KPiBQbGVhc2UgbWFr
ZSBhbiBhdHRlbXB0IHRvIHJldXNlIHRoZSBnZW5lcmljIHNjaGVtYXMgaW4NCj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY2ZnLW5vZGUueWFtbA0KPiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5tdXgtbm9kZS55YW1sDQo+
IA0KPiBTZWUgaG93IG90aGVyIGJpbmRpbmdzIHJldXNlIHRoZW0sIGUuZy46DQo+IHFjb20saXBx
NjAxOC1waW5jdHJsLnlhbWwNCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNCkdvdCBp
dCwgSSdsbCBmaXggaXQgaW4gbmV4dCB2ZXJzaW9uDQpodHRwczovL2xrbWwub3JnL2xrbWwvMjAy
MC83LzIzLzM4NQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkNCg0KDQpIYW5rcyBDaGVuDQo=

