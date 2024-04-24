Return-Path: <linux-gpio+bounces-5801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 842D68B03E0
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 10:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB3CA2834B8
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 08:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3071586C1;
	Wed, 24 Apr 2024 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kBLFiFId"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D936D
	for <linux-gpio@vger.kernel.org>; Wed, 24 Apr 2024 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713946004; cv=none; b=g06F1SC5AE2DoO/5jfXzlNcGNPTCOzPbu/1vgOj6VfKXF0+oeG+kT90p/dib7Y19k+RMakFI+zNd6VAWPnxFoBJTj+yMqPaiNN/XBKCYGFE+Zc2wwGWlu0RU7F/gNIBca8A8B7rXu4DuZMxRt4hjLWwA1vG1EfjJurMyrbFU3cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713946004; c=relaxed/simple;
	bh=sfp427IWRSM8KUSUjKRapzT8lsR7A1INZ7AqT2jTITQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sSf6P7NU+sRHbcCgoUbqnNuYUa/Fwc1zy5+RBM7ePiEeVDVjSsu1fKhH16DAzKo6A8O+vdHx3xKJZKWLSK7jR8upvL+5hYOLje/Z2hO04Eiq2y0Y8uF1xLKQM0L4h+C+xl5YB2f+VbbfvXijL7+CN7+Bo6MWQfPIQrpnpndRqts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kBLFiFId; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41a442c9dcbso25469505e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Apr 2024 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713946000; x=1714550800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORX9tB1taIgypfEanXvBjsjnqpdNnIA9UWanO1NdTME=;
        b=kBLFiFIdt5RGYrqHYXNeSHo6iG1v4FDduHzsl5DGubl8YY8IsUrI9Kx4HFtGpTdlzW
         hTYF6IA8zhZKaM5Dm1Pn3LvRt0u7WseXw7wdUow6E4oAxxzF8IhAEipMcNgWIEgqeYUZ
         Ib6svkRxsCva4nXXmx+dmWbgNNb24T6OKPV1Ug1kUkzk3NrpTVtqc7F09E6El+6zozs4
         X6eY6+bm59EBLsKpxtEQBV+tcDISPdsYCwBhXvbo7dzh13t9hgpKoa+p2Yt2C+Bs8ied
         8da1pT3wYCBJYx+QG4neEILahGcVp8bFIj0j3xIR1LMQG0sK5yMjvDn6hMjUH428OnE5
         lmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713946000; x=1714550800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORX9tB1taIgypfEanXvBjsjnqpdNnIA9UWanO1NdTME=;
        b=r0gdGn+LI9PaIxgllMHqdhaKWwGNiD5EJuglmf1woPyeKk9zK7KB34pz3OxHqWJMCC
         HnlVNiKR6Xyn+8p7OIOPQ24RITd/GmvYHpftr+x0cRogjCiyVtdIqm4Dpe74zi7YVQhl
         TpsLYM78A5f3T+EelyQ+/k8HzIJ/PblbKHMzwjeYs4pJZ2JttxCSlhMPNchbeWWYYRSI
         I2inu1itlV0F7+8euho4IYc86+zle0i/1e7astumw98beQvHv20dBv0g3L0y0XvjYzF1
         BlU+K2pWNM70VKcuL4fAkz3A9W7g4eUzscA23huFC1wGB0PhOcNnKAVvsE1M5we/iuUj
         Gd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLFi3B8jGQdQxkCF+UIA8rh0ArU8Lpb/mv+3nbjBmKz/Kh1IVDvg+x/k+g1NTlyIq5iIAb5P7RlLcBXKg2WlmllOPGtrsQM75Diw==
X-Gm-Message-State: AOJu0YyFvMAwWNd/A4wmfiCcjjJbz/xf9WmjP8YtXXmlbxL0LwCRSTLe
	jCJ92jO/Sc7GHnTyWF7ZH+fcQqz6Y2XsJTPFvRVy5osZsVRevcg9+LXHqMx1xKY=
X-Google-Smtp-Source: AGHT+IEaK4AQ9xBwAKfsUBnlezb+1tV/a+nL4/rpFAEPwR3dJDsUrY/5xDxG1UN9hCDZfDTy5XzBUA==
X-Received: by 2002:a05:600c:3d92:b0:41b:13f8:bbbb with SMTP id bi18-20020a05600c3d9200b0041b13f8bbbbmr304496wmb.8.1713946000384;
        Wed, 24 Apr 2024 01:06:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:da66:dc78:acc5:bb9c])
        by smtp.gmail.com with ESMTPSA id w20-20020adfe054000000b0034a366f26b0sm14838611wrh.87.2024.04.24.01.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 01:06:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH v3 0/4] tools: timeout handling improvements
Date: Wed, 24 Apr 2024 10:06:38 +0200
Message-Id: <171394597202.30942.1926945533787856740.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240423100452.32958-1-brgl@bgdev.pl>
References: <20240423100452.32958-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 23 Apr 2024 12:04:48 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Here's an assortment of improvements to parsing and handling of timeouts
> in gpio-tools.
> 
> I still decided to unify the period parsing between gpioset and gpioget even
> if it doesn't make much sense for gpioget to support periods longer than
> fractions of a second. Let users decide.
> 
> [...]

Applied, thanks!

[1/4] tools: rename timeout to idle_timeout in gpiomon and gpionotify
      commit: 9df101d6d6bac5a9ef42692034f3c2cfe9f2f521
[2/4] tools: use ppoll() where higher timeout resolution makes sense
      commit: bb5a2bbf5d254830502c3ef40ea22c49f557782c
[3/4] tools: allow longer time periods
      commit: e943b144d5f01c4f3da0f7898f0ec244a07e9aa6
[4/4] tools: add minutes as a new supported time unit
      commit: c34a572c535000d48dde12a805b38731dc33deb1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

