Return-Path: <linux-gpio+bounces-19130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01300A96CF9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 15:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1064C1B60C35
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 13:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB87281367;
	Tue, 22 Apr 2025 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qlyvKFZV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273BA27C14B
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328791; cv=none; b=kGnohAlirTVLXHYhJg6jHB0YTb1F/CC4QsYAtIYrlxr32/Cksp2O6X99AODtfJaE5XkEYLSqbVibanhkDPCuNQLs7yXUiPjP/XQ75PvbvRKQ1NUR1UPGIIEJ9qCCQTTMpi9dqVClq3hPj5GKpMsaoEZfYwAj1odbAXRglDvoMqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328791; c=relaxed/simple;
	bh=q/6CCrSW8phqSBPkpH010TjRR+i0QEufdIffPLwtHUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjNRYoSrKyuE5OgLQtouxNmydIxf0BdBw5AfP5+puKorhhWTxX6tTaOhVQnEcCBz2vuv2Su4wCKvcdm821mQq3ZbWUFzNxs8Foi/xOuGt5FyDnF+g4muEXC41nB48NGHG4DbE+kix7xf+HiFCnMDaZNH47SuSHkELBPe89sIUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qlyvKFZV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso44106225e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745328787; x=1745933587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuA+DRO9E1tyLrWVf0Ph2bREIdSD9F6RcY3stJZGVO8=;
        b=qlyvKFZVIvVIVDa9TeFiS2R4W6nTFQ4+kJvj14rAjtXpYsQS662uVrFyEEXfUSdu+p
         3ybc2K8sUW1exVQpZ/NBxAAFl9SzzF+VyNNMcyhz8jRuY2EOnn9NPCUoTPd/4r3MMUFg
         iRTfGAs7GBIHahQhL4EWovGabBABjQrCtin0yDgMAWss+I/h0OAWeM/R5/ttZKk5sY6k
         1kjdm+ycYYIQq+obtGy4co6UcHjk56oKNsJ6eCG8reqEKUhfqadMviF8kg1roO445O7V
         Z52t4cNU5oWfwPps+TP96Qk/skbdI0xPtn1GTLJBPGRU+BSolJoFIPQ/tyQfDtiE092P
         JP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328787; x=1745933587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuA+DRO9E1tyLrWVf0Ph2bREIdSD9F6RcY3stJZGVO8=;
        b=LOR17+cqFNQw6ecWkyIoptYmMXi0BaxLJjf2Row4vfSHr7lSWIM3TntdfxClBC2lGL
         +Tt7R4W9Pbz9nups6DzcQtiMff/RXMmq1lYsGqcBsLF+wdNTa6Iv+G5aIPdrGtrKBqbB
         2YXRKf0dKo+isjUAWIBX7435Pb1IZYkDMn5KpmMxH5wk/4G50ICf+3LbCXeba0t0eBNT
         pHE99jenh0yjwLvMB7jE5b8WmwBQXkcPwHVXlzgKU5raCqIvrgp4VeoKDku+6V8rGbhy
         fYgoH1vbFmjoGCKSmYMOAbHtYztcK0+EmzFyfSYUpKYn5+AzqxDm+e33Jc/IRmD2RO9J
         uhHg==
X-Forwarded-Encrypted: i=1; AJvYcCVeKsHr+SykJ3iJLm+tzQuS/Y8M3947oonJg4YhiMO39ocVBdsXisLBxjrEobd2E1TzMzh7ZiCB5nX9@vger.kernel.org
X-Gm-Message-State: AOJu0YyHDpDWjLPUredefpL7aTCyOM0Oj1g6UP/6zisIUPEDA0V/WBr6
	ZwFZwRqdQGC06b2zjOLOhFigMz9jtMxHvW+19d06sVLtllvnVZo2qdXdgal03m8=
X-Gm-Gg: ASbGncvyurHhtYj+5eVA1h3C/ee3CXWXJob4xWe3au1eh/0eRB39B3CYxeyl2mXm5Ye
	d2wQeiNP1tzz8+6Cr9KMbrtYQTbEiPzhHQ1DLHH4Ii25TNa+CutAQ1gFYmMfRSVipnFmTiD6T/j
	zC4B241C/10W/i9Ic+9z5k8wdQXhvjE971DE0OpRumPnxxSkVxKYrygmMSHVz4LBZEzf1EgqZeW
	tXTFDGp1docQGezHzBdbtF68ZBVHf/Z5T55y+3JJZfDHGwaXF1mOAJwtCmyeLbbFmsj5X5fSbWf
	1317cz0mRZWL5ecLR/t5u0hZ8cpisewTxepOIaHH
X-Google-Smtp-Source: AGHT+IEhQDKeWLIVzz2Udu0XaAUPZv9+0Kz1RuszB1QZpHAzEY1d0mfRIv5ucw2BFOHGS2etZxtuog==
X-Received: by 2002:a5d:5f54:0:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-39efba4ad94mr12003104f8f.16.1745328787223;
        Tue, 22 Apr 2025 06:33:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8807:1a1a:7a0f:60c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4331a9sm15548965f8f.36.2025.04.22.06.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:33:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: Restrict GPIO_ICH to compile testing with HAS_IOPORT
Date: Tue, 22 Apr 2025 15:33:05 +0200
Message-ID: <174532878331.89556.16615131669980136153.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418-gpio-ich-fix-build-without-ioport-v1-1-83fc753438ec@kernel.org>
References: <20250418-gpio-ich-fix-build-without-ioport-v1-1-83fc753438ec@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 18 Apr 2025 16:17:20 -0400, Nathan Chancellor wrote:
> When building gpio-ich.c for a platform that does not have IO port
> access like s390, there are several errors due to the use of inl() and
> outl() throughout the driver:
> 
>   drivers/gpio/gpio-ich.c: In function 'ichx_read_bit':
>   include/asm-generic/io.h:578:14: error: call to '_inl' declared with attribute error: inl() requires CONFIG_HAS_IOPORT
> 
> [...]

Applied, thanks!

[1/1] gpio: Restrict GPIO_ICH to compile testing with HAS_IOPORT
      https://git.kernel.org/brgl/linux/c/29f4c4da74acfbd54f5ad2dfafe1a8f93af00431

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

