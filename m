Return-Path: <linux-gpio+bounces-11282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D99499C364
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7E8BB2474A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EB7158525;
	Mon, 14 Oct 2024 08:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2BZNe7cS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681A6157484
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894716; cv=none; b=NakhXKiWxAOGXD4HKHcYLbYaypq+mmppR3w/VAGJN+HDVR28Hfcxh5Q/qUpD7BUPNO93mb7xDGqeTPk4wJUE9vnfLZ3XRKstuiwy3Z7dgwlj0mfzoHKIaH5+khMRUVBtRMpkTHvn8F1ofq7pcJzYGQ4Kx173a/SZusumol9NDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894716; c=relaxed/simple;
	bh=1PvLezkk4vhImsgms8spDDX0FpqxpTPwQTRhciJhJg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AJAGA8Lnid812g501WDyHemvtX/KemZv56GlD4D5iPnESfKBz0QOmcXBFFlwjJszTgmIh7DIEkfn4UqFGbTwqSCJLmGcq+iqVJySgvwcslgjjHGM606a50tMq9hD9J7AriZBFRM8Vtj/en8ELrxtVSu7ck29S2Pv2lMcRZEbt9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2BZNe7cS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d51055097so2278746f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 01:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728894713; x=1729499513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3uzILTqMUGVv6AXrppPM9T8gaGZe5Do58YvOV6Fx1w=;
        b=2BZNe7cSA5qoEBX93A+dOqSqAawWsw6vA+0T3NghLHf2dG1BJ0P/wUOvCTO/USgREW
         VH1LdWEuzGqrJahwmoeK4jKEBnwNN2bvmziM8URtX9sJgqSMCGRqdfSGVc8tGgX19u/m
         5v9lKe1MRJT8g6yu5PkYaQRhYWYlV9mKzdWJVH+bP3EPDHlSaTmU/pRhFWxtNnrNnlWa
         iyxIApP1n6Aj5hrV/47rwH/toOO8ktoEbkUwl/+rwd2sH1TVV7fStfnDM0GQ99OK3TrE
         0KMtjW1xQWInkbDnwL6cdTE701K25roAzJm/8h7eYngwz6LDLUUOVkgcabk8YrrL0ey6
         piPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894713; x=1729499513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3uzILTqMUGVv6AXrppPM9T8gaGZe5Do58YvOV6Fx1w=;
        b=vnouJu3GaLzQECxGEjBojRnGeC7wigOu7gHepHuIw3l9ROsOXku6fVgLFW7KfJEO4d
         GYRhaJZaZfj/i1JJ7oI3p1iGkBGgV5cM6enhZBQCnCtMacs7Ua8k7PnugNJE6KJ/oCI8
         Ca3UuAX6yLUhqTx0DLRntRYOh3xzdt0Dnk85uUWvBtLxIKfDXJ3ECErf0BQYT/0BPHSc
         CcSRkSUmoRa0U+fPLNzL3l7GpTfw/Vmwa2RQFiopWqG0R+qx8xNKXxq6ok6z43vNj9Zb
         b13HJUd40DQ8gu9DH8rAQ6aAPoJ+5E4xJQMh5GH1dfA3ESqhbuL5tXDvWH4cULSABnmT
         Ro+w==
X-Forwarded-Encrypted: i=1; AJvYcCWy3HzwiWDr8LGwpPIYvXwsh8468dL4RoMY17Z1uoPB6FxtfBFWBRi0jH9YR/teMq0COV2Ha1zTi7ym@vger.kernel.org
X-Gm-Message-State: AOJu0YzfbJL6GYrQ0TqB6Hq1grBHTfwUD+fgzRdTVh0uSaYcr/ojSpwA
	SntFQPvypNpzTjxKtm9jQTqD6vdd+rzm5DknPuwjb4zBpifVv+qeRDo20mgXt64=
X-Google-Smtp-Source: AGHT+IHo0j5k08VMhjhdsV7Jsy/XzDEj84FT5zAaaDWUJRJ/KPAmWd5SN+Z+UwT5u9czj/rHKtmGpA==
X-Received: by 2002:adf:fa92:0:b0:37c:fdc9:fc17 with SMTP id ffacd0b85a97d-37d5ff2c4a9mr4568729f8f.23.1728894708073;
        Mon, 14 Oct 2024 01:31:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ed69dsm10737698f8f.92.2024.10.14.01.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:31:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ljca: use devm_mutex_init() to simplify the error path and remove()
Date: Mon, 14 Oct 2024 10:31:33 +0200
Message-ID: <172889468798.57095.15647553616181059957.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008162416.85111-1-brgl@bgdev.pl>
References: <20241008162416.85111-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Oct 2024 18:24:16 +0200, Bartosz Golaszewski wrote:
> Destroying the mutexes is done at the end of remove() so switching to
> devres does not constitute a functional change. Use devm_mutex_init()
> and remove repetitions of mutex_destroy().
> 
> 

Applied, thanks!

[1/1] gpio: ljca: use devm_mutex_init() to simplify the error path and remove()
      commit: 476f18c0895df7b281eb84b3e687e6101c844338

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

