Return-Path: <linux-gpio+bounces-30412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E978D0FCDA
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 21:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60C92300DD89
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 20:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF4E221F2F;
	Sun, 11 Jan 2026 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfBjUkCg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D91EBFF7;
	Sun, 11 Jan 2026 20:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768163365; cv=none; b=A9tAO5HA1P4696ikA1/UQL5bkzyD8eafhr3ZsTCsXqUPRWHIrM8eIKreLDgloDjIrseeL7r9752AV7ux8MGq6O8cITULPjorQbsifqRJHIpaEe5+UXbog9A/yLN+jESZAzRzTxq5Q/Ws+GXGgWh/vCUlfISrIHOANSABvYnqDS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768163365; c=relaxed/simple;
	bh=I1h+NucLnbjVmPVCT4uT86wnetjl/SKcrwLsxIVeUkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qmNw/1S86DRiffqleU8QaVOKs7M7OmNT4KMNAt1dnZo0/2MA9Qb8Ptgw2y2gNIiQk9LqBCRxCHFJHk7EMQSPMHrPg7UiiQ4CU9oFsDxUkwsdwhvSH+kcQRq3dIqh2aUZ/s0yHjcDw8641kWLaWgrpo4q3vxTf7LimWXTuJXIfzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfBjUkCg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2423FC4CEF7;
	Sun, 11 Jan 2026 20:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768163364;
	bh=I1h+NucLnbjVmPVCT4uT86wnetjl/SKcrwLsxIVeUkY=;
	h=From:Subject:Date:To:Cc:From;
	b=HfBjUkCgy0Qsv6xO0RAaKH2pRA1G9OjbIn5sECkRGIEmhTwA8UXIM5KQ2Q09G45UQ
	 DiL2NVtEMWBaWczYBSI0tB2Xy/sL6IKExaCADdrrXzcY1juoKBZaKDDhErPcoKW7Hk
	 1Jk2iO0+K4p/AyPWM/ClQHB14y9mFIozyZJZrapzflpDesjHPDjohdjFE6GE//nbJv
	 9a5OeyvKBfIGAfPnljynNQdB5f2FcAc7Ewoa8BbE/K8D6ZutrP7Mcc2LQx65YklVvq
	 t0vc+Jwh+9kzNrLYP9G0Nd3O9h4qNVILTNp8+gXs09UdBJy/Su2tUwNKC1BpDvVOfm
	 eemWCR7sUbstg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] pinctrl: apple: Fixup and RFC GPIO mode patch
Date: Sun, 11 Jan 2026 21:29:20 +0100
Message-Id: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBtw+iO6SrQQG20gzJQiCO+et
 PwW772QOAonmKoXIt+S5PAFVFdgNu0do6zF0KhmUESEOoSdMfKJLsiB9vIGW0XK6K7XRCOUMkS
 28vzXecn5A10+DbZlAAAA
X-Change-ID: 20260111-apple-req-gpio-func-3010ca45a118
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

This fixes some uses of the "unsigned" type to "unsigned int"
then propose to implement the .function_is_gpio() callback.

The Apple pin control maintainers can comment on this: I
am not sure that "mode 0" is GPIO on this hardware but I
find it likely.

Toggling a pin between a certain function mode and GPIO
mode happens on any sufficiently advanced system sooner or
later and this callback was implemented because Qualcomm
ran into it, so let's add it to the Apple driver before
the users turn up.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (2):
      pinctrl: apple: Use unsigned int instead of unsigned
      RFC: pinctrl: apple: Implement GPIO func check callback

 drivers/pinctrl/pinctrl-apple-gpio.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260111-apple-req-gpio-func-3010ca45a118

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


