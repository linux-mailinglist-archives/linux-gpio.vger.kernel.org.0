Return-Path: <linux-gpio+bounces-12997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 266DB9C85E6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 10:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D02B81F21E66
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 09:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D22F19148A;
	Thu, 14 Nov 2024 09:18:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4321632F2
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731575910; cv=none; b=JTZuXvtGkzJ1IgREqenekz/lLX3yVuGjfj/3+mRtgog55HFMvlc2QyipqEqlVWe73r0QlJqPzRw6ur2DBO+60Zjiq3Gks1rs5cChonZufc7wmszPAveT9bEN9TbAmfEx5Z8GxxF5scCIuZAhIfaC7vz8wqGdnbFIvno2r72YHyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731575910; c=relaxed/simple;
	bh=eqdw3UW3kv3/4pYJi1AVmgfidCk3Bn/amNP/WL3Pnlc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V6Ylnje6/fSjjmHDHmMPlgvE7bI8eU0TtULetew9kVNmTaRNegoCnhdtcdeg4xonHOj1w3mPLYL94T1LOVNf4tyw2EPTbbWpPgLK8uvFNCJnld9gtFUZEOsYEUjgR15ORf3b67mvRLe0X3+/XulkPpOR9e7JODpCRBcbaNieTbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id LMH00024;
        Thu, 14 Nov 2024 17:18:24 +0800
Received: from localhost.localdomain (10.94.17.107) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 14 Nov 2024 17:18:23 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <gregory.0xf0@gmail.com>,
	<robh@kernel.org>
CC: <linux-gpio@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] gpio: grgpio:  Add NULL check in grgpio_probe
Date: Thu, 14 Nov 2024 17:18:22 +0800
Message-ID: <20241114091822.78199-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20241114171824c69d5c0bc306aa54361d04a4383b5142
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in grgpio_probe is not checked.
Add NULL check in grgpio_probe, to handle kernel NULL
pointer dereference error.

Fixes: 7eb6ce2f2723 ("gpio: Convert to using %pOF instead of full_name")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpio/gpio-grgpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 7ffe59d845f0..169f33c41c59 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -369,6 +369,9 @@ static int grgpio_probe(struct platform_device *ofdev)
 	gc->owner = THIS_MODULE;
 	gc->to_irq = grgpio_to_irq;
 	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
+	if (!gc->label)
+		return -ENOMEM;
+
 	gc->base = -1;
 
 	err = of_property_read_u32(np, "nbits", &prop);
-- 
2.31.1


