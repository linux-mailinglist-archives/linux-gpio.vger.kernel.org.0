Return-Path: <linux-gpio+bounces-15746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89615A30C4E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A38063A7B31
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C1F21A424;
	Tue, 11 Feb 2025 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b4R9aUH4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268DE214A92
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278788; cv=none; b=RGkBpsMGuB2Q50oO8/xntpscXU65aQ2c5LI381JFtnp9yP+HfBWMsymKEJj28qcKB6o3RCHBonqtYowio0fVH6pBj7fVGJvkpuSRidHi4KdBDML6zHYeiYluRfhKD7uyU/YhegPucLJDjVoY5BxrHZ0NdmNGALhxUoEd8ntrFSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278788; c=relaxed/simple;
	bh=CAkwPFpseBA3z7f71zA6/63ooE7+6yUcVDOhZIH/1P4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9E0wy4QX0OQrpE3FL3LPYHVMe6GdLFQzrZPoQimTbt6QjcACQfNBF50vfoRu/r14pj0xKkP/3VoWjTgdC8SZdhMO1DOOczcrXL13sJsVC148IvcALQVHdPmbMclnA3IjxuYkU/Xu9zPl4tXNpHyuicsDJ+lHs6tYIgnrZWVG8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b4R9aUH4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439307d83f0so19736445e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278784; x=1739883584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7R9YlqSLEOyBIptzx/BK0WNp0zHju9zqil6azG9zE4I=;
        b=b4R9aUH4K9OofT1CxLu2XldpNOMON9E1CXyXT28dtTI9hkR7w2w2LlF6qrTNNe6bij
         GAYfMIPVqWCNTC8FKWf86nGe2ezgzGQkWkTpfzHFz2Nt0FFdL3UJ+BAjF+VEGnbZCBBo
         Yx32r6M6L3wxPAaY9zAHm3aClkZmg/pSkJzd4ibc1UGBMNOjqXZ6txDxh8Baqs3tMnaF
         rT5PdOGcSf/qrJKMegXUc4rGMcxcDREfcemR33GJCaImdZ3JbPRO217w7LqGmbV4nEJn
         mm55feSRkDezH9PsLe7rFNyoj+DwBcGNWs19jbrhvOYHmbwzW0McuXHd5y8R6h0b2kMd
         54EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278784; x=1739883584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7R9YlqSLEOyBIptzx/BK0WNp0zHju9zqil6azG9zE4I=;
        b=SPjCaHt3VnR97E43dFjTzt68p1FvvlIhRiw96F5uBdYAvSQpWEmWP0AuwlsptG4iPC
         iz0v53XO5XLPAfZpoK+bk0GdRv5h3Cj8KG548QV2WCfr9vMRautr9QhqihytaSnS4t+v
         /4AUHo2Mumf4LA9sOU3Lh2ngkMzWM/ujX4gFLbF+hDa73FAKWMlcOzJ10zXepFGiwfMr
         uX08Fmbj8vPFl9ufTszc5TOmP410es77Xj7otzZvxlAFL1C47cYCnlFUehyTyxd2yiHa
         /VclDxozoct+IBH0VFBh8utrkIFFma0jR5WaBbPGXROToCFfV/If7CN54kbgvUXYKWQx
         MApA==
X-Forwarded-Encrypted: i=1; AJvYcCVYGJ79n3ITR74bzVI2/lV/asiUBeKS2ymOi25Y8t3hMXyEpYA8ONcRXRlHhQR1ur95Mh4FFFiILQEc@vger.kernel.org
X-Gm-Message-State: AOJu0YwETRhKq/fbtRKIHbouMrNrO9XzuoPN8kHI6frruL6OjtJuhk6W
	Bh7ytAXKzq0G04T8yWK4V0Lu5lvX8nQEHPO7cDh/daVKWaCaUeY2LV82SRn5T+lcga3UCgrz8QK
	XTvw=
X-Gm-Gg: ASbGncs/MAd5Hbby23DdJUi83qOvArPwoNciq47fUTio6Ax86RTOd11Udu65067VqtX
	WdW/h2PjIWuvqIY0+GKqCXJERZo8lxMKQjyN3z4+nCfzKj+cmx7ogBUOl4maSr5lbXi9mdO5WXZ
	Cob0Row6Z+ebQ1bHJ3MiTL6lqklz9HP1OMtnjJeb8DNLulBz92ZVmksGzoFVtm45piJlT/vxLoB
	wr71c5q1u7kBsTCTocoyfG5PwNzUVDizWHJuAnQdeWaWadgFIiEubCJ6n4V6CEknOz8DOHNdsz2
	U4sX0z4=
