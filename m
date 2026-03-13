Return-Path: <linux-gpio+bounces-33404-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJu9BIiUtGmBqgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33404-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 23:49:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280C28A893
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 23:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D95BB3007889
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 22:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8483C38D681;
	Fri, 13 Mar 2026 22:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3repjIg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48552374E57
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 22:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773442182; cv=none; b=pYmBjo6P1hSO2GJ1XrsB25JHzOJ+53cWGpb1wpzEDtyn0b+TJfdvNTUDUzG1w0V6v1V5eQF40y7wc8ed8n1+dQeKCqO0knyCYXc6mkcCDIHUNCbJUT0uDdvdLFBUvWK/HLwdlgCrqTHLdJfJardPBSWCcWRNcCvi84ydKW/604A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773442182; c=relaxed/simple;
	bh=JmgVPOpUe5VtNzS0/AnEaP9Xy7tKDMpf2a5YlJtRX0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nS6uk7sXNliaMBwN+B5Dvk0AvECV+hjnCCF89kU6mTh0ATFyFIwXolKm2pY+2iQQz3/8GOc8VQBdtsZLHIwSyAhHontaE9RR9RHRIRhiwx/VOSSP7OxnzBj1KruOh53AvBg4a+eUNJoXSjPDWDjNvl4kgX8pA+CB4dptYD438Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3repjIg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21363C19421;
	Fri, 13 Mar 2026 22:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773442181;
	bh=JmgVPOpUe5VtNzS0/AnEaP9Xy7tKDMpf2a5YlJtRX0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D3repjIg/wFst3TRfC9e6qAm3l2hoRD7iUp0xLM95q+pivBngiSaGw8PBp8i070yF
	 26XrAFVOQzI0RRNqIo7b/JcIOYp78ukjcVaM+NK18V8IbuUD7J3Bj5JXSYwdVZXNcz
	 BEXTZnUWMbdfhoh5howhkq23ZLmhiBJX9EYvlAPNABeHPCQLzzUS2e0kz8PSh7X82d
	 sKV0X8h9SOUON671EjlU4CAeXPrulAk6rHmLLsssmaNR6FaVvdjlZ5Dq8/JssKiY6Q
	 7A6oEwB2NtUGUTte0Llb9zXfBq3fCpDczpCbA5p/bU+t9fVLTf3dRm3bbY5uSUPcHB
	 7z5bKVt6v6nCw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Mar 2026 23:49:37 +0100
Subject: [PATCH v2 1/3] gpio: devres: Use devres parent if undefined
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-gpio-mmio-more-v2-1-0f777b63105a@kernel.org>
References: <20260313-gpio-mmio-more-v2-0-0f777b63105a@kernel.org>
In-Reply-To: <20260313-gpio-mmio-more-v2-0-0f777b63105a@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33404-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 8280C28A893
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


