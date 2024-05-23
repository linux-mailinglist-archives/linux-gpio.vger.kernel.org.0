Return-Path: <linux-gpio+bounces-6584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96D8CCD7B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 09:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF8D9B21A77
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 07:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8A713BAC6;
	Thu, 23 May 2024 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AuXmpEMM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADB213CAA4
	for <linux-gpio@vger.kernel.org>; Thu, 23 May 2024 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716450947; cv=none; b=q1HWXmWE/UZAMgT/ch82tKvSpDJPlJzlVGBm9b51+N0tTVeaVCqdy5f+g64So741gXeYywRGV6Yyqwvjuu/8ihoYCETFFoAuJuQrlIlYTMys/xGoc50DpB6RIWu8nGrEwCJ25kCAj8pWifp7RZNjS6OkDCBRmIfu5YdupZVBNzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716450947; c=relaxed/simple;
	bh=8C3qhFNTq9BMugQ1mINdhmn2Espg9ryGKXPda25rNRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EMNgmh5+S3TI6g1Wq5N5VL0Nq2Pv1Jggc5xZYun1upy8J05FMugX8C6axcglzoqBnUJPYr1ciquZhrpuS6HblfGK9HG+8N6Ue6T+THW9YaWqmHvi1rKOBhEV9bscHtHaAkU6h41Z/HUfhRlwGpg45AFDxxnOu0N7ARMXvRh9YfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AuXmpEMM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41fd5dc0439so17738285e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2024 00:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716450943; x=1717055743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9kYZ0A6uuT9keW9ghmNYzY9fKaHuw8rjAMg+XjgcmM=;
        b=AuXmpEMMGmOfjNmmsDCcTpA9XuD/u60ZdkQ2W1I23p0ryrE/nk9Y36oWZHjhFKdE5U
         /GINK9AV7Fnh3p6OZ9FzvCsSklgKT3bMPsvG6SGqzS+oTcPYq+BJgF83HtFLsseICRQB
         tA8af1fBhh9KVAMbUfNBbt3q3mqrwfTxuRfoMM8ZRNza/SM1hrxCDjNAIzH4e4qMQCZE
         +Wr8kRH5DSRgiVoAn8iw1eNFDWtbxQic5Wha9wRliG0NYYiBybFuX1FuLZx93neyevt+
         gPQ5xyPopw7RATznU1LFDou8M8VLMrmLkdtyGhdXZCjJxxCYv9v5Mzr2WtnV/IaxBgw0
         57bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716450943; x=1717055743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9kYZ0A6uuT9keW9ghmNYzY9fKaHuw8rjAMg+XjgcmM=;
        b=Rlk9x5ItnhFI5jRPJM19eU9+Hb7mwyIbXPg8gvbupWcTKPTyPoieh4NFPp3aSNCVck
         6+Ky/AABA8ItTVjAbEEJaMEYRD3ynm1ojlb4ICH/Es7UX9VRW4nXPPfH66D4pEhgczNb
         L63yhoDeMQ6/12+BVAcRAO6vbzUbOfEygCKaJ7FQVUjSwTmwhaFQ3d1EP7IqgMZLKXas
         R4zdZpaI31khudP0mNSWIxI8ThKoJXuJqeH0UwH3a/hMmfZvNolnD1ONQz30vJ7Yib5U
         80p5Qmd3UwFBKQZOLru3JBVnD1uTIi2ZRhhYNH4CyNse2ChwFli4TUUKc4tR97j3r0Ut
         0vIw==
X-Gm-Message-State: AOJu0YxI5lq1IxUPkEkXe+OtUC64ROLPdYrppAv1DncffyHN0yWUVdWu
	IBJ62jtuWPLeVe4gzXJllJJ2UduvVbAwfUMdPtr5imhqleONzEIPmfcHVvFUTS/HFiXPPbitiYq
	g
X-Google-Smtp-Source: AGHT+IHE5CfEhlHMXf4yI+QTG09eNLu+qS7UaTeWy+kXgSqDxY+sHJ//TuLEW21tfDT5o90aruSz9g==
X-Received: by 2002:a7b:cb0f:0:b0:41c:ab7:fa0f with SMTP id 5b1f17b1804b1-420fd36637amr39600215e9.34.1716450942970;
        Thu, 23 May 2024 00:55:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:31db:5c47:afb:5dec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee7e1fsm17509385e9.6.2024.05.23.00.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:55:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/2] support casting line.Value to bool
Date: Thu, 23 May 2024 09:55:41 +0200
Message-ID: <171645093734.46167.10449519487289001732.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522004643.96863-1-warthog618@gmail.com>
References: <20240522004643.96863-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 22 May 2024 08:46:41 +0800, Kent Gibson wrote:
> While writing a gpiod plugin for gpiozero (Python), I had to map line.Value
> to its bool equivalent.  Casting seemed the obvious way to go, as it is
> essentially a boolean, but that didn't work as I expected - it always
> returned True. This is the case for any Python type that does not provide
> a suitable conversion operator.
> 
> This series adds support for casting line.Value to bool.
> 
> [...]

Applied, thanks!

[1/2] bindings: python: tests: add test for casting line.Value to bool
      commit: c8e3ae0499c800955cd77d8959be0f14e4b514cc
[2/2] bindings: python: support casting line.Value to bool
      commit: 5f9152b0ca8ad7ac8a8591553931b38dc10c5db0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

