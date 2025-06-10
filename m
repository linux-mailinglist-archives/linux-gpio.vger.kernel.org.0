Return-Path: <linux-gpio+bounces-21136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA7AD2F9F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 10:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA8553B3650
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 08:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B99128001E;
	Tue, 10 Jun 2025 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OckOOz8k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A00280319
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543128; cv=none; b=gWQei8vH7BavfRoh+qvzd8DMQjMucohygeuKomU0whcE7XvQacUc48oL7++b3gmXSpMIAnrBuyTUJmXBdsbL4OWdEiNKEFyJwoHTXcQgS+rWewQG+qHNhc49PVFF4zUMM7JXRh3Vt3zgO1uU0zae7qZdj13sBJtZkkMJvhkhXI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543128; c=relaxed/simple;
	bh=TpGiRbBcxjc2OzndSGN1iy4fiypoqt2jRna1Uwt5m2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ps58HL4klsv1XKb4uVyma8TfYDoAGp9pWV+K0meW3BW1JEib97fTfNdN/+l5pkNdKSdWeAoZzt1jwTjOIwWQDUrXgkIlDirojR1j4QbhhuDoBZA5QT4tA5LoQYKPPSaC3WfXrvl2diLU+7L6W09wBh3yaJmVYuQT9GgaKSQ62+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OckOOz8k; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so42453375e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543125; x=1750147925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeifUeLaZ9+rDBV83L5gR4o/Q6NXBGUnPq+RJylNCwc=;
        b=OckOOz8kOlJJ2kqfI3FO/eFyGQyXsS+zTFgZF2xT6bRx8SidNUZ+CacnDH6rpNqr70
         AlaV1rb4XQe1RPjs0cTvbuEdLbf//KabBj+LiU1CQmQP3Fpk+mKh+HJQ2FpcGuHoGTX6
         XT9uTzINxrPw5gAwgbGaWQZ13DAZHuicD3la+fFhbt4+cGYQIAEPasHFn8rjwoLEBQ3w
         yuXV58husioRyf57WUtZ6JayYhio1A3sKip8aXkF/BNOfDDnAa/ovBHZ3gVdcTX1Kpjh
         3lhc+6V+jnN82eWi4a0IAJh3vehsMJyxNpSUTTqKIqCME3eHMP1sOqIDr6feUXFOecmo
         Dd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543125; x=1750147925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeifUeLaZ9+rDBV83L5gR4o/Q6NXBGUnPq+RJylNCwc=;
        b=pGPdGHSJ/nI2e+67BYHtKvKhtEbCseiZEy3HY66PwX5qGC9EqUSGI2aZiG17pf5u8O
         0Gogl0qMm8kwNR+tudA5fT+KlVAH/G3+2WFD/R8/7Pc3x4V632TDZ+7dL+gmRdjMZmye
         NWgxUVMnqDQlGI4Gxw3qGkIJq906rTj6LRE0WgQ/Fv0fNYjA1XMr9xCBbWAUsByFmlrk
         bVsqwZrXrAu25qnAIdJeKLnJjSYyH1Rv62ph51630M023MEz34BMW1Wqdqm8pd/Zdymx
         6ym7wz6EzleG3kMb5t8K2ej2MreTdrTuxhVC26OnzfPYlE+RNSkJRSTw9grElVZ2mJxT
         WwWQ==
X-Gm-Message-State: AOJu0Ywc/BJhT/eLTmYgBxjzXQKYWIHzpMGB6do5GsLLo0V7m/Oshgc4
	qEOfln1QbW3CD/HVfbJqXrRSjNPg7EL3Q+6M/ld391cknjqiolDg+gJaCNRwxzTWDWq+ZfnFgxx
	LVHhL
X-Gm-Gg: ASbGncvAmfa7G+Xy5fnQJO0uTPYp7jrf/eUC7GCjtuf6ta9/FimoR/x6DZnirr87xCt
	ddOeiNKEfcvBgFdC2nN6Iy5xBUF8Z1svMlbsyt+hlYE9KUz1uOdfVlJRvBQEt/RxhCDvRWXj+yv
	wbvnNN880IdxUvtON8UVFBpqGsaE8qLJO9+JChi6xhxi6IWP5OqjyJQUjMqSo8JAtrAYxyG5l74
	mHnbxT1GjYWC05vJP2tWGIo5xFK0ggiEyHHREPUpPdPbFrH/N8uw6nMIU28LSoUUnxfAMff2OsC
	fWbxEeZlw+rvYtL8PEpoPrsT2httGjypFlFOBeI0KPeYjkELrpajp+hPJFn8
X-Google-Smtp-Source: AGHT+IHggB/BoGLBoXRRcx++7IOBIp0SzUaakzTtNLar/54OyR1+9jdb+6IAQ4fbUnCfy2rRWhaFBw==
X-Received: by 2002:a05:600c:6205:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-4520140c06dmr135987505e9.21.1749543124657;
        Tue, 10 Jun 2025 01:12:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 0/2] gpio: More cleanups to legacy header
Date: Tue, 10 Jun 2025 10:11:52 +0200
Message-ID: <174954311123.28634.7300380826159592857.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com>
References: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 31 May 2025 22:55:42 +0300, Andy Shevchenko wrote:
> If I'm not missing anything the 'struct gpio' is not used and
> GPIO_DYNAMIC_* constants nowadays are private to gpiolib.c.
> Hence this series.
> 
> Note, this seems already the case for the upcoming v6.16 cycle, hence
> I would like to route these patches as fixes to it to prevent any possible
> use of the mentioned definitions in a new code.
> 
> [...]

Applied, thanks!

[1/2] gpio: Remove unused 'struct gpio' definition
      https://git.kernel.org/brgl/linux/c/9b4d4c952e28f97c5e653c8b9453690f7e63cc5a
[2/2] gpiolib: Move GPIO_DYNAMIC_* constants to its only user
      https://git.kernel.org/brgl/linux/c/6595ea2761df191c2ec500d5f54b57592b969f5c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

