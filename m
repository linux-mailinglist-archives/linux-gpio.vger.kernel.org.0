Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD44260AE5
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 08:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgIHGZV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 02:25:21 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:19814 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728101AbgIHGZU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 02:25:20 -0400
X-UUID: dc72991a30ff45c8a182a8172624e18c-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=JFs/7grVIbwhByvbA9TvSWfC2MnkuM8o1rJWg0q28ws=;
        b=d5DzLbseqJV9BFP2tswkV02l4c3lVyTeMeZKgdDYrHTWJLPv6FCQHUQD5wo1ALfzX2l0mn110PwMCy7l/7xIRQ8AvuEyxXsBxVRD9inI3TXMjm8uqWPPionggTCfso4QdxNSY5j0fmNZ3Qw1Wxi+vmyRadT1fIIc8kUSFSI0Hmw=;
X-UUID: dc72991a30ff45c8a182a8172624e18c-20200908
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1409255693; Tue, 08 Sep 2020 14:25:15 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 14:25:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Sep 2020 14:25:14 +0800
Message-ID: <1599546314.24690.3.camel@mtkswgap22>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Date:   Tue, 8 Sep 2020 14:25:14 +0800
In-Reply-To: <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
         <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgYWxsLA0KDQpHZW50bGUgcGluZyBvbiB0aGlzIHBhdGNoLg0KDQpUaGFua3MNCg0KDQpIYW5r
cyBDaGVuDQoNCg0KT24gVGh1LCAyMDIwLTA3LTMwIGF0IDIxOjMwICswODAwLCBIYW5rcyBDaGVu
IHdyb3RlOg0KPiBBZGQgTVQ2Nzc5IFVBUlQwIGNsb2NrIHN1cHBvcnQuDQo+IA0KPiBGaXhlczog
NzEwNzc0ZTA0ODYxICgiY2xrOiBtZWRpYXRlazogQWRkIE1UNjc3OSBjbG9jayBzdXBwb3J0IikN
Cj4gU2lnbmVkLW9mZi1ieTogV2VuZGVsbCBMaW4gPHdlbmRlbGwubGluQG1lZGlhdGVrLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogSGFua3MgQ2hlbiA8aGFua3MuY2hlbkBtZWRpYXRlay5jb20+DQo+
IFJldmlld2VkLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYyB8IDIgKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2
Nzc5LmMNCj4gaW5kZXggOTc2NmNjY2Y1ODQ0Li42ZTBkM2ExNjY3MjkgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYw0KPiArKysgYi9kcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQ2Nzc5LmMNCj4gQEAgLTkxOSw2ICs5MTksOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG10a19nYXRlIGluZnJhX2Nsa3NbXSA9IHsNCj4gIAkJICAgICJwd21fc2VsIiwgMTkp
LA0KPiAgCUdBVEVfSU5GUkEwKENMS19JTkZSQV9QV00sICJpbmZyYV9wd20iLA0KPiAgCQkgICAg
InB3bV9zZWwiLCAyMSksDQo+ICsJR0FURV9JTkZSQTAoQ0xLX0lORlJBX1VBUlQwLCAiaW5mcmFf
dWFydDAiLA0KPiArCQkgICAgInVhcnRfc2VsIiwgMjIpLA0KPiAgCUdBVEVfSU5GUkEwKENMS19J
TkZSQV9VQVJUMSwgImluZnJhX3VhcnQxIiwNCj4gIAkJICAgICJ1YXJ0X3NlbCIsIDIzKSwNCj4g
IAlHQVRFX0lORlJBMChDTEtfSU5GUkFfVUFSVDIsICJpbmZyYV91YXJ0MiIsDQoNCg==

