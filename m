Return-Path: <linux-gpio+bounces-7288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB763901878
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 00:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DC9F1F211D0
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2024 22:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A513C54673;
	Sun,  9 Jun 2024 22:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="uAP0Kik5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF621CD00
	for <linux-gpio@vger.kernel.org>; Sun,  9 Jun 2024 22:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717971220; cv=none; b=u4P3TXLK0Z6wBwlhrn/3vxARYNV8HMx0JQS5V9teqdbr/1q+4WhLrkxszun8ZrvHQn72mCbG1uQ0rkjtXumUv4diy1/9zCrWIXI5TPaPd3cDJhv14KIgMLZtBOBnFfLwjar0pv3zS+HL1VscRT6I/safD+1bN1qHspignpcLsmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717971220; c=relaxed/simple;
	bh=hbL/pdZIv5Dp0rCVGhg8oan6rPug4SJHwJnZVrisT2g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UeVD1TNTAf/ErADD1IrMHZTsRFRAgV9S3Da2wsjRFP65uJ1H8nbxoj+6dXm701lp1rUa1c0C6eT0+1e54OmXLbc0dgNS1iGM49QKrvP0MZF/tKxaAbNlyR3z4GO1u6+A3yKjzjiXYfYLPiisMXt48YmfpsS3eDQffAVCaPENyS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=uAP0Kik5; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AD0422C08BD;
	Mon, 10 Jun 2024 10:13:28 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1717971208;
	bh=hbL/pdZIv5Dp0rCVGhg8oan6rPug4SJHwJnZVrisT2g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=uAP0Kik559ZH9Wc3yJGsVD/3ed0OsFSq5pnQH87QjSBZfULdH0TxLPSw9Iz/aJlqC
	 OzSqe7R/r6B6CRWzUQQwhbVDNwSf1LrTYyiRkl/CjUaMGIclWgAZunjktTeoO5b6CZ
	 fqhxlGIuVO2TqGanvS9HU8sUAFqgdNh7aEdV3wawUAZGePlj+jVlRcdiRVe+P9hJUg
	 E9OTkd8tCJZXD5ND/IfsQXUVBKKUx6mF2DzvAPt7UzERN+XgdeoDzn/mZKgyLrdYVT
	 /E3jo90Qck8DfITddmyLQYTZ3Fprfo1kkZYD/ZzqHwrFCUSYEUNmDxfwn7kNY77FTX
	 +sNqWOR/tFlNA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B666629080001>; Mon, 10 Jun 2024 10:13:28 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 10 Jun 2024 10:13:28 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Mon, 10 Jun 2024 10:13:28 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 10 Jun 2024 10:13:28 +1200
From: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
Thread-Topic: [PATCH] gpio: pca953x: Improve interrupt support
Thread-Index: AQHat8IKrnq78xh9RkCOMGJXNt7JBLG82EyAgAJjhoA=
Date: Sun, 9 Jun 2024 22:13:27 +0000
Message-ID: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
References: <20240606033102.2271916-1-mark.tomlinson@alliedtelesis.co.nz>
	 <ZmQoCwLFuJNyuRG6@surfacebook.localdomain>
In-Reply-To: <ZmQoCwLFuJNyuRG6@surfacebook.localdomain>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <F331E2EA68419549A37805A254B08F2C@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F9L0dbhN c=1 sm=1 tr=0 ts=66662908 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=KE40CbAq34oA:10 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=UDBL-DoJI6aJ5C6zNTwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

