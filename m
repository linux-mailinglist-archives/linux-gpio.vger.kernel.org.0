Return-Path: <linux-gpio+bounces-31015-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AhhCACBc2n2wwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31015-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 15:09:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E376BF4
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 15:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F33E3007A5E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287C831D36D;
	Fri, 23 Jan 2026 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Jg/wOM5F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5258D1F1518
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177329; cv=none; b=pAn82Zfd8V9s6KmOnLsxWmXF2dMCqsIXeaejKizxOIcOHu4sE18m4ZrkZMSuZSRjvN5ct1q7GTsJts8Zzjt+svbbh+Wixrgmk9EvEjBc18CoKMfIYJKugXPfRSTaDCgToRfbPwmAvV+w0jdPh0PJuqFY3jEcbqeqpnH5fgzTdgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177329; c=relaxed/simple;
	bh=75vUOquLAejb30OfCXZ3Ajhc8+O3WVfbSpMYETwi8oc=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID; b=A5IH0mNFb3s7mX17T+d4qLLspguKPYFqq+nfapEzo4yarQz6TA4EUcxH3bR/LSRgSZJv9rQz233t+fa6fv9z93TQ6rjgFJsQ7DvbYLGnzf9+MkYDTCUOGJpCDiGqo1+nQobbmWfIY4Ow35nbQ2tgMB0ll4q8saOZpucfdlrqbXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=Jg/wOM5F; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1769177321;
	bh=75vUOquLAejb30OfCXZ3Ajhc8+O3WVfbSpMYETwi8oc=;
	h=From:To:Cc:Subject:Date;
	b=Jg/wOM5FpAYYhPN0Nye0GzbNPWunY0DLgZ8FCm5SA8owWCuULzcLvJwFv1vhxvnii
	 j3gac8gGpHwidFdsnz3tObLpFAcSm27fP0xu0CyPIAYqxw77+KjQgQBGtRBnbnvUkR
	 KAw8BKfI2BCPSD/l6OwFS46zNSMXRqMNrfv9urzo=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-XMAILINFO: N1+fdyie8PcvGsq/0nHrjgY7xXlKFuR2SURIftSWFn8JR+jw5UEvayqz1g/Czm
	 /gTfl1+I4Bi3+JdqP0AERmlcAINuuDF0UUk64CEp5vQ9eGwCrjq+bInQ35VZZYpeZsgfZIDVdNMig
	 wtAxP+rAu5KZN04kU+82riFyux/6yJZKbyFTpLiXsevMnS2tOP8+r6UTNfPJxqajOjjSeAA8u/ULf
	 Xgxw2zDtLLkZ78pWW22BExJeKWJ1FwhMw9ia3QIP8KetJ6bKTCPl7tIr4uc+BN8bbbkuUgoYnEMBW
	 RGqOh4iNbIx+f7ygiV7PHkUa6s5ItUbhYWoA07kUnmft7rrSn3e2uJxmMAEiDrLbK5d9QjC2J7H0J
	 GDPRFOvD6csM/Ba1Zi8uhDA1ifB4KUHmVvh4W58gRbUZ6KsVBsIkfLL8MLTwDspVEo6GgFDdmTOCZ
	 rO7NVNcjQpgxmlGDuKbkoTZ6fLOyXPkyTZOI2heBAUXOx9FIydnM5PLDF5rPCJgOt+Dx0g1d6w3Va
	 HUuc+mfBh9zWQhC5pPajtPhbmJ1ufbpvaokRrugZWOHINifYGpS300DxWbbktvlY7CaTtTQF8TQmS
	 1YfP2KQuyZsDPAWcGogqtUoYPjTXET9YljW3KKTUvlK/9lwbenKC7hXeScbcbS/6qReEQu2FK9m8t
	 3x75BQXQY9Bn/jL3j+u6cYXdGhvSYBVbhewmOyo2VSYte7o1XnhgpQACa2e4/MTREXoYsemcwL8Lk
	 F2Eq4cOZEPfju2uMokh53dD8gvlWhgo86MHHkaw6BnSlFtYHzmge9h3zbjM5/G9coZglVMOgCpnGt
	 UuYTm9dKywap2sphhzeMveYNIYb34HiVnJ6VH+bKRAQ/y5v4DFMj8f+tRpn08RNNkRmDtc1yePYE7
	 L7WCM/X5FumkdOVrU4E6EiphJioCQ2S6Fcy4GUIaFv1aZIjtRvBKYyHfnitbSou3O96fvubP7g8jh
	 T6gYpYtbWUH5BTm6RC7UAHuM+ci0EsVLkhJPyU6u6xh2fnIqa0KTHEOHKyDQC5Th+ilXUsFMWzSWB
	 bfs67RiENkzYud/9y1N9yeHVoYFI5VwRPYGf/6FVmjTdewZw=
