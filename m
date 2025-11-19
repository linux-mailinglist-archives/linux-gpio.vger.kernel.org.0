Return-Path: <linux-gpio+bounces-28827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FF7C704E6
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CE012365592
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D602FD69A;
	Wed, 19 Nov 2025 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G8CxBo5X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E6D2FD1C6
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571191; cv=none; b=c1lpW76yuWmUdVrsN+7ORuuogmKfs7lAzhlAWRDinUtPEOg/P302DyyJ8mh6uGDilIPdBON4AW3kPsEOJuJmrcigOaSRDUwSaCnwZgUozQzYoUdyP3GME047Lgx2B3vQqjJwf8dj4zgO3+SWnsiBD63K37pyei2XVoUd9cAz5fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571191; c=relaxed/simple;
	bh=JdYmHDS2ThLvPTXgosCOxi7O/VrEkwzzajRlx9vVFeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsBs01wZe19kKSvnRXAFbjWp2pikvuvg0yy/SenNRUw7iPDrktyoziX/JWZnUQd4Xi51MeFFIuWymiSyI8FtVMErLHD5UQ2N7XzAt7yyDqmXdWs/g+vuwkfD1A+zQHHXaODxl9M95v0pmHmkHP4HIkQfX4dV60gGlMD5nWqpe/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G8CxBo5X; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5957db5bdedso6585615e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 08:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763571186; x=1764175986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdYmHDS2ThLvPTXgosCOxi7O/VrEkwzzajRlx9vVFeY=;
        b=G8CxBo5X7QZwUlDFGi9Hw3vYEw3e9QA093NkvMBqy9elyW1FL7GEJZS9fCq4Y9aNH1
         4ug9EAriSAdTkjTH4BI3ptSgN5ta2BuN1G5G5v9187/O83Py5pDRv9WCa/iB6oKfZQki
         IGxihuqZ8i37fVIu8MzCMz1u/demtkw9lcsYI7kthgK//RSGDsXtwYegjD0ECfaPBz3U
         OnQpdVUPf3jGTfecjMX0Csek8xzO3JLKiNCgSQpP08oaXKz2R3OhAVGbU3WUV/qs4Z/a
         ELZ9NYpnBUlpCIydIa9frKeyL3vE/5spSDMOhkzw2/XXqIQ/3St44yDXMo1LeSKY77rZ
         5izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571186; x=1764175986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JdYmHDS2ThLvPTXgosCOxi7O/VrEkwzzajRlx9vVFeY=;
        b=HO9clEne6qGumaHMEv7KOVT5qLBd/DwZEyBlytOt561AewOTt+IIMVb4cor0WO9uxP
         mZSMVqB4mhWTy9b+udocWHICi/CysMnNVJWzmh50BeMSeQJsOEOrn01kFBJ5jgnAYGz1
         TuGSbl4igdP+dCU6SPAM0thAYTHYSqHgRivb/wmwEd61sYx4iRzMMyYgimHvVqFERC1d
         /aA5nrDpD+xkE9yCou5KEPl0BfVncQGnwYYpIwK+BdJpHfKaVsa7uVxInbVCKT0l/nEE
         f6VATVpSFbJk93Asu+KcAFfCVfYVxpSQsQVOAoZZLDu3x/o2j4VvTJJdDNiPjDeyJnLq
         W8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWXo56mcWZyawABFWWE8qJ1v7sRDIe3te5gP9aAtssQOLBpQO2D1butwwE/LP33LaToPrgynsHlSU5f@vger.kernel.org
X-Gm-Message-State: AOJu0YylECOQsKP9vuKc3cXSu/GoU1JMdd7KNrIs7PfpRX8SQKG1EbRH
	SJrxDYNr9AzFDZuPhLVIayhpwJrQJeiH5AbEsSLnSNnR+hBY3nOY/g0KitpvF19Hs/QKrGhFeGG
	Ii0yNZiVa2ZkHqJvk/T9zDtW5NtFl2LDMN8BiJaG4Vw==
X-Gm-Gg: ASbGncs166EeMa6Hpp38behs4DU+EauQ9pSnJ7u26iqLdKibf3/AtVHYrdsbd2D1V8p
	FkalL1xdlr0sAIgp7T9aimMKth4ytIb87KdlFxPeoGhsFCCaHiF4Ncw5zhYRV/60TrJ9F38CEJ0
	88zKlU7p62LOfoGo/8Z+UfqK2K78grX9fF31RNABS9aRo0y1P/TtPKGiqiHMvHSQIRcI9n3TLFW
	8K4hEMGtB5eda6gKhZu9atFTTeCdfwOxdgbKnT/REWYUnwCK8wMa10D9QMeglNoDTsWcLnEWit1
	0oDxb1pd9XGqJ8mclN26SqY+cRKGen1Uw6X9AKn9nxlZ0bnp
X-Google-Smtp-Source: AGHT+IGJtgkXzlVHhpR54E98Q1dz300qvb2er/d0j4UVTlfL15yMaNJyTuXE0A6OJZClUybjDYS5OMsTTf3Wmd5Iph4=
X-Received: by 2002:a05:6512:1326:b0:594:2cdf:1941 with SMTP id
 2adb3069b0e04-59604e3f4e4mr1415629e87.31.1763571186312; Wed, 19 Nov 2025
 08:53:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119163327.16306-1-jszhang@kernel.org>
In-Reply-To: <20251119163327.16306-1-jszhang@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 17:52:54 +0100
X-Gm-Features: AWmQ_bliEKMyampC3Eq7lBUu-gYbXMocNF0Jufm322iNWDs-qdWQZkWMYwmPk6A
Message-ID: <CAMRc=MdL0hqr=iDo4WietZ+9Cc12U25h4Uvmu8MXSCnxscP13A@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] gpio: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 5:51=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
> left as is, because the memory for saving HW context is not trivial,
> if we convert them, then the two drivers' users may complain for
> !CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.
>
> patch to gpio-dwapb.c is tested on real HW, others are compile-tested onl=
y.
>

Please don't submit a new version of a 15 patch series every couple hours. =
:/

Give people time to review.

Bart

