Return-Path: <linux-gpio+bounces-1390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B991811931
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7411C210CE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DC233CFE;
	Wed, 13 Dec 2023 16:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nUpbupoi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BC083;
	Wed, 13 Dec 2023 08:24:11 -0800 (PST)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231213162409epoutp0356c11593163893954a6089beaa221e12~gcMTWPHbQ2305723057epoutp03G;
	Wed, 13 Dec 2023 16:24:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231213162409epoutp0356c11593163893954a6089beaa221e12~gcMTWPHbQ2305723057epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702484649;
	bh=K2Z9vFnf7mpL13jEaXOuxYQ/7/4WeeOVu5AXF86OdSU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=nUpbupoioP10Qg+itCEifcBULZaxFWC9ZO42OP95qAOX74CQQRPHvDjcCy9MFZMVu
	 Ckruc40euMqQfHxvJxMN4mF4pe7I9btveofCTj/sxfOsFx1/K1NVRUcP+a37IfmaxL
	 HzLMWtlg2Z9ZiYRKQvQJWp1T4uOTGswmKUa/Ylq8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20231213162409epcas5p298fcec4ae90c5461cbae6460fe7466f7~gcMS_tat62242322423epcas5p2C;
	Wed, 13 Dec 2023 16:24:09 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Sr15M58NQz4x9Pr; Wed, 13 Dec
	2023 16:24:07 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9C.33.08567.7AAD9756; Thu, 14 Dec 2023 01:24:07 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20231213162406epcas5p1ba19db7d5abf61b7d2eb2dc84e15f150~gcMQoYm0A2627126271epcas5p1M;
	Wed, 13 Dec 2023 16:24:06 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231213162406epsmtrp26ac0a902b1ea2f70c561c1dbaee77aa6~gcMQl5rf30608006080epsmtrp2C;
	Wed, 13 Dec 2023 16:24:06 +0000 (GMT)
X-AuditID: b6c32a44-617fd70000002177-e8-6579daa74d5b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E7.D5.07368.6AAD9756; Thu, 14 Dec 2023 01:24:06 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231213162402epsmtip19f81ac507419a595d0fd94445304eb49~gcMMb-R0x0862108621epsmtip1p;
	Wed, 13 Dec 2023 16:24:02 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
	<conor+dt@kernel.org>, <sboyd@kernel.org>, <tomasz.figa@gmail.com>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <arnd@arndb.de>, <olof@lixom.net>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<cw00.choi@samsung.com>
Cc: <tudor.ambarus@linaro.org>, <andre.draszik@linaro.org>,
	<semen.protsenko@linaro.org>, <saravanak@google.com>,
	<willmcvicker@google.com>, <soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <kernel-team@android.com>,
	<linux-serial@vger.kernel.org>
In-Reply-To: <20231211162331.435900-10-peter.griffin@linaro.org>
Subject: RE: [PATCH v7 09/16] pinctrl: samsung: Add gs101 SoC pinctrl
 configuration
