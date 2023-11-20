Return-Path: <linux-gpio+bounces-295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1AC7F2051
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 23:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2653B1F26388
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 22:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C963A27E;
	Mon, 20 Nov 2023 22:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJEQgwWO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB6C3987B
	for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 22:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402C8C433CA;
	Mon, 20 Nov 2023 22:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700519320;
	bh=lm7/gVjjO8J4rGGfH0O5RParZfMnIY0MkOc5Mwd5oTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nJEQgwWOw+C7D8EhdvrVMZGCGeW51hRnSqEgzzkovWfmgQZMVejOyWW90TicHb9cR
	 gSuTbi++TH6DeMRHW/0c5TzfwIwNeGFQI1O05cgt+tppgBXm5jGFvRdjVgl7CEQPSG
	 j34REcfh1n/ag9wx3CAbciOYaMpeSuTe626Yp/Sb2pNWrJWSJBYXuFiwTDY4NGDxjh
	 I/i0WB+FRhUzRsrM2jO4NFPJpU4YMC2hdETD5U/ddBm1Ld6E0JV0RSvHSttknPFIbs
	 /rxAFZzE2O7NnLymcPwM08tbl4uXprn6CswuwexRlXliDejuQl35/tfySjABuERuhH
	 KRpgUP7nAUk3A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] pinctrl: pinconf-generic: remove the special handling for no config case
Date: Tue, 21 Nov 2023 07:28:32 +0900
Message-Id: <20231120222832.4063882-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120222832.4063882-1-masahiroy@kernel.org>
References: <20231120222832.4063882-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To further simplify pinconf_generic_parse_dt_config(), eliminate the
handling of the case where no configuration is found.

When ncfg is zero, krealloc_array() will set ZERO_SIZE_PTR to *configs,
which is a natural approach for managing a zero-size buffer.

This should have no impact because none of the callers accesses 'configs'
when ncfg is zero. Also, it is safe to pass ZERO_SIZE_PTR to kfree().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/pinctrl/pinconf-generic.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index ba4fe2466e78..252d69ee2b68 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -265,14 +265,6 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 		parse_dt_cfg(np, pctldev->desc->custom_params,
 			     pctldev->desc->num_custom_params, cfg, &ncfg);
 
-	/* no configs found at all */
-	if (ncfg == 0) {
-		kfree(cfg);
-		*configs = NULL;
-		*nconfigs = 0;
-		return 0;
-	}
-
 	/* Now resize the array to store the real number of found properties. */
 	*configs = krealloc_array(cfg, ncfg, sizeof(unsigned long), GFP_KERNEL);
 	if (!*configs)
-- 
2.40.1


