Return-Path: <linux-gpio+bounces-17520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E25EA5EDDB
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 09:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B13DE17BE2C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 08:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E01B260A3F;
	Thu, 13 Mar 2025 08:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CachgJnn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713B922FF31
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741854044; cv=none; b=q5ZROBmWoXSuI6E9yXgsREw24kbivuwdsO+gIEWV3I8VblSmwMCHLZB6xJzdU/MYjXaUlWTzZFjW7BDl0gu1jmB4PVgpcRg33JZRCTfJqTjFsJF+xxcC7/xMOd5KbcvSot5kFIzs+C7hOMAod358u6yTbpBdtpc384FebcEZ3A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741854044; c=relaxed/simple;
	bh=SjIN5pGdqHItZf6d6Qk2kPvBoUEnKMsk2a3iE+GF1tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jAYzKHxIsn/8N6EZv0HV13BZeJbd5MkmNAVa000A/UtQxprWx1Kp7gJ0diJQIirhaNF1kYacK939/R4GkDan3r0gDcNyaSud+pb34mVrK2Rq3+pCnku9PnOzbqiMLXdVKkZMAeah4H4rrFKMpyTq3CjXUYOENPpgaCqF1ijzAbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CachgJnn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso5433035e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741854040; x=1742458840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKvZQurkQ9RsE9+DByjOMj/p9v8kGhQoEtP4/SJolog=;
        b=CachgJnnFBNBciwh4B/R54ffsQ3Z9AjHcsvinEaVUUrGRy0drWzBgVHOO3SScnb/Va
         puEVVmYq119efB0/nnkErGD2YjQXX5ru3/liePeXRDyYA43yPSIP6PHuStxH2S3oUuFM
         ttmY43SQdF/4IrfKNdL4YS0XCyo3C6X8U2GD5iDANaZ5C0f9vuifGQJHivkvAXFN/Zw+
         RoTJ3ezin2nXmBO8dKKJITd6L93rwxMCoXPce1aYLBPJqUq3IWiahTScFZ2h//ND55ee
         JR3PVjbCmxgroMOFy77gmuKLkIwWYDcCJbCL/hxa7a3pARggnz3+dTjlWLVI7wHAX9Op
         yrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741854040; x=1742458840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKvZQurkQ9RsE9+DByjOMj/p9v8kGhQoEtP4/SJolog=;
        b=RoW/dPvA8ClxzEl/8zvRzzfr/cBpkxB/4pJd+RynkU+QBG7DoVPWHKETBgbYWhrkud
         aRrGR7vEWuBeLMRNP0pfJAFjqyHhmEhcigXUCjOIxf23ien7PBTbn1pCUn1y2Jn5LoJ+
         iKV/fphXi2U8rdu1lLf+0f2Q3MtagSIZSZ1uSJtax1CVj5gr+FtfGACtwBgHjMSm18LZ
         LZS2dAtxFHT18jN34bUZ00llUEYYEH3wxgYaETQdZSM5G3YhHphR0mxFAc8rEf5BgHFP
         B1ktoA2Zy7gdNuXs+Eg+sh9njPvynCLc/lVtLWs4rUZBfASu57Cr2dogKk2J6x5Oko7Q
         5PuA==
X-Forwarded-Encrypted: i=1; AJvYcCVA21Nl/hSQ+ngXJaYOHQjcHw0b5mUNwoJfiag1pucWbmsfeziQoG7iNJuOFb3VQYcvbfcGG8nB3/Z9@vger.kernel.org
X-Gm-Message-State: AOJu0YyUWVueALIzZctCWSB4eiDIiYG7FmStJOaEGQ5wfM6o26Tlo4oJ
	SxqtrPfvKwGyUkZER+urffQZiVwfJm1Mw341zf0F5No2Cyj7+LFr6bJGypDHpTE=
X-Gm-Gg: ASbGncv5FuQtAZvXUKcVupF7d6k+Z30x+ezc5EG77nffSr3qMBQnJySYSxu3XqsCi3r
	xPwOCc9Vk2IBD5WP6a1E+cfzIYMR662fpJZseE17hwQr+8O2ovBzscwDbNLMKgkeo783RmLnAWT
	bLI2defFAAgis3AKk6D0Ogfez1NZgYPSklFxfnQuKyIEwu28wwS1XTzmEyMVGx9EME5x412rOfd
	lGGsp6wCmBPTlYrjfnIw75LISj/uqZnLRvusVa3RmK/whs+Mxx4k+kF90DQG/3q6dPsaTU3Mnlv
	lVTvRg6ktiD5S74zZLvTu/7tySBD6p3AC2h1X3UJWETl
X-Google-Smtp-Source: AGHT+IH3kWe07MDhWQnUjptIQdVl9JI8Gu/cjZzOcZrcKaxf93MQMfdXK/RBg6XKCwZ2N8EpQN5fFA==
X-Received: by 2002:a05:600c:3ca0:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-43d0aee17e8mr36190405e9.28.1741854040459;
        Thu, 13 Mar 2025 01:20:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:90f7:ca4b:a5e1:8693])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a8d068esm45070275e9.33.2025.03.13.01.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 01:20:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	David Jander <david@protonic.nl>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT v2] gpio: cdev: use raw notifier for line state events
Date: Thu, 13 Mar 2025 09:20:37 +0100
Message-ID: <174185403526.7115.14841250128287935450.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250311-gpiolib-line-state-raw-notifier-v2-1-138374581e1e@linaro.org>
References: <20250311-gpiolib-line-state-raw-notifier-v2-1-138374581e1e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 11 Mar 2025 15:31:43 +0100, Bartosz Golaszewski wrote:
> We use a notifier to implement the mechanism of informing the user-space
> about changes in GPIO line status. We register with the notifier when
> the GPIO character device file is opened and unregister when the last
> reference to the associated file descriptor is dropped.
> 
> Since commit fcc8b637c542 ("gpiolib: switch the line state notifier to
> atomic") we use the atomic notifier variant. Atomic notifiers call
> rcu_synchronize in atomic_notifier_chain_unregister() which caused a
> significant performance regression in some circumstances, observed by
> user-space when calling close() on the GPIO device file descriptor.
> 
> [...]

Applied, thanks!

[1/1] gpio: cdev: use raw notifier for line state events
      commit: dcb73cbaaeb39c9fd00bf2e019f911725945e2fe

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

