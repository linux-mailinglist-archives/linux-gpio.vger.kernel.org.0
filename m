Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF1E419187
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 11:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbhI0JcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 05:32:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35712 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbhI0JcG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 05:32:06 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18R9URIn037673;
        Mon, 27 Sep 2021 04:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632735027;
        bh=kQY6nvv6nW8S8liam7cExP+iV05+kCnTvAYyAy/GMr0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=RGvX3TKzU7OMVgdBTZhZ4l+pWOsZDVOKuOUY1zWJQW5pjmjMIsw7sUJ8Qc2ExAsx4
         tTNVgI+iv1sHuVnGMqfaNXHFW1r7t5XMZgACclnd6trnPJ+0pL1SIjvm23eDGMWliE
         UnT7SB6dbRAHN9CpfBLtFq9SGopuNca0na82wxFs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18R9UQus086374
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Sep 2021 04:30:27 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 27
 Sep 2021 04:30:26 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2308.014; Mon, 27 Sep 2021 04:30:26 -0500
From:   "M, Aparna" <a-m1@ti.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     "Strashko, Grygorii" <grygorii.strashko@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH RESEND] dt-bindings: gpio: Convert TI
 TPIC2810 GPIO Controller bindings to yaml
Thread-Topic: [EXTERNAL] Re: [PATCH RESEND] dt-bindings: gpio: Convert TI
 TPIC2810 GPIO Controller bindings to yaml
Thread-Index: AQHXovlyzsK14weibk+K/AlN3LkSD6uaiRCAgBW38gD//84LwIAAXowAgAdQzPA=
Date:   Mon, 27 Sep 2021 09:30:26 +0000
Message-ID: <b3780494775c44f092f35b62789b157d@ti.com>
References: <20210906083020.6038-1-a-m1@ti.com>
 <422f7ccd-348b-8023-37db-803339684054@ti.com>
 <CAMpxmJV_DJRtuHH7V86WOi+Rd5fZ0uOf=jNBY7XvJa_5f4h9bQ@mail.gmail.com>
 <91aa4468575143c9bb6a8b6a56ab2995@ti.com>
 <CAMpxmJUam3ZQeizGWaswTy=ziYMh0R5cH+b5F2tdPgWKAuGTDA@mail.gmail.com>
In-Reply-To: <CAMpxmJUam3ZQeizGWaswTy=ziYMh0R5cH+b5F2tdPgWKAuGTDA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.232.178]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhpcyBvbmUgOiBiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tDQoNCkkgc2VudCBhIHBpbmcgb24g
dGhlIG1haWwsIG5vdCBzdXJlIHdoeSB0aGlzIGlzIGhhcHBlbmluZy4NCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBi
YXlsaWJyZS5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjIsIDIwMjEgNjoxNyBQ
TQ0KVG86IE0sIEFwYXJuYSA8YS1tMUB0aS5jb20+DQpDYzogU3RyYXNoa28sIEdyeWdvcmlpIDxn
cnlnb3JpaS5zdHJhc2hrb0B0aS5jb20+OyBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgUmFnaGF2ZW5kcmEs
IFZpZ25lc2ggPHZpZ25lc2hyQHRpLmNvbT47IGxpbnV4LWRldmljZXRyZWUgPGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnPjsgbGludXgtZ3BpbyA8bGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc+
DQpTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBSZTogW1BBVENIIFJFU0VORF0gZHQtYmluZGluZ3M6
IGdwaW86IENvbnZlcnQgVEkgVFBJQzI4MTAgR1BJTyBDb250cm9sbGVyIGJpbmRpbmdzIHRvIHlh
bWwNCg0KT24gV2VkLCBTZXAgMjIsIDIwMjEgYXQgMjoxMSBQTSBNLCBBcGFybmEgPGEtbTFAdGku
Y29tPiB3cm90ZToNCj4NCj4gSGkgQmFydCwNCj4NCj4gSSBoYXZlIHJlc2VudCB0aGUgcGF0Y2gu
DQo+DQo+IFJlZ2FyZHMsDQo+IEFwYXJuYQ0KPg0KDQpUbyB3aGljaCBhZGRyZXNzPyBJIHN0aWxs
IGRvbid0IGhhdmUgaXQgb24gYm90aCBvZiBteSBlbWFpbCBhZGRyZXNzZXMgKG5vdCBpbiBzcGFt
IHRvbykgYW5kIHBhdGNod29yayBzdGlsbCBkb2Vzbid0IHNlZSBpdC4NCg0KQmFydA0K
