Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0059B367721
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 04:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhDVCL3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 22:11:29 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:38690 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230319AbhDVCL3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 22:11:29 -0400
X-UUID: db0207a1956544dca90c22d29a20a729-20210422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=NWZUJCNxO3pM4ccYtxmcJrgXOTaZ34GcudHZtUurBwQ=;
        b=CldFiwWtGyWbCDmJbKW5uJSibt8Wb7kWsL5lV8bQWynjIXRDReYkbEBySpoNB2aAsS4/8RovKmCKVZZ0/qlIv07M+xE2wrlkpSowcZ7Vc772VNgLmctogf7KYmx2go+5xonTS9vRxzYsnc36s3/Xk/19lPn9NfS9X2Jc3NqXdFA=;
X-UUID: db0207a1956544dca90c22d29a20a729-20210422
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1414987183; Thu, 22 Apr 2021 10:10:49 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 10:10:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Apr 2021 10:10:46 +0800
Message-ID: <1619057446.27999.2.camel@mhfsdcap03>
Subject: Re: [PATCH v4 4/4] pinctrl: add rsel setting on MT8195
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Sean Wang <sean.wang@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Hui Liu =?UTF-8?Q?=28=E5=88=98=E8=BE=89=29?= 
        <Hui.Liu@mediatek.com>,
        Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= 
        <eddie.huang@mediatek.com>,
        Po Xu =?UTF-8?Q?=28=E5=BE=90=E5=9D=A1=29?= 
        <ot_po.xu@mediatek.com>,
        "Biao Huang =?UTF-8?Q?=28=E9=BB=84=E5=BD=AA=29?=" 
        <Biao.Huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <Sean.Wang@mediatek.com>,
        Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?= 
        <seiya.wang@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Date:   Thu, 22 Apr 2021 10:10:46 +0800
In-Reply-To: <CAGp9LzoM=9v5mLxtAN9sQm_2f+66xc7G4YqfUF1Mwvr4K_wz5w@mail.gmail.com>
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
         <20210413055702.27535-5-zhiyong.tao@mediatek.com>
         <CAGp9LzoM=9v5mLxtAN9sQm_2f+66xc7G4YqfUF1Mwvr4K_wz5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D12B029E0DF7614013281B6D52E7723B0881247E94195CE17C8D141C4811031E2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIxLTA0LTIwIGF0IDExOjUwICswODAwLCBTZWFuIFdhbmcgd3JvdGU6DQo+IE9u
IE1vbiwgQXByIDEyLCAyMDIxIGF0IDEwOjU3IFBNIFpoaXlvbmcgVGFvIDx6aGl5b25nLnRhb0Bt
ZWRpYXRlay5jb20+IHdyb3RlOg0KPiANCj4gPHNuaXA+DQo+ID4gQEAgLTE3Niw2ICsxODAsMTIg
QEAgc3RhdGljIGludCBtdGtfcGluY29uZl9nZXQoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2
LA0KPiA+ICAgICAgICAgICAgICAgICBlbHNlDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ZXJyID0gLUVOT1RTVVBQOw0KPiA+ICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAg
IGNhc2UgTVRLX1BJTl9DT05GSUdfUlNFTDoNCj4gPiArICAgICAgICAgICAgICAgaWYgKGh3LT5z
b2MtPnJzZWxfZ2V0KQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IGh3LT5zb2Mt
PnJzZWxfZ2V0KGh3LCBkZXNjLCAmcmV0KTsNCj4gPiArICAgICAgICAgICAgICAgZWxzZQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1FT1BOT1RTVVBQOw0KPiANCj4gSSB0aGlu
ayB0aGF0IHNob3VsZCB3YW50IHRvIGJlIC1FTk9UU1VQUCB0byBhbGlnbiBvdGhlciBvY2N1cnJl
bmNlcy4NCj09PkhpIHNlYW4sDQpDYW4geW91IGdpdmUgbWUgc29tZSBzdWdnZXN0aW9uPyAtRU5P
UEFSQU0gb3IgLUVCQURUWVBFPw0KDQpUaGFua3MuDQo+IA0KPiA+ICsgICAgICAgICAgICAgICBi
cmVhazsNCj4gPiAgICAgICAgIGRlZmF1bHQ6DQo+ID4gICAgICAgICAgICAgICAgIGVyciA9IC1F
Tk9UU1VQUDsNCj4gPiAgICAgICAgIH0NCj4gPiBAQCAtMjk1LDYgKzMwNSwxMiBAQCBzdGF0aWMg
aW50IG10a19waW5jb25mX3NldChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsIHVuc2lnbmVk
IGludCBwaW4sDQo+ID4gICAgICAgICAgICAgICAgIGVsc2UNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICBlcnIgPSAtRU5PVFNVUFA7DQo+ID4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+
ICsgICAgICAgY2FzZSBNVEtfUElOX0NPTkZJR19SU0VMOg0KPiA+ICsgICAgICAgICAgICAgICBp
ZiAoaHctPnNvYy0+cnNlbF9zZXQpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0g
aHctPnNvYy0+cnNlbF9zZXQoaHcsIGRlc2MsIGFyZyk7DQo+ID4gKyAgICAgICAgICAgICAgIGVs
c2UNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSAtRU9QTk9UU1VQUDsNCj4gDQo+
IERpdHRvDQo+IA0KPiA+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICAgIGRlZmF1
bHQ6DQo+ID4gICAgICAgICAgICAgICAgIGVyciA9IC1FTk9UU1VQUDsNCj4gPiAgICAgICAgIH0N
Cj4gPiAtLQ0KPiA+IDIuMTguMA0KPiA+DQoNCg==

