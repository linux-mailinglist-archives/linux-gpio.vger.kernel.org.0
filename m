Return-Path: <linux-gpio+bounces-15078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EA8A2036C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2025 04:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C0D61658F5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2025 03:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4735619408C;
	Tue, 28 Jan 2025 03:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="eOOt/raD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9203518BC3F
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jan 2025 03:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738035834; cv=none; b=JLhJlWY38kS6UBVL7eRIpPl0GmeAEkWYreZ4HCAiva3TJCTr9sx80imGO2HymNlEvM2klFE/7chNoQWkTVCXNTmb8LJzwNP66PE4Sh/jMNLnG5L6Dc/XIWyjVwpWCiEwfwgNM+Oip8yl4YLMCAHsadUEANL7LXc/cuTQoTatI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738035834; c=relaxed/simple;
	bh=7HNIW9W1O90CkXMig+gfZfkp0HF6QISO9ozkkRf0U3k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GyhUWlpDf6I7QK2OR402NCnPfbzrxXDjT80ClaymcnLzCo7q/CrjMhglvOD0DavkcLQG3CKffCwQe7j1lsm0/M6wPK5lpjx35llPunFevn3PbUznq+BsJHZEbAkndWpyyn0mB0/gKElAPx9kxJAHufFPmAtSZyy/eqAOztGmNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=eOOt/raD; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0F3462C07BD;
	Tue, 28 Jan 2025 16:43:41 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738035821;
	bh=7HNIW9W1O90CkXMig+gfZfkp0HF6QISO9ozkkRf0U3k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=eOOt/raDTdn6VbeuRDbKEOMB9sFW8TrHHO0CO9rxOCleLzv9qxFF9ajoHell8o/hH
	 wAcVLQNIKgJBOZaEYjpq1yMQaBchgxNi3nojiOHPHk3s7gbRkixbm/6CDC4xYn1mQ+
	 o4kd/K/GCT8CVKz0NW3D0lxze4cqrxUDHG4mmUiFUbzkmFd/jCSIXR8iFEe9YMyqCl
	 /Bk2sFG+L0bGJxjuHVqLeXFWu9jdcBhPOfp4iC+oyu2g3JXUPy2XfH1fZmRiGaGBI8
	 TmMPRZpF180/7kdeICb6A39sqTe1ohMlL89o2/nDjYdpH7maqXNHa1iBrBZpfgzGBL
	 Llo0VetKSTKtw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6798526c0001>; Tue, 28 Jan 2025 16:43:40 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 28 Jan 2025 16:43:40 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Tue, 28 Jan 2025 16:43:40 +1300
From: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
	"lakabd.work@gmail.com" <lakabd.work@gmail.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"abderrahim.lakbir@actia.fr" <abderrahim.lakbir@actia.fr>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
Thread-Topic: [PATCH] gpio: pca953x: Improve interrupt support
Thread-Index: AQHat8IKrnq78xh9RkCOMGJXNt7JBLG82EyAgAJjhoCBVohgAIAAwfAAgABm1YCACqNigIAJRZSAgAFORAA=
Date: Tue, 28 Jan 2025 03:43:40 +0000
Message-ID: <9bcfe1f204013708c7ea0fb4c1392004ad34c3ac.camel@alliedtelesis.co.nz>
References: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
	 <20250113220221.13545-1-koute102030@gmail.com>
	 <CAHp75VeLyacKo3rY5iyq+kZnLjEQsBN2eOJExHrqHuesaVyTQQ@mail.gmail.com>
	 <CAHN=yabQB5jYDd9iQ7s1dMWTScRf3c_zuNtXL8U283+vvenfNA@mail.gmail.com>
	 <CAHN=yaaZ3L23JbsQ+fugG-iXdtt9dOss0pe7yT5EG029nsfXFQ@mail.gmail.com>
	 <CAHp75VdCwyJhYD9rtxf8H5mi5AfcPOhvSYx2MOqw3==3mnxoSg@mail.gmail.com>
In-Reply-To: <CAHp75VdCwyJhYD9rtxf8H5mi5AfcPOhvSYx2MOqw3==3mnxoSg@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <84D7805E5CA65F42A8060B697D75E5E3@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=R9GgGsRX c=1 sm=1 tr=0 ts=6798526c a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=q-99K_eqv_YA:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=pGLkceISAAAA:8 a=MN9ZA6XBkk6C8DiVUt0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=xNI9KcAJwtLuEY7SXz16:22
X-SEG-SpamProfiler-Score: 0

