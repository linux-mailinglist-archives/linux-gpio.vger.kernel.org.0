Return-Path: <linux-gpio+bounces-29177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C38C914D6
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 09:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE7883A2E72
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 08:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803262F9C2D;
	Fri, 28 Nov 2025 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SdhH9ATY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D8D2E7F1E
	for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319765; cv=none; b=lIrIOP4DGDhGdXPyMQZS07B3GZZNsZIhT7TIhd+K+Glh9s0nLyGh889RtmAamBYgUha+f58dIKEHhayGO0bXA7RjOyqKsfqKHZNpYgdRSI3RYeOa1uvHBvhIhJm48VQ4PQdayXmY1KmkudWZHZ3KBAo+dHUBk8ifWaonq9gyJ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319765; c=relaxed/simple;
	bh=G5X/YIuYDgm3G9FPXn7GKHHHqQxxwo7wholdpY7VZyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDAbX6FoaXYW5jABmOjjuj1kxNYS1M8AUZKUNrnFJ9m3dYrDGyA5G9S9SbQpJnJuhq5X6Bh9TmeVhZnKyKbMzMiUW1tGSkN3JyZkkl8NlozzS++R+HwRiCaH/G0YJ1RpTRVx4qxfxbMoyHZ8VId+Fy7Xk9RzSbVYFxpqqS73r9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SdhH9ATY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso10465485e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 00:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764319762; x=1764924562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsiHm+sn8Df9okW2vJdbAxHPy5xfO+1LmNYi1WvueZo=;
        b=SdhH9ATYVAvP10fh5TUbSNDvdO9OHH7cP3TELL11Ru87r1c4JFSG0h8jhnGQIFoziC
         u4Klw8wSPVbbASWBK0zyeo3Yz0oL8ZOHX8vnYCzZr61aeluTHMxwSc8hCuzwimFkaulY
         ys2imWyRfhT8jLgXlVqTIDY/mTbG9NXQlKV/oO1oGECSzwA/LVxV8gGLiACVSw0rTznV
         TBdcTBuLmb8Yvn3GBolpNZ+BxZYpJW0nBOlwSOLEIs+Y97zfd7f3w1eCmFhnP/GEfjZx
         VvGnXJRFWBy08hGlCtZk5yBXoKSxprbeF2VftJQPA0EUkVCqStV7NZpij9yUXvPk+IHk
         sYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319762; x=1764924562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DsiHm+sn8Df9okW2vJdbAxHPy5xfO+1LmNYi1WvueZo=;
        b=IQaQR2wHncamTd5N1qxR4DB2QEYJC+mwZ5jF9c6jLeXf9t2E+nQevvvWwg7kYQ/hYs
         VjUx+Gz4Kq3KRlgcjA583IUoOqzKG9JcIUPnxFsJBxAemskGmXrtvQA3MfzKgKSXAReS
         ZqjUU1gSDmfwK5wcqD2CO4JpL1U/gOOKKfgwgfp6aPJbHbOA22p3gMe4pgqOOIBsSDaV
         eUueDB2gKrqXa+xzqYecuT8s+eb9XyZE2Rpt/2xeuQ0SonflZ75iCn6Hblp/+JCpX75h
         nbJ0pI0BHs+pDBDN1fgztghKENRjqfkTMTNfpWdj1jGlGj8gLwYmMoFSIyjF07HtZ5IR
         ZUag==
X-Forwarded-Encrypted: i=1; AJvYcCUSwb0RyhQmQMQGl04qqgMpOKzJrTrvCaKSCM8Bv7I03eWJl0RjVK5xaYKRg9xvD72iKmJnA0vB9dhf@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDmuX8+qdUuPOlR2C7L0VoNfp60jyxtlAvadLKmKSyiqrQfRK
	Y/A6vBvZEse8V2oZhqwbkVIGTCwo+g6ZP4cwlHwQmVGEv33/lhOLmL06qucg6ETlo0g=
X-Gm-Gg: ASbGncu1rlZyWMwsmItltgQKL0fnkgUwbBU5hdjTqljkqFybQ6VY0CaZd6YiKN+8jlD
	+bch0tmCXaorgUzHtUASFGcDlpn8KKUw+J+GMaEj5Fm83dlrmmvBIkTZJbfhzypszeAtpx7JNrM
	XCox9uXX7Suy3jTVmzU0ENmh9r0PhsBFWR7AOiVozJ1qDrZvVMMzkXHiiz5L18x6x41g+fwstUl
	dTFlQl5zO+gdPaEeGgywDDXpsegLPgUtnRJWqfQhLERutNtfJ1a0ldJ1Zz+yZyYy6Gil6IcUt+6
	nG6oiMOUkdb8cfncHoVrKfW5n4iU009KvmkNy0+JtS8WzK8oiFwXVYeom3sYITLVj45OpWex7QK
	BwgVQM8M6kfIRp3Iq2h0/IcNEfdsusVgvzM4PK3UStmF10240/ob5lF/tZOMrNzrVeGQbEBARat
	Z1uH4Hxg==
X-Google-Smtp-Source: AGHT+IEL5xPF2KAStmNdok10DICduqfrrjezb2Fw/8Wh+mxcVZ1J34S/WolT2p/t7R9B/7m5au8NrA==
X-Received: by 2002:a05:600c:1f0f:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-477c0165bb8mr255966385e9.3.1764319762098;
        Fri, 28 Nov 2025 00:49:22 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc186sm133272105e9.13.2025.11.28.00.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:49:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: shared: fix a deadlock
Date: Fri, 28 Nov 2025 09:49:20 +0100
Message-ID: <176431975833.13482.3073514830553688627.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128-gpio-shared-deadlock-v2-1-9f3ae8ddcb09@linaro.org>
References: <20251128-gpio-shared-deadlock-v2-1-9f3ae8ddcb09@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 28 Nov 2025 09:40:11 +0100, Bartosz Golaszewski wrote:
> It's possible that the auxiliary proxy device we add when setting up the
> GPIO controller exposing shared pins, will get matched and probed
> immediately. The gpio-proxy-driver will then retrieve the shared
> descriptor structure. That will cause a recursive mutex locking and
> a deadlock because we're already holding the gpio_shared_lock in
> gpio_device_setup_shared() and try to take it again in
> devm_gpiod_shared_get() like this:
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: fix a deadlock
      https://git.kernel.org/brgl/linux/c/54a2df5afa2382d6fd1168a3caf151f50c68dfea

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

