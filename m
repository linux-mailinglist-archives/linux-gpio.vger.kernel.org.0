Return-Path: <linux-gpio+bounces-11908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C89ADF50
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 10:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D6DC2848F3
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 08:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8AE1B0F2E;
	Thu, 24 Oct 2024 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j072weQ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFAB19DFAC
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729759106; cv=none; b=azNcV3/IyTLoFBB8i4QGSfxr5Fq+CZhpdEhVu8+Pnhe2ega+OhIMtse3zV81QzBtDZLLvLNIPfgGJ7ffC1x0rJT4CgSqnCGmTvKNa5Q8Ailw3t1EdPGBoc75U9FgB32Kka+wXSCL14dp+EWLfJkXDOOeu+VyuD0Q/cm8VoTOAHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729759106; c=relaxed/simple;
	bh=a1vFp0j5SSJamM8OhuteRSQJkTWrElcY5xS6rgIOcjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P3AFRePR8WPcgfnqs4mBgD5ZkfvcY5al8HfCDYwv9hRWNyKZWQesH6URVw+C+wmJCiBKatkeFFHO/DeqTex0sQ8kqsY4KEM3Yb2P88e9GlGk4d+9tARe32Xt4NLPlQ/gjHOqad+RNJRVs1YUngg2Wa+8YF1kRGegUf2QO2OAEXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=j072weQ/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so6720775e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729759099; x=1730363899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRCfpLlVmBA/GhwBZGPGVhYfkecAk0ZjJSjMaPm2f3k=;
        b=j072weQ/vwQvytYsbXs9t3qNiEvdhq3cz4QFK6lmj5KqoN4eT4n7OAPNaPPiRSd3jt
         qdxLGhMzsa+hnlwb407HtvnZErynl0Mka/84KIKMmc/sdMZiBS6ZtU/Ln7vFos4Q1C0Y
         E4n84GNem2Zf1Q9mKvmiHy1D8VvJLoBFltfNYR/aVo92OLSrj8dGVGWNph9f4wY7zcOX
         VZn1++iILrf3gC7r/Zg48VXccvJ5Rd7RMdFyDXMG9YI6KbV/CAEEL5pnKtSsmNtLY09J
         Gn0cMAryBYW0RaXSVdh1f6AHBwVSix8l63DDIS8q7iQv419MIhJrJZ3NFmkmmR+aXiK1
         C3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729759099; x=1730363899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRCfpLlVmBA/GhwBZGPGVhYfkecAk0ZjJSjMaPm2f3k=;
        b=ZzJUM9MgtaXAOXXhl338R85I61hu73uh9fp4rN8EuFyQLWtxUONJFdEy4pCnbfTSk1
         SUoNsRimdpSkaqZUTx3XSdTKj6Pk+0aEV93zZzk9Gwq4A3PjN1K7+wZnDaokfuqP3+sw
         cDoq8RigzitHwNjnCZRlDBFMYiO+FmVqqEb0+KREvCEy0d4TMUKYaRJGqXJpAhC2ALlJ
         1tUIaA7QsO1AsCwTTG/mH3kL4S9snc9bRKGYIjU4YpfHtjTr/DeqBdJH7s/KSHtRH7W+
         1YUZXlYt0bWKCBTSDn3y5Pds/RLKf/nbeIoyLI+nVxqvLKkqSr5ePZig6tXQwCB5XtBE
         ko/w==
X-Forwarded-Encrypted: i=1; AJvYcCUxQYNP+gKyTKRP5BbeEy6oRiZgMt9UGtoVXl48yGn3JfKsMbWS1PSD2Z8kLTs+CQng6+tuVRJcqFnp@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZxKW9mrK78suLhB0OqmeeOSR1la0ItoUe4iTJCA7WhIl5hDi
	MZQ7LGFnCIvCeEKXcNnsuboJAmLMOE7GmrPulG6r0x05KPtMt65FYha/ywUWFGQ=
X-Google-Smtp-Source: AGHT+IH59D6trEtlIGfhSaQUFfOISh1j6XVS0wklp7e0TLgrmSzRjpGtPxH4z69HNeeyStMMxfld7g==
X-Received: by 2002:a05:600c:4f88:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-4318c6e8f6dmr8250915e9.11.1729759099048;
        Thu, 24 Oct 2024 01:38:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:17a2:e679:56a4:a25a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4864csm10789687f8f.35.2024.10.24.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:38:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpio: mb86s7x: remove some dead code in mb86s70_gpio_to_irq()
Date: Thu, 24 Oct 2024 10:38:15 +0200
Message-ID: <172975909020.16227.8464107518075486069.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <b7f3a78b-7163-42a0-bd09-8b3184f29661@stanley.mountain>
References: <b7f3a78b-7163-42a0-bd09-8b3184f29661@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 23 Oct 2024 11:35:53 +0300, Dan Carpenter wrote:
> The platform_get_irq() function never returns zero so delete this check.
> 
> 

Applied, thanks!

[1/1] gpio: mb86s7x: remove some dead code in mb86s70_gpio_to_irq()
      commit: 4295f4ccfe8c6e6ac5b631919ba7a4fe89d22acf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

