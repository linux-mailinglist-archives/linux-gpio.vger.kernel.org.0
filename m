Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32961FB234
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 15:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgFPNeg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 09:34:36 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:51185 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726306AbgFPNe3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 09:34:29 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05GDSuXw015301;
        Tue, 16 Jun 2020 15:33:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8Zqu22QzzYb9zFOTMzGzv0s5kLJ9DJfwjRSOOCg3wiU=;
 b=Z7Whu9W3CnukVE5BhvVBZNXcK9GFSDhAwpxS9uQ9p4/TF8njS7UNjXvjd1xgU2VoioeP
 3mEqXyvsEmcNmmTgismCPjFb0j3LTytXUn14ub+vJAsVDsKx4dk6C2a9DWqmGeAvmLen
 EcHuxzmqybXM26XYmfaPQawFNIcxDR0jrZIeqqfzN3/pVw30RZXfPrts6le6XblcvFql
 mU2tpNe3/dgOMfeNBg3InjBdNfP/ozRcekII0sVmHoZnW3zXf8RtRyOQmP/Xytfp3ctF
 sZKGPW0ATAfhxaWrJ8lru0AagkKlNqpxBpLPDSdhXGrHJMXSF6Fzg5sK6SbfKKnvTcc8 JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31mmjvyjx6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Jun 2020 15:33:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D432110002A;
        Tue, 16 Jun 2020 15:33:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8801F2B663A;
        Tue, 16 Jun 2020 15:33:14 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 16 Jun
 2020 15:33:14 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 16 Jun 2020 15:33:14 +0200
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     Rob Herring <robh@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.co" <mark.rutland@arm.co>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Amelie DELAUNAY <amelie.delaunay@st.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to
 json-schema
Thread-Topic: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to
 json-schema
Thread-Index: AQHV6An9BN3fbiJe+Uu+wK6+EyGnQqgtoL2AgHnzXwCAABZ/gIA0KSeA
Date:   Tue, 16 Jun 2020 13:33:14 +0000
Message-ID: <f0e8c6fc-a5fc-b621-1c7e-251bafd2f46c@st.com>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
 <20200226162125.GA13349@bogus> <70ee04c9-4f65-6909-32bc-a379c21a031e@st.com>
 <20200514090025.GE271301@dell>
In-Reply-To: <20200514090025.GE271301@dell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB381301BD63D446B3798EA4A53A2647@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-16_04:2020-06-16,2020-06-16 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCk9uIDUvMTQvMjAgMTE6MDAgQU0sIExlZSBKb25lcyB3cm90ZToNCj4gT24gVGh1LCAxNCBN
YXkgMjAyMCwgQmVuamFtaW4gR0FJR05BUkQgd3JvdGU6DQo+DQo+Pg0KPj4gT24gMi8yNi8yMCA1
OjIxIFBNLCBSb2IgSGVycmluZyB3cm90ZToNCj4+PiBPbiBUaHUsIDIwIEZlYiAyMDIwIDE3OjIy
OjQ2ICswMTAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToNCj4+Pj4gQ29udmVydCBzdG1meCBi
aW5kaW5ncyB0byBqc29uLXNjaGVtYQ0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1p
biBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPg0KPj4+PiAtLS0NCj4+Pj4gICAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bWZ4LnlhbWwgICAgICAgICAgfCAxMjQg
KysrKysrKysrKysrKysrKysrKysrDQo+Pj4+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvc3RtZngudHh0ICAgIHwgIDI4IC0tLS0tDQo+Pj4+ICAgIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1zdG1meC50eHQgIHwgMTE2IC0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAxMjQgaW5zZXJ0aW9ucygrKSwgMTQ0
IGRlbGV0aW9ucygtKQ0KPj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG1meC55YW1sDQo+Pj4+ICAgIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0bWZ4LnR4dA0K
Pj4+PiAgICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BpbmN0cmwvcGluY3RybC1zdG1meC50eHQNCj4+Pj4NCj4+IEhpIExlZSwgUm9iLA0KPj4N
Cj4+IEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gZm91bmQgdGhpcyBwYXRjaCBpbiAtbmV4dCBicmFu
Y2hlcywgY2FuIG9uZSBvZg0KPj4geW91IG1lcmdlIGl0ID8NCj4+DQo+PiBUaGFua3MsDQo+PiBC
ZW5qYW1pbg0KPj4+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0K
PiBSb2IsDQo+DQo+IFdlIHNob3VsZCBhZ3JlZSBvbiBhIHByb2Nlc3MgZ29pbmcgZm9yd2FyZC4g
IERvIHlvdSB0YWtlIERUIGRvY3VtZW50DQo+IGNoYW5nZXMgb3Igc2hvdWxkIEk/ICBVcCB1bnRp
bCB3ZSBtb3ZlZCB0byBZQU1MIGZvcm1hdHRpbmcsIEkgdG9vaw0KPiB0aGVtIGJ1dCByZXNwb25z
aWJseSBzZWVtcyB0byBoYXZlIG1pZ3JhdGVkIG92ZXIgdG8geW91IHNpbmNlIHRoZW4uDQo+DQo+
IEkgZG9uJ3QgbWluZCBlaXRoZXIgd2F5Lg0KSGksDQoNCkFueSBuZXdzIG9uIHRoaXMgeWFtbCBj
b252ZXJzaW9uID8NCg0KQmVuamFtaW4NCj4NCg==
