Return-Path: <linux-gpio+bounces-15456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8E7A2A866
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DE1A3A8100
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF5B22DF81;
	Thu,  6 Feb 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gcb9eiTF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59BF22D4E5
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844552; cv=none; b=ZkRgZGIDVxvFxxp0dNX9KpX6xjeYhjSfl33gVRMR7VnRci4ttNN4DQLbHXtDfz/vzwoDU6aPkVAtJzTgAp+oBkPCoRPB6V/Fp8mPsYw+N+uCGwI/Rf+C2a3X3LBkiPNYWHxWM7pALdkXLhWQZLulyuw4z/6i8EHHvn4GnEwnZ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844552; c=relaxed/simple;
	bh=mSqsFmZPOabDVEeMLifE1dEy1siDeQry56Wdgi36et8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/c0gcWFQ9/e3jMAtddwmy8daQktE7pgkSjBWvVcc034wLt0cVaOvddQOuy8xbIJeogbBNIR1HOQi6266NqprcUvfzoE+GYUR8rMH8KsmwE0GNvKg+h56KjtFrLuHVn/V2KXJgJvlDNlMLUa7GDSCxkZUCNuh1jjCItbO849yYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gcb9eiTF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso4660955e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844547; x=1739449347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5LzZPmqY+CtWBYlpbMj2y2+1NLwvLGPcUy1p0/8H5c=;
        b=Gcb9eiTFs1vvpvGH60mrmAnsRsWJiak3rJHV573t0Be75Fy6lGdPdJb8EZKpikFea2
         bJltNRM6afR7cACrj9fo6/MoQ3odr57Wc6Y2lJb5y8ivAgxj5dL1e8HQuNo+N+tZtBq7
         tGOy9jATBw+ZAPn6IjE5SQbvj/hIwiFxCqmCmzqLe47nIiOVijuDKLJaAdPsmoiN02sr
         KlFjenBZEaLR6LETE5s92xHxT/ubCkDRVPNwEl+WOpaBBz7jqUl+/ezA4Zi8vgwtJcaq
         w9ewR0PwVwh1kUCdpsXahXpgDN8D3yTeDu75WMkeMtwe7pdS1p0+xtocO5dJe0E5nHFj
         QARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844547; x=1739449347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5LzZPmqY+CtWBYlpbMj2y2+1NLwvLGPcUy1p0/8H5c=;
        b=qoLC/1j9Fj9y/KW79tUWy1JEU3fhdlHvGGMVH0lIfyNEzs0xmA3XKBLxY0ezNXX6HC
         cmh0VUNruvRJaI2NaWDPYqnpLPVfLteBWelQu2kjhulyKYsjdaJtookcIUFr5PPxc1Zp
         EhgxQMVNVG3sw4UWs1HS6cPACliSegs/Eidk7Pyw/ojdHzV/SNNVugnvvZr8PBM6hYq9
         fkTejibZXM335igiTcTPTGvPISjLWrhIGtfPzlosg4BOj0IJOifwo6OFJHDIzcXnJiyK
         WJ77ok15fK5gIHPLeXsuiQ/0VjFQDCcwQ0oCX3JOzxytAdTzsy0Jfui5RDDz23smoxpS
         nIhA==
X-Forwarded-Encrypted: i=1; AJvYcCW9+7j2ap4Mk6LYSW9pMMMlNcMVehtZ6a7WUsxpRkqg9ISCVMRut3j7nf3QMZcqt1teSWDVAVGOTgx2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy1MGCX9EuUwDLJZU1f+8pfivWsX1GnezEtCWuNFMv+Cyzw/88
	x5RhO5xGsG5a2lV9ybnzmYADG9DH/tmehfGkDfKSvbxjqheDJA7HB6Hh+Gj9zWo=
X-Gm-Gg: ASbGncs46DSRhPDHQZyLbZPN+cmBsX6FbRbD7YE2EJN9Mr16nV66DqvsR3B38GpLed9
	1bjFOTKDBkGTjer+nr6z9VzmKUXgZQNkYo846AJnfJySEnjrdCl+1H70/VhRq7PVEs9jUWYBU2q
	2svs0gGr7NCSfLb8Y/w3FyXnuBloPCC7HLwYUmfbd93M1i8aNFqIL++LbAecgsDCoGcv6CSLTk1
	8W8mPIrTH9FVF2tpdyzUMQ6m1TvcJbssYCXDsRf4CzzjKcYF7B9XLxPZMxQzeKVwBxIaURc305F
	Rz5lPA==
X-Google-Smtp-Source: AGHT+IGczCRDgmz/gojEulOUC6+kPpO+Th8xWbvenayMcOUQp/Fn8FhWBiDqNvUkg1mNpSd7e4O94w==
X-Received: by 2002:a05:600c:4e15:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-43912c5a51dmr21653775e9.0.1738844547096;
        Thu, 06 Feb 2025 04:22:27 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:26 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:09 +0100
