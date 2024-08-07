Return-Path: <linux-gpio+bounces-8598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C5F949E36
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 05:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 457C91C212A2
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 03:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2629165EF1;
	Wed,  7 Aug 2024 03:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nQtyPQ0T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A68C1E
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 03:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723000585; cv=none; b=T5CJMpW4OySVL8jMmyFrBvD7YLuxMAFRRfVZzbv/Ayj3QsOVmLyfFUI//jfX9r47Ceae0YMWH45AAmKLveE1yXYMDnA2xt23b0EbvTJ60hDcRtiBlrluHqTVAgGeBKdQuOXF532q3LaLm2ge+Ed4v27PYT1LIOzHLaBgo4h4mII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723000585; c=relaxed/simple;
	bh=FzNLjTPfou6CK/yKMp4OHflCEackPGU8SxE//ZWgKJ0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=IJSIdBw5h3SQ89FXzV2SW5SdM/Jq6Qc9uCu8wDVZ4Lh9RroxOmEvPfFDyrwty+odZqG8OgWUzw5biS8UIe5OtlVaZAvb+Xe64DGFbAKkLoqxG1K4UmOvULrLyzah/lNI0bt+gT/A2JZLtrxxClCR2IkZMhrE4yC4GKpD7jJMw5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nQtyPQ0T; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240807031620epoutp045d1e850deed0a068746050342219bae1~pU_ZIVbQD1415214152epoutp04R
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 03:16:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240807031620epoutp045d1e850deed0a068746050342219bae1~pU_ZIVbQD1415214152epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723000581;
	bh=4S8yRftVJB84hYtDxOLjR85E5LvSHUbCJOtjuuOSh5w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=nQtyPQ0T81tRfWdNHejeFF2yCw5KRDf2QVv2BqPrHSRFhpwyCBwDd/MKCcvGin3xv
	 wYyyKDpPieFjn5ai/OjTv/UKTN52rLutpDwxsJHPaSwMmhTr69BZ76rKXguGKFOsXl
	 6eiXMZs+8DAOZlW5z3DnaNNXUtDCjxiuRoF6Do2M=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20240807031620epcas5p4bac06811e6add2dd2ada0d762caeb6b6~pU_YX2d7J0870508705epcas5p49;
	Wed,  7 Aug 2024 03:16:20 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WdwLV2W3Bz4x9Q2; Wed,  7 Aug
	2024 03:16:18 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	11.8E.09743.207E2B66; Wed,  7 Aug 2024 12:16:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20240807031558epcas5p444e86f971799210e63d8f3a66371bd94~pU_EKzGBK0870508705epcas5p4I;
	Wed,  7 Aug 2024 03:15:58 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240807031558epsmtrp23583b006dd7cf9168cfd8076b0a39f78~pU_EJyQXC3064330643epsmtrp2f;
	Wed,  7 Aug 2024 03:15:58 +0000 (GMT)
