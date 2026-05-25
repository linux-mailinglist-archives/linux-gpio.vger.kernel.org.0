Return-Path: <linux-gpio+bounces-37461-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6F4nMsZJFGoqMQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37461-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:08:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8275CAE73
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93F37301324C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 13:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC353839B5;
	Mon, 25 May 2026 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="EBCtgRBv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D48F14E2F2;
	Mon, 25 May 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714482; cv=none; b=A6GAigUp5JUVMpQdQHcru1P4TznL0e/2E24K/4D1OWAasGTwTI2zJhpEv0CHj0fFBDXf0jyxMEnnpDq+24m+ZnVy1NmyasVeylaQTC2DgCcp8xC8UM8/GDdV0J8w/F7gbm7SFoaMmhTG8IAqlJmTIUk5gd3qJRSdXkZzCGxjCBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714482; c=relaxed/simple;
	bh=RToh+6gSjpe+Jlt7aGEVqRli78mk+c1io2CsQwG8XyI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qFwZE00FtF+9Re1aUjgefrYorI2EHKdLJ+kQTi7xiP7Btab0gqxNKVOg/x+8fPD9ucZHnjwqRGaJoienUqZUsYUJhHp9KgaA1q4LHpkXtttfx1CJxy/MkiJg1l6xOXDduINdenOHIDfAckmZVqosRd+fSJmAY302ueD5Y0fELbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=EBCtgRBv; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64PD7dszE1063728, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1779714460;
	bh=RToh+6gSjpe+Jlt7aGEVqRli78mk+c1io2CsQwG8XyI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=EBCtgRBvKk5TY2TjH8mGuly/JI6u4PJmCNjdRb5qkuvdxDeRinR2ufy22WNou16XM
	 B5Jup5NWd6k2Np9R42FgJ2EDOpk4XR3Psd0iEGCzmESEqTsOPg5oat1LRrNxwHAYkV
	 YaZvsbBinMfXvqgDeK+hoVgo8n9/nku3ns927nDxoTj7mOAvAIsv9fXbPcBl+7wVqr
	 YgQ4Mly0n+9nKm2Nko5LR0kWC3UkY7Jm7YeUYdvCmFUYuILaum6FlRSRFZ8hGsi4P8
	 yNtRZSEm2IDRIoOZCH7RERWtKugKu03QjEMy1RCusq4JqLDSc3q9odLcTiiIaiQ3tV
	 IyUsEOeCA2Nkw==
Received: from RS-EX-MBS4.realsil.com.cn ([172.29.17.104])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64PD7dszE1063728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 May 2026 21:07:40 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS4.realsil.com.cn (172.29.17.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 May 2026 21:07:39 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa%9]) with mapi id
 15.02.2562.017; Mon, 25 May 2026 21:07:39 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Frank Li <Frank.li@nxp.com>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>, "brgl@kernel.org" <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?546L54Kc?= <wei_wang@realsil.com.cn>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogaTNjOiBhZGQgYmluZGluZyBmb3IgUmVhbHRlayBSVFM0OTB4IEkzQyBIVUI=?=
Thread-Topic: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x
 I3C HUB
Thread-Index: AQHc2JrXcMCnLUwHnkiPRbUzP688hrX902GAgCEKCSA=
Date: Mon, 25 May 2026 13:07:39 +0000
Message-ID: <871742681d2047c794f0a46c03620dcb@realsil.com.cn>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
 <afkCvVaPb-NrLs2P@lizhi-Precision-Tower-5810>
In-Reply-To: <afkCvVaPb-NrLs2P@lizhi-Precision-Tower-5810>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[realsil.com.cn:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37461-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[realsil.com.cn:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zain_zhou@realsil.com.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.946];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,realsil.com.cn:email,realsil.com.cn:mid,realsil.com.cn:dkim]
X-Rspamd-Queue-Id: 2F8275CAE73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgRnJhbmssDQoNCiAgVGhhbmtzIGZvciB0aGUgdXBkYXRlIOKAlCBncmVhdCB0byBoZWFyIHRo
ZSBOWFAgaTNjIGh1YiBmcmFtZXdvcmsgaXMgbmVhcmx5IGRvbmUhDQoNCiAgV2UgcGxhbiB0byBy
ZWJhc2Ugb24gdGhlIGdlbmVyaWMgZnJhbWV3b3JrIG9uY2UgdGhlIFAzSDJ4NHggc2VyaWVzIGlz
IG1lcmdlZCwgYW5kIG1vdmUgdGhlIGRyaXZlciBvdXQgb2Ygc3RhZ2luZyBhdCB0aGF0IHBvaW50
Lg0KDQogIExvb2tpbmcgZm9yd2FyZCB0byBpdCBsYW5kaW5nIHVwc3RyZWFtLg0KDQpCZXN0IFJl
Z2FyZHPvvIwNClphaW4gWmhvdSDlkajlr4UNClJlYWxzaWwgTWljcm9lbGVjdHJvbmljcyBDTy4g
TFRELg0KRS1tYWls4pyJIDogemFpbl96aG91QHJlYWxzaWwuY29tLmNuDQo=

