Return-Path: <linux-gpio+bounces-15937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 323E3A34C6A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A39F0188C4B9
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 17:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EF2241690;
	Thu, 13 Feb 2025 17:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LiDE+xmv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D71241682
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 17:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739469131; cv=none; b=VYYwq7cJSGRzbdMNNg0oRle9e3S36e0M017zzVIXxWRtvGUzzuvYJSqm+bQlMCK/Ccc8Pw8nz/iILk8zuii1vg3FfnjamWtvM5zBQ4txIal9lZ5Xj1mbrbMvMbIOyS4DA5k2g6gCS1C9DECAZ6fG2g0XHrs+fvo6YRwjqPYldB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739469131; c=relaxed/simple;
	bh=1XiHw4tysHZjQU5ChfFDqUqFY9o9KtfCc8HnMsfBflg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jd6oWRYYSqU7m9fTxLNCLFz2+NqZGSrXIskqc/lVJ4B6Je63STEkzSlSJAnXZ+Lgy1QzDCzlQknQeOLUeEVL5tRt2IEsIaQW4VYQ/q32TDidHsbwNB5NBAFXvu1xIwCUse/yVcHqgvIQG7ygXj8ytqt3EpKqktMr4Ki9uJVjnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LiDE+xmv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394036c0efso7922735e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 09:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739469127; x=1740073927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIQEb2lERL52AWDIt9iZmMWM1q2cL+pDQtCUvQlkWmM=;
        b=LiDE+xmvhnv6XWMILoHwJVG0p3FXz3tzoaQeRUDbzbTdV0EzLuMG17PGrUmT2TMAoW
         2g8UOBQolN1qtmSbJuy72CTTVluqzvBLNqtWAzBte2toDxTzeaS/ql8ZdLIxJCigF7r3
         1+5RchEvEvBrPptoYsJcQWDft8d70HKbENpdeBXKLt9TF/6eVGAyfzBSA2sVIxlokbmM
         T56M9oAQ28fP9fNr8KRbMFHCyQDensSYB0c0PUzsP2AuasnzFGnzv72+05WTkmoY8pjs
         mcnrpcCHg+4Jgk5rEYAVh8NrK87tKSGpCmVaIXA3xkZrRzhcotEFfqNt2vW6bny+Bsv6
         ChYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469127; x=1740073927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIQEb2lERL52AWDIt9iZmMWM1q2cL+pDQtCUvQlkWmM=;
        b=LwFSiR21I08XNXTTn+PW/+uEMpoAReaMM6WVQF+TyTWHU1FSQ8CvBj8xljHdXe3xxM
         4ZcM6BLy2A8mGlPblmcsMJgJGhclZigciFBcpVYZ1bAS7HTbrgv4Xhwwxt2LczCSpdus
         kKbVo65kEu3KyDYjT/hMAI46WWeAAnM7e7LaLbwlT1TYKAVz/nnFFzBaWh06qMq6vkLu
         4hpMDNdz/o4Yqjl6aap2X1sg+5TWLajsBWo4FM7rmOoIe7EYey9PoZOdMPXFuzgVzY1g
         Qg9SgsrmhcWHq7IZ1j6qUhtXdwzh0ngb3wvsCXGx5Y7Iqf6i2ez6qDGRSz57/hkD/z+w
         P8AA==
X-Gm-Message-State: AOJu0YznuBhrjR7yd9pQ0KWecCODf+QlhUH4sLk4vBjC5yOdh9N5yPNU
	P50/FZD3pYVZaMoVY8lqA7bgFqDV45lwZku5M0EC223ZkBCTnMFagQWxhrV8fzuNoOQwqbij5SQ
	jJ1I=
X-Gm-Gg: ASbGncuymokBqq45l9UWl8BfcxDAVvf0usgldnL4egeBNZf6DgDur1d5cbNr6W/bmIL
	w5V7WxaLfHFZKXg6K6go33o3G1ALp3lOdPqzfhCMsfGtJ2ci2foG8lqrEd5wfcvE+ALi1EbXYQM
	2nyToWVJs2dTnQhR9YRCITHFMYNeiAECmbVaAF98b1MpkaG9b1OiPYJONRMAlakmnHI2Euhl759
	AH2CIyTF2MI7IRV73R8YWprHNiANSN7i4RHX/reFAKbhXlzF3Z+xlm4gAnpZXjMVQ7a2srKUnrY
	IJ4OicNWHLsMdt4=
X-Google-Smtp-Source: AGHT+IEFgpaDe8oOT53TJfQOEINjGndH+ERgdUXE5ply5cAp7CoaQUpMOTdQ+mRt1C3jJ/fyYRIh+w==
X-Received: by 2002:a05:600c:1c1c:b0:439:3ef1:fc36 with SMTP id 5b1f17b1804b1-4395818fdfemr93388065e9.18.1739469127271;
        Thu, 13 Feb 2025 09:52:07 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:affc:1fb5:fa08:10e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f8c4bsm2467250f8f.46.2025.02.13.09.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:52:06 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpiolib: Fix crash on error in gpiochip_get_ngpios()
Date: Thu, 13 Feb 2025 18:52:05 +0100
Message-ID: <173946910471.103328.15879117296822484780.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250213155646.2882324-1-andriy.shevchenko@linux.intel.com>
References: <20250213155646.2882324-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 13 Feb 2025 17:56:46 +0200, Andy Shevchenko wrote:
> The gpiochip_get_ngpios() uses chip_*() macros to print messages.
> However these macros rely on gpiodev to be initialised and set,
> which is not the case when called via bgpio_init(). In such a case
> the printing messages will crash on NULL pointer dereference.
> Replace chip_*() macros by the respective dev_*() ones to avoid
> such crash.
> 
> [...]

Eeek! Good catch, queued for fixes.

Bart

[1/1] gpiolib: Fix crash on error in gpiochip_get_ngpios()
      commit: 7b4aebeecbbd5b5fe73e35fad3f62ed21aa7ef44

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

