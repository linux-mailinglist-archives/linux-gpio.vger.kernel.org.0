Return-Path: <linux-gpio+bounces-16387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1353A3F62C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 14:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC139188841A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 13:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC4F207A2E;
	Fri, 21 Feb 2025 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="lLZ83f2r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6E41EEE9
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 13:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740144917; cv=none; b=IOfkKaIOuFLtDIW7n+VtRI5S3fGRvGTWjD/fjA/B6vAB3r4vNOJvak8+GwWfP3B04Wco3gzXTA27AxnMCAQgO2AQDNDLlhw1Lbi2upC2JuBv5hlWisc7Yc2kBhW6u/K1wj0ywhZugKX1kC0y8pUUWf4BYNPw4Tr9cmKyL1dBvRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740144917; c=relaxed/simple;
	bh=JCwBGCIWQQYwvBo1RGFgynH2V74O4Vo5jpW5Ascsdwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XT22mFFRQ7NAg6Gole+mjsT4bFy+8figWB9ZKgfcDuX6Mpm+6yAHMMbskKWnozqh+auuhdEihslmsKX6G9p+oKE6OkZu7sK9/QekCQ61brMSkUk7uhGCG/B2i49wGAy/KqTPqTQhNLSiLrqknbAFubJZkHV9KzOZWQrq0L/mrLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=lLZ83f2r; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D0A6041231
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740144911;
	bh=4mV4RIbIjlD+y6YWR/tN/fQ+WDkZUX/byyo07QreGuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=lLZ83f2rIkkxGeJc6ujLF4y8yxOs3NPTiAKDEq2eanmXFmD78NuJS/z/64NPPTx72
	 CMKxjOUrXZc6kwLPrLbzW91bZDcJ9OYdW0envaE0d8+nG1T+IaYiG1oUlhvXAEwXeE
	 6Y7YkcwtVmAIFpbABBxtAGc9fBS8I1peqeLyTnBOGXXTt4P8DHoGFrOA/XRqePWQ7u
	 EaUw1HvJZeS11+sf6jJaFnFgI1X86AyXiYKg2Lesbrf6h1aJh+zt0M26c/Vnzk9127
	 qN21jVw/uxPe+Tgemr1p3K1g6aGYMtxOn8GYnukVP4Su9xvXa96sUlY7aSjQ20sP+7
	 G71GYGQb9Bi+A==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc261eca15so6431078a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 05:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740144910; x=1740749710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mV4RIbIjlD+y6YWR/tN/fQ+WDkZUX/byyo07QreGuM=;
        b=dU67EG7zQJ/CkaFxXcXXvlqNe7qogkuJ3fgQ5B/3exRp6fkANKJkxc7B+p4EFM5LjH
         Dy/ZodFPuV2q5KEHnrM7DRkQNks7K6Js6ndrRE0G2HNjXpFtsOPM4aehOlU6Tt66Mkwj
         XGQLRB6bsC9Teda2GhmqgZhPvT2cAiv4uNfoq9K5yIJJwJk1OlGnR+75RHY9eQeGHuYA
         G8upibHS/QWgrtfPxxZGKw5wZDOhSCxiEEA3csb+ytgcGC9HGI9P8L5VCYRu3BISQbD0
         ZzB4ZSW5ZB9qFtoXfqXC3MvEYAUoSaW1xUr756TzWqIxH11F5QZbaOaSkeUUDEj+1br6
         n36Q==
X-Gm-Message-State: AOJu0YzsS0TF2ZNjmQdtvBRHPLMLix87rs10SY0cOc2hhgwxWzb02ks6
	XEXDtgsAnaLtqNfIfSYw0eLvao1rgmk+WIZPWficffnsmzWyjd71nFkEZMR8u0KlLqjAd3OFLho
	WgP2l0E/OFJyStCFIou2HNv+ykECpkh93SKEpGDCZFVf0phYpsGUWwTsax7Mh7MRhE0eSWPLDJZ
	ulVAm6i38=
