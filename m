Return-Path: <linux-gpio+bounces-10376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D897E978
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 12:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1351F22226
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 10:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A171199926;
	Mon, 23 Sep 2024 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K8ZbEipB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D06195FD1;
	Mon, 23 Sep 2024 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085987; cv=none; b=tXUmLgJB/bTaY9skqy5JJ+SXqjzPJ010TcIGkUTPKQ/QjWF4tX0fA4BYczlo3ynWZB2JcQbv+mFOF5/vfy7BvW2U+/OsNba19CSgBXQPoBa4Z6UVyL8J5lxXgvS1rW4uUQ7bOpvVqWj7RSJpLiqcmT6sgvb797aZVD/HuuOfyQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085987; c=relaxed/simple;
	bh=dYERMYiqBcu5v+Xw3cVsKRtYwwRlvcKA6xAVzDs3h7I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LzBKgrYoQhpkUPIZJ4OWVUy4yO/mr7ve4IHB1WeRfDix9pd7eRHZHrC3kBuLN4w+t6pKV2bKOzP0gIHz9g2snyO9rjJL3lJfC+15chC5+la4qezPSm41rNR5M3x209UPaeubfO9Q/9CIisy/MbyHssAq7/HIb4taVzUy20fCqis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=K8ZbEipB; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48NA63o8023688;
	Mon, 23 Sep 2024 05:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727085963;
	bh=dYERMYiqBcu5v+Xw3cVsKRtYwwRlvcKA6xAVzDs3h7I=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=K8ZbEipBBe0XcMAsO6eY+QKTaU6JhtW4EgvyNYsr1O/qOd3OzJfgHp5FQpE2dH7Kt
	 zAVWMLwDvAe7+1I6ekP2++aFBAr05dZLpa22AxvcssRsVCBXvBGKZsSlTU3AItleDE
	 kBj0RgE3B23fZbskcmhI6LfX/8/CfI+AQQbBt5Og=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48NA636D033721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Sep 2024 05:06:03 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Sep 2024 05:06:02 -0500
Received: from DFLE105.ent.ti.com ([fe80::48d3:ae6d:c4d6:9f16]) by
 DFLE105.ent.ti.com ([fe80::48d3:ae6d:c4d6:9f16%17]) with mapi id
 15.01.2507.023; Mon, 23 Sep 2024 05:06:02 -0500
From: "J, KEERTHY" <j-keerthy@ti.com>
To: Francesco Dolcini <francesco@dolcini.it>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>
CC: Parth Pancholi <parth105105@gmail.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Parth Pancholi
	<parth.pancholi@toradex.com>,
        "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] gpio: davinci: fix lazy disable
Thread-Topic: [PATCH] gpio: davinci: fix lazy disable
Thread-Index: AQHbDZylrBCROVfrq0Gl42vnUfRSUbJlJPSg
Date: Mon, 23 Sep 2024 10:06:02 +0000
Message-ID: <b2c39198c3ac450e8fa332cfc4d15fbc@ti.com>
References: <20240828133207.493961-1-parth105105@gmail.com>
 <CAMRc=MdyNFzNy_GndBDOUL23Rv0WxGG8mRd5DRD28pE=XuhfmQ@mail.gmail.com>
 <20240923094029.GA124572@francesco-nb>
