Return-Path: <linux-gpio+bounces-23671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE22B0ED31
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10BC9177D40
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E59279DD6;
	Wed, 23 Jul 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tcNX9ZTf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5324E246776
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259302; cv=none; b=iv6iC4+3z3SuX+tmgSzRfXm8VL9ZnuCBpdLxRPhp4ew9JU2MPlcr1AMp7VKc1vr//kVZWY90/DTvin7tIZTr5m/oe1tQzmyk4oZys7cJNrydtPvlDZ+ymX3U7/4in3KnMclrhPKTYf5d49v/d3cvWqGtC3Jalk1urKpXTrUN+Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259302; c=relaxed/simple;
	bh=6MvseLLstFmue4ctlegk00xpra/zAxh0ntDD9nuLHKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgEAxDpcT45d4wGtKuh+FxtXeHh80Jn93K2UpqT00qvL4zZytMf7AR45f6JA+bRD/Xsm6IIoHj9/cbSjdfqbxIbjLJF9ZC0QmrptQCEb5NRmmsXQuzXjUg9rPn60Z+QprdxddAVsNgZM6pUyteKgJDCvzRcyaIz5PoRgt1QJAG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tcNX9ZTf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45617887276so42223905e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 01:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753259299; x=1753864099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pc4bHJoJoj3aO2qd55BKMxrmnifl3uVSUSK3UCX05c=;
        b=tcNX9ZTfqfYkN5GgXb1CjxNKTK+8gD213fjHDke4HfRdJCjgm5fiV2+86jidELOU0O
         s/667/KO492whsqH6eNLXnNzqmd/s/QZeLX61yk7UdC0nwr61pWlgbWSl/jc8f0Kcwfj
         muRqcggEN71r0tY24gyJNlhji0UUIw1wkzf02ZodHNaxMEbc/M4MNlpzCC1zXpJ14+Fi
         3NHaYgR8h4TazZeMrNmJIhTqTUuqquRX8ZFBVUTnf2/uZFlzBzvMvQo8Co/YTQCKHxgY
         kM/8jabCm7/Mh2q0C52okNLwxUSK3BBr2TE2kYVq0V5eXwQS+VlHsqZKMU4fnBUJymJ2
         VBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259299; x=1753864099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pc4bHJoJoj3aO2qd55BKMxrmnifl3uVSUSK3UCX05c=;
        b=DoJrFaZWpe4l+xeqrjP+cg/iQiHl0V26FYd5WE5QCgMu+VCW6y6xHpSUE2QX+vLDCy
         CVfhCUUbD/WqVTitUIyzpUYk2apbuf4ZPSy2E8OvObSO6gSXhKOxPJMQaIujSyTOzMed
         REgKGa5xEpr+VA1AFcdxG1Yj8UVXePMpNfMdu8PoBa+zn6B5FJGJIRbdLEhrEZrua8pZ
         wiCrQZ0qzqUspGzbIUGLutG4HwVDeRPHCldyKe9hODPhdPgoSvq98iBg3ryNdARg1Css
         3WACjrb4fcIWCLlOUdyeO6dy9lGwsELC2srZFYwLRioGwEpnasXmm/AKQ6ELTrEr5KTj
         FlAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9wwW6u6iOF8n45KToDFg1OtUpqeGVJcPrqIt9KVZ/rHOCCRWlu5eK3H9v1bTmWwuMZrFCZ9deS+HJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg8N0oo4hpwOoFKuo6XdQNBj2SgyYcYzZoerPmCG3Dm27VoDwq
	o8GweknDptlRdakJse5GpIQPG+P4UmnCYxzXQ4px83vF+lM2kgT4VwhFxRQe9rg1yjQ=
X-Gm-Gg: ASbGncu+lqvYYNlr3GQR1bOplJED4lSpduapVciY6H6ATK+E4sRcg5/Qt5rd1DOPT4g
	dr8g9JwKwidrGyxbt0sBn7CxP9EGfVpKmDJ1iyCeH4hhwXe/sGg54H9OLXv83wPHB/Yk/kTUdWN
	qIScllX9SQYvBJid2oyFL1Sj5elZH3TCb78Rl5bctE//42KPHvBuMsnF7g9aXgA8hgUJyQXYgdO
	dVjJLFyJNY4CzOMLYfIWQ8dn1o44pPaFjFkPEbvdQBwkH8OL0C489tFwbA7GkvWgva7mdLCBE7Z
	d6jvQa2uU3reCtaFLnONhOGDa1bdI9x0MVlO3P0/1pRUpDZ/K4myAKUuXSgh9JLj0CdxQSBEEVb
	SLGos/LYtD/i77sK66yxwNQ==
X-Google-Smtp-Source: AGHT+IGK7N5pQ0+Y16nUh78stgbWDqftcQGNI/Gok59MRheVUKxpWDHp9OeWD2BQW29JilRfDWRv4w==
X-Received: by 2002:a5d:588e:0:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3b768caa1c0mr1809547f8f.3.1753259299570;
        Wed, 23 Jul 2025 01:28:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34cd:b1d:d4f9:be03])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4d7efsm15696894f8f.67.2025.07.23.01.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 01:28:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	m-leonard@ti.com,
	praneeth@ti.com,
	jcormier@criticallink.com,
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v8 0/2] Add TI TPS65214 PMIC GPIO Support
Date: Wed, 23 Jul 2025 10:28:17 +0200
Message-ID: <175325929438.26908.5347574022964000296.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250722181609.1541739-1-s-ramamoorthy@ti.com>
References: <20250722181609.1541739-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 22 Jul 2025 13:16:07 -0500, Shree Ramamoorthy wrote:
> The related MFD series was integrated in mainline during 6.15 cycle [0].
> 
> TPS65214 is a Power Management Integrated Circuit (PMIC) that has
> significant register map overlap with TPS65219. The series introduces
> TPS65214 and restructures the existing driver to support multiple devices.
> 
> TPS65215's GPIO specs are the same as TPS65219, so the "tps65219-gpio"
> compatible string is assigned to two devices in the TPS65219 MFD driver.
> No additional support is required in the GPIO driver for TPS65215.
> 
> [...]

Applied, thanks!

[1/2] gpio: tps65219: Update _IDX & _OFFSET macro prefix
      https://git.kernel.org/brgl/linux/c/8206650c604687687bed5898b3bdb90e5d361ed4
[2/2] gpio: tps65219: Add support for TI TPS65214 PMIC
      https://git.kernel.org/brgl/linux/c/1b6ab07c0c800ed32ce417b71b32bb1baa91b493

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

