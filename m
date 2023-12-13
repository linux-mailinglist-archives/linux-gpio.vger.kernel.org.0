Return-Path: <linux-gpio+bounces-1395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F85F8119C1
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D6EFB20FF1
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47CE39FC8;
	Wed, 13 Dec 2023 16:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YcI+3vfJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B6498;
	Wed, 13 Dec 2023 08:42:12 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231213164210epoutp027458a90750e48990fa3534dcf00073fe~gccCI7Gnm0948109481epoutp02R;
	Wed, 13 Dec 2023 16:42:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231213164210epoutp027458a90750e48990fa3534dcf00073fe~gccCI7Gnm0948109481epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702485730;
	bh=+0oW3jgYcC0AXU5SXvWMpmtVZTXc58/iVuCs2NO6N5Q=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YcI+3vfJR8eNGO2fhzmlGmEKg9nYb9hSiEJ+9IGR027hi4jbNUpeczDpcBYhsibo5
	 sJcV5eiNQQioiipYAddn32QA+MDoXRMCru7UOqyxBKI1Be3Stt2jKX5Rx9fuKTwmyr
	 DoTTby1s4AePJ1wnwU2R/LlgmTfK0qoO+oJnzD3g=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20231213164210epcas5p2bcf8ece486681731842a9e2122a00a35~gccBpbH0u0921009210epcas5p2U;
	Wed, 13 Dec 2023 16:42:10 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Sr1V858BCz4x9Pp; Wed, 13 Dec
	2023 16:42:08 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7A.F2.09672.0EED9756; Thu, 14 Dec 2023 01:42:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20231213164208epcas5p3ad056fa6ad7cc9dc00ac5c8ad5a84014~gcb-lim583108931089epcas5p3f;
	Wed, 13 Dec 2023 16:42:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231213164208epsmtrp2c8ba0d9149b52bd98f4342616b76c634~gcb-kTrIC1984019840epsmtrp2I;
	Wed, 13 Dec 2023 16:42:08 +0000 (GMT)
X-AuditID: b6c32a4b-60bfd700000025c8-98-6579dee04dfa
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F5.6C.08755.FDED9756; Thu, 14 Dec 2023 01:42:07 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231213164203epsmtip1f03ac3699482279568fca70400c8e7e1~gcb7Zyj-60728607286epsmtip1L;
	Wed, 13 Dec 2023 16:42:03 +0000 (GMT)
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
In-Reply-To: <20231211162331.435900-13-peter.griffin@linaro.org>
Subject: RE: [PATCH v7 12/16] watchdog: s3c2410_wdt: Add support for Google
 gs101 SoC
