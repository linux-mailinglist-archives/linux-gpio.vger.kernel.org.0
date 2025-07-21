Return-Path: <linux-gpio+bounces-23586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C68FEB0C50F
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 15:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91F7B3ABC86
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 13:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7CC2D949C;
	Mon, 21 Jul 2025 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YcP+0Gxt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1BE8BEE
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753104057; cv=none; b=Jlx/lWkYi/kks/3SEj7lbBkX0cy+8+NlmRusrmM8DVYttHHp++7fncgvBhBv9YDu70iMWH5JMXNNzst2qdfv5MP+1NjzjanSnc4Z+H8EEO6JdysVYlS+3atBPvD3423KmCgPrYDI+PAcJhNPSUVipliSke0DuQVBxSvedQRWR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753104057; c=relaxed/simple;
	bh=DU9EX7uGpTMjm6dZrTEin30Y28cl/Nm7upWNmWfXXYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nErTUkqCPk7OEoxWcTLgWSL1YEuR8MqW372w6sq63DTs0M61vRnyYfKhjJJXj5tdg63HgLnEsMV147ngKStOWqM5w2zHyYpeIcpn40ynPQrPoFl9SGNhYUK+FnOjGfjV+nCeAbLaOKAxpPRKXiLLNk8tAZaUPWQrEP3BefzfqVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YcP+0Gxt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso3052913f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753104053; x=1753708853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WG4SMZ8YUpBme9KWDOLzB0ckQIxxFW4Dm+bfEATxyhY=;
        b=YcP+0Gxt+qbi2LRrP4b0lzgvegz4bfPojPaSNM/9Tt7HcDFsX6s4/aPOCn6r3JuwVI
         xVXGWPXo+u7MZk7+4VBIqnA7/+pELyQlbp5zmbFoeqQbPGz9SySK0ySQ58zrL5td9aLA
         oQnUIkJZmCA7rUMfliLwaSqr4lZZ3sED5Ug60AUQ6wiyArhai0MQvzSAKKEg75+92Z04
         LBTlFuM9S8ZoJbtpLjZBckaCIq75y4K9w3ZQNJsNnBfhTCj8EtyLaBEKaV0Ektg+6pvz
         qlq5X8m35d/rLBo8SnDH0cWm2pE82DrG60uO4H8At/7hHNizWxWnOxSsQUSTXTsv50UY
         4hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753104053; x=1753708853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WG4SMZ8YUpBme9KWDOLzB0ckQIxxFW4Dm+bfEATxyhY=;
        b=M0uA4rLnhzwLlUyWqALY/G0QK8hYv2V6wnkS0pP+onN+DFrVJnXTKRP14axeqnj8Eo
         nR2nPEaDrNa28qCEDvO1A+uk+ssGtGuzHwEzMaxF/s5NyPkxR3PFQGzvJzW6ne4vsICX
         YhCS54yEBfPzVA2YyGLr9Wk6xEDIT8mO4kzor9jqyrgwIMgDs3P2X30yKBCmU4ctalLZ
         x26t/D7i78/d8bzpq/Vy0z7iYMunqqI0j+PRFhay3HVFa8cUvL2ymjtqAnyRYBMh7HKv
         U1GirpIWaC+NVXCbauqZhbMPyl3+gOu4yLr30eXXXufdYKn+jfo8X12sWlvpJt5r4HGl
         cwaw==
X-Gm-Message-State: AOJu0YxeFiTT0qyhCXoLGRsVKoqJZ0R9i/i+Rss9wZl2zPin8sALgZIp
	z5WRkeZ2A58mfu9IUGMZXfuv+pZX/9N/8C/H2ubv1aCrcTgIUihK+kXHgnNw+0/JdokEsj9lcR9
	lu5tjUN4=
X-Gm-Gg: ASbGncuc9oU6OnewI8ZRWjPZiXswbbhS/ejUUSQR86RuNNVS7P6Igc+X/ZKIfDdwonL
	o7Njv7L6EvyvTUtXD1rN39FI4x4Qc1SdqvO7mBjgeRbXzbysmr5S2xaBQGCsoHkYMIgqZVmmDJT
	HyuV+8ovJZTBdas+lJOOyvnBXhXmx8KceqEQExQ8E+MP8w2VEqltxsXyj+YWvKk1uYexBJ+GqD+
	QhNhRBW3RN28M7NUumcFfFRhLqYHE8KuEsLuQdMkEEcE4YBvZWR0hebUWQwnE9EUIW4WdQDlWgu
	06GrWrTERkyJ2W8weZ4hzJMFixZtQlLaIVY8kwEVcKgLBd1yp6qrwoTlmowS8ldyvQEcFbpy+x1
	EPZZFvAfIWsg7MKYDSt+iHg==
X-Google-Smtp-Source: AGHT+IExX2KQNAI670YXGVCn0tb30EYFO6S9IYnQQerykycOKcM2rgdsBGO/MVs2Uy5Bz/5CyD470A==
X-Received: by 2002:a5d:5f82:0:b0:3b4:58ff:ed1 with SMTP id ffacd0b85a97d-3b60e539e8dmr14764971f8f.52.1753104053192;
        Mon, 21 Jul 2025 06:20:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a0b1:7516:7c6d:ded5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c298sm10445189f8f.76.2025.07.21.06.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:20:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linux-GPIO <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Erik Wierich <erik@riscstar.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod] .mailmap: update Erik Wierich's name and address
Date: Mon, 21 Jul 2025 15:20:46 +0200
Message-ID: <175309950627.52365.7626415135686614244.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250721-mailmap-v1-1-ee45b82a01f7@riscstar.com>
References: <20250721-mailmap-v1-1-ee45b82a01f7@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 21 Jul 2025 10:04:10 +0200, Erik Wierich wrote:
> I got married and carry a new name now. Also have a new mail. So this
> hopefully makes it a little bit less confusing.
> 
> 

Congratulations! I picked up all the patches you sent, thanks!

I've sent the earlier rust patch for libgpiod because I finally forced myself
to start learning rust and to that end wrote an actual rust program[1], which
you may of course find silly but it allowed me to learn about traits,
lifetimes, closures and borrowing and I really enjoy this language. The
initial learning curve is very steep but it flattens out pretty quickly and
after just a couple hours of coding in rust, all of a sudden the libgpiod
bindings - which previously looked like Chinese to me - started to make sense.

[1/1] .mailmap: update Erik Wierich's name and address
      commit: 74ca5ca5b71d281801a3353a3d7f0ff04a171c8a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[1] https://github.com/brgl/query-maintainers/

