Return-Path: <linux-gpio+bounces-15750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF6A30C53
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D15C166ACB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9F9221DA5;
	Tue, 11 Feb 2025 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lXKBoguW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DFF2206AC
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278793; cv=none; b=CU2ck2zC/hMWuQwcdq2e305Cb14EQACs746ru/QtNqpNodZhrQl8NRH7JzXKp7QYIxgQMnYxdnbF2XyjWqkTC7+inZQ8O6fvCPgbz79Rdh7lEVSOfQpyd5S5Mmkhhwmqer/lSRvVdDiGdYsBbPKBsVsTcTLsZ+LpZ0tgyHWoVXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278793; c=relaxed/simple;
	bh=vsC0ALtmeFLUJid3v92trM8BakrNODQ+xcARW6L4VGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbt2ztcOVQC2eAruCDPL+VeRa0t4G/zDMVS8pUGEIGffPHA4ufVETGl7ZE1f29TcqqX/NI4F+5Cfc3riFHhOMjk2bxMTF6mK1+1gduQcG/UkjRBHtpfhlV7j57g4wCxUClXnGY7NSan70iDBEyNwVD2Xb7XxU5UJTuntXFUe6Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lXKBoguW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43956e3863eso1367555e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278790; x=1739883590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOiGJQ4r4j0cd7t2jdREclbjjrfQFirN7yKGlUgJciA=;
        b=lXKBoguWn/EudEz8AZVZOnj9jX/QIIn8UO1z/zELLY3vGt4cficUUeu393k4RR9SQf
         d3RaMdtF0FihwgtQe84/Xdkqjc0SYBDPjrsAhblNAerCz+8oK2A82S78fjylkAXqMo6C
         Kyf0a8f0iKb8vyanwcZ54DzLQ0pru6rMMKSR9v5C5dmInXaWsKS4NMTAt+PlvRi9bgnj
         dDvKZ1Gk1OV095YuteO/utf8j8eiasluuqAaYokQ9zX987WbVi2MxVdyu1ysOBvIuAB4
         68vCaa/RDFQvR0Yh9swYjIKz8I4EWZ3kbiA0sjbwr0PlTcr3mPKe/Vh7Vt7yIdDnJJ9e
         9vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278790; x=1739883590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOiGJQ4r4j0cd7t2jdREclbjjrfQFirN7yKGlUgJciA=;
        b=acwYgRWZ6Aw/a2omw/CLTEGVYeTkRASQ/5peap5q39pMy91X2hv9HdcdzKnjs9DWuJ
         b89SnEq/fjgcpXA7zzTsqxG6B9lmF9U53XsUJU06EMj+ePnt4er55EmGP6tUym1pl60N
         jeN2gaAjyrpfBcq48FHzBCBgx7JLA6+pXHhGx5IkTVfh1CuTmq+hAgIbMYHl5UIK7QPA
         fdTZA8HvVF5Uau6i3B/WeeqG3uAle7icV+wQLKdbrmf4LXtfKsnUQGCCEh2EKY2pHUvF
         Ops060g9EUXQyaBTbUUOGGjByd4ovTJ0ebVjyPC1bDJnAVhwtqYeGJa69F90HiqfGoJv
         wtlw==
X-Forwarded-Encrypted: i=1; AJvYcCUNZcHDPFO+xNgyx9GI6pTDGGf03aqFy84uOAzeS5YqNwWFXuGdESI0cTjikeLiN+Uae+gVtBZTnRd8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wA1Mh5r6lWXX3hH3IzuF174PGqt3MXTABybFEkHb37YaXJQ0
	LsVvflXZ1fITUs6dpZgQdXhCnq3ZxJOL3jtTCi3dBXByhShklp3k1Pw/JqsqELc=
X-Gm-Gg: ASbGncvVqJGc5DyxKVisE8iiH/RS2jYdKccz8FYjKLN7C4VGvFf2oWcr58xSv5Ruvhi
	TXIa8v9C6CAN/QpOmnk5r/fgrx3g6f2uP6RvHQHwvbcaGK45aytUEBnLiEyqdCD7+jdD/+yMVwc
	V5nsEr3whSPJ1GYRJvRtQRNIZwMaGii1QF7E7wzgYmZPeqrzRKQ2FYrtmCqsD5+jFWPM3I1pn9j
	OkwbF7CT1/0b6U+HKFJoebMhDiDdZSSVSYSVaE1ajkH3DpVZdau0MEd+TiIGNyNESdU+pyD8kfS
	M3k0A10=
X-Google-Smtp-Source: AGHT+IFpC8+PoiZymDghgk/nocefVKmmAKehitPNo3SWXW2iU9YSChD/4pE+hcz2oi05zLl2Ie1mWw==
X-Received: by 2002:a05:600c:1c94:b0:439:5590:6d2f with SMTP id 5b1f17b1804b1-43955906f3cmr16132275e9.12.1739278789635;
        Tue, 11 Feb 2025 04:59:49 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:32 +0100
