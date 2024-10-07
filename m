Return-Path: <linux-gpio+bounces-10938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E68329926AA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 10:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BF20B20C0B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 08:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31B618787D;
	Mon,  7 Oct 2024 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ch2BRpbt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D45187332
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728288478; cv=none; b=GB70O4Iu5Mv6Zv377b3sM3eLpPJe+WMEJaxwoQr1Ti/xVTl4u62vvSHXKFS18udCM9vYQkbg5ThykaC4uWo8dgoWKCg68NP8U0opM3bkJ8NNK75HItwCseScas7Uso2NtAFxea/sgon5sAjOkGQDlD+agAW2wpL1Rew5AX6LJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728288478; c=relaxed/simple;
	bh=2Y1jOKeG+0SNwsNRvwQ9DQQYTgJlJaVbufol4tuQyoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XCejYA5hGz+4xMchlLtL+f0myTT9CFBTwoXQzq9eLPm1WPvLrXHMhmiYIvHKiAU2LBjIHo/wiCMTDRXgKN8kN+CXHBY7iBg2cB34V7Y79SwnAAQdEBpGCkzebzzj4GAClSfpZmxsNQA/4FAkZFrDqlrEExrLeGp+VOnb8oj1KSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ch2BRpbt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so34865335e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 01:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728288474; x=1728893274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xfsrb0WSQJp+an8Y26EySE7dviT8p4XE7UGnFTKxvfw=;
        b=Ch2BRpbtwX+RVIP/1Tq53ja6ysHKlXxcjXzjqmGlRrgB4Y2R2AH/kJIu4ESnmVmWBA
         6l2op+/gPx8b/y/V7sbSJXlrDIjzLHIpBz/LPPq1JXSehPJB2gnJXWgAuocVxNDVs9xv
         kgudocRF80OLWR1pAMIsbuX9y4KmeyEBk1G+/QBKCP2J37r4FHuZGyqr+G+PiaYqv88d
         g3cAL5zFiwsy2gfQ66R0EqdN7gH1cKTm/wrdxCxyajmxzWZc8POlU6S94tLaE/quhTOf
         XkFjdAMDUDOze9fKrG2TIudsb70+1PudL2qjMoGgcKw6REjSN1tOdd3XfMC4vnRD/nx+
         OxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728288474; x=1728893274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xfsrb0WSQJp+an8Y26EySE7dviT8p4XE7UGnFTKxvfw=;
        b=iZkTd4TorHwaJ2pDPUaPLuQ9Mhvug8hW3hMd52f5ILAHSsWqm4Qb687VEWtqocVREA
         ERc3Xz17lRQX/q42C3jAAkpc84SKZpgehNVF86wsuN2WoWlBAbsr8h/ixTkTUlzYmzco
         dj+c9ty+W1iA6tnLDyOeBeJrkYeO3R8Cd45Y3O1qbdF9phwmbaSsSOHKmw0BUVepJ221
         buDf+UKT/9BMm2+V+l22pnjKDAEXLPVGOa5Q1q8c6IqKppIDuqKj3Vj3Nm/yJvJl1FPg
         44LD1CdDQVjeVGrdp1QWWKpt454T1qxHnysXDwUDuNDl5At73MMQzbcbXRxlN5NhJx4k
         OaNg==
X-Forwarded-Encrypted: i=1; AJvYcCW80AAQtNwhErnA4bR7HvgfljXmme3Nve0ydiR5mhNKFt9wwA2VsFoi7t43Xt+bvptHS5p81LUtxWCG@vger.kernel.org
X-Gm-Message-State: AOJu0YxUXpR167QdPgMvzhOV4VNCzCkfg9fWUtuYL77pykkWGd1rnzP2
	xhJ/DzvsjxwegbFfFin3tQnYo6R8U8+7nTJLlCSEf6aVDEOX4vZgNACxiGH5rkU=
X-Google-Smtp-Source: AGHT+IGa0sNsdSUhg70Yu54RmBmS0RfHMkbNAgccDJG+6z9PXgY0RZIckOCClPeuA4kzv2MxFBtrrg==
X-Received: by 2002:a5d:6d4f:0:b0:371:8dbf:8c1b with SMTP id ffacd0b85a97d-37d0e79149fmr4920819f8f.34.1728288473599;
        Mon, 07 Oct 2024 01:07:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16972dfcsm5109684f8f.102.2024.10.07.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 01:07:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] build: drop obsolete autoconf macro
Date: Mon,  7 Oct 2024 10:07:50 +0200
Message-ID: <172828846716.6781.9600156523527771670.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003135806.41934-1-brgl@bgdev.pl>
References: <20241003135806.41934-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 03 Oct 2024 15:58:06 +0200, Bartosz Golaszewski wrote:
> AC_HEADER_STDC is deprecated and should be replaced with
> AC_CHECK_INCLUDES_DEFAULT. We haven't done this until now because the
> latter is only available since autoconf v2.71. We kept supporting v2.69
> for the sake of Debian stable but it has since upgraded to autoconf v2.71
> so we update configure.ac as well and fix an autoconf warning.
> 
> 
> [...]

Applied, thanks!

[1/1] build: drop obsolete autoconf macro
      commit: ed7ffe83627b804af1a644c5df9c66ebcec2d28c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

