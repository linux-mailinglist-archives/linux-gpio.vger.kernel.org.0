Return-Path: <linux-gpio+bounces-8486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965BE942C4E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 12:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55920281FC8
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 10:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2724C1AAE37;
	Wed, 31 Jul 2024 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q47REmeK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9FE190473
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 10:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722422826; cv=none; b=WB8TPpTZXklyeBwurifPoAOOE31ET8MHE3sYfp8S85GAfng8zl/X+M5u5uN/FsjC/oNVNs3kuY55ra8vG9DMEJuFEXpPi28uU+QNzRWBsncDWYO+3OA5fPmJHfNQB8pOge351ONlcvpH4NJem+LdlOcPuZcTUTEkGZloOT58gCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722422826; c=relaxed/simple;
	bh=/cZtWCXClI0s7oslJl5APzGNkmMfEQStuilPuZQHgHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rj1bkKMFqyLfL+gZoj59de3HJaTPWXSQ1UH7AYBatrXKAPQCEyPvE0h3yYmJ3wGalgoqKn5uEbntTDwTQftF20iod3EoSYs5oUpIvsYr0HK2sCGv7L+qx9i5LyEp29+6Paeb7/IEIEqrqjGNvpo33F9UIU0ODz2Ia55uMlSIJt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q47REmeK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42816ca797fso31409865e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 03:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722422823; x=1723027623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx1ZrEqt/ZDCS6mVU6O51ZbqHlRK8YKmuHp9oGOVSE8=;
        b=q47REmeKvwnL3AKgBAZRqx/FtVFpEfcw7jeurjnCSKeILIKab08sOhJ+02f+X1cCoF
         vbVJbIU4BuR1e5519peE8/8WE6Xh1oxxGvVQIGXCeoRs2uVJoQDZGE75Z9D/R7fSsZUW
         vIg8VazG+j6N0GqOm9UO2YIXy8R77GC1aLZ9kQtIk41tI/04qaNK5pnpmZhg6CaDFH0o
         BIMry7P4xc7heN2RuWjUJebSDdWkDtXHVGP9Id/daAw3VZicvcT5ETm7FMrsM4h4nR38
         PEXIYEqZFVMEvOAKsqmdmz3LnvAst35NlQG+3CtG//vokJGRfxeKirMvA41nBCJWqBRS
         tKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722422823; x=1723027623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fx1ZrEqt/ZDCS6mVU6O51ZbqHlRK8YKmuHp9oGOVSE8=;
        b=hO9DD7Cw5yRnswnrhBs6tarorYN7nkCJpd8BmK7ExE31eToWOw1TvxeU3OQQdpBumc
         VMZ3Er/GCms21Ev/wbVj4xCEszCK7gjL4Sh/+2LkbIZIkSH2grj8GIVp7+aAgisP+uoj
         jqJ33izganBtxY7HQCq/vWoS5/kdh7MxZcFhWwTNwNABpVTGeSiojoWHQvuJaLTgII55
         2gIjAqkyX47tMnJxrfbsmu/ys3lV3p54xl6RZe6502Yc4meFfa2oY4kzh1AjrE0Zj8q9
         mL5YgNz2dBeWc6PYk07licG3K7BhdGVOll2tNlrHiqNwYHW9DYKwtqHf4rZLZn4wUoFw
         LrnQ==
X-Gm-Message-State: AOJu0YxGIOPinE7je9zyiSZKAzZgAStxbLKufp0PqY4mE8GLwN3+EfV9
	nYDsVbSsMPSUdhkT5wx/Cy4rLKuplyw1FO4EasNYzM2j30ouhamPca87nOqWpBc=
X-Google-Smtp-Source: AGHT+IEcfN0MOtpCUrZtesQvz3Yc+o558xInd3R4xlcDxF/Y8As6ZP1WlZKl03io4qEwAHGhkEdLbQ==
X-Received: by 2002:a05:600c:354a:b0:426:6c70:dd9c with SMTP id 5b1f17b1804b1-42811e0b770mr98500155e9.31.1722422823245;
        Wed, 31 Jul 2024 03:47:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9c3f:3dd8:b524:cb31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857d4fsm16858877f8f.86.2024.07.31.03.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 03:47:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: =?UTF-8?q?Benjamin=20Cab=C3=A9?= <kartben@gmail.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH libgpiod 2/2] bindings: python: tests: check that event clock is property set in request
Date: Wed, 31 Jul 2024 12:46:58 +0200
Message-ID: <20240731104658.93117-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731104658.93117-1-brgl@bgdev.pl>
References: <20240731104658.93117-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently only have a test-case that checks if the event clock
property is correctly set in the LineSettings object but not whether it
is actually passed to the line request. Extend the existing test-case for
line requests to account for event clocks as well.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/tests/tests_line_request.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index c79a324..dce5941 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -5,7 +5,7 @@ import errno
 import gpiod
 
 from . import gpiosim
-from gpiod.line import Direction, Drive, Edge, Value
+from gpiod.line import Clock, Direction, Drive, Edge, Value
 from unittest import TestCase
 
 Pull = gpiosim.Chip.Pull
@@ -302,12 +302,15 @@ class LineRequestComplexConfig(TestCase):
                         direction=Direction.OUTPUT, output_value=Value.ACTIVE
                     ),
                     (1, 3, 5): gpiod.LineSettings(
-                        direction=Direction.INPUT, edge_detection=Edge.BOTH
+                        direction=Direction.INPUT,
+                        edge_detection=Edge.BOTH,
+                        event_clock=Clock.REALTIME,
                     ),
                 },
             ) as req:
                 self.assertEqual(chip.get_line_info(2).direction, Direction.OUTPUT)
                 self.assertEqual(chip.get_line_info(3).edge_detection, Edge.BOTH)
+                self.assertEqual(chip.get_line_info(5).event_clock, Clock.REALTIME)
 
 
 class LineRequestMixedConfigByName(TestCase):
-- 
2.43.0


