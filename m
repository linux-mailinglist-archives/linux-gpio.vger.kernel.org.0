Return-Path: <linux-gpio+bounces-13493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E439E4097
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B860280BEF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0A21A8F8D;
	Wed,  4 Dec 2024 16:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JU8rkgeR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947111A8F78;
	Wed,  4 Dec 2024 16:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331578; cv=none; b=Vf35of5ObK3Nf59CFIcLPUlyUjQfUh8PRodsX/0uaNTZWvvQY6LtyERIeFIKUgwfHa+NGgZLXJaeq8EYCI1k3Ltl8+ditDyewSl9i98jy03FXAEx05dNdgoKImDmYwlDVky1Z6ECWgUKdzghOzeMIPet9WhAtIrk7QYHRw3s0Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331578; c=relaxed/simple;
	bh=18037VPHjrQfoRCjqpA241S3N+eGlrVCeqY4BrrgXXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZ82tEN6nUOU9eXsPubVC0G9M4wLCfqj4HXDYkYmQVsGavncTatNUCzvom4xg2hNur9yFELmBciOEmQqlxDwtMX7r7/MkM+Hab41nav0L10kXbwHN49HAXxwe82YlHSHniy+co+i/F84LL7XSW3Xkwvz1dEuhDqDNjctHIAS9mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JU8rkgeR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A967C4CED1;
	Wed,  4 Dec 2024 16:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331578;
	bh=18037VPHjrQfoRCjqpA241S3N+eGlrVCeqY4BrrgXXU=;
	h=From:To:Cc:Subject:Date:From;
	b=JU8rkgeRlLa5ksY5hzRmUoe/zT7tzCCE5gjt0YjtTp2a6rUPOKXWto+pmzVspiaHb
	 AodGOlQfOCpHEMf0TTkVgKtgejoyPWX/9ldl/jVcNYrF/icn8So3TO4/f4cwpkMz0F
	 kueUTS3E87ScdDZrZQ5j5tSTWkcYSKP7EUboXeoXa3tr0MXwxHCukjwFEnDft+R8JL
	 xnFdBkffXh0TaNQhwfIrj1uILGo4MSf/9zQ7M1QkvVl3zoq3B8oJyW7BkJxlzax+dI
	 eTi9RxH27Kj0N/oazca/J16WgpqNYBDzJeQiMdmphd8I5j8/Mi51gpfKPwtil2cw9M
	 AKN+vOisUws6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Esben Haabendal <esben@geanix.com>,
	kernel test robot <lkp@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	shawnguo@kernel.org,
	ping.bai@nxp.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 01/33] pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
Date: Wed,  4 Dec 2024 10:47:14 -0500
Message-ID: <20241204154817.2212455-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Esben Haabendal <esben@geanix.com>

[ Upstream commit 58414a31c5713afb5449fd74a26a843d34cc62e8 ]

When PINCTRL_IMX_SCU was selected by PINCTRL_IMX8DXL or PINCTRL_IMX8QM
combined with COMPILE_TEST on a non-arm platforms, the IMX_SCU
dependency could not be enabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410031439.GyTSa0kX-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202410030852.q0Hukplf-lkp@intel.com/
Signed-off-by: Esben Haabendal <esben@geanix.com>
Link: https://lore.kernel.org/20241003-imx-pinctrl-compile-test-fix-v1-1-145ca1948cc3@geanix.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/freescale/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 3b59d71890045..139bc0fb8a9db 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -20,7 +20,7 @@ config PINCTRL_IMX_SCMI
 
 config PINCTRL_IMX_SCU
 	tristate
-	depends on IMX_SCU
+	depends on IMX_SCU || COMPILE_TEST
 	select PINCTRL_IMX
 
 config PINCTRL_IMX1_CORE
-- 
2.43.0


