Return-Path: <linux-gpio+bounces-28325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C76F0C49398
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 21:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2E9B4E6314
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0A32ECD06;
	Mon, 10 Nov 2025 20:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCUQg3vL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CD2E8B60;
	Mon, 10 Nov 2025 20:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762806475; cv=none; b=EczMQSO73kB4KrZkymW3b6y8D2utYLctfHcDCl8yyP+2CtVNwnSIIhkc1qZ4HbfQGSeyKQqHRkm/yFRoDJYEgjyHBWxL30soxd8t5VzfGYDdTanFpKQSP37okXl3bd0po0/241I4pjs42rMSrOTuTeUk4jfk7mBtTelz1pq2rHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762806475; c=relaxed/simple;
	bh=xqht5VPTMHaX/GKxsh9FtHie1CtnNQDDC8CGQ8gGXr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QdiEvg2iQnxpose2uqHX6C8x5sxjOozzX9uAMvo2FgZgvhW/XbpyDme4Z333MRJjoXxCaH0AWp+HPQV1VtvnJrGzKcbWwg2fcms/obOZ7vpeSMySbYVoYhpRFgEElGxdYB+kdVOPclbvI2U4Zngmi2WDqSPdaRmhTR8OQ8hDFew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCUQg3vL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34040C19423;
	Mon, 10 Nov 2025 20:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762806475;
	bh=xqht5VPTMHaX/GKxsh9FtHie1CtnNQDDC8CGQ8gGXr4=;
	h=From:To:Cc:Subject:Date:From;
	b=HCUQg3vLPwQzlucTGF4oM4w6xX3PkWVbCkeeYQ3xDLcMdKXVI+rx1Hqc6906H2/oS
	 ffkOChOrZQ7EJ/WXuQkCxksbLlIXswN1RxFDub1facaE5Ij1kX2EigYLiecaNHleTD
	 LP35Joo5tOBsh8Wtn+x4bPap3wxpBb+gbqF/Jkq4EG2Reagb9whF00/ZjP0Bf/UVCt
	 n29Qky/NBvtjSzAY2TfGPp/dFB2/JOoYeqCiIHVwVB5hb4Nxr1+uet/kIxVAy+391V
	 lHBSX6jMVP9M4KORxi2nAOT2n5D54npZkX2UN3Q8G5hf4+coDwyVqYTu7X5dlyOpa5
	 IIzBgTOc8dgTw==
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
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.19
Date: Mon, 10 Nov 2025 21:27:48 +0100
Message-ID: <20251110202748.10090-2-krzk@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=krzk@kernel.org; h=from:subject; bh=xqht5VPTMHaX/GKxsh9FtHie1CtnNQDDC8CGQ8gGXr4=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEkrEmX3ZkmzBioa40xqUoItANOt8+TThg8hQP SBHRD59ALCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRJKxAAKCRDBN2bmhouD 1z5mD/4lksCWQrylzIsRpv9BV8fo0E2sLlWT/KHglodP+t+Qa9oz7X3LDDvbzEqVhRfhqaM8Uh4 WIU+ARcRyvtOKfFM1N/+cOOS7X9+CP1JFtjKwicjlDu+hvT29NwudnUDoaRDEDhxqAgJpN65m6Y ZpFOeSIFCn5eI4COVsIPTBtpmuwcYFOx7kmT22jKxpZNRWTRu8pQMOCssdf2NcNi5CWjaIORb8k GBTM1op3GNFpK/9v2HpwURHHhXuq/zZMGDFYcSdFqThtCN45vJixBiXpJqUU1iYeE+FK2a9NNyS jnwP11IVEPnyOVVCFFVnRY86eeLMupAKu2hoJi7mAY5gR/pj611EegK0JSx2KDujjkspZQsRtBN 4GZjUHx1FlnQqT0s/oncObxD974VeRo2lv9RzmUHP6MPqgR9tVr/em1KbRi6S7R7RJSepxZXx5O QVCzX+QlK0REKj7CSlEwBTOl3jW/o83JAAHbk0OF6qGbR8XtYiH3knbRIvO7njolWUFWpcOqyts MPEaHzGrcEg2hACDrN9jP6K2jUpRpFxYDrSLE/gDyY4yM5ArboV5wr/2x6KG+ZGbtsfX7nWA9H3 Y9tOdeIiPQEs6J2ACsI9P/fTX3OcqvDFRuzJ3qXL6as7g+69Ja1fy4tWZ9bGwqUJLYWiljs4mSO HJeIm/FzxegdlQw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.19

for you to fetch changes up to 3cfc60e09bdc95483875f0b63cfdc23aea67135b:

  pinctrl: samsung: Add ARTPEC-9 SoC specific configuration (2025-10-13 03:02:21 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.19

Add pin controller support for Samsung Exynos8890 and Axis ARTPEC-9
SoCs.  The latter is a newer design of Artpec SoCs made/designed by
Samsung, thus it shares most of the core blocks with Samsung Exynos,
including the pinctrl.

----------------------------------------------------------------
Ivaylo Ivanov (3):
      dt-bindings: pinctrl: samsung: add exynos8890 compatible
      dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
      pinctrl: samsung: add exynos8890 SoC pinctrl configuration

SeonGu Kang (2):
      dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-9 SoC
      pinctrl: samsung: Add ARTPEC-9 SoC specific configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   6 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 206 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   4 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   2 +
 5 files changed, 218 insertions(+), 1 deletion(-)

