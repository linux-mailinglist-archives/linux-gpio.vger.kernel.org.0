Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA5B34CF5E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhC2LuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:50:05 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:37458 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230388AbhC2Ltw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 07:49:52 -0400
X-UUID: ddbdf52e650846288a9a09d2c4d7041d-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=700zl6YmFxv75lk34/wx0WtvqnKIf4i7bpRRlFphdnI=;
        b=AHzPNTFUi/evXpq/pyNIGpnxTSTLWtQ62edJtxYxuTpgVIC3HfFTJz+c0rzCpSXSYyfhCyMsDl4f7zJcFdDLfWRC6Ulq5o32nOQW0ZFzO2FeQivLP1IDjwCAyt1bKChKB2UCZOh7Y9j5vQ3nuDEKXegbou/IfgIE8jtce5f3sXY=;
X-UUID: ddbdf52e650846288a9a09d2c4d7041d-20210329
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 200071948; Mon, 29 Mar 2021 19:49:48 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 29 Mar
 2021 19:49:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 19:49:45 +0800
Message-ID: <1617018585.10316.9.camel@mhfsdcap03>
Subject: Re: [PATCH Resend v0 0/6] Mediatek pinctrl patch on mt8195
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        <hui.liu@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>,
        <jg_poxu@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <erin.lo@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        Sj Huang <sj.huang@mediatek.com>,
        devicetree <devicetree@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Date:   Mon, 29 Mar 2021 19:49:45 +0800
In-Reply-To: <CAHp75Vc7x=VoNqQKXOyxhkixR3SivQn3yGkejTkZ8bO0Tv6bDA@mail.gmail.com>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
         <CAHp75Vc7x=VoNqQKXOyxhkixR3SivQn3yGkejTkZ8bO0Tv6bDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AABB6345A8775AA73C4B49EF96DF27E08E9473E30D95DB3D672079749D6477F42000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gTW9uLCAyMDIxLTAzLTI5IGF0IDE0OjM1ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIE1vbiwgTWFyIDI5LCAyMDIxIGF0IDI6MzIgUE0gWmhpeW9uZyBUYW8gPHpoaXlvbmcu
dGFvQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIHNlcmllcyBpbmNsdWRlcyA2
IHBhdGNoZXM6DQo+ID4gMS5hZGQgcGluY3RybCBmaWxlIG9uIG10ODE5NS4NCj4gPiAyLmFkZCBw
aW5jdHJsIGJpbmRpbmcgZG9jdW1lbnQgb24gbXQ4MTk1Lg0KPiA+IDMuYWRkIHBpbmN0cmwgZGV2
aWNlIG5vZGUgb24gbXQ4MTk1Lg0KPiA+IDQuYWRkIHBpbmN0cmwgZHJpdmVyIG9uIE1UODE5NS4N
Cj4gPiA1LmFkZCBwaW5jdHJsIGRyaXZlIGZvciBJMkMgcmVsYXRlZCBwaW5zIG9uIE1UODE5NS4N
Cj4gPiA2LmFkZCBwaW5jdHJsIHJzZWwgc2V0dGluZyBvbiBNVDgxOTUuDQo+IA0KPiBQYXRjaCBz
ZXJpZXMgdy9vIHZlcnNpb24gaXMgZGUgZmFjdG8gdjEuDQo+IERyb3BwaW5nIHRvIHYwIHNlZW1z
IG5vdCByaWdodC4NCj4gWW91IG1pc3NlZCBjaGFuZ2Vsb2cuDQo+IA0KPiBTbywgc2VuZCB2MiBw
cm9wZXJseS4NCj4gDQo+IE1hdGVyaWFsIHRvIHN0dWR5Og0KPiBodHRwczovL3d3dy5rZXJuZWwu
b3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sDQo+IA0K
DQpIaSBBbmR5LA0KDQpUaGVyZSBpcyBub3QgYW55IGNoYW5nZSBiZXR3ZWVuIHYwIGFuZCB2MS4g
c28gd2Ugc2VuZCAiUmVzZW5kIHYwIiBhcyB2Mg0KaW4gdGhpcyB0aW1lLklzIGl0IGFsc28gcHJv
cGVybHk/IGFuZCB3ZSBzZW5kIHRoZSB2ZXJzaW9uIHdoaWNoIGlzIHYzIGluDQpuZXh0IHRpbWUu
IA0KDQpUaGFua3MuDQo=

