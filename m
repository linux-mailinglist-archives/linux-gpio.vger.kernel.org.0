Return-Path: <linux-gpio+bounces-29230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3646CC9F307
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 14:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0685F3482C5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 13:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BFC2FBE15;
	Wed,  3 Dec 2025 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="HLcgyGUs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EABA2EA752;
	Wed,  3 Dec 2025 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769978; cv=none; b=rUXeD0l+pfBuLfVTitMYfR674dRQ+VzmVW90ziWp04WRcH39/Jjii2E0yvfDPF0QFa3OcSPlPUu3uK3b1evGJ37ZH5DgAyWjHkIasL6/Vrtqg0Ix1CE09S7RVkNuOZr5+T0cH/06jdJRTdwFC8awDjpJbb01QoNCKH1R2t9CF6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769978; c=relaxed/simple;
	bh=k88zLJomK3GQFHDCokdLIqnS6EI/5Cxx6Bchg7HNzi4=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=br9YRTW6EUTZrfzqb2ueCXqaOjlusiCk4/H968XcGihIG4kEaw8FDifreqWAEYmrrCt0U+sa/P438MppUchYTlFvAWrkDvzEJre6BBdZdAJmIc04SGjgqbLophMDKrZyRZjma4BUt16dbPsPpN49PS6bhY1CiRF5VA704kE0rMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=HLcgyGUs; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764769920;
	bh=k88zLJomK3GQFHDCokdLIqnS6EI/5Cxx6Bchg7HNzi4=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=HLcgyGUsjyripSMEWn9l1XPtM7RnHCA8Poe1E+aFmXoC5lOOETQdxQxY2bO0I1Q7z
	 FIKDHSxSH2zVQSIRx+kz/kf2uCWj5GhehR8WMEl8xzGejN8qziQB6r++P4wxiCqD3W
	 AFfSMa6MfGvLIYSqcC8bNvb5MKNxC9Z/8tdd6wc0=
EX-QQ-RecipientCnt: 10
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqRRDMu1q775QruR7Y790WuywJEQvw7b5Zs=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: xdOfk945xp6K7c9a+aY5eCOIY5b0FVL6hAOv90mDZsI=
X-QQ-STYLE: 
X-QQ-mid: lv3gz7b-6t1764769893t99c293d4
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?QW5keSBTaGV2Y2hlbmtv?=" <andriy.shevchenko@intel.com>, "=?utf-8?B?SW9hbmEgQ2lvcm5laQ==?=" <ioana.ciornei@nxp.com>
Cc: "=?utf-8?B?YW5keQ==?=" <andy@kernel.org>, "=?utf-8?B?bWF0aGlldS5kdWJvaXMtYnJpYW5k?=" <mathieu.dubois-briand@bootlin.com>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?5Y2g5L+K?=" <zhanjun@uniontech.com>, "=?utf-8?B?6IGC6K+a?=" <niecheng1@uniontech.com>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>, "=?utf-8?B?V2FuZ1l1bGk=?=" <wangyl5933@chinaunicom.cn>
Subject: Re: [PATCH] gpio: regmap: Fix gpio_remap_register
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Wed, 3 Dec 2025 21:51:32 +0800
X-Priority: 3
Message-ID: <tencent_62F1649A72B7E3B7354F465E@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20251203020342.2564767-1-guanwentao@uniontech.com>
	<aTALJckmUxkyeMBG@smile.fi.intel.com>
In-Reply-To: <aTALJckmUxkyeMBG@smile.fi.intel.com>
X-QQ-ReplyHash: 3594443638
X-BIZMAIL-ID: 2352293287068776447
X-Address-Ticket:version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Wed, 03 Dec 2025 21:51:34 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NJL+bfc5gN/mafqlKgtw6I+wGyiHBft77dGdrGKP4UDiZoKKDrJYqvrQ
	a0l2+YlujGHWEZReWziu5enYgdcGxpgytywpgdqhj63clLPKuV0SM+R2o2ncdhmWF2GEFwm
	7oZT1nHSzdnbEL7f7qhMcy87CgmAhSDXuXpo/eL8INXX6uD8R04LfrpQxbGr8+eMUF+c9PL
	8A0OkjE94uYLaIk5mPtwUEscmB4aejoSJXfVoEpCaR87EzyG7zF1r4PU+KgV21uejDRhpfT
	GdHUMViA9xp4XFUUQgPq0yKtBy8+oAdIdImVbAQvcj2AC090lCQnrVWjmBBrKaAXiCU0yzC
	MxFGrKCamEQWxBAaP+PGn2hgB/lhcbPy4i80LWjIkfw1S58LzAl4UCu6ilnkBRsl58NxQ6d
	6iIA4e0WWbMVtHCeEiLPLgqC4Gp5pnNRluR/fYy7sIkxHHc9V9HFXwnz3cf9H0Z3cmOSHtI
	r2xLSygfWdYU7OyYoOUroKUqkoSoitJue+eXa4DRhGfQWhqAzNvJN0M8ExWxVfgQsTd0sXi
	yGltChhq/Rgxy7IhOCZhhb7A5kaxBmnMVhNaeL7vfLpDpgnZks+glS4NbCc+sgH+UwQAZRL
	6ouSpj9I3lq69YWbICIkxkBhcAon+xtb/GLIoeYpmD9ULq/5yzfdQ0mxCiQp72pQSogfKCr
	OBpGE1jf4yEaIEQNLGWGJUNuS67gAjhCfgSWIgbWmJUl7Vi70H5HNwHFzV1gpFBYIR9ebL4
	aR+ISklZG+cehFiS9esm2+Bnpm+D3SeKAp5R+Vj4k+UMtW22+d24T/gZoCp7tWRQ4UHXOGG
	9kpxqmVkzvKKfrRgrwKk6aqWat6KQxXXJtJ8G+U5DTRVboCIQ6KMyi8e2qyelLZ5sQS37m/
	EJDbcGOzK8Q/u8hR3kT5qCkryxKCDNoIv2w7jRWIjMAthuz+uxWv1M0+zsHrVxTZmUlDVoj
	4Hto7RcknzTaxvfb8Z81TAJ3oS5VhYqq+WFWTgZzr9B3aqNLCUTL1wXlSPQhaCwYTvdRrE3
	WemVJFRCM+HFHy14yP3jyLOmci2TMfallJW/+T2Yp1hWofwO1BACI4JyT1Hm2lb4kPSR56v
	0QnBSbIkWwCV3YQ/5qcv3c=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

SGVsbG8gQW5keSwNCg0KSSBub3RpY2VkIGl0IGluIHY2LjYuMTE3LCBpIGZvZ290IHJlYmFz
ZSBpdCBpbiB2Ni4xOS1yYzEsIGkgd2lsbCBzZW5kIHYyIHNvb24uDQoNClBTOiBUaGUgZmFj
dCBpcyB3ZSBuZWVkIHRvIGNhbGwgZ3Bpb2NoaXBfcmVtb3ZlKGNoaXApIHRvIGZyZWUgd2hh
dCBncGlvY2hpcF9hZGRfZGF0YShjaGlwLCBncGlvKSBhbGxvYy4NCg0KQlJzDQpXZW50YW8g
R3Vhbg==