Subject: [PATCH libgpiod v3 12/16] doc: add documentation for python
 bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-12-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9094;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kVu6GynGUZT2n+IJIKq4QC/SP+KrLWb/1hOrgiRErQY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlzADHuvZ9mw2jas6aTIQnxTWKJppvfdbc6g
 6XkGFe53UOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcwAKCRARpy6gFHHX
 clXzD/9wAR476H1pcmKk16/u7V2ER10xhZPK5KB8POQSXPbn99cvUO/AJ5PIhzGgtoiUZWLRW+H
 1rq3uSYTPVA/WhaL1mnxJK2ruMuEBWJbAsc34vbY+DUmOVIh3dgCVFx554BD/JYHdn8SuonWEZX
 raqh+jKW3t3CpZlHODFFdk4mZiaJdFtvqMNBWRax9DkM58/iItl4jqxd1/n18a+0BykfACpFCgn
 /AhhWLwOWE+ZuNxERbdsmp64CJ5LR1F0Ma8gkw2shCzP+lWwy6Q1eYosLA8WZruEOiBi7oZPXbZ
 dHKZ/ryzjWdbkX4qR0KQzt8U1Fc6i7dSnpRjhNnOHTjhpPfB9UgGXwfo357+LRBxE4HO6EOpB3G
 XObpSEUzYPHjV0U4YDJVGQCtTSCHuVbrm4KQ8krNoPC+0dC2IV2UbrcHS+gn2EeXLGs81DEEmoM
 ShPWMzNwCoYL3XOs8qkY4cnbb6fQDtP4uO/UslIX+xBNeL6afspCRIBXGQX4JiD0Povrz2Ao6h/
 QGJ/5PZELf+yyIUo3u1bBLJ8Apxw5ex48mb8oC4pQ93gV7XShdo/djJC+DjFRX7QtQu2zwx720c
 /2UltIbSd9aMXiH13WCI2pflCis5HcT+e/JTITYZoG5pIdsTHloaiuQJOitAWfQhR9TRBxEkmnM
 SrVXuUaVZEHFTyQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Integrate python docs with sphinx using autodoc and the import mock
feature which allows us to avoid having to build the C extension.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 docs/Makefile.am              | 13 ++++++++++++-
 docs/bindings.rst             |  1 +
 docs/conf.py                  | 18 +++++++++++++++++-
 docs/python_api.rst           | 33 +++++++++++++++++++++++++++++++++
 docs/python_chip.rst          | 12 ++++++++++++
 docs/python_chip_info.rst     | 12 ++++++++++++
 docs/python_edge_event.rst    | 12 ++++++++++++
 docs/python_exceptions.rst    | 17 +++++++++++++++++
 docs/python_info_event.rst    | 12 ++++++++++++
 docs/python_line.rst          | 27 +++++++++++++++++++++++++++
 docs/python_line_info.rst     | 12 ++++++++++++
 docs/python_line_request.rst  | 12 ++++++++++++
 docs/python_line_settings.rst | 12 ++++++++++++
 docs/python_misc.rst          | 13 +++++++++++++
 14 files changed, 204 insertions(+), 2 deletions(-)

diff --git a/docs/Makefile.am b/docs/Makefile.am
index b8cf010..dd3e6ac 100644
--- a/docs/Makefile.am
+++ b/docs/Makefile.am
@@ -31,7 +31,18 @@ DOCS_DEPS = \
 	cpp_misc.rst \
 	cpp_request_config.rst \
 	Doxyfile \
-	index.rst
+	index.rst \
+	python_api.rst \
+	python_chip_info.rst \
+	python_chip.rst \
+	python_edge_event.rst \
+	python_exceptions.rst \
+	python_info_event.rst \
+	python_line_info.rst \
+	python_line_request.rst \
+	python_line.rst \
+	python_line_settings.rst \
+	python_misc.rst
 
 docs: $(DOCS_DEPS)
 	sphinx-build ./ ./sphinx-output
diff --git a/docs/bindings.rst b/docs/bindings.rst
index 069fc8f..ed7ec69 100644
--- a/docs/bindings.rst
+++ b/docs/bindings.rst
@@ -18,3 +18,4 @@ C library.
    :caption: Contents
 
    cpp_api
+   python_api
diff --git a/docs/conf.py b/docs/conf.py
index 04c8c3b..3d0209a 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -9,6 +9,7 @@ import os
 import re
 import subprocess
 import sys
+from pathlib import Path
 
 project = "libgpiod"
 copyright = "2017-2025, Bartosz Golaszewski"
@@ -34,11 +35,14 @@ with open("../configure.ac", "r") as fd:
 
         release = f"{version}{extra}"
 
-extensions = ["breathe"]
+extensions = ["breathe", "sphinx.ext.autodoc"]
 
 breathe_projects = {"libgpiod": "./doxygen-output/xml"}
 breathe_default_project = "libgpiod"
 
