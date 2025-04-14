Return-Path: <linux-gpio+bounces-18795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B594EA88D02
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 22:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE19917AAE7
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 20:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70EF1DF72C;
	Mon, 14 Apr 2025 20:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="itFfqqCK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090C1DED70
	for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 20:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662383; cv=none; b=hzh21fIo4aZGcDdcp4rVdTYNiG+t0DU1/FriISrLQCCJ1l7Cno4TFJn614tISO05r9brm5r5K8vyvtxIWfyO2UrBzq+jFDuPjHj9wQWs6CQHhg9OlvX5/mdkObifE98mkiClITW9FvZAz7vUsnZ8woHbm3DrZmryEPerMpxjOUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662383; c=relaxed/simple;
	bh=iBs+aKRDJ7M7roaZ4THHof2CSfvuprVGdvuAkyf+vYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nh+fVy8+fSEWdcivX0mPoknXOIap8QGkMlvs0iJJihPulgKYS66RniYrx+bJhN+BApfscaeYvbWgxWx4GW4QFyvAGyxOvx9lQAujkRBfvOWqV6Z2kEivlJ0gR/esy12dpg8ITDTSm+pFcr0w4UipSo8WWezWmE+ajJg69+ccQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=itFfqqCK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso46037315e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 13:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744662379; x=1745267179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvNmFSACobqMSZp4wEbaxtSHKBqkIkOhCMM6s/FWtxE=;
        b=itFfqqCKjUeIdXzuV4EX4ImNR6zexn672sWf/mWOmAwpRLSnhSRG4V1pKeUaTz3lyl
         +GTui2NtecI5zLysVl/PedwX6qHde+A4LwsY282MOdSiSQKgSftS4QVxQDrlJf1axbpq
         3O6rIPOn5Je8ESjioMXDFN/5ZjpnTWQ8xs6K2bW4yqt3KKo/oYfkbknAvlro4ltphCf1
         sLDpULfC1lQMhL4+m6BPVgtmQ5s/2sAwE53XL3VfARrAD39+hY4eTbECEr0v+lC+OE2f
         8GZOqjPpjU1E6JoA+gnLT1MUbs5vD9l0EcdCCS0TtpSKyuDcNzYOsR7S0y20fP5WJgv3
         1uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662379; x=1745267179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvNmFSACobqMSZp4wEbaxtSHKBqkIkOhCMM6s/FWtxE=;
        b=GUEHsbK/PY8wK/4aoOD9mCTb9iX9EIsfDMFxMgM4xb+04L3DGUIeD4MWXeDuIqfg76
         iIZ7/wLf83kEpwU4boonewFJQW6rjyN6Q8+3KSFXnxC7QfbirT5JqzXA08h5+HezI+xd
         qwUv9JLctez+6kIR9dsVvIXo7qfbpUOwIHmf2pM3OYI0ISgFsDXAyK0RanzxgvWuf6iO
         WPXRjHwNPjtLE54WAZ00Vpk1iThG08tizqWzhsTbNYv6T3LUZuZ7P8lwbd8PS0auYd7d
         cqqenKuzS35AxpwCl0D+2mlfK/25dFqylanu0VWmmVQU+UjdSZHYgMCcODveN/6uGlEq
         Tlrg==
X-Forwarded-Encrypted: i=1; AJvYcCU63Cy960NaYBrQsbGrXFa2Hg71hc79VCNZf8OFfniT8QO8AmhRK7yz2qBhkH1R2lABwE0FG+lnth5i@vger.kernel.org
X-Gm-Message-State: AOJu0YylOeU9gj0aotCus0HSVoNqul2HXryUIySixgnmdHnQl5+lIyIO
	LtiYpEcXr3pDiUOYultv33/TmALrYJivkpj2/yEY8kWFkHVvQjDgmWkhjH72hs8=
X-Gm-Gg: ASbGnct95NiHgnZHVGP14cTv8dmVSPcgaDHY4DnATKY3EdWgWUuUD53u7tv15ihrMAp
	1X4faYo3K+oHo0VX2QmzAJgDTTNpg58jyOeANVwjPl2S/rRQblkX/4UbmLRvonsvUt4RsrHQ/L/
	sGP0nPT2ugGi62LEurKAu9bzYENNc9Lkg6nQiA5fmxbFnt6w5fveb1W+49Kx+HsLwff/FEUbwjW
	2X917cWwJciNPJuP+7G8CfVT2ZsdELaS5tYh1fngMKS703PJmpAxu9Vo7yObWuU1EXFcZZCWsA2
	e1zdWFOpXCJvszIfDyll2gr+8toFpGoANa3H
X-Google-Smtp-Source: AGHT+IFuDUIgj/D/cN3IBnUD9RJzcG1WoLZxxnJQx2bCsy9FAjjPxuG+fuJ3T3TcBdKtR3haLjrBYA==
X-Received: by 2002:a5d:6daa:0:b0:39c:dfa:d347 with SMTP id ffacd0b85a97d-39ea51f4467mr12141770f8f.2.1744662378981;
        Mon, 14 Apr 2025 13:26:18 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:5368:1715:4c6b:8be6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964073sm11872229f8f.9.2025.04.14.13.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:26:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Koichiro Den <koichiro.den@canonical.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] gpio: aggregator: Fix Smatch warnings
Date: Mon, 14 Apr 2025 22:26:16 +0200
Message-ID: <174466237012.5065.7312812236129842983.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 12 Apr 2025 13:14:53 +0300, Dan Carpenter wrote:
> Fix some static checker warnings from Smatch:
> https://github.com/error27/smatch
> 
> Dan Carpenter (5):
>   gpio: aggregator: fix "_sysfs" prefix check in
>     gpio_aggregator_make_group()
>   gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
>   gpio: aggregator: Return an error if there are no GPIOs in
>     gpio_aggregator_parse()
>   gpio: aggregator: Fix error code in gpio_aggregator_activate()
>   gpio: aggregator: Fix leak in gpio_aggregator_parse()
> 
> [...]

Applied, thanks!

[1/5] gpio: aggregator: fix "_sysfs" prefix check in gpio_aggregator_make_group()
      https://git.kernel.org/brgl/linux/c/eebfcb98cdc0228f5e1b7407f9db1c602bd8e545
[2/5] gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
      https://git.kernel.org/brgl/linux/c/2e8636ca340002f3ac31383622911a1aa75fb086
[3/5] gpio: aggregator: Return an error if there are no GPIOs in gpio_aggregator_parse()
      https://git.kernel.org/brgl/linux/c/db1baf69e563fc222a75c0add5c76f437c717ac0
[4/5] gpio: aggregator: Fix error code in gpio_aggregator_activate()
      https://git.kernel.org/brgl/linux/c/05b43de95add3d787a7a88378086bf01c10b3f40
[5/5] gpio: aggregator: Fix leak in gpio_aggregator_parse()
      https://git.kernel.org/brgl/linux/c/d945ff52642d98eb6fa191f88a9cfde729129395

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

