Return-Path: <linux-gpio+bounces-27086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3DBD9CDD
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7433E4E8309
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 13:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9340258CDA;
	Tue, 14 Oct 2025 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="sqETeMjW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0344B18A6B0;
	Tue, 14 Oct 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760449699; cv=none; b=QMV7bgyR4Rb8SrgC5JOrY2BCVD7mZ3WaBWcElWn/yH/7SeYq3Ns2xz6jRqhJ9CARwoBg2fW4XW3+d7UJQPn2hTDCOvsHnEHJ/e8nTFv/I28O+XMCUTUWcS2MC3N5zvEGTtfI6q5wJPv3DA3ny2izX+o/+Cm/LuY/Z/NUnxr7b/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760449699; c=relaxed/simple;
	bh=SpMMSwOSex0dqDx2UmRfbG8cJGm4f5VRNazEV3Jf8u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6xEYcPH/EIbCYdxX3ZuHtxrL+ifyEJ+4+VQkmSq0tIsxv3ib8eOZ+MvqdxHWrmOER+hI9sMxfyFCkvQDWlsHQY+hxVTpwdB21YcBtGnAtQnCv5Z4oERRKj09LESEgvWVN0W4koSHrOf0Q81Be3g7HPurGp8AOr2zaMTZ1XNl8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=sqETeMjW; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id E36D84049798;
	Tue, 14 Oct 2025 09:41:00 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1760449256; x=1762263657; bh=SpMMS
	wOSex0dqDx2UmRfbG8cJGm4f5VRNazEV3Jf8u8=; b=sqETeMjWb/FQWLcnTliED
	+mCzgMLxgQo4DolTDnySuNfLHgsy81WuWhnXDHqVXu7e9mWJ6uTnoktGbxXKrNwO
	4qyitCJpXfOvWXBrdvUxb/p8cBQ/eR3mwlmbrAjl1zi2bdVjc+hMKhcgb45xbk8w
	WER6LHM+qZstf7Qfck0w68=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TqBWjd4LeQo9; Tue, 14 Oct 2025 09:40:56 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 67121457383A;
	Tue, 14 Oct 2025 09:40:56 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v5 1/4] gpio: mpsse: propagate error from direction_input
Date: Tue, 14 Oct 2025 09:35:27 -0400
Message-ID: <20251014133530.3592716-2-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251014133530.3592716-1-mstrodl@csh.rit.edu>
References: <20251014133530.3592716-1-mstrodl@csh.rit.edu>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


