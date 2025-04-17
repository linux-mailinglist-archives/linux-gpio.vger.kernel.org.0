Return-Path: <linux-gpio+bounces-19020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5244AA91CEC
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 14:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8A618896FD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 12:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF913BBF2;
	Thu, 17 Apr 2025 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fBUo2TEO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F3E288CC
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894287; cv=none; b=ZRHHJQ45XfqBx9N3EA8slg/VuWNWtao4LkIljyXtO2xS1l5JIssMbn8pdZNw9BOvkShDfINy35aEFXwwbSd8FFpvSEv6f5uAU00KE1pbOwuGr56bdEKcejf5s5lR2iHXeeg+LTL/rIYckB3LEbugCs67fTkFSWR6ecyVtDMAp1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894287; c=relaxed/simple;
	bh=finCUyOvZ93fHQQHowdbV2oBQnSPddqlzRWdOojWUCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLF1AQhKYGu61DxpYdJxWEsVVGdnUiVtc2fe3DtyBc3nBPxB4Hk9oSCwJvo2CUhppCkTbuoX7e7Fxg/koZ5Eg2I0rrLiZ/GhKy+Awcwj20lx6T0xAloHVhDzM0ThZflRfolIL6IqTmmWuUvDKOJjVNpYpM9iw/m/wubuIpnXhFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fBUo2TEO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913958ebf2so692978f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744894284; x=1745499084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZBnT+laCLNXh7PPiZXzKy4njYMHGDmfdn70a/ZEI08=;
        b=fBUo2TEOrcYKtt9DyhrdFAjgYOZHO+FZuW+ntDZCAjWAoj3tRu1BycigOMqZLrRajO
         fetwvAgf1UWl79lGv+NFErX0frMREFEooVLy2MdnzdBl1+8siO5ggZ3bGQ65Qmaf/ui5
         GpP4vHWH9gNGwX3e9Aooq1rpR72ulEpSg92neowQCeUFegjpsaSD+1j3w3dKaKKUQ2xE
         VPzjEbkvsoNVEkK21s94yJmHmHWyfoB8Yo8CKO9YtXBGc9Of6Hm7mUiOtWfqpQhtQtbG
         owJ0Z6Fni/FmDZ/NvrXnjp3SZZEvgf+nPv/o6E165uTqKQk4QXnqG1Gyb1aGZpOU/w3g
         Hb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744894284; x=1745499084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZBnT+laCLNXh7PPiZXzKy4njYMHGDmfdn70a/ZEI08=;
        b=fO0oxiSFFQcGZSjk2ZNjJfVheoX8+fIV4l4QMsM7fm0Hss6gV230w8RMm/xEnVIEj9
         /58r3QXIAD7X4BRdYhFD1zYP0Z+VWeuhOL2me707Z0Pr1dp+mqCAUze6ZfDcXmX0UE1E
         iM2a/9jek/9uZePgJrVcxAbB+YiSGuszdro1lzlVGuVhqKlEJUK1wI0lrnYnwIRmaaML
         Q8pX+/fP3Lwg8w8oJcwUxBUCfSTCtAwYKa10iN4pX8EcMj218Uz4zvYQst59RtQDSlBV
         AvKZkJVWpK0pW9VPsegW8Vle1O77BwkqzijLOj9cNoi4LbufGE8WXed+wRbJsyWZvVWN
         dnjw==
X-Forwarded-Encrypted: i=1; AJvYcCX6hq0JzlpZgp0PTp9y9G/CsFwu+qAXbY6cmppuggg/EH4w7Rgks8gjG0x79g0zw+HktREVYDmgQMZD@vger.kernel.org
X-Gm-Message-State: AOJu0YxG08YJ3/7+sIghdUU5dpw/su/vTXOxKrfStOTC5yLUckTXrqln
	gjZhhUnl5ub3YBwkI7FC1ziyIFi3lLKDTZKY2jtm4MEN1U/vZ/2YIa5dHlCRV7o=
X-Gm-Gg: ASbGncsDes0YHa06zcxH+85slJpOkAsWp+JfDHnvWiSgPaDdqyW6mNQRvX7FZolSoka
	KoPK2fKsi2H7Mu1OTTCnkjiY5Ht/kzP6iHiUDo9MjCA35d3kbBNNE+ar40T6xd1TV/+avE5AEU4
	j/ifJgy3j1vUNwqTI9cmiiMG+V+uSlLZXuINE40kBgQVDTZt3y/8SzuBpTAunkHdPudnsSnbrXl
	jTtOo6mb4ppx8HZ+MbblLTfMLslgnkWHNurDC/h4KCCbxBQR7go1XlPzK+0FVRJe4TvpTkg1vIg
	2tyEJEVhU8CsFVxTl7BiU1U0Kzu4HRtm2ltiluc7
X-Google-Smtp-Source: AGHT+IHWpz34DsT6CiGwP8Mk2YiPstdWoj5p0fGSBttIO+3O5nzKajqSlAzAnGfNnQDRebcAkb9t5g==
X-Received: by 2002:a05:6000:240c:b0:390:ff25:79c8 with SMTP id ffacd0b85a97d-39ee5b16110mr5425769f8f.20.1744894284417;
        Thu, 17 Apr 2025 05:51:24 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9b49:d51a:4244:693c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f2b72sm52293375e9.19.2025.04.17.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:51:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/8] gpiolib: Some cleanups
Date: Thu, 17 Apr 2025 14:51:22 +0200
Message-ID: <174489427928.8397.10007467605798515698.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
References: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Apr 2025 12:55:08 +0300, Andy Shevchenko wrote:
> Just a three groups of cleanups (some of them may be dependent to the previous
> ones compile and logically wise, but I am only aware about couple of patches,
> i.e. 3 & 4).
> 
> In v2:
> - split one patch to two (Linus)
> - added tags (Linus)
> 
> [...]

Applied, thanks!

[1/8] gpiolib: Make taking gpio_lookup_lock consistent
      https://git.kernel.org/brgl/linux/c/6a40e6c5be2a22d724ed195393442653a2cf9a1f
[2/8] gpiolib: Convert to use guard()() for gpio_machine_hogs_mutex
      https://git.kernel.org/brgl/linux/c/4ccbf7bc68cad35061e1f1b4c280fd736855a2b0
[3/8] gpiolib: Print actual error when descriptor contains an error pointer
      https://git.kernel.org/brgl/linux/c/c240ccd62764e036bd5e1f426fcdebe69e15d7df
[4/8] gpiolib: Revert "Don't WARN on gpiod_put() for optional GPIO"
      https://git.kernel.org/brgl/linux/c/960460b7b43957f3fb6b7856d5273f370e20ac9a
[5/8] gpiolib: Move validate_desc() and Co upper in the code
      https://git.kernel.org/brgl/linux/c/dc5881036291c412d673d11b19d392f25349a70f
[6/8] gpiolib: Call validate_desc() when VALIDATE_DESC() can't be used
      https://git.kernel.org/brgl/linux/c/197184384759ce0b7ae5fa17c9a6e272a3d28626
[7/8] gpiolib: Reuse return variable in gpiod_to_irq()
      https://git.kernel.org/brgl/linux/c/78998fa9887af032a2fc0f9ad0269af62439d848
[8/8] gpiolib: Remove redundant assignment of return variable
      https://git.kernel.org/brgl/linux/c/bfe489117ab2a5c16e4f8ab6863e61726338558d

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