From: "=?utf-8?B?R2FyeSBMYXU=?=" <zgliu@foxmail.com>
To: "=?utf-8?B?U3RhZmZvcmQgSG9ybmU=?=" <shorne@gmail.com>
Cc: "=?utf-8?B?bGludXN3?=" <linusw@kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtb3BlbnJpc2M=?=" <linux-openrisc@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>, "=?utf-8?B?a3J6aytkdA==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Y29ub3IrZHQ=?=" <conor+dt@kernel.org>, "=?utf-8?B?Z2VlcnQrcmVuZXNhcw==?=" <geert+renesas@glider.be>, "=?utf-8?B?a3J6eXN6dG9mLmtvemxvd3NraQ==?=" <krzysztof.kozlowski@oss.qualcomm.com>, "=?utf-8?B?YnJnbA==?=" <brgl@kernel.org>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: gpio-mmio: Correct opencores GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 23 Jan 2026 22:08:40 +0800
X-Priority: 3
Message-ID: <tencent_5B5F194F6B5511962378DEC1B1B043F3A705@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-mid: xmseza62-0t1769177320tu35o6dz4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.94 / 15.00];
	CC_EXCESS_BASE64(1.50)[];
	SUSPICIOUS_RECIPS(1.50)[];
	TO_EXCESS_BASE64(1.50)[];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[foxmail.com:+];
	HAS_X_PRIO_THREE(0.00)[3];
	DBL_PROHIBIT(0.00)[5.108.140.192:email];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zgliu@foxmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31015-lists,linux-gpio=lfdr.de];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_EXCESS_BASE64(0.00)[];
	FREEMAIL_FROM(0.00)[foxmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 351E376BF4
X-Rspamd-Action: no action

SGkgU3RhZmZvcmQsDQpJJ3ZlIHRlc3RlZCB0aGUgImJyY20sYmNtNjM0NS1ncGlvIsKgZHJp
dmVyIHdpdGggdGhlIE9wZW5Db3JlcyA4LWJpdCBHUElPIGNvcmUswqBhbmQgaXQgaXMgd29y
a2luZyBhcyBleHBlY3RlZC4NCkZvciByZWZlcmVuY2UswqBoZXJlIGlzIHRoZSBoYXJkd2Fy
ZSBjb25uZWN0aW9uIGxvZ2ljIEkgdXNlZCBmb3IgdGhlIE9wZW5SSVNDIHRvIE9wZW5Db3Jl
cyBHUElPIGludGVyZmFjZToNClZlcmlsb2c6DQpzaW1wbGVfZ3BpbyBncGlvMCAoDQogwqAg
wqAuY2xrX2kgwqAoY2xrX2kpLA0KIMKgIMKgLnJzdF9pIMKgKHJzdF9pKSwNCiDCoCDCoC5j
eWNfaSDCoChjeWNfaSAmICh8c2VsX2kpKSwNCiDCoCDCoC5zdGJfaSDCoChzdGJfaSAmICh8
c2VsX2kpKSwNCiDCoCDCoC5hZHJfaSDCoChhZHJfaVsyXSksDQogwqAgwqAud2VfaSDCoCAo
d2VfaSksDQogwqAgwqAuZGF0X2kgwqAoZGF0X2lbNzowXSksDQogwqAgwqAuYWNrX28gwqAo
YWNrX28pLA0KIMKgIMKgLmRhdF9vIMKgKGRhdF9vWzc6MF0pLA0KIMKgIMKgLmdwaW8gwqAg
KGdwaW9bNzowXSksDQogwqAgwqAuZ3Bpb19pIChncGlvX2kpDQopOw0KQW5kIGhlcmUgaXMg
dGhlIGNvcnJlc3BvbmRpbmcgcGFydCBvZiBteSBkdHM6DQpncGlvMDogZ3Bpb0A5MTAwMDAw
MCB7DQogwqAgwqBjb21wYXRpYmxlID0gImJyY20sYmNtNjM0NS1ncGlvIjsNCiDCoCDCoHJl
ZyA9IDwweDkxMDAwMDAwIDB4ND4sIDwweDkxMDAwMDA0IDB4ND47DQogwqAgwqByZWctbmFt
ZXMgPSAiZGF0IiwgImRpcm91dCI7DQogwqAgwqBncGlvLWNvbnRyb2xsZXI7DQogwqAgwqBi
aWctZW5kaWFuOyANCiDCoCDCoHN0YXR1cyA9ICJva2F5IjsNCg0KDQoNCg0KDQoNCg==


