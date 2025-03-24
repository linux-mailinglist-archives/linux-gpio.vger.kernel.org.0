Return-Path: <linux-gpio+bounces-17909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA6AA6D7B8
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 10:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DFB316D40C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8009325D536;
	Mon, 24 Mar 2025 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cpUA1cfH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D33A1A0739
	for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742809363; cv=none; b=sc88W+OVeR09RJgVrAvNaXnpBTB45MIrOOGB1vewSQyBc7nb9rDdIJq3bRoNFhpWWpGvbuxMnCLaZWRhTBzxz+WFbH8rLhV2pE/hRphVUFQzJf2+5Rw0Me2pJsrEuHByjKy76+hBYRoUj9rfbd0WcoYl9G0Xg+HV/FMCZHd/Cag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742809363; c=relaxed/simple;
	bh=d9m4UugoHgIJJiH/K5i/tlJQN9gdG3H+FwpgwLTVHCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E+42kUKya3a8h1avk/1NQsgxwXVQOHKq/Y+ICK4Ld+Tqh9i4kcH5qJKayz/7xLj6WuU6eK/nr6rlkBMUJdB34p3HlXdC+Dqw9jTIFjXWQUNzqBb+DZeCkzKVRsV3nWYUQaBlF1Be8qenwk3m2h3aa9rskc6spqPALziouxmI9EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cpUA1cfH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso27836935e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 02:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742809360; x=1743414160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWS2ppQ05Q8nJWrHX5AfcyhvwEOvoQT6qKqvyuKH3ZY=;
        b=cpUA1cfHDt0GFZ8y/CR8q4gZ7eBLDNS+uDro3SxZf9T1SDI01Aur4X7P1db9UPQIXP
         COpcKNC65v1cQARBjPxOLte7nbfefE2LXKWS1giMN5XaFvPzGQOdj8iIfktd/ipPbYVF
         duAg1NixP1JccmYAcyjaO/ERzFZmHREnMMRo/i2DjVrLnK90DVRZUbbKzoz3ijuDbfUB
         5n35Z2iV9UVVMCqEGC2swQh8E/EoVYOSnfJMuXVrQgbf7nBd0ey1GfYiBbfRZAHr0xfF
         1SPmJFF8anNx6Adl4ASuaGpYMFpsCajCtQe3en787un+RkzadLCFpbGTkRwr4JVqd3c8
         L99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742809360; x=1743414160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWS2ppQ05Q8nJWrHX5AfcyhvwEOvoQT6qKqvyuKH3ZY=;
        b=QyxddJ1NvZz2S0w4UYuZlEbNvJ9+IwQAs7iPRoigtFkQPjZibcOuYD0Sj+piC59Pbx
         NolQvgVf493OesVf+3RJ3tDw0xFqMPuaYo2Yiw99d8M9NCxzTuCOkn/DW5b/GdeAVr5o
         Z+ztJrvJRbh9c777yKKDIhK2U1OgLFxoxE+rTTtHLjcOw2FeeL33+BdbVBQKnIl0QG1Q
         Sdae+uVlKb//98ThwvCx8R56U4XJKXkgNK2Bq4RckG5iesOoVyB6POsJ0P4Ai8UE4fLL
         Jace8oJWU6P3Ny1/ivKgDQl0mVOlG7wEbaw1DwCW0PJKlzsj2wJ0zxNKRLEeRKQPAvET
         AIYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxY1fxQjJEwRId1zuNQdXWTlsLwWQ+YpuHs3Cm9vf/iKTIlp111jiROx56qggcnQub3W8y0SWdmru2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7BCi04GuK+QUDimumrBo8xZCmDVOmbFohl23hvFL0Zq+8Qaao
	ypqNn8bbyM0Ifb8ZFT+6Ck21s8Sstgq4sh65qD+xCItZbFLQ2RJ8kJedzoQFAMY=
X-Gm-Gg: ASbGncsO0cofA2RTBjN7BgUW1/UxlGccQxQP4YDogDO9+6tFwEwiDq/3D5N0rnBm1iq
	Ggml/B10JNgP2F2VM4k5SHXyxcX/O+MRX2sYFG6kLBP2UIShqUHSa/5b9/qhkhUnGxFQoy7Sf7r
	JZPgar1C4aTswZuYlnQHhs1tHvJVwm3XMG62YiU2IwIgarSDaEuQ7kwZlzfbfOgxhCV77/9asQ2
	QjRekjTseMioatlr9z4r88M5cE6WIRDozG4CWeM9cd0FIvAvoO87ZmIqPu5ru4LtWO5BdnbbaJ6
	fkFTv5+Q0ueZcVkB9MSP4A1ApPcpmS2MqONFeo4+iMzyaL3mFEIxXQ==
X-Google-Smtp-Source: AGHT+IF/kP/NNcJtknzsO6d7Kbjjm1Nr99Nn+A+NHhZlpEjrRgT74UKUsHPk1dRzy4ad/3QbXehTJg==
X-Received: by 2002:a05:600c:1548:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-43d509f4d23mr110906225e9.13.1742809359643;
        Mon, 24 Mar 2025 02:42:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:467d:3e99:af5:c4ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efe61sm10592130f8f.97.2025.03.24.02.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 02:42:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/2] tools: don't implicity unquote unnamed lines in gpioinfo
Date: Mon, 24 Mar 2025 10:42:37 +0100
Message-ID: <174280935583.13500.12520287274356757649.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250321-gpioinfo-unnamed-quotes-v1-0-a806e9027adf@linaro.org>
References: <20250321-gpioinfo-unnamed-quotes-v1-0-a806e9027adf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 21 Mar 2025 12:05:23 +0100, Bartosz Golaszewski wrote:
> Fix inconsistent output of gpioinfo for named and unnamed lines and add
> a relevant test-case.
> 
> 

Applied, thanks!

[1/2] tools: gpioinfo: don't implicity unquote unnamed lines
      commit: c152accf916b609a2b856b480e7360f7e97127ed
[2/2] tools: tests: add a test case for gpioinfo output consistency
      commit: 0182cb5cddc48a0db1641c7310dda2e3eed44cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

