Return-Path: <linux-gpio+bounces-10527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA7988AAE
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 21:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E39E11F22A40
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 19:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C291C231F;
	Fri, 27 Sep 2024 19:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="lfhIos98"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D7A16FF3B
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463907; cv=none; b=hbtDHGWv/Pphsw30jVPtiHLveMYvyFpAxtvy34cBR8ljQdREzjeUUNBz+AIsSNJNIZKbWraixexWcEKkcD4fZ+zUBXy/DBAUB8Nqqq460zysPrGiMe+qvaHxh32+FEZLiBKkSfiUCpSUuhH/GuFEqz/Jv6x7GwKouf7Jad+GqVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463907; c=relaxed/simple;
	bh=JXPn9O72WfVZf0JhbgF+k4m+M72LFiovl+va1/2nz2A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VOKM5J/HtM0HtfAoy4Um17jA1tDG7dilBEM7HcZxFDyaNi1EPUCXe+W9pHfPTdujWOcqO4Ta2/kWdG2I9etzzvptx5T+XkZuX6NNchC2dmJLcMC8jsf21xv4cwXI8Cl5uoXnVnPei/bdNnRwqD/Xo2exvjA+N8+SV7L9FbDd8dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=lfhIos98; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id B3072201F8;
	Fri, 27 Sep 2024 13:55:15 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463315; bh=JXPn9O72WfVZf0JhbgF+k4m+M72LFiovl+va1/2nz2A=;
	h=From:To:Cc:Subject:Date:From;
	b=lfhIos98i9GhNtbr7CJbeKoT/5EQJwqPH9PG+d27vmKXg89PBp8zrVYHws3QkStad
	 FXNSdpVpwo7VGby7XMnHuGDHUhskODnXsS7r82FlEoMQZZrQidPAGNNmq+VuPlT5ZT
	 lB5SwqbqoFEwmeC7Sme3Fgvcqlb017xslcHXhRw8=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 00/22] bindings: python: conform to mypy and ruff linter recommendations
Date: Fri, 27 Sep 2024 13:53:36 -0500
Message-Id: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20240923-vfazio-mypy-2037e7d5bdd6
Content-Transfer-Encoding: 8bit

This patch series employs mypy [0] and ruff [1] to ensure the gpiod
library has correctly typed public interfaces, is performing proper type
checking internally, is consistently formatted in a standard code style
that targets Python 3.9 syntax, and passes a subset of linting checks.

Patches 1 and 2 remove unused imports, sort the remainder, and ensure
the publicly usable classes are available from the gpiod base module.

Patches 3 and 4 fix and add annotations to the gpiod bindings.

Patches 5-13 fix type and lint errors internal to the bindings.

Patch 14 fixes a duplicate test name identified by the linter.

Patch 15 and 16 remove unused imports, sort the remainder, and fix lint
errors related to a shadowed export.

Patches 17 and 18 fix and add annotations to the test gpiod bindings.

Patches 19-21 fix type and lint errors internal to the tests.

Patch 22 adds mypy and ruff configuration to pyproject.toml and adds
documentation to the readme so future patches can be evaluated against a
standard set of rules.

There should be no functional changes that impact existing code as part
of this series.

All unit tests continue to pass without changes and code coverage has
not changed.

After this series is applied, the public type annotations will reflect
the argument expectations of the class methods so consumers can type
check their code against the gpiod type annotations.

[0]: https://mypy.readthedocs.io/en/stable/ 
[1]: https://docs.astral.sh/ruff/ 

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
Vincent Fazio (22):
      bindings: python: clean up imports and exports
      bindings: python: make internal a private submodule
      bindings: python: fix annotation of variable length tuples
      bindings: python: add missing method type annotations
      bindings: python: add type stubs for _ext
      bindings: python: annotate internal members of Chip
      bindings: python: fix Chip union-attr type errors
      bindings: python: annotate internal members of LineRequest
      bindings: python: fix LineRequest union-attr type errors
      bindings: python: convert lines to offsets in LineRequest
      bindings: python: cast return value of LineRequest.get_values
      bindings: python: raise exception type, not exception instance
      bindings: python: selectively use f-strings
      bindings: python: tests: fix duplicate test name
      bindings: python: tests: clean up imports and exports
      bindings: python: tests: make EventType private to prevent export
      bindings: python: tests: add type stubs for external modules
      bindings: python: tests: add missing type annotations
      bindings: python: tests: ignore purposeful type errors
      bindings: python: tests: annotate internal members
      bindings: python: tests: use f-strings
      bindings: python: configure and document dev dependencies

 bindings/python/README.md                          |  17 ++
 bindings/python/gpiod/__init__.py                  |  83 ++++++--
 bindings/python/gpiod/_ext.pyi                     |  93 +++++++++
 .../python/gpiod/{internal.py => _internal.py}     |   3 +-
 bindings/python/gpiod/chip.py                      |  56 ++++--
 bindings/python/gpiod/chip_info.py                 |   6 +-
 bindings/python/gpiod/edge_event.py                |   9 +-
 bindings/python/gpiod/exception.py                 |   4 +-
 bindings/python/gpiod/info_event.py                |  11 +-
 bindings/python/gpiod/line.py                      |   5 +-
 bindings/python/gpiod/line_info.py                 |  10 +-
 bindings/python/gpiod/line_request.py              |  80 +++++---
 bindings/python/gpiod/line_settings.py             |  15 +-
 bindings/python/pyproject.toml                     |  36 ++++
 bindings/python/setup.py                           |   2 +-
 bindings/python/tests/__init__.py                  |   6 +-
 bindings/python/tests/__main__.py                  |   5 +-
 bindings/python/tests/gpiosim/__init__.py          |   2 +
 bindings/python/tests/gpiosim/_ext.pyi             |  21 +++
 bindings/python/tests/gpiosim/chip.py              |   3 +-
 bindings/python/tests/helpers.py                   |   6 +-
 bindings/python/tests/procname/__init__.py         |   2 +
 bindings/python/tests/procname/_ext.pyi            |   1 +
 bindings/python/tests/tests_chip.py                | 105 ++++++-----
 bindings/python/tests/tests_chip_info.py           |  38 ++--
 bindings/python/tests/tests_edge_event.py          |  66 ++++---
 bindings/python/tests/tests_info_event.py          | 100 ++++++----
 bindings/python/tests/tests_line.py                |   5 +-
 bindings/python/tests/tests_line_info.py           |  49 +++--
 bindings/python/tests/tests_line_request.py        | 210 ++++++++++-----------
 bindings/python/tests/tests_line_settings.py       |  19 +-
 bindings/python/tests/tests_module.py              |  37 ++--
 32 files changed, 710 insertions(+), 395 deletions(-)
---
base-commit: f6c8c3321d8f30979fa593a4f6546ff3dccd2549
change-id: 20240923-vfazio-mypy-2037e7d5bdd6

Best regards,
-- 
Vincent Fazio <vfazio@xes-inc.com>