Date: Wed, 13 Dec 2023 22:12:02 +0530
Message-ID: <017501da2de3$4fad8950$ef089bf0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQEeDlMUs+qnFg95EVUf+Z9FZqMuEwGYygq+AkfiRXGyAKPW4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxz29Lb3FhLkrnZyZDy6LiSDjEehdAcHUzdwN3HJiGbqHhlUuKEM
	KF1vmcPMDYc8BGkmqGDlNRFQrDIKgSKivJwDEafycIIMCqaAAxXMEIG6lqsb/33f73zf+X6/
	38nhY4JWwpkfq9TQaqU8Xozbc+vbPT29R4aTab9UgwjVTdVy0XLubwR6VHEYIH1zDwcNPDXz
	UElHDw+lllXjaKbIBRkbhEg7MYqho0uVHGQY6+ehJ4eHeai2ZAmggpuXOai7LIdAdy9cJtD4
	L90cdKsrDHUNzOHo1wILF6U1dxCo/e8MHspqW8aRpb+Gi8xaq2tsYAlHVRetl8ze+wodHApE
	VbMvABqbtGCbRVR9Uz2P0hfrAbX4PBdQj+6mEVSj7j5BlRqSKEPVIZwa6r+EU2f1eh51pUhP
	ULWnf6R6f/+JRzXOpxCUtq4KUHMGt3DHz+OCFbQ8mlaLaGVUYnSsMiZEvG1HxIcRgTI/ibck
	CL0rFinlCXSIOPTjcO+tsfHWdYlF38rjk6ylcDnDiH3fD1YnJmlokSKR0YSIaVV0vEqq8mHk
	CUySMsZHSWs2Svz8/AOtwsg4xegxV9WA03cPjl/CU0CaMAvY8SEphWZzJScL2PMFZBOA460N
	BEtmAZyusxE7K/kHwKJJ2StHbsd1LitqBrD8fBpgyQSAOZYDXJsKJ72hsSwdt2EhOYzBgZ4t
	NhFG6jG48GIIsx3YkZthe+/gCl5H7oI3nmQDG+aSHtCkM6/UHcggeMXUjLP4Ndh5YnwlACPd
	YcN0Ica2JIILDyp4bN0JTl7tINjgD6CpunClO0hq7WHfdDFgDaHwYGvDS/M6OHWtjmCxM5yb
	sYXxrZiCp5ac2bICTldWv7Rugi29hVybBCM9YfVFXzZ2LcxZHOewTgeYmS5g1R4wdaaPy+I3
	4JHsbB6LKbh4zAJ+Bm/qVg2mWzWYbtUwuv/DSgG3CmygVUxCDM0EqgKU9N7/njsqMcEAVv6S
	1zYjMI089mkDHD5oA5CPiYUOnca9tMAhWp68j1YnRqiT4mmmDQRat30Ec349KtH6GZWaCIk0
	yE8qk8mkQQEyidjJ4WFaUbSAjJFr6DiaVtHqVz4O3845hbMPD10aOU2Y8/3D5GvOFrvg710w
	lyy36m5eP3Wt5kvVuLG7/KR6sWBONG1yND2PnP86y7Olpdyn76jlm0ym+vugnZ6KxvyGuk0u
	ggVdLpNSPif1VTRL043zjnv8Pr1FycZODgc/nXB3W5u3PsfdbTkwSLXb/k6yV+H+HX1NHsUx
	edKuhrcEH6E/p3wzjz/bGDF8O/ye+pxw9My5XRVc1z+yM+73LaTIGv8qMvWYdh8Q3mkO25Bb
	OH9+61BIzdtM3sCN9YOfnFBnq/wf7t++syQtuDFu4lBdzJ581y/SGx9vPxNwNXgL7rvm2W3J
	Z9nJloRObWSB1i7jHdEPBUbDYGZpfnpXrpjLKOQSL0zNyP8FeszHFdQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUyTZxSGffp+gmt4bZv1QUVdN+dHpILZkseNGPdhfKdhURZ/iEHWyDsg
	0Ja1ILJssd0EWYWOoRCtoCgEadfB2jqoSGEplQ3GMHOMdgM6BFyRVBnFhChYRtss4999zn3u
	K/ePQ2MCI7GWzlbkcyqFLFdCRuOt3ZIN8WPeIi7BfhTdnLbh6HllD4VmGssAMjsGeMj9xEeg
	q64BAn1R30Kix7Xrkb1NhPRT9zF0YfEGD1knhgg0W+YlkO3qIkAX73byUH99OYU8zZ0UmrzW
	z0O/9u1Dfe45En13MYijYoeLQt3+swTSOZ+TKDhkwZFPv5yacC+SyNS+DAn8eRydGXkdmQJL
	AE08DGJ7N7Gtt1sJ1nzFDNiFZ5WAnfEUU+wtwyjF1lkLWKvpS5IdGeogWaPZTLBdtWaKtTWc
	Zgd/+pxgb81rKFZ/0wTYOeuGQzGp0UkZXG72SU61c8+H0Vn3q+Ly3OJTD6o7SA0oFulAFA2Z
	12Cl62dcB6JpAXMbwH5nE4gY66DbUkFFtBAagz4qcvQ3gGf/qMVCBsnEQ3t9CRkyREwAg98s
	ecIDxrRjcEBTQoSuBIwLwGltVkhHMXth9+BwOC1kjsDgwjAZ0jizGY4bfOE9n9kNu8YdZESv
	gb2XJpf70ctQKSyxhNthzEbY9qgGi7TbBJ8+aCQiezF8eMcVbi1i3objLTWgAggNK0iG/0mG
	FSTDinQdwE0glstTyzPl6sS8RAVXKFXL5OoCRab0hFJuBeFv2r7NDtpM/0idgEcDJ4A0JhHx
	e+2FnICfISv6hFMp01UFuZzaCdbRuETMF0+VZwiYTFk+l8NxeZzqP5dHR63V8JjGN6ocI7zz
	UP/j7OFkScsTwLb37KRmLOn5P8Scsc3uahb/3jCaVPouoyLTdSev5XdUpyri9mzcpvd/Onai
	OdhQ5j93bF/UlK/Gp0ybNnztAV1/vbq1VHv6hcM7Jvu6PZsTvBVKu1Qbg+0/0pRic4/MrbZo
	3OfvLJVu/d77UecvTY+M+lnDyzPr9xfcq1bvut4zqLjun1+tDdTx8bSj/pRYeuzu8QMvwRvu
	5LfOlcXqPKPlgVOP54Ut73N4IVoY/I1Nk7+323FvNDnm6Wf8LXE52jUfGC9L3nnl43rlwaLh
	rtIXTfEJwJXt/WrVIfHBTt63VSmZOc9WpfZ6kyxvMsIdElydJUvcjqnUsn8BxvhPf7wDAAA=
