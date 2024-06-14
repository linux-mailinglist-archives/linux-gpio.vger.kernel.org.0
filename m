Return-Path: <linux-gpio+bounces-7440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AB090843E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 09:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A2BE2836E3
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 07:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CE31474B5;
	Fri, 14 Jun 2024 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MYlL8iEZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDAB146A90
	for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349337; cv=none; b=MWhODEniYKJKvhhPnUydkoImdPNHLXAMDTO54k+Y7XQF8Gqfn2TG98CHO+2Wmoni1gMiwLSc4IQS9uhhdSz4+L3KCke/2esfBAo9JMedtEUsgo1YBoy9uP75W5bKgakjaQEUekI5JJEsFv2/LEEssTkWyOkEbR2spEwX3PNeSKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349337; c=relaxed/simple;
	bh=w1tIP1ZAX3zgXr75I5+0iBdwboaTgLkumsxFyIIXU9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DMwrxX0A72OhPpipRVs1UiBa7CQtsyI8yX/qiLTwL+Zdja8gX6CHshhdBTtCRpfkSKAzsEFq/M7mcagDIsxGUe7r71sajQJHcEQnNZLtlwjeDbt+TYbBFZkFACpeAAcIJ4PvVTEGQsWbkUlhv6rxHKFnaCd22dJAo7vqhYXU1gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MYlL8iEZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42172ed3597so11450795e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 00:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718349333; x=1718954133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWxaqyzMmty2X0CllBIN4vvbBGJjuoyCos9bG6RTIXY=;
        b=MYlL8iEZ8DXaxEhhc1SLlleNdB4+4mGCqNp5F5b4NbvmGuc0yg0O17GL40ojTBKa/t
         yoqGvAAmuAoCD9KVP+VTNun1oB4w8wlxG7kC4ZL0YngC+Jws7808DI5N+AszdLX1wl9w
         28lSbhWZdSLieKD6Vkz0bcFULybG9Xx9z9zDZTWCBZ4NUupAXn8VZ63XPsdkLEtTz7B5
         KNHZCoSXP2cx/PVRa+140hEkFcBWcWE+S2K/xfsNdJB6bQSGIjj9Y1fXDOq5WvrvZxqQ
         rd5XiwA0b5C2YoyLbYqFJeXiZtoIWKS7CqfzNbKzsT/Lh4s+2AMPfKX5ptZYBZlox94A
         Yihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349333; x=1718954133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWxaqyzMmty2X0CllBIN4vvbBGJjuoyCos9bG6RTIXY=;
        b=g+0Rj4KZTHLSg1ZFwwofUelyl1393LqcmNqhJRA2yxMn+cZamD4a5avNU/tU9jhSOn
         zXYO+9Oz911gxo2IzA95dR5eF9gGY7ur2daMn+xBhsVAtNTGcrKTeyyfwCn35hzCWXQw
         peoavnF/43RZpsen3QqHvjT0R5zlmZfN/UfGVl15/TbqZHV0MQJHAbsyE8CYM7guIEnk
         reGuB/BMIgYBWDBMwmqfsfTsXK5kRV2/zuM+oyfQ12z8X5uq51baP6N1+r07qL30nGWM
         y/0KreDUVpP0LnQJ9suq3gyBeViVftVLsJIuKFTXA0lyCpX2CJDFYnLcUk1XA4OIUS07
         xPQA==
X-Forwarded-Encrypted: i=1; AJvYcCXfSKH6+LDwAekiyh8l6a3Odw7NGePERBYALtpdgzz4wMz/g4uUXgwU3cJroDEuCslJrQw0ewIHlPqIQjjtrperJuJJdlGZOiAi3A==
X-Gm-Message-State: AOJu0YwcAQzg6Fodgf5FQG8iN0KH6TIh/kq9gR8nUY+RKJl8ew7/11+l
	BiqHLRCSJkQlDb6b2Quz8/M1DpUVJoytwjcJk8ThqZclVS8eaGpmcixGippwCqM=
X-Google-Smtp-Source: AGHT+IFjYFJI8hmhx69oWOi1nIoazI0X/FyGuUtdE43izG8eBRnEKz3Ov7qpH3BlwHZRyGZ3kd0L1A==
X-Received: by 2002:a05:600c:1552:b0:421:def3:b0d9 with SMTP id 5b1f17b1804b1-4230482117emr17626415e9.7.1718349333416;
        Fri, 14 Jun 2024 00:15:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:6155:d3bf:61c:c4b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750acf32sm3528967f8f.49.2024.06.14.00.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:15:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: put gpio_suffixes in a single compilation unit
Date: Fri, 14 Jun 2024 09:15:31 +0200
Message-ID: <171834931757.6326.8605051498855992570.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612184821.58053-1-brgl@bgdev.pl>
References: <20240612184821.58053-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 12 Jun 2024 20:48:21 +0200, Bartosz Golaszewski wrote:
> The gpio_suffixes array is defined in the gpiolib.h header. This means
> the array is stored in .rodata of every compilation unit that includes
> it. Put the definition for the array in gpiolib.c and export just the
> symbol in the header. We need the size of the array so expose it too.
> 
> 

Applied, thanks!

[1/1] gpiolib: put gpio_suffixes in a single compilation unit
      commit: 7e92061f1e9d1f6d3bfa6113719534f2c773b041

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

