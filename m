Return-Path: <linux-gpio+bounces-24136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0AB202DB
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 11:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 541D218C03F8
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 09:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234EA2DEA62;
	Mon, 11 Aug 2025 09:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GTKNi9hh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39102DCC11
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754903426; cv=none; b=msXxp5A+BBO1XLYGUu4dDsldRYKtC8YNR5TprNvdVAtCqdZqFJd6sjxtwQjvk5dAQgI59+xbmdtIIBoJR1l9kiqje/JFE3ZA2aixFJQFHRgeTl6H2baD5M7gXKCwtw7Ioj2T3qUnDEfpDhRKdIrlZkdvdP/T+aGkGa5phmsPV8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754903426; c=relaxed/simple;
	bh=BSdWVhUTIy6tDuL3L5IOzn1Nw6xqLVMfWculiyMyf8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgWYYDqEUc5nv2fVbUkgSJJL5g6LrIoykm63mHtfj/l3Y/P6UFraJfuuFvcRusRXb0QFCfU2Ac6AcWQQTjMw9gJSiqC+FWeXUQOkWF5zZ4HwgydOv2Fcw6ptX804lRp0EnrLRj/Dpv1o/MuLefxfb+RvqnVsn9lv9SZGKq6AdCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GTKNi9hh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-458b885d6eeso25496765e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 02:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754903423; x=1755508223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=getqxxqI4IYWAv1zwuub7p/X9Kc/42e8+v0m6uK7wbY=;
        b=GTKNi9hhXUaF5EII/a5UX+LfP+yOQ/t8FB0zAiL12eacL2W8otlzKt14vtYwVIY/ux
         Hs3qHTywEmmWY0SFwzQRKgrvG7tZcJ0G4QMqzk79ee1mD3TKNscITWJim+KfSG4RVUeI
         pF+Uk/EN9Lt4i+P+RQVn3WHrR9bQWvqTLzlDtyv3br014xT9+Vhpndw15/r/Lyo4POCW
         n0c8ui1faR720d9FHz4ZfGBnck6HrtmD9YRTgmTIBT95GCYSn6o1iS/O3Yy7Srl1cOGr
         lvseESzONvHIVCs2whbf6/a0TxInqGTJ2RzmjOVkbjT9r1D0hQj1aNDeBSrGJ2838vsX
         gXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754903423; x=1755508223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=getqxxqI4IYWAv1zwuub7p/X9Kc/42e8+v0m6uK7wbY=;
        b=BxFb6BR1G2Z3EPw8mMHjOXgyEpcvyBnJVX6OE/TaH3K+Uekx6BRmvyN470izizfLrN
         ixX2lSziY/83SMIbBHIwh41T/lIzH57B3Mu05I3lJJpgQWAyjwKEZ8idqonZplIyrqV+
         K1qzf0esLrRvi841T7FvGvxcE7DVf2mjMJejxYazDI0T2QVbBisElckpMtl39m4UScmx
         JWWx9z5gir16K7gSIFCmLp3Nxd2mbw6X5mhm5l4WvdJd+tyxQRoJhCGVXdTGS4Ma61AV
         soB9bFWYC49XsktsOEiaw6+XRz9v9JTifqnwELXcz/6yMj6QN34vvUzcPz2bbg5Ed+88
         65aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpSm5l7dlg2QZOMVju+3rGOyVhtX6wFT1hcvbv/E7Oja6K7LPHAkLLiRK3Ec5XYJK1klfGD9c3ixOn@vger.kernel.org
X-Gm-Message-State: AOJu0YzxAJLcGm+rWcVgBTIl2+BPHAebnibCP66DS5XDCm69wFhjNqPc
	FeYcJf0rxRuFFkHGwTi+7/xM2oQcM09rRpTtn4mXQ4I1e2mZ7/PVvvnLn87cEaxWYLHeeOYytDi
	Uy2PC
X-Gm-Gg: ASbGncuByaCosjCSmVRRV8yMzPBt0+GhC7YK4xwwbgMEy+exe2jHUhz4VR7VoYz28Ly
	hcKjL16tknu8KMRwH7BBZfrigkJzC7ciUGdKNVvK8H5sojA8pqp9T+nr/wTxXtnE8GmGjlo2lx7
	zvMHSb24nlDQsX7Oh/HNrUUJTZiWUVYn0t0EQEchZSq7WeszSTLPk81wXUxHU3P1wBf3wNZiYY1
	Wv71gDzTTXtbLIiN8jZsDIME7+IG++aBDYK5LuIdlsnQ2ib7fFJGt5v4fw40PXjG4dTkYrxA45g
	fWcB6UThPEYmaBkgWNsTFfaOsZoeSLXbPJLocrYR4sUIpUONh9iRjmQXrXRKl4pr50JpFFVs5tb
	6YquwOEc1BjvMfAxyeWHP3OSv
X-Google-Smtp-Source: AGHT+IGwhs3VtPVZ/P8mv28gj9uIaY7WP3Ii6aC/nzoBDwzvKpNnfLdUjPcK5ZtApDjnZRHcV6o04w==
X-Received: by 2002:a05:600c:3b1f:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-459f4ea0e52mr98718755e9.7.1754903423039;
        Mon, 11 Aug 2025 02:10:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453ab0sm40220239f8f.44.2025.08.11.02.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:10:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Li Jun <lijun01@kylinos.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3] gpio: aggregator: fix macros coding style error
Date: Mon, 11 Aug 2025 11:10:17 +0200
Message-ID: <175490341188.22509.17969375763475423595.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250731091637.595136-1-lijun01@kylinos.cn>
References: <20250731091637.595136-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 31 Jul 2025 17:16:37 +0800, Li Jun wrote:
> These changes just fix Linux Kernel Coding Style, no functional
> improve.
> 
> -Macros with complex values should be enclosed in parentheses
> 
> 

Applied, thanks!

[1/1] gpio: aggregator: fix macros coding style error
      https://git.kernel.org/brgl/linux/c/7ce73ee6dc5977fd9dbe8194e7e8073a2f9a50fb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

