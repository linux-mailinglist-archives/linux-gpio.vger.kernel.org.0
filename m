Return-Path: <linux-gpio+bounces-21911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0205AE14F9
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 09:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5656819E45A9
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 07:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3994F220F3B;
	Fri, 20 Jun 2025 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ho0KbX2e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04026226CFB
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 07:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750404655; cv=none; b=ow1sMDlCf4r8iFe+AQHy7rTVhHU7z7tNNNqArbESoDQpFAqeFB7pA/dpAfBZ/Bw/AimOje/yrvQFG0ALD6rKMtk38457LXJ0BWSZ/SLQYW6DOLQjpHO+K/vhE8xzmc4zLArMnrvsQfvTesIzeUDet0HaIdVN4FTn3hX/kj2a3z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750404655; c=relaxed/simple;
	bh=KKkikw+ldQAL40/WCXMhIRy5mUo0Ek9714W6tXVS/f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JSr2evHWnjoUBtG80Ql2YD012e7D8E+cii7xtFFbM3qzOlNYNL2nHN8JooTrZvRZuQBEddkQ9YWx0GwXMvI/TfZd3SQaMvbxJ9Ri0zYb662yZeRt/RqfIcSNyIaCTwWWnhqLenxT1cy7R4VHX9pvVtovtMo9CDh7W8FeASvlxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ho0KbX2e; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso1331640f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 00:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750404651; x=1751009451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMmMmYnx/RQ3vI3T1tYWhR85q77J/om0I7AHSKI4iF0=;
        b=ho0KbX2evH/bSZkAVWqMlaPmb6TdnU85P0FTrbO1UZ7GCam0vDUj4MHq/3RCiRONgU
         zu1TaYEnFwnYN2UUV7qWtgLlzobFfgl+w2MK1vTp/LxCV1GxcQzZscxtg9P7bGKWVFr5
         fZI0VVrsSwpPP0p9X5BtzxdZgTYNypgntsjnfS6e+oaZrOnPAfSK+EcMoQPCkqr1doY6
         pf1NsvzfvJp7UWpFfCveJvdJGPGzwNFLLEU0i8bAElU4V+DjTeHrqh0G7RNK9yeSNYA4
         ENAz7Itw0BjiPtIP4buRO9X2Wd1oBYUmccLvoanflLhpm6lP8BGPhM30LX6DHQOEg20q
         WBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750404651; x=1751009451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMmMmYnx/RQ3vI3T1tYWhR85q77J/om0I7AHSKI4iF0=;
        b=o9JqBjrzL71CAUGphqX/YZA3sJXoDq9O+ANrDIWS43QLkkBz/xOf01BwRj3I1m5Oh4
         3FTGBFM7h6iyNi7NC7q600tGapDZta7EfGLspEw/nbXWbbt+SqKi/8H5+xq1lMmCE4Wz
         ICX+fYm1N6vP3sUdMoRjytqsYxQ1DoPGW/rKt+8TLBdxJUCaGmmc6DWnsjjSOgtxzWWA
         xsrLrFExtBytsHZoohsSi3eqYconTo82HMx2YKSyrCtiC3KCQL26QQ5+OtCII6IqfX2v
         1LULgM9q9DBkGITdTPREpSM66Bj94u+UC2NMKvOiBhldVmgCiB287ctsJGMepyZRolbQ
         EgPA==
X-Forwarded-Encrypted: i=1; AJvYcCXMmQpc7h+y7wSwsqTjCHJ21KLyBLHD7COxm3rozA9872GoTXHg2PCYomirdjpCrBhwE9OHxhB6hlou@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4WtKzuRrdDOgUymvatme2m/+RN2MUxRs+4mMyMpm91OdYCHPS
	M8f697NWp7rHnXNLJmc8TbIwGfjP57mSmufHj/jdNzDTFGOHmi03UslPINZM6b7ElYg=
X-Gm-Gg: ASbGncsYDN8yzF8EGKXiORlnhPWp1eb/39CRjPaP8eG23rijHmvE4+4d7iyfLrRrBjS
	cCEL5E3xz0fZ4zZb/fGWY85XGXGbKqncHlJU5h298ORDhUYb4KE/stDpfHbZ5ETxets6Cm0hXLh
	SnSmZb75PjcnHTOcCHuEY2/FYNgklGNA28Ql0yWgz6RTibk40WizclTbgWyaYRc/jL+hpVmIEI7
	MF1xkGR9gwK+PgjK1ABSdYuD949agEvqP8Hz10v+raKXuwL/7iS6cHWG/8kV6YiTrSyGhcJkVCW
	ENw90Vv30ON8joFOnfNJLrzGPP43U17OGI6QCrAS0YmZot8jUc79MoQGXrULmZZ1H9D/gj839Q=
	=
X-Google-Smtp-Source: AGHT+IG/mCcLgpUC262IBgRgyYgvBXplwXLsMQ0cCVJlGvrj3T2MuEhyZGA+wJQSTpfv76q9iM6GcA==
X-Received: by 2002:adf:b609:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a6d131803dmr918969f8f.32.1750404651016;
        Fri, 20 Jun 2025 00:30:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:69fe:2655:53a6:f735])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm16448935e9.1.2025.06.20.00.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 00:30:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Jan=20L=C3=BCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH RFC/RFT 00/15] gpio: sysfs: add a per-chip export/unexport attribute pair
Date: Fri, 20 Jun 2025 09:30:49 +0200
Message-ID: <175040464299.26030.15007866194948582213.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 10 Jun 2025 16:38:15 +0200, Bartosz Golaszewski wrote:
> Following our discussion[1], here's a proposal for extending the sysfs
> interface with attributes not referring to GPIO lines by their global
> numbers in a backward compatible way.
> 
> Long story short: there is now a new class device for each GPIO chip.
> It's called chipX where X is the ID of the device as per the driver
> model and it lives next to the old gpiochipABC where ABC is the GPIO
> base. Each new chip class device has a pair of export/unexport
> attributes which work similarly to the global ones under /sys/class/gpio
> but take hardware offsets within the chip as input, instead of the
> global numbers. Finally, each exported line appears at the same time as
> the global /sys/class/gpio/gpioABC as well as per-chip
> /sys/class/gpio/chipX/gpioY sysfs group.
> 
> [...]

Applied, thanks!

[01/15] Documentation: gpio: undocument removed behavior
        https://git.kernel.org/brgl/linux/c/5ed0d32805c19cfa5f03a25ec7e041dc845d3062
[02/15] Documentation: gpio: document the active_low field in the sysfs ABI
        https://git.kernel.org/brgl/linux/c/1ae86030745013d9d54fc287c1ce875f7ddd99e6
[03/15] gpio: sysfs: call mutex_destroy() in gpiod_unexport()
        https://git.kernel.org/brgl/linux/c/e1f02b40a741aac47016765c21b61e91d19aa1ec
[04/15] gpio: sysfs: refactor the coding style
        https://git.kernel.org/brgl/linux/c/dc665b5248f90aa2dc74ecc1f2ebb731a6f5afd6
[05/15] gpio: sysfs: remove unneeded headers
        https://git.kernel.org/brgl/linux/c/982ec96c3876349e65e60c7b4fd91d767099837e
[06/15] gpio: sysfs: remove the mockdev pointer from struct gpio_device
        https://git.kernel.org/brgl/linux/c/fd19792851db77e74cff4e2dc772d25a83cdc34d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

