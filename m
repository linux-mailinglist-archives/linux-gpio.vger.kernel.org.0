Return-Path: <linux-gpio+bounces-31372-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJVOCQaSgWl/HAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31372-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:13:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1AD5154
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9FC6308F2AE
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 06:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD58B36C0DA;
	Tue,  3 Feb 2026 06:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPrjFc0j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D613369964;
	Tue,  3 Feb 2026 06:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099116; cv=none; b=RNIFWSePWEVYWSvF1bivASjvdJZoNl7eBNW5iiNW69jygaXYq9/b+ANgspJxATmKzYuzLf0TIhiNXedBTpL9q3TNjMfSKKCl6yLg6OWyPHgpYq9rwQr4m3xlph5QAzU4NaMwxRewG9ikDYQOGXJgaLIO5Q1fn5UeRIlzOsCAQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099116; c=relaxed/simple;
	bh=0vNR5cNKN4N6Ad0oCcxkV3hwFhTeIBItllECCwiylBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjhxywuOV647VL+1t8NXgTTPv193zFFn6FdOriHqGt1IOkA+swcf8+p029xxopVXXRQZFnGjUt69ad0iYdWD8w4Smhn2VPAmx2TKWycos6tGF9er/xo9XSgYEspp+cWm/6T4hVBWZzzdLlT9ZkVGv05XISGqox73vuJWVG61x2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPrjFc0j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86A5C16AAE;
	Tue,  3 Feb 2026 06:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770099116;
	bh=0vNR5cNKN4N6Ad0oCcxkV3hwFhTeIBItllECCwiylBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HPrjFc0jgdYeWIrmyvJq/ajTRd6lfW6UnK7IiKinOPu5OieOXbEzp2Z/KVFTUSetd
	 WduZLwwAonMIq/FxWZ+64RFvqGWrwv4UEUxpCaCweSJLoF2MEpqEBZFizHYnrRlxR/
	 f5fuZqyo0BIkPeTqb7v0hltinZBpredcmVH6gw8PzO3tCm3EDybcrKgmR58F7pRNeU
	 2CwPh6Ho25Sq7hWG1gbm9PohAcbZejkA5q75T8rpEQ8md03zkj5kykPcARi8rvdtrC
	 7yayDeR53WgT22bggPLonApZz9soBVYbuyuz35O5HcCdDH63/X309I1RaCiTuJ2ov0
	 vieitVZGkP18g==
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
Subject: [PATCH v2 02/11] gpio: Remove redundant check for struct gpio_chip
Date: Tue,  3 Feb 2026 06:10:49 +0000
Message-ID: <20260203061059.975605-3-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-31372-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AEC1AD5154
X-Rspamd-Action: no action

gpiolib_dbg_show() is only called by gpiolib_seq_show() which has
ensured the struct gpio_chip.  Remove the redundant check in
gpiolib_dbg_show().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-8-tzungbi@kernel.org

 drivers/gpio/gpiolib.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f51f53511ae3..a6dd07be126c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5308,23 +5308,14 @@ core_initcall(gpiolib_dev_init);
 
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
@@ -5437,7 +5428,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	if (gc->dbg_show)
 		gc->dbg_show(s, gc);
 	else
-		gpiolib_dbg_show(s, gdev);
+		gpiolib_dbg_show(s, gc);
 
 	return 0;
 }
-- 
2.53.0.rc2.204.g2597b5adb4-goog


