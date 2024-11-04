Return-Path: <linux-gpio+bounces-12498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E63999BADD8
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB6CB282D20
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 08:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B70718DF7E;
	Mon,  4 Nov 2024 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="auHxS6b3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0985171E43
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708258; cv=none; b=l2CEUaAjUOsGrZyWn55DlfZkS4wUdofa+fUA2fJP/ACKVecyoJmyg1A+Iee5CzIj1rst6gbXsNzw4nIvO/UXXNNSa9NJ1z+g4zSl6nihkeOdUZLYd0wpfqzat8Hwi4WphOtZkhyBYydjoqZHGK2YWafmnHsg9DDV819482M8x4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708258; c=relaxed/simple;
	bh=DrL9RlQ034Z82goFRWn0Al4rBHBZtJuTnmCRQXw02rE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AHN/u2AsTR2PyQLNXJTdmIPCJ/fOzBMfG0FIM3bl2FUKha4U1P1NwOtDuFHPWhK8MhJMCzrLwNJp0ANB994O/O905eOibxHrxNJFsCZFnxqxqQOh/0rVFhv3tuQAtycPSRF7RMmEKVZc5lHUCL00TQdugSS2K45nDzZzY4qTYgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=auHxS6b3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e8607c2aso4031912e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2024 00:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730708255; x=1731313055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dBGSBNGEw6ZROwus1qCclh+XJDlEo3WqjnwZTQNfL0=;
        b=auHxS6b36UOCMajOucE2EpGfJHr6mCoOXyEpJL7Dpz+RmLq3tF7/vLD+nRIJyaoczx
         ua6KRMs6TK5ljfgxGUQM+jPL9kylnSXfBpI0x+DEzHfVYwkBB6z6yevjY8jKaFbjsGSQ
         mBUkOlvOJYLRcRZAvqspXjNF2z7xf6BMVG0d+OCzHWC5N0QX9xrq3kLXn1/lX4NAded9
         t20xoOzd1NbzBICZfT2DFL/1J4m+WiO7biADNXN4yDTWWg2791oSX6i0zKarEHmfh2sn
         QAWsqhm6Y3QTofrGSZG1mh9kj9gHrc04NjsqMaeM8rcgVWt8Jp9JdFm1Y42g7c90AsYy
         70+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730708255; x=1731313055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dBGSBNGEw6ZROwus1qCclh+XJDlEo3WqjnwZTQNfL0=;
        b=Fc/HCfo51uLC6Ex83d8wvQGorhEhOthhBzBk98se3Lo9UXLTxU+fH2KktHlaaxD2e4
         CMEOh+kl7nnHQaDLoTWmwQ3FY1qoE2gZyHLLPNXdfJs5ZFUu8usdHAyqL6kx4MPzTclK
         AF7jnk1y5wuerdAgU8pnHng/NC18wK2P+sGeB01t9P3dk4UJMcmfQHGkitGmuKQN0f1G
         OE5aPAzbjsfhGpE+bPsgkBy31+muPV85/040EqAPKImxgIOyn4826mxr3Lot4NEdx1Ea
         DOTK0PTuRVFxWTPzR6jPy42WedpMWvoEhBEdYgqlCraWXWbjEzDQxj8KqcYNnR4lQ9MP
         K+nQ==
X-Gm-Message-State: AOJu0YzTNVYSIkDJWUpZugfr3ROIWWejEROQBeM+ZAT82xBFzJL7Uanm
	KiAsyB6ZiVeZ3+60X5rOhfMorww1qcEL/8SLh6E4/9CLQmbsfFedPCMPMoTxjIEnzPXwJOmxxGz
	G
X-Google-Smtp-Source: AGHT+IGR1ugVnPdsbZJxp6ZODxwnYu0cgrH670l5zmyPT34WxXN7hzs0gRtUgA28UX7ioj4utRyrXg==
X-Received: by 2002:a05:6512:3e1e:b0:539:f886:31da with SMTP id 2adb3069b0e04-53b34a304d8mr12848817e87.53.1730708254302;
        Mon, 04 Nov 2024 00:17:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2603:7936:7734:a187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d40d5sm12422166f8f.25.2024.11.04.00.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:17:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Mun Yew Tham <mun.yew.tham@intel.com>
Subject: Re: [PATCH v2 1/1] gpio: altera: Drop legacy-of-mm-gpiochip.h header
Date: Mon,  4 Nov 2024 09:17:32 +0100
Message-ID: <173070824963.11781.3024517056591514225.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241031101836.2434308-1-andriy.shevchenko@linux.intel.com>
References: <20241031101836.2434308-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 31 Oct 2024 12:18:08 +0200, Andy Shevchenko wrote:
> Remove legacy-of-mm-gpiochip.h header file, replace of_* functions
> and structs with appropriate alternatives.
> 
> 

Applied, thanks!

[1/1] gpio: altera: Drop legacy-of-mm-gpiochip.h header
      commit: 50dded8d9d62b6291c91b43d4c73500b07fbd157

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

