Return-Path: <linux-gpio+bounces-10117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B049792FB
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 20:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF99D1F212F6
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 18:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10FB1D0DF5;
	Sat, 14 Sep 2024 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZgV4YYj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185461CEEA4
	for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 18:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726338826; cv=none; b=ZkqT2w5gqwfj88qPaDSjuVPwKZPWUDG5cX54L5nibSeCuPjvraeYG14nwYyeaYU6X+jhA3oucR8rtwn/SBFhh6P0NCdpXk2LvZcNApbfrdfa7aB7BmCNcmOggl3c9WOJgR4NQEtZ2ngGXXH/jjykjSnYP3TrABYHkj75IF0sdi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726338826; c=relaxed/simple;
	bh=ns4ulHEZwFMoRHoqEe+J5CPRWCYI4yLNsLQIs4J3NFY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kMw3bu3ID0hvvOsQPLV5yRicSwqM+YPAA6gOMO0AooxCYJ1CfSR5+FpUVeRQbo//OQofhcSrf0tuAnnDMcY5LB0qL+98hVvKxu5K7Ogzkjttbbv6WkGqkOLsDXqA8bP2w3jljNBuAxIuBT+02WxHvVlT7dOs4RcYYUk0Woy9JpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZgV4YYj; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-45830ff5b70so27210251cf.1
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 11:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726338823; x=1726943623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMtP4VKu/7cwu01a/fMcQ2j+ZvVKdiMfiho0j2DoiOU=;
        b=VZgV4YYjeq1GPRNeVWy+gh+rgIuH6DOQel1UEuqzomrb1M4SAIrlw196HCeESMkIQR
         KCSzGamn/1we6mrVwytSCbU5Y26MsitAVciaEDB2S54fojJBfFwtst0aufUYfSkWmmac
         YPK/hIWzwDP5juQlHJg2qw+fCu8Qdi7nUCxulTFQLMt5mVZubT5VTXqx4xFfVxAJibBf
         hOt2TjY0kb9nIEArh6xg6fvzHMPhbExvdbT0rdmIo3do/9N+eTqMqzoksjTygejriztU
         0MgIP4NiSuoN8/7m1gfq5wfKBJa9syeI7QsSxuR6q4RgXs9MCaSvdbH0gSkFxiVZ5Sv/
         4Azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726338823; x=1726943623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMtP4VKu/7cwu01a/fMcQ2j+ZvVKdiMfiho0j2DoiOU=;
        b=rNpeZCNnL2MmWgRBkBfpaX7TRNvgxacCHVlMIXd5iJLe6JumPZRcQfYUpe3ihH6rcA
         wN250bICUKYvjlAiKIH3XQ7wwPmifRa9zSkoBbGTDUkxqpq9kAUlFJQggwptJHLGRL8C
         4ya4fqgVuMLum5UuKtl7BLhmIYy0yqoegwfbs8kLDn3XavvE+53lzOWI/yLl9ramixQ5
         YGXbSnOpFHU1IH6xVHuqpLfr4l12lbN+KsfF3InrVuqAFGuWcGrsrg61sjgmpwDFfeLK
         +ZU9DLKSjDngUdgBvWt9Dh9jjpvJ/94DajBM1fO3NNLwi4DwnrOpimxcEdEf5fQRntGJ
         8zJg==
X-Gm-Message-State: AOJu0Yza9lSc1FqKGLEra5NsxEyKGpJb0yRXRrH2WcTXLVOfRMwl+aUD
	UC1+PQUDOAiTs08/+/zUZpuoLN3u7uWro3DsPbz8h41oz6OcKa4TXdEytQ==
X-Google-Smtp-Source: AGHT+IGiZTCakhG7IYq0nOq6/SwW1xKIJcij7dGzAL8y3TzypM4ihCe8Lqb0DdJyC0eUmwYXg1wEDA==
X-Received: by 2002:a05:6214:2f02:b0:6c5:51ed:2dbc with SMTP id 6a1803df08f44-6c57358430amr150481026d6.45.1726338823058;
        Sat, 14 Sep 2024 11:33:43 -0700 (PDT)
Received: from localhost.localdomain (syn-131-093-209-211.res.spectrum.com. [131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c6261e8sm9280216d6.27.2024.09.14.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 11:33:42 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: add py.typed marker
Date: Sat, 14 Sep 2024 13:33:02 -0500
Message-Id: <20240914183302.15768-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per PEP 561 [0], the marker is used by type checkers like mypy
to recognize that the library is typed.

[0]: https://peps.python.org/pep-0561/#packaging-type-information

Closes: https://github.com/brgl/libgpiod/issues/94
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/py.typed | 0
 bindings/python/setup.py       | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 bindings/python/gpiod/py.typed

diff --git a/bindings/python/gpiod/py.typed b/bindings/python/gpiod/py.typed
new file mode 100644
index 0000000..e69de29
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 9607a28..1f04b99 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -224,6 +224,7 @@ setup(
     name="gpiod",
     url="https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git",
     packages=find_packages(exclude=["tests", "tests.*"]),
+    package_data={"gpiod": ["py.typed"]},
     python_requires=">=3.9.0",
     ext_modules=[gpiod_ext],
     cmdclass={"build_ext": build_ext, "sdist": sdist},
-- 
2.34.1


