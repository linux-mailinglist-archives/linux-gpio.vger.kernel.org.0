Return-Path: <linux-gpio+bounces-16184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC14A398B6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 11:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AE291886D0B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 10:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA152343BE;
	Tue, 18 Feb 2025 10:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SOEGTM40"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0A0233D7B
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874231; cv=none; b=kH2TyEhm1oB5SN5KW2+MU7gIU16ZTzrHT7tfAAxxkgFUZkcg2R3bO4+uH6IbIshibALf6RhmUfrwRxPSeCXadVjqQSAu8lbXiz1KaA7UocbXp1O/zuE8Jj9a8GqaY9L/BzhHKupvOHEmVjQ5Mzq4QRBdQzIHs81CUBOE57SCayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874231; c=relaxed/simple;
	bh=xeujFHMCY+nFtyw83SdDWyTZME25UNmnrW9TcxomagY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbQTeYm8MEfPQ5POfCXh2lAOHWwlBqp1j6WaoTxwlOqmiQPtU9+3w/NzQAD9/bnsbzduCao0K0RUuc3js/8/HxNQ2Z1+49TfeH4J8frNA9xN95blkMlK/oBiwYqykN+rT/0+G1Sl172CknBrjdwJMsx/mZyY1w7Bi5ncZuJXFSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SOEGTM40; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a823036so55034185e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 02:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739874228; x=1740479028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=My63cd7ru7HTQ8glNW43+MRkF8+2yn42/caAlR8+Gow=;
        b=SOEGTM40p1E6aHs8X5oxnrFxTAIIAUR26UlvkjaQ+z+cQn7pkJhxtMSCEwl7N11VW8
         PX3v2wBKeMK1rcS8hUd0i/5StJVMAnLI7ExCmp4ThyTAc8dm+btd2WUFor1IyCSN75w6
         aR88KiZp/+2YqqkSwnaoDmeu102CmgXyV3YQPbRGihw67uI1Vu63qI+ZqQ7PZfS52F6/
         np5QrhqhKY+nxkZNLDitHZsgWPKpnROHzZ1dDwo3DebRAUH6v2q7kSj0KiffLKf1v7BE
         uzt26sfczw4q+LafGn5HQ0m7ZfrHpb9dWGQc+03qmi9do+RE4aH2qVqXk2LZ3ZNNgDeG
         8i9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739874228; x=1740479028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=My63cd7ru7HTQ8glNW43+MRkF8+2yn42/caAlR8+Gow=;
        b=Ik4SHCyBaCjh0A0VMNFfRl4GZPu/H68YSOIIBwxJ6Eo6DEte83u+Qg2OM2EAFU6YUL
         +FV1XA3KfysrxZyZp515jeAOLs6kQv0n2BXhvKwU4KNN8paHM0opbROz3sdgXF5WqF7h
         91toMo8PO/2olhDmiSsS2wjDtRrPk5x9VOlKv00o1uRgc8t7J/ovybBeCDJuKEyfDI6L
         JGUfVvof+RN4H6Uu2URVg10DYK4ao1D504Pi3dRGwKqtFvC1ouhps9R3NOAT5eVAkDKR
         Nqj5CE8RiY9Y+RmrN9/pX366AMpp30aGBwFSGmEojJ9DdttvystDHM+72TG7g9waxj7B
         2JcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhXW9ftOk6i6MIHtU9L0qCdEccRQDVSNcHyuq8t5AFwBfg1Zn8AuVsw62wy7XKUir7qCwH2G48pEuf@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQum0yvRPxAoN7QsxMYci+8HKNHZi5y7CjcaWii01XZtPXoRG
	GURqRh66rsf03FzzBzjw+NfZFHqvXT0LgGIM1yh6VikSlYHzqQvteim5f8ZoF/o=
X-Gm-Gg: ASbGncsWtt0snvKzRzaIAApAII9kLnaQ2wg7F3kmRa/lOSdxmopWDJaKg4kwQgkwhVt
	XDwS6OtXJPcZ668hdPggdLiPWn5ifIM/G4pN7uA8e8YUyLDa6iiM4fpFOzvc+ZsBBnYVjzUSMvx
	zBIQANWuLNYwl9CUt9l9mN4o2/jB6Z9wsuuH1UmlbnqDFQzY+oAIZc91ZR9cNeDY9fJoti1e34f
	s498i5kXVgNWZlR1bB/oF8HSWblaFuLQ2C+m5OEUPiIm511FbyOREZP4XoYYpn/kRkhB9OC4l33
	BGD5lm/QaVhlZNw=
X-Google-Smtp-Source: AGHT+IGfm6PACdfZOJ901GvbcwDEIKFAn3DcZPGAkkqxiXwl2yyk9SVHBulQEueVmU9SugkMZGi/Og==
X-Received: by 2002:a05:600c:3546:b0:439:419d:ae01 with SMTP id 5b1f17b1804b1-4396e6eda19mr125855325e9.10.1739874227849;
        Tue, 18 Feb 2025 02:23:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:30b8:840a:cf5e:6adf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398a44264csm39952155e9.25.2025.02.18.02.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 02:23:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set
Date: Tue, 18 Feb 2025 11:23:46 +0100
Message-ID: <173987422134.23672.3075019208527367982.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250215095655.23152-1-brgl@bgdev.pl>
References: <20250215095655.23152-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 15 Feb 2025 10:56:55 +0100, Bartosz Golaszewski wrote:
> During the locking rework in GPIOLIB, we omitted one important use-case,
> namely: setting and getting values for GPIO descriptor arrays with
> array_info present.
> 
> This patch does two things: first it makes struct gpio_array store the
> address of the underlying GPIO device and not chip. Next: it protects
> the chip with SRCU from removal in gpiod_get_array_value_complex() and
> gpiod_set_array_value_complex().
> 
> [...]

Applied, thanks!

[1/1] gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set
      commit: 81570d6a7ad37033c7895811551a5a9023706eda

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

