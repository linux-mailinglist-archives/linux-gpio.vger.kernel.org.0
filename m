Return-Path: <linux-gpio+bounces-7909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2AC924F8A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 05:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9064281DCA
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 03:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5865C749A;
	Wed,  3 Jul 2024 03:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mIrf6RdE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E197134B6
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 03:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977285; cv=none; b=QbIQ/yMRru9M+RzjHzlqC8mTEfAtVMcnlVEa1iHJ98AMpqrXAf7NDHKFy4EA2YZfBKDPddET1UWvJUMPsAHf5Fevr9K501j6tGIodteQD3IW01zgYoNwnMnem9QIpGZ7nSBACHtofJkEvP+lHB+su+uaNaWqMpgoSNNkaLGK0TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977285; c=relaxed/simple;
	bh=ARIekpQhnYUhnUdT7waA6yqvrIk0lhX19I1MkT48bIE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=dwYVK2bfuLnfZUzlCpD08lIjFEL02rek3QF5BeGD/1p3gCnx8zxvuBNGVdYRc50dyDdtEkT8Muc9vM8ICL0GM5UStI6TEngcfBcAK8w54jWSIzoncT955E7OF4dyEyrgMU5tFCds/T+PzUbXGY53wdxATX2LDfOAXRTx4xcBY/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mIrf6RdE; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240703032755epoutp0180c100225141caa8f7c9eae2329fe3b0~eljgZuDYs1653016530epoutp01x
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 03:27:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240703032755epoutp0180c100225141caa8f7c9eae2329fe3b0~eljgZuDYs1653016530epoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1719977275;
	bh=HiRFalHcuRme+HURIVkjBw2o+/SorePbdcpWdvn9xfE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=mIrf6RdEnURk1ZBNTYtFozbrjpP+1xwGbJ5cWZrCOqEJPmJ/GhhJP4Mu4wu4QWqyT
	 Pu7D8E3NTBnPtNaezSxICQtJXOvAQ1vfZ3GoXd+PEHgu3vP+NQQ7HsQKVe9c7lLQn8
	 6P4PM12sAhO54QbMW78wU31Mqi94/fzj6nQwylKU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240703032754epcas5p179aa6584fe4821edfadcc4cdb043ffab~eljf9x6K_0829008290epcas5p1I;
	Wed,  3 Jul 2024 03:27:54 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WDQFz1mgnz4x9Px; Wed,  3 Jul
	2024 03:27:51 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	78.C1.11095.735C4866; Wed,  3 Jul 2024 12:27:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240703031925epcas5p3b3b59bf3c981597a49e3be1776005b19~elcFvsxUg1894018940epcas5p3f;
	Wed,  3 Jul 2024 03:19:25 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240703031925epsmtrp16da8fa8b4fc7452099065d1f26784fa6~elcFuk9-U0703407034epsmtrp1q;
	Wed,  3 Jul 2024 03:19:25 +0000 (GMT)
