Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41E11D28F0
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 09:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgENHkS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 03:40:18 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:44234 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725911AbgENHkS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 May 2020 03:40:18 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04E7X8dr013496;
        Thu, 14 May 2020 09:40:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SpEvreKtB+MBazylqO4KkqjFJKRyk5rMPdajWCqdW74=;
 b=yCM4XEEXFY9SoRsTSHZEY9AEh57E74V74fmTZXm3ck9QbjUUud4TOF6GD4yR33DLlOC4
 3MlDS1Y/SNxkbP3U9iYJiwjihRZ4AguTw6iLZxUmefK9etQZphd0rK1DIE3yKtaFKOSy
 CTzIAKDrjVaBA3H388fZT29cVei7U/T/btNO+CO56VPMk/Y+gY0XGDLLPgNFUMER/AM+
 wt0ewGUjoWttF5l8Zr+LzseFAzU6K1KK5XRJMWMCxF+6+nj1DzY8MrdxVntnS8tQggYx
 uofT9FaTm2lVVxeqc7LFLn2CJ8YS7EjV6CeOBfXEEMeyNYjoO6NJ7kge80OCiyZDPybq 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3100vyhjd7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 May 2020 09:40:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3AC3A10002A;
        Thu, 14 May 2020 09:39:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1C3C2A594D;
        Thu, 14 May 2020 09:39:55 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 09:39:55 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 14 May 2020 09:39:55 +0200
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Rob Herring <robh@kernel.org>
CC:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.co" <mark.rutland@arm.co>,
        "Alexandre TORGUE" <alexandre.torgue@st.com>,
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
Thread-Index: AQHV6An9BN3fbiJe+Uu+wK6+EyGnQqgtoL2AgHnzXwA=
Date:   Thu, 14 May 2020 07:39:55 +0000
Message-ID: <70ee04c9-4f65-6909-32bc-a379c21a031e@st.com>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
 <20200226162125.GA13349@bogus>
In-Reply-To: <20200226162125.GA13349@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <38B5556472D33343A6C2240B0D499256@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-14_01:2020-05-13,2020-05-14 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCk9uIDIvMjYvMjAgNToyMSBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFRodSwgMjAg
RmViIDIwMjAgMTc6MjI6NDYgKzAxMDAsIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOg0KPj4gQ29u
dmVydCBzdG1meCBiaW5kaW5ncyB0byBqc29uLXNjaGVtYQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+DQo+PiAtLS0NCj4+
ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bWZ4LnlhbWwgICAgICAgICAgfCAx
MjQgKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvc3RtZngudHh0ICAgIHwgIDI4IC0tLS0tDQo+PiAgIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1zdG1meC50eHQgIHwgMTE2IC0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMjQgaW5zZXJ0aW9ucygrKSwgMTQ0IGRlbGV0
aW9ucygtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21mZC9zdCxzdG1meC55YW1sDQo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0bWZ4LnR4dA0KPj4gICBkZWxldGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGlu
Y3RybC1zdG1meC50eHQNCj4+DQpIaSBMZWUsIFJvYiwNCg0KSSBoYXZlbid0IGJlZW4gYWJsZSB0
byBmb3VuZCB0aGlzIHBhdGNoIGluIC1uZXh0IGJyYW5jaGVzLCBjYW4gb25lIG9mIA0KeW91IG1l
cmdlIGl0ID8NCg0KVGhhbmtzLA0KQmVuamFtaW4NCj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+DQo=
