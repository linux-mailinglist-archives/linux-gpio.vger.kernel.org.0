Return-Path: <linux-gpio+bounces-23585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4FB0C50E
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 15:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12FB01765F4
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 13:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AFB28C03B;
	Mon, 21 Jul 2025 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lNDh0Tt/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B152D879B
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753104056; cv=none; b=ufVv4Jewdmd7UIOlxJJSacVKi7GCGOWeH6x/x2NEK+JxaiNgCCtwytlBJI0zDNbamOVSVxl+tykURyr6ySWZchNzsmLqdab4iZs+d1hPYswJYcxoCg/myH5oT/wlQsjmNO3vdHgSv3DDIYSfvUhheGJ+vupvV9nyZ9m8MoYFLkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753104056; c=relaxed/simple;
	bh=csowJfkebzUu4LICmOhIQN/9/sSDnT9hAUq/BxNZx1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gFJzqv3r0ZRnyoFLlbUylETex+gyNi/WhDAb6+iqJuu4X7Ni2Vb5iRwHdNaW9cYaGkzTgZRnF+rCa0Q0L9nB7/OWv4WJd6n3FKTrqTY5rBqK+EWeDgw8ZRy/pz2x1LRgtubfxicUzyL+Au9XFZhm8Rpd0Sl3RtI/Zbj0PgdPxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lNDh0Tt/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b611665b96so2354268f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 06:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753104052; x=1753708852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYXS6Z4C2+wJQk5m9v4RBAQHkGE37+eH46M3PdlDCsg=;
        b=lNDh0Tt/VUIe1RGdQ97PDeyxRm5gilyHd5l+54i+qpsEqUVrn2U50fQD5+2AzVD+Vq
         h+UvGesTumU67HlVvL4aET9rsCrnZ/4GNdUTdAfMo7SJOgZo2O/WfrBw8fxEPL9t3awf
         qKVKnoWNfbwAEijTTZRLEuKeTZTWOuvwC8sVqZwgugKW3TE6MpYlwmve1Qfqm35lcwCm
         MKgXlxIxzwIeyAywF32XFUvZcVNFCoZqVvIBh+YfA+q/gG4lfY7f7Q75y+aNcsQR0BNs
         dmDnwqMAKJD3ZqpU0H++VRJFKcKSgTecA8FfgADKgGDHzBvPgHTJFcYKLKD9MLt6LeUc
         Gqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753104052; x=1753708852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYXS6Z4C2+wJQk5m9v4RBAQHkGE37+eH46M3PdlDCsg=;
        b=BZr6S9SkCI7xldnc0Gnvneav/q9XceIfPbPmgNkP/hT0qfdouSVHWSwa5DSJovxuiH
         JphPCH+JbbZG67heSbGaOUmo38Ta7muanPcybEe2fY4aLucGk8Z9LvOLztsHyIPYVpwb
         3y75BPEC2OQe+iicXFTRlIe8/ewM5u6z6uJoQ3iTRlsAFQzJkV/+Ho9FNKsopksX9me2
         /3uivR0MnvYFag4njKyd1TU1AXBR0L5yv6+gUOgIdIdbKl16nUOVf+GnPbdNb8EMt8wV
         NC+ejnlM0TJLheFy7fT+THjQhJOji99L8umGBssSLrzQ8xTwcks96HdunAchNc7AZHbC
         E2Uw==
X-Gm-Message-State: AOJu0YwnZ9Jv8amZWiBen58ElpULpatT33/RJDIw+ekf5NECp8DlJE7J
	TIQ9nzhNMvar3jVu3hKAi4o6k+J9M6J2rNydD4zZIHTRxtMVw8kdh4TBTZSpsp6uUvUegKMkyc7
	GTP0tFJM=
X-Gm-Gg: ASbGncuyWBwq8sGqHDOujEPdcDB9K4mduOgsVltoXJGDk+PQM41GCsPjlwu6n3RJZmk
	W2BOvw6z8bgwRI83cwCJipjsI8eAX6nHM3N+Rs2eT1tptFm+OK2K/lcKO+QKXbHVrILOjADuXhB
	dMjSgRMako7PfnmNZoZsMd0AenBO3L1h4n4T1bSxNBl+wgTy8Vabknk8vico3nKNOyWdDEjZ8Bs
	zLLjXVEWoy1zCOvNK4NF90K68JTbMDdOAwT89lauL0hmBw9zNq7wiwrwF5C6MWU/5rrsDqDp6Ue
	pOTlx73gTI9ozBLMaItgmJpfmRWdU34M0RFwDhzCOAQlt0qM4UYQee2UZa9lICbM31Csz7Lief7
	mdR6nkIQpqguzsoq0JOJddg==
X-Google-Smtp-Source: AGHT+IHZoITbcEgUTkczUSJXHHUzyWtU+a7aEFE+nFxHryxPJxU8Gy+KEUd06fAznmRKlpLWkYfB6g==
X-Received: by 2002:a05:6000:4382:b0:3b3:9c56:b834 with SMTP id ffacd0b85a97d-3b60e4c513emr18302051f8f.1.1753104052572;
        Mon, 21 Jul 2025 06:20:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a0b1:7516:7c6d:ded5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c298sm10445189f8f.76.2025.07.21.06.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:20:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linux-GPIO <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Erik Wierich <erik@riscstar.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod 0/2] bindings: rust: mark raw constructors as unsafe + rename to `from_raw`
Date: Mon, 21 Jul 2025 15:20:45 +0200
Message-ID: <175309950626.52365.4762790605203256811.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250721-rust-unsafe-consistency-v1-0-aa1b42ed5983@riscstar.com>
References: <20250721-rust-unsafe-consistency-v1-0-aa1b42ed5983@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 21 Jul 2025 09:41:52 +0200, Erik Wierich wrote:
> This is based on top of:
> https://lore.kernel.org/linux-gpio/20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org/
> 
> 

Applied, thanks!

[1/2] bindings: rust: mark constructors that take raw pointers unsafe
      commit: 1651710b378f7d8bf2fdf647c7f992828fdcea6d
[2/2] bindings: rust: rename constructors that wrap raw objects to `from_raw`
      commit: f1a949f8276eccbe8ad838adf7f9ed9898aba5f7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

