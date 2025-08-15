Return-Path: <linux-gpio+bounces-24407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F045B27BA2
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 10:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D007117AD9B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 08:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF44257431;
	Fri, 15 Aug 2025 08:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CneucR+M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1B1519B4
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755247668; cv=none; b=fmVwwc2iF1FDDmAt+KIKNH2PXL+h8wl5s8T2Wpbl+/5itGh5czNafK+z9axvWHqgQ0RwXwuBocikgvT+hBgpoeOWGuEfsbPCvegLvRO2i5d8GrxAj/d/QJGr4yi7QJ07C5agyoMjzjuwm0fsyMigpnURhZyQH7DHD+8Lia1AfTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755247668; c=relaxed/simple;
	bh=RYALQ/VZFhgTzYxmgzWoAtvdoZBFMfovB3h/tVNez7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9P/tRV0r9MJadiYGtllnCSDLT/b2wxG3iwW3ftIXIR0vhoVSaSq8sq5oa+kN56wMQ1Iaz3ZOMlI8/23oRIQS5By0ppCPbL5RiqUsL3TcCx5MZboexlUzabO7zdn12oFHeTJ6FPCxY0efx4PlTmlGjFjw5VBUQxC3WaUm60E2V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CneucR+M; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e4148134so913603f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755247664; x=1755852464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dIMBkGRRdaJ5ZRiDeo0WeGWMzhcFu0Qu77VfnkG3cGY=;
        b=CneucR+Mn423uioIXsp49XvRrPz3ebxaWThk4aFF27h9q6xtZ5uP+cfqPOifXA2PWO
         EoihXpvDdNLNhcuwRUGzKHfBXFO32vVkcq/r4HqZfVHE4sJBIrvun1DToCDSTb5VauTI
         FztomLK4ETswLGeD/8YYc8t33zGFegWXWcHA2Tb3pOEk4vIM4JJ69FhremkrtN5onKYn
         GdUXWOlqLW6RoWy+WMhpO9f5UWwR7m+0mEe5PcnpEnEbpqs0b0Utr5IeISYOvYimEsGQ
         TkLOrS4Zn4aQtGcJ5TT2N/4DDBtAKMgg25ZvoMIe9E9gJofEnhyxVauFefvaK03JlSw5
         DExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755247664; x=1755852464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIMBkGRRdaJ5ZRiDeo0WeGWMzhcFu0Qu77VfnkG3cGY=;
        b=TlYFWhtbM0UK315V6UzKB2slmE0GZj5nEpiHIL1vrcNy2UBVssdj+KTPSZ4wH40WzZ
         ORQa15stuSmRlXXlG4SPXwR0UgqaAwydgi75fM9U/W8t6R9hTowtrxf+MbyMjo6M9J9B
         cVafgem8B2MpgbSE1rAKABx6nCbc6BlQHiycvpNxfcgo+/s333oyWXLrosZdVsriwJNS
         FZQ8ASF6ECR/p2gR4zXuLN3HhHlzv6fqi4dVIcwEz3cXkbm3pwQH62dTAuCrvbBQpWbw
         ury+yBgCX3WKk+rXk8t/cmSm3LXHAU133abbdq4iIdoXO5XEu+DUfskKw2OM32Wg5sEp
         v+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVntT7FiQldzUA2VXZ3d5+VrKjoR/n15dC33zZPzOLGXFnIt4F+bsnQ36u+5SsAmbuWkGB5B9VgZEF@vger.kernel.org
X-Gm-Message-State: AOJu0YxuirSingYA3k5cJqQYP7uVErtJLMQwXKVUppWLsX26/0o95dXV
	9xnubSkFrUhLFhF9rIify3cD/Li0J7+3klgfjAvP4pqJOkmOivvxec2PZHotCUFrlDE=
X-Gm-Gg: ASbGnctgv2P8FoXKfsziH/OWfvnm4sK31Zdk5wn4DCbijqb4IkoPt4qN2zTtWAAHaRi
	/Jk+vgQOr2w6fIso5AzOEjjo27GKnMkBqZFfwtM9qFyiBf+r8pSUauIKkVjcz3PgiPCbTkBn/Iu
	dHo9T5928a9l8PUXgnQafR2gODMQV/Li/RQZfiYK3hR2t56SPjx5wqMRxKIo2sdHqcm9znPIr16
	gPf/DIEHKwIiZSkOctKRae3aSUz102xZnjVx8n6qIQgLFAOqVMWCKu4zlkRiNdlXjPDD5wTJd+E
	XN7TNClTSwanCQn0T0avMBav6Xus1cC5BwzK+vVU7sJcO9xGahxf90C3TzxPJNS9ZgrdO4Ciu7s
	Xei+qD/B4CkW9DGQduVNKWdr4yrej7u5nxwc=
X-Google-Smtp-Source: AGHT+IFK/PBM+v8APN1/Zvq4cSIYlHkSkGTuq1ae9CofliyDmCBIhWJ/UJpMahqDcWkjaik/M9sKgw==
X-Received: by 2002:a05:6000:438a:b0:3a4:eef5:dece with SMTP id ffacd0b85a97d-3bb68734ac1mr814100f8f.35.1755247664222;
        Fri, 15 Aug 2025 01:47:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb6816ee9fsm1153601f8f.59.2025.08.15.01.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:47:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.17-rc2
Date: Fri, 15 Aug 2025 10:47:40 +0200
Message-ID: <20250815084740.13431-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following GPIO driver fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc2

for you to fetch changes up to 810bd9066fb1871b8a9528f31f2fdbf2a8b73bf2:

  gpio: mlxbf3: use platform_get_irq_optional() (2025-08-12 15:40:28 +0200)

----------------------------------------------------------------
gpio fixes for v6.17-rc2

- fix the way optional interrupts are retrieved from firmware in
  gpio-mlxbf3

----------------------------------------------------------------
David Thompson (2):
      Revert "gpio: mlxbf3: only get IRQ for device instance 0"
      gpio: mlxbf3: use platform_get_irq_optional()

 drivers/gpio/gpio-mlxbf3.c | 52 ++++++++++++++++------------------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

