Return-Path: <linux-gpio+bounces-13008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8069C8D3A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D52511F24458
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D0155887;
	Thu, 14 Nov 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="Kf+2mm9T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C64BA53
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595891; cv=none; b=kmE5RjUddwhiNecht4rub5VciaDELkBLj9UCdHhFfB0wZx9fWVrVxjPoSRqlCB8YmO+o2Fac3Y9CRAoqijOI934kInuWN00Bx9Og8SZ7zXu8JLanWHasUzI6uSVwV0eP3q2zbSUKBgM6lhlgNyKT4X+6/x1x4H2d48hvCtix1lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595891; c=relaxed/simple;
	bh=KWpAoiUkY287xIgWqyOmPKFAkjqL5BL2QtZSjkdhDCw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=INbw8Nx1rJ3dAM6nDS1npUx9NEGrd3Yu1Hhf4Cqj2E0iouW8BgLrNsE8ZUM4mam5DR8tv5H9u8zPyduM4NJrNyEjsJfjfA5pdr/v4N46DeqJ9BZ62iiS4GuMjmg9f0QVXnV/u8wnR9BvfUfg6OG8cesuFu5VnsZBiyjU9aXaK8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=Kf+2mm9T; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 310CF201EC;
	Thu, 14 Nov 2024 08:51:22 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595882; bh=KWpAoiUkY287xIgWqyOmPKFAkjqL5BL2QtZSjkdhDCw=;
	h=From:To:Cc:Subject:Date:From;
	b=Kf+2mm9TeHX/mAsk0JvEG/mjx2sYwcyWzxPCMUpjmhCzhr8op0dJ5jnv0IfvVv+IH
	 mMlfKPBlLTLFMOuL4pOJRAZK86d/KKU4rGjxD2vuEnxl8/84Uj6OeEhSjw/hy2YcWz
	 ieFm04EDbuI4ge2n89vi8HhruWjgvVYnzel8OZDk=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 00/23] bindings: python: conform to mypy and ruff linter recommendations
Date: Thu, 14 Nov 2024 08:50:53 -0600
Message-Id: <20241114145116.2123714-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series employs mypy [0] and ruff [1] to ensure the gpiod
library has correctly typed public interfaces, is performing proper type
checking internally, is consistently formatted in a standard code style
that targets Python 3.9 syntax, and passes a subset of linting checks.

Patches 1 and 2 remove unused imports, sort and guard the remainder, and
ensure the publicly usable classes are available from the gpiod module.

Patches 3-5 fix and add type hints to callable interfaces.

Patches 6-14 fix type and lint errors internal to the bindings.

Patch 15 fixes a duplicate test name identified by the linter.

Patch 16 and 17 remove unused imports, sort the remainder, and fix lint
errors related to a shadowed export.

Patches 18 and 19 fix and add type hints to callable interfaces within
the tests.

Patches 20-22 fix type and lint errors internal to the tests.

Patch 23 adds mypy and ruff configuration to pyproject.toml and adds
documentation to the readme so future patches can be evaluated against a
standard set of rules.

There should be no functional changes that impact existing code as part
of this series.

All unit tests continue to pass without changes and code coverage has
not changed.

After this series is applied, the public type annotations will reflect
the argument expectations of the class methods so consumers can type
check their code against the gpiod type annotations.

v2 changes (mostly feedback from Bartosz):
- Added/expanded commit messages
- Commit to raise exception classes has been dropped
- A few changes have been split to separate commits
- Line objects are no longer directly exported from the gpiod module
- A couple of public APIs now have loosened type requirements
- casting has been reworked for Chip and LineRequest classes
- additional strings are now f-strings
- imports used only for type checking are behind a type check guard
- tests: type hints have been reworked to be less noisy

[0]: https://mypy.readthedocs.io/en/stable/
[1]: https://docs.astral.sh/ruff/

Vincent Fazio (23):
  bindings: python: clean up imports and exports
  bindings: python: make internal a private submodule
  bindings: python: loosen type requirements in public API
  bindings: python: explicitly type gpiod.request_lines
  bindings: python: add type stub for the _ext module
  bindings: python: add missing method type hints
  bindings: python: add type hint for the sec variable in poll_fd
  bindings: python: add type hints for Chip's internal members
  bindings: python: fix Chip union-attr type errors
  bindings: python: add type hints for LineRequest's internal members
  bindings: python: fix LineRequest union-attr type errors
  bindings: python: convert lines to offsets in LineRequest
  bindings: python: cast return value of LineRequest.get_values
  bindings: python: selectively use f-strings
  bindings: python: tests: fix duplicate test name
  bindings: python: tests: clean up imports and exports
  bindings: python: tests: make EventType private to prevent export
  bindings: python: tests: add type stubs for external modules
  bindings: python: tests: add missing method type hints
  bindings: python: tests: add type hints to internal members
  bindings: python: tests: ignore purposeful type errors
  bindings: python: tests: selectively use f-strings
  bindings: python: configure and document dev dependencies

 bindings/python/README.md                     |  17 ++
 bindings/python/gpiod/__init__.py             |  83 ++++++-
 bindings/python/gpiod/_ext.pyi                |  93 ++++++++
 .../gpiod/{internal.py => _internal.py}       |   3 +-
 bindings/python/gpiod/chip.py                 |  80 ++++---
 bindings/python/gpiod/chip_info.py            |   8 +-
 bindings/python/gpiod/edge_event.py           |   9 +-
 bindings/python/gpiod/exception.py            |   4 +-
 bindings/python/gpiod/info_event.py           |  13 +-
 bindings/python/gpiod/line.py                 |   5 +-
 bindings/python/gpiod/line_info.py            |  10 +-
 bindings/python/gpiod/line_request.py         |  90 ++++----
 bindings/python/gpiod/line_settings.py        |  15 +-
 bindings/python/pyproject.toml                |  36 +++
 bindings/python/setup.py                      |   2 +-
 bindings/python/tests/__init__.py             |   6 +-
 bindings/python/tests/__main__.py             |   5 +-
 bindings/python/tests/gpiosim/__init__.py     |   2 +
 bindings/python/tests/gpiosim/_ext.pyi        |  21 ++
 bindings/python/tests/gpiosim/chip.py         |   3 +-
 bindings/python/tests/helpers.py              |  17 +-
 bindings/python/tests/procname/__init__.py    |   2 +
 bindings/python/tests/procname/_ext.pyi       |   1 +
 bindings/python/tests/tests_chip.py           |  99 +++++----
 bindings/python/tests/tests_chip_info.py      |  31 +--
 bindings/python/tests/tests_edge_event.py     |  60 ++---
 bindings/python/tests/tests_info_event.py     |  81 +++----
 bindings/python/tests/tests_line.py           |   5 +-
 bindings/python/tests/tests_line_info.py      |  40 ++--
 bindings/python/tests/tests_line_request.py   | 210 +++++++++---------
 bindings/python/tests/tests_line_settings.py  |  19 +-
 bindings/python/tests/tests_module.py         |  37 ++-
 32 files changed, 691 insertions(+), 416 deletions(-)
 create mode 100644 bindings/python/gpiod/_ext.pyi
 rename bindings/python/gpiod/{internal.py => _internal.py} (90%)
 create mode 100644 bindings/python/tests/gpiosim/_ext.pyi
 create mode 100644 bindings/python/tests/procname/_ext.pyi

-- 
2.34.1


