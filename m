Return-Path: <linux-gpio+bounces-27227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD53BE5FF3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 02:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A4AE5E61EF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 00:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC4A19ABD8;
	Fri, 17 Oct 2025 00:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6k4geBv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBFD288D0;
	Fri, 17 Oct 2025 00:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760662699; cv=none; b=OUhyNRL7vbqb+90ccAMu+uSHMHw+jZXre0IOj7noIxdQxiqcH8bUJWL9rR/uRuuU1NglKxCsppuhMIhZaiKN7eQ67b6Tev2Hcz3LoLTU9PMjmkRHEKiyy277yanzUG7LP85LNH69GxcF0EhunnjCITULrPn4mNZA6SZDoW3B6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760662699; c=relaxed/simple;
	bh=ukvOLIWMm0r8vNuROHP6LgTgsINp016v4Eb8vsfzs5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r2Ugm+dIiVS3RVD/2q2PnbgxcqqVX40sSYebCRU/VUaWlRFLDFFO3tOD73jig+qwTuWQP8g92mIzZ7l1mRcAKGkyUJrghJhv03VJUEeLq/0VcYHkKPu/bIY/5kBtYKs16Jd/m/b3uSNk1LYZNk0TTvuGba1sORtw30we5RV9YeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6k4geBv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C8DC4CEF1;
	Fri, 17 Oct 2025 00:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760662698;
	bh=ukvOLIWMm0r8vNuROHP6LgTgsINp016v4Eb8vsfzs5Q=;
	h=From:Subject:Date:To:Cc:From;
	b=Q6k4geBvVd5BcSJZ07QpZniRdo3Z+2WAUYjOHpD+4Mee/IT1AD7SNQg9EUGv3DU+D
	 gwgyn8z7bfIPog1aWQ1+u9/EwgJC88TcWy9p/hNVSHNInn1b1EOj7OoK41moTgKzDM
	 GxHlCCILC09aH7P9Gwg7HzPrb9FZdFfFstwiGWrLH9ksZdPp8TEZwnw1BYVZWuID6b
	 +gbe9mck292ydNl309Q3zJkBBhuqWJPdS28oQMIcsCR/gYJnCF+1zgwQUNSW4B4nqm
	 Nu1wxv4NIkufoPyt2UnO4cwyYh0XFs0B+lfJgid8bo/7LPydqFikopPggKYCS3F1TP
	 wE6g4SIZVIksg==
From: William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH 0/3] gpio: idio-16: Fix regmap initialization errors
Date: Fri, 17 Oct 2025 09:58:00 +0900
Message-Id: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJiU8WgC/y2NTQqDQAyFryJZGzADau1ViothjNMs1GmmloJ4d
 4O6efA93s8GmVU4w7PYQPknWZbZgMoCwtvPkVEGY3CVq6miFkf5Y0yymG9CDSrHySck93BhCHX
 jqQNrJ2WLnsuv/mLlz2oH39vc9wP4qstLfgAAAA==
X-Change-ID: 20251017-fix-gpio-idio-16-regmap-1282cdc56a19
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>, 
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266; i=wbg@kernel.org;
 h=from:subject:message-id; bh=ukvOLIWMm0r8vNuROHP6LgTgsINp016v4Eb8vsfzs5Q=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDBkfp6zkTDjQv8Bzpr5Q6G/rV8yKl4r4e8pPH/zuZlk8i
 /Pr/pkLO0pZGMS4GGTFFFl6zc/efXBJVePHi/nbYOawMoEMYeDiFICJ3DBi+MORPVfteM2DE7Wa
 KSsuZimcvH37h7VRvTqXYWbpjtdHlp1k+B8WVf30p+BSXi6LpZ+qFde9C1qRftj549+2vt16WXc
 01jIBAA==
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

The migration of IDIO-16 GPIO drivers to the regmap API resulted in some
regressions to the gpio-104-idio-16, gpio-pci-idio-16, and gpio-idio-16
modules. Specifically, the 104-idio-16 and pci-idio-16 GPIO drivers
utilize regmap caching and thus must set max_register for their
regmap_config, while gpio-idio-16 requires fixed_direction_output to
represent the fixed direction of the IDIO-16 GPIO lines. Fixes for these
regressions are provided by this series.

Link: https://lore.kernel.org/r/cover.1680618405.git.william.gray@linaro.org
Link: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
William Breathitt Gray (3):
      gpio: 104-idio-16: Define maximum valid register address offset
      gpio: pci-idio-16: Define maximum valid register address offset
      gpio: idio-16: Define fixed direction of the GPIO lines

 drivers/gpio/gpio-104-idio-16.c | 1 +
 drivers/gpio/gpio-idio-16.c     | 5 +++++
 drivers/gpio/gpio-pci-idio-16.c | 1 +
 3 files changed, 7 insertions(+)
---
base-commit: eba11116f39533d2e38cc5898014f2c95f32d23a
change-id: 20251017-fix-gpio-idio-16-regmap-1282cdc56a19

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>


