Return-Path: <linux-gpio+bounces-25441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D9BB416E5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 09:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 526B55619E2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 07:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE2F2DE6FB;
	Wed,  3 Sep 2025 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X5nmqeCa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB51F2DE1E3
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 07:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885140; cv=none; b=uEdGVQ5KdCGWgSZR6IhdKc9ndq85oaHrEVmoP5cxkit2IaxcJ0NIFO9U1f571/NtxNduJRNhT92nflZNkTjoc1FdYVe9qsSROMRTpVDUlbqfOStxwiBpX9e8ZvqaLBQvS9uGahsyTrUGqF3xQbKcyL8i5Kb1lb0OpwSU03hoJWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885140; c=relaxed/simple;
	bh=ZMq+/DLAY/G0cbCuJHDGH9PS4rmeWgA649rs001QIRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=chPUBadXBa6E/SUCfkGYgKU9MTKVLabSCFLigGMuQHYubRr3BUR2gVTBmXlYJ68bFmAabgB2STgFZEtAEOFvUnG0Osd7jygV5Q1xWNT/uWHXibjDd1S8vtEygdWq4PI7Kfyy3Ej/q1BEavLuLF3WnOSzO9bTvxxp8aosh73qhTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X5nmqeCa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso9854665e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 00:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756885137; x=1757489937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzDrLtK3tVYXpgajpgV5xkfeNF5cniPAFxRcbhLkKq4=;
        b=X5nmqeCa6G3jNoRzJVGcTJgsq+jjaefzCJhNRwlv4WQgt+oxk+4e74BtDTrFe8Mwl0
         n0NwXGwV56+TtFkYXsuRndj1GNG9uZ39LzO3l3kjbS/ZPBPUyWzIgdLAt0mI9FuFnmIH
         T4ZkZIV8wyEsJyzKAG6CSEwYxSD05Mr2GNOyoXRYWPYATxbTHvEGZPgzRqWFItPFQLn/
         jyJ0ImPhA3hmqBp8K0SDJiApbfPZhqqly7nItjxGeUFUWqkpxofVD3HHQxt642SUpLL8
         cOI79bpx4JZRnoAs9uZNSIZL6aT+A0HLZAdRUGI8/zOmUfP4V/VCyxhT5I+9ZnQAJGeC
         RFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756885137; x=1757489937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzDrLtK3tVYXpgajpgV5xkfeNF5cniPAFxRcbhLkKq4=;
        b=kLznhGutzTKKTCaEcN/yQM3JvrFPaV74ufB51g0hsqMI9XckOtq0sOATULNgyeq5cj
         ncRnlcDTjCjA3cUGfSyclcxCrsargJHks5LJ1oo5PtjlEZjnA8HtkjJSMMWtWplNFfX8
         ybA21B8xIyhMoKO554vUCYI0FFNNQnxPJN3so2avgld2f2/4QC7zNLxTyl8JgssTwwlI
         yADvsD9PeKKlsE+hBWR5yX3nag4OcwN8YPRFk2NmiPSz9NMg1uzikQ4EWj8QOufGTHFm
         xUWEjxHxtjJElLSVKCfraNlVkYmR3WCQJI9AmEUEy5CRVlI/s7oKfRJ2lved9ZsfkcKz
         M+7g==
X-Forwarded-Encrypted: i=1; AJvYcCWQxnhYOdmPjn2r9IrYibsjn/Sdn7tweQO8h+ArAN9s/V3M+lQPS4HW+PqrD7r+hPgTMc0EDj8nLY7S@vger.kernel.org
X-Gm-Message-State: AOJu0YyjYSXsr2K6FxZrFelgD7ao817KfIQxqRbu8o1zu5ma2y9yui3d
	tlO81sBUonC71tR85sQSfdp4FpL6MHEitWM3Xjtz+Y1llIZTta9nViLcm1s9juk1u+Q=
X-Gm-Gg: ASbGnct/kKFUp6RCmTAUuvYAX3sSKsduQgZy4IwZn5+zjEN/R+FU4Upt2xTMrwft7qu
	wzI24oaZdPeK5sAQJelEborGbhWLuz7eYq5GTHIRXgmeDORR6QcxuhPGsVJ4jNkctNVIubkHecy
	2/hGwj46Davr7Ykg+2GxzRHHTt0UJ89MIy49NeIv89G3DO2Me7Fb1vXIsjx8mfH5JFEHUNa6o+Q
	UYdB1YE28o2Pal+IRsthhi5RitFGZnnhM7SQyAIKL8krHQiblWSJ4Eh1XaC4DJmCnh0OTRRtcWq
	vxxfRitFmlNo9NJdp7sNaUFEd1W5E7muPGM/C9lKAZpIXbbVmIIrZ9yjxzjuDbdt+ksh8e4zXpi
	5knNcdEtrfG8Ae3X26skmJq2k9vjSY0BDiw==
X-Google-Smtp-Source: AGHT+IGzMNTEASi0Qi6RgPFb9XAbV8YDnYAnOHuJi0TADIjDiS29XexXLdCQiRjZjgcY+IsF0TsvRA==
X-Received: by 2002:a05:600c:3b29:b0:45b:6269:d257 with SMTP id 5b1f17b1804b1-45b855c428fmr121644965e9.35.1756885137007;
        Wed, 03 Sep 2025 00:38:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d53fda847dsm13417216f8f.0.2025.09.03.00.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:38:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 0/6] gpio: remove references to gpio_chip::base from debugfs callbacks
Date: Wed,  3 Sep 2025 09:38:52 +0200
Message-ID: <175688512869.10115.2172054090244481140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 26 Aug 2025 11:54:34 +0200, Bartosz Golaszewski wrote:
> We've stopped displaying the global GPIO numbers from core GPIOLIB
> debugfs callbacks. Start dropping it from drivers too.
> 
> 

Applied, thanks!

[1/6] gpio: stmpe: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/246b889c704e3209050eb0aa5a3733564aee1b38
[2/6] gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/ddeb66d2cb10f03a43d97a0ff2c3869d1951c87d
[3/6] gpio: wm831x: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/3767426b234f0d7b82ccfa05e53c47c83e0a12c2
[4/6] gpio: wm8994: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/aaa1279b8b5b46cc42b6175c2bcd83d8ac5fd2b3
[5/6] gpio: mvebu: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/2d71156cfea8391625ea146eff32b3d2ef059345
[6/6] gpio: xra1403: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/3be2d43534aab7291b59c4e66526f911854aa3a7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

