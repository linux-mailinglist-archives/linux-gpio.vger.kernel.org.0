Return-Path: <linux-gpio+bounces-18468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A8BA7F83E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 10:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06BA319E0143
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 08:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5778263F37;
	Tue,  8 Apr 2025 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zLjGAeR0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C1A2185B8
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101807; cv=none; b=dssHe5n1Ge8BiORNWkdSQ/vLmGUX/Iuh6qxU9dWP0MC0ekftYFAyoWUyPoh/e3sEL24PKmp7E0PnT2KYD6SxW5jQzKjrjwGg2xchos0NQBecpUCXalGS5n4BsbkVHAz/GdaUPlR6nM64ZNXc1LSnxSozBCgwn/HLtMUaOLvHM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101807; c=relaxed/simple;
	bh=GXK3ZGW9tf6Q9chAz2456V+BotYGmE/J2SwhelVDqRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tCgdtEPfIOpuYgPjUneIig1LbWATlgXmuQvmO4ZVXxm+9rqXsQIw4klHGiHlVZXBWdTJlx5Ejqqxa6viQQt9vRDN69udXrPx6ujrbZCurLDuNM4h4gYdftEbOoGzKTuuE+IzVJkSoeDQVnVWOgkC8Wu/009U6jDdEFc9U6wYsIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zLjGAeR0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3203463f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744101804; x=1744706604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OePFKTyhdQdf/eaJWtXJyGR/G6HZO3R3hL0HNN3AkLo=;
        b=zLjGAeR0zAq5ImoYHeZVbsy2fU6FueyrusA0simpCwgi7YYHc+LsdkjrvovnMz3j7W
         QW1YRqYFmbM4gLqHAFSTBjlNv34Ei4SF36EOV+sJpnKuPoE0ChU3/S6Yy22KM+wxGK9l
         cbZYvIcEVRDR/+tJdtGNnB7J/GQ2vieqD25U6/8VqG5/lrveTxj6t1oqxB056XinUjYZ
         zHerYN5YroukP9ovMsp71PDixVz9vUksioactbdUubhUNmweNMgQFBeKKnEIcJvi9IZ5
         meissqGqMvCAaPp6v12rqMIuQk2zcZHL5coATQsU9HkotA/nTfMhaqY6u+hLDHjUnS0Y
         j5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101804; x=1744706604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OePFKTyhdQdf/eaJWtXJyGR/G6HZO3R3hL0HNN3AkLo=;
        b=QOqdvoqaSDTTjy1l88fQpon6gsm7h6Bnu0+Ji3gJSHEWjLLy3igQa9vh82cpKen4Tx
         H81hvP3MtdgBvXvCy4Dip0s//NXIMACjbsTlcOlgV8aOuk5hDWErdAL37v/aG9jXOz4n
         6dATI3W47R2nAJk30YGiM0BOqIWoriqZz5x8px1WWW29vNFvkJBVbJuLpZ9pCMxTXA4T
         YBGExT4yOPBYsvrVt50sIE2YDK6eBxpH9xdgyKNWf9K1nzjUOgHnGTu9gL7BNICP8fPi
         l0gOuUum4YuCMwaipDPj9ZdE4qIc7KOtWebLSaPg5VV3vmcl4fH4sDsKGiZ8y0ws4t0B
         Q1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWVgGPC58wDmbR++/K4F2tJgY4FZy/e7vKCZ7uyFjta5ErqUAZNCVDGZxit6b1GdkfX2aV4wCmMb+4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc2vpdtfSial3pE9Tq244+N40vPfopxoHsxxbTX5+u58IPHdAT
	RMy8ksRNlVD1ZoM/T19aLRL6YWgI6PIUteNSCLd8CdokJbayFOVJ/0mFUs4zHC8=
X-Gm-Gg: ASbGncuIAg1OE4IKQr82OTTvFisExpddOX/fRrESrl3cWGIFAZzfqmHlbUSS6h/hi/v
	FTH00IyFKkiDA0LFlm3l49n+CjPhqXLmRjd7o13ajiLOm5TTh02qu0OrlsTypZ5ehAqfEhyJg53
	GVR+VgUUYNgWsqPHscnyrWCQtCGumcx4xoBLwRYNRAsGdI61jEFNvWrqZNJPwB0pAIn6vDXs/wY
	uOZW7xwmPWt2bV1YdhdqTnTMCuPY3fIm8r4xfj2tL5jg1ron5B+G9NH+Xp+azxKxiAaC3MZp7cr
	Favl86oSGJO8r6pIXA6uTozRGNz/y9euiOkTf8fHdGs5
X-Google-Smtp-Source: AGHT+IEGC1m/9gJgDIPNZJo3xHP2dSgiPLSh/AneDnG9bwnv4PbEsI/+WnvpUUlb/P2XY7yG+BFXkQ==
X-Received: by 2002:a05:6000:1aca:b0:390:fdba:ac7 with SMTP id ffacd0b85a97d-39cba97f346mr13060051f8f.51.1744101804000;
        Tue, 08 Apr 2025 01:43:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ecasm14689544f8f.18.2025.04.08.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:43:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO workarounds for regulators
Date: Tue,  8 Apr 2025 10:43:22 +0200
Message-ID: <174410179723.40269.7114336096842145653.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 01 Apr 2025 14:46:41 +0200, Bartosz Golaszewski wrote:
> The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag and devm_gpiod_unhinge() helpers
> were introduced as hacky workarounds for resource ownership issues in the
> regulator subsystem. Unfortunately, people started using the former in
> other places too and now it's in all kinds of drivers.
> 
> Let's deprecate both symbols officially, add them to the MAINTAINERS
> keywords so that it pops up on our radars when used again, add a task to
> track it and I plan to use the power sequencing subsystem to handle the
> cases where non-exclusive access to GPIOs is required.
> 
> [...]

Applied, thanks!

[1/4] gpio: deprecate the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
      https://git.kernel.org/brgl/linux/c/6deb8435f6bfcc9b6c7efe3b8a941ae2fb731495
[2/4] gpio: deprecate devm_gpiod_unhinge()
      https://git.kernel.org/brgl/linux/c/686e54ea31f3b7d9d20ac1fa2d0295d649c41f56
[3/4] MAINTAINERS: add more keywords for the GPIO subsystem entry
      https://git.kernel.org/brgl/linux/c/3af64f175b2405270bd0926153d9856a49b58352
[4/4] gpio: TODO: track the removal of regulator-related workarounds
      https://git.kernel.org/brgl/linux/c/2de1cf175c00927c286f8bd72e18602fe072af95

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

