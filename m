Return-Path: <linux-gpio+bounces-6542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A06678CB6D2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 02:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB8A2854ED
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 00:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBCF17F8;
	Wed, 22 May 2024 00:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpAe7v2R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEF917F3
	for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 00:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716338834; cv=none; b=lkokSov4r62VNmab4zSdpzHJ+omGXpxK/rj8JO8pUYm6yDLvg+kfi161xYwfZhXxjqI/3Twheqvs28SkreClcEEOjs0ZURlqi6yu06HoNB9Thk1P7Odbd3BJsLs2Rkkq+mMI7I/Iy0SOyGyxRHiRGjVnV4Q+KuojfNE1u9e2dkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716338834; c=relaxed/simple;
	bh=U+qb/7NUGmaaqm/cwxdz3GdDmrX34nI/tJwNaILIpzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rs0fhL7g1wk2tdskXxLtOFHXkBJGlJt86AA2zIs/knlxNxIQEQWNTyfKNRay3dCvozRH/Ldtuxp1fJ8xoph+juA184uvgvRuaxiDDf1RXQF5ZPoPFuS1fP22W/0TwWPJU3J3KhOw1GOYzxjVhA/oGdgxCFmZOM7eTDBKswuNML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpAe7v2R; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-24c0dbd2866so1433819fac.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 17:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716338832; x=1716943632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A12K4rpwI7fiEuQ/0HQSvwY/yqZqmCQDFLukUYTEfc4=;
        b=ZpAe7v2RuhyXXAi3T8DWtvfaMYegFmG+oPT7YbU8ojHhcyJj5TwygrIa5ALYnl+9T5
         G8wr1h2wU4GvQzOFLBWmTf4d9C/rkra3Quu4Z+rLCIcot75Z2O048nbOhXr0JrS1n+v5
         1WncZ0ZgA3LTnbB7jgky8SpXb8jSbJxoKdOXaBgXb9B19kmoPgbf2VUdZgajfBWGGjPP
         bafo7+Bb++vMkBoQPGjHx8JxHrEZXSjxGNvULh9XFPorFCRoQB7K0cN4Zjt2Re6MMKAB
         By8kgngSg8HJLziAsSWopEsHI3oIGZp6kD79isDwdO/5tb7mDfr79utdar96SmPErXz1
         13uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716338832; x=1716943632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A12K4rpwI7fiEuQ/0HQSvwY/yqZqmCQDFLukUYTEfc4=;
        b=cwRn9/oUhQO6T5YFoCVP9e/4EwhKfsS7F4tCHTghDEkMYqa3ImMJGtpc8pGFNkV4C8
         FMEh8my59LYVhMdks629Mr4Q3/63hJtsQCgELnzqSvTcTh7Cx1aH/KHxyX7G3JdDMRxk
         rgNmYdfN3Oflh6jiTpmPWZbYt62JRJ3+XDsHFN6QbvJeR3yLy8AGB0xYLW1zkRfqVt+5
         Ga2wPG9NAiXuGdPe+HtVoZg2J8qlT9wmA1gHk6XXq0pAAQIueM889OYh9ADqGsVsbYUs
         mljGcGnQ+7ncSEWKMT+7XgZxjolchD2z2hsl1C6mLwQ/TDUdQ6OK9xrbUc+YfZl122yT
         0+Aw==
X-Gm-Message-State: AOJu0YwkAikuaq36ssc9+M75l3b1HfEXy/XoNTDwq5MKb5roY7/I4kGQ
	t2amJ6RkMSh0e3+fEiHTdCB6y7NzzR0LeKZ46jfCPYuxet4r1v34NsPlag==
X-Google-Smtp-Source: AGHT+IGGYvofGLDmjFBKqlf35NlX4URPUDBPxH7SZCLI3yF9EhIWcC7QBETr1W9deMYe7Ql9BhtXfg==
X-Received: by 2002:a05:6870:b601:b0:23c:a69b:645b with SMTP id 586e51a60fabf-24c68adabaamr748652fac.14.1716338831334;
        Tue, 21 May 2024 17:47:11 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c36sm22066302b3a.173.2024.05.21.17.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 17:47:11 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/2] bindings: python: tests: add test for casting line.Value to bool
Date: Wed, 22 May 2024 08:46:42 +0800
Message-Id: <20240522004643.96863-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240522004643.96863-1-warthog618@gmail.com>
References: <20240522004643.96863-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The line.Value represents the logical line state, so intuitively you
would expect it to be able to be cast to bool, with ACTIVE
corresponding to True, and INACTIVE to False.

Add a test that line.Value can be cast to bool.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/tests/Makefile.am   |  1 +
 bindings/python/tests/tests_line.py | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 bindings/python/tests/tests_line.py

diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
index c89241e..3118d5f 100644
--- a/bindings/python/tests/Makefile.am
+++ b/bindings/python/tests/Makefile.am
@@ -11,6 +11,7 @@ EXTRA_DIST = \
 	tests_chip.py \
 	tests_edge_event.py \
 	tests_info_event.py \
+	tests_line.py \
 	tests_line_info.py \
 	tests_line_request.py \
 	tests_line_settings.py \
diff --git a/bindings/python/tests/tests_line.py b/bindings/python/tests/tests_line.py
new file mode 100644
index 0000000..70aa09b
--- /dev/null
+++ b/bindings/python/tests/tests_line.py
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2024 Kent Gibson <warthog618@gmail.com>
+
+from gpiod.line import Value
+from unittest import TestCase
+
+
+class LineValue(TestCase):
+    def test_cast_bool(self):
+        self.assertTrue(bool(Value.ACTIVE))
+        self.assertFalse(bool(Value.INACTIVE))
-- 
2.39.2


