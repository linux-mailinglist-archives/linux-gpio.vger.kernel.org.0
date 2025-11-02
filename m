Return-Path: <linux-gpio+bounces-27921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A9C28D3C
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 11:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4DFF1890740
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 10:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3221323D2A3;
	Sun,  2 Nov 2025 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKHUUqVC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05701A9B46;
	Sun,  2 Nov 2025 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762078981; cv=none; b=oyLeOg8ia2rKI4eglEomcGeL+zwRnidMOmeRR7PYxOme31JFAytohkgZiiRdezp0UgMHmlOunIWE0kBcwKj3pc+pmtN/UwFiT66D9qCLFQtny8HJpSknCPiUrvwvgPAGfx8Tj4AZDc7L5GyJJh1bZRhuuBIN2ByAqiF5YzLq970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762078981; c=relaxed/simple;
	bh=XRnIS9mP5cAoHKkZu2VpskmgQMRi7mWp2UaOQCyhs+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=teKdC46QcgEQIG6rhYA8z7BnFghnCM82rtjHUTfU+uTRyIUasCHwKgNxEANIaC5v9X4oIX6IO5IqIs5SpnFFuEptFM7SbRQPFK0gkH3djZ9W2WSoKBkohess0iShqHrvC6i3ZIEjlm7vZSLRVfasuXtfYCWZJ9BeBb+/Z9ROV8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKHUUqVC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E7BC4CEF7;
	Sun,  2 Nov 2025 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762078980;
	bh=XRnIS9mP5cAoHKkZu2VpskmgQMRi7mWp2UaOQCyhs+U=;
	h=From:To:Cc:Subject:Date:From;
	b=VKHUUqVCSXnCVGJvdolfSv8L9Lnexs30PZXvZx/1DN8+87jAOC/BY3rfptYws1f/M
	 cI+2+56Hw9yGy1sHl3vufo7iR99ZdeSFIoN3m4mg1bSK+0VUye/vaSGpsz1lCu6Jll
	 +CAIAkO4wXLdKy6jVUR7L56leHFMRj+qZjuWVuCtB6etTP9dORY09ZCWpctWxUjjR4
	 KawSa6/3gMaEHAamaGW53UiHYe5EMeCXcUqQGLV7UfOg8IOgqpvHgoAelr5IRObnvp
	 iVjzV6Iydv7gBstM0JjknFTI+TCreWFtSCkAmnlgCiRpCGAOhLbYAzk3p9QXb7EeZd
	 GcyZCpiM/iLjw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] gpio: fxl6408: add optional reset and suspend/resume
Date: Sun,  2 Nov 2025 18:05:13 +0800
Message-ID: <20251102100515.9506-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two improvements to the fxl6408 gpio driver:
Add opitonal reset gpio control.
Add suspend/resume support.

Jisheng Zhang (2):
  gpio: fxl6408: Add optional reset gpio control
  gpio: fxl6408: Add suspend/resume support

 drivers/gpio/gpio-fxl6408.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

-- 
2.51.0


