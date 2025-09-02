Return-Path: <linux-gpio+bounces-25372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 325C5B3FFF2
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 14:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A15C4E7D02
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 12:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4F3303CAC;
	Tue,  2 Sep 2025 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfyuwHyp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407512FB973;
	Tue,  2 Sep 2025 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814918; cv=none; b=j9ccCMfpb1Nk/zsjL0cm3HVEm5uGUVhNPKoCokylIxTdc56jKnMKsc+rW56uu3piKhQJEmhzJTKUX4DsHEreg4jXspDXEsN5o0LA99QGsFBQPo4LKts3Rnd0UUw5PbC6p4ejPPPyx5zmY7AWc63SwVqVM+pEvxQpgdMAntC7CJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814918; c=relaxed/simple;
	bh=757pey5fnEg/qeq9CPxzMrLDiz9/8/oYvMF8D6dGc30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7WjBiSmnFgoKqTiPuTa3z0HRzZabVnPMarFGf4V1CFMtp86F5j+nXnPz6OHh23P8XBWga8TV7nDoCkNbv3kccj7vXyLhWd9juf6u8GH4kNTmsMyU40fX+4rQ9klNb/gnpILYkfB1oOIctv4piex7yPDuqufdjLxuiL1JOU2VaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfyuwHyp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7627C4CEF7;
	Tue,  2 Sep 2025 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814917;
	bh=757pey5fnEg/qeq9CPxzMrLDiz9/8/oYvMF8D6dGc30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sfyuwHypWYSuAc0P6oMVNGBTCH4OCNymSjUysZLo4FjzWYj2V0Z7LyHxATqIXKDrx
	 DcdeIoRWSEZGu8+amagySS7gT9WngVj6XzfCqEVZiXwvO2u/pdbCWNdYIfmroY4ELj
	 ZBXBUti33S6pJXFsQuGsxLb2Jne+hrNYAhCntdn+LEZkzgJULTNc3I4RX4cmzLog36
	 EcfeinLB8Bk7BzJCJKYCHtnVDDaaHZNurdq5CfSmS9fXYPbQe8x5CP/Hx5Lv8JIdHN
	 5FMlG4wO3UMSzdI217+0223NMHbCO9OoE8F/vVW1GPZATc0AJHmaBHeepnxLSpLJG7
	 BpBWt1wp5oqQA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexey Gladkov <legion@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16] pinctrl: meson: Fix typo in device table macro
Date: Tue,  2 Sep 2025 08:08:13 -0400
Message-ID: <20250902120833.1342615-2-sashal@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902120833.1342615-1-sashal@kernel.org>
References: <20250902120833.1342615-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.4
Content-Transfer-Encoding: 8bit

From: Alexey Gladkov <legion@kernel.org>

[ Upstream commit bd7c2312128e31d056d30d34d60503de056e15f0 ]

The typo when using the MODULE_DEVICE_TABLE macro was not noticeable
because the macro was defined only if the module was built as a separate
module.

Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507220009.8HKbNP16-lkp@intel.com/
Signed-off-by: Alexey Gladkov <legion@kernel.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://lore.kernel.org/e548b7761302defec15aa2098172eabb1ce1ad4a.1755170493.git.legion@kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Clear bug fix**: The commit fixes a typo where
   `MODULE_DEVICE_TABLE(of, aml_pctl_dt_match)` incorrectly referenced
   `aml_pctl_dt_match` instead of the actual device table name
   `aml_pctl_of_match` (line 1022-1025 shows the table is named
   `aml_pctl_of_match`).

2. **Prevents module loading failure**: This typo would cause the module
   to fail to load properly when built as a loadable module, as the
   MODULE_DEVICE_TABLE macro creates an alias for module autoloading.
   The incorrect reference means the device matching wouldn't work
   correctly for module loading.

3. **Small, contained change**: The fix is a simple one-line change that
   only corrects the typo - changing `aml_pctl_dt_match` to
   `aml_pctl_of_match`. There are no architectural changes or feature
   additions.

4. **Low regression risk**: This is a straightforward typo fix with
   minimal risk. The change only affects the MODULE_DEVICE_TABLE macro
   invocation and doesn't modify any functional code paths.

5. **Affects user functionality**: When the pinctrl driver is built as a
   module (CONFIG_PINCTRL_AMLOGIC_A4=m), this bug would prevent proper
   module autoloading and device matching, affecting users of Amlogic
   A4/S6/S7 SoCs.

6. **Recently introduced code**: The driver was added very recently
   (February 2025 based on commit 6e9be3abb78c2), and this typo was
   present from the initial submission. Fixing it in stable trees
   ensures users get a working driver.

The commit message indicates it was caught by the kernel test robot, and
the fix has already been reviewed by the subsystem maintainer (Neil
Armstrong). This is exactly the type of bug fix that stable kernels
should include - it fixes a real problem, is minimal in scope, and has
very low risk of introducing regressions.

 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 385cc619df13c..95525e66e5c00 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -1023,7 +1023,7 @@ static const struct of_device_id aml_pctl_of_match[] = {
 	{ .compatible = "amlogic,pinctrl-a4", },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);
+MODULE_DEVICE_TABLE(of, aml_pctl_of_match);
 
 static struct platform_driver aml_pctl_driver = {
 	.driver = {
-- 
2.50.1


