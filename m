Return-Path: <linux-gpio+bounces-7754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B991A7FB
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43620288794
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 13:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EDC194147;
	Thu, 27 Jun 2024 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="A8DjVxl9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1720F19306C
	for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495373; cv=none; b=BVMT/oASyDWjzdLrPbqHikL8Ep8kQS51Bu5S55fBNK0kavXOoFVDc8crbN6GqbzfdDlwdUPFQ9Mg310w9cBGS69DiMvjQPIomqMpstZLJIGuqEggFXYZgeFzyg23EPw9PU/Kgp2fFpb3yoTGJetNoa8G5Bz2QRKgXDIGKbYw51g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495373; c=relaxed/simple;
	bh=o0xP6qtuI2xAaBgmlMNQoczDWl/0Ocbp9qhH2FYUfKA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=cwp98tR12RfXTvjAdWnKs0LHrLOgqCquW66bH/bm7KsWfsHR2m9cAMNF2bDsghRMZ6UkqJez41NOoZDu8+2GRGodDVQQeUvbKhiwnOIpGS5PWW/jno78uuk+aN86caZjnL5iF7ufORwmegUdIYn3jMOUoBhzXA3L8rnsXOJuC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=A8DjVxl9; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240627133608epoutp037ce54e54f648b2b318775d895fca17a0~c3_1Mpyjv3023730237epoutp03X
	for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 13:36:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240627133608epoutp037ce54e54f648b2b318775d895fca17a0~c3_1Mpyjv3023730237epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1719495368;
	bh=oZFefIbTEXfHE9kmb3JrnZ21gch5OUIrWc+UYD4fy9g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=A8DjVxl9q1pWqqCXRYMT9VbexFW1Hvr4XKyeOn1ojjf6weJTfQSXIL/80bNB1hKdf
	 rImJvk1T4zMgrzBPOLE13G9FSw8yQung0BdLgoYoD0MwuPO+H/8Yp9iQxZPElHHW+z
	 m7lBZ3Mvzay6akrvJ3RVMLAuL7JvxeEm/7xm2zLg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240627133607epcas5p31dcfcf49b7b2bf04481fb31eb45863e0~c3_0w1SXL0254402544epcas5p3U;
	Thu, 27 Jun 2024 13:36:07 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4W902Y5wF4z4x9Pt; Thu, 27 Jun
	2024 13:36:05 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	85.AC.07307.5CA6D766; Thu, 27 Jun 2024 22:36:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20240627133545epcas5p461398bd51e6482f7a364fdfbb69e7243~c3_gMDdY22898428984epcas5p41;
	Thu, 27 Jun 2024 13:35:45 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240627133545epsmtrp29817ddeb1ef407da2f71aed6b8766c56~c3_gLWIqR0470304703epsmtrp2G;
	Thu, 27 Jun 2024 13:35:45 +0000 (GMT)
