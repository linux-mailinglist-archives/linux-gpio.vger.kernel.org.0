Return-Path: <linux-gpio+bounces-23018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9906CAFEC8F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA7895A15CD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38172E5B05;
	Wed,  9 Jul 2025 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oODtWeLm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F82777E0
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072585; cv=none; b=J4FcyNW2fxAjMCjN1TGkKfxigBxsZYCnPVvuDA7lCNQvB5bAhwZu9qlnW72/GZwgMukct8OLeC/f904H15WC0UaYm562Qk5qpcrDRNNaJV8L1DU3ltfcKQcrRFTf1Xi6SrreKfax7lArgtI8HfMoEhjNY6dwQBa5hNw0MVRjLj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072585; c=relaxed/simple;
	bh=i/3T3rgCm3LbTB5t6VdO73xMaOdq9fqlxsmlO44cOGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=goEGdJonvn1YjamUf5aexiDO3QEmtyjxPqocecK+xIHGen4TEBVhPgx5mblVS8X76ZyLZMH9/Ruj87DUoBL5LNh34z0sRZqeY7Jz0QIfoHefdlnaUcUxPWcVvgz00q7ybgy9dGTzT1Hs8yJK/70IQmGS8yKCIbU3zgujq972iOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oODtWeLm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so41298335e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752072581; x=1752677381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+clCZcAmNaEhJNDxw2K6HurtRqBRlDqkioZalS/QiBw=;
        b=oODtWeLmpFA8KAWPi4S1KvNXKqBJpQdCe/FfHceNATbJoJRGtUTMrLJch28HSAvepd
         OWFnBrn2Uwri5FNNpQ8lGnvBHQ+F3ZtH+ytnp+eCB4rvTEzkR9521a8LrnjR/QoZhTRY
         SbeI6qsjBBGoYRVznqLdyZCCmN0T7/aDMtp2nxBqTe8Ga2cskdkn3lJFozeg4CGRaQjt
         IRUwY76ZbdhqmlESPZFScwt8FXbLIeLIZBLp34EYZ88udWJaR1e+pG/AL3vEqr7Hysoy
         C1RAt3BanlSROB+83he7Jk1urRMWY4O+w/c7gJFpMX8HJt/0fOzVxsZ4VMd6Zo+RntBO
         /oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072581; x=1752677381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+clCZcAmNaEhJNDxw2K6HurtRqBRlDqkioZalS/QiBw=;
        b=c4qAD+5qTuqiaDbkHQTDIrR4nX+zfIGX0LWq440OlH/oe72dqYpydM0S7RlWNFP8I1
         vJLEBQMF7qPFYVF5GVRvoSplEZ0y1hN4QTqVnC6rKTEY+SLJogdnOO5UUi4mL6PKXyfr
         8wBM3WExh0QPNQmdTfkyvDFbOzCjollUj5kIXT9EeQFl/mGhxCQ0kMmRBNd2ydU6To83
         98UXT0pwmVV/WZD9AQmZDoen5FcA++61SqvTD6kFuwZ4xsiV68JKGDPvDdk/pqYmlqGa
         AR/HPomnIZ2KDm+s7Tj7rTn5f/F7KCorkPgommejXy9UFsckgXJiANHl+sams1x7BMFi
         qxdA==
X-Forwarded-Encrypted: i=1; AJvYcCWx7I6DJgdn49HsrTKSiQSOIJfajDtXzMozgX5QmjHdZFKvQ/QUCgfISZ0IGCLBRQX14yn6Ooo2V2Mh@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOSHuNxq//ltrhOcbhA5pNGLB01mWtdZm98uy0gwOdxGwujzE
	TIcT9HmZd3IxuJcf8Oo5DSn6TCYXTjRqwlAdwX0AK1q+9wVp/yrr+M9kq3pLLDXO2jA=
X-Gm-Gg: ASbGncuxXsBbhxgEgtDbSJQUWwduobQXAqelTdFAsQg8Hcw1FrqOwzpbkDY6/6kV8/x
	kuGp2nAonDYYZE2W4PMcBR+OqfjjDS9NPHW0VhaSoBLxrfhz5922rh5fdos3z3HqONyutROXDOa
	CkffIv1QCgr7ekHR0+NtOxPNwxiPpVMT5hJ3+kD1N7EptGJd9ECdyU1AdiibNbBmoCJpVUnnU9x
	b89BsRDyuyhdUi+sIya14HV9Xqt3qn52rQb0RLavj4rJOD641HN9pAvF3aW3/KPtKod5J1+8+6p
	wvuk91MVMotmWalB8eQCkDOpZwArYlO2OH+RB2lEq+ebDkOh2tI1PPtNQ9voty1D1+JbSy3b1A=
	=
X-Google-Smtp-Source: AGHT+IEvnogMibb4vYHlJHRH2PNaGzoX5smkfBnnJv6Rl4n+ke+bVilxmX5/5ST1QwlJ7GZnt/JGzA==
X-Received: by 2002:a05:6000:24c6:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3b5e44e9e13mr2351579f8f.18.1752072580842;
        Wed, 09 Jul 2025 07:49:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5062119sm26543685e9.18.2025.07.09.07.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:49:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sim: allow to mark simulated lines as invalid
Date: Wed,  9 Jul 2025 16:49:39 +0200
Message-ID: <175207257347.43561.5299868235496742290.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250630130358.40352-1-brgl@bgdev.pl>
References: <20250630130358.40352-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 30 Jun 2025 15:03:57 +0200, Bartosz Golaszewski wrote:
> Add a new line-level, boolean property to the gpio-sim configfs
> interface called 'valid'. It's set by default and the user can unset it
> to make the line be included in the standard `gpio-reserved-ranges`
> property when the chip is registered with GPIO core. This allows users
> to specify which lines should not be available for requesting as GPIOs.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: sim: allow to mark simulated lines as invalid
      https://git.kernel.org/brgl/linux/c/0cf6d425d39cfc1b676fbf9dea36ecd68eeb27ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

