Return-Path: <linux-gpio+bounces-29233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBACC9F707
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 16:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EAF3E30004DF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 15:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7574327C03;
	Wed,  3 Dec 2025 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="CHv2iRHh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F9E325735;
	Wed,  3 Dec 2025 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764774854; cv=none; b=mkK6diqgitRcrZXwIY2yrTGRRRKI9DhMjsE0o6qIYGtgDIqYfH8/EEm8EeRHy3218Iu+zn7Q8foxzx2iB5fQldzVjGHAfOYgCSy8CzY+0EilpkF+Grzoox6a4ncd712MrXaAMVSdg9lj1RU1CWFFP49rSSax2atWPplQvzfUaEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764774854; c=relaxed/simple;
	bh=9rQwhuwE28lZS1AqNoToFbJLMg/7qrASKtXWJXSss7s=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=tds3SeexPefB9nkvfeZvUKV/tM01aRiwqjkpQCXEyFdivnzby5E93N/HHMM3rz4BXJXFw7gm+XAoH/vxaIKbpxGdAwVcsg2FttD0tlHfudk+BF4gI/FrXp7ls27UkkhJPAoiuApeU8WtgJvMW/O8C6tX8c+w+JPdc6cg7UKIHH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=CHv2iRHh; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764774785;
	bh=9rQwhuwE28lZS1AqNoToFbJLMg/7qrASKtXWJXSss7s=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=CHv2iRHhuRsc02GbEVnlIm0OXM3IlB44JzVEI8Er/Fg7D4gRr+5/0nyXGIg/sRlb2
	 2Xs1mq3DTYa/+P1XPKb9MO4H1I3vyUD1OCgYtwQm8ixP3fBRxVVeiAyrIz5yFz7GFD
	 3jD11yE1JkY0+PbIbo7kgGCmNbrhq17uIuo0oSSE=
EX-QQ-RecipientCnt: 10
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqRRDMu1q775QruR7Y790WuywJEQvw7b5Zs=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: tMNm0zgY7jhtBL+/I/XU9x0UqeH6l5jD1cbN11/M2oM=
X-QQ-STYLE: 
X-QQ-mid: lv3gz7b-6t1764774760tdd47a65e
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?QW5keSBTaGV2Y2hlbmtv?=" <andriy.shevchenko@linux.intel.com>
Cc: "=?utf-8?B?YnJnbA==?=" <brgl@kernel.org>, "=?utf-8?B?bWF0aGlldS5kdWJvaXMtYnJpYW5k?=" <mathieu.dubois-briand@bootlin.com>, "=?utf-8?B?SW9hbmEgQ2lvcm5laQ==?=" <ioana.ciornei@nxp.com>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?5Y2g5L+K?=" <zhanjun@uniontech.com>, "=?utf-8?B?6IGC6K+a?=" <niecheng1@uniontech.com>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>, "=?utf-8?B?V2FuZ1l1bGk=?=" <wangyl5933@chinaunicom.cn>
Subject: Re: [PATCH v2] gpio: regmap: Fix memleak in gpio_remap_register
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Wed, 3 Dec 2025 23:12:39 +0800
X-Priority: 3
Message-ID: <tencent_7AA5492F0C3086555B6EF720@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20251203141557.2652348-1-guanwentao@uniontech.com>
	<aTBOSfH9KyI0epZB@smile.fi.intel.com>
In-Reply-To: <aTBOSfH9KyI0epZB@smile.fi.intel.com>
X-QQ-ReplyHash: 2649634659
X-BIZMAIL-ID: 2757764031343989435
X-Address-Ticket:version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Wed, 03 Dec 2025 23:12:40 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M3ziZXKDk+iOTyTYriq8ZwXG5WvWJwylFGyq8CL9vEGgy5sVd15gQyvm
	d1ZRpfvRNJGqwKbPZelAeP6ZJmmEQPX2z7MU8vV/4bbmaaWyNI3Z6dLZl5rqc6Ec329QPL1
	tb6oPdtCK8RlcllaPxIsRuMRDu3aUlCgc2FUYuj3P/d/e5ag6t+7RL0FZBQvwuaeg2Qf1CL
	1ukNqet6tdmy7jdsaYh0GlysLwHRQrrk3jJSjHvlAUBo5wPToa6xrQksDgR+LwsEO8fcRjb
	EINs9Tcj3vHevg07iESrpfRKMyq0I9AQsM8ediiTQhQaAjpMJQ7qKxrKXDrdJU6+zHRWj3x
	+y8UVB7xfT0qSXxB7JuN/x8iCP8W5NfDn7P9kOIay65fnwyNWRvAZFsKMuxXPBFA9+oK3QO
	qh55TjrmXdEh3UoMmgV4olALluI2hrRGnKpMTf908MVaQN1M1zOM60gSvvHWNdDhzSRH8KB
	ukt7BeIHzjvEtXFllSiu00Fl6hMRK3CRRwdSr5auIOYVXcNZO6oD7ILkufuwCXrMKSkXWEf
	xfmRod9xS4r/0IgZD01ksp96UNpg8vySNaip6xR+NZ0hYO9Q3QTazB1VN0u8jv4MGnGUAIc
	cfslYXbAOltGjT3HbN5Y3aa1UimUMo0hRd5NGdOEwouyKLD16lqQmLV1sKy73P+PGRnaoIA
	jppJGsCu/klUuKfPJaN+6CH7quY91hgh8be3gW/AIvf1cMgjRZf3DCEnCka798kidegsNK4
	7fKhSLfLiJApEZzLgwu8ZJBptryGKtAulEDAGqpPv0fT2Aj0gMJ0OWgrfybHNWT5XetiwZK
	PI4sHnVsW+TOoEGGoCrcOf3Bu9TYb6mDcxNwnA84H+53/xpqREHzQgGC8sM2x+se/5V5anP
	xKemlzVpyyVstyzSL31Mv0JouFhLTAnpZ4nCm3vD7gV0VQqzOBkIZeBga38nWY9Kps4R/LX
	SkqEAHkivJaKKOUVyVdYSpVsYY76nMhMWu6iu0J/tvcn/s8LEkXe6nNROJHHTJD5gHFR5nw
	fkAk9J3DMFom5KEEHGpR+Xr9vLRNUs22jq0rosRuFX/qNkWaHW
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

SGVsbG8gQW5keToNCg0KSSBkaWQgbm90IGZvdW5kIGFlNDk1ODEwY2ZmZSAsdGhvdWdodCBp
dCBpcyB0aGF0Og0KRml4ZXM6IDAwYWFhZTYwZmFmNSAoImdwaW86IHJlZ21hcDogYWRkIHRo
ZSAuZml4ZWRfZGlyZWN0aW9uX291dHB1dCBjb25maWd1cmF0aW9uIHBhcmFtZXRlciIpLA0K
DQpJIHdpbGwgYWRkIGl0IHRvIHYzLg0KDQpCUnMNCldlbnRhbyBHdWFu


