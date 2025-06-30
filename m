Return-Path: <linux-gpio+bounces-22391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4136AED513
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 08:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CEDF1634F7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 06:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3821202976;
	Mon, 30 Jun 2025 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xe9xc3Hl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCED1422DD
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266752; cv=none; b=oijTIbRS1RhSUyX641i5oiNHcwcpOS/tybUt66Mi+fMUdvsVi4EJ1QlJXztFCaOsLAp8rLO7AFqAiz/Fo2z/NsLF+brppkJKFOyYfq3Pf5Akc7jalmmdecm0ztXkcx2iM+bYkEk25cgeKqkYlcblQ2pUXysFNSW+CtT8e90LIM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266752; c=relaxed/simple;
	bh=N8NcPPJxadXWse0HT/QBGjpeBDejSpL4abXtBlKXbck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QtBfIQXVrE6y++y2UEWUbAt2y6YcUKdBXo7uBuvRvOx4xuL9eEL3hGj95ZAR2UH2qSnJyfjql8kTgER8SWnJSeUByx9SMYZRy+QzRyG1SAMIPSNWEUIpJAmBXgoviIidSp9YewUAQ0YuKW0K3ZWv3lQKWQiv1F2LD2t2cXm+CMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xe9xc3Hl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a510432236so1255693f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 29 Jun 2025 23:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751266749; x=1751871549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVc+xIvEP7q6mVJvo+SAFYvuaUIIBVDDa8cApMBL5oc=;
        b=xe9xc3HlPX8LXegkX0gjRzPIbtIryZyHqpA6AkhiH9JoKyElnk2aHozSII7rR97PP7
         Z66bhK7Z0gCcsProyh8BE3SZ1y3NI52XP/Md2FajcBcQywk858GIEQwuqM7U0kah5Kru
         N2a/ww2Nqsq6+ymbl4AITOQpi7ZwYSLPS7rAclMKAjd7Mz883MH+5+x5G3qxwSirH5g4
         FVXmkYw6pA9M4A23vjgbfClM5oR/p87EBsk6W9vDpz41TxMwcr6GHm5YH93Z6NK43utF
         x3PdsuFV5ZqMq7YVilgjbkL8Qba5W4lliaRWSOJdjtd9fcYRaXXJfFFe7fJSWAXjHCpS
         HHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266749; x=1751871549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVc+xIvEP7q6mVJvo+SAFYvuaUIIBVDDa8cApMBL5oc=;
        b=wKbVS2vu8Xt+gZIGViqXIkuXNuJEsQlAq742Fbec+DjUwhFrbF6lfA8lcQQdJnId7F
         NpPuFJ140QHy3hwNoN8qqBhmFiEVtueBzJSxTzZsYlzQYx7/aBrlS/OZYcAxVDtVZ5S1
         k17Latud2TEmSJGNd9E3HVK0vF3ks/eNT61rMKTuJsiarG4uMOhaVe6DgXjkc4GeD78o
         +tbxBQUghc+2xRt0gaMCfUJmL6uGcjbZPuInsC27uh/k7U5B1zPZHWoIFlxdAy8ptbJ2
         5nJlhgA7eChKr4+FVBYEYHQC7NsG4YeLYFPy/zt14tbcOeCWG9I7NGzvM3iEnFjrvjlF
         FHtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKfJIBa4BDyliCTtwe0m2nKXzOVEyVjz/Vh3eDFc8ICptonbYOl5WUw40jSEPf9cmvX6q72a/QlRs+@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9o8VBt82hNi48nyU+Ql1N58HimnXtOKweoeDVqtlgwnQHbXA
	BkMYBWoXs9jBiyYWPEVHXKWgz/1nlLMm89A4UxQ+Hb//fJtWxcRZzPEThpfEYgXWfOk=
X-Gm-Gg: ASbGncsnUYhTZsr1swdk50DJGnSSN1G7gg1QrPfEvuimp57SJD0/7bSQf5h9NZDaTjV
	4zcuhhE9KZN1TyhTKcL3aCzTeCe+iH+7gl/uHRWYW972jZuJFzmovw/MBBI7ouJU+ZWDS5BeZHl
	gc6lz1fALyQTgaqMJrLZiLH4UW0RgUMgH3q8UVUMuzitOr+ypZI41im/irU2SFpagh1mRBN3IU3
	1JFvqzGy9G7tNK2KjvAlqISHEhNJmHxaSiTdvZsbqNiIFhKNKaG7tvjQaBS9MXtHeXZB7q67FBu
	zi1esG6BZ45ZUkqsyvgo4at/DKRoUxINTdcMEXm0Xc8zSFuwacb5QKHhdyYYQBw=
X-Google-Smtp-Source: AGHT+IEnf1e311CHx7pGdkMuMp3hPcgdVROv8BNvfkAw7T5EXn7m4sv+gadF6ts7WpBEDZmQ9c71rw==
X-Received: by 2002:a05:6000:2d08:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3a8f435e55dmr7677203f8f.5.1751266749380;
        Sun, 29 Jun 2025 23:59:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7481sm9686783f8f.14.2025.06.29.23.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:59:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH 0/2] gpio: improve gpiod_is_equal()
Date: Mon, 30 Jun 2025 08:58:43 +0200
Message-ID: <175126671926.7549.9629868942672241575.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
References: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 20 Jun 2025 14:58:00 +0200, Bartosz Golaszewski wrote:
> This short series contains small improvements to the gpiod_is_equal()
> GPIO descriptor comparator added last cycle.
> 
> 

Applied, thanks!

[1/2] gpio: constify arguments of gpiod_is_equal()
      https://git.kernel.org/brgl/linux/c/08ad63bbd681ae4eeb50644564435035c38e5795
[2/2] gpio: make gpiod_is_equal() arguments stricter
      https://git.kernel.org/brgl/linux/c/26981e8906bb5c902e2d34874f64ecfa975d28c8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