+sys.path.insert(0, str(Path("../bindings/python").resolve()))
+autodoc_mock_imports = ["gpiod._ext"]
+
 # Use the RTD theme if available
 sphinx_rtd_theme = None
 try:
@@ -50,4 +54,16 @@ except ImportError:
 
 html_theme = "sphinx_rtd_theme" if sphinx_rtd_theme else "default"
 
+
+def autodoc_skip_init(app, what, name, obj, would_skip, options):
+    if name == "__init__":
+        return False
+
+    return would_skip
+
+
+def setup(app):
+    app.connect("autodoc-skip-member", autodoc_skip_init)
+
+
 subprocess.run(["doxygen", "Doxyfile"])
diff --git a/docs/python_api.rst b/docs/python_api.rst
new file mode 100644
index 0000000..00b30cb
--- /dev/null
+++ b/docs/python_api.rst
@@ -0,0 +1,33 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   libgpiod python bindings documentation
+
+libgpiod Python bindings API
+============================
+
+The **libgpiod Python bindings** provide an interface to control and interact
+with GPIO (General-Purpose Input/Output) lines on Linux systems using the
+libgpiod library. The Python bindings allow developers to manage GPIO pins
+easily through Python scripts, enabling tasks such as reading input values,
+setting outputs, monitoring events, and configuring more fine-grained pin
+options.
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Contents
+
+   python_chip
+   python_chip_info
+   python_exceptions
+   python_line
+   python_line_info
+   python_info_event
+   python_edge_event
+   python_line_settings
+   python_line_request
+   python_misc
diff --git a/docs/python_chip.rst b/docs/python_chip.rst
new file mode 100644
index 0000000..8f56004
--- /dev/null
+++ b/docs/python_chip.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO chip
+=========
+
+.. autoclass:: gpiod.Chip
+   :members:
diff --git a/docs/python_chip_info.rst b/docs/python_chip_info.rst
new file mode 100644
index 0000000..c6db865
--- /dev/null
+++ b/docs/python_chip_info.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO chip info
+==============
+
+.. autoclass:: gpiod.ChipInfo
+   :members:
diff --git a/docs/python_edge_event.rst b/docs/python_edge_event.rst
new file mode 100644
index 0000000..b316665
--- /dev/null
+++ b/docs/python_edge_event.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO edge event
+===============
+
+.. autoclass:: gpiod.EdgeEvent
+   :members:
diff --git a/docs/python_exceptions.rst b/docs/python_exceptions.rst
new file mode 100644
index 0000000..260dc3d
--- /dev/null
+++ b/docs/python_exceptions.rst
@@ -0,0 +1,17 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+libgpiod python errors
+======================
+
+.. autoclass:: gpiod.ChipClosedError
+   :members:
+   :show-inheritance:
+
+.. autoclass:: gpiod.RequestReleasedError
+   :members:
+   :show-inheritance:
diff --git a/docs/python_info_event.rst b/docs/python_info_event.rst
new file mode 100644
index 0000000..b89cdfa
--- /dev/null
+++ b/docs/python_info_event.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO info event
+===============
+
+.. autoclass:: gpiod.InfoEvent
+   :members:
diff --git a/docs/python_line.rst b/docs/python_line.rst
new file mode 100644
index 0000000..ec8f09f
--- /dev/null
+++ b/docs/python_line.rst
@@ -0,0 +1,27 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line definitions
+=====================
+
+.. autoclass:: gpiod.line.Value
+   :members:
+
+.. autoclass:: gpiod.line.Direction
+   :members:
+
+.. autoclass:: gpiod.line.Bias
+   :members:
+
+.. autoclass:: gpiod.line.Drive
+   :members:
+
+.. autoclass:: gpiod.line.Edge
+   :members:
+
+.. autoclass:: gpiod.line.Clock
+   :members:
diff --git a/docs/python_line_info.rst b/docs/python_line_info.rst
new file mode 100644
index 0000000..06f526f
--- /dev/null
+++ b/docs/python_line_info.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line info
+==============
+
+.. autoclass:: gpiod.LineInfo
+   :members:
diff --git a/docs/python_line_request.rst b/docs/python_line_request.rst
new file mode 100644
index 0000000..2d78b4c
--- /dev/null
+++ b/docs/python_line_request.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line request
+=================
+
+.. autoclass:: gpiod.LineRequest
+   :members:
diff --git a/docs/python_line_settings.rst b/docs/python_line_settings.rst
new file mode 100644
index 0000000..b1d594e
--- /dev/null
+++ b/docs/python_line_settings.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line settings
+==================
+
+.. autoclass:: gpiod.LineSettings
+   :members:
diff --git a/docs/python_misc.rst b/docs/python_misc.rst
new file mode 100644
index 0000000..3ba1e2d
--- /dev/null
+++ b/docs/python_misc.rst
@@ -0,0 +1,13 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+libgpiod python bindings misc
+=============================
+
+.. autofunction:: gpiod.is_gpiochip_device
+
+.. autofunction:: gpiod.request_lines

-- 
2.45.2


