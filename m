Return-Path: <linux-gpio+bounces-8169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4484392D213
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 14:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC0E028196A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 12:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1BC192463;
	Wed, 10 Jul 2024 12:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XYWjn04E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841A11922F3
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720616250; cv=none; b=RVJHNQCQTimSw5G8zjWG8hViiYj64QcNRCeniRa3dyvbWMFRqRsWcWsSt1ZtZixpC2y0KgYOXyBGg0qtbzxcFWwUBXK0z4ybtZ+1yPUPr0iEhLCDQsft2gSrJYQbM8dHk2G9Wf6fV5NeBUVmJNKnljg7GWCt2Ge4jI1VabUSRgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720616250; c=relaxed/simple;
	bh=pxvzoMfuh/AvD9WSBy42XbXw3PFI9q6kmbEjfeC1pDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XtQ29XJ3fggvs50Dnk2Ne/nPH1Y0UmPw2GSD7CEoex+QbU5/+q3q8/N9vykKyBjR0YxBuED7J64P21ajXpXfZu4BiA+YxV7GwxUWcNwUbr7Q/1/heScLwfGH2SytaOEQxrwD4ZebYXVwbKivV3RmnKzQ2hn8W1PeDkcb6ifOs6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XYWjn04E; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-426685732dcso22454375e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720616247; x=1721221047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8mNA1JSYxhi7N3dA4liGreAz5Ie/p3XdptNTkjfg9c=;
        b=XYWjn04Et5QU71MIwqi7M1MS/yye3l1ftwLuzYWWDWeurGz2Ha5WOEJ5ch4Q6DLuXQ
         FSKmO2ryk6kZrJ9XOu1a5cxVziPUtRzu9Wg+J7fS8aptwu8llwTekvAyC7X5fh0pxjRT
         GwbA5AvI7wmLa8XO9QO0PcMNSJwyqxPUFf0JvxQWDIF9qBVNdMpVdLIeEmwQWYWWujNA
         LBA+JlzFrQ2YMbXiPue4LvzrPuFY9w92UR/8OqntALR7Hi0WXMWUakE0Mouidqwv3ONu
         erQmHXivbkvrDNsWEnwhAf3u9uVXak/NKinFshTw1DPzqi3Iouor2C2F7Upf3SSjjwyV
         xsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720616247; x=1721221047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8mNA1JSYxhi7N3dA4liGreAz5Ie/p3XdptNTkjfg9c=;
        b=sUrjyiRdOosBvXVIs+OmP/v+aHQYW4pfvE12aiG/nqD/YTXxuO51bRgC7kMlExpxX+
         EkQ1xPlcicdbK8M6Ocl2wsVPFbe0YdemggFi3eredAUyEdIcZH6OnNL/VcaeOU6LSkW5
         88+yzXNl25edG4oDBBI5APvXVj/+O24F8DhAczats7Jp7oiBIC1NvRHid7APC3xt00pc
         ea6eSqHEu9/ofp6wI+1XNKMM8RNWj0RVTcgjH7LD5zEqFa5g2WwOyZFAkFv6CtFLWoVY
         L+fqGwgZl3e1RkGrhz/CTXvKaN/tAVdTD4jkg35V9hlnIjZVTlkkP4I4tKWvd6xt/drD
         a/tw==
X-Gm-Message-State: AOJu0YzqBxAJBsbZO4MSnX/77l7eFORarhPg2dCXBy1MoYGdgfql2A8d
	iCRdc9YOGr/wc4WkpnQr1LfpuI/zYDer/xIYAGC/iOM3pBZxQH1/IXIChNPN1I4=
X-Google-Smtp-Source: AGHT+IGpNuQDfVwuY+ycAusMixWvA11blSPSx6K1TP3FwcWgozCASb+wYzIlknY8n0AMCZvl53hRgA==
X-Received: by 2002:a05:600c:48a7:b0:426:6158:9b54 with SMTP id 5b1f17b1804b1-426707cc018mr34893715e9.6.1720616246561;
        Wed, 10 Jul 2024 05:57:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5d33:75a6:b07c:5579])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7416bcsm81426675e9.43.2024.07.10.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 05:57:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Chuang Zhu <git@chuang.cz>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v3 1/2] bindings: python: fix line request by name with multiple entries
Date: Wed, 10 Jul 2024 14:57:18 +0200
Message-ID: <20240710125719.33655-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710125719.33655-1-brgl@bgdev.pl>
References: <20240710125719.33655-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuang Zhu <git@chuang.cz>

When multiple entries are requested using line names in
Chip.request_lines(), only the the last entry is added to
LineRequest._name_map, causing a ValueError when trying to use functions
like LineRequest.set_value() on any former entries.

Move the required variables to the correct scope.

Signed-off-by: Chuang Zhu <git@chuang.cz>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
[Bartosz: tweak the commit message]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/chip.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 47bda11..7692ba4 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -279,11 +279,12 @@ class Chip:
         else:
             mapped_output_values = None
 
+        name_map = dict()
+        offset_map = dict()
+        global_output_values = list()
+
         for lines, settings in config.items():
             offsets = list()
-            name_map = dict()
-            offset_map = dict()
-            global_output_values = list()
 
             if isinstance(lines, int) or isinstance(lines, str):
                 lines = (lines,)
-- 
2.43.0


