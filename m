Return-Path: <linux-gpio+bounces-32799-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IILGjKQrmnVGAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32799-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:17:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA6236004
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6ED4B301991E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 09:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F5933B6E3;
	Mon,  9 Mar 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="N7fFowUQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AFE24DCF9;
	Mon,  9 Mar 2026 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047750; cv=none; b=YAWjxQNgB5xR/ZoC9dYrJ9b80mICrEetlSYAMFTbVrywGRulZdA/vSY3q2DnALDWMgWZFa4zfcl8BQcaHHoxmxmp6tQMiJ5sLJTqj/XglNf3+WGdP3beS5WHUeJFAXyxgw+7d9WOo88A8SZp3uvcXr836RhL6qjO/h0JieZNx/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047750; c=relaxed/simple;
	bh=JgjMfWaODspJLnY+C6cx+a77p1z5R63MX8u70I4pM70=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=atoqchGddGnBlOI+Rd3AAKH/g6mqHm1lI9314YQGvgUwJYDA9WdUrEknGQAKlZni09eUctWKbfumPoEff47ONKLL+ULZyEwIJvqjy1KvFTETtjtr2h81zG438NrSi64GgMPVb/z25gT8f5JrSyq2oBfU7cH9jJFxrHWRCgobKDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=N7fFowUQ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6299CnnvE261338, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773047569; bh=JgjMfWaODspJLnY+C6cx+a77p1z5R63MX8u70I4pM70=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=N7fFowUQ3mQeqTSFgo4jQBDcSvxnLdDmNjiqxUPqdZxOGBW8q2R9i46IraMQjxdTp
	 NpBStgYteoqLJsAwJamsiGjjWt9b0jFj/8gNwMe0XQwIankiytgqwd41+nDIyzDR1Z
	 0Q1KGkFujUdNpZu9Mo57pUOubFvY8lHOLXkS2ZlsmJb03PF8tjBnjWV4A98dFqTe1c
	 VKc14SMyapJvxN8oQ4dCY40lrNORNYxj9oeoHoX+uhmczlbmN8PW0QlOelWVJafPee
	 K+DURJbggU6TW9i4XWdYnF93PmguecBWz2vhEmQJ9md8VesMlL7Db8jodUA1x7p7m4
	 OhkTDDyYYe5Bw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6299CnnvE261338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 17:12:49 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 17:12:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 9 Mar 2026 17:12:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 9 Mar 2026 17:12:49 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linusw@kernel.org" <linusw@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "bartosz.golaszewski@oss.qualcomm.com"
	<bartosz.golaszewski@oss.qualcomm.com>,
        "afaerber@suse.com"
	<afaerber@suse.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
	<cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
	<stanley_chang@realtek.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>
Subject: RE: [PATCH v2 07/14] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Thread-Topic: [PATCH v2 07/14] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Thread-Index: AQHcrT45a/bUsKCH9kyRea3Awrcd97WigcSAgANtK/A=
Date: Mon, 9 Mar 2026 09:12:49 +0000
Message-ID: <74152b7e8de7470dac6555ef22e6bc64@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-8-eleanor.lin@realtek.com>
 <20260307-astonishing-helpful-grouse-b7e968@quoll>
