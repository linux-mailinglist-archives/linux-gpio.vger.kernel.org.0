Return-Path: <linux-gpio+bounces-23195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1C0B03046
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jul 2025 10:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E32A3B1844
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jul 2025 08:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16634259CBF;
	Sun, 13 Jul 2025 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N+g0JCry"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397C24169D
	for <linux-gpio@vger.kernel.org>; Sun, 13 Jul 2025 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752396326; cv=none; b=FhIe/u5LjsB8FlmWaozcKGWd0+wYsGh3WDI6tHBbSqVUNyWRnU7SA3iNQ0d3TtpkCWEu8ytIgWxwT9pA5fby6j68sBzfd1qBRDb4Ltk1s4951F2ixj60lnYj2xgXebcLvmPm+/Q23CX+tD3Fx0LBqg/vabsJqOd+QjigmClQPDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752396326; c=relaxed/simple;
	bh=lusFvrluC0wYhKdUfx8ugv5q6txV7qMpLVOYfgxd9LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QdiLPiIzGW0In++y3gYNYhfsu5gj6HaB8vaZqsRlKYhJI8QBK5fKKWjkH2m0NHjWFfb+0OyxTa7KdDRAgEHcODBe7ndxZSK6mcLZWutpxMg/bswO9RJElKDutiwAwfQV7PkQ21XjQ5GaNOz1hd708d7833F68v7h2j57Ydj8LBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N+g0JCry; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a588da60dfso2359726f8f.1
        for <linux-gpio@vger.kernel.org>; Sun, 13 Jul 2025 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396323; x=1753001123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOOUWMIdhHkQ+tRZU4YDol3EV+jZsKR5HFpybqxFDYA=;
        b=N+g0JCry7y8ysYbIIpQiT8BcKvcUCSIkaDc1iWf4p5xM6yT7P1SGDSP3hVgQKzUyHB
         Ig2DJvT1xZ1DbcRwfvDbJRj0xB72ihGKLxJBnRM0UqA2eRdr3X6nYL5WarK/bfmrbKOj
         rOWnQG/gcqoHQ974QrCxujo5uK8TAKhSAeozdv857HxzHxtpjWo7wRKumxCM2luoiY/0
         lHvF4ILMHvlplKPy8eVb8QZmzUBzSZGJhwJdx7u7LoklCdrGRvhxOs8y9mdDOc3V5V5G
         YxUfUhJkzpQBf7FB1t4nxl4O6Y0DT4n9oo5LgCJzivmYDLW2AhMhnum59f86PmBbRai7
         RvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396323; x=1753001123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOOUWMIdhHkQ+tRZU4YDol3EV+jZsKR5HFpybqxFDYA=;
        b=QQGKu8QW9nlM1iVBaQrlNhf+pQDEZN69LePFDgNJpGv01rhMuRDWdCUX494N1PZpTn
         KE296GyjgafhUGx8UlNFzXgmrlve/sWx2hksfsO+8kdhZxcREt+fR0o1gdzDdCczeCXY
         CFpbF3+NUvWbdyrcn7XLJxkZfIkHdiIvZSixkEcLyozzkKEV57pXysZi6UvStfY5tTB7
         EQwTg1gfrZkJFcNXTfGKPvWbIIN0Xo/7M0WTM5yQraH1JnsuCZH8r/7l360lbnz9Yy6T
         to2lMW1VnUgunVfMIjh6MgGWuzIL9kgdVwgAh+7MCazAZBqbs061bzB8rgff7B//F8Zv
         FY+g==
X-Forwarded-Encrypted: i=1; AJvYcCV48ThH4lDXIAffEE38PmHRJ5s0Iq7bNlfgpn/fFsQPRNsLbdfIykocqzcwOsRnLxLfLcKW2XirqsGE@vger.kernel.org
X-Gm-Message-State: AOJu0YyhjvQr0HYHRLQPLhu1VFVSB1IEqv0wsQmPPVS6jPQYhOFpB9o4
	E/lFLv9mT1kV0vQXC6HfB5PMNB+E68TQEU7wh7Gf9a+c8TTqvXhqRxqy2pm2Ldr51X8=
X-Gm-Gg: ASbGncs8H3fCugdvVNkrwYUQiUbYoeJIdxVtTiM2p7bZWMsQRL12uLc00TbTRzEKklU
	MUL3Wd+dmHrNHn2T+qjpjl8gtTEB1rpAIMnP1zctCnOIJVEstaTydQoqAJQP3HZtqvEtGknZyq1
	1R3p8D/6fwh4+N5ojnNqno+0HrGI3P+mp9huu78epivEel5WX2xPNeC6D68tPaeZLXXaZf+5121
	M+629FH4QHOaSuaXy9/MiMEGhs24XY22FplUDNQbGjUbBGYYOaIGIDA09UjO9B6a0BKnoI0OF7u
	N5dgDzxiyWwlt4Xi7TzOOX0rCVP7r2mqAyvL9lS9tFfNBFnyO5oJqwUkCr091ToPMc5SYpXYqQL
	zvM0zinT3E0jCgb6GVtvsfIg=
X-Google-Smtp-Source: AGHT+IFA2prv4K400SGiTJz+5nwQs90KuarJOb9H+jJVA2bKFFKRJN7i5BSkPopM07i32Va/RQqyOA==
X-Received: by 2002:adf:e18c:0:b0:3a5:2cb5:642f with SMTP id ffacd0b85a97d-3b5f18dc494mr8398012f8f.34.1752396322894;
        Sun, 13 Jul 2025 01:45:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f695:8645:1433:4418])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50ded8csm134569945e9.20.2025.07.13.01.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:45:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux.dev
Subject: Re: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Sun, 13 Jul 2025 10:45:21 +0200
Message-ID: <175239631858.6478.15774208043366926710.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Jul 2025 09:50:13 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> To:
> 
> [...]

Applied, thanks!

[01/12] gpio: tps65910: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/3e498b3c7b96a17037b5777c56ccff33d3bfbca5
[02/12] gpio: tps65912: check the return value of regmap_update_bits()
        https://git.kernel.org/brgl/linux/c/a0b2a6bbff8c26aafdecd320f38f52c341d5cafa
[03/12] gpio: tps65912: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/22cbcfe36e9724fda06ca873e20777d863445ab8
[04/12] gpio: tps68470: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e41e51f07b1c8a642fed121d01da37c1c2994f89
[05/12] gpio: tqmx86: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/9ade48906b62fc7c5b999422891408a4f02c255a
[06/12] gpio: ts4900: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ed8497dc6683cd285ef4335a315d398524c4af52
[07/12] gpio: twl4030: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/0446ce284bebe192be6e0da6e969379dc3dac587
[08/12] gpio: twl6040: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/77ba4640cc1564f29b280040b312688b79039c4c
[09/12] gpio: twl6040: set line value in .direction_out()
        https://git.kernel.org/brgl/linux/c/79880eba2c0feed895e6d2aa8f7e5489d113d653
[10/12] gpio: uniphier: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/42fbbe31634d116a7f6bee75c0ae455bf10a7737
[11/12] gpio: viperboard: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/55e2d1eec110f1278324882714b64465e4e58ced
[12/12] gpio: virtio: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e502df58b5e3767c00e887744b6eff43b7fde3ea

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