Date: Wed, 13 Dec 2023 21:54:01 +0530
Message-ID: <017201da2de0$cb2ed820$618c8860$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQEeDlMUs+qnFg95EVUf+Z9FZqMuEwIDfwFVAR9h5iGyBo1g8A==
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfVSTZRTved99Ac5ePorHaTl2IoTTgCXQA0eKDPQNkjhx7Jw6R2hub0DA
	NjcI8RyTRBAn7KCHOrhASApyrMaXgNDIxkchQpIERFNTWCjyIWCYfIw2Xiz/+917f7/nd+99
	zuXgLj+yeZwkWRqllIlTBCxHRmO7t4+waiST8q/r80ANE/UMtHK6i41mKvMB0hv7MDT0YJyJ
	yjr6mCi7wsBC06VbUHOTG9LcuYWjouUqDNWNDjLRbP4NJqovWwao+Jc2DF2pKGCj4e/a2Gjs
	yysY6r8cgS4PzbNQTbGVgXKMHWzUPnmcidSmFRayDtYy0LjGphodWmYhXYvtkbmROHTMHIh0
	c6sAjd614mF8srG1kUnqz+oBubR4GpAzwzls8qL2Opssr0sn63QnWKR58HsWeV6vZ5I/lOrZ
	ZP1XR8iBn48yyYsPs9ikpkEHyPm652Oefj95RyIlllJKPiWTyKVJsoRQQVRs/BvxgUH+IqEo
	GL0i4MvEqVSoIPytGOGupBTbugT8j8Up6bZUjFilEvi9ukMpT0+j+IlyVVqogFJIUxQBCl+V
	OFWVLkvwlVFpISJ//5cDbcQPkhPN175mKx5uONh/+3AWKHNSAwcOJAJgSUk3pgaOHBeiFcC8
	DjWDDuYA7DIYWXSwAGBtTTbjscSY07teMAJYbTGvS+4AWFbQCewsFiGEzRW5LDt2I27gcKjv
	dTsJJ/Q4fLRqxu0FByIM6o62rJFcib1QO16zZsEgPOFUe+8ah0sEwyFTEYPGzrD7zNgaxomt
	sGmqBKdb4sNHlkomnXeHdzs72GrAsRnvhOW3jth9IaFxhJZJPZPmh8MsyxmMxq5w4qcGNo15
	cH7aPjPHhkl4bplHpxPhVJUB0Pg1eGmghGGn4IQ3NLT40a4bYcHSGEYruTAv14Vme8Ls6d/W
	97YZnjp5cr0BEt68Xs4sBB7aJ+bSPjGX9olZtP+blQOGDmyiFKrUBEoSqBDJqIz/vlsiT60D
	a7fkE94MhsusviaAcYAJQA4ucON2N2dQLlypOPMQpZTHK9NTKJUJBNqWfQrnPSOR245RlhYv
	Cgj2DwgKCgoI3h4kErhz7+WUSl2IBHEalUxRCkr5WIdxHHhZmJeh0GdjT59l9zvn5R6bCsK+
	ec86e3A4XoNiy5eei/rUfOAzXx7WNvJhZLR5oSG2yfhRXIio8N5S4+Gi2d6/zBO/+jZtM1W4
	CRXz1/aP7vt8sjWqfqW27+1dA7svyJ2tZ90UWvKQk0CasUGd7rww4z0b8ocwIqCsS7F6qYZx
	AJ7gHrsPLNUaL5M2+hMjxvdsFpWUNIxHKx/EiUZv/1nbmYHkxw1ZuX+bnbY4qLO3SfZcfSli
	2st1Yeve4v5Ii+oLhxerpNXeydGxQYs69/33qd+fzc0r5fg5JOKd+ZV7eGNzsfU9YzcXt1+Q
	fLsYmdTTs69ocinrzX9eSHnqXX32uc1XMysFDFWiWOSDK1XifwH6mvUX1AQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sb0xTVxiHd3r/Uu28tETPYHGsuswRRDrRnC1m0YnmLtvcMuIynBk2cFMR
	qE0rY7gZqgjOpmsaxACdtDAYQmkclA4LCGRtZ4AgG8FQ1hUjFMa6UBl0gSBYRmmW8e133t/7
	PHk/HBoTmolYOlt+gVPKpbliko+3O8U79zZ4CrnklTuJyPZXG46eld2n0FyDFiBL9xAPuf+Z
	IZDJNUSg4rofSPSk+kVkvxuDdH9OYKh89TYPWX2jBJrXPiJQm2kVoMpfenhosO4bCo3d6aHQ
	VO0gDw0PHEMD7iCJWipDOCrpdlHIOXuNQBrHMxKFRltxNKNbp3zuVRKZO9clC57P0FXvAWRe
	WAPI5w9hh+PZ9q52grUYLYBdeVoG2LmxEortMIxTbI01n7War5Osd/QeyTZZLATbW22h2Lb6
	IvZh3xWC7VhSU6zOZgZs0Lrzw22n+IeyuNzszznlvrfO8M96R76nFEtbvxievKQGpi0aEEVD
	JgV2lzwgNYBPC5kuACu0zbxIEQfdrXoqkkWwKTRDRZb+AHC+ZYoIFySzF9rrSjfoGGYBg81r
	YxsPjOnE4JC6lIggLgBvTd7Ew0gUcxiar3SS4Sxi0qBpTrOhwplXYMD5AAtnAfMGdDvK8UiO
	hv1VU+uZXrcmwdJWEB5jzEvwbuAWFjkvHi5PNxCR+Q7o/9lFhddjmLdhzUSRHogMm0SG/0WG
	TSLDJrgG4GbwAqdQ5cnyMiUKiZwrSFJJ81T5cllS5vk8K9j4Tgl77OCRKZTkADwaOACkMXGM
	oN9ewAkFWdLCi5zyfIYyP5dTOUAcjYt3CCSV32YJGZn0ApfDcQpO+V/Lo6Ni1bzn6+4ZCyrG
	d6dvl5yb5JS2hMZeL/vjB550T4ZymjrYGd04c9mybPzutf7721ZeXRp6M8eYyfKvPjefbCs/
	nb51cZfwyXjR0jtaj6ix8rg69XpOypmQ9uH26EHn6G+Jlx/D218e2p080X8xbbKlOVXj9gZO
	DvXZ5LP6QNVXxvphmfiGfi012RF8XxjoiEtRnND1MPrGd9GnpvRTP3VpZS/XCnQHqvx7XIna
	2l0fDZRVFJ8THblWdNT9iaX7mH/k5JZfJU3tx3W+/fvekxU7V4+8PnswWPh32nhsH/r4BK3I
	6B1Z/HqkADl+rw4+ro+/6fedTs2mFhYLl6f3824cZe1BvRhXnZVKEjClSvovulMx070DAAA=
X-CMS-MailID: 20231213162406epcas5p1ba19db7d5abf61b7d2eb2dc84e15f150
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231211162431epcas5p2e2ec25eea1849559515c4e2855a8d58c
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	<CGME20231211162431epcas5p2e2ec25eea1849559515c4e2855a8d58c@epcas5p2.samsung.com>
	<20231211162331.435900-10-peter.griffin@linaro.org>

Hi Peter

> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>
> Sent: Monday, December 11, 2023 9:53 PM
> To: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> mturquette@baylibre.com; conor+dt@kernel.org; sboyd@kernel.org;
> tomasz.figa@gmail.com; s.nawrocki@samsung.com; linus.walleij@linaro.org;
> wim@linux-watchdog.org; linux@roeck-us.net; catalin.marinas@arm.com;
> will@kernel.org; arnd@arndb.de; olof@lixom.net;
> gregkh@linuxfoundation.org; jirislaby@kernel.org;
> cw00.choi@samsung.com; alim.akhtar@samsung.com
> Cc: peter.griffin@linaro.org; tudor.ambarus@linaro.org;
> andre.draszik@linaro.org; semen.protsenko@linaro.org;
> saravanak@google.com; willmcvicker@google.com; soc@kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> gpio@vger.kernel.org; linux-watchdog@vger.kernel.org; kernel-
> team@android.com; linux-serial@vger.kernel.org
> Subject: [PATCH v7 09/16] pinctrl: samsung: Add gs101 SoC pinctrl
> configuration
> 
> Add support for the pin-controller found on the gs101 SoC used in Pixel 6
> phones.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 140 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>  3 files changed, 143 insertions(+)
> 
[snip]
> 
> --
> 2.43.0.472.g3155946c3a-goog



