Return-Path: <linux-gpio+bounces-9752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63796B2BC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55996284892
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 07:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D66146019;
	Wed,  4 Sep 2024 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UB2ImNvo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2913DDA7
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725434592; cv=none; b=XJuzRfyfAMM4dy0aEtvRDHZoYxs8nS14iHTAU75b89neYx1x1eBiPF12BMvnzm7HtrBGONARNhkHqXuxi8YECQh8wnXlkl57dV4e5WhcawMj4pHUjMi/eg/HZrES3QMH+UcdjfHgncpUhVbe2GQGv6TMeCSayP4sg0ybaglKxLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725434592; c=relaxed/simple;
	bh=Wol+l7h7xHHknZATBRhJN5a344a5LUF4W0T8EdFbl+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sIMFxslMcJxVkJ2vr9Nhopayo7jLnH+Ci59n1Q0vuHGqj1krko+vW87P0rZKZSpvE8pplg7tcgRSkY5U9QuXNjNi/smsCMCJj2XeIL+ZRoI8ET2hjGNb9IKNk3VP2R+/puusMraDP721aOQkcWzSuZhrcCFT1CUM8gb6TgpbX7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UB2ImNvo; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374c4d4f219so2205991f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725434590; x=1726039390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+R5pD2HPGI2xG/eKo5tvfoHxIjYpk9F/MemAPX60CDY=;
        b=UB2ImNvo1+l1/oqZ+eQ//pWzwmvpQd5nWvPSIk0yimT/7omuuoMHTh84oeDmk76J7H
         zKv7uAYEtd9q5UviUy8x9giQTny+q/CDK8/WGLkf/2L0ZUVTdgRVBcWgtozeiyJMAfCU
         ignOyu0swWNkyiEJEZ7MRxgWYEphTqTaZi1k7GYuFunTxLqx/m1PMRJ7XfFqmRKoeZNX
         tPzTsEYdr4B2mW10M0e9JkfDJk1aiylxFthKJlkvgDkT7bXicH/14++rDp8lNHg/TwnY
         XqkTQ6RlhL6YXmpVGeDjEh3ctaJgLxv8NPHeAi/LCwQBN53FJG2sAD7pFutl5W5lEQUQ
         5UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725434590; x=1726039390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+R5pD2HPGI2xG/eKo5tvfoHxIjYpk9F/MemAPX60CDY=;
        b=SVEWP2iESwljzLLpIs/mAyEmObZBHlmRasS5qV5cCbzd78LUDUceI4z9WBG/VwDEz1
         91flQQDC/5uM2vL28ac44B/c00GJP+Ukz0UTD6zws6SzuRATv9okeGTrdbPdNMtLnacj
         WZdUT4/+VOnvO2jAi7bW0Qe6awtZzHoRBpmlKnXuniEycOZIlq43nf1++gvngxATgfRF
         QI0aegjsckFM+Jp93ezWdnxwxusR4ExF7qvVhP48ZrjlZ6wXlNdXfDIdIXxhq6azhql2
         LqTB9u08wcMgLmXySNGXMYzjFGNSn8G3EiiOgDzLhEbVYq9gi2JY+G7oEzriONbeWl6y
         94Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWpAI4apg7uV3CYH/mAnevqeplQQ3nAUaM428MpjVFsbc6UBMFxXFjlzckGV3CbDtiuWyVCv8qjcNzG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Aw2du8FxqN0ZdM2m6bMG2+VvDwZk5Tj/k9OT9I5qW0psJWl1
	mtlkbmMZOFgIM8V5iuH45P3tkMaZwifWb+TgJzz+2L0MtA58kmqDYsnDaEGQC4U=
X-Google-Smtp-Source: AGHT+IGugCBt/3ekQqKjAqXBGhd7+3aDpkIG0CBcrhe+Xjkh7b0j3/hfIT6gufpYxDFVJ2ez4X2H7Q==
X-Received: by 2002:a05:6000:1147:b0:374:c283:f7b7 with SMTP id ffacd0b85a97d-374ecc8f661mr4667861f8f.21.1725434588810;
        Wed, 04 Sep 2024 00:23:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:66d0:70f:5bef:d67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374ccab8a76sm6771906f8f.99.2024.09.04.00.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 00:23:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Martyn Welch <martyn.welch@collabora.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: mpc8xxx: order headers alphabetically
Date: Wed,  4 Sep 2024 09:23:07 +0200
Message-ID: <172543457723.9479.1909123590862180753.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903154533.101258-1-brgl@bgdev.pl>
References: <20240903154533.101258-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 03 Sep 2024 17:45:32 +0200, Bartosz Golaszewski wrote:
> Cleanup the includes by putting them in alphabetical order.
> 
> 

Applied, thanks!

[1/2] gpio: mpc8xxx: order headers alphabetically
      commit: ccaf84694ce7e7438706185c726310be51954fd3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

