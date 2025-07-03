Return-Path: <linux-gpio+bounces-22762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68608AF8257
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 22:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB4D8580EB6
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1055A2BE643;
	Thu,  3 Jul 2025 20:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SI2E7wqP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC4E770E2;
	Thu,  3 Jul 2025 20:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576268; cv=none; b=DhoNOFVja3wqwMf6QBPnM+hyoBNWc2tscPp9DZV/aR3VBXdCHU8bWRgAhmQvFWsmNF6YWwQ8+BP9gBVOXQkzc3EV/xVCibLyMnxIzRYdac/Xfon+eHbQIMeL50K40BUr6mJPoHf1OopLte4YuUndIYy8xGp/ZBTqUfd4OGbbLu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576268; c=relaxed/simple;
	bh=L/HJxWraoJJGAyfMml1HQfngeSdjqId2y2nOtcTA0Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFSyqebvty5lRU12NiM29l7TJCxFZ3tUyVdi4rv9VtMll4mLdATOdAsph2caEx5+cHQ5Yo8vJhWOLnBcRIpsY3S3tvsXeJDjsdOz8oO2eLo0qvCg2aA0JzLdL9uqbUimD0RvZwYK80arQgwlyg7JWDtO4tB/8E2t+K/anclXeU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SI2E7wqP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0d7b32322so37088866b.2;
        Thu, 03 Jul 2025 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751576265; x=1752181065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBkaho97iABpwJgMVEyGxzppH4SASohj0kHuBpkQI3o=;
        b=SI2E7wqPRUrZ3eVb7iIT5zpJOhuMk3kZxEREdvJSrVoxK7yREmGWvc4OU3xNTgw1D8
         YANcWBEIRltC5ICE/CQ6I59vFUlRW8nw4TvBfUiJmF/w8YAm9M9YxXY/F2CZHviyauzY
         7nsVP+pgPJPtqC7qACFJBYdMIHDX3SvJTIH9zti5K5CdJlHpZw+s1tnj2KdrkxI1V4OM
         TwARizyvedzggc6Hu9g2vhMfwjpHiln8eryJ3MMMe3xY8ddXxNG1qxgBPrZa4NLmHgP9
         1zDRwnJ8jLEASVHnyHfGplCQVTyPCIe6tlslU8UiVkdEx0tJY8o2QyVV/eaQGWhbxur/
         gQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751576265; x=1752181065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBkaho97iABpwJgMVEyGxzppH4SASohj0kHuBpkQI3o=;
        b=uMxR6gA4AKh8oNknDw0dSUA1WAOpeVKtlFsFETgX+PC/WXpWREmS90pwAWnBvlMYVz
         KC2H/rH1gm56SGDg1LEHYWoLXyF7t+WKBKh7JpDwV67GvpMjz0N525vsZ0gots889swy
         52NU0wjqKnT4f5qvPGZF+ywTWegIyi7ZJ7Tmi6hUSrDhcstW2R0IrZLMXUxQ4u2Xl2Yu
         zKHrEOZWv8bjwqYR/YSlVzOzll95hTXWpczon82Sr8GZxF0E/bbroFjvpbEbZyMRSPkO
         Ld9IIVUDDrhzE3KMOJ/EZfyuh4YkjUfqYZAQEVMD5n66zzEmVLh2Kg8qIpLWU1yxeXcF
         GMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnZ5cJM/o9r6I5emkNSkr98wdrscWSH9JsKoHlMsj6eSBJWDYM3/IQriLItXEAPJ0CkkUrT9PBhkMdbCXI@vger.kernel.org, AJvYcCVIQeJUz2Drhqpa4Llqpfl/LPFL5mmqK9JjDhLNSwARnMMex+EilWXvMAhoNECCKf0GCQkeuErHbVvR@vger.kernel.org
X-Gm-Message-State: AOJu0YzHondiYrcU09aMQ2kbPpqcXqR12SRfKFyWp8S5HenKJXFgRSdu
	zZ2JJ8IAi7vma6ji0a7bch69nZ5Py+1vU1Hq/yiy0qPq19VReSulWRG6P2F0qU/oap4=
X-Gm-Gg: ASbGncsCre7etHPtKaNwm7mYQ9eCuvnUKxzgmNdvt1Oda29d3Z+5fxJ34CSfrhH6lBs
	+TIuXdUF/CQghrd2J/C5N2tDcO+vDVwQSHg1FYPPzLqxbQVx1cBZtReKMOmGIHZcTf8ABwGkhZy
	51xCXoW0gWOWWkN6D1ATIhkPdmi9GwtQn2kf6oiCIj9Nhh4a3yobecWA4v4G22qrd6rWH14K3XE
	sGwRzYrp9XkBJXkCN4sGRYZLD6D2aj+2oZuAi2Z+88TXhAMVcUeKnIH0MbeXpY0/fS/FQLajhSO
	etRMlejG+8P32/ca2/jDZfV58IzS5nGnBRTGqmFi5qDAUGtYsLqlViHKF8W6czRzsNG6kzU9OCn
	wBHqFs3pkdjU18zSHMhr7+9tabtur
X-Google-Smtp-Source: AGHT+IGjh7lGSwbhkPHSG4Bv/fOqvqE1XvjIF/QbtyXjWK3Rf5QMy3ZyKEjJmsgRYGe3gsrKPtO8Fw==
X-Received: by 2002:a17:906:c24d:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ae3c2bb51eemr765743766b.31.1751576265038;
        Thu, 03 Jul 2025 13:57:45 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5feasm38750366b.107.2025.07.03.13.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 13:57:44 -0700 (PDT)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	Maria Garcia <mgarcia@qblox.com>
Subject: [PATCH v4 0/2] *** Add support for TI TCA6418 GPIO chip ***
Date: Thu,  3 Jul 2025 22:57:38 +0200
Message-ID: <20250703205740.45385-1-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces support for the Texas Instruments TCA6418 
GPIO expander chip, added to the gpio-pca953x driver. It also includes the 
necessary device tree binding definition.

Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
---
Changes in v4:
 - Remove networking-style comments, add newlines after return statements.
Changes in v3:
 - Fix Conor Dooley's email address in dt-bindings patch
Changes in v2:
 - gpio-pca953x.c: address review feedback: remove some else statements, 
   turn some if-else statements into switch statements.
Maria Garcia (2):
  dt-bindings: gpio: pca95xx: add TI TCA6418
  gpio: pca953x: Add support for TI TCA6418

 .../bindings/gpio/gpio-pca95xx.yaml           |   1 +
 drivers/gpio/gpio-pca953x.c                   | 153 +++++++++++++++---
 2 files changed, 134 insertions(+), 20 deletions(-)

-- 
2.43.0


