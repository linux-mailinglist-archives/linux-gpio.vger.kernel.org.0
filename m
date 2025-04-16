Return-Path: <linux-gpio+bounces-18970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EFCA90820
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 17:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC20019E02CA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 15:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47C621147B;
	Wed, 16 Apr 2025 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qgsyf4fL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FFC188596
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818996; cv=none; b=HCsNxmL6k27ZHhQQRIzkvUkACVq2arfq8wjp0veJEpvrzoppVX8wthND1zp6ISR4IoT113SkXES3evo7mFM795uE8/IlB4o1XRKE4XbUiWc67nZ6r2OOhxSB5iTBVVA2nHFF7L1tKwHc5eWq2iP8ElOEm4Q5BcF4lt4eLtAiewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818996; c=relaxed/simple;
	bh=YM9zi+kOtxfP5E+wBpfWpsmMBG0Ma0EA/c0HJo8Tme0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TybrbEkz4VVEBTToOcsdnUnRxFo8QypvvD4d5rODemT5OM0TGXdevA7zrGOdyR8a6N1M6ofEeu6d39LrR/tviJ05m2oYzszzB5aBJzTqffji53EwBRlAiGDU+TvOA/gJ0ddJDzUQUQS7M34WyxnIjKYT3alYgHZV0NZ6LOVKmHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qgsyf4fL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so48363035e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818991; x=1745423791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a94M0ymOqffHM8faeNroH3ykIR/ZTOIWb+VkApInaMs=;
        b=qgsyf4fL/GASYZvBhgYf3NkEJJZnYTpo6JjIxcHHdQnfZHuYtCHseVemGS6eApa3Gt
         IpgMTUoXOkrqkf5BNu3W2cypCuZx8n4HGjVbkVPpdU8vpG/XpwCSqLnSUPw2t7UVs3Rd
         OO+Mm0zO2v24BOwIcEoJuGCplFRxV8IFAkMYcWR7o5IgHj4+1/NuV+1VsyYtmbzFX4wA
         EiHvwWAF6bLH3GjmQWNrrDS13j9xNnGYmBZymn4GWH6ato9fENIzpV2ySZFC1chCUKAh
         9EjuyAOM7iXb5s2nnSUJHgj2A8JEqjzQl+OlPAy+LUuSUJB/93Rw/DBK9WnLJ5dsnjMO
         M04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818991; x=1745423791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a94M0ymOqffHM8faeNroH3ykIR/ZTOIWb+VkApInaMs=;
        b=kCWRPgdINOuX9N/WoMKWhtWi6izlb4LMdfMnCAo6S92VfjT4AZLTsew/dL/jRH2peO
         FwgWNIe1rTkBie5yGzmTKYUNkmKnqEG4uD0Ln085+NMAdw8qIE//H+G2ISzB5E+UU+I7
         7h3IBDSnxuHKoU70ItbjGScdDy7cP3xXcccTWzhTz58k9vgEhKXLQJGUQ3iJS2rlDjZH
         7XfkHOS5c6eIKsDJU/buYUfkmWJ4QNmwuHrndaBkohUfWsvN3Lmu07Z4HLUzHK8v5W44
         u3RmegBr74e5xC9XG9/s96TcnsqXz5KScoubyudueI0/VFFzhTgbzyd9SnSi+Nu7uKcV
         xpPw==
X-Gm-Message-State: AOJu0YzaH6VOEwloprjMrck8qabVOjp9sANjlEfu1POR4gSoo3a5aaN+
	mMPL5lVyLxVkYspacLJ2A/Itn7YKRF3YwXZSv/dPhqfYVecnllpeilZJzdXFj4I=
X-Gm-Gg: ASbGncuzWH2SnTHDMTzJAn6ahh1KsSAN7GLvaHsvvt24nJhfuLDs5w2VzvDllEmzfFX
	EPH2wo3vZItvPQuWgsztR6swcDfqAkx3TMwc9UqT4q6RPazKiBXm+pqcqiELy02zfPmHVGC3u0E
	Luiu5N11po1B63dapiMTVFuYD25qNzhGqhAcgQYwa7+lU+d94UoBXdJvmximFjnOkv+AObhczXP
	dCqO/ZiEEkAFeTomt1HpfN63T3eXbSbFvFw6FkOMhzhkmLD1dujQTBmqZqov4EKM8naykSUNg4v
	OZ/7bcYMHgaaxuAhEHjCzeHTyuVIfSIxBb7qAUpq
X-Google-Smtp-Source: AGHT+IHdKNI6hyGPzGgFf5fHX3qw3Otr1c1zzkPAkc5yYzhNBYKNJ1QofozTxuH6uqxYT6WbIuMfCw==
X-Received: by 2002:a05:600c:54c1:b0:43d:10a:1b90 with SMTP id 5b1f17b1804b1-4405e3cb261mr22306725e9.16.1744818991221;
        Wed, 16 Apr 2025 08:56:31 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm37224015e9.1.2025.04.16.08.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:56:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Peter Tyser <ptyser@xes-inc.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value setters
Date: Wed, 16 Apr 2025 17:56:24 +0200
Message-ID: <174481898215.8191.2166208947252160548.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Apr 2025 09:13:09 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> another round of GPIO controllers.
> 
> 

Applied, thanks!

[01/12] gpio: dln2: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/afb4aed832f9000a5d15ecd28a7b2faa5789d28d
[02/12] gpio: eic-sprd: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/21d3c6531b113b1aaecd99ae90dddd55c20f372b
[03/12] gpio: em: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/097cf61ba5bd69328a69c4920f3454089fae0a43
[04/12] gpio: exar: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/bcdd5b37640cc577cd93d20f00519e70d7add8a6
[05/12] gpio: allow building port-mapped GPIO drivers with COMPILE_TEST=y
        https://git.kernel.org/brgl/linux/c/f031312c8e1903859a3a2a58ab5a3f97ba8b0ae9
[06/12] gpio: f7188: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/56193775d1ec9ab5ac23b05c821c26704debe040
[07/12] gpio: graniterapids: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/04eaa41eb8ebb7be4c78d1e57442a581d0bfdc22
[08/12] gpio: gw-pld: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/674817f336bdde5887191c61eaecf3f0a70cd405
[09/12] gpio: htc-egpio: enable building with COMPILE_TEST=y
        https://git.kernel.org/brgl/linux/c/6be51668eda37089d9a484bc8a41c1e9ecd6f577
[10/12] gpio: htc-egpio: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/4c71b46278c2b0cfc8e019e4fe3ec31ce258741e
[11/12] gpio: ich: enable building with COMPILE_TEST=y
        https://git.kernel.org/brgl/linux/c/10b16abc29e17c6ca86bcb8ceebf840e509b0ce5
[12/12] gpio: ich: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/69e230a0a288a73ce2a8e9373bcb7b37239cafaa

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

