Return-Path: <linux-gpio+bounces-15704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4516A30634
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 09:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C30977A163B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 08:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2781EF085;
	Tue, 11 Feb 2025 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LN6yQShF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D220018C322
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263642; cv=none; b=sP7/ZhCHV0yqqw/hGk2sPzCpHv8c9Xz7OoNpcero4nuCdl0n3XkzsP4YdVy0NjuEhq+1Tudn+SBWj9YASNfc4MYi9pom5/i3yOXrKX2qhd+pRH4N4ql3knvfP3w6VM58dQjM23Rwcv8s1KuAw44A5fonFAdBS/G4p/JPdNavHWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263642; c=relaxed/simple;
	bh=iVbYYrqQ1mQ2Cprad1R2LJ8AdFTnuFSA+3S2hz0qL1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSdpG+5sN6IaDSu/s0Qk4+1URb8+1OSU+AmzrJ9pu1ZVRbWUeAzVDGU0jKGhC3nhnaZfi9LTJOeC9kXcbduGTKH4jVHIIXn9s1TzXpOO3YoIrJ8iAu1NR/uLaSc38AmgrHQ6QXlGn0UXZ5vX+ak1qQXrwoKNTyU/HV4478wyiTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LN6yQShF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43934d6b155so16110125e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 00:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739263639; x=1739868439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df8JKoLn0fhsTN66htWgdoYItZqEDiJiOAcY+N2P0cI=;
        b=LN6yQShFWtXNGZexoeM3N5Q3OO9d4qjrWFKugYfqRgOd6DY/JxwDDIi0HMz8lDehxG
         m8bHaQbSgqOzuUppzxdT7Se96YlrX2KyXN3qI+qTSLZgqGwSN+EMTxTZeUJcPkUNqQ2z
         8rLRQVrLKUMjAqcFATsCINIdTAnKkwUA8LIPsHKx2qTG+2T5Vw2B2eKgaXHv8JvJ7kIh
         NIRPthAflXzjJHMbSzpWWC4LCsWXK3KP/LWpu6fNvKqv39ngJy5m+BVYb1hM9549yClP
         77WevJ+RIOaupTSNLDjOgdWk9sE5QwRlRpKT9/OwIB+ECNT9HfFEdxwU+zobb8VXSbAd
         UbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263639; x=1739868439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df8JKoLn0fhsTN66htWgdoYItZqEDiJiOAcY+N2P0cI=;
        b=hC6rhtXj0RqQ+Nfh5Du3S2s9fnuDAafKUc/aCZ4HnyqUev0RHTLc/FT+UnciVBAZKu
         XP6iQo0LzU7UfNoat4I+g7xICZlbdG6QIT18JdoS8fl/nvCNz1awuyrcMssLHpTRwMzc
         3iHZUjC9nQP+hc5ZQU0n8CVxRgFpkaNU/2MWj4Wz8F2NTjwfnxsCvbdLc+VZA617DCpe
         AINd7DKeq5+113Ic1wDgjXp/IQbousAaBQyC44F2InYAbBZG1FIQh8myE4At8CeLSIsp
         PLqTikJCCxeo3723ejOkWd4PHm2E7LyaAz40RbqdYfCWLYh6rZ/bcILbj6Z0XrLb6TkC
         bfJA==
X-Forwarded-Encrypted: i=1; AJvYcCVpBSC7h9jEVsj2M/8v91mCBWU9dORMKwxdVUnnPJW4EgXG8I8LduDqjKbfSL+QHgu8cinjaiXhNZc1@vger.kernel.org
X-Gm-Message-State: AOJu0YwTsEyRrQqRd7dh5Lmg20DvRp5RbasLGoItIlg7JNeHA9Ki17yd
	DkGLe3hFunSiqRCi4hnS2+jjAphX9fKSK+XTP1J09qk47fnRQ8572U3zUbtaDRg=
X-Gm-Gg: ASbGncvpCDeGExr7we3Sv594tAJfGVi5UQ8rYwXGPdmqF+fuxKWqpANx3Y/T5TcYHyb
	iYgKSLXappTNInMvf3B/fQLsvxN9H26xWTJ4IaOMfFeZwgR2F/OwgAVoQP+7vu/DJPnRjm+fvbx
	7LZ2+CGKiGzWRV+e+lTL7dvrp8Ospiq5j5xjWhyBpkb8Sz/uWxC3qvUP9p7widuKGJOxeWVBSvW
	512iiy0fxO5ZjE4uJ1TBzrvLX9iIjS8n9XWzvz4GPozKCRsongUXN+ZM09UNOEMZ4VoXlv04LFd
	JDcyXConvnN6fQ==
X-Google-Smtp-Source: AGHT+IHS5iecuSebrclyDRAqCak70aSy0z/NxeoRyYZysKxGum0FCkMgqNH9w7KekV3YTd9p0vVLng==
X-Received: by 2002:a05:600c:450d:b0:434:ff08:202e with SMTP id 5b1f17b1804b1-4394cec568fmr20495795e9.8.1739263639156;
        Tue, 11 Feb 2025 00:47:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394136fb8bsm66203415e9.29.2025.02.11.00.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:47:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Artur Weber <aweber.kernel@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/3] gpio: bcm-kona: Various GPIO fixups
Date: Tue, 11 Feb 2025 09:47:17 +0100
Message-ID: <173926363532.24083.14747999688184181987.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
References: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 06 Feb 2025 18:45:59 +0100, Artur Weber wrote:
> Fixes two issues that were preventing GPIO from working correctly:
> 
> - Lock/unlock functions tried to write the wrong bit to the unlock
>   registers for GPIOs with numbers larger than 32
> 
> - GPIOs only initialized as IRQs did not unlock the configuration
>   registers, causing IRQ-related configuration (e.g. setting the IRQ
>   type) to fail.
> 
> [...]

Applied, thanks!

[1/3] gpio: bcm-kona: Fix GPIO lock/unlock for banks above bank 0
      commit: de1d0d160f64ee76df1d364d521b2faf465a091c
[2/3] gpio: bcm-kona: Make sure GPIO bits are unlocked when requesting IRQ
      commit: 57f5db77a915cc29461a679a6bcae7097967be1a
[3/3] gpio: bcm-kona: Add missing newline to dev_err format string
      commit: 615279db222c3ac56d5c93716efd72b843295c1f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

