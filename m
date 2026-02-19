Return-Path: <linux-gpio+bounces-31832-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKrOIKRwlmlqfQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31832-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 03:08:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 239DA15B873
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 03:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18188302E77B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 02:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042B22FE048;
	Thu, 19 Feb 2026 02:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3+Q8RSk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81F7280A5A;
	Thu, 19 Feb 2026 02:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771466689; cv=none; b=rHpl1vVxSNe/ktfNlsCfBKgMmcHOPP6MaglYg3Kcdw3ZKSR9GP5cCYyjukhCWMUAc8huJuwy3PS26SuSr9vmW1/WwW/pi9ysErRn+QLu3zsU84RMQUIQzb5F6q3g7GZx1DJUr1k6F6l8C/3dBb0ec30PMxuo+QEydNHbuHQz1wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771466689; c=relaxed/simple;
	bh=gHtcNRF3wMm1yv55zf4VRgDNe+lRp+wHBTVMtvKLo/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EUxlXoJ0wWzS6Z6acX4rtAythSx9AO0z7MBCyhlqHrMqzNDWpPzv2lzjgE2kL/i4HpOGDD0MqSXNQP5LVDglmcEXJveDq2+7Tl6NKvZAGEE+pr+gfprPnFF4uADGiXV1gVHJqnCLte8lb80TvyyPE7Fsz2H42VrwvNXvnPSfWhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3+Q8RSk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D82C116D0;
	Thu, 19 Feb 2026 02:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771466689;
	bh=gHtcNRF3wMm1yv55zf4VRgDNe+lRp+wHBTVMtvKLo/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S3+Q8RSkcfOzGQcxkTtIhRD1twFLCYdW3OKzEp0IU9D8X4DrqUMGTMiSrd1xtW2tt
	 8tpFXxxDrOEEBZ6ilcLFV5bCrSwnpVBr5RUImJa7hw7/NyhcOim5l63Tu34QkCojer
	 Ldj5ut/t/1kOdgt5kV6BXDmM8IFT1FfMk5VnmvCs06CTykY13cTTZHFEYFGW/hCZyd
	 Yt2/D6h/B7/5lW/AlunfziGzP3mOKM0iD2hqzzA5ak052vPJcSc5K0/sFqYTi9/BJ8
	 HHTz5EKlTPys/iG3pX6YQCQ66anAAu6jdXbd7SzlUAnr/eM5ruzcudhsKX3yDPdBvZ
	 xrxPpyQeGc7rw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Liang Jie <liangjie@lixiang.com>,
	fanggeng <fanggeng@lixiang.com>,
	Linus Walleij <linusw@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	sean.wang@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.18] pinctrl: mediatek: make devm allocations safer and clearer in mtk_eint_do_init()
Date: Wed, 18 Feb 2026 21:03:56 -0500
Message-ID: <20260219020422.1539798-20-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31832-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lixiang.com,kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lixiang.com:email]
X-Rspamd-Queue-Id: 239DA15B873
X-Rspamd-Action: no action

From: Liang Jie <liangjie@lixiang.com>

[ Upstream commit 255b721c96046d4c57fa2268e4c72607868ce91f ]

mtk_eint_do_init() allocates several pointer arrays which are then
populated in a per-instance loop and freed on error. The arrays are
currently allocated with devm_kmalloc(), so their entries are left
uninitialised until the per-instance allocations succeed.

On a failure in the middle of the loop, the error path iterates over
the full nbase range and calls devm_kfree() on each element. For
indices which were never initialised, the corresponding array entries
contain stack garbage. If any of those happen to be non-zero,
devm_kfree() will pass them to devres_destroy(), which will WARN
because there is no matching devm_kmalloc() resource for such bogus
pointers.

Improve the robustness and readability by:

  - Using devm_kcalloc() for the pointer arrays so that all entries
    start as NULL, ensuring that only genuinely initialised elements
    may be freed and preventing spurious WARN_ON()s in the error path.
  - Switching the allocations to sizeof(*ptr) / sizeof(**ptr) forms,
    avoiding hard-coded element types and making the code more resilient
    to future type changes.
  - Dropping the redundant NULL checks before devm_kfree(), as
    devm_kfree() safely handles NULL pointers.

The functional behaviour in the successful initialisation path remains
unchanged, while the error handling becomes simpler and less
error-prone.

Reviewed-by: fanggeng <fanggeng@lixiang.com>
Signed-off-by: Liang Jie <liangjie@lixiang.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

So the buggy code is NOT in 6.12 or older LTS trees (as expected, since
it was added in 6.15). This fix is only relevant for 6.15+ stable trees.

### 7. Verification Summary

