Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E753B911D
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 13:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236220AbhGAL3c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 07:29:32 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:64787 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236040AbhGAL33 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jul 2021 07:29:29 -0400
X-UUID: 46a145fab4cd478f97e1fd72f3b812ae-20210701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=O7mnMgacfM+PDoX+KrXWapm3R0wi39txk8DWCXpl9Ug=;
        b=N4LsFibUzIlRdkb+LFMyWrUKAVy4VKtoaLFYT+sTIcsUujH1T5GRNwGNZWNWiSygUCpefWVsGi+0fwfIoxJ2XXfxUJm+xFYcroJRQwfLdTEgX1D5FfP3a4H0WfDFGnl06FmRYi3t0zCvmW06A3Xu0T0YYsmAZiQD4gw41/crydE=;
X-UUID: 46a145fab4cd478f97e1fd72f3b812ae-20210701
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1162139555; Thu, 01 Jul 2021 19:26:46 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 19:26:41 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 19:26:40 +0800
Message-ID: <1625138800.17751.2.camel@mhfsdcap03>
Subject: Re: [PATCH v2] pinctrl: mediatek: Fix fallback behavior for
 bias_set_combo
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>
CC:     <hui.liu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Date:   Thu, 1 Jul 2021 19:26:40 +0800
In-Reply-To: <CAGXv+5Ecbttkw1AAG5KofoR1oDW-ot68BL1OR=Jpiii8v8DTyw@mail.gmail.com>
References: <20210701080955.2660294-1-hsinyi@chromium.org>
         <CAGXv+5Ecbttkw1AAG5KofoR1oDW-ot68BL1OR=Jpiii8v8DTyw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 94021A8371E21F668833002CF2AEE8052927E0CD0813736C787753A19F2D86B22000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVGh1LCAyMDIxLTA3LTAxIGF0IDE2OjQxICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IE9uIFRodSwgSnVsIDEsIDIwMjEgYXQgNDoxMCBQTSBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJv
bWl1bS5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gU29tZSBwaW4gZG9lc24ndCBzdXBwb3J0IFBVUEQg
cmVnaXN0ZXIsIGlmIGl0IGZhaWxzIGFuZCBmYWxsYmFja3Mgd2l0aA0KPiA+IGJpYXNfc2V0X2Nv
bWJvIGNhc2UsIGl0IHdpbGwgY2FsbCBtdGtfcGluY29uZl9iaWFzX3NldF9wdXBkX3IxX3IwKCkg
dG8NCj4gPiBtb2RpZnkgdGhlIFBVUEQgcGluIGFnYWluLg0KPiA+DQo+ID4gU2luY2UgdGhlIGdl
bmVyYWwgYmlhcyBzZXQgYXJlIGVpdGhlciBQVS9QRCBvciBQVUxMU0VML1BVTExFTiwgdHJ5DQo+
ID4gYmlhc19zZXQgb3IgYmlhc19zZXRfcmV2MSBmb3IgdGhlIG90aGVyIGZhbGxiYWNrIGNhc2Uu
IElmIHRoZSBwaW4NCj4gPiBkb2Vzbid0IHN1cHBvcnQgbmVpdGhlciBQVS9QRCBub3IgUFVMTFNF
TC9QVUxMRU4sIGl0IHdpbGwgcmV0dXJuDQo+ID4gLUVOT1RTVVBQLg0KPiA+DQo+ID4gRml4ZXM6
IDgxYmQxNTc5YjQzZSAoInBpbmN0cmw6IG1lZGlhdGVrOiBGaXggZmFsbGJhY2sgY2FsbCBwYXRo
IikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+
DQo+IA0KPiBSZXZpZXdlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+DQpS
ZXZpZXdlZC1ieTogWmhpeW9uZyBUYW8gPHpoaXlvbmcudGFvQG1lZGlhdGVrLmNvbT4NCg0K

