Return-Path: <linux-gpio+bounces-16611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C500EA45B87
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 11:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBC913AE24F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 10:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF6624E003;
	Wed, 26 Feb 2025 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CXc3Vro9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37192459F2
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 10:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740564921; cv=none; b=R/ioGWRphxqAKvJ/aGpiNUHHX6y1g5SuAOHUt/33HsOU0kBgiLWPXg35CYUAIKFXtWV5i1PHp0ZFCec8bLfdQWJn/pY6wbkUPeQf/lZK0Zltt/21cEU0pI8TP2q84jSQaieb6OUIifOB1eeSDYMd+VCnp7VRNjq4UuRUcngCjCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740564921; c=relaxed/simple;
	bh=lmaHsdIjyeoXwlxTnbkpP3HL5d/owFOlMVcngpMhhDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNSZyllRmRSxAnDy3ZK6b3FwixYj1lg0CQUx2bX3ebWrwL1s4fEg8h3GKv+f5h7xHGkAueLHnQD8P1X7RpEw6IKIxhkZfA5ZkCOVvNqiQmyVIWYfbfY5wNxFETWW/lWGwnyCmfgAWUYaJDA8AotuUR+0xbZkt3UZbooG2JJppuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CXc3Vro9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4399ee18a57so4203175e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 02:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740564918; x=1741169718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGbaXyM3Jpdsq99NC8sU65wH5v68rhdD4yTSLXIyXtw=;
        b=CXc3Vro91izrzt3YQpCK1JQBx/6Vew++Pzjw8KHw7u3j9hlCTZSWlyQKr9UosR6Ldy
         5NHxJPliUZH2+OQucmujYc/DH0IXAXFB8s1XMCa1v+wJd9KpXT6GzD7zy5YXx6zqIiEw
         444rSIoV4jTJf+HlvqLt/xc9meIWYkRKWEz5wH7ZHwFiAxpxMwMuVtnyg91dStWa5oH0
         B6ki0obMcW0dTTN/YO1RUNfKlW3XMOR/Msv8SSd6pDCzyIa/erAxMpc7XIYEMfpy9avB
         Cak1HrQNYuEs9weOcSUgJvyuNR28Sf8QW+FQ94T0CM5YlsHaLJ2at4tN6ZY8ogHY9h6p
         8T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740564918; x=1741169718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGbaXyM3Jpdsq99NC8sU65wH5v68rhdD4yTSLXIyXtw=;
        b=YhMGHYN7jt9bEuc/LLVdeDQMnC6aN/XM/I82sDI+JGil150lBTrHoFJd4vivqzT7wN
         duo7fXC3ahWMVOsvYoYomZ6pBbZfrYyI2ppG/39mdHV1cTM409/qhfSUsbon7Su6HSHc
         oxiLxCqzYMqEB0121+a5SwKmKZgIzhlpYqeTYwcXE1sqK0qOlgPguuUHPntT89PwsMdg
         Iu+r9v1hpjTYcQJiNcNVf6ANCAioBm+Lse8QplegDIpgSnQFzs2J1HCYNmzVNeO0AIw2
         Mmp1W6UR7UYDa3Ee05MI+03dX4W6GHYhEf+DACBtvr6x5Qlp4JWpY5JsiFCVp5BzpWyt
         akYw==
X-Forwarded-Encrypted: i=1; AJvYcCXErJ4ROB0hX0+6yJeZIWmyXHm+5bBpER+yGN7GUqdOQc3u0CP5xsPeC/zKqAXJYf9lMChkRDj4szRR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+Rpln4Gco91FHIXvTPadPsJdxCF0eKZPzOVXIThdsBNLHzY0
	o+atxfwIWEoRVmASt5G4yOJM3vFqK8MwLWmziamte92ksM6PdvwjCqnnCG4psxE=
X-Gm-Gg: ASbGncs6ocn5+RRbxSLUQBQO5iHOkmyiAEypxH4YW7cTBegwhsaR/qhw3BDdoHtRAhI
	DdC0lHoANnmF6shm78vjEGULA4gbGz+9OZ0OBdx6PqaFX47GnfOY69Ffg2MyQbEuZzIeRWVPWxD
	TqBAhcmSlHceu6KE8LlhbZfuHv1TEH18jNCewcQ2uMCjLjt4de3zNqmniHRg+PWzyzuE6rgrA7z
	dbEr7EtR126RZI+b3lJeSlKv7jK5FVRWQ7oZHqSHgPgNHZV0OT2AZUsVuUPXMNvVQMxrmVqNYBk
	Jf4Bn3A6K2wcPB3Pfqp6AmQ=
X-Google-Smtp-Source: AGHT+IHJ1cyASwzwsO+YvriZVv8hoDmiSBsK+ybOnr9953bvfTy7VHWnbh89iSzieYU/NqrxhGQkNg==
X-Received: by 2002:a7b:cd8b:0:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-439a30afaecmr221385665e9.9.1740564917888;
        Wed, 26 Feb 2025 02:15:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7d02:26:5770:658c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fc1f9sm4924418f8f.88.2025.02.26.02.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:15:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2] gpiolib: use the required minimum set of headers
Date: Wed, 26 Feb 2025 11:15:15 +0100
Message-ID: <174056490934.34383.5628472134451605193.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250225095210.25910-1-brgl@bgdev.pl>
References: <20250225095210.25910-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 25 Feb 2025 10:52:10 +0100, Bartosz Golaszewski wrote:
> Andy suggested we should keep a fine-grained scheme for includes and
> only pull in stuff required within individual ifdef sections. Let's
> revert commit dea69f2d1cc8 ("gpiolib: move all includes to the top of
> gpio/consumer.h") and make the headers situation even more fine-grained
> by only including the first level headers containing requireded symbols
> except for bug.h where checkpatch.pl warns against including asm/bug.h.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: use the required minimum set of headers
      commit: 007094c83872ed33c1d9e39b3ef7168d85a3f214

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

