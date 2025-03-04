Return-Path: <linux-gpio+bounces-17012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC1AA4DAC1
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C779F1889CA5
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9109A1FCD04;
	Tue,  4 Mar 2025 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TxaHS2Ee"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF071EF0BC
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084449; cv=none; b=CLwp48jmHEv3pc51cc8I8vPSH3PvakNPp6Ua/GqpIDpeO8w6xZlNd4A2x5i/cmRJhjB1qJh9O/j0tcKRFLKCl8ayTZFiRno8tCqZo2SA4yYEEnYXUAHevF0ljAgR9TMQjzSr+s1k1m77on5GWzdpWYn4RYr96Y3m6Ir2x+Q3CHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084449; c=relaxed/simple;
	bh=FqYVAKNOGP7i0nAjqaG97iODL3UjiHFYvsdRL1TEK98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RtMm6LrgAmUDYCXIceRTSfCVZdTfxuNKHHMtV2BrwZnkr9GnW+sgqD0yaFj2StKBBt54t2KLYSEmqJrguY7CWO1hj1u0cgeCsiio5vkgMEpeu8fyEIdKFBlZ5DSqULKB3TmpQdvzFiuuqCvp3x3Ajo4QJvh3+Fd/XTTBMxFKgxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TxaHS2Ee; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-390e6ac844fso4768497f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 02:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084446; x=1741689246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDHTgP0rKYqVdFuSP4JuTuolz5HOzZueuq79Omq40QM=;
        b=TxaHS2Ee+kG9Lx/vgBzUVQvNM9UM+85xPzh5hJxlPgS40S1gPwvtADuq4eA3jToXQQ
         HJIecbLGeOV5JnvgDPgF7PyZoER0iFTM+SAbE30fPctua4PHJwn/W8nVE3udjk94QPc8
         JXwxqxkCHt1tGjng23r/5mBjwPul4bSROoSPArUH8ZzlHDUPQCgRzS6ZIL795rvGURzY
         dlGwYh6ial1fFrYP35X7TZJ7QsBKEtwrt61Ygwk/WLpUfIYrq4Dfw/i+zz5lGM6/WUl1
         AreKcKYSIis7wFW0ou/mkPkvY6mvYC8yjRJWwzlrm5bL+YcrfXny4VJmhRVowxkm3AQf
         8EOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084446; x=1741689246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDHTgP0rKYqVdFuSP4JuTuolz5HOzZueuq79Omq40QM=;
        b=aflQ72fkjlzH9RBL0c3lxwLgPxLQBBDhg84wX6nMyr6wDjEW9pNe3vIccGOer0rSPO
         zdEhlfug7V7Rt3HKZa6iK/5H53dvcbYZj7JGsMxDNXbY/QX/wXFRUzUwSP9AOfvheS5l
         IyH6u2EdulU+H57Ei6dW31ojR106ehaybK/Y1XyVouayGgu5v11ucl2T3SpRJFIXdV2z
         s9eXC+HEjLDcYJNMHJNuaLOrudpqtUHcyWrbhjGzUhI79iF6d7JcaLKMtJZuejO9Yi+D
         PbVa+c1Xyh28A1D6CvKmOKkjuwzrw/S/VncfsZf1W8m8NycOPcyQBl++F9SGwljPURxK
         +zyg==
X-Forwarded-Encrypted: i=1; AJvYcCVkvg7KhuyI9iTyqVygKTzjYfKyW1AykMcD+HHI6fz8Rss3q9dovX4geLbVubWFLux1ZLB/q4oYg9Tf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpzn6xZSE9I+v/77Kl9H7xaJjBfBSIUHUpcFADui6JhaoMmE/J
	PIHIyPUpvU46rN9DuU7njdYNmFOHl2IaD6stJC5hkpQ4gejG/QJkZ/bOmWJhFLM=
X-Gm-Gg: ASbGncsQppCY59aXzEIL0sNLMrAo75Bmpzhk0nAzJtDfb9WB9ThOebqf57PHl+C/BB+
	iQtpJJ1F/uK35e49s/sA8f/vU/yEuT8/QrWe2PvjJK4HudBxe7Tgemq25N/3U+RZuLGubqFVeuW
	TTqRWAR64OdqHNNYfP5IpXj0QW48MgEecTzD339HkM9iAcRm/zFM3kroOz7JQYPxcxiBVWFmG3b
	SvlRlVzWVL5awC/i/oYF5uC2jozfDPAvaQm+/bz56su5Oyh/6DRZbw7XEIwCU1KiPGtQHSF2mtg
	HxIZcxmmAFmiWO00VC7Fc64dhI+FSbtIsGqMeddSwUnJ
X-Google-Smtp-Source: AGHT+IEdgfdio1Tu/AkERUYsJYcEik1lMCs6erVNuMN/AebhkzOS0dUYVNEVVwwGwtwWI23958LsUw==
X-Received: by 2002:a5d:64e2:0:b0:38d:dfdc:52b6 with SMTP id ffacd0b85a97d-390eca27b9bmr13341869f8f.37.1741084445980;
        Tue, 04 Mar 2025 02:34:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6018:7257:350d:e85e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795d30sm17485059f8f.10.2025.03.04.02.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:34:05 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yixun Lan <dlan@gentoo.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v3 0/2] gpiolib: of: Handle threecell gpios
Date: Tue,  4 Mar 2025 11:34:03 +0100
Message-ID: <174108443836.31542.4146596975066420954.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org>
References: <20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 25 Feb 2025 20:40:32 +0100, Linus Walleij wrote:
> This adds some code in the gpiolib OF core to deal with
> several gpio chip instances per OF node.
> 
> The change was prompted by the need of the Spacemit GPIO
> controller.
> 
> 
> [...]

Applied, thanks!

[1/2] gpiolib: of: Use local variables
      commit: 732457dc46d62f1df4b2b48c6dbf22b4332da14b
[2/2] gpiolib: of: Handle threecell GPIO chips
      commit: bd3ce71078bde4ecbfc60d49c96d1c55de0635cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

