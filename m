Return-Path: <linux-gpio+bounces-26524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EBAB960D3
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 15:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27E032A7196
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 13:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829E314A0BC;
	Tue, 23 Sep 2025 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="UI6w2SwM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507D2502BE;
	Tue, 23 Sep 2025 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758635120; cv=none; b=pxopxxS3pjVGRUXuRv97gW+qZCZ0EMh4p322CG8x9fh4o3xhIwX0J9EiIFEdOvjUTFQmeXkbTaUfl90s+Wo2ZRaXcLPm8sazeZ++RSpZL82THPFLOPskDFdpmpgv6KSsRueMeDfH2Crr5Q4gp4MjshTl/VKy+M5eoCSbPFLYQdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758635120; c=relaxed/simple;
	bh=nCeFeVA4pL9oPGT7fpO54wydFjIjRupZuAJ6lm1we8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKEP4fvHP38QyGWMmwpqVflCmoCzUPxnBJYqUVWfi2qwAD/pCfAaF3XTKTFrGhdruHGX0O/hXOQOBAiFI7hfuSGUEwpqWD8emCluLjNgOBT9t2qyq06wkW5cs8HPu8Ow8qxKo1e69eJ3mQz7iPS4uc3VUaLeum9JhIvcIYKDuVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=UI6w2SwM; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 1D7604153CBF;
	Tue, 23 Sep 2025 09:35:34 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1758634529; x=1760448930; bh=nCeFe
	VA4pL9oPGT7fpO54wydFjIjRupZuAJ6lm1we8E=; b=UI6w2SwM5IYBokB0MSc8x
	vuS0A0vVwxlBgBe06lKKZTR+WGt5jWq8dAj7AFMAvQKgDC1dfqhewjecRPx589Kb
	RDYxmYeQPHH/m0p2Gs65xy8XQfh8qLua2XT0Z7P6R71ypzXfOi40jhYiQ8mIdXvF
	76Vlh8vN44pj93OoXzhIYo=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KILom8okMSYy; Tue, 23 Sep 2025 09:35:29 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 028FB4117322;
	Tue, 23 Sep 2025 09:35:23 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v2 3/3] gpio: mpsse: support bryx radio interface kit
Date: Tue, 23 Sep 2025 09:33:04 -0400
Message-ID: <20250923133304.273529-4-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250923133304.273529-1-mstrodl@csh.rit.edu>
References: <20250923133304.273529-1-mstrodl@csh.rit.edu>
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
---
 drivers/gpio/gpio-mpsse.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index ad464914a19b..bef82685ea5f 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -66,8 +66,19 @@ struct mpsse_quirk {
 	unsigned long dir_out;            /* Bitmask of valid output pins */
 };
=20
+static struct mpsse_quirk bryx_brik_quirk =3D {
+	.names =3D {
+		[3] =3D "Push to Talk",
+		[5] =3D "Channel Activity",
+	},
+	.dir_out =3D ~BIT(3),	/* Push to Talk     */
+	.dir_in  =3D ~BIT(5),	/* Channel Activity */
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


