Return-Path: <linux-gpio+bounces-7827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0191C643
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92F4E1F22331
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC7F6A01E;
	Fri, 28 Jun 2024 18:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O8Oj4HO3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48A95B69E
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601163; cv=none; b=HrefVzmtCyNyXtQZ73/V+Ss1QoLKTRCmG9+lERhU7IM8wMvcrFCGMlfo7epaw8FkTYOz3YkP9lPeCkHjt0Lu5BCsK+HGNYplOlpXmPYpFbjUcpq2ziC3yE/2xVKU4oG+5lOVR4QOppzGYK2BpFuXiAdv4GWxx6IxA0aIUoV3kkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601163; c=relaxed/simple;
	bh=UcZj1u5SAVAOYe1fya21sKZAOnhV9bVqleILwnV3Ots=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3lL3JTeYs5Fkl6Rd+c8VvRCIUPTq8FlQHaWit/NToe3Ywoph3FXKk4wJrNNtVcRVy201F3E0c1MLu8FFmXzLuLUs2shfaIJ6VssRNV7MOciPWMw3yfAAInOug9j2ki1WT1UYytv1No+paz6sl3iLPW1WHKJmTpEr9RyEiRc0hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O8Oj4HO3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so6149945e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601160; x=1720205960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzCg/lASZhzO1UzajDdto+yAoIPnvSjznco9RY9WC98=;
        b=O8Oj4HO3uK+yKlVrqSuPsKnOxKw0hFtQd2QpxKgvmyESQjNx5bYuAUUVrBxuHOx5Xq
         3cT4kTWtImJqrxzXpsd3M0QHDTZmIGK27CUTyFM3i6WIbCsjM0p4iahN3Zvdi1rdIGZ0
         EEA44pdYOAQbHTHEUETCtdZhtCq4HTW93tWxoCtf5tHp22W/W4JZKvuLj1UQaNI41/SI
         eypN+SPgh7eaf2MQ9/UKTbwC+OvmcxeHWSwVBhx8ZAC88OIaqYfefEy6/pt26ZD8pgZ6
         3XEz+9d98dBOLMAHPnOQmxbnTBg20xnrBREkHim9oRpK2nws1IqV8se6O7yFeVxq92I1
         jxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601160; x=1720205960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzCg/lASZhzO1UzajDdto+yAoIPnvSjznco9RY9WC98=;
        b=OXVFliLkCiVvOPx8u0d23roc//3FD6t3OW1SB6KvtNt50KvlrWMRpteotmdgy9W0HS
         VybkohbIV01nSvgoGdA3QJAh775GZ7S2962MJ6pQ5UTm3DLr156qldt7N7IiHwwgrprA
         SiBU56UgYdIOk51XSPMfCYz4w8V27SzOa9CHExnRZl+0PXi2xkXb17JxuMWa+YKQcjxS
         kihhHTHHjYSGBp8YkOB0vsUziRUq5h/VFkpSMVoYUoAPh+bQXDQ5U60I4zbxMllRMOyW
         M/lw9elJH12kb89YVfF20AY0TBWve+zmhmyA4Sqy4TzpfMiXde6owKIVQiU/LBRvOeok
         7oAA==
X-Forwarded-Encrypted: i=1; AJvYcCUv4mPzaz9v2Dwu45QvnSgTLP8d3QZQkydqUNco1Kr5m3s5x+25g9KokE5bNhJj1ZSd0aV6XopoMcxou4y5Ps1ERAgO09sDoQNKZw==
X-Gm-Message-State: AOJu0YynF6GatQbcxSbqzBhR0+bhf9qlD8IxUV4QvS9yvnLhNfowxFy1
	BO685ZtgPvGPfKG6XJoQSx/bN3hn2N2XWC/BMOGYGGyrUQO140GyiYY4RJsYzW0pPE4z2qneQaf
	D
X-Google-Smtp-Source: AGHT+IEqEw8CqI8uXh2QdSaqwcxqATKEsvrSypmL15NEMGhK8AR3zc49TExGqhyZV8MC3vED0RdzQw==
X-Received: by 2002:a05:600c:3595:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-4256d4d35a7mr21654555e9.6.1719601160471;
        Fri, 28 Jun 2024 11:59:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:37 +0200
Subject: [PATCH RESEND libgpiod v2 18/18] TODO: drop the DBus daemon from
 the list
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-18-c1331ac17cb8@linaro.org>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9rY1BUPDDPerFOP/PNuai3xHNV6ALuq/YNZVooXjsk8=;
 b=kA0DAAoBEacuoBRx13IByyZiAGZ/B++gql20e1uz6L0azdUfokp3rixsdv9tsv7qTuEvFuCy3
 IkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJmfwfvAAoJEBGnLqAUcddyy48P/jMl
 J2J58pnxhQPppkkeLX+yq4INwFhQiJqbTrHE5rlsp6CWApUV4Sd3IvoYGsrD7SpaM02GZrWvraK
 fc7ZmirwF4K+80p9vfw9Z49b8veph0lEgm9DukMOf7u+7BTKC8Ii7DfTHtG6eTmWJmxMCA9Fd6R
 oSevUKcq6wnpTaiLsdS2vo6YXuh9LS14sl1hZXyprMi6BQ06g+xdsg+7rklFihS1fnTMwQwiT0f
 V8d5oNk3TE3JI+0zTwDvukGMbeYYab1yhLi1MbWfcxofvyZw1PlG7DI2oPcddic8pLx6SzX6dag
 hzoCin5Thwg+OtPjArT/KoqY+9BLgrO2T9FZmdbaBbdXWUEhDbgiodqEccKqXXRX38Tc2NNw0pM
 X0tpJILzoMWP6xTfaLsE5GWR5K0K9tD7a8hkp4r6wnJCKFFXjJYc5VE7IgFfvrH5DYd6VPtQ/de
 aIMBLvFEZsJLWW6PUtT5R2Tw/IUgJb++L9ONFIyUhtjMqT5ZPrOUp6oZ5LbCtc/K6YfnvSVGwfr
 tcIg3GbyT2WhdYJtNTeo6VDCf9LxUSU9jBCRdxIA1+GJ3wI2cmOHa1gGP2dwQfcIF0gAJmaXXkb
 AgauUw2wJD8h9/r5C9g2BVusKxbJx5DVXVqYR9Rt57Ni2Gppqxi9UUvlBOE1To4UjdnxuDLND9c
 3Y0zA
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We now have a full DBus API implementation. Drop this item from the list.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 TODO | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/TODO b/TODO
index 79a6246..5092f3f 100644
--- a/TODO
+++ b/TODO
@@ -11,23 +11,6 @@ serve as the starting point.
 
 ==========
 
-* implement dbus API for controlling GPIOs
-
-A common complaint from users about gpioset is that the state of a line is not
-retained once the program exits. While this is precisely the way linux
-character devices work, it's understandable that most users will want some
-centralized way of controlling GPIOs - similar to how sysfs worked.
-
-One of the possible solutions is a DBus API. We need a daemon exposing chips
-and lines as dbus objects and allowing to control and inspect lines using
-dbus methods and monitor them using signals.
-
-As of writing of this document some of the work has already been done and the
-skeleton of the dbus daemon written in C using GLib has already been developed
-and is partially functional.
-
-----------
-
 * implement a simple daemon for controlling GPIOs in C together with a client
   program
 

-- 
2.43.0


