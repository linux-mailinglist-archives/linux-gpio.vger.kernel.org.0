Return-Path: <linux-gpio+bounces-7726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F80491806F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 14:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B75811C23F2A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF34181335;
	Wed, 26 Jun 2024 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fpYW+iRN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B598A180A96
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403334; cv=none; b=ETaU369+p2NVHTXaNiZpNLuLwH++4rCqa5YNZe7MuafgLKvEBgxaVXHobJPzumD3XDEne9ccXtpyiKqAjuRhbuI06B7WvQ860ngUyj3m9tVLUUEc0tlnCB93JU758VQ1YCwyq3S7R5FAl058j3r+o/Ex9VZ5FguUQK/CXPpeWGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403334; c=relaxed/simple;
	bh=rucZHfaxupwZMqi9uyxtOgQfeiJgbrbSQeZuVmUsJCM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=IXPYB+y1///ZCtPum9H9fomiT2A2GldqevQug4hxeZax+GqIWpYYWCwSvlXgXY5EaxdI89DVqOH/shLVWO4b1JBv0QZzg4LXXJAGldfXXDSe1ZQnpQs2YwqEH7B5WKc4ZcR8huT4AY5p+RJQ79DBQ5c76/2yO0fVnb+B8aObqcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fpYW+iRN; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240626120208epoutp04bb0887adb5c190dce44f0a770fcee653~cjDfF-UjJ1205712057epoutp04O
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 12:02:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240626120208epoutp04bb0887adb5c190dce44f0a770fcee653~cjDfF-UjJ1205712057epoutp04O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1719403328;
	bh=T4l6KCBJTyjVibvGopmp4YQjs7hQFGCk9hEFe7ue7Dk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=fpYW+iRNA7My5WG3xMwLe0kjSvuFd9WOap+JQL6LNpzz3ajOlKgh67x6iAcPZ4G3s
	 0SpqcnLmuUusKcbk4iuJxayFmz5ljmyQX+oT3ba8aJwhJaLwh3/QZhsklhUPngx6uP
	 EBtJwXmntymF3u3s8/ynnzDc1QKHtL2L1Ww3wf8U=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20240626120208epcas5p4914f9781e747c0bc160646f73a4631eb~cjDezqtcb1798117981epcas5p4A;
	Wed, 26 Jun 2024 12:02:08 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4W8L0b060Sz4x9Pr; Wed, 26 Jun
	2024 12:02:07 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0B.48.11095.E330C766; Wed, 26 Jun 2024 21:02:06 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240626114931epcas5p1d7840cbe7418c6e62b15e4b54bee5d42~ci4dxwYNj0549805498epcas5p1P;
	Wed, 26 Jun 2024 11:49:31 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240626114931epsmtrp2a5b41a7aca61cdd62daadaf141488201~ci4dxFEnw0062900629epsmtrp2R;
	Wed, 26 Jun 2024 11:49:31 +0000 (GMT)
