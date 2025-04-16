Return-Path: <linux-gpio+bounces-18974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630CA9082B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 18:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E773A6F86
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC2F1F5820;
	Wed, 16 Apr 2025 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Bbd4G7MK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7141487F6
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 16:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819228; cv=none; b=m/kMldW7cxNE9aPKyQl4tYgdNtzekUVIk0nSfmDQ8T4b2VzkQ6vhfGWjMtw4St8fWT9QBS06qc1Yp5ByRZrTacgXRdkKaldPtarddLEjr5muFm1kBTR7F/wf/QJTK0k6A+i5880FdgSB614P8Fp7pY6rCGuGcgAU/gBDbz6qTDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819228; c=relaxed/simple;
	bh=cZZKPKXTzslZ/jEEFzfWD1ueqB4WTrhJKrotS75KfNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KWzLv0WVsn+WI80mPqftRB38Y7lTS69VGhSwic+SYOrpD6jm0iroJ7pGbWG7UX9YfpxnYrvu32m3SbzwluNoMse2BsZ+9sf76T9SYLoPEytCxjvQJiyS2MI/6re7c3v7L+qdN+g/OmnZYH/ncLU/7LDP1Fv5/XQ3n+PKRVa7iDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Bbd4G7MK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf257158fso50653565e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744819225; x=1745424025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIBNAHLEMtxV7052RtH+SjS0Pls2aBfRdx4DmOQrMuM=;
        b=Bbd4G7MK7v123Vf4bDZil0jANP48NX2cj5VOyLmnyAWQoU0nOJFFvfyoa4awOt/xhb
         yk4rt5ShSqSv/ZbiVvjC8yriHyMb2oZOcKmETcsHKmE91FYByl4HYXe+8Tx5Edni0ZXI
         5cqGeN/PBCi+zSj4KunznrQbqNVK+ED+lMf1oLj0vgQdJTbRi/QCvvrdwmqYMEeWnZg5
         TYiHwe/likm4rPHneZa2FNA3Sg8pRgGFu+3uAaQGCepZzo79X+H9BNkNa71kRon82Tz2
         OGarOH8P9DmJNJVyR5nVZfQr8QgJD2gLL891JD360eTe6mlmMHeDpybwR2n1vZW7YaYi
         gQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819225; x=1745424025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIBNAHLEMtxV7052RtH+SjS0Pls2aBfRdx4DmOQrMuM=;
        b=kq/7JQ4N1ivWfQrFjAJu+NlnkjZarp022j21kqLbpL71eaeKHoSUQ/HAs2zJ6AiCig
         yFBLLPHClxaC2TWH0akQXEzxzMTzr+0/gU+rStCVTCccZGDB8lCspo84keDjJRdZ6/pT
         rB2qh4yE4KUeYGfHuY/HyCeyfJ5GMdtv5KM1NvJGvenBnio87WFMDsTQPuQRFqbs3IUm
         8MalEcx0F9zsQbyWWaGUgl/tUjZiuDSsSv//J1ykyrQCGhtDUkygBAsQOLrtsoZRgIQe
         UJC8BU0WcaWmDnrMCCwKy0pFRCNLL+1fKn6PxC5uOMxdW3AySYfPSEhTyUoHB4cwy7nS
         +KLg==
X-Forwarded-Encrypted: i=1; AJvYcCWboNoBZMSW6IOVoEfjfPewgO+4rpgNgC+84z7zk7i16ID3iBnZvmkUiXiqYpOzUcmAd5SeYq3v/mTc@vger.kernel.org
X-Gm-Message-State: AOJu0YxAUTHgDZVDnT4saOi3ePqocLk1w+xBoOcaZIK+VBCD0thDieR/
	dWd0u9g6tPjsPbBoscT5cWczL3UVyEx4G6Ta1OvcKAZdt71hbSZfEkzj/e1vrlk=
X-Gm-Gg: ASbGncsp8TzcnmynwvDMgO21rNXmHYanCFESzETDP5ZeBsqvWFBWvbaPmrBd0zHfRLD
	0UOl6wPQETD4gHE5v3Jy5rAn4UbwFROsfjkgyYue9wVZzs4xWYnHh0McncyhQlDUQxcvzVmB4Gp
	yiNCVRbwkbul50zF5OgvR0TolbHdfNIaWabC4lZp0R6shQyoXWGjvQ0m6uKaB9dvhL/i83Ziq7h
	7CNQ0N0W6rkAOm+Ozmm3T64MgTg6Xc+L/m2ZA8qudd4Cc5vAvOFOyW+pIt5y5gHA94m1KjPdmnf
	bPQo5Ekc2uhWcK0vAMNUQvS9LpCXFkZaRAA63eGZ
X-Google-Smtp-Source: AGHT+IHeWI1Bp2vvtcpNP4jYXpKVPiQzg2Rmfhr83y+MKyA7PpBMuj1/jTTxGqCdZx2YGHohscLcmA==
X-Received: by 2002:a05:6000:1867:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-39ee5b1307amr2295946f8f.4.1744819225168;
        Wed, 16 Apr 2025 09:00:25 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b58c9e0sm24916735e9.29.2025.04.16.09.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:00:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] tests: uapi: add test-cases for open-drain and open-source emulation
Date: Wed, 16 Apr 2025 18:00:23 +0200
Message-ID: <174481921950.8552.4172740387448088273.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250410-open-drain-source-tests-v1-1-a062d2280cc5@linaro.org>
References: <20250410-open-drain-source-tests-v1-1-a062d2280cc5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 10 Apr 2025 11:17:47 +0200, Bartosz Golaszewski wrote:
> The kernel GPIO subsystem can emulate open-drain and open-source by not
> actively driving the line for active and inactive output values
> respectively. The kernel does it by setting the line to input in these
> cases but this still must be reported as output to user-space. Add new
> test-cases that verify this behavior.
> 
> 
> [...]

Applied, thanks!

[1/1] tests: uapi: add test-cases for open-drain and open-source emulation
      commit: 41231df28c9aecacaaae9e6493d31161023733d6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

