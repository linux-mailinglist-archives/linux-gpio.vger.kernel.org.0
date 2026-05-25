Return-Path: <linux-gpio+bounces-37459-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id x4NWBLFGFGrzLwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37459-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:55:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0AE5CAC3E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E51BB30143F1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 12:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41DD383339;
	Mon, 25 May 2026 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="goLKnkLg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF037FF53;
	Mon, 25 May 2026 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713709; cv=none; b=Ei4/WIQuabQxiU3kdF2VIdVkWgm+X4U5jK0eKvxXfEZzAN1m3fBytK5GHnjsOLP4tFLQeqLiZQsJkk8Mm3UeKfI4AspqAkMqk8OGQEbOSWGuUjKntok9WEc6V+i+Udi6/HbwmgFuSqTAx8enxFwx2KmMl+G1mdblTy3dIuD40T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713709; c=relaxed/simple;
	bh=Dobp+8XPRNGUvZqXv7EUCJ4nA2PN4VPudIxcDeZbQb4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y0flmIUJbFboIk3rMHqy7dLhoFz/rVkKP/hPJfXJU6LIRMta6OiBPIGrTIVTFxjMuOJujpSsD0k26o1q/wgEnZVui/Be2rB0iju9cDp80vFyPZSlwIhe/qL9w1HKQeNQBgh1JnxLiw4SU0eNP5jOTiilVIJX7qT8HgLpcx7uKG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=goLKnkLg; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64PCsqeP71059474, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1779713693;
	bh=Dobp+8XPRNGUvZqXv7EUCJ4nA2PN4VPudIxcDeZbQb4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=goLKnkLgJqbMTkBApizRUnmPxHU1FwJiLYOD0k/fkYrZEJor/knhkhv5vih+Wn7KY
	 vGW+JdpoO+SDOMAIFJAB5Rv9dL6AsnWjwYBeVi9pg6Eq1zY5x2XgCUNLABhza0H2tc
	 z30rGKxDQIBUXopjSOmz7V2+T2O6oQGcprjLZe1ZqqhmOAysuUy+uUatTH9TjT/PUM
	 KBHZBbtPmtHWSbGTHOkRY1NPSBFAJ/4Dr+EJoI46+EVKmxUPxrLSrksSiW6v6mcDvn
	 9wntm0/DsUUlwIjeVk4xyQQt6Olj2tfSnGMsk5lhBf/uWR0PIhVWhoABwsBemIlqHP
	 NzS7ermyr9Xtg==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64PCsqeP71059474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 May 2026 20:54:53 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 May 2026 20:54:52 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa%9]) with mapi id
 15.02.2562.017; Mon, 25 May 2026 20:54:52 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linusw@kernel.org" <linusw@kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?546L54Kc?=
	<wei_wang@realsil.com.cn>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogaTNjOiBhZGQgYmluZGluZyBmb3IgUmVhbHRlayBSVFM0OTB4IEkzQyBIVUI=?=
Thread-Topic: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x
 I3C HUB
Thread-Index: AQHc2JrXcMCnLUwHnkiPRbUzP688hrX4ZM2AgCZ0w6A=
Date: Mon, 25 May 2026 12:54:52 +0000
Message-ID: <9ce3eeed6ec344b88cc7f488493a78ff@realsil.com.cn>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
 <a75d18d5-1637-45ec-ba78-01867089a2af@kernel.org>
In-Reply-To: <a75d18d5-1637-45ec-ba78-01867089a2af@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realsil.com.cn,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[realsil.com.cn:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37459-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[realsil.com.cn:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zain_zhou@realsil.com.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.938];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,realsil.com.cn:email,realsil.com.cn:mid,realsil.com.cn:dkim]
X-Rspamd-Queue-Id: EA0AE5CAC3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LiBBbGwgaXNzdWVzIGhhdmUgYmVlbiBhZGRyZXNzZWQg
aW4gdjIuDQoNCkJlc3QgUmVnYXJkc++8jA0KWmFpbiBaaG91IOWRqOWvhQ0KUmVhbHNpbCBNaWNy
b2VsZWN0cm9uaWNzIENPLiBMVEQuDQpFLW1haWzinIkgOiB6YWluX3pob3VAcmVhbHNpbC5jb20u
Y24NCg0KDQoNCg==

