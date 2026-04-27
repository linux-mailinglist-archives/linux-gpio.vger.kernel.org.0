Return-Path: <linux-gpio+bounces-35541-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJUWJeQi72lV7gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35541-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:48:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F6746F5D7
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C93163004C96
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 08:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54DA39FCD2;
	Mon, 27 Apr 2026 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Il1vcf0j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9977638759C
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279682; cv=none; b=gCbQ/2fonfKz+Ki2Cx/fKgqnqM/tW+1R2l5iMvpULk1qq2KH8vwmUuJ10fqt0sgYFk0uCzBonH33KXWDmaiBB8Bj5awUBJESiw5P7ti8rwSPxABHe5hc1Z+GlcR7Oy8dbrsmR1a78VqkLH39HqJ5voLZkGX0/jSSQdoDYeO/tIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279682; c=relaxed/simple;
	bh=81HtaneFQeXSq5lvdKyynPLRJRD2vWzUCTFzQBLMjuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJVJ3Wa01eCvZo30bOMp4rPXB2mmaeWsTLmTARgZijSb6X2PKTL6mP64qEnXh4D414YurRV0tdT/I5Cbv3wC1GP9YaHuh+qnHDskI9FB6obxvjAe+XA7OQxbvHMe1PxuZEsfF3Xer4iaGC0UwFnEjwjc7ddb16gdi5mO5/w1vAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Il1vcf0j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5027DC19425;
	Mon, 27 Apr 2026 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777279682;
	bh=81HtaneFQeXSq5lvdKyynPLRJRD2vWzUCTFzQBLMjuM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Il1vcf0jcqV+PxB5XGAjPpShjlkG5zuIqE9wm2WELzBflFxb9aAPomjAs2cAg/wBv
	 06uA/DENYjnDGQT5R+/geKueKdCO9Kj9TiLh6KjcPJEk9xVV5OBsjHMGcLkaA9mrKo
	 AycI9+BavYpCuFiYf3jAe+66+KV530Oa6ZgHqC8mBUl2PfEcFpPnouSasf7IoT3G/7
	 TLXDgX1W/06cnk389zZl4jj8jU4lQ4eYjNZhM5m7QeUPTcq98749MTv2kqJQsPtcKK
	 Y6q5OF7IrIerqJsZs7bcZolKKpzKSf3SJOSDIzlZRpb5a8iJiRJPvtoBB7z7p3k/FW
	 GkmYlWBM84kew==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 10:47:57 +0200
Subject: [PATCH v3 1/3] gpio: devres: Use devres parent if undefined
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gpio-mmio-more-v3-1-fe1882351424@kernel.org>
References: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
In-Reply-To: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 97F6746F5D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35541-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email]

From: Linus Walleij <linus.walleij@linaro.org>

If the user did not pass a parent in the struct gpio_chip
then use the device used for devres as parent.

This is quite intuitive and can help avoiding having to
assign parent explicitly in every driver using devres
to add the gpiochip.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-devres.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 72422c5db364..2ec825ffab7d 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -353,6 +353,13 @@ int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc, vo
 {
 	int ret;
 
+	/*
+	 * We are passing the devres device here so if the user did not pass
+	 * another parent, it's this one.
+	 */
+	if (!gc->parent)
+		gc->parent = dev;
+
 	ret = gpiochip_add_data_with_key(gc, data, lock_key, request_key);
 	if (ret < 0)
 		return ret;

-- 
2.53.0