X-AuditID: b6c32a49-423b770000012b57-b8-667c033e2620
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	51.5B.07412.B400C766; Wed, 26 Jun 2024 20:49:31 +0900 (KST)
Received: from FDSFTE582 (unknown [107.122.82.121]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240626114929epsmtip13168b189f56ddddf1db83ce831674989~ci4bcLE7L2637326373epsmtip1M;
	Wed, 26 Jun 2024 11:49:28 +0000 (GMT)
From: "Vishnu Reddy" <vishnu.reddy@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>,
	<krzysztof.kozlowski@linaro.org>, <s.nawrocki@samsung.com>,
	<alim.akhtar@samsung.com>, <linus.walleij@linaro.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: <38fae674-f672-46e0-a44e-1278deaaf36a@kernel.org>
Subject: RE: [PATCH v2] pinctrl: samsung: Add support for pull-up and
 pull-down
Date: Wed, 26 Jun 2024 17:19:28 +0530
Message-ID: <07f201dac7be$e81317d0$b8394770$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQJsl4iGk1jvO+hY9fFKxJSBqey3YQJX8oCQAbw/7Giwla0CYA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmlq4dc02aweGp5hYP5m1js7h5YCeT
	xfnzG9gt9r7eym4x5c9yJotNj6+xWmye/4fR4vKuOWwWM87vY7JYtPULu8XDD3vYLQ6/aWd1
	4PHYtKqTzePOtT1sHpuX1Hv0bVnF6PF5k1wAa1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7yp
	mYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QeUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XU
	gpScApMCveLE3OLSvHS9vNQSK0MDAyNToMKE7IwZLWfYCh6KVezY9pelgfGuUBcjJ4eEgInE
	rPPPmboYuTiEBHYzSvT/W8UI4XxilGhYuxkq841R4s+uE4wwLfcu/WWBSOxllHi4tZkJJCEk
	8IJRYsFd1S5GDg42AX2J5hsSIGERgSWMEt3LjUDqmQUeMkpMvP+JFSTBKWAnca2nF8wWFgiU
	aH51nwXEZhFQlTj98Dg7iM0rYClx71cXK4QtKHFy5hOwGmYBbYllC18zQxykIPHz6TJWiLi4
	xNGfPcwQi50kPnY2gr0jIbCHQ2LhiQVMEA0uEh+WdEPZwhKvjm9hh7ClJD6/28sGYSdLrP99
	ih3kGQmBHImeaQoQYXuJA1fmsICEmQU0Jdbv0ocIy0pMPbWOCeIEPone30+gpvNK7JgHY6tJ
	HJs0nRXClpHoXHGDcQKj0iwkn81C8tksJN/MQti2gJFlFaNkakFxbnpqsWmBYV5qOTy+k/Nz
	NzGCE6+W5w7Guw8+6B1iZOJgPMQowcGsJMIbWlKVJsSbklhZlVqUH19UmpNafIjRFBjcE5ml
	RJPzgak/ryTe0MTSwMTMzMzE0tjMUEmc93Xr3BQhgfTEktTs1NSC1CKYPiYOTqkGJvfUoo3X
	H9rLcEYYC+ypd7wXcP9I29bLT527xbdX3/nEJLDpy48nk9f9X/L3lbcpy4M3QrW79inVTT+9
	7JjKorJ1QnvYPolF7e0w+crBz6PgPWXbM/9L0jdC9S/d3BakoK5nYlnPLirvLqx14yP7izMv
	0ipK/zI53Co/vJYprfngoc45z9yWGH5onLXw/5y/iS9r3aSUWJYdPVXQc0dX6Z9s6+P8NesP
	XP/hGbd6osaf3GlTFJi+zCib9dcuaEZolKBvw/4pic4RP9rf/bNefNQ5eGkZo6G3yISu+/PY
	z9wLqf3RdrY3fIP4Cd+X+amCeqcrO7S5rjYvOMGcmjHzSZ9X/RFLxsy5CmINUewcDkosxRmJ
	hlrMRcWJABkzLO9FBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsWy7bCSnK43Q02aQV+LhMWDedvYLG4e2Mlk
	cf78BnaLva+3sltM+bOcyWLT42usFpvn/2G0uLxrDpvFjPP7mCwWbf3CbvHwwx52i8Nv2lkd
	eDw2repk87hzbQ+bx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRvl8CVcfq5X8FWsYrNfz+x
	NDCuFOpi5OSQEDCRuHfpLwuILSSwm1FiyoMMiLiMxIc7W5ghbGGJlf+es3cxcgHVPGOUuLf/
	NVADBwebgL5E8w0JkLiIwApGicNHp7OCOMwCzxklNr2YxwTRcZBRYuf7dWCjOAXsJK719LKC
	dAsL+EtMOKwDEmYRUJU4/fA4O4jNK2Apce9XFyuELShxcuYTsOuYBbQleh+2MsLYyxa+hrpO
	QeLn02WsEHFxiaM/e8DiIgJOEh87GxknMArPQjJqFpJRs5CMmoWkfQEjyypGydSC4tz03GTD
	AsO81HK94sTc4tK8dL3k/NxNjODo09LYwXhv/j+9Q4xMHIyHGCU4mJVEeENLqtKEeFMSK6tS
	i/Lji0pzUosPMUpzsCiJ8xrOmJ0iJJCeWJKanZpakFoEk2Xi4JRqYHoSVlO0PW7ter3AOyqX
	Cx+ZfbrKqLFnT/en2rsWMzq4OFQs2/ZEK3z4W8z39fdF4e/Sf27vmcxxiefFvlJ3p+fs/A82
	nV5maOPLpKsvUfOY797xLfObG5R3tex/+OHRncYWnanR5zrW8Ew22XKrboLr1bCWgJzf9hPe
	P9+o80jDT9bUpr895F6qlFmRsRqjgYEz33Stqa63M4MdI599fCJdeazm95fA7+V3eM/uevZq
	xR5ngQkhH7R3CMR7Mih+Z3zTKS1g5ypfFNJs8iVC90T5MpeXklGVe3dLT55acPS5Vd+Dp6ts
	Fix8sPLsykMXJV3WHv779P8xhqWviw2MYjLrPJ4pLVt5zsbSoEc1XVKJpTgj0VCLuag4EQCG
	nSEgLQMAAA==
X-CMS-MailID: 20240626114931epcas5p1d7840cbe7418c6e62b15e4b54bee5d42
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240620103950epcas5p10514d4a19bdfd505d7d92ceb1fe10cc7
References: <CGME20240620103950epcas5p10514d4a19bdfd505d7d92ceb1fe10cc7@epcas5p1.samsung.com>
	<20240620103410.35786-1-vishnu.reddy@samsung.com>
	<38fae674-f672-46e0-a44e-1278deaaf36a@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski =5Bmailto:krzk=40kernel.org=5D
> Sent: 24 June 2024 19:27
> To: Vishnu Reddy <vishnu.reddy=40samsung.com>;
> krzysztof.kozlowski=40linaro.org; s.nawrocki=40samsung.com;
> alim.akhtar=40samsung.com; linus.walleij=40linaro.org
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org; linux-gpio=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; pankaj.dubey=40samsung.com;
> ravi.patel=40samsung.com; gost.dev=40samsung.com
> Subject: Re: =5BPATCH v2=5D pinctrl: samsung: Add support for pull-up and=
 pull-
> down
>=20
> On 20/06/2024 12:34, Vishnu Reddy wrote:
> > gpiolib framework has the implementation of setting up the
> > PUD configuration for GPIO pins but there is no driver support.
> >
> > Add support to handle the PUD configuration request from the
> > userspace in samsung pinctrl driver.
> >
> > Signed-off-by: Vishnu Reddy <vishnu.reddy=40samsung.com>
> > ---
> > Verified the offset from the user manual of following Exynos SoC series
> > and found the current code is taking care of correct offset for pull-up
> > and pull-down
> >
> > Exynos-3250
> > Exynos-3470
> > Exynos-4412
> > Exynos-4415
> > Exynos-5250
> > Exynos-5260
> > Exynos-5410
> > Exynos-5420
> > Exynos-5422
> > Exynos-7420
> > Exynos-7580
> > Exynos-7880
> > Exynos-9820
> > Exynos-9830
> > Exynos-4210
> > Exynos-S5PC210
> > Exynos-S5PV310
> >
> > This patch is tested on FSD platform
>=20
> You verified but...
>=20
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h
> b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > index d50ba6f07d5d..758b623a4bea 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > =40=40 -61,6 +61,13 =40=40 enum pincfg_type =7B
> >  =23define PIN_CON_FUNC_INPUT		0x0
> >  =23define PIN_CON_FUNC_OUTPUT		0x1
> >
> > +/*
> > + * Values for the pin PUD register.
> > + */
> > +=23define PIN_PUD_PULL_UP_DOWN_DISABLE	0x0
> > +=23define PIN_PUD_PULL_DOWN_ENABLE	0x1
> > +=23define PIN_PUD_PULL_UP_ENABLE		0x3
>=20
> ... I said it is not correct, so you send the same? If you think I was
> wrong, then please respond and keep discussion going. Sending the same
> suggests you just ignored my comment.
>=20
> Look at two headers s5pv210-pinctrl.h and s3c64xx-pinctrl.h. How did you
> resolve these?
Thank you for sharing the s5pv210-pinctrl.h and s3c64xx-pinctrl.h  file nam=
es for the pin value information.
I have not ignored your comment. Unfortunately, I don't have the user manua=
ls for the s3c64xx and s5pv210 series.
I have an idea to handle the PIN_PULL_UP value of the s3c64xx and s5pv210 s=
eries by checking the compatibility with the of_device_is_compatible API.
Will it be okay or do you have any other suggestions?
>=20
> Best regards,
> Krzysztof



