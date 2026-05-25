Return-Path: <linux-gpio+bounces-37460-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK07IJNHFGrzLwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37460-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:58:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F22565CAD2E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93ED53016035
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 12:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F21338398F;
	Mon, 25 May 2026 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="Pi4fVRx9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D916931ED7D;
	Mon, 25 May 2026 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713932; cv=none; b=MVWYPt4NSb9juYy88J2+h5hg4KXXAtq9oPHe59yBc0dL0t79PfbyZ//CKIGu1C2WU4AB+AWL+UPk1D6RoRo7lZd2Wlzo+PXcVoCq1Rf3kKXInouaphda1JcNQ3/DgK1PexxyyaMlZ5mtY9i3anWsR7RfwvvC8ETdi5g4GM0MfK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713932; c=relaxed/simple;
	bh=QqDPJG6+HCasqnKgequ5m0+RP/Q+QlX9y4hLkzYWFOk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=prnlLRjuti54pjCC5PsBxlXvr9dtEV0xnFdFm8m0WfZzD5CmDk71lZIKvjkewPeXL8Wwjs+2Tb7FlAApoSznmM9hMRE9SSTZKWQASFSZmfH3EH5rEDjbkicvdpq5esCYpTeMs8x67YIHAsCvfLUvHqGtUQVipilCrpd8XyuPhjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=Pi4fVRx9; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64PCwXwrD1060387, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1779713914;
	bh=QqDPJG6+HCasqnKgequ5m0+RP/Q+QlX9y4hLkzYWFOk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Pi4fVRx9c+osONZzIgXdLvEZkDTLEP8laVjcov9t0fiA8MrL0K5/xK+otUD7PvGo+
	 rC2k3sPhZGK06oRpcGFq4VX03X/YJJsLbeixbF/rimemWTDiYCtrNRhMDLPWtSBeBj
	 dxTniR+xT7i4+nyrmO/+G/eYDYfpCVJaq7If4Fjg6dYRHxGX14ENODh5KIZ1FAhck6
	 a2Jx+svRun1d9h67v5i4DLd6kVsq8bosghzlx06SnWtYLcW4BM6XSJYYqZ+K7RoZdc
	 /R2MQS++OxyDnxDIUz6Nt36tKgL5YysX+5NmO88XNdd8UhwPqk8AAAT/CaJh/Bp1aI
	 oP1RW2llAeeEA==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64PCwXwrD1060387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 May 2026 20:58:34 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS2.realsil.com.cn (172.29.17.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 May 2026 20:58:33 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::a797:6c5d:dfd:80aa%9]) with mapi id
 15.02.2562.017; Mon, 25 May 2026 20:58:33 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linusw@kernel.org" <linusw@kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?546L54Kc?=
	<wei_wang@realsil.com.cn>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMi8yXSBzdGFnaW5nOiBpM2M6IGFkZCBSZWFsdGVrIFJUUzQ5MHggSTNDIEhVQiBkcml2ZXI=?=
Thread-Topic: [PATCH 2/2] staging: i3c: add Realtek RTS490x I3C HUB driver
Thread-Index: AQHc2Jrbqbpl5NdpHESZuLYaRhWZD7X9bHOAgCFtvPA=
Date: Mon, 25 May 2026 12:58:33 +0000
Message-ID: <1a79b9c3c6c64e5ba65292efa2f0472f@realsil.com.cn>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
 <20260430121354.6253-2-zain_zhou@realsil.com.cn>
 <2026050412-bush-rosy-959d@gregkh>
In-Reply-To: <2026050412-bush-rosy-959d@gregkh>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[realsil.com.cn:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37460-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[realsil.com.cn:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zain_zhou@realsil.com.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.944];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realsil.com.cn:email,realsil.com.cn:mid,realsil.com.cn:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F22565CAD2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KDQpXZSBub3RpY2VkIHRoYXQgdGhlIE5YUCBQM0gy
eDR4IHNlcmllcyAodjEwKSBpbnRyb2R1Y2VzIGEgZ2VuZXJpYw0KSTNDIGh1YiBmcmFtZXdvcmsu
IFdvdWxkIHlvdSByZWNvbW1lbmQgd2FpdGluZyBmb3IgdGhhdCB0byBsYW5kDQpiZWZvcmUgcmVz
dWJtaXR0aW5nIHRvIHRoZSBwcm9wZXIgbG9jYXRpb24/DQoNCg0KQmVzdCBSZWdhcmRz77yMDQpa
YWluIFpob3Ug5ZGo5a+FDQpSZWFsc2lsIE1pY3JvZWxlY3Ryb25pY3MgQ08uIExURC4NCkUtbWFp
bOKciSA6IHphaW5femhvdUByZWFsc2lsLmNvbS5jbg0K

