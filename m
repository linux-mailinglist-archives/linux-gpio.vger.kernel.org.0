Return-Path: <linux-gpio+bounces-13011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98A9C8D3D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB01B1F245F9
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC29770FE;
	Thu, 14 Nov 2024 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="AGr41wQL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D8043AD2
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595892; cv=none; b=XuoNl+8+5zle2O8oDEjKkZFowWAsu96ILv2rkffwub1BTGbm7KjbVhx3OTf7UvPT2wYHz5OLLbTGQIcCdDcUHX5UBxoWiKbssU9fL6ESN6fZq19dLdAGuqiO/cJTQqgHDSYSrJFEZypsltKtWVQ5WSclhAuXJIw5JFYEJisZ7WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595892; c=relaxed/simple;
	bh=sqhNYvgLB7YyrHjizzx0ecRfC/ySCTERpaJgq1E96/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sZIvyNCgm3z7BpFu0SYviiteJjXXCQFgDukGebyfEeoWhbuJ5s+YmywGkv/2vFpCFSeyh0mfpJQA5rprrkfPy7+JmzF2GrHs8J6Mc4rzZI8jwIdiVj5yYh0Zx0X7+7w36zUMfGEyO7hyFXyfuFHVMo9dcaTwf7dBefL6pj0C2FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=AGr41wQL; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 5AD84207FB;
	Thu, 14 Nov 2024 08:51:22 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595882; bh=sqhNYvgLB7YyrHjizzx0ecRfC/ySCTERpaJgq1E96/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AGr41wQLJjHHknBC6rdYtWMCWM41WI8JQ/A1vXB5T3hVQh5ciepCNtEzIFbP2h611
	 b02+UzbfJdWI5ImbZ9R63YP/7llJZntPmXMi5AJUHrNYkR6rhGGdNZOnScWWagL+Tt
	 4ufyJmQENuv1WANCCGbJylnhv2/lMDTy9HuqMQi4=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 02/23] bindings: python: make internal a private submodule
Date: Thu, 14 Nov 2024 08:50:55 -0600
Message-Id: <20241114145116.2123714-3-vfazio@xes-inc.com>
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

The internal submodule shouldn't be exposed as part of the public
interface, so mark it private following PEP 8 convention [0].

[0]: https://peps.python.org/pep-0008/#public-and-internal-interfaces
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/{internal.py => _internal.py} | 0
 bindings/python/gpiod/chip.py                       | 2 +-
 bindings/python/gpiod/line_request.py               | 3 +--
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename bindings/python/gpiod/{internal.py => _internal.py} (100%)

diff --git a/bindings/python/gpiod/internal.py b/bindings/python/gpiod/_internal.py
similarity index 100%
rename from bindings/python/gpiod/internal.py
rename to bindings/python/gpiod/_internal.py
diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 29c30f5..175fcb0 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -6,8 +6,8 @@ from errno import ENOENT
 from typing import TYPE_CHECKING, Optional, Union
 
 from . import _ext
+from ._internal import poll_fd
 from .exception import ChipClosedError
-from .internal import poll_fd
 from .line import Value
 from .line_request import LineRequest
 from .line_settings import LineSettings, _line_settings_to_ext
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 292fa1b..a8e4a87 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -4,9 +4,8 @@
 from typing import TYPE_CHECKING, Optional, Union
 
 from . import _ext
-
+from ._internal import poll_fd
 from .exception import RequestReleasedError
-from .internal import poll_fd
 from .line_settings import LineSettings, _line_settings_to_ext
 
 if TYPE_CHECKING:
-- 
2.34.1


