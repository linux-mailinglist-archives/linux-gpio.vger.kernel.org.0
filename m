Return-Path: <linux-gpio+bounces-1393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C3A811989
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3A9B282505
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E1D30CF1;
	Wed, 13 Dec 2023 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="o5ScghGD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0632093;
	Wed, 13 Dec 2023 08:32:13 -0800 (PST)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231213163209epoutp02101bd489719d6cc2339a917e868af828~gcTRzokle3039730397epoutp02x;
	Wed, 13 Dec 2023 16:32:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231213163209epoutp02101bd489719d6cc2339a917e868af828~gcTRzokle3039730397epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702485129;
	bh=KUfT0ywkN6Hh0IdE7MAqQ90nma1tQ6+iUg+nPKFFyuE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=o5ScghGDYbZgxZ7WA/pToIgNVjI4NAUH/OUreery1mothJ1kphqPlbWQnaKNNZOSs
	 sLtncGdfZxH64tCqK3tmmWvEhwqqn6u071xV8T1AOnJYYMLho6AtFtMfzrPYH3FFRL
	 7qtVzIozaAPMct3YzuILnK8+BcRh3AizuszUpezM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20231213163208epcas5p2bfa7038ed65965287d6492c138a05bea~gcTRk4p8d2277522775epcas5p2D;
	Wed, 13 Dec 2023 16:32:08 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Sr1Gb1zNsz4x9Pt; Wed, 13 Dec
	2023 16:32:07 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F5.A3.08567.78CD9756; Thu, 14 Dec 2023 01:32:07 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20231213163206epcas5p4e4ffab3f4dc6f1e605608f505b55b253~gcTO1TcSq3019130191epcas5p4e;
	Wed, 13 Dec 2023 16:32:06 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231213163206epsmtrp2c8447d688ee061d394bdc9ca1a5a9737~gcTOz2H6Q1436514365epsmtrp2I;
	Wed, 13 Dec 2023 16:32:06 +0000 (GMT)
