Return-Path: <linux-gpio+bounces-9818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 043DA96D06D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 09:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFAC21F247F0
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 07:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF98192B70;
	Thu,  5 Sep 2024 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RJeOAhSL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB4158D9C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 07:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521535; cv=none; b=GbweQJB6S3o8GCezOemlGfTUZ1DIfRZ2A+5DIWz80uYeUY3HHLJWRhyPbTb6ZHfM9mU9i3mmAVfFFVPCOkyAPluEuMj5hNBzDXObba504C6hhK1hxA1+ENBjKMt8BONlszCRVvM0lobQbhnQ7lPt7MX4fuS5eV8rHLmXx3CfRE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521535; c=relaxed/simple;
	bh=RrCrM428867DfKOLUVslowNjRO7mC3oQCyyZ61fdVqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fJa6HH00yeK7QAYRGVzBNBm5HYQMeo3oiPtVyFO0+hCx9OZgHiKcRIqQ3XBnsjZDAnpeeKQsnX7+12GANyKkfqdiIBOBJK1V7/WwTkrBmlTlbfyxidW6Il5Y8J2akKVM0zTA1YuHL2vMqAGBzt/P3X4kINMo7odL50nXxkdXQNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RJeOAhSL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so3412895e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725521531; x=1726126331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRgw36jlbxvfMRjHUOs8U6fzvrqoyQqIJxM9yoxWkng=;
        b=RJeOAhSLV6LRwOVP9M5jMxUlFhVr2V/lbysVbtGnvRQYJD1+WjXQ/gTC4gtK9H5dvz
         MZA3ZWQwDsPXDplLaA5oI9JeQXShF6F8uuGl3cI7/cqZrVgpWH1ld+uDZcd3yiCjCYMT
         D60Sv2UmtTFcbqI5IRvAlWLC91E9hMLx+h2uZNIXSeX3ZJYU0vpJ3NizNAeabN80z8A9
         3BE8+I33z/AHBeXXaNBUL4osq4DSypb8oSAZk+oVbdOX6ZJ8BG2SzJvC/frTzCZ1JyDA
         yUuL4sOGXGmTCuh4pLXrJMOpOjvutoKf4xj7f/N/0EojUnlpAEfd9w6oziJ8iTMJZu3Y
         t48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725521531; x=1726126331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRgw36jlbxvfMRjHUOs8U6fzvrqoyQqIJxM9yoxWkng=;
        b=mYTCvqcWysK9serx8ivCUE/Tmg/YyxS0sXTl1Lp1eZR6av0kERYsZM2ugH+HGrSRB3
         +36XKGuS3SQL0aEhDwzWs5TzGnIF8ZqAmEWkQWsbLR6ESCoZsyVBUzNLprh2/cKTbfiG
         gOVIKTA5k3vhiy6wzAVxToe4p6OlVVSpTWDcV1TibSIv1p8HbJKLAL+5CB5jwYIncAZh
         804n+XvnjtYaCYbq0efyR29AlqjX0e7ei9oCPCAspdrVkKxyhkb8aAJiPrOWyMa0qwV4
         XR8aK1VmsdX02bQSx6VtiFJ12fVt2XJl5Q4+q4415uG92jO0fdprAVt2j2HLcHanqN0c
         L6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxAisMUK6aiWq7qaVF4v2toNXB2gJ/ERUm7yRAQq42LEPrmnSGBu2lONkY+SlMEMXXxNHTf4avIvpZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwcTDSJ8U1L6TtYSIxNapsYT3KAnTTkTutqAkca2jrae7rDQIKH
	1B2LkuV/2GxfXagin7TncxC00JOFs5yfPGZfpSW8y6EFnmhtFxA8eUqRaFyMBU8=
X-Google-Smtp-Source: AGHT+IFP1VL08lDCaou20gdC3yuuDfC4+nOVyHi1pcawixO8bphDsH/qSCo2GMenDux5ta+yTsifFQ==
X-Received: by 2002:a05:600c:1d17:b0:429:e67f:1249 with SMTP id 5b1f17b1804b1-42c880ec58bmr69203075e9.3.1725521530688;
        Thu, 05 Sep 2024 00:32:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:cbe4:ce99:cb33:eb1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c1de81b2sm13109379f8f.30.2024.09.05.00.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 00:32:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Douglas Silva <doug.hs@proton.me>
Subject: Re: [libgpiod][PATCH v2] build: imply --enable-bindings-glib for --enable-dbus
Date: Thu,  5 Sep 2024 09:32:07 +0200
Message-ID: <172552147923.27752.17855043042995820964.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904140127.58667-1-brgl@bgdev.pl>
References: <20240904140127.58667-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 04 Sep 2024 16:01:27 +0200, Bartosz Golaszewski wrote:
> GLib bindings are required to build the D-Bus daemon. Enable them
> automatically if --enable-dbus is passed to configure.
> 
> 

Applied, thanks!

[1/1] build: imply --enable-bindings-glib for --enable-dbus
      commit: d78d43bcfffdf5c96702a668a5df3a116aa4c8d7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

