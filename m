Return-Path: <linux-gpio+bounces-10519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFED988A98
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56FA0B23080
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881AD1C230A;
	Fri, 27 Sep 2024 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="Ifgaqoov"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327391C231D
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463329; cv=none; b=cUoH50Z/ujB2jsFwRrLJvInHt2l6BSQ82Mx9ESv/5iPRWNbfMluoSu5qFj1+EXirlGky5GNVXrVCtVEKyXkbwz2BxPY4YSlyELNK8FrjLyMzqXR8ViwQW/lDAVUqoUKWQR87XMA7ZEPCNzRNJOMPAkkakTptC6MWlFEAQEPkA3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463329; c=relaxed/simple;
	bh=2s1XXzAu+y3GpmL2X+rhC8xv91qAFJNg4lLzRhK2S+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SPzXebgG00iZ3kSx3SyyodZzZ2WoLXWCDU+80py3efHV6ZJp1clfS/8Nms8t1A1wWng7ZI9CoS6m6QWPr95expCwwq75Emb+T9/e7jeXrVGoDVkiG4+vFqHXAjsd1KZLWv0vJ+uDYCSZAgKwY+ETy9lrxSGmQhWuwVicEGYY+Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=Ifgaqoov; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id C447022AE2;
	Fri, 27 Sep 2024 13:55:17 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463317; bh=2s1XXzAu+y3GpmL2X+rhC8xv91qAFJNg4lLzRhK2S+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IfgaqoovD6oAD80qlAiYndqWWg9snIxhlhsfy0QSUajNJmd3dnGgF+KcCccJmJCRi
	 7By6WwYyRSJZEH/LH+pQ+oYp9yoScrRqgyhqKOeSH0vvuQvzAbfX6Mrx+qNFmbsssa
	 X0QK2kQU4ZzxneuEySitxy5Yq6Luwgtj0iiMPAnQ=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 22/22] bindings: python: configure and document dev dependencies
Date: Fri, 27 Sep 2024 13:53:58 -0500
Message-Id: <20240927-vfazio-mypy-v1-22-91a7c2e20884@xes-inc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Mypy [0] is a popular static type checker that validates attribute and
variable use and ensures function arguments adhere to type annotations.

Ruff [1] is a popular Rust-based Python linter and code formatter. It
has support for a large set of linting rules [2] and largely complies
with the Black format [3].

Add documentation to the README for how to run the tools.

[0]: https://mypy.readthedocs.io/en/stable/
[1]: https://docs.astral.sh/ruff/
[2]: https://docs.astral.sh/ruff/rules/
[3]: https://docs.astral.sh/ruff/formatter/#black-compatibility
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/README.md      | 17 +++++++++++++++++
 bindings/python/pyproject.toml | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/bindings/python/README.md b/bindings/python/README.md
index cb5cee62cc46980ce2484bc85d8686ffb8622e59..89c824cebbd735624159a5b30a8bbee2c55e896e 100644
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
index f6bf43c0a20edc76bfa51a98e7d523c8dadefea1..43e85a72daaea50c07a527d7b388ac9a4396a3d8 100644
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
+strict_equality = false # Ignore Enum comparison-overlap https://github.com/python/mypy/issues/17317
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
+select = ["B", "E", "F", "I", "UP"]
+ignore=[
+  # Ignore chained exception warnings for now: https://docs.astral.sh/ruff/rules/raise-without-from-inside-except/
+  "B904",
+  # Never enforce line length violations. Let the formatter handle it. https://docs.astral.sh/ruff/formatter/#conflicting-lint-rules
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

