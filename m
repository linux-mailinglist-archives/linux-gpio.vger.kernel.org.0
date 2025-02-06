Return-Path: <linux-gpio+bounces-15479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDF7A2B110
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 19:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C783A1883D4C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FC81A76DA;
	Thu,  6 Feb 2025 18:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwSMrizC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9813219DF49
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866207; cv=none; b=VyhNgP4mJa9qT0HLvmgrBjveriGvkn2MUrwfppolxZjPpiwGvnbsgW+fs3ISVdJP/Hjh4jxEoxudQ3ebY0lr5ZD9AzaMnWPXT7cDskRw0ZvtbkmFePiYq+R6RSp3UMSs7ZSuLt00jhTMsPPto9ByQS8wLprFptY0AXLyHOoqdFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866207; c=relaxed/simple;
	bh=miRaq0ShuM/3Q7rbSYRmZIZ6muGq2xOuOZUqBIxd5jM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAcFdgl5JFASvNrC+UDiP+6mIo7g9Jod9WKqCcqnVaUNU6dGqr+hA3y7JFZjQ4FtDJt4u0F8Lp8z4KMOArHUKJ7n9fWOOSKdsq4YdfopS/KdVMNIvZJwswWtYZqbIthg+szdOL1r9hpO8I9kGJUKZFvD+WJpNdED4N/r7FbqKuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwSMrizC; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f9625c0fccso12922317b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 10:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738866204; x=1739471004; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=miRaq0ShuM/3Q7rbSYRmZIZ6muGq2xOuOZUqBIxd5jM=;
        b=TwSMrizCLp8kwWBOYqS8XWTJkdFxHUM8DJl1NLLWW0QwVHeHaJLlgIWeM5QoeMslvA
         l1X940aaLb0DY2sUrazTcwOZPRsl2zKNWnulmNnKMaidwbAlw3E1NS+jR+uFS3n6tljB
         OU66Dohci+Rc23Vz6onizWOrYuGAhB7N3Fpvrv57sIqy55Fwz2zbOuQxqv7CaNCBN753
         b4STnPKhfSaE3iRh0rl1tlXH6ctKWzMkFFV2IioRgQz3uZ4MAtJ/ndHHIML7iqrlt7Vt
         WAXvN6bDQNF753L62kUd/a37YKLt8XY0J1nsEOi1zqazOKcEDi6cDWkhCi2u3hls5j+0
         hj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866204; x=1739471004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=miRaq0ShuM/3Q7rbSYRmZIZ6muGq2xOuOZUqBIxd5jM=;
        b=fVFZ2LE+SGX/IHppbcoLEcNearRpz5ju3sECb06A64utSvHlHZe7VPF8hp60QofjyY
         5yfO3D3xCrpCZTZjtBtx1XKsar8C/CXJE2E0euBfQWz4U5JDMo8smrkh8ucRcFO4wC5M
         /XKYf5TGU1ek7Y1w9w3waynyZ41OfxNhyBXOdXTmKyUvvHrmdTtAdB0nL0OgPo5jzVcs
         yIXVSnYiBZPoFVb01OKwciJTFO0GaaunK92IlKCf40nlhcX2gVvm2xDdh3wZrqtazY0Q
         hNy5oL6vrTpIOfVvF7Oqalk8eEWilS2PCen8PI7aZeE6kDGgTeFt2dOGWwkbtLAg1jdU
         JOBg==
X-Gm-Message-State: AOJu0YyZBvRk4VpvblbkcnIPuRrHLkJ/OZZrIc3NlbKHCb6IazIJXxVv
	/Pw/yds3aifqM+qoLR4D12K90lVNT+vvmkXpHbt8fVHLS8fJzmDOZ/lLL85c8qaAEnl7b6ObVji
	6dacSy2X7pxNJTt9CgEEzezehd6MFM/571izmDQ==
X-Gm-Gg: ASbGnctChJmgL994MAUH5uF3JKc3vYLPYC+qpbhNb2/KF4d91cjUG0a1ps85MzdWo3h
	qhYjzFzjZ1+FKGvKwwJpu6LCXLTduvfzln5iDWyJkfJCUiW0PmXxuArIF3UbNkcAd6xN1+bs5Ps
	W4o0wgdZlVt+lq9p4fN1pu3zLe2Q==
X-Google-Smtp-Source: AGHT+IEB6cWftB4FnxX/3BRKopXQSZKkbFDSEGJXXn0WurMP9GhTxm5dae9peursk2O0xV0bj+t0b4jYv5ekv5wa20g=
X-Received: by 2002:a05:690c:368a:b0:6f9:4bae:450a with SMTP id
 00721157ae682-6f9b29e4d8bmr1982477b3.28.1738866204545; Thu, 06 Feb 2025
 10:23:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
In-Reply-To: <20250206181714.417433-1-johan.korsnes@remarkable.no>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 6 Feb 2025 19:23:13 +0100
X-Gm-Features: AWEUYZmbqWfiKrzzpFDqtmr1LCzsqtw_ICcONtqdeu7r97QC4sWvS-PH6VYHZCU
Message-ID: <CACMJSetnZbaTd8ZC3bWMFDfKD5D8azK=W9X33q8CntgZXr47CA@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
To: Johan Korsnes <johan.korsnes@remarkable.no>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 19:17, Johan Korsnes <johan.korsnes@remarkable.no> wrote:
>
> Add locking to `vf610_gpio_direction_input|output()` functions. Without
> this locking, a race condition exists between concurrent calls to these
> functions, potentially leading to incorrect GPIO direction settings.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Please use the email address that pops up when you call
scripts/get_maintainer.pl for patch submission next time.

Bart

