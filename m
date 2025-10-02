Return-Path: <linux-gpio+bounces-26768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F9BB4DA9
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 20:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BD7B1C7C11
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 18:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E370279DB3;
	Thu,  2 Oct 2025 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="tg7YvEb7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916D1277C9A;
	Thu,  2 Oct 2025 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759428731; cv=none; b=apylqkJQMNPYPtWm7WK1UWXV0sUxbmM8j8pQRLJqGCIFl7kyw8VCp8xBPrkT17yK0wYoizH+ZFgyg6Z8zxnHTSpmTUzWcc3fWcbgyS/EtU4uRbAZ9uU4Puy3OR7Ts5+t2Rw52WZbko3YFSrjr6Ptu+GDGZ2SnbZXWBIzd52UArY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759428731; c=relaxed/simple;
	bh=1iIEJf9upLApf9F3IDmVG2M2QC5J9/5aCBY2pJ/2ECU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XoRFodkMumyrw7O9vLu0wTKv9gFZ9EdYaQZgBNdL1QQqbpUomfNbf8h/regF7POOP0LmyixFM/rIOGFyUkcxWUhHUkwR4XKaBx2fOrNYh3BEmtTDLN4xzewqfliCzGihwe6U6gaqZZVQhx1+pyvmlhgRunkEHjq2yLvfVQPDLpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=tg7YvEb7; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 24A0745735E9;
	Thu,  2 Oct 2025 14:12:00 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1759428715; x=1761243116; bh=1iIEJ
	f9upLApf9F3IDmVG2M2QC5J9/5aCBY2pJ/2ECU=; b=tg7YvEb7/lUPv8B95j+Q2
	F5brS+ZYh+eAmPEhel+4X7a881YrhITWAaS5jfo/Wbgfie7Nf0PMO0Fetcozh2lL
	6ceKBVcy8y85bX2TXuFtoc/h9hN+f/eV8tisYsGlmuRCDrJIzhfBOUs8wPiAikli
	CD/xXNANBIdqM1b1Lk6wiA=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jH_Yq4lpUznU; Thu,  2 Oct 2025 14:11:55 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 62B1240EA0BF;
	Thu,  2 Oct 2025 14:11:52 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v3 1/4] gpio: mpsse: propagate error from direction_input
Date: Thu,  2 Oct 2025 14:11:33 -0400
Message-ID: <20251002181136.3546798-2-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251002181136.3546798-1-mstrodl@csh.rit.edu>
References: <20251002181136.3546798-1-mstrodl@csh.rit.edu>
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