In-Reply-To: <20260307-astonishing-helpful-grouse-b7e968@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: E2CA6236004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32799-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[realtek.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

PiBPbiBGcmksIE1hciAwNiwgMjAyNiBhdCAwMzo1MjozN1BNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiBGcm9tOiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4gPg0K
PiA+IEFkZCBhIGdlbmVyaWMgcGluIGNvbmZpZ3VyYXRpb24gcHJvcGVydHkgImlucHV0LXZvbHRh
Z2UtbWljcm92b2x0IiB0bw0KPiA+IHNwZWNpZnkgdGhlIGlucHV0IHZvbHRhZ2UgbGV2ZWwgb2Yg
YSBwaW4gaW4gbWljcm92b2x0cy4NCj4gDQo+IFdoeT8NCj4gDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4gPiBDby1kZXZlbG9wZWQt
Ynk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRlay5jb20+DQo+ID4gLS0tDQo+ID4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmNmZy1ub2RlLnlh
bWwgfCA0ICsrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvcGluY2ZnLW5vZGUueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BpbmN0cmwvcGluY2ZnLW5vZGUueWFtbA0KPiA+IGluZGV4IGE5MTZkMGZjNzlhOS4u
ZGExODJjOGExZDAwIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3BpbmNmZy1ub2RlLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jZmctbm9kZS55YW1sDQo+ID4gQEAgLTE2
Miw2ICsxNjIsMTAgQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgdGhpcyBhZmZlY3RzIHRoZSBl
eHBlY3RlZCBkZWxheSBpbiBwcyBiZWZvcmUgbGF0Y2hpbmcgYSB2YWx1ZSB0bw0KPiA+ICAgICAg
ICBhbiBvdXRwdXQgcGluLg0KPiA+DQo+ID4gKyAgaW5wdXQtdm9sdGFnZS1taWNyb3ZvbHQ6DQo+
ID4gKyAgICBkZXNjcmlwdGlvbjogU3BlY2lmaWVzIHRoZSBpbnB1dCB2b2x0YWdlIGxldmVsIG9m
IHRoZSBwaW4gaW4gbWljcm92b2x0cy4NCj4gPiArICAgICAgVGhpcyBkZWZpbmVzIHRoZSByZWZl
cmVuY2UgZm9yIFZJSC9WSUwuDQo+IA0KPiBXaGF0IGlzIFZJSC9WSUw/IFdoeSBnZW5lcmljIGJp
bmRpbmcgd291bGQgZGVmaW5lIHRoZSB2b2x0YWdlIG9mIHBpbnMgZm9yIHBpbg0KPiBjb250cm9s
Pw0KPiANCj4gVGhpcyBwYXRjaCBtaXNzZXMgYWN0dWFsIGJhY2tncm91bmQgd2h5IHlvdSBhcmUg
ZG9pbmcgaXQgYW5kIHdoYXQgc29ydCBvZg0KPiBjb21tb24vdHlwaWNhbCBwaW5jdHJsIHNldHVw
IHlvdSBkZXNjcmliZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCkFncmVl
ZCwgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBkZXNjcmlwdGlvbiBsYWNrZWQgc3VmZmljaWVudCBj
b250ZXh0LiBJDQp3aWxsIGltcHJvdmUgdGhlIGV4cGxhbmF0aW9uIGluIHYzLg0KDQpWSUggaXMg
SW5wdXQgSGlnaCBWb2x0YWdlLCBhbmQgVklMIGlzIElucHV0IExvdyBWb2x0YWdlLg0KDQpUaGUg
cmVhc29uIGZvciBpbnRyb2R1Y2luZyAnaW5wdXQtdm9sdGFnZS1taWNyb3ZvbHQnIGluICdwaW5j
Zmctbm9kZS55YW1sJyBpcw0KdG8gc3VwcG9ydCBoYXJkd2FyZSBkZXNpZ25zIHdoZXJlIHRoZSAi
SW5wdXQgTG9naWMgVGhyZXNob2xkIiBpcyBkZWNvdXBsZWQNCmZyb20gdGhlICJQb3dlciBTdXBw
bHkgVm9sdGFnZSIuDQoNCkZvciBleGFtcGxlLCBhIHBpbiBtaWdodCBiZSBwb3dlcmVkIGJ5IGEg
Zml4ZWQgMy4zViBzdXBwbHkgYnV0IG5lZWRzIHRvIGJlDQpjb25maWd1cmVkIHRvIGFjY2VwdCAx
LjhWIGxvZ2ljIHNpZ25hbHMuIFRoaXMgcHJvcGVydHkgYWxsb3dzIHRoZSBwaW5jdHJsDQpkcml2
ZXIgdG8gc2V0IHRoZSBjb3JyZWN0IGludGVybmFsIHJlZmVyZW5jZS4NCg0KVGhpcyBjaGFuZ2Ug
Zm9sbG93cyB0aGUgc3VnZ2VzdGlvbiBmcm9tIExpbnVzIFdhbGxlaWogWzFdIHRvIG1ha2UgdGhl
IHByb3BlcnR5DQpnZW5lcmljIGluc3RlYWQgb2YgdmVuZG9yLXNwZWNpZmljICgncmVhbHRlayxp
bnB1dC12b2x0YWdlJyksIGFzIHRoZSBjb25jZXB0DQpvZiBzZWxlY3RpbmcgaW5wdXQgdGhyZXNo
b2xkcyBpcyBub3QgdW5pcXVlIHRvIFJlYWx0ZWsuDQoNClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL2Q1YmUzNTdjMTRiODQxNTVhZGZhOGE5ZjAwYTY0ZDgzQHJlYWx0ZWsuY29tLw0K
DQpCZXN0IHJlZ2FyZHMsDQpZdS1DaHVuDQo=

