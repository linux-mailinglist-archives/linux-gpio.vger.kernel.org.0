Return-Path: <linux-gpio+bounces-37600-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJzlBmJpF2rcEAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37600-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 00:00:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F975EA823
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 00:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EED1C30315DE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 21:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AE938F232;
	Wed, 27 May 2026 21:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTX5iZOV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18743644A1
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 21:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779919187; cv=none; b=HVdWuDNjhAJS2ykiAa9vIjKWMLSLg6RKbnDEh9Z9uA3qlmUcPe7EN1obS4a49crK5SFXPYcxz5gVJ73iwxcmHFdJrsghIbz61Jdr+Rjm8LUFej5IVX85aXg0FJqSbV42dYiC8W8vc37qI3/et+/VTVuQSiH2DlaeGb+quqSmfAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779919187; c=relaxed/simple;
	bh=aQ5XUMqj6HVnKrAwwnz2t8zG8D3FBMJz+KmZ2AyLOm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QpqfZp08JKn4U9Xy0UopgD8fjxlGcAcjcJ06Oy9Pequ4v1kIHDAKb/nddnQJXHZ4VJ4w/7iTZYKtftXS8SpdcDgt54U4OYWv59F4/H7NvmCwz2yQrO4HxEGt5Qfr2MMQSAspL5d7K/x5d3VLYuf68xXLyqI5W6xDUSYMsV4F0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTX5iZOV; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4855e69a5a4so3045440b6e.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 14:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779919184; x=1780523984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+TxSgSZ+WnSe1Q2URGGvhaTzchPtM1r3sSUEMFhk6VA=;
        b=GTX5iZOV3j4MhnjwRzAAekiKFgCP7Kd51F0faxgbmmoAt/bNwbUJ9yGSoAzFXoz4C8
         Ld7g6ba9OKZNyrwte799AMtvhusnMjGwGOPdu4vYQtjDbKQjfzlQ21a0QHaFGgnxaJVd
         BEuIVgVcD4TXAkGeywFMGYcfMbSOSwomjHNlHkBBXFK63+655Lz74KQLf0AE08raE1fe
         H4uelNzWogB9RqU82LZBUYa4P5mb/Yv1vqK9pSvlAVo6dkhGU4Zsq0Al9KkIBB3hOwMD
         TpCAA96Ja/UrHDwLw9D1VAwMIP1+s90Fw86cjlghpd9pVujiAyQWcMvY3Wk7g4Vk26CI
         Y/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779919184; x=1780523984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TxSgSZ+WnSe1Q2URGGvhaTzchPtM1r3sSUEMFhk6VA=;
        b=KFfWVTzaU5WDEGh8TSnaTdlnYRnlT1ur0IOqPbOHJ8zheaC2OGmGEnd/z3FPR3bQg/
         Q4RpYKWvf1nHn43GIIxW7nOQyFnjqycSbIYHw4jSwWEZS+c5LRfQTJjofWWiuIkW1vx4
         fqyEyn/UUUQrWuGx5BYU6uo5qDQVOzW9+OzOlsGVCs87GigWs7Zy/ccRZnWikqwp17T+
         sk5L7PNUbRLY43yrpOadK1QbHKsQrETQCQQuqa5U20bgT6nmEFvEtlb6UdeHy3vz4gqe
         uSlEGcI/AWH9f2RgHGZOsXoVqtpbZxbkC9lb43rtx2dx4lsK/+v4bt5P/7h4OMWX821m
         VKdg==
X-Gm-Message-State: AOJu0Yxyvu6VWmOiARkrXXeVRSvLC8hD0+SxefItteF0aQj9A0MtycPs
	QLsepJOpLAlHuqHT5xM74U4JaYYu5ZYsUTgGwTBkG7sUYFXcMPrAmcJknuSLTg==