Subject: [PATCH libgpiod v4 11/17] doc: create man entries for gpio-manager
 and gpiocli
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-11-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ze8CjUpLFt39ID/3fvUYRUTR+iu8gp4jyehOfU7r9ak=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m3cjz3fHi2mWv60kWA4+Ddqqo2aKR93iTDi
 NzWFkc4FnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtwAKCRARpy6gFHHX
 ckpZD/9KjNG3wbIZTnrTajxqvUxDd5XtI4HsaGgT9Lrl/M7eFC8SkMHHMxY+FmFmSd3VwNpa4+d
 h2Ense4t5i52YgooTtlUbCt5MO/C+di049vSYODnuv9SRqGAuPeGeWFfWA7K65csyzdAK9/Grii
 3S2jU9CK5XVyevt6kkd4o/1Kv3KUtMQ3E3zb5q7UpZSTxGCobmup8Ra71LXDXvlnGCNzabMeDwS
 VIr+xeC0AN+owK+ejwwHgoLdt8PTLjojV4MIDB3U8FyRaMp7ZyDLJXBrASf0IyHv9wq8554HLRv
 EU5mD2zwgnPexxAS3IYo5VHUBFAx5aQkRti3jX2eDw1ZAQlC4y177zau2pRSKfzDXotAnIQXUos
 ZCKEixWnS3tDOElGFe9sWB8mdzTgdySB0hMfr8qI1HVITSfJTTeeZP3byKmKwwUGkAETZ04kIdr
 4lsMUsUOnSDbINlG3nCzDg/Dle6kt5XseQoCRIwb0le8+Y8oy0ET7cssQp9OaQL/D4Po9Kf4sM2
 LrXmvzzS/FHxLfn+spQfRu4Qebytbeaof7AxBkvvV4sGVwRnWq2qJv9qMGerGX9DZky1rjcNMU5
 8gciZMCcRtQSuNeNnAZ8xBGRq89fB5Sp2bQ73icS5O/8TrGMpkPAVgTz13Qg0Rjhxm38PKD34+8
 BE5GTD32QZAbisw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build files under man/ to also generate man pages for
gpio-manager, gpiocli and each of the former's sub-commands.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Makefile.am     |  8 ++++++-
 man/Makefile.am | 72 +++++++++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 67 insertions(+), 13 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index c824dc4..d310e17 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -24,7 +24,7 @@ endif
 
 if WITH_TOOLS
 
-SUBDIRS += tools man
+SUBDIRS += tools
 
 endif
 
@@ -44,6 +44,12 @@ SUBDIRS += dbus
 
 endif
 
+if WITH_MANPAGES
+
+SUBDIRS += man
+
+endif
+
 if HAS_DOXYGEN
 
 doc: Doxyfile
diff --git a/man/Makefile.am b/man/Makefile.am
index ddd0628..8d8bc46 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -1,22 +1,70 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+# SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
-if WITH_MANPAGES
+MAN_ENTRIES =
+MAN_DEPS =
 
-dist_man1_MANS = \
-	gpiodetect.man \
-	gpioinfo.man \
-	gpioget.man \
-	gpioset.man \
-	gpiomon.man \
-	gpionotify.man
+if WITH_TOOLS
 
-%.man: $(top_builddir)/tools/$(*F)
-	$(AM_V_GEN)help2man $(top_builddir)/tools/$(*F) --include=$(srcdir)/template --output=$(builddir)/$@ --no-info
+TOOLS = \
+	gpiodetect \
+	gpioinfo \
+	gpioget \
+	gpioset \
+	gpiomon \
+	gpionotify
+
+MAN_ENTRIES += $(TOOLS)
+MAN_DEPS += $(foreach dep,$(TOOLS),$(top_builddir)/tools/$(dep))
+
+endif
+
+if WITH_DBUS
+
+GPIOCLI_CMDS = \
+	detect \
+	find \
+	info \
+	get \
+	monitor \
+	notify \
+	reconfigure \
+	release \
+	request \
+	requests \
+	set \
+	wait
+
+MAN_ENTRIES += \
+	gpio-manager \
+	gpiocli \
+	$(foreach cmd,$(GPIOCLI_CMDS),gpiocli-$(cmd))
+
+MAN_DEPS += \
+	$(top_builddir)/dbus/manager/gpio-manager
+	$(top_builddir)/dbus/client/gpiocli
+
+endif
+
+dist_man1_MANS := $(foreach entry,$(MAN_ENTRIES),$(entry).man)
+
+%.man: $(MAN_DEPS)
+	$(AM_V_GEN)export PATH=$(top_builddir)/dbus/manager/:$(top_builddir)/dbus/client/:$(top_builddir)/tools/:$$PATH; \
+	if [ "$(*F)" = "gpio-manager" ]; then \
+		EXEC=$(*F); \
+		NAME="libgpiod D-Bus daemon"; \
+		HELP=--help-option=--help; \
+	else \
+		EXEC=$(if $(findstring -,$(*F)),$(word 1,$(subst -, ,$(*F))),$(*F)); \
+		NAME=$(if $(findstring -,$(*F)),$(word 2,$(subst -, ,$(*F))),"libgpiod command-line utility"); \
+		HELP=$(if $(findstring -,$(*F)),--help-option="$(word 2,$(subst -, ,$(*F))) --help",--help-option=--help); \
+	fi; \
+	help2man $$EXEC \
+		--include=$(srcdir)/template --output=$(builddir)/$@ --no-info \
+		--name="$$NAME" "$$HELP" --manual=$(*F)
 
 clean-local:
 	rm -f $(dist_man1_MANS)
 
-endif
-
 EXTRA_DIST = template

-- 
2.45.2


