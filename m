Return-Path: <linux-gpio+bounces-6118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185C8BC26F
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 18:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F8991F212B2
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 16:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28ADD374CB;
	Sun,  5 May 2024 16:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="piQ0BGO4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A833D76
	for <linux-gpio@vger.kernel.org>; Sun,  5 May 2024 16:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714925978; cv=none; b=MZ6G62U5zgRVuTMQsIcZr4rmskpYYGoRskgSsrK0b0pnixZDlXYTFt+UA7+IaIPkQWy5oDhrcLuMdcSXyO3nw7+cuMRcH9nx4GhdhV9D5ikgyhJYk18aFYNu6KLfaIEXy503u3GbAVU0emx2pK8e+I/ddbJQR8x+hWwgBs2iWS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714925978; c=relaxed/simple;
	bh=RFackd8CzHPM4xTCVZKQT+8+CGGZAwk0B+QJ9PiYcSU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fP9r1wz0mWDsMc2quKyrG4vbxPOwLNl7qqsoKyuUfLfsSdIvg1aAM35FEamAVIGpXznk7n+3n+X1EhAsHY/ItPVHk/Y0qKOlNpIpI9Rt9DvKEbWgf00MMzWHh4nK2Rp97rAKyC+vZpFPOaBTJ56yeEwUCNEp2D6bisbMCp1JEDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=piQ0BGO4; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA97E240004;
	Sun,  5 May 2024 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714925969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HTpUYpq1nrJySXPMHOvjA0XV4DIyXHlcLJgIyGIEacI=;
	b=piQ0BGO4xj7BdxGwI1e1O2BxVlJmdFozdq+hha72YfHUS3e10wR/rHRVys5hvQMnzfgjUz
	mcggyngvqfrt7MzSvtvwJowyhAwFmwZOECZ3b0l5uQbvpuM1M0fFfPKJovQpJwwR1hzw+O
	iglRcnsvS/nBvrSFwYvwgoImZZKAkzpfOP0W4T3Ni9QzDK2e08RK9P/CurnmXP8LAck4PW
	hZqITutguCfgOINATsVTR5voWw+eG2EaZKORGLwwakEnTIckkZ7+ktQpgkg61ek3eaS1DJ
	BPiYFppTO77YoLHrBB/hpFlu33bqNiPU6teoSblZjCC0ccR550Em8ec3PdkqSA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus
 Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] Decrease the usage of global GPIO numbers for LEDs
In-Reply-To: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
References: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
Date: Sun, 05 May 2024 18:19:25 +0200
Message-ID: <87v83snsdu.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Linus Walleij <linus.walleij@linaro.org> writes:

> Fix up the orion boards to use GPIO descriptor tables
> instead of hardcoded GPIO numbers in all board files.
>
> git grep 'struct gpio_led_platform_data' gives a list of
> suspects. We wade through them and root out the use of
> global GPIO numbers in favor of descriptors.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

All patches applied on mvebu/arm

Thanks,

Gregory
> ---
> Linus Walleij (5):
>       ARM: orion5x: Convert D2Net board to GPIO descriptors for LEDs
>       ARM: orion5x: Convert DNS323 board to GPIO descriptors for LEDs
>       ARM: orion5x: Convert MV2120 board to GPIO descriptors for LEDs
>       ARM: orion5x: Convert Net2big board to GPIO descriptors for LEDs
>       ARM: orion5x: Convert TS409 board to GPIO descriptors for LEDs
>
>  arch/arm/mach-orion5x/board-d2net.c   | 16 +++++++--
>  arch/arm/mach-orion5x/dns323-setup.c  | 63 ++++++++++++++++++++++++++---------
>  arch/arm/mach-orion5x/mv2120-setup.c  | 29 +++++++++++-----
>  arch/arm/mach-orion5x/net2big-setup.c | 21 +++++++++---
>  arch/arm/mach-orion5x/ts409-setup.c   | 25 +++++++++-----
>  5 files changed, 116 insertions(+), 38 deletions(-)
> ---
> base-commit: 4cece764965020c22cff7665b18a012006359095
> change-id: 20240423-gpio-leds-9d584c9a8659
>
> Best regards,
> -- 
> Linus Walleij <linus.walleij@linaro.org>