X-AuditID: b6c32a44-3f1fa70000011c8b-17-667d6ac54660
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	C3.59.18846.1BA6D766; Thu, 27 Jun 2024 22:35:45 +0900 (KST)
Received: from FDSFTE582 (unknown [107.122.82.121]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240627133542epsmtip185ac39553214b64cc180369a2688d07b~c3_d1AfLO0198001980epsmtip1E;
	Thu, 27 Jun 2024 13:35:42 +0000 (GMT)
From: "Vishnu Reddy" <vishnu.reddy@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Krzysztof
 Kozlowski'" <krzk@kernel.org>, <s.nawrocki@samsung.com>,
	<alim.akhtar@samsung.com>, <linus.walleij@linaro.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: <4efb51f3-4600-4d88-a5df-e7be43294d53@linaro.org>
Subject: RE: [PATCH v2] pinctrl: samsung: Add support for pull-up and
 pull-down
Date: Thu, 27 Jun 2024 19:05:41 +0530
Message-ID: <086b01dac896$e988fed0$bc9afc70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQJsl4iGk1jvO+hY9fFKxJSBqey3YQJX8oCQAbw/7GgCIZ1lJgH0CiQ3sHaumEA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmuu7RrNo0g6br2hYP5m1js7h5YCeT
	xfnzG9gt9r7eym4x5c9yJotNj6+xWmye/4fR4vKuOWwWM87vY7JYtPULu8XDD3vYLQ6/aWd1
	4PHYtKqTzePOtT1sHpuX1Hv0bVnF6PF5k1wAa1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7yp
	mYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QeUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XU
	gpScApMCveLE3OLSvHS9vNQSK0MDAyNToMKE7Iz315oYC16qVGzsvs3awLhLrouRk0NCwETi
	4b3XzF2MXBxCArsZJa70bYVyPjFK9M27yI7g9G9lgmlZ8vsjVGIno8TsWXugnBeMEvt/bARy
	ODjYBPQlmm9IgMRFBPYwSky43M8I4jALPGSUmHj/EyvIKE4BO4mtVx8zg9jCAoESza/us4A0
	swioSqy7mQcS5hWwlLj0u40ZwhaUODnzCQuIzSygLbFs4WtmiIsUJH4+XcYKEReXOPqzBywu
	IuAncebJehaQvRICWzgkmu+9Y4RocJE4e7gbqllY4tXxLewQtpTE53d72SDsZIn1v0+BPSMh
	kCPRM00BImwvceDKHLAzmQU0Jdbv0ocIy0pMPbWOCeIEPone30+ggcUrsWMejK0mcWzSdFYI
	W0aic8UNxgmMSrOQfDYLyWezkHwzC2HbAkaWVYySqQXFuempyaYFhnmp5fAIT87P3cQITr1a
	LjsYb8z/p3eIkYmD8RCjBAezkghvaElVmhBvSmJlVWpRfnxRaU5q8SFGU2BoT2SWEk3OByb/
	vJJ4QxNLAxMzMzMTS2MzQyVx3tetc1OEBNITS1KzU1MLUotg+pg4OKUamBLecjpKuBjck5Vv
	bfwYY/01eTfvv/fz/uiz80tK5hw4cZ7/vWRmjvBH97dnPNvMnLMeCt5h/7LYIH6JlslSjQ4Z
	0XQOI50LV2N/l23WUJQXWiDmt3VvnMYFx2Oln67+yr/4a76S58K+Gh41ocC9nQdO335fdXxa
	TfU156mx175NCjh9J3R6XFcQ//mDEcE6dVzfnpWtW/OMQ5ojyuTt6b2aLN0Triqf1fD7xrez
	/NItubMNjUklS14+360YNd/llFCfZ2mTpWLGRh9dS9XGoj7WSXuX87DWdkauNVvyZc37/qTL
	1fdUJ4YfnP/71BLpz1NtvJTMtx6KiNhSYKge0/Zjj+UKeR/9tV7hVZm7lFiKMxINtZiLihMB
	3nhi4EYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsWy7bCSnO7GrNo0g3vvhS0ezNvGZnHzwE4m
	i/PnN7Bb7H29ld1iyp/lTBabHl9jtdg8/w+jxeVdc9gsZpzfx2SxaOsXdouHH/awWxx+087q
	wOOxaVUnm8eda3vYPDYvqffo27KK0ePzJrkA1igum5TUnMyy1CJ9uwSujKb1Z9gL5qlUvLnK
	3cD4VLaLkZNDQsBEYsnvj+wgtpDAdkaJTY1OEHEZiQ93tjBD2MISK/89B6rhAqp5xihxbkIr
	SxcjBwebgL5E8w0JkLiIwAFGiQOtT5lBHGaB50CDXsxjguhYyCSxbOpFJpBRnAJ2EluvPmYG
	6RYW8JeYcFgHxGQRUJVYdzMPpIJXwFLi0u82ZghbUOLkzCcsIDazgLZE78NWRhh72cLXUMcp
	SPx8uowVIi4ucfRnD1hcRMBP4syT9SwTGIVnIRk1C8moWUhGzULSvoCRZRWjaGpBcW56bnKB
	oV5xYm5xaV66XnJ+7iZGcMxpBe1gXLb+r94hRiYOxkOMEhzMSiK8oSVVaUK8KYmVValF+fFF
	pTmpxYcYpTlYlMR5lXM6U4QE0hNLUrNTUwtSi2CyTBycUg1ME2Syty1NWKF6asoOVu4AO4Uj
	+fftr//W5Un0dnS7WFRe++oo30IxQ/cNJ2fECxR27lRxCmu9z5e78Mj/lwcducwm5//8f31H
	fsqe9dqBP68+e7vzpOXWu5fn5sQJ222yyrH/su+v0Z/0h0v7V1l23fTnMFf3YdvcXl/9jC3w
	+oqtzhZGPYft0nvKjr/ITTs1s/9Sp+Xz9GPqSt6PHx8W/nJMpThR36z+ec19jrmuHZGtvodZ
	jxd+UfgzrdPWcE1lc3Ti15wMMce/fIIsua9f2GkLCV+bPzvr2I726mVRM60eJq1RP/zkyMVy
	udzFvGqN79svrrs7Y+9CRoOlVr5fTtXvEFBu5Xr11thmCYuGEktxRqKhFnNRcSIAqMSdoCgD
	AAA=
X-CMS-MailID: 20240627133545epcas5p461398bd51e6482f7a364fdfbb69e7243
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



> -----Original Message-----
> From: Krzysztof Kozlowski =5Bmailto:krzysztof.kozlowski=40linaro.org=5D
> Sent: 26 June 2024 18:31
> To: Vishnu Reddy <vishnu.reddy=40samsung.com>; 'Krzysztof Kozlowski'
> <krzk=40kernel.org>; s.nawrocki=40samsung.com; alim.akhtar=40samsung.com;
> linus.walleij=40linaro.org
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org; linux-gpio=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; pankaj.dubey=40samsung.com;
> ravi.patel=40samsung.com; gost.dev=40samsung.com
> Subject: Re: =5BPATCH v2=5D pinctrl: samsung: Add support for pull-up and=
 pull-
> down
>=20
> On 26/06/2024 13:49, Vishnu Reddy wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski =5Bmailto:krzk=40kernel.org=5D
> >> Sent: 24 June 2024 19:27
> >> To: Vishnu Reddy <vishnu.reddy=40samsung.com>;
> >> krzysztof.kozlowski=40linaro.org; s.nawrocki=40samsung.com;
> >> alim.akhtar=40samsung.com; linus.walleij=40linaro.org
> >> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> >> soc=40vger.kernel.org; linux-gpio=40vger.kernel.org; linux-
> >> kernel=40vger.kernel.org; pankaj.dubey=40samsung.com;
> >> ravi.patel=40samsung.com; gost.dev=40samsung.com
> >> Subject: Re: =5BPATCH v2=5D pinctrl: samsung: Add support for pull-up =
and
> >> pull- down
> >>
> >> On 20/06/2024 12:34, Vishnu Reddy wrote:
> >>> gpiolib framework has the implementation of setting up the PUD
> >>> configuration for GPIO pins but there is no driver support.
> >>>
> >>> Add support to handle the PUD configuration request from the
> >>> userspace in samsung pinctrl driver.
> >>>
> >>> Signed-off-by: Vishnu Reddy <vishnu.reddy=40samsung.com>
> >>> ---
> >>> Verified the offset from the user manual of following Exynos SoC
> >>> series and found the current code is taking care of correct offset
> >>> for pull-up and pull-down
> >>>
> >>> Exynos-3250
> >>> Exynos-3470
> >>> Exynos-4412
> >>> Exynos-4415
> >>> Exynos-5250
> >>> Exynos-5260
> >>> Exynos-5410
> >>> Exynos-5420
> >>> Exynos-5422
> >>> Exynos-7420
> >>> Exynos-7580
> >>> Exynos-7880
> >>> Exynos-9820
> >>> Exynos-9830
> >>> Exynos-4210
> >>> Exynos-S5PC210
> >>> Exynos-S5PV310
> >>>
> >>> This patch is tested on FSD platform
> >>
> >> You verified but...
> >>
> >>> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h
> >> b/drivers/pinctrl/samsung/pinctrl-samsung.h
> >>> index d50ba6f07d5d..758b623a4bea 100644
> >>> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> >>> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> >>> =40=40 -61,6 +61,13 =40=40 enum pincfg_type =7B
> >>>  =23define PIN_CON_FUNC_INPUT		0x0
> >>>  =23define PIN_CON_FUNC_OUTPUT		0x1
> >>>
> >>> +/*
> >>> + * Values for the pin PUD register.
> >>> + */
> >>> +=23define PIN_PUD_PULL_UP_DOWN_DISABLE	0x0
> >>> +=23define PIN_PUD_PULL_DOWN_ENABLE	0x1
> >>> +=23define PIN_PUD_PULL_UP_ENABLE		0x3
> >>
> >> ... I said it is not correct, so you send the same? If you think I
> >> was wrong, then please respond and keep discussion going. Sending the
> >> same suggests you just ignored my comment.
> >>
> >> Look at two headers s5pv210-pinctrl.h and s3c64xx-pinctrl.h. How did
> >> you resolve these?
> > Thank you for sharing the s5pv210-pinctrl.h and s3c64xx-pinctrl.h  file
> names for the pin value information.
> > I have not ignored your comment. Unfortunately, I don't have the user
> manuals for the s3c64xx and s5pv210 series.
> > I have an idea to handle the PIN_PULL_UP value of the s3c64xx and
> s5pv210 series by checking the compatibility with the
> of_device_is_compatible API.
> > Will it be okay or do you have any other suggestions?
>=20
> I don't remember the code used here, but usually such choices are
> determined by driver match data (and flags or value customized per varian=
t).
Hi, Thanks for suggestion.
I have gone through this and found that driver match data in this driver is=
 stored in the __initconst section, which is freed up after kernel initiali=
zation. So we have two options:
1: Keep this platform specific data in driver match data and then populate =
driver_data field in probe function.=20
2: Use compatible matching and set different values during set_config.=20

First approach will result in many changes, such as populating  driver matc=
h data for all platforms and then storing the same in driver_data in probe.

In the second approach, we can handle this using simple if/else based on a =
compatible match.=20

IMO, second approach would be simpler and introduce less changes. Any sugge=
stions from your end?
>=20
> Best regards,
> Krzysztof



