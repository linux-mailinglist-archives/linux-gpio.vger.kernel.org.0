Return-Path: <linux-gpio+bounces-15753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D81EDA30C57
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C36D1668C2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3374621C9F3;
	Tue, 11 Feb 2025 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s91DYsm1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F8C215793
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278796; cv=none; b=U09bi9F0E28R7PEWjWyGSmFvlzXu8mcOn/vgSw/B8fGKZcliFr3o4QEex0dgwa3fKz3E0T3fSK84PReVlRT4+3n65eQqjVEgILzfH0MdtDzwKM4lXJfDcQGQ7w/djDVVVk1UXO8k/fF4rtXEaKM+rwKmYohkEYVuC4+ycsjB1K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278796; c=relaxed/simple;
	bh=sv5jd+aZKb5A3ehW0lDT+74RH9tP3fBs93kGmvNBXdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hc1FXwEwohIebF/feGZGFrNxJsdgP384+qcwZ9j4kLfDG1yB8YqzTeSIcEZ2L/VaYUMqkJ1frEeIjOcRaHURHWctzU5PjlXzI+XxdaH+WxSQt5edHDrWXAemILuyK12VHGlZBN4lgjNfkumyvMVxK7HVM542OcjF3KVyGUWYW90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s91DYsm1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dcb7122c1so3517044f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278793; x=1739883593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkUmUcKe4VndENMhfh4iGMZVtl5QOXM6snLn+fIOv70=;
        b=s91DYsm1rrQGJPFPvQVXTYEwyEG7w4CMMPV1ppDEgqzXA8wWaot5OTVZK83YOQQfPM
         JGX1sdCKW4rx6jH5ij3BUDSy0CHnczTq2F0G6ynAFpWphLMZQvrEtpqIMsp91vL2cmcl
         aeqcWaTKCeZAzi0RjVNNW4iR59tYIyDk3hbNiBZV3qHBnwUVF2Wmad3r4NeY4DIH85RR
         9P6jC1XtQz/W+n6D+SruWiHdoq/yvsvBrLTV16PilkixtV5YvsNx59BtwIwZa9q9wcqp
         dJPTV1AcVnuqCQlZSHwq5MMRrTT8eNcZVamv0XyfUGzH7eieyOcP8d7VIK/bnv+hIvLI
         Rypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278793; x=1739883593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkUmUcKe4VndENMhfh4iGMZVtl5QOXM6snLn+fIOv70=;
        b=CAqKjn2lTJ5+xop90tlCfRU053gcuCtY5irS7bYbNF0sapMmFzTwNJFVfo0/boPMRI
         njQrTznVuHE+xdEmWOBHJV3A6U2dPllfdxJHHXhglBJSvCNX3mPpjMAZLHx9NcgM7BoC
         GUrj4Qz7lgeBst2AUI2fReYMZ/Q/l8mMumCB7mLoth0bPFvLJseI3mava3thTQKuQE2w
         YJglSpMhMimNDRudt494FCnnNMI59v7cu//BSD8QMxaS2ihrhR7+ySYofySGoshYNZEE
         waQZOzxcxdPjCV9MuXkf4ZjEoA1/J/D46Qz59Sb6yd0jQXKuZ6+htznK3cKW9AIho/zS
         3wAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcNdwjjvqYjICHK7ASSCrsJs2pFvY5iKE1A4JHTt7VLhaO1MPZ5OnBKA8+j/smwXcR4shXGC/wpYz+@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0TZIm6KCzgQ0UEBYNOYwQl618CsE5agBwjibou6gTgonAmEo
	p6RCc/xxqxjneByT1ySR2cpv5Hr25GKBwJ6xoJYq79xKhp9qbzQe1eJ0KSclexE=
X-Gm-Gg: ASbGnctRnIo+Sg/pdehL0ORMxQUQC4Qm47uC3XIqNNJhfHdtp3jrrICt6a/hVLMmJA7
	9xiKM/4rL5RgELS4A8lZ/sOXSUS6L8YYatZBxxLEUkGAdy1gDQK5/P1xtD1pkfAKSDwpSCDkhlo
	YgzNukr6+hLv5dYlpugAp0Qu+g+fYCgF16xBhjtpA1TIYbTqB8+8PtXvDvpqbX/9v1P7hIeKPmb
	8xzXp9726w7Ic2xTlqVxsHEm3VnlaPgYWlOq3ASzJIMJyjiM0rwlyc91sW6k+cVkyMI/AtPQXjb
	aGiMj8I=
