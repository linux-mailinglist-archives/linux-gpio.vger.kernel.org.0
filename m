Return-Path: <linux-gpio+bounces-26643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F345BA593D
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Sep 2025 07:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E84D189F519
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Sep 2025 05:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF0622A4E9;
	Sat, 27 Sep 2025 05:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="I/IHR/ZB";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ScRC0d9u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5FC229B36;
	Sat, 27 Sep 2025 05:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758949359; cv=none; b=bpTFtHqqtO/qKSqs49m7M7aWWRdVxerSo6/3hgkJxEgexw6vkCXgssXcUL6T2WdhYj8JfdGf/X8bQd6wgvnoEIMQpYv+sVoVmgkBjR3mNnx7scu3olqCqJJxq5QMsQqXW+dirFk4vWChd2qcFby6lX/32zajVSIK2PyBb7PEGd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758949359; c=relaxed/simple;
	bh=plcpw2T9B0QjZiLTHHwxIiFvD6CVvF2W7wuatitb7c4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QP35NDQou8qqrVaXAw5d0qPXentTs3F1eRwn31keNBvkbCRKGtK7tN73tohHx8KEBfSWbPgIFiJmPFPqBqWKSSvna8+KcItzaKzHw/KZ2mztXiqsBfWaT72kIRbpPuL3jnclzc8xx/z93GU1kKABXOo6SOW70lWr3tN6i0r5hTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=I/IHR/ZB; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ScRC0d9u; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949158; bh=nZCMvyWJd/0l+d8DwDHIgR7
	fMdp6Hhhxk/Ql0PW2G5o=; b=I/IHR/ZBehD1zCce6Zf+RIlfFIkv8B873wDBg96cWIrHduo557
	/1MfQJV5GhPBhy6NILg8C4/q+OPQKKSQnsCAtNBFgUXq4mULRPZYifBeL20HoVB7fexWPcrljAq
	vQXJNue1Jv6QK18wdEmgvryymT5rr2NR48YVViFkkHfWHxJgTeat/RfySPINdbHQumPzhn3fVnZ
	sBW+p4X1ceV+61Hv9xRqZa9ciYAj59xVLca4KEIY+OA6JpES91hcNfkP4m4627/i/qElpC2wAbY
	Tl6xYxU6aNMJ3yLm2Dgy0UX9ZyVHmZG/6EYSUgKTqepNxbWBj2HRxd94Fl+Le05xAAw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949158; bh=nZCMvyWJd/0l+d8DwDHIgR7
	fMdp6Hhhxk/Ql0PW2G5o=; b=ScRC0d9urjAzTpmviEOOd2PNwtf09CsGN+AqdKAxtvTOTSevdk
	KoZN/RL4rrO3VsQZNk3QXhyMknEjX9DUkpDQ==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Sat, 27 Sep 2025 11:59:08 +0700
Subject: [PATCH v3 3/3] gpio: rda: Use bidirectional GPIO register for
 direction input
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-rda8810pl-gpio-fix-v3-3-3641cdcf6c1e@mainlining.org>
References: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
In-Reply-To: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758949147; l=1179;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=plcpw2T9B0QjZiLTHHwxIiFvD6CVvF2W7wuatitb7c4=;
 b=h8bm/jYJCPp076VvjNf3NuBUvvZXtwNyl/IgNI3unR8XASZV8DEetcampybSESkX8cdFR5EVp
 RVqpIB59SZDDr9w+ar/lPTXgEyhzNw+QVJ4JItIposuWH+DY3RRnq8c
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=

The current implementation uses both DIRIN and DIROUT registers, but
the bgpio library expects 1 to be output direction, which on this IP
is reversed (0 = output, 1 = input).

To fix this, use GPIO_OEN_VAL for input direction register which
expects 1 = input, 0 = output.

This change should not affect any mainline users as none of them have
any peripherals hooked up to a GPIO.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 drivers/gpio/gpio-rda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index 7d20dbbb6ec41149a1dbf4d9ef9ac86449773c35..145b61fc83fb6eee2415e979a144616d81595736 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -243,8 +243,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 		.dat = rda_gpio->base + RDA_GPIO_VAL,
 		.set = rda_gpio->base + RDA_GPIO_SET,
 		.clr = rda_gpio->base + RDA_GPIO_CLR,
-		.dirout = rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
-		.dirin = rda_gpio->base + RDA_GPIO_OEN_SET_IN,
+		.dirin = rda_gpio->base + RDA_GPIO_OEN_VAL,
 		.flags = BGPIOF_READ_OUTPUT_REG_SET,
 	};
 

-- 
2.51.0


