Return-Path: <linux-gpio+bounces-16470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7E6A4181D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 10:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B9713B1801
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 09:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8A4245031;
	Mon, 24 Feb 2025 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lwjKvi1R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431AD245007
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387952; cv=none; b=OF+aqeMjwTqhkjpiNHfNPRZhg2Rr0tp1+8RlgBIyipEHY0GsGIAG9TV8iV8hVRj9FH6qw7qtmG4k+6TYh9YUE4r4eeLGZikuE6XLSMD3lZL+GKWOP+DAvqs8b6mcEDcK2KizncgNKuXGxPF5ws6hu4HO7s9kOfO9yNc52j91L5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387952; c=relaxed/simple;
	bh=3e9NHcUNxohh2CpI0RlnEGP7bLm3cOQid8XcKAi7Rxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R33mV5z8G3y32AiOThGOfYRh53OvhQafMipPE4gM1wLbMGeKYJUeAnELp5OrDwLqKMccRGp0P2k5xe0VOmK5vpjcK2wTfRz6s7fqENqMK7nrIKEvA57B0Qz+MZxhS1KDgN0RlPOsGDdmlsyeGjpt8bpOCErg1Yn0AM7g6xNlboc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lwjKvi1R; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43996e95114so25983565e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 01:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740387948; x=1740992748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFYRxGlQrFZDLwzhBGeR9eonPXy+s09Qb4jWFcOTfYk=;
        b=lwjKvi1RytbVCoP4cuouJqr6jEQ1c/yk1qAOThNe4yjLAzISP3OEJAFzKO1TyqOp7z
         BJkocSwKjEl10m9TrBApBuHJe6MzWXO9ymTglT6hpsm3Df7LDO3hPvnh0oZCYofOYiK3
         0NuSYdrD2mABozCAhl88F1/aR/sbjYsDQTbTMqUcV7Oy0UEFzCNXdaFf0EjdJeVgQ8b4
         kAyILX3WDXWKOyKZtmlR70nImEUP3Yl1wo/pG1EVCvG/+wxL6hXu8hrGVVKPs3bP9GJI
         da8TvvIDsw7LLNmh5DljfQbgiOB1famIljEms3SSssmP1Gf6GPRil7zJ2sXsQxoBbBZU
         pnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387948; x=1740992748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFYRxGlQrFZDLwzhBGeR9eonPXy+s09Qb4jWFcOTfYk=;
        b=O90hE25UakEQ083+S1Gl4Ce18pe0wrXi2d7Xho/NPoDRsIYuM/S0xx9PcP44+rFNa2
         7gfHhvHzQ4YkUPuP3yWpu8gAkpBZ93Zjbuls6/DabgsaBiQucEeBZvmdU+Dih5KMevJN
         riA4YTbJeINl+jFMSBHPVUqtNbXBrSfceaATDaxg4qZTH2L3iHbGTYn5o6tONqi0cREN
         CymOxW4Z7vItlwESqQIcmxF24GPJhZsFtcjNEB6HmvMHddSQjTEWsfNNFZw1GP0AhH58
         udIf0moQhVkdJnt5B4nTsnFivHxUVXOiPkgC3U58s/ViV4izdz0rq9k6MTX1qTyoJdrf
         MrZw==
X-Forwarded-Encrypted: i=1; AJvYcCVOCzQXSLe39FOqPYJONzRi+IxFSg30AQvH4ocNNnnbwPw1KNNSQ5xo8WXQQpFxs2UdAcu06boGleUL@vger.kernel.org
X-Gm-Message-State: AOJu0YyuxnwaKDNanLlcHZIeK7YtouX0yhVfZudJAh8lKTgNTWbkxTjD
	go2R8th9J76PvC3NA1QPjqSslM0IY8HEuquXhL7TTsMIpp0HDKqVHx3AvvIm0CE=
X-Gm-Gg: ASbGncvNPasgFg+JEK0BMQR0k4cIfqX26olEJ/hgGU0fxvsYE4bVI3l5Rc4baxO5fFU
	ykTN0JUihd3blYNKXrS8jtnHAaVwJMoBmEdjAm9G4x9d5NEGBL4w6sYpnI57JYMvVObm1IVY2W8
	cEi2g2kcUa/comQDXFCVvy19MI4IAKX/G/3u+4a3oCoiKAcTLVSwDq6LF6wvzhBr47Ntn3qNSGE
	IWCak4yCJqTeZP3qVppZU8fsO9OtpdO38XGLFdoYaEROL3jQmS8MHDcHJ65+kutT498AGN7Lrxu
	+r3eK9XUOVkmnaM2E/yaJJDC
X-Google-Smtp-Source: AGHT+IEFHiBEmy8sXEyrtqQXwnh8dEXvmz0066u4ABmknFw9wG4yoH3NVSTLUkjYgwsYUVJbfwi7Zw==
X-Received: by 2002:a05:600c:3c9d:b0:439:88bb:d026 with SMTP id 5b1f17b1804b1-439aeadf8a3mr101484835e9.5.1740387948472;
        Mon, 24 Feb 2025 01:05:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:eb70:990:c1af:664a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce37fsm101497385e9.8.2025.02.24.01.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:05:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/8] gpiolib: sanitize return values of callbacks
Date: Mon, 24 Feb 2025 10:05:46 +0100
Message-ID: <174038792740.24614.6901327376350274039.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 10 Feb 2025 11:51:54 +0100, Bartosz Golaszewski wrote:
> We've had instances of drivers returning invalid values from gpio_chip
> calbacks. In several cases these return values would be propagated to
> user-space and confuse programs that only expect 0 or negative errnos
> from ioctl()s. Let's sanitize the return values of callbacks and make
> sure we don't allow anyone see invalid ones.
> 
> The first patch checks the return values of get_direction() in kernel
> where needed and is a backportable fix.
> 
> [...]

Applied, thanks!

[1/8] gpiolib: check the return value of gpio_chip::get_direction()
      commit: 9d846b1aebbe488f245f1aa463802ff9c34cc078
[2/8] gpiolib: sanitize the return value of gpio_chip::request()
      commit: 69920338f8130da929ade6f93e6fa3e0e68433ee
[3/8] gpiolib: sanitize the return value of gpio_chip::set_config()
      commit: dcf8f3bffa2de2c7f3b5771b63605194ccd2286f
[4/8] gpiolib: sanitize the return value of gpio_chip::get()
      commit: 86ef402d805d606a10e6da8e5a64a51f6f5fb7e2
[5/8] gpiolib: sanitize the return value of gpio_chip::get_multiple()
      commit: 74abd086d2ee5ef10f68848cfe39e271ac798685
[6/8] gpiolib: sanitize the return value of gpio_chip::direction_output()
      commit: dfeb70c86d637d49af9313245e6b1f2ead08ce9b
[7/8] gpiolib: sanitize the return value of gpio_chip::direction_input()
      commit: 4750ddce95ae8be618e31b0aa51efcf50e23a78e
[8/8] gpiolib: sanitize the return value of gpio_chip::get_direction()
      commit: e623c4303ed112a1fc20aec8427ba8407e2842e6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

