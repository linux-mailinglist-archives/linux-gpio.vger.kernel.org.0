Return-Path: <linux-gpio+bounces-10680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3D98D120
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 12:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67BD41F22FED
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 10:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CE51E6325;
	Wed,  2 Oct 2024 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bR4pKRYs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E8C1E6309
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727864674; cv=none; b=QpuOzWj+zNkwEe5p4CSSNaXK6Z0C77ukWPl9Yslch+dFFdYOTQ7is7cykRhPW/lhrRmB6nkeNKZklVeUwjnYrXNM8U8fPSoZL2fE2gXRegwcfPRV35g+NLL4rHhAorgzabGMwBMGpAR3cIz1zlwC/gRmlxGljwChV77paAlCKgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727864674; c=relaxed/simple;
	bh=8WooRZtcZ20vFwYnQ4+bH8mDrPXRtKyQQ9yAn4PO6Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t73S+8sWIO0pKqHzBAL4gFaBIJ96Fd9N4bpPRUsHET8eTyq7BPS2FYO97U1E2q9D48VRLGnTxNDTKGzolLEwnX3nMx3ufNQA9TC8wwHJFzO5BWKs6PKSXmYSDMJCgxX5BxCwesWvJcGuQFcdvAyoIpsuARqeo29ZBa0M31cJjYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bR4pKRYs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso58414235e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 03:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727864671; x=1728469471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhxbVhGStY0PHkKMbT61QVxgYIlK00Wi2hJW6Wi/ekA=;
        b=bR4pKRYscCyC93W0d7NxzExlrKL/VroxOPo6Xq3bzQQ5IDr1PN2csFfogFgMiCqtX7
         z0hL2dYLSbkIyw5A6P5e7kzV95Vtly258y6HiDp1S68kqcinD5SzS6m/Hu/eCmUwPuZk
         8tOHgUTVS4TS27/dDzk/GQA4Ns0yyAyNKMFbv99k+2YVFruJhwCVn3esDxYeDynqhPzr
         F/kgBrD/tiyJcX8icUrRU4IS4CZA+kXf/tbytgW/ddo0r02lVY6qwbeLn1BuOffyQNc5
         GpjEvwBvFfZolE2liXmrnzmUQPCUDREhOcmYAR7Wk6kBG5KkVWHl3dJlD6pWviLUhygx
         8hlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727864671; x=1728469471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhxbVhGStY0PHkKMbT61QVxgYIlK00Wi2hJW6Wi/ekA=;
        b=Wa5yomrCFHbQk1KOQQ9A0z6bx7aDNrFqodIFaFcfwkp8Sx8Ro3HJSptX1aswrW70s4
         47IRJUAg8dBQ2EInJC/McgXO+WnOZ+syg8SbiLdl/DzdE1quT4jER5PZAiPlZXt6nYCL
         7ew85zJeH9u6BcCdiGmKzko/IzursDhLxVPPLPIsAh8tWjc5Q8Mhzrm/a5IvbEtX4WVZ
         ff8PQMXcGF1P5/lChEy1X+49UtpNdsg89vgcWnGXsF/ebsoM7S2IxFfz+iVwrLB3AnSY
         JSzPhapQs4iTrsxyzvUu+6olvTBH9JaoOm2iBJsptTqMcMDjBE1jvw59sUQzk+js7X8M
         kKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeFGkYh77Wr7TVy9YE9RuUrYaAeLd22qvwpAje9OiMS3u84Qr4CJnOg3tWm+s+wTRG0BJJAqZZ00kY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+S/aXjXnrQUaYC43ZqOZ9RxMEi6yCVHlhccBRhcLkGaaMgwn
	aqju5eeOk55SQumBXPZGGtPfWDYD4vFq3HuOwKVeS4WzR5FB8ru0AhCbc88r+oU=
X-Google-Smtp-Source: AGHT+IFj0uouBi2is4RTxSGmVmsv53odjC8I3xKKvKxREA7gDOD0ER6bM6tDQ8QjrNDODVCCphRhig==
X-Received: by 2002:a5d:47c4:0:b0:371:86bc:6c05 with SMTP id ffacd0b85a97d-37cfb8b5435mr1923939f8f.10.1727864670747;
        Wed, 02 Oct 2024 03:24:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:23c5:7b17:f5a4:f41e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79db387asm14713155e9.10.2024.10.02.03.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 03:24:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sabeeh Khan <sabeeh-khan@ti.com>
Subject: Re: [PATCH] gpio: gpio-davinci: Fix condition for irqchip registration
Date: Wed,  2 Oct 2024 12:24:28 +0200
Message-ID: <172786461856.11947.9046912319409883972.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241002071901.2752757-1-vigneshr@ti.com>
References: <20241002071901.2752757-1-vigneshr@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 02 Oct 2024 12:49:01 +0530, Vignesh Raghavendra wrote:
> Since commit d29e741cad3f ("gpio: davinci: drop platform data support"),
> irqchip is no longer being registered on platforms what don't use
> unbanked gpios. Fix this.
> 
> 

My bad, thanks for spotting this.

Applied, thanks!

[1/1] gpio: gpio-davinci: Fix condition for irqchip registration
      commit: 69e40c3ef27998105b3002434ee640800d376668

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

