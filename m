Return-Path: <linux-gpio+bounces-26795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DCBBB8003
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 21:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5607F1881D91
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 19:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C59219A8A;
	Fri,  3 Oct 2025 19:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="uAoWJLDd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3366029405;
	Fri,  3 Oct 2025 19:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759521058; cv=none; b=u5uSCQy1HhVMOz+WPI7YTpDZGwy35sfAVYNByCKxWTHRalGaS/2r3pxa9AOBZz7gTfeVMkPAdwB14gg4QBcusnQsXHXy/V5GfFwMMBUwfY2zNbVaa2YStou/lKIlYo5wzKPUaHxaRgqimjg/621rSQOyUVpGxmRy4PR9dLi8kVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759521058; c=relaxed/simple;
	bh=1iIEJf9upLApf9F3IDmVG2M2QC5J9/5aCBY2pJ/2ECU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MpYNg09xca03Mw53UCqPxSpaOcmDDPkm+E1cx0Qs5AA3DV3C2T9IGc43eu/60VClL8lhO0cbKMstXNPRZjg0SyWxrud7GdXGd4uEfi1VNUVwxQk2MDW36a9c0ER9W3Y9eeJ1VKzzMmMT+qtROLwAzAnKValz+WQIuvzcrMDbpxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=uAoWJLDd; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 3E3534133836;
	Fri,  3 Oct 2025 15:50:49 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1759521044; x=1761335445; bh=1iIEJ
	f9upLApf9F3IDmVG2M2QC5J9/5aCBY2pJ/2ECU=; b=uAoWJLDdpLehwP9hc/7I1
	SW2yQRHFu9ffYQW3nFwppYyTYcIBCF0Rb0YAHbnK08y/i62V37ZdEwVPt7Z1V0bf
	N92TVfFE+GbAWav5SqKxHLN+Xd3F66DQbgGkXB4iPVootRD7hmxlqOSgftD9wSeC
	1ssxCs69bzrsPPx2DCODvo=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fZCdygvTGI9L; Fri,  3 Oct 2025 15:50:44 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2EB6B40DFF4C;
	Fri,  3 Oct 2025 15:50:44 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v4 1/4] gpio: mpsse: propagate error from direction_input
Date: Fri,  3 Oct 2025 15:50:33 -0400
Message-ID: <20251003195036.3935245-2-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251003195036.3935245-1-mstrodl@csh.rit.edu>
References: <20251003195036.3935245-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Not sure how I missed this, but errors encountered when setting the
direction to input weren't being propagated to the caller.

Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
---
 drivers/gpio/gpio-mpsse.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 9f42bb30b4ec..c508d9e33054 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -261,9 +261,8 @@ static int gpio_mpsse_direction_input(struct gpio_chi=
p *chip,
=20
 	guard(mutex)(&priv->io_mutex);
 	priv->gpio_dir[bank] &=3D ~BIT(bank_offset);
-	gpio_mpsse_set_bank(priv, bank);
=20
-	return 0;
+	return gpio_mpsse_set_bank(priv, bank);
 }
=20
 static int gpio_mpsse_get_direction(struct gpio_chip *chip,
--=20
2.47.0


