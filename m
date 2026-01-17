Return-Path: <linux-gpio+bounces-30691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0949AD39045
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 19:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42C4E3007538
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 18:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B0629AB07;
	Sat, 17 Jan 2026 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgYncbyk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A61990A7;
	Sat, 17 Jan 2026 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768673182; cv=none; b=HNag3uX+xfpVo3iRAZVvughm9qDzayhxrw44NnT+FHSe4iBCONcwHszYyP5O+UeWVmtIM40iD08R1HdI37bNvG6m1wzAJrUn+MkhRfO1vDc+F9irPW4mr9lUZ9LuwI1y05sBEaFivOl11ab5V+o/Hk75J5Mkbb0E8h0RY2x4bQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768673182; c=relaxed/simple;
	bh=cl98fRzJpx1Su3BC+gmPlPuSNkWthTt3oj+5x7t/7DU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wl61iIC4Kv8XxdcRiw4/lUNxj8FpX9IJOS5xPAyKMERxykUmQgBoyN7ZQ2DyGvl+fATJZKHFWapOpL8VOxNz79xvqd4jmj2DG6LNZfIs8mIKO9SN7KPs5ljAH/oM5hpNNuHr3f7awf0EXT4JB1yMQ6XsHz/DJw3yewjKirl4vA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgYncbyk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5976C4CEF7;
	Sat, 17 Jan 2026 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768673182;
	bh=cl98fRzJpx1Su3BC+gmPlPuSNkWthTt3oj+5x7t/7DU=;
	h=From:To:Cc:Subject:Date:From;
	b=kgYncbykMcF1jvhmNLFnXIsNhn5CZWJbTmTXOY4+wrmAFJbJzQN7DPc8lfrxHCt4y
	 B6zpf3RanWbHy6jvcN/YNTwXU9KL9MMf45kMTMyl+iJfB8cHPq922imklZ9EBTDQvK
	 AZGepiFCPGTcf7iqVjxIaUnrdbUDmRYoM0ygCjpxXsZ4Pi6bBLXXS/97s5PrSq/a2t
	 14boQaloACuGrI68COv2ekyHIh5zhU15i09y6Iyx5ZES48q1Wi1LAWNbjP9k34i+RL
	 KtuscY2a4/3Bwg8hXMmI3FKX7gn+kCil3NP2Ob4SMQkMEskVlx/Lv7PcDJf47w4N0U
	 I1Q+opm+B9uVg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.20/v7.0
Date: Sat, 17 Jan 2026 19:06:15 +0100
Message-ID: <20260117180615.10368-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=krzk@kernel.org; h=from:subject; bh=cl98fRzJpx1Su3BC+gmPlPuSNkWthTt3oj+5x7t/7DU=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpa8+XzZHT/lR+wC8U0JISMdTDJIkzsXC+2RQSk LBSNLOI5OWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWvPlwAKCRDBN2bmhouD 18zKEACS0U4pf1JKunVpsA0p55oezfS35LSRATldmi+acFrp4YhmUjE7PKnDEf6Ko+lNj3a0/c9 306WnPjhTR3qZ5BMdD2gEAcG5qgsEv+haz3MLq82bEgA4Jc2ndNd9ehekqa0JCnUgsJzilKZdP4 DMpRALCHWgw6FTesiNSrKRkA2GJ5RnxtBSuXPYYfZwgiNBENrOhk5XLszAMWAsyrBZZ+yhLuA/I /CwzoKI0mvCnzgwPTaFw9uFtgvretoKeCLlruCL1AUK9mCg3fPDmWi/uiDtoJbmevtliBhsqTWR ZbVpcaq44JaF2YxQtDG/3vNJeJbNz/CHho8EbHNNNUmdUInV6Eln5elZ/KJKOyUETTvWwi8M9aI fFvlVPpbDnLtZ8hyvmvZUy/QobQnGuaxrFcMHa/zs43K5jiXdh12vIgb1jjvK++I4upLyEvC3KQ quwI3q7PHgOFlh5K32rGbexiWsb1IBsQN+uUw1qcYZmuOdl7QBQfEWcDal/6KKch9Gz6Oe/ZUP0 oUy5tvH8Z4f9bYGxEHZt+Og2zNeAVn94AmQmJZXZLrsIGJ4epRqLmnI9hm7wggkHcxIoeTEDj9d XYZAKqK1o5HRRMaNaVGpJu9RSrYsTQxlUgHmuZzMh/sjPdYrVjXWscn55DUNVyfvgcExpnQvSwR 5zLvajZfwQd4UtQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.20

for you to fetch changes up to 8c483209a6fc71a555fec4a0c99b05e46a5bd38c:

  pinctrl: samsung: Add Exynos9610 pinctrl configuration (2026-01-11 12:10:29 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.20

Add new pin controllers for Samsung Exynos9610 SoC.

----------------------------------------------------------------
Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 117 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 122 insertions(+)

