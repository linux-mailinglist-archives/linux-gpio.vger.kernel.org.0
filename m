Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB413676DF
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 03:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhDVBi0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 21:38:26 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:61025 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229536AbhDVBi0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 21:38:26 -0400
X-UUID: ce0917296e1646c48868f921555bebc4-20210422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=MaLMoD+Cx4c9RF+MQbi2VA+TR/HgeiidMjRq17YSzZA=;
        b=kZEVYdDs8Qhv/q5mg4gK8nlswaAJk0caV4eWjDY24sDFmzwyWBhDLVxWn2De1oyoFmPHubHJraG0x44s/F96la2lPNw3dR+CzthLReUIJdMsqq2kQkN3vEUMTnG5xht8jvqSBFXjrPCnbhAMFbELsQ3HaxmiB2NC85zS1D0kf+k=;
X-UUID: ce0917296e1646c48868f921555bebc4-20210422
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 925003886; Thu, 22 Apr 2021 09:37:42 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 09:37:40 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Apr 2021 09:37:39 +0800
Message-ID: <1619055459.27999.0.camel@mhfsdcap03>
Subject: Re: [PATCH v4 0/4] Mediatek pinctrl patch on mt8195
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
        huang eddie <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        "Sean Wang" <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Date:   Thu, 22 Apr 2021 09:37:39 +0800
In-Reply-To: <CACRpkdYtjG3LbcMiHmODggWRecSWGSm34vpEtti9x9SKdV9_BA@mail.gmail.com>
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
         <CACRpkdYtjG3LbcMiHmODggWRecSWGSm34vpEtti9x9SKdV9_BA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 220BC1F69A6A5C846F04675CAF54A160A39F6A0D1C6092D1B2837A258212E0462000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVGh1LCAyMDIxLTA0LTIyIGF0IDAxOjUxICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBUdWUsIEFwciAxMywgMjAyMSBhdCA3OjU3IEFNIFpoaXlvbmcgVGFvIDx6aGl5b25nLnRh
b0BtZWRpYXRlay5jb20+IHdyb3RlOg0KPiANCj4gPiBUaGlzIHNlcmllcyBpbmNsdWRlcyA0IHBh
dGNoZXM6DQo+ID4gMS5hZGQgcGluY3RybCBmaWxlIGFuZCBpbmRpbmcgZG9jdW1lbnQgb24gbXQ4
MTk1Lg0KPiA+IDIuYWRkIHBpbmN0cmwgZHJpdmVyIG9uIE1UODE5NS4NCj4gPiAzLmFkZCBwaW5j
dHJsIGRyaXZlIGZvciBJMkMgcmVsYXRlZCBwaW5zIG9uIE1UODE5NS4NCj4gPiA0LmFkZCBwaW5j
dHJsIHJzZWwgc2V0dGluZyBvbiBNVDgxOTUuDQo+ID4NCj4gPiBDaGFuZ2VzIGluIHBhdGNoIHY0
Og0KPiANCj4gUGF0Y2hlcyAxLCAyICYgMyBhcHBsaWVkIQ0KPiANCj4gTm93IHlvdSBvbmx5IG5l
ZWQgdG8gcmVzZW5kIHBhdGNoIDQuDQo+IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0KDQo9
PT5UaGFua3MgZm9yIHlvdXIgY29tbWVudC4gd2Ugd2lsbCBzZW5kIG9ubHkgcGF0Y2ggNCBpbiBu
ZXh0IHZlcnNpb24uDQoNCg0K