X-Google-Smtp-Source: AGHT+IFVq3VOfQAAUYEaU/wwYfN42bCdWCdjxZM8U6o/wfeIy5nmADYWgrsuVEWzgiwb6oyf0e9HwA==
X-Received: by 2002:a05:600c:1e12:b0:439:3ba0:d578 with SMTP id 5b1f17b1804b1-4393ba0d71dmr115791555e9.11.1739278784509;
        Tue, 11 Feb 2025 04:59:44 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:44 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:28 +0100
Subject: [PATCH libgpiod v4 07/17] bindings: glib: add the configuration
 file for gi-docgen
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-7-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=K/5KnBgwiq3Wbij50B7/aTbCG36deEQw4ZueYnmYsmA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m2/ruAUhwPsdyjbvJ0Bp+2rt01u2yFAUptM
 5rgb3mcE/6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtgAKCRARpy6gFHHX
 coPTD/wNwj4LkUgD/3kbgdPHWPElkgfhrbwXJxPKvRm+f+u2rbO+4iZELroiaXpJpxAY5jcG6Ve
 svE+q57reJmSBDTaJlvyJV9dvt0nEUCEZ8IL1MR2MFy9dwhE8u49eTYEF6K5AOqPHuNhNil5wyf
 Uhlo8LehOshA0L1YVd5PBJ0V0TCGHu/UI4JN5mtnr+kaYBaxiLi5ETWNZunYE8ynzQ0OUgXjdJx
 hpgdEu15DWeRoMi8ZKR6DbzQGC0T/KOiYJMuaJCSyNUYjgGnYX3gvCd596AMkexNsyQ8JPxthVv
 U9J2vfremWU95veVGHlWZ9sR1woKzNerDCWXYKXDix9M9d096LJTmtteTDouGbiNNCrvQxL96fO
 DR/u9SrPCFcd8Dzl5uXEApVs68TC1j131vLt9VaCSzkTmUiF5nVxteBLEn8dPIgQqoFfEQXkYnk
 P7vmz+ZwnQ61VoATb/U+IjxP6zJ9jWTdORrQ8TZeH0fmGtyfHj8e/65S0/j3uvNdxinYiUGekPp
 jlISnVABAcH1KL5z5lSptJ4aCMNAIQ7U7a3WinAoV+/1vM2bbRTwcVs/tnA0DWPcuO+AWO/5/uo
 AGG4uo/zA8ITW64hLzURmdGVXp04LQ+lqPHQGo1brXngqjH02l4Ob66hZQ0go5+8IzEMX/8Bdi+
 Y+J5j6aDVxO94Ug==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Without the gi-docgen configuration file, the GObject docs don't
contain information such as library version, author, license, etc. Add a
simple .toml to add missing bits and update the command in Makefile.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/.gitignore        | 1 +
 bindings/glib/Makefile.am       | 6 ++++--
 bindings/glib/gi-docgen.toml.in | 9 +++++++++
 configure.ac                    | 1 +
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/bindings/glib/.gitignore b/bindings/glib/.gitignore
index aa399b8..5d6fe20 100644
--- a/bindings/glib/.gitignore
+++ b/bindings/glib/.gitignore
@@ -4,3 +4,4 @@
 *.gir
 *.typelib
 Gpiodglib-1.0
+gi-docgen.toml
diff --git a/bindings/glib/Makefile.am b/bindings/glib/Makefile.am
index 6ecef94..f0241e8 100644
--- a/bindings/glib/Makefile.am
+++ b/bindings/glib/Makefile.am
@@ -124,8 +124,10 @@ endif
 
 if HAS_GI_DOCGEN
 
-doc: Gpiodglib-1.0.gir
-	$(AM_V_GEN)gi-docgen generate Gpiodglib-1.0.gir
+doc: Gpiodglib-1.0.gir gi-docgen.toml
+	$(AM_V_GEN)gi-docgen generate --config gi-docgen.toml Gpiodglib-1.0.gir
 .PHONY: doc
 
+EXTRA_DIST += gi-docgen.toml
+
 endif
diff --git a/bindings/glib/gi-docgen.toml.in b/bindings/glib/gi-docgen.toml.in
new file mode 100644
index 0000000..5550a31
--- /dev/null
+++ b/bindings/glib/gi-docgen.toml.in
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+[library]
+description = "GObject bindings to libgpiod"
+version = "@PACKAGE_VERSION@"
+authors = "Bartosz Golaszewski"
+license = "LGPL-2.1-or-later"
+website_url = "@PACKAGE_URL@"
diff --git a/configure.ac b/configure.ac
index 34de870..5a7e01c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -307,6 +307,7 @@ then
 	fi
 fi
 AM_CONDITIONAL([HAS_GI_DOCGEN], [test "x$has_gi_docgen" = xtrue])
+AM_COND_IF([HAS_GI_DOCGEN], [AC_CONFIG_FILES([bindings/glib/gi-docgen.toml])])
 
 # GObject-introspection
 found_introspection=no

-- 
2.45.2


