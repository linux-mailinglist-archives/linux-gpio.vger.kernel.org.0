Return-Path: <linux-gpio+bounces-32012-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC1EElXxm2kI+AMAu9opvQ
	(envelope-from <linux-gpio+bounces-32012-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:19:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F94A172097
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B280D3023A89
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 06:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A67349B12;
	Mon, 23 Feb 2026 06:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d98GpjG6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493B7349AF9;
	Mon, 23 Feb 2026 06:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771827475; cv=none; b=uEtwoVRdSQDutLe8/bScPTcdIf/o6Xiq0t7KA8PYoAqW6vGsCCGcvhUjp2J45FU8Rr3OxEKAuGuSmqEVj9T5GIX1ElzRvq0tsSkLHDYxYa399dbh/xFtvYuJ/wKL2dMgHbY+ip9jCzWjUAqPBDuA+X4jHMiZFrQXXT7o9McKIfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771827475; c=relaxed/simple;
	bh=rEKOvY8ban5EFD4115du6UZcdU8moboolpkVYP28tpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhXqgByfXYLALM0DQ0QnDW5VJUZzRO8+VeL/go/iybjDxh2Boo9hYIuur5MIrne4RYBdGtDDtVrwR1UOMqw+IZN/OO/rrIftsav4fO7eDqYZsfkSw3dDBtCe/pmxrF9/gY+ts2SzFV/KY+l6t7EZkyW1IwLzBEq/qODtwCYKY64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d98GpjG6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A05BC116C6;
	Mon, 23 Feb 2026 06:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771827474;
	bh=rEKOvY8ban5EFD4115du6UZcdU8moboolpkVYP28tpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d98GpjG6oJzpMGXNHMLajGl2fX9aAK/wONoPctySqBL/J/t7qbjy+U/WEVnoottny
	 CWjyJ04Wy8SebEaohpLT+lAtst36PXFDc39BOUmdo2tVVvHqkCb+7rl5PFOC1b/PIu
	 u6AveVx0Yboan9badnKh7G0WM4DttRsdtalW8AUgXwRGaZVDHCukiByaQ28pDxjF7M
	 67sEEWdphwPo1I66qnCVy9kN6pHN6qDNmWuEWNhftVix0NKBTOZrZ0SN8imU1imhDu
	 PcXEzq416l4Qc6CSFTkSW8ozGhhHOzBC4YGu+10bCl7VMu1zOO/pg7ufnAeO9A++9O
	 QSvmSJno3OUwA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v4 5/6] gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
Date: Mon, 23 Feb 2026 14:17:25 +0800
Message-ID: <20260223061726.82161-6-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32012-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F94A172097
X-Rspamd-Action: no action

It's harmless even if: chrdev_open() and cdev_device_del() run at the
same time, and gpio_chrdev_open() gets called after the underlying GPIO
chip has gone.  The subsequent file operations check the availability
of struct gpio_chip anyway.

Don't check struct gpio_chip in gpio_chrdev_open().

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v4:
- Add R-b tag.

v3: https://lore.kernel.org/all/20260213092958.864411-6-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/all/20260203061059.975605-6-tzungbi@kernel.org
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-11-tzungbi@kernel.org

 drivers/gpio/gpiolib-cdev.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index a154b04e9316..475ad185f915 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2689,12 +2689,6 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	struct gpio_chardev_data *cdev;
 	int ret = -ENOMEM;
 
-	guard(srcu)(&gdev->srcu);
-
-	/* Fail on open if the backing gpiochip is gone */
-	if (!rcu_access_pointer(gdev->chip))
-		return -ENODEV;
-
 	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
 	if (!cdev)
 		return -ENOMEM;
-- 
2.51.0


