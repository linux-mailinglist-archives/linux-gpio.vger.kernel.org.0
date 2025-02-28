Return-Path: <linux-gpio+bounces-16831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4DA49D81
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 16:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDA0D174E28
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 15:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2ADE2686B7;
	Fri, 28 Feb 2025 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tT3ygLZi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1641EF398
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740756766; cv=none; b=QJDZ5hVfsSCfXDn6hrAvhcIoUK/kXejkrkLVCd5hr/qE1hlmPyXCp8h1tVO46T6xpJhCjpeG4pA++uqI+MIyhCkiRaXwUqS4xsIUQZqZN+exLL4PRvxsze1HKo3BkJyQlFiQaGPip19Cb+eAOwBBLVub/lwIToIaBH6DWpt7DIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740756766; c=relaxed/simple;
	bh=DMQqRiGujJ4dSNfxS4EszoUvJrU/f3c6wp4L0gFxA/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YqfVXpM/kTJDDr0FRS9goFW///WpsIZslBEiBq4uDKj/wm2M6UZzP+z9RkLCQbxqrPHQ/x3Z8TO4CoE7gdTc0qSQD20S6M9T7dZHtuHB3Shf/kjNf5aRjSttvWc+lbfPZiP97hBzHHNdG5tCg4gTAYMPcKfdvHkXhvXIhzOW89k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tT3ygLZi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4397dff185fso20359305e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 07:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740756762; x=1741361562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMUKsvaouG0UB9E7Om23QceA3c5sBw0tPBAVm+Fn34s=;
        b=tT3ygLZiONfl3UfMLqz+khFnxP2zBq2c3aVV5fUHzPcIlgRi5JWVvEMedXURhtm/6K
         6nVAs54U82l/Rlp+yQXB5DqzQ7gvlesqVckxRixZ0nTyr1uyUoqh2DarM6X+ex/m181V
         CGftwBPEEiPX/BI3xnw1K71Wnm47fmxy5hx6SPkdrUkqi1sR1KlhDUwLwcvZHEgbGOPm
         o/Ac5xA6yjOVtkeHVyYtbQT68Zf0JP2OQnZj/A6NNR6xV+oYX+S3dS0odzLzZaWso/1X
         yN3VfMqBpRO4IZ/01LSv2bM23CCovRpwQ/Rnq7IWFs6PdTB5psAAlucR367dU+PMqamP
         HlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740756762; x=1741361562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMUKsvaouG0UB9E7Om23QceA3c5sBw0tPBAVm+Fn34s=;
        b=mC4OZmIeeZaFXZMiWKu3wrTBjeo+S4+V0XU7xAXNg5xZFVgtQoxQdbB+7gNpY4FiAK
         hhX84CQBnfg30h5+FwIUDfc8Fm1tKMnk1ZHykmK1PN95wFklzPkWd2kXKRpuTItArDGc
         jjKA6ead/i38bFsvFMUkWlsvZmBtjQopnLnLIhFiHm32E78qaQZE/wCX7JdVXzLEwNWy
         dhDXISGr4YhGg4Wky0yc3gzIbSI7JxLBkOHOFavATzBmw2dQumHr6HA+ww4O1RxweAB7
         3ISIKIgZ5Z8nd2OHs7qlaqgWzfK2/HpygXTR4mTq3GIuWA4gXGGKqQai0UXs7D2vrnVh
         mwUA==
X-Forwarded-Encrypted: i=1; AJvYcCWss/Paay+Xl9xPSE+EbiJtiWsQi5ww7ZSzE1DFyGRL849tN+hrmj2HLYlPOymm6+w47WuOG0RnNbod@vger.kernel.org
X-Gm-Message-State: AOJu0YzUuruELZhMY6xtUmvni3VJi90rUpgS0iagOK4Wj1xB6U0deFhT
	fHoC4Wv/16zNJ1TQPzNy8P9IC+cb2leqtVFsGh9gOUn876tIzfP5+nQjsmkKe0XvGw/qTQ9kH3L
	yk2c=
X-Gm-Gg: ASbGnctpoggaTH6hJyo84GGhQTSXUFu9vp/dfuf4wrPDMLHog3pI2wnas26cz0JdHYg
	VL98BufgR7jToxp+E2MBcl/LwWwcURpTpoxgzfssGMjpJHmLs1xsFS3uts/WD/dLzLy4qoB6IJg
	f9FkOjxnJm+hi6oaKSVplctDhzBw49rbQzii3pZg6gGBOMFNR5tx0J2P0UBpSO77OBRBcI3mWnA
	N4qL+Bo9C5sNpTUlmQ1i1lKzDjsxuBUHN0wulaBkZi2ZnIwgRBj4EcUaOG307+RPMZX7PyKNq/e
	0K59Xi9Z39MuTHsGSdoVsUVSfw==
X-Google-Smtp-Source: AGHT+IH7Ob5jHWVnFM8sBJW6D5pRWYa1Oj4+ZIyL7NLAPOb1b1HXP7i5h+shOUEsYUZZ/iItiE5YOg==
X-Received: by 2002:a05:600c:3590:b0:439:33dd:48ea with SMTP id 5b1f17b1804b1-43ba66cf24emr32434295e9.2.1740756761832;
        Fri, 28 Feb 2025 07:32:41 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:20b1:5ded:f332:cacd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a28bcfdsm59852675e9.40.2025.02.28.07.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:32:41 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: Fix Oops in gpiod_direction_input_nonotify()
Date: Fri, 28 Feb 2025 16:32:40 +0100
Message-ID: <174075675438.58699.5156226276115874344.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <254f3925-3015-4c9d-aac5-bb9b4b2cd2c5@stanley.mountain>
References: <254f3925-3015-4c9d-aac5-bb9b4b2cd2c5@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 28 Feb 2025 16:03:47 +0300, Dan Carpenter wrote:
> The gpiod_direction_input_nonotify() function is supposed to return zero
> if the direction for the pin is input.  But instead it accidentally
> returns GPIO_LINE_DIRECTION_IN (1) which will be cast into an ERR_PTR()
> in gpiochip_request_own_desc().  The callers dereference it and it leads
> to a crash.
> 
> I changed gpiod_direction_output_raw_commit() just for consistency but
> returning GPIO_LINE_DIRECTION_OUT (0) is fine.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Fix Oops in gpiod_direction_input_nonotify()
      commit: 64407f4b5807dc9dec8135e1bfd45d2cb11b4ea0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

