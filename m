Return-Path: <linux-gpio+bounces-12986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7F9C7760
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 16:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80ACB28164D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 15:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A96201036;
	Wed, 13 Nov 2024 15:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pumB7NJx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4129616087B
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731511867; cv=none; b=lTBsDIe5wuhz6/3YZwtKTVjtWHx9N1vigsa8DONA5zonNtpnVLltZir6JmUtTrEin4Gk2s4m6e7xGVv5K+RsGvsq1wf60xyDTW5WVNs1XMYbO7Alht6TFRNk5b5Tja67k43Vsx8tz1XxPMq+m7/GQ7rA/N7iq3f92DnWrEX++aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731511867; c=relaxed/simple;
	bh=lX4i+/0Y6aWDk820KZdFk0O5Zn5VbSwVe/5pG/xWPt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GZ4KXCLQ03mVIzBYHiQIvIW8LThAruK++6Zet5yj3yXfVlG4PjSwPB6jd07xLUC/vVq++ytmyDwWIJ9UaPUwA9G0yYtD5bQqBNfgkcLXN4fptto7Krhl2C5gHgcY6XkeKn8O+qSNVYF55lS1kmzE5UvhCvufRsPq9WwVFULbVmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pumB7NJx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43158625112so62500755e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 07:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731511864; x=1732116664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPqgoBuFPYoqwqusaU3/yu0yJhFSW80NUjkLt0D/Jzk=;
        b=pumB7NJxM72/KxnwGyzPzjCS8QyCmiNgojsZV4XXpKfDaEsHx8+ZEcipmCfGb/Hdfu
         rCU9eJ5Yy802dz7ScsaPBI4KJUYDg7dBUrO8znTRMNfQhWmbgsWwpoXWcLLrDHvnxAI6
         C/kzJNZvYGHDbXBCcOYQfswt59Qj1M5G3yMGUQTYDdBQxLZZcfs7/nUwl7sXsnEvAqKV
         a5aWBjc9W949NxrWhi1wyIBIZJyYC6JUe/exH3E3PJoQYbcFgvNw8l48itUyRtwTjUyr
         /N+eTJ74pLMT7LhJLzognZnzJsNRyIWcR/W6TLgNb1dRKf2prGnIkhXpVJYqXf41W+ft
         agNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731511864; x=1732116664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPqgoBuFPYoqwqusaU3/yu0yJhFSW80NUjkLt0D/Jzk=;
        b=DeBLpx+BZR6Wlo7cLAPIrVquAhFHWY1cb9GpUtYXpLRHbAcOs+US8E7b5izqZLJcmf
         F6Uv+FSao34rXtQpQgT8ofPTFw2O1iSNVFqHIoebG8O6G8Xls8DtfMVPmwOWKvoiY820
         4JIjVxdAHKTQEJv669GwYHrNz++3jZny5dn8eUFYjyt8me3bVYPEX2KBkMYoFryKN6Bs
         ev6OBOO4a5s+as/koAPH0YiZ1wiEW2djE247D/zDu5lAg0UL3uJRcjaNt6KeZ9al+eCk
         8aWicA/Cn3nRKawhofQQlv6Gj+JtX/cqF3OVA0vrzxSGa6NAQRGntyo6dCB/6AlMrhaj
         GPxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH7ya6JLnhtcglivMDa1L2U+2gY0Afvk7W8UO7EmHT0UPTmG9KF+gMzQyAm2D4pWqwN3si1TnjOJxo@vger.kernel.org
X-Gm-Message-State: AOJu0YydJ2na3jARxmEphhf+wQIKO87Pdu5Ub1wn+aEWdKa3JZBT1ezd
	XxhWWTTtalA6cyZJesAdm48/APmiXqW5Uk07W8eJqEllG6Gt9XfiEt8i7nGaxqU=
X-Google-Smtp-Source: AGHT+IECAqHdUxLOO7rCDqvc1tDCBe6uKr49t2jmybCecdAzqYZXI/qLCRS1qYjcf6huPIkfjJc/LQ==
X-Received: by 2002:a05:600c:35d5:b0:431:5f8c:ccbd with SMTP id 5b1f17b1804b1-432b74fda62mr186930795e9.4.1731511864479;
        Wed, 13 Nov 2024 07:31:04 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1b75:191:f7eb:da75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d555908bsm27731205e9.44.2024.11.13.07.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 07:31:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	warthog618@gmail.com,
	Luo Yifan <luoyifan@cmss.chinamobile.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: Fix several incorrect format specifiers
Date: Wed, 13 Nov 2024 16:31:00 +0100
Message-ID: <173151185739.90976.16408170612410991805.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113021458.291252-1-luoyifan@cmss.chinamobile.com>
References: <20241113021458.291252-1-luoyifan@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 13 Nov 2024 10:14:58 +0800, Luo Yifan wrote:
> Make a minor change to eliminate static checker warnings. The variable
> lines[] is unsigned, so the correct format specifier should be %u
> instead of %d.
> 
> 

Applied, thanks!

[1/1] tools: gpio: Fix several incorrect format specifiers
      commit: b6621b1d4b1d0459ba6b49c0bc498c352ac115ab

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

