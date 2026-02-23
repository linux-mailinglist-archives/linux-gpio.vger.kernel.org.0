Return-Path: <linux-gpio+bounces-32009-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEhsMTPxm2kI+AMAu9opvQ
	(envelope-from <linux-gpio+bounces-32009-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:18:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE2172069
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD2C3302DF43
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 06:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EA3346AFC;
	Mon, 23 Feb 2026 06:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLWjVfL2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0435346A1F;
	Mon, 23 Feb 2026 06:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771827469; cv=none; b=U4kGtVM1aj+ogJFTIO8nYlq0YPtBK5L64NH7vp3sR400rxKraQGipA6Wq1M9a4OQ0xAnvitwfAsXhrcJabEWbjQetTpNRW3eqQzUqZ86OKNph+LiSkGAh5YSb8XNSlLGx3TaxotTm023qEby/WPR5p/TNaoL7ObYXO94/Ub6NO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771827469; c=relaxed/simple;
	bh=BAPg3VOsJBISwCCY0+rT3CoAIrhM+BvyViRvuu7W41M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YarRGoN9Xuu2HXLStprJOBmmKg1AlGCuZ6YRYRiTAnj/TPtMz0zEDXlElWxGNzvpg+hKQDN+yZWSY+RrNWvtz4bPAla4U2VsCJIG6GqWx5Nm6nUJtFU+0zC+XIcXyIlsYgW2jgciO6myitcW4rnXHCUy7zQ0AO9N0OWRWj+J/Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLWjVfL2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5FEC19423;
	Mon, 23 Feb 2026 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771827469;
	bh=BAPg3VOsJBISwCCY0+rT3CoAIrhM+BvyViRvuu7W41M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fLWjVfL2oFoybhC4KL+nSLOyvjUZjqoiTVG2iWuT3eOqL0Y1ehJlnAruQciQc4x0u
	 XJB9I5UKWJSpQjFs+Y2q3gL4JqOk6T5VH+PqPPiO5KKp8F3AvWlETMBNlATapyUc0G
	 E/cTovEGqNxAo6Kp4gpPCWKIk0s5tcAWTMB6n4hvSbywECA+Vx0N7vfnzIiBqESaEs
	 vXT/ChRSUH8SPu5t/mgpmQ8Fmui/byvoUePu0RV8ayxL51uKuELNovUcsOCo02DmpV
	 8hbwTqsmg+JPmHs5JWLF0XE+Nxyb8OkHzBcVnG/H1xlSKX0nJZ8AJWT4WORc1HLSqB
	 AOAoW8HSvfQcw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v4 2/6] gpio: Remove redundant check for struct gpio_chip
Date: Mon, 23 Feb 2026 14:17:22 +0800
Message-ID: <20260223061726.82161-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223061726.82161-1-tzungbi@kernel.org>
References: <20260223061726.82161-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32009-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5BFE2172069
X-Rspamd-Action: no action

gpiolib_dbg_show() is only called by gpiolib_seq_show() which has
ensured the struct gpio_chip.  Remove the redundant check in
gpiolib_dbg_show().

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v4:
- Add R-b tag.

v3: https://lore.kernel.org/all/20260213092958.864411-3-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/all/20260203061059.975605-3-tzungbi@kernel.org
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-8-tzungbi@kernel.org

 drivers/gpio/gpiolib.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0a73561060dd..08a3697dbd5a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5312,23 +5312,14 @@ core_initcall(gpiolib_dev_init);
 
 #ifdef CONFIG_DEBUG_FS
 
-static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
+static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 {
 	bool active_low, is_irq, is_out;
 	struct gpio_desc *desc;
 	unsigned int gpio = 0;
-	struct gpio_chip *gc;
 	unsigned long flags;
 	int value;
 
-	guard(srcu)(&gdev->srcu);
-
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc) {
-		seq_puts(s, "Underlying GPIO chip is gone\n");
-		return;
-	}
-
 	for_each_gpio_desc(gc, desc) {
 		guard(srcu)(&desc->gdev->desc_srcu);
 		flags = READ_ONCE(desc->flags);
@@ -5441,7 +5432,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	if (gc->dbg_show)
 		gc->dbg_show(s, gc);
 	else
-		gpiolib_dbg_show(s, gdev);
+		gpiolib_dbg_show(s, gc);
 
 	return 0;
 }
-- 
2.51.0


