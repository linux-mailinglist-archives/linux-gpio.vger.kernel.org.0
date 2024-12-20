Return-Path: <linux-gpio+bounces-14078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADB59F9370
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 14:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECD55169EDA
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF09215701;
	Fri, 20 Dec 2024 13:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G3j3z3pl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CDE86349
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 13:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702184; cv=none; b=B8g98cdJ0g4jAU+znndMJGImCTlaCQ/TY8B03Ku3r5IizN4nrtYbfndQmxAIZo7krJBelXJnJvRsRpIQThMUKnPwP/aomMJQGQDvzaekKYCIhrbNA66ZNoq+LJgcFm6vQ1qlmUGTsxHbxtb4IsbG2+W5QbKIwMCIg9U8RtmArlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702184; c=relaxed/simple;
	bh=dnPjQTuPvkr4OdmSjrcGncXZWf+XogLGoUkxBMuPTUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWQvI0HT03c9AuHNEx/s3cJ/2WNvFq74Yw4e4b0azH9JChUKlctJl2aYzUQUUsJAdo98QlQSmL6W1QUZT96AYrm1GxeARG2A5LJrX55h521TV86ohC5sxFoopmkqRCdpYI9Xv9KYx3yxZi9VVtOIqfH84RtgstrLZx6TLVSND6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G3j3z3pl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3863c36a731so1531625f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 05:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734702181; x=1735306981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhhbOWTE2x/rbmdZMjgJ4UezkO20Wb6nJTiRd0k+Ors=;
        b=G3j3z3plcts0iWg8wHEtsQvm9+dkehTubUG0fR3n0XB8F+ovPWTyLsXrEThBtgz8C5
         g+BXrsvFArNXlutDudoIpc8MnK7+qsxC3rAtddlgevtjApJrE1ugJ1xGN7OXGnunh/kJ
         oDUGocEGk3XhvfnkUBjZG0tZH2+poWk1rPB2J90jbbuL3zmvmhCXLvlrwi+g731VW3+X
         kYfRZQhqI8LJS+kHUq61GQ1qxeMlT0Wurneb3sa1ujo4OdfESPaOEzsC2xnbsn23Sqh9
         KprRJoYM6b++bJnMuXCffdX/P9e1CNhe0t/rjnH0W7TYI5Cw2HcjeIX/nyWtwbxe4Mir
         COAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702181; x=1735306981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhhbOWTE2x/rbmdZMjgJ4UezkO20Wb6nJTiRd0k+Ors=;
        b=PnElVlPeCWJLYN/q6sw/vpagZn285khFkZTLqW/0J0JOJgeWVEEzNJy1BB9d9TYpjQ
         o/v20F8qSIllPvaE0O+3+qFH3QrDyhlEBF/Fcx81tBsaLPsNoVlS2kUYcpm0q6lnLJmg
         WYlJ0M3eMIj3Eap3rIcN1iz7goWG7ueBFY+70NPZDkn8q+MwgVUnDFaY/WZ/kbgM441Y
         +Qfa0pVIyEpquWa3v7mfaXTeF0o8/QGdg8mj3KGCcoR+vHLvORLK9NMmh84VwxuS4/QO
         YFLjsMmHleydNqUsaWP1QTz+iKBiKraaC5HS6Su//ST85viVwXFwVxgUs2A5BBNs1eJ3
         5TTA==
X-Forwarded-Encrypted: i=1; AJvYcCWwIx0XQgI4980Zov19aV4OUvO86Rn1PwvDdhxUlq2z5gCChwAt1uMV7+UeCpr+VAmOhqNiId3/1Q6B@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmzt4LnSm20sSRqkkfLNSh+YaRuWcwRWhPrpk/xYDoL6JNDqLd
	W9sQwg20hBHasl2QhOmMuvVaFV86qLwkn/I3bIbIJMujlO0NQnCJ4oFOsZ0b8q0=
X-Gm-Gg: ASbGncs3INoEp9wAhnJ7p8Kle0dAL3IHx4PiK/X1KvcoL8LgAOnlo5tbN5v71tTvQhx
	mt326LxpGYrrCUC1AI6mag8V1V2mfKk7Q6+WxnKKhZKqlch+/DlhXDAxyqd0AdgGsFFzYYyw4/G
	fYVlSR/Qgw/mqx+gdJvbJ8hTOhJQP5Ip6q6hSofasJsJQfZkBCyfAt9Gj+fBj2GLcSqc2ATYcyH
	bm+cgL3R++sR+KIKlzWlm5S66AlUbT3Q3EOyhyV1XcnWN/e/Di84+6k
X-Google-Smtp-Source: AGHT+IG55RfrG7rdbOqbXN+vS7oQcKAQGlkPm/MQfQfpvd3LBGFctlcTtj1tVBOGuGALMw/dgfvg+Q==
X-Received: by 2002:a05:6000:4021:b0:385:f6b9:e762 with SMTP id ffacd0b85a97d-38a223f760bmr2683326f8f.36.1734702181535;
        Fri, 20 Dec 2024 05:43:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:72db:1014:577a:9e6b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2eesm4130079f8f.80.2024.12.20.05.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:43:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: log an error when failing to get the reset GPIO
Date: Fri, 20 Dec 2024 14:42:59 +0100
Message-ID: <173470217689.43174.14602531867998411931.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219-pca953x-log-no-reset-gpio-v1-1-9aa7bcc45ead@bootlin.com>
References: <20241219-pca953x-log-no-reset-gpio-v1-1-9aa7bcc45ead@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 19 Dec 2024 10:39:46 +0100, Luca Ceresoli wrote:
> When the dirver fails getting this GPIO, it fails silently. Log an error
> message to make debugging a lot easier by just reading dmesg.
> 
> 

Applied, thanks!

[1/1] gpio: pca953x: log an error when failing to get the reset GPIO
      commit: 7cef813a91c468253c80633891393478b9f2c966

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

