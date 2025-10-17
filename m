Return-Path: <linux-gpio+bounces-27228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14021BE6008
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 02:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D71B5E7D4D
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 00:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB8521C9FD;
	Fri, 17 Oct 2025 00:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbmevXdT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B5321770A;
	Fri, 17 Oct 2025 00:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760662701; cv=none; b=Tch/U1+nmbvVHA+yDeF4iJMR1R9dvoVNBdHg+SJoYQ4YF/VjT2uRHkfetYWaziTAxYf04Jy4TWyedQBWIid9fLUIQsWkJXl+7WNxtLzaOWuXIVfnIDUjSYRi1HZNKZDd5uRVjOKD+6Ewr+IKsXdms6w5f9cCHLDyLRxc6nIbSDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760662701; c=relaxed/simple;
	bh=K6QNOy514zXirEOwzmGcdXdrXBd0suy3BtvIzzRIanI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAzIhYwgGqBrTy6QNhhSNiUAySZgYFdIbj1v0pzEXseJ2AnSbTOkm4j9AtyWT+Hd+CD7+MV941glabeInrSJyPPOj7X0OXenSSOgBlT3n2eYPmBKqhTDuEVWiJ4W1YGpS/K9FSswFI9ks6f3toB5IO1rFMJLZQhRcrbAlRV08z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbmevXdT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B819EC116B1;
	Fri, 17 Oct 2025 00:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760662699;
	bh=K6QNOy514zXirEOwzmGcdXdrXBd0suy3BtvIzzRIanI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KbmevXdTv35nMR8LBslkni0f6FXlVv0VVly9DxErUzx88ZQz/gSpossW0KSxH9cQp
	 bYtJuA1AXADwubiDTI7Z5RZ4wQYZQFxsGm/LjGoVBXYES3so5bsIozRBRAp1M3jiz1
	 uPTH4V+FzCqUM5r79a/QhP6u8XV1Re+R1+Kb2E7MW9ucMjUs8Elz28tT+EWxLdH6lb
	 xClhGTDYmomr0xtHpuiY59bH4FV/2UhNfkGe7Pza+eeOmIPZ/Typ3sGuPfzPlqxY8N
	 P0kgTDxOjTrbLzSzJ+EMoxaxuM3+Pdj0lJsfxZUzxO+kVQUr87oxGUTh1rqiPVjaIY
	 WV3xhrh5jflBA==
From: William Breathitt Gray <wbg@kernel.org>
Date: Fri, 17 Oct 2025 09:58:01 +0900
Subject: [PATCH 1/3] gpio: 104-idio-16: Define maximum valid register
 address offset
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-fix-gpio-idio-16-regmap-v1-1-a7c71080f740@kernel.org>
References: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
In-Reply-To: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>, 
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=wbg@kernel.org;
 h=from:subject:message-id; bh=K6QNOy514zXirEOwzmGcdXdrXBd0suy3BtvIzzRIanI=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDBkfp6z82cXFmM8WdseG91fz4m/rHnKvvZR+TuFvgP6fL
 HlWUwb1jlIWBjEuBlkxRZZe87N3H1xS1fjxYv42mDmsTCBDGLg4BWAi+tWMDFM0NvSkd9/vmZr8
 fll8mMZ165m3151rrN6zadUmDS3d/qMM/xM+pGjNPv/1jFNGUNoHl6T0Ou+v1y64Lb16edne+zy
 1LLwA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

Attempting to load the 104-idio-16 module fails during regmap
initialization with a return error -EINVAL. This is a result of the
regmap cache failing initialization. Set the idio_16_regmap_config
max_register member to fix this failure.

Fixes: 2c210c9a34a3 ("gpio: 104-idio-16: Migrate to the regmap API")
Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Link: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
Suggested-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: stable@vger.kernel.org
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


