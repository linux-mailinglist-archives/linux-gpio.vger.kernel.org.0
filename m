Return-Path: <linux-gpio+bounces-26000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E9BB543DA
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7724B56051F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 07:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6CD2C15A0;
	Fri, 12 Sep 2025 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QWBvJrUZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE93E2C027F
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662026; cv=none; b=pNkqe5g2whNz+9O1OQ+QIH8QGxqV4oipRFRzI8lqHUGqveOeYfXCzrCsJQVcPPNJcf3oZbi9X6hHC53ZIg+mjbXk16VWYXoWs5Odgp+mr4PFQ4gGAIpjEiFiR5LKfyA0/ajm5v63nWF7oWfU/y4urtPolxQGXfTvDtD7JKJCa88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662026; c=relaxed/simple;
	bh=5lNIpCLod1ZLxeOqceiGCotAnAHsNRxodHXq4jW10nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EBH8s4an4M12c9J4Kn3saDcLxrp9B8DPxPxzo0d5z4bu5TmlD9ObgtDVSyPp6PceiCdS9/5IX9kBy32ce5IIQkh7VwNrKVviG9ZM2al6UCqoZnfbr1ul8bQ0LUzeFH7eBUwDCO3cGoroLk5YN/wEaK7A7B/g6vRPRN0G/LyPurg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QWBvJrUZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso9756585e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 00:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662022; x=1758266822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFDxDxYxS3ZKV/v8Txauv0qOZ1rvVssij3n5NtqF28s=;
        b=QWBvJrUZcfBG3wVnQa+k5f7KH2D59edH+PCnRV2Qg0xoVZOlmIRHOjmT4aEWlroUiZ
         16KyGdmg7lPTz3R3ro1GhoIrABaAn9jzSPAz0c41hwx3szew7rssUyNkRe9lKpkBbAfT
         7fygQdPdyPy2PPvyNM3wFNBui+EEOPEcB2E3qdIXzs6hbqfQHDPRaBQcNYM5sZ6Yn27W
         0mj85raDW2llqTfadI7JYlDp02EqjYMNuGGOsDY47xZkOdguSAesQFcZCcZwFfci61j1
         Ntkc5ksEHqWF/O3kuAtyShUlKEkhBlXwlqEYZIoX6vNtIt86Wy10pDigNrFGl0xeP2rd
         zkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662022; x=1758266822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFDxDxYxS3ZKV/v8Txauv0qOZ1rvVssij3n5NtqF28s=;
        b=bouH70I3L5yyxNNH1Kwd7ZK9z6ui1mt7kGpWXcI9QRoJw4yp3sKSwhiDxZH2LBkFX5
         yScXTBnNcGHzLHSGSv91pNEpwm2FJI5neRXDWfRiQWamApw1TUVow1+hA3QnaBaxf5Tk
         +f0OlmvWIWoyH9ap79NsZmG6YrNBFxQ00pFStDwHZzParDh92sCbPB0tE7PGyn8jr2cr
         AbjYpQZUS+MVWk2azMC4sJ0OnjPnTPXWNPZAwBvBGR5PD/YEVFbEWVZdvNAnF3Yv81cz
         ixuowg5/LISfuAM2K4YBuMfqsS2Mh4oNS2rDratWwgFXnJNuEul2jHZFZlUFKQ1wJp+C
         hvZg==
X-Forwarded-Encrypted: i=1; AJvYcCUVOUILTwKcD0UKMVLNop5TdMJTk3YmZ2J0FcsPKHbIkIOCikLUwJorwXdZpbs9S+NQ2qmpVh3OUmTP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo74iXy6CH6Osi8lKjB+zHKlMTExRkNrHpAOzCUW/pm/2I7MKl
	R4z3Syb10oCZpajHjudUYgnFL3OJZ/BuIfJStn2ejgrzWt4zBlsD/Mf9d9Wfaxw2vSM=
X-Gm-Gg: ASbGncuwl5HV11KrOTk0I8vRoJFcCc/19nWbYn8d6LBj+a4aEBdgJb+bJY8P5G2yjqP
	3RpE2LvwrbHugWlhbXAbA7aNecsOTlr3YCCBB6otT6Sc9N6HdUwlvOAshMTamAfs0J98Xc2xqzV
	92CB2Vmotcm9y3pqNBWoEjN0F6BJDALLW8g0xpkSMRXISdupgnMlOV+10D/Si8y7J+jmwJbNdpj
	7VeRewP0xGB7r2p9pV3i5mMSJ/5IzFQs/jKwiQfmtX6P77LXW4oFqq3ICv+YRZrJvApHsJzx7mG
	GT1mER1sw/85kL05WySDR07xsR3CXm3CT5VUoNEFfm4SOiGLrlfgWDsNIyl53qASspW0UdHNEVd
	2a2Q4KD2u1a6CHJ+NvrsiHHY4TZXy6wCzlA==
X-Google-Smtp-Source: AGHT+IFatmuX95JKCSPc792YndUNojFLqNhVLhXzW0tmPmShCeo/svvR7nixC/n6URYb31ZyJKxSNw==
X-Received: by 2002:a05:6000:26cc:b0:3e0:34f4:3225 with SMTP id ffacd0b85a97d-3e765a09238mr1952786f8f.45.1757662021871;
        Fri, 12 Sep 2025 00:27:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b6ab:4211:ebab:762])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm730202f8f.58.2025.09.12.00.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:27:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: add a common prefix to GPIO descriptor flags
Date: Fri, 12 Sep 2025 09:26:55 +0200
Message-ID: <175766186358.9646.9647501924700863520.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909-rename-gpio-flags-v1-1-bda208a40856@linaro.org>
References: <20250909-rename-gpio-flags-v1-1-bda208a40856@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 09 Sep 2025 14:28:43 +0200, Bartosz Golaszewski wrote:
> While these flags are private within drivers/gpio/, when looking at the
> code, it's not really clear they are GPIO-specific. Since these are GPIO
> descriptor flags, prepend their names with a common "GPIOD" prefix.
> 
> While at it: update the flags' docs: make spelling consistent, correct
> outdated information, etc.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: add a common prefix to GPIO descriptor flags
      https://git.kernel.org/brgl/linux/c/571c65bb2f4d17198189cf8d161b96f32674642b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

