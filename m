Return-Path: <linux-gpio+bounces-16295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF85FA3DAF0
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2838F3B92A9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC51D1F76B5;
	Thu, 20 Feb 2025 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WvQEJBM5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEFD1F7545
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740056964; cv=none; b=lBLeHlI1Cppr+cqwje47VmQ25bklf6thFA1UDLoSIxQDtc7EX4KieVAaNYxxxZwj54uj+PKWnQnJEA9eLrkEk5YodSeooUro6UNjPxgKkBEW48BJJ2xh0hn0DUg16Sf+5eXOmumQ/fPzKh9VkmHmS3gj+0FvojRUcWat55aQWcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740056964; c=relaxed/simple;
	bh=EMGp+waGDautIwmgUrw6ZO1fNBDQkmfgSGqUyA8y5PM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SLrMD6PeHulbebXqneEDitrKHnReNDSccMCxEnWTOztsNonWH1WDxqPRJWLhYxCYqMgTn5NaRxrrafzfqRA9KfAy+aqc0H8gXlzyMMtVcOTqxjH3sJWtWnPlyEgdszeG+Gie8l8c5Zgluyfe7O7wAvuxE0PZfZayQkzcfo3aZUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WvQEJBM5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f31f7732dso609148f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 05:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740056961; x=1740661761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmtqWvOt9IGhgCN8MYbu66ivp1lZ7PoGeZdQgNdj5Ek=;
        b=WvQEJBM5pJzH1Zzs8Z5+60jY3Cmt4+u7FkLc4wfSixkXKdN63Ir0RLey3wX4NQBmPR
         1cfNcnFMxujVMWYMVbrK8ZnhlvimOXB9iOH/N+V7u63yZOfJmzXQPixgibp0ZLJ2lUCt
         FOox3NGIP31NEeVHUqecbauyYzOP6CR2t5Vh3cNSwOqBM1Jky6FsxmnENElB5LYzN0kj
         LYigL7HZHQjWfQ17/qCu+BAtj+DlTC9yjTQ4+T/Cp45FNsqqqM1+s73lb3iMMHDVqSsl
         E9K02Yybg5X8VAUbrgzsE3koezBxi+P6G2kmZ4HVdNlGCtfYAqiesUeiAx/jpbazI+cj
         oanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056961; x=1740661761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmtqWvOt9IGhgCN8MYbu66ivp1lZ7PoGeZdQgNdj5Ek=;
        b=BhccZjARAFSSBs8+W1q7pi/Qxb77Md0BynB5Cpgsi0Tl4wdjvw15UW2SyFNl1KuPM4
         /VBj0x7YnV2dGLQej0MDL6FOOW6/+0UqEQn47lCBfbnthlptty03lZsNz4SpJB07HLLz
         4BMkFvEK3ebajLb7CYxVVG/xg9BNo81HbVIFOHQnrF/zNddYGSWLqoce5IZrN5dBd/bc
         wpRemOPpkmA0L/Hc6bKF0veZLlSxpKa6xBB2lKpgVN5m1xa9veqU2VJW5IAYjDn0cKJR
         5hdiXYGzq21FcBg9nnlimeFTWCPXzH5h4Do1+9aNnswKWqT3WP6JHpW57iKwKBeMIWQ0
         vbVA==
X-Forwarded-Encrypted: i=1; AJvYcCW7KksRqMdqjZ7rB8IplJhXWomRSUXAUoeIBOvgDPnlhY44yTUgPo0VqqL0HqJxXG6g8WPXl9ynYMeU@vger.kernel.org
X-Gm-Message-State: AOJu0YyRrhJa3Xo7DkOjWve93YP0jtUwQ5rjthG0TS7GKM3+r1QOOLNJ
	VVYBMiVPIs6WU3T9uD17E62d3gFA++Ttttqee+BRjoyKOAiRwiaKGijDA1L+zZ4=
X-Gm-Gg: ASbGncuSHzpG+hMQmciGmiPhf8WpZs70lv4ILZvMKjQK4gTZlgOLMcjgX2Us3ezw8J8
	G3gxaNfO2zAS75eCJrJnhtMhJYtiRIjX2Em/C77hUQ4u2gS2ylUIt3R/wIqVJYnb0MgqO9zx3ey
	zV3SIPNMEY7bcE3XSY57n5aqO8a6EsIl7h5GDRyyEk0o6puzHqxZxJDUsy3xv+b+dDKo+9uSjte
	SKkEl8op7m5/3fNBzYzXZ35Hz4cYmr9F1fksJIMXaRTke6/YVKIj2tCL5l+4UPWHs8wJSO5l5vc
	q+HA/xPNuk0oPQ==
X-Google-Smtp-Source: AGHT+IGbIfdv9XOdYL2F63zJDoBS3KeglPP1iXZ2SnLsZHSe0oSYlpnW6eY7wK10PTAW2BxL87BbAg==
X-Received: by 2002:a5d:5f4d:0:b0:38c:5da8:5f88 with SMTP id ffacd0b85a97d-38f61609df3mr3636052f8f.28.1740056960879;
        Thu, 20 Feb 2025 05:09:20 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e2e4:418d:7462:9cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccd2csm21129660f8f.30.2025.02.20.05.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:09:20 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpiolib: don't bail out if get_direction() fails in gpiochip_add_data()
Date: Thu, 20 Feb 2025 14:09:19 +0100
Message-ID: <174005695734.63211.7320786041973824393.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250219144356.258635-1-brgl@bgdev.pl>
References: <20250219144356.258635-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 19 Feb 2025 15:43:56 +0100, Bartosz Golaszewski wrote:
> Since commit 9d846b1aebbe ("gpiolib: check the return value of
> gpio_chip::get_direction()") we check the return value of the
> get_direction() callback as per its API contract. Some drivers have been
> observed to fail to register now as they may call get_direction() in
> gpiochip_add_data() in contexts where it has always silently failed.
> Until we audit all drivers, replace the bail-out to a kernel log
> warning.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: don't bail out if get_direction() fails in gpiochip_add_data()
      commit: 96fa9ec477ff60bed87e1441fd43e003179f3253

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

