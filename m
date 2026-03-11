Return-Path: <linux-gpio+bounces-33106-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFV1C4A6sWkLswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33106-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:48:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 934E12612F3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43B3F3046A96
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84403C660D;
	Wed, 11 Mar 2026 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhG8ebmn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDEA39934D
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222137; cv=none; b=tp8DlBBur8lHlMoWrYygpUqHF7hjNT+FXt7l5gdXlZxHs1jX18erJsg8Qvz9jS9YD+PMlqRkQ+Rq7EmFGQegVaYDZTA1TLHbnzVbbqZPu7J8XdOEjOQ7idQ6SJmK5B04pSWedM/ST7ecThzjKBJzpcBkckunFJ6LgFaN04rKnls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222137; c=relaxed/simple;
	bh=MmeW1GuBGNHOP/ehqrlvREZJ2UKqCog5IyccSHB5U5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ClR0HNrkXHKc2+y6SqoK0rEDdZyPcOLeq4wEQk5wfCh2UNwlOYxwpUM09oKPoUVcvALom0H6RnxHLVeZBQ3emum1Vzb4o+HmLft8iZ+8G7eSeQZaPF6eAb96nQFlB/8A7fknSUqVWDxdQd2yFG/rnFROQmUkU7I/3WgxIGZUmcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhG8ebmn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6116EC2BC9E;
	Wed, 11 Mar 2026 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773222137;
	bh=MmeW1GuBGNHOP/ehqrlvREZJ2UKqCog5IyccSHB5U5I=;
	h=From:Date:Subject:To:Cc:From;
	b=WhG8ebmnrBwpBIfEP3oQQnrmOJfD4d0lFe4WTrZyP16bpQszP67HFemyla4KrC5FN
	 bwyk0Tnh0+HtEdX0jpTJWYN9w5WL2f8rQQo4qCCvoCmmZgvcPmpY6RQ7Lu/BpZHvdj
	 G2sWD0/Qo8U6bSOpezAiDGx1uHUIKxl8CNMRBl1yGzqX2VYOpaUfzeEWkSosNNywni
	 N2hzD0Y/1+jVtHXDlm1ZJDA5EbuOr5w9EXYWo7VynXzjU6Sp9yz3Y8zMLJFCh2PlTM
	 tiYxAFOV1EsgCECffVJ9C7Gwz/08TrmPKVgeJaoz1abo7TAFdh7ipcoKQCilx6iGV5
	 KOk0c/NQrAVsw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 10:42:14 +0100
Subject: [PATCH] gpiolib: Update gpiochip_find_base_unlocked() kerneldoc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-gpio-discourage-dynamic-v1-1-c8b68fc84203@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBBFfyVmnZD27leihehks0hDKQrp3xtaH
 u65J0PCSJhgKjJEvChR8AyyLMBs2jsUZJlBVaqraimFOygIS8mEM2qe7eP1Tka0zWBG1Ut2LPD
 7iLjS/Zfn5X0/ASnd22kAAAA=
X-Change-ID: 20260311-gpio-discourage-dynamic-548c9271311d
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, Matthijs Kooijman <matthijs@stdin.nl>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 934E12612F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33106-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

This function albeit static was lacking a kerneldoc, and the
function returns a dangerous number for internal use so make
that clear in the kerneldoc.

Reported-by: Matthijs Kooijman <matthijs@stdin.nl>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Note to self: maybe this numberspace could be managed by a
maple tree? It would be an interesting exercise.
---
 drivers/gpio/gpiolib.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 86a171e96b0e..d9f8cf3022be 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -340,7 +340,15 @@ struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_chip);
 
-/* dynamic allocation of GPIOs, e.g. on a hotplugged device */
+/**
+ * gpiochip_find_base_unlocked() - Find a global GPIO number base
+ * @ngpio: Number of consecutive GPIOs to number
+ *
+ * Finds and allocates a consecutive range of unsigned integers representing
+ * the GPIOs on the system. Using this numberspace outside of gpiolibs
+ * internals is STRONGLY DISCOURAGED, drivers and consumers should NOT concern
+ * themselves with this numberspace.
+ */
 static int gpiochip_find_base_unlocked(u16 ngpio)
 {
 	unsigned int base = GPIO_DYNAMIC_BASE;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260311-gpio-discourage-dynamic-548c9271311d

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


