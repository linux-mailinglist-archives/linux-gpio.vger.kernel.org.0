Return-Path: <linux-gpio+bounces-9822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA496D0DF
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 09:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0C7E1C2140A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 07:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7AA193432;
	Thu,  5 Sep 2024 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZRcip2s/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC095193428
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725522843; cv=none; b=ZGhcqzdPEmGcHLt1ag2DRZ5NYR28xitRJ6kE1bz0CZbgNhJZeskOHHmaJsdJ+6hYWrARRWEeWaw+m1p5DUesSnz34/e5CxLCCr0mdRIHF8y0tbOabZrUX+jpEglv6+0fSsUS8MWYneDf1xHgTOvm1ZQseDDwKbXblftnU8591OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725522843; c=relaxed/simple;
	bh=VJBwJbD619cc1I8/YyBLZfHDGMwxWgg1L62yHdnPBkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fzoA+1sn2kx+UQ9shFmfalPsdTbtxFvJYfees3bj3vhhjGdbmzkuxm/b4IVqveCddqc8wGZRcm5Agl0gXdUUr65sjNW76PIhpXXGDNIRM8ginTZyGcz2nspSJbkfoJeqOd75jy14qWQrQIrj18N/cTMrqSlp049EcqUyJn0WLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZRcip2s/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so3063955e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 00:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725522840; x=1726127640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5apR4pmNO5sit+KqFjLSdR5QZK2p/duTgt9ROVCwQ4=;
        b=ZRcip2s/U5uUPqn1QD1ulH1+XJ+cKmM8INevMjUyfPh3wawgoNJ4+fXPU40mRXRvyT
         Kx09mgriICXPI2XXlNf3OhMPI5tpRidKNbHYbUQa+rjsiCl6fbguTzyI4pK9G7Y1dyqD
         5aMyHKpVVRQm3Q/aK/JJLDjvxXTwb+nkuO3D0FR/t9Y0s6I2WMXEmBE5cUjnlxt+aces
         ZKDGSSL1nI19BL1HFM6H3iJLfs57RZyF3vJ3VjgNrRb3nGFHWBHeg1Qqvbcn7MWx9EJ4
         9w1GvimJPJvvn9rOL2WR6UryKcHHjw42EmUv9eFBjLsIITzFtEhCnXUjjp/XwWbOw/iK
         7A1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725522840; x=1726127640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5apR4pmNO5sit+KqFjLSdR5QZK2p/duTgt9ROVCwQ4=;
        b=ZHSY43TdgCwG9O8YipZeDTzXebFO3Jy2Ma6c/APx+Zr2mmCGQg+qoujwbLvqQEqkH7
         ZNfM7W3UdFy3PJ6/k7srkbaseUUEQsTN67HCZ56qOZ+2sBj7DoqJ9/h9k79mTIgfGTZz
         ptskYfl8XMpT44iYDza6MEibUDTlUPKr7qzXIM9UvUXXCaikuXRZTmtsTi76+q99mFPm
         JRlEANDKeNkKzoOxunvlJcgYEtDDqNlww9+05fysLupXOh95ykSb/oplkMIN57xh8uqS
         vmmRgACGCSbH9AD13n4SstN0RJNk1PHclLCpLXI6HX7kMqHV2NQjZVYGQ8Y0CeEgpVWo
         6y/A==
X-Forwarded-Encrypted: i=1; AJvYcCWsGbmiHeDZBtXvp0aS37Y0uP24koMh45lE3enFMel1gWaik/LpEjty1enRcIakbsRhMitm6va4rzz8@vger.kernel.org
X-Gm-Message-State: AOJu0YympAsjfc2ixrO0Dfic6byorVGuJceQ0ne8VxRP3104D5pe45QB
	L+C+fIjs5sApb7FJNBr6hSPEDoi80Ko227v8Ih4MXIZEHWUXe0BZc916wMJv0ZU=
X-Google-Smtp-Source: AGHT+IHTYTbdxPIFQ1Fm2yX4/APX3iBtIWWEQQ2xHNTIiMmLPmVaFmSgClpFPIjw07slUGTLd07Kng==
X-Received: by 2002:a05:600c:1c0d:b0:426:62df:bdf0 with SMTP id 5b1f17b1804b1-42c9544efe0mr34698995e9.10.1725522839961;
        Thu, 05 Sep 2024 00:53:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:cbe4:ce99:cb33:eb1c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb273sm226449915e9.8.2024.09.05.00.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 00:53:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	vz@mleia.com,
	linux-gpio@vger.kernel.org,
	Zhang Zekun <zhangzekun11@huawei.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/4] Simplify code with helper function devm_clk_get*()
Date: Thu,  5 Sep 2024 09:53:58 +0200
Message-ID: <172552281048.29255.13807889360517193444.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904092311.9544-1-zhangzekun11@huawei.com>
References: <20240904092311.9544-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 04 Sep 2024 17:23:07 +0800, Zhang Zekun wrote:
> Use helper function devm_clk_get_enabled() and
> devm_clk_get_optional_enabled() to simplify code.
> 
> Zhang Zekun (4):
>   gpio: cadence: Use helper function devm_clk_get_enabled()
>   gpio: lpc18xx: Use helper function devm_clk_get_enabled()
>   gpio: mb86s7x: Use helper function devm_clk_get_optional_enabled()
>   gpio: xilinx: Use helper function devm_clk_get_optional_enabled()
> 
> [...]

Applied, thanks!

Please add the changelog between versions next time. I'll let it slide
this time as I know what changed.

[1/4] gpio: cadence: Use helper function devm_clk_get_enabled()
      commit: d71794170e54a6fa49dbc8e8a1cf69a0b805ade7
[2/4] gpio: lpc18xx: Use helper function devm_clk_get_enabled()
      commit: fb8028a0f4705d75119d539bf9c9bcac28fa64f4
[3/4] gpio: mb86s7x: Use helper function devm_clk_get_optional_enabled()
      commit: e79fac4bc5cf4bda44b35aa5c6f31264c44c8781
[4/4] gpio: xilinx: Use helper function devm_clk_get_optional_enabled()
      commit: 835eb0c95064560b10c1de945fe6d8838cf71b1c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

