Return-Path: <linux-gpio+bounces-34202-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JZ6F8sUxWnr6QQAu9opvQ
	(envelope-from <linux-gpio+bounces-34202-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:13:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE73342F7
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2250B304397D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE923DD516;
	Thu, 26 Mar 2026 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BINEQdGl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702ECEEBB;
	Thu, 26 Mar 2026 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522278; cv=none; b=SUdUT09lM08oXZJyXukvW4kdcFj7XiBR9PxjXfxCSgfwplfoMpGmhKkIpB5sWfXBx/uppurobngC5Gf3qobYpUfHTcP4meO8mIwVdADrSTQX1FOSzAjL3/ijXrlwRfMNMVEEkBH5Yhkq5XMdj84sQKy94stt0y4o2rHK0Dx7RHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522278; c=relaxed/simple;
	bh=UzMpocvzK7/GJbYoO7dKJYmAdG0iyEhvLzrRDBLlMfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjwT39TPgbhfBf1sdOrdZdGYa7z8kMLL2ANVWf9DyUlWeSaLQJcBHk+6uHUfNFywM8U2vpzJLD/vkRLs+B6mh8r8vX251sWpJ+I9UhGhddicFnc3jS+YA1EQqJ5G+mVglfVxBVkMdpD1WSubJo+635ON1G67dW6QNfDysCq020Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BINEQdGl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D21C19423;
	Thu, 26 Mar 2026 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774522278;
	bh=UzMpocvzK7/GJbYoO7dKJYmAdG0iyEhvLzrRDBLlMfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BINEQdGlWixYuaogAjUGTc0rHz3+ZJFU1qFp+ysUhPxqSyx+5gVieEeS8AwjgN2tG
	 hw1LI47EpXzE2JPr530Scf/zonv/LpWpaWTgoNryr5OVbNagjpzmaZp1pNMG8gvuOx
	 otM9ocaF36BdXr8VH8zW+M/IRgbru3k1jwVJlkCtQCQHZdcgv1UkZcQQpaFcEByaML
	 nOHuuXaupCge+qT38UfqQuum53ym7E/SGslggkTqgVtrzhiFUHx1idBVTdsYA8HdS2
	 BTVTMmov1KYRGRUS4yNNNWQpmEQl9AMYOskbUzuUUOk8UhxlwBxTCqkCHbLugfJ10b
	 cjvjdyev9UqkQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Mar 2026 11:51:11 +0100
Subject: [PATCH v4 1/2] dt-bindings: mfd: wlf,arizona: Add irq-gpios
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-mfd-arizona-irq-v4-1-50c47ed0a18e@kernel.org>
References: <20260326-mfd-arizona-irq-v4-0-50c47ed0a18e@kernel.org>
In-Reply-To: <20260326-mfd-arizona-irq-v4-0-50c47ed0a18e@kernel.org>
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34202-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cirrus.com:email,microchip.com:email]
X-Rspamd-Queue-Id: 42CE73342F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Wolfson Microelectronics Arizona sometimes needs to poll the
GPIO line corresponding to the IRQ to counter bugs in the hardware
that appear on edge-triggered IRQs.

For this situation, provide the optional irq-gpios property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/mfd/wlf,arizona.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
index 7902f3c5d289..359e40b3dacb 100644
--- a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
+++ b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
@@ -194,6 +194,16 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  irq-gpios:
+    maxItems: 1
+    description:
+      A functional IRQ should be provided in the interrupts
+      property. This property enables edge triggered IRQ emulation
+      for hosts that don't support the codecs level triggered IRQ
+      output. The GPIO line corresponding to the IRQ will be polled
+      until all IRQs have been handled, ensuring an edge is generated
+      for the next IRQ.
+
   wlf,reset:
     description:
       GPIO specifier for the GPIO controlling RESET

-- 
2.53.0


