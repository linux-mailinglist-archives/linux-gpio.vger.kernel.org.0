Return-Path: <linux-gpio+bounces-7071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A878D81E9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 14:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077A71F264F3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 12:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF3A128815;
	Mon,  3 Jun 2024 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ICUF52fN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85B1127E21
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717416487; cv=none; b=ZRDxiIyU3+xqt/IONLqwF3Wag9FUT27eaKicyOMI+O/V69xYDIYnXTt0JbLcYch9PHwYrE/SfCNldOp0ATjkhNVssflwdFCl1aRY/KQ2Ooc+qjd/hMAgLjCYoBM9KL/8BX4HqI5716Q+7xY/+3hWq/SNxqkZFgP6mWxAw0wEdOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717416487; c=relaxed/simple;
	bh=fttvHlF2MF8yOE/UjAkVeACPcsh9zjGwu0goS8Eavcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MozU6IFYHLI8tXW3lxzRwZVuWvPTdfd+svWT7J99xBamYXxQtRDLeGSMwGPTZmZGZ9SI9s2+a/mtT9syZiBUekjQu7v23IF9GGRS6VtV4ZLlGqSgG/xypyNFVTEr3j0MSzgrGntUbrYP+Ef4z93smsTyJB5cqk+5G2jcxaVJcvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ICUF52fN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42120fc8d1dso40490625e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 05:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717416483; x=1718021283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcW2DRNhU+MUelSnk5wNhyz3teLQv+XfKABuV97aTCg=;
        b=ICUF52fNpnaBKsQHO0e8UNGwrxSez2l+8+eRdeINp3W4FbiOrLAgGd4HCnlW+oOI50
         NFJ8HylUlAEa4YvKdPT9eXygRDY/0w+aYSF47/AbJZIjo4VqguEtzF1XP9UdQap328eD
         JeJoKdO9EJPYztaMgZ1uukRh2CMq3U42h3B0Ke4q1roKRsnE8EbsPXxOPTdv9gThXI7U
         kQ3PlEb8vrEV1mvkF9WUYp1W/1l7saXlY8PMLfC1u5Mjc+F/zn0P5sDgukmrWRhbAju6
         YT1cJOGzDEVDEURrT5N2xPTgKHaM80EvMicBNYOvnzVPfSrvodGxgisYVDJFNYj1CRlC
         4l0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717416483; x=1718021283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcW2DRNhU+MUelSnk5wNhyz3teLQv+XfKABuV97aTCg=;
        b=JYd6EBOEwVVi+X2TU7BZs4VDpOyncxmT++9yND2m1ktUbHPKr6WCaKLerf0ka789cP
         aQf1ar+Bs5R1No9Ll3mXJAVA6wJ0+n8U5YbvtgXcHYwWSBkKmSiazXYx/6HJJXK0Y1U9
         DluTdWhAWPS1209ItS0vTtwAUviVSQk/ghDPUzxpyaJGMIsx2KyDxm6xM3Iow/45NGuS
         7PrT97++NhyAI+u0PBxgSgw/aT5MWpu6XOYf9MalvGZ4iz74+5vMuuDSguzmJVhXZomx
         PDrQXs5PfG1r8FBsXEDGugvY5YgHqQ0WQSXI30GcN3f5PGLDWLSstT04NZuGNi9I94qN
         76tA==
X-Gm-Message-State: AOJu0Yx4PlrP1j2fyr7dcYPwFKziCeyrYVC1ugA/fVeVmd7F8KhpP4Ir
	xgkVzMv/GfD3z0T6gKfS759qqzJZRKOEoeuyH67BJnBqmT0mDicGxJDzTqAU2ph8fvUUVYrAX2m
	9
X-Google-Smtp-Source: AGHT+IHFNo8RP4hl3xT4tXXjTURKVv///mSclhYgsz77pbZ8HpqpD4LZJ0VNSCvs2DEQ26Er6PsWFQ==
X-Received: by 2002:adf:eace:0:b0:354:f190:9eb8 with SMTP id ffacd0b85a97d-35e0f285c44mr6088646f8f.29.1717416482876;
        Mon, 03 Jun 2024 05:08:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5b1:48e9:27a3:7085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04d9c89sm8606667f8f.60.2024.06.03.05.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:08:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2 0/8] tools: tests: fix shellcheck warnings
Date: Mon,  3 Jun 2024 14:08:01 +0200
Message-ID: <171741646963.62402.3218304292601785718.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603115628.102616-1-warthog618@gmail.com>
References: <20240603115628.102616-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Jun 2024 19:56:20 +0800, Kent Gibson wrote:
> Following up on recent discussions, this series fixes all the warnings
> detected by shellcheck.  The resulting tools test script is now clean,
> at least from the perspective of shellcheck.
> 
> These fixes do not correct any known issue, other than shellcheck
> reporting them as potential problems, the intent is to remove common
> shell issues that may impact future changes, and to simplify checking
> that any subsequent changes to the test script constitute "good" shell.
> 
> [...]

Applied, thanks!

[1/8] tools: tests: don't mix string and array
      commit: ee9751a07dee230229e4b85dde14c600397e026d
[2/8] tools: tests: declare and assign separately
      commit: 57ed5cfe66f03d0a30f34aa319560e9079bbcee3
[3/8] tools: tests: fix unused variables
      commit: a88ed2f9bfbf3b73c156f8db45b6b6af62291c53
[4/8] tools: tests: use read -r to avoid mangling backslashes
      commit: 48f634ab57e8b2c0173a4138737895bee070c493
[5/8] tools: tests: don't use variables in printf format string
      commit: 45f2d4ba38852b611bc4bf622b2582de85b0ab91
[6/8] tools: tests: check exit code directly
      commit: 934adda1339707f4721af0a7a128e20737ed9986
[7/8] tools: tests: shellcheck don't follow sourced file
      commit: 2f140aed7d3cebb3dd67a31f8fd6846f3c5a480d
[8/8] tools: tests: avoid splitting and globbing
      commit: 37f3676cef721e6909ea84cd6c4ada5dab84f4fb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

