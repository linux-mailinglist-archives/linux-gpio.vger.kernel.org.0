Return-Path: <linux-gpio+bounces-8490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E14943633
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 21:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6713D2846B5
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 19:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE5116DC3F;
	Wed, 31 Jul 2024 19:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1CIpg6u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C716DC3B;
	Wed, 31 Jul 2024 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453244; cv=none; b=hAzzgvVX0+EhNBZ6LfUdNV5KGlZVlx1qPAk0Df90BYYvh7UKKXC9qSjIcN7Sgr6aO5rrJkRx5lxAjyTBqVS+r8wloPeMyxHXAm3KZD+JpsKV7yQ0xiCsuwtqGiWwi7Mg8A1ek27C0ei9H8R4iDqYiwRYU20gQovqS2VlCn8ck/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453244; c=relaxed/simple;
	bh=1c8G2pZa29Ew7kwVpnYpj8oBYtzfUhHAnb6RGT6xepI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/gsJI5LTR7IZAQ+lWKINyZegTRISEp862eazkayvUU98gFe9eIXRw8f0gzLXcj2iJeVOd4fb1uc2u/bu1Mty2iBr167tKQn0onzJBiUv5P/nIFgr7wgsqNcQTbMu+16y7YJdn0W2fMfd2L88blfBrCVn1iYozZUslOGhMUK1O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1CIpg6u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96322C4AF0C;
	Wed, 31 Jul 2024 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453243;
	bh=1c8G2pZa29Ew7kwVpnYpj8oBYtzfUhHAnb6RGT6xepI=;
	h=From:To:Cc:Subject:Date:From;
	b=n1CIpg6ug7GHwMQY90/n8p498muCtyLRnJpWeX+6l3bP8+L2LOKRi962Zl6N4BYo3
	 2E6eHHteDrhcW2yZJx8oVAjfCT78IWt6iid9qFuc/E4XQBxZU0QLyxIEyW6ymm/lpN
	 dn/vO913nj28ytrmWvOG+1RX18M3FX2W/jYph/a74ZqIACylt+Vti8sTOOqNTKsvzi
	 0Aec2w8KUuSoAZ6yjQncf/6xPY0yywnsT7oE6iwBSa2gklg4jsl45sbHzE98y7kYwG
	 0PKOzOloSgq16Ls+Wtzzp9cOQHnluOOQ+EQOG5jewNxnUZNDB3Wl9y+ww3NJmriRD5
	 kUvu9pJw1Jilw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: samsung: Use of_property_present()
Date: Wed, 31 Jul 2024 13:12:54 -0600
Message-ID: <20240731191312.1710417-16-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_property_present() to test for property presence rather than
of_find_property(). This is part of a larger effort to remove callers
of of_find_property() and similar functions. of_find_property() leaks
the DT struct property and data pointers which is a problem for
dynamically allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 623df65a5d6f..855d6d99a253 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -823,16 +823,16 @@ static struct samsung_pmx_func *samsung_pinctrl_create_functions(
 		struct device_node *func_np;
 
 		if (!of_get_child_count(cfg_np)) {
-			if (!of_find_property(cfg_np,
-			    "samsung,pin-function", NULL))
+			if (!of_property_present(cfg_np,
+			    "samsung,pin-function"))
 				continue;
 			++func_cnt;
 			continue;
 		}
 
 		for_each_child_of_node(cfg_np, func_np) {
-			if (!of_find_property(func_np,
-			    "samsung,pin-function", NULL))
+			if (!of_property_present(func_np,
+			    "samsung,pin-function"))
 				continue;
 			++func_cnt;
 		}
-- 
2.43.0


