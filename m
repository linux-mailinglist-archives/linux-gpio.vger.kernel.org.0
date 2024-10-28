Return-Path: <linux-gpio+bounces-12229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19879B3103
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 13:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95B86282674
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 12:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BD61DACB1;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exdbz+qI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32191DA2E0;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119857; cv=none; b=f4JuuURxclJWbCGSPxxMpinZRpRYCz/WRFaVfInHsCHXT1eOPGPpS05DMgPz8aZPJF65ZyQQKkRazLeb41ZI4NSlSWDmGBKAaKDkHV+ZwHcukVDQYN8BJx0Mkr8469hTapp/9e9MrImBNgztP+Jx5jFJnP5+W2kEaX2ugaGYUe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119857; c=relaxed/simple;
	bh=Jcyo6teZNNn7H5N2v8qLFEqZ7T18pGwOQNXKnbfnY3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e99v0dd2O7eB9Wh8oVk170KYHC50kUNyjE+27gw+46AkQCMENgcQ9H2/4nF5lVoJYMa9LUHuGh+WRO+xqbhXGL41rsW+FeF0aZUiN3KlharX1CEam55/fdxO0Ja4FoCOPVYDVOa0yWsmuFPDasITchj4174Ipq2SRwxeQFKpc1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exdbz+qI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E79C4CEC3;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730119857;
	bh=Jcyo6teZNNn7H5N2v8qLFEqZ7T18pGwOQNXKnbfnY3c=;
	h=From:To:Cc:Subject:Date:From;
	b=exdbz+qIWJTWcQ7hNYVuFf3hbKggwcEYvCdjC6PyGNX8HaC5jkmMf07nMX1HGnZPe
	 nwo0GIozEnSoEgkLMZdwaZyK4crNbdyNfcRo+fE084ff88JQ4pxET1fTgY6tPpAMSc
	 BstRrqiX6s0ZX5xO2HRiFRV2V9u6PXnK8PQ74yL+WmM96l5xgPOPp+XIfRDtn0doXc
	 lUihuc7VBVqzlKW5bSR4pv9qr+HkxhJy4vK16QYzTFS20KNd/tA6CqfjdduTJHv2Sd
	 Cxm2BRU7HqkFA/lPUosDZIaW97iC5oGhDm1GMXAJDA+YFjcJCGfrPpauOG1xhqN16M
	 zuzVdQADfqUZA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t5PDG-000000006IA-2ssU;
	Mon, 28 Oct 2024 13:51:15 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/3] gpiolib: fix debugfs newline separators
Date: Mon, 28 Oct 2024 13:49:57 +0100
Message-ID: <20241028125000.24051-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've noticed this before on some systems but never got around to looking
into why the gpio debugfs newline separators are sometimes missing.

On recent Qualcomm machines with 10+ gpio chips this can get really
annoying when a third of the separators are missing (e.g. when verifying
pin settings). Hence the CC stable tag.

Johan


Johan Hovold (3):
  gpiolib: fix debugfs newline separators
  gpiolib: fix debugfs dangling chip separator
  gpiolib: clean up debugfs separator handling

 drivers/gpio/gpiolib.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
2.45.2


