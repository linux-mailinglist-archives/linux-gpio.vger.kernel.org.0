Return-Path: <linux-gpio+bounces-21154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89561AD3261
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 11:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6289A189602C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 09:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BA028C2AB;
	Tue, 10 Jun 2025 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yQUbzN7E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11CD28B4EE
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548473; cv=none; b=Wwll1A+J0AKJumI/3nByw+pHh8IRPwP5GIXn1RmkUSjoGLIf1pfTOxwZsmWrMyEjJ+NSSku4/x9SWwhKvdwpDRB8sshT52x43tQZ8QMLEo3TYxTc8i9Wv4nYTDSemcHkovWU6IUOGzzBzwT7sU2TbIVLA/fJiO3oCXC1PodL64k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548473; c=relaxed/simple;
	bh=Z2f2UZlbBPoJMBwShyzGoWaBgzCjaqrFUvLkxcX0eQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RBgjFTVtJTnCwa0HFefJnY37mIb2t/zPc4BKj+W88YnKIIl8B3gMyPeAzOmmp+jUFOcKEuETuNIOVAXIrHNg4pyl7dBqwWy3bvhLwo9Ed3RPS/Dg6KcxV4zZWuJHZPj4N1SGXyAULqvee4Ws+aVbKAQlmGwDNET7qlemzcEJtEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yQUbzN7E; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso1331675f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749548470; x=1750153270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spfc0NEE2EV/P2qWj1dghBYkiy9zNZTnQ8paYjIjC1Y=;
        b=yQUbzN7EuECAP3ZEJUcUtcifpc8qYgcZdh4UsoHT3q0uZZU7MuZb5Pk+o8sCRvLjQk
         UzR83YD1u4u9apkgBrb8Oxc90fD1vAjanGkgxceMJXkW7nreLcrSGnsNkAwY7Da+bxXC
         88tvPE31PfMMAtcOkHH7rSsY9GbFnqphIq8zD4JSNIBy1zhbYESQ3X1aehc60e/gVHfO
         xvg9j1pEZcfC9dTYvRbTLLp4Q4VaqOqE41qEFxQnZVq1eZ+aZ2xxQm2EJ8302kKcGgKh
         qCCLI7nanSWcAWNZ5P3kx9GgZtELxpthkX8xU3LWMMaWUxjY8aPnsftJXbS137sXRhWf
         xf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548470; x=1750153270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spfc0NEE2EV/P2qWj1dghBYkiy9zNZTnQ8paYjIjC1Y=;
        b=K+gpdU816umj4kFDuqLL7xmswSCdHjvNVvOzankHv8djL9RWwnhf5ekxGwi1HXhFja
         F8Xw1VuqybozOK5FCMxSSFtL10X3eQ7yUgeCQ8lkJ9bybewbiLpn0zx1c1kIi1M4wE3/
         ot4AC0evE7hVLDRoPtkG8AhELCr/o5+eXngrpyUBCLnjsBzZhEVWEH29BQwi04eQ4Z1a
         eulDeQ/cxpJr/nF+okePeXXmVzSyzXffp+WG4nvqP3IShoyf8Lwpb+y5Eh4teuOJZKS5
         4ybZhpji5zmmv0y91W1iVYvAVwlCanSlMixB/sS5tUkpmV14noTxAZNb4xg+UqbO51Qh
         53IA==
X-Forwarded-Encrypted: i=1; AJvYcCUoa+12CK/EhiZMOPW3mURDKC2hR/fA575vpJyJmX3RH22oxyaE0G/49N+Ltq/irHYvGp/63eGTJji/@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZ+EaMeSsD1UtSyUoXVezzLci6vgRFNBdPDme70PRjB5SgewW
	YnRpFto4/RXhx7RrRwfLuUs4g5e4RovQaqyLPJG4HcZGcAaBQfb7IbFJ2wYTSntX1gFz3qYJo7K
	bu0VU
X-Gm-Gg: ASbGncsLD0dOB2zY6/olSDBd7FBqe0xo5ViXYRghONY0cXym8t/7ATX1ovHoNZoIIeH
	SQ+ut3hZPJB3iEyHW1KicEZ4/ZWHm90WMVrKOINZeePeNUVpEYF3A2GX+5wkoLsWid2HqMNhcmb
	8U6m8n5vQ3M5i/vmAmBppa0M73lrvT/qeK6/vg93C65mZqRBEEufkLmNox670P73hDyBpLxGgIv
	IkjuSiNYca2nHJuzL6Og/z43SpDF4deQY/5fCVTw4FoLRV65+isKL64h8ja/FkE2/0m35qL4ILi
	B1vRiUbAxbuT4qjrwxCg44CoFlDhmZGhEoNDtXIwekH0z6Gt0n3vtRlCNAUFDDEStRwRyss=
X-Google-Smtp-Source: AGHT+IGY1m9lVwTiwOUbkDhjFcZNVF350pSblyG1IIU2HN/L7frRN8DyOvl42PjKSzjlJ4R646WDAw==
X-Received: by 2002:a5d:588a:0:b0:3a5:2ed2:118e with SMTP id ffacd0b85a97d-3a53188a883mr13196109f8f.9.1749548470024;
        Tue, 10 Jun 2025 02:41:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243688asm12101378f8f.57.2025.06.10.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:41:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: TODO: add a task for removing MMIO-specific fields from gpio_chip
Date: Tue, 10 Jun 2025 11:41:08 +0200
Message-ID: <174954846672.40051.9274185826688444001.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250527111353.71540-1-brgl@bgdev.pl>
References: <20250527111353.71540-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 27 May 2025 13:13:53 +0200, Bartosz Golaszewski wrote:
> Currently for CONFIG_GPIO_GENERIC=y each struct gpio_chip object
> contains the fields relevant only for gpio-mmio users. It's not an
> insignificant number either as it's several pointers and integers.
> 
> It makes sense to remove these fields from struct gpio_chip into a
> dedicated structure but this is not trivial due to how the bgpio_init()
> function is implemented.
> 
> [...]

Applied, thanks!

[1/1] gpio: TODO: add a task for removing MMIO-specific fields from gpio_chip
      https://git.kernel.org/brgl/linux/c/97a7ea2b8f4a9aec1f43435658343e046c2a4983

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

