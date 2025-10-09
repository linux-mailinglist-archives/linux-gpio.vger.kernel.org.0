Return-Path: <linux-gpio+bounces-26946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E3BCA111
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 18:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AE201895D93
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 16:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A60C2F3C03;
	Thu,  9 Oct 2025 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpnBGlXC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B032FB614;
	Thu,  9 Oct 2025 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025647; cv=none; b=I+d4CmvoTSVO3y3WyBreiIti7uJZZ6+gMmnoJaWgImpvc0VsocIb8Y8/3uFhYlLRkb20z3xiUrhKUu2i4WzdXhEh2k4t4gVrx7BSYhOHeqWnpFcLlgCUwyibNAkNdvkSVu3ptv0fDxF2jIahgCZ9bqsgkc5zUxMmQXD5uD6H8T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025647; c=relaxed/simple;
	bh=I3XVcHHeXBgmKSqbpjjMJBCBfyKHzLlJJavBhAHaEYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8G0Bs39Pjbw7qGzpBxwQy7z80EgEmLuyb4H4Mpi61AnpfawMuf9k0obitveCkYhZ6M7EEES0SfeV7dlChbwbFaN/PDBBbu4f5DTHp6K+TZFeqLtCjRJByKAmFt8O5KKc+sezYasnlrU1QLhkLQm1jSg3Hay6M4gVEaIAzWQcfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpnBGlXC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37849C4CEFE;
	Thu,  9 Oct 2025 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025647;
	bh=I3XVcHHeXBgmKSqbpjjMJBCBfyKHzLlJJavBhAHaEYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SpnBGlXCalV3sAmXITt6Uo1NhSuTqmNB4wLtOiuZU2v4ngvOJ6HsE/yxiClQ6cU6V
	 JPI05PejyYWSk+tXbuwxIP6v8fSXx0vwMqSSwGXKyIqqS47Tsyh5AZFMfujcnYyJlm
	 jQuOckfdfHUQhJYn/jmfLavPkyC4MQQD209OMvjy+vvaE0WjLUzJkCx4oDNkPALlIK
	 tDGvlRP9T0zT0hMiWLfKnsurmrsaphlFnDQDA5Erzs+WwR1UC4Ohyaoh+I+rUCZLXB
	 WPgk5gc1uAPHBI5Zo/dNRb6QVl4x7+oaoUqYNHNBGv6QA8b1GqMn6ud8wNOt1CfSCS
	 gHYNA9FOUfDUA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.6] pinctrl: keembay: release allocated memory in detach path
Date: Thu,  9 Oct 2025 11:55:59 -0400
Message-ID: <20251009155752.773732-93-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[ Upstream commit aae7a2876c3b39d07aa7655ea082af8e7862f3a5 ]

Unlike all the other allocations in this driver, the memory for storing
the pin function descriptions allocated with kcalloc() and later resized
with krealloc() is never freed. Use devres like elsewhere to handle
that. While at it - replace krealloc() with more suitable
devm_krealloc_array().

Note: the logic in this module is pretty convoluted and could probably
use some revisiting, we should probably be able to calculate the exact
amount of memory needed in advance or even skip the allocation
altogether and just add each function to the radix tree separately.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- `keembay_build_functions()` currently grabs `kcalloc()`ed storage for
  the temporary `struct function_desc` array and then drops the pointer
  once `keembay_add_functions()` runs, so nothing ever frees that memory
  on driver unload (`drivers/pinctrl/pinctrl-keembay.c:1609`). The
  original driver commit (`ffd4e739358be`) introduced this leak, so all
  released kernels inherit it.
- The patch converts that allocation to `devm_kcalloc()` and the resize
  step to `devm_krealloc_array()` (`drivers/pinctrl/pinctrl-
  keembay.c:1609` and `drivers/pinctrl/pinctrl-keembay.c:1640`), letting
  devres reclaim the buffer automatically on probe failure or device
  detach instead of leaking `npins * 8 * sizeof(struct function_desc)`
  bytes each cycle. The explicit `kfree()` in the error path is removed
  because devm now owns the buffer (`drivers/pinctrl/pinctrl-
  keembay.c:1642`).
- The driver already relies on devres for all other dynamic allocations
  (see the existing `devm_kcalloc()` for function group names at
  `drivers/pinctrl/pinctrl-keembay.c:1569`), so this aligns the
  remaining allocation with the established pattern. No behavioural or
  ABI changes accompany the fix, and `devm_krealloc_array()` is
  available in current stable code.
- The bug affects real users whenever the pinctrl device is unbound
  (module reloads, hotplugged firmware, suspend failures, etc.),
  steadily leaking kernel memory. The fix is self-contained, low risk,
  and directly targets that leak without touching shared pinctrl
  infrastructure.

Given the tangible bugfix, limited scope, and minimal regression risk,
this is a solid candidate for stable backporting.

 drivers/pinctrl/pinctrl-keembay.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 60cf017498b32..6aefcbc313099 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1603,7 +1603,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	 * being part of 8 (hw maximum) globally unique muxes.
 	 */
 	kpc->nfuncs = 0;
-	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
+	keembay_funcs = devm_kcalloc(kpc->dev, kpc->npins * 8,
+				     sizeof(*keembay_funcs), GFP_KERNEL);
 	if (!keembay_funcs)
 		return -ENOMEM;
 
@@ -1634,7 +1635,9 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	}
 
 	/* Reallocate memory based on actual number of functions */
-	new_funcs = krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
+	new_funcs = devm_krealloc_array(kpc->dev, keembay_funcs,
+					kpc->nfuncs, sizeof(*new_funcs),
+					GFP_KERNEL);
 	if (!new_funcs) {
 		kfree(keembay_funcs);
 		return -ENOMEM;
-- 
2.51.0


