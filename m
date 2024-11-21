Return-Path: <linux-gpio+bounces-13178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BA39D488E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2024 09:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DAE11F21BF9
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2024 08:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E376F1CB9E1;
	Thu, 21 Nov 2024 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WPh99lXO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68FD1CB31F
	for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2024 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732176643; cv=none; b=OuhX8w3XHHdmMs28R23OjA3vmUxdbfD2xtS5MVGAw02+3ANr8dYrm15Gr05Z0QO5EdT8h7IpGyfLoPdUu4Or2iCQPkbs0mYZ6LHltI6iZleLJPJ/rMDSP31GPKYubtdLNygUGQxvb7LtkUhLSGzHspF0QChnc5kAl4NUqqZMDXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732176643; c=relaxed/simple;
	bh=G0y8S8FylKy9wOyLSETpxAgPzGNGTgM2QMr1+EOsyZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hC0ZyX3PN38Xi75rLqaJoXs4ze09dGMr72iAsDLjVqkOmvPSuOkswifNYVBwZZUYx3qSp9HpFRUWM4AFpjQFTdn9v5zYLW3jE89Om9JhtYZTRTJiPEG58GiSvOnvugq1f9QNiI9hzu9knVQgdZwygyJDa6K28C/4gbxGtbSi4tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WPh99lXO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431ac30d379so5136175e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2024 00:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732176640; x=1732781440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvFItnRaSzv8XFWni+I2CoIG7nGDmUnhDDIVa10U4XI=;
        b=WPh99lXOxRK7XaJmHOuxrRygYvwubnm3xnY1067gkzYZv0Bkt7MRc9trXd0qhE+06k
         g0nCbM3qhK5q0y9+lkwhIu9i0CMkUtAHy0gAMchJWC4tkwEwQbRRXhJij1DjbymgqOAT
         Y7ssTy1G38U7GNvgPFjVSqf7AWnHIiBQ4e0Ax02G88xriTHQMOfer8Kw3YjSuG2ThRzX
         cQRDwClHv9mNzKOZZbsWkJMSlYVXuUP0YOoLLqTEfix6fQWnBCuAxytxltMOfcyQDXfE
         xGteCRmcuxcmmeVqZSLYGyY2VJ//TRxjvg8DdVzBpo2cuPAfWIuGk4XWSd/BRC8QI0Kg
         Oobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732176640; x=1732781440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvFItnRaSzv8XFWni+I2CoIG7nGDmUnhDDIVa10U4XI=;
        b=cATRBBhegpPrwYPbLUHttNLrwZzYi9PeeUS6Z9QVj0gXqXynQtcJRG+SHNc37i6eno
         CsLdx0ziNZvVHyTPApMpSRDIfXoUz16JtFWmg+f6T1ia/5cAk4rtKriqTRgSk3a0ltHU
         WloEntkrH376WdAKBL4sRxHVhe1hZXILYl75VvzHgFw4q6pVBsgbZbhfbrW2FuYFc4C1
         HyCQOiGK1JFchjk2tiIrfYq9STm/rONfufL82QkSDdC9VySTBM04TouEb2eEf8Pohi/O
         kl7uSHgcyPOOj/JVxBtyTBNm2Il4Shpj5XBFZuJTsVG56v+xATJnJ1MF9a/IXPPPWCCX
         N18g==
X-Forwarded-Encrypted: i=1; AJvYcCWle6BrV+JC90siJvpaQYe0fgzTgX6bwl1LJmTM8DbquMwwu0iGucmt2SJ6Ce40LZZnv8m2ZCFDiJ1N@vger.kernel.org
X-Gm-Message-State: AOJu0YwXzZGdUZyOPQEfaAAxdb9d0jsRs4qi1Avc1lzljSJVnXPkUBLA
	IiKgYJoIAe/8kZ0R8Sg2UjswRSlbd0QUnZKU+Feyc9kSKdxdwyYSDULzuGaU3ME=
X-Gm-Gg: ASbGncuFVoq26PrwmU24d/el9Svq7mpHTz4Shwe16CJnWTpm57w4oLEMzuf2DJK4hNf
	QVNin5ELK6Y0S6dG6AB69mQemw5i2pWHyE7P6hVZr072T9F0D2dN0mzaK4VuWQ5vFFwyibKF884
	MmPz5oRLQXWAdKyg/WnxGTFq7QT290Rax6czr2AP3L1u+KiI51TH2KkTPbGeufaBg//EBd6cEzq
	aMTuTAzcjEL7Mp84qZyxfIWJX5RfcVUI72Vt+KpOPrFxUKN
X-Google-Smtp-Source: AGHT+IEaWht0l5bmuNGPlxvgkCqr7k15F/R8lKePhz7YkRQa1YIU7EjLK0IAYMu0soZu5qf51mZMiQ==
X-Received: by 2002:a05:600c:1c84:b0:426:602d:a246 with SMTP id 5b1f17b1804b1-4334f020b7dmr44858905e9.32.1732176640005;
        Thu, 21 Nov 2024 00:10:40 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d902:9409:ef0:268d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1170sm46696195e9.3.2024.11.21.00.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 00:10:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: andriy.shevchenko@linux.intel.com,
	linux-gpio@vger.kernel.org,
	mmcclain@noprivs.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sai Kumar Cholleti <skmr537@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: exar: set value when external pull-up or pull-down is present
Date: Thu, 21 Nov 2024 09:10:30 +0100
Message-ID: <173217662607.10730.15286784016289020495.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105071523.2372032-1-skmr537@gmail.com>
References: <ZykY251SaLeksh9T@smile.fi.intel.com> <20241105071523.2372032-1-skmr537@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 05 Nov 2024 12:45:23 +0530, Sai Kumar Cholleti wrote:
> Setting GPIO direction = high, sometimes results in GPIO value = 0.
> 
> If a GPIO is pulled high, the following construction results in the
> value being 0 when the desired value is 1:
> 
> $ echo "high" > /sys/class/gpio/gpio336/direction
> $ cat /sys/class/gpio/gpio336/value
> 0
> 
> [...]

Applied, thanks!

[1/1] gpio: exar: set value when external pull-up or pull-down is present
      commit: 72cef64180de04a7b055b4773c138d78f4ebdb77

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

