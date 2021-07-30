Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52373DB322
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 08:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237048AbhG3GBY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 02:01:24 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:59332 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229999AbhG3GBY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 02:01:24 -0400
X-UUID: 133bdf798d1d4bdea61193d3e62c6a14-20210730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qN+SSS+RDr3jspXwlX0b2sqOdjALlK8YN/RxXhX+HtU=;
        b=F5tJrVikPsZsZt+aDmcnRYAKw2SUgurm3iZQ/Ieh0koIjw7ItGOeRbvggTjlu3ldloprb/G0RDMBzZYbCyQaE9B9fHhprZXGT5f/TETvr5aiCxa2dXJyHaQOR6lEiE1aclzzAn6d38siifOGDhX/9wJb4gSnpOFigtdV6cT7bb0=;
X-UUID: 133bdf798d1d4bdea61193d3e62c6a14-20210730
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2073826091; Fri, 30 Jul 2021 14:01:16 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 14:01:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 14:01:14 +0800
Message-ID: <083a0e8fdd07c0f940285dce2dc26cb0f5e798a6.camel@mediatek.com>
Subject: Re: [PATCH 01/12] dt-bindings: clock: mediatek: document clk
 bindings for mediatek mt7986 SoC
From:   Sam Shih <sam.shih@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>
CC:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        "Seiya Wang" <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>
Date:   Fri, 30 Jul 2021 14:01:14 +0800
In-Reply-To: <CAGXv+5GeEBAkXKfA=S7XGOLYtCRihP5ov6kSiw+eevPAi74GAQ@mail.gmail.com>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
         <20210726071439.14248-2-sam.shih@mediatek.com>
         <CAGXv+5GeEBAkXKfA=S7XGOLYtCRihP5ov6kSiw+eevPAi74GAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksDQoNCk9uIE1vbiwgMjAyMS0wNy0yNiBhdCAxNzoyMCArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdy
