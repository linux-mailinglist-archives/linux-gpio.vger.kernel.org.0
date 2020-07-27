Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8E822EC3B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 14:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgG0Mcf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 08:32:35 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:14442 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728163AbgG0Mce (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Jul 2020 08:32:34 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06RC74St003396;
        Mon, 27 Jul 2020 14:32:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=s9pu0ZiAF+D1FrsmQKBwwviQAVVTJkGYzn8tQLO+FL4=;
 b=GEHMWRSb90X6w1hnhnn6aK5MGOPqHMiItosD1yRKIpS5Ky4rSJ3Vxh2iztrGqjDX6HDk
 YoRnM7r1tsyGKUPUS9+d2yoH3VWhRj6cMsHu52PNwgTCxXEnz1fzz83gNfgKyHRrjxYL
 jbd+52DPhBbgG9LrVnAA/eKaaw0TaRBqzQIUnkUwkLQkm3ePR0IrmSjBFAAiGmUrHHZS
 BPsJYKYAPGuz7P71TZ5a6pYZCDJlPerQuz/ZVo9kUFyeLqlHKdmq4rPOF3ruwiZ/32xi
 Y53ukiOnT8FVbTJngJXKK6rC/S5BVyimIbsqCdBcH9CwHqNVwds1msuXsqyKjRSoaows 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32g9v999x1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jul 2020 14:32:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 671D110002A;
        Mon, 27 Jul 2020 14:32:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 502A22BE242;
        Mon, 27 Jul 2020 14:32:30 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 Jul
 2020 14:32:30 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 27 Jul 2020 14:32:29 +0200
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
Subject: Re: [PATCH] gpio: stmpe: Use irqchip template
Thread-Topic: [PATCH] gpio: stmpe: Use irqchip template
Thread-Index: AQHWW1jOm/8jx9MbD0yJhkB8IOLGKakbS8OA
Date:   Mon, 27 Jul 2020 12:32:29 +0000
Message-ID: <77d9f7b1-b4f4-ab40-8a2c-0515a5280ce6@st.com>
References: <20200716100638.112451-1-linus.walleij@linaro.org>
In-Reply-To: <20200716100638.112451-1-linus.walleij@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="utf-8"
Content-ID: <13936D46833E4746981DE70929F9ECE9@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-27_08:2020-07-27,2020-07-27 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMNCg0KT24gNy8xNi8yMCAxMjowNiBQTSwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4g
VGhpcyBtYWtlcyB0aGUgZHJpdmVyIHVzZSB0aGUgaXJxY2hpcCB0ZW1wbGF0ZSB0byBhc3NpZ24N
Cj4gcHJvcGVydGllcyB0byB0aGUgZ3Bpb19pcnFfY2hpcCBpbnN0ZWFkIG9mIHVzaW5nIHRoZQ0K
PiBleHBsaWNpdCBjYWxscyB0byBncGlvY2hpcF9pcnFjaGlwX2FkZF9uZXN0ZWQoKSBhbmQNCj4g
Z3Bpb2NoaXBfc2V0X25lc3RlZF9pcnFjaGlwKCkuIFRoZSBpcnFjaGlwIGlzIGluc3RlYWQNCj4g
YWRkZWQgd2hpbGUgYWRkaW5nIHRoZSBncGlvY2hpcC4NCj4NCj4gQ2M6IFBhdHJpY2UgQ2hvdGFy
ZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCj4gQ2M6IEFsZXhhbmRyZSBUT1JHVUUgPGFsZXhh
bmRyZS50b3JndWVAc3QuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncGlvL2dwaW8tc3RtcGUu
YyB8IDI0ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cGlvL2dwaW8tc3RtcGUuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXN0bXBlLmMNCj4gaW5kZXggNTQy
NzA2YTg1MmU2Li4zOTVlZTUxNDQ1ZWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlv
LXN0bXBlLmMNCj4gKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tc3RtcGUuYw0KPiBAQCAtNTA3LDYg
KzUwNyw4IEBAIHN0YXRpYyBpbnQgc3RtcGVfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiAgCX0NCj4gIA0KPiAgCWlmIChpcnEgPiAwKSB7DQo+ICsJCXN0cnVjdCBn
cGlvX2lycV9jaGlwICpnaXJxOw0KPiArDQo+ICAJCXJldCA9IGRldm1fcmVxdWVzdF90aHJlYWRl
ZF9pcnEoJnBkZXYtPmRldiwgaXJxLCBOVUxMLA0KPiAgCQkJCXN0bXBlX2dwaW9faXJxLCBJUlFG
X09ORVNIT1QsDQo+ICAJCQkJInN0bXBlLWdwaW8iLCBzdG1wZV9ncGlvKTsNCj4gQEAgLTUxNCwy
MCArNTE2LDE2IEBAIHN0YXRpYyBpbnQgc3RtcGVfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgCQkJZGV2X2VycigmcGRldi0+ZGV2LCAidW5hYmxlIHRvIGdldCBp
cnE6ICVkXG4iLCByZXQpOw0KPiAgCQkJZ290byBvdXRfZGlzYWJsZTsNCj4gIAkJfQ0KPiAtCQly
ZXQgPSAgZ3Bpb2NoaXBfaXJxY2hpcF9hZGRfbmVzdGVkKCZzdG1wZV9ncGlvLT5jaGlwLA0KPiAt
CQkJCQkJICAgJnN0bXBlX2dwaW9faXJxX2NoaXAsDQo+IC0JCQkJCQkgICAwLA0KPiAtCQkJCQkJ
ICAgaGFuZGxlX3NpbXBsZV9pcnEsDQo+IC0JCQkJCQkgICBJUlFfVFlQRV9OT05FKTsNCj4gLQkJ
aWYgKHJldCkgew0KPiAtCQkJZGV2X2VycigmcGRldi0+ZGV2LA0KPiAtCQkJCSJjb3VsZCBub3Qg
Y29ubmVjdCBpcnFjaGlwIHRvIGdwaW9jaGlwXG4iKTsNCj4gLQkJCWdvdG8gb3V0X2Rpc2FibGU7
DQo+IC0JCX0NCj4gIA0KPiAtCQlncGlvY2hpcF9zZXRfbmVzdGVkX2lycWNoaXAoJnN0bXBlX2dw
aW8tPmNoaXAsDQo+IC0JCQkJCSAgICAmc3RtcGVfZ3Bpb19pcnFfY2hpcCwNCj4gLQkJCQkJICAg
IGlycSk7DQo+ICsJCWdpcnEgPSAmc3RtcGVfZ3Bpby0+Y2hpcC5pcnE7DQo+ICsJCWdpcnEtPmNo
aXAgPSAmc3RtcGVfZ3Bpb19pcnFfY2hpcDsNCj4gKwkJLyogVGhpcyB3aWxsIGxldCB1cyBoYW5k
bGUgdGhlIHBhcmVudCBJUlEgaW4gdGhlIGRyaXZlciAqLw0KPiArCQlnaXJxLT5wYXJlbnRfaGFu
ZGxlciA9IE5VTEw7DQo+ICsJCWdpcnEtPm51bV9wYXJlbnRzID0gMDsNCj4gKwkJZ2lycS0+cGFy
ZW50cyA9IE5VTEw7DQo+ICsJCWdpcnEtPmRlZmF1bHRfdHlwZSA9IElSUV9UWVBFX05PTkU7DQo+
ICsJCWdpcnEtPmhhbmRsZXIgPSBoYW5kbGVfc2ltcGxlX2lycTsNCj4gKwkJZ2lycS0+dGhyZWFk
ZWQgPSB0cnVlOw0KPiAgCX0NCj4gIA0KPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHN0
bXBlX2dwaW8pOw0KDQpSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAc3QuY29tPg0KDQpUaGFua3MNCg==
