Return-Path: <linux-gpio+bounces-12369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B1F9B7AF8
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 13:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D65791C2206A
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 12:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A2D19E999;
	Thu, 31 Oct 2024 12:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="smlXXzfi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCFA19D087
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 12:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730378611; cv=none; b=DEWn3rJnb/B0jLjO4wjGPpxTDFLvuhlb/kHIqBtg8MyY8na7bVjeLFqNqALYEsj41N+MBhntwtzfnnGGVFfkucto+TYdtzBzG12zYw71XIC2lR1PNUYzbv2t0xhZeokUyRG7XZBGw+tQRc63JBYrwTs7QaePYDkloVT2mxqZf6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730378611; c=relaxed/simple;
	bh=UN0TCpzuzjXzpuD/YbvswwIqzUFPFchbJ0W2UC09I5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q5Zx7LKpl8fRR8CLX6DUcbMWqEkzHRi4exj9LA3SJ8pZMpluyI4hWWUiknavony01wxNUSuqsw5tGiN0qm4XdEGdblfxKXntPcKccO/eOKg2K/tUOUhcXF6AaAIeSRUDPGkrDHSDHqhJsZKetn44EUgv1aLz3t1ok5vJdcCQhDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=smlXXzfi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d808ae924so521680f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730378607; x=1730983407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NvAiEcmr3Bkqwa+x+z3wqEtD01j06Ynm63RukDU9ec=;
        b=smlXXzfimDFvtkg9sK5dCTfyrTy81XOVO4WfACg7zWxEsqJPKDPTuDAf3jZyWlcSmz
         cQiqReJJA4c98pQIHupMKGMjI0V+JXbnRQHVJ21fCqWFZqNLKMXQl8LoKrSZ0dIoIdKo
         jhT50KsKth4ykn659ZGM8MsfI5pl/FXhydTP+iSvs0KweghxlXpezZBLIx+1GY/XFHVy
         LbMre91Sd5NaKzjnxJkzadUQw2/cG5SowYuYZ7NKe2m+pvqIai3DgJEKyTVbkxohsjdO
         LywkvaTivxC6/FbA+y/Qr0pXPKyxJhlbOtE3tIgKyvGYS8lqidQweKalikreahxto7pq
         c3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378607; x=1730983407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NvAiEcmr3Bkqwa+x+z3wqEtD01j06Ynm63RukDU9ec=;
        b=qEA7XM8vvLiqege0iR8CMiT25Ol4rVDMifSXaiDZxfzsRAgGd3LXlLMb8VEpC09f0y
         LOMGaTL/wI6XXQh3D6gA1kcDLkg82QQkgUlOImIc/5uYnBcg98EuOXnPcppWdbmbQCiQ
         RlNoNkSbEd5TCsVlUBkHVuZbh9hxk7GeT1Jcv3/ilDoJS2KCo8nnQl6vA0Iwu4h8vlgF
         6Or43TW168joXM33VQFJzPeikZRKUhq2A2SEM4MxA2RKH9WUEs++9WEygSBrQwxH6mqW
         HGwuCR0QWtiQuhMV5zkmK1I+bostjhFLSdWxFMDDQ9jO7cq0hJPSqi9syfPcIv/LWLdn
         NC7w==
X-Forwarded-Encrypted: i=1; AJvYcCVci90Otn7LdPx5LpKAhsQMuriUc6ErzMcKc+TR6pkWejfpx7VPVnSBX23yueUr1HiEAWVIDsRH3oi1@vger.kernel.org
X-Gm-Message-State: AOJu0YwsVWOqUdfr1jf0jrwpZD9Qqgw/1Y2u7mCwzHLuIFzmZ5iWVrjX
	esvCWF/xLji3/+U7ShmciqsOmd318KkPIjXQVneNeT7LIdEHJmZa/8Qoqi7Qtww=
X-Google-Smtp-Source: AGHT+IF30i6ka1elJWPx3EArTq7Yjb50xuHjDZ5vtObnKFlbrvUrpV5QCfQF5TFFmJk617XgpXk/Vw==
X-Received: by 2002:a5d:4441:0:b0:374:c56e:1d44 with SMTP id ffacd0b85a97d-3806121fdf9mr12656862f8f.48.1730378606974;
        Thu, 31 Oct 2024 05:43:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a6bc:32f9:21fc:be97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1185b4bsm1999195f8f.112.2024.10.31.05.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:43:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] gpiolib: avoid format string weakness in workqueue interface
Date: Thu, 31 Oct 2024 13:43:25 +0100
Message-ID: <173037860284.7463.3619742464937960411.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028142152.750650-1-arnd@kernel.org>
References: <20241028142152.750650-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 28 Oct 2024 14:21:46 +0000, Arnd Bergmann wrote:
> Using a string literal as a format string is a possible bug when the
> string contains '%' characters:
> 
> drivers/gpio/gpiolib-cdev.c:2813:48: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>  2813 |         gdev->line_state_wq = alloc_ordered_workqueue(dev_name(&gdev->dev),
>       |                                                       ^~~~~~~~~~~~~~~~~~~~
> drivers/gpio/gpiolib-cdev.c:2813:48: note: treat the string as an argument to avoid this
>  2813 |         gdev->line_state_wq = alloc_ordered_workqueue(dev_name(&gdev->dev),
>       |                                                       ^
>       |                                                       "%s",
> 
> [...]

Applied, thanks!

[1/1] gpiolib: avoid format string weakness in workqueue interface
      commit: a22c9dc26d6fc522357b73858b13e29c58f49d64

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

