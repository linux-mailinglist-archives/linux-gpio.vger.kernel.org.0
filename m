Return-Path: <linux-gpio+bounces-20980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A79ACDB75
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 11:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 951F73A42AA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 09:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605AF28C5A1;
	Wed,  4 Jun 2025 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZlvJgTOf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8196528C5B4
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030849; cv=none; b=kBde2BGR6UQD3uEkco5Iy5uMWjkwA7A6t1/7OyNI+0NHSrIGwqU4uHBVislMJjRvitRT1FDlFK+pvV7Yg/9vsgxbUlioRVRyYVMigMpOzdu7MnjPcBWoE0A9uGgN99KiwJgLyPjv4ZytJgmqhY52ok+mIv86mlcPgAPk2oqbc5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030849; c=relaxed/simple;
	bh=DRjhWrHQT4lgyqKM0TUzkIauvvSfSwAN+/c7Y/Dehrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJlisHB/Yq7DJ7d3aR0If6ArVM090gd63w0iXENuRvkZzdtTF4/mFdKgI5x3sG7rM96q73v+6kjRhY/4ciHF/Ep5GuKyK/F3OlA04fyYmRcQ/OlUTXQQlzGdeQ5aeux0S8lPbPu36PY3Wx5CAyeEkkjZMx2dfs52hFNagGVzNCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZlvJgTOf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so563961f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749030846; x=1749635646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgNGBWUntlzsqlsrqfACQ9ak5SzabU4TyO+KeG66LBY=;
        b=ZlvJgTOfP0k/uBiqADK/jy4aGgvSZk0366N2RFh0xbaWxqi8p1TvEczWptMFCx72WP
         EiDv3zb7E9uHqfTJIPmUg7KYl0OX33AG8hkbCuCBfX7TWHW/JEbtNOopUSzuKceofCMz
         mzWWf6SXTRMHjUb/ifGyiCsdEuKlmkVb725ssdzaunP5Gn/wwGSmCPm8jEnPuMO+gvPP
         Jm1Gj/WpqiZhenN9NN55R/QEHhfB26aWUkCHoq1pQ8OSHXlsuLG/hGtSYBYv5y+LTDt0
         SNHfKkxfgrmiH0rWVX1jjKpfVZraQBClvd8GBU3HUMhPgW9kFfsjVGhpnRtroWjAvz+G
         tk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030846; x=1749635646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgNGBWUntlzsqlsrqfACQ9ak5SzabU4TyO+KeG66LBY=;
        b=wcwI25zc0mCsY4oiauZgSL05FSvV0R49lWIknpZNO0MwNXsw6hNF1sm52x0AnuyuXN
         +ag2qKkfxJhVxOKR9wu8vbqtR8fv3Co8W3BUqHPnPPBsJ8AUx6+IZmlaDb/jWMPvjYN5
         OnlbERVoz0BrYmert0ZoGo3BUJR/i2wAte3lg1L+hByqDbQN4aoR4KFEA3alvjkZH4rU
         03B+JKXuUApuD0P9SjtP4w2JnA3A3PMQfdAocmG/IKYd/EH0DGL5FMRInV3x0QMiazrb
         078i/FuHP27rLpLKBBrwuIuL5ln62q1bJPurgYeD3jc7aBzhYVk6/G67siB/svJxTsaj
         5Mlg==
X-Gm-Message-State: AOJu0YxXNiPD6NIXeHWESUh83vtrM2bceK938IAggLiChwLU5RiOnhKW
	PyG71ptYpjZwbAdu6Eb7702MpmlyfRgkwgBm5zb0piAJG7/COrNVZUEWRWGO/u2ny7I=
X-Gm-Gg: ASbGncvAQMhnCGrdagyVGsyi7U9fcMsnZDsd2RkNYWPMEKRdRrEbVtESA3C+ThZG0UL
	g7PLYZZWBQgY3/wVxUacXmwfVAduInXT7moVpbEcdu26SICuUzRVy/pn9gPsI3RYpYdPhMToi2d
	y0huiabGgGUed/uSSwFfvCMuGu2iXbx7eWUWry6mDocDkefIJZAfDxntrt+T4ot+PxbPZx5Rhir
	VWhd893sCZGziXFAQnFY0nvak5bvfdBYMV3Id0ePvGGT+ZjHW2AFXRGanPLIvn0pBwQIEqvOoXp
	IxBGbwDxYTaKhki+4Q8WIS3j01KSrfcOYVNIM8kWyzYL4W9R+ZSY7yTj
