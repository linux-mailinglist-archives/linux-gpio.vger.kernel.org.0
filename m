Return-Path: <linux-gpio+bounces-21980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C60AE36C4
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501963AF278
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2074A1F560D;
	Mon, 23 Jun 2025 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZOGR+RNb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E591B4240
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663669; cv=none; b=AkHHO4B82dMR0d1L5s9J6k7dE+kPeFD+dLyHZ/h+EU+GN/lE2H9BVTzVG7lRRzmww3qn8kCFG5qEqDOGPSe55bHJ6frAQMOf2lpZ9Ct4MIqpGnyYrFB4CyScOxhj3gFBR7YWzHs0FHZfNwVJDQUqFyDbk/EglSrcgKOUESPcOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663669; c=relaxed/simple;
	bh=C+48779ON5P+8zTEnrkBq4r4x9ehytQXvQ32kKfQ+VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qY/INQ4cQVn+ULqzOUsk25Fg72KsTQDUK9sRTpUP5Xm6FU6DJE20tezaTcpjqExp2ej+2PyaixGvTpwW0M8JJAq7IxhfzmZF9RXiKsBy/uSag2lJKdmLBT+Vb2yshQMu9lFFHokg2AOBOxk6dkQHzftnMOUpuLr1aINCOEFVHSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZOGR+RNb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45348bff79fso42614555e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750663666; x=1751268466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzPqdhEKbFE4WKMT2toUuYysK0Z15a9xzSQs3F9Y55s=;
        b=ZOGR+RNbi+N0pKQ0/ldFktxEB3KaTGuaVXO8k7CH1G8qy56B9YEu+V/DMDfiVX3UPI
         o8slT/5OZecy0EzlVKbHHWXKib7aYYnUKpN3cPPHHvJLjJlPpds7dBLEHk4749ZQUMGn
         RR56gAig2WzZdeMKVoMwo6cCGaUg1yqLNt+bZ7nY3LIvLQDqewcX6FDkFpl9yU2gbVZA
         YxUHW3XsySINrD4zH9f6PFJ5zgTH4WjG0fMAVa5Eh40EcuS+PGKw2taPbjI5t1ieWX+f
         FYskOg/iyrvzxZyC2ACCU1BF9L6NY0m/KeXrxcgMQkgGpxr/ftCcWJ1UAkI7dCUhwzAT
         a/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663666; x=1751268466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzPqdhEKbFE4WKMT2toUuYysK0Z15a9xzSQs3F9Y55s=;
        b=DEAo0iQqrHEaaNw3Ulsxc/sdw/55jJ6wRURoHznTJxIbgLPIc/f7AXtMauSxc+4Gxx
         gAGCkNHn95EHEj/sPeDueWe1Pjjgphgo4mYwDSLtMYKmFq6P7ejszrwcpqIqSxyXlcV/
         HYbF4Y5GN+hF9U3AmiR9AuXloEP1DpIi1EhuWGSH4az0zBVcgbZorjnT2XEi3gBYjt1g
         jmBvp3zhUr02nUvCxVPmGTGgl6QvXlx917z04+Vm/1uDfwhNrfYEkEOFl9AbTBaN1h+v
         mrSUWOZHHCph9VGTYtHUdrEywN7HBHO4xQS5xkbriFYMy/F3IPFuOB0bajqHWp6mj5Wg
         3Ztg==
X-Forwarded-Encrypted: i=1; AJvYcCVkeU6gj5eWxbgV9B1IugPQSQ4FaR1wsYhBjzJZ63oc6q2oOKu6sdOUfxZgo3g1H1jTFLPkzirNKjPr@vger.kernel.org
X-Gm-Message-State: AOJu0YxValGV1p2Olr7/z/vRhC+wOnX+jMX8iHaYVJk1WHXS4ilPgG9L
	NMwfoRq1etjxaUAUuevfGZP7dJJMez87rRemNOowEfI7dWIAhmQUDZsgsNcAmD2DESs=
X-Gm-Gg: ASbGnctgD4TJhbDKZYc1tH8VyUbMXXaEWAjfWXHgR1C4DiOX9AQWtoRo+X7zMFuAhJ3
	uM1SRo1GkyueUEksQ76ihX2Sg+AI5+GKpQD+he1aXOtHO7g+VhLGNJca7HrzNpMkUiZ19l5fNE2
	/lUJjHIKuhkZSdU/BTcmwKsJ70otPmcsiHyC5evAKNKJ6hrqT9uUmi9qixfHkzBOLbp+ukkOXKr
	XSnUyCZTfCLVT1EY0SR6IfBvpY9WdatxgWM/4EgIg8m6hMKi1MpOG7tDKGAEjFaaxuJ29NvJdxa
	/Rfl38wH3NKgmW4CDEygq2XDLqNIYB8MPQS8XLp+bxSFR5XRdoE/SJS4O/bnjw==
X-Google-Smtp-Source: AGHT+IH9rEDeNXFSSnMBqu6I5pB5WPT7zqUetHOerVAMMI8lCebpPpqi/qM3evPjb+mgZmc3Iz0qeg==
X-Received: by 2002:a05:600c:3b2a:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-453659b68afmr92295725e9.6.1750663666401;
        Mon, 23 Jun 2025 00:27:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d7fe5sm100018525e9.16.2025.06.23.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:27:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v2 00/12] gpio: use new GPIO line value setter callbacks
Date: Mon, 23 Jun 2025 09:27:44 +0200
Message-ID: <175066365840.13100.13826929521170869175.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 19 Jun 2025 10:33:13 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: pca9570: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/40b71f1171da13664e9677fbd993d9098315d71e
[02/12] gpio: pcf857x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/4027438be823abdcfb50ee2abed06fa4e6af4b7c
[03/12] gpio: pch: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/74260fb09cc6f6e7bb6741bedca4463079800ead
[04/12] gpio: pl061: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/201e0f24a5b73fa73606ae2261d155f00cb6d577
[05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
        https://git.kernel.org/brgl/linux/c/fecdef830c442e4375a3bbdde26af385583fb05c
[06/12] gpio: pxa: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f1ff31c8ef80f4720ebf7854e6af6204dddd9ce3
[07/12] gpio: rc5t583: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/309ea5811136a06f572c7abbeae2dcf773629a5e
[08/12] gpio: rdc321x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/76033f1f927cd93907c1e9eb3f86e54015e4366d
[10/12] gpio: rockchip: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/6731ad96e8770595d4a6ceb07e587b07d22da110
[11/12] gpio: rtd: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d68ddf651dd2faea5cdc6f6656148b739c38645b
[12/12] gpio: sa1100: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/cb908f3699fb137e28017a8fdf506c35762b3eb6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

