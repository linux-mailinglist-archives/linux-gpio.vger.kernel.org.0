Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51E3291B4
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 09:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388910AbfEXH2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 03:28:17 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:25608 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388871AbfEXH2R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 May 2019 03:28:17 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4O7JwE2023833;
        Fri, 24 May 2019 09:28:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=D6oyFoFydAO0TxdvXNBZqITwgK3L84EkK4Q6IuIY5uA=;
 b=jPLpB4+za1Ox4rmRyMyo7XFlPfy3Dl5Sr0WxbI0wUzKBavzlimH+rxijWuBI7gk0su5a
 QgFTL9ok2ptmje9kVoxAIMkz6n5PW7MxHkcLvLCokbXqJlR9BJcJ+6D0NobfjsLz0QhA
 h3cX5xBAdatPxCGfFT7AskCM6U18dijZJazt3B+WM6/rgBDAw6oWC9C3LdJPdOTky5d5
 FcLqDeQ8e+G+YeeW8YQE9ED2QMMe6aqf2B/4++dr80OKV6fp2yWHCyQ7I8rUJfEv0bAw
 RXajCve1D6WkdNEA9TLOXodkUPKELOOgjv7FpM+8lDDCdxOp+1tsbGdjsOgzfE/3/cOk jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sj774m4u9-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 24 May 2019 09:28:02 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 440614D;
        Fri, 24 May 2019 07:27:57 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ADA9A163F;
        Fri, 24 May 2019 07:27:57 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 May
 2019 09:27:57 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Fri, 24 May 2019 09:27:57 +0200
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lee Jones <lee.jones@linaro.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Thread-Topic: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Thread-Index: AQHVDuDxK6HzwnJUFE6SYGi4rooWzqZ2hLKAgAAnAgCAAAlUgIAACtCAgADRIYCAARFPAIAAVxOAgADLxQA=
Date:   Fri, 24 May 2019 07:27:57 +0000
Message-ID: <ce77d35a-806c-b7af-975d-1b24e98f8723@st.com>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell> <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
 <20190522084133.GF4574@dell> <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
 <CACRpkdYmdpwEvCBrL6i1V+Zxd0OSpZmD8BJPSZu9jYNeJkoimQ@mail.gmail.com>
 <08ea97544018430caf53af36677902b7@SFHDAG3NODE2.st.com>
 <CACRpkdZLbMJ5dKiL9J1x=PozBVH777kNNABZi-n0LxD0BOp8mw@mail.gmail.com>
