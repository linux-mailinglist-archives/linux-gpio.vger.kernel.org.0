Return-Path: <linux-gpio+bounces-18757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E9EA873BA
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 22:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDC1B188D6BE
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 20:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EB01F417C;
	Sun, 13 Apr 2025 20:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UFdTl2AN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD8C17A317
	for <linux-gpio@vger.kernel.org>; Sun, 13 Apr 2025 20:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744574423; cv=none; b=sYRMjnseJ/Stq7x7px99XBD6qe7TSsEKCpZXMVdCo0EsG/+5EudP8Q3hZfWta8xM5IX/7oZbIFMLnM3V8zcNQtgCzZht0hk0gI2o66TuHl7bqMBnPlXy1TR3rzMiVti8OcGfksA7veHsnGdvV1IT+iC2LWuIPGo265flJ+9C7hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744574423; c=relaxed/simple;
	bh=TtZ14UJApXMRPvr4GnfMfduGzgNBfwCVMzqr/TJZeSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qpxxmTI2zFQCVtKDoYhMf2LDf6xDyjnf6gHf4w1AtU3xZwis6EogXeeXMog/XHk9sXdMeevDZhh47t42pEJnNMiAIiq9BkOdARlKLLK4NW+K/gVx/Dqn6Sqb4lGQWF7fpEmYVHpHRnLPQiYjpYP9V5lSGYmdl7tZBHowQKu5de8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UFdTl2AN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so38671115e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Apr 2025 13:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744574419; x=1745179219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Yy/848/baLEzkw8qa5zoxS7nq5QkNFAJau0dpZhAiE=;
        b=UFdTl2ANrR3WHnhTzgrvrQP/XrROa44vFvQAii72eGJvLaf4Py6LCKuc4iniE9dMta
         GZisRtevt5Uwlze3PhXz0YFKKE8nbVL3IX82/Jd51x1uPrLtB9E/+mzzwzV89LQtmNYo
         y8wEVo7P4fH2FQCMPFEVI/NuM8F3CnM5F2hr11UeIbqjJJ2wKwYrwB1a5ckhg0DwuHWl
         AQKZ0DYdfxZrtIin+xVAMtQXf6mWEaPwe3nQVARf5iTZ1HB/44GcX5B4brdDJHSi451D
         9HaKOkmSOMgzRw1xHB+RNBlMNDIWpEAOx8YA2qyS+jXeSS2fv5J8pdy4c4IuX3lr/HCk
         fv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744574419; x=1745179219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Yy/848/baLEzkw8qa5zoxS7nq5QkNFAJau0dpZhAiE=;
        b=NAblGpAiMYpSvQ17yU7RlPCnTkIhpDOdTQoUrvPTmL8rWsxsR964FkrFfbQAj3GkEm
         GcnYjr6YUCfG8j3jOfNeMaIh4ZP4hf9RrRxyovQCBknZfy9VIXALJTFxhC6GkK97lGag
         L8pqRtVf/2DEhw6oz/wo6cuoQkFHrXuPQxmZapdlLw5ggbne4ySOrNOFD/r7U4xBc8nT
         EjkIKLFKN+B8x52JT1AHL2kGfGbXAQJG8FE6tOPxDi3nrHcRflPpVzswbOpf+2NoUhu/
         vY1aPMXzxh8RtAFrLHhjNdjtex5sZoaJa8k3zrhGwhQ+ThVWxvlR/RcnkctV0/VYCMzD
         PTQw==
X-Forwarded-Encrypted: i=1; AJvYcCXLmRGUz6JzqNhxO6Rm/WIUfRgm1zMaYfQlr/5w+xiT66kfXveNRaLaa/rvltFtyruIF5s898NuEnjo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs/nHxVH72Bld0fytPXI5PRQG5gXHfREeENlUMCWymM0KoFcmI
	2p08X9ztMdR1A1hBoPpmmm+7g10S4WG6eoPaSZIeGEUfnOjh5jhk9lWobvDa40U=
X-Gm-Gg: ASbGncufrqFRON2+UdWpRMN4Dv7MXNN7/ao29994VbKKPdcABm3sIBt0FsiWwr7FUtR
	w1P+Wqv/07ZcMnRTgOOyTCSnq3EeJY1pZwEvjL2MS1gL1nk3zmmMilrElq1+WnB7tHaZjrEJOGZ
	1ZhsCpdJiYUfCx9WYYeB2MDTll2Y9KcVnt3aDJEL0mkrpg6KODrRO8nIjZXBCMBHmHzu4vcBX+b
	rUVGR7iyoQp9M7xVjl1pda1RyfxICtHp+AyfwCR7TAZ0+dIz5iwqNnAhltcB6+TTbvqsCZNyF9V
	E95Hvld8QTGkDTWVoKV1m7WEOXFLG0rfc/Xl
X-Google-Smtp-Source: AGHT+IHkeeRojU6nphRcBzcpFgA1HGJWrqUBo0zw7NF6Zq4RRkjDJ2KrUAA7MSqPk38slZirAV8Kmg==
X-Received: by 2002:a05:600c:3c82:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43f3a933b99mr83516875e9.7.1744574418483;
        Sun, 13 Apr 2025 13:00:18 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:e852:1f2c:a4b2:8e89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce0asm8810540f8f.70.2025.04.13.13.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 13:00:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	theo.lebrun@bootlin.com,
	Chenyuan Yang <chenyuan0y@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
Date: Sun, 13 Apr 2025 22:00:13 +0200
Message-ID: <174457440296.11196.17152391053685137943.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250412193153.49138-1-chenyuan0y@gmail.com>
References: <20250412193153.49138-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 12 Apr 2025 14:31:53 -0500, Chenyuan Yang wrote:
> Add check for the return value of clk_enable() to catch
> the potential error.
> 
> This is similar to the commit 8332e6670997
> ("spi: zynq-qspi: Add check for clk_enable()").
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: nomadik: Add check for clk_enable()
      https://git.kernel.org/brgl/linux/c/4521e0884c261fd286c02da942e9e8596bf2e7cf

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