**Verification:**
- Read the current file (`mtk-eint.c` lines 520-622) — confirmed the
  buggy `devm_kmalloc()` calls at lines 547, 551, 555 and the error path
  at lines 598-606 that iterates over uninitialized entries.
- `git log` confirmed `3ef9f710efcb5` ("Add EINT support for multiple
  addresses") introduced the multi-base code with `nbase`, the loop, and
  the error path — landed in v6.15.
- `git tag --contains 3ef9f710efcb5` confirmed it's in `p-6.15`,
  `p-6.16`, `p-6.17`.
- `git log --oneline v6.18.12` confirmed the buggy commit is present in
  the 6.18.y stable tree.
- `git log --oneline v6.12` confirmed the buggy code is NOT in 6.12 or
  older LTS trees (not applicable for those).
- Verified the error path: loop at line 599 iterates `0..nbase-1`, but
  if allocation fails at index `k`, indices `k+1..nbase-1` have
  uninitialized pointer entries — confirmed in pre-patch code.
- `devm_kfree(NULL)` is safe (no-op) — confirmed by kernel API
  convention.
- The patch is self-contained; no other patches are needed as
  dependencies.

### 8. Conclusion

This commit fixes a real bug: **use of uninitialized memory in the error
path** of `mtk_eint_do_init()`. When memory allocation fails partway
through a loop, the cleanup code passes uninitialized (garbage) pointer
values to `devm_kfree()`, which can trigger `WARN_ON()` in
`devres_destroy()` and potentially cause memory corruption.

The fix is small, surgical (3 `devm_kmalloc` → `devm_kcalloc` changes +
removal of now-redundant NULL checks), well-understood, reviewed by a
maintainer, and carries minimal risk. It only affects the error path —
the successful path is functionally unchanged. The buggy code exists in
stable trees 6.15+.

**YES**

 drivers/pinctrl/mediatek/mtk-eint.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index c8c5097c11c4d..2a3c04eedc5f3 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -544,24 +544,32 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 		}
 	}
 
-	eint->pin_list = devm_kmalloc(eint->dev, eint->nbase * sizeof(u16 *), GFP_KERNEL);
+	eint->pin_list = devm_kcalloc(eint->dev, eint->nbase,
+				      sizeof(*eint->pin_list), GFP_KERNEL);
 	if (!eint->pin_list)
 		goto err_pin_list;
 
-	eint->wake_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
+	eint->wake_mask = devm_kcalloc(eint->dev, eint->nbase,
+				       sizeof(*eint->wake_mask), GFP_KERNEL);
 	if (!eint->wake_mask)
 		goto err_wake_mask;
 
-	eint->cur_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
+	eint->cur_mask = devm_kcalloc(eint->dev, eint->nbase,
+				      sizeof(*eint->cur_mask), GFP_KERNEL);
 	if (!eint->cur_mask)
 		goto err_cur_mask;
 
 	for (i = 0; i < eint->nbase; i++) {
-		eint->pin_list[i] = devm_kzalloc(eint->dev, eint->base_pin_num[i] * sizeof(u16),
+		eint->pin_list[i] = devm_kzalloc(eint->dev,
+						 eint->base_pin_num[i] * sizeof(**eint->pin_list),
 						 GFP_KERNEL);
 		port = DIV_ROUND_UP(eint->base_pin_num[i], 32);
-		eint->wake_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
-		eint->cur_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
+		eint->wake_mask[i] = devm_kzalloc(eint->dev,
+						  port * sizeof(**eint->wake_mask),
+						  GFP_KERNEL);
+		eint->cur_mask[i] = devm_kzalloc(eint->dev,
+						 port * sizeof(**eint->cur_mask),
+						 GFP_KERNEL);
 		if (!eint->pin_list[i] || !eint->wake_mask[i] || !eint->cur_mask[i])
 			goto err_eint;
 	}
@@ -597,12 +605,9 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 
 err_eint:
 	for (i = 0; i < eint->nbase; i++) {
-		if (eint->cur_mask[i])
-			devm_kfree(eint->dev, eint->cur_mask[i]);
-		if (eint->wake_mask[i])
-			devm_kfree(eint->dev, eint->wake_mask[i]);
-		if (eint->pin_list[i])
-			devm_kfree(eint->dev, eint->pin_list[i]);
+		devm_kfree(eint->dev, eint->cur_mask[i]);
+		devm_kfree(eint->dev, eint->wake_mask[i]);
+		devm_kfree(eint->dev, eint->pin_list[i]);
 	}
 	devm_kfree(eint->dev, eint->cur_mask);
 err_cur_mask:
-- 
2.51.0