T24gU2F0LCAyMDI0LTA2LTA4IGF0IDEyOjQ0ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IFRodSwgSnVuIDA2LCAyMDI0IGF0IDAzOjMxOjAyUE0gKzEyMDAsIE1hcmsgVG9tbGluc29u
IGtpcmpvaXR0aToNCj4gPiBUaGUgR1BJTyBkcml2ZXJzIHdpdGggbGF0Y2ggaW50ZXJydXB0IHN1
cHBvcnQgKHR5cGljYWxseSB0eXBlcyBzdGFydGluZw0KPiA+IHdpdGggUENBTCkgaGF2ZSBpbnRl
cnJ1cHQgc3RhdHVzIHJlZ2lzdGVycyB0byBkZXRlcm1pbmUgd2hpY2gNCj4gPiBwYXJ0aWN1bGFy
DQo+ID4gaW5wdXRzIGhhdmUgY2F1c2VkIGFuIGludGVycnVwdC4gVW5mb3J0dW5hdGVseSB0aGVy
ZSBpcyBubyBhdG9taWMNCj4gPiBvcGVyYXRpb24gdG8gcmVhZCB0aGVzZSByZWdpc3RlcnMgYW5k
IGNsZWFyIHRoZSBpbnRlcnJ1cHQuIENsZWFyaW5nIHRoZQ0KPiA+IGludGVycnVwdCBpcyBkb25l
IGJ5IHJlYWRpbmcgdGhlIGlucHV0IHJlZ2lzdGVycy4NCj4gDQo+IFdoYXQgeW91IGFyZSBkZXNj
cmliaW5nIHNvdW5kcyB0byBtZSBsaWtlIHRoZSBjYXNlIHdpdGhvdXQgbGF0Y2ggZW5hYmxlZC4N
Cj4gQ2FuIHlvdSBlbGFib3JhdGUgYSBiaXQgbW9yZT8NCg0KVGhlIGxhdGNoIGlzIHVzZWZ1bCB3
aGVuIGFuIGlucHV0IGNoYW5nZXMgc3RhdGUsIGJ1dCBjaGFuZ2VzIGJhY2sgYWdhaW4NCmJlZm9y
ZSB0aGUgaW5wdXQgaXMgcmVhZC4gVXNpbmcgdGhlIGxhdGNoIGNhdXNlcyB0aGUgaW5wdXQgcmVn
aXN0ZXIgdG8gc2hvdw0Kd2hhdCBjYXVzZWQgdGhlIGludGVycnVwdCwgcmF0aGVyIHRoYW4gdGhl
IGN1cnJlbnQgc3RhdGUgb2YgdGhlIHBpbi4NCg0KVGhlIHByb2JsZW0gSSBoYXZlIGlzIG5vdCBy
ZWxhdGVkIHRvIHRoZSBsYXRjaCBhcyB0aGUgaW5wdXRzIGFyZSBub3QNCmNoYW5naW5nIGJhY2sg
dG8gdGhlaXIgb3JpZ2luYWwgc3RhdGUuIEkgaGF2ZSB0d28gaW5wdXRzIHdoaWNoIGNoYW5nZSBz
dGF0ZQ0KYXQgYWxtb3N0IHRoZSBzYW1lIHRpbWUuIFdoZW4gdGhlIGZpcnN0IGlucHV0IGNoYW5n
ZXMgc3RhdGUsIGFuIGludGVycnVwdA0Kb2NjdXJzLiBQcmlvciB0byBteSBwYXRjaCwgdGhlIGlu
dGVycnVwdCBzdGF0dXMgcmVnaXN0ZXIgd2FzIHJlYWQsIGFuZCBvbmx5DQp0aGlzIG9uZSBpbnRl
cnJ1cHQgaXMgc2hvd24gYXMgcGVuZGluZy4gVGhlIHNlY29uZCBpbnB1dCBjaGFuZ2VzIHN0YXRl
DQpiZXR3ZWVuIHJlYWRpbmcgdGhlIGludGVycnVwdCBzdGF0dXMgYW5kIHJlYWRpbmcgdGhlIGlu
cHV0ICh3aGljaCBjbGVhcnMNCmJvdGggaW50ZXJydXB0IHNvdXJjZXMpLiBTbyBJIG9ubHkgZ2V0
IHRoZSBvbmUgaW50ZXJydXB0IGFuZCBub3QgYm90aC4NCg0KPiA+IFRoZSBjb2RlIHdhcyByZWFk
aW5nIHRoZSBpbnRlcnJ1cHQgc3RhdHVzIHJlZ2lzdGVycywgYW5kIHRoZW4gcmVhZGluZw0KPiA+
IHRoZSBpbnB1dCByZWdpc3RlcnMuIElmIGFuIGlucHV0IGNoYW5nZWQgYmV0d2VlbiB0aGVzZSB0
d28gZXZlbnRzIGl0DQo+ID4gd2FzDQo+ID4gbG9zdC4NCj4gDQo+IEkgZG9uJ3Qgc2VlIGhvdy4g
SWYgdGhlcmUgaXMgYSBzaG9ydCBwdWxzZSBvciBhIHNlcmllcyBvZiBwdWxzZXMgYmV0d2Vlbg0K
PiBpbnRlcnJ1cHQgbGF0Y2hpbmcgYW5kIGlucHV0IHJlYWRpbmcsIHRoZSBzZWNvbmQrIHdpbGwg
YmUgbG9zdCBpbiBhbnkNCj4gY2FzZS4NCj4gVGhpcyBpcyBIVyBsaW1pdGF0aW9uIGFzIGZhciBh
cyBJIGNhbiBzZWUuDQoNCkkgZmVlbCB5b3UncmUgdGhpbmtpbmcgb2YgdGhlIHNpbmdsZSBpbnB1
dCBwaW4gY2FzZS4gVGhlcmUgaXMgbm8gaXNzdWUgd2l0aA0KYSBzaW5nbGUgcGluIHB1bHNpbmcg
YXMgdGhlIGxhdGNoIHdpbGwga2VlcCB0aGUgdmFsdWUgd2hpY2ggY2F1c2VkIHRoZQ0KaW50ZXJy
dXB0IHVudGlsIGl0IGlzIHJlYWQuIFRoZSBpbnRlcnJ1cHQgc3RhdHVzIHJlZ2lzdGVyIHdpbGwg
aGF2ZSB0aGUNCmNvcnJlY3QgdmFsdWUgdG9vLg0KPiANCj4gPiBUaGUgc29sdXRpb24gaW4gdGhp
cyBwYXRjaCBpcyB0byByZXZlcnQgdG8gdGhlIG5vbi1sYXRjaCB2ZXJzaW9uIG9mDQo+ID4gY29k
ZSwgaS5lLiByZW1lbWJlcmluZyB0aGUgcHJldmlvdXMgaW5wdXQgc3RhdHVzLCBhbmQgbG9va2lu
ZyBmb3IgdGhlDQo+ID4gY2hhbmdlcy4gVGhpcyBzeXN0ZW0gcmVzdWx0cyBpbiBubyBtb3JlIEky
QyB0cmFuc2ZlcnMsIHNvIGlzIG5vIHNsb3dlci4NCj4gPiBUaGUgbGF0Y2ggcHJvcGVydHkgb2Yg
dGhlIGRldmljZSBzdGlsbCBtZWFucyBpbnRlcnJ1cHRzIHdpbGwgc3RpbGwgYmUNCj4gPiBub3Rp
Y2VkIGlmIHRoZSBpbnB1dCBjaGFuZ2VzIGJhY2sgdG8gaXRzIGluaXRpYWwgc3RhdGUuDQo+IA0K
PiBBZ2FpbiwgY2FuIHlvdSBlbGFib3JhdGU/IElzIGl0IGEgcmVhbCB1c2UgY2FzZT8gSWYgc28s
IGNhbiB5b3UgcHJvdmlkZQ0KPiB0aGUNCj4gY2hhcnQgb2YgdGhlIHBpbiBzZ2luYWxsaW5nIGFn
YWluc3QgdGhlIHRpbWUgbGluZSBhbmQgZGVwaWN0IHdoZXJlIHRoZQ0KPiBwcm9ibGVtDQo+IGlz
Pw0KDQpZZXMsIHRoaXMgaXMgcmVhbC4gSG9wZWZ1bGx5IHRoZSBhYm92ZSBkZXNjcmlwdGlvbiBl
eHBsYWlucyB3aGF0IHdlJ3JlDQpzZWVpbmcsIGJ1dCBhcyBhIHBpY3R1cmUgaXMgd29ydGggMTAw
MCB3b3JkcywgaGVyZSdzIGEgdGltZWxpbmU6DQoNCiAgICAgICAgLS0tLS0tLS0rDQpJbnB1dCAx
ICAgICAgICAgfA0KICAgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCiAgICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSsNCklucHV0IDIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0t
DQogICAgICAgIC0tLS0tLS0tKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAr
LS0tLS0tLQ0KSVJRICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfA0KICAgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tKw0KDQpJbnRlcnJ1cHQgc3RhdHVzICAgICAgICAgICAgICAqDQpSZWdpc3RlciBSZWFk
DQoNCklucHV0IFJlZ2lzdGVyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICoNClJlYWQNCg0KTm90ZSB0aGF0IHRoZSBpbnRlcnJ1cHQgc3RhdHVzIHJlYWQgb25seSBzZWVz
IG9uZSBldmVudCwgYnV0IGJvdGggYXJlDQpjbGVhcmVkIGxhdGVyLiBBcyB0aGVzZSB0d28gcmVh
ZHMgYXJlIEkyQyBidXMgdHJhbnNmZXJzLCB0aGV5IGFyZSBtb3JlIHRoYW4NCjEwMMK1cyBhcGFy
dCwgc28gdGhpcyBldmVudCBvY2N1cnMgcXVpdGUgZnJlcXVlbnRseSBpbiBvdXIgc3lzdGVtLg0K
DQoNClRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoaXMuDQpCZXN0IFJlZ2FyZHMsDQoNCg==