b3RlOg0KPiBGdXJ0aGVybW9yZSwgYmFzZWQgb24gdGhlIGRyaXZlciBwYXRjaCBhbmQgdGhlIGZh
Y3QgdGhhdCB0aGV5IHNoYXJlDQo+IHRoZQ0KPiBzYW1lIGNvbXBhdGlibGUgc3RyaW5nLCBpdCBz
ZWVtcyB5b3Ugc2hvdWxkbid0IG5lZWQgdG8gaGF2ZSB0d28NCj4gY29tcGF0aWJsZQ0KPiBzdHJp
bmdzIGZvciB0d28gaWRlbnRpY2FsIGhhcmR3YXJlIGJsb2Nrcy4gVGhlIG5lZWQgZm9yIHNlcGFy
YXRlDQo+IGVudHJpZXMNCj4gdG8gaGF2ZSBkaWZmZXJlbnQgY2xvY2sgbmFtZXMgaXMgYW4gaW1w
bGVtZW50YXRpb24gZGV0YWlsLiBQbGVhc2UNCj4gY29uc2lkZXINCj4gdXNpbmcgYW5kIHN1cHBv
cnRpbmcgY2xvY2stb3V0cHV0LW5hbWVzLg0KPiANCj4gQWxzbywgcGxlYXNlIGNoZWNrIG91dCB0
aGUgTVQ4MTk1IGNsb2NrIGRyaXZlciBzZXJpZXMgWzFdLiBJJ20NCj4gZ3Vlc3NpbmcNCj4gYSBs
b3Qgb2YgdGhlIGNvbW1lbnRzIGFwcGx5IHRvIHRoaXMgb25lIGFzIHdlbGwuDQo+IA0KPiBSZWdh
cmRzDQo+IENoZW5ZdQ0KPiANCj4gWzFdIA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMjAyMTA2MTYyMjQ3NDMuNTEw
OS0xLWNodW4tamllLmNoZW5AbWVkaWF0ZWsuY29tL1QvKnRfXztJdyEhQ1RSTktBOXdNZzBBUmJ3
ITI5cGI0VEppR0hMdkxiWUpnREIyRGhmOE1wdzVWVTh6Vi1XM05yTWFuX1JQUXJ0V1QyRWRSVHl5
aldwdTBuWkUkDQo+ICANCj4gDQoNCkkgaGF2ZSBvcmdhbml6ZWQgeW91ciBjb21tZW50cyBpbiAi
TWVkaWF0ZWsgTVQ4MTk1IGNsb2NrIHN1cHBvcnQiDQpzZXJpZXMgaW50byB0aGUgZm9sbG93aW5n
IGxpc3QsIHJlcGx5IHRvIHlvdXIgaGVyZToNCg0KPiBkdC1iaW5kaW5nOiBNb3ZlIHRoZSBub3Qt
dG8tYmUtZXhwb3NlZCBjbG9jayB0byBkcml2ZXIgZGlyZWN0b3J5IG9yDQo+IHNpbXBseSBsZWZ0
IG91dA0KT2theSwgdGhhbmtzIGZvciB5b3VyIGNvbW1lbnQsIEkgd2lsbCB1cGRhdGUgdGhpcyBp
biB0aGUgbmV4dCBwYXRjaCBzZXQNCg0KPiBkZXNjcmliZSBzb21lIG9mIHRoZSBjbG9jayByZWxh
dGlvbnMgYmV0d2VlbiB0aGUgdmFyaW91cyBjbG9jaw0KPiBjb250cm9sbGVycw0KSSBoYXZlIGNo
ZWNrZWQgdGhlIGZpbGVzIGluDQoiRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9tZWRpYXRlayIsIEl0IHNlZW1zIHRoYXQgYWxsDQpNZWRpYVRlayBTb0MgY2xvY2tzIGFyZSBz
aW1wbHkgZGVzY3JpYmVkIGJ5IGVhY2ggY29udHJvbGxlciwgbGlrZQ0KIm1lZGlhdGVrLGluZnJh
Y2ZnLnR4dCIgYW5kICJtZWRpYXRlayx0b3Bja2dlbi50eHQiLCBhbmQgdGhvc2UgZG9jdW1lbnQN
Cm9ubHkgaW5jbHVkZSBjb21wYXRpYmxlIHN0cmluZ3MgaW5mb3JtYXRpb24gYW5kIGV4YW1wbGVz
Lg0KQ2FuIHdlIGluc2VydCB0aGUgY2xvY2sgcmVsYXRpb25zaGlwIG9mIE1UNzk4NiBkaXJlY3Rs
bHkgaW4gY29tbW9uDQpkb2N1bWVudHM/DQpPciB3ZSBzaG91bGQgYWRkIGEgbmV3ICJtZWRpYXRl
ayxtdDc5ODYtY2xvY2sueWFtbCIgYW5kIG1vdmUgY29tcGF0aWJsZQ0Kc3RyaW5ncyBpbmZvcm1h
dGlvbiBhbmQgZXhhbXBsZSB0byB0aGlzIGZpbGUsIGFuZCBpbnNlcnQgY2xvY2sNCnJlbGF0aW9u
c2hpcCBkZXNjcmlwdGlvbnMgdG8gdGhpcyBmaWxlPyBXb3VsZG7igJl0IGl0IGJlIHN0cmFuZ2Ug
dG8gc2tpcA0KZXhpc3RpbmcgZmlsZXMgYW5kIGNyZWF0ZSBhIG5ldyBvbmU/DQoNCj4gZXh0ZXJu
YWwgb3NjaWxsYXRvcidzIGNhc2UsIHRoZSBvc2NpbGxhdG9yIGlzIGRlc2NyaWJlZCBpbiB0aGUg
ZGV2aWNlDQo+IHRyZWUNClllcywgd2UgaGF2ZSAiY2xreHRhbCIgaW4gdGhlIERULCB3aGljaCBz
dGFuZHMgZm9yIGV4dGVybmFsIG9zY2lsbGF0b3IsDQpBbGwgY2xvY2tzIGluIGFwbWl4ZWRzeXMg
dXNlICJjbGt4dGFsIiBhcyB0aGUgcGFyZW50IGNsb2NrDQoNCj4gRHVhbCBsaWNlbnNlIHBsZWFz
ZSAoYW5kIHRoZSBkdHMgZmlsZXMpLg0KT2theSwgdGhhbmtzIGZvciB5b3VyIGNvbW1lbnQsIEkg
d2lsbCB1cGRhdGUgdGhpcyBpbiB0aGUgbmV4dCBwYXRjaCBzZXQNCg0KPiBXaHkgYXJlIHRoaXMg
YW5kIG90aGVyIDE6MSBmYWN0b3IgY2xrcyBuZWVkZWQ/IFRoZXkgbG9vayBsaWtlDQo+IHBsYWNl
aG9sZGVycy4gUGxlYXNlIHJlbW92ZSB0aGVtLg0KT2theSwgdGhhbmtzIGZvciB5b3VyIGNvbW1l
bnQsIEkgd2lsbCB1cGRhdGUgdGhpcyBpbiB0aGUgbmV4dCBwYXRjaCBzZXQNCg0KPiBNZXJnZSBk
dXBsaWNhdGUgcGFyZW50IGluc3RhbmNlcw0KV2UgaGF2ZSBjb25zaWRlcmVkIHRoaXMgaW4gdGhl
IE1UNzk4NiBiYXNpYyBjbG9jayBkcml2ZXIsIGJ1dCBJIHdpbGwNCmNoZWNrIGFnYWluLiBJZiBj
b3JyZWN0aW9ucyBhcmUgbmVlZGVkLCBJIHdpbGwgbWFrZSBjaGFuZ2VzIGluIHRoZSBuZXh0DQpw
YXRjaCBzZXQuDQoNCj4gTGVha2luZyBjbGtfZGF0YSBpZiBzb21lIGZ1bmN0aW9uIHJldHVybiBm
YWlsDQpPa2F5LCB0aGFua3MgZm9yIHlvdXIgY29tbWVudCwgSSB3aWxsIHVwZGF0ZSB0aGlzIGlu
IHRoZSBuZXh0IHBhdGNoIHNldA0KDQo+IFRoaXMgZmlsZSBjb250YWlucyBmb3VyIGRyaXZlcnMu
IFRoZXkgZG8gbm90IGhhdmUgZGVwZW5kIG9uIGVhY2gNCj4gb3RoZXIsIGFuZCBkbyBub3QgbmVl
ZCB0byBiZSBpbiB0aGUgc2FtZSBmaWxlLiBQbGVhc2Ugc3BsaXQgdGhlbSBpbnRvDQo+IGRpZmZl
cmVuIGZpbGVzIGFuZCBwcmVmZXJhYmx5IGRpZmZlcmVudCBwYXRjaGVzDQpPa2F5LCB0aGFua3Mg
Zm9yIHlvdXIgY29tbWVudCwgSSB3aWxsIHNlcGFyYXRlIHRob3NlIGNsb2NrIGRyaXZlcnMgaW4N
CnRoZSBuZXh0IHBhdGNoIHNldA0KDQo+IElzIHRoZXJlIGFueSBwYXJ0aWN1bGFyIHJlYXNvbiBm
b3IgYXJjaF9pbml0Y2FsbA0KV2UgaGF2ZSBjb25zaWRlcmVkIHRoaXMgaW4gTVQ3OTg2IGJhc2lj
IGNsb2NrIGRyaXZlciwgYW5kIHVzZQ0KQ0xLX09GX0RFQ0xBUkUgaW5zdGVhZCBvZiBhcmNoX2lu
aXRjYWxsLg0KDQpBbm90aGVyIHF1ZXN0aW9uOg0KU2hvdWxkIHRoZSBjbG9jayBwYXRjaGVzIGlu
ICJBZGQgYmFzaWMgU29DIHN1cHBvcnQgZm9yIE1lZGlhVGVrIG10Nzk4NiINCm5lZWQgdG8gYmUg
c2VwYXJhdGVkIGludG8gYW5vdGhlciBwYXRjaCBzZXJpZXMsIHN1Y2ggYXMgTVQ4MTk1DQoiTWVk
aWF0ZWsgTVQ4MTk1IGNsb2NrIHN1cHBvcnQiID8gDQoNCg0KUmVnYXJkcw0KU2FtDQo=