X-Google-Smtp-Source: AGHT+IF8cunlmPLHXlWtrV0jDQhPLzgxujIarE8vN3fwiMQU+h6rIJEYGDvVFzklHpQSPgZKPv/kAg==
X-Received: by 2002:a05:6000:2204:b0:3a4:e624:4ec9 with SMTP id ffacd0b85a97d-3a51d507a12mr1775046f8f.3.1749030845667;
        Wed, 04 Jun 2025 02:54:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e8d2:e71d:f170:23e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971e4sm21525640f8f.65.2025.06.04.02.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:54:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 04 Jun 2025 11:53:56 +0200
Subject: [PATCH libgpiod 2/3] doc: improve the readability of the prefix
 variable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-rust-docs-v1-2-8ff23924a917@linaro.org>
References: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
In-Reply-To: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=77ZEdBx/18Yxsz12amBf5rGcXRRQHt5qzyrxRovOAi0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoQBe75hYhR+Ej1eqReK9N+veo3Qq26A9Q0gRxz
 yyzcD3oG/WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEAXuwAKCRARpy6gFHHX
 cqOvEADTkCjrt0VQEwqC8Km+Ea32HgALa0PLh0Nr7DYhyHmePaBvMerlrS640vDm9rpzE3uxI7n
 HpvscfXxXKE3w8HBnZVJGamJxbtDe6n3QrSzUjJNkeNaUmwdSn8pfF+d2Fn4lLFzetGWDfE5P2G
 r5GY9cJCujX14SgtlbILGwY7NzjDB1YSYU+O2poCzEwkUeOJmot97cltXTTlM3dV+aJ1p1HFnDA
 0r3O8s0NkiBqBlhiHoq+Ivp8w6Hxai5N9MXxFojNbNsZzZGMDJMaDTRyupK1/z8518Jx9gNXr91
 7X9z6aFdi2iTh4UCz+vFVfBSahX7+Smwr/pTh5CF6OelWgKFPOvunqm4B/YPg0+czbK0sehYuEX
 icYtLwdrSDX5lS9r2T36uvvyhFRx0y1EE3NxOLbqRXqwFYm1+4IAOp8nTe2DGIUb5+WMhaksbym
 PE266Q+iGOvJ9/kgVsMSOB7tyiFMiUEijQZG7qiFqYU3doRxAUfK+7ufmJ5VLBwwYpjpjY5rwMz
 Ew7hbZt4T/bz1mnFF8i5nqK6iJI/hUPg5prwn9QtmaS2rU91BCyK1zahXNhEjt4HBfYQ/8xI+Wg
 nXrDkiitKJHhHlk3iScGui5Za98UeEEegv7iyQ8fvVsbOXP2L+ooYhTZGY9LP34lXR9ZyyPNTmp
 sjrM6ypxADuhs0A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently the default value for prefix - indicating the current
directory - is an empty string. This means that if we do
"{prefix}/foo", we may end up pointing to the root directory which is
not what we want. Make "./" be the default value so that the example
becomes valid and add "/" where we couldn't do it before.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 docs/conf.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index d89c13454baa8fbe9dab17b7c3fde6fc59b577f1..04d1cea2a2175166555993c3e936e7cf1ebd0fe6 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -61,15 +61,15 @@ html_theme = "sphinx_rtd_theme" if sphinx_rtd_theme else "default"
 def make_glib_docs(app):
     # For some reason on RTD we're in the docs/ directory while during a local
     # build, we're still in the top source directory.
-    prefix = "../" if os.getenv("READTHEDOCS") == "True" else ""
+    prefix = "../" if os.getenv("READTHEDOCS") == "True" else "./"
 
     subprocess.run(
         [
             "gi-docgen",
             "generate",
             "--config",
-            f"{prefix}bindings/glib/gi-docgen.toml",
-            f"{prefix}bindings/glib/Gpiodglib-1.0.gir",
+            f"{prefix}/bindings/glib/gi-docgen.toml",
+            f"{prefix}/bindings/glib/Gpiodglib-1.0.gir",
             "--output-dir",
             f"{app.outdir}",
         ],

-- 
2.48.1


