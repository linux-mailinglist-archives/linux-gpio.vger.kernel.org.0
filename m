Return-Path: <linux-gpio+bounces-15454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F358A2A864
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9055616214D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C11B22DF85;
	Thu,  6 Feb 2025 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t6fprTc3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB4922D4E5
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844548; cv=none; b=KQ9849hPP0xrg23q2duZH8PNR0fJdou8A1jGB/VAqEzrN3LoCWQIMUBAQxGlfIH3tF8QhzR3NZw5XRvmt/UCDT4PgoYv7DCs7XL7EbsTtRyzRcYkK80+9jOs3PvMR3ef/3kCYvlz0ZulOfV1oVTlsLUiF2wJvkSWLX2qPdv2HRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844548; c=relaxed/simple;
	bh=vsC0ALtmeFLUJid3v92trM8BakrNODQ+xcARW6L4VGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8A91/gTLxckoYGHp3PQQE8+btxC7pMyyUVZiWNbqtlxesGUiCR3I9KoKa9eLoxisPA8MIXpflTe57eI798ObBK8dAES6sRbS8g5dma+oRYmMsONKsssCskBTa19ndDFgbIyhmcFlnkLnTGFq0Hky1B9Oa7WB04V6FuxVTo02XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t6fprTc3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436202dd730so5554155e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844545; x=1739449345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOiGJQ4r4j0cd7t2jdREclbjjrfQFirN7yKGlUgJciA=;
        b=t6fprTc3/Jyw11HRRPLD6AvwQGc+d0bmfm28taEms2pehMbADr3698npley9A8ISAk
         eDo4Am40IwvKeMDRANSm3ZhsfGsxOfTer7bnEfGUxHZ7UxuXrTHeiN+/caj9SgoHo72J
         P6FcKeAw8lHC10KL6uU36WYkQbWZ5mieLs9hYGsPzJiml9ultrPwcHgkafGXV7wppbqF
         ScjP+YTQnTh9NGXsupRAZf4Q5N4kJfnE8MOpeN6sI+duZBP6HPy/sFVrZxCSlAx0eaNb
         JS/aa6d4dKe/TjJnTeaMUWc+oU9CPl4O2Sn5CNJH49OWV3KpP3KjgncKqnAV9S99hJ4K
         i7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844545; x=1739449345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOiGJQ4r4j0cd7t2jdREclbjjrfQFirN7yKGlUgJciA=;
        b=tNaadanJo/yye84YJZOV5S2MWYx938TnQmeAC0j9kLO6rh8kiFbax+U3yVNW/PI0HN
         CKGi9stzVBl5N+omIKxTrT35Gfn1KjOJJklCebnQlDWZke3iuMCK3w3M6vIHS4gkdlYe
         a2na3V2YP5RuglI3BvsuVpi18ErXpzWXOwe4YZf1zgLLGbULyREa/12GqBfnzYBon7R2
         5KRsmWoGge371OTcnckf3JlA9AlDnmRkWhVYTmXVCWLAZ8ImY+ILxHkr2+GwyjgAVdo8
         pTdEOJqo9yviIvyajj4BLs76Ehh3pOvHdLL2yJDy57eJlEpfYJIOrKlMI/mo2bZOXtnJ
         rIJA==
X-Forwarded-Encrypted: i=1; AJvYcCVHaISIjRc/2ZNY7VGJAR28jZczy1B83PQPDwANuOZgu88RyLSGcZEerkbz8THVNRCgiCsjZaJM4yOY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8PiLPvP8IFNqCzjezTl+3wUAAgXx5wZJAOf0cUkC9jF3CY8+I
	VSiWGYNPlGT+4b55Tisdpy6r6laTxmTsIR0Rf9aEYv17URToR8lirP8Q3hji1xs=
X-Gm-Gg: ASbGncuGeXBoMFgcQX28Wt0ByWKGRLTM4rApo8yX6FWym13vS0SO4Bi5wxa3dP/D8VA
	ECEHRbMT7wHAU/G1UaWLex7bIrX2PyzlXtVGiR6I+8LBke+1jOf/SZ2mjOx+7iaWMM807yTUnu+
	iR5nI2AsT1qq7eS5G9SYWpr54xpDtW7HgbxOm+bJXd9vqB/8icLiWHZ+Cdqyi3lh+2JBNTdEaPr
	DKFm/zwIzN++LDtSPhjMEAcs2abgYO3oaTCAATylxm0FzeOqu/Qju7iwrO1Z+Wz3CVKcg0uinWi
	iKPA1A==
X-Google-Smtp-Source: AGHT+IGiVQd0qFmQVsVXz6h3k6onPKVCJXuA9UuIiZxpcL7v79TaU5m485BNF53X3sFzBwRCxX3veg==
X-Received: by 2002:a05:600c:4444:b0:431:547e:81d0 with SMTP id 5b1f17b1804b1-4390d4340e7mr70085515e9.11.1738844544707;
        Thu, 06 Feb 2025 04:22:24 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:07 +0100
Subject: [PATCH libgpiod v3 10/16] doc: create man entries for gpio-manager
 and gpiocli
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-10-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlziqIQ8R27vKLgPxgVm3pswdSbvQARh43lM
 1IQvvHUagyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcwAKCRARpy6gFHHX
 crRoD/0Vcr6oXl1HyXLlBkuVBbfCcQnTUR+q04rN2GkQQhTtKLK/ttjsPlKr2hMgxNmbF4W4UDd
 WNYpraK864rccIzyP6dz5T7gNYFeNIfTRV0yuQCmz4US0v5+1oIefXy/eWyLZ/TqiSC8aG8eMeq
 y3BTSeAfrkok5l9zd2A/+4SeMyYseLnf5A1kSRX+agoBX6c4pYgxTyWlONPjM4TX/I4OhR/BU4g
 QkU/v23LYv4vJvBF5ntBO2CYM/adQnLeXqFaKwZH4kAHAevvGNSwxSbXCWTveguQrnDMNqun1Ji
 aieqKvJEkjyGTAT6sisT2SSquU0H5cqkwtFMoqZHH9xhlFg2p1aRNG3/Qw5Vrouw0CxUpZrPA0W
 B7X61PB20t7IDww6nncjDBqzb4UzvQeL9wvmVPj8ngzvPvh4mBLRWl7jueJVXEQGAlMWtl5QhOk
 YGQXWWIRLm2akduHXTfJdM00jGPToYomFPQBeN8JCByeiezwukaqlf31jwRZqREvAH3k/oSY0aX
 ToGgKWdYJnW1yTQo+frQD5uR/+BGyb3Lx/tRc4FSVAPr3b9DGag65m82zTFD9gcoikdnYlbrPib
 aTvzlSHSEuAs/Y6g9LAJmJ56PLyVa/WF0+l0qe2QtWVZLCWewcHeZUv5tkrNN0v/OqFgw6nRG5R
 YrQ9AL55HlditOg==
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