X-AuditID: b6c32a4a-3b1fa7000000260f-64-66b2e7022925
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	36.A6.07567.EE6E2B66; Wed,  7 Aug 2024 12:15:58 +0900 (KST)
Received: from FDSFTE582 (unknown [107.122.82.121]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240807031556epsmtip232e4158e6232bfa47649be5e895ae26f~pU_Ci4ihJ2295922959epsmtip2H;
	Wed,  7 Aug 2024 03:15:56 +0000 (GMT)
From: "Vishnu Reddy" <vishnu.reddy@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
	<s.nawrocki@samsung.com>, <alim.akhtar@samsung.com>,
	<linus.walleij@linaro.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: <e9963fb7-b963-49b4-96a3-3637f9892784@linaro.org>
Subject: RE: [PATCH v4] pinctrl: samsung: Add support for pull-up and
 pull-down
Date: Wed, 7 Aug 2024 08:45:54 +0530
Message-ID: <00c701dae878$1f1ced80$5d56c880$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJjDs2r5CFDDZj4rtEoUnejfp+kLAG3jwHHAfOZ+Paw7XfJQA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmpi7T801pBou3cVs8mLeNzeLmgZ1M
	Fntfb2W3mPJnOZPFpsfXWC02z//DaHF51xw2ixnn9zFZLNr6hd3i4Yc97BaH37SzOnB73Lm2
	h81j85J6j74tqxg9Pm+SC2CJyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LI
	S8xNtVVy8QnQdcvMATpKSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgUqBXnJhb
	XJqXrpeXWmJlaGBgZApUmJCd8WTqO8aCOQIVl+ZsYmpgXMzbxcjJISFgItG6eDJjFyMXh5DA
	bkaJjUtusoEkhAQ+MUr87VCASHxjlPj9dzI7TMeWfR1QRXsZJY5O4YUoesEosXPmd5YuRg4O
	NgF9ieYbEiA1IgITGSWm3QIbxCzwkFFi4v1PrCAJTgE7iVN9+8BsYYFAibtr5oMNZRFQkVg1
	/yhYnFfAUuLcxW1MELagxMmZT1hAbGYBeYntb+cwQxykIPHz6TJWiGVOEh8OfIeqEZc4+rOH
	GWSxhMBaDomX756yQTS4SCxc9xDqG2GJV8e3QNlSEp/f7YWqSZZY//sUO8gzEgI5Ej3TFCDC
	9hIHrswB+5FZQFNi/S59iLCsxNRT65gg1vJJ9P5+wgQR55XYMQ/GVpM4Nmk6K4QtI9G54gbj
	BEalWUg+m4Xks1lIPpiFsG0BI8sqRsnUguLc9NRi0wKjvNRyeHQn5+duYgSnWC2vHYwPH3zQ
	O8TIxMF4iFGCg1lJhLc5fFOaEG9KYmVValF+fFFpTmrxIUZTYHBPZJYSTc4HJvm8knhDE0sD
	EzMzMxNLYzNDJXHe161zU4QE0hNLUrNTUwtSi2D6mDg4pRqYYm5+K8lSWVor3/LuarLgRtYV
	Wn/ObHtW/XeuyZQ9q1YY2Ut6+kxaZaEq+F/vlfK0D6e88vR4p1U8z2QIPcNT5C76IcTUtm1j
	LHfblFffvL22d/z3//UkSsMrJohZ+ZKz8TfBVb7xq+1klvKee5vw1/zKy/cVs1TDFs9Y5mWr
	6hNYWNbnfGp12dr8Kb/a+6u5BTfEqoUbJ84OOvf0ysdr2g05f59cyna5mWHEt3rlDYeN333T
	EuuvN12+lJPsrs67/5FA9KugDzo2c9fubppTdIDjq7RJexDrJ/Zta0O7fF7u6IotWFC54PTh
	VxvkNS8nNj6b+764UevXXMPHD849fnsx58mPdWU7hJo+Z/TxKrEUZyQaajEXFScCAGGhK2Y6
	BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSvO67Z5vSDBqOCls8mLeNzeLmgZ1M
	Fntfb2W3mPJnOZPFpsfXWC02z//DaHF51xw2ixnn9zFZLNr6hd3i4Yc97BaH37SzOnB73Lm2
	h81j85J6j74tqxg9Pm+SC2CJ4rJJSc3JLEst0rdL4Mp4MvUdY8EcgYpLczYxNTAu5u1i5OSQ
	EDCR2LKvg62LkYtDSGA3o8TE93/ZIRIyEh/ubGGGsIUlVv57zg5R9IxRor37AGMXIwcHm4C+
	RPMNCZC4iMBkRol9bT1gRcwCzxklNr2YxwTRcZBRYsHnaawgozgF7CRO9e0Ds4UF/CW2THvA
	CGKzCKhIrJp/FCzOK2Apce7iNiYIW1Di5MwnLCA2s4C2RO/DVkYIW15i+9s5UOcpSPx8ugys
	V0TASeLDge9Q9eISR3/2ME9gFJ6FZNQsJKNmIRk1C0nLAkaWVYySqQXFuem5yYYFhnmp5XrF
	ibnFpXnpesn5uZsYwfGmpbGD8d78f3qHGJk4GA8xSnAwK4nwNodvShPiTUmsrEotyo8vKs1J
	LT7EKM3BoiTOazhjdoqQQHpiSWp2ampBahFMlomDU6qBqfwKB19MfmuHsZdtoEDmQiWR6pSc
	T09m5qmmvFxm+vtNhNvZ6822HyZz+eqEXyr9KBibkL669WvEW92QyxnlxwwPSG08svbS4Q5h
	28QW1/rQPzsFNs0pTjewWCWvcijEaVvi6X129zo72m5Ou2RS3JBdrrX2gP+Elns13zw1rjAK
	rX7+xOZX8wdBlxVzbjgwbdrpKhByf8ZBC80aVsv9qn+X681Icb6TIH/0sgbnDqX7Ov6XmovZ
	DW/wTje+29K6tILZgu+J8Ryd5X9iEmfWPzt9s7ShyvHMj9ru+TNVy2NKNre3+XSeL0o5v+OD
	pUbzdZ9/rXwPl7Sm3Zn2l9vGqWmnSXRsfuqbDcXH7qsqsRRnJBpqMRcVJwIANBPJrCYDAAA=
X-CMS-MailID: 20240807031558epcas5p444e86f971799210e63d8f3a66371bd94
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240729154736epcas5p111a53e297c7f8c3122bf491cabaf74b8
References: <CGME20240729154736epcas5p111a53e297c7f8c3122bf491cabaf74b8@epcas5p1.samsung.com>
	<20240729153631.24536-1-vishnu.reddy@samsung.com>
	<e9963fb7-b963-49b4-96a3-3637f9892784@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: 04 August 2024 20:15
> To: Vishnu Reddy <vishnu.reddy@samsung.com>;
> s.nawrocki@samsung.com; alim.akhtar@samsung.com;
> linus.walleij@linaro.org
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
> kernel@vger.kernel.org; pankaj.dubey@samsung.com;
> ravi.patel@samsung.com; gost.dev@samsung.com
> Subject: Re: [PATCH v4] pinctrl: samsung: Add support for pull-up and pull-
> down
> 
> On 29/07/2024 17:36, Vishnu Reddy wrote:
> > Gpiolib framework has the implementation of setting up the PUD
> > configuration for GPIO pins but there is no driver support.
> >
> > Add support to handle the PUD configuration request from the userspace
> > in samsung pinctrl driver.
> >
> > Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
> > ---
> 
> Where is the changelog? What happened with this patch?

Sorry, I missed to include changelog in all previous version of patches.
I will take care this part in future, below are the changelogs:

changes in v4:
- Update code in s5pv210_pud_value_init and s3c64xx_pud_value_init
functions for storing the pud values into array using macro names
instead of loop.
- Removed unnecessary and weird style comments.
- Updated proper comments.
- Fixed typo errors.
- Updated macro names based on suggestions which got in v3 review
comments.

changes in v3:
- Add new code to get the s5pv210 and s3c64xx and other exynos
series of pull down, pull up and disable values into an array and use
it in set config function for pud configuration.
- Add clock enable and disable setting while accessing registers.

changes in v2:
- Updated the macro names based on review comment that suggested
to follow the naming conventions according the file how previous macro
names defined.

Do let me know if I need to revise the patch or you are okay to consider
above changelog?

Regards,
Vishnu Reddy
> 
> Best regards,
> Krzysztof



