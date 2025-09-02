Return-Path: <linux-gpio+bounces-25349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5412B3FA64
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 11:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6EF42C16CF
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 09:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8C62EA743;
	Tue,  2 Sep 2025 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kZ4iS3eu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB842EA74B
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805406; cv=none; b=LIXssgHV0yQxVHtr+EpX4dJ4S6EVXiHERUp3IbiiDhCFLJHr/iueVq/n/WBJXOdW/MhFp7OjUxWI/phlo/B4bnnVu5XWd9lpXrGJTnn+rnMnAbLudopw0RTrJNloH+eIb0RUBTqEU7R5B3vbLbv70QEgZZMxQcp4MwKGadVcWTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805406; c=relaxed/simple;
	bh=5UTLFe9Na1x/q+MvJizjhdPCvRgJqWqRho5nedRZ7Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ox3FO0rN7N9IFqSxxrLsRbozvTVsGFr0OU02Kl0+VL3dUB8jTHVLLlo7WZLOZi/5c8fOKLgoMBoGL8FkTtg51gpmgiUhCYqzmMpNTYEIcV1mDhPrbL5f6UZ60x67wqVjAT+Mhk9XvIqe9stMRXAqnlvb6wtumq32bHajB4Q2dbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kZ4iS3eu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3d4dcf3863dso1445495f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 02:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756805402; x=1757410202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=432khs7OCxGBblRoqEqWrfX2I6K5pnQLFbsVSHyt0Es=;
        b=kZ4iS3eu7DEWmb59PItVJ+I0lMf/Vb0iABIHfY5mOxbAu3Ay/MNDUd2oiGfxrAa7WN
         ZiTW0lzjDzTQlJU2Yc1xdgKWtfybjywinTDKeLS/2tkbRnRlm0kY846qUHXIFPQTc7wn
         JjIdwuxkPhOgsVY/RDxvI5ZRVq3vcwHeJIUz0yuiSrUyfRCTXwEH502wQBkOru+D+PWG
         6acGmh43b7Wq0y7hrHeIuvmhZjr3HCwuNN74BDuv/ItUsMiuFNKYJKP3aXpUEts+7C50
         euhHCNnChl/1o9YeUor3UZS3YDIfKIjXGngehUINRGaZ5LNvbnamvgU1GV37h0EGz2KF
         iRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805402; x=1757410202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=432khs7OCxGBblRoqEqWrfX2I6K5pnQLFbsVSHyt0Es=;
        b=cc9ZP2QjGLtVxwnwsvnSo3GO4SxTjwEsNkipYFALp6BmpfFIExS2844nzpz8g7ZID2
         Bxq9FG5F3w4V1ywiU2Nv/nIouj3IP4S7Lc3fNSt9P3AqwLZyNHT355vpNb/6CuiLnkck
         5zLN2SBZuqxyBNfqQp2iitr+J4PpcdPTDnmcYmrB5Edtgsc7z19JcH5SIv5JcDi08Wnt
         P/GaIzwCKRb28ZP3QOpzJuXB/B3KAFIIr6MhlE72vDMPzgVl4uo7Q5Ok2moqe25wsJt2
         aX7E6NqDQUQ6Qt4KnqEpsceZZWM2R454ZbQfJJaHFwWWkL1RdyZ907YwTB2TIml5b2Xe
         kBCw==
X-Forwarded-Encrypted: i=1; AJvYcCVBeA7oCOAP2mHtYBN/AJ5VZt7pc7tgP4UCD+TC0RdM1EnCo3P1ARvUFbfW7K+l+m/kAe6Ehm7hhqox@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw4TbBaCiIYM1vHT/Nrtyau+oxh3D6MQjGaxtu6wFk+xC8wNm4
	cHcfpSSycfT00X5gmybIy9TL5SNZ4N8LIHc2Pfw+Qrv3MJWBcVvCOFW0ZcemSPvMTRw=
X-Gm-Gg: ASbGncsuRW1UU90jdYs5XErd/BZuBW0vA4YVL6P4zGUB7afE3BA4zfVuSwiqL3y/Aux
	vFfR0PORj3wllFmE8OGp5vF4/7G8upYZwp+K2kAX2CUASent2/u/23jFVnM5ihIZsKf72OCgk1R
	9Kz/tfBl5cS++ZgW/EX/U4xpaja1JKJ21R1HQ2yMiis4D/CcP5z1DMCJGgsK89pCQGCtjeZRtnk
	+tqVL8ynRfGTdBoSQs4hoVhtVx7ZcbQWq/x6wxRvfrkE7WYiVxNWieJsSFFESKsi6fWsPTOm5x3
	YagPll095QMu6BL5kiwnAHZleuwTZZ2WYTv+6j3CVoF8n0k2EMEblR+v0B5HnZ4WU6ym5dvz7Y5
	pUU5rc1AwgX34ehn8xFry9x1x5GGQvppq+A==
X-Google-Smtp-Source: AGHT+IG42W61HHIDR/rDhaz/55c/dQ4iA+jW2ueIWFUoOBDEHqYDk9qKbuROvLVBex1Isp3Sw8cvVg==
X-Received: by 2002:a05:6000:2909:b0:3c9:4e1f:ef46 with SMTP id ffacd0b85a97d-3d1df349680mr8131402f8f.48.1756805402351;
        Tue, 02 Sep 2025 02:30:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf270fbd01sm19307310f8f.13.2025.09.02.02.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:30:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: fix GPIO submenu in Kconfig
Date: Tue,  2 Sep 2025 11:30:00 +0200
Message-ID: <175680539717.52527.14627198705710165881.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250901125513.108691-1-brgl@bgdev.pl>
References: <20250901125513.108691-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 01 Sep 2025 14:55:13 +0200, Bartosz Golaszewski wrote:
> Commit a86240a37d43 ("gpiolib: enable CONFIG_GPIOLIB_LEGACY even for
> !GPIOLIB") accidentally pulled all items from within the GPIOLIB submenu
> into the main driver menu. Put them back under the top-level GPIO entry.
> 
> 

Applied, thanks!

[1/1] gpio: fix GPIO submenu in Kconfig
      https://git.kernel.org/brgl/linux/c/ef9f21c3f370bcd45688a3a573b788e39b364e80

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

