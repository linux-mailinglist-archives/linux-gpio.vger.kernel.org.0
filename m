Return-Path: <linux-gpio+bounces-7702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78391783C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 07:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85846280FA6
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 05:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A9814534D;
	Wed, 26 Jun 2024 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpHIEXNn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7412C13A88A
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 05:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719380340; cv=none; b=YnsN8+iyIUQljzf94GtwYc6xJk+uCowPu/3A8/uJh/CtW6hb1SlcVjWwtOzUbSe1ZlQstl9QV7x6W7JQFTdUKF4dT2YWna5QdIYlMDQvCB71dwURNPLYX3Uxn6DbTH9mLjzdf+gVcN5Yr+zQkdJhFkm5CWYzghePPeNKiRYX1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719380340; c=relaxed/simple;
	bh=gZBFqu0R/6PPSlo2if0/0vNAbQ3tD6vTHK18yKKm/gU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pPISsOuheXUeHvto4/QxvCKM/GX0d3w2dg4yweuwH/4soNwU7iTRMNrIGGOmy/Co5qY1plqGRovLrCq01ck1iPFGatDv5CRdfrO30JmcBqFXZsubGIZuZjD7FwY5cl0pjtw0kVWi9TZHDhuzueGK7K8yfTh+x/uJ10X20IL4tS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpHIEXNn; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c8dc2bcb78so195467a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 22:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719380339; x=1719985139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=738mUAu30VxXe3Q6QHsbfhwgXaZjZyPVKrJfvd2O7+Y=;
        b=OpHIEXNnNac3F8gKx6nhkqdg1IbAKnjNAr0dsOxbYxTd5c9oHGLTzHtPTxzzdEXR1P
         t+pQDCwO5XrS/f5nrvKhC4xBOuRfLnaujysFr1unGUM1L+GHE3PJsWrIuaQP2y16DOi/
         DhSLcChjeWdMThzXaoh6AoobYg7HxuwaEx42chWoyt8To+QMSrStH4swyEynt2piNXgV
         ZQK9XxxgQ4VsKlZX1pQhh/1jOGDq54sl+1igFftDFFb1vrgiamkjoFCa9z7UhpITT+FJ
         w9ZGcxjGKAFX5zRoLhKJNL/eDQ9kg6oW0sChHitgWK2Vftjsd1D7LBRhFFBKNDVnrbDy
         P+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719380339; x=1719985139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=738mUAu30VxXe3Q6QHsbfhwgXaZjZyPVKrJfvd2O7+Y=;
        b=SE7oJwnVy2GETa5wuVigmWUqxHWD+UM7HtqQsDJ2IuXUwiURALkeu2EGgpGLe1RrQs
         wRkWLTx0avza+8ez3vcofF9enkKcsk1zCmgCQHaU1Dw5ScGh310zMsoUL2ciApmdQ/qG
         C+zom9QKMoQf6SQet2XV4IziXIWtZxJ4KM5qlTDerz1vXeVl70HWWyIkesCS8TZq1jdE
         CVNLIEC96O5e3vBkd/V0ROnVSsOAmzWjN1Di/8fzn3iwuXU6xLT6EdUhl7pC/yWz5zb8
         cueq/2c5JTRLIQjxYb7yM3IP+DHnGfMI7bJBPilq/7T7OlfD6DyDnOiX2m/gbZEu8VaG
         J2cQ==
X-Gm-Message-State: AOJu0YyTrDcyt5Sn3qmP5Idn3PRFrGuDkby8NggcKb3Kx8joE4oUyziH
	Yv0kQ0/RLK2acfFtcH2BnQKaZuLsMPEFj3GHFSVN8PqCribxIdzu237ZlQ==
X-Google-Smtp-Source: AGHT+IFvxmOzDeXrxzeOV4CRfQmtA7d836eSKoMSN8KDco0tOPuWa6kIPhZN8d1rv8UQAENGhPXBpQ==
X-Received: by 2002:a17:90a:d0c4:b0:2c4:a9b2:d4da with SMTP id 98e67ed59e1d1-2c8613e7a5bmr9243367a91.30.1719380338636;
        Tue, 25 Jun 2024 22:38:58 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8d7b4f821sm674370a91.0.2024.06.25.22.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 22:38:58 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/3] bindings: python: more flexible reconfigure_lines()
Date: Wed, 26 Jun 2024 13:38:07 +0800
Message-Id: <20240626053808.179457-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626053808.179457-1-warthog618@gmail.com>
References: <20240626053808.179457-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C API requires the configuration passed to reconfigure_lines()
to contain the lines in the same order as they were requested.  This is
problematic for the Python bindings which accepts the configuration in
the form of a dict.  For versions prior to Python 3.6, dicts do not
maintain insertion order, so iterating over the dict emits lines in
unreliable order.

Even with later Python versions, the ordering requirement makes
reconfigure_lines() awkward to use as subsequent configurations may
group line settings quite differently to the request, yet the user must
go out of their way to reproduce the original ordering.
This is a task better performed by the bindings.

Further, while the documentation for reconfigure_lines() states that
None settings values are treated as default values, the current
implementation raises an error when it tries to dereference the None,
thinking it is an actual object.

Similarly, providing default values for lines for which no settings
are provided would allow support for reconfiguring a subset of
requested lines.

Rework reconfigure_lines() to remove the ordering requirement and
construct the configuration provided to the C API in request order.
Populate missing or None line settings with default values to satisfy
the requirements of the C API that all requested lines must be
reconfigured.

Closes: https://github.com/brgl/libgpiod/issues/54
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/gpiod/line_request.py | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index cde298f..51e600a 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -151,23 +151,26 @@ class LineRequest:
         Args:
           config
             Dictionary mapping offsets or names (or tuples thereof) to
-            LineSettings. If None is passed as the value of the mapping,
-            default settings are used.
+            LineSettings. If no entry exists, or a None is passed as the
+            settings, then the configuration for that line is not changed.
+            Any settings for non-requested lines are ignored.
         """
         self._check_released()

         line_cfg = _ext.LineConfig()
+        line_settings = {}

         for lines, settings in config.items():
             if isinstance(lines, int) or isinstance(lines, str):
                 lines = [lines]

-            offsets = [
-                self._name_map[line] if self._check_line_name(line) else line
-                for line in lines
-            ]
+            for line in lines:
+                offset = self._name_map[line] if self._check_line_name(line) else line
+                line_settings[offset] = settings

-            line_cfg.add_line_settings(offsets, _line_settings_to_ext(settings))
+        for offset in self.offsets:
+            settings = line_settings.get(offset) or LineSettings()
+            line_cfg.add_line_settings([offset], _line_settings_to_ext(settings))

         self._req.reconfigure_lines(line_cfg)

--
2.39.2


