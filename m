Return-Path: <linux-gpio+bounces-13545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C8E9E55E5
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87C9B1881D07
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 12:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DEC25765;
	Thu,  5 Dec 2024 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DDc8A3p5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650E7207DE4
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733403412; cv=none; b=C1E9OUog81qU8ZoHuO4zOdT83zeYq/LaxQh2wYTY1JZ11iCLx2YuMletsRzVu/cREEFM94tyy+OYMywo45An/nMGTV5CVii5UaEvOQp0CeChvafhcoS5L/8+ZFE5EB4MBtNrBzwp7zCXIrrCMFGk9pZOGraU0SRaYNmr0frKFQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733403412; c=relaxed/simple;
	bh=ebPIcuQOirB0DBulAIHVWSrQ4z49bBXHdATJ0cdcLHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJiGlinVP9zHo2GKinkABNeNeKOs58Gl+uBbd1s1bgIbZt+djXVzED8gDudB96FId2JvadtFrHtYOv3cvU/hLV40robRiS0nlkO7330nJTX8jg6Ga387dFCo+UykdTCqGfqfyaDM2sGXp1gryCvH04xr2EnUHZnnY7oSAmJIysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DDc8A3p5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a9f2da82so6038685e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2024 04:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733403410; x=1734008210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHtLF7steeX5ErFVI0B2+pBOxVyNdtACYgZrK5kixfA=;
        b=DDc8A3p5uvCbs1QP/ZCkmJe14Pl3Osna9PK1w5g15S00+pvpVPvgLbQT7ag8Glvd5X
         Oy+6QOsvlt/H5DrzgG7ddagl4pLM3Mp4kUTK2wruHUgIG7bE5LAxWtpSJ2rxi46Ha6uc
         uzv8DAXCjr7pkVbogt+vEMbsWYQCOKfIKS5v+ZVkU/jnmkxYEnbHKtayVa++Otesj7TU
         5VjFVZ/kMAx7tTdQbSFQI38lnEceutNO0Et/4/JOKvUft/ioke4zitKDz3ee4dM1kU7O
         ghSsW8rEncuRS2uRIr24xH+yBMTgKc2qhIcy0uhmuwfbB+txcTD8LaX+42dC+BdQUUNv
         00fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733403410; x=1734008210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHtLF7steeX5ErFVI0B2+pBOxVyNdtACYgZrK5kixfA=;
        b=rbzb6jPH1IcKE4pCoXwIs70Wy9pvTlVM9KgH5dtcpGeP6X+tcbUAc1o7sxNbzCP9hn
         4H8OQ6i9dOTeQMykH7na+YxKzUgo1vFJkRqWHxmx91Bhy8TxhtUJYLusd8eqjTKN0mad
         2QfTFQjzMiWqBLyJnwrRaOFkV/Hd9xfGXiIZXC8HzCtBhzF+YYKrRWuHmQFBID0Oi0ge
         JasJddMgw3eTJ6Nni+9EfN18JXTlqkFRIwaGpTPPPU+FjRPUVo/K88k/cOu3Hh8bXIMk
         k0zn64FegEMHTojVMLTH1brMBc7Ex+NkWpSq5FTuOZr1KIoXmL7sB7FWm6zy5pRcDG+0
         5rHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDjq7tJuvsHXFzQW1nAeNzJ1J5TUBzdOFe+hzkDvgy435k4Td9NR+2NeXWdH7/hJjKYU2g/AH1R8Sm@vger.kernel.org
X-Gm-Message-State: AOJu0YzmR+9qAgshQIXRXKsSFhb+ZLa6qOEGVH4aOjz8EWeMYRZwf9mm
	9G4xk6yi9zyU/i34cYP+dkgdug1pr8KCOD+iYMHh0STse8/qeHDiCumQGeApdUM=
X-Gm-Gg: ASbGncvgDew3rpZ7rjIXXdZlnVdwPlRwFyu0qRv7CxABErGqcbt/KzKFqlb58R0GJRU
	ozdETPbTSs2NSWzEpjiioZBkdudCersdwQMImdWg31BKIxK3cgIe11VY/Mg8C+yz66jr2EBmkr+
	4rYMYfJtfyL1s8gjhMSYD8bUfNyUUUptseg4D8Njnyo8IzBCpV8MqyZMvTMwHdaxWWSVa6bRFuN
	BnwuUz5i5dURBxyGlGwzeAky3sxNe0HHHOzpQLT6sGGDcHk
X-Google-Smtp-Source: AGHT+IEGro7MpWAm4lgUb5bxt+yk99xWr0ryckbyOVy2CdZavxUZQeUKhw7Sdj8kofOLSHPFOYFLsg==
X-Received: by 2002:a05:600c:3c84:b0:434:a852:ba6d with SMTP id 5b1f17b1804b1-434d09c0598mr89968075e9.9.1733403409696;
        Thu, 05 Dec 2024 04:56:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:c2c8:33f:e860])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113580sm23510785e9.29.2024.12.05.04.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:56:49 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Phil Howard <phil@gadgetoid.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] bindings: python: fix license tags
Date: Thu,  5 Dec 2024 13:56:48 +0100
Message-ID: <173340338516.43992.7014674664044743650.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127150529.126896-1-brgl@bgdev.pl>
References: <20241127150529.126896-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 27 Nov 2024 16:05:29 +0100, Bartosz Golaszewski wrote:
> Several files under bindings/python/ have wrong license tags.
> 
> In general:
> - Makefiles should be covered by GPL
> - all python sources under bindings/python/gpiod/ and
>   bindings/python/tests/ that are part of importable modules should be
>   licensed under LGPL
> - executable examples should be licensed under GPL
> 
> [...]

I haven't heard from Kent but I doubt he would object so patch applied.

[1/1] bindings: python: fix license tags
      commit: 6d9133a259e64da5e03c7e7784f0f27de7b3e59f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

