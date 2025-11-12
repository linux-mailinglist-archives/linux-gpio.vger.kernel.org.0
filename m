Return-Path: <linux-gpio+bounces-28414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1365C5402E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 19:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B7013B077A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 18:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA15534404F;
	Wed, 12 Nov 2025 18:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A995IPFp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E14F2D837C;
	Wed, 12 Nov 2025 18:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762973079; cv=none; b=uuIdniiTcC0OVB3bsqhOIXIk7FRkYQZQlwR2keXNerrnTt+PG9KQHPaDu2HVEUqNG15K9g42I6laEVVzRSh3wP6/y6eLByDYuqbqfdiwJ2zdKdIX7/3ElhpuUyycU5jKhXleUEAWxxqDZwUvbClJnhgJ+zW+Z89H9MK8vOQ6l5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762973079; c=relaxed/simple;
	bh=055fA2CcwKNGCqakO62I6DCYxSUugUIeFCK4IyWOGVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lCAicJTtuFchIhSrVEjK7pf26SJ0r9/G7yj8hSNqLCZZ261vsuqtzan28+ZXnqnN74WkK1sRWJoMFU7S4qwwWQc2WEbBGfOU8RtOe1lObYucKxgi3ODFwv2A4tWrbDkhUPsI+w2FAyW8kCodPSetp7OdR0YTZQoj8OOM//+Xduk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A995IPFp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961ACC4AF09;
	Wed, 12 Nov 2025 18:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762973079;
	bh=055fA2CcwKNGCqakO62I6DCYxSUugUIeFCK4IyWOGVg=;
	h=From:Date:Subject:To:Cc:From;
	b=A995IPFpTapVlJqGhwaAGw7ocQ0uSewMFDBBtyk/BARi8MMR+cA6dsgCYGiNXIE92
	 QdoFNxhg6k4otIJmkKSGNernxl7SW5/5f4/BCgg9532ZL/JaEtqWDXzwAZrS4rah8L
	 +aJrO/gdz4vp9iKRGafW6voDJ3QD1ETuJiQG14wO43H2Dao2q9bRva+QSC4X3+rsT6
	 ezgXhParowvCx/yKoCVXDjdfIs26fpujzTVG7+zj41pLJwPDOa5VAKH3zAEfpoQL9x
	 2j6MrBHdg7iBpgj6BOc+gr1mZf3VLDhlHWhq7RovvvLOCSZAYFIIJe4a6aqOUdOI05
	 UGCRHep8+/4rA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 12 Nov 2025 11:44:30 -0700
Subject: [PATCH] pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in
 an7583_pinctrl_match_data
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI3VFGkC/x2NQQrCMBAAv1L27EKSGhS/Ih426aZdkE3ZaBFK/
 97gcQ4zs0NjE27wGHYw3qRJ1Q7+MkBeSGdGmTpDcCF67wOuovljbySxuhAW+SHpLd5HnEw2Rg6
 Yq5YZv426nVK55lKCS9FBj67GXfkPn6/jOAGR+b8jgAAAAA==
X-Change-ID: 20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-bbf4cff20b50
To: Linus Walleij <linus.walleij@linaro.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870; i=nathan@kernel.org;
 h=from:subject:message-id; bh=055fA2CcwKNGCqakO62I6DCYxSUugUIeFCK4IyWOGVg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkiV6fY70/MEmkRqhM71vLBzL0kvufblMQer7viT7N6H
 zO2xYl3lLIwiHExyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgIn84GVkWLlfgW3R/fOeiTdq
 54Vzn2Wf+df0bOzvrqrujLPak2fnazMyXOJbaVHMqD7nyLf2SH/N7Nkiu00XX1khNe2n8b9dXP6
 ybAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang warns (or errors with CONFIG_WERROR=y / W=e):

  pinctrl/mediatek/pinctrl-airoha.c:2064:41: error: variable 'an7583_pinctrl_drive_e2_conf' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
   2064 | static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
        |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Due to a typo, an7583_pinctrl_drive_e2_conf is only used within
ARRAY_SIZE() (hence no instance of -Wunused-variable), which is
evaluated at compile time, so it will not be needed in the final object
file.

Fix the .confs assignment for AIROHA_PINCTRL_CONFS_DRIVE_E2 in
an7583_pinctrl_match_data to clear up the warning.

Closes: https://github.com/ClangBuiltLinux/linux/issues/2142
Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index bfcedc7f920b..706532a820b0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2993,7 +2993,7 @@ static const struct airoha_pinctrl_match_data an7583_pinctrl_match_data = {
 			.num_confs = ARRAY_SIZE(an7583_pinctrl_pulldown_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
-			.confs = en7581_pinctrl_drive_e2_conf,
+			.confs = an7583_pinctrl_drive_e2_conf,
 			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e2_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {

---
base-commit: 57916750bc0886917ea2c6209ca6a56acb7b8182
change-id: 20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-bbf4cff20b50

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