In-Reply-To: <20240923094029.GA124572@francesco-nb>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBGcmFuY2VzY28gRG9sY2luaSA8
ZnJhbmNlc2NvQGRvbGNpbmkuaXQ+IA0KU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMjMsIDIwMjQg
MzoxMCBQTQ0KVG86IEosIEtFRVJUSFkgPGota2VlcnRoeUB0aS5jb20+OyBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxicmdsQGJnZGV2LnBsPg0KQ2M6IFBhcnRoIFBhbmNob2xpIDxwYXJ0aDEwNTEwNUBn
bWFpbC5jb20+OyBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBFbWFu
dWVsZSBHaGlkb2xpIDxlbWFudWVsZS5naGlkb2xpQHRvcmFkZXguY29tPjsgbGludXgtZ3Bpb0B2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFBhcnRoIFBhbmNo
b2xpIDxwYXJ0aC5wYW5jaG9saUB0b3JhZGV4LmNvbT47IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcN
ClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGdwaW86IGRhdmluY2k6IGZpeCBsYXp5IGRpc2FibGUNCg0K
SGVsbG8gS2VlcnRoeSwNCg0KT24gTW9uLCBTZXAgMDIsIDIwMjQgYXQgMDI6MDg6MzBQTSArMDIw
MCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4gT24gV2VkLCBBdWcgMjgsIDIwMjQgYXQg
MzozMuKAr1BNIFBhcnRoIFBhbmNob2xpIDxwYXJ0aDEwNTEwNUBnbWFpbC5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gRnJvbTogRW1hbnVlbGUgR2hpZG9saSA8ZW1hbnVlbGUuZ2hpZG9saUB0b3JhZGV4
LmNvbT4NCj4gPg0KPiA+IE9uIGEgZmV3IHBsYXRmb3JtcyBzdWNoIGFzIFRJJ3MgQU02OSBkZXZp
Y2UsIGRpc2FibGVfaXJxKCkNCj4gPiBmYWlscyB0byBrZWVwIHRyYWNrIG9mIHRoZSBpbnRlcnJ1
cHRzIHRoYXQgaGFwcGVuIGJldHdlZW4NCj4gPiBkaXNhYmxlX2lycSgpIGFuZCBlbmFibGVfaXJx
KCkgYW5kIHRob3NlIGludGVycnVwdHMgYXJlIG1pc3NlZC4NCj4gPiBVc2UgdGhlIC0+aXJxX3Vu
bWFzaygpIGFuZCAtPmlycV9tYXNrKCkgbWV0aG9kcyBpbnN0ZWFkDQo+ID4gb2YgLT5pcnFfZW5h
YmxlKCkgYW5kIC0+aXJxX2Rpc2FibGUoKSB0byBjb3JyZWN0bHkga2VlcCB0cmFjayBvZg0KPiA+
IGVkZ2VzIHdoZW4gZGlzYWJsZV9pcnEgaXMgY2FsbGVkLg0KPiA+IFRoaXMgc29sdmVzIHRoZSBp
c3N1ZSBvZiBkaXNhYmxlX2lycSgpIG5vdCB3b3JraW5nIGFzIGV4cGVjdGVkDQo+ID4gb24gc3Vj
aCBwbGF0Zm9ybXMuDQo+ID4NCj4gPiBGaXhlczogMjMyNjU0NDJiMDJiICgiQVJNOiBkYXZpbmNp
OiBpcnFfZGF0YSBjb252ZXJzaW9uLiIpDQo+ID4gU2lnbmVkLW9mZi1ieTogRW1hbnVlbGUgR2hp
ZG9saSA8ZW1hbnVlbGUuZ2hpZG9saUB0b3JhZGV4LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQ
YXJ0aCBQYW5jaG9saSA8cGFydGgucGFuY2hvbGlAdG9yYWRleC5jb20+DQo+ID4gQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiAtLS0NCj4gDQo+IEl0IGxvb2tzIGdvb2QgdG8gbWUgYnV0
IEknZCBsaWtlIHRvIGhhdmUgYW4gQWNrIGZyb20gS2VlcnRoeSBvbiB0aGlzLg0KDQpLZWVydGh5
LCBqdXN0IGEgZ2VudGxlIHBpbmcgb24gdGhpcywgY2FuIHlvdSBoZWxwPw0KDQo+IEFja2VkLWJ5
OiBLZWVydGh5IDxqLWtlZXJ0aHlAdGkuY29tPg0KDQpGcmFuY2VzY28NCg0K

