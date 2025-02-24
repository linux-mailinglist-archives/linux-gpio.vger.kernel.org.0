Return-Path: <linux-gpio+bounces-16494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B744DA42265
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B05583A7F14
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 13:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26A4136327;
	Mon, 24 Feb 2025 13:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C9QenuBo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928D72571A8
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740405544; cv=none; b=H4bjUqkojEytSapFOat96/opjjTS+7v5xvvatvkXGoesyfrV35L9UgUnmx4hcx7U+POyjD/x0yGtELQNdZAMcpZYQ1yJkzK7p69/m/zmxLnukUPnuH62l5u4jwiriUOO9OjwxM9pV1TzYOLauGdZmt64GG/doUHDPFrdB/J7W4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740405544; c=relaxed/simple;
	bh=KJAjATzJr8jGQvQpU1dCW7Hnx/8ze/nn6XH4TERPhp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCaopGKetJ21UUiCFzm8EwfhD9O+t5CTHhoIkrs8Xb/fBf33RbMkpksL5ErfrQK5waXy2bDr5xudZoZJu7b/96pjsnRyn7zyDnZRyk6sD0r+3ksUXlBppu2z5rx7Elwk4XrliEINWqcqAaZZvF8CetAgdm1zpWj24DsUuHql2XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C9QenuBo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so31694105e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 05:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740405540; x=1741010340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwQMQDOZfV3huFqPSokcnS5jFHBZg9nLFIfYzvl2178=;
        b=C9QenuBo5XASCmDniZKNqRRDx1lpM8qoHX9x7wfXJAZ0oWEXud2I40E8w50toWsmtF
         epGIDe81HsJoQMIDsvRDLEerF8/FodrPLkXp5Xa7FiVARpM5+jEIe8lsWGZgcmCJ4at5
         kjvXuE8MD6kC41dgAIZ3x9Kake+jWW6VLudcFeWfSOrP8KDR3KyhNBEVNbc7GphioQU/
         pU464xJJuOeFRuNZTt1Z5U5T7RU8F6KD8wspbkQWy2TzgrKE8Oh1GZ3mIWnAlydq0JGs
         JmZA/rCqxJMS6c/c4lvUwYoQk4W7BN7ZowN+8NAgxuWMozF1pNnwycFnhaVpzA8lenWh
         de3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740405540; x=1741010340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwQMQDOZfV3huFqPSokcnS5jFHBZg9nLFIfYzvl2178=;
        b=sADvSbTuzfTOfQwvp31oPZtUO8NFBzuizuSkVV6ZgTp5Bu2Zv5LQwcmRQ87kJzF1RF
         FKfagyJRDofQlxV6O007uFx6oFW3rGuBweoYOLAX15rRy+mwV377HGxTP7d293zGEIkj
         UzNNDgOstwBHmNnexRUphDKiZpkZeJslgDltlAAKOUh1DLBNaRzoK5g8vN0PD3elOm47
         qfo1+wiiHOMV/RvVpsEdhZl+UUHSM8TS9HgaMgAjfDVKZWeLE0Z47nHvy1Unq0zAb2bV
         UTRtjfvo5oiOcgfXy3JgDAy1cI0JKXOoRSYsLzYHeAFG7fhGvq2L5hXXMWs8Ygu21Apj
         eIUA==
X-Gm-Message-State: AOJu0YyL15o1bJ9yz3WKLHqzuPHxfwcdaNZCBJev74/aIHwthcW1MI5N
	VuYMk3ti82ginQMakuocbedloMYoc0th/IB7w8yFNmeutvkfCLQDUMYn1ryO4RnopLt968p2r6m
	I43M=
X-Gm-Gg: ASbGncuW+ejstHVmEl1347e+AaNWzUrJFtYb1cAg+41wj7LC3u4fr+8BvoVgAkdhCpv
	g4h/alVBEFtsIkL7PaW1h5+gjmp7qoSTaY5EyOMSooi3AafGAIg/tOpRSl0v12CyR1/2vwoEFaN
	FsNxLKarAa81J0FfpeKzYOOS3D9OusoOy98UcA+Ue7ylisH/nr2K9lVydc8CQDkeK/90JnxjOiw
	TXRuyVgYWdQJULnbkJLvRrW/60gij7ugfLj2F3pfMiKTSo4NXf8vyiQ61kvp3Of1M5nHpuEjfd4
	Mfro7OE1JIuy6Yy6npcwRNEX
X-Google-Smtp-Source: AGHT+IH5Jq0uXoNvpa8b9PRdgJON3IwyYfWk3fQO9KX90xo4mvjpcxwEFrV7a5vo2KNF0wJv5+V04Q==
X-Received: by 2002:a05:600c:3548:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-439ae272bcfmr98738955e9.0.1740405540468;
        Mon, 24 Feb 2025 05:59:00 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:eb70:990:c1af:664a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399c4e3b1esm114523185e9.1.2025.02.24.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:59:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add synchronous fake device creation utility for GPIO drivers
Date: Mon, 24 Feb 2025 14:58:58 +0100
Message-ID: <174040547574.48618.1949653889364615138.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250221133501.2203897-1-koichiro.den@canonical.com>
References: <20250221133501.2203897-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 21 Feb 2025 22:34:58 +0900, Koichiro Den wrote:
> This patch series introduces a utility for some GPIO devices to reduce
> code duplication. There are no functional changes.
> 
> In this series, only gpio-sim and gpio-virtuser are updated to use
> dev-sync-probe, as the current gpio-aggregator does not benefit from it at
> all. A follow-up patch series that introduces a configfs interface for
> gpio-aggregator will convert it to use dev-sync-probe as well.
> 
> [...]

I don't see any further issues and it passes my libgpiod tests so I queued
this series for v6.15. You can now base your aggregator work on top of my
gpio/for-next branch. Thanks!

[1/3] gpio: introduce utilities for synchronous fake device creation
      commit: eb5ab6ffb4ca2d28121455dd7452061367ed5588
[2/3] gpio: sim: convert to use dev-sync-probe utilities
      commit: 2f41dbf9cb84349f510ebf2165c13102f79a550b
[3/3] gpio: virtuser: convert to use dev-sync-probe utilities
      commit: 45af02f06f6943d73cf9309fd2a63a908b587f57

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

