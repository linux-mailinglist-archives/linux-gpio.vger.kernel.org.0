Return-Path: <linux-gpio+bounces-13158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A8C9D3C74
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 14:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 448C6281BE1
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 13:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122C81A264A;
	Wed, 20 Nov 2024 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SEtYZLNB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B1B1991AA
	for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732108722; cv=none; b=itDQAGFPeLDY+pcWWVk+5ss41Pg3sO4Hq4IoKqn3CzUcJZcSwk9ZC5XTt+8ANRjdsqq0EJbVHQZ8jX96AJRghsV0oFw7szk6T8lCwQOiHh4quKPjrtZLZHX/SvNckBQ4cWX2VEsOGHouaXbMiCPuldjNc+YFLpsjjNT0V/pxRBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732108722; c=relaxed/simple;
	bh=E/nnVzt97xxowtI745H62T4OdsLZNmp/xjekMeq/M/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ck5LmD1AeFVMGqIKj07YUAzNRIbm3IzXUTyCW0A57KqSC6IPchyNusI+4U25K7k0n2NY4gofsPC0qlWr9hx/7u8CWeD66UTBOIUZYoM+f5DIukOV9lQwGOYReKbMCexi397It0z/C9A2oaQLaUhJ+f7Y46qZIaFbh/E2oa1xZiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SEtYZLNB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4314f38d274so58669985e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 05:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732108719; x=1732713519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UM4gel+q9ak/o056gbZe8wG98dXFQKUi0fe1Vz3q+Wo=;
        b=SEtYZLNBQNPwl3CPumfDgcdGdz6xuGrjseYhP0L/v2OmiGKBNNlZ/p5ARugprcLyPv
         maGK3Guw1e6h8JJw9urrXgFiZHYSj2NffSUVAOtGMPaJVuQN2xeRNyL/xDYd9KykH1nH
         cq4K1cyrwPBSrUQ0caLQlCFImKPt5XITZHAUYW8OC0/5QpryTTm4EPOEeuYA7PdlcU7O
         U77q8Z9jH56Sa1ZFbXMbWeeppUCL0Gu32K4B72xJirh3Im1PBfONKGrVcTzohFUIJmJ6
         a6N+YmXhDYXN9VOuqsQLTM6zLPygmHicsvF3G9VpjxMBIepkpsSQfYvVacUpdewUVGM1
         VRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732108719; x=1732713519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UM4gel+q9ak/o056gbZe8wG98dXFQKUi0fe1Vz3q+Wo=;
        b=eNO7SFG4UMG2nHIihwm6HvjsiN5E+ZvJP5q8baFIoUZmT3pNevEa/LIbVubw+/gXZf
         4V9KQ8jZ4v1HDFH1b5weHhmKkwrvwS+2q9WnfYOZ1ZqOEpWAMJOPEMDvN9j9VEYGyIVH
         SAe3IDJeoTLr/MpPOSO+fbR28CltzbIFjg4RXjv9r7gxJbmOlpp7NgW+TJEJouyPUj4y
         h8I4e3H3uo6rvlH7S4Cz/NA3ENiquj2r2Far/C4/PSs6FnMCC+FSNPNAn9/adYY9FYU4
         z3OUTd+0V7Id3lexrQ9oH0WRhA0k28rjPufFlUN+xkcwjjWGXkIMAU9hBWpVPaCCDDnT
         t09Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGdfj1IKNSFYrUbspx1e7spoWIGbIYMR7/gnA7kn89ot3jQjzQTuVc2+WfmZUuPG0XV0tj9VR1JXpF@vger.kernel.org
X-Gm-Message-State: AOJu0YwqEA5EwKFhTcY2WdpX26v586STn/taQI9yTQyjdTnGnucQb4dM
	HCRUpP5jlwLMHRQF867kWpRxPqRJfn2BV1K0GzMg7yaI/mQBo8oSVpuJTQ++Kn8=
X-Google-Smtp-Source: AGHT+IHzSkGuq2LYX24LW5NW9FRYDTauOmJCv25CkmeQwzFVID5NUWzCY2zlo5nKolLJ3LTYm5z+PA==
X-Received: by 2002:a05:600c:1d0b:b0:431:6083:cd30 with SMTP id 5b1f17b1804b1-43348981999mr27451375e9.6.1732108718891;
        Wed, 20 Nov 2024 05:18:38 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e93c:902f:82f5:7ce8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493ee48sm2040188f8f.98.2024.11.20.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:18:38 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] bindings: python: drop dependency on distutils
