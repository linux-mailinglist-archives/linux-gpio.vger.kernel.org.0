Return-Path: <linux-gpio+bounces-18797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB8CA88D27
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 22:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653071896CF3
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 20:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D341DE8AE;
	Mon, 14 Apr 2025 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SbFWs7t4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A32A44C77
	for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662705; cv=none; b=anjcpVOkAN+hKvsBLA1xcCzFhySDLEZDaBHM2MdFyqsj+VbJ1A0/BVzncDI32Ek0k+ggdLhH6OSdli+xw2Xp5DQ1FLiXBFCb2kLCsyuiVNJTPxGo0nLDKvdgKXXeWgz1I9bw6tLbYhs24k4kX4jmblJB0lcq7QmyNjT9Yua140A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662705; c=relaxed/simple;
	bh=2PSxxWavILOvietk2Mrh+EphTILxeogdqSaJNRrG06A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pujesXN7iwEniOx7zqa1BaWV4Z7LToFzpSrq7R9C5vWCu+EO9nX+QPRAh9lOnnqgSfIvz6MqMzDZKVSE+ZRSRHqkYd+kre9SPZzgNtKfjvzOXvgba1+WbbtvVKQcnokIz5cSg4rPKZIQArD6+gPRF1fiHT7xKtj1s+xQn0UC8vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SbFWs7t4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3313833f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 13:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744662701; x=1745267501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8k1lPJdEDsaBNNdAeLAeb28VT6mxpEKn5noA0tSe1oM=;
        b=SbFWs7t4fDAM+eTfuZTJrCs9LgbfkGAXaaqRj3nx9JRk4OEbmD1UHfyaWHC/OobmqB
         5F5yqsa7YLeDdz4oI/0zjT2iEmxdTkUvGP48zIRKeBB/ZQMJ3px5kPdt5znDLYKSKSIZ
         8fMDt6cxQ3hwafNDvUbTYqmn8Tsk3g4OmiB6oGJjv0Dnn+5vH8XFNGsC19J1Mu5ULQ2d
         6lwgnvWzO6P7Jd9qqPz1nQv415+CapSY9uioetP40zIi3/ErkP0LeHy2eM+F+VapOq0k
         TJ+XGabGYfXvi9Y4j9HmjaYGEIyGPsAdjlH9OdUz/2qp/gSvxd3fjYVwrTvmMwADwzXX
         l4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662701; x=1745267501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8k1lPJdEDsaBNNdAeLAeb28VT6mxpEKn5noA0tSe1oM=;
        b=CmoiijAEo1zxDHsnjpFDvXura2Yi3qgjZIXrc9XihoYBaJ/1S99Of0P3Q+ErHEirLS
         LPl62FfkUZjePG0HzjWjIxYfhLBQSKrPYNFjpJWEfw7LVVTNOKi9oOT2xGuYzzyzCAL1
         WX8AXex4+KxsSAjK5iWzypxEr90jB7feSEQucC76HDemMLJg6cJVSAthoB+YZ1ypwHZl
         fWb2b1YbaULCoeFCbvxN3bWpYQH1X/3RDXNIbfg3i7OCi5ndWvMdERk9FcHEShHRPjvN
         pFboZ+pvtdnJ5nhhtHDQKyt0VaizjgLSpupNrUTYj84L3IKKiAYwsICXaNjdoWXAjwFv
         fp/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJSc0KP6aVL7gdEPYs6WkmNpOUnkkmZj1Kt/xz5g7Hsh9aSuQZIUCUXAtOlrWajVoXvbM/tN5K8Wrh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3tzkNI4ILfkhIIkPwpak+dRdAyiiLGzy1X5nX7Qb7purgtIKI
	IIqLO7Ty3DlLZgyFQwQ4Gi54IfOBtBljgTpYJXpFb9dJWjAldAX7YUJ+QQ5aox4=
X-Gm-Gg: ASbGnctzUJuAHFxKPQYo2ZHw72BHlCR00IPjN6hgyd3k6pUTu0iHuH/lZCMsSEI+A6f
	d+txMx+lac7wFvZGDjrN1IXXYKrWKNBxLjquO5qiBTBJHRHb0DS3xn+5Iy67obDBIYivB3Gc5Gl
	uPfm7VJg58+7Ib8ZEcAptroqnBN8uOR3IDqtXV71mRqY+PEKu7o/PNcoWy5pm+4BkjUqEjSuM3Z
	X0luX39cV1bjxBXiVP3Zw7wPqcEwBOtVvyyzm9JzyeO3KrvXq6OgZ59OxpgJinVboyci0IQIOxj
	KLQznp1LzGHstweRZrskbOCdOMRtqjZCpZzj
X-Google-Smtp-Source: AGHT+IGjweXG0QAiH9p+N0mLmFNs5VroFjk6aq5NkYBlrF543xeFSObf7dyVUt/MzAbe+aiLyZzklQ==
X-Received: by 2002:a05:6000:2582:b0:39c:e0e:b7ea with SMTP id ffacd0b85a97d-39edc311dabmr510216f8f.20.1744662701607;
        Mon, 14 Apr 2025 13:31:41 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:5368:1715:4c6b:8be6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445737sm11722553f8f.88.2025.04.14.13.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:31:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: GPIO_BLZP1600 should depend on ARCH_BLAIZE
Date: Mon, 14 Apr 2025 22:31:39 +0200
Message-ID: <174466269705.5429.17461051259009988594.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <a75af4b623579a193b4a59350c063969aabb5b71.1744190524.git.geert+renesas@glider.be>
References: <a75af4b623579a193b4a59350c063969aabb5b71.1744190524.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Apr 2025 11:22:35 +0200, Geert Uytterhoeven wrote:
> The Blaize BLZP1600 GPIO controller is only present on BLaize BLZP1600
> SoCs.  Hence add a dependency on ARCH_BLAIZE, to prevent asking the user
> about this driver when configuring a kernel without Blaize platform
> support.
> 
> 

Applied, thanks!

[1/1] gpio: GPIO_BLZP1600 should depend on ARCH_BLAIZE
      https://git.kernel.org/brgl/linux/c/df9b3454a00ed9e4c85295611b28b7041fc2a1d9

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

