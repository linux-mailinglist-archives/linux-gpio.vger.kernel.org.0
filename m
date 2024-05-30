Return-Path: <linux-gpio+bounces-6937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 972708D497A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 12:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 260E21F23CCF
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B69B176AD8;
	Thu, 30 May 2024 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="S6NyaUD8";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WwjLXAwx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0888183998;
	Thu, 30 May 2024 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064449; cv=none; b=CNhb8wQ/W2PIRJe6rtltp5io5g354P3H3mfceHPHrJ+4EC6siUimtEWjf/TwPRGP4Qpjune6cc8SBXYYOmpKAdrGvwlSjRwGvE1u6gnyyvFphTEavU/cLhP0ri8Yx0FGRpxkhTknZbYAIaBJOdiV1hCT8FpEggr3Vt/72HpmzNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064449; c=relaxed/simple;
	bh=5N+0iLZLf3giOaOopWVWUw8ciQFVuhv3DVoABzuZXNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d7D/cqWc6sI0fgJtk4/hPXV67PTWRBLWqU93LX1jxazh42nDol96bZ7nEMVAC44jODpZd8wi54vmKtC/didI37qMN30kEgHi474oClMPGla6kWdotDATIZp3ipIT9oUI1utMVynXkZdZK9yOpr5zqVCn3qu5Fu1bbvWKZI2XdwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=S6NyaUD8; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WwjLXAwx reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1717064445; x=1748600445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rFJOBqLzaB2TF9ek2VMd5YV6VYsS4t+ViJ7NioVqqj8=;
  b=S6NyaUD8AOPfhGo5xcdH9EbBLJ1m9YHlrzP2xTs5XDe2TQDAVhC9SUGg
   3hbc7FwIP1pbd10OD15viM3zsoUD21UDLBtfHo5xkUOOtPnkpYWZPnAMT
   k4BpycQEw7NgYYPAsHiuMBbgdXVpm4fHNrHdFmYEnDNCJyRGVF7Bqy8zn
   3L0Dqyavz8zt4FuA5h9no9QctDB9h5LhccOcBBlF+CaENjV1xSO3ABu+J
   IU611EXwpNHeMgwTn+hWP22Jq4WWAnN4i+F3E0YqDd/+l7CYJ8JlAIlPc
   a8O1dyDkOt3ffIjVSNI9OQ1aIyOcGKHXu0SQGru6pTz14Rl5WcPt5qzqr
   w==;
X-CSE-ConnectionGUID: Gf+5FU12TfCtjDiSf9lIBA==
X-CSE-MsgGUID: xOudEmUgSxS67gnKuxdWcw==
X-IronPort-AV: E=Sophos;i="6.08,201,1712613600"; 
   d="scan'208";a="37142998"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 May 2024 12:20:41 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC85A16126A;
	Thu, 30 May 2024 12:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1717064437;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rFJOBqLzaB2TF9ek2VMd5YV6VYsS4t+ViJ7NioVqqj8=;
	b=WwjLXAwxXmJetayFBy2IVUpzr5+aTuTqVlAioRDZTkcREXjlQS1M5eo6lVFFE/PgB2nkAY
	y79DfGVyB1Ap1kiYdGSYBQZxlK6K7nGvZtbtEAgTIUJOxYLQ4/oWZhA02B/eDBLl/Mhgse
	ucZlHD3U7tM93ar0qGLEjm38kU21WIr/e7avZYdvSxRP3Rufh7hVkZ/HL7fNogJEx2WY6/
	lMc2kcVHqVSoSGR/bVCjO9SPUDx5E50AUP/EQ2qBsUlwQjToVnRp78fv8xx1AEnUdm4Gs2
	1Q6hwHsgMjUyOzYf4MWM9Iv5URCR3dUDOa8sejk6t0UUNe/xAo9Y0jERir7RUQ==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 1/4] gpio: tqmx86: fix typo in Kconfig label
Date: Thu, 30 May 2024 12:19:59 +0200
Message-ID: <e0e38c9944ad6d281d9a662a45d289b88edc808e.1717063994.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Gregor Herburger <gregor.herburger@tq-group.com>

Fix description for GPIO_TQMX86 from QTMX86 to TQMx86.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

v2: added Reviwed-by

 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3dbddec070281..1c28a48915bb2 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1576,7 +1576,7 @@ config GPIO_TPS68470
 	  are "output only" GPIOs.
 
 config GPIO_TQMX86
-	tristate "TQ-Systems QTMX86 GPIO"
+	tristate "TQ-Systems TQMx86 GPIO"
 	depends on MFD_TQMX86 || COMPILE_TEST
 	depends on HAS_IOPORT_MAP
 	select GPIOLIB_IRQCHIP
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


