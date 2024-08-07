Return-Path: <linux-gpio+bounces-8636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440B94A3D6
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E9672843E7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2840D1D1739;
	Wed,  7 Aug 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XZceWyf1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5811D173B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021884; cv=none; b=demf8kSgjFDclKZ4OaPJ/+PEEQKr5EviLa867rVrL+nwrLpRS09H8sDzAmVGwjm9eeUMJTKy+WQpY5cyY1vmi/P7BBqhTG5S2c3YqPkSadiKEB2VSwlurhxkVX1lCoY8XQo0xsa7ZSxmRcpa/7YpN3pbbLQ0HiJdWvlp3GaD9mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021884; c=relaxed/simple;
	bh=cKZGrYTO1B+5ZM1byDwrEV++EQVNLlUOyKBh1zx5B4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eaTlafYM4DbeXyuD/yjA5Fx6EuWctJfeqVn2DhhIl8Ic9P7ACJyPCRLe6tNN3hydqwj5wnWG7qkpRLRxBTda5Fnyj/vazVfb4snOyJrKscveO1eUgO+c2UgSNbjIR+CVdsTwi8JZQm7/pjfY3M19O4dtMHDEeGNyLE1R3qAfRlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XZceWyf1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so10382555e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021882; x=1723626682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUbQKwssYICDEm/Dx0g9d2o0je/YbN4psjkIGP6L5Fk=;
        b=XZceWyf1XI5+0Anp5WJPiHHB5cmZJYK9FlH18f9ELDKPTvgVOxFObs8YtwbANFG//x
         Gv7/pTTNphy7xKakMpejUEndlf2Q/j71kuHBGI0mEl7DP/pvQtHWktH0QLuU1ekjWb+T
         z6uO6efVnbjKguDXlcfCWn6mkr3nJmdsaa/SbfMvPvTg2wKDSSz/5pbIe7cbx1vZUYzc
         EXkEhbJOPvLB13NkjVeOqMWrRZWAUnQQ/LCO5FkWnR5pYWeuMC06P8vs7o6wh47fmwTQ
         TCLIlPev6xGPzitXBXsmyYHWp9BZ3judAWgn2DgEBB1SUkl92NuWLNQValJUcEX8k5pQ
         flSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021882; x=1723626682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUbQKwssYICDEm/Dx0g9d2o0je/YbN4psjkIGP6L5Fk=;
        b=MJcjnBlkD2uvoi6EzHGKtMpVmZCiuATui27HM06YsmVNMBogU5HEdUX9p9yM8o1nHu
         +ZT29gJ6+UIk3c2U+IX84KxYaEEkOZ0sD6L6Ii6QyfLehJC/O/eDIYThwaa5EZoa4Yj4
         UZNnSI28Ye+hHVZHfL5PASKrHEUR7pnrbnhdSWAyktb7K5i1qh4SJePTcan5KxWtpQ6d
         /BM7sxu34Pz0iq1yqzE7Q8V93OTcLDl6fWMUd3fntJCbp33ARCSWhtCAep60LdHzLSvd
         bhZlxGozXgAGoq312LZMTXFw1BEprFUpgHuX28wNi3Yn8Hi678Kc+/W014EvFx8BmZpe
         tdlw==
X-Gm-Message-State: AOJu0YySmf7Nod8G6WKQQwRAsAtAQEfkzVo7t6mXSgcAuDhN5wCJ6eYF
	Q6qeWf59lmqH+9TkFeasQxUiqUJl4RiaYRlcAXKFexvOqY4I2+Eg0i2cR1JXR9w=
X-Google-Smtp-Source: AGHT+IFwoKwytJ3J4q9D8higgq7Nx59Scg5H6e8G/3LW6U6ZGhH9usaLQUDQ94NRPekpxgfJl+qEbQ==
X-Received: by 2002:a05:600c:468c:b0:427:abed:3608 with SMTP id 5b1f17b1804b1-428e6af2fb9mr108849295e9.5.1723021881797;
        Wed, 07 Aug 2024 02:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:11:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:42 +0200
Subject: [PATCH libgpiod v4 11/18] dbus: add a wrapper around the
 gdbus-codegen generated header
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-11-64ea80169e51@linaro.org>
References: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
In-Reply-To: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=773;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=E7xfc0OoO8rCmrbuafNaSaM0N/X8NsOSUm8udR2uWxY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoSVgsTRIzb9MCpTHhBjy4v/yVV8jM7DxO/d
 kSzKohcqbOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EgAKCRARpy6gFHHX
 cuLGD/9ohzm3M7cRQk8xKjPE84GmCB1tNe7EHsyacf0qngb4yrfx2ysgrbzf2rjLjGsUgb3ZemQ
 iwAdkBG4yERVH/L5Wt8kLMSEHpvoXWBo3UWl1vP9uNXEGF/0KMq/Uq9PSCqTGUGwJcrY9kcejQx
 aDxmCBeWzQCwqDePoovbR+2cEv6fkppgqgg3UpzP/dZqah9+OKqd95fMenMcOlNtCoPy5TKGO6k
 6C+7kaL93ZpbvChe5hdcqhCXpZdnMIeelolkDG1iAfpfcmJ5doh1H3H1WpAUEySXB91xyJn481V
 YA4revWYj+/deMHxzJJFh+LgeSUWRuUr4c6YeGbvadMORzl+NXKqZOFmNYMKJzSiO24peLxDlqN
 dp4EG8F1bC+bZ6t1A0Jimk5L3cAMG9JqXr73RgJhXaSr6jiIopWYEtD5dWFuwVmwTszL6FIku4P
 EZjRtkFrxIFI+0BLzT6PD9DeA70RhlcXvWlQN72DgAuI7O5BgVxcjH4XlD7mooOAdckYb4tE5bf
 uagZx8ukrba1Q8RF/QwzMMwSP8Gl0ucB5PYJv6K0EYDT2JVGVhOL0uz46wGRjoVDh9vVTbMJzV3
 lqBRzuOTmoC3FRMwFTAydGoeZZZ9YlEYvNocxZ0KChUoTPhjl+M8pfXms6EMBxF7U06O/nlcfFa
 KTEElYLSznHJTrg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a header that will be included by all the code using the automatically
generated GLib layer for the DBus interface.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/lib/gpiodbus.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/dbus/lib/gpiodbus.h b/dbus/lib/gpiodbus.h
new file mode 100644
index 0000000..69362f0
--- /dev/null
+++ b/dbus/lib/gpiodbus.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_H__
+#define __GPIODBUS_H__
+
+#include "generated-gpiodbus.h"
+
+#endif /* __GPIODBUS_H__ */

-- 
2.43.0