In-Reply-To: <CACRpkdZLbMJ5dKiL9J1x=PozBVH777kNNABZi-n0LxD0BOp8mw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7391FCC94802684F9891B69CEC402F40@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-24_02:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gNS8yMy8xOSA5OjE4IFBNLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0KPiBPbiBUaHUsIE1heSAy
MywgMjAxOSBhdCA0OjExIFBNIEFtZWxpZSBERUxBVU5BWSA8YW1lbGllLmRlbGF1bmF5QHN0LmNv
bT4gd3JvdGU6DQo+PiBPbiA1LzIyLzE5IDExOjQ4IFBNLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
Pj4+IE9uIFdlZCwgTWF5IDIyLCAyMDE5IGF0IDExOjIxIEFNIEFtZWxpZSBERUxBVU5BWSA8YW1l
bGllLmRlbGF1bmF5QHN0LmNvbT4gd3JvdGU6DQo+Pj4NCj4+Pj4gLi4vZHJpdmVycy9waW5jdHJs
L3BpbmN0cmwtc3RtZnguYzo0MDk6MjA6IGVycm9yOg0KPj4+PiDigJhwaW5jb25mX2dlbmVyaWNf
ZHRfbm9kZV90b19tYXBfcGlu4oCZIHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rpb24p
DQo+Pj4+ICAgICAgLmR0X25vZGVfdG9fbWFwID0gcGluY29uZl9nZW5lcmljX2R0X25vZGVfdG9f
bWFwX3BpbiwNCj4+Pj4NCj4+Pj4gT0ZfR1BJTyBkZXBlbmRzIG9uIE9GLg0KPj4+Pg0KPj4+PiBT
byBlaXRoZXINCj4+Pj4gICAgICAgIGRlcGVuZHMgb24gT0YgfHwgKE9GICYmIENPTVBJTEVfVEVT
VCkNCj4+Pj4gb3INCj4+Pj4gICAgICAgIGRlcGVuZHMgb24gT0YgfHwgKE9GX0dQSU8gJiYgQ09N
UElMRV9URVNUKQ0KPj4+Pg0KPj4+PiBhbmQNCj4+Pj4NCj4+Pj4gICAgICAgIHNlbGVjdCBPRl9H
UElPDQo+Pj4NCj4+PiBJIHdvdWxkIHVzZSBqdXN0Og0KPj4+DQo+Pj4gZGVwZW5kcyBvbiBPRl9H
UElPDQo+Pj4NCj4+PiBCZWNhdXNlIE9GX0dQSU8gYWxyZWFkeSBkZXBlbmRzIG9uIE9GLCBhbmQN
Cj4+PiBjb21waWxlIHRlc3RzIHdpbGwgbm90IHdvcmsgd2l0aG91dCBPRl9HUElPIHdoaWNoDQo+
Pj4gcmVxdWlyZSBPRiBzby4uLg0KPj4+DQo+Pj4gQmVzaWRlcyBpdCBpcyB3aGF0IG1vc3Qgb3Ro
ZXIgR1BJTyBkcml2ZXJzIGRvLg0KPj4+DQo+Pj4gU28ganVzdCBrZWVwIHRoYXQgb25lIGxpbmUg
YW5kIGRyb3AgdGhlIHJlc3QuDQo+Pj4NCj4+PiBZb3VycywNCj4+PiBMaW51cyBXYWxsZWlqDQo+
Pj4NCj4+DQo+PiBPayBzbyBJIGNhbiBnZXQgcmlkIG9mIENPTVBJTEVfVEVTVCA/DQo+PiAgICAg
ICAgICBkZXBlbmRzIG9uIEkyQw0KPj4gICAgICAgICAgZGVwZW5kcyBvbiBPRl9HUElPDQo+PiAg
ICAgICAgICBzZWxlY3QgR0VORVJJQ19QSU5DT05GDQo+PiAgICAgICAgICBzZWxlY3QgR1BJT0xJ
Ql9JUlFDSElQDQo+PiAgICAgICAgICBzZWxlY3QgTUZEX1NUTUZYDQo+IA0KPiBZZXAganVzdCBs
aWtlIHRoYXQuDQo+IA0KPj4gQmVjYXVzZSBJJ3ZlIG5vIGFyY2ggdG8gYmFsYW5jZSBDT01QSUxF
X1RFU1QuIE9yIG1heWJlIHNvbWV0aGluZyBsaWtlDQo+PiAgICAgICAgICBkZXBlbmRzIG9uIE9G
X0dQSU8gJiYgKE9GIHx8IENPTVBJTEVfVEVTVCkNCj4+IGV2ZW4gaWYgT0ZfR1BJTyAmJiBPRiBp
cyByZWR1bmRhbnQgPw0KPiANCj4gQ09NUElMRV9URVNUIGlzIGp1c3QgdG8gbWFrZSBzb21ldGhp
bmcgYXZhaWxhYmxlIGZvciB0ZXN0aW5nDQo+IG9uIG90aGVyIGFyY2hpdGVjdHVyZXMsIHN1Y2gg
YXMgdGVzdGluZyBBUk0tc3BlY2lmaWMgZHJpdmVycw0KPiBvbiB4ODYuDQo+IA0KPiBXaXRoIGp1
c3QgT0ZfR1BJTyBhcyBkZXBlbmRlbmN5LCBpdCB3aWxsIGJlIGNvbXBpbGUgdGVzdGVkIGFueXdh
eXMNCj4gYmVjYXVzZSB4ODYgYWxseWVzY29uZmlnIHdpbGwgZW5hYmxlIE9GIGFuZCBPRl9HUElP
LCBhbmQgYWxzbw0KPiBhbGwgdGhlIFNUTUZYIGRyaXZlcnMuDQo+IA0KPiBZb3VycywNCj4gTGlu
dXMgV2FsbGVpag0KPiANCg0KVGhhbmtzIExpbnVzIGZvciB0aGlzIGNsYXJpZmljYXRpb24hDQoN
ClJlZ2FyZHMsDQpBbWVsaWU=