X-Gm-Gg: ASbGncsYQrlODpoy7U+NhAPNzknl+5ndLTN5V53ACCZHgKLK9ioxHpcw96DqLFZJ+fI
	jGAkdduDdoLx7X9IdRdZKmi/k10SLJPvmOt+06ewseML3b+ByAnBan4z+gSnrBgA13KTMcz99T7
	fTxaWDd7lmVvJxEshN2tpivxf/Xp0UlqPM4OA/jGTB5YvCpjOE/azd0iG7o5uwUc8bKrnvd61vb
	HzuZsEdRSMpqXKmzBzklDwkgM+JGmsRZqVV33YNwedm3jVngF8B3VwT7e1dhsGn5DsMemgrCdkm
	K30zGCK95rZP9Mqb
X-Received: by 2002:a05:6a00:2e14:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73425ca201fmr5092582b3a.7.1740144909754;
        Fri, 21 Feb 2025 05:35:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9cThE2TLeyZ3v29gmKIYQTJjFCHfD+VOXkksuQsyP1lmxTtH9LYVHO1h/J0OAS+61OnPX5Q==
X-Received: by 2002:a05:6a00:2e14:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73425ca201fmr5092533b3a.7.1740144909269;
        Fri, 21 Feb 2025 05:35:09 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:2777:7867:71cd:dd56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7325d65619bsm12565459b3a.113.2025.02.21.05.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 05:35:08 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Add synchronous fake device creation utility for GPIO drivers
Date: Fri, 21 Feb 2025 22:34:58 +0900
Message-ID: <20250221133501.2203897-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a utility for some GPIO devices to reduce
code duplication. There are no functional changes.

In this series, only gpio-sim and gpio-virtuser are updated to use
dev-sync-probe, as the current gpio-aggregator does not benefit from it at
all. A follow-up patch series that introduces a configfs interface for
gpio-aggregator will convert it to use dev-sync-probe as well.

This work originated from a suggestion by Bartosz:
https://lore.kernel.org/all/CAMRc=MfcooZXBqVpbQ0ak+8LGsPDzwKSN3Zfb0eZDx1Bx4duzQ@mail.gmail.com/

N.B. this submission is based on the same (gpio/for-next) commit as v2:
f04867a5d0d3 ("gpio: loongson-64bit: Remove unneeded ngpio assignment").


v2->v3 changes:
  - Fixed Kconfig (hide it from users with removing 'depends on', move it
    outside of 'if GPIOLIB ...').
  - Dropped an unnecessary comment, an unnecessary line break.
  - Fixed Copyright (Year 2025 -> 2021 for Bartosz, add mine) + add my
    MODULE_AUTHOR.
  - Renamed dev_sync_probe_data fields ('data' -> 'probe_data') for both
    gpio-virtuser and gpio-sim.

v1->v2 changes:
  - Renamed the files (gpio-pseudo.[ch] -> dev-sync-probe.[ch]).
  - Renamed the helper functions and a struct.
  - Fixed Kconfig (correcting bool to tristate, etc.).
  - Fixed Copyright.
  - Added some missing #include.

v2: https://lore.kernel.org/all/20250218160333.605829-1-koichiro.den@canonical.com/
v1: https://lore.kernel.org/all/20250217142758.540601-1-koichiro.den@canonical.com/


Koichiro Den (3):
  gpio: introduce utilities for synchronous fake device creation
  gpio: sim: convert to use dev-sync-probe utilities
  gpio: virtuser: convert to use dev-sync-probe utilities

 drivers/gpio/Kconfig          |  5 ++
 drivers/gpio/Makefile         |  3 ++
 drivers/gpio/dev-sync-probe.c | 97 +++++++++++++++++++++++++++++++++++
 drivers/gpio/dev-sync-probe.h | 25 +++++++++
 drivers/gpio/gpio-sim.c       | 84 +++++-------------------------
 drivers/gpio/gpio-virtuser.c  | 73 ++++----------------------
 6 files changed, 152 insertions(+), 135 deletions(-)
 create mode 100644 drivers/gpio/dev-sync-probe.c
 create mode 100644 drivers/gpio/dev-sync-probe.h

-- 
2.45.2


