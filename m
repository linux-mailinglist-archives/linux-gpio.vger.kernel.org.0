Return-Path: <linux-gpio+bounces-28753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EF3C6ED25
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4AB6F3519AB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0813D36828F;
	Wed, 19 Nov 2025 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mgY9XwMJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E702359F8F
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557761; cv=none; b=KUlZS0+lyR9nqFMvEs/luDzVpYeh6WbnRHCkoPBAdSKHy7iCa9BGVNL7UvWQM1YTnFIKVMNUTkiC+YXH89PH47dWLL7Ldi69vrnswbP57/qzbDg+0NVHycPIrkUhg+ALaKe7/n0JneHzbqMNSfM+jZkdhXezWupBGgpGqhZhrjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557761; c=relaxed/simple;
	bh=7VFQUlIwTyQSeswC4e5704zf5JuB6NqZXcShNGskuRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qtbd+Vjw0xQqi7fNC7I54rNCVveDu7gQDEHWlwzjIXDrX0gdL8WGITGT7U6f73Ji3FJbOA/HbAWEx323xnGH2A+FqAwu/e2ignFuAX3Z4xU6kgjFCpO3hlC575fSc0oxMDsyTRvhS/KpLc8d+Y7vxSKl6l1HpGcfqDbpnxXUWvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mgY9XwMJ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c8632fcbso4727376f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 05:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763557758; x=1764162558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS2r8yGhFU+NVi0aUTb2MZUABBX5vRYn6yEsupiAxus=;
        b=mgY9XwMJ3gLXD1qZ/VHmh4m/wA7s6zNWvwrHWHalk8xn9HS2Wvs5JXYUT+6ra76qNl
         Y1xFBKhrmwCIIBP5cwtU/Ls0Wllcq81GgTkf2I+tbAY12eoHhpeZ04wb8SZnv2r48cXH
         1v0gaJGQm7/tio8/GdONumtJOKo0u1KbnfCymIh5WQ9jtQW6eYPqZ+iV4xeliZvSFC88
         r+of48Jo4bNjefW3s3FC74FmLelmHHN7LCDS0WOG8JXO7Xr1Lbi9YH1qVt9MchDajcVb
         xQ5YshYX51KMW49VpHbBw+ZQOIgsBSc55h4v79twSqmzYwKd1LUxkc0FIHSvdP3SUCNC
         Rs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557758; x=1764162558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HS2r8yGhFU+NVi0aUTb2MZUABBX5vRYn6yEsupiAxus=;
        b=QEvo+GD6MNHQJJzyUQRBzeVKmkvnQErGrHOag2TduhnTqMRKNgO0rA6u4HqdfkqMTl
         GAsJLW7lPrTvIxHUzOb6NXMH6LL7oy9Qc8OdDW25F5zo+02DIQF/abtCyw6fuAzinqRq
         BpmOfft2eTY6MRFYxF7xp/hNkFoTyWtPune8o+TDYu/GxkHtW31QHaCAJ6Gw9hSs9UmS
         CmcDWeakm7IKl7e9wXZWYYwe+9tONitnV3n/fY7CMdDw8T9IyMXmUUGCOYbe7JGPD/TF
         BSxXoeUXMT9JToVfRvQtgbr+T1IkVJWp+hacghZheQ1okjx1oR4kycIprgEdTWn3C1PZ
         o4/g==
X-Forwarded-Encrypted: i=1; AJvYcCVJzQl3qOSAxaw6O3OoJ56cdiy0Dj/KtKq7vaN2lMVwRzmwkCmEBk3OjQWX15G0zvldL0PhUIsa09qz@vger.kernel.org
X-Gm-Message-State: AOJu0YzRK6j7aiufD1Si7YPFssya3Lz6+XxFeD3VnN4+9OyS0o9QJZHU
	9Qwe50nObCa7aE4MVyX9LaKN1+OBwLJyJobOGGa+XIRfWabqXP0fm1/+2O+sP6Vtdig=
X-Gm-Gg: ASbGnctMBUiSbwgWXVfH0KQoyDNnGDQFhNnao2t+heTslqWICyecyNSEfpQKWGmUjsS
	KSH0HdmTmBiHgl9/+HyoMB1mQ22rgl8lDyPWDTiZamGUPDssE9/jhzPd9KrkWaryWD2h+QTI1JX
	qinIo8PrSGTv632hYCPmXfk4JOTyXKg960xeCdZHWM4Ix3y2mgA3AHTHWo66JcDP2NYCTr/++A/
	yqQHwrvP5IZjvezeCC9/WVxSMU9M8WuXDDrEEKeMHXhFTxXD8Kg6p1n3pgqmwdVE1a2R6wp1EIq
	rfOjlPkH0yJGzM6SU3QzyRnWi5xi4ql9I93mKr0xo7n2iuP02NnB5JNNlZoaYOeb4rhljUY0FjF
	BXTwQjxSIPBXPYi/nkUKcou8jrwwPU0CgCsga3v5OaDeM5Aow2czzw/9bd5lGiAFvOJhAJTVCui
	UwIeBixdTDfjcwJMU=
X-Google-Smtp-Source: AGHT+IEm4UQAc2Ruu6jE507gIFifpPunKGuizCP2sX+vg9eBBGciCwz1YHEecUUUv4XvKADEh1hOZw==
X-Received: by 2002:a5d:5f47:0:b0:42b:39fb:e88f with SMTP id ffacd0b85a97d-42b59339016mr17941623f8f.23.1763557757779;
        Wed, 19 Nov 2025 05:09:17 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c97745f79sm23835123f8f.23.2025.11.19.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Raag Jadav <raag.jadav@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	platform-driver-x86@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Introduce Intel Elkhart Lake PSE I/O
Date: Wed, 19 Nov 2025 14:09:15 +0100
Message-ID: <176355775360.69344.220026529766026146.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112034040.457801-1-raag.jadav@intel.com>
References: <20251112034040.457801-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 12 Nov 2025 09:10:09 +0530, Raag Jadav wrote:
> This series adds Intel Elkhart Lake PSE I/O driver which enumerates the
> PCI parent device and splits two child I/O devices (GPIO and Timed I/O
> which are available as a single PCI function through shared MMIO) to their
> respective I/O drivers.
> 
> In spirit, it is a continuation of PSE TIO series[1] which received
> objection from Greg for abusing platform device and has now been reworked
> to use auxiliary device instead.
> 
> [...]

Applied, thanks!

[1/2] platform/x86/intel: Introduce Intel Elkhart Lake PSE I/O
      https://git.kernel.org/brgl/linux/c/a0c83150eea5807dbedf786f55cd49b14af118a8
[2/2] gpio: elkhartlake: Convert to auxiliary driver
      https://git.kernel.org/brgl/linux/c/10c15296906952016a84e1e45d8dc361f35afbd8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

