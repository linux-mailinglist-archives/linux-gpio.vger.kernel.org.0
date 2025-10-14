Return-Path: <linux-gpio+bounces-27085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A6BD9C86
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C79AB4E3D72
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 13:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F06313E1D;
	Tue, 14 Oct 2025 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="EVHtD9mH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AAC749C;
	Tue, 14 Oct 2025 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760449272; cv=none; b=LrHHSY5GqcASGRbavvXCiVkfkcINjyr74Iz3QdUNj1zLvGsB3kk+3CSQ9CWgCidmSUHKn9m+1WRKosxL6yD1dgEF0HWvBd9F2r/RIZcOtRICswJK/ylT9mkDxIxDOP39b5rk0jMngR3JrQSN88LaO11Vk0OMYdnno5RQNV0DP7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760449272; c=relaxed/simple;
	bh=RKzict8waBLTidtkzwt9MIuHYg8U67gJCXBuul0kygs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/SssJ+WdUM5SALczzmZKAoUVtTk9cFUtwgzLK7MXprb4LNTdnGgV4pWdiwmOPVQO+0f9oM7tJTcBclKFtpyNExxVFp7gqljb7zKqfujffK6aFncTcLdVt2iCnt7Q+GqJ5aQ0NzKPV5s2c2Iz8Kys4bVBS0hAd2ushomgjAZnuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=EVHtD9mH; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 9B3EB4010E02;
	Tue, 14 Oct 2025 09:41:09 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1760449265; x=1762263666; bh=RKzic
	t8waBLTidtkzwt9MIuHYg8U67gJCXBuul0kygs=; b=EVHtD9mHcHZbE0PEzzhrY
	VwTmNQwcdD7Pwp4KyVh33+kDgwNLuun+xJQoN6Cu18yi2GBSsEanIlFILDxoGUje
	4xjwYe/zpxE/TfSyNlbW3R+WK7TLKf9s4SfudaPIin8u7lEIqVzIt45ioXKKJWzX
	QB6gOP2p6J7DEagZQd56oU=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BOt6ZNSTzJ3F; Tue, 14 Oct 2025 09:41:05 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id EFC084054F4B;
	Tue, 14 Oct 2025 09:40:56 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v5 4/4] gpio: mpsse: support bryx radio interface kit
Date: Tue, 14 Oct 2025 09:35:30 -0400
Message-ID: <20251014133530.3592716-5-mstrodl@csh.rit.edu>
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

This device is powered by an FT232H, which is very similar to the
FT2232H this driver was written for. The key difference is it has only
one MPSSE instead of two. As a result, it presents only one USB
interface to the system, which conveniently "just works" out of the box
with this driver.

The brik exposes only two GPIO lines which are hardware limited to only
be useful in one direction. As a result, I've restricted things on the
driver side to refuse to configure any other lines.

This device, unlike the sealevel device I wrote this driver for
originally, is hotpluggable, which makes for all sorts of weird
edgecases. I've tried my best to stress-test the parts that could go
wrong, but given the new usecase, more heads taking a critical look at
the teardown and synchronization bits on the driver as a whole would be
appreciated.

Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mpsse.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 5ca00dd51a63..ace652ba4df1 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -65,8 +65,19 @@ struct mpsse_quirk {
 	unsigned long dir_out;            /* Bitmask of valid output pins */
 };
=20
+static struct mpsse_quirk bryx_brik_quirk =3D {
+	.names =3D {
+		[3] =3D "Push to Talk",
+		[5] =3D "Channel Activity",
+	},
+	.dir_out =3D BIT(3),	/* Push to Talk     */
+	.dir_in  =3D BIT(5),	/* Channel Activity */
+};
+
 static const struct usb_device_id gpio_mpsse_table[] =3D {
 	{ USB_DEVICE(0x0c52, 0xa064) },   /* SeaLevel Systems, Inc. */
+	{ USB_DEVICE(0x0403, 0x6988),     /* FTDI, assigned to Bryx */
+	  .driver_info =3D (kernel_ulong_t)&bryx_brik_quirk},
 	{ }                               /* Terminating entry */
 };
=20
--=20
2.47.0


