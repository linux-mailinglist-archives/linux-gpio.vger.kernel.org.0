Return-Path: <linux-gpio+bounces-13542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE559E550D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED4C7164A4B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 12:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AB2217F3D;
	Thu,  5 Dec 2024 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JpO6Q43H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780CE217F42
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733400563; cv=none; b=qfiRQ618XGagGQVsBkssqbJU+33x7NouB98ObEyLg/l/68YB+WZCgcJMCvTcqlo6+sBoafNfLQKW6yNXjSh/XRu1gmM3HVCnzfbA/n5HTZH0sim0y770t0Rx5n5cNr7pyaiONVLH6ZnYoYwFpYVlPNqZ4+8CYZMNMmOOeb+Tj+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733400563; c=relaxed/simple;
	bh=MExiqEbLQA7GHRItsXCQmg6j3tgjau3zlhvrFBlJQhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fi0ApYYNu1EGmUDltAnNslwDyYAttMdyVQxpQykhD7GFZQyDDa+TYkgBYpjugLIzj7/muAIl5Y8Oobtm9eNV4W5eRtrM1marRQI/93dSsOJHwKtPZF2umJ+YUaMMFY/PQVhcYtI0K7ivnKXaLXDOlxl43TR7st0Wg2rPE4fJg5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JpO6Q43H; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4349f160d62so5931815e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2024 04:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733400559; x=1734005359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iVaZQp53S1n9C6K9Ie31zm101IC6zzVAJOYz+YmFUw=;
        b=JpO6Q43HfJmwe+TDvUVO6bByFQRk360HRyD0qM/0u+vkU2UgMQ9febyRyA5HlYNgE1
         YZCaewn/I2TGkfU1gO0pSsm3QpKKTnrMoTB+Wvbrr8M9GpOtfWMhd5xLYjU+bv4tvXkS
         WVnH8pHPzOSJZIXXp1Hs42Wbn77q5FtrqSRZ+jeo52M0iuhYYyBblvcrOihCgmG+kyfT
         VGrVjWPMF7gRc0uR9/Cenof9XkOWnvP2Z7OP7aUUvW7oXeYceHtj/vE/Fti6xm1T0Ag3
         5HNuyJd4JrQm08rIkDOC324C+YHTauAtxKn75m4eD/rElo5EgLrCy2sI0yMaTqgCLMXC
         7K4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733400559; x=1734005359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iVaZQp53S1n9C6K9Ie31zm101IC6zzVAJOYz+YmFUw=;
        b=NrpcGAQ9F2IT/tfT+Wxwlvt60MnjZ3qCRffjLQPSf6WM96BoTA2GyyavsA8ykJpWTV
         4M2YocOrJS2+eqAtU8em/6Z/k2iSbPJKP+Y3sf7MOIHHT8yVWII7dN3Ej5b0pfbr9rsK
         9X8oBrpnNHKMXwtCf1R95BK/VtEOUt6K9Zj7ofKrj72xngOw2IZ2U7XDxiAUJcw9dTXj
         dFbEW1lzBi4+5FJZ7wPQAAL/LzEKWcm0s9bGPeedC8NZibt0WGPBcSZB7jorTTIXngjl
         67mxBVpf+MmBzR4Z51iUcpgh7GXDijPXa24g6XACuyk9ul15x7GGgbLU74lWkQ2ys3lA
         7RcA==
X-Forwarded-Encrypted: i=1; AJvYcCVNHpibP88ZxlwvpBHWi20q9gqhVNqZmsUqUBSCHlDaYgVKNaV5Sj4U70kjBa6sj1vMJ7YHmEz8oDGn@vger.kernel.org
X-Gm-Message-State: AOJu0YyjxhCacQxK14cNok5jsOLUhj4DGWUZQzEYk1aJ5n7r2r00A9H8
	bUnop8o5xtBzIuCtq9Tx/pgaBWccn+bqf2zzSAVErQv1xyU/FkWzJk6vwGum7HoFnE/eEiRvu6l
	+M5E=
X-Gm-Gg: ASbGncvlsVELKzmdw/3cRGe1v9xB0wXWzSzWmjlYHuZwFxrctROubRkwOvk6UHJd4ox
	foB2H2UbvWpnhEaVMwrqRclwRjwKFXueyGF3zM/9tExlOH6an7L9UDzHkx2aTlkDoDvfAAyVaV8
	0Th49uedg417cnynLOyObEBVR40LuLXUIdFzGPU/HqLCQrBIiYLadcTkc84sbvD6GEr83lbdTUh
	i1hXkP8drpNUtqUrQW4fGhS0IW/H7ba2XWeaC4DOd3Bxs3d
X-Google-Smtp-Source: AGHT+IES0+xRtaZhTVXDsQGlNZ8yu3QjMfMOe7UJ8IcLyaZqPOH+m9RyBfOlSWk9m9Gih7PG4dojLQ==
X-Received: by 2002:a05:600c:19c8:b0:431:5d89:646e with SMTP id 5b1f17b1804b1-434d2268fb8mr72970405e9.32.1733400558715;
        Thu, 05 Dec 2024 04:09:18 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:c2c8:33f:e860])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d04d9543sm51729445e9.0.2024.12.05.04.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:09:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: gpiolib: fix refcount imbalance in gpiochip_setup_dev()
Date: Thu,  5 Dec 2024 13:09:16 +0100
Message-ID: <173340055349.41045.14869913064601917436.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 04 Dec 2024 21:21:52 +0900, Joe Hattori wrote:
> In gpiochip_setup_dev(), the refcount incremented in device_initialize()
> is not decremented in the error path. Fix it by calling put_device().
> 
> 

Applied, thanks!

[1/1] gpio: gpiolib: fix refcount imbalance in gpiochip_setup_dev()
      commit: f81934e9457799e3b8381de2fc75b96fd1498a65

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

