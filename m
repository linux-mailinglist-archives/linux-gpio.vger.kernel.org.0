Return-Path: <linux-gpio+bounces-15096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE0A225F0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 22:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FFDF16367D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 21:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA1E1E3779;
	Wed, 29 Jan 2025 21:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="MGRmp/GT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123801E0DCC;
	Wed, 29 Jan 2025 21:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738187027; cv=none; b=m7+zo3IdHj32zZYu9i9mwQzqjbIKc98CK/whvYdgmKL4DZ/st1MWJmXBGrvPdPhhY9eVS1b4clNmoJn/QkXpAWZ7dRy7zPhy0FwT23emEx3PCHZ6usIV/ZxAa7fzsrf+3upv33cq4u1+NQt/m9LyyBeP9YeQuExMSVYsGV1ij6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738187027; c=relaxed/simple;
	bh=0uAQJvbblrOaMD+1Eu350AZXigzrwPAQDrg9MZoR1T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PEg2K7kTKRY96PSw+yaV9nE2PH1Mh2zlIdw3om7oDmuXXqeLJGY1mCDXhgzQCPtFhMhthJPAaCci3TwLRFmqwykjpqTUKtBQzqd6cvxtx0coGrgWlcVuAsoAc66A4rUj4JeGIfjGV33yM2U21j0k9xfjcqrahc/g19QPDxJ9v30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=MGRmp/GT; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=rT74W7h0R0GvGWb1NSbNxPJy6iXK0+YQDI9ZgeotLmk=; b=MGRmp/GTomUEkGOZ
	JDwmdQuepuUBOSxM7kPmLISkkQJ76R0p2ZuT6z868Qfwf2tS2QbT1414qd/7ZwA5LuMrROK6bWJyt
	37FO0/FmrOUX7yw0l8mfDGrxwiawwvjaqyU8ynkIH1hpa4eJrRdwz6OoeL4Y9DGJIzbCQRvbZKlta
	M6zWgFLJQoaPUeK4uB7ZmF+h8tVCqwZ7dl3uadsfMMinyB2In0YYHIvpPGQ+TVa/SPHV3WNGZpo61
	sztCPew/0aFw9F8b8fRD9cpz2p2HccEF29I/ZiqRdTCKuDXMgFW/aueXmDfe1k8pEw+yrrEqPt3bs
	eGjf/1HSxxuS88//Tw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tdFqR-00CiU9-1s;
	Wed, 29 Jan 2025 21:43:35 +0000
From: linux@treblig.org
To: ulf.hansson@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] mmc: slot-gpio: Remove unused mmc_gpio_set_cd_isr
Date: Wed, 29 Jan 2025 21:43:35 +0000
Message-ID: <20250129214335.125292-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mmc_gpio_set_cd_isr() last use was removed in 2018 by
commit 7838a8ddc80b ("mmc: omap_hsmmc: Kill off cover detection")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/mmc/core/slot-gpio.c  | 12 ------------
 include/linux/mmc/slot-gpio.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
index 12247219e1c2..5fd455816393 100644
--- a/drivers/mmc/core/slot-gpio.c
+++ b/drivers/mmc/core/slot-gpio.c
@@ -159,18 +159,6 @@ int mmc_gpio_set_cd_wake(struct mmc_host *host, bool on)
 }
 EXPORT_SYMBOL(mmc_gpio_set_cd_wake);
 
-/* Register an alternate interrupt service routine for
- * the card-detect GPIO.
- */
-void mmc_gpio_set_cd_isr(struct mmc_host *host, irq_handler_t isr)
-{
-	struct mmc_gpio *ctx = host->slot.handler_priv;
-
-	WARN_ON(ctx->cd_gpio_isr);
-	ctx->cd_gpio_isr = isr;
-}
-EXPORT_SYMBOL(mmc_gpio_set_cd_isr);
-
 /**
  * mmc_gpiod_request_cd - request a gpio descriptor for card-detection
  * @host: mmc host
diff --git a/include/linux/mmc/slot-gpio.h b/include/linux/mmc/slot-gpio.h
index 274a2767ea49..1ed7b0d1e4f9 100644
--- a/include/linux/mmc/slot-gpio.h
+++ b/include/linux/mmc/slot-gpio.h
@@ -22,7 +22,6 @@ int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
 			 unsigned int idx, unsigned int debounce);
 int mmc_gpiod_set_cd_config(struct mmc_host *host, unsigned long config);
-void mmc_gpio_set_cd_isr(struct mmc_host *host, irq_handler_t isr);
 int mmc_gpio_set_cd_wake(struct mmc_host *host, bool on);
 void mmc_gpiod_request_cd_irq(struct mmc_host *host);
 bool mmc_can_gpio_cd(struct mmc_host *host);
-- 
2.48.1


