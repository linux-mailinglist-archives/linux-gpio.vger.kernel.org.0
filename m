Return-Path: <linux-gpio+bounces-10315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6216197D6EE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 16:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 944281C22AF3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 14:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1669B17ADF1;
	Fri, 20 Sep 2024 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CSrDQbTB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45331482F0
	for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2024 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726842730; cv=none; b=rpYX0DGO6mlObXKCay6YO62g5mfJM5XhQ1yTrzjjPz6kUx0RI+xg1PFVUGLPJirTB+h/Dj/YQZyDYDjhxZmoSRnG3Gu9FRComyCBTWxk78CtiCHnOAz3EY2zaNLpS29L8+NodMzmKE3KgR6Yl+ThVcMqCG9ThuM6wBs0db2QboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726842730; c=relaxed/simple;
	bh=9Z5OfuCbPN2+7v7zKkmwIF3Y/z8/KxWZC1+YVgnOgKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=evmhjL02DehI5uHMQ9Im5UT80cRKLWsdFgp29HfwQhWx0NDWzJ76Av2bOZVp6It3M7Yc0dQIoEjyF/nylb29nkC4L6nYsuBJYYbNbZRwEplKc2bfOhX+MHOQw3cXgkLvfnmqcGWspO1XonznLc17aC4KX/igq0zpZ3V4nAhhxRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CSrDQbTB; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d446adf6eso282673666b.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2024 07:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726842727; x=1727447527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/EitCs5vQ0GgG+UlsVH6G8Ip+IXpiW9RJtTkmV9RNUQ=;
        b=CSrDQbTBUSYEJhcFLPH2+wxRe2LjJ6spW80qgC0MMLn8OfZHXWM2z+z5YjvwCsUVUF
         XPKvyovzPNdglY3vAKLmy3AI7f2PwMojzbtlt0cDFw/t7zyRmxn5gYbxWcbBDac89ZBX
         VJ6FKhXBf6V0pVmCfrcp/bLhRClQkDLUGxqJxwG5/KSdLoemAG28B/2DoqncgpGJn+BS
         WLO5ZVG5LRQQzIFEtMt/Kio0Fgn+K15dYrV1Nh2IOj/qEJXe6blkr0FTvPl9+uCTOF9j
         VUKOIBuU1ukrEz80uofL4nW6TY9uzYa1EodNcWU0YUObknTeNlcKYobPuDK371lUe1a5
         zgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726842727; x=1727447527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EitCs5vQ0GgG+UlsVH6G8Ip+IXpiW9RJtTkmV9RNUQ=;
        b=ibXF4gEqjnV6kDJDiE61VYF+bbh+u5VOqHZxn7qiy30RmoFK9nQHKLIgHm+hUtiuet
         mKfLHDcaaGHKziWawYK3RtuYXlUhiE5vcIlwiz1bwk3pXk3Zm2t8TAYsMCuoPfBnPplp
         lWZJ3I53/Ura1nxNh4I8n/+MZJmicXSjmx8HlPzXiWXrcGLNSdKuxCnoqPC0g180+p34
         ZTgoFQiJLR4Yf/RQKBZ6IaWqXy1x57VK6iQaXtfzSl7EOV1PmaOeUr+SWTiOGC2VQ+Dg
         eVnp4D+2J8iu76prGHuINeJqMV+gOdgwkvErO1fEHJCjRt8lTH45yQJv3nmUi4nglsP8
         pRPw==
X-Gm-Message-State: AOJu0Yz+e8YsY5kma+RZwehhLaTJGGvLaEbhn5YILTRQMui02Ds4jMst
	YLZsmrExiCEOPrP0sT+sPdM1//Xo2Bm7GSfYLZCEA/YIEeVVvno/2FeQuBs4jBw=
X-Google-Smtp-Source: AGHT+IGdNB8maKmvA1VPLQb84AjzFlV9luATzjXPmZvet12B1CU1E9Nljwm0VCRkQX6EvdPY02Zm3w==
X-Received: by 2002:a17:907:c893:b0:a77:c95e:9b1c with SMTP id a640c23a62f3a-a90d4ffb9ccmr250006966b.27.1726842726820;
        Fri, 20 Sep 2024 07:32:06 -0700 (PDT)
Received: from brgl-uxlite.pool3009.local ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109678fsm854375866b.30.2024.09.20.07.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 07:32:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: improve LineSettings.__repr__()
Date: Fri, 20 Sep 2024 16:32:03 +0200
Message-ID: <20240920143203.6377-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently, for the output of LineSettings.__repr__() to be eval()able,
the user must have pulled all the relevant definitions from gpiod.line
within the scope where it is used. Modify the output so that all the user
needs is `import gpiod`.

Reported-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/line_settings.py       | 2 +-
 bindings/python/tests/tests_line_settings.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index 41712cc..5e32194 100644
--- a/bindings/python/gpiod/line_settings.py
+++ b/bindings/python/gpiod/line_settings.py
@@ -27,7 +27,7 @@ class LineSettings:
     # __repr__ generated by @dataclass uses repr for enum members resulting in
     # an unusable representation as those are of the form: <NAME: $value>
     def __repr__(self):
-        return "gpiod.LineSettings(direction={}, edge_detection={}, bias={}, drive={}, active_low={}, debounce_period={}, event_clock={}, output_value={})".format(
+        return "gpiod.LineSettings(direction=gpiod.line.{}, edge_detection=gpiod.line.{}, bias=gpiod.line.{}, drive=gpiod.line.{}, active_low={}, debounce_period={}, event_clock=gpiod.line.{}, output_value=gpiod.line.{})".format(
             str(self.direction),
             str(self.edge_detection),
             str(self.bias),
diff --git a/bindings/python/tests/tests_line_settings.py b/bindings/python/tests/tests_line_settings.py
index c6ca720..83be3d9 100644
--- a/bindings/python/tests/tests_line_settings.py
+++ b/bindings/python/tests/tests_line_settings.py
@@ -69,7 +69,7 @@ class LineSettingsStringRepresentation(TestCase):
     def test_repr(self):
         self.assertEqual(
             repr(self.settings),
-            "gpiod.LineSettings(direction=Direction.OUTPUT, edge_detection=Edge.NONE, bias=Bias.AS_IS, drive=Drive.OPEN_SOURCE, active_low=True, debounce_period=datetime.timedelta(0), event_clock=Clock.MONOTONIC, output_value=Value.INACTIVE)",
+            "gpiod.LineSettings(direction=gpiod.line.Direction.OUTPUT, edge_detection=gpiod.line.Edge.NONE, bias=gpiod.line.Bias.AS_IS, drive=gpiod.line.Drive.OPEN_SOURCE, active_low=True, debounce_period=datetime.timedelta(0), event_clock=gpiod.line.Clock.MONOTONIC, output_value=gpiod.line.Value.INACTIVE)",
         )
 
         cmp = eval(repr(self.settings))
-- 
2.43.0


