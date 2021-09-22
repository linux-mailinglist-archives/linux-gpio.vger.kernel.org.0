Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D7B414883
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 14:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235680AbhIVMNH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 08:13:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37938 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235422AbhIVMNH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 08:13:07 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18MCBYQL093120;
        Wed, 22 Sep 2021 07:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632312694;
        bh=/Nw90Xtv3zobHRZsSpQJf8r9AaiQofhoTfiADeHp+20=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=ra7c2e1fZCBigYIqwwe9TU4+GsBAqkz+uFvz9zlO7akQFwrippKbJXx/SfGQHWCmA
         w8Teh3jZn+G3ygZGlb1cfa3JaHR5tMBZtplPvKLBXwTFa/SagOkTmPE6qNbnYnr4xL
         wIjg7iDuxGCulL+L/gl/s+c/34YdWZL/svvi4MCE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18MCBYkM083649
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Sep 2021 07:11:34 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 22
 Sep 2021 07:11:33 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2308.014; Wed, 22 Sep 2021 07:11:33 -0500
From:   "M, Aparna" <a-m1@ti.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Strashko, Grygorii" <grygorii.strashko@ti.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH RESEND] dt-bindings: gpio: Convert TI
 TPIC2810 GPIO Controller bindings to yaml
Thread-Topic: [EXTERNAL] Re: [PATCH RESEND] dt-bindings: gpio: Convert TI
 TPIC2810 GPIO Controller bindings to yaml
Thread-Index: AQHXovlyzsK14weibk+K/AlN3LkSD6uaiRCAgBW38gD//84LwA==
Date:   Wed, 22 Sep 2021 12:11:33 +0000
Message-ID: <91aa4468575143c9bb6a8b6a56ab2995@ti.com>
References: <20210906083020.6038-1-a-m1@ti.com>
 <422f7ccd-348b-8023-37db-803339684054@ti.com>
 <CAMpxmJV_DJRtuHH7V86WOi+Rd5fZ0uOf=jNBY7XvJa_5f4h9bQ@mail.gmail.com>
In-Reply-To: <CAMpxmJV_DJRtuHH7V86WOi+Rd5fZ0uOf=jNBY7XvJa_5f4h9bQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.235.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQmFydCwNCg0KSSBoYXZlIHJlc2VudCB0aGUgcGF0Y2guDQoNClJlZ2FyZHMsDQpBcGFybmEN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kg
PGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIg
MjIsIDIwMjEgMzozNyBQTQ0KVG86IFN0cmFzaGtvLCBHcnlnb3JpaSA8Z3J5Z29yaWkuc3RyYXNo
a29AdGkuY29tPjsgTSwgQXBhcm5hIDxhLW0xQHRpLmNvbT4NCkNjOiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3Jn
PjsgUmFnaGF2ZW5kcmEsIFZpZ25lc2ggPHZpZ25lc2hyQHRpLmNvbT47IGxpbnV4LWRldmljZXRy
ZWUgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgbGludXgtZ3BpbyA8bGludXgtZ3Bpb0B2
Z2VyLmtlcm5lbC5vcmc+DQpTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggUkVTRU5EXSBk
dC1iaW5kaW5nczogZ3BpbzogQ29udmVydCBUSSBUUElDMjgxMCBHUElPIENvbnRyb2xsZXIgYmlu
ZGluZ3MgdG8geWFtbA0KDQpPbiBXZWQsIFNlcCA4LCAyMDIxIGF0IDQ6MjcgUE0gR3J5Z29yaWkg
U3RyYXNoa28gPG1haWx0bzpncnlnb3JpaS5zdHJhc2hrb0B0aS5jb20+IHdyb3RlOg0KPg0KPg0K
Pg0KPiBPbiAwNi8wOS8yMDIxIDExOjMwLCBBcGFybmEgTSB3cm90ZToNCj4gPiAqIENvbnZlcnQg
Z3Bpby10cGljMjgxMCBiaW5kaW5ncyB0byB5YW1sIGZvcm1hdA0KPiA+ICogUmVtb3ZlIG91dGRh
dGVkIGdwaW8tdHBpYzI4MTAgYmluZGluZ3MgaW4gLnR4dCBmb3JtYXQNCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFwYXJuYSBNIDxtYWlsdG86YS1tMUB0aS5jb20+DQo+ID4gLS0tDQo+ID4gICAu
Li4vYmluZGluZ3MvZ3Bpby9ncGlvLXRwaWMyODEwLnR4dCAgICAgICAgICAgfCAxNiAtLS0tLS0t
LQ0KPiA+ICAgLi4uL2JpbmRpbmdzL2dwaW8vZ3Bpby10cGljMjgxMC55YW1sICAgICAgICAgIHwg
NDEgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4gPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlvLXRwaWMyODEwLnR4dA0KPiA+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncGlvL2dwaW8tdHBpYzI4MTAueWFtbA0KPg0KPiBSZXZpZXdlZC1ieTogR3J5Z29yaWkgU3Ry
YXNoa28gPG1haWx0bzpncnlnb3JpaS5zdHJhc2hrb0B0aS5jb20+DQo+DQo+IC0tDQo+IEJlc3Qg
cmVnYXJkcywNCj4gZ3J5Z29yaWkNCg0KSGkgR3JpZ29yaWksDQoNCkknbSBub3Qgc3VyZSB3aGF0
IHRoaXMgaXMgLSBJIGRvbid0IGhhdmUgdGhpcyBwYXRjaCBpbiBteSBpbmJveCBhbmQgcGF0Y2h3
b3JrIHNlZW1zIHRvIGhhdmUgbWlzc2VkIHRoYXQuDQoNCkFwYXJuYSAtIGNvdWxkIHlvdSBwbGVh
c2UgcmVzZW5kIGl0IHdpdGggbWUgaW4gQ2M/DQoNCkJhcnQNCg==
