Return-Path: <linux-gpio+bounces-31320-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KXaEd3fe2ljJAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31320-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 23:31:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BAFB55B6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 23:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A29A73002934
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 22:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25F5366571;
	Thu, 29 Jan 2026 22:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b="icHfOnl6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5837F366DC6
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.154.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769725902; cv=none; b=pSe0KIRr1eNZNHfhlJSWd86HxVYFq/PvmIj6DIBFVy5TNjMQuFE+vIx/1uDRPONTwF2qZINcmNuksA8aLXtgm+PkgDnbgfvj9Vc0BKt188qcyh7FPMCJTNcIvpMYZuLv+CQA5l3JqYcZ4Ub868RYX3rx4rdpOMHNJ9EtyTyKwtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769725902; c=relaxed/simple;
	bh=Behg+I8HPmy0cJZniRk22/Nqd7zJZd3A2xcPUeEodWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pX+bdsMjEe9+43qbh8RvWpTA5LtQOBhS8EZXJC5PG023vRlhuWOxDnSDwyGdjFYIysJJUEsy22uHXxLLuHQEYbeW1VB0s7H7UAospdtwzioyXWIEqdoxcMl0j2XR/8AFTQIn91qB3/Q/p1OqLhedcp0fc6ro83Z1AqbZin+Y0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com; spf=pass smtp.mailfrom=candelatech.com; dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b=icHfOnl6; arc=none smtp.client-ip=67.231.154.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=candelatech.com
Received: from dispatch1-us1.ppe-hosted.com (ip6-localhost [127.0.0.1])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id E59A4519F8E
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 22:22:02 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id E49C880070;
	Thu, 29 Jan 2026 22:21:54 +0000 (UTC)
Received: from carkeek.candelatech.com (firewall.candelatech.com [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 5DDDA13C2B0;
	Thu, 29 Jan 2026 14:21:52 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 5DDDA13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1769725312;
	bh=Behg+I8HPmy0cJZniRk22/Nqd7zJZd3A2xcPUeEodWg=;
	h=From:To:Cc:Subject:Date:From;
	b=icHfOnl699ZRoQzrgZM2f36AGzcROKrzMaFWx37Je1VlD7jAl8TPD2xmilBjRoVkV
	 FytRqV5dqMY/LdD9hhAdwOwsqaVrzXgIzpZ2BPerGp+DXk/uPpC/MilZ3Ul3MDJrcE
	 wmZRNgvg0p6PDMouWAj8XUy/Tz1SCqA0IqAMqGHs=
From: Rory Little <rory@candelatech.com>
To: Enrico Weigelt <info@metux.net>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: amd-fch: Return 0-1 range for get operation
Date: Thu, 29 Jan 2026 14:21:50 -0800
Message-ID: <20260129222150.486419-1-rory@candelatech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MDID: 1769725314-gf4wDZ1UeMTg
X-PPE-STACK: {"stack":"us5"}
X-MDID-O:
 us5;at1;1769725314;gf4wDZ1UeMTg;<rory@candelatech.com>;6a9381007e71e943313da1edcba0e07e
X-PPE-TRUSTED: V=1;DIR=OUT;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[candelatech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[candelatech.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31320-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[rory@candelatech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[candelatech.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,candelatech.com:email,candelatech.com:dkim,candelatech.com:mid]
X-Rspamd-Queue-Id: 80BAFB55B6
X-Rspamd-Action: no action

Now that gpiochip_get sanitizes the output of these calls, this old
non-1 behavior was causing -EBADE to be returned when voltage high was
read.

Signed-off-by: Rory Little <rory@candelatech.com>
---
 drivers/gpio/gpio-amd-fch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index e6c6c3ec7656..37bf1842481d 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -125,7 +125,7 @@ static int amd_fch_gpio_get(struct gpio_chip *gc,
 	void __iomem *ptr = amd_fch_gpio_addr(priv, offset);
 
 	spin_lock_irqsave(&priv->lock, flags);
-	ret = (readl_relaxed(ptr) & AMD_FCH_GPIO_FLAG_READ);
+	ret = FIELD_GET(AMD_FCH_GPIO_FLAG_READ, readl_relaxed(ptr));
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return ret;
-- 
2.52.0