X-AuditID: b6c32a44-3abff70000002177-08-6579dc87b6a4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EA.4C.08755.58CD9756; Thu, 14 Dec 2023 01:32:05 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231213163201epsmtip15168ecb4fcfd3b9ca30ad70562d9270d~gcTKrNgX_1594515945epsmtip1H;
	Wed, 13 Dec 2023 16:32:01 +0000 (GMT)
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
In-Reply-To: <20231211162331.435900-11-peter.griffin@linaro.org>
Subject: RE: [PATCH v7 10/16] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
Date: Wed, 13 Dec 2023 22:02:00 +0530
Message-ID: <017301da2de1$e8cafe80$ba60fb80$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQEeDlMUs+qnFg95EVUf+Z9FZqMuEwIfeFBLAf+Ykz+x/q2gwA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxz29Pa2hVm4FgwHZNh1OocK0vE6LIAvZHeOTLJlS3RmeCl3QIC2
	tlRwWTIcD6EIgpuJNLwE1ME62QChFHlYEAURR0RgC7IgoPKWhzKQx1oubvz3/b7zfef3+87J
	j4cJDFw7Xrg0mlZIqUgRx5xd2ei4w+ls72na5YnBHFWMlLPR0oVmLpq8eg4gbW07C3XPPsNR
	XlM7juILSzloIsce6aqsUfrzfgz9tHiNhcoGunA0da4PR+V5iwBdelDHQm2FaVzUc72OiwYv
	t7FQR+sh1No9w0G/XVpmo8TaJi5qHDuLI7VhiYOWu35no2fpRtdA9yIHleiNl0z/9TVK6HVH
	JdMrAA0ML2P7hGRlTSVOanO1gHy9cAGQkz2JXLJa85hL5pepyLKSFA7Z23WTQxZrtThZn6Pl
	kuVF35Odd3/Ayeq5OC6ZXlECyJkyh0DLYxHeYTQVQiuEtFQiCwmXhvqIPvk86GCQu4eL2Ens
	hTxFQikVRfuI/AICnfzDI43PJRKeoiJVRiqQUipFe3y9FTJVNC0MkymjfUS0PCRS7iZ3VlJR
	SpU01FlKR38odnH5wN0oPBERltGcxZHPbIvtv6/H48AjBzUw40HCDZ7v+wWogTlPQNQAqGvr
	4zDFNIDVD5NZTPEKwMbzE9w3Fk3RXTZzUAvg/IuhNdVzADvGf15VcQgnqCtM4piwNdGHwe72
	/SYRRmgxOL/Si5kOzIh98N5YDTBhK4KGqbdrjAYej01shzNJ0ETzCS84tVDJYvAm2JI1yDZh
	jNgKq8azMWYiIZwfuoozvA0cvt3EZfoegOMJTat5IKE2h7qGP9Yi+MHG3F/ZDLaCI3cq1ng7
	ODNRuzoDJEhYsGjH0GFw/FopYPBe2NCZzTZJMMIRlur3MG0tYNrrQRbj5MPkJAGj3g7jJx6t
	NdoCM1NTcQaTcCj9DMgA72jWBdOsC6ZZF0bzf7N8wC4BtrRcGRVKS9zlYikd899/S2RRZWB1
	mXb66UBP3rKzAbB4wAAgDxNZ81t0MbSAH0Kd/pZWyIIUqkhaaQDuxsfOxOw2S2TGbZRGB4nd
	vFzcPDw83LxcPcQiG/5oYk6IgAiloukImpbTijc+Fs/MLo7ldkgvbYx4+XRXk0XsnR5LJW69
	Qd+XePO4RrTxpP+nXZ5WWZKFhqJJm4uuS6pXxIupbzxHSJvDs8E9VOzJhH2lqmCLmItH3+88
	8PT46IDjjTT7W386PbyRN5qZv7vLfVd89+aWe4/VG64E1EsQePIAmb91UItXqUO35Ca2pdjM
	W/8Tcea7j7ytqVp79TCcqxboZCVkbk3pF8XvVU04yAre3r3Vsm4p+eiIY8iXrZWn+MEDYwG2
	Vz6+v/Gr6pXOv6/P22bNNvFdhylddkrxtk326TUn4vSpl2f0pZ/9eMuXu7c/edjX5t3qY7kS
	fka31ZECf7bg8I65ZkVi8EulR72hY9TniFjEVoZR4p2YQkn9C6hdzy7VBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sb0xTVxjGc+7/dmm4AxaOwIA0g40qIAuGs43MZs7kalwUPiyrbI4Kd6BQ
	KC1MMcts1GLosCF14083RVfjRrmDtTRQSsVYigFk6DYEoriNoAObVoUu2cYqDtos49tz3ud5
	fu/74TB4dCcZzxyqrOE1lcoKKSUmeoekSRn62Tp+q96Qixy+HgI9NV2n0ePLjQAJVyYwNP3H
	AonavRMkOmnpptCjc4nI2ReLjItzOPo89A2G7PNTJFpq/IVEPe0hgFpvDmJo3HKGRjNdgzS6
	f3EcQz+O7URj00EKfd+6SiD9FS+NhvynSWTwPKXQ6pSNQAvGtdb8dIhCVtcaZPnOAXRqdhuy
	Lj8DaP7hKi5P4XoHeklOOC8A7p8VE+Aez+hprt98j+Yu2Gs5u7WB4man3BTXIQgkd/WcQHM9
	l45zkyMnSK7/Tx3NGR1WwAXtSfui9ovzSviKQx/zmqw3i8RlTdfbKHXwpaNzP7hIHbidZAAi
	BrI50HxphDAAMRPNDgB41TZJRIwEOG1roiM6BnasLtCR0O8AjnR9GQ5RbAZ0WuqpdSOWXcZh
	57OZ8ANnXTic0NWTkYoXwP6xr8MsESuHN/wDYF3HsMVQf2IcMwCGIdhUGKyH62MJ+xpcWunF
	Ivp5ONp2n1iP4GwmrLeFmzibDPsCX+GR61Lg3w8uk5F5HHw47A1vimXfgoFTXqoJxJg3kMz/
	k8wbSOYN7QuAsIJNvFqrKlVps9XZlfyRTK1Spa2tLM0srlLZQfg/ydKdoM/6JNMDMAZ4AGRw
	aaxk1HmEj5aUKOuO8ZqqDzW1FbzWAxIYQhoniVs8UxLNlipr+HKeV/Oa/1yMEcXrsJq33Yrd
	vqg6omvoM+0LjjeKhoe/2JVK3bBE6VdefFkpvYbIfHR6dyPFqy3Owv3u8lJTfnHejgLFlvwD
	bb8WVTeTr8RVN4iztgbcz+Xuio/KGBy3rF14NNseMxvcs/19R/8t10Xrzy3b3xEF3jWlf3c4
	5ZHxYIZzDNss/Na9WCXdqTvpF20mtmyqbpGX5HYoyET5vdDrZ5t9yT76p6Q+xp9YkCeYdihq
	Zf677+01eCYDha+6RlO5zqYETKZO6N7XnjqXdTxNLFEUhFShpUKP+1vCV5x2tqDrPG0MfPSJ
	zCHMl8n/+nRIo/cv7U03Nqc9KM8RtbR+0JBjW85KvikltGXKbBmu0Sr/BW/uWC6+AwAA