T24gTW9uLCAyMDI1LTAxLTI3IGF0IDA5OjQ3ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0IDEyOjEy4oCvUE0gbGFrYWJkIDxsYWthYmQud29y
a0BnbWFpbC5jb20+IHdyb3RlOg0KPiA+IExlIG1hci4gMTQgamFudi4gMjAyNSDDoCAxNjo0NCwg
d29yayB3b3JrIDxsYWthYmQud29ya0BnbWFpbC5jb20+IGENCj4gPiDDqWNyaXQgOg0KPiA+ID4g
TGUgbWFyLiAxNCBqYW52LiAyMDI1IMOgIDEwOjM3LCBBbmR5IFNoZXZjaGVua28NCj4gPiA+IDxh
bmR5LnNoZXZjaGVua29AZ21haWwuY29tPiBhIMOpY3JpdCA6DQo+ID4gPiA+IE9uIFR1ZSwgSmFu
IDE0LCAyMDI1IGF0IDEyOjAz4oCvQU0gbGFrYWJkIDxsYWthYmQud29ya0BnbWFpbC5jb20+DQo+
ID4gPiA+IHdyb3RlOg0KPiANCj4gLi4uLg0KPiANCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogU3RvcmUgaXJxX21h
c2sgZm9yIGxhdGVyIHVzZQ0KPiA+ID4gPiA+IHdoZW4gY2hlY2tpbmcgcGVuZGluZyBJUlFzICov
DQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJpdG1hcF9vcihjaGlwLQ0KPiA+ID4gPiA+ID51bm1hc2tlZF9pbnRlcnJ1
cHRzLCBjaGlwLT51bm1hc2tlZF9pbnRlcnJ1cHRzLCBjaGlwLT5pcnFfbWFzaywNCj4gPiA+ID4g
PiBnYy0+bmdwaW8pOw0KPiA+ID4gPiANCj4gPiA+ID4gVGhpcyBzb2x1dGlvbiBoYXMgYSBmbGF3
LiBXaGVyZSBpcyBhbnkgY29kZSB0aGF0IGNsZWFycyB0aGlzIG5ldw0KPiA+ID4gPiBiaXRtYXA/
IFRoZSBjb2RlIHN0YXJ0cyB3aXRoIDAgKG9idmlvdXNseSkgYW5kIHN0ZXAgYnkgc3RlcCBpdCBn
ZXRzDQo+ID4gPiA+IHNhdHVyYXRlZCB0byBhbGwtMXMuDQo+ID4gPiANCj4gPiA+IFllcyBpbmRl
ZWQsIGFuZCBhY3R1YWxseSB0aGUgbmV3IGJpdG1hcCBpcyBub3QgbmVjZXNzYXJ5IGF0IGFsbA0K
PiA+ID4gYmVjYXVzZSB3aGF0IHdlIG5lZWQgZG9lcyBhbHJlYWR5IGV4aXN0IHdoaWNoIGlzIGNo
aXAtPmlycV9tYXNrIChJDQo+ID4gPiBub3RpY2VkIGl0IGp1c3Qgbm93ISkuDQo+ID4gPiBjaGlw
LT5pcnFfbWFzayBpcyB1cGRhdGVkIHdoZW5ldmVyIGEgcGluIGlzIG1hc2tlZCBvciB1bm1hc2tl
ZCB2aWENCj4gPiA+IHBjYTk1M3hfaXJxX21hc2soKSBhbmQgcGNhOTUzeF9pcnFfdW5tYXNrKCku
DQo+ID4gPiANCj4gPiA+IFRoZSBzb2x1dGlvbiBzaG91bGQgbG9vayBsaWtlIHRoaXM6DQo+ID4g
PiANCj4gPiA+IGRpZmYgLS1naXQgYS9ncGlvLXBjYTk1M3guYyBiL2dwaW8tcGNhOTUzeC5jDQo+
ID4gPiBpbmRleCAyNzJmZWJjLi4yOWU4YzIwIDEwMDY0NA0KPiA+ID4gLS0tIGEvZ3Bpby1wY2E5
NTN4LmMNCj4gPiA+ICsrKyBiL2dwaW8tcGNhOTUzeC5jDQo+ID4gPiBAQCAtODQyLDExICs4NDIs
NiBAQCBzdGF0aWMgYm9vbCBwY2E5NTN4X2lycV9wZW5kaW5nKHN0cnVjdA0KPiA+ID4gcGNhOTUz
eF9jaGlwICpjaGlwLCB1bnNpZ25lZCBsb25nICpwZW5kaW4NCj4gPiA+IMKgIGludCByZXQ7DQo+
ID4gPiANCj4gPiA+IMKgIGlmIChjaGlwLT5kcml2ZXJfZGF0YSAmIFBDQV9QQ0FMKSB7DQo+ID4g
PiAtIC8qIFJlYWQgdGhlIGN1cnJlbnQgaW50ZXJydXB0IHN0YXR1cyBmcm9tIHRoZSBkZXZpY2Ug
Ki8NCj4gPiA+IC0gcmV0ID0gcGNhOTUzeF9yZWFkX3JlZ3MoY2hpcCwgUENBTDk1M1hfSU5UX1NU
QVQsIHRyaWdnZXIpOw0KPiA+ID4gLSBpZiAocmV0KQ0KPiA+ID4gLSByZXR1cm4gZmFsc2U7DQo+
ID4gPiAtDQo+ID4gPiDCoCAvKiBDaGVjayBsYXRjaGVkIGlucHV0cyBhbmQgY2xlYXIgaW50ZXJy
dXB0IHN0YXR1cyAqLw0KPiA+ID4gwqAgcmV0ID0gcGNhOTUzeF9yZWFkX3JlZ3MoY2hpcCwgY2hp
cC0+cmVncy0+aW5wdXQsIGN1cl9zdGF0KTsNCj4gPiA+IMKgIGlmIChyZXQpDQo+ID4gPiBAQCAt
ODU1LDcgKzg1MCw3IEBAIHN0YXRpYyBib29sIHBjYTk1M3hfaXJxX3BlbmRpbmcoc3RydWN0DQo+
ID4gPiBwY2E5NTN4X2NoaXAgKmNoaXAsIHVuc2lnbmVkIGxvbmcgKnBlbmRpbg0KPiA+ID4gwqAg
LyogQXBwbHkgZmlsdGVyIGZvciByaXNpbmcvZmFsbGluZyBlZGdlIHNlbGVjdGlvbiAqLw0KPiA+
ID4gwqAgYml0bWFwX3JlcGxhY2UobmV3X3N0YXQsIGNoaXAtPmlycV90cmlnX2ZhbGwsIGNoaXAt
PmlycV90cmlnX3JhaXNlLA0KPiA+ID4gY3VyX3N0YXQsIGdjLT5uZ3Bpbyk7DQo+ID4gPiANCj4g
PiA+IC0gYml0bWFwX2FuZChwZW5kaW5nLCBuZXdfc3RhdCwgdHJpZ2dlciwgZ2MtPm5ncGlvKTsN
Cj4gPiA+ICsgYml0bWFwX2FuZChwZW5kaW5nLCBuZXdfc3RhdCwgY2hpcC0+aXJxX21hc2ssIGdj
LT5uZ3Bpbyk7DQo+ID4gPiANCj4gPiA+IMKgIHJldHVybiAhYml0bWFwX2VtcHR5KHBlbmRpbmcs
IGdjLT5uZ3Bpbyk7Pg0KPiANCj4gPiA+IMKgIH0NCj4gPiANCj4gPiBIaSBBbmR5LCBkbyB5b3Ug
aGF2ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbnMgcmVnYXJkaW5nIHRoZSBwcm9wb3NlZCBmaXggPw0K
PiANCj4gQ3VycmVudGx5IEknbSByZWFkaW5nIHRoZSBkYXRhc2hlZXQgdG8gdW5kZXJzdGFuZCBo
b3cgdGhlIGNoaXANCj4gYWN0dWFsbHkgd29ya3MuIEknbGwgY29tZSBiYWNrIHRvIHlvdSBzb29u
Lg0KPiANCj4gTmV2ZXJ0aGVsZXNzLCBJIHdvdWxkIGxpa2UgdG8gaGVhciBmcm9tIE1hcmsgaWYg
eW91ciBwYXRjaCBmaXhlcyB0aGUNCj4gaXNzdWUuIFByZWxpbWluYXJ5IEkgY2FuIHNheSB0aGF0
IGl0IGxvb2tzIGxpa2Ugd2UgbmVlZCBzbGlnaHRseQ0KPiBkaWZmZXJlbnQgYW5kIG1vcmUgY29t
cGxleCBsb2dpYyB0aGVyZS4NCg0KVGhpcyBwYXRjaCB3aWxsIG5vdCBtaXNzIGludGVycnVwdHMs
IGJ1dCBJIGJlbGlldmUgd2lsbCB0cmlnZ2VyIGZhbHNlDQppbnRlcnJ1cHRzLCBhcyBhbiBpbnB1
dCB3aWxsIGJlaGF2ZSBtb3JlIGxpa2UgYSBsZXZlbCB0cmlnZ2VyZWQgaW50ZXJydXB0DQppZiBv
dGhlciBpbnB1dHMgYXJlIHRyaWdnZXJpbmcgaW50ZXJydXB0cyBvbiB0aGUgZGV2aWNlLiBJIHdv
dWxkIHByZWZlcg0KdGhhdCB3ZSBqdXN0IHJlbW92ZSB0aGUgc3BlY2lhbCBQQ0FfUENBTCBibG9j
ayBpbiB0aGlzIGZ1bmN0aW9uLCB3aGljaA0Kd2FzIG15IHNpbXBsZSBzb2x1dGlvbi4NCg0K

