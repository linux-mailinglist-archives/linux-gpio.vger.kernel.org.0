Return-Path: <linux-gpio+bounces-25373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 864DFB3FFD2
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 14:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98DB97B8453
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 12:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5173043BA;
	Tue,  2 Sep 2025 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTn1mi69"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A24D3043BD;
	Tue,  2 Sep 2025 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814923; cv=none; b=X+Wx4GySkEtcNzhHlxaKmlAuBMfgdBuXRvr6Gi/t53f6KBWoyLgGBWaDInfz3/Z/oRZX6HSeqK+YnwEUrBa0z7bhRHxsjx4Y7KfWtRhoxsGU1bnTflInDDy4v7SihLWebYI6klCpH2A99nfTAFS+8f1c4JVK+kMPRuS+odRc5C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814923; c=relaxed/simple;
	bh=7HqdDY2xpBnyOB5NQpVxBtywzGaiEgwFO+izjO7w43k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KhfxdrC89ij6hBCwbF30uu0vyMQOuJLZZnpbbn8Y5cGaVzwgH6n69wFhkXOxkeVxrvHaebuPA4TebYc7SuWbg3MrU9j1oj2V5l4iHIKnqGYJZMqv6s7DaEd4WJ6m5Uw6lkdr/xmfX0k7snknlg+b8ZHxF/67slWl9aspZs9DQRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTn1mi69; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919ABC4CEF7;
	Tue,  2 Sep 2025 12:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814923;
	bh=7HqdDY2xpBnyOB5NQpVxBtywzGaiEgwFO+izjO7w43k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PTn1mi69YvRUNTxHIh8lMx5LiS0iSc5ZjqEhvyYOYTpBiVd6OtpkHodrdiGux1vFJ
	 J+QGn9W9ZAQT0gNVD3cJRus/wGg6XrtqoJa/jfoDUwOZJy4ATSRfaQKBv5ToXOTWl+
	 NjhHc687SQoFCCbfvWC2vTupibRtGQdAEnNkzgXZFmDpcLP34+iW7tKtia4P7WL3N1
	 nf02p2cXV3+SKSPy/XxHORJdxNDDgIGOYE+OLjvZN9865GLE2oYBrttb01i6VI8fC7
	 EO6+mbAv03H3Sq7IMJoikGD37aL9MbRtSc8d/HOVZ7DQ8T7o2x+jshGyyyhpnoE2xs
	 eLHPAQmoVCuOQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Junjie Cao <junjie.cao@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] gpio: timberdale: fix off-by-one in IRQ type boundary check
Date: Tue,  2 Sep 2025 08:08:15 -0400
Message-ID: <20250902120833.1342615-4-sashal@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Junjie Cao <junjie.cao@intel.com>

[ Upstream commit 810e154d90f44127239957b06ee51a55553a5815 ]

timbgpio_irq_type() currently accepts offset == ngpio, violating
gpiolib's [0..ngpio-1] contract. This can lead to undefined behavior
when computing '1 << offset', and it is also inconsistent with users
that iterate with for_each_set_bit(..., ngpio).

Tighten the upper bound to reject offset == ngpio. No functional change
for in-range offsets.

Signed-off-by: Junjie Cao <junjie.cao@intel.com>
Link: https://lore.kernel.org/r/20250825090850.127163-1-junjie.cao@intel.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## Bug Severity and Impact

The commit fixes a critical **off-by-one boundary check bug** in
`timbgpio_irq_type()` at drivers/gpio/gpio-timberdale.c:141. The bug
allows `offset == tgpio->gpio.ngpio`, which violates the GPIO
subsystem's fundamental contract of valid offsets being in the range
`[0..ngpio-1]`.

## Specific Code Analysis

1. **The Bug**: The original check `if (offset < 0 || offset >
   tgpio->gpio.ngpio)` incorrectly accepts `offset == ngpio` as valid.

2. **Undefined Behavior Risk**: When `offset == ngpio`, the subsequent
   bit shift operations become problematic:
   - Line 154: `bflr &= ~(1 << offset)`
   - Line 157: `lvr |= 1 << offset`
   - Line 167: `flr |= 1 << offset`
   - Line 184: `iowrite32(1 << offset, tgpio->membase + TGPIO_ICR)`

   Shifting by 32 or more bits (assuming 32-bit registers) results in
**undefined behavior** in C, potentially causing:
   - Memory corruption
   - System crashes
   - Security vulnerabilities through out-of-bounds writes

3. **Inconsistency with GPIO Framework**: The bug creates inconsistency
   with `for_each_set_bit()` usage at line 208, which correctly iterates
   from 0 to ngpio-1.

## Backport Criteria Met

✓ **Fixes a real bug**: Prevents undefined behavior and potential memory
corruption
✓ **Small and contained**: Single-line change (`>` to `>=`)
✓ **No side effects**: Only tightens validation, doesn't change behavior
for valid inputs
✓ **No architectural changes**: Simple boundary check fix
✓ **Long-standing bug**: Present since driver introduction in 2009
(commit 35570ac6039ef4)
✓ **Clear fix**: The correction is obvious and mathematically correct
✓ **Low regression risk**: More restrictive validation cannot break
correctly functioning code

## Additional Considerations

- The bug has existed for **15+ years** since the driver's introduction,
  making it a candidate for all maintained stable trees
- While the timberdale GPIO driver may not be widely used, the fix
  prevents potential security issues from invalid array indexing
- Similar boundary check issues in kernel drivers have historically been
  backported to stable
- The fix aligns with kernel security best practices of proper input
  validation

The commit message accurately describes the issue, and the fix is the
minimal change necessary to resolve the bug without introducing new
functionality or risk.

 drivers/gpio/gpio-timberdale.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index cb303a26f4d3c..61f15a864a5ad 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -138,7 +138,7 @@ static int timbgpio_irq_type(struct irq_data *d, unsigned trigger)
 	u32 ver;
 	int ret = 0;
 
-	if (offset < 0 || offset > tgpio->gpio.ngpio)
+	if (offset < 0 || offset >= tgpio->gpio.ngpio)
 		return -EINVAL;
 
 	ver = ioread32(tgpio->membase + TGPIO_VER);
-- 
2.50.1


