Return-Path: <linux-gpio+bounces-27349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA4BF5640
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 11:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 430004E7AD0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8603328B5E;
	Tue, 21 Oct 2025 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xx/dlBX4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C7296BB0
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037310; cv=none; b=UvmrjhcJ/HI/DuXTtUok2lAX/t6gbVa9skQ6FY5w/ULbGGH1AWFc3whvVLDV3juOChMbwZt24Fh9btFgQ5JeTA1jGD4okknvooG9/+zXEI5QNVK3hUTYMtgziztHIQaoJyBjOC5ZO4L9Jex9ZkcLzU6AjlD3B/MvfpoA+nYXPFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037310; c=relaxed/simple;
	bh=zo7FMMU21d+H8nlfETeUkJqvTYT9a1KWD14ezWk03WY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bclcPoY+hmRSmaNsiawoCHuan1ifKc9DjaXT0V8l/wPRINR6H5I2nnSFkfyyX6v1xk+EZFYJ7/rOKmYue7P/7KRKW9gn7LjeDrMIQ8VA+8dkQCZIZC7oHlrkRMAUJA+m6evnzzutK7yBLZuO9LNFPzrEApbR4d0VmoRBiGsniEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xx/dlBX4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4711f156326so39942785e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 02:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761037307; x=1761642107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7hM7uckFcu+8xOxYahCnfJuF1kzdKDORaIviV98zX4=;
        b=xx/dlBX4YBy/SLGIC5Nfkyd54TppNFFjzoJQMIzdaShSUZJzBZKLO3RP/l/ksSjUYe
         tgBsAxJV4EGJ1CcIrvQajhosZ5dlOkX12NBgY10xa2j2dix+SGShc3wnL1473YlRmAVR
         AaMq+dPqYYautYYSMQIaf/WUwQ7arGpou5moIrjQX2deVIbkdOMyBkIjlFTIelCzgmj7
         GN0wn8dc2zcymka1fU/lBcGunuJlpOK1p3X65+4iONUdf/DQ3QpCuZvwHvCLN9vxed53
         ikb+Vh3TBxfJzZooLCuFKXlJGthbGEABcivyXB8MhOhSnVU6WW7EqDztkmgZLO0/r/rX
         Je7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037307; x=1761642107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7hM7uckFcu+8xOxYahCnfJuF1kzdKDORaIviV98zX4=;
        b=ctj/XFvYGMhXCs0Z0T231tFZcgqO+BKfffwmRFJ0ID/XtFSe+ogsnWRXQt1W0xuHXq
         oPBIzL6551ozBi7h8m8oXQCAAVrYZDmNoiFkOsCn2K4t5858eVIQ9I0mLoI9UDIbwsRe
         zA7l7+NTWNFivL6kXWby2AWRO6Ru+iv1ADlbqLIB8L81OwExNjz2TEj+uRQYScTo6smN
         LMtcLBzCck2+ybdN0zKYKeugacfcXXjlzEDW8aux29mU4s20peyBtJe/+NhkWmuGxHCQ
         Bf7uW0x78Mk5Al780odAC3STkS0oqSpHtWU/BErpA8+Mj80u6UD1iRqsm80PCikxQCUM
         8GSw==
X-Forwarded-Encrypted: i=1; AJvYcCXbhpzZE3B1SEoISABm3Sh7kfVfpGG4DPkm0nRbUHDSuB+bAZA5h7lBVqra9CLtyiyiUE64umUlivpR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx7ZpHbD05vau6O+rxZjFlNKEfKd9rBXotFFGQfo3KzRviAup3
	ov7z1bND5b8LB3wNCWdk8XelQlEnIpmmYiXy3goyJu3ENebWE0Z6lI4mhTPDttDvukmkfI61G1y
	E1+MqtpVlsQ==
X-Gm-Gg: ASbGncvf3LNu2GnyDcXqwhrIdH9XeQ15Wx/cJzQttaD2j4MxBL7Ybiblbf3tqOM+lkZ
	9cmwiJ9Q6NJvD7eqNepS8qfh7QCzWrqvFef8OnH1HiPIttCHlKeU9gP8TnwWWislsyyotO4yJH+
	v+gMqMCervDPuKQovrFAhAeZiE738FnKKAXxaeQcKGTV4p9hsfLRrULs1ATk9eXtT2jdo+fQhxT
	dgJGs9aAFeL5Y5Fol7CzrULEelpolNEyP84J+GajYF9Ex7n035mL405cNCMipfsj2115qzwWnOY
	3R9DKkRR/vFQRsg1izez2G6g5rHoH1wFcXaJSQdz00sDW0kFbQtEKhVWLMntZwQG3YWnO849PrQ
	MqG3l3lKzV7S+dWRg0rWIFRvbxLVOf7Z3Ul+fZ+U6gLyJVDylUJQPY2nKtqV9d1ZeTEbQJiubZO
	ZN7Q==
X-Google-Smtp-Source: AGHT+IFwaSBjtILyooiRtf1Ykxp9UxcePTyTy4SgHykASPLMYxBKsOoz1/6AxkfVyxkle8GOQXe6Qw==
X-Received: by 2002:a05:600c:3b22:b0:46e:4704:b01e with SMTP id 5b1f17b1804b1-471178767f4mr119724175e9.8.1761037307000;
        Tue, 21 Oct 2025 02:01:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2979:9ff9:6677:97c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d972sm191369065e9.1.2025.10.21.02.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:01:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] gpio: aspeed: remove the "gpiolib.h" include
Date: Tue, 21 Oct 2025 11:01:42 +0200
Message-ID: <176103730245.11215.16894410168920796474.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 16 Oct 2025 11:09:24 +0200, Bartosz Golaszewski wrote:
> gpiolib.h is a header internal to the GPIO core. Drivers should not
> include them. gpio-aspeed only needs to be able to determine the
> hardware offset of the GPIO given the descriptor. Expose the relevant
> symbol in the consumer header which allows us to stop pulling in the
> private one.
> 
> 
> [...]

Applied, thanks!

[1/3] gpio: rename gpio_chip_hwgpio() to gpiod_hwgpio()
      https://git.kernel.org/brgl/linux/c/df900536e85819f6168783d5f6b3908d47811fdd
[2/3] gpio: export gpiod_hwgpio()
      https://git.kernel.org/brgl/linux/c/d19f6451c6feefd6537b97efa5f3859681f243cb
[3/3] gpio: aspeed: remove unneeded include
      https://git.kernel.org/brgl/linux/c/0efa5b2ca6fa7baab4c523b34cfb9495ec143d61

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

