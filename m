Return-Path: <linux-gpio+bounces-14647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41565A09151
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 14:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AB0F169EDC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 13:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B5120D51D;
	Fri, 10 Jan 2025 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1eKCEyXC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D00D2080E9
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736514038; cv=none; b=SP0Ny+edM2kYWwHMlvAqnh7HQPwYkFqcAvVOR5VjsZx/aGiBX3bicKeqwknBVzAOVy0R36sTr97s1kYs2Ag5stFfObrMsp85DZv0rG1ZvlQ9fLBaN1kt7v3aOtRzB1Hz3KTZH7PDB2zLmBZDqAEOEmnGmSiZuAS6YuMs4Rbdcmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736514038; c=relaxed/simple;
	bh=6Xd6m6Qf56pAA0+r0Q/cgq86ljFZzMNIsMNJ9dxTWeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPLy35uxtl1Ft1mhQ47QsQA/fek7SyUdlRaH+v30iqS70x1Ci6/kBpF7f8z7sxqBJURsnUKqga8q/0O6VHVnbrTJxbvGTagiz7l6FI1QpHAE36ZU0PR1sLaZ6QweYyHvH2ql9LDWMKFRm9z+Z8fVY5CknLLSjhrBO8Cme4Iu9uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1eKCEyXC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436341f575fso21603065e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 05:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736514035; x=1737118835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eGbNecL+K9WiUO3ggBl6xJgcZQagKJNakaKpat4Nv20=;
        b=1eKCEyXC8TYuH1ymu/AQZGx7z3pnfuw2qw+UHfOiKh/mBOuJqkwS71H178hV9+FMaM
         oPxAU9ON40xm3OxGBDm+v9ShUKQCapTsh1Z5X1brx7EbC7rQ9MzmBT30ZVvpwaZBDidC
         skRiniUEOWMwL1hF3NJbS4i5IuMyoi5YVLURXQPtyPandtYnV24WpKQX1+FxcQWcGvP5
         ynZyo+wXK6JuopLuqBQyjQ3klYzDlkahxqyTuBPZZgcG+5+hSafmooonXerXU+bF9AFL
         ahSkAxTmP1UKnbeqPVSlSmyxtBCwboluxySzPmF8FTLVThcX3aUroIHcGKtrCIRuS8W5
         1YFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736514035; x=1737118835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGbNecL+K9WiUO3ggBl6xJgcZQagKJNakaKpat4Nv20=;
        b=DJPznkQBOs+8xeqiIgCq3GIjON/g8dMcqKXbAFN6med07pVEisWDIJ9wpUKAwvgNMd
         /35cNuUQnBiK0MmaWi7tHj8dNDWpBuib5SPhYVIsLNOgD2ld1KgYBTUHzLngsF27E3BV
         SKbCC4IyIUHBaEBglgEuKNTcSTseXJ7Jd5eVM5L9Qke660O9wIM24jbq85jW+G2elzw9
         +eAmj3TAdyxF1iKMxThjUnoYOJZLayCLuujXh6nmVlfjTov/NAFfJ32a/X/PpWcgk+1y
         HFOfLLWMHTu5nuZPr55M5AWtNA0akl/5tOxl2snfOo1zUuF0axBmog09aRfyvR8Pca6j
         6wvA==
X-Gm-Message-State: AOJu0YwnsaRSE+3ge3/X1whp73o0MfgX58OtnD6sTKwWKCvszgDwIs1C
	qLkL7HrADlkeVi1mo63LcIuQGa5ZoApiYZSF6WxHqloyeaXZqvkU+7vE3xwdWVJmWwsOqRRU4fN
	j
X-Gm-Gg: ASbGncs1F+czByBVCNpR0o+7mf7SueLHR2JPoLlSlEJmGQzwHVlCvYxHqdQtlE+vzAT
	1gndkP1XnNKa2haRHMP0Lv1brm1D10xmGrbE2Qv1gvA8Iyd+4EUC+/gnQN5xNL8YIOkcOblxB/C
	TdOYUZsovZb1ERBNQ/qNjDyr9rHrsTS11LsJaL0QRJhbaBbtMEe+cPlLQIEIj3EOOsZP7GKpZgZ
	NrmCJONsUYl5VkXdsRQDGifycunEuslXI0FYGKq3c7P0EmnNpAyVlg=
X-Google-Smtp-Source: AGHT+IErf/j35AOiqc0OKlKOsILU9Y+ZiwnfYZ14qASoSj6/d+9GEQHuJ8eFf/7JBQ7iQNhmyBvRUA==
X-Received: by 2002:a05:600c:1987:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-436e2679e05mr101882715e9.4.1736514034398;
        Fri, 10 Jan 2025 05:00:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5581:e96f:97e:b3a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37c2esm51360745e9.28.2025.01.10.05.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:00:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=20Bence?= <csokas.bence@prolan.hu>,
	"Geert Uytterhoeven via gmail . com" <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/2] gpio: 74x164: use a compatible fallback and don't extend the driver
Date: Fri, 10 Jan 2025 14:00:23 +0100
Message-ID: <20250110130025.55004-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There were other suggested solutions (for instance: just use the
existing compatible for the On Semi variant) but I figured the most
common approach is to use a fallback value for 100% compatible models
and this is what Rob suggested as well.

This reverts the driver change and makes the "onnn,74hc595a" compatible
use "fairchild,74hc595" as fallback.

Bartosz Golaszewski (2):
  Revert "gpio: 74x164: Add On Semi MC74HC595A compat"
  dt-bindings: gpio: fairchild,74hc595: use a fallback for Semi
    MC74HC595A

 .../devicetree/bindings/gpio/fairchild,74hc595.yaml    | 10 ++++++----
 drivers/gpio/gpio-74x164.c                             |  2 --
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.45.2


