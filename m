Return-Path: <linux-gpio+bounces-9749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFDD96B24D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 360A41F22008
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 07:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDAD14600D;
	Wed,  4 Sep 2024 07:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oJQYeB/Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A412CD89
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 07:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725433399; cv=none; b=oSVnaK6kqEfe5MEBPNWPtoA3hgK0GH4UMaumIOAk0nLU0+KnRuWhDTcIkgGpOSKVZKOHzhzAO9ZpYebtySv3kt54BXtClsKejlQ7aseguwPn68ux/+Q7fCjI/bfs9FgmRVFfks+tV6QIp2hutAsFsybnNN3JqGQsmE5x9UUr4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725433399; c=relaxed/simple;
	bh=vYekh47a7+HGN8/imrmZjP46snfrGps/4ZzgzRPtpV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Du3Etui0E3Islo58hq+UWVCnKJ/OBRpQ+CmqCrJIkENTX+l3xEYJwhIjVBuVpPSfjiHMOFXDjgQprfsb7pwR7Xu9GIaXE1s9b2nfbjsJPovoXlhB2mHgCrvyl1rQi8VKovdT3DUrt7OKiTQychKrtzDn76BPPNs66r/9HCaNMAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oJQYeB/Q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bfb50e4e6so34519465e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 00:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725433394; x=1726038194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9n0f996CYWxF2hU1UAD7Xtq+hNoe2T44xauGeIVn3w=;
        b=oJQYeB/Qj9OkzLwpQVWNduQ1XDOFtsM2CeSnUVC06S8G74Tzls8mkaj1dsbwf5lqkE
         34ADTbBgpdqyHcgdVZ1ow8QmrNFPnl84Gzryb/y5L28ttybwQVzCC7PcXmP4vUbrdzdN
         hEHaPtm4zYWPtHCH6fDCFiNv5eXnwfr9SUl0zEJuGyYShhPNkooQ2Zua41ptl3bVvkgf
         F0QxGT/8k94BxYND1EtmK0pkXcOaLbj3C9AQMt56pTb95Oi0JbTrRoVjkMx0+jfwJuJ3
         mT69z6FFcO8I/USAhQDAwJMLNO/I3SRpQA9ki7X9qS52LqlDZZFGoAQsyALBI4zyRS6t
         g6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725433394; x=1726038194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9n0f996CYWxF2hU1UAD7Xtq+hNoe2T44xauGeIVn3w=;
        b=BSdUEmhPl9Yxsc3b9Sr2U7OKkV+zyQNIIyNP+7e+7nRyhy15ONvcBMMqVSQ7bzTb+D
         xdkvB/h9SPfOC15PtW4kAj2dEH9KHUDNkknBl1/Kz2THFWGbnrgZlkvQtDcu7iuWzS/a
         c/B/DLySOdTr2L1zA6wgRlrW8TujN5i+eM535y7vqhPzlJrxZ6EtA+DZcoDBuXSmOTcr
         6piJLvkpoOOUys5fHQCYTx2EqCDb10z9Wny2i4jPTLwQbQYJom347KCZCqSTP5hQGqIJ
         2HGrXZaCUrvB9e5bJnlHJ01mff8+91e/ktQj689Y57kH93vy8oV2KlBr4WMh7uLZsciF
         ewNg==
X-Gm-Message-State: AOJu0YwDyLwOp+jetvCPYyvRwhgJWZ8gXB1McgYR9DXfirsXOOiByNcm
	hSIceLB6IbogfYHyzm4CpYc8iWIITTvLmXVbLyYJghI2SToIyYORuWx+FJUroZ9dMtdIcJ4rhZD
	B
X-Google-Smtp-Source: AGHT+IHEu3uWPSRLlF3gGCsHC8MFrCgGl3LyH/Q6qKnAcb1ZnsAZFgob7gsZSpbBpwgTcj5fqXE4aw==
X-Received: by 2002:a05:600c:1c12:b0:42b:afa7:801f with SMTP id 5b1f17b1804b1-42bb27a9c91mr124675185e9.30.1725433393262;
        Wed, 04 Sep 2024 00:03:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:66d0:70f:5bef:d67d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df954asm192565635e9.26.2024.09.04.00.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 00:03:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v1 0/5] gpio: stmpe: A few cleanups
Date: Wed,  4 Sep 2024 09:03:10 +0200
Message-ID: <172543338864.7843.11531696797398483800.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 02 Sep 2024 16:30:39 +0300, Andy Shevchenko wrote:
> A few ad-hoc cleanups inducted by the recent patch that made
> an (insignificant) typo in one message.
> 
> Andy Shevchenko (5):
>   gpio: stmpe: Fix IRQ related error messages
>   gpio: stmpe: Remove unused 'dev' member of struct stmpe_gpio
>   gpio: stmpe: Utilise temporary variable for struct device
>   gpio: stmpe: Make use of device properties
>   gpio: stmpe: Sort headers
> 
> [...]

Applied, thanks!

[1/5] gpio: stmpe: Fix IRQ related error messages
      commit: a794331325f143bd010a91aa078547fee7fe907e
[2/5] gpio: stmpe: Remove unused 'dev' member of struct stmpe_gpio
      commit: c028e1c5a414f03cd849912073db7c1927ec8d89
[3/5] gpio: stmpe: Utilise temporary variable for struct device
      commit: 56f534dde6ff41eaf71f4e368953cb8da54cecc3
[4/5] gpio: stmpe: Make use of device properties
      commit: e6815a05c0c909c8d6396bf41d0c06bc967f37bc
[5/5] gpio: stmpe: Sort headers
      commit: 9f0127b9cea593a661004df948dc0b4479081c2e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

