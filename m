Return-Path: <linux-gpio+bounces-9751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503B896B297
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9A20B2718F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 07:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BC61465A0;
	Wed,  4 Sep 2024 07:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hq7tACsV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D61C6A8D2
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 07:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725434043; cv=none; b=k90dmic5NvQX/5sh/WQAx/DoR6vtSzppy+SZ9K/qCNrhB6CRl6xyILKc07V8pph+/5yT+B+sYMTiIXs5oi4FbXpwimDz63F+HaEV7Bo5mKLmN5hvXyhysFdQPxAL5qAzavDMDrKmn9WgXXUU3zx7n0f0pI8dCTVcsCRXakfaK6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725434043; c=relaxed/simple;
	bh=NJ9SB/aX3bvQztjlQcLr8iqQrO1jv19h+Xzs+NqiN6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XqDcRT+NJu1YLQkIp4FSJtLzTFJhrWWoLdbDhLpbLRqBwfC2RSJktFYLvX7DBkcCxRwKTVvfbdfrs9Q++X0GBJ+0ER4sfOgMHuAw0StCRUwZQtWOSvyzjKCxPi1g1qvixcI90FZHL7nt4fz3LwcjkqewbkOmFO9ECHlJ24MOxtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hq7tACsV; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c26a52cf82so1131943a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 00:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725434040; x=1726038840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HZtdoUXcKqwpohrchXt3yFUw2pAuJSelVNGLdO7S9M=;
        b=hq7tACsVCeM4nqZYVXr7p8B6JtXp7ncwMYSRPjS53o/k/w7+kkMs9cwaIDGv0zyPdM
         qhwE1GTnuwkGiD4MjYOK12c9nhZINwwQHksEF6zD9bI80BSQc9rZKmmRnKDmTWb+KDGp
         HzmkViW4SlQzCcs2Iy9ItdxvcR/aQd874D9YWQXAUWPko8wBFE2TRE9i474X1aVutygh
         TIKH7+RRdKJFLecPzYSJ4zIW0fl6cUaawt5of5Rs3SQP/Z5Ye9wGwyJtcxZCWVc2vaHD
         D3UUmeD2o8s++ESR5johCzi1x6+B9N/zQhHIdBvqatxwhQ7IskHdjFCMy/vVVYPT/ZVf
         RMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725434040; x=1726038840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HZtdoUXcKqwpohrchXt3yFUw2pAuJSelVNGLdO7S9M=;
        b=bPRSY6Si1jebHdRM2BQuJS0nYcVtDUq/x4bvX5WRjR+ZcULm61jTPS63j9aWnS9f1w
         PImM0w/Ksnul+p1QUV0UV8nFTgV3+GqGoxdQF75zgRx1wJ/ydSsFxCgrloy8PTXsGm+x
         TNrXSXh624bfR+UTUh/iTQZX0wd5b7wfi9YQ8W8hPJ5nGxXVMY7dpjaxvgYSK3/ZR9am
         rgf65as3ppLffRJAsBGMJC8My+CvfO8r4ClUkMQlkR9UUlcpFVYowGSkhRk6EdYo8z6r
         fDWD3YUtkBikz7mIYbjXpGnCb5GCMywkQj1a5l80BuwkBVXvYC9PkYnZT23FME0bw2R8
         gtMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBXf6lZVFQ1jzyXGCVkjj2f2Z2C2Bq0cRg5317AT5TVXQOyZHz1G5FqFbxBf887RgVCOza4pAE5ZZo@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUnLoME1USfwUNGV3gVLS64iCrtXrK/T7vZJS+5i0PK20fDt/
	RsgNtqzPDdAyE00SaPSfPeWQxK+ty7JvRfd5O+aQz5Yitp+etZtl0b1QAWsFH4k=
X-Google-Smtp-Source: AGHT+IHulaUeFFtnEe6u+urEyuK65aq23Dpp2PX81PJyqmCErVFFNvx0CT7lhbt2SXESkKcTH0nYag==
X-Received: by 2002:a05:6402:27c7:b0:5c2:5620:f72 with SMTP id 4fb4d7f45d1cf-5c2562011e0mr7748478a12.0.1725434040172;
        Wed, 04 Sep 2024 00:14:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:66d0:70f:5bef:d67d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a2a6sm7228799a12.7.2024.09.04.00.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 00:13:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: davinci: drop platform data support
Date: Wed,  4 Sep 2024 09:13:58 +0200
Message-ID: <172543401622.8740.5904991065703116554.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819151705.37258-1-brgl@bgdev.pl>
References: <20240819151705.37258-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 19 Aug 2024 17:17:04 +0200, Bartosz Golaszewski wrote:
> There are no more any board files that use the platform data for
> gpio-davinci. We can remove the header defining it and port the code to
> no longer store any context in pdata.
> 
> 

Oh well, if nobody's complaining then let's get it into next.

[1/2] gpio: davinci: drop platform data support
      commit: d29e741cad3f8f41df1834bf74df79380c1c6c6d
[2/2] gpio: davinci: use devm_clk_get_enabled()
      commit: d14f6f405fc7b66b0a18967378a4114054b2690c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

