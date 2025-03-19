Return-Path: <linux-gpio+bounces-17771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD29A68852
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 10:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8D291892EE9
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 09:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBE425525F;
	Wed, 19 Mar 2025 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZ2ce4Mw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBDE25D54E;
	Wed, 19 Mar 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376779; cv=none; b=c7AP4JBkwDIRk7QiJ/UkoS9nzRLTwnHBgtxYfqT67MzyBdOdqA7aQyMqwn1cyMo8p0EFBzOoJpAWCf+6XscsM8d29/9HEWRVhG+kDsPLNcBsBbu7rJcUPsB0yabbYQ4QYuN5A5Jiv4hWodog/bPyv4KGQKwghFgYH5aJfKeI0q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376779; c=relaxed/simple;
	bh=TrXfwAS/puZQlBtNf9tdD1M67plxl5ThngLriua6Pgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXA0kEAM0iOsUCs2Hviq0/7cCzTZL5rBomRPJ1lE2tWrn6RYxEiEU4J1A9sQUJD5wVfgnazHXu8dsY72YGmXUZgls4NTqxS/G5O9d4C8Uw1y3pg8fbNm0rliTQBF4SKTzdj79V449JAsDNowRsSfXKjtsOjymo0JDscd49y5bCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZ2ce4Mw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADE5C4CEEE;
	Wed, 19 Mar 2025 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376779;
	bh=TrXfwAS/puZQlBtNf9tdD1M67plxl5ThngLriua6Pgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RZ2ce4MwP4LCsJVfmV7Jq0puW2/ApfGYa+DOn8pnXXONJKPzxuxdDJDVgbxeDpQFo
	 +GpDyYDXwIDoCE3LLLFutEkJ+XqXeGrZt26EWKglZ47IAs3KGibRFA0eIEwX9Cr66l
	 oGidMTOtOk3ZOaS0UMUu61mVS43qfVjqhaIOLtpWpQoNO3SpKG0TnqTkx5zJ73dp0o
	 OcTOy8XI/HOw4QXHYBDkj+/YgtvaZG3XemX2FSCvhOdkq6gw2v6xXmaLC0nwfuwYLo
	 cxnHEykaUm3QvhUgQ+E5eeWCbe9EJkhfbdPck1x7KatXWcNxkYUis+ns/jrrqk9/M/
	 9LNz3tRTX275g==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 43/57] irqdomain: gpio: Switch to irq_find_mapping()
Date: Wed, 19 Mar 2025 10:29:36 +0100
Message-ID: <20250319092951.37667-44-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_linear_revmap() is deprecated, so remove all its uses and supersede
them by an identical call to irq_find_mapping().

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpio-idt3243x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index 00f547d26254..535f25514455 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -37,7 +37,7 @@ static void idt_gpio_dispatch(struct irq_desc *desc)
 	pending = readl(ctrl->pic + IDT_PIC_IRQ_PEND);
 	pending &= ~ctrl->mask_cache;
 	for_each_set_bit(bit, &pending, gc->ngpio) {
-		virq = irq_linear_revmap(gc->irq.domain, bit);
+		virq = irq_find_mapping(gc->irq.domain, bit);
 		if (virq)
 			generic_handle_irq(virq);
 	}
-- 
2.49.0