X-AuditID: b6c32a49-423b770000012b57-55-6684c537847b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	32.01.07412.D33C4866; Wed,  3 Jul 2024 12:19:25 +0900 (KST)
Received: from FDSFTE582 (unknown [107.122.82.121]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240703031923epsmtip14d94ef010ea2fa15582f42e7bdc5533d~elcEB80fm2713527135epsmtip1H;
	Wed,  3 Jul 2024 03:19:23 +0000 (GMT)
From: "Vishnu Reddy" <vishnu.reddy@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Krzysztof Kozlowski'"
	<krzysztof.kozlowski@linaro.org>, <s.nawrocki@samsung.com>,
	<alim.akhtar@samsung.com>, <linus.walleij@linaro.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: <b1b6ccc8-ab83-4d4e-8902-769e12975580@kernel.org>
Subject: RE: [PATCH v2] pinctrl: samsung: Add support for pull-up and
 pull-down
Date: Wed, 3 Jul 2024 08:49:22 +0530
Message-ID: <00e601daccf7$ce1d5c30$6a581490$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJsl4iGk1jvO+hY9fFKxJSBqey3YQJX8oCQAbw/7GgCIZ1lJgH0CiQ3AUxadNACwAZFAwIN5Vo7sE6fCKA=
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmlq750ZY0g0fN3BYP5m1js7h5YCeT
	xfnzG9gt9r7eym4x5c9yJotNj6+xWmye/4fR4vKuOWwWM87vY7JYtPULu8XDD3vYLQ6/aWd1
	4PHYtKqTzePOtT1sHpuX1Hv0bVnF6PF5k1wAa1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7yp
	mYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QeUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XU
	gpScApMCveLE3OLSvHS9vNQSK0MDAyNToMKE7Iwtx04xFxwRrth9vbSBsVWgi5GTQ0LAROJ9
	12vmLkYuDiGB3YwSf/9OZ4NwPjFKXNnyjQXC+cYosfThCjaYlrWfZkNV7WWUODbpNFT/C0aJ
	1RfXAmU4ONgE9CWab0iAxEUE9jBK3Lz6FqyIWeAho8TE+59YQYo4Bewkrn73AJkqLBAo0fzq
	PguIzSKgIvH98Q5WEJtXwFJi6r3tTBC2oMTJmU/AapgFtCWWLQQ5HOQiBYmfT5eB1YsIJEnM
	2vSKFaJGXOLozx6omj0cEjcWsUDYLhK3/++EigtLvDq+hR3ClpJ42d8GZSdLrP99ih3kTAmB
	HImeaQoQYXuJA1fmsICEmQU0Jdbv0ocIy0pMPbWOCWIrn0Tv7ydMEHFeiR3zYGw1YFBNZ4Ww
	ZSQ6V9xgnMCoNAvJY7OQPDYLyQOzELYtYGRZxSiZWlCcm55abFpgmJdaDo/u5PzcTYzgtKvl
	uYPx7oMPeocYmTgYDzFKcDArifBKvW9OE+JNSaysSi3Kjy8qzUktPsRoCgzticxSosn5wMSf
	VxJvaGJpYGJmZmZiaWxmqCTO+7p1boqQQHpiSWp2ampBahFMHxMHp1QDk6za3cezOWIPeE/4
	7FsZHsZ3l1Xs2rqG2Y/myW+fWhaxcmp3y9VAj0Nmtw2rxb7t1xCszBXm2d3e3Lny/Mva9Zee
	76i+neofPr+arU/ELsVm86PzSgYxsdyFZ+/rbDa6vm/KvP3B/CVrfbrvJZZqiCl43fG2OiG7
	h0eCR91775Mbi5o4pH69EbgpmuR1n08iXPnWIellC9tnlnrITtv8IyxI483SKVx3O6+K7op+
	Xa/4Mrif5/TxioB/vze2uUguOVDtKCzw88w6n53xbRdzV0hPUvwhVSy6x8H3TvlTwylnXKql
	fhVpVismvQxZpjZ96dWO+8pxlfsmLOi/tYZT9d7zMy/u71/c+bZKOC5CRYmlOCPRUIu5qDgR
	AFZL7mlEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsWy7bCSnK7t4ZY0g6u71SwezNvGZnHzwE4m
	i/PnN7Bb7H29ld1iyp/lTBabHl9jtdg8/w+jxeVdc9gsZpzfx2SxaOsXdouHH/awWxx+087q
	wOOxaVUnm8eda3vYPDYvqffo27KK0ePzJrkA1igum5TUnMyy1CJ9uwSujEfrtrEUbBeuOH38
	I2MD4yv+LkZODgkBE4m1n2azdTFycQgJ7GaUuLP8PCNEQkbiw50tzBC2sMTKf8/ZQWwhgWeM
	Ep83O3cxcnCwCehLNN+QAAmLCBxglDg2XQRkDrPAc0aJTS/mMUEM3cws8atjFhNIA6eAncTV
	7x4gprCAv8SEwzogvSwCKhLfH+9gBbF5BSwlpt7bzgRhC0qcnPmEBcRmFtCW6H3YyghjL1v4
	Guo0BYmfT5exQtyQJDFr0ytWiBpxiaM/e5gnMArPQjJqFpJRs5CMmoWkZQEjyypGydSC4tz0
	3GTDAsO81HK94sTc4tK8dL3k/NxNjODY09LYwXhv/j+9Q4xMHIyHGCU4mJVEeKXeN6cJ8aYk
	VlalFuXHF5XmpBYfYpTmYFES5zWcMTtFSCA9sSQ1OzW1ILUIJsvEwSnVwNTfo7H/X/m13qxZ
	0y+vZ8nPD/hw+P9aOcHSL/cjpeOqOZ89XHGnLHlC3h2b6rPrJ6h97RNhiOTfrWLlcs1oSUSc
	9tz7XF1BK9k5Djl4TNaWrXGWbRQ94b9Wba7YmS+m8+J7J8wPnxO3wXSV89a0XWF/Fyg4GvwL
	eTqlwrtlZqjwvfWHZJnmuEYLxzXUCrFHTI1Sa1l11vxIKpPmphd2P1Sdih0ktfTtWvbt81i8
	+sLd9hqJbwm8c44vO7m7R4v53Cb5fSEmSYbeLLFr1lxvYjRkMPGoevXu3/or2zumq4SVnUj2
	uWK1MPDqSt8+/Y/z32yImGuwROz/jR11R602Be/ZpXz1bL+90dOLMbornZVYijMSDbWYi4oT
	AWpttJksAwAA
X-CMS-MailID: 20240703031925epcas5p3b3b59bf3c981597a49e3be1776005b19
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
	<07f201dac7be$e81317d0$b8394770$@samsung.com>
	<4efb51f3-4600-4d88-a5df-e7be43294d53@linaro.org>
	<086b01dac896$e988fed0$bc9afc70$@samsung.com>
	<dbe55275-a13e-46a3-8b45-b08c301088d4@kernel.org>
	<b1b6ccc8-ab83-4d4e-8902-769e12975580@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski =5Bmailto:krzk=40kernel.org=5D
> Sent: 27 June 2024 20:58
> To: Vishnu Reddy <vishnu.reddy=40samsung.com>; 'Krzysztof Kozlowski'
> <krzysztof.kozlowski=40linaro.org>; s.nawrocki=40samsung.com;
> alim.akhtar=40samsung.com; linus.walleij=40linaro.org
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org; linux-gpio=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; pankaj.dubey=40samsung.com;
> ravi.patel=40samsung.com; gost.dev=40samsung.com
> Subject: Re: =5BPATCH v2=5D pinctrl: samsung: Add support for pull-up and=
 pull-
> down
>=20
> On 27/06/2024 17:22, Krzysztof Kozlowski wrote:
> > On 27/06/2024 15:35, Vishnu Reddy wrote:
> >>>
> >>> I don't remember the code used here, but usually such choices are
> >>> determined by driver match data (and flags or value customized per
> variant).
> >> Hi, Thanks for suggestion.
> >> I have gone through this and found that driver match data in this driv=
er is
> stored in the __initconst section, which is freed up after kernel initial=
ization.
> So we have two options:
> >> 1: Keep this platform specific data in driver match data and then popu=
late
> driver_data field in probe function.
> >> 2: Use compatible matching and set different values during set_config.
> >>
> >> First approach will result in many changes, such as populating  driver
> match data for all platforms and then storing the same in driver_data in
> probe.
> >>
> >> In the second approach, we can handle this using simple if/else based =
on
> a compatible match.
> >>
> >> IMO, second approach would be simpler and introduce less changes. Any
> suggestions from your end?
> >
> > Please wrap your email according to mailing list style.
> >
> > Both options are not the way because you introduce a new, different
> > style of handling per-variant customization. The driver already parses
> > match data and stores such per-variant-details in different places, lik=
e
> > samsung_pin_bank or samsung_pinctrl_drv_data. This seems like a value
> > fixed per entire device, so could go to samsung_pinctrl_drv_data.
>=20
> ... although maybe this matches your first option? Not sure.
My understanding is same that the value is fixed per entire device. We can
add the pud data into samsung_pinctrl_drv_data and then fetch the pud
values during probe.
I will test this and submit v3 soon.
>=20
> Best regards,
> Krzysztof