X-CMS-MailID: 20231213163206epcas5p4e4ffab3f4dc6f1e605608f505b55b253
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231211162433epcas5p382678abfa0f045b73a2d8c12c74d3f17
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	<CGME20231211162433epcas5p382678abfa0f045b73a2d8c12c74d3f17@epcas5p3.samsung.com>
	<20231211162331.435900-11-peter.griffin@linaro.org>

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
> Subject: [PATCH v7 10/16] watchdog: s3c2410_wdt: Add support for WTCON
> register DBGACK_MASK bit
> 
> The WDT uses the CPU core signal DBGACK to determine whether the SoC is
> running in debug mode or not. If the DBGACK signal is asserted and
> DBGACK_MASK bit is enabled, then WDT output and interrupt is masked
> (disabled).
> 
> Presence of the DBGACK_MASK bit is determined by adding a new
> QUIRK_HAS_DBGACK_BIT quirk. Also update to use BIT macro to avoid
> checkpatch --strict warnings.
> 
> Tested-by: Will McVicker <willmcvicker@google.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c
> b/drivers/watchdog/s3c2410_wdt.c index 0b4bd883ff28..7ecb762a371d
> 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -9,6 +9,7 @@
>   *     (c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>
>   */
> 
> +#include <linux/bits.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/types.h>
> @@ -34,9 +35,10 @@
> 
>  #define S3C2410_WTCNT_MAXCNT	0xffff
> 
> -#define S3C2410_WTCON_RSTEN	(1 << 0)
> -#define S3C2410_WTCON_INTEN	(1 << 2)
> -#define S3C2410_WTCON_ENABLE	(1 << 5)
> +#define S3C2410_WTCON_RSTEN		BIT(0)
> +#define S3C2410_WTCON_INTEN		BIT(2)
> +#define S3C2410_WTCON_ENABLE		BIT(5)
> +#define S3C2410_WTCON_DBGACK_MASK	BIT(16)
> 
>  #define S3C2410_WTCON_DIV16	(0 << 3)
>  #define S3C2410_WTCON_DIV32	(1 << 3)
> @@ -100,12 +102,17 @@
>   * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g.
> CLUSTERx_NONCPU_OUT)
>   * with "watchdog counter enable" bit. That bit should be set to make
> watchdog
>   * counter running.
> + *
> + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit.
> Setting
> + the
> + * DBGACK_MASK bit disables the watchdog outputs when the SoC is in
> debug mode.
> + * Debug mode is determined by the DBGACK CPU signal.
>   */
>  #define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
>  #define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
>  #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
>  #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
Probably these above defines might also give checkpatch --strict warnings,
so you can change to use  BIT macro here as well.

> +#define QUIRK_HAS_DBGACK_BIT			BIT(5)
> 
>  /* These quirks require that we have a PMU register map */  #define
> QUIRKS_HAVE_PMUREG \ @@ -375,6 +382,19 @@ static int
> s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
>  	return 0;
>  }
> 
> +/* Disable watchdog outputs if CPU is in debug mode */ static void
> +s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt) {
> +	unsigned long wtcon;
> +
> +	if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> +		return;
> +
> +	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
> +	wtcon |= S3C2410_WTCON_DBGACK_MASK;
> +	writel(wtcon, wdt->reg_base + S3C2410_WTCON); }
> +
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd); @@ -700,6
> +720,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>  	wdt->wdt_device.parent = dev;
> 
> +	s3c2410wdt_mask_dbgack(wdt);
> +
>  	/*
>  	 * If "tmr_atboot" param is non-zero, start the watchdog right now.
> Also
>  	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the
> watchdog.
> --
> 2.43.0.472.g3155946c3a-goog



