Return-Path: <linux-gpio+bounces-8091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E34929F83
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 11:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 840771F23C50
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 09:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204D959147;
	Mon,  8 Jul 2024 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gtC5FRu6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7401E53362
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720432114; cv=none; b=Hyji24AvK408gmDzJQ3rbk6toZqWSo4A5n81vWrfD18+r12CzyRzf31iMCXq9/Q/ABLdeLZ7gA1H2ELaejoS9ZMLHQORHigj9UF25KqA7jaibgA/6RFgudM9E4o6SbGjS3BVI9sUCCTSv2XKyH2r5fQMkTMMt1pnizqRZzZD0/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720432114; c=relaxed/simple;
	bh=dmR+2X16GcWqdwoSVKJ8V8At3LVO9TILYWmHIHpnwVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cxa8ED9W8Nj+Wk+ZIewppBGTiCeR3Tcdsf8QvZd4j3TMWUg+fl4VntCsXvCzPewTc5z1IOU/XZa39XwEwGA2Bjrn7bswEev/6rSjh3HvvlzifCMjgGmXJuaKT1Sszv5Iyxv1oon0Ox1wIwUwYrvj/PwSw60nUJx3m+roJYI7y88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gtC5FRu6; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ee90f56e02so35204481fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 02:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720432111; x=1721036911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlCAuEI1JMWRZhhXnkDZTE2W3A3Pf3GOAP6Z+n+3yT0=;
        b=gtC5FRu69xdAiOHh29z8TGOr2s74vNNyz65etHJXmb3IQeNgRD+Mx8muOvO2qHNe58
         6TDrfKb/NWoUgJuxaUsg3tf6a5ejp/Cf9UzmJfSe0ADqx01u7gZv5bzL8cAMdktC6r03
         soy7BZCxWLxuG5g5V7nX/sBhMTECDr+VshWifk+ZVKCH5Jf0CMOhExz9dT6FgEOV2wOq
         CZlnKuZeiZPwUQYtHeehg9rUsxvE5VgtrfWLAv+Zv7lgQhQsbkG/ImpQLy7q8gZ3KE+2
         gpb5iHV43O6GT74fL+lIOVdb1RBVVb5fp3UMv3jqq9Ut1WMoiK6ujeYIK/UHwIn7K6k0
         pNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720432111; x=1721036911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlCAuEI1JMWRZhhXnkDZTE2W3A3Pf3GOAP6Z+n+3yT0=;
        b=uuf6gJZIfcOcF8BAjsg2O6Ui1vqlovI136vdz4+w+BhPcgFgpXkaveV8NcjnUCaRfe
         f75LWZnQs3CSPrfypJ44uZA1hKgUPWnYCvYgYqtTFECw4/FIWZA/hHH5IyjA9fMbuu+2
         5WhnOOSO1ACW9XlifWJ3fBPZ+BAmQjWsaPPmmZUcsFA+704408Py6LENkhdHckYWmuce
         2zbtEfdRYgxtCHXNCVYL0CbgvP1XooN/GXJVWB76jxsG36nugsX8m34c+JwNnz7HZsAN
         Ubto6AIYX5ZUvjJ+19Wu3uKPMT9Ivh/5HtUfQSLlGeCBXnCHi6M2ti/hQQIJ74Eri8fp
         PUTA==
X-Gm-Message-State: AOJu0YxAq1bICmWp7uJBhYbLvKNr8d5j3TFBZXt1Ezj6JxDix1DUJMt4
	117/TXrr1I62hkQPb3TQdSWJTPO/8KT5cOJ1vF/lt8Tt6tB44afF2yg852nkcE0=
X-Google-Smtp-Source: AGHT+IFpV02xc0OBdcy7deqje0KPJVUIJuMWNCl2BYhxPrescnlG6RqAUnAm1n3vewr/MayYD6Hylw==
X-Received: by 2002:a2e:9150:0:b0:2ec:1042:fb04 with SMTP id 38308e7fff4ca-2ee8edffca6mr69214411fa.35.1720432111509;
        Mon, 08 Jul 2024 02:48:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2b4976sm157364325e9.48.2024.07.08.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 02:48:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: cxx: tests: set direction when reconfiguring lines
Date: Mon,  8 Jul 2024 11:48:27 +0200
Message-ID: <20240708094827.84986-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linux kernel commit b44039638741 ("gpiolib: cdev: Ignore reconfiguration
without direction") made the direction setting mandatory for line config
passed to the kernel when reconfiguring requested lines. Fix the C++ test
case which doesn't do it and now fails due to the rest of the settings
being ignored.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/tests/tests-line-request.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
index af8b979..a99bd44 100644
--- a/bindings/cxx/tests/tests-line-request.cpp
+++ b/bindings/cxx/tests/tests-line-request.cpp
@@ -208,6 +208,7 @@ TEST_CASE("values can be read", "[line-request]")
 				.add_line_settings(
 					offs,
 					::gpiod::line_settings()
+						.set_direction(direction::INPUT)
 						.set_active_low(true))
 		);
 
-- 
2.43.0


