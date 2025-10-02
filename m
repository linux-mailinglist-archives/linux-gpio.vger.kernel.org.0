Return-Path: <linux-gpio+bounces-26770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A24AFBB4DB5
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 20:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 559CC7A8BE8
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 18:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA89B27B4F9;
	Thu,  2 Oct 2025 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="nPJiCYx1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD5027A44A;
	Thu,  2 Oct 2025 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759428733; cv=none; b=nr+D8kFWHDDmhaqK/CFUmbFfL253JX97zGdKImsmVosO8jardOA7PjL+4WzZV8iZjngMH3VYdU4EjQhLS57LSVYwYqj8qhf9yehxV7wtdJS7mC1PJcDdN1KwWDbNHp65ekowMSyE3nnankvu7q8La0oGpzo/z4AWj09Lk5R2lWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759428733; c=relaxed/simple;
	bh=W2m7Cd/qmNXM1k0QykgSUzIUJ6rontCrfMafYILgWx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABvII+eInxj+K47GGVRh9Z65L9Mjo1wXpl9pKi/BfXVv4nFoARDtmAuPOHt4CgJjSV4zSpDMlaPxgl8Gu8j4aq2+Niq8BGxAzbnCQcvxhU8OM0RpLMExNk/VDmXkkWTOxnSD4cTNRxXcUelm3LAlvpFoSEvUExhRh9lrNLVw5HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=nPJiCYx1; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 29FA440EA0BF;
	Thu,  2 Oct 2025 14:12:10 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1759428725; x=1761243126; bh=W2m7C
	d/qmNXM1k0QykgSUzIUJ6rontCrfMafYILgWx8=; b=nPJiCYx1fjzxynWYuC4yK
	+PBoOeMfeskM6IYqp1Nlppirs3Z0ryXsXMxqfIj/0rH3I+FDil1uJgp2zbizCyki
	iXtQYbpgKoRQOQVbbynjGqV3wQLIbO9ECze5Liu/HaXLwFV7NZQHpX6JdioiEOC+
	8+lSwOJbXfVjvn2XAAT5Pc=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9J5Lvaxx6d3d; Thu,  2 Oct 2025 14:12:05 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id BB1D6456D905;
	Thu,  2 Oct 2025 14:11:52 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v3 4/4] gpio: mpsse: support bryx radio interface kit
Date: Thu,  2 Oct 2025 14:11:36 -0400
Message-ID: <20251002181136.3546798-5-mstrodl@csh.rit.edu>
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
index c2a344488a23..3c0645374ba7 100644
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


