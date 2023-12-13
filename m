Return-Path: <linux-gpio+bounces-1394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EC2811995
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92F981C210C3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26F1364A0;
	Wed, 13 Dec 2023 16:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qmdpJxxG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9538D83;
	Wed, 13 Dec 2023 08:34:37 -0800 (PST)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231213163435epoutp041264b05df058ff50f1b10d63f324b16d~gcVZ9bQ5E0188301883epoutp04K;
	Wed, 13 Dec 2023 16:34:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231213163435epoutp041264b05df058ff50f1b10d63f324b16d~gcVZ9bQ5E0188301883epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702485275;
	bh=kEQbJdtujh4v1xklB3S9ZLk0YyXXz7IJpUS+2fODp78=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qmdpJxxGSlmFa6Tmr84DHrxb01LJKtgIwYnvZWqXJ2SftGilH/5nc7bTt9PC4rrOY
	 TdyQJe1wzAVsWuY6aBgLOp8xQYkGcN4mLgJnEweMGsalkhSaoG7rhvu4uLtsSjj40O
	 JH6WvUbLIds6eAhQqqYoZqXkDmrDYW1NrrKPOgRo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20231213163435epcas5p12afdac2e7c286a6a12a2f41dbf7a1ebd~gcVZmj3BT2298822988epcas5p1B;
	Wed, 13 Dec 2023 16:34:35 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Sr1KP2qmnz4x9Pr; Wed, 13 Dec
	2023 16:34:33 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B5.C4.09634.91DD9756; Thu, 14 Dec 2023 01:34:33 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20231213163432epcas5p2256c43f4e218c433b7078609dfb2c908~gcVXN-b5V3010530105epcas5p2k;
	Wed, 13 Dec 2023 16:34:32 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231213163432epsmtrp22be51ff79d9882b24ae9e139696cb652~gcVXMoNie1436514365epsmtrp2H;
	Wed, 13 Dec 2023 16:34:32 +0000 (GMT)
