Return-Path: <linux-gpio+bounces-29119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D420FC8D515
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 09:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA3D64E28E9
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 08:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA21322A1F;
	Thu, 27 Nov 2025 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1fvDhN7c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD26523A
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231707; cv=none; b=pyLO5c0yPQONH23nYoaH1hvjl/cEUM5EpRG9LbhuojANn+myx/mMHILjJgSkT4VCPxB12RCAhsWU0cF8fHQL5h+jylxY0ik7JvuK9j33inDsapVO+YwkghgkxIwk2Jx4wFjvpuQsMjHX2Nj45lkYRMrrOmnYvHhVSNAXchxF7K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231707; c=relaxed/simple;
	bh=Y9HbYHfS9sLGPwxxlfvNCTbzS2ssSvhlDBLvtPBhoLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPHbxrlMFO9nj0fpaQcscvXszNRY6KSKrU41Mrg5tBxc06L6v8E5LaXubc4QeSFPCpq9Qr0n2SknoqTL6XJ5RwMnGMhNH81/B8qK6Ll/IxHDortEL09LQUtu7c7JcMo40rGSUquIT3eNDOaiBbPq1JkGgiqSEwxGDQz52lj3qPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1fvDhN7c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47774d3536dso4441135e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 00:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764231703; x=1764836503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wFtUrQJYvhgrliY3ZtBCl2DhI7sZrvKomnUFVXMk4U=;
        b=1fvDhN7cPmoT9olXfcjOSH8lj2pnBAKxDEN6+y6ZQe1gXULiLvIqDVluB2rEqTn4hR
         0GoGx0YAs0TnX8U8CE1hW32yV7X6GFsQva4EJPhlhMGQ9tq6UrlHvZA5J47XJmvJoVkt
         eOBAGC+KyFVJqSGgNwF04HhvOXbrGThmUq1W7LkGxHCxVwZXkKoZlhmVAEpPNc6d6qAk
         sWloa03c/FHUtBLx/CzLMVt26pQZ2mtqMXy1krlfb/7ZhwXYsLepxT8t0g7LTkHWUgMW
         XOTe1HwbKJCihzRwmn/MgOHryvn3LJhrlBbk9/uPceot3M9n1DrjPqZO2tPALnRjalSu
         jisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764231703; x=1764836503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7wFtUrQJYvhgrliY3ZtBCl2DhI7sZrvKomnUFVXMk4U=;
        b=e4yWLoKIpeZbQ4xadk0PPT1HU8yqbN2NIQDT1tFUXesgPycUc0JXOgmcVEmCvc7MtJ
         XdYyBGIdSutmVPPHICgAprw4dflFRzPUaePBvFeBTwxi3QfOnU8u7i0bnR+Lr5bCpaIB
         qo9i7UpRIkExzitF8OwqSicDSjKkFAAy4fLZlyKOc6+WV+m+t61PFKb4cEsArmSXHDzV
         4LNK0zZG3+ihLjn+h6e0uzP95gRnxT9M5/zYDyftulkeY+PnXulFYesFFPOr847yonQh
         1/ctYXURQO6iB6KNRMjIqVTsmNrehOBaPA5lCJvnwkV+ftpqyFkd9cvNytRvx9DCtlaT
         o+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZHGf6YcEib13r6d+1080EHP3qZaNdrTVO3a2SlD6SxoagVedFNpgp2H+z6Kp32QYaWIvQrwZrGmtu@vger.kernel.org
X-Gm-Message-State: AOJu0YxYCxWsqbiQ2VyLm67M26FFpXb6SZTS5EoZU0Hxj7+FTN2NEvFD
	+RLbm0p5Pyw4vcElZkFUX6iURXNTKCaujaWE9ycH0KqSniAxruijkQVBfRAFXvyLQIM=
X-Gm-Gg: ASbGnctUKD2kZrNfkb+8/DsmJnE40jVyqp6cvdoRvrU5zFA6macPvtjSSt9xho+PTyU
	uGhtSMANVGBdtTJM+ZFlIfbJM/JrLHq6kzxkGhDl5vZhPgB86/eJjCS/VRN2mCchx4fA4b41bk3
	8/kZcoytTaHpfP9GL/j6Thwzgf5lEzb5Na4PCd6tLI+CnUpw8JLqqnTbOdTLIF36ugcdHe6tiPE
	Ec6tc25Bz9+dg+N02X5rkyc5TuipDpu/cMFGSImgJrfDPyATygLjrwt+k8D/AY+wGSewqYoQMuG
	MSeGGZQV/p/Su70xkCV5IzqSSg6C/DW0s01zZzwRHo6Eu619xqBUL0H1YNM8s/6feXjtl3TBwhU
	yvSHYWj8cBUxh9nv3UTFfNTiDpi98uDu0OsGrZVkwDhr6Jjb3zNnwL1M6uhoZHC9d2DYXnX4ZUR
	tc9KaPcw==
X-Google-Smtp-Source: AGHT+IFUSoYvvgrvfuRweTnB8dHyWguLhMvmoW128+Cji2p3fl3QicsjjyDtIeGjTkbHQJSh+55q+Q==
X-Received: by 2002:a05:600c:c8a:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477c04cfb70mr246319795e9.6.1764231703074;
        Thu, 27 Nov 2025 00:21:43 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:bd28:e1d9:5af3:b39d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111438b9sm21446735e9.2.2025.11.27.00.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 00:21:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Val Packett <val@packett.cool>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] gpio: shared: handle the reset-gpios corner case
Date: Thu, 27 Nov 2025 09:21:41 +0100
Message-ID: <176423169902.7348.9978985875894103087.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>
References: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 25 Nov 2025 11:19:09 +0100, Bartosz Golaszewski wrote:
> There's an unexpected interaction between the reset-gpio driver and the
> shared GPIO support. The reset-gpio device is an auxiliary device that's
> created dynamically and fulfills a similar role to the gpio-shared-proxy
> driver but is limited in scope to just supporting the "reset-gpios"
> property.
> 
> The shared GPIO core code does not take into account that the machine
> lookup entry we create when scanning the device-tree must connect the
> reset-gpio device - that is the actual consumer of the GPIO and not the
> consumer defined on the device tree, which in turn consumes the shared
> reset control exposed by the reset-gpio device - to the GPIO controller.
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: handle the reset-gpios corner case
      https://git.kernel.org/brgl/linux/c/7b78b26757e0d997b31635d76eaa46d5ef5e1431

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

