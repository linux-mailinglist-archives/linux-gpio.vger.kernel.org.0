Return-Path: <linux-gpio+bounces-12846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A34049C511B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 09:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 690942835D6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 08:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B394920B7FA;
	Tue, 12 Nov 2024 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T0mzReA9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7AE1A726D
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731401216; cv=none; b=HeFQlgbHYZ3nqfgjbSugU+/FAKOuL/c0ACWVyQ+gq7i/U0nSbUbfrrqmYLHxVfkagLWPEgrvhFfuBQB191OA9t3sUIkxXT4u00u6bYDTcUIt52LSODLd6jzZ4Fg4pkEZ4EjsjU3Q/OaZOiwtNqgOScCDLEb8CSjCm4DSIF5a9eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731401216; c=relaxed/simple;
	bh=1SeSkExfLxNGyKHFXVcyYbX4qozwuI30PMnY3/g2Das=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SiXBwSvbLlE33ddX6hT6NITBeOE79200mqJaBfBoOUryXKPluuKSzFAYZVX+Fw2l5sh0V578bUvJke5EV/AYyhEvc3PQNzzYs6pU346EmdNeNFGHx7xJqgy/JJ2V6FcCvR4S7Gm+Log8t/1+8FgDvmRURHIgowovZ2lzk701WII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T0mzReA9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so47525245e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 00:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731401213; x=1732006013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7GehvWPgKp9og/9hkAXA/iVEoWgf9SAM0+4v2cIfRk=;
        b=T0mzReA90gi1scbBUqcHkaN2aRKE4dR/DrPJqJFUwOiFwa3J64CnyxqHeXSwbNLqz5
         LbBcVTP2QyAH8LobTAwfi5IUqCBxDQKK6IoEdZYzzvm4UYh5W0/S7ifYNkyq5wel5482
         X+iu503OrIoPRF8UeGydHO/3lGnD6AwApm2VBAA1N55MAbRm51DtntrNLIgjuFP8uwj0
         qrqhwYkMtHgqN9/4lh3pY5M9btxrV9CI97Bf2tU5WS0FnMyHRZAKUJU49rTOvJafo+er
         mfG83TrhUxNCe7DkLUpMbXOhNsS2vm8rXFyxFkJ+r+iQm0tY9GcF5P6jT+nRzvft453w
         9cNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731401213; x=1732006013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7GehvWPgKp9og/9hkAXA/iVEoWgf9SAM0+4v2cIfRk=;
        b=ENCO26bC0vYBlI6VM323uQsWud5vUyeEpJUsLw1xvK4Xwa0u0RJ/cbIHEY3IG4j/ew
         g3lq9H+8u2EbsCL7vK/DI1rXb14HdCYF/1JPDsBZAqUfvFYHfnjxbubKy2Fv65X+GmCv
         VISJmh2P4f0XhLeTb1lN9nuTaIkb4XLD3CUJZ6RHvv7LHtEzbkVwPC7NvKuRrbowZjBJ
         YgyGaLzByIQ3ihlssUzgFO0vs7DOOXXmtq146tRHSzbLnLiNzocfOpGHicrN1UCx8Bb1
         rsdQ6spgMGW5IF/mMAZTDxmwi50KZS3sRy0ggscjglztMNPza/OM/GyXje5ghzJNTefe
         O2+g==
X-Gm-Message-State: AOJu0Yzctt0eLyHE9kDjB/C5UqKERtc0S1wNdwJXVcBXdDfOC00ZrVZy
	D7yapVqeJ0eruuvPTQSMa+ncVU3UCd9yHmnjNDCWIBoivf+CFbXU0ZxEhdXF68bfCoAGyI0Q2lp
	W
X-Google-Smtp-Source: AGHT+IH+A5CVMQNRvBFn9HiD5gXDYFZnI6t3yTkeCoT5IOTksuV1hJmOT+k8uhwNM4EkHGJ8KOFDHQ==
X-Received: by 2002:a05:600c:35d5:b0:431:5f8c:ccbd with SMTP id 5b1f17b1804b1-432b74fda62mr137213995e9.4.1731401212675;
        Tue, 12 Nov 2024 00:46:52 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:94a5:ced7:f64:fdaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054a5ccsm204819325e9.11.2024.11.12.00.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:46:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [resend, PATCH v1 1/1] gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)
Date: Tue, 12 Nov 2024 09:46:50 +0100
Message-ID: <173140120888.13772.12922309980443642817.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241110201706.16614-1-andy.shevchenko@gmail.com>
References: <20241110201706.16614-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 10 Nov 2024 22:16:15 +0200, Andy Shevchenko wrote:
> Use the mem_is_zero() helper where possible.
> 
> 

Applied, thanks!

[1/1] gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)
      commit: e106b1dd38e723ec2bb2bf57ea9b2aff464b9423

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

