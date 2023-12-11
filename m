Return-Path: <linux-gpio+bounces-1221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8961A80C675
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 11:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B5281C20CBE
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 10:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DE624B55;
	Mon, 11 Dec 2023 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U2ScmQsl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8902E3
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 02:26:51 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-677fba00a49so34308286d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 02:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702290411; x=1702895211; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBClK4lqtI01tZ9y+a3IQvx46bQqW6gXipVJViDNMLE=;
        b=U2ScmQslrt1u3g+i6gniMNpfQY+5Qts1WcyJ7QriK32oNHKU3zmG5WSXyvNxZDvQL1
         PkubSQ+9gocHlgBCwLeKBXK/qDVgf5p5I/eGmbjfiGKiy7TmqsAfmQTsGYXw5nmmtQFl
         klm1xv5gcLHsCKUp/YtIagxl2mS4kbquUXCd5sT72Fnh5bUb6WFeFihE/gk5rzHY6F67
         kYQYWjMoaYUxqIctsbvN1Jo7yes3f923UIQiieQ+ulQl4rk1O4gsTCbmFrKZg3xO6xIp
         qjBxOZGlEy1X7LQ6y3l6ZGA0RXQoE1EQU6Fb8fVmZmbG5+kp0zutoUCZSL9FxWJzrKMb
         aeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702290411; x=1702895211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBClK4lqtI01tZ9y+a3IQvx46bQqW6gXipVJViDNMLE=;
        b=Om/usk97xYup3nV1xvU4PxzdjQCZi15Rn3OEj0yy+sOAyliMTpl5CSR1Fd9qRRoG+c
         aEUmQ2ry+/DJkmMgZHKgvvNuTsrRWumbpM/QZg65qdppudloEwgmyveMRsnuOWWQHZgN
         nwBgPMS12q/1d24TGmGOw5nJ2L0M8vCEBUIsmZl7DP4ChQIE7HLcfozlc1kOvGgCdD6y
         otADNtvCgiAb1j0Ki5UiLA1uKxHFJy+pq3Welmi09FwnuRcFBvLI3GnfUv2ufh6JhJ1e
         AQ0PvOBBcwjJcjKLrIxE1CnGLhFa9xglAEqc7ElxVHQ+TlR6xmhYSLneijnhuzoxCPcx
         LV+Q==
X-Gm-Message-State: AOJu0YzxF7OpNWq88uU7TVltXejo5evpllRwwaHw3KeBNPwxJFesT+lx
	4N5Uqe+W/moHoVH7Duj6WBDMw+do82E3kNTZT3WNkw==
X-Google-Smtp-Source: AGHT+IGXuSEmjxGIf3QPro+i3LI5BnTbhCqPp7O7UIiBh/LqSwNTV/bm9Ks6TLe0NeBnUASLNjJvb+hNli7R0WXRvsA=
X-Received: by 2002:a0c:fb04:0:b0:67a:ad44:2126 with SMTP id
 c4-20020a0cfb04000000b0067aad442126mr5413328qvp.60.1702290410972; Mon, 11 Dec
 2023 02:26:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-17-peter.griffin@linaro.org> <25533a7f-326f-48d1-a8a6-e5798bdca4b4@linaro.org>
In-Reply-To: <25533a7f-326f-48d1-a8a6-e5798bdca4b4@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 10:26:39 +0000
Message-ID: <CADrjBPrg51Fkkme71yLeFc06ROgAjcchXGoX7Uxrmin-+yBayQ@mail.gmail.com>
Subject: Re: [PATCH v6 16/20] watchdog: s3c2410_wdt: Add support for Google
 gs101 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review.

On Sun, 10 Dec 2023 at 14:26, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:31, Peter Griffin wrote:
> > This patch adds the compatibles and drvdata for the Google
> > gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.
> >
> > Similar to Exynos850 it has two watchdog instances, one for
> > each cluster and has some control bits in PMU registers.
> >
>
>
> > +
> >  static const struct of_device_id s3c2410_wdt_match[] = {
> >       { .compatible = "samsung,s3c2410-wdt",
> >         .data = &drv_data_s3c2410 },
> > @@ -285,6 +318,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
> >         .data = &drv_data_exynos850_cl0 },
> >       { .compatible = "samsung,exynosautov9-wdt",
> >         .data = &drv_data_exynosautov9_cl0 },
> > +     { .compatible = "google,gs101-wdt",
> > +       .data = &drv_data_gs101_cl0 },
>
> Keep some alphabetical order by compatible, so this should be probably
> the first entry in the table.
>
> Same for s3c2410_wdt_variant structures.

Will fix in v7.

Thanks,

Peter

