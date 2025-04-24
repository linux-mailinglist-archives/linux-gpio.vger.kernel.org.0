Return-Path: <linux-gpio+bounces-19284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D132A9B3FA
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 18:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D08B1BC0583
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 16:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D360289341;
	Thu, 24 Apr 2025 16:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOBHLsyp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1F62820A3;
	Thu, 24 Apr 2025 16:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512029; cv=none; b=d/IqG8jRolJPqcZMcKR/vAKRbo1l75lIZ+95JTLmKAkxb4ArRCQ+qGxcvfreIna4wSAX6sCNFyjeP82d3OGZ3YARZrrJSPRKMyOUVytqLbFM4EsHv/kdSnH5Qo3Wb5GPr8cSlC5gDS6TrXMLoLzoovldpA81sXIL/mbBeUS6Ifo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512029; c=relaxed/simple;
	bh=d1i2vxS7CCH8AHpspZpCA8aleNzCCGucvlzIXJ8m8lk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q9Ue9cyF9S+VvKks/ggqmiVKd7M2vqjQ0wS8xIW7mUO977qydgmNzkZuNWpXRVIpGQ/+g2ipa7HGJ5Jl4ehW5TnmWt/sMGDgTHe1MWZcaF6mvusY139390Lp75vaH7xadoCDOkW7xGsxVymxl0dtknmhSJXKdwVIAxaw3OAoijM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOBHLsyp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE3DC4CEE3;
	Thu, 24 Apr 2025 16:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745512028;
	bh=d1i2vxS7CCH8AHpspZpCA8aleNzCCGucvlzIXJ8m8lk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dOBHLsypE4rC02aLc6grE+cStS/j6LGRdO3yyBW3rrrJQmvep/Ecz0x3sOk0+IRtY
	 X/tDfNK0Pgomdax/LIoqBA/91p2VUfnWDTXWwAkoO2RRIqWYDI0evMO1aN/uHctP6h
	 hyqoUq8iYYxADE+GIWsVVy9YyHD26f/wEYuIh/beYerx2s942Et3ITVMIZ1qWzYsq4
	 Ed25TZMdrTW/5N3/RnO6FeTyFqGnlObSl2KVqN3ygw1kt9RpK4sIpEg2XB1Hv1bZri
	 rLdKxP03iK3Ba8UCH/kVl612EdrW3tBWLpczD8KZFUZdb/asGq8xbrd9ENqk3wR3qc
	 4vnbogUlAUeIA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Riku Voipio <riku.voipio@iki.fi>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
Subject: Re: [PATCH 0/4] leds: use new GPIO setter callbacks
Message-Id: <174551202650.1497727.15230416483981358083.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 17:27:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Wed, 23 Apr 2025 09:53:49 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO drivers under drivers/leds/.
> 
> 
> [...]

Applied, thanks!

[1/4] leds: lgm-sso: use new line value setter callbacks
      commit: d48b4a8402c07453f82a95af60702d06c14bca18
[2/4] leds: pca955x: use new line value setter callbacks
      commit: f5800749963eefb11001fe961434a1b0fdf12382
[3/4] leds: pca9532: use new line value setter callbacks
      commit: e3f286285f19d985323f4e3454894d6f8ba83dbc
[4/4] leds: tca6507: use new line value setter callbacks
      commit: df80e14ebe1035004c515b952cb700a391f220f5

--
Lee Jones [李琼斯]


