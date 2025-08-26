Return-Path: <linux-gpio+bounces-24985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804CB359C9
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 12:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EDF77B20F4
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 10:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957E03019C3;
	Tue, 26 Aug 2025 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f2UCS8gX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151232F6589
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202602; cv=none; b=VRCe0kQY0AWGXJO6qTfJbCDkTHF0PY3IkEzXCTMyb1IDoZQ3eze5fULy4X/pIpeLHRgSPDn1/9lxH3XOk5/XbURIdjWIPAZwmnZ2tm650rpYVFBmV9A7xemsq9VDFNz0rOCVKdvQLOPWQeFMghenqW7fPMWY6enTxS+5tT6zBiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202602; c=relaxed/simple;
	bh=xevhfAazTddx0rQjEFUdAx6GLBraql1L8NM2pfEwN9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igeKYs3XkftDw0SSN8o0mOk2v6r0+WIbvuMgRfDzcB/beYi7xccmuZP5jg6+ZD7eDQJBPI7/anbMrzWg+PSl4I1Cs2lxLIXfKM2CWgaIUajc4awnZOVhFoZlKBraj/rLbek6Lp06SSnB1KhibRstIXE3sthUnnkqiwPoo2cXcDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f2UCS8gX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b627ea5f3so7996165e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202599; x=1756807399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBqfnxPgAMrsbBcXZi3Cjt/GmjJIAGmLFwEyWU22RiY=;
        b=f2UCS8gXWLwmQ50s+/yR8zA7E1NtlXB8KO2r5YSvL0Z/BZjLZJ8GVG1nfRRnnAl6hd
         87AY4q6/0FwXNBMoVWwFK4L3ymyPgzQ/3W9Xueey1QujBbhDsjaicFjpcSfgfj/DZrou
         MAYztSGCVfZtn3tAixshr5X521wcEaoe0UXPDqdEOQ+TArTeR5ESHTHeyXEgNbiqy4VQ
         gli9Ze+JMMSKP4kMNyXBYnwmhiyCc2ZVnhJgEBoCnahkNW92hdy4NpGAgWHuXYqQzlxE
         e9kYtZ8aGZ0plENB1KxkZWJBscBKGgq+C5xoY1v1DYi2bO4xFRNcMxTXRBXUlQ/WBeKC
         Gu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202599; x=1756807399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBqfnxPgAMrsbBcXZi3Cjt/GmjJIAGmLFwEyWU22RiY=;
        b=kb0qJkGQRjojgmoMcd7fps3IpZuANAJI0ny9+lYf52oH90CjfV7N+iaNgsxF6oCNCX
         Tq+OtqnSIlTM2MoMTzmIAIurxgXz5vacSGrNS2s/odYsGbgOgh6p/6yEnp2NBi7t16IN
         hG27GIh/RyUtVcu5WjRKIPInT2QDKHh1X8F5RQz8v5CdqmSqUt+Z5v7Qj+woqDyVvQ/X
         izgYgRtYgz2IqNl4t/0PJnIU5HzKS0fAZFop7PMBhklnYKXialQPsnnZzM11Dp8USJP9
         kyM3FjFZlisywcttpKqXEQjzPx4xhpvHWWfJAidRMGtCOWfvCyfn/68jD1yta5/iuE4w
         Ip/g==
X-Forwarded-Encrypted: i=1; AJvYcCV5HjlnHDzSA5MREU81Gx0MqnMiJZDwRnBJEtZuux+CR8ur5YkFrL7jABcnehFeo/5AnaLaI0FaQV1r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz67lX6iHysa9Q/mdEoIHCsTbFR7HmOiOCpCiZKJct18C1eNobu
	ubFilDrFs6sT63aXY7axfWs/4drSrHjXeFPCqhdkUP8dqKMHAI8r1edlwaqwwFbvEnGIyrbLHpm
	Y9b2TwUo=
X-Gm-Gg: ASbGncv2tOZRtdBZbEurKkLw2nrcO9B+58D/E1stHOnGU8hnCXA/nn07d9cHgmYGU0L
	WVt0ArPlVRncRz1XkXrxb60EGAeRQVAT1p4Twfe5qF6xXUu7/rYH0W2VzJsaHER16R1a4yCqtA5
	f9ZxRSdnXqR2bWhprrroxG8cg/AtkZtJ34oVJ7vS2fDUjxeYyBYxZ7jpJPrw51RD+OPvLvJCMiB
	bzk8PRfZBgHOOZU9ygrs6kcOSOT9Ld/vnJXv0YnZR+jj0gqPoGYZJ9yVqZUd9aClh972cKNfix9
	n6d7KJtV7cWJkV8HLp/U7fvdn92h48AZaeVsMQfL7iwrq/36G9K46187gTxcPws53xWDrIknsCU
	03TZApbKvLD7F6IASEVngNaIw
X-Google-Smtp-Source: AGHT+IE6TWi8fg6okLLjPcaEFCRB/2mOkzoLagFUTSt4mPmBp6bUoi+XqTJoRHs4NKTP8NhEfIQA9Q==
X-Received: by 2002:a05:600c:4590:b0:45b:47e1:ef67 with SMTP id 5b1f17b1804b1-45b517e8d46mr98883845e9.34.1756202599397;
        Tue, 26 Aug 2025 03:03:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b661cb14bsm13613675e9.2.2025.08.26.03.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 03:03:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Junjie Cao <junjie.cao@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: timberdale: fix off-by-one in IRQ type boundary check
Date: Tue, 26 Aug 2025 12:03:17 +0200
Message-ID: <175620259460.21991.7139337951107127710.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825090850.127163-1-junjie.cao@intel.com>
References: <20250825090850.127163-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 25 Aug 2025 17:08:50 +0800, Junjie Cao wrote:
> timbgpio_irq_type() currently accepts offset == ngpio, violating
> gpiolib's [0..ngpio-1] contract. This can lead to undefined behavior
> when computing '1 << offset', and it is also inconsistent with users
> that iterate with for_each_set_bit(..., ngpio).
> 
> Tighten the upper bound to reject offset == ngpio. No functional change
> for in-range offsets.
> 
> [...]

Applied, thanks!

[1/1] gpio: timberdale: fix off-by-one in IRQ type boundary check
      https://git.kernel.org/brgl/linux/c/810e154d90f44127239957b06ee51a55553a5815

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

