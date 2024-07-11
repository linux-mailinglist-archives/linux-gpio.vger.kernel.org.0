Return-Path: <linux-gpio+bounces-8182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907592E6B9
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 13:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034481F2741A
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 11:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9C015E5D1;
	Thu, 11 Jul 2024 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SQTvZ1w1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36373156225
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jul 2024 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720697222; cv=none; b=HXgNYjOC0NR0RyfeIFA84FslSmZdpL3ag5Lk/H8ECLMQsIj6dyDpmluPrtqwV6ma1M4yVtz8DsIuO2U0q+3vXZZfkn5E30rrHewYZKKRYQ+58d/x3jz0J9rfPqwTmLAoLQl/t4luR946GKoHCWG697tgwlZ6I6K536Bb5+Jw7ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720697222; c=relaxed/simple;
	bh=sFLl+46I2nIDG38kvphRIOBpYD07yzKzGXJY7MR9oAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFbQjgHqztSmsln4yllsrqCZ5sjQ+4eioV4SsNjU1izzKfUB7A4xwl10+X7ntegGsDzhsAt9Ffv/UvXfzISZEXAUsQskPlPn5JhH1LnHvKvxIW52/ksyjeTepXNMZzGk9Oa0bBIdqCy+qbDjEJA5D3Qq2NCcWJoukUIirrFukeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SQTvZ1w1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4266edee10cso4653225e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jul 2024 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720697218; x=1721302018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1K0KBywpi22mmwLHjf1+nAX1GX8EcIXtFis70MZ69UA=;
        b=SQTvZ1w18k79XhSlxBwVOCseA8qoz4hHzZebVQgNO9fdAj/Dg7LQFaMbU/E5h5baLj
         OiPBX57xw3NgiW50VO094uaZf6huTCsD+UkgB0JIH1y117OzA8iI24aV3/F7GI8T3tdL
         hcy3Auaph+rSF2rveAczTiTF9bJjHAJqRNNlRA04HW7sx1nBAoxbF25Vz0Tpj/NXAypk
         X6VChePHh9hWj05TFECz8T1rZxGBjzDdAnrz135krSo8eAXQUHtYdKOjrSMgOTpPfUhr
         nW6op7wxkwWRwdIfq+mut9+ea4Ukb9594ALHij5sEs//Nd9UbKzxMxfjqT7jdTJMKfaM
         OayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720697218; x=1721302018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1K0KBywpi22mmwLHjf1+nAX1GX8EcIXtFis70MZ69UA=;
        b=PvN1aQkoqj5M93W5dYfojZ9gx0D1wB61quiY+/bV+J2i6mxKXxULKAAyTXQaX5RgV+
         2AsD6cVYrzebhdma2I5xUApmhWbqE4DpgyNieJ2cxZcykrnPj3NrMw3Gr9jWwSX9FWrM
         Akrx/HPzYdPYoFdEjdwZGSMheIJ5I6aiKMt/trPjPwqPR6XZS2Qys+Eq8FPJ6KDWd/HE
         M/5iPHsMC1L38YuGVRJ99zcpy0PvLyGo1zeuAMzCCcMx+ETiJsvK1dq7PT7mp8/Y+tGf
         j/y/PLFdKvVf7/ZaRFMicXuzJbm0E8xpgiX2Z6awiUK98dwwceWwCHyK8fdjSJ73K8MX
         LPwA==
X-Forwarded-Encrypted: i=1; AJvYcCX4zUVmsnz2QBHxW9sRRtEbOh2MWHErsCuoP3b8ZDx9GrwN3lSFpI2zbfkJ1hGzl/0kDjz4SKE57+dg+dtAPIZe3KgX8EGJh/+UgQ==
X-Gm-Message-State: AOJu0YwcJsDWRdKQZ/V64QHOGFuvbl0ZJ8bXwTEIlLoQokhuHD4iqaeE
	HPWPEOGk/fHqLOQm/JDSB6UEPLPY2KwWztFc6Y2itE/ic6c13LVObeT4kyAuwd4=
X-Google-Smtp-Source: AGHT+IEgavVxMJp1vb9Aj9rEGHtKLoRb7b8gmXiqrTwlbTSXFYsuCBb1Y1SWuL73IPdZnhLTuHfrgw==
X-Received: by 2002:a05:600c:4b23:b0:426:5cee:4abc with SMTP id 5b1f17b1804b1-426707e208emr46217175e9.20.1720697218338;
        Thu, 11 Jul 2024 04:26:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a653:bd8:f8a1:dd69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa06e9sm7479246f8f.81.2024.07.11.04.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:26:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH v3 0/2] bindings: python: fix line request by name with multiple entries
Date: Thu, 11 Jul 2024 13:26:56 +0200
Message-ID: <172069720903.84307.5511624831505471093.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710125719.33655-1-brgl@bgdev.pl>
References: <20240710125719.33655-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 10 Jul 2024 14:57:17 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We haven't heard from Chuang in two weeks but I want to finalize this
> series so I applied the hints from Kent.
> 
> Changes in v3:
> - tweak the commit messages
> - change the test class name
> - improve the test case by testing one more line name
> 
> [...]

Applied, thanks!

[1/2] bindings: python: fix line request by name with multiple entries
      commit: 237fd2c0597e720980023975250497d30aad1c12
[2/2] bindings: python: tests: add a new test case
      commit: 0c7ec9ee42912db00850c7570bbfd5325339da13

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

