Return-Path: <linux-gpio+bounces-23351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670AB0714F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 11:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 594C51AA3166
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 09:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D15A2F365B;
	Wed, 16 Jul 2025 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wOuJyPSM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1432F363A
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656976; cv=none; b=rYXNe7KPUuSy44RvcONK3eyfNx8W35cp4+NffFdTOUdSIijiLi+NDya3wzklmsvXQUNAYhjcYW64WP3tKpNNcrYa9OuNM9aXJlUZhA81s6RVyGTqJ+tAsB/+mLMFRJmBm1SURB5squLVqCJgj0LeTNYHfNgfTUUSCLcantrdk7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656976; c=relaxed/simple;
	bh=cE5VqM/Aye5M25nfqRt4xlFQsQqCriINwKa3QoUQg7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTvfbZyWnrE3eTyw9gxUl8IIL630fHgjQnF1798o4nWm86DuL25fy2yjVZ1Dsi8J+NAr2Me9ddFnhjC4mYl5zU+fvYUARgnF6dx+pxiQzkc/0UFlQQ5+yX1NW8D8P0ETGJACbDWqzYb46+B2enR0I7tBdxRt9LaohmE3b8492f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wOuJyPSM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so31144795e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752656973; x=1753261773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgcyS0cP2LKVR3dk4pVzkOQcYIRxnrw3WrAT5SUiSdA=;
        b=wOuJyPSMxGvGf6k3PqgeQINeHc2/U8nocCb9722CpNmYRZlnp7huV1H35ivbYdJuY/
         3npqwnn2K0Bks/FFVzqUCvnMvq3jsPMu/h8ucI0ouc4F5NtZH/ryNJoL/ffCf0eiizBd
         SAv1u7KqE5i3P6lAqnxt0Oyspbgz493ba5xiFLfXuAOyH4ru0mSI3d8gm5p0Jy0m4UKC
         VLAXsljctVQpAv7u3TZDgxJo1TtkY0p5o0lhasBakep6WAOoH8k9R00z2R2X8ML6YznZ
         r7h5dmoAy73MM3XaDogxw/0Kwqiz95H9C13J2ChZk0qkn6WQYlo3pFEghOqgKoZCOW6l
         LMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752656973; x=1753261773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgcyS0cP2LKVR3dk4pVzkOQcYIRxnrw3WrAT5SUiSdA=;
        b=xONqqewkIvrLuf5BvS5lbQk4+GNQjhyYCzBFGHLB2mkUpA8uGd4iQfVWHsyxwWjdbc
         J2jOhuAQVKD3PtFO+AMtNNx9vYuI2/kMq7RzKit5M3mH6xlweFxyc46tAj9HUd8jiFe9
         gkCTgZ2Xh2y6zzqfmv+NoTfLzx/B0Wi+QdLzOfAEtxeFcZib0nIa245a3UW6n0YmxEj7
         5kXxN3/QVwHGmWRbXu9lHFs8nuS3sxNsXL7w5Wusyiiq3D4nQHlnwjQ812TOlXeU6N2A
         BKBDWWjlVajzw7zSll276vUFS4OJnopjXWkJpe+MsCMxHUrY468Rkv45hv8nX71a1dUV
         d2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWkNQI5DQvMrEC06vNx1oWVTmA6x0kXOYwj0Y0YrVUkq4RQkrY4hQcAV3X2Ivi+D24MQg07xWsKSBep@vger.kernel.org
X-Gm-Message-State: AOJu0YwNuYZx373O5CAcB/KkiuiP9kHlX+mnCPbm/+qqi14VHoobDRIZ
	vbjezn1MvO8aQ4mDfnMfXdCZERkEe/uj8Rekjk4KCGgXzn0+AsXBpLfcnmU3WiYca68=
X-Gm-Gg: ASbGnctnjeKvgHWB2fKqg+b9pFT8Oww34fpL70eSX0Pua7LOmVkgYT2ULZNXyO0oyLx
	Od7iCeMKDd27WIHhPS1TMchFJWwuz2wxUwFRURCZ3Q8r64e5T1eHCGvS/S8E3Qhc0m9I8Qq0Ida
	cMHed7dwvoVt2xnzsQzjb8xmzmCL1V+6NWPjfGySKpMKkKVNfFvbbzZjrS2eGexm7oD9k7X23qI
	ng9xxiOqw8NgUa7kTVkPEZcLwnm+rtDKQtcz95fBZ1zg2jDcllgd9vJL3De5DMsobk6YIAEDDc1
	HDBSYxcFTy3YLJaISi0DFqy60f1AT0yc8AK0ODdkhJZ4vca/+FQH4fdW+FiQqn5GTUsD6jitYlL
	jwrTHtzjsEJfMjlZW8do7f9vGsnjtUQWVgA==
X-Google-Smtp-Source: AGHT+IH1X82qEqhjol18DDJEFGz34X4Ek+/xxtR4JMxGi/bKYriL9xzckLQgYksH5nyxoTbuZrR2CQ==
X-Received: by 2002:a05:600c:4f85:b0:456:43d:1198 with SMTP id 5b1f17b1804b1-4562e3801ddmr17207875e9.32.1752656973308;
        Wed, 16 Jul 2025 02:09:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e8b9:11d7:19c9:41b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e8027f9sm14857595e9.14.2025.07.16.02.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:09:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: devres: release GPIOs in devm_gpiod_put_array()
Date: Wed, 16 Jul 2025 11:09:31 +0200
Message-ID: <175265695302.15922.15433902408963854171.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250715-gpiolib-devres-put-array-fix-v1-1-970d82a8c887@linaro.org>
References: <20250715-gpiolib-devres-put-array-fix-v1-1-970d82a8c887@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 15 Jul 2025 17:00:20 +0100, André Draszik wrote:
> devm_gpiod_put_array() is meant to undo the effects of
> devm_gpiod_get_array() - in particular, it should release the GPIOs
> contained in the array acquired with the latter. It is meant to be the
> resource-managed version of gpiod_put_array(), and it should behave
> similar to the non-array version devm_gpiod_put().
> 
> Since commit d1d52c6622a6 ("gpiolib: devres: Finish the conversion to
> use devm_add_action()") it doesn't do that anymore, it just removes the
> devres action and frees associated memory, but it doesn't actually
> release the GPIOs.
> 
> [...]

Thanks for catching it, I queued it for v6.16-rc7.

[1/1] gpiolib: devres: release GPIOs in devm_gpiod_put_array()
      https://git.kernel.org/brgl/linux/c/ff20798820e08af0fe757c756914b4aa51993ccb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