X-AuditID: b6c32a49-eebff700000025a2-04-6579dd195504
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C1.04.08817.81DD9756; Thu, 14 Dec 2023 01:34:32 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231213163428epsmtip1447aaa69e5980351b987795d160c50af~gcVTD6ANw0862208622epsmtip1N;
	Wed, 13 Dec 2023 16:34:27 +0000 (GMT)
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
In-Reply-To: <20231211162331.435900-12-peter.griffin@linaro.org>
Subject: RE: [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK macros to
 use BIT macro
Date: Wed, 13 Dec 2023 22:04:26 +0530
Message-ID: <017401da2de2$400ec6e0$c02c54a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQEeDlMUs+qnFg95EVUf+Z9FZqMuEwIEtzV/AWqu9NqyBCwcgA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTZxTP19veW4iwa0H5rJuWBrJIBlJefjhgCLjchaEsm8a4OGzgSpFS
	mj5EmMsQRJBH5TXjEARW5qOrYzxWShmOQZ2KgFtk1GxgYMDkjQJjYxZYS3Hjv9853+93zvmd
	L4eNcdoILjtBoqBlEqGYj9szdR27PDy3DaTS3oYFEjVONDDRcvGPBJq9lg+QtrWHgUwLT1mo
	0tjDQpnqWhzNVLyK9E3OSDU2hKFS83UGqh/uY6Hn+U9YqKHSDNDlh7cZqEtdQKDHX98m0Eh1
	FwP93LkfdZrmcfTN5RUmymo1EqhjKpuFctuXcbTSV8dET1UW1bDJjCONwVJk7teP0Ll+f6SZ
	WwVoeHwFC+VRuhYdi9Je1QLqxT/FgJp9nEVQzWUDBFVVr6TqNRdwqr/vO5y6qdWyqO8rtATV
	UPMp1Xsvg0U1/5VOUKpGDaDm63dEv3I0MUhEC+NoGY+WxCbHJUjig/mR78eEx/gHeAs8BYFo
	D58nESbRwfyId6M9304QW9bF550SipWWVLRQLufvDgmSJSsVNE+ULFcE82lpnFjqJ/WSC5Pk
	Skm8l4RW7BV4e/v4W4jHE0WFfbcY0hGn002/j+LpYI7MBXZsSPpB3b1Z3Io5ZAuAfyzSucDe
	gucANLbUYLZgEcDuoUripWLsbtn6QyuAmd2LTFswBuDDlXGWlYWTnlCvPr9W15l8gkFTzz4r
	CSO1GFxa7bfI2Ww7MhQW6I5ZOU7kh/BGbwPDipmkOyxRdTKt2IEMhMVf6YENb4b3Px9Zy2Pk
	Ttg0XY7ZJuLBpdFrLFveBY7fMRLW8s5kGOy6pbC2haTKHhp7zSwbPwI+qF9ad+MEJ+42rmMu
	nJ9pxa1aSFLwCzPXlhbB6eu1wIbfgm295UwrBSN3wVrDbltXR1jwYoRhUzrAnPMcG9sdZs78
	wrTh7bAoL299AAo2thiIQuBatsFX2QZfZRu8lP3frAowNWAbLZUnxdNyf6lAQqf899uxyUn1
	YO2UPN7Rg4HBZ17tgMEG7QCyMb6zw319Cs1xiBOmptGy5BiZUkzL24G/ZdlFGHdLbLLlFiWK
	GIFfoLdfQECAX6BvgIDv4jCZVRHHIeOFCjqRpqW07KWOwbbjpjNSUFVhuXpzlb5aOPmbS0Zd
	4KR3mHhT1InKi5eCIkYO/R1Wsdfz0UG3fpeW6ppSzQ+jMU15dhM5ob7mc2c4F458JslQSQfV
	D1IiTxoPnApy5/voPnExqDONq++tOCpNW8JvnE2djkvrUZtyfA5ElnQ0P/JKTc9qDckzHxFR
	+dkhO+Kh457MJrHvdvnpakmbo+trmlJR8Z8fpNcs5DdqDw+KzlSDL2+eHSa5tR+7yrrdcH28
	27fhbZoT/L40PGryYsPASQ0Zc0XwXHGUO9RW11pbHL18kFMwsXNyFT/25lXiSsnrE+OXNh2y
	/4mnZBbto+6ItmYf3hrxRnul+5Tp2ZQh6jifKRcJBR6YTC78F8lambzTBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxjG8507NWTH0oUPcJ1r4uKYtugu+UyMgbmRM2Miho1sZrcOjoWM
	Imlhzm3ZKgPmmkJYvWEj1xLQcgAppa2CumBF6LqyJVvbMWRxrSC6rbMu6KDU2TbL+O953+f5
	PXn/eBlcbCEzmbKKKl5ToSyXUSLCfkUm3QyvH+Jzom4xst0eItCKcZxG4W4DQMJFL4b8f8+T
	qM3lJdEX5gEK/dmyDjkdEtR46waOjkV7MGQN+kh01zBLoqG2KEDNU5cw5DE30CjQf4lGoQ4P
	hn5wv4Lc/nsUOtccI1DdRReNrvz+JYn0YysUivkGCTTf+IgK+qMUslx4VBKZfgfVzryALJGH
	AAUXYnjues4+Yic5oVUA3PKSEXDhQB3NnTddp7l2azVntXxFcTO+UYo7Kwgkd7lFoLmhrs+5
	HydqSO78fR3NNdosgLtnlRY8tk+0vYQvL/uQ1yh2vCcqbfL1YZWhtI8cv92kdCDC6kEKA9nn
	4a1rJlwPRIyYHQHQ9m0fljSyoH+wiU7qNHg2Nk8nQ3MA1raMJ0IUuxk6zfVU3JCwERz2Pgwk
	Bpy9gEOvrp5MIi4Af709AvSAYVLYXNhgfztOp7FvwlbBRMQ1wW6ARxvdCZ3KboPGXidI6rVw
	8lSIiKM4K4f1g4k1zj4JHX+cxpPXrYf/3Owmk/t0uHDVRcfjEvYl6OmragJpplVFpv+LTKuK
	TKvgdkBYQAZfqVWr1NotlVsr+INyrVKtra5QyYsPqK0g8U7Z2U4wavlLPgYwBowByOAySeqk
	8yAvTi1RHvqY1xx4V1NdzmvHQBZDyNJTF+80lIhZlbKK/4DnK3nNfy7GpGTqsKf673fMmYTs
	rp7d4UU1v3bl7j5zYbr7cOGp43mvymdHeoKcfVOpR7urU5Hb/UD8/bDz8BmnBBUZeU/hkQe6
	c1U7i3exDZmRa71lx3duqHnmreemNnZ/89q4r7A/z6WrXyrLD+gH2monrLvnaa9572xreLnI
	dqTg5c8MXdLTC8WiY6oBjzPmeELsm9L/0vKzrfrrgS7z0vv7s06sE07mzUh9L17OuKpaZo82
	t+cYpHObRIrQ68Gt3sDE8ERnTjS40Z/RtwgKTm4T1ZSvmTa+cWc49F2noi6qODMadux9Oj9l
	z2SrPjC741P2hHR7flHIaOhd8/hPrtIbHdMFnzyLo/0yQluq3JKNa7TKfwH7N9uavQMAAA==
X-CMS-MailID: 20231213163432epcas5p2256c43f4e218c433b7078609dfb2c908
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231211162434epcas5p485e7b2edbb02a1b6ea04ff5cc758f5db
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	<CGME20231211162434epcas5p485e7b2edbb02a1b6ea04ff5cc758f5db@epcas5p4.samsung.com>
	<20231211162331.435900-12-peter.griffin@linaro.org>



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
> Subject: [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK macros to
> use BIT macro
> 
> Update the remaining QUIRK macros to use the BIT macro.
> 
Ah! I see you have change use BIT here, so you can squash this patch to
patch 10/16 or
Move BIT change from patch 10/16 to this patch. Either way is fine.

> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c
> b/drivers/watchdog/s3c2410_wdt.c index 7ecb762a371d..b7a03668f743
> 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -107,11 +107,11 @@
>   * DBGACK_MASK bit disables the watchdog outputs when the SoC is in
> debug mode.
>   * Debug mode is determined by the DBGACK CPU signal.
>   */
> -#define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
> -#define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
> -#define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
> -#define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
> -#define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
> +#define QUIRK_HAS_WTCLRINT_REG			BIT(0)
> +#define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
> +#define QUIRK_HAS_PMU_RST_STAT			BIT(2)
> +#define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
> +#define QUIRK_HAS_PMU_CNT_EN			BIT(4)
>  #define QUIRK_HAS_DBGACK_BIT			BIT(5)
> 
>  /* These quirks require that we have a PMU register map */
> --
> 2.43.0.472.g3155946c3a-goog



