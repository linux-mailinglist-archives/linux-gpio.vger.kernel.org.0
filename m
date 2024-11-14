Return-Path: <linux-gpio+bounces-13026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FEB9C8D4A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C001C281D88
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E92F7DA66;
	Thu, 14 Nov 2024 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="tHgznKxK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1705336E
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595896; cv=none; b=LLCNTf7OJpH/lLldtGCqtjFqsP9YoFA2mIXyGifYtEYVWhqJZDIGvAK4hw7QBi5YbjRGyd5vDOvdn2bXB4wBLUj2QnH2bP2ObsC3Ygb8bCrhLi2eq8U/lL7wDoh9S5lrXHWA8K/H+g1OdBs0rqjYn0MIk0j/1WTrWTlThQs+Qs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595896; c=relaxed/simple;
	bh=3buoQxfsBeu/2LtnS6PhbYb3vk35HwEBDXbocvanbXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BDhkUCk9jnXbDOfrNSjXhewJ1FEt45LV/9nujOSPiKXW8aS7ROq+nCeUiKbJy/PFAnjx4lCYV6lqZuc0RWVPPunIjL/0gg4d5HfU4G7pvoezJGxBJP0MMsvNwk1bS5x3LbI6V2iEgoydU29w+QWGoppn1mjZX6BThrdfkbqRlGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=tHgznKxK; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 2628E20AC0;
	Thu, 14 Nov 2024 08:51:24 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595884; bh=3buoQxfsBeu/2LtnS6PhbYb3vk35HwEBDXbocvanbXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tHgznKxKKpTMJUtLE+JhLw2lb55Aa+SurYKeRHG2cZxdtf4JQQ3OH3MwyMBZ2jhZi
	 I/Orz30JG4Cd7rcniZ9qnIKMpUFQABKFzbYist8ZRTj5D+/0iYTWJUeU3oW/M0Mjir
	 hvA3XkCY9qPKPh2Cc3NFwfxSkzjQHCWLom4fUbr8=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 23/23] bindings: python: configure and document dev dependencies
Date: Thu, 14 Nov 2024 08:51:16 -0600
Message-Id: <20241114145116.2123714-24-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114145116.2123714-1-vfazio@xes-inc.com>
References: <20241114145116.2123714-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mypy [0] is a popular static type checker that validates attribute and
variable use and ensures function arguments adhere to type annotations.

Ruff [1] is a popular Rust-based Python linter and code formatter. It
has support for a large set of linting rules [2] and largely complies
with the Black format [3].

Add documentation to README.md for how to run the tools.

[0]: https://mypy.readthedocs.io/en/stable/
[1]: https://docs.astral.sh/ruff/
[2]: https://docs.astral.sh/ruff/rules/
[3]: https://docs.astral.sh/ruff/formatter/#black-compatibility
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/README.md      | 17 ++++++++++++++++
 bindings/python/pyproject.toml | 36 ++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/bindings/python/README.md b/bindings/python/README.md
index cb5cee6..89c824c 100644
--- a/bindings/python/README.md
+++ b/bindings/python/README.md
@@ -112,3 +112,20 @@ make python-tests-run
 
 from the `libgpiod/bindings/python` directory as root (necessary to be able
 to create the **gpio-sims** used for testing).
+
+## Linting/Formatting
+
+When making changes, ensure type checks and linting still pass:
+
+```
+python3 -m venv venv
+. venv/bin/activate
+pip install mypy ruff
+mypy; ruff format; ruff check
+```
+
+Ideally the gpiod library will continue to pass strict checks:
+
+```
+mypy --strict
+```
\ No newline at end of file
diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index f6bf43c..d6f5f9b 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -3,3 +3,39 @@
 
 [build-system]
 requires = ["setuptools", "wheel", "packaging"]
+
+[tool.mypy]
+python_version = "3.9"
+files = [
+  "gpiod/",
+  "tests/",
+]
+
+[[tool.mypy.overrides]]
+module = "gpiod.line.*"
+strict_equality = false # Ignore Enum comparison-overlap: https://github.com/python/mypy/issues/17317
+
+[tool.ruff]
+target-version = "py39"
+include = [
+  "gpiod/**/*.py",
+  "gpiod/**/*.pyi",
+  "tests/**/*.py",
+  "tests/**/*.pyi",
+]
+
+[tool.ruff.lint]
+select = ["B", "E", "F", "I", "TCH", "UP"]
+ignore=[
+  # Ignore chained exception warnings for now: https://docs.astral.sh/ruff/rules/raise-without-from-inside-except/
+  "B904",
+  # Never enforce line length violations. Let the formatter handle it: https://docs.astral.sh/ruff/formatter/#conflicting-lint-rules
+  "E501",
+  # Ignore new Union (|) syntax until we require 3.10+
+  "UP007",
+]
+
+[tool.ruff.lint.per-file-ignores]
+"gpiod/__init__.py" = ["F403", "F405"]  # ignore warnings about star imports
+"tests/__main__.py" = ["F403"]
+"tests/**.py" = ["F841"]  # ignore warnings about unused variables
\ No newline at end of file
-- 
2.34.1


