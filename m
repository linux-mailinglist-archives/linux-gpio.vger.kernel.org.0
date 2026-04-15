Return-Path: <linux-gpio+bounces-35170-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BkSO6d832lAUAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35170-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:55:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B51C4040F0
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BB9B301B043
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 11:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEDA37AA8B;
	Wed, 15 Apr 2026 11:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="jzkL3baO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165CC3264EA
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776254113; cv=none; b=ePHSm7NNrGPhnnaYLXBkSxsLPUaoxrY5UiQQDClloGvBT1JvTXk6NHSXy5j2NwqXlEI647fiLvYCb6KwbPyw63O1csgJgTQ35iqbHG0Qw9DnByjeF2tbB1ECIRrUHZ1LplYI7SXEPzoCaNo8L7jwJ8+EG+aaGDY2lJWDfkzb9sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776254113; c=relaxed/simple;
	bh=FwK7aiO0RWft5Qk9rOII/R/wsjA8XT8FnotMP7tgGJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K/U6f2cdJE9v9z3eTvsHSA0OZnO0vF6IJ6CMtikDVFcwJz7knbINIl/1/Hb/MlnLSzGd242GyOT6H+pa0a9VMNM7nRSzc6SZFP+g0tbqCMEOOmx90FG2NNG44nDtN7D1bHBaZXAhytJighkKzNrF9fbr3PXEo74BBOZGvPOuRrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=jzkL3baO; arc=none smtp.client-ip=84.16.66.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fwdqs0QYYzyg7;
	Wed, 15 Apr 2026 13:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1776251768;
	bh=E5uIj97XCDhQeYrBq3CgyTfmjr97TvL+zt9wLLTXNA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jzkL3baO24uAcq/8TGIozu9CbZeTtjOvG5NW4pWsaMSlba3J1NugL7XoakGdSioc5
	 LW4sDTIq91g6CJmbGrM8KuZswyOVaX03xK4NQyktWqiAmybeZag0CnvJ+SDlA3tgRq
	 2DyOENdBNLIVCuvlAHfOPZFTj6yx0zi3aa+L6M/64ywv+v22NN3UV71mk4Apj217Kw
	 ecONrF9XInFBVtXHgCYIdKuNApTrbce1ExnBYmAAWb6Jb299oHnDlH0U61HsRu51cV
	 GOEJPmFHCWBgH8rwE47hFV8LO/fEBXd5yrLuAcrDCHnumUVi9Ifk4lyHVufkT/hMVB
	 JEZaWvl5TkA+Q==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fwdqr2RXwzwZ0;
	Wed, 15 Apr 2026 13:16:08 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 15 Apr 2026 13:15:40 +0200
Subject: [PATCH 6.12.y 1/2] gpiolib: unify two loops initializing GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-6-12-gpiolib-cve-2026-22986-v1-1-3a7a6de332eb@cherry.de>
References: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
In-Reply-To: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, stable@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Kent Gibson <warthog618@gmail.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[0leil.net,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[0leil.net:s=20231125];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[cherry.de,vger.kernel.org,linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35170-lists,linux-gpio=lfdr.de,kernel];
	DKIM_TRACE(0.00)[0leil.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[foss@0leil.net,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0leil.net:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 8B51C4040F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[ Upstream commit fa17f749ee5bc6afdaa9e0ddbe6a816b490dad7d ]

We currently iterate over the descriptors owned by the GPIO device we're
adding twice with the first loop just setting the gdev pointer. It's not
used anywhere between this and the second loop so just drop the first
one and move the assignment to the second.

Reviewed-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/20241004-gpio-notify-in-kernel-events-v1-2-8ac29e1df4fe@linaro.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: stable@vger.kernel.org # 6.12
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/gpio/gpiolib.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 967ff661e4c96..3f9019cc832ac 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1026,9 +1026,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		}
 	}
 
-	for (desc_index = 0; desc_index < gc->ngpio; desc_index++)
-		gdev->descs[desc_index].gdev = gdev;
-
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
 
@@ -1058,6 +1055,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	for (desc_index = 0; desc_index < gc->ngpio; desc_index++) {
 		struct gpio_desc *desc = &gdev->descs[desc_index];
 
+		desc->gdev = gdev;
+
 		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
 			assign_bit(FLAG_IS_OUT,
 				   &desc->flags, !gc->get_direction(gc, desc_index));

-- 
2.53.0


