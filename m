Return-Path: <linux-gpio+bounces-8726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364A950048
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 10:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE77F1F21F67
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 08:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C743E74063;
	Tue, 13 Aug 2024 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ujs9I9e+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94E0249F5
	for <linux-gpio@vger.kernel.org>; Tue, 13 Aug 2024 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723538963; cv=none; b=XacY5IykSnnfSWOTSwwU499fjXcTuG1ooePlNcQqXtdBy0nCB6VGoxgnz3PjjJpkaviFIY7vl0+PKulNJ6JZRlHzRTphRXztxoRDfx2UDr1artEqGcW3RCSZX/S1HTqCXv3ZORj2RzbYQDJVdrSadNl4JB5q080MCnYh++fEzXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723538963; c=relaxed/simple;
	bh=CvhaJ0ImRmB0ZXFZK3VZjf8m+6sdEv+vznmzQKJ7OgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZcSprZUFliN/dM01bbxUSaVOsTA/VfEAgZksx7Lx1vDljr+EG28/jQxYBfdyRiO+hZrjEtyczMKM+gS5fxwXGxm9q1/Dbkd9x/DDsi6HnKfB55ZuRFTRAPH1Cxyo3kflrpXWW1M6DUpQ2D35t8ZlHrQouiW1uZJ++Eq5oVPp6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ujs9I9e+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-428101fa30aso39554715e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Aug 2024 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723538960; x=1724143760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjTqNqxIyhpJRbUq7+lFXFq+Pzc7eQwT5dYLHqlco2c=;
        b=Ujs9I9e+6RWfDkR/lXhOFIP0kP8xZnsnHUMsHu26d4Ap3d6JVlABwNNd36rWNk7XHO
         lVa3RN3cjZVySXrFiQMizHoqqq+loLGey6WLvM9wzmnxCvWM8TG2nGA1gCS5XPJvD4FE
         9jjx6NFmEbKw9Je+pbMkyXQVmcsQXD+E3zlkxVG/tmzetEg1kX3En5BIiNloRVsm/o+Q
         GbQ4IDX7UllKqDNYXt99/iYzUuM+PETFifZxGmjrK0xi3RuhDXN8HV/glJx8xPkg+Otg
         XaGAWvKFZLkfxrtAHvCEBMPPzAOyMRNZ89aT00jpaedIeEfpxbHd3YnIJB6N/mKsNsvP
         I/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723538960; x=1724143760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjTqNqxIyhpJRbUq7+lFXFq+Pzc7eQwT5dYLHqlco2c=;
        b=JOf+/leTD/HQog0T1oAyi7RpaGdyVkf+kDllHdHteonkz51v5egAZWr/lvSwDoZqiw
         4Ksr3BR36MoXqV4iq+HofD2km3ubDP2wMQQ1ICeFJMxuhukaikHk81XP/CgMNRq2ut1T
         hZHtzY+BAoF4WXWSboL6sqzpXRk2Zfom1vnh+tLErnZD1PXBzeqj0fQGRJluqwurs7eF
         /mUpp8yySI21G6jYz3hMHoroEhioQ9LXTLPiCs9ZG+gCwjcvhkA+Od7BddvkwmyibUfK
         /cOR0w/ylMGosYaMr8hF1BMwXQMwiaLanO54LPrEjOX8zGC+zAwszg1VXvO9rr749Brj
         OZYw==
X-Forwarded-Encrypted: i=1; AJvYcCWsHtBtGPtscy/Aiwg8mGAadWW3YjuwGeniIoIheNql3keWwwHrh0C7Ey7M9bylA2JmPEPTKy/J+1om23/Dk/TVFDJ5pHKj1NyUjw==
X-Gm-Message-State: AOJu0Yyf9oSdVS5qLQ8WVXhO3lUH1JzMtmS0v3/0QrPrR74cbvo11gIB
	J9ZVgjVLNuUZfntX7DjKEYxakXIqViAlPXgHEr2J2KoSunXIE36bnUw5rGOmQTI=
X-Google-Smtp-Source: AGHT+IGjOfKQAXg55ea8E0LCrcMR84v6Ojblt2IrDaBNoGcJ2dLWvrHx130HpueWBASExMAXKu8oTw==
X-Received: by 2002:a05:600c:450e:b0:425:7796:8e2c with SMTP id 5b1f17b1804b1-429d4805ac3mr18701295e9.12.1723538959591;
        Tue, 13 Aug 2024 01:49:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3979:ff54:1b42:968a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4f0a7111sm9588091f8f.117.2024.08.13.01.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 01:49:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Philip Withnall <philip@tecnocode.co.uk>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: Re: [PATCH libgpiod v5 0/4] dbus: add GLib-based D-Bus daemon and command-line client
Date: Tue, 13 Aug 2024 10:49:17 +0200
Message-ID: <172353894852.54186.8243553925278671329.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812-dbus-v5-0-ead288509217@linaro.org>
References: <20240812-dbus-v5-0-ead288509217@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 12 Aug 2024 10:22:21 +0200, Bartosz Golaszewski wrote:
> I'm resending it once more but with commits squashed into how they'll appear
> in git once applied upstream. I think the code is in good enough shape that
> it can now go into the master branch and any further development can happen
> from there.
> 
> Big thanks to Philip Withnall <philip@tecnocode.co.uk> for his thorough review
> of this series. I think I addressed most of the issues pointed out.
> 
> [...]

Applied, thanks!

[1/4] tests: split out reusable test code into a local static library
      commit: e60e38375c7a5b9a0bae99b27e9c5b4d9fe21f27
[2/4] tests: split out the common test code for bash scripts
      commit: ad325c0b650b2ff543ec1edb8f802cfb54a0d6e3
[3/4] bindings: add GLib bindings
      commit: e090088c21b7e52f2f407dddd8d6f113182660d0
[4/4] dbus: add the D-Bus daemon, command-line client and tests
      commit: a5ab76da1e0a7475c42336829c611f438bffd584

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

