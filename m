Return-Path: <linux-gpio+bounces-25711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1894EB47BD3
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 16:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDE9517F1AC
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 14:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7940027281E;
	Sun,  7 Sep 2025 14:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkzWZh5B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE245C8E6
	for <linux-gpio@vger.kernel.org>; Sun,  7 Sep 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757255372; cv=none; b=LroGQpefY0j8RauuAPEwhTIN8n2a+sPkdzQdpxpGUSgtqYw3y/PvZLVUG9lgKoh1M9Rp+WThYPIPnGxkQjOcV0YGJbm+Yc9NCIDO5nkNsH7p6buZ1D7HMH35Fm54JWmTB/9ygpn/CAsR77+3wL7jhytCJ3YivxlH4sWc06pPHzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757255372; c=relaxed/simple;
	bh=B25cMzDyc3i1a1UNgJWJ9t/A8WuYCLugJhdIkH7FYaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSJSUrZO/Y+bAb+ltN1f5U8FKv0rpv5bmexJ5qzgs5m7zjrsYag9l1l3HXzOjVMn4BsIFAqiv3amu4VS9pyBjmFDf9CLYXFx9FHLelbHjhccLccKIn+M61cJZSslMC/EANJmTFdHqQ9PVUi55IPQdkDvSETz29xtCLEYP23BUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkzWZh5B; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3f662d4790dso22201185ab.1
        for <linux-gpio@vger.kernel.org>; Sun, 07 Sep 2025 07:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757255370; x=1757860170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWyBYhFxuJ5SzNcSLfUGfrvgrIQTk5EYx/R2Blhb6O8=;
        b=gkzWZh5Bi30VhH+cbUSbTSAiRjjT7GxqplHDbXx2q2BkahwrkgqXGBYF6qZItpgAko
         M1Y5UZMtqifgHyYDV58nPEd6EwJO3k7G7Z1uGV+SpbhCRGTTgvfncVrcOEhJ15p56N6R
         ZQdTHIYV2iyE/owfHdr+gVneL962d2r+4stIS7Ch0jlBZTOwE6+9dUUupjyF4kppvITL
         ylKrGhwjOFtHmcdmEjQIbWSYRoXUAVMiNXT+nTbyFSLuuxUzg2shhPXqoEE2+ZBa0GLD
         UsUuuoY2H9hu4TYgE+y9kVQkDASPlp7oiXUztey6qSd654nYr8lAkhto0L18e8ieJ62e
         nzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757255370; x=1757860170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWyBYhFxuJ5SzNcSLfUGfrvgrIQTk5EYx/R2Blhb6O8=;
        b=xSwbX3IcOkoiYPylz4GMWmq94xb96zxWFQtkLijVz7Ssy68yYRz2OP+A0G3BB12fVR
         u21akgYDkS9gX/YVx9QeD+T/Hbktbi2pbeZa3+8BK00mF64mIDlMr74JJ2YuV6dXn7xG
         oF9ka5Ks097WcP6IBssQJ9/NgOHl32IVcaSRSgOJpiAJangYJJfb8tIFuzqTCXILJ2ba
         qoC9POnoC/tCzLcRiN/Z19N/sHJA2lpL09bZUamNKQQE4EmohiKXynTFfwQZ40wLmAmv
         zntBRkOVZ0lqYNnKLCBsbN+AS/Y4N4YZ4A2usAT6CytMje3cNwlU1y1trurEQfM8K52b
         aazw==
X-Gm-Message-State: AOJu0Yx7VqlsnbSQnG88jmiAZYq5nVZQF8+HrLP+DfBt3RTvJMiiHVO7
	4ohoOOk/UySDQ9iFSnVsIzOYQU8S9QuB380VVkRyXyjoWWDaZ+kXYDvcUp70ig==
X-Gm-Gg: ASbGncupBRTfGpnpGfxMdNZLixzF7JnDzLCZdHdAL92BhzV4E71Slf5E2UYj72VsxwS
	rb2ZyqHmkROBy/Z5nqw1ZqddDR0WECevYTixDMa5wt0MMuUWGc6pqniInNAP8mqFQlQW+jhAAt9
	KMFEjP/zTGxoIbEQnqiyDFJBjZMoDpVseugj+zlVLJ2Q6PM+ahBqymAJSB7/iWyoNfjHAIoCII0
	hU77WjgArQNsJm0XDn7q9XKIISNvFjNn4Cnc+rC5vVPx4reE4KqLXCilgD6vhbmtxIAfwXydSQd
	gK+Z7bVBzrFnabd3p5WzJscgmA8aIGAJLLucFikD0eQq0D6lwpH4rEhk3s3ro90sXcp3ZwtQEoe
	538ZEUzb8jk4vg2vBryb1OnaguaSwkk+zpimIw5pET5+MivzFRl6sc48zA7WNijp2YYMYL+L4
X-Google-Smtp-Source: AGHT+IE7L4sT2l5ou/K0l00scxQNKIcaFyn3BpqJNT2c+UdE8XzGtj4IKvvP3qmeqlmQjT2criuymA==
X-Received: by 2002:a05:6e02:3c06:b0:3f0:a48b:151b with SMTP id e9e14a558f8ab-3fd8a398275mr74148305ab.31.1757255369668;
        Sun, 07 Sep 2025 07:29:29 -0700 (PDT)
Received: from Zephyrus.localdomain ([162.248.234.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f0d56d2sm7872237173.30.2025.09.07.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 07:29:29 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@xes-inc.com>,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: disable UP045 linter check
Date: Sun,  7 Sep 2025 09:29:19 -0500
Message-ID: <20250907142919.1382670-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linter check UP045 [0] was recently stabilized in ruff 0.12 [1].

UP045 suggests using the `X | Y` syntax for files that perform:

  from __future__ import annotations

This import drives the Python interpreter to store type annotations as
strings and defers their evaluation [2] making the new syntax "safe".

See also [3] for a brief history.

For now, disable the UP045 linter warnings like we do UP007 [4] for the
sake of consistency within the bindings so there is no mixed usage of
`Union[X, Y]` and `Optional[X]` vs `X | Y` until the bindings minimally
target Python 3.10 and can move to the latter syntax.

[0]: https://docs.astral.sh/ruff/rules/non-pep604-annotation-optional/
[1]: https://github.com/astral-sh/ruff/commit/de4fc5b171d8b4a9dfd44ef9b551f1257661ab60
[2]: https://peps.python.org/pep-0563/#implementation
[3]: https://peps.python.org/pep-0649/#a-history-of-annotations
[4]: https://docs.astral.sh/ruff/rules/non-pep604-annotation-union/

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/pyproject.toml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index f0f8c29..3217412 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -73,6 +73,7 @@ ignore=[
   "E501",
   # Ignore new Union (|) syntax until we require 3.10+
   "UP007",
+  "UP045",
 ]
 
 [tool.ruff.lint.per-file-ignores]
-- 
2.43.0


