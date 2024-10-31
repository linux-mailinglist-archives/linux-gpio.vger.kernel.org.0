Return-Path: <linux-gpio+bounces-12371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B29B7B0E
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 13:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB6EA282C83
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 12:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFEE19CD17;
	Thu, 31 Oct 2024 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KzLwQjuN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3481BDE6
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730378920; cv=none; b=gwR1wBjPkFrnkE174ag4yZ9km8O50rsXBO9Y1gBTr2OzWXCiYZ3dxTj6D2B1O6Mwla6Lv2dcKli8vNQ8aSMfI4KoklSWEY6W/38D90Ok6UdUPQCOg0SPIU1PZ4xSXVSaYlcsZ3f5bQmxgCRraeLY/SHZnBCkX87KzHnyyWv8U/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730378920; c=relaxed/simple;
	bh=M0reKWUfcyegLq9ixRQulskKYs5quxoov7rWeO39768=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t4Rzs/nb/GfteChWlQbPFPHezXHFeTTmtM3upBR94g957NhyJJ3Qi5rlsNhWZffUF6IYlaJaNLwO9TM1JjblZrQXpxMjsFbT8921RyjaB7sI0ByE75A/t64Dnr/r3ThVoRuZfSRhoTnOuomuFvGOKG5SzCtJe3JSXYx/BqiVjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KzLwQjuN; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso713494f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730378917; x=1730983717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOYDvnZV6syILbeaxOHtU8YtDYmWLyONICj3B3tuFco=;
        b=KzLwQjuNZc+ntDn2H+0jKuL5yPQFA7MgJeCRORhwb53Ca6dEHKQKINWtQFDvY2tWcg
         cnsvXWy/VT9woHXKxZRgMleB7Nmou+6YneEDPiA8FXzXUZU71mSNcK6KfuDv69RPmgeI
         N6rzDLxVtGWHaJ6dL79dBHi5m/ZDajyA4g2k8kN8H51JY6dps3APl1InuYGomePAFyhv
         2ffnM0Heebdv0gRcc/2KfjHJzq6FKX46TqbGmoGnTPRRO9cK/kDHnWb21zGL7ApgNdjl
         tV/ZL/W6MPKThK6xNdMW9bTjR3PLckVjXM2PL4empaCEhJPO6x5YBqq6a58hlNlmTXuF
         zSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378917; x=1730983717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOYDvnZV6syILbeaxOHtU8YtDYmWLyONICj3B3tuFco=;
        b=Fwc8e/wDBatjYmyfWZzYTfhmKQA0TtEOZnGl2EhY9IvinD1Z0+OMW8zC9NpnzXRZrc
         7He0z46iwUoINckScTtUdG0DX7gLY1De4uJjgasbwOzh4NHFZASC3N1RjMT9NJLzM5qt
         K4eggbUcCyS0KdRJ7T93amoI/nrzhCyCMtctXBhm/OpFINY/PdhFuM6zrjLoUjYCUgZ2
         4iTfE04MODyPdpOGR9i37sBPjEirhyv30M8akZ7hBzgmbuaWE6PXO7bsXzKDQTFsVeoX
         eF5qSFKi4nUrG9Tw8tH6Adj8uaZNdgBRIthudOScStBSKwfybucy6LsV4scSISnZfu85
         qPwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlxtkYYCv7WzcQT1QL85B4LM4uNrumDtnF/gu3Nfxm36or8pJNaIYGZLz+PEy5LjRI5UTBLN+8k0I2@vger.kernel.org
X-Gm-Message-State: AOJu0YyvJCvLm06vnyNo0Eqk6LBFlh7A5aWurBuj6OulgVl6HcuXNDZa
	ohO1A9VcSIl1RCTcxm2/qQaOmNxNb4w902nXrXT/5ZGeudMRBgf8Ak2419nm+lZPp80D3QJJrmG
	E
X-Google-Smtp-Source: AGHT+IEb/Egcnxx0IOOnCLh1Bt/Pd5bbNyNhI9lA1HiPgMPxGhwZcXGABSTKC3AYRv6dTXj10o+Ggg==
X-Received: by 2002:a05:6000:c06:b0:37d:48f2:e749 with SMTP id ffacd0b85a97d-380611411bamr17935818f8f.10.1730378916912;
        Thu, 31 Oct 2024 05:48:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a6bc:32f9:21fc:be97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e51csm2031638f8f.79.2024.10.31.05.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:48:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mary Strodl <mstrodl@csh.rit.edu>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: (subset) [PATCH v2 0/2] gpio: Check for error from devm_mutex_init()
Date: Thu, 31 Oct 2024 13:48:33 +0100
Message-ID: <173037891200.8414.12711922515308939001.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241030174132.2113286-1-andriy.shevchenko@linux.intel.com>
References: <20241030174132.2113286-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 30 Oct 2024 19:36:50 +0200, Andy Shevchenko wrote:
> Ignoring error checking from devm calls is a bad practice in general.
> While not critical today, it may become a problem tomorrow.
> Fix this for devm_mutex_init().
> 
> In v2:
> - fixed obvious typo (Mary)
> - collected tags (Mary, Wolfram)
> 
> [...]

Applied, thanks!

[2/2] gpio: sloppy-logic-analyzer: Check for error code from devm_mutex_init() call
      commit: 90bad749858cf88d80af7c2b23f86db4f7ad61c2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