Date: Wed, 20 Nov 2024 14:18:17 +0100
Message-Id: <20241120-drop-distutils-v1-0-7498e8b3babe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnhPWcC/x3MQQqAIBBA0avIrBMca9VVooXoWAOh4lgE0d2Tl
 m/x/wNClUlgVg9Uulg4pw4cFPjdpY00h26wxk6I1uhQc9GBpZ2ND9Eu+ujQ2cnjCD0qlSLf/3B
 Z3/cDuq0Z62AAAAA=
To: Vincent Fazio <vfazio@xes-inc.com>, Phil Howard <phil@gadgetoid.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=E/nnVzt97xxowtI745H62T4OdsLZNmp/xjekMeq/M/k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnPeGnCaePiMnusr7T9gRs7S8NLKavfmr9RJQLL
 XNvW/wdD6eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZz3hpwAKCRARpy6gFHHX
 coKiD/9q7AeAkhvdqcwxqLAPJiyz1pEQIEEn3UC0/2ymZ24j/4qDzfKewiCXCtoomlDbnR8Lduo
 FLCMisOAdLbeS8L/zBfnmCNvb4d/TxZCsJNefr052on7I9L1/CmIs11tmDngOO7ReJdsLzSZ3ka
 w7UUwV1+U4ITQU+ChjuP/ctAmNb/HL6bP5zXOmvzw8bbcM18EVmbLgfdXscxUP57Iw6h0OY8PHf
 Xpmb+zaKfq/b8d7oK4MY01BwVWLFqGjQYg4yI5k1zNu3kfZJ+DBV0LHDulXKgo9Si0Ngll7yoEj
 OeKFFHI6lOqnBEr15s+rwXe6Hv1DbM2LGC8RouJ+7+ysrw4W6Vg7T0t4+8GHDUtCWbgXbaps5zd
 bZw6iVqjW3VMoUqk8+nDMIUrYHPd6Zhb8Pg51PNIzuHd2epUI+KNNSJx4wPcaV6yHt3CowcGdi+
 WHjOeAFz0GTzklYWD1sLQ7a7xk5RTgrN9whpJ7uBNEXxMnq+NrjZI5U8PxUgQQWjZptXgcAmDKU
 3fVLXEapQgu1AmkLLbIBxgP2hVRtn4sQQLkJNmHGSoCZFgD/+GBABCzcxJxoXyfrFza22vzz4J9
 HInW0Kv2m6f4TtAejYBq1J28VxjtglqzGDExrlfkEjf89xymEHugwWC5VLUyz2SR7IFLbbiqyKp
 91HbW8R+t3sqICQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Python tests depend on the distutils package which not only is an
external dependency but is also deprecated. This series replaces it with
version parsing implemented in the C extension.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      bindings: python: add .pyi files to EXTRA_DIST
      bindings: python: tests: rename procname to system
      bindings: python: tests: provide and use system.check_kernel_version()

 bindings/python/MANIFEST.in                        |  2 +-
 bindings/python/build_tests.py                     | 10 +--
 bindings/python/gpiod/Makefile.am                  |  1 +
 bindings/python/tests/Makefile.am                  |  2 +-
 bindings/python/tests/__init__.py                  | 11 ++-
 bindings/python/tests/__main__.py                  |  4 +-
 bindings/python/tests/gpiosim/Makefile.am          |  1 +
 bindings/python/tests/procname/ext.c               | 42 ------------
 .../python/tests/{procname => system}/Makefile.am  |  1 +
 .../python/tests/{procname => system}/__init__.py  |  4 +-
 .../python/tests/{procname => system}/_ext.pyi     |  1 +
 bindings/python/tests/system/ext.c                 | 79 ++++++++++++++++++++++
 configure.ac                                       |  2 +-
 13 files changed, 100 insertions(+), 60 deletions(-)
---
base-commit: 0505dc36435b6d87523f530192d6025fc94222f3
change-id: 20241120-drop-distutils-afcfa1a24c13

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