X-CMS-MailID: 20231213164208epcas5p3ad056fa6ad7cc9dc00ac5c8ad5a84014
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231211162436epcas5p4161dfb5a2b849edc6856662e5b42693d
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	<CGME20231211162436epcas5p4161dfb5a2b849edc6856662e5b42693d@epcas5p4.samsung.com>
	<20231211162331.435900-13-peter.griffin@linaro.org>



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
> Subject: [PATCH v7 12/16] watchdog: s3c2410_wdt: Add support for Google
> gs101 SoC
> 
> This patch adds the compatibles and drvdata for the Google
> gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.
> 
> Similar to Exynos850 it has two watchdog instances, one for each cluster
and
> has some control bits in PMU registers.
> 
> gs101 also has the dbgack_mask bit in wtcon register, so we also enable
> QUIRK_HAS_DBGACK_BIT.
> 
> Tested-by: Will McVicker <willmcvicker@google.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 49
> ++++++++++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c
> b/drivers/watchdog/s3c2410_wdt.c index b7a03668f743..c3046610ab5d
> 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -69,6 +69,13 @@
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
> 
> 
[snip]
>  static const struct of_device_id s3c2410_wdt_match[] = {
> +	{ .compatible = "google,gs101-wdt",
> +	  .data = &drv_data_gs101_cl0 },
>  	{ .compatible = "samsung,s3c2410-wdt",
>  	  .data = &drv_data_s3c2410 },
>  	{ .compatible = "samsung,s3c6410-wdt", @@ -605,9 +640,10 @@
> s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct
> s3c2410_wdt *wdt)
>  	}
> 
>  #ifdef CONFIG_OF
> -	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index
> */
> +	/* Choose Exynos9 SoC family driver data w.r.t. cluster index */
Exynos9 introduction is out of context here, so you can leave it as original
comment, it is not adding anything here.

>  	if (variant == &drv_data_exynos850_cl0 ||
> -	    variant == &drv_data_exynosautov9_cl0) {
> +	    variant == &drv_data_exynosautov9_cl0 ||
> +	    variant == &drv_data_gs101_cl0) {
>  		u32 index;
[snip]
> --
> 2.43.0.472.g3155946c3a-goog



