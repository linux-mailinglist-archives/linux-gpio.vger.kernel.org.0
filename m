Return-Path: <linux-gpio+bounces-18758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA3A873BC
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 22:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF03817105A
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 20:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0A61F4295;
	Sun, 13 Apr 2025 20:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rkTQcgXG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220C51F3FEC
	for <linux-gpio@vger.kernel.org>; Sun, 13 Apr 2025 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744574423; cv=none; b=WoGSGaRbPjE9HnAISdXxQhJlvYdLvQsY2zL90nBEWfokyUzsZHxssGKrUXfQKRxKQ/2MTA74xw2pYGGS9yinR4jJA474pAyOR7hU6lS6f9Yp7mtqccII5EUzi/SD7v1Ef8Da3zGoERsj+yEbqSQAdNVrB4V89F6E2tZaKwiDESg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744574423; c=relaxed/simple;
	bh=QJ2echnBKmP1Tc0MPNN5Qs/cA6RJIbwCOvfk2b6xdjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J7qH1p7UyjCGTbCsVU/cbZvRgxrZi3J9335xrjy1XJqHTE5lvse69/bFmkjwWfLiXPS48uClx3w9GSOq5lRbn46FOjGA3MFLYbkgDBUgFb5YQwb+KwBR829ysGhwY9EXvtd0v3RMMkbFTmGFr5QPT1l79eFjqWP/2tUZX7gXyLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rkTQcgXG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so29049215e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 13 Apr 2025 13:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744574420; x=1745179220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRXcjlCuBBWXh12lLPtZTq+NKWPipRgLKhuCTXh5/1M=;
        b=rkTQcgXG8jjTiFwH+FSfUA0XIp5wl2xUDG7/bMz2DCsRDGEv6PQjD9nNOss4a4xwC1
         tVhi8tPQgu4QdpvtW8piDZkYtpR8GZO3l+EQ0FEx2h2Ygu3ieYtSF97vtw+d4f5ZQ1hw
         ZTSl+Sg/O+7xqz6FbvlLvH+Rpxk01WDg/jkWkg8OsqEz4EjTdxXB68hkk8f5WZWEXhl0
         KUO8nv/R/WloqdHK/6wDXPHzZ+Zo0+4Kl7g1FBPc+m8IEBeumI4Nq9l/Wkb6Do0WmMdX
         0GkjmojXWLCkMZLZ4wgTdlc9J6+xZwvV651WFX3U1qJ6o1XPSNgUmpv0CjwgR02jdwJU
         I7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744574420; x=1745179220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRXcjlCuBBWXh12lLPtZTq+NKWPipRgLKhuCTXh5/1M=;
        b=UYu/xwWqvoUjFuR7c4EJvCYZZlQQIjE44JNFC1LkeAq8DGl27DNQf0n39Ytq/3e6Pc
         rvk0FNJXU96niRzsUCnH+S56NzeB8/Z0lEl893iJykbtPHUntLO+v9uJ3sc2Y3bL9L3p
         38RQS7Jm6MtnYx+YcxFRhKSky0yZTNmunqnJuE154ClgkFydFQocJg2VljJp+lD/+f9x
         dUgWAqNqSEWf4N9TUwG6PeHPgYUxGlIabDT8n6CGX08ZgcTTckCxcPrP9dnLre+4l3mj
         buzCn8HVae2neVBHze7GqAoKxsKNiKRl0w75hFElHgxGDBVBZXbtHGSYK2klu9EeUb1a
         eyeg==
X-Forwarded-Encrypted: i=1; AJvYcCWjPe+scEVD/xncH8uKmjoPO9XPkch+AkFxUr/9H2tUxNiFUjidvWiPGlf5gISleDcFPSVJlqluU3K2@vger.kernel.org
X-Gm-Message-State: AOJu0YzsxNhjUKvKknZelmQvTzZt6uagdV/5L1OALsCN6ZDuD4QRN86y
	i+SjT2wftVkozxtp9Zs0/iOtBvAlzB71M5YBWp0aSdf70tTRPiF7H7jzgzSNKI0=
X-Gm-Gg: ASbGncva681fLh3c6SfkALVsL9O2izfzYDbLD4Bo/6i0NlICljfmf2wgr8hSGvjA0YG
	aYDqv+LhuqLZd6PnGnfkAk9kjLSrOuZfPoLQ6wlrdwHLY6JZwUS9RDJprM8Kkkv9n5kAg7HGrWD
	Oz9TD8AE9+N78ffRkKkyTREs0VcJstRa2FdDca0RzDQT4132hc2Jk7wsx2eDVj5QMTaHXr4YoyS
	45bOhBWiB/CrgcLc5e6lJAQ8A13JDArgBqvsF4v6PeLZib34CGaFZTGef/pRuadZD4Z3+aM4DPp
	AwdZaOc0fsHE8kyg7dX51XveshSBql4pVGu3
X-Google-Smtp-Source: AGHT+IG6aXB8MfFdxS06qXTQl7E0SZ9Bu9T+Rnn8pWyPvB1ogSH7Ry2LHZj1Y9t+Z1BdYzRzo+8lFw==
X-Received: by 2002:a5d:6da8:0:b0:39c:1424:3246 with SMTP id ffacd0b85a97d-39ea51d3527mr7164305f8f.2.1744574420199;
        Sun, 13 Apr 2025 13:00:20 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:e852:1f2c:a4b2:8e89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce0asm8810540f8f.70.2025.04.13.13.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 13:00:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpiolib: Allow to use setters with return value for output-only gpios
Date: Sun, 13 Apr 2025 22:00:14 +0200
Message-ID: <174457440298.11196.9277089690698361995.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411-mdb-gpiolib-setters-fix-v2-1-9611280d8822@bootlin.com>
References: <20250411-mdb-gpiolib-setters-fix-v2-1-9611280d8822@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 11 Apr 2025 16:52:09 +0200, Mathieu Dubois-Briand wrote:
> The gpiod_direction_output_raw_commit() function checks if any setter
> callback is present before doing anything. As the new GPIO setters with
> return values were introduced, make this check also succeed if one is
> present.
> 
> 

Applied, thanks!

[1/1] gpiolib: Allow to use setters with return value for output-only gpios
      https://git.kernel.org/brgl/linux/c/93eb2c1249eadce4bbc1914092f34f5988be13af

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

