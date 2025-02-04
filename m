Return-Path: <linux-gpio+bounces-15362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBBAA27CCA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 21:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C3B23A43D4
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 20:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F29421770E;
	Tue,  4 Feb 2025 20:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wJPZ2ZR1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB93219A67
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 20:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700876; cv=none; b=EP3jn1ytz7DRhK1DQZwmC8MMZq2CoEWfmSKE8XxZVz60otZRV/LYij8Gf6hXx+zwxIG+4jJz8pmN1ksexEHP490sLfwxM9Q5rhmvXJM2glC1UCRVTb0uVmH9CVqoIL+XiYx02cKaFl9HNc7KzsnWqjchkz5VAE615SUG5GsMYv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700876; c=relaxed/simple;
	bh=ZhfAZnDJgHsp4g3A5U2aBrP5viFVs+Efw9vK/2u5x58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EK8jJwwSz/HHUoR+f5KnwQJLgcjHOJAGncnR7G5+TwKCItveEdjFaUTj4+ivLYIZgZhYiqeizertiLph3oNHGO+o9h1L5zY+ccxtIzs5DBy71ztboTyTvyBJkIA/MX8BzLJWXemod6puyHOZecnWYLNfKFtBp4BgSq+ue1fzW7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wJPZ2ZR1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436202dd730so43093205e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2025 12:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738700871; x=1739305671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZeHY/2J2Yuo8dxLF3vbNvohBC3qjQ1SOEuo/Ri1m5w=;
        b=wJPZ2ZR1ApTBihOxBZbZcl4iaod9O406/8W2yq92BkgCSpeXHFvEIEd1Q73E39rlPD
         p7zJKRAN3oM2xLsjRzIGTZ2GIAVdm4ddND97dh1WpjX5MciETuv8HOoiKaKyKX6kxyWL
         CWYDK2hiko/lQQ9+gmTcHE52nQZCH7oHY4r7pwGg4nSZfFlHpqOiiygbxgoEXhVTCawV
         2UrDW2zCitYRs3Ht3QPyAI8j+COIRsPm+BQv1s2I0FGnUTM0GZKOLwPnEywlPtGt5E/8
         l6dJedUhf1nP/XvfW3OFBtY+cwHMrUuXQLkfZB8yIwYl7bkDBXu1+mazeQfi0dM9b93Q
         o4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738700871; x=1739305671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZeHY/2J2Yuo8dxLF3vbNvohBC3qjQ1SOEuo/Ri1m5w=;
        b=HmN2RCnZ+EEXwg08tqmyjVWO3+7YXlO44eQHGyO9z0E0RNiqR4RcLZBtH4CG446Iwm
         Ew2VjIdIZDwnvbnvvbEVGNZpnLreBKRBFvuAZ9i2W+eErkOElh6vt9AjSz+akQT3Fl1F
         8uZP05acuRTOruAsS4QFZPEEw5rMfeEhj+CrJoAkdOow1/WOD8seEcobbQ0sndq7GaNY
         CL4u51g1pFWk/WC7WgHwEq+Ka/vr+h25OE+k1Hjkn9i+OvcemriLqag4cZdXs+Pwunbg
         MOyn+E6WX6zpBZeJn+GvWUQpbNawa8KhjA3HQGSQ5CIHuzoMufSD7J6ujV2SoxHXxSAn
         pjnw==
X-Forwarded-Encrypted: i=1; AJvYcCV4eB64hZDsCOKYWX3mJRH8FKLLQqjbP7XGZ4xERf/+8yUlWCk4rdQl5z3io80KVaF8/8RsquBrirpE@vger.kernel.org
X-Gm-Message-State: AOJu0YwVio9Hh8madbp69n9nccgvSZ3/JouZdoSrH2HsraGxKEQQ96L8
	ZWhRDT2zUZLYjC5ClwUZ11qKm9QDP00JiHsJkQf1mG3YPCWVd1O3dh9WpO2UKGM=
X-Gm-Gg: ASbGncsuwhpCr4hn/kYgj1PCAIhL8JSsODmY0+YwY2KUzbI2lVrfVaEGoUSVz7+6woc
	Jz4+CiLyvUhuZ+2DJcRHx+w4RE0mp3Pqy2E/Pnne0DCixWToC5g03Q0qUwH3wx5YrJ5/azZGMib
	MzI6HN0bVlskUdMWcKJnFLGVvhcdmzAALM0wIoZPQeH19gSL2JBWyGzHbwwClL/B1UYBRPjpbKN
	tyrgrbh/G18YkLYXrqvPPbuXEjKU9tgIGyEJeSKUeIi4COHSdoEpwV6wIH5QN4FdpVy1TLXqAKo
	NgoYAePAz81h89I=
X-Google-Smtp-Source: AGHT+IEoYW5pVEP/c4CSgEK9useH3xzBCLlbEG/oukqupf8k+442HpqGKOGL5DkBe0Nx4uPAzc6nNA==
X-Received: by 2002:a05:600c:1994:b0:434:9fac:b158 with SMTP id 5b1f17b1804b1-4390d42ccfbmr299195e9.1.1738700870983;
        Tue, 04 Feb 2025 12:27:50 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4fb0:17c9:a494:227f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6df36sm245420855e9.25.2025.02.04.12.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 12:27:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
Date: Tue,  4 Feb 2025 21:27:46 +0100
Message-ID: <173870057719.106350.17999921686110317967.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240606033102.2271916-1-mark.tomlinson@alliedtelesis.co.nz>
References: <20240606033102.2271916-1-mark.tomlinson@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 06 Jun 2024 15:31:02 +1200, Mark Tomlinson wrote:
> The GPIO drivers with latch interrupt support (typically types starting
> with PCAL) have interrupt status registers to determine which particular
> inputs have caused an interrupt. Unfortunately there is no atomic
> operation to read these registers and clear the interrupt. Clearing the
> interrupt is done by reading the input registers.
> 
> The code was reading the interrupt status registers, and then reading
> the input registers. If an input changed between these two events it was
> lost.
> 
> [...]

Queued for fixes. Thanks Andy for taking the time to review it.

[1/1] gpio: pca953x: Improve interrupt support
      commit: d6179f6c6204f9932aed3a7a2100b4a295dfed9d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

