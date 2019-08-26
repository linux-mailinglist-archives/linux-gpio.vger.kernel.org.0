Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE10F9CABF
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 09:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729956AbfHZHmA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 03:42:00 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:1455 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726896AbfHZHl7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Aug 2019 03:41:59 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7Q7f6vG019733;
        Mon, 26 Aug 2019 09:41:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=AYmYIr2Gk7Kd2L7qGiGRuCo3rzJa6GdB8mhAzTpII5E=;
 b=CTMCfPO787gLWO3C2UG4Wx2/mop+oRd2wYjx41tkCscbUmhfqkBk+t37NxcL22NEsaPK
 g973pmEE5bBR+Cpyw6+EamrA2Jao2sOsVSZ6pjTVWzeLgfmjgiA+nL1L74Aa2LnBKbmb
 ndarmimurI2Kd1lXsdgRhTLXk6ratFkRGnuiytfwO6w5sEG/YVOvYr5rW5GfLCRRc2fY
 gQwZCqwW1ryBqkdzasPVuLRUhOqs72EDDaQpb4jRq2OEoX19GbWrXPBOFzHdu29vE2Qg
 pyC2mbqJ/GAMIARGiXeEvFDZnm9h7BqZwsf6iR9yLYcMseae9B5fl21IPucPE6XwZ8TB Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2ujtcbahv8-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 26 Aug 2019 09:41:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3067031;
        Mon, 26 Aug 2019 07:41:56 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 263832BDA6B;
        Mon, 26 Aug 2019 09:41:56 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 26 Aug
 2019 09:41:55 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 26 Aug 2019 09:41:55 +0200
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH v2] pinctrl: st: Include the right header
Thread-Topic: [PATCH v2] pinctrl: st: Include the right header
Thread-Index: AQHVV0hUnKJqSmULyUeL50vsUuKroKcM81+A
Date:   Mon, 26 Aug 2019 07:41:55 +0000
Message-ID: <663edffe-ccab-1a09-e5e5-fbaad62ebc16@st.com>
References: <20190820111135.10701-1-linus.walleij@linaro.org>
In-Reply-To: <20190820111135.10701-1-linus.walleij@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F78F33DAD4697040899524D4E0F33D0C@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-26_04:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMNCg0KT24gOC8yMC8xOSAxOjExIFBNLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0KPiBU
aGUgU1QgcGluY3RybCBkcml2ZXIgd2FudHMgdG8gcHJvdm9kZSBhIGdwaW9fY2hpcCBidXQgaXMg
bm90DQo+IGluY2x1ZGluZyB0aGUgaGVhZGVyIGZvciB0aGlzLCBmaXggdGhlIGluY2x1c2lvbiB0
byB1c2UgdGhlIHJpZ2h0DQo+IGhlYWRlci4gPGxpbnV4L29mX2dwaW8uaD4gaGFzIHRvIHJlbWFp
biBhcyB0aGUgZHJpdmVyIGlzIGNhbGxpbmcNCj4gb2ZfZ2V0X25hbWVkX2dwaW8oKS4NCj4NCj4g
Q2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCj4gQ2M6IE1heGlt
ZSBDb3F1ZWxpbiA8bWF4aW1lLmNvcXVlbGluQHN0LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gQ2hhbmdlTG9n
IHYxLT52MjoNCj4gLSBJbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+IGFnYWluLCB0aGUgZHJpdmVy
IGlzIGluZGVlZCB1c2luZw0KPiAgIGl0Lg0KPiAtIEFkZCBhbiBleHBsYW5hdG9yeSBjb21tZW50
Lg0KPiAtLS0NCj4gIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0LmMgfCAzICsrLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3QuYyBiL2RyaXZlcnMvcGluY3RybC9waW5j
dHJsLXN0LmMNCj4gaW5kZXggYjk2ODhlYTU0OGRhLi4yNTIzNmI3MTZmYjMgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0LmMNCj4gKysrIGIvZHJpdmVycy9waW5jdHJs
L3BpbmN0cmwtc3QuYw0KPiBAQCAtMTIsOCArMTIsOSBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L2lv
Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9vZl9pcnEu
aD4NCj4gLSNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvb2Zf
Z3Bpby5oPiAvKiBvZl9nZXRfbmFtZWRfZ3BpbygpICovDQo+ICAjaW5jbHVkZSA8bGludXgvb2Zf
YWRkcmVzcy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2dwaW8vZHJpdmVyLmg+DQo+ICAjaW5jbHVk
ZSA8bGludXgvcmVnbWFwLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPg0KPiAg
I2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY3RybC5oPg0KDQoNClJldmlld2VkLWJ5OiBQYXRy
aWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+DQoNClRoYW5rcw0K
