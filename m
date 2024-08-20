Return-Path: <linux-gpio+bounces-8848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC049958113
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 10:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 885AC281F2B
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 08:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3215618A6BD;
	Tue, 20 Aug 2024 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="L1zCUkdl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07018E34B
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724142830; cv=none; b=JBL8DTRfMF0pRhoZ0Z/iqmYcfwSMVZs81XApvbW8JjHP4rJl5Gohsn6aMqyKLqma8SwCONN5LHjGFL/cvWh//NtfioUV5Gqt2Onq9+2rXpNZ2wiinPOhEsHctydedTfDqA6iDkDEhmFl9lE33l45FBYlz+lq2ErODeRnPumtitY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724142830; c=relaxed/simple;
	bh=1LtjsPFrjjd6hYsPJu9b0vm4sQPyFxCduIQ0ZLAHK1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RmPEHLsOiw3p8V8fdtmV0W/8lc9wFFm6ipX+q3WEWFQ2dwCb940I8hOtvlckzl9beG7RTfDCrMzbdbHaUtEAHby8DE/fWQy21EllxJhU6zo/nLVYL9d44/U+snO2XU7D06j0Cr4y8QezOJB0oPlKg5V/VazPrNNghwHYT2guGT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=L1zCUkdl; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37189d8e637so3125811f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724142826; x=1724747626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEL7tQD7GbeuTlapz5M/BtFYtXhOkUzJpx0LAanx7Mw=;
        b=L1zCUkdlkz0LTAP9emCVCeq6n6u4uoBBO6bRqPp+rFao/f5mLfExKKl7IJUk7m8+Am
         jlnWEFWDmvbE3Q/vQyH+g7mijE5tAmK5aW/6WrtM51j5ApN2FbUCqY/H09YBItlDqJBd
         3XlLv/kQJ/xagDcXqRZG8UNi+Ix305NYpADtwkHuTcxLy+CNoFdMUhfPnGZAnOnA3w5E
         47mRFptK4bSu0MVVWXteFx4HdGQeBPxLdtrl12bT9nabNJZdE6VCB/jN75SFiwQWLIdT
         i68YZLBlrhu0kldvveyhMxqD76oxbO7axOuZmFiuPZ9ql1UZhaslqwXmeScYpPpMnEDw
         5+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724142826; x=1724747626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEL7tQD7GbeuTlapz5M/BtFYtXhOkUzJpx0LAanx7Mw=;
        b=FRoCDxlboVyAgC6org4+dP1f2NiTc7mO8aqRpi7HwAJjW9dEDVYbgEZlKAprwCSCbi
         5d6gFUsyEqOPn+j0p+z/ZloSeFl5ONFzpEmIan5BImZX3pEOLQ8H579hHkpWZTTujUVb
         LGCcYggRMG3co5jvSvRd30Ubkcd5r1jYTO9jNVBjJlKfyofSBlOUHjRHZFZriERkwACw
         f7W+PyVScygrbrhYw/Mcbi8q9XOhPpskNARdHB3fLERYIh9pSsrJgtt7d0ZWh0dnls26
         +RMincOvh2OfCA9Sc7MLiuPdR8MddSLy/Ki8+aefAdWewA5uBPoo+Ya3CM5XdVkz4mb0
         PkPw==
X-Gm-Message-State: AOJu0YzATtxAyqSDAHzX+d/xp/Ky+IfFE11H40BkXhvltAZWa34ogIM1
	fuAmuiyfrnZAb4wDARTmcSZeQvDnVxj0+zBxPRewX9OvJH4ShwMDcAGONmiGe/vJkufpN5A4+Xq
	KXFg=
X-Google-Smtp-Source: AGHT+IHnn/RvdT8xKBMoBdrZ1Ash1eRln9exy4n1RN2NlwHjGcXkKlMk+nXjGb9x8VTio5VKmPJ2+Q==
X-Received: by 2002:adf:ee0d:0:b0:367:8a87:ada2 with SMTP id ffacd0b85a97d-371946501f1mr10050186f8f.26.1724142825520;
        Tue, 20 Aug 2024 01:33:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ddce:8248:19a9:4bf6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a8fcsm12468056f8f.63.2024.08.20.01.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 01:33:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/5] gpiolib: Add and utilise for_each_gpio_property_name()
Date: Tue, 20 Aug 2024 10:33:43 +0200
Message-ID: <172414281950.19982.294912238748441566.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819142945.327808-1-andriy.shevchenko@linux.intel.com>
References: <20240819142945.327808-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 19 Aug 2024 17:28:55 +0300, Andy Shevchenko wrote:
> There are a few of duplication of the same for-loop against GPIO
> suffixes. This series addresses that along with proposal to eliminate
> the exported gpio_suffix_count by converting the array to be
> NULL-terminated.
> 
> v2:
> - fixed a rebase issue (LKP)
> 
> [...]

Applied, thanks!

[1/5] gpiolib: Introduce for_each_gpio_property_name() helper
      commit: ef3d4b94d2d88b160887ff9ca737a5f8ec101579
[2/5] gpiolib: swnode: Unify return code variable name
      commit: e42fce0ff99658b5b43e8dae4f7acc43d38a00ef
[3/5] gpiolib: swnode: Introduce swnode_gpio_get_reference() helper
      commit: 7fd6809888a82055fcca9d14417d5e2675f0acc5
[4/5] gpiolib: swnode: Make use of for_each_gpio_property_name()
      commit: a975a64692c39991fdde2f1d990b7bdd48d183fc
[5/5] gpiolib: Replace gpio_suffix_count with NULL-terminated array
      commit: 4b91188dced811e2d867574b672888406cb7114c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

