Return-Path: <linux-gpio+bounces-18025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ADCA71D56
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 18:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DE5D7A63A8
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 17:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC3723C8D1;
	Wed, 26 Mar 2025 17:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="oEOnQeXv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B7F22E400;
	Wed, 26 Mar 2025 17:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010731; cv=none; b=jBkOZKBfN2a4LX2MynI8ig7qEoqpadfwEHRlEKFHAqEHZzdLVn1EzY8NKTHRo+fWNH2KigQ9IuJ94H/dHdEBh+ciGnuzlsUq/4NNyYacYHPULfbn+3gEWt2OKmAMaIRm/bxthh78o0aGyvlTKs0jWxbv2kLMDKUwK/3hFLgai/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010731; c=relaxed/simple;
	bh=yl0t+HWGTi+COmrHFYzrfcaopHMXF6yjTDk8RhvcoA8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jQb/xtG1npIkEKB9X4mjm0DJkhXnq14EYeREUZB3nfBwtbxpSteP2aghcf+I0I45zxb2pMNHV94GyNqtHJlmtu2/cgx1bJ7fRcYqnwlIATpN+kxnzVw5/oTHztO9l/QUZ3xosGGEr6+YZOsNszQ5bxTQ+umyvfcsKuo13m7uCjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=oEOnQeXv; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2DABF1FB9C;
	Wed, 26 Mar 2025 18:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743010725;
	bh=sLJ+3DY8jmPT6Dfy0q0w2XM67M9sQ9k+sTABADH9eMs=; h=From:To:Subject;
	b=oEOnQeXvd1e9Xxep3C/I27MhIB4t1DSnzuuyvsQCBToAVGZw2rAbtrw9WY0VE5Q/K
	 XkqM14XNZ64tTJ8l5HXSLCd4eNB6FrgjwMyGbSwdMdzJ9Ake5Ea60XfCUSv2aKLxx8
	 23+8ersQwM6Czqii91w4/Cd0RrePiq/AwRTWY6tqKbOoH7ecS/nEO8ENWgybj+9rPY
	 LXECmzhOpePpIb2duijq077tJo/25nbxWFyq0AFmkpRbM0aI+fpOlbAC6tff5dA3Em
	 Ixz1iCcloR142daI6QSnd0TN07HqVv6RylX+ts/rXaeFcoTePzmYwBU6i7oD15lpAu
	 YkdHKkAIdknXw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marek Vasut <marek.vasut@gmail.com>,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1] gpio: pca953x: fix IRQ storm on system wake up
Date: Wed, 26 Mar 2025 18:38:38 +0100
Message-Id: <20250326173838.4617-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

If an input changes state during wake-up and is used as an interrupt
source, the IRQ handler reads the volatile input register to clear the
interrupt mask and deassert the IRQ line. However, the IRQ handler is
triggered before access to the register is granted, causing the read
operation to fail.

As a result, the IRQ handler enters a loop, repeatedly printing the
"failed reading register" message, until `pca953x_resume` is eventually
called, which restores the driver context and enables access to
registers.

Fix by using DEFINE_NOIRQ_DEV_PM_OPS which ensures that `pca953x_resume`
is called before the IRQ handler is called.

Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
Cc: stable@vger.kernel.org
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d63c1030e6ac..d39bdc125cfc 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1252,7 +1252,7 @@ static int pca953x_resume(struct device *dev)
 	return ret;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(pca953x_pm_ops, pca953x_suspend, pca953x_resume);
+static DEFINE_NOIRQ_DEV_PM_OPS(pca953x_pm_ops, pca953x_suspend, pca953x_resume);
 
 /* convenience to stop overlong match-table lines */
 #define OF_653X(__nrgpio, __int) ((void *)(__nrgpio | PCAL653X_TYPE | __int))
-- 
2.39.5


