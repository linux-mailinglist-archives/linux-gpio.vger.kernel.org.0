Return-Path: <linux-gpio+bounces-19491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA8CAA45EF
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 10:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63AB41892E67
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 08:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C0A20F088;
	Wed, 30 Apr 2025 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G6QydPvt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F1B1FFC5D
	for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002972; cv=none; b=es8nkou4BgXuWSRBQIvm1/kdPQ64VIn1gr5XGZH7F4Ako6z86B8qkNdDrRLzD/sT/d1Ir8nZMuxskfDN5PBgXVTA6Hrh+iDEdaLs3xPq3ckYlSksNhukeV5jAXIR5udxuMfp+BMJizx4+Sy0YaTeBQF/nnuTNKEKjfP3DHW+urY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002972; c=relaxed/simple;
	bh=kF5rv2gLT69TGHV1wgoyogbAKtcphD1gq4dRBLh63OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgCahZYL3WKxWVrpGMGYqFaqyr96hcPkRTJ2dSJniYh6CdDbn6i0llx6SL7uGZY7eRAKdXWI8OfIdg2ffZVS4AQ4dYXbqjWsuTwmxstGoOwu+xiit4A1h+b4lpQXqBY6XxCZdObPjT3tn2Ir/KdjHm1Wj+CAHhHB343YtAlY/iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G6QydPvt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe574976so48220725e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 01:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746002969; x=1746607769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/l2i66MhWurF2CWz82sfv1WL1umwvK6yG20b8ahcQ8=;
        b=G6QydPvt76emXr4+333bHgZauLjphEztVTuMstxbDUkHB07lwlLsuCbR0rsC7U7h1t
         qNJ3ypWjr5CZZPfvu0+C9hB/aUZUpJFA1QqC+cItd5rD5XlGvZXCi+BwjJbrbTOGN6ze
         iuDxb5VPmjb70iK4oN5CiKigs8UXVett3BKT+LMG+BiRmEpHIxMwnzwO/npYBUGGceKC
         xwlb2btnWQo7mXbIL4nmvU9b2Es8ikKaQ51vg6neshALKjjjcQKW138GvET2sP2SEktC
         LYw8f4eS+HjNL0k3ke5ep++Hj8Z00uL+J9nhInJx+UPX36suFRj3b4KZ5spDi5cR2wlr
         +Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002969; x=1746607769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/l2i66MhWurF2CWz82sfv1WL1umwvK6yG20b8ahcQ8=;
        b=ZC2B0YVkrsMIK6qHkbsIiCKZHC94ueu+ow5SQUE0Tw3Hx/mPKbtM+mk9h2g4A9s91/
         9YAUGTihmw6zKZY3XiJZphNd6fKA9N5QlT19e3BHGm8bIBPqmxM7mbDg4FB9PKmouwZK
         9bUMfo9U+DmAFAkI5uaqp7gYYAK1xbr4+qizsBsQ1P4bT7UCL/b4mWfvYAKexinRfDpb
         fMPA/NTo/5uzYrlaPOGgS01j/oCu/++XzMG87PKVu/rTHRGgFOlimbrYAwzQ1ZJYTlRA
         KJ7MqjN5EZwHR1KkCv/WZmg6UpSu7kTi6neMTq/6JBn+GBH52220pNATsaEuCd6U0gtS
         9Viw==
X-Forwarded-Encrypted: i=1; AJvYcCUHE+UU1hjaXnHUGr6+LnIWRKX4KkunDbmJzA8Yr/F3k/arvD/CVmgWqvxLVC0zboTvvcJryaSGBVQA@vger.kernel.org
X-Gm-Message-State: AOJu0YwM6/76hQurw6afZImDH4Ac7LinVIBuEdXpjqHwZjCaYNQDO6y3
	FSGPtgF2kv9RG5f5y4wSyTGW6kh5TLRwJgAfXZgeDuoe7nn+l1HaL0Xaurn7Pko=
X-Gm-Gg: ASbGnctSGES8WED3YptcOu62DYtLmhaajN1DcYV3a+ghWigHoEhijv0KlSkwfrKjtT8
	sWD0wzO5MR3NuoM3Q+moU5xHIXmy4pxszik1x296o1w+hcusGFYNiL5Pw0fvhTx5Ct2pCgZM9qk
	VkIH/eVKQpoP5opmPSJmuG+sP/JARRuABxqZdGF/KtapWjLTgoxivAd0PE1BT6gy7OgmHsuLjZm
	Jf4xQs8wHFS8GxhlsWkdV0udvnBWpN48Yz+6k6uDCBgAS6nUicqARjzo6A3TruLYMD5byS9q3fJ
	jntlZ1OHHDovuKXluDvJJDTjnv+aXV973Y2cZsGFqA==
X-Google-Smtp-Source: AGHT+IHRMtQDfH3WocvKzHkEJ2EihSqUkWmvK45ijalsw8FAsmvpI2PJbRHGtsSBT83cb6wen49gIg==
X-Received: by 2002:a5d:6488:0:b0:3a0:8c3d:d7ed with SMTP id ffacd0b85a97d-3a08f7a27d4mr1908834f8f.30.1746002969118;
        Wed, 30 Apr 2025 01:49:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6298:7254:d3df:f23e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8cc74sm16624158f8f.11.2025.04.30.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:49:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Vincent Fazio <vfazio@xes-inc.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/2] bindings: python: make license information in pyproject.toml conform with PEP 639
Date: Wed, 30 Apr 2025 10:49:25 +0200
Message-ID: <174600296365.33081.3585923555701392515.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424-pyproject-toml-pep-639-v1-0-8150d3d807b1@linaro.org>
References: <20250424-pyproject-toml-pep-639-v1-0-8150d3d807b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 24 Apr 2025 15:06:26 +0200, Bartosz Golaszewski wrote:
> setuptools v77 print the following warning when building libgpiod python
> bindings:
> 
> ********************************************************************************
> Please use a simple string containing a SPDX expression for `project.license`. You can also use `project.license-files`. (Both options available on setuptools>=77.0.0).
> 
> By 2026-Feb-18, you need to update your project and remove deprecated calls
> or your builds will no longer be supported.
> 
> [...]

Applied, thanks!

[1/2] bindings: python: add missing newline to pyproject.toml
      commit: d0c8c18ae803b75428e96f2d2b0c5860c49dba8a
[2/2] bindings: python: make licensing information conform with PEP 639
      commit: d9b156ecc2ecdec78f7a9d563df795ea09e70da9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