X-Gm-Gg: Acq92OFJ77UxycrmabsOdTIs/74ttah/SxjZc3lgIUZzhUjN1XUKLWKOGWG7Fhnf619
	Q4s1VDQvxjPSnnzAlnY4xgb5qLVwQLKTm957mUpEuQ7rjaXuWtPUpRSzC+B/azlwZUzqa7XjOQB
	LYN3XeLEKSv+67GGCadGZhV8idr3URT1cX71Ck50NCJ8tEz5q2+g2DvrmbFkbaLoFiocFlIPjHm
	LcJnrooA4Yr64X020vs2jYJj/TrTtRaO9/i0tDJC1j2xnc/AW1Hs0wd21Ee5rX8EkQdIMW1Lk87
	PAbBjLVkwxTQPKxLlylHRPy4nC+NsHX4P3eCdfFMDJDs0Ps22BB3+gzrabJoAyWM3XMevJbmc1C
	aXV3cs3JxQP8lCOpoF2LP+ZcAVwDMsL+7Ut98P4lmdt8gkh7qlObRdLMi9iGmHbIKotY27zm/4M
	qntSEGP4lcuTS49EYwNlj+gpf0AqSJ/gaichoJ+2jzD0cKqNn+hTdthNg0SBsDcsMZkzzNQeq6
X-Received: by 2002:a05:6808:23c9:b0:47c:be57:7fb2 with SMTP id 5614622812f47-48549d79e7dmr18297384b6e.17.1779919184596;
        Wed, 27 May 2026 14:59:44 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6065e7cb6sm12803303a34.16.2026.05.27.14.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 14:59:44 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 0/3] bindings: python: add support for free-threaded Python
Date: Wed, 27 May 2026 16:59:19 -0500
Message-ID: <20260527215922.18678-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37600-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 87F975EA823
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This short series adds support for free-threaded Python and adds a new
test suite to provide some confidence in the suitability of the bindings
being used within a multi-threaded context.

A changelog is also added to keep track of changes between releases.

Note:
The new threaded test suite was run on multiple machines in excess of
1M+ iterations in an attempt to make sure they were bug free but due
to the nature of the problem, they may not be absolutely error free.

Signed-off-by: Vincent Fazio <vfazio@gmail.com
---
Changes in v2:
- add documentation around the shortDescription stub (Bart)
- add synchronization info to Python class docstrings (Bart)
- Link to v1: https://lore.kernel.org/all/20260522200419.105496-1-vfazio@gmail.com/
---
Vincent Fazio (3):
  bindings: python: tests: add multi-threaded tests
  bindings: python: support free-threaded CPython
  bindings: python: add a changelog

 bindings/python/CHANGELOG.md             |  44 ++
 bindings/python/MANIFEST.in              |   1 +
 bindings/python/README.md                |   8 +-
 bindings/python/gpiod/chip.py            |   3 +
 bindings/python/gpiod/chip_info.py       |   4 +-
 bindings/python/gpiod/edge_event.py      |   2 +
 bindings/python/gpiod/ext/module.c       |   5 +-
 bindings/python/gpiod/info_event.py      |   2 +
 bindings/python/gpiod/line_info.py       |   4 +-
 bindings/python/gpiod/line_request.py    |   3 +
 bindings/python/gpiod/line_settings.py   |   2 +
 bindings/python/pyproject.toml           |   3 +-
 bindings/python/tests/__main__.py        |   1 +
 bindings/python/tests/gpiosim/ext.c      |   3 +
 bindings/python/tests/helpers.py         |   5 +
 bindings/python/tests/meson.build        |   1 +
 bindings/python/tests/system/ext.c       |   3 +
 bindings/python/tests/tests_threading.py | 745 +++++++++++++++++++++++
 docs/python_api.rst                      |   6 +
 19 files changed, 840 insertions(+), 5 deletions(-)
 create mode 100644 bindings/python/CHANGELOG.md
 create mode 100644 bindings/python/tests/tests_threading.py

-- 
2.43.0


