Return-Path: <linux-gpio+bounces-10549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A936989CAB
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 10:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 716D31C218B4
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 08:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA6E176AC8;
	Mon, 30 Sep 2024 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AjVDaqN5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D2E17332C
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727684561; cv=none; b=jqCmMiC+USFjRoG1Lasigu/EEFY0vMBZYvS7u//ufNqLaGtm7//hpJ9lWp+PmDVMZhzwPFgm+3GHYjlONSVyV+N86k5JMjsDOQJEijDny9VvUax7cxSnAjKQTlZQJpvSEJ3IBjpHawLp8RLl4z27iVbm9hHLHDAF54qiK4HLXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727684561; c=relaxed/simple;
	bh=jAyQ5z//ge6upJRh90LG5/4z5YzQKZ1YE/rxqgzzDCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h5XlwVEIsPXtmtmij/wCRb6dE8xqlwdYicWMqgj6dETBVsucs/+ztz4wOFvoQ5TudP/I02NphExKn6KZJCitb8OWhuxKBOrd37bLFJzdjvVezGyhC0nhLKHPYTLBp7DBItF6rN6OVWRXGhq0xxOfO+il9/cOnQvY+5vb33He6kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AjVDaqN5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37ccd50faafso2597853f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 01:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727684558; x=1728289358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHqObhGRdeHLD7sYS0ZFtby+4VazJd0VGtHv0LVcrpI=;
        b=AjVDaqN5JmXXAGVjx0bwm31Rcssd1XAxVDvdSkfPLnlj1+egK6KGkbWWTdbFuPrNZj
         j6pAlLJYLctze4XUS6HhIIld4zHDnCyVup9gXgIPmCcdMKvyrcU18V/rCD8qFUKQlCvb
         F/BpDNC/WKyXX8mjiap8btcP0npsXDHtxXqwptSuYtSkxvDW5JuZieA+cW5GFtGmuwER
         VOR+TsWVvxD4vhhNmRGoxt+kaloglbKVex1+DWUAhE6fDRsyT35q7M0zWIOuJ18xPM2u
         /fP7Li15TCRejQo5u1wdaI62Lw6HBnUV+fA7xvTHHiMcSk9QHDeZWs38suZ5/Ltue/9p
         NUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684558; x=1728289358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHqObhGRdeHLD7sYS0ZFtby+4VazJd0VGtHv0LVcrpI=;
        b=wtCEfP09REMg4g+xpSy3Cbds+cqPlJo6slp1MEaBN1Wm45oklSL6/7GqR5EVqIYOvS
         06Ek31bq4eZWX2J/wn6dNoI9Xv6l3AwfortqgE/TjpcR5kWR8Epv51YUJuRZFCz6FO29
         ZbbnZVqel95BOTVy8XZh3HBcfb6lTlqY6XSjfdoIMk9nsXF7pn3rVhMc0ftG+uZYfxqK
         hqxd1/nxJKKHJIijvmxts9lYffDoYmgMxRaR6WF4Ba+EwoY+tNpVJ0nYqr0/WSwO/Nxs
         wPWCdQOYtjUKdPmnrgHyOFBSRGP5+CU2JF+mGRyMW5Dg6u5qfFnLx3SYMvPLp7S5DMAE
         IXIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0os4IKstPDHT5NsgUfs77QUncESOZ6Cx9F0IZ0v8jqUaSY84qXeWMRub14e2hn3kHcVRz7fGTBtHd@vger.kernel.org
X-Gm-Message-State: AOJu0YxPvvlcvKEk1pZH/yeHN0LlStD8mLhNXlRvui7f3O3b9YBLYH8B
	JwlpPppIwtNWc86MCOsdJn96xGFdGre0kgX2qWl2bsxocQPTUseFJ3PNIYQbA2w=
X-Google-Smtp-Source: AGHT+IFJwgIALLLvKWxIbWeECxXnZbaa1REzw6yfyuDfHJ8ofYfzg4yn2gJPrTUiDYT3hwPmIIO69Q==
X-Received: by 2002:a5d:58cf:0:b0:374:c69c:2273 with SMTP id ffacd0b85a97d-37cd5b1bb77mr6296782f8f.37.1727684557630;
        Mon, 30 Sep 2024 01:22:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d01esm8522655f8f.3.2024.09.30.01.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 01:22:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Herve Codina <herve.codina@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: free irqs that are still requested when the chip is being removed
Date: Mon, 30 Sep 2024 10:22:30 +0200
Message-ID: <172768450502.13259.2790852008542028745.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240919135104.3583-1-brgl@bgdev.pl>
References: <20240919135104.3583-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 19 Sep 2024 15:51:04 +0200, Bartosz Golaszewski wrote:
> If we remove a GPIO chip that is also an interrupt controller with users
> not having freed some interrupts, we'll end up leaking resources as
> indicated by the following warning:
> 
>   remove_proc_entry: removing non-empty directory 'irq/30', leaking at least 'gpio'
> 
> As there's no way of notifying interrupt users about the irqchip going
> away and the interrupt subsystem is not plugged into the driver model and
> so not all cases can be handled by devlinks, we need to make sure to free
> all interrupts before the complete the removal of the provider.
> 
> [...]

Applied, thanks!

[1/1] gpio: free irqs that are still requested when the chip is being removed
      commit: ec8b6f55b98146c41dcf15e8189eb43291e35e89

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

