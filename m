Return-Path: <linux-gpio+bounces-885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ABB801846
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 00:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86865B21078
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 23:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4626059B6B;
	Fri,  1 Dec 2023 23:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JddLwKVf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2E6196
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 15:59:07 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d0477a0062so56275ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 15:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701475147; x=1702079947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lGsmf0A9APK6VsKgIpT+PFWswpLSWAbxrH99oWb1ZUM=;
        b=JddLwKVfaSCi5feRvMw9xntMQ/hlFhLd+bSRUlwLB435iE8P38VWte1hIl2N0YDq0j
         KGS9eYwmBGDK47azL0lLjLNVsMC5Rp8t6jG3J+XFMjznWdsNiBCFbvW7Hpdp2yl/wzW8
         02SQyVdJT+rFc51CuI6lyFshN1xoSZJWUd+AhXwa6NKUeXP9u08pGGSK4CAomnu1mwxv
         NEnhNT0Hb3rKZqK4rRWuEEcDqX74ezm5b+EBQ27QTx/en1mOu8LLMu2PkS/KgzUfQB1n
         8oH4FWLxohNGlL+jLhNcOeHGfT/qC0VcRGa5qSn03huTICNF1v3qbDFyZ/OwMgAPKf/H
         W8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701475147; x=1702079947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGsmf0A9APK6VsKgIpT+PFWswpLSWAbxrH99oWb1ZUM=;
        b=OrO+mMxLkArtcm87p+oFr9StT4WxSHZ3Gquq/TeR4/nW1XsXcHDpPkxVUTW3wwM4Uy
         oHpvXZWgJUgIghzNhb1xNCCH03Uqmkrbn30bSgJLNBfroG6OCz3IQfJ2dX5QlCKgCSN6
         ALh16iD04Qb/ixpdcSd6o1exhoKZzAxKstb84iG1Wvdho2zqQl/5VU9kPtZqMAvzsGOB
         9nwhflKHl/Hv1RUok40soLgoUsQho7LjWBi3CHkZR/5OMoIfKYh3+9Z0JVuX6/4mLvgW
         ggk98CHXRGJAmNCPLWGIZL3eWvg6dj4FdfpPqMgizg4YLUrj1otaG0LvxHnsoKWerpIs
         MazQ==
X-Gm-Message-State: AOJu0YxsmDN6ZglFcGWqkqALcgeQGUgUH85FG7vhzSUUxAYXQL/Nqh/S
	/ZF8IaUNpzm6nClz38butoynOw==
X-Google-Smtp-Source: AGHT+IGPxpntAuYnfsZtOtic8wadmmCmlzXRjc5vfw1JxQElpfR+kT3R6rvQIh9vsG1M33dTqc9LCg==
X-Received: by 2002:a17:903:3247:b0:1cf:d2c5:af12 with SMTP id ji7-20020a170903324700b001cfd2c5af12mr350869plb.12.1701475146789;
        Fri, 01 Dec 2023 15:59:06 -0800 (PST)
Received: from google.com (148.98.83.34.bc.googleusercontent.com. [34.83.98.148])
        by smtp.gmail.com with ESMTPSA id u17-20020a170902e81100b001bdb85291casm3864016plg.208.2023.12.01.15.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 15:59:06 -0800 (PST)
Date: Fri, 1 Dec 2023 15:59:02 -0800
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 15/20] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
Message-ID: <ZWpzRtmMY2y8Fs5-@google.com>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-16-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201160925.3136868-16-peter.griffin@linaro.org>

On 12/01/2023, Peter Griffin wrote:
> The WDT uses the CPU core signal DBGACK to determine whether the SoC
> is running in debug mode or not. If the DBGACK signal is asserted and
> DBGACK_MASK bit is enabled, then WDT output and interrupt is masked
> (disabled).
> 
> Presence of the DBGACK_MASK bit is determined by adding a new
> QUIRK_HAS_DBGACK_BIT quirk.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

---

I verified boot to a busybox console and that the watchdog probes.

Regards,
Will

> ---
>  drivers/watchdog/s3c2410_wdt.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 0b4bd883ff28..39f3489e41d6 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -34,9 +34,10 @@
>  
>  #define S3C2410_WTCNT_MAXCNT	0xffff
>  
> -#define S3C2410_WTCON_RSTEN	(1 << 0)
> -#define S3C2410_WTCON_INTEN	(1 << 2)
> -#define S3C2410_WTCON_ENABLE	(1 << 5)
> +#define S3C2410_WTCON_RSTEN		(1 << 0)
> +#define S3C2410_WTCON_INTEN		(1 << 2)
> +#define S3C2410_WTCON_ENABLE		(1 << 5)
> +#define S3C2410_WTCON_DBGACK_MASK	(1 << 16)
>  
>  #define S3C2410_WTCON_DIV16	(0 << 3)
>  #define S3C2410_WTCON_DIV32	(1 << 3)
> @@ -100,12 +101,17 @@
>   * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
>   * with "watchdog counter enable" bit. That bit should be set to make watchdog
>   * counter running.
> + *
> + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
> + * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
> + * Debug mode is determined by the DBGACK CPU signal.
>   */
>  #define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
>  #define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
>  #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
>  #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
> +#define QUIRK_HAS_DBGACK_BIT			(1 << 5)
>  
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -375,6 +381,19 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
>  	return 0;
>  }
>  
> +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt)
> +{
> +	unsigned long wtcon;
> +
> +	if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> +		return;
> +
> +	/*  disable watchdog outputs if CPU is in debug mode */
> +	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
> +	wtcon |= S3C2410_WTCON_DBGACK_MASK;
> +	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> +}
> +
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> @@ -700,6 +719,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>  	wdt->wdt_device.parent = dev;
>  
> +	s3c2410wdt_mask_dbgack(wdt);
> +
>  	/*
>  	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
>  	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog
> 