X-Google-Smtp-Source: AGHT+IFEevF5GvJCbsqGDVstDocQFRz+S6f/+xQ07qcYTbrHEFI0rFPkgWYX6QkY5SSYdUGflnBn1A==
X-Received: by 2002:a5d:6d8a:0:b0:38d:dfd7:cca6 with SMTP id ffacd0b85a97d-38ddfd7ce1cmr6590364f8f.22.1739278791552;
        Tue, 11 Feb 2025 04:59:51 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:34 +0100
Subject: [PATCH libgpiod v4 13/17] doc: add documentation for python
 bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-13-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8739;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ak0DM9dfmdpdTsuqo+gHwS6h5DiMw4tEQvjTklsChCA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m3ArUfX4jRFuDeqvYG7kXnECsPhBnXvwN5X
 VcgKZ1or7aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtwAKCRARpy6gFHHX
 cqCtEACaFdNcew+XFKGJ3kbYNMqVR7FYMzQR8b3Ui9V6ZIolW/nRGxqAlmhiRjlfJniS0rz9GVw
 EQevG1YRfNjco5TYFfCd95T2bfi+GIB1PSp1DZH28BsH62q0Q6QchgDMj4YO51KsyRu48kq0mTe
 Z2F9EzTy75VRUgGXDfII7tzgsbSgycL9KIQ1Nqs4X/6P/G60UCcurTU2i8fL0g1eL5ElhVYdktg
 tBnP3PvpBI5Rx6xopnHP7DrnVx9HXYda5Kv9rzdAVCHQz0h9dgqVh/8dT2y01zX1AeS0V7DkWm4
 7/k0qnA8QNiDAcPtlMuurnD53OQvUFQbKfp+44TFdKmyhFcHxcw/u87wInXrTacqJV3c2bRc9xD
 sbhPETbucNP6cms0eUOP26Q4XSkdPUIjRkSEg0LD07HP96gLJZj0vt7xhyDfCjNIKs9csNLr1Z4
 jDt1vsSNiEkYcpO6a0P1J5v2WZ9NKvni//MkqxffGAfgcE6uZ9m0kryJr74riae6GlNwQMlvtlB
 6A6uD0dV7qxm9w1tbaOL3u5DsXZbBhd/WW5ObJ+u8y1ngDwfj9KXrwXvcXf9wRR9sVFOKkMBlGW
 Li08A2TARRTFCkhQk9njt77AewtJpuNLQwb1s0uXNBOOGY9YqqYSUlKOg+AABNr6tXngMJDA1Y+
 YWxsuruNTMzH1fA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Integrate python docs with sphinx using autodoc and the import mock
feature which allows us to avoid having to build the C extension.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 docs/Makefile.am              | 13 ++++++++++++-
 docs/bindings.rst             |  1 +
 docs/conf.py                  |  6 +++++-
 docs/python_api.rst           | 33 +++++++++++++++++++++++++++++++++
 docs/python_chip.rst          | 12 ++++++++++++
 docs/python_chip_info.rst     | 12 ++++++++++++
 docs/python_edge_event.rst    | 12 ++++++++++++
 docs/python_exceptions.rst    | 17 +++++++++++++++++
 docs/python_info_event.rst    | 12 ++++++++++++
 docs/python_line.rst          | 27 +++++++++++++++++++++++++++
 docs/python_line_info.rst     | 12 ++++++++++++
 docs/python_line_request.rst  | 13 +++++++++++++
 docs/python_line_settings.rst | 12 ++++++++++++
 docs/python_misc.rst          | 13 +++++++++++++
 14 files changed, 193 insertions(+), 2 deletions(-)

diff --git a/docs/Makefile.am b/docs/Makefile.am
index 0b0618b..0cfa4d5 100644
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
 	pushd ..; sphinx-build ./docs/ ./docs/sphinx-output; popd
diff --git a/docs/bindings.rst b/docs/bindings.rst
index 069fc8f..ed7ec69 100644
--- a/docs/bindings.rst
+++ b/docs/bindings.rst
@@ -18,3 +18,4 @@ C library.
    :caption: Contents
 
    cpp_api
+   python_api
diff --git a/docs/conf.py b/docs/conf.py
index 04c8c3b..cbe1691 100644
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
index 0000000..9a58d47
--- /dev/null
+++ b/docs/python_line_request.rst
@@ -0,0 +1,13 @@
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
+   :class-doc-from: both
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


