Return-Path: <linux-gpio+bounces-13904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7129F2C9A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 10:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A43B1619B0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 09:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDF5200BB9;
	Mon, 16 Dec 2024 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gv6KZ5Iq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4792D200120
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734340146; cv=none; b=CRgOzfczBs62bh17/DlTeptkHK2w/4eKfkB7wCsyxSJP92RGyvthqks0BuUQbcJXAilaAFvggGOB2Q9gVRYQ9OfBZxuRmTR/v8DMNunY8FqW0sHFvsM2pWeLp8yRfp3z9+dJrfr35q9Va4xNJNjQ98AkZsEZ5ESCy4Z8QwvlvwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734340146; c=relaxed/simple;
	bh=M19509IjZMcFyL8kbGcmsLxqS7khHdG+4BTdiY+Cn3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIX2FTdPUZiaS3naOsrWj+qStTuq4+z/p4MTFPjvZBXUu3rG1UBM0EDJLtXk8lGPGpN8D3uSnByJ1oKHcTrNkP4zRGGUrN+hwKSUWUDD4H0Wh26oej4lYD/Iqn2InZBf7upP0Y0IseefdDLGHVz2IVJbJug4W4YWVNn/n4gXsJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gv6KZ5Iq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso42283475e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 01:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734340143; x=1734944943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGBHS4QHf1CsUcSFjaZXRI9YWCCVYzt2h/iHstQ0laA=;
        b=Gv6KZ5Iqx6fzNhZAU09D/gQSVlFTqh9G8v4OVdBKVEPO4vcVXbBYkJBRG1PecZ3DAg
         R9cbNo+FTpS6IJvrIjPyPf27QfuykBmjyQX4X17Ra4FzSHrf+6gPQJUSwvtia91rf+Fi
         4wnGPAmPVX6SMLGhwjBG4GsfuMfTN9FDbQdalQO115lzwl+IUZujiU8+UsJ5B04MXzKX
         /nw4keWIdfH7xVURQf83yx+eQl6I127uRb7iGTAqX45V6kmtjxEJ7489mD8+c8DSZa12
         m0JunSnVSkD+A9BsH2k31VqBSIIO0QibCvPscO3IQkbe8DDwuHaxie6pePXC2Vbf6BWM
         r28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734340143; x=1734944943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGBHS4QHf1CsUcSFjaZXRI9YWCCVYzt2h/iHstQ0laA=;
        b=VspQ9beQPbv1HeVRGuVUDGswZj7234LncIS2Bzj579tgVp8SFVhCW5CCfJ9pxt85uk
         C8AmyPdgapS06OztX4/yiqKTQoO556kx/89IsgenxmO9gdlOfwh6/YipzycSH+Yu4loq
         BfFK6+SZoAlbDvl3cSjSVVPL4MjiIwibHa/KSfy836NVD8YcYu1w3/ukL8dSOZaqYoYl
         1jNJCBr09zr6j9NqysoO0IkYoQQY7Eeuq76HEX5aD4YUShcoOc/owMKyOwJRI499qzz8
         4cbynSEM3+I0GDWqjPmWceta89LDOKMp4yVipSk1TkIHC9iQOtzBK/vBKOmKCg3xStL1
         wQnw==
X-Forwarded-Encrypted: i=1; AJvYcCVIGBRSElc2m65Ao3u7SckEfRnzEsDJ3sPT405yvN61RMg3Lpj+IWmxd8qH7bcAe07CO4J/m+cpifOt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6alfHxQ0gJvyaySweJvYpSGKrS26oIpWpSKikMHpMVeDZusAb
	nLEU/hoevd5yHCFs0Jhn20fWT7UiAqUPV+aGCEs5325mYBkyse+IPMF7MROe63g=
X-Gm-Gg: ASbGncu/mW7DykvSne5zuR3osI2SY9En9rwuE5p+Xb8FJXmgUrMBYIvB68ayuJwLi9U
	vh95CwTueHDktVNAeKg1WqpdFvOldWnCKQMCmrL9nmYb8SM1rh5aL+jc2JTsPPvH6hiKE4g+hWV
	qS6u/EjJyR4UZx3Umzp6Q1qi/uiayieAALtgwrf2OtsxxWmg43ZREwObTa+pOZoeJCu/hiCxz25
	KgaEfJkCBpELFefEmCSDv1BYhjZn3A9QZrjk4P4zQ6KzTXMTANNMoVJ
X-Google-Smtp-Source: AGHT+IH72Dfr5eQ52hfcPTD2JDNeTzGbEvM+MfJLbWyJGQJuX1wyKsEB2Yp2W1KGB/T0MXX4Wu47cg==
X-Received: by 2002:a05:600c:871b:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-4362aa93cb0mr85374005e9.20.1734340143532;
        Mon, 16 Dec 2024 01:09:03 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ddd7:943f:c7de:9971])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ef45sm133677185e9.26.2024.12.16.01.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 01:09:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/7] drm/vc4: Fixup DT and DT binding issues from recent patchset
Date: Mon, 16 Dec 2024 10:09:01 +0100
Message-ID: <173434013318.38429.808413721248542013.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 12 Dec 2024 18:36:27 +0000, Dave Stevenson wrote:
> I missed the DT errors from the recent patchset[1] (DT patches
> in linux-next via Florian, DRM bindings patches on dri-misc-next)
> as Rob's bot report got spam filtered, so this is a fixup set.
> 
> Largely it was changes to number of interrupts or clocks in the
> bindings, so those are now covered.
> 
> [...]

Applied, thanks!

[3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names property
      commit: 83a9752729c455a6bd9b7cf62198506180691931

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

