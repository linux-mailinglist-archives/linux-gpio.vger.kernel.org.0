Return-Path: <linux-gpio+bounces-28579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AADC636E7
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 11:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C8F44EED57
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 10:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6684B313264;
	Mon, 17 Nov 2025 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TONqugph"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB57729BD9A
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373887; cv=none; b=Eke5Mcg26jCeZ4BQFECgsB7OKbp6RKTn2yKyjaq14SpZv50oKqTIBlbUZsYpdL2/RRADCP4TZOGSrE1Xya3y629nPsCx2s77tncC3YerzvGW4aViINfzMnLE7S03OPnEhCNeVfyy7CYnZMQXxnm/Ryka3ov0OewNpDAa8rPbqXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373887; c=relaxed/simple;
	bh=sUxmmzik30RUcJHcl9Mo4hULyONy8x0tMDjjLb2v6C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R1yyZCjcxP5XdxvpouzF4rEU/qy/AyJJs9e6dvI0oujvp4zJjN8xDdNdIuo+hh6autMVtLwfMUi8nkb2keQrPdsxc18bC7DpYhsY2M1Zc+0c56fyjhCWCPWm3IU98lStkuA7hXDqLRpf2PA4A+ZJNB6jM9Kv1Z2OkFlcoo64HKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TONqugph; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477770019e4so45840705e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 02:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763373883; x=1763978683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxG2t0oNB06OR4tbCXZ9UBNqKtz6tpbcQaLbdfquq/0=;
        b=TONqugph1RKNL3Ve/p+ZFUpSu/9q8XpeFsSlezj7UU0C1/6yD9cMGOTp33zv1RChHJ
         6atXoaJKOtZlhbnz5B/BH7bsVag3BnBxb/Dq49kdWyA2YOwUg7uqhKDUrOhbw7yCI9/8
         GxLCzHlKjNRnq5RfnqAbX6hIR4IEDTHsYOS+55rzfthVY+HaHYUIyo0YFmgobISZ4QOb
         a4NleMMPjeDVDGF8xyq143dwsDUg71jw0xM1dPG8Crvg/n4CiZkNTmsYw+tw8j8VnC0+
         soT4NGApBEkXuerxS+Sjdu5hNvw3zJh5afmydLctuQae4vHonO2dSIehiCkDnnNmICO1
         PXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373883; x=1763978683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KxG2t0oNB06OR4tbCXZ9UBNqKtz6tpbcQaLbdfquq/0=;
        b=Qd0PGQj/CIT5sbQbxWrvgILoZCCTTv3VjGrU1ff3rgS5RxDbEG4HP0EZ3nTeT8dCov
         PU3zydoCKYpKogdRbw9nl5qiwgsOajPgMMUboIohpdc6tQC/YoAa0KIZrPKGCwFsZnjB
         l8f8pKlNgHKxXc0/rhe/VB776vesWQOsOO503nwb///iQtKeMeDywnXLvDeuLdIIuyBz
         qf6pqTuirRlYuGNLTtvHQQvH6dPlSLs0ruD5//AzYgB4yYJljcaSXUX0gKeNwi4UQJC1
         7mdJzC6PJQkrXSEXn6tF2FSiqsA0j0t338LFKOwWJUmdby+lHp2N9XbwI3U45qJXB1mr
         9oLA==
X-Forwarded-Encrypted: i=1; AJvYcCXYCFmTZGdRRUY4PkBs26H/vFBpeNWhXuoUb5k6JJdh4kUFOL0Bv09LSHNoxnOepleTO/p2Mi/idCYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YybVZ21uZow7C5sHoiCI8UlYtagH5agg+/UUbTc50cHUG7Xq/3k
	jWlALx6VOwQsppMQ1uDMzaTSTW5obH4DjHWIx37Eo6xSOuAJR8m1gsZv66LFs2GlvP8=
X-Gm-Gg: ASbGncu0SMA8tMTrVdPHDOX14SgglAxEfA47nATxqhgZ4oFX6bVyUqTAIiJ0NYS+bLh
	cF9Ccje0vNlpxAEznJgLV6Rto3NRzA68xf7boOU/NJK8VUIfuVvjSORDL8TxPkRvwWxYGCKEfGo
	cN2IuxEfwGabf8If5WLWLDJ7LhRZ5yPkKSCk3KC12ImAOu9spGl83fFTnBs5Z54FNzqUXSTJ4bi
	gJIjiN2JyE2OlnwjTs+/u5yfYxAI59p85MGBNltrL2Ge3rdlPGNkmaWNw6BIqkcSPxFVZEs0rYW
	fkbGAxFJOSRGqcXv0uWxiMMbONuYWxPwjE/zKi9PctKd6AhpEYYjEFoKPGuz9NzG5gSC1lfIhCn
	JKOjNPy43DvMagqQXcZ4nWegYxktbcM0rqM5f5JvLgS66SlYbEVxA6YPRbkOfccrxnSXQtKcwqM
	biFau8tQ==
X-Google-Smtp-Source: AGHT+IH/GibFf1d+NbVobGQY65ToMbd2bGVauIWkeIisTvOKj7Ak9NWrwOzW1UWBaZyb/D/8GOyk6Q==
X-Received: by 2002:a05:600c:4707:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-4779eb89abfmr45551905e9.8.1763373882926;
        Mon, 17 Nov 2025 02:04:42 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:36dc:12ef:ca32:1a1c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e953e3sm294011395e9.14.2025.11.17.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:04:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	pshete@nvidia.com,
	nhartman@nvidia.com,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: tegra186: Fix GPIO name collisions for Tegra410
Date: Mon, 17 Nov 2025 11:04:41 +0100
Message-ID: <176337387783.48125.16535438263488945711.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113163112.885900-1-kkartik@nvidia.com>
References: <20251113163112.885900-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 13 Nov 2025 22:01:12 +0530, Kartik Rajput wrote:
> On Tegra410, Compute and System GPIOs have same port names. This
> results in the same GPIO names for both Compute and System GPIOs
> during initialization in `tegra186_gpio_probe()`, which results in
> following warnings:
> 
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.00'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.01'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.02'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PB.00'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PB.01'
>   ...
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra186: Fix GPIO name collisions for Tegra410
      https://git.kernel.org/brgl/linux/c/67f9b828d4e5e47caf3472a399c25c3c0ddc824a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

