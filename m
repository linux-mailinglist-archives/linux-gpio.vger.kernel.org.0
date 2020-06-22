Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD3C202E58
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 04:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgFVC2G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 22:28:06 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:25670 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726626AbgFVC2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 22:28:06 -0400
X-UUID: 9f6065f1742b47c985880bcf26533c36-20200622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zzNuc1Uc1nCYZcdHyk+L8YDQnaJjnSDH4igvpVz9atQ=;
        b=NWEIKZmMALJ0Rp5GIwI/FtNOPJ0TrlII0YzTchWazZbJMW3sm8azWa1V2pddor28dMJJYDDDYbhFSXG0/iW2AVeFMD8cwfOqlMl1wcERpi4QZ+W98lfU4S7Z44U7wcLywfxmoWVMllG5yZj8zGQcMH92cWSObnBtzB5wpS6J4ac=;
X-UUID: 9f6065f1742b47c985880bcf26533c36-20200622
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 147169559; Mon, 22 Jun 2020 10:28:03 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Jun 2020 10:27:51 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Jun 2020 10:28:00 +0800
Message-ID: <1592792881.10773.23.camel@mtkswgap22>
Subject: Re: [PATCH v6 1/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Sean Wang" <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Date:   Mon, 22 Jun 2020 10:28:01 +0800
In-Reply-To: <20200621211327.GA22512@amd>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
         <1592480018-3340-2-git-send-email-hanks.chen@mediatek.com>
         <20200621211327.GA22512@amd>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DBE1F27689D71509CB2B3F2D88E60B1A7E583695B32579675FE1680C4F379EFB2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gU3VuLCAyMDIwLTA2LTIxIGF0IDIzOjEzICswMjAwLCBQYXZlbCBNYWNoZWsgd3JvdGU6DQo+
IE9uIFRodSAyMDIwLTA2LTE4IDE5OjMzOjMyLCBIYW5rcyBDaGVuIHdyb3RlOg0KPiA+IEZyb206
IEFuZHkgVGVuZyA8YW5keS50ZW5nQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBBZGQgZGV2aWNl
dHJlZSBiaW5kaW5ncyBmb3IgTWVkaWFUZWsgTVQ2Nzc5IHBpbmN0cmwgZHJpdmVyLg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgVGVuZyA8YW5keS50ZW5nQG1lZGlhdGVrLmNvbT4NCj4g
DQo+IA0KPiA+ICsgICAgICAgICAgICAgIFB1bGwgdXAgc2V0aW5ncyBmb3IgMiBwdWxsIHJlc2lz
dG9ycywgUjAgYW5kIFIxLiBVc2VyIGNhbg0KPiA+ICsgICAgICAgICAgICAgIGNvbmZpZ3VyZSB0
aG9zZSBzcGVjaWFsIHBpbnMuIFZhbGlkIGFyZ3VtZW50cyBhcmUgZGVzY3JpYmVkIGFzIGJlbG93
Og0KPiA+ICsgICAgICAgICAgICAgIDA6IChSMSwgUjApID0gKDAsIDApIHdoaWNoIG1lYW5zIFIx
IGRpc2FibGVkIGFuZCBSMCBkaXNhYmxlLg0KPiANCj4gVHlwbyA9PiBkaXNhYmxlZC4NCg0KR290
IGl0LCBJJ2xsIGZpeCB0aGUgdHlwbyBpbiBuZXh0IHZlcnNpb24uDQoNClRoYW5rcyENCj4gCQkJ
CQkJCQkJUGF2ZWwNCj4gDQoNCg==

