Return-Path: <linux-gpio+bounces-27296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15DBF0083
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 10:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 96CA44F0087
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 08:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54522EC56D;
	Mon, 20 Oct 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oADbZ2kX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569592EB875;
	Mon, 20 Oct 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760950332; cv=none; b=e6t5FxDcAJvNb/2RG3sX2Mry8wzpJEPQj8QVhuWPkSjYJzAmNIZ66YhBYZWxQgR0DyyG7LqulItAjJ2ZTPuFxELQePfk8hrsasU4op42p4+1/xPqKkVt2FsIDb1p19WY9Xyvy61ZMJz77GBoAr2zFKW3BIFjXkBEr2kM4oi46Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760950332; c=relaxed/simple;
	bh=3+kq7/U09g+lg6l/mbSdhdcOsFznfvQ0hxb1HcpN6Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilFVQv5fHkiw8gdq8hTosmuHqTcLiSnlsz0IFvNuPqiMvI1NXHgY+HBGurzSrYQqcCk1yAvXC8cuZOZXKb3o2KbnNzWQoiXHTOObRaM8D6SDpYN5q//R6/mRIpZ4uTeoGdaDGpt1zV91zm6c3s9+nZ1yKPKhy0IYKKbWhVF75T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oADbZ2kX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0804C116B1;
	Mon, 20 Oct 2025 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760950331;
	bh=3+kq7/U09g+lg6l/mbSdhdcOsFznfvQ0hxb1HcpN6Fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oADbZ2kXwOz1p5Gq14LMjM9Kfib6Fa6BhUHZebOUy0iqq0jLWYNFeYtYn4CGggE3N
	 R3F37/LK9zyVLQMqNqB9sh60pfRnsN1S/dPDuCUb0abw2xg9aoicDg8Y7RMZghkaPz
	 RkXiRaTgOgwHxyA5S/U+anizIK2Nm5QkZtNLeapV3AC2XOU4Mziukw9KKiN+5peUW0
	 X5nlk82uq36kfWYsUqxqEotLQE9JgX2RDKEiQvxFes7TObBmRMm5II+Hh/9AkB+qg/
	 hTe5Ug1jHz7EYbrtalAH4lkDiWUMf1CM8GrawFcx4yPBqLQ/VOBGRWFR2yZWM2BOXY
	 SHIlagx90BO7A==
From: William Breathitt Gray <wbg@kernel.org>
Date: Mon, 20 Oct 2025 17:51:44 +0900
Subject: [PATCH v2 1/3] gpio: 104-idio-16: Define maximum valid register
 address offset
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-fix-gpio-idio-16-regmap-v2-1-ebeb50e93c33@kernel.org>
References: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
In-Reply-To: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Michael Walle <mwalle@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
 Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>, 
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=wbg@kernel.org;
 h=from:subject:message-id; bh=3+kq7/U09g+lg6l/mbSdhdcOsFznfvQ0hxb1HcpN6Fw=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDBlff1gyXvsYtC9u1iwxibxPcx9r/9DweaNn/H2D/AatN
 z+MJl092VHKwiDGxSArpsjSa3727oNLqho/XszfBjOHlQlkCAMXpwBMhL2HkWHBhB13t6sVJEw0
 Nb3g9Oi5zW4nJy/vq3tn7FV3X+rwZ2UhI8NfmbrLz5KPLdrSkakrVZdWUnO61eGAp9KGhdFeEp6
 XrDkA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

Attempting to load the 104-idio-16 module fails during regmap
initialization with a return error -EINVAL. This is a result of the
regmap cache failing initialization. Set the idio_16_regmap_config
max_register member to fix this failure.

Fixes: 2c210c9a34a3 ("gpio: 104-idio-16: Migrate to the regmap API")
Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Closes: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
Suggested-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: stable@vger.kernel.org
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
 drivers/gpio/gpio-104-idio-16.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index ffe7e1cb6b238856b9d13b2a278fe6c44b9cc8d3..fe5c10cd5c327ace1b715e9a27590211dce06fb0 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -59,6 +59,7 @@ static const struct regmap_config idio_16_regmap_config = {
 	.reg_stride = 1,
 	.val_bits = 8,
 	.io_port = true,
+	.max_register = 0x5,
 	.wr_table = &idio_16_wr_table,
 	.rd_table = &idio_16_rd_table,
 	.volatile_table = &idio_16_rd_table,

-- 
2.51.0


