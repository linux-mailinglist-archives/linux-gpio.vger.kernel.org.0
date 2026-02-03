Return-Path: <linux-gpio+bounces-31375-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMTVLJeSgWl/HAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31375-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:15:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12461D51E0
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9DCC30D6FE5
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 06:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F377436CDFE;
	Tue,  3 Feb 2026 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFBFrqux"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F8F36C5B7;
	Tue,  3 Feb 2026 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099124; cv=none; b=qnjOxmu73yHRJFGX7s3wJy3kvLT7QiNplCM0ahZwgs8LrJveUlirRtfenW+JCAHnuhcUBkQ0NWlO9H3y8BqD7o1D++bkiEKAmZl3Beotn9DHJ44ZaA5Lwp3AD/LnrjxiI+psM84W6Y8r68znE8auX0i1q6kd2aVs/9pkjEkc7mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099124; c=relaxed/simple;
	bh=lULAaQy6hHP7Jw8IDjREwCCMFUDk+XOS0cHztpd2ANo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/qVc51fjOLAI6wEhYQw/W10BBpSB1id2vbhX08gdeyKQqSwaukka2uE5u8xIrb5oS3EcJZnuXvqArK+vD+NYgoUACuIzMBtqbF9144UMWA5jxnWsAxOeOzJgc/WE7gGaTX3u1+sW02BJ34q1qsiV7ZX3YU5+BujacgzKbUnUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFBFrqux; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6157C116D0;
	Tue,  3 Feb 2026 06:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770099124;
	bh=lULAaQy6hHP7Jw8IDjREwCCMFUDk+XOS0cHztpd2ANo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFBFrquxN4C1UXvD0NdpSSsE+0DhnxsIJnbPHDeaS142lPpncCO4icLDwIfck34Tj
	 r18/MVqeTH0d4toQE8rySLETldquJrw47B54NgW0YFJaC6SM7SFm63ng9UfYWzOgws
	 Mh7MUAUC/oBMJ5+JERA8r2THEpQFzV2Acsu5m3UzSpIPt9aoRV+S1iRn13hzNG0epb
	 Au2VzEaB4ye6Ma+MBj21Nu6KYfflf0rEEVxmUPbSnGj5cIeNSQ/hrJ3JroLrFiBUCG
	 PExWsY8xfFa5jHSJMRMPqhNCT2yuJ9wq68wREVxQo46U0nHKQK2XeXf6lui3IVZBzo
	 PqamnM242zH+w==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 05/11] gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
Date: Tue,  3 Feb 2026 06:10:52 +0000
Message-ID: <20260203061059.975605-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260203061059.975605-1-tzungbi@kernel.org>
References: <20260203061059.975605-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-31375-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 12461D51E0
X-Rspamd-Action: no action

It's harmless even if: chrdev_open() and cdev_device_del() run at the
same time, and gpio_chrdev_open() gets called after the underlying GPIO
chip has gone.  The subsequent file operations check the availability
of struct gpio_chip anyway.

Don't check struct gpio_chip in gpio_chrdev_open().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-11-tzungbi@kernel.org

 drivers/gpio/gpiolib-cdev.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b89201578516..aaa5de814468 100644
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
2.53.0.rc2.204.g2597b5adb4-goog


